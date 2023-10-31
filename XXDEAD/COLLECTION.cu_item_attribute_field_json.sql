USE Collections
GO

IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'COLLECTION.cu_item_attribute_field_json') AND [type] IN ('P', 'PC'))
BEGIN 
	DROP PROCEDURE COLLECTION.cu_item_attribute_field_json
	PRINT '---->>> COLLECTION.cu_item_attribute_field_json dropped successfully'
END
GO
/*
CREATE PROCEDURE COLLECTION.cu_item_attribute_field_json
	@p_input_json		CORE.json,
	@p_debug			bit = FALSE,
	@p_execute			bit = TRUE

AS
BEGIN

	SET NOCOUNT ON

	DECLARE @insert		CORE.field_list
	
	BEGIN TRY
	
		INSERT INTO @insert 
		SELECT
			f.field_name,
			f.attr_type_code,
			f.return_length
		FROM OPENJSON (@p_input_json)
		WITH
		(
			fields CORE.json AS json
		) r
		CROSS APPLY OPENJSON (r.fields)
		WITH
		(
			field_name 		varchar(255),
			attr_type_code	varchar(255),
			return_length	int
		) f

		IF @p_debug = 1
			SELECT * from @insert

		IF @p_execute = 1
			EXEC CORE.cu_item_attribute_field @insert

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
*/