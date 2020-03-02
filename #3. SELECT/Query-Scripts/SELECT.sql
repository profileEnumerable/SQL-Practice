/*>>>>>>>>>>Transact-SQL:SELECT<<<<<<<<<<*/

--|--------Basic SELECT--------|--
--/ALL/ keyword using by default for fetching all the records and omit in all queries
SELECT All *
FROM Employees

--/DISTINCT/ using for fetching only unique records 
SELECT DISTINCT Department
FROM Employees

--/TOP/ fetch specific amount(10 as we specified here) of records
--#1 Constant
SELECT TOP 10 *
FROM Employees

--#2 Percentage
SELECT TOP 55 PERCENT *
FROM Employees

--/ORDER BY/
--#1 Default sorting by ascending
SELECT *
FROM Employees
ORDER BY LName

--#2 Sorting by FName in scope already sorted LName,
--Note: sorting will be preformed only in records with the same LName
SELECT *
FROM Employees
ORDER BY LName, FName

--#3 Sorting by date in chronological order
SELECT *
FROM Employees
ORDER BY BirthDate

--#4 Sorting by date in chronological descending order
SELECT *
FROM Employees
ORDER BY BirthDate DESC

--#4 Sorting by number of column
SELECT *
FROM Employees
ORDER BY 3, 2

--/WITH TIES/ Using for fetching all available rows with the same value as in last row(in Salary column)
--Note: for avoid missing rest of rows from the last type of value in Salary column 
SELECT TOP 20 WITH TIES FName, LName, Salary
FROM Employees
ORDER BY Salary DESC

--/SELECT INTO/ Creates a new table in which copy all records from selection
SELECT Id, LName, FName, Salary
INTO EmpSalaries
FROM Employees