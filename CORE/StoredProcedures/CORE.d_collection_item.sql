USE Collections
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'CORE.d_collection_item') AND [type] IN ('P', 'PC'))
BEGIN 
	DROP PROCEDURE CORE.d_collection_item
	PRINT '########## CORE.d_collection_item dropped successfully ##########'
END
GO

CREATE PROCEDURE CORE.d_collection_item (
	@p_collection_name	CORE.item_attr_name,
	@p_item_key_value	CORE.item_attr_value,	
	@p_debug			bit = 0,
	@p_execute 			bit = 1
)
AS
BEGIN 

	SET NOCOUNT ON;

	IF NOT EXISTS (SELECT 1 FROM COLLECTION.base b WHERE b.[NAME] = @p_collection_name)
		RAISERROR ('Collection %s not found - operation failed.', 16, 1, @p_collection_name)

	IF NOT EXISTS (SELECT 1 FROM COLLECTION.attribute_list al WHERE al.collection_name = @p_collection_name AND al.key_value = @p_item_key_value)
		RAISERROR ('Key value %s not found in collection %s - operation failed.', 16, 1, @p_item_key_value, @p_collection_name)

	IF NOT EXISTS (SELECT 1 FROM COLLECTION.attribute_list al WHERE al.collection_name = @p_collection_name AND al.item_attr_name = 'KEY_VALUE')
		RAISERROR ('Key value %s not found for collection %s - operation failed.', 16, 1, @p_item_key_value, @p_collection_name)

	BEGIN TRY
		BEGIN TRANSACTION

		;WITH w_item_id AS (
			SELECT DISTINCT 
				al.item_id
			FROM 
				COLLECTION.attribute_list al 
			WHERE 
				al.collection_name = @p_collection_name AND 
				al.key_value = @p_item_key_value
		)
		DELETE
			i
		FROM
			COLLECTION.item i
			INNER JOIN w_item_id w
			ON i.item_id = w.item_id
			
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
PRINT '########## CORE.d_collection_item created successfully ##########'
