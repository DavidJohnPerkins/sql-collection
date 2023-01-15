USE Collections
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'COLLECTION.r_collection') AND [type] IN ('P', 'PC'))
BEGIN 
	DROP PROCEDURE COLLECTION.r_collection
	PRINT '########## COLLECTION.r_collection dropped successfully ##########'
END
GO

CREATE PROCEDURE COLLECTION.r_collection(
	@p_collection_name	varchar(50),
	@p_sort_col			varchar(50) = null,
	@p_typed			bit = 0,
	@p_return_json		bit = 0,
	@p_debug			bit = 0,
	@p_execute			bit = 1
)
AS
BEGIN

	DECLARE	@sql		nvarchar(MAX) = '',
			@col_sql	nvarchar(MAX) = '',
			@col_pvt	nvarchar(MAX) = '',
			@result		nvarchar(MAX)

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
			~sort_col'

	SET @sql = REPLACE(@sql, '~col_sql_sel', @col_sql)
	SET @sql = REPLACE(@sql, '~col_sql_pvt', @col_pvt)
	SET @sql = REPLACE(@sql, '~coll_name', @p_collection_name)
	SET @sql = REPLACE(@sql, '~sort_col', ISNULL(@p_sort_col, '1'))

	IF @p_return_json = 1
		SET @sql = @sql + ' FOR JSON AUTO'

	SET @sql = REPLACE(@sql, '^', '''')

	IF @p_debug = 1
		PRINT @sql

	--INSERT INTO #t
	--EXEC (@sql)
	
	IF @p_execute = 1
		EXEC sp_executesql @sql, N'@result varchar(MAX) out', @result

END
GO
PRINT '########## COLLECTION.r_collection created successfully ##########'
