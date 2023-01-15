USE Collections
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'COLLECTION.r_OS_EXPLORER') AND [type] IN ('P', 'PC'))
BEGIN 
	DROP PROCEDURE COLLECTION.r_OS_EXPLORER
	PRINT '########## COLLECTION.r_OS_EXPLORER dropped successfully ##########'
END
GO

CREATE PROCEDURE COLLECTION.r_OS_EXPLORER (
	@p_input_json		nvarchar(max),
	@p_debug			bit = 0,
	@p_execute			bit = 1
)
AS
BEGIN 

	DECLARE @v_item_id	int

	BEGIN TRY
		
		SELECT
			@v_item_id	= c.item_id
		FROM OPENJSON (@p_input_json)
		WITH
		(
			item_id	int
		) c

		IF @v_item_id = -1
		BEGIN
			SELECT 
				v.item_id,
				v.key_value,
				v.map_number,
				v.map_title,
				v.main_settlements,
				v.publish_date,
				v.map_image
			FROM 
				COLLECTION.v_base_OS_EXPLORER v
		END
		ELSE
		BEGIN
			IF NOT EXISTS (SELECT 1 FROM COLLECTION.v_base_OS_EXPLORER v WHERE v.item_id = @v_item_id)
				RAISERROR ('An item with item_id %d could not be found.', 16, 1, @v_item_id)

			SELECT 
				v.item_id,
				v.key_value,
				v.map_number,
				v.map_title,
				v.main_settlements,
				v.publish_date,
				v.map_image
			FROM 
				COLLECTION.v_base_OS_EXPLORER v
			WHERE 
				v.item_id = @v_item_id
		END

		IF @p_debug = 1
			PRINT 'READS COMPLETE'

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
PRINT '########## COLLECTION.r_OS_EXPLORER created successfully ##########'
