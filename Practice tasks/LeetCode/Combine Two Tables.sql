Create table Person
(
    PersonId  int,
    FirstName varchar(255),
    LastName  varchar(255)
)
Create table Address
(
    AddressId int,
    PersonId  int,
    City      varchar(255),
    State     varchar(255)
)
Truncate table Person

insert into Person (PersonId, LastName, FirstName)
values ('1', 'Wang', 'Allen')

insert into Person (PersonId, LastName, FirstName)
values ('2', 'Alan', 'Bob')

insert into Person (PersonId, LastName, FirstName)
values ('3', 'Cris', 'Harrison')

Truncate table Address
insert into Address (AddressId, PersonId, City, State)
values ('1', '2', 'New York City', 'New York')

insert into Address (AddressId, PersonId, City, State)
values ('2', '1', 'Los Angeles', 'California')

SELECT FirstName, LastName, City, State
FROM Person AS P
         LEFT JOIN Address AS A ON P.PersonId = A.PersonId 