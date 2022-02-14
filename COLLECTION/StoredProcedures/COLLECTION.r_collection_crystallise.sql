USE Collections
GO

DROP PROCEDURE IF EXISTS COLLECTION.r_collection_crystallise
GO

CREATE PROCEDURE COLLECTION.r_collection_crystallise(
	@p_collection_name	CORE.collection_name,
	@p_debug			bit = 0
)
AS
BEGIN

	DECLARE	@sql		nvarchar(MAX) = '',
			@col_sql	nvarchar(MAX) = '',
			@col_pvt	nvarchar(MAX) = '',
			@view_name	CORE.view_name,
			@result		nvarchar(MAX)

	SET @col_sql = COLLECTION.child_column_list(@p_collection_name, 1)
	SET @col_pvt = COLLECTION.child_column_list(@p_collection_name, 0)

	SET @view_name = 'COLLECTION.base_' + REPLACE(@p_collection_name, ' ', '_')

	SET @sql = 'DROP VIEW IF EXISTS ' + @view_name
	EXEC (@sql)

	SET @sql = '
		CREATE VIEW ~view_name AS
		~script_sql
	'

	SET @sql = REPLACE(@sql, '~view_name', @view_name)
	SET @sql = REPLACE(@sql, '~script_sql', CORE.script_collection_sql(@p_collection_name))

	IF @p_debug = 1
		PRINT @sql

	EXEC (@sql)

END
