USE Collections
GO

DECLARE	@json_data CORE.json

SET @json_data = N'
[{  
    "parent_collection": "SCORES",
    "item":[
		{
			"item_key_value": "EE8043",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "EE8043"},
					{"attr_name": "PUBLISHER",		"attr_value": "Edition Eulenberg"},
					{"attr_name": "COMPOSER",		"attr_value": "Stravinksy, Igor"},
					{"attr_name": "WORK_NAME", 		"attr_value": "The Firebird"},
					{"attr_name": "WORK_TYPE", 		"attr_value": "Ballet"},
					{"attr_name": "SCORE_SIZE", 	"attr_value": "Medium"},
					{"attr_name": "SCORE_PAGES", 	"attr_value": 188}
			]
		},
		{
			"item_key_value": "EE8023",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "EE8023"},
					{"attr_name": "PUBLISHER",		"attr_value": "Edition Eulenberg"},
					{"attr_name": "COMPOSER",		"attr_value": "Ravel, Maurice"},
					{"attr_name": "WORK_NAME", 		"attr_value": "Bolero"},
					{"attr_name": "WORK_TYPE", 		"attr_value": "Orchestral"},
					{"attr_name": "SCORE_SIZE", 	"attr_value": "Medium"},
					{"attr_name": "SCORE_PAGES", 	"attr_value": 67}
			]
		},
		{
			"item_key_value": "EE8007",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "EE8007"},
					{"attr_name": "PUBLISHER",		"attr_value": "Edition Eulenberg"},
					{"attr_name": "COMPOSER",		"attr_value": "Holst, Gustav"},
					{"attr_name": "WORK_NAME", 		"attr_value": "The Planets - Suite for Large Orchestra, Op. 32"},
					{"attr_name": "WORK_TYPE", 		"attr_value": "Orchestral"},
					{"attr_name": "SCORE_SIZE", 	"attr_value": "Medium"},
					{"attr_name": "SCORE_PAGES", 	"attr_value": 187}
			]
		},
		{
			"item_key_value": "EE8012",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "EE8012"},
					{"attr_name": "PUBLISHER",		"attr_value": "Edition Eulenberg"},
					{"attr_name": "COMPOSER",		"attr_value": "Gershwin, George"},
					{"attr_name": "WORK_NAME", 		"attr_value": "Rhapsody in Blue"},
					{"attr_name": "WORK_TYPE", 		"attr_value": "Concerto"},
					{"attr_name": "SCORE_SIZE", 	"attr_value": "Medium"},
					{"attr_name": "SCORE_PAGES", 	"attr_value": 62}
			]
		}
	]
}]
';
--select @json_data;
EXEC COLLECTION.c_collection_item @json_data,0,1
