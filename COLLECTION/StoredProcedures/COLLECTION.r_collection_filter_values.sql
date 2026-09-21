USE Collections
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'COLLECTION.r_collection_filter_values') AND [type] IN ('P', 'PC'))
BEGIN 
	DROP PROCEDURE COLLECTION.r_collection_filter_values
	PRINT '########## COLLECTION.r_collection_filter_values dropped successfully ##########'
END
GO

CREATE PROCEDURE COLLECTION.r_collection_filter_values(
	@p_input_json		CORE.json,
	@p_debug			bit = 0,
	@p_execute			bit = 1
)
AS
BEGIN

	SET NOCOUNT ON

	DECLARE @v_collection_name	CORE.sql_var,
			@v_dimension_col	CORE.sql_var

	BEGIN TRY

		SELECT
			@v_collection_name 	= c.collection_name,
			@v_dimension_col 	= c.dimension_col
		FROM OPENJSON (@p_input_json)
		WITH
		(
			collection_name	CORE.sql_var,
			dimension_col	CORE.sql_var
		) c
		
		IF @v_collection_name IS NULL
			RAISERROR ('Collection name must be specified - operation failed.', 16, 1)
			
		IF @v_dimension_col IS NULL
			RAISERROR ('Dimension column must be specified - operation failed.', 16, 1)
			
		IF NOT EXISTS (SELECT 1 FROM COLLECTION.v_base b WHERE b.NAME = @v_collection_name)
			RAISERROR ('Collection %s does not exist - operation failed.', 16, 1, @v_collection_name)

		IF NOT EXISTS (SELECT 1 FROM COLLECTION.child_column_list_base(@v_collection_name) cl WHERE cl.item_attr_name = @v_dimension_col AND cl.is_dimension = 1)
			RAISERROR ('Column %s in collection %s is not a dimension - operation failed.', 16, 1, @v_dimension_col, @v_collection_name)

		SELECT DISTINCT
			--cl.item_attr_name,
			ia.attr_value
		FROM
			COLLECTION.item_attribute ia
			INNER JOIN COLLECTION.child_column_list_base(@v_collection_name) cl
			ON ia.item_attr_id = cl.item_attr_id
		WHERE
			cl.item_attr_name = @v_dimension_col
			--cl.is_dimension = 1
		ORDER BY
			--cl.item_attr_name,
			ia.attr_value

	END TRY

	BEGIN CATCH  
		DECLARE @error_message varchar(4000)
		DECLARE @error_severity int  
		DECLARE @error_state int
	
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
PRINT '########## COLLECTION.r_collection_filter_values created successfully ##########'
