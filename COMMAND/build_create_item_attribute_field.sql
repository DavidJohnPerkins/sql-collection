-- Script to build collection item deletion functionality

SET NOCOUNT ON
GO

PRINT 'EXECUTING SCRIPTS...'

:ON ERROR EXIT

USE Collections
GO

SET NOCOUNT ON

:r "COLLECTION/Tables/COLLECTION.attribute_data_type.sql"
:r "CORE/StoredProcedures/CORE.c_item_attribute_field.sql"
:r "CORE/StoredProcedures/CORE.cu_item_attribute_field.sql"
:r "COLLECTION/StoredProcedures/COLLECTION.c_item_attribute_field_json.sql"
:r "COLLECTION/StoredProcedures/COLLECTION.cu_item_attribute_field_json.sql"
GO

PRINT 'SCRIPT COMPLETE'
GO
