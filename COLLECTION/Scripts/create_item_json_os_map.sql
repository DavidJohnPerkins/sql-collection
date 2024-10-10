USE Collections
GO

DECLARE	@json_data CORE.json

SET @json_data = N'
[{  
	"parent_collection": "OS EXPLORER",
	"item":[
		{
			"item_key_value": "EXP248",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",	"attr_value": "EXP248"},
					{"attr_name": "MAP_NUMBER",	"attr_value": "248"},
					{"attr_name": "MAP_TITLE",	"attr_value": "Bourne and Heckington"},
					{"attr_name": "PUBLISH_DATE", "attr_value": "2015"},
					{"attr_name": "MAIN_SETTLEMENTS", "attr_value": "Bourne|Heckington|Billingborough|Morton"}]
		},
		{
			"item_key_value": "EXP273",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",	"attr_value": "EXP273"},
					{"attr_name": "MAP_NUMBER",	"attr_value": "273"},
					{"attr_name": "MAP_TITLE",	"attr_value": "Lincolnshire Wolds South"},
					{"attr_name": "PUBLISH_DATE", "attr_value": "2015"},
					{"attr_name": "MAIN_SETTLEMENTS", "attr_value": "Horncastle|Woodhall Spa"}]
		}
	]
}]
';
--select @json_data;
EXEC COLLECTION.c_collection_item @json_data, 0, 1
