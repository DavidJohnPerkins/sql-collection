USE Collections
GO

DROP PROCEDURE IF EXISTS COLLECTION.cu_collection_json
GO

CREATE PROCEDURE COLLECTION.cu_collection_json
	-- @p_collection_name	varchar(255),
	@p_input_json		nvarchar(MAX),
	@p_debug			bit = FALSE
AS
BEGIN

	SET NOCOUNT ON

	DECLARE @insert		COLLECTION.item_list
	
	BEGIN TRY
	
		INSERT INTO @insert 
		SELECT
			CASE WHEN c.parent_collection = '0' THEN NULL ELSE c.parent_collection END,
			c.parent_item_key,
			ca.attr_name ,
			ca.attr_value
		FROM OPENJSON (@p_input_json)
		WITH
		(
			parent_collection varchar(255),
			parent_item_key varchar(255),
			parent_item_attribute nvarchar(MAX) AS json
		) c
		CROSS APPLY OPENJSON (c.parent_item_attribute)
		WITH
		(
			attr_name varchar(100),
			attr_value varchar(100)
		) ca

		UNION ALL 

		SELECT
			c.parent_collection,
			i.item_key,
			a.attr_name ,
			a.attr_value
		FROM OPENJSON (@p_input_json)
		WITH
		(
			parent_collection varchar(255),
			collection_attribute nvarchar(MAX) AS json,
			item nvarchar(MAX) AS json
		) c
		CROSS APPLY OPENJSON (c.item)
		WITH
		(
			item_key varchar(100),
			item_attribute nvarchar(MAX) AS json
		) i
		CROSS APPLY OPENJSON (i.item_attribute)
		WITH
		(
			attr_name varchar(100),
			attr_value varchar(MAX)
		) a

		IF @p_debug = 1
			SELECT * from @insert

		EXEC CORE.cu_collection @insert

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
