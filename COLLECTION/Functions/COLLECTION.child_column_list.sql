USE Collections
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'COLLECTION.child_column_list') AND [type] IN ('F', 'FN'))
BEGIN 
	DROP FUNCTION COLLECTION.child_column_list
	PRINT '########## COLLECTION.child_column_list dropped successfully ##########'
END
GO

CREATE FUNCTION COLLECTION.child_column_list(@p_collection_name CORE.collection_name, @p_typed bit)
RETURNS CORE.sql_var AS 
BEGIN

	DECLARE @return_val varchar(MAX)
	
	SET @return_val = (
		SELECT
			STRING_AGG( 
				CASE WHEN @p_typed = 1 THEN
					CASE WHEN  w.return_length_is_auto = 0 THEN
						'COALESCE(CONVERT(' + w.type_sql + '(' + CONVERT(varchar, w.return_length) + '), ' + w.item_attr_name + '), '''')' + ' AS ' + w.item_attr_name
					ELSE 
						'CONVERT(' + w.type_sql + ', ' + w.item_attr_name + ') AS ' + w.item_attr_name END
				ELSE w.item_attr_name END, ', ')
		FROM
            COLLECTION.child_column_list_base(@p_collection_name) w
	)

	RETURN @return_val
	
END
GO
PRINT '########## COLLECTION.child_column_list created successfully ##########'
