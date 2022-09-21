USE Collections
GO

DECLARE	@json_data CORE.json

SET @json_data = N'
[{  
    "parent_collection": "INK COLLECTION",
    "item":[
		{
			"item_key_value": "LAMY008",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "LAMY008"},
					{"attr_name": "BRAND",			"attr_value": "Lamy"},
					{"attr_name": "RANGE",			"attr_value": "T10 Cartridge"},
					{"attr_name": "INK_NAME", 		"attr_value": "Purple"},
					{"attr_name": "CONTAINER", 		"attr_value": "Cartridge"},
					{"attr_name": "CONTAINER_SIZE", "attr_value": "Long"},
					{"attr_name": "COLOUR", 		"attr_value": "Purple"},
					{"attr_name": "QTY_REMAINING", 	"attr_value": 9},
					{"attr_name": "RATING", 		"attr_value": 3}
			]
		},
		{
			"item_key_value": "LAMY009",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "LAMY009"},
					{"attr_name": "BRAND",			"attr_value": "Lamy"},
					{"attr_name": "RANGE",			"attr_value": "T10 Cartridge"},
					{"attr_name": "INK_NAME", 		"attr_value": "Black"},
					{"attr_name": "CONTAINER", 		"attr_value": "Cartridge"},
					{"attr_name": "CONTAINER_SIZE", "attr_value": "Long"},
					{"attr_name": "COLOUR", 		"attr_value": "Black"},
					{"attr_name": "QTY_REMAINING", 	"attr_value": 7},
					{"attr_name": "RATING", 		"attr_value": 2}
			]
		},
		{
			"item_key_value": "LAMY010",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "LAMY010"},
					{"attr_name": "BRAND",			"attr_value": "Lamy"},
					{"attr_name": "RANGE",			"attr_value": "T10 Cartridge"},
					{"attr_name": "INK_NAME", 		"attr_value": "Turquoise"},
					{"attr_name": "CONTAINER", 		"attr_value": "Cartridge"},
					{"attr_name": "CONTAINER_SIZE", "attr_value": "Long"},
					{"attr_name": "COLOUR", 		"attr_value": "Turquoise"},
					{"attr_name": "QTY_REMAINING", 	"attr_value": 5},
					{"attr_name": "RATING", 		"attr_value": 3}
			]
		},
		{
			"item_key_value": "LAMY011",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "LAMY011"},
					{"attr_name": "BRAND",			"attr_value": "Lamy"},
					{"attr_name": "RANGE",			"attr_value": "T10 Cartridge"},
					{"attr_name": "INK_NAME", 		"attr_value": "Blue"},
					{"attr_name": "CONTAINER", 		"attr_value": "Cartridge"},
					{"attr_name": "CONTAINER_SIZE", "attr_value": "Long"},
					{"attr_name": "COLOUR", 		"attr_value": "Blue"},
					{"attr_name": "QTY_REMAINING", 	"attr_value": 5},
					{"attr_name": "RATING", 		"attr_value": 3}
			]
		},
		{
			"item_key_value": "LAMY012",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "LAMY012"},
					{"attr_name": "BRAND",			"attr_value": "Lamy"},
					{"attr_name": "RANGE",			"attr_value": "T10 Cartridge"},
					{"attr_name": "INK_NAME", 		"attr_value": "Magenta"},
					{"attr_name": "CONTAINER", 		"attr_value": "Cartridge"},
					{"attr_name": "CONTAINER_SIZE", "attr_value": "Long"},
					{"attr_name": "COLOUR", 		"attr_value": "Purple"},
					{"attr_name": "QTY_REMAINING", 	"attr_value": 1},
					{"attr_name": "RATING", 		"attr_value": 3}
			]
		},
		{
			"item_key_value": "LAMY013",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "LAMY013"},
					{"attr_name": "BRAND",			"attr_value": "Lamy"},
					{"attr_name": "RANGE",			"attr_value": "T10 Cartridge"},
					{"attr_name": "INK_NAME", 		"attr_value": "Red"},
					{"attr_name": "CONTAINER", 		"attr_value": "Cartridge"},
					{"attr_name": "CONTAINER_SIZE", "attr_value": "Long"},
					{"attr_name": "COLOUR", 		"attr_value": "Red"},
					{"attr_name": "QTY_REMAINING", 	"attr_value": 4},
					{"attr_name": "RATING", 		"attr_value": 3}
			]
		},
		{
			"item_key_value": "LAMY014",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "LAMY014"},
					{"attr_name": "BRAND",			"attr_value": "Lamy"},
					{"attr_name": "RANGE",			"attr_value": "T10 Cartridge"},
					{"attr_name": "INK_NAME", 		"attr_value": "Orange-Pink"},
					{"attr_name": "CONTAINER", 		"attr_value": "Cartridge"},
					{"attr_name": "CONTAINER_SIZE", "attr_value": "Long"},
					{"attr_name": "COLOUR", 		"attr_value": "Orange"},
					{"attr_name": "QTY_REMAINING", 	"attr_value": 7},
					{"attr_name": "RATING", 		"attr_value": 3}
			]
		},
		{
			"item_key_value": "LAMY015",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "LAMY015"},
					{"attr_name": "BRAND",			"attr_value": "Lamy"},
					{"attr_name": "RANGE",			"attr_value": "T10 Cartridge"},
					{"attr_name": "INK_NAME", 		"attr_value": "Lime Green"},
					{"attr_name": "CONTAINER", 		"attr_value": "Cartridge"},
					{"attr_name": "CONTAINER_SIZE", "attr_value": "Long"},
					{"attr_name": "COLOUR", 		"attr_value": "Green"},
					{"attr_name": "QTY_REMAINING", 	"attr_value": 6},
					{"attr_name": "RATING", 		"attr_value": 3}
			]
		},
		{
			"item_key_value": "LAMY016",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "LAMY016"},
					{"attr_name": "BRAND",			"attr_value": "Lamy"},
					{"attr_name": "RANGE",			"attr_value": "T10 Cartridge"},
					{"attr_name": "INK_NAME", 		"attr_value": "Neon Green"},
					{"attr_name": "CONTAINER", 		"attr_value": "Cartridge"},
					{"attr_name": "CONTAINER_SIZE", "attr_value": "Long"},
					{"attr_name": "COLOUR", 		"attr_value": "Green"},
					{"attr_name": "QTY_REMAINING", 	"attr_value": 10},
					{"attr_name": "RATING", 		"attr_value": 2}
			]
		},
		{
			"item_key_value": "LAMY017",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "LAMY017"},
					{"attr_name": "BRAND",			"attr_value": "Lamy"},
					{"attr_name": "RANGE",			"attr_value": "T10 Cartridge"},
					{"attr_name": "INK_NAME", 		"attr_value": "Copper Orange"},
					{"attr_name": "CONTAINER", 		"attr_value": "Cartridge"},
					{"attr_name": "CONTAINER_SIZE", "attr_value": "Long"},
					{"attr_name": "COLOUR", 		"attr_value": "Orange"},
					{"attr_name": "QTY_REMAINING", 	"attr_value": 5},
					{"attr_name": "RATING", 		"attr_value": 3}
			]
		}
	]
}]
';
--select @json_data;
EXEC COLLECTION.cu_collection_item_json @json_data,0,1
