USE Collections
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'COLLECTION.v_base_INK_COLLECTION') AND [type] IN ('V'))
BEGIN 
	DROP VIEW COLLECTION.v_base_INK_COLLECTION
	PRINT '########## COLLECTION.v_base_INK_COLLECTION dropped successfully ##########'
END
GO

CREATE VIEW COLLECTION.v_base_INK_COLLECTION AS

	SELECT 
		CONVERT(varchar(20), [KEY_VALUE])		AS KEY_VALUE, 
		CONVERT(varchar(50), [BRAND])			AS BRAND, 
		CONVERT(varchar(50), [RANGE])			AS [RANGE], 
		CONVERT(varchar(50), [CONTAINER])		AS CONTAINER, 
		CONVERT(varchar(50), [CONTAINER_SIZE]) 	AS CONTAINER_SIZE, 
		CONVERT(varchar(50), [COLOUR])			AS COLOUR, 
		[QTY_REMAINING]							AS QTY_REMAINING, 
		[RATING]								AS RATING, 
		CONVERT(varchar(50), [INK_NAME])		AS INK_NAME
	FROM (
		SELECT 
			i.item_id ,
			ia.attr_value ,
			af.item_attr_name 
		FROM
			COLLECTION.item_attribute_field af
			INNER JOIN COLLECTION.item_attribute ia
				INNER JOIN COLLECTION.item i
				ON ia.item_id = i.item_id
			ON af.item_attr_id = ia.item_attr_id
		WHERE
			i.item_parent = COLLECTION.collection_id('INK COLLECTION')
	) st
	PIVOT
	(
		MAX(st.attr_value)
		FOR st.item_attr_name IN (
			KEY_VALUE,
			BRAND, 
			[RANGE], 
			CONTAINER, 
			CONTAINER_SIZE, 
			COLOUR, 
			QTY_REMAINING, 
			RATING, 
			INK_NAME
		)
	) AS pt

GO
PRINT '########## COLLECTION.v_base_INK_COLLECTION created successfully ##########'
