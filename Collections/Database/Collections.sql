USE master
GO

-- CREATE LOGIN dp WITH PASSWORD = 'dp', CHECK_POLICY=OFF

IF EXISTS (SELECT d.[name]  FROM sys.databases d WHERE d.[name] = N'Collections')
BEGIN
	ALTER DATABASE Collections SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE Collections
END
GO

CREATE DATABASE Collections
GO

CREATE USER	dp FOR LOGIN dp
EXEC sp_addrolemember 'db_owner', 'sa'
