/*>>>>>>>>>>Transact-SQL:DDL<<<<<<<<<<*/

--|--------Interaction with DATABASES--------|--
--Create Database
CREATE DATABASE EStoreDB ON PRIMARY
    ( NAME = N'EStoreDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\EStoreDB.mdf' , SIZE = 167872 KB , MAXSIZE = UNLIMITED, FILEGROWTH = 16384 KB )
    LOG ON
    ( NAME = N'EStoreDB_Log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\EStoreDB_Log.ldf' , SIZE = 2048 KB , MAXSIZE = 2048 GB , FILEGROWTH = 16384 KB )

--Alter Database
ALTER DATABASE EStoreDB
    COLLATE Cyrillic_General_CI_AS

--Move to the EStoreDB database
use EStoreDB

--Drop Database
DROP DATABASE EStoreDB

--|--------Interaction with TABLES--------|--

--Create TABLE

CREATE TABLE Goods
(
    id     int         NOT NULL IDENTITY,
    Name   varchar(35) NOT NULL,
    Cost   decimal     NOT NULL,
    Weight int
);

--Alter table column

ALTER TABLE Goods
    ALTER COLUMN Weight int NOT NULL

--Add table column 
ALTER TABLE Goods
    ADD Sale decimal

--Drop table column
ALTER TABLE Goods
    DROP COLUMN Sale

/*>>>>>>>>>>DML<<<<<<<<<<*/

--INSERT data to TABLE
use EStoreDB

--Basic INSERT 
-- We should dont specified keyword: INTO
INSERT Goods
(Name, Cost, Weight)
VALUES ('SmartTV', 50000, 17),
       ('Headphones', 3000, 0.3),
       ('Purse', 1000, 0.1)

--INSERT with specified IDENTITY(Id) column 
SET IDENTITY_INSERT Goods ON

INSERT INTO Goods
(id, Name, Cost, Weight)
VALUES (50, 'Graphic Card', 6500, 0.45)

SET IDENTITY_INSERT Goods OFF

--SELECT all the rows
SELECT *
FROM Goods

--SELECT specific rows
SELECT [Name], [Weight]
FROM Goods

--SELECT with filter
SELECT [Name]
FROM Goods
WHERE id = 1
