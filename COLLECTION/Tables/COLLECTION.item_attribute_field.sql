USE Collections
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
IF OBJECT_ID('COLLECTION.item_attribute_field', 'U') IS NOT NULL
BEGIN
	DROP INDEX IF EXISTS U_IDX_coll_attr_fld_id_name ON COLLECTION.item_attribute_field

	DROP TABLE COLLECTION.item_attribute_field
END
GO
CREATE TABLE COLLECTION.item_attribute_field
(
	item_attr_id			int IDENTITY(1, 1)	NOT NULL ,
	item_attr_name			varchar(20)			NOT NULL ,
	item_attr_data_type		char(1)				NOT NULL , 
	create_date				datetime			NOT NULL DEFAULT GETDATE(),
	create_user				varchar(50)			NOT NULL DEFAULT SYSTEM_USER
)
GO
ALTER TABLE COLLECTION.item_attribute_field ADD PRIMARY KEY NONCLUSTERED 
(
	item_attr_id ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE UNIQUE CLUSTERED INDEX U_IDX_item_attr_fld_id_name ON COLLECTION.item_attribute_field (item_attr_id, item_attr_name) ON [PRIMARY];
GO
*/
BEGIN TRANSACTION

ALTER TABLE COLLECTION.item_attribute_field
	ADD type_id int NOT NULL DEFAULT 1
GO
ALTER TABLE COLLECTION.item_attribute_field
	ADD return_length int NULL
GO

DROP INDEX U_IDX_item_attr_fld_id_name ON COLLECTION.item_attribute_field
GO
CREATE UNIQUE CLUSTERED INDEX U_IDX_item_attr_fld_name ON COLLECTION.item_attribute_field (item_attr_name) ON [PRIMARY];
GO
CREATE NONCLUSTERED INDEX IDX_item_attr_fld_type_id ON COLLECTION.item_attribute_field (type_id) ON [PRIMARY];
GO
ALTER TABLE COLLECTION.item_attribute_field ADD CONSTRAINT FK_item_attr_fld_data_type_id FOREIGN KEY (type_id) REFERENCES COLLECTION.attribute_data_type(type_id)
ON DELETE CASCADE;
GO

UPDATE
	iaf 
SET
	iaf.type_id = dt.type_id
FROM
	COLLECTION.item_attribute_field iaf 
	INNER JOIN COLLECTION.attribute_data_type dt 
	ON iaf.item_attr_data_type = dt.type_code

ALTER TABLE COLLECTION.item_attribute_field
	DROP COLUMN item_attr_data_type

UPDATE
	iaf 
SET 
	iaf.type_id = 1,
	iaf.return_length = 5
FROM
	COLLECTION.item_attribute_field iaf
WHERE
	iaf.item_attr_name = 'MAP NUMBER'

UPDATE
	iaf 
SET 
	iaf.return_length = 50
FROM
	COLLECTION.item_attribute_field iaf
WHERE
	iaf.item_attr_name = 'NAME'

UPDATE
	iaf 
SET 
	iaf.type_id = 1,
	iaf.return_length = 255
FROM
	COLLECTION.item_attribute_field iaf
WHERE
	iaf.item_attr_name IN ('MAIN SETTLEMENTS', 'DESCRIPTION', 'MAP TITLE')

 COMMIT TRANSACTION
 