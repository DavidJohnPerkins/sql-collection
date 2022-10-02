USE Collections
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

DROP VIEW IF EXISTS COLLECTION.base_OS_EXPLORER
GO

CREATE VIEW COLLECTION.base_OS_EXPLORER AS

	SELECT 
		CONVERT(varchar(20), [KEY_VALUE])			AS KEY_VALUE, 
		CONVERT(varchar(5), [MAP NUMBER])			AS [MAP NUMBER], 
		CONVERT(varchar(255), [MAP TITLE])			AS [MAP TITLE], 
		[PUBLISH DATE], 
		CONVERT(varchar(255), [MAIN SETTLEMENTS])	AS [MAIN SETTLEMENTS]
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
			i.item_parent = COLLECTION.collection_id('OS EXPLORER')
	) st
	PIVOT
	(
		MAX(st.attr_value)
		FOR st.item_attr_name IN (
			KEY_VALUE,
			[MAP NUMBER], 
			[MAP TITLE], 
			[PUBLISH DATE], 
			[MAIN SETTLEMENTS]
		)
	) AS pt

GO
