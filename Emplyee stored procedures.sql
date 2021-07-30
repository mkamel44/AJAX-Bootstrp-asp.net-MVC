--Select Employees  
Create Procedure SelectEmployee    
as     
Begin    
Select * from Employee;    
End  
  
--Insert and Update Employee  
Create Procedure InsertUpdateEmployee    
(    
@Id integer,    
@Name nvarchar(50),    
@Age integer,    
@State nvarchar(50),    
@Country nvarchar(50),    
@Action varchar(10)    
)    
As    
Begin    
if @Action='Insert'    
Begin    
 Insert into Employee(Name,Age,[State],Country) values(@Name,@Age,@State,@Country);    
End    
if @Action='Update'    
Begin    
 Update Employee set Name=@Name,Age=@Age,[State]=@State,Country=@Country where EmployeeID=@Id;    
End      
End  
  
--Delete Employee  
Create Procedure DeleteEmployee    
(    
 @Id integer    
)    
as     
Begin    
 Delete Employee where EmployeeID=@Id;    
End  

--For Paging Select
CREATE PROCEDURE SelectEmployeePaging
@PageIndex INT = 1
,@PageSize INT = 10
,@RecordCount INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT ROW_NUMBER() OVER
        (
        ORDER BY [EmployeeID] ASC
        )AS RowNumber
         ,[EmployeeID]
         ,[Name]
         ,[Age]
         ,[State]
         ,[Country]
    INTO #Results
    FROM [Employee] order by EmployeeID DESC 

    SELECT @RecordCount = COUNT(*)
    FROM #Results

    SELECT * FROM #Results
    WHERE RowNumber BETWEEN(@PageIndex -1) * @PageSize + 1 AND(((@PageIndex -1) * @PageSize + 1) + @PageSize) - 1
    

    DROP TABLE #Results
END
go

