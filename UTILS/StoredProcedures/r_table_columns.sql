USE Collections
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

DROP PROCEDURE IF EXISTS UTILS.r_table_columns
GO

CREATE PROCEDURE UTILS.r_table_columns (
	@table_name 	varchar(255),
	@schema_name	varchar(255)
)
AS

BEGIN
	BEGIN TRY

		IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS c WHERE c.TABLE_NAME = @table_name AND c.TABLE_SCHEMA = @schema_name)
			RAISERROR('Table %s in schema %s does not exist', 16, 1, @table_name, @schema_name)

		ELSE

			SELECT
				c.COLUMN_NAME
			FROM 
				INFORMATION_SCHEMA.COLUMNS c
			WHERE 
				c.TABLE_NAME = @table_name AND 
				c.TABLE_SCHEMA = @schema_name

	END TRY

	BEGIN CATCH  
		DECLARE @error_message	varchar(4000)
		DECLARE @error_severity int  
		DECLARE @error_state	int
	
		-- IF @@TRANCOUNT != 0			-- Not required here but retain for completeness
		-- 	ROLLBACK TRANSACTION

		SELECT   
			@error_message = ERROR_MESSAGE(),  
			@error_severity = ERROR_SEVERITY(),  
			@error_state = ERROR_STATE()

		RAISERROR (@error_message, @error_severity, @error_state)
	END CATCH
END
