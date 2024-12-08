USE Collections
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'CORE.ru_attribute') AND [type] IN ('P', 'PC'))
BEGIN 
	DROP PROCEDURE CORE.ru_attribute
	PRINT '########## CORE.ru_attribute dropped successfully ##########'
END
GO

CREATE PROCEDURE CORE.ru_attribute (
	@p_input_json		CORE.json,
	@p_debug			bit = 0,
	@p_execute 			bit = 1
)
AS
BEGIN 

	DECLARE @v_collection_name	CORE.collection_name,
			@v_item_key_value	CORE.item_key_value,
			@v_item_attr_name	CORE.item_attr_name,
			@v_new_value		CORE.item_attr_value

	BEGIN TRY

		SELECT
			@v_collection_name 	= c.collection_name,
			@v_item_key_value 	= c.item_key_value,
			@v_item_attr_name 	= c.item_attr_name,
			@v_new_value		= c.new_value
		FROM OPENJSON (@p_input_json)
		WITH
		(
			collection_name	CORE.collection_name,
			item_key_value	CORE.item_key_value,
			item_attr_name	CORE.item_attr_name,
			new_value		CORE.item_attr_value
		) c

		IF @p_debug = 1
		BEGIN
			SELECT
				@v_collection_name,
				@v_item_key_value,
				@v_item_attr_name,
				@v_new_value
		END

		IF (@v_collection_name IS NULL OR
			@v_item_key_value IS NULL OR
			@v_item_attr_name IS NULL OR
			@v_new_value IS NULL)
			RAISERROR ('Invalid JSON %s found - operation failed.', 16, 1, @p_input_json)

		IF NOT EXISTS (SELECT 1 FROM COLLECTION.v_base b WHERE b.[NAME] = @v_collection_name)
			RAISERROR ('Collection %s not found - operation failed.', 16, 1, @v_collection_name)

		IF NOT EXISTS (SELECT 1 FROM COLLECTION.v_attribute_list al WHERE al.collection_name = @v_collection_name AND al.key_value = @v_item_key_value)
			RAISERROR ('Key value %s not found in collection %s - operation failed.', 16, 1, @v_item_key_value, @v_collection_name)

		IF NOT EXISTS (SELECT 1 FROM COLLECTION.v_attribute_list al WHERE al.collection_name = @v_collection_name AND al.item_attr_name = 'KEY_VALUE')
			RAISERROR ('Key value %s not found for collection %s - operation failed.', 16, 1, @v_item_key_value, @v_collection_name)

		IF NOT EXISTS (
			SELECT 
				1 
			FROM 
				COLLECTION.v_attribute_list al 
			WHERE 
				al.collection_name = @v_collection_name AND 
				al.key_value = @v_item_key_value AND
				al.item_attr_name = @v_item_attr_name
			)
			RAISERROR ('Attribute %s not found for key value %s in collection %s - operation failed.', 16, 1, @v_item_attr_name, @v_item_key_value, @v_collection_name)

		BEGIN TRANSACTION

		IF @p_debug = 1
			SELECT 
				al.attr_id
			FROM 
				COLLECTION.v_attribute_list al 
			WHERE 
				al.collection_name = @v_collection_name AND 
				al.key_value = @v_item_key_value AND
				al.item_attr_name = @v_item_attr_name

		;WITH w_attr_id AS (
			SELECT 
				al.attr_id
			FROM 
				COLLECTION.v_attribute_list al 
			WHERE 
				al.collection_name = @v_collection_name AND 
				al.key_value = @v_item_key_value AND
				al.item_attr_name = @v_item_attr_name
		)
		UPDATE
			ia 
		SET 
			ia.attr_value = @v_new_value
		FROM
			COLLECTION.item_attribute ia 
			INNER JOIN w_attr_id w
			ON ia.attr_id = w.attr_id
			
		IF @p_execute = 1
		BEGIN
			COMMIT TRANSACTION
		END
		ELSE
		BEGIN
			ROLLBACK TRANSACTION
			PRINT 'Transaction rolled back - no changes made'
		END

	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION

	    DECLARE @ErrorMessage 	nvarchar(4000);  
	    DECLARE @ErrorSeverity	int;  
    	DECLARE @ErrorState		int;  
  
		SELECT   
			@ErrorMessage = ERROR_MESSAGE(),  
			@ErrorSeverity = ERROR_SEVERITY(),  
			@ErrorState = ERROR_STATE();  
  
	    RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)

	END CATCH
END
GO
PRINT '########## CORE.ru_attribute created successfully ##########'
