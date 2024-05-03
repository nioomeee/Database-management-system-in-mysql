create table employee1(Ecode int, EName varchar(20) NOT NULL, DepCde int, Salary decimal(10,2), Age int, JoinDate date UNIQUE);

insert into employee1 values(15, "Sameer Sharma", 123, 75000, 39, '2007-04-01');
insert into employee1 values(21, "Raguvindra K", 101, 86000, 29, '2005-11-11');
insert into employee1 values(34, "Rama Gupta", 119, 52500, 43, '2010-03-03');
insert into employee1 values(46, "C R Menon", 103, 67000, 38, '2004-07-12');
insert into employee1 values(77, "Mohan Kumar", 103, 63000, 55, '2000-11-25');
insert into employee1 values(81, "Rajesh Kumar", 119, 74000, 48, '2008-12-11');
insert into employee1 values(89, "Sanjeev P", 101, 92600, 54, '2009-01-12');
insert into employee1 values(93, "Pragya Jain", 123, 32000, 29, '2006-08-05');

Alter Table employee1 add primary key(Ecode);

-- 1) Display the details of all employees
select * from employee1;

-- 2) Display Ecode, Ename and salary of all employees
select Ecode, Ename, salary from employee1;

-- 3) Display all employees whose salary is greater than 60000.
select * from employee1 where Salary > 60000;

-- 4) Display Ename and salary whose age is less than 35.
select Ename, Salary from employee1 where age<35;

-- 5) Display department code. The code will appear for only once.
select distinct DepCde from employee1 ;

-- 6) Display the total number of employees.
select count(Ecode) from employee1;

-- 7) Display all the details of employee whose department code is 103 and salary is greater than
-- 65000.
select * from employee1 where DepCde = 103 && Salary > 65000;

-- 8) Display all the details of employee whose age is greater than 35 or salary is less than 60000.
select * from employee1 where age > 35 && Salary < 60000;

-- 9) Display all the details of employee whose age is between 25 and 35.
Select * from employee1 where age between 25 and 35;

-- 10) Display Employee name whose department code are 101,103,123.
select EName from employee1 where DepCde in (101, 103, 123);

-- 11) Display Employeename and department code whose name ends with ‘Sharma’.
select EName, DepCde from employee1 where EName like '%sharma';

-- 12) Display Employeename and department code whose name starts with R and has j in between
-- the name.
select EName, DepCde from employee1 where EName like 'R%j%';

-- 13) Display the Employee code and age whose name does not contain ‘j’ in between.
select Ecode, Age from employee1 where EName not like '%j%';

-- 14) Display the employee name and salary in ascending order of their name.
select EName, Salary from employee1 ORDER By EName ASC;

-- 15) Display the employee name and age in descending order of their name.
select EName, Age from Employee1 Order by EName desc;

-- 16) Increase the salary of an employee by 10% whose age is greater than 50.
Update employee1 Set Salary = ((0.1 *Salary) + Salary) where Age > 50;

-- 17) Delete the records of all employees whose department code is 101.
delete * from employee1 where DepCde = 101;

-- 18) Delete the records of all employees whose name is ‘Rajesh Kumar’.
delete * from employee1 where Ename = "Rajesh Kumar";

-- 19) Add another column dept_name with varchar datatype in employee table.
Alter table employee1 add column dept_name varchar(15) after DepCde;

-- 20) Put department name as IT where department code is 123.
Update employee1 SET dept_name = "IT" where DepCde = 123;

-- 21) Display maximum salary from all the employees.
select Max(Salary) as Maximum from employee1;

-- 22) Dsiplay minimum age from all the employees.
select min(Age) as Minimum_Age from employee1;

-- 23) Display average salary of all employees.
select AVG(Salary) as Average_Salary from Employee1;

-- 24) Display total salary of all employees.
select sum(Salary) As Total_Salary from employee1;

-- 25) Create a view emp with employee code, employee name and salary.
create view Emp AS Select Ecode, EName, Salary from employee1;

-- 26) Display the details of emp view.
select * from Emp;

-- 27) Delete the record of an employee whose age is 29.
select * from employee1 where age = 29;

-- 28) Put department name as ‘Sales’ where department code is 119.
Update employee1 set dept_name = "Sales" where DepCde = 119;

-- 29) Set default value for department name as ‘Admin’.
Alter table employee1 alter column dept_name Set default 'Admin';

-- 30) Insert values for only employee code, employee name and salary into the employee table
-- and display all the data.
insert into employee1(Ecode, EName, Salary) values(99, "Sameer Fuddi", 50000);
