USE Collections
GO

DROP PROCEDURE IF EXISTS CORE.cu_collection
GO

CREATE PROCEDURE CORE.cu_collection
	@insert 			COLLECTION.item_list READONLY ,
	@collection_name	varchar(255) = NULL
AS
BEGIN

	SET NOCOUNT ON

	DECLARE @item_id	int 

	DECLARE @keys TABLE (
		item_key	varchar(255),
		item_ident	int
	)
	BEGIN TRY

		BEGIN TRANSACTION

		IF EXISTS (SELECT 1 FROM @insert i WHERE i.parent_item IS NULL)
		BEGIN
		
			INSERT INTO COLLECTION.item (item_parent, create_date, create_user)
			SELECT DISTINCT
				0, 
				GETDATE(), 
				SYSTEM_USER

			SET @item_id = @@IDENTITY

			INSERT INTO COLLECTION.item_attribute (item_id, item_attr_id, attr_value)
			SELECT DISTINCT
				@item_id,
				af.item_attr_id,
				i.attr_value
			FROM 
				@insert i
				INNER JOIN COLLECTION.item_attribute_field af
				ON i.attr_name = af.item_attr_name
			WHERE
				i.parent_item IS NULL
		END
		ELSE
		BEGIN

			SET @item_id = (
				SELECT
					a.item_id 
				FROM 
					COLLECTION.item_attribute a
					INNER JOIN COLLECTION.item_attribute_field af
					ON a.item_attr_id = af.item_attr_id
				WHERE
					a.attr_value = (SELECT TOP 1 i.parent_item FROM @insert i) /*AND
					af.item_attr_name = @collection_name*/
			)
		
			PRINT @item_id

		END

		DECLARE @curr_ident int = (SELECT IDENT_CURRENT('COLLECTION.item'))

		;WITH w_key AS 
		(
			SELECT DISTINCT 
				i.item_key
			FROM
				@insert i 
			WHERE 
				i.parent_item IS NOT NULL		
		)
		INSERT INTO @keys
		SELECT DISTINCT 
			w.item_key ,
			(ROW_NUMBER() OVER (ORDER BY w.item_key)) + @curr_ident
		FROM
			w_key w

		INSERT INTO COLLECTION.item (item_parent)
		SELECT
			@item_id
		FROM 
			@keys k

		INSERT INTO COLLECTION.item_attribute (item_id, item_attr_id, attr_value)
		SELECT
			k.item_ident,
			af.item_attr_id,
			i.attr_value
		FROM 
			@insert i
			INNER JOIN @keys k
			ON i.item_key = k.item_key
			INNER JOIN COLLECTION.item_attribute_field af
			ON i.attr_name = af.item_attr_name
		WHERE
			i.parent_item IS NOT NULL			

		COMMIT TRANSACTION

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