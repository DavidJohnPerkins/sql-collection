USE Collections
GO

DECLARE	@json_data CORE.json

SET @json_data = N'
[{  
    "parent_collection": "INK COLLECTION",
    "item":[
		{
			"item_key_value": "TA001",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "TA001"},
					{"attr_name": "BRAND",			"attr_value": "Taccia"},
					{"attr_name": "RANGE",			"attr_value": "Ukiyoe"},
					{"attr_name": "INK_NAME", 		"attr_value": "aomurasaki"},
					{"attr_name": "CONTAINER", 		"attr_value": "Bottle"},
					{"attr_name": "CONTAINER_SIZE", "attr_value": "40ml"},
					{"attr_name": "COLOUR", 		"attr_value": "Black/Purple"},
					{"attr_name": "QTY_REMAINING", 	"attr_value": 39},
					{"attr_name": "RATING", 		"attr_value": 4}
			]
		}
	]
}]
';
--select @json_data;
EXEC COLLECTION.c_collection_item_json @json_data, 0, 1
