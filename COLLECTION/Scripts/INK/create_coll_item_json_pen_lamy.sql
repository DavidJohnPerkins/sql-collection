USE Collections
GO

DECLARE	@json_data CORE.json

SET @json_data = N'
[{  
    "parent_collection": "PEN COLLECTION",
    "item":[
		{
			"item_key_value": "LAMY041",
			"item_attribute": [
				{"attr_name": "KEY_VALUE",			"attr_value": "LAMY041"},
				{"attr_name": "WRITING_TYPE",		"attr_value": "Ballpoint Pen"},
				{"attr_name": "BRAND",				"attr_value": "LAMY"},
				{"attr_name": "RANGE",				"attr_value": "pico"},
				{"attr_name": "MODEL_NAME",			"attr_value": "Laser orange"},
				{"attr_name": "BODY_MATERIAL",		"attr_value": "Brass"},
				{"attr_name": "BODY_COLOUR", 		"attr_value": "Orange"},
				{"attr_name": "GRIP_MATERIAL",		"attr_value": "N/A"},
				{"attr_name": "GRIP_COLOUR",		"attr_value": "N/A"},
				{"attr_name": "CAP_MATERIAL",		"attr_value": "N/A"},
				{"attr_name": "CAP_COLOUR",			"attr_value": "N/A"},
				{"attr_name": "NIB_MATERIAL",		"attr_value": "N/A"},
				{"attr_name": "NIB_COLOUR",			"attr_value": "N/A"},
				{"attr_name": "NIB_SIZE", 			"attr_value": "N/A"},
				{"attr_name": "PURCHASE_PRICE", 	"attr_value": 25},
				{"attr_name": "REPLACEMENT_PRICE",	"attr_value": 39},
				{"attr_name": "RATING", 			"attr_value": 4}
			],
			"item_comment": [
				{"comment":     "In-body retractable ballpoint"}
			]
		},
		{
			"item_key_value": "LAMY042",
			"item_attribute": [
				{"attr_name": "KEY_VALUE",			"attr_value": "LAMY042"},
				{"attr_name": "WRITING_TYPE",		"attr_value": "Ballpoint Pen"},
				{"attr_name": "BRAND",				"attr_value": "LAMY"},
				{"attr_name": "RANGE",				"attr_value": "pico"},
				{"attr_name": "MODEL_NAME",			"attr_value": "Chrome"},
				{"attr_name": "BODY_MATERIAL",		"attr_value": "Brass"},
				{"attr_name": "BODY_COLOUR", 		"attr_value": "Polished chrome"},
				{"attr_name": "GRIP_MATERIAL",		"attr_value": "N/A"},
				{"attr_name": "GRIP_COLOUR",		"attr_value": "N/A"},
				{"attr_name": "CAP_MATERIAL",		"attr_value": "N/A"},
				{"attr_name": "CAP_COLOUR",			"attr_value": "N/A"},
				{"attr_name": "NIB_MATERIAL",		"attr_value": "N/A"},
				{"attr_name": "NIB_COLOUR",			"attr_value": "N/A"},
				{"attr_name": "NIB_SIZE", 			"attr_value": "N/A"},
				{"attr_name": "PURCHASE_PRICE", 	"attr_value": 25},
				{"attr_name": "REPLACEMENT_PRICE",	"attr_value": 39},
				{"attr_name": "RATING", 			"attr_value": 4}
			],
			"item_comment": [
				{"comment":     "In-body retractable ballpoint"}
			]
		}
	]
}]
';

--select @json_data;
EXEC COLLECTION.c_collection_item @json_data, 0, 1
