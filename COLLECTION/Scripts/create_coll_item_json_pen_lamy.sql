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
				{"attr_name": "BODY MATERIAL",		"attr_value": "Magnesium Alloy"},
				{"attr_name": "BODY COLOUR", 		"attr_value": "Matt Black Palladium"},
				{"attr_name": "GRIP MATERIAL",		"attr_value": "Magnesium Alloy"},
				{"attr_name": "GRIP COLOUR",		"attr_value": "Matt Black Palladium"},
				{"attr_name": "CAP MATERIAL",		"attr_value": "N/A"},
				{"attr_name": "CAP COLOUR",			"attr_value": "N/A"},
				{"attr_name": "NIB MATERIAL",		"attr_value": "Gold"},
				{"attr_name": "NIB COLOUR",			"attr_value": "Gold/Silver"},
				{"attr_name": "NIB SIZE", 			"attr_value": "Medium"},
				{"attr_name": "PURCHASE PRICE", 	"attr_value": 190},
				{"attr_name": "REPLACEMENT PRICE",	"attr_value": 260},
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
				{"attr_name": "BODY MATERIAL",		"attr_value": "Ebony"},
				{"attr_name": "BODY COLOUR", 		"attr_value": "Matt Black"},
				{"attr_name": "GRIP MATERIAL",		"attr_value": "Platinum-plated metal"},
				{"attr_name": "GRIP COLOUR",		"attr_value": "Polished White Metal"},
				{"attr_name": "CAP MATERIAL",		"attr_value": "Platinum-plated metal"},
				{"attr_name": "CAP COLOUR",			"attr_value": "Polished White Metal"},
				{"attr_name": "NIB MATERIAL",		"attr_value": "Gold"},
				{"attr_name": "NIB COLOUR",			"attr_value": "Gold/Silver"},
				{"attr_name": "NIB SIZE", 			"attr_value": "Medium Oblique"},
				{"attr_name": "PURCHASE PRICE", 	"attr_value": 350},
				{"attr_name": "REPLACEMENT PRICE",	"attr_value": 600},
				{"attr_name": "RATING", 			"attr_value": 5}
			]
		}
	]
}]
';
--select @json_data;
EXEC COLLECTION.c_collection_item @json_data, 0, 1
