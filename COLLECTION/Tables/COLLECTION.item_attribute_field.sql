USE Collections
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

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
