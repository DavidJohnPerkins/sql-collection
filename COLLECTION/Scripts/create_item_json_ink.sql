USE Collections
GO

DECLARE @insert CORE.item_list,
		@json_data CORE.json

SET @json_data = N'
[{  
    "parent_collection": "INK COLLECTION",
    "item":[
		{
			"item_key": "MB002",
			"item_attribute": [
					{"attr_name": "BRAND",			"attr_value": "Mont Blanc"},
					{"attr_name": "RANGE",			"attr_value": "Standard 70ml"},
					{"attr_name": "INK_NAME", 		"attr_value": "Lavender Purple"},
					{"attr_name": "CONTAINER", 		"attr_value": "Bottle"},
					{"attr_name": "CONTAINER_SIZE", "attr_value": "70ml"},
					{"attr_name": "COLOUR", 		"attr_value": "Purple"},
					{"attr_name": "QTY_REMAINING", 	"attr_value": 63},
					{"attr_name": "RATING", 		"attr_value": 4}
			]
		},
			"item_key": "MB003",
			"item_attribute": [
					{"attr_name": "BRAND",			"attr_value": "Mont Blanc"},
					{"attr_name": "RANGE",			"attr_value": "Standard 70ml"},
					{"attr_name": "INK_NAME", 		"attr_value": "Burgundy Red"},
					{"attr_name": "CONTAINER", 		"attr_value": "Bottle"},
					{"attr_name": "CONTAINER_SIZE", "attr_value": "70ml"},
					{"attr_name": "COLOUR", 		"attr_value": "Red"},
					{"attr_name": "QTY_REMAINING", 	"attr_value": 40},
					{"attr_name": "RATING", 		"attr_value": 4}
			]
		},
			"item_key": "MB004",
			"item_attribute": [
					{"attr_name": "BRAND",			"attr_value": "Mont Blanc"},
					{"attr_name": "RANGE",			"attr_value": "Standard 70ml"},
					{"attr_name": "INK_NAME", 		"attr_value": "Oyster Grey"},
					{"attr_name": "CONTAINER", 		"attr_value": "Bottle"},
					{"attr_name": "CONTAINER_SIZE", "attr_value": "70ml"},
					{"attr_name": "COLOUR", 		"attr_value": "Grey"},
					{"attr_name": "QTY_REMAINING", 	"attr_value": 68},
					{"attr_name": "RATING", 		"attr_value": 3}
			]
		},
			"item_key": "MB005",
			"item_attribute": [
					{"attr_name": "BRAND",			"attr_value": "Mont Blanc"},
					{"attr_name": "RANGE",			"attr_value": "Standard 70ml"},
					{"attr_name": "INK_NAME", 		"attr_value": "Mystery Black"},
					{"attr_name": "CONTAINER", 		"attr_value": "Bottle"},
					{"attr_name": "CONTAINER_SIZE", "attr_value": "70ml"},
					{"attr_name": "COLOUR", 		"attr_value": "Black"},
					{"attr_name": "QTY_REMAINING", 	"attr_value": 63},
					{"attr_name": "RATING", 		"attr_value": 3}
			]
		}
	]
}]
';

EXEC COLLECTION.cu_collection_item_json @json_data
