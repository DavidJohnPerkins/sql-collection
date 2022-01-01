USE Collections
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('COLLECTION.item_attribute', 'U') IS NOT NULL
BEGIN
	DROP INDEX IF EXISTS U_IDX_coll_attr_id_name ON COLLECTION.item_attribute
	DROP TABLE COLLECTION.item_attribute
END
GO

CREATE TABLE COLLECTION.item_attribute
(
	attr_id			int IDENTITY(1, 1)	NOT NULL ,
	item_id			int					NOT NULL ,
	item_attr_id	int					NOT NULL ,
	attr_value		varchar(255)		NOT NULL ,
	create_date		date				NOT NULL DEFAULT GETDATE(),
	create_user		varchar(50)			NOT NULL DEFAULT SYSTEM_USER
)
GO
ALTER TABLE COLLECTION.item_attribute ADD PRIMARY KEY NONCLUSTERED 
(
	attr_id ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE UNIQUE CLUSTERED INDEX UC_IDX_itemattr_itemidattrid ON COLLECTION.item_attribute (item_id, item_attr_id) ON [PRIMARY];
GO

ALTER TABLE COLLECTION.item_attribute ADD CONSTRAINT FK_item_item_id FOREIGN KEY (item_id) REFERENCES COLLECTION.item(item_id)
	ON DELETE CASCADE;
GO

ALTER TABLE COLLECTION.item_attribute ADD CONSTRAINT FK_itemattrfld_item_attr_id FOREIGN KEY (item_attr_id) REFERENCES COLLECTION.item_attribute_field(item_attr_id)
	ON DELETE CASCADE;
GO
