--DateTime functions

SELECT GETDATE(),--t-sql implementation
       CURRENT_TIMESTAMP
--implemented by sql standard 

--DATENAME, DATEPART, DAY, MONTH,YEAR 
--Find employees that was born in december
SELECT Id, LName, BirthDate
FROM Employees
WHERE DATEPART(YEAR, BirthDate) = 1988

DECLARE @date AS DATE = GETDATE()

SELECT DATENAME(YY, @date),
       DATENAME(MONTH, @date) AS [Month as a string],
       DATEPART(MONTH, @date) AS [Month as a number],
       DATENAME(QUARTER, @date),--}
       --the same behavior 
       DATEPART(QUARTER, @date),---}
       DAY(@date)             AS [DAY],
       MONTH(@date)           AS [MONTH],
       YEAR(@date)            AS [YEAR]
--Current week day as a string ex: Friday
SELECT DATENAME(WEEKDAY, GETDATE())

--DATEFROMPARTS,DATETIMEFROMPARTS,TIMEFROMPARTS 
SELECT DATEFROMPARTS(1999, 09, 15),
       DATETIMEFROMPARTS(1999, 09, 15, 8, 20, 1, 2),
       TIMEFROMPARTS(8, 20, 1, 2, 3)

--DATEDIFF DATEADD
SELECT DATEDIFF(YEAR, '20170101', '20200101')  AS [YEARS],
       DATEDIFF(MONTH, '20170831', '20171201') AS [MONTHS],--calculates the number of overcome boundaries. Res:4,but really 3
       DATEADD(QUARTER, -1, GETDATE())

--Practical examples
--Note: less(but Sql server 2017 shows the same results in both queries) accurate example
SELECT Id, LName, BirthDate
FROM Employees
WHERE DATEDIFF(YEAR, BirthDate, GETDATE()) < 30

--Note: more accurate example
SELECT Id, LName, BirthDate
FROM Employees
WHERE BirthDate > DATEADD(YEAR, -30, GETDATE());


declare @pastDate as date = DATEADD(YEAR, -30, GETDATE())
print @pastDate


