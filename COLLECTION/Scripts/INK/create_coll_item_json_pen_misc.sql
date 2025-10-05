USE Collections
GO

DECLARE	@json_data CORE.json

SET @json_data = N'
[{  
	"parent_collection": "PEN COLLECTION",
	"item":[
		{
			"item_key_value": "FAB001",
			"item_attribute": [
				{"attr_name": "KEY_VALUE",			"attr_value": "FAB001"},
				{"attr_name": "WRITING_TYPE",		"attr_value": "Fountain Pen"},
				{"attr_name": "BRAND",				"attr_value": "Faber-Castell"},
				{"attr_name": "RANGE",				"attr_value": "Grip"},
				{"attr_name": "MODEL_NAME",			"attr_value": "Grip Fountain Pen"},
				{"attr_name": "BODY_MATERIAL",		"attr_value": "Plastic"},
				{"attr_name": "BODY_COLOUR", 		"attr_value": "Blue / Light Blue Dots"},
				{"attr_name": "GRIP_MATERIAL",		"attr_value": "Plastic"},
				{"attr_name": "GRIP_COLOUR",		"attr_value": "Matt Grey"},
				{"attr_name": "CAP_MATERIAL",		"attr_value": "Plastic"},
				{"attr_name": "CAP_COLOUR",			"attr_value": "Blue"},
				{"attr_name": "NIB_MATERIAL",		"attr_value": "Steel"},
				{"attr_name": "NIB_COLOUR",			"attr_value": "Chrome"},
				{"attr_name": "NIB_SIZE", 			"attr_value": "Medium"},
				{"attr_name": "PURCHASE_PRICE", 	"attr_value": 15},
				{"attr_name": "REPLACEMENT_PRICE",	"attr_value": 15},
				{"attr_name": "RATING", 			"attr_value": 4}
			],
			"item_comment": [
                {"comment":     "Purchased in Pordenone"}
			]
		}
	]
}]
';


--select @json_data;
EXEC COLLECTION.c_collection_item @json_data, 0, 1
