USE Collections
GO

DROP PROCEDURE IF EXISTS COLLECTION.d_collection_item_json
GO

CREATE PROCEDURE COLLECTION.d_collection_item_json
	@p_input_json		CORE.json,
	@p_debug			bit = 0,
	@p_execute			bit = 1

AS
BEGIN

	SET NOCOUNT ON

	DECLARE @v_collection_name	CORE.item_attr_name,
			@v_item_key_value	CORE.item_attr_value

	BEGIN TRY

		SELECT
			@v_collection_name 	= c.collection_name,
			@v_item_key_value 	= c.item_key_value
		FROM OPENJSON (@p_input_json)
		WITH
		(
			collection_name	CORE.item_attr_name,
			item_key_value	CORE.item_attr_value
		) c
	
	IF (@v_collection_name IS NULL OR
		@v_item_key_value IS NULL)
		RAISERROR ('Invalid JSON %s found - operation failed.', 16, 1, @p_input_json)

		EXEC CORE.d_collection_item @v_collection_name, @v_item_key_value, @p_debug, @p_execute

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
