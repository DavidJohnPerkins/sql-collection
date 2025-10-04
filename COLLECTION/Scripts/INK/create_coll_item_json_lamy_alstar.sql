USE Collections
GO

DECLARE	@json_data CORE.json

SET @json_data = N'
[{  
	"parent_collection": "PEN COLLECTION",
	"item":[
		{
			"item_key_value": "LAMY020",
			"item_attribute": [
				{"attr_name": "KEY_VALUE",			"attr_value": "LAMY020"},
				{"attr_name": "WRITING_TYPE",		"attr_value": "Fountain Pen"},
				{"attr_name": "BRAND",				"attr_value": "Lamy"},
				{"attr_name": "RANGE",				"attr_value": "AL-Star"},
				{"attr_name": "MODEL_NAME",			"attr_value": "AL-Star"},
				{"attr_name": "BODY_MATERIAL",		"attr_value": "Aluminium"},
				{"attr_name": "BODY_COLOUR", 		"attr_value": "Ocean Blue"},
				{"attr_name": "GRIP_MATERIAL",		"attr_value": "Clear Plastic"},
				{"attr_name": "GRIP_COLOUR",		"attr_value": "Grey"},
				{"attr_name": "CAP_MATERIAL",		"attr_value": "Aluminium"},
				{"attr_name": "CAP_COLOUR",			"attr_value": "Ocean Blue"},
				{"attr_name": "NIB_MATERIAL",		"attr_value": "Steel"},
				{"attr_name": "NIB_COLOUR",			"attr_value": "Chrome"},
				{"attr_name": "NIB_SIZE", 			"attr_value": "Medium"},
				{"attr_name": "PURCHASE_PRICE", 	"attr_value": 21},
				{"attr_name": "REPLACEMENT_PRICE",	"attr_value": 30},
				{"attr_name": "RATING", 			"attr_value": 4}
			],
			"item_comment": [
				{"comment":     "Chrome Clip"},
				{"comment":     "Very Good Condition"}
			]
		},
		{
			"item_key_value": "LAMY021",
			"item_attribute": [
				{"attr_name": "KEY_VALUE",			"attr_value": "LAMY021"},
				{"attr_name": "WRITING_TYPE",		"attr_value": "Fountain Pen"},
				{"attr_name": "BRAND",				"attr_value": "Lamy"},
				{"attr_name": "RANGE",				"attr_value": "AL-Star"},
				{"attr_name": "MODEL_NAME",			"attr_value": "AL-Star"},
				{"attr_name": "BODY_MATERIAL",		"attr_value": "Aluminium"},
				{"attr_name": "BODY_COLOUR", 		"attr_value": "Pacific Blue"},
				{"attr_name": "GRIP_MATERIAL",		"attr_value": "Clear Plastic"},
				{"attr_name": "GRIP_COLOUR",		"attr_value": "Grey"},
				{"attr_name": "CAP_MATERIAL",		"attr_value": "Aluminium"},
				{"attr_name": "CAP_COLOUR",			"attr_value": "Pacific Blue"},
				{"attr_name": "NIB_MATERIAL",		"attr_value": "Steel"},
				{"attr_name": "NIB_COLOUR",			"attr_value": "Chrome"},
				{"attr_name": "NIB_SIZE", 			"attr_value": "Medium"},
				{"attr_name": "PURCHASE_PRICE", 	"attr_value": 21},
				{"attr_name": "REPLACEMENT_PRICE",	"attr_value": 30},
				{"attr_name": "RATING", 			"attr_value": 4}
			],
			"item_comment": [
				{"comment":     "Chrome Clip"},
				{"comment":     "Limited Edition"},
				{"comment":     "Very Good Condition"}
			]
		},
		{
			"item_key_value": "LAMY022",
			"item_attribute": [
				{"attr_name": "KEY_VALUE",			"attr_value": "LAMY022"},
				{"attr_name": "WRITING_TYPE",		"attr_value": "Fountain Pen"},
				{"attr_name": "BRAND",				"attr_value": "Lamy"},
				{"attr_name": "RANGE",				"attr_value": "AL-Star"},
				{"attr_name": "MODEL_NAME",			"attr_value": "AL-Star"},
				{"attr_name": "BODY_MATERIAL",		"attr_value": "Aluminium"},
				{"attr_name": "BODY_COLOUR", 		"attr_value": "Black"},
				{"attr_name": "GRIP_MATERIAL",		"attr_value": "Clear Plastic"},
				{"attr_name": "GRIP_COLOUR",		"attr_value": "Grey"},
				{"attr_name": "CAP_MATERIAL",		"attr_value": "Aluminium"},
				{"attr_name": "CAP_COLOUR",			"attr_value": "Black"},
				{"attr_name": "NIB_MATERIAL",		"attr_value": "Steel"},
				{"attr_name": "NIB_COLOUR",			"attr_value": "Black"},
				{"attr_name": "NIB_SIZE", 			"attr_value": "Medium"},
				{"attr_name": "PURCHASE_PRICE", 	"attr_value": 21},
				{"attr_name": "REPLACEMENT_PRICE",	"attr_value": 30},
				{"attr_name": "RATING", 			"attr_value": 4}
			],
			"item_comment": [
				{"comment":     "Black Clip"},
				{"comment":     "Limited Edition"},
				{"comment":     "Very Good Condition"}
			]
		},
		{
			"item_key_value": "LAMY023",
			"item_attribute": [
				{"attr_name": "KEY_VALUE",			"attr_value": "LAMY023"},
				{"attr_name": "WRITING_TYPE",		"attr_value": "Fountain Pen"},
				{"attr_name": "BRAND",				"attr_value": "Lamy"},
				{"attr_name": "RANGE",				"attr_value": "AL-Star"},
				{"attr_name": "MODEL_NAME",			"attr_value": "AL-Star"},
				{"attr_name": "BODY_MATERIAL",		"attr_value": "Aluminium"},
				{"attr_name": "BODY_COLOUR", 		"attr_value": "Neon Yellow"},
				{"attr_name": "GRIP_MATERIAL",		"attr_value": "Clear Plastic"},
				{"attr_name": "GRIP_COLOUR",		"attr_value": "Grey"},
				{"attr_name": "CAP_MATERIAL",		"attr_value": "Aluminium"},
				{"attr_name": "CAP_COLOUR",			"attr_value": "Neon Yellow"},
				{"attr_name": "NIB_MATERIAL",		"attr_value": "Steel"},
				{"attr_name": "NIB_COLOUR",			"attr_value": "Chrome"},
				{"attr_name": "NIB_SIZE", 			"attr_value": "Medium"},
				{"attr_name": "PURCHASE_PRICE", 	"attr_value": 21},
				{"attr_name": "REPLACEMENT_PRICE",	"attr_value": 30},
				{"attr_name": "RATING", 			"attr_value": 4}
			],
			"item_comment": [
				{"comment":     "Chrome Clip"},
				{"comment":     "Limited Edition"},
				{"comment":     "Slight Marking"}
			]
		},
		{
			"item_key_value": "LAMY024",
			"item_attribute": [
				{"attr_name": "KEY_VALUE",			"attr_value": "LAMY024"},
				{"attr_name": "WRITING_TYPE",		"attr_value": "Fountain Pen"},
				{"attr_name": "BRAND",				"attr_value": "Lamy"},
				{"attr_name": "RANGE",				"attr_value": "AL-Star"},
				{"attr_name": "MODEL_NAME",			"attr_value": "AL-Star"},
				{"attr_name": "BODY_MATERIAL",		"attr_value": "Aluminium"},
				{"attr_name": "BODY_COLOUR", 		"attr_value": "Dark Purple"},
				{"attr_name": "GRIP_MATERIAL",		"attr_value": "Clear Plastic"},
				{"attr_name": "GRIP_COLOUR",		"attr_value": "Grey"},
				{"attr_name": "CAP_MATERIAL",		"attr_value": "Aluminium"},
				{"attr_name": "CAP_COLOUR",			"attr_value": "Dark Purple"},
				{"attr_name": "NIB_MATERIAL",		"attr_value": "Steel"},
				{"attr_name": "NIB_COLOUR",			"attr_value": "Chrome"},
				{"attr_name": "NIB_SIZE", 			"attr_value": "Medium"},
				{"attr_name": "PURCHASE_PRICE", 	"attr_value": 21},
				{"attr_name": "REPLACEMENT_PRICE",	"attr_value": 30},
				{"attr_name": "RATING", 			"attr_value": 4}
			],
			"item_comment": [
				{"comment":     "Chrome Clip"},
				{"comment":     "Very Good Condition"}
			]
		},
		{
			"item_key_value": "LAMY025",
			"item_attribute": [
				{"attr_name": "KEY_VALUE",			"attr_value": "LAMY025"},
				{"attr_name": "WRITING_TYPE",		"attr_value": "Fountain Pen"},
				{"attr_name": "BRAND",				"attr_value": "Lamy"},
				{"attr_name": "RANGE",				"attr_value": "AL-Star"},
				{"attr_name": "MODEL_NAME",			"attr_value": "AL-Star"},
				{"attr_name": "BODY_MATERIAL",		"attr_value": "Aluminium"},
				{"attr_name": "BODY_COLOUR", 		"attr_value": "Copper Orange"},
				{"attr_name": "GRIP_MATERIAL",		"attr_value": "Clear Plastic"},
				{"attr_name": "GRIP_COLOUR",		"attr_value": "Grey"},
				{"attr_name": "CAP_MATERIAL",		"attr_value": "Aluminium"},
				{"attr_name": "CAP_COLOUR",			"attr_value": "Copper Orange"},
				{"attr_name": "NIB_MATERIAL",		"attr_value": "Steel"},
				{"attr_name": "NIB_COLOUR",			"attr_value": "Chrome"},
				{"attr_name": "NIB_SIZE", 			"attr_value": "Medium"},
				{"attr_name": "PURCHASE_PRICE", 	"attr_value": 21},
				{"attr_name": "REPLACEMENT_PRICE",	"attr_value": 30},
				{"attr_name": "RATING", 			"attr_value": 4}
			],
			"item_comment": [
				{"comment":     "Chrome Clip"},
				{"comment":     "Limited Edition"},
				{"comment":     "Very Good Condition"}
			]
		},
		{
			"item_key_value": "LAMY026",
			"item_attribute": [
				{"attr_name": "KEY_VALUE",			"attr_value": "LAMY026"},
				{"attr_name": "WRITING_TYPE",		"attr_value": "Fountain Pen"},
				{"attr_name": "BRAND",				"attr_value": "Lamy"},
				{"attr_name": "RANGE",				"attr_value": "AL-Star"},
				{"attr_name": "MODEL_NAME",			"attr_value": "AL-Star"},
				{"attr_name": "BODY_MATERIAL",		"attr_value": "Aluminium"},
				{"attr_name": "BODY_COLOUR", 		"attr_value": "Ruby Red"},
				{"attr_name": "GRIP_MATERIAL",		"attr_value": "Clear Plastic"},
				{"attr_name": "GRIP_COLOUR",		"attr_value": "Grey"},
				{"attr_name": "CAP_MATERIAL",		"attr_value": "Aluminium"},
				{"attr_name": "CAP_COLOUR",			"attr_value": "Ruby Red"},
				{"attr_name": "NIB_MATERIAL",		"attr_value": "Steel"},
				{"attr_name": "NIB_COLOUR",			"attr_value": "Chrome"},
				{"attr_name": "NIB_SIZE", 			"attr_value": "Medium"},
				{"attr_name": "PURCHASE_PRICE", 	"attr_value": 21},
				{"attr_name": "REPLACEMENT_PRICE",	"attr_value": 30},
				{"attr_name": "RATING", 			"attr_value": 4}
			],
			"item_comment": [
				{"comment":     "Chrome Clip"},
				{"comment":     "Limited Edition"},
				{"comment":     "Very Good Condition"}
			]
		},
		{
			"item_key_value": "LAMY027",
			"item_attribute": [
				{"attr_name": "KEY_VALUE",			"attr_value": "LAMY027"},
				{"attr_name": "WRITING_TYPE",		"attr_value": "Fountain Pen"},
				{"attr_name": "BRAND",				"attr_value": "Lamy"},
				{"attr_name": "RANGE",				"attr_value": "AL-Star"},
				{"attr_name": "MODEL_NAME",			"attr_value": "AL-Star"},
				{"attr_name": "BODY_MATERIAL",		"attr_value": "Aluminium"},
				{"attr_name": "BODY_COLOUR", 		"attr_value": "Light Purple"},
				{"attr_name": "GRIP_MATERIAL",		"attr_value": "Clear Plastic"},
				{"attr_name": "GRIP_COLOUR",		"attr_value": "Grey"},
				{"attr_name": "CAP_MATERIAL",		"attr_value": "Aluminium"},
				{"attr_name": "CAP_COLOUR",			"attr_value": "Light Purple"},
				{"attr_name": "NIB_MATERIAL",		"attr_value": "Steel"},
				{"attr_name": "NIB_COLOUR",			"attr_value": "Chrome"},
				{"attr_name": "NIB_SIZE", 			"attr_value": "Medium"},
				{"attr_name": "PURCHASE_PRICE", 	"attr_value": 21},
				{"attr_name": "REPLACEMENT_PRICE",	"attr_value": 30},
				{"attr_name": "RATING", 			"attr_value": 4}
			],
			"item_comment": [
				{"comment":     "Chrome Clip"},
				{"comment":     "Limited Edition"},
				{"comment":     "Very Good Condition"}
			]
		},
		{
			"item_key_value": "LAMY028",
			"item_attribute": [
				{"attr_name": "KEY_VALUE",			"attr_value": "LAMY028"},
				{"attr_name": "WRITING_TYPE",		"attr_value": "Fountain Pen"},
				{"attr_name": "BRAND",				"attr_value": "Lamy"},
				{"attr_name": "RANGE",				"attr_value": "AL-Star"},
				{"attr_name": "MODEL_NAME",			"attr_value": "AL-Star"},
				{"attr_name": "BODY_MATERIAL",		"attr_value": "Aluminium"},
				{"attr_name": "BODY_COLOUR", 		"attr_value": "BlueGreen"},
				{"attr_name": "GRIP_MATERIAL",		"attr_value": "Clear Plastic"},
				{"attr_name": "GRIP_COLOUR",		"attr_value": "Grey"},
				{"attr_name": "CAP_MATERIAL",		"attr_value": "Aluminium"},
				{"attr_name": "CAP_COLOUR",			"attr_value": "BlueGreen"},
				{"attr_name": "NIB_MATERIAL",		"attr_value": "Steel"},
				{"attr_name": "NIB_COLOUR",			"attr_value": "Chrome"},
				{"attr_name": "NIB_SIZE", 			"attr_value": "Medium"},
				{"attr_name": "PURCHASE_PRICE", 	"attr_value": 21},
				{"attr_name": "REPLACEMENT_PRICE",	"attr_value": 30},
				{"attr_name": "RATING", 			"attr_value": 4}
			],
			"item_comment": [
				{"comment":     "Chrome Clip"},
				{"comment":     "Limited Edition"},
				{"comment":     "Very Good Condition"}
			]
		},
		{
			"item_key_value": "LAMY029",
			"item_attribute": [
				{"attr_name": "KEY_VALUE",			"attr_value": "LAMY029"},
				{"attr_name": "WRITING_TYPE",		"attr_value": "Fountain Pen"},
				{"attr_name": "BRAND",				"attr_value": "Lamy"},
				{"attr_name": "RANGE",				"attr_value": "AL-Star"},
				{"attr_name": "MODEL_NAME",			"attr_value": "AL-Star"},
				{"attr_name": "BODY_MATERIAL",		"attr_value": "Aluminium"},
				{"attr_name": "BODY_COLOUR", 		"attr_value": "Light Green"},
				{"attr_name": "GRIP_MATERIAL",		"attr_value": "Clear Plastic"},
				{"attr_name": "GRIP_COLOUR",		"attr_value": "Grey"},
				{"attr_name": "CAP_MATERIAL",		"attr_value": "Aluminium"},
				{"attr_name": "CAP_COLOUR",			"attr_value": "Light Green"},
				{"attr_name": "NIB_MATERIAL",		"attr_value": "Steel"},
				{"attr_name": "NIB_COLOUR",			"attr_value": "Chrome"},
				{"attr_name": "NIB_SIZE", 			"attr_value": "Medium"},
				{"attr_name": "PURCHASE_PRICE", 	"attr_value": 21},
				{"attr_name": "REPLACEMENT_PRICE",	"attr_value": 30},
				{"attr_name": "RATING", 			"attr_value": 4}
			],
			"item_comment": [
				{"comment":     "Chrome Clip"},
				{"comment":     "Limited Edition"},
				{"comment":     "Very Good Condition"}
			]
		},
		{
			"item_key_value": "LAMY030",
			"item_attribute": [
				{"attr_name": "KEY_VALUE",			"attr_value": "LAMY030"},
				{"attr_name": "WRITING_TYPE",		"attr_value": "Fountain Pen"},
				{"attr_name": "BRAND",				"attr_value": "Lamy"},
				{"attr_name": "RANGE",				"attr_value": "AL-Star"},
				{"attr_name": "MODEL_NAME",			"attr_value": "AL-Star"},
				{"attr_name": "BODY_MATERIAL",		"attr_value": "Aluminium"},
				{"attr_name": "BODY_COLOUR", 		"attr_value": "Silver"},
				{"attr_name": "GRIP_MATERIAL",		"attr_value": "Clear Plastic"},
				{"attr_name": "GRIP_COLOUR",		"attr_value": "Grey"},
				{"attr_name": "CAP_MATERIAL",		"attr_value": "Aluminium"},
				{"attr_name": "CAP_COLOUR",			"attr_value": "Silver"},
				{"attr_name": "NIB_MATERIAL",		"attr_value": "Steel"},
				{"attr_name": "NIB_COLOUR",			"attr_value": "Chrome"},
				{"attr_name": "NIB_SIZE", 			"attr_value": "Medium"},
				{"attr_name": "PURCHASE_PRICE", 	"attr_value": 21},
				{"attr_name": "REPLACEMENT_PRICE",	"attr_value": 30},
				{"attr_name": "RATING", 			"attr_value": 4}
			],
			"item_comment": [
				{"comment":     "Black Clip"},
				{"comment":     "Very Good Condition"}
			]
		},
		{
			"item_key_value": "LAMY031",
			"item_attribute": [
				{"attr_name": "KEY_VALUE",			"attr_value": "LAMY031"},
				{"attr_name": "WRITING_TYPE",		"attr_value": "Fountain Pen"},
				{"attr_name": "BRAND",				"attr_value": "Lamy"},
				{"attr_name": "RANGE",				"attr_value": "AL-Star"},
				{"attr_name": "MODEL_NAME",			"attr_value": "AL-Star"},
				{"attr_name": "BODY_MATERIAL",		"attr_value": "Aluminium"},
				{"attr_name": "BODY_COLOUR", 		"attr_value": "Pink Silver"},
				{"attr_name": "GRIP_MATERIAL",		"attr_value": "Clear Plastic"},
				{"attr_name": "GRIP_COLOUR",		"attr_value": "Grey"},
				{"attr_name": "CAP_MATERIAL",		"attr_value": "Aluminium"},
				{"attr_name": "CAP_COLOUR",			"attr_value": "Pink Silver"},
				{"attr_name": "NIB_MATERIAL",		"attr_value": "Steel"},
				{"attr_name": "NIB_COLOUR",			"attr_value": "Chrome"},
				{"attr_name": "NIB_SIZE", 			"attr_value": "Medium"},
				{"attr_name": "PURCHASE_PRICE", 	"attr_value": 21},
				{"attr_name": "REPLACEMENT_PRICE",	"attr_value": 30},
				{"attr_name": "RATING", 			"attr_value": 4}
			],
			"item_comment": [
				{"comment":     "Chrome Clip"},
				{"comment":     "Limited Edition"},
				{"comment":     "Good Condition"}
			]
		},
		{
			"item_key_value": "LAMY032",
			"item_attribute": [
				{"attr_name": "KEY_VALUE",			"attr_value": "LAMY032"},
				{"attr_name": "WRITING_TYPE",		"attr_value": "Fountain Pen"},
				{"attr_name": "BRAND",				"attr_value": "Lamy"},
				{"attr_name": "RANGE",				"attr_value": "AL-Star"},
				{"attr_name": "MODEL_NAME",			"attr_value": "AL-Star"},
				{"attr_name": "BODY_MATERIAL",		"attr_value": "Aluminium"},
				{"attr_name": "BODY_COLOUR", 		"attr_value": "Grey"},
				{"attr_name": "GRIP_MATERIAL",		"attr_value": "Clear Plastic"},
				{"attr_name": "GRIP_COLOUR",		"attr_value": "Grey"},
				{"attr_name": "CAP_MATERIAL",		"attr_value": "Aluminium"},
				{"attr_name": "CAP_COLOUR",			"attr_value": "Grey"},
				{"attr_name": "NIB_MATERIAL",		"attr_value": "Steel"},
				{"attr_name": "NIB_COLOUR",			"attr_value": "Chrome"},
				{"attr_name": "NIB_SIZE", 			"attr_value": "Medium"},
				{"attr_name": "PURCHASE_PRICE", 	"attr_value": 21},
				{"attr_name": "REPLACEMENT_PRICE",	"attr_value": 30},
				{"attr_name": "RATING", 			"attr_value": 4}
			],
			"item_comment": [
				{"comment":     "Chrome Clip"},
				{"comment":     "Limited Edition"},
				{"comment":     "Good Condition"}
			]
		}
	]
}]
';

--select @json_data;
EXEC COLLECTION.c_collection_item @json_data, 0, 1
