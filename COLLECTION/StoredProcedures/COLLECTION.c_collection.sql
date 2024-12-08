USE Collections
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'COLLECTION.c_collection') AND [type] IN ('P', 'PC'))
BEGIN 
	DROP PROCEDURE COLLECTION.c_collection
	PRINT '########## COLLECTION.c_collection_item dropped successfully ##########'
END
GO

CREATE PROCEDURE COLLECTION.c_collection
	@p_input_json		CORE.json,
	@p_debug			bit = 0,
	@p_execute			bit = 1
AS
BEGIN

	SET NOCOUNT ON

	DECLARE	@insert		CORE.item_list,
			@name		varchar(20),
			@desc		varchar(50),
			@started	varchar(20),
			@keyed		char(1)

	SELECT 
		@name		= c.[name],
		@desc		= c.[description],
		@started	= c.[started],
		@keyed		= c.keyed
	FROM OPENJSON (@p_input_json)
	WITH
	(
		[name] varchar(20),
		[description] varchar(50),
		[started] varchar(20),
		keyed char(1)
	) c

	INSERT INTO @insert VALUES
	('X', 'X', 'NAME', @name),
	('X', 'X', 'DESCRIPTION', @desc),
	('X', 'X', 'STARTED', @started),
	('X', 'X', 'KEYED_COLLECTION', @keyed)

	BEGIN TRY
		
		IF @name IS NULL
			RAISERROR ('Collection name must be specified - operation failed.', 16, 1)

		IF @desc IS NULL
			RAISERROR ('Collection description must be specified - operation failed.', 16, 1)

		IF @started IS NULL
			RAISERROR ('Collection start date must be specified - operation failed.', 16, 1)

		IF @keyed IS NULL
			RAISERROR ('Collection keyed property must be specified - operation failed.', 16, 1)

		IF EXISTS (SELECT 1 FROM COLLECTION.v_base b WHERE [NAME] = @name)
			RAISERROR ('Collection %s already exists - operation failed.', 16, 1, @name)


		IF @p_debug = 1
		BEGIN
			SELECT 'COLLECTION.cu_collection_item 1', i.* from @insert i
		END

		EXEC CORE.c_collection @insert, @p_debug, @p_execute

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
PRINT '########## COLLECTION.c_collection created successfully ##########'
