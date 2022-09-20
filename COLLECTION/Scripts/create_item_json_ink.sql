USE Collections
GO

DECLARE	@json_data CORE.json

SET @json_data = N'
[{  
    "parent_collection": "INK COLLECTION",
    "item":[
		{
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "JH002"},
					{"attr_name": "BRAND",			"attr_value": "Jacques Herbin"},
					{"attr_name": "RANGE",			"attr_value": "Edition collection 1670"},
					{"attr_name": "INK_NAME", 		"attr_value": "Chivor Emerald"},
					{"attr_name": "CONTAINER", 		"attr_value": "Bottle"},
					{"attr_name": "CONTAINER_SIZE", "attr_value": "60ml"},
					{"attr_name": "COLOUR", 		"attr_value": "Green"},
					{"attr_name": "QTY_REMAINING", 	"attr_value": 45},
					{"attr_name": "RATING", 		"attr_value": 3}
			]
		},
		{
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "GVFC001"},
					{"attr_name": "BRAND",			"attr_value": "Graf von Faber Castell"},
					{"attr_name": "RANGE",			"attr_value": "Standard"},
					{"attr_name": "INK_NAME", 		"attr_value": "Moss Green"},
					{"attr_name": "CONTAINER", 		"attr_value": "Bottle"},
					{"attr_name": "CONTAINER_SIZE", "attr_value": "75ml"},
					{"attr_name": "COLOUR", 		"attr_value": "Green"},
					{"attr_name": "QTY_REMAINING", 	"attr_value": 70},
					{"attr_name": "RATING", 		"attr_value": 4}
			]
		}
	]
}]
';

EXEC COLLECTION.cu_collection_item_json @json_data
