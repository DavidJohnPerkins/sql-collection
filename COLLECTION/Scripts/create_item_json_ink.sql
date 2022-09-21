USE Collections
GO

DECLARE	@json_data CORE.json

SET @json_data = N'
[{  
    "parent_collection": "INK COLLECTION",
    "item":[
		{
			"item_key_value": "PEL001",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "PEL001"},
					{"attr_name": "BRAND",			"attr_value": "Pelikan"},
					{"attr_name": "RANGE",			"attr_value": "4001"},
					{"attr_name": "INK_NAME", 		"attr_value": "Brown"},
					{"attr_name": "CONTAINER", 		"attr_value": "Bottle"},
					{"attr_name": "CONTAINER_SIZE", "attr_value": "30ml"},
					{"attr_name": "COLOUR", 		"attr_value": "Brown"},
					{"attr_name": "QTY_REMAINING", 	"attr_value": 12},
					{"attr_name": "RATING", 		"attr_value": 5}
			]
		},
		{
			"item_key_value": "CRS001",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "CRS001"},
					{"attr_name": "BRAND",			"attr_value": "Cross"},
					{"attr_name": "RANGE",			"attr_value": "Standard"},
					{"attr_name": "INK_NAME", 		"attr_value": "Black"},
					{"attr_name": "CONTAINER", 		"attr_value": "Bottle"},
					{"attr_name": "CONTAINER_SIZE", "attr_value": "62.5ml"},
					{"attr_name": "COLOUR", 		"attr_value": "Black"},
					{"attr_name": "QTY_REMAINING", 	"attr_value": 30},
					{"attr_name": "RATING", 		"attr_value": 4}
			]
		},
		{
			"item_key_value": "JH003",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "JH003"},
					{"attr_name": "BRAND",			"attr_value": "Jacques Herbin"},
					{"attr_name": "RANGE",			"attr_value": "D Bottle"},
					{"attr_name": "INK_NAME", 		"attr_value": "Orange Indien"},
					{"attr_name": "CONTAINER", 		"attr_value": "Bottle"},
					{"attr_name": "CONTAINER_SIZE", "attr_value": "30ml"},
					{"attr_name": "COLOUR", 		"attr_value": "Orange"},
					{"attr_name": "QTY_REMAINING", 	"attr_value": 28},
					{"attr_name": "RATING", 		"attr_value": 4}
			]
		},
		{
			"item_key_value": "JH004",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "JH004"},
					{"attr_name": "BRAND",			"attr_value": "Jacques Herbin"},
					{"attr_name": "RANGE",			"attr_value": "D Bottle"},
					{"attr_name": "INK_NAME", 		"attr_value": "Éclat de Saphir"},
					{"attr_name": "CONTAINER", 		"attr_value": "Bottle"},
					{"attr_name": "CONTAINER_SIZE", "attr_value": "30ml"},
					{"attr_name": "COLOUR", 		"attr_value": "Blue"},
					{"attr_name": "QTY_REMAINING", 	"attr_value": 6},
					{"attr_name": "RATING", 		"attr_value": 4}
			]
		},
		{
			"item_key_value": "JH005",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "JH005"},
					{"attr_name": "BRAND",			"attr_value": "Jacques Herbin"},
					{"attr_name": "RANGE",			"attr_value": "D Bottle"},
					{"attr_name": "INK_NAME", 		"attr_value": "Vert Pré"},
					{"attr_name": "CONTAINER", 		"attr_value": "Bottle"},
					{"attr_name": "CONTAINER_SIZE", "attr_value": "30ml"},
					{"attr_name": "COLOUR", 		"attr_value": "Green"},
					{"attr_name": "QTY_REMAINING", 	"attr_value": 25},
					{"attr_name": "RATING", 		"attr_value": 3}
			]
		},
		{
			"item_key_value": "JH006",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "JH006"},
					{"attr_name": "BRAND",			"attr_value": "Jacques Herbin"},
					{"attr_name": "RANGE",			"attr_value": "D Bottle"},
					{"attr_name": "INK_NAME", 		"attr_value": "Lierre Sauvage"},
					{"attr_name": "CONTAINER", 		"attr_value": "Bottle"},
					{"attr_name": "CONTAINER_SIZE", "attr_value": "30ml"},
					{"attr_name": "COLOUR", 		"attr_value": "Green"},
					{"attr_name": "QTY_REMAINING", 	"attr_value": 28},
					{"attr_name": "RATING", 		"attr_value": 4}
			]
		},
		{
			"item_key_value": "JH007",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "JH007"},
					{"attr_name": "BRAND",			"attr_value": "Jacques Herbin"},
					{"attr_name": "RANGE",			"attr_value": "D Bottle"},
					{"attr_name": "INK_NAME", 		"attr_value": "Bleu Pervenche"},
					{"attr_name": "CONTAINER", 		"attr_value": "Bottle"},
					{"attr_name": "CONTAINER_SIZE", "attr_value": "30ml"},
					{"attr_name": "COLOUR", 		"attr_value": "Blue"},
					{"attr_name": "QTY_REMAINING", 	"attr_value": 25},
					{"attr_name": "RATING", 		"attr_value": 4}
			]
		},
		{
			"item_key_value": "JH008",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "JH008"},
					{"attr_name": "BRAND",			"attr_value": "Jacques Herbin"},
					{"attr_name": "RANGE",			"attr_value": "D Bottle"},
					{"attr_name": "INK_NAME", 		"attr_value": "Rouge Caroubier"},
					{"attr_name": "CONTAINER", 		"attr_value": "Bottle"},
					{"attr_name": "CONTAINER_SIZE", "attr_value": "30ml"},
					{"attr_name": "COLOUR", 		"attr_value": "Red"},
					{"attr_name": "QTY_REMAINING", 	"attr_value": 28},
					{"attr_name": "RATING", 		"attr_value": 4}
			]
		},
		{
			"item_key_value": "JH009",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "JH009"},
					{"attr_name": "BRAND",			"attr_value": "Jacques Herbin"},
					{"attr_name": "RANGE",			"attr_value": "D Bottle"},
					{"attr_name": "INK_NAME", 		"attr_value": "Bleu Azur"},
					{"attr_name": "CONTAINER", 		"attr_value": "Bottle"},
					{"attr_name": "CONTAINER_SIZE", "attr_value": "30ml"},
					{"attr_name": "COLOUR", 		"attr_value": "Blue"},
					{"attr_name": "QTY_REMAINING", 	"attr_value": 26},
					{"attr_name": "RATING", 		"attr_value": 2}
			]
		},
		{
			"item_key_value": "JH010",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "JH010"},
					{"attr_name": "BRAND",			"attr_value": "Jacques Herbin"},
					{"attr_name": "RANGE",			"attr_value": "D Bottle"},
					{"attr_name": "INK_NAME", 		"attr_value": "Vert Empire"},
					{"attr_name": "CONTAINER", 		"attr_value": "Bottle"},
					{"attr_name": "CONTAINER_SIZE", "attr_value": "30ml"},
					{"attr_name": "COLOUR", 		"attr_value": "Green"},
					{"attr_name": "QTY_REMAINING", 	"attr_value": 29},
					{"attr_name": "RATING", 		"attr_value": 3}
			]
		},
		{
			"item_key_value": "JH011",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "JH011"},
					{"attr_name": "BRAND",			"attr_value": "Jacques Herbin"},
					{"attr_name": "RANGE",			"attr_value": "D Bottle"},
					{"attr_name": "INK_NAME", 		"attr_value": "Violette Pensée"},
					{"attr_name": "CONTAINER", 		"attr_value": "Bottle"},
					{"attr_name": "CONTAINER_SIZE", "attr_value": "30ml"},
					{"attr_name": "COLOUR", 		"attr_value": "Purple"},
					{"attr_name": "QTY_REMAINING", 	"attr_value": 22},
					{"attr_name": "RATING", 		"attr_value": 4}
			]
		},
		{
			"item_key_value": "JH012",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "JH012"},
					{"attr_name": "BRAND",			"attr_value": "Jacques Herbin"},
					{"attr_name": "RANGE",			"attr_value": "D Bottle"},
					{"attr_name": "INK_NAME", 		"attr_value": "Diabolo Menthe"},
					{"attr_name": "CONTAINER", 		"attr_value": "Bottle"},
					{"attr_name": "CONTAINER_SIZE", "attr_value": "30ml"},
					{"attr_name": "COLOUR", 		"attr_value": "Green"},
					{"attr_name": "QTY_REMAINING", 	"attr_value": 29},
					{"attr_name": "RATING", 		"attr_value": 3}
			]
		}
	]
}]
';
--select @json_data;
EXEC COLLECTION.cu_collection_item_json @json_data,0,1
