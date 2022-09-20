USE Collections
GO

DROP TYPE IF EXISTS CORE.item_list

CREATE TYPE CORE.item_list AS TABLE
(
	parent_item		varchar(20) NULL,
	--item_key		varchar(255) NOT NULL,
	attr_name		varchar(20) NOT NULL,
	attr_value		varchar(255) NOT NULL
)
GO
