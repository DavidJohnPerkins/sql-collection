USE Collections
GO

DROP FUNCTION IF EXISTS CORE.r_collection_sql;
GO

CREATE FUNCTION CORE.r_collection_sql(@p_collection_name varchar(255), @p_sort_col varchar(255))
RETURNS nvarchar(max) 
AS
BEGIN

	DECLARE @return_json	nvarchar(MAX),
			@sql			nvarchar(MAX) = '',
			@col_sql		varchar(MAX) = '',
			@r nvarchar(MAX)

	SET @col_sql = COLLECTION.child_column_list(@p_collection_name, 0)

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
			) AS pt
		ORDER BY
			[~key_col] FOR JSON AUTO'

	SET @sql = REPLACE(@sql, '~col_sql_sel', @col_sql)
	SET @sql = REPLACE(@sql, '~col_sql_pvt', @col_sql)
	SET @sql = REPLACE(@sql, '~coll_name', @p_collection_name)
	SET @sql = REPLACE(@sql, '~key_col', @p_sort_col)
	SET @sql = REPLACE(@sql, '^', '''')
	--print @sql

	--exec sp_executesql @sql, N'@r varchar(MAX) out', @r out

	RETURN @sql

END
GO
