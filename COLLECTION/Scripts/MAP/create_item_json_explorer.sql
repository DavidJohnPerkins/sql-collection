USE Collections
GO

DECLARE @insert CORE.item_list,
		@json_data CORE.json
/*
	"parent_item_key": "OSE",
	"parent_item_attribute": [
		{"attr_name": "NAME", "attr_value": "OS EXPLORER"},
		{"attr_name": "DESCRIPTION", "attr_value": "ORDNANCE SURVEY EXPLORER MAPS"},
		{"attr_name": "STARTED", "attr_value": "2021-10-30"}
	],
*/
SET @json_data = N'[{  
    "parent_item": "OS EXPLORER",
    "item":[{
		"item_key": "235",
		"item_attribute": [
				{"attr_name": "MAP NUMBER",	"attr_value": "235"},
				{"attr_name": "MAP TITLE",	"attr_value": "Wisbech and Peterborough North"},
				{"attr_name": "PUBLISH DATE", "attr_value": "2015"},
				{"attr_name": "MAIN SETTLEMENTS", "attr_value": "Wisbech|Market Deeping|Peterborough"}]},
		{"item_key": "350",
		"item_attribute": [
				{"attr_name": "MAP NUMBER", "attr_value": "350"},
				{"attr_name": "MAP TITLE", "attr_value": "Edinburgh"},
				{"attr_name": "PUBLISH DATE", "attr_value": "2015"},
				{"attr_name": "MAIN SETTLEMENTS", "attr_value": "Edinburgh|Queensferry|Musselburgh"}]},
		{"item_key": "OL6",
		"item_attribute": [
				{"attr_name": "MAP NUMBER", "attr_value": "OL6"},
				{"attr_name": "MAP TITLE", "attr_value": "The English Lakes - South-Western Area"},
				{"attr_name": "PUBLISH DATE", "attr_value": "2015"},
				{"attr_name": "MAIN SETTLEMENTS", "attr_value": "Barrow-in-Furness|Ulverston|Coniston"}]},
		{"item_key": "OL7",
		"item_attribute": [
				{"attr_name": "MAP NUMBER", "attr_value": "OL7"},
				{"attr_name": "MAP TITLE", "attr_value": "The English Lakes - South-Eastern Area"},
				{"attr_name": "PUBLISH DATE", "attr_value": "2015"},
				{"attr_name": "MAIN SETTLEMENTS", "attr_value": "Windermere|Kendal|Silverdale"}]},
		{"item_key": "OL9",
		"item_attribute": [
				{"attr_name": "MAP NUMBER", "attr_value": "OL9"},
				{"attr_name": "MAP TITLE", "attr_value": "Exmoor"},
				{"attr_name": "PUBLISH DATE", "attr_value": "2015"},
				{"attr_name": "MAIN SETTLEMENTS", "attr_value": "Barnstaple|Lynton|Minehead|Dulverton"}]},
		{"item_key": "OL14",
		"item_attribute": [
				{"attr_name": "MAP NUMBER", "attr_value": "OL14"},
				{"attr_name": "MAP TITLE", "attr_value": "Wye Valley and Forest of Dean"},
				{"attr_name": "PUBLISH DATE", "attr_value": "2015"},
				{"attr_name": "MAIN SETTLEMENTS", "attr_value": "Ross-on-Wye|Monmouth|Chepstow"}]},
		{"item_key": "OL15",
		"item_attribute": [
				{"attr_name": "MAP NUMBER", "attr_value": "OL15"},
				{"attr_name": "MAP TITLE", "attr_value": "Purbeck and South Dorset"},
				{"attr_name": "PUBLISH DATE", "attr_value": "2016"},
				{"attr_name": "MAIN SETTLEMENTS", "attr_value": "Weymouth|Dorchester|Swanage|Poole"}]},
		{"item_key": "OL17",
		"item_attribute": [
				{"attr_name": "MAP NUMBER", "attr_value": "OL17"},
				{"attr_name": "MAP TITLE", "attr_value": "Snowdon"},
				{"attr_name": "PUBLISH DATE", "attr_value": "2015"},
				{"attr_name": "MAIN SETTLEMENTS", "attr_value": "Snowdon|Conwy|Betws-Y-Coed"}]},
		{"item_key": "OL21",
		"item_attribute": [
				{"attr_name": "MAP NUMBER", "attr_value": "OL21"},
				{"attr_name": "MAP TITLE", "attr_value": "South Pennines"},
				{"attr_name": "PUBLISH DATE", "attr_value": "2015"},
				{"attr_name": "MAIN SETTLEMENTS", "attr_value": "Hebden Bridge|Todmorden|Keighley|Halifax"}]},
		{"item_key": "OL22",
		"item_attribute": [
				{"attr_name": "MAP NUMBER", "attr_value": "OL22"},
				{"attr_name": "MAP TITLE", "attr_value": "New Forest"},
				{"attr_name": "PUBLISH DATE", "attr_value": "2015"},
				{"attr_name": "MAIN SETTLEMENTS", "attr_value": "Southampton|Lymington|Bournemouth|Christchurch|Ringwood"}]},
		{"item_key": "OL43",
		"item_attribute": [
				{"attr_name": "MAP NUMBER", "attr_value": "OL43"},
				{"attr_name": "MAP TITLE", "attr_value": "Hadrian''s Wall"},
				{"attr_name": "PUBLISH DATE", "attr_value": "2015"},
				{"attr_name": "MAIN SETTLEMENTS", "attr_value": "Hexham|Haltwhistle"}]}
	]
}]';
/*
INSERT INTO @insert 
SELECT
	CASE WHEN c.parent_item = '0' THEN NULL ELSE c.parent_item END,
	c.parent_item_key,
	ca.attr_name ,
	ca.attr_value
FROM OPENJSON (@json_data)
WITH
(
    parent_item varchar(255),
    parent_item_key varchar(255),
	parent_item_attribute CORE.json AS json
) c
CROSS APPLY OPENJSON (c.parent_item_attribute)
WITH
(
    attr_name varchar(100),
    attr_value varchar(100)
) ca

UNION ALL 

SELECT
	c.parent_item,
	i.item_key,
	a.attr_name ,
	a.attr_value
FROM OPENJSON (@json_data)
WITH
(
    parent_item varchar(255),
	collection_attribute CORE.json AS json,
    item CORE.json AS json
) c
CROSS APPLY OPENJSON (c.item)
WITH
(
    item_key varchar(100),
    item_attribute CORE.json AS json
) i
CROSS APPLY OPENJSON (i.item_attribute)
WITH
(
    attr_name varchar(100),
    attr_value varchar(MAX)
) a
select * from @insert --where parent_item is NULL
*/
EXEC COLLECTION.cu_collection_item_json @json_data, 1, 0
