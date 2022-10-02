-- Script to build collection item deletion functionality

SET NOCOUNT ON
GO

PRINT 'EXECUTING SCRIPTS...'

:ON ERROR EXIT

USE Collections
GO

SET NOCOUNT ON

DROP PROCEDURE IF EXISTS COLLECTION.cu_collection_item_json
GO

:r "COLLECTION/StoredProcedures/COLLECTION.c_collection_item_json.sql"
:r "COLLECTION/StoredProcedures/COLLECTION.c_item_attribute_field_json.sql"
:r "COLLECTION/StoredProcedures/COLLECTION.c_item_attribute_field_json.sql"
:r "COLLECTION/StoredProcedures/COLLECTION.d_collection_item_json.sql"
:r "COLLECTION/StoredProcedures/COLLECTION.r_collection_crystallise.sql"

:r "CORE/StoredProcedures/CORE.c_item_attribute_field.sql"
:r "CORE/StoredProcedures/CORE.cu_collection_item.sql"
:r "CORE/StoredProcedures/CORE.d_collection_item.sql"
:r "CORE/StoredProcedures/CORE.ru_attribute.sql"
GO

PRINT 'SCRIPT COMPLETE'
GO