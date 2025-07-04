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
	"parent_collection": "OS LANDRANGER",
	"item":[
		{"item_key_value": "LR1492022",
		"item_attribute": [
				{"attr_name": "KEY_VALUE",	"attr_value": "LR1492022"},
				{"attr_name": "map_number",	"attr_value": "149"},
				{"attr_name": "map_title",	"attr_value": "Hereford and Leominster"},
				{"attr_name": "publish_date", "attr_value": "2022"},
				{"attr_name": "main_settlements", "attr_value": "Hereford|Leominster|ledbury|Bromyard"}]}
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
EXEC COLLECTION.c_collection_item @json_data, 1, 1
