USE Collections
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'COLLECTION.u_item_attribute') AND [type] IN ('P', 'PC'))
BEGIN 
	DROP PROCEDURE COLLECTION.u_item_attribute
	PRINT '########## COLLECTION.u_item_attribute dropped successfully ##########'
END
GO

CREATE PROCEDURE COLLECTION.u_item_attribute
	@p_input_json		CORE.json,
	@p_debug			bit = FALSE,
	@p_execute			bit = TRUE
AS
BEGIN

	SET NOCOUNT ON

	DECLARE @v_item_attr_name	CORE.item_attr_name,
			@v_collection_name	varchar(20),
			@v_key_value		varchar(255),
			@v_new_value		varchar(255),
			@v_attr_id			int

	BEGIN TRY

		SELECT
			@v_item_attr_name	= c.item_attr_name,
			@v_collection_name	= c.collection_name,
			@v_key_value		= c.key_value,
			@v_new_value		= c.new_value
		FROM OPENJSON (@p_input_json)
		WITH
		(
			item_attr_name		CORE.item_attr_name,
			collection_name		varchar(20),
			key_value			varchar(255),
			new_value			varchar(255)
		) c

		IF (@v_item_attr_name IS NULL OR
			@v_collection_name IS NULL OR
			@v_key_value IS NULL)
			RAISERROR ('Invalid JSON %s found - operation failed.', 16, 1, @p_input_json)

	
		SELECT
			@v_attr_id = al.attr_id
		FROM 
			COLLECTION.v_attribute_list al
		WHERE
			al.collection_name = @v_collection_name AND
			al.item_attr_name = @v_item_attr_name AND
			al.key_value = @v_key_value

		IF @v_attr_id IS NULL
			RAISERROR ('Attribute %s for key_value %s in collection %s does not exist - operation failed.', 16, 1, @v_item_attr_name, @v_key_value, @v_collection_name)

		IF @p_execute = 1
		BEGIN

			BEGIN TRANSACTION

			UPDATE
				ia
			SET
				ia.attr_value = @v_new_value
			FROM
				COLLECTION.item_attribute ia
			WHERE
				ia.attr_id = @v_attr_id

			COMMIT TRANSACTION
		END
		
	END TRY

	BEGIN CATCH  
		DECLARE @error_message varchar(4000)
		DECLARE @error_severity int  
		DECLARE @error_state int
	
		IF @@TRANCOUNT != 0			-- Not required here but retain for completeness
		ROLLBACK TRANSACTION

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
PRINT '########## COLLECTION.u_item_attribute created successfully ##########'
