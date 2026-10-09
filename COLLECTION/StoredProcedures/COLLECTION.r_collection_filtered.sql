USE Collections
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'COLLECTION.r_collection_filtered') AND [type] IN ('P', 'PC'))
BEGIN 
	DROP PROCEDURE COLLECTION.r_collection_filtered
	PRINT '########## COLLECTION.r_collection_filtered dropped successfully ##########'
END
GO

CREATE PROCEDURE COLLECTION.r_collection_filtered(
	@p_input_json		CORE.json,
	@p_debug			bit = 0,
	@p_execute			bit = 1
)
AS
BEGIN

	SET NOCOUNT ON

	BEGIN TRY

		DECLARE @v_collection_name  CORE.collection_name = (SELECT JSON_VALUE(@p_input_json, '$.collection_name'))
		DECLARE @v_collection_id int = (SELECT COLLECTION.collection_id(REPLACE(@v_collection_name, '_', ' '))),
				@sql_var CORE.sql_var = 'SELECT * FROM COLLECTION.v_base_~coll WHERE item_id IN (~list)';

		WITH w_searchlist AS (
			SELECT
				s.dimension,
				v.[value] AS search_value
			FROM OPENJSON(@p_input_json, '$.searches')
			WITH
			(
				dimension     VARCHAR(100) '$.dimension',
				search_values NVARCHAR(MAX) '$.search_values' AS JSON
			) s
			CROSS APPLY OPENJSON(s.search_values) v
		),
		w_keys AS (
			SELECT DISTINCT
				i.item_id
			FROM
				COLLECTION.item_attribute_field iaf 
				INNER JOIN COLLECTION.item_attribute ia 
					INNER JOIN COLLECTION.item i
					ON ia.item_id = i.item_id
				ON iaf.item_attr_id = ia.item_attr_id
				INNER JOIN w_searchlist sc
				ON sc.dimension = iaf.item_attr_name AND sc.search_value = ia.attr_value
			WHERE 
				i.item_parent = @v_collection_id
			GROUP BY
				i.item_id
			HAVING COUNT(DISTINCT sc.dimension) = (SELECT COUNT(DISTINCT dimension) from w_searchlist)
		)
		SELECT @sql_var = REPLACE(REPLACE(@sql_var, '~coll', @v_collection_name), '~list', (SELECT STRING_AGG(item_id, ',') FROM w_keys))

		IF @p_debug = 1
			PRINT @sql_var

		IF @p_execute = 1
			EXEC (@sql_var)

	END TRY

	BEGIN CATCH  
		DECLARE @error_message varchar(4000)
		DECLARE @error_severity int  
		DECLARE @error_state int
	
		-- IF @@TRANCOUNT != 0			-- Not required here but retain for completeness
		-- 	ROLLBACK TRANSACTION

		SELECT   
			@error_message = ERROR_MESSAGE(),  
			@error_severity = ERROR_SEVERITY(),  
			@error_state = ERROR_STATE();  

		RAISERROR (@error_message,
				@error_severity,
				@error_state
				)
	END CATCH

END
GO
PRINT '########## COLLECTION.r_collection_filtered created successfully ##########'



