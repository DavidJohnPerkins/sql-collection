USE Collections
GO

DECLARE	@json_data CORE.json

SET @json_data = N'
[{  
    "parent_collection": "INK COLLECTION",
    "item":[
		{
			"item_key_value": "IRO007",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "IRO007"},
					{"attr_name": "BRAND",			"attr_value": "Iroshizuku"},
					{"attr_name": "RANGE",			"attr_value": "Standard"},
					{"attr_name": "INK_NAME", 		"attr_value": "chiku-rin"},
					{"attr_name": "CONTAINER", 		"attr_value": "Bottle"},
					{"attr_name": "CONTAINER_SIZE", "attr_value": "15ml"},
					{"attr_name": "COLOUR", 		"attr_value": "Green"},
					{"attr_name": "QTY_REMAINING", 	"attr_value": 14},
					{"attr_name": "RATING", 		"attr_value": 4}
			]
		},
		{
			"item_key_value": "IRO008",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "IRO008"},
					{"attr_name": "BRAND",			"attr_value": "Iroshizuku"},
					{"attr_name": "RANGE",			"attr_value": "Standard"},
					{"attr_name": "INK_NAME", 		"attr_value": "sui-gyoku"},
					{"attr_name": "CONTAINER", 		"attr_value": "Bottle"},
					{"attr_name": "CONTAINER_SIZE", "attr_value": "15ml"},
					{"attr_name": "COLOUR", 		"attr_value": "Green"},
					{"attr_name": "QTY_REMAINING", 	"attr_value": 15},
					{"attr_name": "RATING", 		"attr_value": 4}
			]
		},
		{
			"item_key_value": "IRO009",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "IRO009"},
					{"attr_name": "BRAND",			"attr_value": "Iroshizuku"},
					{"attr_name": "RANGE",			"attr_value": "Standard"},
					{"attr_name": "INK_NAME", 		"attr_value": "yama-budo"},
					{"attr_name": "CONTAINER", 		"attr_value": "Bottle"},
					{"attr_name": "CONTAINER_SIZE", "attr_value": "15ml"},
					{"attr_name": "COLOUR", 		"attr_value": "Purple"},
					{"attr_name": "QTY_REMAINING", 	"attr_value": 15},
					{"attr_name": "RATING", 		"attr_value": 4}
			]
		}
	]
}]
';
--select @json_data;
EXEC COLLECTION.c_collection_item @json_data,0,1
