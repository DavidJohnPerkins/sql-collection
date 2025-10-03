USE Collections
GO

DROP TYPE IF EXISTS CORE.comment_list

CREATE TYPE CORE.comment_list AS TABLE
(
	item_key_value	varchar(20) NOT NULL,
	item_comment	varchar(255) NOT NULL
)
GO
