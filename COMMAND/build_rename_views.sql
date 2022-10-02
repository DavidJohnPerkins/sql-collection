-- Script to build collection item deletion functionality

SET NOCOUNT ON
GO

PRINT 'EXECUTING SCRIPTS...'

:ON ERROR EXIT

USE Collections
GO

SET NOCOUNT ON

DROP VIEW IF EXISTS COLLECTION.attribute_list
GO

DROP VIEW IF EXISTS COLLECTION.base
GO

DROP VIEW IF EXISTS COLLECTION.base_INK_COLLECTION
GO

DROP VIEW IF EXISTS COLLECTION.base_OS_EXPLORER
GO

-- VIEWS
:r "COLLECTION/Views/COLLECTION.v_attribute_list.sql"
:r "COLLECTION/Views/COLLECTION.v_base.sql"
:r "COLLECTION/Views/COLLECTION.v_base_INK_COLLECTION.sql"
:r "COLLECTION/Views/COLLECTION.v_base_OS_EXPLORER.sql"

-- STORED PROCEDURES
:r "CORE/StoredProcedures/CORE.cu_collection_item.sql"
:r "CORE/StoredProcedures/CORE.d_collection_item.sql"
:r "CORE/StoredProcedures/CORE.ru_attribute.sql"
:r "COLLECTION/StoredProcedures/COLLECTION.r_collection_crystallise.sql"

GO

PRINT 'SCRIPT COMPLETE'
GO
