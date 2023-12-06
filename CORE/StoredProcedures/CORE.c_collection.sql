USE Collections
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'CORE.c_collection') AND [type] IN ('P', 'PC'))
BEGIN 
	DROP PROCEDURE CORE.c_collection
	PRINT '########## CORE.c_collection_item dropped successfully ##########'
END
GO

CREATE PROCEDURE CORE.c_collection
	@p_insert 			CORE.item_list READONLY ,
	@p_debug			bit = 0,
	@p_execute			bit = 1
AS
BEGIN

	SET NOCOUNT ON

	DECLARE @parent_id	int

	BEGIN TRY
		
		BEGIN TRANSACTION

		INSERT INTO COLLECTION.item (item_parent, create_date, create_user)
		SELECT DISTINCT
			0, 
			GETDATE(), 
			SYSTEM_USER

		SET @parent_id = @@IDENTITY

		INSERT INTO COLLECTION.item_attribute (item_id, item_attr_id, attr_value)
		SELECT DISTINCT
			@parent_id,
			af.item_attr_id,
			i.attr_value
		FROM 
			@p_insert i
			INNER JOIN COLLECTION.item_attribute_field af
			ON i.attr_name = af.item_attr_name
		
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
PRINT '########## CORE.c_collection created successfully ##########'
