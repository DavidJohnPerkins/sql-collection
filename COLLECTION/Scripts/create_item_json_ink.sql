USE Collections
GO

DECLARE @insert CORE.item_list,
		@json_data CORE.json

SET @json_data = N'
[{  
    "parent_collection": "INK COLLECTION",
    "item":[{
		"item_key": "MB001",
		"item_attribute": [
				{"attr_name": "BRAND",			"attr_value": "Mont Blanc"},
				{"attr_name": "RANGE",			"attr_value": "Standard 70ml"},
				{"attr_name": "INK_NAME", 		"attr_value": "Irish Green"},
				{"attr_name": "CONTAINER", 		"attr_value": "Bottle"},
				{"attr_name": "CONTAINER_SIZE", "attr_value": "70ml"},
				{"attr_name": "COLOUR", 		"attr_value": "Green"},
				{"attr_name": "QTY_REMAINING", 	"attr_value": 60},
				{"attr_name": "RATING", 		"attr_value": 4}
		]
	}]
}]
';

EXEC COLLECTION.cu_collection_item_json @json_data
