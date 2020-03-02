/*>>>>>>>>>>Transact-SQL:CASE<<<<<<<<<<*/

--|--------/CASE/ expression--------|--

--1) Simple /CASE/ expression
--Note: analog of if/else
SELECT Id,
       LName,
       Salary,

       CASE
           WHEN Salary >= 8000 THEN 'chief'
           WHEN Salary >= 6000 THEN 'manager'
           WHEN Salary IS NULL THEN 'unknown'
           ELSE 'worker'
           END AS [Job Title],
--Note: omitted /ELSE/ keyword for capturing NULL values
       CASE
           WHEN Salary >= 8000 THEN 'chief'
           WHEN Salary >= 6000 THEN 'manager'
           WHEN Salary IS NULL THEN 'unknown'
           END AS [Job Title without ELSE]
FROM Employees
--2) /CASE/ Search expression 
--Note: after /CASE/ keyword we able to use the entry expression(analog of switch case)
SELECT Id,
       LName,
       Department,
       Salary,
       CASE Department --CASE  
           WHEN 'ADMINISTRATION & SUPPORT' THEN '100%' --WHEN Department = 'ADMINISTRATION & SUPPORT' THEN '100%'
           WHEN 'LAW' THEN '80%'
           WHEN 'FINANCE & ACCOUNTING' THEN '50%'
           ELSE '10%'
           END           AS [Bonus%],
       Salary / 100 *
       CASE Department
           WHEN 'ADMINISTRATION & SUPPORT' THEN 100
           WHEN 'LAW' THEN 80
           WHEN 'FINANCE & ACCOUNTING' THEN 50
           ELSE 10
           END           AS [BonusInMoney],
       (Salary / 100 * CASE Department
                           WHEN 'ADMINISTRATION & SUPPORT' THEN 100
                           WHEN 'LAW' THEN 80
                           WHEN 'FINANCE & ACCOUNTING' THEN 50
                           ELSE 10
           END) + Salary AS [TotalSalary]
FROM Employees

--IFF(appeared from SQL Server 2012)
SELECT Id,
       LName,
       Department,
       Salary,
       IIF(Salary >= 6000, 'manger', 'worker') AS Position
       --CASE WHEN Salary >= 6000 THEN 'manger' ELSE 'worker' END
FROM Employees

--Adding one more column for IFF example
ALTER TABLE Employees
    ADD Gender BIT

--/IIF/ Setting employee gender
UPDATE Employees
SET Gender = IIF(Id > 50, 1, 0)

--/IIF/ Selection with replacement 1 and 0 to words
SELECT Id,
       LName,
       IIF(Gender = 1, 'man', 'woman') AS Gender
FROM Employees

--/GROUP BY/ will create a group for each type of value
SELECT Department, Gender
FROM Employees
GROUP BY Department, Gender

--/GROUP BY/ analog with the same behavior, it's /DISTINCT/
SELECT DISTINCT Department, Gender
FROM Employees

--/HAVING/ analog of /WHERE/ clause, for filtering selection after /GROUP BY/
SELECT Department
FROM Employees
GROUP BY Department
HAVING Department LIKE 'L%'