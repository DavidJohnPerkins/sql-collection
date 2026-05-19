USE Collections
GO

DECLARE	@json_data CORE.json

SET @json_data = N'
[{  
    "parent_collection": "SCORES",
    "item":[
		{
			"item_key_value": "BHPB3897",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "BHPB3897"},
					{"attr_name": "PUBLISHER",		"attr_value": "Breitkopf & Härtel Partitur-Bibliotek"},
					{"attr_name": "COMPOSER",		"attr_value": "Sibelius, Jean"},
					{"attr_name": "WORK_NAME", 		"attr_value": "Karelia Suite, Op. 11"},
					{"attr_name": "WORK_TYPE", 		"attr_value": "Orchestral Suite"},
					{"attr_name": "SCORE_SIZE", 	"attr_value": "Medium"},
					{"attr_name": "SCORE_PAGES", 	"attr_value": 43}
			]
		},
		{
			"item_key_value": "WHE2103",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "WHE2103"},
					{"attr_name": "PUBLISHER",		"attr_value": "Wilhelm Hansen Edition"},
					{"attr_name": "COMPOSER",		"attr_value": "Sibelius, Jean"},
					{"attr_name": "WORK_NAME", 		"attr_value": "Symphony No. 5, Op. 82"},
					{"attr_name": "WORK_TYPE", 		"attr_value": "Symphony"},
					{"attr_name": "SCORE_SIZE", 	"attr_value": "Miniature"},
					{"attr_name": "SCORE_PAGES", 	"attr_value": 136}
			]
		},
		{
			"item_key_value": "ABG001",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "ABG001"},
					{"attr_name": "PUBLISHER",		"attr_value": "Anton Bruckner Gesamtausgabe"},
					{"attr_name": "COMPOSER",		"attr_value": "Bruckner, Anton"},
					{"attr_name": "WORK_NAME", 		"attr_value": "Symphony No. 4/2 in E-flat Major \"Romantic\" (1880 version)"},
					{"attr_name": "WORK_TYPE", 		"attr_value": "Orchestral"},
					{"attr_name": "SCORE_SIZE", 	"attr_value": "Medium"},
					{"attr_name": "SCORE_PAGES", 	"attr_value": 152}
			]
		},
		{
			"item_key_value": "BARTP909",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "BARTP909"},
					{"attr_name": "PUBLISHER",		"attr_value": "Bärenreiter"},
					{"attr_name": "COMPOSER",		"attr_value": "Beethoven, Ludwig van"},
					{"attr_name": "WORK_NAME", 		"attr_value": "Symphony No. 9 in D Minor, Op. 125"},
					{"attr_name": "WORK_TYPE", 		"attr_value": "Choral Symphony"},
					{"attr_name": "SCORE_SIZE", 	"attr_value": "Medium"},
					{"attr_name": "SCORE_PAGES", 	"attr_value": 329}
			]
		},
		{
			"item_key_value": "IMC2122",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "IMC2122"},
					{"attr_name": "PUBLISHER",		"attr_value": "International Music Company"},
					{"attr_name": "COMPOSER",		"attr_value": "Saint-Saëns, Camille"},
					{"attr_name": "WORK_NAME", 		"attr_value": "Symphony No. 3 in C Minor \"Organ\", Op. 78"},
					{"attr_name": "WORK_TYPE", 		"attr_value": "Symphony"},
					{"attr_name": "SCORE_SIZE", 	"attr_value": "Medium"},
					{"attr_name": "SCORE_PAGES", 	"attr_value": 176}
			]
		}
	]
}]
';
--select @json_data;
EXEC COLLECTION.c_collection_item @json_data,0,1
