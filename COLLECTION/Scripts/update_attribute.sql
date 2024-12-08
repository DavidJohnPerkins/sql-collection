--select * from COLLECTION.v_base_INK_COLLECTION where KEY_VALUE like 'JH%'

DECLARE @json CORE.json

SET @json = '
	{  
		"item_attr_name": 	"QTY_REMAINING",
		"collection_name":	"INK COLLECTION",
		"key_value":		"GVFC005",
		"new_value":		"7"
	}
'
EXEC COLLECTION.u_item_attribute @json, 0, 1
