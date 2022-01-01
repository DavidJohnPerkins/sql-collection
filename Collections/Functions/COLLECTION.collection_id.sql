USE Collections
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

DROP FUNCTION IF EXISTS COLLECTION.collection_id
GO

CREATE FUNCTION COLLECTION.collection_id(@collection_name varchar(255) /*, @collection_title varchar(255)*/)
RETURNS int AS  
BEGIN
	DECLARE @return_val int 

	SET @return_val = (
		SELECT
			a.item_id 
		FROM 
			COLLECTION.item_attribute a
			INNER JOIN COLLECTION.item_attribute_field af
			ON a.item_attr_id = af.item_attr_id
		WHERE
			a.attr_value = @collection_name /*AND
			af.item_attr_name = @collection_title*/
	)

	RETURN @return_val
	
END
GO
