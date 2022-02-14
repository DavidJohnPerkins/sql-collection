USE Collections
GO

DROP TYPE IF EXISTS CORE.collection_name
GO

CREATE TYPE CORE.collection_name
FROM varchar(50) NOT NULL
