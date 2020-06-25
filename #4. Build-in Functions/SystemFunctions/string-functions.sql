/*>>>>>>>>>>Transact-SQL:String functions<<<<<<<<<<*/

--ASCII / UNICODE - returns ASCII/UNICODE code of the first symbol within
--specified string expression

SELECT ASCII('t-sql')     [ASCII],
       UNICODE(N'запрос') [UNICODE]

--CHAR / NCHAR - converts integer code ASCII/UNICODE in symbol

SELECT CHAR(116)   [CHAR],
       NCHAR(1079) [NCHAR]

SELECT LEFT('abcdefg', 3)  [LEFT],
       RIGHT('abcdefg', 3) [RIGHT],
       LOWER('ABCDEFG')    [LOWER],
       UPPER('abcdefg')    [UPPER],
       LEN('  123  ')      [LEN], --TODO:investigate!
       REVERSE('321')      [REVERSE]

--Note STUFF: when we pass 0 as an amount of symbols to remove,the last arg 
--inserting before specified start index 
SELECT STUFF('adcdefg', 4, 2, 'New') [STUFF],
       SUBSTRING('adcdefg', 4, 2)    [SUBSTRING]

PRINT LTRIM('   string')
PRINT RTRIM('functions   ')

PRINT 'Move' + SPACE(3) + 'on'
PRINT REPLICATE('R', 10)

SELECT CHARINDEX('one', 'one step, two step, one step again'),
       CHARINDEX('one', 'one step, two step, one step again', 2),--third param is the start location
       PATINDEX('%pa__ern', 'find the word using pattern')

SELECT REPLACE('1235', '5', '4')

--Concat function
SELECT 'Show' + ' ' + 'up',
       'Show' + ' ' + NULL,
       'Show' + ' ' + ISNULL(NULL, ''),
       CONCAT('Show', ' ', NULL)--just ignore null parameters

SELECT value
FROM STRING_SPLIT('1,2,3,4,5', ',')

--TODO:Investigate STRING_AGG function
    
