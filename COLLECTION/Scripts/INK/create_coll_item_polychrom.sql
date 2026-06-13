USE Collections
GO

DECLARE	@json_data CORE.json

SET @json_data = N'
[
	{  
		"parent_collection": "POLYCHROMOS PENCILS",
		"item":[
			{
				"item_key_value": "POLY272",
				"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "POLY272"},
					{"attr_name": "COLOUR_NUMBER",	"attr_value": 272},
					{"attr_name": "COLOUR_GROUP",	"attr_value": "GREY"},
					{"attr_name": "COLOUR_NAME",	"attr_value": "Warm Grey III"},
					{"attr_name": "LENGTH",			"attr_value": 162}, 
					{"attr_name": "LOCATION",		"attr_value": "AWAITING"},
					{"attr_name": "RGB_RED",		"attr_value": 168},
					{"attr_name": "RGB_GREEN",		"attr_value": 165},
					{"attr_name": "RGB_BLUE",		"attr_value": 159},
					{"attr_name": "IMAGE_1",		"attr_value": "FC11159-272-ZZZ_Faber-Castell-Polychromos-Pencil-272-Warm-Grey-III-Single_P2.jpg"}
				]
			},			{
				"item_key_value": "POLY273",
				"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "POLY273"},
					{"attr_name": "COLOUR_NUMBER",	"attr_value": 273},
					{"attr_name": "COLOUR_GROUP",	"attr_value": "GREY"},
					{"attr_name": "COLOUR_NAME",	"attr_value": "Warm Grey IV"},
					{"attr_name": "LENGTH",			"attr_value": 162}, 
					{"attr_name": "LOCATION",		"attr_value": "AWAITING"},
					{"attr_name": "RGB_RED",		"attr_value": 124},
					{"attr_name": "RGB_GREEN",		"attr_value": 126},
					{"attr_name": "RGB_BLUE",		"attr_value": 127},
					{"attr_name": "IMAGE_1",		"attr_value": "FC11159-273-ZZZ_Faber-Castell-Polychromos-Pencil-273-Warm-Grey-IV-Single_P2.jpg"}
				]
			},			{
				"item_key_value": "POLY275",
				"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "POLY275"},
					{"attr_name": "COLOUR_NUMBER",	"attr_value": 275},
					{"attr_name": "COLOUR_GROUP",	"attr_value": "GREY"},
					{"attr_name": "COLOUR_NAME",	"attr_value": "Warm Grey VI"},
					{"attr_name": "LENGTH",			"attr_value": 162}, 
					{"attr_name": "LOCATION",		"attr_value": "AWAITING"},
					{"attr_name": "RGB_RED",		"attr_value": 88},
					{"attr_name": "RGB_GREEN",		"attr_value": 85},
					{"attr_name": "RGB_BLUE",		"attr_value": 87},
					{"attr_name": "IMAGE_1",		"attr_value": "FC11159-275-ZZZ_Faber-Castell-Polychromos-Pencil-275-Warm-Grey-VI-Single_P2.jpg"}
				]
			},			{
				"item_key_value": "POLY276",
				"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "POLY276"},
					{"attr_name": "COLOUR_NUMBER",	"attr_value": 276},
					{"attr_name": "COLOUR_GROUP",	"attr_value": "GREEN"},
					{"attr_name": "COLOUR_NAME",	"attr_value": "Chrome Oxide Green Fiery"},
					{"attr_name": "LENGTH",			"attr_value": 162}, 
					{"attr_name": "LOCATION",		"attr_value": "AWAITING"},
					{"attr_name": "RGB_RED",		"attr_value": 0},
					{"attr_name": "RGB_GREEN",		"attr_value": 152},
					{"attr_name": "RGB_BLUE",		"attr_value": 127},
					{"attr_name": "IMAGE_1",		"attr_value": "FC11159-276-ZZZ_Faber-Castell-Polychromos-Pencil-276-Chrome-Oxide-Green-Fiery-Single_P2.jpg"}
				]
			},			{
				"item_key_value": "POLY278",
				"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "POLY278"},
					{"attr_name": "COLOUR_NUMBER",	"attr_value": 278},
					{"attr_name": "COLOUR_GROUP",	"attr_value": "GREEN"},
					{"attr_name": "COLOUR_NAME",	"attr_value": "Chrome Oxide Green"},
					{"attr_name": "LENGTH",			"attr_value": 162}, 
					{"attr_name": "LOCATION",		"attr_value": "AWAITING"},
					{"attr_name": "RGB_RED",		"attr_value": 74},
					{"attr_name": "RGB_GREEN",		"attr_value": 97},
					{"attr_name": "RGB_BLUE",		"attr_value": 75},
					{"attr_name": "IMAGE_1",		"attr_value": "FC11159-278-ZZZ_Faber-Castell-Polychromos-Pencil-278-Chrome-Oxide-Green-Single_P2.jpg"}
				]
			},			{
				"item_key_value": "POLY280",
				"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "POLY280"},
					{"attr_name": "COLOUR_NUMBER",	"attr_value": 280},
					{"attr_name": "COLOUR_GROUP",	"attr_value": "BROWN"},
					{"attr_name": "COLOUR_NAME",	"attr_value": "Burnt Umber"},
					{"attr_name": "LENGTH",			"attr_value": 162}, 
					{"attr_name": "LOCATION",		"attr_value": "AWAITING"},
					{"attr_name": "RGB_RED",		"attr_value": 104},
					{"attr_name": "RGB_GREEN",		"attr_value": 85},
					{"attr_name": "RGB_BLUE",		"attr_value": 70},
					{"attr_name": "IMAGE_1",		"attr_value": "FC11159-280-ZZZ_Faber-Castell-Polychromos-Pencil-280-Burnt-Umber-Single_P2.jpg"}
				]
			}
		]
	}
]';
--select @json_data
EXEC COLLECTION.c_collection_item @json_data, 0, 1
