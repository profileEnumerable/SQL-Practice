CREATE DATABASE AdventureWorks2017
    ON (FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\AdventureWorks2017.mdf'),
    (FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\AdventureWorks2017_Log.ldf')
    FOR ATTACH;

USE AdventureWorks2017

--1) schema: sys

--Get all U - USER_TABLE
SELECT *
FROM sys.objects
WHERE type = 'U'

--Get all the entities that I created in this(AdventureWorks2017) DB
SELECT *
FROM sys.objects
WHERE schema_id = schema_id('Person')

--sys.views,triggers,indexes,sql_dependencies etc
SELECT *
FROM sys.tables

--Get information about functions
SELECT *
FROM sys.objects
WHERE type IN ('FN', 'FS', 'FT', 'IF')

--2) System stores procedure
--Returns information about all objects in the database
EXEC sp_help--ALT+F1

--Pass the name of entity to get information
EXEC sp_help 'Person.Address'--similar to sys.object view, but with separating by database entity

EXEC sp_tables--similar to sys.tables

EXEC sp_tables @TABLE_OWNER = 'dbo'
--specified the name of parameter 

--necessarily to pass the @table_name parameter    
EXEC sp_columns 'Address'
EXEC sp_pkeys 'Address' --researchc

EXEC sp_depends 'Person.Address'--entity dependencies