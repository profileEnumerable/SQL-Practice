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
WHERE Department = 'Sales' AND Salary >= 6000

--4) Selection that must satisfy at least one condition
SELECT *
FROM Employees
WHERE Department = 'Sales' OR Department = 'supply'

SELECT *
FROM Employees
--WHERE Department = 'Sales' OR Department = 'supply' AND Salary >= 6000 #Note: wrong way,broken sequence,needs round brackets
WHERE (Department = 'Sales' OR Department = 'supply') AND Salary >= 6000

--5) /IN/ searching for records that includes in predefined list of values
