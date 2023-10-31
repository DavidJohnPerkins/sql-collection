USE Collections
GO

DECLARE	@json_data CORE.json

SET @json_data = N'
[{  
    "parent_collection": "INK COLLECTION",
    "item":[
		{
			"item_key_value": "MB026",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "MB026"},
					{"attr_name": "BRAND",			"attr_value": "Mont Blanc"},
					{"attr_name": "RANGE",			"attr_value": "Special Edition"},
					{"attr_name": "INK_NAME", 		"attr_value": "Lucky Orange"},
					{"attr_name": "CONTAINER", 		"attr_value": "Cartridge"},
					{"attr_name": "CONTAINER_SIZE", "attr_value": "Short"},
					{"attr_name": "COLOUR", 		"attr_value": "Orange"},
					{"attr_name": "QTY_REMAINING", 	"attr_value": 6},
					{"attr_name": "RATING", 		"attr_value": 4}
			]
		},
		{
			"item_key_value": "MB027",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "MB027"},
					{"attr_name": "BRAND",			"attr_value": "Mont Blanc"},
					{"attr_name": "RANGE",			"attr_value": "Special Edition"},
					{"attr_name": "INK_NAME", 		"attr_value": "UNICEF Blue"},
					{"attr_name": "CONTAINER", 		"attr_value": "Cartridge"},
					{"attr_name": "CONTAINER_SIZE", "attr_value": "Short"},
					{"attr_name": "COLOUR", 		"attr_value": "Blue"},
					{"attr_name": "QTY_REMAINING", 	"attr_value": 6},
					{"attr_name": "RATING", 		"attr_value": 4}
			]
		},
		{
			"item_key_value": "MB028",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "MB028"},
					{"attr_name": "BRAND",			"attr_value": "Mont Blanc"},
					{"attr_name": "RANGE",			"attr_value": "Special Edition"},
					{"attr_name": "INK_NAME", 		"attr_value": "Modena Red"},
					{"attr_name": "CONTAINER", 		"attr_value": "Cartridge"},
					{"attr_name": "CONTAINER_SIZE", "attr_value": "Short"},
					{"attr_name": "COLOUR", 		"attr_value": "Red"},
					{"attr_name": "QTY_REMAINING", 	"attr_value": 4},
					{"attr_name": "RATING", 		"attr_value": 4}
			]
		},
		{
			"item_key_value": "MB029",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "MB029"},
					{"attr_name": "BRAND",			"attr_value": "Mont Blanc"},
					{"attr_name": "RANGE",			"attr_value": "Special Edition"},
					{"attr_name": "INK_NAME", 		"attr_value": "Petrol Blue"},
					{"attr_name": "CONTAINER", 		"attr_value": "Cartridge"},
					{"attr_name": "CONTAINER_SIZE", "attr_value": "Short"},
					{"attr_name": "COLOUR", 		"attr_value": "Blue"},
					{"attr_name": "QTY_REMAINING", 	"attr_value": 10},
					{"attr_name": "RATING", 		"attr_value": 4}
			]
		},
		{
			"item_key_value": "MB030",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "MB030"},
					{"attr_name": "BRAND",			"attr_value": "Mont Blanc"},
					{"attr_name": "RANGE",			"attr_value": "Special Edition"},
					{"attr_name": "INK_NAME", 		"attr_value": "Emerald"},
					{"attr_name": "CONTAINER", 		"attr_value": "Cartridge"},
					{"attr_name": "CONTAINER_SIZE", "attr_value": "Short"},
					{"attr_name": "COLOUR", 		"attr_value": "Green"},
					{"attr_name": "QTY_REMAINING", 	"attr_value": 4},
					{"attr_name": "RATING", 		"attr_value": 4}
			]
		},
		{
			"item_key_value": "MB031",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "MB031"},
					{"attr_name": "BRAND",			"attr_value": "Mont Blanc"},
					{"attr_name": "RANGE",			"attr_value": "Special Edition"},
					{"attr_name": "INK_NAME", 		"attr_value": "Manganese Orange"},
					{"attr_name": "CONTAINER", 		"attr_value": "Cartridge"},
					{"attr_name": "CONTAINER_SIZE", "attr_value": "Short"},
					{"attr_name": "COLOUR", 		"attr_value": "Orange"},
					{"attr_name": "QTY_REMAINING", 	"attr_value": 7},
					{"attr_name": "RATING", 		"attr_value": 3}
			]
		},
		{
			"item_key_value": "MB032",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "MB032"},
					{"attr_name": "BRAND",			"attr_value": "Mont Blanc"},
					{"attr_name": "RANGE",			"attr_value": "Standard Cartridge"},
					{"attr_name": "INK_NAME", 		"attr_value": "Lavender Purple"},
					{"attr_name": "CONTAINER", 		"attr_value": "Cartridge"},
					{"attr_name": "CONTAINER_SIZE", "attr_value": "Short"},
					{"attr_name": "COLOUR", 		"attr_value": "Purple"},
					{"attr_name": "QTY_REMAINING", 	"attr_value": 1},
					{"attr_name": "RATING", 		"attr_value": 4}
			]
		}
	]
}]
';
select @json_data;

EXEC COLLECTION.cu_collection_item_json @json_data,0,1
