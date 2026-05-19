USE Collections
GO

DECLARE	@json_data CORE.json

SET @json_data = N'
[{  
    "parent_collection": "SCORES",
    "item":[
		{
			"item_key_value": "DOV001",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "DOV001"},
					{"attr_name": "PUBLISHER",		"attr_value": "Dover Publications"},
					{"attr_name": "COMPOSER",		"attr_value": "Rimsky-Korsakov, Nikolai"},
					{"attr_name": "WORK_NAME", 		"attr_value": "Scheherazade, Op. 35"},
					{"attr_name": "WORK_TYPE", 		"attr_value": "Orchestral"},
					{"attr_name": "SCORE_SIZE", 	"attr_value": "Large"},
					{"attr_name": "SCORE_PAGES", 	"attr_value": 227}
			]
		},
		{
			"item_key_value": "BH999",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "BH999"},
					{"attr_name": "PUBLISHER",		"attr_value": "Boosey & Hawkes"},
					{"attr_name": "COMPOSER",		"attr_value": "Copland, Aaron"},
					{"attr_name": "WORK_NAME", 		"attr_value": "Ballet Music - Billy the Kid / Rodeo / Appalachian Spring"},
					{"attr_name": "WORK_TYPE", 		"attr_value": "Ballet"},
					{"attr_name": "SCORE_SIZE", 	"attr_value": "Large"},
					{"attr_name": "SCORE_PAGES", 	"attr_value": 276}
			]
		}
	]
}]
';

SET @json_data = N'
[{  
    "parent_collection": "SCORES",
    "item":[
		{
			"item_key_value": "XXX001",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "XXX001"},
					{"attr_name": "PUBLISHER",		"attr_value": "Not Known"},
					{"attr_name": "COMPOSER",		"attr_value": "Sibelius, Jean"},
					{"attr_name": "WORK_NAME", 		"attr_value": "Symphony No. 3 in C Major, Op. 52"},
					{"attr_name": "WORK_TYPE", 		"attr_value": "Symphony"},
					{"attr_name": "SCORE_SIZE", 	"attr_value": "Large"},
					{"attr_name": "SCORE_PAGES", 	"attr_value": 70}
			]
		}
	]
}]
';
--select @json_data;
EXEC COLLECTION.c_collection_item @json_data,0,1
