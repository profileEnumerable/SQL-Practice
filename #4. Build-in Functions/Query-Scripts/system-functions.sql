/*>>>>>>>>>>Transact-SQL:Built-in/Scalar Functions<<<<<<<<<<*/

--|--------Systems Functions--------|--
--ERROR: as a system function
DECLARE @myInt INT
SET @myInt = 'ASD'
GO

SELECT @@ERROR as [Error number]
GO
--ERORR: more detailed example 
BEGIN TRY
    DECLARE @myInt INT
    SET @myInt = 1 / 0
END TRY
BEGIN CATCH
    SELECT ERROR_NUMBER()    AS ErorNumber,
           ERROR_SEVERITY()  AS ErrorSeverity,
           ERROR_STATE()     AS ErrorState,
           ERROR_PROCEDURE() AS ErrorProcedure,
           ERROR_LINE()      AS ErrorLine,
           ERROR_MESSAGE()   AS ErrorMessage
END CATCH

--@@IDENTITY:returns value of latest inserted identifier

INSERT INTO MyTest (Field)
VALUES ('DATA')
GO

SELECT @@IDENTITY--in case of emty MyTest table returns 1
GO

--@ROWCOUNT:returns amount of modified records by last executed command
--UPDATE 
UPDATE MyTest
SET Field = 'NEW DATA'
WHERE Id = 1
GO

SELECT @@ROWCOUNT--given that table is empty expected result 1
GO
--DELETE
DELETE MyTest
GO
SELECT @@ROWCOUNT--1 if the table has been contained one record
GO

--NEWID:creates unique value of uniqueidentifier type
DECLARE @myId UNIQUEIDENTIFIER
SET @myId = NEWID()
PRINT @myId

--ISNUMERIC
SELECT ISNUMERIC('21'),
       ISNUMERIC(10),
       ISNUMERIC('1asd'),
       ISNUMERIC(@myId),
       ISNUMERIC('+'),--But &,@,* are not recognized as numeric
       ISNUMERIC('-')
