USE Collections
GO

DECLARE	@json_data CORE.json

SET @json_data = N'
[{
	"parent_collection": "OS PATHFINDER",
	"item":[
		{
			"item_key_value": "PATH8131983",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",	"attr_value": "PATH8131983"},
					{"attr_name": "MAP_NUMBER",	"attr_value": "813"},
					{"attr_name": "MAP_TITLE",	"attr_value": "Carlton and Elston"},
					{"attr_name": "PUBLISH_DATE", "attr_value": "1983"},
					{"attr_name": "MAIN_SETTLEMENTS", "attr_value": "Carlton|Burton Joyce|Calverton"}]
		},
		{
			"item_key_value": "PATH8331989",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",	"attr_value": "PATH8331989"},
					{"attr_name": "MAP_NUMBER",	"attr_value": "833"},
					{"attr_name": "MAP_TITLE",	"attr_value": "Nottingham (South West)"},
					{"attr_name": "PUBLISH_DATE", "attr_value": "1989"},
					{"attr_name": "MAIN_SETTLEMENTS", "attr_value": "Nottingham|Stapleford|Beeston|Long Eaton|West Bridgford"}]
		},
		{
			"item_key_value": "PATH8341987",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",	"attr_value": "PATH8341987"},
					{"attr_name": "MAP_NUMBER",	"attr_value": "834"},
					{"attr_name": "MAP_TITLE",	"attr_value": "Radcliffe on Trent and Keyworth"},
					{"attr_name": "PUBLISH_DATE", "attr_value": "1987"},
					{"attr_name": "MAIN_SETTLEMENTS", "attr_value": "Bingham|Radcliffe on Trent|Keyworth|Plumtree|Stathern"}]
		},
		{
			"item_key_value": "PATH8541981",
			"item_attribute": [
					{"attr_name": "KEY_VALUE",	"attr_value": "PATH8541981"},
					{"attr_name": "MAP_NUMBER",	"attr_value": "854"},
					{"attr_name": "MAP_TITLE",	"attr_value": "Scalford and Nether Broughton"},
					{"attr_name": "PUBLISH_DATE", "attr_value": "1981"},
					{"attr_name": "MAIN_SETTLEMENTS", "attr_value": "Widmerpool|Willoughby-on-the-Wolds|Wymeswold|Upper Broughton"}]
		}
	]
}]
';
select @json_data;
EXEC COLLECTION.c_collection_item @json_data, 0, 1

