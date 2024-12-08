USE [<database_name>]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ALWAYS DROP AND CREATE STORED PROCEDURES - ALTERING THEM CAN CAUSE DIFFICULTIES WHEN DEPENDENT OBJECTS ARE BEING UPDATED / CREATED IN THE SAME BATCH.
-- CREATE ENSURES THAT THE PROCEDURE IS RE-COMPILED.

IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'<schema>.<procedure_name>') AND [type] IN ('P', 'PC'))
BEGIN 
	DROP PROCEDURE <schema>.<procedure_name>
	PRINT '########## <schema>.<procedure_name> dropped successfully ##########'
END
GO

-- Consider prefixing parameter names with p_ - makes them easy to spot in code.
CREATE PROCEDURE <dbo>.<procedure_name>
	<parameter...
	...
	parameter...>,
	@p_debug			bit = 0,	-- show debug statements
	@p_execute			bit = 1		-- commit the transaction - false for testing / debugging
AS
BEGIN

	SET NOCOUNT ON	-- suppress row count messages

	-- Variable declarations here

	BEGIN TRY

	-- non-updating preparatory code here

		BEGIN TRANSACTION

			-- Update code here
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

-- Standard catch block - do not modify.  ALWAYS check error status in calling code.
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
PRINT '########## <not_dbo_schema>.<procedure_name> created successfully ##########'
