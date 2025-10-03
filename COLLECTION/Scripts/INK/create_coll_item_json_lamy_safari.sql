USE Collections
GO

DECLARE	@json_data CORE.json

SET @json_data = N'
[{  
	"parent_collection": "PEN COLLECTION",
	"item":[
		{
			"item_key_value": "LAMY004",
			"item_attribute": [
				{"attr_name": "KEY_VALUE",			"attr_value": "LAMY004"},
				{"attr_name": "WRITING_TYPE",		"attr_value": "Fountain Pen"},
				{"attr_name": "BRAND",				"attr_value": "Lamy"},
				{"attr_name": "RANGE",				"attr_value": "Safari"},
				{"attr_name": "MODEL_NAME",			"attr_value": "Safari"},
				{"attr_name": "BODY_MATERIAL",		"attr_value": "Plastic"},
				{"attr_name": "BODY_COLOUR", 		"attr_value": "Red"},
				{"attr_name": "GRIP_MATERIAL",		"attr_value": "Plastic"},
				{"attr_name": "GRIP_COLOUR",		"attr_value": "Red"},
				{"attr_name": "CAP_MATERIAL",		"attr_value": "Plastic"},
				{"attr_name": "CAP_COLOUR",			"attr_value": "Red"},
				{"attr_name": "NIB_MATERIAL",		"attr_value": "Steel"},
				{"attr_name": "NIB_COLOUR",			"attr_value": "Chrome"},
				{"attr_name": "NIB_SIZE", 			"attr_value": "Medium"},
				{"attr_name": "PURCHASE_PRICE", 	"attr_value": 15},
				{"attr_name": "REPLACEMENT_PRICE",	"attr_value": 21},
				{"attr_name": "RATING", 			"attr_value": 4}
			],
			"item_comment": [
				{"comment":     "Chrome Clip"},
				{"comment":     "Very Good Condition"}
			]
		},
		{
			"item_key_value": "LAMY005",
			"item_attribute": [
				{"attr_name": "KEY_VALUE",			"attr_value": "LAMY005"},
				{"attr_name": "WRITING_TYPE",		"attr_value": "Fountain Pen"},
				{"attr_name": "BRAND",				"attr_value": "Lamy"},
				{"attr_name": "RANGE",				"attr_value": "Safari"},
				{"attr_name": "MODEL_NAME",			"attr_value": "Safari"},
				{"attr_name": "BODY_MATERIAL",		"attr_value": "Plastic"},
				{"attr_name": "BODY_COLOUR", 		"attr_value": "Acid Green"},
				{"attr_name": "GRIP_MATERIAL",		"attr_value": "Plastic"},
				{"attr_name": "GRIP_COLOUR",		"attr_value": "Acid Green"},
				{"attr_name": "CAP_MATERIAL",		"attr_value": "Plastic"},
				{"attr_name": "CAP_COLOUR",			"attr_value": "Acid Green"},
				{"attr_name": "NIB_MATERIAL",		"attr_value": "Steel"},
				{"attr_name": "NIB_COLOUR",			"attr_value": "Chrome"},
				{"attr_name": "NIB_SIZE", 			"attr_value": "Medium"},
				{"attr_name": "PURCHASE_PRICE", 	"attr_value": 15},
				{"attr_name": "REPLACEMENT_PRICE",	"attr_value": 21},
				{"attr_name": "RATING", 			"attr_value": 4}
			],
			"item_comment": [
				{"comment":     "Chrome Clip"},
				{"comment":     "Limited Edition"},
				{"comment":     "Very Good Condition"}
			]
		},
		{
			"item_key_value": "LAMY006",
			"item_attribute": [
				{"attr_name": "KEY_VALUE",			"attr_value": "LAMY006"},
				{"attr_name": "WRITING_TYPE",		"attr_value": "Fountain Pen"},
				{"attr_name": "BRAND",				"attr_value": "Lamy"},
				{"attr_name": "RANGE",				"attr_value": "Safari"},
				{"attr_name": "MODEL_NAME",			"attr_value": "Safari"},
				{"attr_name": "BODY_MATERIAL",		"attr_value": "Plastic"},
				{"attr_name": "BODY_COLOUR", 		"attr_value": "Yellow"},
				{"attr_name": "GRIP_MATERIAL",		"attr_value": "Plastic"},
				{"attr_name": "GRIP_COLOUR",		"attr_value": "Yellow"},
				{"attr_name": "CAP_MATERIAL",		"attr_value": "Plastic"},
				{"attr_name": "CAP_COLOUR",			"attr_value": "Yellow"},
				{"attr_name": "NIB_MATERIAL",		"attr_value": "Steel"},
				{"attr_name": "NIB_COLOUR",			"attr_value": "Chrome"},
				{"attr_name": "NIB_SIZE", 			"attr_value": "Medium"},
				{"attr_name": "PURCHASE_PRICE", 	"attr_value": 15},
				{"attr_name": "REPLACEMENT_PRICE",	"attr_value": 21},
				{"attr_name": "RATING", 			"attr_value": 4}
			],
			"item_comment": [
				{"comment":     "Chrome Clip"},
				{"comment":     "Very Good Condition"}
			]
		},
		{
			"item_key_value": "LAMY007",
			"item_attribute": [
				{"attr_name": "KEY_VALUE",			"attr_value": "LAMY007"},
				{"attr_name": "WRITING_TYPE",		"attr_value": "Fountain Pen"},
				{"attr_name": "BRAND",				"attr_value": "Lamy"},
				{"attr_name": "RANGE",				"attr_value": "Safari"},
				{"attr_name": "MODEL_NAME",			"attr_value": "Safari"},
				{"attr_name": "BODY_MATERIAL",		"attr_value": "Plastic"},
				{"attr_name": "BODY_COLOUR", 		"attr_value": "Blue"},
				{"attr_name": "GRIP_MATERIAL",		"attr_value": "Plastic"},
				{"attr_name": "GRIP_COLOUR",		"attr_value": "Blue"},
				{"attr_name": "CAP_MATERIAL",		"attr_value": "Plastic"},
				{"attr_name": "CAP_COLOUR",			"attr_value": "Blue"},
				{"attr_name": "NIB_MATERIAL",		"attr_value": "Steel"},
				{"attr_name": "NIB_COLOUR",			"attr_value": "Chrome"},
				{"attr_name": "NIB_SIZE", 			"attr_value": "Medium"},
				{"attr_name": "PURCHASE_PRICE", 	"attr_value": 15},
				{"attr_name": "REPLACEMENT_PRICE",	"attr_value": 21},
				{"attr_name": "RATING", 			"attr_value": 4}
			],
			"item_comment": [
				{"comment":     "Chrome Clip"},
				{"comment":     "Very Good Condition"}
			]
		},
		{
			"item_key_value": "LAMY008",
			"item_attribute": [
				{"attr_name": "KEY_VALUE",			"attr_value": "LAMY008"},
				{"attr_name": "WRITING_TYPE",		"attr_value": "Fountain Pen"},
				{"attr_name": "BRAND",				"attr_value": "Lamy"},
				{"attr_name": "RANGE",				"attr_value": "Safari"},
				{"attr_name": "MODEL_NAME",			"attr_value": "Safari"},
				{"attr_name": "BODY_MATERIAL",		"attr_value": "Plastic"},
				{"attr_name": "BODY_COLOUR", 		"attr_value": "Turquoise Blue"},
				{"attr_name": "GRIP_MATERIAL",		"attr_value": "Plastic"},
				{"attr_name": "GRIP_COLOUR",		"attr_value": "Turquoise Blue"},
				{"attr_name": "CAP_MATERIAL",		"attr_value": "Plastic"},
				{"attr_name": "CAP_COLOUR",			"attr_value": "Turquoise Blue"},
				{"attr_name": "NIB_MATERIAL",		"attr_value": "Steel"},
				{"attr_name": "NIB_COLOUR",			"attr_value": "Chrome"},
				{"attr_name": "NIB_SIZE", 			"attr_value": "Medium"},
				{"attr_name": "PURCHASE_PRICE", 	"attr_value": 15},
				{"attr_name": "REPLACEMENT_PRICE",	"attr_value": 21},
				{"attr_name": "RATING", 			"attr_value": 4}
			],
			"item_comment": [
				{"comment":     "Chrome Clip"},
				{"comment":     "Limited Edition"},
				{"comment":     "Very Good Condition"}
			]
		},
		{
			"item_key_value": "LAMY009",
			"item_attribute": [
				{"attr_name": "KEY_VALUE",			"attr_value": "LAMY009"},
				{"attr_name": "WRITING_TYPE",		"attr_value": "Fountain Pen"},
				{"attr_name": "BRAND",				"attr_value": "Lamy"},
				{"attr_name": "RANGE",				"attr_value": "Safari"},
				{"attr_name": "MODEL_NAME",			"attr_value": "Safari"},
				{"attr_name": "BODY_MATERIAL",		"attr_value": "Plastic"},
				{"attr_name": "BODY_COLOUR", 		"attr_value": "Lime Green"},
				{"attr_name": "GRIP_MATERIAL",		"attr_value": "Plastic"},
				{"attr_name": "GRIP_COLOUR",		"attr_value": "Lime Green"},
				{"attr_name": "CAP_MATERIAL",		"attr_value": "Plastic"},
				{"attr_name": "CAP_COLOUR",			"attr_value": "Lime Green"},
				{"attr_name": "NIB_MATERIAL",		"attr_value": "Steel"},
				{"attr_name": "NIB_COLOUR",			"attr_value": "Chrome"},
				{"attr_name": "NIB_SIZE", 			"attr_value": "Medium"},
				{"attr_name": "PURCHASE_PRICE", 	"attr_value": 15},
				{"attr_name": "REPLACEMENT_PRICE",	"attr_value": 21},
				{"attr_name": "RATING", 			"attr_value": 4}
			],
			"item_comment": [
				{"comment":     "Chrome Clip"},
				{"comment":     "Limited Edition"},
				{"comment":     "Very Good Condition"}
			]
		},
		{
			"item_key_value": "LAMY010",
			"item_attribute": [
				{"attr_name": "KEY_VALUE",			"attr_value": "LAMY010"},
				{"attr_name": "WRITING_TYPE",		"attr_value": "Fountain Pen"},
				{"attr_name": "BRAND",				"attr_value": "Lamy"},
				{"attr_name": "RANGE",				"attr_value": "Safari"},
				{"attr_name": "MODEL_NAME",			"attr_value": "Safari"},
				{"attr_name": "BODY_MATERIAL",		"attr_value": "Plastic"},
				{"attr_name": "BODY_COLOUR", 		"attr_value": "Petrol Blue"},
				{"attr_name": "GRIP_MATERIAL",		"attr_value": "Plastic"},
				{"attr_name": "GRIP_COLOUR",		"attr_value": "Petrol Blue"},
				{"attr_name": "CAP_MATERIAL",		"attr_value": "Plastic"},
				{"attr_name": "CAP_COLOUR",			"attr_value": "Petrol Blue"},
				{"attr_name": "NIB_MATERIAL",		"attr_value": "Steel"},
				{"attr_name": "NIB_COLOUR",			"attr_value": "Black"},
				{"attr_name": "NIB_SIZE", 			"attr_value": "Medium"},
				{"attr_name": "PURCHASE_PRICE", 	"attr_value": 15},
				{"attr_name": "REPLACEMENT_PRICE",	"attr_value": 21},
				{"attr_name": "RATING", 			"attr_value": 4}
			],
			"item_comment": [
				{"comment":     "Black Clip"},
				{"comment":     "Limited Edition"},
				{"comment":     "Matt Finish"},
				{"comment":     "Very Good Condition"}
			]
		},
		{
			"item_key_value": "LAMY011",
			"item_attribute": [
				{"attr_name": "KEY_VALUE",			"attr_value": "LAMY011"},
				{"attr_name": "WRITING_TYPE",		"attr_value": "Fountain Pen"},
				{"attr_name": "BRAND",				"attr_value": "Lamy"},
				{"attr_name": "RANGE",				"attr_value": "Safari"},
				{"attr_name": "MODEL_NAME",			"attr_value": "Safari"},
				{"attr_name": "BODY_MATERIAL",		"attr_value": "Plastic"},
				{"attr_name": "BODY_COLOUR", 		"attr_value": "Coral Pink"},
				{"attr_name": "GRIP_MATERIAL",		"attr_value": "Plastic"},
				{"attr_name": "GRIP_COLOUR",		"attr_value": "Coral Pink"},
				{"attr_name": "CAP_MATERIAL",		"attr_value": "Plastic"},
				{"attr_name": "CAP_COLOUR",			"attr_value": "Coral Pink"},
				{"attr_name": "NIB_MATERIAL",		"attr_value": "Steel"},
				{"attr_name": "NIB_COLOUR",			"attr_value": "Chrome"},
				{"attr_name": "NIB_SIZE", 			"attr_value": "Medium"},
				{"attr_name": "PURCHASE_PRICE", 	"attr_value": 15},
				{"attr_name": "REPLACEMENT_PRICE",	"attr_value": 21},
				{"attr_name": "RATING", 			"attr_value": 4}
			],
			"item_comment": [
				{"comment":     "Chrome Clip"},
				{"comment":     "Limited Edition"},
				{"comment":     "Very Good Condition"}
			]
		},
		{
			"item_key_value": "LAMY012",
			"item_attribute": [
				{"attr_name": "KEY_VALUE",			"attr_value": "LAMY012"},
				{"attr_name": "WRITING_TYPE",		"attr_value": "Fountain Pen"},
				{"attr_name": "BRAND",				"attr_value": "Lamy"},
				{"attr_name": "RANGE",				"attr_value": "Safari"},
				{"attr_name": "MODEL_NAME",			"attr_value": "Safari"},
				{"attr_name": "BODY_MATERIAL",		"attr_value": "Plastic"},
				{"attr_name": "BODY_COLOUR", 		"attr_value": "Charcoal Grey"},
				{"attr_name": "GRIP_MATERIAL",		"attr_value": "Plastic"},
				{"attr_name": "GRIP_COLOUR",		"attr_value": "Charcoal Grey"},
				{"attr_name": "CAP_MATERIAL",		"attr_value": "Plastic"},
				{"attr_name": "CAP_COLOUR",			"attr_value": "Charcoal Grey"},
				{"attr_name": "NIB_MATERIAL",		"attr_value": "Steel"},
				{"attr_name": "NIB_COLOUR",			"attr_value": "Black"},
				{"attr_name": "NIB_SIZE", 			"attr_value": "Oblique Medium"},
				{"attr_name": "PURCHASE_PRICE", 	"attr_value": 15},
				{"attr_name": "REPLACEMENT_PRICE",	"attr_value": 21},
				{"attr_name": "RATING", 			"attr_value": 4}
			],
			"item_comment": [
				{"comment":     "Black Clip"},
				{"comment":     "Matt Finish"},
				{"comment":     "Worn smooth - heavy usage"}
			]
		},
		{
			"item_key_value": "LAMY013",
			"item_attribute": [
				{"attr_name": "KEY_VALUE",			"attr_value": "LAMY013"},
				{"attr_name": "WRITING_TYPE",		"attr_value": "Fountain Pen"},
				{"attr_name": "BRAND",				"attr_value": "Lamy"},
				{"attr_name": "RANGE",				"attr_value": "Safari"},
				{"attr_name": "MODEL_NAME",			"attr_value": "Safari"},
				{"attr_name": "BODY_MATERIAL",		"attr_value": "Plastic"},
				{"attr_name": "BODY_COLOUR", 		"attr_value": "Light Grey"},
				{"attr_name": "GRIP_MATERIAL",		"attr_value": "Plastic"},
				{"attr_name": "GRIP_COLOUR",		"attr_value": "Light Grey"},
				{"attr_name": "CAP_MATERIAL",		"attr_value": "Plastic"},
				{"attr_name": "CAP_COLOUR",			"attr_value": "Light Grey"},
				{"attr_name": "NIB_MATERIAL",		"attr_value": "Steel"},
				{"attr_name": "NIB_COLOUR",			"attr_value": "Chrome"},
				{"attr_name": "NIB_SIZE", 			"attr_value": "LH Medium"},
				{"attr_name": "PURCHASE_PRICE", 	"attr_value": 15},
				{"attr_name": "REPLACEMENT_PRICE",	"attr_value": 21},
				{"attr_name": "RATING", 			"attr_value": 4}
			],
			"item_comment": [
				{"comment":     "Black Clip"},
				{"comment":     "Limited Edition"},
				{"comment":     "Matt Finish"},
				{"comment":     "Very Good Condition"}
			]
		},
		{
			"item_key_value": "LAMY014",
			"item_attribute": [
				{"attr_name": "KEY_VALUE",			"attr_value": "LAMY014"},
				{"attr_name": "WRITING_TYPE",		"attr_value": "Fountain Pen"},
				{"attr_name": "BRAND",				"attr_value": "Lamy"},
				{"attr_name": "RANGE",				"attr_value": "Safari"},
				{"attr_name": "MODEL_NAME",			"attr_value": "Safari"},
				{"attr_name": "BODY_MATERIAL",		"attr_value": "Plastic"},
				{"attr_name": "BODY_COLOUR", 		"attr_value": "Lime Green"},
				{"attr_name": "GRIP_MATERIAL",		"attr_value": "Plastic"},
				{"attr_name": "GRIP_COLOUR",		"attr_value": "Lime Green"},
				{"attr_name": "CAP_MATERIAL",		"attr_value": "Plastic"},
				{"attr_name": "CAP_COLOUR",			"attr_value": "Lime Green"},
				{"attr_name": "NIB_MATERIAL",		"attr_value": "Steel"},
				{"attr_name": "NIB_COLOUR",			"attr_value": "Chrome"},
				{"attr_name": "NIB_SIZE", 			"attr_value": "Medium"},
				{"attr_name": "PURCHASE_PRICE", 	"attr_value": 15},
				{"attr_name": "REPLACEMENT_PRICE",	"attr_value": 21},
				{"attr_name": "RATING", 			"attr_value": 4}
			],
			"item_comment": [
				{"comment":     "Chrome Clip"},
				{"comment":     "Very Good Condition"}
			]
		},
		{
			"item_key_value": "LAMY015",
			"item_attribute": [
				{"attr_name": "KEY_VALUE",			"attr_value": "LAMY015"},
				{"attr_name": "WRITING_TYPE",		"attr_value": "Fountain Pen"},
				{"attr_name": "BRAND",				"attr_value": "Lamy"},
				{"attr_name": "RANGE",				"attr_value": "Safari"},
				{"attr_name": "MODEL_NAME",			"attr_value": "Safari"},
				{"attr_name": "BODY_MATERIAL",		"attr_value": "Plastic"},
				{"attr_name": "BODY_COLOUR", 		"attr_value": "Light Magenta"},
				{"attr_name": "GRIP_MATERIAL",		"attr_value": "Plastic"},
				{"attr_name": "GRIP_COLOUR",		"attr_value": "Light Magenta"},
				{"attr_name": "CAP_MATERIAL",		"attr_value": "Plastic"},
				{"attr_name": "CAP_COLOUR",			"attr_value": "Light Magenta"},
				{"attr_name": "NIB_MATERIAL",		"attr_value": "Steel"},
				{"attr_name": "NIB_COLOUR",			"attr_value": "Chrome"},
				{"attr_name": "NIB_SIZE", 			"attr_value": "Medium"},
				{"attr_name": "PURCHASE_PRICE", 	"attr_value": 15},
				{"attr_name": "REPLACEMENT_PRICE",	"attr_value": 21},
				{"attr_name": "RATING", 			"attr_value": 4}
			],
			"item_comment": [
				{"comment":     "Chrome Clip"},
				{"comment":     "Very Good Condition"}
			]
		},
		{
			"item_key_value": "LAMY016",
			"item_attribute": [
				{"attr_name": "KEY_VALUE",			"attr_value": "LAMY016"},
				{"attr_name": "WRITING_TYPE",		"attr_value": "Fountain Pen"},
				{"attr_name": "BRAND",				"attr_value": "Lamy"},
				{"attr_name": "RANGE",				"attr_value": "Safari"},
				{"attr_name": "MODEL_NAME",			"attr_value": "Safari"},
				{"attr_name": "BODY_MATERIAL",		"attr_value": "Plastic"},
				{"attr_name": "BODY_COLOUR", 		"attr_value": "White"},
				{"attr_name": "GRIP_MATERIAL",		"attr_value": "Plastic"},
				{"attr_name": "GRIP_COLOUR",		"attr_value": "White"},
				{"attr_name": "CAP_MATERIAL",		"attr_value": "Plastic"},
				{"attr_name": "CAP_COLOUR",			"attr_value": "White"},
				{"attr_name": "NIB_MATERIAL",		"attr_value": "Steel"},
				{"attr_name": "NIB_COLOUR",			"attr_value": "Chrome"},
				{"attr_name": "NIB_SIZE", 			"attr_value": "Medium"},
				{"attr_name": "PURCHASE_PRICE", 	"attr_value": 15},
				{"attr_name": "REPLACEMENT_PRICE",	"attr_value": 21},
				{"attr_name": "RATING", 			"attr_value": 4}
			],
			"item_comment": [
				{"comment":     "Chrome Clip"},
				{"comment":     "Very Good Condition"}
			]
		},
		{
			"item_key_value": "LAMY017",
			"item_attribute": [
				{"attr_name": "KEY_VALUE",			"attr_value": "LAMY017"},
				{"attr_name": "WRITING_TYPE",		"attr_value": "Fountain Pen"},
				{"attr_name": "BRAND",				"attr_value": "Lamy"},
				{"attr_name": "RANGE",				"attr_value": "Safari"},
				{"attr_name": "MODEL_NAME",			"attr_value": "Safari"},
				{"attr_name": "BODY_MATERIAL",		"attr_value": "Plastic"},
				{"attr_name": "BODY_COLOUR", 		"attr_value": "Light Grey"},
				{"attr_name": "GRIP_MATERIAL",		"attr_value": "Plastic"},
				{"attr_name": "GRIP_COLOUR",		"attr_value": "Light Grey"},
				{"attr_name": "CAP_MATERIAL",		"attr_value": "Plastic"},
				{"attr_name": "CAP_COLOUR",			"attr_value": "Light Grey"},
				{"attr_name": "NIB_MATERIAL",		"attr_value": "Steel"},
				{"attr_name": "NIB_COLOUR",			"attr_value": "Chrome"},
				{"attr_name": "NIB_SIZE", 			"attr_value": "Medium"},
				{"attr_name": "PURCHASE_PRICE", 	"attr_value": 15},
				{"attr_name": "REPLACEMENT_PRICE",	"attr_value": 21},
				{"attr_name": "RATING", 			"attr_value": 4}
			],
			"item_comment": [
				{"comment":     "Black Clip"},
				{"comment":     "Limited Edition"},
				{"comment":     "Matt Finish"},
				{"comment":     "Very Good Condition"}
			]
		},
		{
			"item_key_value": "LAMY018",
			"item_attribute": [
				{"attr_name": "KEY_VALUE",			"attr_value": "LAMY018"},
				{"attr_name": "WRITING_TYPE",		"attr_value": "Fountain Pen"},
				{"attr_name": "BRAND",				"attr_value": "Lamy"},
				{"attr_name": "RANGE",				"attr_value": "Safari"},
				{"attr_name": "MODEL_NAME",			"attr_value": "Safari"},
				{"attr_name": "BODY_MATERIAL",		"attr_value": "Plastic"},
				{"attr_name": "BODY_COLOUR", 		"attr_value": "Black"},
				{"attr_name": "GRIP_MATERIAL",		"attr_value": "Plastic"},
				{"attr_name": "GRIP_COLOUR",		"attr_value": "Black"},
				{"attr_name": "CAP_MATERIAL",		"attr_value": "Plastic"},
				{"attr_name": "CAP_COLOUR",			"attr_value": "Black"},
				{"attr_name": "NIB_MATERIAL",		"attr_value": "Steel"},
				{"attr_name": "NIB_COLOUR",			"attr_value": "Chrome"},
				{"attr_name": "NIB_SIZE", 			"attr_value": "Medium"},
				{"attr_name": "PURCHASE_PRICE", 	"attr_value": 15},
				{"attr_name": "REPLACEMENT_PRICE",	"attr_value": 21},
				{"attr_name": "RATING", 			"attr_value": 4}
			],
			"item_comment": [
				{"comment":     "Black Clip"},
				{"comment":     "Limited Edition"},
				{"comment":     "Matt Finish"},
				{"comment":     "Very Good Condition"}
			]
		},
		{
			"item_key_value": "LAMY019",
			"item_attribute": [
				{"attr_name": "KEY_VALUE",			"attr_value": "LAMY019"},
				{"attr_name": "WRITING_TYPE",		"attr_value": "Fountain Pen"},
				{"attr_name": "BRAND",				"attr_value": "Lamy"},
				{"attr_name": "RANGE",				"attr_value": "Safari"},
				{"attr_name": "MODEL_NAME",			"attr_value": "Safari Vista"},
				{"attr_name": "BODY_MATERIAL",		"attr_value": "Plastic"},
				{"attr_name": "BODY_COLOUR", 		"attr_value": "Clear"},
				{"attr_name": "GRIP_MATERIAL",		"attr_value": "Plastic"},
				{"attr_name": "GRIP_COLOUR",		"attr_value": "Clear"},
				{"attr_name": "CAP_MATERIAL",		"attr_value": "Plastic"},
				{"attr_name": "CAP_COLOUR",			"attr_value": "Clear"},
				{"attr_name": "NIB_MATERIAL",		"attr_value": "Steel"},
				{"attr_name": "NIB_COLOUR",			"attr_value": "Chrome"},
				{"attr_name": "NIB_SIZE", 			"attr_value": "Medium"},
				{"attr_name": "PURCHASE_PRICE", 	"attr_value": 15},
				{"attr_name": "REPLACEMENT_PRICE",	"attr_value": 21},
				{"attr_name": "RATING", 			"attr_value": 4}
			],
			"item_comment": [
				{"comment":     "Chrome Clip"},
				{"comment":     "Fair Condition"}
			]
		}
	]
}]
';

--select @json_data;
EXEC COLLECTION.c_collection_item @json_data, 0, 1
