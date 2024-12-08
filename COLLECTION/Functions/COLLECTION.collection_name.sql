USE Collections
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'COLLECTION.collection_name') AND [type] IN ('F', 'FN'))
BEGIN 
	DROP FUNCTION COLLECTION.collection_name
	PRINT '########## COLLECTION.collection_name dropped successfully ##########'
END
GO

CREATE FUNCTION COLLECTION.collection_name(@collection_id int)
RETURNS CORE.item_attr_name AS  
BEGIN
	DECLARE @return_val CORE.item_attr_name 

	SET @return_val = (
		SELECT TOP 1
			a.attr_value 
		FROM 
			COLLECTION.item_attribute a
			INNER JOIN COLLECTION.item i 
			ON a.item_id = i.item_id AND i.item_parent = 0
		WHERE
			i.item_id = @collection_id
	)

	RETURN @return_val
	
END
GO
PRINT '########## COLLECTION.collection_name created successfully ##########'
