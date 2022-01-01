USE Collections
GO

--DELETE FROM COLLECTION.item_attribute
--DELETE FROM COLLECTION.item

DECLARE @insert COLLECTION.item_list

INSERT INTO @insert (parent_item, item_key, attr_name, attr_value) VALUES 
	--(NULL, 'OS LANDRANGER', 'NAME', 'OS LANDRANGER'),
	--(NULL, 'OS LANDRANGER', 'DESCRIPTION', 'ORDNANCE SURVEY LANDRANGER MAPS'),
	--(NULL, 'OS LANDRANGER', 'STARTED', '2020-07-01'),
	--(NULL, 'OS EXPLORER', 'NAME', 'OS EXPLORER'),
	--(NULL, 'OS EXPLORER', 'DESCRIPTION', 'ORDNANCE SURVEY EXPLORER MAPS'),
	--(NULL, 'OS EXPLORER', 'STARTED', '2020-07-01'),
	--('OS LANDRANGER', '2282015', 'MAP NUMBER', '228'),
	--('OS LANDRANGER', '2282015', 'MAP TITLE', 'March and Ely'),
	--('OS LANDRANGER', '2282015', 'PUBLISH DATE', '2015'),
	--('OS LANDRANGER', '2282015', 'MAIN SETTLEMENTS', 'March|Chatteris|Littleport|Ely|Denver'),
	--('OS LANDRANGER', '2262012', 'MAP NUMBER', '226'),
	--('OS LANDRANGER', '2262012', 'MAP TITLE', 'Ely and Newmarket'),
	--('OS LANDRANGER', '2262012', 'PUBLISH DATE', '2012'),
	--('OS LANDRANGER', '2262012', 'MAIN SETTLEMENTS', 'Ely|Soham|Newmarket|Mildenhall')
	--('OS LANDRANGER', '2272014', 'MAP NUMBER', '227'),
	--('OS LANDRANGER', '2272014', 'MAP TITLE', 'Peterborough'),
	--('OS LANDRANGER', '2272014', 'PUBLISH DATE', '2014'),
	--('OS LANDRANGER', '2272014', 'MAIN SETTLEMENTS', 'Peterborough|Whittlesey|Chatteris|March|Oundle')
	--('OS LANDRANGER', '2232010', 'MAP NUMBER', '223'),
	--('OS LANDRANGER', '2232010', 'MAP TITLE', 'Northampton and Market Harborough'),
	--('OS LANDRANGER', '2232010', 'PUBLISH DATE', '2014'),
	--('OS LANDRANGER', '2232010', 'MAIN SETTLEMENTS', 'Northampton|Market Harborough'),
	--('OS LANDRANGER', '2252013', 'MAP NUMBER', '225'),
	--('OS LANDRANGER', '2252013', 'MAP TITLE', 'Huntingdon and St Ives'),
	--('OS LANDRANGER', '2252013', 'PUBLISH DATE', '2013'),
	--('OS LANDRANGER', '2252013', 'MAIN SETTLEMENTS', 'Huntingdon|St Ives'),
	--('OS EXPLORER', '2612012', 'MAP NUMBER', '235'),
	--('OS EXPLORER', '2612012', 'MAP TITLE', 'Wisbech and Peterborough North'),
	--('OS EXPLORER', '2612012', 'PUBLISH DATE', '2011'),
	--('OS EXPLORER', '2612012', 'MAIN SETTLEMENTS', 'Wisbech|Market Deeping|Crowland|Peterborough') ,
	--('OS EXPLORER', '1432008', 'MAP NUMBER', '224'),
	--('OS EXPLORER', '1432008', 'MAP TITLE', 'Corby, Kettering and Wellingborough'),
	--('OS EXPLORER', '1432008', 'PUBLISH DATE', '2014'),
	--('OS EXPLORER', '1432008', 'MAIN SETTLEMENTS', 'Corby|Kettering|Wellingborough')
--('OS EXPLORER','2232014','223','Northampton and Market Harborough','2014')
--('OS EXPLORER','2242014','224','Corby, Kettering and Wellingborough','2014')
--('OS EXPLORER','2252013','225','Huntingdon and St Ives','2013')
--('OS EXPLORER','2262012','226','Ely and Newmarket','2012')
--('OS EXPLORER','2272014','227','Peterborough','2014')
--('OS EXPLORER','2282015','228','March and Ely','2015')
--('OS EXPLORER','2352011','235','Wisbech and Peterborough North','2011')
--('OS EXPLORER','2362011','236','King's Lynn, Downham Market and Swaffham','2011')
--('OS EXPLORER','2492014','249','Spalding and Holbeach','2014')
--('OS EXPLORER','2612012','261','Boston','2012')
--('OS LANDRANGER','1432008','143','Ely and Wisbech','2008')
EXEC COLLECTION.collection_create_add @insert


/*	DECLARE @item_id	int 

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
					a.attr_value = (SELECT TOP 1 i.parent_item FROM @insert i) AND
					af.item_attr_name = 'NAME'
			)

		END

		DECLARE @curr_ident int = (SELECT IDENT_CURRENT('COLLECTION.item'))
		select @item_id, @curr_ident

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

		select * FROM COLLECTION.item

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
select * from @keys

		RAISERROR (@error_message,
				@error_severity,
				@error_state
				)
	END CATCH*/
