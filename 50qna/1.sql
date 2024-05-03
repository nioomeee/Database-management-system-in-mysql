create table employee2(Emp_No varchar(4) NOT NULL, First_Name varchar(10), Last_Name varchar(10), Start_Date date, End_Date date, Salary decimal(8,2), City varchar(10), Job varchar(15), Depno);

Alter table employee2 alter column Start_date set default '2024-04-02';

insert into employee2 values(01, "Jason", "Martin", '1996-07-25', '2006-07-25', 1234.56, "Toronto", "Programmer", 10);
insert into employee2 values(02, "Alison", "Mathews", '1976-03-21', '1986-02-21', 2234.78, "Vancouver", "Tester", 15);
insert into employee2 values(03, "James", "Smith", '1978-12-12', '1990-03-15', 2324.78, "Vancouver", "Tester", 20);
insert into employee2 values(04, "Celia", "Rice", '1982-10-24','1999-04-21',  3334.78, "Vancouver", "Manager", 30);
insert into employee2 values(05, "Robert", "Black", '1984-01-15', '1998-08-08', 4334.78, "Vancouver", "Tester", 20);
insert into employee2 values(06, "Linda", "Green", '1987-07-30', '1996-01-04', 5334.78, "New York", "Tester", 10);
insert into employee2 values(07, "David", "Larry", '1990-12-31', '1998-02-12', 6334.78, "New York", "Manager", 15);
insert into employee2 values(08, "James", "Cat", '1996-09-17', '2002-04-15', 7334.78, "Vancouver", "Tester", 22);

create table Department2(Depno int Primary key, DName varchar(25) NOT NULL, DLocation varchar(15) NOT NULL);

insert into department2 values(10, "Clerk", "Ahmedabad");
insert into department2 values(15, "Salesman", "Vadodara");
insert into department2 values(20, "Analyst", "Surat");
insert into department2 values(30, "Electrical", "Ahmedabad");
insert into department2 values(14, "Civil", "Valsad");
insert into department2 values(22, "Mechanical", "Vapi");
insert into department2 values(28, "Information Technology", "Vapi");
insert into department2 values(27, "Chemical", "Surat");


alter table employee2 add foreign key(Depno) references Department2(Depno);


-- 1. Modify the above table to add two more columns manager and commission to the Employee table.
alter table employee2 add column Manager varchar(15);
alter table employee2 add column Commision decimal(4,2);

-- 2. Retrieve all rows of employee table.
select * from employee2;

-- 3. Give list of emp name & their job spec who are working in dept no 20.
select concat(First_Name,' ', Last_Name) AS Name, Job from Employee2 where Depno = 20;

-- 4. Retrieve the details of emp working in dept no 30. 
select * from Employee2 where Depno =30;

-- 5. Find list of emp whose empno is greater then empno 5. 
select * from Employee2 where Emp_No > 05;

-- 6. Find all managers not in dept no 10. 
select concat(First_Name, ' ', Last_Name) AS Name from employee2 where Job = "Manager" && Depno != 10;

-- 7. To find the total number of employees.
select count(Emp_No) as Total_Employees from Employee2;

-- 8. List all emp name and their job of those depts. That is located at Surat
select concat(First_Name,' ', Last_Name) As Emp_name, Job from Employee2 where Depno in (select Depno from Department2 where DLocation = "Surat"); 

-- 9. Display everyone in dept no 20 who is neither a clerk, salesman nor analyst.
select  concat(First_Name,' ', Last_Name) As Emp_name from Employee2 where Depno = 20 && Depno in (select Depno from Department2 where DName Not in("Clerk", "Salesman", "Analyst") );
-- 10. List all emp names, their jobs, salary in ascending order by their jobs. 
select  concat(First_Name,' ', Last_Name) As Emp_name, Job, Salary from Employee2 order by Job asc;

-- 11. Obtain list of all empno and names who are manager. 
select Emp_No, concat(First_Name,' ', Last_Name) As Emp_name from Employee2 where Job = "Manager";

-- 12. To find the sum paid as salary to all employees every month.
select Sum(Salary) AS Total_Salary from Employee2;

-- 13. +9*Display all emp names and sal where sal is min. 
select concat(First_Name,' ', Last_Name) As Emp_name, Salary from Employee2 where Salary = (select Min(Salary) from Employee2);

-- 14. To find the minimum salary of managers in various depts.
select Min(Salary) as Min_Salary, Depno from Employee2 where Job = "Manager" group by Depno; 

-- 15. Find list of emp whose sal is greater then 2000 along with their job spec?

-- 16. Give list of all emp along with their monthly income?
-- 17. List all empname who are ordered by the jobs within each job there should be Descending order byempno ?
-- 18. Retrieve details of emp whose sal is between 1000 and 2000 both inclusive?
select * from Employee2 where Salary between 1000 and 2000;

-- 19. To find the average salary of all the employees.
select Avg(Salary) as Average_Salary from employee2;

-- 20. To find the minimum salary of managers in various depts.
select Depno, Min(Salary) from Employee2 where Job = "Manager" group by Depno;

-- 21. Find the no of employees and job group by deptno?
select Depno, count(Emp_No), Job from Employee2 where Job in (select distinct Job from Employee2) group by Depno, job;

-- 22. List all emp names and their salaries who are working in dept no 10?
select concat(First_Name, " ", Last_Name) As Name, Salary from Employee2 where Depno = 10;

-- 23. Give details of all dept and their no’s while changing the column name as department and departmentno?
select 
-- 24. To find the minimum salary paid to any employee
select Emp_No , Salary from Employee2 where Salary = (Select Min(Salary) from Employee2);

-- 25. To list the employee who heads the list alphabetically.
Select concat(First_Name, " ", Last_Name) As Emp_Name from employee2 where First_Name = (select First_Name from Employee2 order by First_Name asc limit 1);

-- 26. List all emp name, dept names and location whose deptno is common in both dept table andemptable?
select E.First_Name, D.DName, D.DLocation from Employee2 E join Department2 D on E.Depno = D.Depno;

-- 27. List all jobs in dept 10 and 20 or in both?
select job from Employee2 where Depno in (10,20);

-- 28. To select all employees along with their annual salary sorted on the basis of annual salary.

-- 29. To find the minimum salary of managers in various depts.
-- 30. List all managers with their respective name and deptno ?
select concat(First_Name," ", Last_Name) As Manager_name, Depno from Employee2 where Job = 'manager';

-- 31. Display list of emp whose job is analyst?
select concat(First_Name," ", Last_Name) As Analyst_name from Employee2 where Depno = (select Depno from Department2 where DName = "Analyst");

-- 32. To get all employees from dept 10 and 20.
select 

-- 33. To list all employees whose name begins with ‘J’?
select * from Employee2 where First_Name like "j%";

-- 34. Retrieve all details of employees whose name is either smith, blake, allen, scott, clark and King?
select * from Employee2 where First_Name in ("Smith", "Blake", "Allen","Scott" , "Clark", "King")OR Last_Name  in ("Smith", "Blake", "Allen","Scott" , "Clark", "King");

-- 35. To list all employees whose salary is greater than or equal to 2000.
select * from employee2 where Salary >= 2000;

-- 36. To list employees whose name begins with ‘J’ and has ‘N’ as the third character?
select * from Employee2 where First_Name like "J__n%";

-- 37. To find out average minimum and maximum salary of each dept.
Select Min(Salary), Max(salary), Avg(Salary) from Employee2 group by Depno;

-- 38. Create view on emp to display sum of salary grouped according to deptno?
create view Emp1 As Select Sum(Salary) from Employee2 group by Depno;

-- 39. Drop the above view. 40. To select all employees along with their annual salary sorted on the basis of annual salary.


-- 41. To see all details of depts. Who have employees working in it
select * from Department natural join Employee;

-- 42. To list the minimum salary to various categories of employees.
select Min(Salary) as Min_Salary, job from Employee2 group by job;

-- 43. To list employees working in dept no 10 or 20.
select * from Employee2 where Depno = 10 OR Depno = 20; 

-- 44. To list employees hired after 01-jan-81 and working in dept no. 10
select * from Employee2 where Start_Date > '1981-01-01' && Depno = 10;

-- 45. To select all employees along with their annual salary sorted on the basis of annual salary.


-- 46. To list employees working in dept other than 10.
select * from employee2 where Depno != 10;

-- 47. To list all employees in the ascending order by name.
select concat(First_Name, " ", Last_Name) as Emp_Name from Employee2 order by First_Name asc, Last_Name asc;;

-- 48. To select all employees sorted dept wise in ascending order and within dept salary wise in descendingorder.
select * from Employee2 order by Depno asc, Salary desc;
-- 49. Delete all rows from employee table then Drop the emp table.


-- 50. Update the record of employee no 1. Increase the salary by Rs. 1000.
Update Employee2 set Salary = (Salary+1000) where Emp_No = 01;