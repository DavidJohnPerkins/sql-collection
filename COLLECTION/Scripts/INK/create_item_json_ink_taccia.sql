USE Collections
GO

DECLARE	@json_data CORE.json

SET @json_data = N'
[{  
    "parent_collection": "INK COLLECTION",
    "item":[
		{
			"item_key_value": "TA004",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "TA004"},
					{"attr_name": "BRAND",			"attr_value": "Taccia"},
					{"attr_name": "RANGE",			"attr_value": "Sunaoiro"},
					{"attr_name": "INK_NAME", 		"attr_value": "Midori"},
					{"attr_name": "CONTAINER", 		"attr_value": "Bottle"},
					{"attr_name": "CONTAINER_SIZE", "attr_value": "40ml"},
					{"attr_name": "COLOUR", 		"attr_value": "Green"},
					{"attr_name": "QTY_REMAINING", 	"attr_value": 40},
					{"attr_name": "RATING", 		"attr_value": 5}
			]
		},
		{
			"item_key_value": "TA005",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "TA005"},
					{"attr_name": "BRAND",			"attr_value": "Taccia"},
					{"attr_name": "RANGE",			"attr_value": "Ukiyoe"},
					{"attr_name": "INK_NAME", 		"attr_value": "koiai"},
					{"attr_name": "CONTAINER", 		"attr_value": "Bottle"},
					{"attr_name": "CONTAINER_SIZE", "attr_value": "40ml"},
					{"attr_name": "COLOUR", 		"attr_value": "Blue"},
					{"attr_name": "QTY_REMAINING", 	"attr_value": 40},
					{"attr_name": "RATING", 		"attr_value": 5}
			]
		}
	]
}]
';
--select @json_data;
EXEC COLLECTION.c_collection_item @json_data,0,1
