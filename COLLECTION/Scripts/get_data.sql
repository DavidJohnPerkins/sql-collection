DECLARE @sql				nvarchar(MAX) = 'david',
		@col_sql			varchar(MAX) = '',
		--@coll_name		varchar(255) = 'OS LANDRANGER' ,
		@coll_name			varchar(255) = 'OS EXPLORER' ,
		@coll_title_attr	varchar(255) = 'NAME',
		@key_col			varchar(255) = 'MAP NUMBER',
		@r nvarchar(MAX)


set @sql = CORE.r_collection_sql('OS EXPLORER', 'MAP NUMBER')
print @sql;RETURN

exec sp_executesql @sql, N'@r nvarchar(MAX) out', @r out


SET @col_sql = COLLECTION.child_column_list(@coll_name, 0)


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
SET @sql = REPLACE(@sql, '~coll_name', @coll_name)
SET @sql = REPLACE(@sql, '~coll_title_attr', @coll_title_attr)
SET @sql = REPLACE(@sql, '~key_col', @key_col)
SET @sql = REPLACE(@sql, '^', '''')
print @sql


--select CORE.r_collection_sql('OS EXPLORER', 'NAME')
