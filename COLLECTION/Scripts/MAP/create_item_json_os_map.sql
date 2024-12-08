USE Collections
GO

DECLARE	@json_data CORE.json

SET @json_data = N'
[{
	"parent_collection": "OS OUTDOOR",
	"item":[
		{
			"item_key_value": "OUT021997",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",	"attr_value": "OUT021997"},
					{"attr_name": "MAP_NUMBER",	"attr_value": "2"},
					{"attr_name": "MAP_TITLE",	"attr_value": "Yorkshire Dales Southern and Western Areas"},
					{"attr_name": "PUBLISH_DATE", "attr_value": "1997"},
					{"attr_name": "MAIN_SETTLEMENTS", "attr_value": "Settle|Skipton|Wharfedale|Kirkby Lonsdale"}]
		},
		{
			"item_key_value": "OUT221984",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",	"attr_value": "OUT221984"},
					{"attr_name": "MAP_NUMBER",	"attr_value": "22"},
					{"attr_name": "MAP_TITLE",	"attr_value": "New Forest"},
					{"attr_name": "PUBLISH_DATE", "attr_value": "1984"},
					{"attr_name": "MAIN_SETTLEMENTS", "attr_value": "Southampton|Bournemouth|Christchurch|New Forest|Lymington"}]
		}
	]
}]
';
select @json_data;
EXEC COLLECTION.c_collection_item @json_data, 0, 1

