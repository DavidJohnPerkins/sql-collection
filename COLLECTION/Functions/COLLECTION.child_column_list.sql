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
					CASE WHEN  w.return_length IS NOT NULL THEN
					'CONVERT(' + w.type_sql + '(' + CONVERT(varchar, w.return_length) + '), ' + item_attr_name + ')' + ' AS ' + item_attr_name ELSE item_attr_name END
				ELSE item_attr_name END, ', ')
		FROM (
			SELECT DISTINCT 
				ia.item_attr_id,
				UTILS.sb(iaf.item_attr_name) AS item_attr_name,
				iaf.return_length,
				dt.type_sql
			FROM
				COLLECTION.item_attribute ia
				INNER JOIN COLLECTION.item_attribute_field iaf
					INNER JOIN COLLECTION.attribute_data_type dt 
					ON iaf.type_id = dt.type_id				
				ON ia.item_attr_id = iaf.item_attr_id
				INNER JOIN COLLECTION.item iap
				ON iap.item_parent = COLLECTION.collection_id(@p_collection_name) AND ia.item_id = iap.item_id
		) w
	)

	RETURN @return_val
	
END
GO
PRINT '########## COLLECTION.child_column_list created successfully ##########'
