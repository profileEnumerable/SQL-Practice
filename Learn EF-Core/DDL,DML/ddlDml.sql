/*>>>>>>>>>>Transact-SQL:DDL<<<<<<<<<<*/

--|--------Interaction with DATABASES--------|--
--Create Database
CREATE DATABASE EStoreDB ON PRIMARY
    ( NAME = N'EStoreDB', FILENAME = N'fileName' , SIZE = 167872 KB , MAXSIZE = UNLIMITED, FILEGROWTH = 16384 KB )
    LOG ON
    ( NAME = N'EStoreDB_Log', FILENAME = N'fileName' , SIZE = 2048 KB , MAXSIZE = 2048 GB , FILEGROWTH = 16384 KB )

--Alter Database
ALTER DATABASE EStoreDB
COLLATE Cyrillic_General_CI_AS

--Move to the EStoreDB database
use EStoreDB

--Drop Database
DROP DATABASE EStoreDB

--|--------Interaction with TABLES--------|--

--Create TABLE

CREATE TABLE Goods(
    id int NOT NULL IDENTITY,
    Name varchar(35) NOT NULL,
    Cost decimal NOT NULL,
    Weight int    
);

--Alter table column

ALTER TABLE Goods
ALTER COLUMN Weight int NOT NULL 