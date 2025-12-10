USE Collections
GO

DECLARE	@json_data CORE.json

SET @json_data = N'
[{  
	"parent_collection": "PEN COLLECTION",
	"item":[
		{
			"item_key_value": "ROT003",
			"item_attribute": [
				{"attr_name": "KEY_VALUE",			"attr_value": "ROT003"},
				{"attr_name": "WRITING_TYPE",		"attr_value": "Technical Pen"},
				{"attr_name": "BRAND",				"attr_value": "rotring"},
				{"attr_name": "RANGE",				"attr_value": "isograph"},
				{"attr_name": "MODEL_NAME",			"attr_value": "0.7mm"},
				{"attr_name": "BODY_MATERIAL",		"attr_value": "Plastic"},
				{"attr_name": "BODY_COLOUR", 		"attr_value": "Maroon"},
				{"attr_name": "GRIP_MATERIAL",		"attr_value": "Plastic"},
				{"attr_name": "GRIP_COLOUR",		"attr_value": "Blue"},
				{"attr_name": "CAP_MATERIAL",		"attr_value": "Plastic"},
				{"attr_name": "CAP_COLOUR",			"attr_value": "Maroon"},
				{"attr_name": "NIB_MATERIAL",		"attr_value": "Steel"},
				{"attr_name": "NIB_COLOUR",			"attr_value": "Chrome"},
				{"attr_name": "NIB_SIZE", 			"attr_value": "0.7mm"},
				{"attr_name": "PURCHASE_PRICE", 	"attr_value": 25},
				{"attr_name": "REPLACEMENT_PRICE",	"attr_value": 25},
				{"attr_name": "RATING", 			"attr_value": 4}
			],
			"item_comment": [
			]
		},
		{
			"item_key_value": "ROT004",
			"item_attribute": [
				{"attr_name": "KEY_VALUE",			"attr_value": "ROT004"},
				{"attr_name": "WRITING_TYPE",		"attr_value": "Technical Pen"},
				{"attr_name": "BRAND",				"attr_value": "rotring"},
				{"attr_name": "RANGE",				"attr_value": "600"},
				{"attr_name": "MODEL_NAME",			"attr_value": "600 Ballpoint"},
				{"attr_name": "BODY_MATERIAL",		"attr_value": "Aluminium"},
				{"attr_name": "BODY_COLOUR", 		"attr_value": "Dark green"},
				{"attr_name": "GRIP_MATERIAL",		"attr_value": "Aluminium"},
				{"attr_name": "GRIP_COLOUR",		"attr_value": "Dark green"},
				{"attr_name": "CAP_MATERIAL",		"attr_value": "N/A"},
				{"attr_name": "CAP_COLOUR",			"attr_value": "N/A"},
				{"attr_name": "NIB_MATERIAL",		"attr_value": "N/A"},
				{"attr_name": "NIB_COLOUR",			"attr_value": "N/A"},
				{"attr_name": "NIB_SIZE", 			"attr_value": "N/A"},
				{"attr_name": "PURCHASE_PRICE", 	"attr_value": 35},
				{"attr_name": "REPLACEMENT_PRICE",	"attr_value": 35},
				{"attr_name": "RATING", 			"attr_value": 4}
			],
			"item_comment": [
			]
		},
		{
			"item_key_value": "UNI001",
			"item_attribute": [
				{"attr_name": "KEY_VALUE",			"attr_value": "UNI001"},
				{"attr_name": "WRITING_TYPE",		"attr_value": "Technical Pencil"},
				{"attr_name": "BRAND",				"attr_value": "Uni-Ball"},
				{"attr_name": "RANGE",				"attr_value": "Kura Toga"},
				{"attr_name": "MODEL_NAME",			"attr_value": "0.5mm"},
				{"attr_name": "BODY_MATERIAL",		"attr_value": "Plastic"},
				{"attr_name": "BODY_COLOUR", 		"attr_value": "Turquoise"},
				{"attr_name": "GRIP_MATERIAL",		"attr_value": "Plastic"},
				{"attr_name": "GRIP_COLOUR",		"attr_value": "Matt silver"},
				{"attr_name": "CAP_MATERIAL",		"attr_value": "N/A"},
				{"attr_name": "CAP_COLOUR",			"attr_value": "N/A"},
				{"attr_name": "NIB_MATERIAL",		"attr_value": "Steel"},
				{"attr_name": "NIB_COLOUR",			"attr_value": "Chrome"},
				{"attr_name": "NIB_SIZE", 			"attr_value": "0.5mm"},
				{"attr_name": "PURCHASE_PRICE", 	"attr_value": 17},
				{"attr_name": "REPLACEMENT_PRICE",	"attr_value": 20},
				{"attr_name": "RATING", 			"attr_value": 4}
			],
			"item_comment": [
			]
		},
		{
			"item_key_value": "OHTO001",
			"item_attribute": [
				{"attr_name": "KEY_VALUE",			"attr_value": "OHTO001"},
				{"attr_name": "WRITING_TYPE",		"attr_value": "Technical Pencil"},
				{"attr_name": "BRAND",				"attr_value": "OHTO"},
				{"attr_name": "RANGE",				"attr_value": "Conception"},
				{"attr_name": "MODEL_NAME",			"attr_value": "0.5mm"},
				{"attr_name": "BODY_MATERIAL",		"attr_value": "Plastic"},
				{"attr_name": "BODY_COLOUR", 		"attr_value": "Black"},
				{"attr_name": "GRIP_MATERIAL",		"attr_value": "Aluminium"},
				{"attr_name": "GRIP_COLOUR",		"attr_value": "Matt aluminium"},
				{"attr_name": "CAP_MATERIAL",		"attr_value": "N/A"},
				{"attr_name": "CAP_COLOUR",			"attr_value": "N/A"},
				{"attr_name": "NIB_MATERIAL",		"attr_value": "Steel"},
				{"attr_name": "NIB_COLOUR",			"attr_value": "Chrome"},
				{"attr_name": "NIB_SIZE", 			"attr_value": "0.5mm"},
				{"attr_name": "PURCHASE_PRICE", 	"attr_value": 20},
				{"attr_name": "REPLACEMENT_PRICE",	"attr_value": 20},
				{"attr_name": "RATING", 			"attr_value": 4}
			],
			"item_comment": [
			]
		},
		{
			"item_key_value": "OHTO002",
			"item_attribute": [
				{"attr_name": "KEY_VALUE",			"attr_value": "OHTO002"},
				{"attr_name": "WRITING_TYPE",		"attr_value": "Technical Pencil"},
				{"attr_name": "BRAND",				"attr_value": "OHTO"},
				{"attr_name": "RANGE",				"attr_value": "Super Promecha"},
				{"attr_name": "MODEL_NAME",			"attr_value": "PM-1503"},
				{"attr_name": "BODY_MATERIAL",		"attr_value": "Aluminium"},
				{"attr_name": "BODY_COLOUR", 		"attr_value": "Matt aluminium"},
				{"attr_name": "GRIP_MATERIAL",		"attr_value": "Aluminium"},
				{"attr_name": "GRIP_COLOUR",		"attr_value": "Matt aluminium"},
				{"attr_name": "CAP_MATERIAL",		"attr_value": "N/A"},
				{"attr_name": "CAP_COLOUR",			"attr_value": "N/A"},
				{"attr_name": "NIB_MATERIAL",		"attr_value": "Steel"},
				{"attr_name": "NIB_COLOUR",			"attr_value": "Chrome"},
				{"attr_name": "NIB_SIZE", 			"attr_value": "0.3mm"},
				{"attr_name": "PURCHASE_PRICE", 	"attr_value": 20},
				{"attr_name": "REPLACEMENT_PRICE",	"attr_value": 20},
				{"attr_name": "RATING", 			"attr_value": 4}
			],
			"item_comment": [
			]
		},
		{
			"item_key_value": "FAB002",
			"item_attribute": [
				{"attr_name": "KEY_VALUE",			"attr_value": "FAB002"},
				{"attr_name": "WRITING_TYPE",		"attr_value": "Technical Pencil"},
				{"attr_name": "BRAND",				"attr_value": "Faber-Castell"},
				{"attr_name": "RANGE",				"attr_value": "TK-Fine"},
				{"attr_name": "MODEL_NAME",			"attr_value": "Vario L 0.9/1.0"},
				{"attr_name": "BODY_MATERIAL",		"attr_value": "Plastic"},
				{"attr_name": "BODY_COLOUR", 		"attr_value": "Dark blue"},
				{"attr_name": "GRIP_MATERIAL",		"attr_value": "Metal"},
				{"attr_name": "GRIP_COLOUR",		"attr_value": "Polished metal"},
				{"attr_name": "CAP_MATERIAL",		"attr_value": "N/A"},
				{"attr_name": "CAP_COLOUR",			"attr_value": "N/A"},
				{"attr_name": "NIB_MATERIAL",		"attr_value": "Steel"},
				{"attr_name": "NIB_COLOUR",			"attr_value": "Chrome"},
				{"attr_name": "NIB_SIZE", 			"attr_value": "0.9mm"},
				{"attr_name": "PURCHASE_PRICE", 	"attr_value": 15},
				{"attr_name": "REPLACEMENT_PRICE",	"attr_value": 15},
				{"attr_name": "RATING", 			"attr_value": 4}
			],
			"item_comment": [
			]
		}
	]
}]
';


--select @json_data;
EXEC COLLECTION.c_collection_item @json_data, 0, 1
