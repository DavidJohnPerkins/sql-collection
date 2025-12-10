USE Collections
GO

DECLARE	@json_data CORE.json

SET @json_data = N'
[{  
	"parent_collection": "PEN COLLECTION",
	"item":[
		{
			"item_key_value": "STD002",
			"item_attribute": [
				{"attr_name": "KEY_VALUE",			"attr_value": "STD002"},
				{"attr_name": "WRITING_TYPE",		"attr_value": "Fountain Pen"},
				{"attr_name": "BRAND",				"attr_value": "Staedtler"},
				{"attr_name": "RANGE",				"attr_value": "Premium"},
				{"attr_name": "MODEL_NAME",			"attr_value": "Initium Resina"},
				{"attr_name": "BODY_MATERIAL",		"attr_value": "Resin"},
				{"attr_name": "BODY_COLOUR", 		"attr_value": "Blue"},
				{"attr_name": "GRIP_MATERIAL",		"attr_value": "Metal"},
				{"attr_name": "GRIP_COLOUR",		"attr_value": "Polished chrome"},
				{"attr_name": "CAP_MATERIAL",		"attr_value": "Resin"},
				{"attr_name": "CAP_COLOUR",			"attr_value": "Blue"},
				{"attr_name": "NIB_MATERIAL",		"attr_value": "Steel"},
				{"attr_name": "NIB_COLOUR",			"attr_value": "Polished steel"},
				{"attr_name": "NIB_SIZE", 			"attr_value": "Medium"},
				{"attr_name": "PURCHASE_PRICE", 	"attr_value": 39},
				{"attr_name": "REPLACEMENT_PRICE",	"attr_value": 99},
				{"attr_name": "RATING", 			"attr_value": 3}
			],
			"item_comment": [
                {"comment":     "No longer available"},
                {"comment":     "Seemingly quite valuable"}
			]
		}
	]
}]
';


--select @json_data;
EXEC COLLECTION.c_collection_item @json_data, 0, 1
