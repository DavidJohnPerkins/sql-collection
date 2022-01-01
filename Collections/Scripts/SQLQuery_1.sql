
	SELECT 
		'(''OS EXPLORER'')'
	FROM (
		SELECT 
			i.item_id ,
			ia.attr_value ,
			af.item_attr_name 
		FROM
			COLLECTION.item_attribute_field af
			INNER JOIN COLLECTION.item_attribute ia
				INNER JOIN COLLECTION.item i
				ON ia.item_id = i.item_id
			ON af.item_attr_id = ia.item_attr_id
		WHERE
			i.item_parent = COLLECTION.collection_id('OS EXPLORER')
		) st
		PIVOT
		(
			MAX(st.attr_value)
			FOR st.item_attr_name IN (
				[MAP NUMBER] ,
		[MAP TITLE] ,
		[PUBLISH DATE] ,
		[MAIN SETTLEMENTS]
			)
		) AS pt
	ORDER BY
		[MAP NUMBER]