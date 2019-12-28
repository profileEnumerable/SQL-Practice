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

/*>>>>>>>>>>Transact-SQL:DML<<<<<<<<<<*/
use EStoreDB

--Basic /INSERT/ 
-- We should dont specified keyword: INTO
INSERT INTO Goods
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

--INSERT from selected data
CREATE TABLE SoftwareGoods
(
    Id   int,
    Name varchar(35),
    Cost decimal(18)
);

INSERT INTO SoftwareGoods
SELECT Id, Name, Cost
FROM Goods

--Basic /SELECT/
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


--Basic /UPDATE/
--#1 UPDATE specific record/s in TABLE  
UPDATE Goods
SET Sale = 70
WHERE Name = 'SmartTV'

--#2 UPDATE all table records namely: Sale fields
UPDATE Goods
SET Sale = 1


--#3 UPDATE "Cost" field herewith using data from another("SoftwareGoods") table 
UPDATE Goods
SET Cost = sg.Cost
FROM Goods AS g
         JOIN SoftwareGoods AS sg ON g.id = sg.Id

--Basic /DELETE/
--DELETE specific row
DELETE Goods
WHERE id = 52

--DELETE all row herewith dont reset the IDENTITY value for field: "id"  
DELETE Goods

--Basic /TRUNCATE/ 
--TRUNCATE TABLE
TRUNCATE TABLE Goods
TRUNCATE TABLE SoftwareGoods

--Intermediate command /OUTPUT/
--Check "inserted" TABLE when make an INSERT query
INSERT INTO Goods (Name, Cost, Weight)
OUTPUT inserted.*
VALUES ('Soundbar', 10000, 3),
       ('Notepad', 200, 0.2),
       ('Gamepad', 2000, 0.3)

--Check "deleted" TABLE when make a DELETE query
DELETE Goods
OUTPUT deleted.id , deleted.Name
WHERE id = 2

--Check both inserted/deleted tables when make an UPDATE query
UPDATE Goods
SET Sale = 50
OUTPUT inserted.id ,inserted.Name, inserted.Sale AS ["New Sale"] ,deleted.Sale "Old Sale"
WHERE id = 4

--Write affected data from deleted(syst. table) to another table
DELETE Goods
OUTPUT deleted.id , deleted.Name, deleted.Cost INTO SoftwareGoods

--Usage TABLE variable with OUTPUT keyword
DECLARE @softwareGoodsTable TABLE
                            (
                                [id]   int,
                                [Name] varchar(35)
                            )

--DELETE all table rows and put their INTO "@softwareGoodsTable" variable 
DELETE SoftwareGoods
OUTPUT deleted.Id , deleted.Name INTO @softwareGoodsTable

SELECT *
FROM @softwareGoodsTable