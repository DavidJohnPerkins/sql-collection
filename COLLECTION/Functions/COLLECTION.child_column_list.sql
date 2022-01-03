USE Collections
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

DROP FUNCTION IF EXISTS COLLECTION.child_column_list
GO

CREATE FUNCTION COLLECTION.child_column_list(@p_collection_name varchar(255), @p_typed bit)
RETURNS varchar(MAX) AS 
BEGIN

	DECLARE @return_val varchar(MAX)
	
	SET @return_val = (
		SELECT
			STRING_AGG('[' + w.item_attr_name + ']' + CASE WHEN @p_typed = 1 THEN 
				w.type_code	ELSE '' END, ',')
		FROM (
			SELECT DISTINCT 
				ia.item_attr_id,
				iaf.item_attr_name,
				dt.type_code
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
