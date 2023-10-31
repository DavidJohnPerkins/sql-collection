USE Collections
GO

DECLARE	@json_data CORE.json

SET @json_data = N'
[{  
    "parent_collection": "PEN COLLECTION",
	"description": "ASSORTED FOUNTAIN PENS AND PENCILS",
	"started": "2023-05-20",
	"keyed": "Y",
    "item":[
		{
			"item_key_value": "LA001",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",			"attr_value": "TA001"},
					{"attr_name": "BRAND",				"attr_value": "Lamy"},
					{"attr_name": "RANGE",				"attr_value": "Dialog"},
					{"attr_name": "MODEL_NAME",			"attr_value": "Dialog 3"},
					{"attr_name": "BODY MATERIAL",		"attr_value": "Magnesium Alloy"},
					{"attr_name": "BODY COLOUR", 		"attr_value": "Matt Black Palladium"},
					{"attr_name": "GRIP MATERIAL",		"attr_value": "Magnesium Alloy"},
					{"attr_name": "GRIP COLOUR",		"attr_value": "Matt Black Palladium"},
					{"attr_name": "NIB MATERIAL",		"attr_value": "Gold"},
					{"attr_name": "NIB COLOUR",			"attr_value": "Gold/Silver"},
					{"attr_name": "NIB SIZE", 			"attr_value": "Medium"},
					{"attr_name": "PURCHASE PRICE", 	"attr_value": 190},
					{"attr_name": "REPLACEMENT PRICE",	"attr_value": 260},
					{"attr_name": "RATING", 			"attr_value": 4}
			]
		}
	]
}]
';
--select @json_data;
EXEC COLLECTION.c_collection_item_json @json_data, 1, 0
