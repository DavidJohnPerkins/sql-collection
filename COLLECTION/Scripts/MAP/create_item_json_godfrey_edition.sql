USE Collections
GO

DECLARE @insert CORE.item_list,
		@json_data CORE.json

SET @json_data = N'[{  
	"parent_collection": "GODFREY EDITION",
	"item":[
		{"item_key_value": "GE106-1419061989",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "GE106-1419061989"},
				{"attr_name": "map_series",	"attr_value": "Small Scale"},
				{"attr_name": "map_number",	"attr_value": "106.014"},
				{"attr_name": "map_title",	"attr_value": "Central Liverpool 1906"},
				{"attr_name": "publish_date", "attr_value": "1989"},
				{"attr_name": "main_settlements", "attr_value": "Liverpool"}]},
		{"item_key_value": "GE070-0719051993",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "GE070-0719051993"},
				{"attr_name": "map_series",	"attr_value": "Small Scale"},
				{"attr_name": "map_number",	"attr_value": "070.007"},
				{"attr_name": "map_title",	"attr_value": "Lincoln 1905"},
				{"attr_name": "publish_date", "attr_value": "1993"},
				{"attr_name": "main_settlements", "attr_value": "Lincoln"}]},
		{"item_key_value": "GE070-0719052004",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "GE070-0719052004"},
				{"attr_name": "map_series",	"attr_value": "Small Scale"},
				{"attr_name": "map_number",	"attr_value": "070.007"},
				{"attr_name": "map_title",	"attr_value": "Lincoln 1905"},
				{"attr_name": "publish_date", "attr_value": "2004"},
				{"attr_name": "main_settlements", "attr_value": "Lincoln"}]},
		{"item_key_value": "GE042-0618999999",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "GE042-0618999999"},
				{"attr_name": "map_series",	"attr_value": "Small Scale"},
				{"attr_name": "map_number",	"attr_value": "042.006"},
				{"attr_name": "map_title",	"attr_value": "Nottingham (South) 1899"},
				{"attr_name": "publish_date", "attr_value": "9999"},
				{"attr_name": "main_settlements", "attr_value": "Nottingham"}]},
		{"item_key_value": "GE062-1519011996",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "GE062-1519011996"},
				{"attr_name": "map_series",	"attr_value": "Small Scale"},
				{"attr_name": "map_number",	"attr_value": "062.015"},
				{"attr_name": "map_title",	"attr_value": "Ettingshall 1901"},
				{"attr_name": "publish_date", "attr_value": "1996"},
				{"attr_name": "main_settlements", "attr_value": "Ettingshall"}]},
		{"item_key_value": "GE032-00719111995",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "GE032-00719111995"},
				{"attr_name": "map_series",	"attr_value": "Small Scale"},
				{"attr_name": "map_number",	"attr_value": "032.007"},
				{"attr_name": "map_title",	"attr_value": "Whitby 1911"},
				{"attr_name": "publish_date", "attr_value": "1995"},
				{"attr_name": "main_settlements", "attr_value": "Whitby"}]},
		{"item_key_value": "GE018-01018981999",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "GE018-01018981999"},
				{"attr_name": "map_series",	"attr_value": "Small Scale"},
				{"attr_name": "map_number",	"attr_value": "018.010"},
				{"attr_name": "map_title",	"attr_value": "Longton (West) 1898"},
				{"attr_name": "publish_date", "attr_value": "1999"},
				{"attr_name": "main_settlements", "attr_value": "Longton"}]},
		{"item_key_value": "GE090-19062001",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "GE090-19062001"},
				{"attr_name": "map_series",	"attr_value": "Large Scale"},
				{"attr_name": "map_number",	"attr_value": "090"},
				{"attr_name": "map_title",	"attr_value": "NE Lincolnshire 1906"},
				{"attr_name": "publish_date", "attr_value": "2001"},
				{"attr_name": "main_settlements", "attr_value": "Grimsby|Cleethorpes"}]},
		{"item_key_value": "GE022-00819062011",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "GE022-00819062011"},
				{"attr_name": "map_series",	"attr_value": "Small Scale"},
				{"attr_name": "map_number",	"attr_value": "022.008"},
				{"attr_name": "map_title",	"attr_value": "Grimsby (New Clee) 1906"},
				{"attr_name": "publish_date", "attr_value": "2011"},
				{"attr_name": "main_settlements", "attr_value": "Grimsby|Cleethorpes"}]},
		{"item_key_value": "GE022-00719062011",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "GE022-00719062011"},
				{"attr_name": "map_series",	"attr_value": "Small Scale"},
				{"attr_name": "map_number",	"attr_value": "022.007"},
				{"attr_name": "map_title",	"attr_value": "Grimsby (North) 1906"},
				{"attr_name": "publish_date", "attr_value": "2011"},
				{"attr_name": "main_settlements", "attr_value": "Grimsby"}]},
		{"item_key_value": "GE022-01119062011",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "GE022-01119062011"},
				{"attr_name": "map_series",	"attr_value": "Small Scale"},
				{"attr_name": "map_number",	"attr_value": "022.011"},
				{"attr_name": "map_title",	"attr_value": "Grimsby (South) 1906"},
				{"attr_name": "publish_date", "attr_value": "2011"},
				{"attr_name": "main_settlements", "attr_value": "Grimsby"}]}
	]
}]';
select @json_data
EXEC COLLECTION.c_collection_item @json_data, 0, 1
