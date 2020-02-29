/*>>>>>>>>>>Transact-SQL:WHERE<<<<<<<<<<*/

--|--------Basic WHERE--------|--

-- 1) /WHERE/ with the equal operator
SELECT *
FROM Employees
WHERE Salary = 10000

SELECT *
FROM Employees
WHERE Department = 'sales'

--2) /WHERE/ with a comparison operator
SELECT *
FROM Employees
WHERE BirthDate > '19950102'

SELECT *
FROM Employees
WHERE BirthDate !> '19950101'

--3) Selection with multiple conditions
SELECT *
FROM Employees
WHERE Department = 'Sales'
  AND Salary >= 6000

--4) Selection that must satisfy at least one condition
SELECT *
FROM Employees
WHERE Department = 'sales'
   OR Department = 'supply'

SELECT *
FROM Employees
--WHERE Department = 'Sales' OR Department = 'supply' AND Salary >= 6000 #Note: wrong way,broken sequence,needs round brackets
WHERE (Department = 'sales' OR Department = 'supply')
  AND Salary >= 6000

--5) /IN/ searching for records that includes values from predefined list: 'sales', 'supply', 'law', 'logistics'
SELECT *
FROM Employees
WHERE Department IN ('sales', 'supply', 'law', 'logistics')

--/IN/ along with subquery that fetching range of values 
--Note: interesting behavior, this query return 89 records
SELECT *
FROM Employees
WHERE Salary IN (SELECT Salary FROM Employees)

--6) /BETWEEN/ looks for records that contain a value from range
--Simple query, without /BETWEEN/ operator  
SELECT *
FROM Employees
WHERE BirthDate > '19850102'
  AND BirthDate < '19870102'
--With using /BETWEEN/ operator
SELECT *
FROM Employees
WHERE BirthDate BETWEEN '19850102' AND '19870102'

--7) /LIKE/ looks for a records, that contain value as a part of string 
SELECT *
FROM Employees
WHERE Department LIKE 'sales'

--Note: Wildcard characters (%, _, [], [^])
--/%/ any amount of any characters
SELECT *
FROM Employees
WHERE Phone LIKE '063%' 

--/_/ any one character
SELECT *
FROM Employees
WHERE Id LIKE '_2'

--/[]/ range of characters
--1) explicitly defined  range
SELECT *
FROM Employees
WHERE Id LIKE '[2,4]2'

--2) implicitly defined range