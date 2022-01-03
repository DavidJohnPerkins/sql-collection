USE Collections
GO

IF OBJECT_ID('COLLECTION.attribute_data_type', 'U') IS NOT NULL
	DROP TABLE COLLECTION.attribute_data_type
GO

CREATE TABLE COLLECTION.attribute_data_type
(
	type_id			int 			NOT NULL IDENTITY(1, 1) , 
	type_sql		varchar(50)		NOT NULL ,
	type_length		int				NULL,
	type_code		varchar(10)		NOT NULL,
	create_date		date			NOT NULL DEFAULT GETDATE(),
	create_user		varchar(255)	NOT NULL DEFAULT SYSTEM_USER
)
GO
ALTER TABLE COLLECTION.attribute_data_type ADD PRIMARY KEY CLUSTERED 
(
	type_id ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
