USE Collections
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'COLLECTION.collection_id') AND [type] IN ('F', 'FN'))
BEGIN 
	DROP FUNCTION COLLECTION.collection_id
	PRINT '########## COLLECTION.collection_id dropped successfully ##########'
END
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
PRINT '########## COLLECTION.collection_id created successfully ##########'
