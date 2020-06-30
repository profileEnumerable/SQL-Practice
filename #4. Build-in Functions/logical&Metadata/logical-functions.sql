--Logical functions
--CHOOSE: returns item by specified index from list of values
SELECT Id,
       LName,
       BirthDate,
       CHOOSE(MONTH(BirthDate), 'Winter', 'Winter', 'Spring', 'Spring', 'Spring', 'Summer', 'Summer',
              'Summer', 'Autumn', 'Autumn', 'Autumn', 'Winter')
FROM Employees
