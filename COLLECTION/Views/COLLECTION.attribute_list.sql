USE Collections
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

DROP VIEW IF EXISTS COLLECTION.attribute_list
GO

CREATE VIEW COLLECTION.attribute_list AS

	WITH w_parent AS (
		SELECT
			i1.item_id,
			ia1.attr_value AS collection_name
		FROM 
			COLLECTION.item i1 
			INNER JOIN COLLECTION.item_attribute ia1 
				INNER JOIN COLLECTION.item_attribute_field iaf1
				ON ia1.item_attr_id = iaf1.item_attr_id
			ON i1.item_id = ia1.item_id
		WHERE 
			i1.item_parent = 0 AND 
			iaf1.item_attr_name = 'NAME'
	),
	w_key_list AS (
		SELECT DISTINCT
			i2.item_id,
			p.collection_name,
			ia2.attr_value AS key_value,
			iaf2.item_attr_name
		FROM
			COLLECTION.item i2
		INNER JOIN w_parent p 
		ON i2.item_parent = p.item_id
			INNER JOIN COLLECTION.item_attribute ia2
				INNER JOIN COLLECTION.item_attribute_field iaf2
				ON ia2.item_attr_id = iaf2.item_attr_id
			ON i2.item_id = ia2.item_id
		WHERE
			iaf2.item_attr_name = 'KEY_VALUE'
	)
	SELECT DISTINCT
		i.item_id,
		kl.collection_name,
		kl.key_value,
		iaf.item_attr_name,
		ia.attr_id,
		ia.attr_value
	FROM 
		COLLECTION.item i
		INNER JOIN w_key_list kl
		ON i.item_id = kl.item_id
		INNER JOIN COLLECTION.item_attribute ia
			INNER JOIN COLLECTION.item_attribute_field iaf
			ON ia.item_attr_id = iaf.item_attr_id
		ON i.item_id = ia.item_id
	
GO
PRINT '---->>> COLLECTION.attribute_list created successfully'
