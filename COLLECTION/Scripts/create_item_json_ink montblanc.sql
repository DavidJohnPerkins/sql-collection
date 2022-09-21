USE Collections
GO

DECLARE	@json_data CORE.json

SET @json_data = N'
[{  
    "parent_collection": "INK COLLECTION",
    "item":[
		{
			"item_key_value": "MB018",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "MB018"},
					{"attr_name": "BRAND",			"attr_value": "Mont Blanc"},
					{"attr_name": "RANGE",			"attr_value": "Writers Edition"},
					{"attr_name": "INK_NAME", 		"attr_value": "Jonathan Swift"},
					{"attr_name": "CONTAINER", 		"attr_value": "Bottle"},
					{"attr_name": "CONTAINER_SIZE", "attr_value": "30ml"},
					{"attr_name": "COLOUR", 		"attr_value": "Green Khaki"},
					{"attr_name": "QTY_REMAINING", 	"attr_value": 29},
					{"attr_name": "RATING", 		"attr_value": 4}
			]
		},
		{
			"item_key_value": "MB019",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "MB019"},
					{"attr_name": "BRAND",			"attr_value": "Mont Blanc"},
					{"attr_name": "RANGE",			"attr_value": "Writers Edition"},
					{"attr_name": "INK_NAME", 		"attr_value": "Leo Tolstoy"},
					{"attr_name": "CONTAINER", 		"attr_value": "Bottle"},
					{"attr_name": "CONTAINER_SIZE", "attr_value": "30ml"},
					{"attr_name": "COLOUR", 		"attr_value": "Blue"},
					{"attr_name": "QTY_REMAINING", 	"attr_value": 28},
					{"attr_name": "RATING", 		"attr_value": 4}
			]
		},
		{
			"item_key_value": "MB020",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "MB020"},
					{"attr_name": "BRAND",			"attr_value": "Mont Blanc"},
					{"attr_name": "RANGE",			"attr_value": "Writers Edition"},
					{"attr_name": "INK_NAME", 		"attr_value": "William Shakespeare"},
					{"attr_name": "CONTAINER", 		"attr_value": "Bottle"},
					{"attr_name": "CONTAINER_SIZE", "attr_value": "30ml"},
					{"attr_name": "COLOUR", 		"attr_value": "Red"},
					{"attr_name": "QTY_REMAINING", 	"attr_value": 29},
					{"attr_name": "RATING", 		"attr_value": 3}
			]
		},
		{
			"item_key_value": "MB021",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "MB021"},
					{"attr_name": "BRAND",			"attr_value": "Mont Blanc"},
					{"attr_name": "RANGE",			"attr_value": "Writers Edition"},
					{"attr_name": "INK_NAME", 		"attr_value": "Honoré de Balzac"},
					{"attr_name": "CONTAINER", 		"attr_value": "Bottle"},
					{"attr_name": "CONTAINER_SIZE", "attr_value": "30ml"},
					{"attr_name": "COLOUR", 		"attr_value": "Turquoise"},
					{"attr_name": "QTY_REMAINING", 	"attr_value": 27},
					{"attr_name": "RATING", 		"attr_value": 4}
			]
		},
		{
			"item_key_value": "MB022",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "MB022"},
					{"attr_name": "BRAND",			"attr_value": "Mont Blanc"},
					{"attr_name": "RANGE",			"attr_value": "Writers Edition"},
					{"attr_name": "INK_NAME", 		"attr_value": "Daniel Defoe"},
					{"attr_name": "CONTAINER", 		"attr_value": "Bottle"},
					{"attr_name": "CONTAINER_SIZE", "attr_value": "30ml"},
					{"attr_name": "COLOUR", 		"attr_value": "Green"},
					{"attr_name": "QTY_REMAINING", 	"attr_value": 28},
					{"attr_name": "RATING", 		"attr_value": 4}
			]
		},
		{
			"item_key_value": "MB023",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "MB023"},
					{"attr_name": "BRAND",			"attr_value": "Mont Blanc"},
					{"attr_name": "RANGE",			"attr_value": "Character Edition"},
					{"attr_name": "INK_NAME", 		"attr_value": "Alfred Hitchcock"},
					{"attr_name": "CONTAINER", 		"attr_value": "Bottle"},
					{"attr_name": "CONTAINER_SIZE", "attr_value": "30ml"},
					{"attr_name": "COLOUR", 		"attr_value": "Red"},
					{"attr_name": "QTY_REMAINING", 	"attr_value": 22},
					{"attr_name": "RATING", 		"attr_value": 4}
			]
		},
		{
			"item_key_value": "MB024",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "MB024"},
					{"attr_name": "BRAND",			"attr_value": "Mont Blanc"},
					{"attr_name": "RANGE",			"attr_value": "Character Edition"},
					{"attr_name": "INK_NAME", 		"attr_value": "Miles Davis Jazz Blue"},
					{"attr_name": "CONTAINER", 		"attr_value": "Bottle"},
					{"attr_name": "CONTAINER_SIZE", "attr_value": "30ml"},
					{"attr_name": "COLOUR", 		"attr_value": "Blue"},
					{"attr_name": "QTY_REMAINING", 	"attr_value": 26},
					{"attr_name": "RATING", 		"attr_value": 3}
			]
		},
		{
			"item_key_value": "MB025",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "MB025"},
					{"attr_name": "BRAND",			"attr_value": "Mont Blanc"},
					{"attr_name": "RANGE",			"attr_value": "Meisterstück"},
					{"attr_name": "INK_NAME", 		"attr_value": "Meisterstück 90 Years"},
					{"attr_name": "CONTAINER", 		"attr_value": "Bottle"},
					{"attr_name": "CONTAINER_SIZE", "attr_value": "30ml"},
					{"attr_name": "COLOUR", 		"attr_value": "Grey"},
					{"attr_name": "QTY_REMAINING", 	"attr_value": 27},
					{"attr_name": "RATING", 		"attr_value": 3}
			]
		}
	]
}]
';
--select @json_data;
EXEC COLLECTION.cu_collection_item_json @json_data,0,1
