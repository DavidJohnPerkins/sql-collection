USE Collections
GO

DROP TYPE IF EXISTS CORE.item_attr_name
GO

CREATE TYPE CORE.item_attr_name
FROM varchar(20) NOT NULL
