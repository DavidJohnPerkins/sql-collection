USE Collections
GO

DROP TYPE IF EXISTS CORE.field_list

CREATE TYPE CORE.field_list AS TABLE
(
	attr_name		varchar(20) NOT NULL,
	attr_type_code	char(1) NOT NULL,
	return_length	int
)
GO
