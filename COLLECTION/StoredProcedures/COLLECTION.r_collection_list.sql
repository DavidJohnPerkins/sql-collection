USE Collections
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'COLLECTION.r_collection_list') AND [type] IN ('P', 'PC'))
BEGIN 
	DROP PROCEDURE COLLECTION.r_collection_list
	PRINT '########## COLLECTION.r_collection_list dropped successfully ##########'
END
GO

CREATE PROCEDURE COLLECTION.r_collection_list(
	@p_input_json		CORE.json,
	@p_debug			bit = 0,
	@p_execute			bit = 1
)
AS
BEGIN

	SET NOCOUNT ON

	DECLARE @v_collection_view	CORE.sql_var,
			@v_order_column		CORE.sql_var,
			@sql 				varchar(MAX)

	BEGIN TRY

		SELECT
			@v_collection_view 	= c.collection_view,
			@v_order_column		= c.order_column
		FROM OPENJSON (@p_input_json)
		WITH
		(
			collection_view	CORE.sql_var,
			order_column	CORE.sql_var
		) c
	

	SET @sql = 'SELECT c.* FROM COLLECTION.v_base_~coll_view c ORDER BY c.[~order_col]'

	SET @sql = REPLACE(@sql, '~coll_view', @v_collection_view)
	SET @sql = REPLACE(@sql, '~order_col', @v_order_column)

	IF @p_debug = 1
		PRINT @sql

	IF @p_execute = 1
		EXEC (@sql)

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
PRINT '########## COLLECTION.r_collection_list created successfully ##########'