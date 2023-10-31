USE Collections
GO

DECLARE	@json_data CORE.json

SET @json_data = N'
[{  
    "parent_collection": "INK COLLECTION",
    "item":[
		{
			"item_key_value": "MB033",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "MB033"},
					{"attr_name": "BRAND",			"attr_value": "Mont Blanc"},
					{"attr_name": "RANGE",			"attr_value": "Standard Cartridge"},
					{"attr_name": "INK_NAME", 		"attr_value": "Amethyst Purple"},
					{"attr_name": "CONTAINER", 		"attr_value": "Cartridge"},
					{"attr_name": "CONTAINER_SIZE", "attr_value": "Short"},
					{"attr_name": "COLOUR", 		"attr_value": "Purple"},
					{"attr_name": "QTY_REMAINING", 	"attr_value": 4},
					{"attr_name": "RATING", 		"attr_value": 4}
			]
		}	]
}]
';
--select @json_data;
EXEC COLLECTION.c_collection_item_json @json_data,0,1
