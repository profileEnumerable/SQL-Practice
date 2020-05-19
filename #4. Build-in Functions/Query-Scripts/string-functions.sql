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
       LEN('  123  ')      [LEN], --investigate!
       REVERSE('321')      [REVERSE]
       
       