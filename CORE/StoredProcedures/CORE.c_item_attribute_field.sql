USE Collections
GO

IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'CORE.c_item_attribute_field') AND [type] IN ('P', 'PC'))
BEGIN 
	DROP PROCEDURE CORE.c_item_attribute_field
	PRINT '---->>> CORE.c_item_attribute_field dropped successfully'
END
GO


CREATE PROCEDURE CORE.c_item_attribute_field (
	@p_item_attr_name		CORE.item_attr_name,
	@p_type_code			char(1),
	@p_return_length		int,
	@p_debug 				bit = FALSE,
	@p_execute 				bit = TRUE
)
AS
BEGIN

	SET NOCOUNT ON

	DECLARE 
		@v_item_attr_name	CORE.item_attr_name = UPPER(@p_item_attr_name),
		@v_type_code 		char(1) = UPPER(@p_type_code),
		@v_type_id 			int


	BEGIN TRY

		IF EXISTS (SELECT 1 FROM COLLECTION.item_attribute_field iaf WHERE iaf.item_attr_name = @v_item_attr_name)
			RAISERROR ('Item attribute %s already exists - operation failed.', 16, 1, @v_item_attr_name)

		IF NOT EXISTS (SELECT 1 FROM COLLECTION.attribute_data_type adt WHERE adt.type_code = @v_type_code)
			RAISERROR ('Attribute type code %s does not exist - operation failed.', 16, 1, @v_type_code)

		IF	(@p_return_length IS NULL OR @p_return_length = 0) AND 
			(SELECT adt.return_length_is_auto FROM COLLECTION.attribute_data_type adt WHERE adt.type_code = @v_type_code) = 0
			RAISERROR ('Non-zero return length must be specified for attribute type code %s - operation failed.', 16, 1, @v_type_code)

		IF	@p_return_length IS NOT NULL AND 
			(SELECT adt.return_length_is_auto FROM COLLECTION.attribute_data_type adt WHERE adt.type_code = @v_type_code) = 1
			RAISERROR ('Return length cannot be specified for attribute type code %s - operation failed.', 16, 1, @v_type_code)

		SET @v_type_id = (SELECT adt.type_id FROM COLLECTION.attribute_data_type adt WHERE adt.type_code = @v_type_code)

		BEGIN TRANSACTION

		INSERT INTO COLLECTION.item_attribute_field (item_attr_name, [type_id], return_length) 
		VALUES (
			@v_item_attr_name,
			@v_type_id,
			@p_return_length
		)

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
