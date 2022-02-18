USE Collections
GO

DROP TYPE IF EXISTS CORE.view_name
GO

CREATE TYPE CORE.view_name
FROM varchar(100) NOT NULL
