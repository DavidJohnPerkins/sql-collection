USE Collections
GO

DROP TYPE IF EXISTS CORE.sql_var
GO

CREATE TYPE CORE.sql_var
FROM nvarchar(MAX) NOT NULL
