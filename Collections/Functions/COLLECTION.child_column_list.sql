USE Collections
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

DROP FUNCTION IF EXISTS COLLECTION.child_column_list
GO

CREATE FUNCTION COLLECTION.child_column_list(@collection_name varchar(255), @p_typed bit /*, @collection_title varchar(255)*/)
RETURNS varchar(MAX) AS 
BEGIN

	DECLARE @return_val varchar(MAX)
	
	SET @return_val = (
		SELECT
			STRING_AGG('[' + w.item_attr_name + ']' + CASE WHEN @p_typed = 1 THEN 
				CASE w.item_attr_data_type 
					WHEN 'V' THEN ' varchar(255)'
					WHEN 'I' THEN ' int'
					WHEN 'F' THEN ' float'
					WHEN 'D' THEN ' date' END 
				ELSE 
					'' END, ',')
		FROM (
			SELECT DISTINCT 
				ia.item_attr_id,
				iaf.item_attr_name,
				iaf.item_attr_data_type
			FROM
				COLLECTION.item_attribute ia
				INNER JOIN COLLECTION.item_attribute_field iaf
				ON ia.item_attr_id = iaf.item_attr_id
				INNER JOIN COLLECTION.item iap
				ON iap.item_parent = COLLECTION.collection_id(@collection_name /*, @collection_title*/) AND ia.item_id = iap.item_id
			) w
	)

	RETURN @return_val
	
END
GO
