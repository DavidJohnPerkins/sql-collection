USE Collections
GO

DECLARE @insert CORE.item_list,
		@json_data CORE.json

SET @json_data = N'[{  
	"parent_collection": "BARTHOLOMEW",
	"item":[
		{"item_key_value": "BHI0181947",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "BHI0181947"},
				{"attr_name": "map_number",	"attr_value": "BHI018"},
				{"attr_name": "map_title",	"attr_value": "Vale of Severn"},
				{"attr_name": "publish_date", "attr_value": "1947"},
				{"attr_name": "main_settlements", "attr_value": "Birmingham|Walsall|Worcester|Evesham|Ludlow|Kidderminster"}]},
		{"item_key_value": "BHI0341947",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "BHI0341947"},
				{"attr_name": "map_number",	"attr_value": "034"},
				{"attr_name": "map_title",	"attr_value": "English Lakes"},
				{"attr_name": "publish_date", "attr_value": "1947"},
				{"attr_name": "main_settlements", "attr_value": "Kendal|Penrith|Ulverston|Cockermouth"}]}
	]
}]';
select @json_data
EXEC COLLECTION.c_collection_item @json_data, 0, 1
