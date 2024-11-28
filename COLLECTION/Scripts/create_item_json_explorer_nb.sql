USE Collections
GO

DECLARE @insert CORE.item_list,
		@json_data CORE.json

SET @json_data = N'[{  
	"parent_collection": "OS EXPLORER",
	"item":[{
		"item_key_value": "EXP2602000",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "EXP2602000"},
				{"attr_name": "map_number",	"attr_value": "260"},
				{"attr_name": "map_title",	"attr_value": "Nottingham"},
				{"attr_name": "publish_date", "attr_value": "2000"},
				{"attr_name": "main_settlements", "attr_value": "Nottingham|Vale of Belvoir"}]},
		{"item_key_value": "EXP2602008",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "EXP2602008"},
				{"attr_name": "map_number",	"attr_value": "260"},
				{"attr_name": "map_title",	"attr_value": "Nottingham"},
				{"attr_name": "publish_date", "attr_value": "2008"},
				{"attr_name": "main_settlements", "attr_value": "Nottingham|Vale of Belvoir"}]},
		{"item_key_value": "EXP1022003",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "EXP1022003"},
				{"attr_name": "map_number", "attr_value": "102"},
				{"attr_name": "map_title", "attr_value": "Land''''s End"},
				{"attr_name": "publish_date", "attr_value": "2003"},
				{"attr_name": "main_settlements", "attr_value": "Penzance|St Ives|Land''''End"}]},
		{"item_key_value": "EXP1112003",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "EXP1112003"},
				{"attr_name": "map_number", "attr_value": "111"},
				{"attr_name": "map_title", "attr_value": "Bude, Boscastle and Tintagel"},
				{"attr_name": "publish_date", "attr_value": "2003"},
				{"attr_name": "main_settlements", "attr_value": "Bude|Boscastle|Tintagel"}]},
		{"item_key_value": "EXP2722000",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "EXP2722000"},
				{"attr_name": "map_number", "attr_value": "272"},
				{"attr_name": "map_title", "attr_value": "Lincoln"},
				{"attr_name": "publish_date", "attr_value": "2000"},
				{"attr_name": "main_settlements", "attr_value": "Lincoln|Sleaford|Metheringham|Navenby"}]},
		{"item_key_value": "OL222006",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "OL222006"},
				{"attr_name": "map_number", "attr_value": "OL22"},
				{"attr_name": "map_title", "attr_value": "New Forest"},
				{"attr_name": "publish_date", "attr_value": "2006"},
				{"attr_name": "main_settlements", "attr_value": "Southampton|Ringwood|Ferndown|Lymington|Christchurch|Bournemouth"}]},
		{"item_key_value": "OL92006",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "OL92006"},
				{"attr_name": "map_number", "attr_value": "OL9"},
				{"attr_name": "map_title", "attr_value": "Exmoor"},
				{"attr_name": "publish_date", "attr_value": "2006"},
				{"attr_name": "main_settlements", "attr_value": "Barnstaple|Lynton|Minehead|Dulverton"}]},
		{"item_key_value": "EXP2632007",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "EXP2632007"},
				{"attr_name": "map_number", "attr_value": "263"},
				{"attr_name": "map_title", "attr_value": "Anglesey East / Dwyrain Ynys Môn"},
				{"attr_name": "publish_date", "attr_value": "2007"},
				{"attr_name": "main_settlements", "attr_value": "Beaumaris|Amlwch|Phorthaethwy"}]},
		{"item_key_value": "EXP2622005",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "EXP2622005"},
				{"attr_name": "map_number", "attr_value": "262"},
				{"attr_name": "map_title", "attr_value": "Anglesey West / Gorllewin Ynys Môn"},
				{"attr_name": "publish_date", "attr_value": "2005"},
				{"attr_name": "main_settlements", "attr_value": "Holyhead"}]},
		{"item_key_value": "OL312002",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "OL312002"},
				{"attr_name": "map_number", "attr_value": "OL31"},
				{"attr_name": "map_title", "attr_value": "North Pennines"},
				{"attr_name": "publish_date", "attr_value": "2002"},
				{"attr_name": "main_settlements", "attr_value": "Teesdale|Weardale|Barnard Castle"}]},
		{"item_key_value": "OL202004",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "OL202004"},
				{"attr_name": "map_number", "attr_value": "OL20"},
				{"attr_name": "map_title", "attr_value": "South Devon"},
				{"attr_name": "publish_date", "attr_value": "2004"},
				{"attr_name": "main_settlements", "attr_value": "Brixham|Newton Ferrers|Totmouth|Dartmouth"}]},
		{"item_key_value": "EXP1412004",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "EXP1412004"},
				{"attr_name": "map_number", "attr_value": "141"},
				{"attr_name": "map_title", "attr_value": "Cheddar Gorge and Mendip Hills West"},
				{"attr_name": "publish_date", "attr_value": "2004"},
				{"attr_name": "main_settlements", "attr_value": "Wells|Glastonbury|Cheddar"}]},
		{"item_key_value": "OL302002",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "OL302002"},
				{"attr_name": "map_number", "attr_value": "OL30"},
				{"attr_name": "map_title", "attr_value": "Yorkshire Dales Northern and Central Areas"},
				{"attr_name": "publish_date", "attr_value": "2002"},
				{"attr_name": "main_settlements", "attr_value": "Wensleydale|Swaledale|Pennine Way"}]},
		{"item_key_value": "EXP2352015AM",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "EXP2352015AM"},
				{"attr_name": "map_number", "attr_value": "235"},
				{"attr_name": "map_title", "attr_value": "Wisbech and Peterborough North (Active Map)"},
				{"attr_name": "publish_date", "attr_value": "2015"},
				{"attr_name": "main_settlements", "attr_value": "Wisbech|Market Deeping|Peterborough"}]},
		{"item_key_value": "EXP1392005",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "EXP1392005"},
				{"attr_name": "map_number", "attr_value": "139"},
				{"attr_name": "map_title", "attr_value": "Bideford, Ilfracombe and Barnstaple"},
				{"attr_name": "publish_date", "attr_value": "2005"},
				{"attr_name": "main_settlements", "attr_value": "Bideford|Ilfracombe|Barnstaple"}]},
		{"item_key_value": "OL152004",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "OL152004"},
				{"attr_name": "map_number", "attr_value": "OL15"},
				{"attr_name": "map_title", "attr_value": "Purbeck and South Dorset"},
				{"attr_name": "publish_date", "attr_value": "2004"},
				{"attr_name": "main_settlements", "attr_value": "Poole|Dorchester|Weymouth|Swanage"}]},
		{"item_key_value": "EXP1172004",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "EXP1172004"},
				{"attr_name": "map_number", "attr_value": "117"},
				{"attr_name": "map_title", "attr_value": "Cerne Abbas and Bere Regis"},
				{"attr_name": "publish_date", "attr_value": "2004"},
				{"attr_name": "main_settlements", "attr_value": "Blandford Forum|Cerne Abbas|Beaminster|Bere Regis"}]},
		{"item_key_value": "EXP1162005",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "EXP1162005"},
				{"attr_name": "map_number", "attr_value": "116"},
				{"attr_name": "map_title", "attr_value": "Lyme Regis and Bridport"},
				{"attr_name": "publish_date", "attr_value": "2005"},
				{"attr_name": "main_settlements", "attr_value": "Lyme Regis|Bridport"}]}
	]
}]';

EXEC COLLECTION.c_collection_item @json_data, 0, 1
