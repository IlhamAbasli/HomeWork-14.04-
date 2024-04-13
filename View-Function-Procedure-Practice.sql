select * from Students

select SUBSTRING(Email, CHARINDEX('@',Email) + 1, len(Email)-CHARINDEX('@',Email)) from Students

select SUBSTRING(Email, 1, CHARINDEX('@',Email) - 1) from Students




--create view vw_getStudentsByAge
--as
--select * from Students where [Age] > 25

--select * from vw_getStudentsByAge


--create view vw_joinStudentDatas
--as
--select st.FullName from Students st
--join Cities ct
--on st.CityId = ct.CountryId
--join Countries co
--on ct.CountryId = co.Id


--create view vw_joinStudentDatas2
--as
--select st.FullName as 'Student', ct.Name as 'City', co.Name as 'Country' from Students st
--join Cities ct
--on st.CityId = ct.Id
--join Countries co
--on ct.CountryId = co.Id

--select * from vw_joinStudentDatas2



--create function dbo.showWord()
--returns nvarchar(50)
--as 
--begin
--	return 'P418'
--end


--select dbo.showWord()


--declare @result nvarchar(50) = (select dbo.showWord())
 
--print @result



--create function showWordWithParameter(@text nvarchar(50))
--returns nvarchar(50)
--as 
--begin 
--	return @text
--end


--select dbo.showWordWithParameter('Salam') as 'TXT'

--select * from Students

--create function dbo.getStudentsAvgAgeByIds(@id int)
--returns int
--as 
--begin
--	declare @count int = (select count(*) from Students where [Id] > @id)
--	declare @sumAge int = (select sum(Age) from Students)
--	return @sumAge / @count
--end


--select dbo.getStudentsAvgAgeByIds(3)




--create function dbo.getStudentsAvgAges(@id int)
--returns int
--as
--begin
--	declare @avgAge int = (select AVG(Age) from Students where [Id] > @id)
--	return @avgAge
--end

--select dbo.getStudentsAvgAges(3)


--declare @avgAge int = (select dbo.getStudentsAvgAges(3))

--select * from dbo.getStudentsByCondition(@avgAge)

--create function dbo.getStudentsByCondition(@avgAge int)
--returns table
--as
--return (select * from Students where [Age] > @avgAge)



create procedure usp_showText
as
print 'Salam'


exec usp_showText	


create procedure usp_showTextWithParameter
@text nvarchar(50)
as
print @text

execute usp_showTextWithParameter 'Azerbaycan'



create procedure usp_deleteEmployeeById
@id int
as
delete from Employees where [Id] = @id

select * from Employees


exec usp_deleteEmployeeById 7


create procedure usp_createEmployee
@name nvarchar(50),
@surname nvarchar(50),
@email nvarchar(50),
@age int
as
begin
	insert into Employees([Name],[Surname],[Email],[Age])
	values(@name,@surname,@email,@age)
end

exec usp_createEmployee 'Ilham','Abasli','ilham@gmail.com',20




create function dbo.getEmployeesAvgAges()
returns int
as
begin 
	return (select AVG(Age) from Employees)
end


create procedure usp_deleteEmployeesByAge
as
begin
	declare @avgAge int = (select dbo.getEmployeesAvgAges())
	delete from Employees where [Age] > @avgAge
end

select * from Employees

exec usp_deleteEmployeesByAge




