USE Collections
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'COLLECTION.r_collection_crystallise') AND [type] IN ('P', 'PC'))
BEGIN 
	DROP PROCEDURE COLLECTION.r_collection_crystallise
	PRINT '########## COLLECTION.r_collection_crystallise dropped successfully ##########'
END
GO

CREATE PROCEDURE COLLECTION.r_collection_crystallise(
	@p_collection_name	CORE.collection_name,
	@p_debug			bit = 0
)
AS
BEGIN

	DECLARE	@sql		CORE.sql_var = '',
			@col_sql	CORE.sql_var = '',
			@col_pvt	CORE.sql_var = '',
			@view_name	CORE.view_name,
			@result		CORE.sql_var

	SET @col_sql = COLLECTION.child_column_list(@p_collection_name, 1)
	SET @col_pvt = COLLECTION.child_column_list(@p_collection_name, 0)

	SET @view_name = 'COLLECTION.v_base_' + REPLACE(@p_collection_name, ' ', '_')

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
GO
PRINT '########## COLLECTION.r_collection_crystallise created successfully ##########'