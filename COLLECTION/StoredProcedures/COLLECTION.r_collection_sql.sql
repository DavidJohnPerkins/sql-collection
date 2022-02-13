USE Collections
GO

DROP PROCEDURE IF EXISTS COLLECTION.r_collection_sql
GO
CREATE PROCEDURE COLLECTION.r_collection_sql(
	@p_collection_name	varchar(50),
	@p_sort_col			varchar(50),
	@p_typed			bit = 0,
	@p_return_json		bit = 0,
	@p_debug			bit = 0
)
AS
BEGIN

	DECLARE	@sql		nvarchar(MAX) = '',
			@col_sql	nvarchar(MAX) = '',
			@col_pvt	nvarchar(MAX) = '',
			@result		nvarchar(MAX)

	/*
	IF @p_typed = 0
		SET @col_sql = COLLECTION.child_column_list(@p_collection_name, 0)
	ELSE
		SET @col_sql = COLLECTION.column_list_convert(@p_collection_name)
	*/

	SET @col_sql = COLLECTION.child_column_list(@p_collection_name, @p_typed)
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
			) AS pt
		ORDER BY
			[~key_col] ~return_type'

	SET @sql = REPLACE(@sql, '~col_sql_sel', @col_sql)
	SET @sql = REPLACE(@sql, '~col_sql_pvt', @col_pvt)
	SET @sql = REPLACE(@sql, '~coll_name', @p_collection_name)
	SET @sql = REPLACE(@sql, '~key_col', @p_sort_col)

	IF @p_return_json = 0
	BEGIN
		SET @sql = REPLACE(@sql, '~return_type', '')
	END
	ELSE
	BEGIN
		SET @sql = REPLACE(@sql, '~return_type', 'FOR JSON AUTO')
	END

	SET @sql = REPLACE(@sql, '^', '''')

	IF @p_debug = 1
		PRINT @sql

	--INSERT INTO #t
	--EXEC (@sql)
	
	EXEC sp_executesql @sql, N'@result varchar(MAX) out', @result
END
