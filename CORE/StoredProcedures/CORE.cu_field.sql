USE Collections
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'CORE.cu_field') AND [type] IN ('P', 'PC'))
BEGIN 
	DROP PROCEDURE CORE.cu_field
	PRINT '########## CORE.cu_field dropped successfully ##########'
END
GO

CREATE PROCEDURE CORE.cu_field
	@p_insert 			CORE.field_list READONLY ,
	@p_debug			bit = 0,
	@p_execute			bit = 1
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
			@p_insert i
			INNER JOIN COLLECTION.attribute_data_type dt
			ON i.attr_type_code = dt.type_code
		
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
PRINT '########## CORE.cu_field created successfully ##########'
