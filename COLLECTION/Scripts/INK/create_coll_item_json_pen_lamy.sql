USE Collections
GO

DECLARE	@json_data CORE.json

SET @json_data = N'
[{  
    "parent_collection": "PEN COLLECTION",
    "item":[
		{
			"item_key_value": "LAMY037",
			"item_attribute": [
				{"attr_name": "KEY_VALUE",			"attr_value": "LAMY037"},
				{"attr_name": "WRITING_TYPE",		"attr_value": "Fountain Pen"},
				{"attr_name": "BRAND",				"attr_value": "Lamy"},
				{"attr_name": "RANGE",				"attr_value": "Accent"},
				{"attr_name": "MODEL_NAME",			"attr_value": "Accent"},
				{"attr_name": "BODY_MATERIAL",		"attr_value": "Aluminium"},
				{"attr_name": "BODY_COLOUR", 		"attr_value": "Matt Aluminium"},
				{"attr_name": "GRIP_MATERIAL",		"attr_value": "Interchangeable"},
				{"attr_name": "GRIP_COLOUR",		"attr_value": "Interchangeable"},
				{"attr_name": "CAP_MATERIAL",		"attr_value": "Aluminium"},
				{"attr_name": "CAP_COLOUR",			"attr_value": "Matt Aluminium"},
				{"attr_name": "NIB_MATERIAL",		"attr_value": "Steel"},
				{"attr_name": "NIB_COLOUR",			"attr_value": "Chrome"},
				{"attr_name": "NIB_SIZE", 			"attr_value": "Oblique Broad"},
				{"attr_name": "PURCHASE_PRICE", 	"attr_value": 35},
				{"attr_name": "REPLACEMENT_PRICE",	"attr_value": 60},
				{"attr_name": "RATING", 			"attr_value": 5}
			],
			"item_comment": [
				{"comment":     "Grips in Blue | Red | Green | Aluminium"}
			]
		},
		{
			"item_key_value": "LAMY038",
			"item_attribute": [
				{"attr_name": "KEY_VALUE",			"attr_value": "LAMY038"},
				{"attr_name": "WRITING_TYPE",		"attr_value": "Fountain Pen"},
				{"attr_name": "BRAND",				"attr_value": "Lamy"},
				{"attr_name": "RANGE",				"attr_value": "Accent"},
				{"attr_name": "MODEL_NAME",			"attr_value": "Accent"},
				{"attr_name": "BODY_MATERIAL",		"attr_value": "Aluminium"},
				{"attr_name": "BODY_COLOUR", 		"attr_value": "Matt Black"},
				{"attr_name": "GRIP_MATERIAL",		"attr_value": "Interchangeable"},
				{"attr_name": "GRIP_COLOUR",		"attr_value": "Interchangeable"},
				{"attr_name": "CAP_MATERIAL",		"attr_value": "Aluminium"},
				{"attr_name": "CAP_COLOUR",			"attr_value": "Matt Black"},
				{"attr_name": "NIB_MATERIAL",		"attr_value": "Steel"},
				{"attr_name": "NIB_COLOUR",			"attr_value": "Chrome"},
				{"attr_name": "NIB_SIZE", 			"attr_value": "Oblique Broad"},
				{"attr_name": "PURCHASE_PRICE", 	"attr_value": 35},
				{"attr_name": "REPLACEMENT_PRICE",	"attr_value": 60},
				{"attr_name": "RATING", 			"attr_value": 5}
			],
			"item_comment": [
				{"comment":     "Grips in Blue | Red | Green | Aluminium"}
			]
		}
	]
}]
';

--select @json_data;
EXEC COLLECTION.c_collection_item @json_data, 0, 1
