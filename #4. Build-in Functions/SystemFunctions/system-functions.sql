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

SELECT @@IDENTITY--in case of empty MyTest table returns 1
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

--ISNULL
SELECT Id, LName, ISNULL(Salary, 0.0) AS Salary--returns second param when first is null,otherwise first
FROM Employees

DECLARE @myInt INT
PRINT @myInt
SELECT 3 + @myInt, 3 + ISNULL(@myInt, 0)

--COALESCE
SELECT COALESCE(NULL, NULL, 'three', 'four') --returns first value that isn't null