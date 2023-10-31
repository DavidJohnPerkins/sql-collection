USE Collections
GO

DROP TYPE IF EXISTS CORE.collection_list

CREATE TYPE CORE.collection_list AS TABLE
(
	collection_name			varchar(50) NOT NULL,
	collection_desc			varchar(50) NOT NULL,
	collection_started		date,
	collection_is_keyed		bit
)
GO
