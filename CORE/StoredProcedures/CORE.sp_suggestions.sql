USE [<database_name>]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ALWAYS DROP AND CREATE STORED PROCEDURES - ALTERING THEM CAN CAUSE DIFFICULTIES WHEN DEPENDENT OBJECTS ARE BEING UPDATED / CREATED IN THE SAME BATCH.
-- CREATE ENSURES THAT THE PROCEDURE RE-COMPILED.

IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'<not_dbo_schema>.<procedure_name>') AND [type] IN ('P', 'PC'))
BEGIN 
	DROP PROCEDURE <not_dbo_schema>.<procedure_name>
	PRINT '########## <not_dbo_schema>.<procedure_name> dropped successfully ##########'	-- These messages make tracking builds easy - not just for show.
END
GO

/*
	Keywords in uppercase eg. SELECT / DECLARE / SET etc.
	Variables in lowercase with underscore word separator eg. @this_is_a_variable.  Don't go Tolstoy on my ass though.
	Data types in lowercase eg. int / varchar etc.
	Space after comma and either side of operators eg. WHERE @var1 = @var2
*/

-- Consider prefixing parameter names with p_ - makes them easy to spot in code.
CREATE PROCEDURE <not_dbo_schema>.<procedure_name>
	<parameter...
	...
	parameter...>,
	@p_debug			bit = 0,	-- see below for explanation
	@p_execute			bit = 1		-- ditto
AS
BEGIN

	SET NOCOUNT ON	-- suppress annoying row count messages that the caller doesn't care about

-- Tidy declarations
	DECLARE @var1			int,
			@long_var_name	varchar(50),
			@bool_var		bit = 0;

-- Understand the differences between table variables and temporary tables.
	DECLARE @table_var TABLE (
		col1	varchar(20),
		col2	int
	)

-- Understand the difference between #temp (local) and ##temp (global) temporary tables, particularly around destruction.
-- If you find yourself needing ## tables then you're probably heading down a bad path - they're messy.  Consider refactoring.
	CREATE TABLE #temp_table (
		col1	varchar(10)
	)

-- Always work within TRY / CATCH - something WILL go wrong at some point.
	BEGIN TRY

		IF (SELECT COUNT(1) FROM NOTDBOSCHEMA.table1) != 1	-- Never use COUNT(*) - throws a table scan.
    		RAISERROR ('Descriptive error message - operation failed.', 16, 1)	-- Change severity level as needed but be sensible. If something goes wrong throw an error and get out.
																				-- The database isn't the right place for error logic.

-- Maintain indentation - don't be afraid to use lines - makes code review much easier
		IF @var = 1 
		BEGIN 

			IF NOT EXISTS (SELECT 1 FROM @p_insert i WHERE i.attr_name = 'KEY_VALUE')
				RAISERROR ('Descriptive error message - operation failed.', 16, 1)	-- Don't be afraid to complain - make the caller do the error handling work.

			INSERT INTO @table_var
			SELECT DISTINCT 
				i.col1,
				j.col2
			FROM
				NOTDBOSCHEMA.table1	i	-- get your rubbish out of dbo schema - that schema will be privileged if the DBA is up to snuff and things will fail.
				INNER JOIN COULDBEANOTHERSCHEMA.table2 j	-- ALWAYS alias tables - try to use the same aliases in all queries and procedures - consistency is gold.
				ON i.joincol = j.joincol					-- DON'T use meaningless aliases like i and j for physical tables.
			WHERE 
				i.col3 = 'KEY_VALUE'

		END

-- Only begin a transaction when you're about to update - NEVER update without a transaction!  Don't open the transaction early - will lock resources and kill performance.
		BEGIN TRANSACTION

		INSERT INTO NOTDBOSCHEMA.table1 (col1, create_date, create_user)		-- note space after commas. 
		SELECT DISTINCT		-- don't use DISTINCT where you know you have uniqueness - performance drag.
			0, 
			GETDATE(), 		-- ALL tables should have update time / user with default values
			SYSTEM_USER

-- One way to manage parent child inserts - also learn about OUTPUT clause for updates - essential knowledge.
		SET @parent_id = @@IDENTITY		-- get to grips with @@variables - very useful

		INSERT INTO NOTDBOSCHEMA.table_with_foreign_key_to_table1_above(fk_value)
		SELECT DISTINCT
			@parent_id
		END

		DECLARE @curr_ident int = (SELECT IDENT_CURRENT('COLLECTION.item'))		-- get to grips with system functions

-- Use debug to check update results on the fly - they may be scrapped below if not executing.
		IF @p_debug = 1
			SELECT * FROM NOTDBOSCHEMA.table_with_foreign_key_to_table1_above

-- CTEs are single-use only - if you refer to a CTE more than once in succeeding code then create a temp table instead. Remember that 
-- the CTE is re-evaluated every time it is used.  They aren't a magic bullet by any means and can kill performance.
		;WITH w_cte AS 	-- I like to prefix CTEs with w_ for clarity.
		(
			SELECT 
				a.col1
			FROM
				@table_var a
		)
		INSERT INTO @insert_table
		SELECT DISTINCT 
			w.col1 ,
			(ROW_NUMBER() OVER (ORDER BY ...)) 	-- window functions are tricky at first but brilliant for aggregation and other funky shit.  Learn them.
		FROM
			w_cte w

-- Display any variables you need to check for testing debugging.
		IF @p_debug = 1
		BEGIN
			PRINT 'Message with variable value'
			PRINT 'Message with variable value'
			PRINT 'Message with variable value'
		END

-- You now have the option to exit without making changes - useful when simply testing above logic.
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
