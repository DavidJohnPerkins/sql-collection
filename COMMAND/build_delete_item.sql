-- Script to build collection item deletion functionality

SET NOCOUNT ON
GO

PRINT 'EXECUTING SCRIPTS...'

:ON ERROR EXIT

USE Collections
GO

SET NOCOUNT ON

:r "COLLECTION/Views/COLLECTION.attribute_list.sql"
:r "CORE/StoredProcedures/CORE.d_collection_item.sql"
:r "COLLECTION/StoredProcedures/COLLECTION.d_collection_item_json.sql"
GO

PRINT 'SCRIPT COMPLETE'
GO
