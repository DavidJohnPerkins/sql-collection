USE Collections
GO

DECLARE	@json_data CORE.json

SET @json_data = N'
[{  
    "parent_collection": "SCORES",
    "item":[
		{
			"item_key_value": "BHHPS606",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "BHHPS606"},
					{"attr_name": "PUBLISHER",		"attr_value": "Boosey & Hawkes"},
					{"attr_name": "COMPOSER",		"attr_value": "Britten, Benjamin"},
					{"attr_name": "WORK_NAME", 		"attr_value": "The Young Person''s Guide to the Orchestra"},
					{"attr_name": "WORK_TYPE", 		"attr_value": "Orchestral"},
					{"attr_name": "SCORE_SIZE", 	"attr_value": "Miniature"},
					{"attr_name": "SCORE_PAGES", 	"attr_value": 69}
			]
		},
		{
			"item_key_value": "BHHPS017",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "BHHPS017"},
					{"attr_name": "PUBLISHER",		"attr_value": "Boosey & Hawkes"},
					{"attr_name": "COMPOSER",		"attr_value": "Rachmaninov, Sergei"},
					{"attr_name": "WORK_NAME", 		"attr_value": "Piano Concerto No. 2"},
					{"attr_name": "WORK_TYPE", 		"attr_value": "Concerto"},
					{"attr_name": "SCORE_SIZE", 	"attr_value": "Miniature"},
					{"attr_name": "SCORE_PAGES", 	"attr_value": 116}
			]
		},
		{
			"item_key_value": "BHHPS032",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "BHHPS032"},
					{"attr_name": "PUBLISHER",		"attr_value": "Boosey & Hawkes"},
					{"attr_name": "COMPOSER",		"attr_value": "Moussorgsky, Modeste"},
					{"attr_name": "WORK_NAME", 		"attr_value": "Pictures From an Exhibition (orch. Ravel, Maurice)"},
					{"attr_name": "WORK_TYPE", 		"attr_value": "Orchestral Suite"},
					{"attr_name": "SCORE_SIZE", 	"attr_value": "Miniature"},
					{"attr_name": "SCORE_PAGES", 	"attr_value": 151}
			]
		},
		{
			"item_key_value": "BHHPS628",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "BHHPS628"},
					{"attr_name": "PUBLISHER",		"attr_value": "Boosey & Hawkes"},
					{"attr_name": "COMPOSER",		"attr_value": "Shostakovich, Dmitri"},
					{"attr_name": "WORK_NAME", 		"attr_value": "Symphony No. 5"},
					{"attr_name": "WORK_TYPE", 		"attr_value": "Symphony"},
					{"attr_name": "SCORE_SIZE", 	"attr_value": "Miniature"},
					{"attr_name": "SCORE_PAGES", 	"attr_value": 158}
			]
		},
		{
			"item_key_value": "BHHPS796",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "BHHPS796"},
					{"attr_name": "PUBLISHER",		"attr_value": "Boosey & Hawkes"},
					{"attr_name": "COMPOSER",		"attr_value": "Shostakovich, Dmitri"},
					{"attr_name": "WORK_NAME", 		"attr_value": "Piano Concerto No. 2, Op. 102"},
					{"attr_name": "WORK_TYPE", 		"attr_value": "Concerto"},
					{"attr_name": "SCORE_SIZE", 	"attr_value": "Miniature"},
					{"attr_name": "SCORE_PAGES", 	"attr_value": 102}
			]
		},
		{
			"item_key_value": "BHHPS073",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "BHHPS073"},
					{"attr_name": "PUBLISHER",		"attr_value": "Boosey & Hawkes"},
					{"attr_name": "COMPOSER",		"attr_value": "Vaughan Williams, Ralph"},
					{"attr_name": "WORK_NAME", 		"attr_value": "Symphony No. 3 \"Pastoral\""},
					{"attr_name": "WORK_TYPE", 		"attr_value": "Symphony"},
					{"attr_name": "SCORE_SIZE", 	"attr_value": "Miniature"},
					{"attr_name": "SCORE_PAGES", 	"attr_value": 105}
			]
		},
		{
			"item_key_value": "BHHPS059",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "BHHPS059"},
					{"attr_name": "PUBLISHER",		"attr_value": "Boosey & Hawkes"},
					{"attr_name": "COMPOSER",		"attr_value": "Vaughan Williams, Ralph"},
					{"attr_name": "WORK_NAME", 		"attr_value": "Fantasia on the Theme by Thomas Tallis"},
					{"attr_name": "WORK_TYPE", 		"attr_value": "Concerto"},
					{"attr_name": "SCORE_SIZE", 	"attr_value": "Miniature"},
					{"attr_name": "SCORE_PAGES", 	"attr_value": 21}
			]
		}
	]
}]
';
--select @json_data;
EXEC COLLECTION.c_collection_item @json_data,0,1
