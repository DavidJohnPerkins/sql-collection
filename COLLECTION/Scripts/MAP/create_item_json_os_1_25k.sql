USE Collections
GO

DECLARE	@json_data CORE.json

SET @json_data = N'
[{
	"parent_collection": "OS 1 TO 25K",
	"item":[
		{
			"item_key_value": "OS125KSN891956",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",	"attr_value": "OS125KSN891956"},
					{"attr_name": "MAP_NUMBER",	"attr_value": "SN89"},
					{"attr_name": "MAP_TITLE",	"attr_value": "Staylittle"},
					{"attr_name": "PUBLISH_DATE", "attr_value": "1956"},
					{"attr_name": "MAIN_SETTLEMENTS", "attr_value": "Staylittle|Dylife|Aberhosan"}]
		},
		{
			"item_key_value": "OS125KSH611960",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",	"attr_value": "OS125KSH611960"},
					{"attr_name": "MAP_NUMBER",	"attr_value": "SH61"},
					{"attr_name": "MAP_TITLE",	"attr_value": "Barmouth"},
					{"attr_name": "PUBLISH_DATE", "attr_value": "1960"},
					{"attr_name": "MAIN_SETTLEMENTS", "attr_value": "Barmouth|Fairbourne"}]
		},
		{
			"item_key_value": "OS125KSN991961",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",	"attr_value": "OS125KSN991961"},
					{"attr_name": "MAP_NUMBER",	"attr_value": "SN99"},
					{"attr_name": "MAP_TITLE",	"attr_value": "Carno"},
					{"attr_name": "PUBLISH_DATE", "attr_value": "1961"},
					{"attr_name": "MAIN_SETTLEMENTS", "attr_value": "Carno|Trefeglwys|Llawr-y-glyn"}]
		},
		{
			"item_key_value": "OS125KSN981969",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",	"attr_value": "OS125KSN981969"},
					{"attr_name": "MAP_NUMBER",	"attr_value": "SN98"},
					{"attr_name": "MAP_TITLE",	"attr_value": "Llanidloes"},
					{"attr_name": "PUBLISH_DATE", "attr_value": "1969"},
					{"attr_name": "MAIN_SETTLEMENTS", "attr_value": "Llanidloes"}]
		}
	]
}]
';
select @json_data;
EXEC COLLECTION.c_collection_item @json_data, 0, 1

