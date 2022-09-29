USE Collections
GO

DECLARE	@json_data CORE.json

SET @json_data = N'
[{  
    "parent_collection": "INK COLLECTION",
    "item":[
		{
			"item_key_value": "JH019",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "JH019"},
					{"attr_name": "BRAND",			"attr_value": "Jacques Herbin"},
					{"attr_name": "RANGE",			"attr_value": "D Cartridgr"},
					{"attr_name": "INK_NAME", 		"attr_value": "Bleu Nuit"},
					{"attr_name": "CONTAINER", 		"attr_value": "Cartridge"},
					{"attr_name": "CONTAINER_SIZE", "attr_value": "Short"},
					{"attr_name": "COLOUR", 		"attr_value": "Blue"},
					{"attr_name": "QTY_REMAINING", 	"attr_value": 6},
					{"attr_name": "RATING", 		"attr_value": 4}
			]
		},
		{
			"item_key_value": "JH020",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "JH020"},
					{"attr_name": "BRAND",			"attr_value": "Jacques Herbin"},
					{"attr_name": "RANGE",			"attr_value": "D Bottle"},
					{"attr_name": "INK_NAME", 		"attr_value": "Violette Pensée (2)"},
					{"attr_name": "CONTAINER", 		"attr_value": "D Bottle"},
					{"attr_name": "CONTAINER_SIZE", "attr_value": "30ml"},
					{"attr_name": "COLOUR", 		"attr_value": "Purple"},
					{"attr_name": "QTY_REMAINING", 	"attr_value": 30},
					{"attr_name": "RATING", 		"attr_value": 4}
			]
		}
	]
}]
';
select @json_data;

EXEC COLLECTION.cu_collection_item_json @json_data,0,1
