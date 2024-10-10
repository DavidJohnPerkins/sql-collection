USE Collections
GO

DECLARE	@json_data CORE.json

SET @json_data = N'
[{  
    "parent_collection": "INK COLLECTION",
    "item":[
		{
			"item_key_value": "LAB001",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "LAB001"},
					{"attr_name": "BRAND",			"attr_value": "Laban"},
					{"attr_name": "RANGE",			"attr_value": "Greek Mythology"},
					{"attr_name": "INK_NAME", 		"attr_value": "Zeus"},
					{"attr_name": "CONTAINER", 		"attr_value": "Bottle"},
					{"attr_name": "CONTAINER_SIZE", "attr_value": "50ml"},
					{"attr_name": "COLOUR", 		"attr_value": "Purple"},
					{"attr_name": "QTY_REMAINING", 	"attr_value": 39},
					{"attr_name": "RATING", 		"attr_value": 4}
			]
		},
		{
			"item_key_value": "LAB002",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "LAB002"},
					{"attr_name": "BRAND",			"attr_value": "Laban"},
					{"attr_name": "RANGE",			"attr_value": "Greek Mythology"},
					{"attr_name": "INK_NAME", 		"attr_value": "Artemis"},
					{"attr_name": "CONTAINER", 		"attr_value": "Bottle"},
					{"attr_name": "CONTAINER_SIZE", "attr_value": "50ml"},
					{"attr_name": "COLOUR", 		"attr_value": "Blue"},
					{"attr_name": "QTY_REMAINING", 	"attr_value": 39},
					{"attr_name": "RATING", 		"attr_value": 5}
			]
		},
		{
			"item_key_value": "LAB003",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "LAB003"},
					{"attr_name": "BRAND",			"attr_value": "Laban"},
					{"attr_name": "RANGE",			"attr_value": "Greek Mythology"},
					{"attr_name": "INK_NAME", 		"attr_value": "Aphrodite"},
					{"attr_name": "CONTAINER", 		"attr_value": "Bottle"},
					{"attr_name": "CONTAINER_SIZE", "attr_value": "50ml"},
					{"attr_name": "COLOUR", 		"attr_value": "Pink"},
					{"attr_name": "QTY_REMAINING", 	"attr_value": 50},
					{"attr_name": "RATING", 		"attr_value": 3}
			]
		}
	]
}]
';
--select @json_data;
EXEC COLLECTION.c_collection_item_json @json_data,0,1
