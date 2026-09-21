USE Collections
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'COLLECTION.child_column_list_base') AND [type] = 'TF')
BEGIN 
	DROP FUNCTION COLLECTION.child_column_list_base
	PRINT '########## COLLECTION.child_column_list_base dropped successfully ##########'
END
GO

CREATE FUNCTION COLLECTION.child_column_list_base(@p_collection_name CORE.collection_name)
RETURNS @result TABLE (
    item_attr_id            int,
    item_attr_name          varchar(20),
    return_length           int,
    return_length_is_auto   bit,
    type_sql                varchar(50),
    is_dimension            bit
)
BEGIN

    INSERT INTO @result
    SELECT DISTINCT
        ia.item_attr_id,
        UTILS.sqbr(iaf.item_attr_name) AS item_attr_name,
        iaf.return_length,
        dt.return_length_is_auto,
        dt.type_sql,
        iaf.is_dimension
    FROM
        COLLECTION.item_attribute ia
        INNER JOIN COLLECTION.item_attribute_field iaf
            INNER JOIN COLLECTION.attribute_data_type dt
            ON iaf.type_id = dt.type_id
        ON ia.item_attr_id = iaf.item_attr_id
        INNER JOIN COLLECTION.item iap
        ON iap.item_parent = COLLECTION.collection_id(@p_collection_name) AND ia.item_id = iap.item_id

	RETURN
	
END
GO
PRINT '########## COLLECTION.child_column_list_base created successfully ##########'
