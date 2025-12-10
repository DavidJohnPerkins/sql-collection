USE Collections
GO

DECLARE	@json_data CORE.json

SET @json_data = N'
[{  
    "parent_collection": "INK COLLECTION",
    "item":[
		{
			"item_key_value": "IRO010",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "IRO010"},
					{"attr_name": "BRAND",			"attr_value": "Iroshizuku"},
					{"attr_name": "RANGE",			"attr_value": "Standard"},
					{"attr_name": "INK_NAME", 		"attr_value": "murasaki-shikibu"},
					{"attr_name": "CONTAINER", 		"attr_value": "Cartridge"},
					{"attr_name": "CONTAINER_SIZE", "attr_value": "Pilot Standard"},
					{"attr_name": "COLOUR", 		"attr_value": "Purple"},
					{"attr_name": "QTY_REMAINING", 	"attr_value": 5},
					{"attr_name": "RATING", 		"attr_value": 4}
			]
		},
		{
			"item_key_value": "IRO011",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "IRO011"},
					{"attr_name": "BRAND",			"attr_value": "Iroshizuku"},
					{"attr_name": "RANGE",			"attr_value": "Standard"},
					{"attr_name": "INK_NAME", 		"attr_value": "shin-kai"},
					{"attr_name": "CONTAINER", 		"attr_value": "Cartridge"},
					{"attr_name": "CONTAINER_SIZE", "attr_value": "Pilot Standard"},
					{"attr_name": "COLOUR", 		"attr_value": "Blue"},
					{"attr_name": "QTY_REMAINING", 	"attr_value": 6},
					{"attr_name": "RATING", 		"attr_value": 4}
			]
		}
	]
}]
';
--select @json_data;
EXEC COLLECTION.c_collection_item @json_data,0,1
