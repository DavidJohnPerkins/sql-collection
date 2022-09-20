USE Collections
GO

DROP PROCEDURE IF EXISTS CORE.cu_collection_item
GO

CREATE PROCEDURE CORE.cu_collection_item
	@p_insert 			CORE.item_list READONLY ,
	@p_debug			bit = 0,
	@p_execute			bit = 1
AS
BEGIN

	SET NOCOUNT ON

	DECLARE @parent_coll_id		int,
			@parent_coll_name	varchar(50),
			@parent_id 			int,
			@keyed_coll			bit = 0;

	DECLARE @keys TABLE (
		item_key		varchar(20),
		item_attr_id	int
	)

	BEGIN TRY

		IF (SELECT COUNT(DISTINCT parent_item) FROM @p_insert) != 1
    		RAISERROR ('Multiple parent items found in input data - operation failed.', 16, 1)
			
		SET @parent_coll_name = (SELECT TOP 1 parent_item FROM @p_insert)
		SET @parent_coll_id = ISNULL(COLLECTION.collection_id(@parent_coll_name), 0)

		IF (SELECT COUNT(1) FROM @p_insert) / (SELECT COUNT(DISTINCT i.attr_name) FROM @p_insert i) != 2
			RAISERROR ('JSON has ragged attributes - operation failed.', 16, 1)
		
		IF (SELECT b.KEYED_COLLECTION FROM COLLECTION.base b WHERE [NAME] = @parent_coll_name) = 'Y'
			SET @keyed_coll = 1

		IF @keyed_coll = 0 AND EXISTS (SELECT 1 FROM @p_insert i WHERE i.attr_name = 'KEY_VALUE')
			RAISERROR ('KEY_VALUE attributes found for non-keyed collection - operation failed.', 16, 1)

		IF @keyed_coll = 1 
		BEGIN 

			IF NOT EXISTS (SELECT 1 FROM @p_insert i WHERE i.attr_name = 'KEY_VALUE')
				RAISERROR ('KEY_VALUE attributes missing for keyed collection - operation failed.', 16, 1)

			INSERT INTO @keys
			SELECT
				i.attr_value,
				iaf.item_attr_id
			FROM
				@p_insert i
				INNER JOIN COLLECTION.item_attribute_field iaf 
				ON i.attr_name = iaf.item_attr_name
			WHERE 
				i.attr_name = 'KEY_VALUE'

			IF EXISTS (
				SELECT
					k.item_key,
					COUNT(1)
				FROM 
					@keys k
				GROUP BY 
					k.item_key
				HAVING 
					COUNT(1) > 1)
				RAISERROR ('Duplicate key values found in input data - operation failed.', 16, 1)

			IF EXISTS (
				SELECT
					1 
				FROM
					COLLECTION.item_attribute ia
					INNER JOIN @keys k
					ON ia.item_attr_id = k.item_attr_id AND ia.attr_value = k.item_key)
				RAISERROR ('Key values found in input data that already exist - operation failed.', 16, 1)
		END

		BEGIN TRANSACTION

		IF @parent_coll_id = 0	-- NEW COLLECTION
		BEGIN
		
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
			WHERE
				i.parent_item IS NULL
		END

/*
		DECLARE @curr_ident int = (SELECT IDENT_CURRENT('COLLECTION.item'))

		;WITH w_key AS 
		(
			SELECT DISTINCT 
				i.item_key
			FROM
				@p_insert i 
			WHERE 
				i.parent_item IS NOT NULL		
		)
		INSERT INTO @keys
		SELECT DISTINCT 
			w.item_key ,
			(ROW_NUMBER() OVER (ORDER BY w.item_key)) + @curr_ident
		FROM
			w_key w

		IF @p_debug = 1
			SELECT 'CORE.cu_collection_item 1:', k.* FROM @keys k

		INSERT INTO COLLECTION.item (item_parent)
		SELECT
			@parent_id 	
		FROM 
			@keys k

		INSERT INTO COLLECTION.item_attribute (item_id, item_attr_id, attr_value)
		SELECT
			k.item_ident,
			af.item_attr_id,
			i.attr_value
		FROM 
			@p_insert i
			INNER JOIN @keys k
			ON i.item_key = k.item_key
			INNER JOIN COLLECTION.item_attribute_field af
			ON i.attr_name = af.item_attr_name
		WHERE
			i.parent_item IS NOT NULL			

		IF @p_execute = 1
		BEGIN
			COMMIT TRANSACTION
		END
		ELSE
		BEGIN
			ROLLBACK TRANSACTION
			PRINT 'Transaction rolled back - no changes made'
		END
*/
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