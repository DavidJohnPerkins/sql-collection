USE Collections
GO

DECLARE	@json_data CORE.json

SET @json_data = N'
[{  
    "parent_collection": "INK COLLECTION",
    "item":[
		{
			"item_key_value": "GVFC002",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "GVFC002"},
					{"attr_name": "BRAND",			"attr_value": "Graf von Faber-Castell"},
					{"attr_name": "RANGE",			"attr_value": "Standard"},
					{"attr_name": "INK_NAME", 		"attr_value": "Hazelnut Brown"},
					{"attr_name": "CONTAINER", 		"attr_value": "Cartridge"},
					{"attr_name": "CONTAINER_SIZE", "attr_value": "Short"},
					{"attr_name": "COLOUR", 		"attr_value": "Brown"},
					{"attr_name": "QTY_REMAINING", 	"attr_value": 3},
					{"attr_name": "RATING", 		"attr_value": 4}
			]
		},
		{
			"item_key_value": "GVFC003",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "GVFC003"},
					{"attr_name": "BRAND",			"attr_value": "Graf von Faber-Castell"},
					{"attr_name": "RANGE",			"attr_value": "Standard"},
					{"attr_name": "INK_NAME", 		"attr_value": "Turquoise"},
					{"attr_name": "CONTAINER", 		"attr_value": "Cartridge"},
					{"attr_name": "CONTAINER_SIZE", "attr_value": "Short"},
					{"attr_name": "COLOUR", 		"attr_value": "Turquoise"},
					{"attr_name": "QTY_REMAINING", 	"attr_value": 2},
					{"attr_name": "RATING", 		"attr_value": 4}
			]
		},
		{
			"item_key_value": "GVFC004",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "GVFC004"},
					{"attr_name": "BRAND",			"attr_value": "Graf von Faber-Castell"},
					{"attr_name": "RANGE",			"attr_value": "Standard"},
					{"attr_name": "INK_NAME", 		"attr_value": "Deep Sea Green"},
					{"attr_name": "CONTAINER", 		"attr_value": "Cartridge"},
					{"attr_name": "CONTAINER_SIZE", "attr_value": "Short"},
					{"attr_name": "COLOUR", 		"attr_value": "Green"},
					{"attr_name": "QTY_REMAINING", 	"attr_value": 5},
					{"attr_name": "RATING", 		"attr_value": 4}
			]
		},
		{
			"item_key_value": "GVFC005",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "GVFC005"},
					{"attr_name": "BRAND",			"attr_value": "Graf von Faber-Castell"},
					{"attr_name": "RANGE",			"attr_value": "Standard"},
					{"attr_name": "INK_NAME", 		"attr_value": "Violet Blue"},
					{"attr_name": "CONTAINER", 		"attr_value": "Cartridge"},
					{"attr_name": "CONTAINER_SIZE", "attr_value": "Short"},
					{"attr_name": "COLOUR", 		"attr_value": "Purple"},
					{"attr_name": "QTY_REMAINING", 	"attr_value": 1},
					{"attr_name": "RATING", 		"attr_value": 3}
			]
		},
		{
			"item_key_value": "GVFC006",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "GVFC006"},
					{"attr_name": "BRAND",			"attr_value": "Graf von Faber-Castell"},
					{"attr_name": "RANGE",			"attr_value": "Standard"},
					{"attr_name": "INK_NAME", 		"attr_value": "Burned Orange"},
					{"attr_name": "CONTAINER", 		"attr_value": "Cartridge"},
					{"attr_name": "CONTAINER_SIZE", "attr_value": "Short"},
					{"attr_name": "COLOUR", 		"attr_value": "Orange"},
					{"attr_name": "QTY_REMAINING", 	"attr_value": 4},
					{"attr_name": "RATING", 		"attr_value": 4}
			]
		},
		{
			"item_key_value": "GVFC007",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "GVFC007"},
					{"attr_name": "BRAND",			"attr_value": "Graf von Faber-Castell"},
					{"attr_name": "RANGE",			"attr_value": "Standard"},
					{"attr_name": "INK_NAME", 		"attr_value": "Cobalt Blue"},
					{"attr_name": "CONTAINER", 		"attr_value": "Cartridge"},
					{"attr_name": "CONTAINER_SIZE", "attr_value": "Short"},
					{"attr_name": "COLOUR", 		"attr_value": "Blue"},
					{"attr_name": "QTY_REMAINING", 	"attr_value": 5},
					{"attr_name": "RATING", 		"attr_value": 5}
			]
		},
		{
			"item_key_value": "GVFC008",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "GVFC008"},
					{"attr_name": "BRAND",			"attr_value": "Graf von Faber-Castell"},
					{"attr_name": "RANGE",			"attr_value": "Standard"},
					{"attr_name": "INK_NAME", 		"attr_value": "Midnight Blue"},
					{"attr_name": "CONTAINER", 		"attr_value": "Cartridge"},
					{"attr_name": "CONTAINER_SIZE", "attr_value": "Short"},
					{"attr_name": "COLOUR", 		"attr_value": "Blue"},
					{"attr_name": "QTY_REMAINING", 	"attr_value": 6},
					{"attr_name": "RATING", 		"attr_value": 5}
			]
		},
		{
			"item_key_value": "GVFC009",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "GVFC009"},
					{"attr_name": "BRAND",			"attr_value": "Graf von Faber-Castell"},
					{"attr_name": "RANGE",			"attr_value": "Standard"},
					{"attr_name": "INK_NAME", 		"attr_value": "Cognac Brown"},
					{"attr_name": "CONTAINER", 		"attr_value": "Cartridge"},
					{"attr_name": "CONTAINER_SIZE", "attr_value": "Short"},
					{"attr_name": "COLOUR", 		"attr_value": "Brown"},
					{"attr_name": "QTY_REMAINING", 	"attr_value": 3},
					{"attr_name": "RATING", 		"attr_value": 3}
			]
		},
		{
			"item_key_value": "GVFC010",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "GVFC010"},
					{"attr_name": "BRAND",			"attr_value": "Graf von Faber-Castell"},
					{"attr_name": "RANGE",			"attr_value": "Standard"},
					{"attr_name": "INK_NAME", 		"attr_value": "Royal Blue"},
					{"attr_name": "CONTAINER", 		"attr_value": "Cartridge"},
					{"attr_name": "CONTAINER_SIZE", "attr_value": "Short"},
					{"attr_name": "COLOUR", 		"attr_value": "Blue"},
					{"attr_name": "QTY_REMAINING", 	"attr_value": 5},
					{"attr_name": "RATING", 		"attr_value": 4}
			]
		},
		{
			"item_key_value": "GVFC011",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "GVFC011"},
					{"attr_name": "BRAND",			"attr_value": "Graf von Faber-Castell"},
					{"attr_name": "RANGE",			"attr_value": "Standard"},
					{"attr_name": "INK_NAME", 		"attr_value": "Gulf Blue"},
					{"attr_name": "CONTAINER", 		"attr_value": "Cartridge"},
					{"attr_name": "CONTAINER_SIZE", "attr_value": "Short"},
					{"attr_name": "COLOUR", 		"attr_value": "Blue"},
					{"attr_name": "QTY_REMAINING", 	"attr_value": 3},
					{"attr_name": "RATING", 		"attr_value": 4}
			]
		},
		{
			"item_key_value": "GVFC012",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "GVFC012"},
					{"attr_name": "BRAND",			"attr_value": "Graf von Faber-Castell"},
					{"attr_name": "RANGE",			"attr_value": "Standard"},
					{"attr_name": "INK_NAME", 		"attr_value": "Viper Green"},
					{"attr_name": "CONTAINER", 		"attr_value": "Cartridge"},
					{"attr_name": "CONTAINER_SIZE", "attr_value": "Short"},
					{"attr_name": "COLOUR", 		"attr_value": "Green"},
					{"attr_name": "QTY_REMAINING", 	"attr_value": 3},
					{"attr_name": "RATING", 		"attr_value": 4}
			]
		},
		{
			"item_key_value": "GVFC013",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "GVFC013"},
					{"attr_name": "BRAND",			"attr_value": "Graf von Faber-Castell"},
					{"attr_name": "RANGE",			"attr_value": "Standard"},
					{"attr_name": "INK_NAME", 		"attr_value": "Olive Green"},
					{"attr_name": "CONTAINER", 		"attr_value": "Cartridge"},
					{"attr_name": "CONTAINER_SIZE", "attr_value": "Short"},
					{"attr_name": "COLOUR", 		"attr_value": "Green"},
					{"attr_name": "QTY_REMAINING", 	"attr_value": 3},
					{"attr_name": "RATING", 		"attr_value": 3}
			]
		},
		{
			"item_key_value": "GVFC014",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "GVFC014"},
					{"attr_name": "BRAND",			"attr_value": "Graf von Faber-Castell"},
					{"attr_name": "RANGE",			"attr_value": "Standard"},
					{"attr_name": "INK_NAME", 		"attr_value": "India Red"},
					{"attr_name": "CONTAINER", 		"attr_value": "Cartridge"},
					{"attr_name": "CONTAINER_SIZE", "attr_value": "Short"},
					{"attr_name": "COLOUR", 		"attr_value": "Red"},
					{"attr_name": "QTY_REMAINING", 	"attr_value": 6},
					{"attr_name": "RATING", 		"attr_value": 4}
			]
		},
		{
			"item_key_value": "GVFC015",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "GVFC015"},
					{"attr_name": "BRAND",			"attr_value": "Graf von Faber-Castell"},
					{"attr_name": "RANGE",			"attr_value": "Standard"},
					{"attr_name": "INK_NAME", 		"attr_value": "Lapis Lazuli"},
					{"attr_name": "CONTAINER", 		"attr_value": "Cartridge"},
					{"attr_name": "CONTAINER_SIZE", "attr_value": "Short"},
					{"attr_name": "COLOUR", 		"attr_value": "Blue"},
					{"attr_name": "QTY_REMAINING", 	"attr_value": 6},
					{"attr_name": "RATING", 		"attr_value": 4}
			]
		}
	]
}]
';
select @json_data;

EXEC COLLECTION.c_collection_item @json_data,0,1
