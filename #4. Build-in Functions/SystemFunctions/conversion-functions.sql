/*>>>>>>>>>>Transact-SQL:Conversion functions<<<<<<<<<<*/

--CAST and CONVERT - converts expression with one data type to another
SELECT 10 / 3,
       10. / 3,
       CAST(10 AS DECIMAL) / 3,
       CONVERT(DECIMAL, 10) / 3

--CONVERT to DATETIME
SELECT CONVERT(DATETIME, '20200203 14:10:9')

--GETDATE() returns current datetime
SELECT GETDATE()                             AS UnconvertedDateTime,
       CAST(GETDATE() AS NVARCHAR(30))       AS UsingCast,
       CONVERT(NVARCHAR(30), GETDATE(), 126) AS UsingConvertTo_ISO8601

--PARSE:
--with DATETIME2, 
SELECT PARSE('Monday, 9 December 2019' AS DATETIME2 USING 'en-US') AS Result;

--with currency symbol
SELECT PARSE('€535,98' AS MONEY USING 'de-DE') AS Result;

--English language is mapped to en-US culture  
SET LANGUAGE 'English';
SELECT PARSE('9/10/2019' AS DATETIME2) AS Result;

--TRY_CAST, TRY_CONVERT, TRY_PARSE - works as previous, but in case of failed conversion
--returns NULL

SELECT TRY_CAST('12/31/2019' AS DATE),
       TRY_CAST('31/12/2019' AS DATE),
       TRY_CONVERT(DATE, '12/31/2019'),
       TRY_CONVERT(DATE, '31/12/2019')
       

