USE Collections
GO

DECLARE	@json_data CORE.json

SET @json_data = N'
[{  
    "parent_collection": "SCORES",
    "item":[
		{
			"item_key_value": "BHHPS1258",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "BHHPS1258"},
					{"attr_name": "PUBLISHER",		"attr_value": "Boosey & Hawkes"},
					{"attr_name": "COMPOSER",		"attr_value": "Vaughan Williams, Ralph"},
					{"attr_name": "WORK_NAME", 		"attr_value": "On Wenlock Edge"},
					{"attr_name": "WORK_TYPE", 		"attr_value": "Song Cycle"},
					{"attr_name": "SCORE_SIZE", 	"attr_value": "Medium"},
					{"attr_name": "SCORE_PAGES", 	"attr_value": 83}
			]
		},
		{
			"item_key_value": "BHHPS629",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "BHHPS629"},
					{"attr_name": "PUBLISHER",		"attr_value": "Boosey & Hawkes"},
					{"attr_name": "COMPOSER",		"attr_value": "Copland, Aaron"},
					{"attr_name": "WORK_NAME", 		"attr_value": "Third Symphony"},
					{"attr_name": "WORK_TYPE", 		"attr_value": "Symphony"},
					{"attr_name": "SCORE_SIZE", 	"attr_value": "Medium"},
					{"attr_name": "SCORE_PAGES", 	"attr_value": 153}
			]
		}
	]
}]
';
--select @json_data;
EXEC COLLECTION.c_collection_item @json_data,0,1
