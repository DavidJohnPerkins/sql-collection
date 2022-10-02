USE Collections
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'COLLECTION.c_item_attribute_field_json') AND [type] IN ('P', 'PC'))
BEGIN 
	DROP PROCEDURE COLLECTION.c_item_attribute_field_json
	PRINT '########## COLLECTION.c_item_attribute_field_json dropped successfully ##########'
END
GO

CREATE PROCEDURE COLLECTION.c_item_attribute_field_json
	@p_input_json		CORE.json,
	@p_debug			bit = FALSE,
	@p_execute			bit = TRUE

AS
BEGIN

	SET NOCOUNT ON

	DECLARE @v_item_attr_name	CORE.item_attr_name,
			@v_type_code		char(1),
			@v_return_length	int

	BEGIN TRY

		SELECT
			@v_item_attr_name = c.item_attr_name,
			@v_type_code	  = c.type_code,
			@v_return_length  = c.return_length
		FROM OPENJSON (@p_input_json)
		WITH
		(
			item_attr_name	CORE.item_attr_name,
			type_code		char(1),
			return_length	int
		) c
	
	IF (@v_item_attr_name IS NULL OR
		@v_type_code IS NULL)
		RAISERROR ('Invalid JSON %s found - operation failed.', 16, 1, @p_input_json)

		EXEC CORE.c_item_attribute_field @v_item_attr_name, @v_type_code, @v_return_length, @p_debug, @p_execute

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
PRINT '########## COLLECTION.c_item_attribute_field_json created successfully ##########'
