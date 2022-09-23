USE Collections
GO

DROP TYPE IF EXISTS CORE.item_attr_value
GO

CREATE TYPE CORE.item_attr_value
FROM varchar(255) NOT NULL
