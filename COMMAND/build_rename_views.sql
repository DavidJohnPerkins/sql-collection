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

-- FUNCTIONS
:r "COLLECTION/Functions/COLLECTION.child_column_list.sql"

-- VIEWS
:r "COLLECTION/Views/COLLECTION.v_attribute_list.sql"
:r "COLLECTION/Views/COLLECTION.v_base.sql"

-- STORED PROCEDURES
:r "CORE/StoredProcedures/CORE.cu_collection_item.sql"
:r "CORE/StoredProcedures/CORE.d_collection_item.sql"
:r "CORE/StoredProcedures/CORE.ru_attribute.sql"
:r "COLLECTION/StoredProcedures/COLLECTION.r_collection_crystallise.sql"
GO

EXEC COLLECTION.r_collection_crystallise 'INK COLLECTION'
EXEC COLLECTION.r_collection_crystallise 'OS EXPLORER'
EXEC COLLECTION.r_collection_crystallise 'OS LANDRANGER'

PRINT 'SCRIPT COMPLETE'
GO
