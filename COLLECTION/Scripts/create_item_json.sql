USE Collections
GO

DECLARE @insert COLLECTION.item_list,
		@jsonInfo CORE.json

SET @jsonInfo=N'[{  
    "parent_collection": "OS EXPLORER",  
    "item":[{
		"item_key": "224",
		"item_attribute": [
				{"attr_name": "MAP NUMBER",	"attr_value": "224"},
				{"attr_name": "MAP TITLE",	"attr_value": "Corby, Kettering and Wellingborough"},
				{"attr_name": "PUBLISH DATE", "attr_value": "2015"},
				{"attr_name": "MAIN SETTLEMENTS", "attr_value": "Corby|Kettering|Wellingborough"}]},
		{"item_key": "227",
		"item_attribute": [
				{"attr_name": "MAP NUMBER", "attr_value": "227"},
				{"attr_name": "MAP TITLE", "attr_value": "Peterborough"},
				{"attr_name": "PUBLISH DATE", "attr_value": "2015"},
				{"attr_name": "MAIN SETTLEMENTS", "attr_value": "Peterborough|Whittlesey|March|Chatteris|Oundle"}]}
	]
}]';
/*
SET @jsonInfo = N'[{
	"create_collection": "true",
	"collection_attribute":[
		{"attr_name": "NAME", "attr_value": "EULENBURG SCORE"},
		{"attr_name": "DESCRIPTION", "attr_value": "Yellow Eulenburg Edition Scores"},
		{"attr_name": "STARTED", "attr_value": "2021-10-23"}
	],
    "parent_collection": "EULENBURG SCORE",  
    "item":[{
		"item_key": "1",
		"item_attribute": [
			{"attr_name": "MAP NUMBER",	"attr_value": "81"},
			{"attr_name": "MAP TITLE",	"attr_value": "Alnwick and Morpeth"},
			{"attr_name": "PUBLISH DATE", "attr_value": "2016"},
			{"attr_name": "MAIN SETTLEMENTS", "attr_value": "Alnwick|Amble|Morpeth|Rothbury"}]}
	]
}]';
*/
/*
SELECT
	c.parent_collection,
	c.collection_attribute
FROM OPENJSON (@jsonInfo)
WITH
(
    parent_collection varchar(255),
	collection_attribute nvarchar(MAX) AS json,
    item nvarchar(MAX) AS json
) c
*/
--RETURN

--select SUBSTRING(@jsonInfo, 60, 50)
--RETURN
/*
INSERT INTO @insert 
		SELECT
			CASE WHEN c.parent_collection = '0' THEN NULL ELSE c.parent_collection END,
			c.parent_item_key,
			ca.attr_name ,
			ca.attr_value
		FROM OPENJSON (@jsonInfo)
		WITH
		(
			parent_collection varchar(255),
			parent_item_key varchar(255),
			parent_item_attribute nvarchar(MAX) AS json
		) c
		CROSS APPLY OPENJSON (c.parent_item_attribute)
		WITH
		(
			attr_name varchar(100),
			attr_value varchar(100)
		) ca

		UNION ALL 

		SELECT
			c.parent_collection,
			i.item_key,
			a.attr_name ,
			a.attr_value
		FROM OPENJSON (@jsonInfo)
		WITH
		(
			parent_collection varchar(255),
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
*/
--select * from @insert

EXEC COLLECTION.cu_collection_json @jsonInfo, true, false
