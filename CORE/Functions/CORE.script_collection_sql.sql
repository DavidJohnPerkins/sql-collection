USE Collections
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'CORE.script_collection_sql') AND [type] IN ('F', 'FN'))
BEGIN 
	DROP FUNCTION CORE.script_collection_sql
	PRINT '########## CORE.script_collection_sql dropped successfully ##########'
END
GO

CREATE FUNCTION CORE.script_collection_sql(@p_collection_name CORE.collection_name)
RETURNS nvarchar(max) 
AS
BEGIN

	DECLARE	@sql		CORE.sql_var = '',
			@return_sql	CORE.sql_var,
			@col_sql	CORE.sql_var = '',
			@col_pvt	CORE.sql_var = '',
			@result		CORE.sql_var

	SET @col_sql = COLLECTION.child_column_list(@p_collection_name, 1)
	SET @col_pvt = COLLECTION.child_column_list(@p_collection_name, 0)

	SET @sql = '
		SELECT 
			~col_sql_sel
		FROM (
			SELECT 
				i.item_id ,
				ia.attr_value ,
				af.item_attr_name 
			FROM
				COLLECTION.item_attribute_field af
				INNER JOIN COLLECTION.item_attribute ia
					INNER JOIN COLLECTION.item i
					ON ia.item_id = i.item_id
				ON af.item_attr_id = ia.item_attr_id
			WHERE
				i.item_parent = COLLECTION.collection_id(^~coll_name^)
			) st
			PIVOT
			(
				MAX(st.attr_value)
				FOR st.item_attr_name IN (
					~col_sql_pvt
				)
			) AS pt'

	SET @sql = REPLACE(@sql, '~col_sql_sel', @col_sql)
	SET @sql = REPLACE(@sql, '~col_sql_pvt', @col_pvt)
	SET @sql = REPLACE(@sql, '~coll_name', @p_collection_name)

	SET @sql = REPLACE(@sql, '^', '''')

	RETURN @sql

END
GO
PRINT '########## CORE.script_collection_sql created successfully ##########'
