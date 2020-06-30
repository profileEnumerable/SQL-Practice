--Metadata Functions
--OBJECT_ID\OBJECT_NAME
IF NOT EXISTS(SELECT 1 FROM sys.tables WHERE object_id = OBJECT_ID('UserTable'))
    BEGIN
        CREATE TABLE UserTable
        (
            Id int IDENTITY,
            Name varchar(30)
        )
    END
GO

SELECT OBJECT_ID('UserTable'),
       OBJECT_NAME(OBJECT_ID('UserTable'))