USE Collections
GO

DECLARE	@json_data CORE.json

SET @json_data = N'
[{  
    "parent_collection": "SCORES",
    "item":[
		{
			"item_key_value": "EE8005",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "EE8005"},
					{"attr_name": "PUBLISHER",		"attr_value": "Edition Eulenberg"},
					{"attr_name": "COMPOSER",		"attr_value": "Elgar, Edward"},
					{"attr_name": "WORK_NAME", 		"attr_value": "Symphony No. 1 in A-flat Major, Op 55"},
					{"attr_name": "WORK_TYPE", 		"attr_value": "Symphony"},
					{"attr_name": "SCORE_SIZE", 	"attr_value": "Miniature"},
					{"attr_name": "SCORE_PAGES", 	"attr_value": 168}
			]
		},
		{
			"item_key_value": "EE1507",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "EE1507"},
					{"attr_name": "PUBLISHER",		"attr_value": "Edition Eulenberg"},
					{"attr_name": "COMPOSER",		"attr_value": "Vaughan Williams, Ralph"},
					{"attr_name": "WORK_NAME", 		"attr_value": "Symphony No. 6 in E Minor"},
					{"attr_name": "WORK_TYPE", 		"attr_value": "Symphony"},
					{"attr_name": "SCORE_SIZE", 	"attr_value": "Miniature"},
					{"attr_name": "SCORE_PAGES", 	"attr_value": 158}
			]
		},
		{
			"item_key_value": "EE1505",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "EE1505"},
					{"attr_name": "PUBLISHER",		"attr_value": "Edition Eulenberg"},
					{"attr_name": "COMPOSER",		"attr_value": "Vaughan Williams, Ralph"},
					{"attr_name": "WORK_NAME", 		"attr_value": "Symphony No. 4 in F Minor"},
					{"attr_name": "WORK_TYPE", 		"attr_value": "Symphony"},
					{"attr_name": "SCORE_SIZE", 	"attr_value": "Miniature"},
					{"attr_name": "SCORE_PAGES", 	"attr_value": 157}
			]
		},
		{
			"item_key_value": "EE1370",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "EE1370"},
					{"attr_name": "PUBLISHER",		"attr_value": "Edition Eulenberg"},
					{"attr_name": "COMPOSER",		"attr_value": "Saint-Saëns, Camille"},
					{"attr_name": "WORK_NAME", 		"attr_value": "Le Carnaval des Animaux"},
					{"attr_name": "WORK_TYPE", 		"attr_value": "Orchestral"},
					{"attr_name": "SCORE_SIZE", 	"attr_value": "Miniature"},
					{"attr_name": "SCORE_PAGES", 	"attr_value": 66}
			]
		},
		{
			"item_key_value": "EE0526",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "EE0526"},
					{"attr_name": "PUBLISHER",		"attr_value": "Edition Eulenberg"},
					{"attr_name": "COMPOSER",		"attr_value": "Dvořák, Antonin"},
					{"attr_name": "WORK_NAME", 		"attr_value": "Symphony No. 7 in D Minor, Op. 70"},
					{"attr_name": "WORK_TYPE", 		"attr_value": "Symphony"},
					{"attr_name": "SCORE_SIZE", 	"attr_value": "Miniature"},
					{"attr_name": "SCORE_PAGES", 	"attr_value":  218}
			]
		},
		{
			"item_key_value": "EE0433",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "EE0433"},
					{"attr_name": "PUBLISHER",		"attr_value": "Edition Eulenberg"},
					{"attr_name": "COMPOSER",		"attr_value": "Dvořák, Antonin"},
					{"attr_name": "WORK_NAME", 		"attr_value": "Symphony No. 9 in E Minor \"From the New World\", Op. 95"},
					{"attr_name": "WORK_TYPE", 		"attr_value": "Symphony"},
					{"attr_name": "SCORE_SIZE", 	"attr_value": "Miniature"},
					{"attr_name": "SCORE_PAGES", 	"attr_value":  160}
			]
		},
		{
			"item_key_value": "EE0569",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "EE0569"},
					{"attr_name": "PUBLISHER",		"attr_value": "Edition Eulenberg"},
					{"attr_name": "COMPOSER",		"attr_value": "Dvořák, Antonin"},
					{"attr_name": "WORK_NAME", 		"attr_value": "Symphony No. 6 in D Major, Op. 60"},
					{"attr_name": "WORK_TYPE", 		"attr_value": "Symphony"},
					{"attr_name": "SCORE_SIZE", 	"attr_value": "Miniature"},
					{"attr_name": "SCORE_PAGES", 	"attr_value":  198}
			]
		},
		{
			"item_key_value": "EE0525",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "EE0525"},
					{"attr_name": "PUBLISHER",		"attr_value": "Edition Eulenberg"},
					{"attr_name": "COMPOSER",		"attr_value": "Dvořák, Antonin"},
					{"attr_name": "WORK_NAME", 		"attr_value": "Symphony No. 8 in G Major, Op. 88"},
					{"attr_name": "WORK_TYPE", 		"attr_value": "Symphony"},
					{"attr_name": "SCORE_SIZE", 	"attr_value": "Miniature"},
					{"attr_name": "SCORE_PAGES", 	"attr_value":  160}
			]
		},
		{
			"item_key_value": "EE0071",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "EE0071"},
					{"attr_name": "PUBLISHER",		"attr_value": "Edition Eulenberg"},
					{"attr_name": "COMPOSER",		"attr_value": "Mozart, Wolfgang Amadeus"},
					{"attr_name": "WORK_NAME", 		"attr_value": "Clarinet Quintet in A Major, K.581"},
					{"attr_name": "WORK_TYPE", 		"attr_value": "Chamber"},
					{"attr_name": "SCORE_SIZE", 	"attr_value": "Miniature"},
					{"attr_name": "SCORE_PAGES", 	"attr_value": 44}
			]
		},
		{
			"item_key_value": "EE1398",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "EE1398"},
					{"attr_name": "PUBLISHER",		"attr_value": "Edition Eulenberg"},
					{"attr_name": "COMPOSER",		"attr_value": "Gershwin, George"},
					{"attr_name": "WORK_NAME", 		"attr_value": "An American in Paris"},
					{"attr_name": "WORK_TYPE", 		"attr_value": "Orchestral"},
					{"attr_name": "SCORE_SIZE", 	"attr_value": "Miniature"},
					{"attr_name": "SCORE_PAGES", 	"attr_value": 94}
			]
		},
		{
			"item_key_value": "EE0532",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "EE0532"},
					{"attr_name": "PUBLISHER",		"attr_value": "Edition Eulenberg"},
					{"attr_name": "COMPOSER",		"attr_value": "Mahler, Gustav"},
					{"attr_name": "WORK_NAME", 		"attr_value": "Symphony No. 5 in C Minor"},
					{"attr_name": "WORK_TYPE", 		"attr_value": "Symphony"},
					{"attr_name": "SCORE_SIZE", 	"attr_value": "Miniature"},
					{"attr_name": "SCORE_PAGES", 	"attr_value": 246}
			]
		},
		{
			"item_key_value": "EE0426",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "EE0426"},
					{"attr_name": "PUBLISHER",		"attr_value": "Edition Eulenberg"},
					{"attr_name": "COMPOSER",		"attr_value": "Brahms, Johannes"},
					{"attr_name": "WORK_NAME", 		"attr_value": "Symphony No.2 in D Major, Op. 73"},
					{"attr_name": "WORK_TYPE", 		"attr_value": "Symphony"},
					{"attr_name": "SCORE_SIZE", 	"attr_value": "Miniature"},
					{"attr_name": "SCORE_PAGES", 	"attr_value": 138}
			]
		},
		{
			"item_key_value": "EE0715",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "EE0715"},
					{"attr_name": "PUBLISHER",		"attr_value": "Edition Eulenberg"},
					{"attr_name": "COMPOSER",		"attr_value": "Brahms, Johannes"},
					{"attr_name": "WORK_NAME", 		"attr_value": "Concerto No. 2 for Piano and Orchestra in B-flat Major, Op. 83"},
					{"attr_name": "WORK_TYPE", 		"attr_value": "Concerto"},
					{"attr_name": "SCORE_SIZE", 	"attr_value": "Miniature"},
					{"attr_name": "SCORE_PAGES", 	"attr_value": 206}
			]
		},
		{
			"item_key_value": "EE0422",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "EE0422"},
					{"attr_name": "PUBLISHER",		"attr_value": "Edition Eulenberg"},
					{"attr_name": "COMPOSER",		"attr_value": "Berlioz, Hector"},
					{"attr_name": "WORK_NAME", 		"attr_value": "Symphonie Fantastique"},
					{"attr_name": "WORK_TYPE", 		"attr_value": "Symphony"},
					{"attr_name": "SCORE_SIZE", 	"attr_value": "Miniature"},
					{"attr_name": "SCORE_PAGES", 	"attr_value": 164}
			]
		},
		{
			"item_key_value": "EE0402",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "EE0402"},
					{"attr_name": "PUBLISHER",		"attr_value": "Edition Eulenberg"},
					{"attr_name": "COMPOSER",		"attr_value": "Beethoven, Ludwig van"},
					{"attr_name": "WORK_NAME", 		"attr_value": "Symphony No. 5 in C Minor, Op. 67"},
					{"attr_name": "WORK_TYPE", 		"attr_value": "Symphony"},
					{"attr_name": "SCORE_SIZE", 	"attr_value": "Miniature"},
					{"attr_name": "SCORE_PAGES", 	"attr_value": 136}
			]
		},
		{
			"item_key_value": "EE0722",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "EE0722"},
					{"attr_name": "PUBLISHER",		"attr_value": "Edition Eulenberg"},
					{"attr_name": "COMPOSER",		"attr_value": "Liszt, Franz"},
					{"attr_name": "WORK_NAME", 		"attr_value": "Totentanz"},
					{"attr_name": "WORK_TYPE", 		"attr_value": "Orchestral, Piano"},
					{"attr_name": "SCORE_SIZE", 	"attr_value": "Miniature"},
					{"attr_name": "SCORE_PAGES", 	"attr_value": 78}
			]
		},
		{
			"item_key_value": "EE0462",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "EE0462"},
					{"attr_name": "PUBLISHER",		"attr_value": "Edition Eulenberg"},
					{"attr_name": "COMPOSER",		"attr_value": "Bruckner, Anton"},
					{"attr_name": "WORK_NAME", 		"attr_value": "Symphony No. 4/1 in E-flat Major \"Romantic\" (1874 version)"},
					{"attr_name": "WORK_TYPE", 		"attr_value": "Symphony"},
					{"attr_name": "SCORE_SIZE", 	"attr_value": "Miniature"},
					{"attr_name": "SCORE_PAGES", 	"attr_value": 276}
			]
		},
		{
			"item_key_value": "EE1388",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "EE1388"},
					{"attr_name": "PUBLISHER",		"attr_value": "Edition Eulenberg"},
					{"attr_name": "COMPOSER",		"attr_value": "Vaughan Williams, Ralph"},
					{"attr_name": "WORK_NAME", 		"attr_value": "The Lark Ascending"},
					{"attr_name": "WORK_TYPE", 		"attr_value": "Romance"},
					{"attr_name": "SCORE_SIZE", 	"attr_value": "Miniature"},
					{"attr_name": "SCORE_PAGES", 	"attr_value": 24}
			]
		},
		{
			"item_key_value": "EE0442",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "EE0442"},
					{"attr_name": "PUBLISHER",		"attr_value": "Edition Eulenberg"},
					{"attr_name": "COMPOSER",		"attr_value": "Strauss, Richard"},
					{"attr_name": "WORK_NAME", 		"attr_value": "Tod und Verklärung, Op. 24"},
					{"attr_name": "WORK_TYPE", 		"attr_value": "Symphonic Poem"},
					{"attr_name": "SCORE_SIZE", 	"attr_value": "Miniature"},
					{"attr_name": "SCORE_PAGES", 	"attr_value": 121}
			]
		},
		{
			"item_key_value": "EE0637",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "EE0637"},
					{"attr_name": "PUBLISHER",		"attr_value": "Edition Eulenberg"},
					{"attr_name": "COMPOSER",		"attr_value": "Mendelssohn, Felix"},
					{"attr_name": "WORK_NAME", 		"attr_value": "The Hebrides"},
					{"attr_name": "WORK_TYPE", 		"attr_value": "Overture"},
					{"attr_name": "SCORE_SIZE", 	"attr_value": "Miniature"},
					{"attr_name": "SCORE_PAGES", 	"attr_value": 50}
			]
		},
		{
			"item_key_value": "EE1096",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "EE1096"},
					{"attr_name": "PUBLISHER",		"attr_value": "Edition Eulenberg"},
					{"attr_name": "COMPOSER",		"attr_value": "Fauré, Gabriel"},
					{"attr_name": "WORK_NAME", 		"attr_value": "Requiem, Op. 48"},
					{"attr_name": "WORK_TYPE", 		"attr_value": "Requiem"},
					{"attr_name": "SCORE_SIZE", 	"attr_value": "Miniature"},
					{"attr_name": "SCORE_PAGES", 	"attr_value": 118}
			]
		},
		{
			"item_key_value": "EE0884",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "EE0884"},
					{"attr_name": "PUBLISHER",		"attr_value": "Edition Eulenberg"},
					{"attr_name": "COMPOSER",		"attr_value": "Elgar, Edward"},
					{"attr_name": "WORK_NAME", 		"attr_value": "Variations on an Original Theme (Enigma), Op. 36"},
					{"attr_name": "WORK_TYPE", 		"attr_value": "Orchestral Variations"},
					{"attr_name": "SCORE_SIZE", 	"attr_value": "Miniature"},
					{"attr_name": "SCORE_PAGES", 	"attr_value": 128}
			]
		},
		{
			"item_key_value": "EE0465",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",		"attr_value": "EE0465"},
					{"attr_name": "PUBLISHER",		"attr_value": "Edition Eulenberg"},
					{"attr_name": "COMPOSER",		"attr_value": "Bruckner, Anton"},
					{"attr_name": "WORK_NAME", 		"attr_value": "Symphony No. 7 in E Major"},
					{"attr_name": "WORK_TYPE", 		"attr_value": "Symphony"},
					{"attr_name": "SCORE_SIZE", 	"attr_value": "Miniature"},
					{"attr_name": "SCORE_PAGES", 	"attr_value": 135}
			]
		}
	]
}]
';
--select SUBSTRING(@json_data, 600, 60)

EXEC COLLECTION.c_collection_item @json_data,0,1
