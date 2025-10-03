USE Collections
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'COLLECTION.c_collection_item') AND [type] IN ('P', 'PC'))
BEGIN 
	DROP PROCEDURE COLLECTION.c_collection_item
	PRINT '########## COLLECTION.c_collection_item dropped successfully ##########'
END
GO

CREATE PROCEDURE COLLECTION.c_collection_item
	@p_input_json		CORE.json,
	@p_debug			bit = 0,
	@p_execute			bit = 1

AS
BEGIN

	SET NOCOUNT ON

	DECLARE @attrib_insert		CORE.item_list,
			@comment_insert		CORE.comment_list
	
	BEGIN TRY
	
		INSERT INTO @attrib_insert
		SELECT
			CASE WHEN c.parent_collection = '0' THEN NULL ELSE c.parent_collection END,
			i.item_key_value,
			a.attr_name ,
			a.attr_value
		FROM OPENJSON (@p_input_json)
		WITH
		(
			parent_collection		varchar(20),
			collection_attribute	CORE.json AS json,
			item 					CORE.json AS json
		) c
		CROSS APPLY OPENJSON (c.item)
		WITH
		(
			item_key_value	varchar(20),
			item_attribute	CORE.json AS json
		) i
		CROSS APPLY OPENJSON (i.item_attribute)
		WITH
		(
			attr_name	varchar(100),
			attr_value	varchar(MAX)
		) a

		INSERT INTO @comment_insert
		SELECT
			i.item_key_value,
			ic.comment
		FROM 
			OPENJSON (@p_input_json)
		WITH
		(
			parent_collection		varchar(20),
			collection_attribute	CORE.json AS json,
			item 					CORE.json AS json
		) c
		CROSS APPLY OPENJSON (c.item)
		WITH
		(
			item_key_value	varchar(20),
			item_comment	CORE.json AS json
		) i
		CROSS APPLY OPENJSON (i.item_comment)
		WITH
		(
			comment		varchar(255)
		) ic

		IF @p_debug = 1
		BEGIN
			SELECT 'COLLECTION.c_collection_item 1', i.* from @attrib_insert i
			SELECT 'Comment', c.* from @comment_insert c
		END

		EXEC CORE.c_collection_item @attrib_insert, @comment_insert, @p_debug, @p_execute

	END TRY

	BEGIN CATCH  
		DECLARE @error_message varchar(4000)
		DECLARE @error_severity int  
		DECLARE @error_state int
	
		-- IF @@TRANCOUNT != 0			-- Not required here but retain for completeness
		-- 	ROLLBACK TRANSACTION

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
PRINT '########## COLLECTION.c_collection_item created successfully ##########'
