USE Collections
GO

DECLARE @v_coll_name	varchar(50) = 'POLYCHROMOS PENCILS'

DECLARE	@v_parent_id	int = (SELECT ia.item_id FROM COLLECTION.item_attribute ia WHERE ia.attr_value = @v_coll_name),
		@v_new_item_id	int = (SELECT iaf.item_attr_id FROM COLLECTION.item_attribute_field iaf WHERE iaf.item_attr_name = 'URL_FRAGMENT')

INSERT INTO COLLECTION.item_attribute (item_id, item_attr_id, attr_value)
SELECT 
	ic.item_id,
	@v_new_item_id,
	'products'
FROM 
	COLLECTION.item ic 
	INNER JOIN COLLECTION.item ip
	ON ic.item_id = ip.item_id
WHERE 
	ip.item_parent = @v_parent_id

EXEC COLLECTION.r_collection_crystallise @v_coll_name
