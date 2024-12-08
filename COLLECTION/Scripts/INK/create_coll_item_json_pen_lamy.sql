USE Collections
GO

DECLARE	@json_data CORE.json

SET @json_data = N'
[{  
    "parent_collection": "PEN COLLECTION",
    "item":[
		{
			"item_key_value": "LAMY001",
			"item_attribute": [
				{"attr_name": "KEY_VALUE",			"attr_value": "LAMY001"},
				{"attr_name": "WRITING_TYPE",		"attr_value": "Fountain Pen"},
				{"attr_name": "BRAND",				"attr_value": "Lamy"},
				{"attr_name": "RANGE",				"attr_value": "Dialog"},
				{"attr_name": "MODEL_NAME",			"attr_value": "Dialog 3"},
				{"attr_name": "BODY_MATERIAL",		"attr_value": "Magnesium Alloy"},
				{"attr_name": "BODY_COLOUR", 		"attr_value": "Matt Black Palladium"},
				{"attr_name": "GRIP_MATERIAL",		"attr_value": "Magnesium Alloy"},
				{"attr_name": "GRIP_COLOUR",		"attr_value": "Matt Black Palladium"},
				{"attr_name": "CAP_MATERIAL",		"attr_value": "N/A"},
				{"attr_name": "CAP_COLOUR",			"attr_value": "N/A"},
				{"attr_name": "NIB_MATERIAL",		"attr_value": "Gold"},
				{"attr_name": "NIB_COLOUR",			"attr_value": "Gold/Silver"},
				{"attr_name": "NIB_SIZE", 			"attr_value": "Medium"},
				{"attr_name": "PURCHASE_PRICE", 	"attr_value": 190},
				{"attr_name": "REPLACEMENT_PRICE",	"attr_value": 260},
				{"attr_name": "RATING", 			"attr_value": 4}
			]
		},
		{
			"item_key_value": "GVFC001",
			"item_attribute": [
				{"attr_name": "KEY_VALUE",			"attr_value": "GVFC001"},
				{"attr_name": "WRITING_TYPE",		"attr_value": "Fountain Pen"},
				{"attr_name": "BRAND",				"attr_value": "Graf von Faber Castell"},
				{"attr_name": "RANGE",				"attr_value": "Classic"},
				{"attr_name": "MODEL_NAME",			"attr_value": "Classic Ebony"},
				{"attr_name": "BODY_MATERIAL",		"attr_value": "Ebony"},
				{"attr_name": "BODY_COLOUR", 		"attr_value": "Matt Black"},
				{"attr_name": "GRIP_MATERIAL",		"attr_value": "Platinum-plated metal"},
				{"attr_name": "GRIP_COLOUR",		"attr_value": "Polished White Metal"},
				{"attr_name": "CAP_MATERIAL",		"attr_value": "Platinum-plated metal"},
				{"attr_name": "CAP_COLOUR",			"attr_value": "Polished White Metal"},
				{"attr_name": "NIB_MATERIAL",		"attr_value": "Gold"},
				{"attr_name": "NIB_COLOUR",			"attr_value": "Gold/Silver"},
				{"attr_name": "NIB_SIZE", 			"attr_value": "Medium Oblique"},
				{"attr_name": "PURCHASE_PRICE", 	"attr_value": 350},
				{"attr_name": "REPLACEMENT_PRICE",	"attr_value": 600},
				{"attr_name": "RATING", 			"attr_value": 5}
			]
		},
		{
			"item_key_value": "LAMY002",
			"item_attribute": [
				{"attr_name": "KEY_VALUE",			"attr_value": "LAMY002"},
				{"attr_name": "WRITING_TYPE",		"attr_value": "Fountain Pen"},
				{"attr_name": "BRAND",				"attr_value": "Lamy"},
				{"attr_name": "RANGE",				"attr_value": "2000"},
				{"attr_name": "MODEL_NAME",			"attr_value": "Lamy 2000 Fountain Pen"},
				{"attr_name": "BODY_MATERIAL",		"attr_value": "Macrolon"},
				{"attr_name": "BODY_COLOUR", 		"attr_value": "Matt Dark Grey"},
				{"attr_name": "GRIP_MATERIAL",		"attr_value": "Aluminium"},
				{"attr_name": "GRIP_COLOUR",		"attr_value": "Brushed Silver"},
				{"attr_name": "CAP_MATERIAL",		"attr_value": "Macrolon"},
				{"attr_name": "CAP_COLOUR",			"attr_value": "Matt Dark Grey"},
				{"attr_name": "NIB_MATERIAL",		"attr_value": "Gold"},
				{"attr_name": "NIB_COLOUR",			"attr_value": "Polished Silver"},
				{"attr_name": "NIB_SIZE", 			"attr_value": "Medium"},
				{"attr_name": "PURCHASE_PRICE", 	"attr_value": 190},
				{"attr_name": "REPLACEMENT_PRICE",	"attr_value": 220},
				{"attr_name": "RATING", 			"attr_value": 4}
			]
		},
		{
			"item_key_value": "GVFC002",
			"item_attribute": [
				{"attr_name": "KEY_VALUE",			"attr_value": "GVFC002"},
				{"attr_name": "WRITING_TYPE",		"attr_value": "Fountain Pen"},
				{"attr_name": "BRAND",				"attr_value": "Graf von Faber Castell"},
				{"attr_name": "RANGE",				"attr_value": "Tamitio"},
				{"attr_name": "MODEL_NAME",			"attr_value": "GvFC Tamitio Fountain Pen"},
				{"attr_name": "BODY_MATERIAL",		"attr_value": "Resin"},
				{"attr_name": "BODY_COLOUR", 		"attr_value": "Taupe"},
				{"attr_name": "GRIP_MATERIAL",		"attr_value": "Platinum-plated metal"},
				{"attr_name": "GRIP_COLOUR",		"attr_value": "Polished White Metal"},
				{"attr_name": "CAP_MATERIAL",		"attr_value": "Platinum-plated metal"},
				{"attr_name": "CAP_COLOUR",			"attr_value": "Polished White Metal"},
				{"attr_name": "NIB_MATERIAL",		"attr_value": "Steel"},
				{"attr_name": "NIB_COLOUR",			"attr_value": "Polished Silver"},
				{"attr_name": "NIB_SIZE", 			"attr_value": "Medium"},
				{"attr_name": "PURCHASE_PRICE", 	"attr_value": 190},
				{"attr_name": "REPLACEMENT_PRICE",	"attr_value": 250},
				{"attr_name": "RATING", 			"attr_value": 3}
			]
		}
	]
}]
';

--select @json_data;
EXEC COLLECTION.c_collection_item @json_data, 0, 1
