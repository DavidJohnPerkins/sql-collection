USE Collections
GO

DECLARE	@json_data CORE.json

SET @json_data = N'
[{  
	"parent_collection": "PEN COLLECTION",
	"item":[
		{
			"item_key_value": "PILOT001",
			"item_attribute": [
				{"attr_name": "KEY_VALUE",			"attr_value": "PILOT001"},
				{"attr_name": "WRITING_TYPE",		"attr_value": "Fountain Pen"},
				{"attr_name": "BRAND",				"attr_value": "Pilot"},
				{"attr_name": "RANGE",				"attr_value": "Capless"},
				{"attr_name": "MODEL_NAME",			"attr_value": "Classic"},
				{"attr_name": "BODY_MATERIAL",		"attr_value": "Brass"},
				{"attr_name": "BODY_COLOUR", 		"attr_value": "Matt Black"},
				{"attr_name": "GRIP_MATERIAL",		"attr_value": "Brass"},
				{"attr_name": "GRIP_COLOUR",		"attr_value": "Matt Black"},
				{"attr_name": "CAP_MATERIAL",		"attr_value": "N/A"},
				{"attr_name": "CAP_COLOUR",			"attr_value": "N/A"},
				{"attr_name": "NIB_MATERIAL",		"attr_value": "Gold"},
				{"attr_name": "NIB_COLOUR",			"attr_value": "Chrome"},
				{"attr_name": "NIB_SIZE", 			"attr_value": "Fine"},
				{"attr_name": "PURCHASE_PRICE", 	"attr_value": 220},
				{"attr_name": "REPLACEMENT_PRICE",	"attr_value": 230},
				{"attr_name": "RATING", 			"attr_value": 5}
			],
			"item_comment": [
				{"comment":     "Purchased in Seville"}
			]
		}
	]
}]
';

--select @json_data;
EXEC COLLECTION.c_collection_item @json_data, 0, 1
