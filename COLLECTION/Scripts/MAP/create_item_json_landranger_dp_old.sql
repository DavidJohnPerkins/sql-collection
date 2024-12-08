USE Collections
GO

DECLARE @insert CORE.item_list,
		@json_data CORE.json

SET @json_data = N'[{  
	"parent_collection": "OS LANDRANGER",
	"item":[
		{"item_key_value": "LR1541986",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "LR1541986"},
				{"attr_name": "map_number",	"attr_value": "154"},
				{"attr_name": "map_title",	"attr_value": "Cambridge, Newmarket and Surrounding Area"},
				{"attr_name": "publish_date", "attr_value": "1986"},
				{"attr_name": "main_settlements", "attr_value": "Cambridge|Newmarket|Saffron Walden"}]},
		{"item_key_value": "LR1421991",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "LR1421991"},
				{"attr_name": "map_number",	"attr_value": "142"},
				{"attr_name": "map_title",	"attr_value": "Peterborough and Surrounding Area"},
				{"attr_name": "publish_date", "attr_value": "1991"},
				{"attr_name": "main_settlements", "attr_value": "Peterborough|RamseyChatteris|March|Market Deeping"}]},
		{"item_key_value": "LR1521994",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "LR1521994"},
				{"attr_name": "map_number",	"attr_value": "152"},
				{"attr_name": "map_title",	"attr_value": "Northampton and Milton Keynes Area"},
				{"attr_name": "publish_date", "attr_value": "1994"},
				{"attr_name": "main_settlements", "attr_value": "Northampton|Milton Keynes|Wellingborough|Newport Pagnell"}]},
		{"item_key_value": "LR1531986",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "LR1531986"},
				{"attr_name": "map_number",	"attr_value": "153"},
				{"attr_name": "map_title",	"attr_value": "Bedford and Huntingdon"},
				{"attr_name": "publish_date", "attr_value": "1986"},
				{"attr_name": "main_settlements", "attr_value": "Bedford|Huntingdon|St Neots|Biggleswade"}]}
	]
}]';
select @json_data
EXEC COLLECTION.c_collection_item @json_data, 0, 1
