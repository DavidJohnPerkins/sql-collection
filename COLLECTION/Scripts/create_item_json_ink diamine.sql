USE Collections
GO

DECLARE	@json_data CORE.json

SET @json_data = N'
[{  
    "parent_collection": "INK COLLECTION",
    "item":[
		{
			"item_key_value": "DIAM001",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "DIAM001"},
					{"attr_name": "BRAND",			"attr_value": "Diamine"},
					{"attr_name": "RANGE",			"attr_value": "Standard"},
					{"attr_name": "INK_NAME", 		"attr_value": "Poppy Red"},
					{"attr_name": "CONTAINER", 		"attr_value": "Bottle"},
					{"attr_name": "CONTAINER_SIZE", "attr_value": "80ml"},
					{"attr_name": "COLOUR", 		"attr_value": "Red"},
					{"attr_name": "QTY_REMAINING", 	"attr_value": 70},
					{"attr_name": "RATING", 		"attr_value": 4}
			]
		},
		{
			"item_key_value": "DIAM002",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "DIAM002"},
					{"attr_name": "BRAND",			"attr_value": "Diamine"},
					{"attr_name": "RANGE",			"attr_value": "Standard"},
					{"attr_name": "INK_NAME", 		"attr_value": "Majestic Blue"},
					{"attr_name": "CONTAINER", 		"attr_value": "Bottle"},
					{"attr_name": "CONTAINER_SIZE", "attr_value": "80ml"},
					{"attr_name": "COLOUR", 		"attr_value": "Blue"},
					{"attr_name": "QTY_REMAINING", 	"attr_value": 72},
					{"attr_name": "RATING", 		"attr_value": 2}
			]
		},
		{
			"item_key_value": "DIAM003",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "DIAM003"},
					{"attr_name": "BRAND",			"attr_value": "Diamine"},
					{"attr_name": "RANGE",			"attr_value": "Standard"},
					{"attr_name": "INK_NAME", 		"attr_value": "Teal"},
					{"attr_name": "CONTAINER", 		"attr_value": "Bottle"},
					{"attr_name": "CONTAINER_SIZE", "attr_value": "80ml"},
					{"attr_name": "COLOUR", 		"attr_value": "Blue"},
					{"attr_name": "QTY_REMAINING", 	"attr_value": 45},
					{"attr_name": "RATING", 		"attr_value": 4}
			]
		},
		{
			"item_key_value": "DIAM004",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "DIAM004"},
					{"attr_name": "BRAND",			"attr_value": "Diamine"},
					{"attr_name": "RANGE",			"attr_value": "Standard"},
					{"attr_name": "INK_NAME", 		"attr_value": "Green/Black"},
					{"attr_name": "CONTAINER", 		"attr_value": "Bottle"},
					{"attr_name": "CONTAINER_SIZE", "attr_value": "80ml"},
					{"attr_name": "COLOUR", 		"attr_value": "Green"},
					{"attr_name": "QTY_REMAINING", 	"attr_value": 75},
					{"attr_name": "RATING", 		"attr_value": 4}
			]
		},
		{
			"item_key_value": "DIAM005",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "DIAM005"},
					{"attr_name": "BRAND",			"attr_value": "Diamine"},
					{"attr_name": "RANGE",			"attr_value": "Standard"},
					{"attr_name": "INK_NAME", 		"attr_value": "Asa Blue"},
					{"attr_name": "CONTAINER", 		"attr_value": "Bottle"},
					{"attr_name": "CONTAINER_SIZE", "attr_value": "80ml"},
					{"attr_name": "COLOUR", 		"attr_value": "Blue"},
					{"attr_name": "QTY_REMAINING", 	"attr_value": 70},
					{"attr_name": "RATING", 		"attr_value": 4}
			]
		},
		{
			"item_key_value": "DIAM006",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "DIAM006"},
					{"attr_name": "BRAND",			"attr_value": "Diamine"},
					{"attr_name": "RANGE",			"attr_value": "Standard"},
					{"attr_name": "INK_NAME", 		"attr_value": "Ultra Green"},
					{"attr_name": "CONTAINER", 		"attr_value": "Bottle"},
					{"attr_name": "CONTAINER_SIZE", "attr_value": "80ml"},
					{"attr_name": "COLOUR", 		"attr_value": "Green"},
					{"attr_name": "QTY_REMAINING", 	"attr_value": 70},
					{"attr_name": "RATING", 		"attr_value": 4}
			]
		},
		{
			"item_key_value": "DIAM007",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "DIAM007"},
					{"attr_name": "BRAND",			"attr_value": "Diamine"},
					{"attr_name": "RANGE",			"attr_value": "Standard"},
					{"attr_name": "INK_NAME", 		"attr_value": "Jet Black"},
					{"attr_name": "CONTAINER", 		"attr_value": "Bottle"},
					{"attr_name": "CONTAINER_SIZE", "attr_value": "80ml"},
					{"attr_name": "COLOUR", 		"attr_value": "Black"},
					{"attr_name": "QTY_REMAINING", 	"attr_value": 75},
					{"attr_name": "RATING", 		"attr_value": 3}
			]
		},
		{
			"item_key_value": "DIAM008",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "DIAM008"},
					{"attr_name": "BRAND",			"attr_value": "Diamine"},
					{"attr_name": "RANGE",			"attr_value": "Standard"},
					{"attr_name": "INK_NAME", 		"attr_value": "Midnight"},
					{"attr_name": "CONTAINER", 		"attr_value": "Bottle"},
					{"attr_name": "CONTAINER_SIZE", "attr_value": "80ml"},
					{"attr_name": "COLOUR", 		"attr_value": "Blue"},
					{"attr_name": "QTY_REMAINING", 	"attr_value": 67},
					{"attr_name": "RATING", 		"attr_value": 4}
			]
		},
		{
			"item_key_value": "DIAM009",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "DIAM009"},
					{"attr_name": "BRAND",			"attr_value": "Diamine"},
					{"attr_name": "RANGE",			"attr_value": "Standard"},
					{"attr_name": "INK_NAME", 		"attr_value": "Red Dragon"},
					{"attr_name": "CONTAINER", 		"attr_value": "Bottle"},
					{"attr_name": "CONTAINER_SIZE", "attr_value": "80ml"},
					{"attr_name": "COLOUR", 		"attr_value": "Red"},
					{"attr_name": "QTY_REMAINING", 	"attr_value": 70},
					{"attr_name": "RATING", 		"attr_value": 3}
			]
		},
		{
			"item_key_value": "DIAM010",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "DIAM010"},
					{"attr_name": "BRAND",			"attr_value": "Diamine"},
					{"attr_name": "RANGE",			"attr_value": "Standard"},
					{"attr_name": "INK_NAME", 		"attr_value": "Imperial Purple"},
					{"attr_name": "CONTAINER", 		"attr_value": "Bottle"},
					{"attr_name": "CONTAINER_SIZE", "attr_value": "80ml"},
					{"attr_name": "COLOUR", 		"attr_value": "Purple"},
					{"attr_name": "QTY_REMAINING", 	"attr_value": 75},
					{"attr_name": "RATING", 		"attr_value": 2}
			]
		},
		{
			"item_key_value": "DIAM011",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "DIAM011"},
					{"attr_name": "BRAND",			"attr_value": "Diamine"},
					{"attr_name": "RANGE",			"attr_value": "Standard"},
					{"attr_name": "INK_NAME", 		"attr_value": "Pumpkin"},
					{"attr_name": "CONTAINER", 		"attr_value": "Bottle"},
					{"attr_name": "CONTAINER_SIZE", "attr_value": "80ml"},
					{"attr_name": "COLOUR", 		"attr_value": "Orange"},
					{"attr_name": "QTY_REMAINING", 	"attr_value": 78},
					{"attr_name": "RATING", 		"attr_value": 2}
			]
		},
		{
			"item_key_value": "DIAM012",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "DIAM012"},
					{"attr_name": "BRAND",			"attr_value": "Diamine"},
					{"attr_name": "RANGE",			"attr_value": "Standard"},
					{"attr_name": "INK_NAME", 		"attr_value": "Mediterranean Blue"},
					{"attr_name": "CONTAINER", 		"attr_value": "Bottle"},
					{"attr_name": "CONTAINER_SIZE", "attr_value": "80ml"},
					{"attr_name": "COLOUR", 		"attr_value": "Blue"},
					{"attr_name": "QTY_REMAINING", 	"attr_value": 77},
					{"attr_name": "RATING", 		"attr_value": 4}
			]
		}
	]
}]
';
--select @json_data;
EXEC COLLECTION.cu_collection_item_json @json_data,0,1
