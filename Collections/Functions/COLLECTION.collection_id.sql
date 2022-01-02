USE Collections
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

DROP FUNCTION IF EXISTS COLLECTION.collection_id
GO

CREATE FUNCTION COLLECTION.collection_id(@collection_name varchar(255))
RETURNS int AS  
BEGIN
	DECLARE @return_val int 

	SET @return_val = (
		SELECT
			a.item_id 
		FROM 
			COLLECTION.item_attribute a
		WHERE
			a.attr_value = @collection_name
	)

	RETURN @return_val
	
END
GO
