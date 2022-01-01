USE Collections
GO

DECLARE @insert COLLECTION.item_list
DECLARE @jsonInfo NVARCHAR(MAX)

SET @jsonInfo=N'[{  
    "parent_item": "0",
	"parent_item_key": "OSLR",
	"parent_item_attribute": [
		{"attr_name": "NAME", "attr_value": "OS LANDRANGER"},
		{"attr_name": "DESCRIPTION", "attr_value": "ORDNANCE SURVEY LANDRANGER MAPS"},
		{"attr_name": "STARTED", "attr_value": "2021-10-29"}
	],
    "item":[{
		"item_key": "81",
		"item_attribute": [
				{"attr_name": "MAP NUMBER",	"attr_value": "81"},
				{"attr_name": "MAP TITLE",	"attr_value": "Alnwick and Morpeth"},
				{"attr_name": "PUBLISH DATE", "attr_value": "2016"},
				{"attr_name": "MAIN SETTLEMENTS", "attr_value": "Alnwick|Amble|Morpeth|Rothbury"}]},
		{"item_key": "88",
		"item_attribute": [
				{"attr_name": "MAP NUMBER", "attr_value": "88"},
				{"attr_name": "MAP TITLE", "attr_value": "Newcastle Upon Tyne"},
				{"attr_name": "PUBLISH DATE", "attr_value": "2016"},
				{"attr_name": "MAIN SETTLEMENTS", "attr_value": "Newcastle Upon Tyne|Sunderland|Durham"}]},
		{"item_key": "109",
		"item_attribute": [
				{"attr_name": "MAP NUMBER", "attr_value": "109"},
				{"attr_name": "MAP TITLE", "attr_value": "Manchester"},
				{"attr_name": "PUBLISH DATE", "attr_value": "2016"},
				{"attr_name": "MAIN SETTLEMENTS", "attr_value": "Manchester|Bolton|Warrington"}]},
		{"item_key": "113",
		"item_attribute": [
				{"attr_name": "MAP NUMBER", "attr_value": "113"},
				{"attr_name": "MAP TITLE", "attr_value": "Grimsby"},
				{"attr_name": "PUBLISH DATE", "attr_value": "2016"},
				{"attr_name": "MAIN SETTLEMENTS", "attr_value": "Grimsby|Louth|Market Rasen"}]},
		{"item_key": "134",
		"item_attribute": [
				{"attr_name": "MAP NUMBER", "attr_value": "134"},
				{"attr_name": "MAP TITLE", "attr_value": "Norwich and The Broads"},
				{"attr_name": "PUBLISH DATE", "attr_value": "2012"},
				{"attr_name": "MAIN SETTLEMENTS", "attr_value": "Norwich|Great Yarmouth"}]},
		{"item_key": "139",
		"item_attribute": [
				{"attr_name": "MAP NUMBER", "attr_value": "139"},
				{"attr_name": "MAP TITLE", "attr_value": "Birmingham and Wolverhampton"},
				{"attr_name": "PUBLISH DATE", "attr_value": "2011"},
				{"attr_name": "MAIN SETTLEMENTS", "attr_value": "Birmingham|Wolverhampton"}]},
		{"item_key": "150",
		"item_attribute": [
				{"attr_name": "MAP NUMBER", "attr_value": "150"},
				{"attr_name": "MAP TITLE", "attr_value": "Worcester and The Malverns"},
				{"attr_name": "PUBLISH DATE", "attr_value": "2016"},
				{"attr_name": "MAIN SETTLEMENTS", "attr_value": "Worcester|Evesham|Tewkesbury"}]},
		{"item_key": "190",
		"item_attribute": [
				{"attr_name": "MAP NUMBER", "attr_value": "190"},
				{"attr_name": "MAP TITLE", "attr_value": "Bude and Clovelly"},
				{"attr_name": "PUBLISH DATE", "attr_value": "2016"},
				{"attr_name": "MAIN SETTLEMENTS", "attr_value": "Bude|Clovelly|Holsworthy|Boscastle"}]}
		"item_key": "201",
		"item_attribute": [
				{"attr_name": "MAP NUMBER",	"attr_value": "201"},
				{"attr_name": "MAP TITLE",	"attr_value": "Plymouth and Launceston"},
				{"attr_name": "PUBLISH DATE", "attr_value": "2016"},
				{"attr_name": "MAIN SETTLEMENTS", "attr_value": "Plymouth|Launceston|Tavistock|Looe"}]},
		{"item_key": "143",
		"item_attribute": [
				{"attr_name": "MAP NUMBER", "attr_value": "143"},
				{"attr_name": "MAP TITLE", "attr_value": "Ely and Wisbech"},
				{"attr_name": "PUBLISH DATE", "attr_value": "2008"},
				{"attr_name": "MAIN SETTLEMENTS", "attr_value": "Ely|Downham Market|Wisbech"}]},
		{"item_key": "154",
		"item_attribute": [
				{"attr_name": "MAP NUMBER", "attr_value": "154"},
				{"attr_name": "MAP TITLE", "attr_value": "Cambridge and Newmarket"},
				{"attr_name": "PUBLISH DATE", "attr_value": "2012"},
				{"attr_name": "MAIN SETTLEMENTS", "attr_value": "Cambridge|Newmarket|Saffron Walden"}]},
		{"item_key": "153",
		"item_attribute": [
				{"attr_name": "MAP NUMBER", "attr_value": "153"},
				{"attr_name": "MAP TITLE", "attr_value": "Bedford and Huntingdon"},
				{"attr_name": "PUBLISH DATE", "attr_value": "2011"},
				{"attr_name": "MAIN SETTLEMENTS", "attr_value": "Bedford|Huntingdon|St Neots|Biggleswade"}]}
	]
}]';

INSERT INTO @insert 
SELECT
	CASE WHEN c.parent_item = '0' THEN NULL ELSE c.parent_item END,
	c.parent_item_key,
	ca.attr_name ,
	ca.attr_value
FROM OPENJSON (@jsonInfo)
WITH
(
    parent_item varchar(255),
    parent_item_key varchar(255),
	parent_item_attribute nvarchar(MAX) AS json/*,
    item nvarchar(MAX) AS json*/
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
FROM OPENJSON (@jsonInfo)
WITH
(
    parent_item varchar(255),
	collection_attribute nvarchar(MAX) AS json,
    item nvarchar(MAX) AS json
) c
CROSS APPLY OPENJSON (c.item)
WITH
(
    item_key varchar(100),
    item_attribute nvarchar(MAX) AS json
) i
CROSS APPLY OPENJSON (i.item_attribute)
WITH
(
    attr_name varchar(100),
    attr_value varchar(MAX)
) a
select * from @insert --where parent_item is NULL

EXEC COLLECTION.collection_create_add @insert
