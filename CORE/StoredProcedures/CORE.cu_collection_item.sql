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

	DECLARE @parent_id int 

	DECLARE @keys TABLE (
		item_key	varchar(255),
		item_ident	int
	)
	BEGIN TRY

		BEGIN TRANSACTION

		IF EXISTS (SELECT 1 FROM @p_insert i WHERE i.parent_item IS NULL)
		BEGIN
		
			INSERT INTO COLLECTION.item (item_parent, create_date, create_user)
			SELECT DISTINCT
				0, 
				GETDATE(), 
				SYSTEM_USER

			SET @parent_id = @@IDENTITY

			INSERT INTO COLLECTION.item_attribute (item_id, item_attr_id, attr_value)
			SELECT DISTINCT
				@parent_id 		,
				af.item_attr_id,
				i.attr_value
			FROM 
				@p_insert i
				INNER JOIN COLLECTION.item_attribute_field af
				ON i.attr_name = af.item_attr_name
			WHERE
				i.parent_item IS NULL
		END
		ELSE
		BEGIN

			SET @parent_id = (
				SELECT
					a.item_id 
				FROM 
					COLLECTION.item_attribute a
				WHERE
					a.attr_value = (SELECT TOP 1 i.parent_item FROM @p_insert i)
			)
		
			IF @p_debug = 1
			 	SELECT 'CORE.cu_collection_item 1:', @parent_id 		 

		END

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