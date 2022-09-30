USE Collections
GO

DROP PROCEDURE IF EXISTS CORE.cu_item_attribute_field
GO
PRINT '---->>> CORE.cu_item_attribute_field dropped successfully'

/*
CREATE PROCEDURE CORE.cu_item_attribute_field
	@insert 			CORE.field_list READONLY ,
	@collection_name	varchar(255) = NULL
AS
BEGIN

	SET NOCOUNT ON

	DECLARE @item_id	int 

	BEGIN TRY

		BEGIN TRANSACTION

		INSERT INTO COLLECTION.item_attribute_field (item_attr_name, type_id, return_length)
		SELECT
			i.attr_name,
			dt.type_id,
			i.return_length
		FROM 
			@insert i
			INNER JOIN COLLECTION.attribute_data_type dt
			ON i.attr_type_code = dt.type_code
		COMMIT TRANSACTION

	END TRY

	BEGIN CATCH  
		DECLARE @error_message varchar(4000)
		DECLARE @error_severity int  
		DECLARE @error_state int
	
		IF @@TRANCOUNT != 0
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
PRINT '---->>> CORE.cu_item_attribute_field created successfully'
*/
