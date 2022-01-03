USE Collections
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

DROP FUNCTION IF EXISTS COLLECTION.column_list_convert
GO

CREATE FUNCTION COLLECTION.column_list_convert(@p_collection_name varchar(255))
RETURNS varchar(MAX) AS 
BEGIN

	DECLARE @return_val varchar(MAX)
	
	SET @return_val = (
		SELECT
			STRING_AGG('CONVERT(' + w.type_sql + ', [' + w.item_attr_name + ']) AS [' + w.item_attr_name + ']',  ', ')
		FROM (
			SELECT DISTINCT 
				ia.item_attr_id,
				iaf.item_attr_name,
				dt.type_sql + CASE WHEN dt.type_length IS NULL THEN ''
					ELSE '(' + CONVERT(varchar, dt.type_length) + ')' END AS type_sql
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
