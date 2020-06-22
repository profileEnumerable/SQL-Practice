--Math Functions

--Exponentiation
SELECT SQRT(196),
       SQUARE(14),
       POWER(14, 2)

--Round/Floor
SELECT FLOOR(256.3),
       FLOOR(256.7),
       ROUND(256.3, 0),
       ROUND(256.7, 0),
       ROUND(256.255, -2),--round to hundreds
       ROUND(256.2555, 2, 1),--third param as a flag for omitting the third(in this case) sign
       PI()