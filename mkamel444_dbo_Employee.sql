create table Employee
(
    EmployeeID int identity
        constraint Employee_pk
            primary key nonclustered,
    Name       nvarchar(255),
    Age        int,
    State      nvarchar(255),
    Country    nvarchar(255)
)
go

