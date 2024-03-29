USE Collections
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'COLLECTION.v_base') AND [type] IN ('V'))
BEGIN 
	DROP VIEW COLLECTION.v_base
	PRINT '########## COLLECTION.v_base dropped successfully ##########'
END
GO

CREATE VIEW COLLECTION.v_base AS

	SELECT 
		CONVERT(varchar(50), [NAME])			AS [NAME], 
		CONVERT(varchar(255), [DESCRIPTION])	AS [DESCRIPTION], 
		[STARTED],
		CONVERT(char(1), [KEYED_COLLECTION])	AS [KEYED_COLLECTION]
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
			i.item_parent = 0
	) st
	PIVOT
	(
		MAX(st.attr_value)
		FOR st.item_attr_name IN (
			[NAME],
			[DESCRIPTION], 
			[STARTED], 
			[KEYED_COLLECTION]
		)
	) AS pt

GO
PRINT '########## COLLECTION.v_base created successfully ##########'
