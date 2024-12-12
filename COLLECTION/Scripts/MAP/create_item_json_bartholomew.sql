USE Collections
GO

DECLARE @insert CORE.item_list,
		@json_data CORE.json

SET @json_data = N'[{  
	"parent_collection": "BARTH HI NEW",
	"item":[
		{"item_key_value": "BHIN0281972",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "BHIN0281972"},
				{"attr_name": "map_number",	"attr_value": "028"},
				{"attr_name": "map_title",	"attr_value": "Merseyside"},
				{"attr_name": "publish_date", "attr_value": "1972"},
				{"attr_name": "main_settlements", "attr_value": "Liverpool|Birkenhead|Manchester|Warrington|Stockport|Chester"}]},
		{"item_key_value": "BHIN0351971",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "BHIN0351971"},
				{"attr_name": "map_number",	"attr_value": "035"},
				{"attr_name": "map_title",	"attr_value": "Teesdale"},
				{"attr_name": "publish_date", "attr_value": "1971"},
				{"attr_name": "main_settlements", "attr_value": "Darlington|Teesside|Middlesborough|Hartlepool"}]},
		{"item_key_value": "BHIN0291973",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "BHIN0291973"},
				{"attr_name": "map_number",	"attr_value": "029"},
				{"attr_name": "map_title",	"attr_value": "Peak District"},
				{"attr_name": "publish_date", "attr_value": "1973"},
				{"attr_name": "main_settlements", "attr_value": "Manchester|Sheffield|Chesterfield|Rotherham|Barnsley|Doncaster"}]}
	]
}]';
select @json_data
EXEC COLLECTION.c_collection_item @json_data, 0, 1
