-- 1. Display the Department name whose employee address is ‘mumbai’ and salary is less
-- than 10000.
-- 2. Display Employee name whose location is ‘kolkata’ or dep id=D114.
-- 3. Display employee name who has highest salary.
-- 4. Display second highest salary of employee.
-- 5. Perform union, union all, intersect operations on Department table.
-- 6. Perform simple join(.), Cross Join and natural join and full join on any table.
-- 7. Display department location of a employee who has minimum salary.
-- 8. Display employee salary whose headname is ‘Michael’ or location has letter ‘i’
-- somewhere in the name.
-- 9. Display Dep name, emp name who has hired on Jan-1998.
-- 10. Increase the 5% salary of the employee whose dep head name is ‘Roshani’. 
create table Employee1(Emp_id int, Emp_Name varchar(10), Emp_Address varchar(10), Emp_Salary int, Emp_hire_date varchar(9));

insert into Employee1 values(1, "Rudra", "Delhi", 3000, 'Mar-2000');
insert into Employee1 values(2, "Rehan", "Banglore", 5000, 'Jan-1998');
insert into Employee1 values(3, "Kriyan", "Mumbai", 7000, 'Jul-1999');
insert into Employee1 values(4, "Prapti", "Ahmedabad", 7000, 'Apr-2000');
insert into Employee1 values(5, "Pragati", "Baroda", 10000, 'Dec-2001');

create table Department(Dep_Id varchar(4), Dep_Name varchar(10), Dep_Location varchar(10), Dep_Head_Name varchar(10), Emp_id int);

insert into Department values('D111', 'IT', 'Kolkata', 'Angela', 3);
insert into Department values('D112', 'HR', 'Assam', 'Michael', 5);
insert into Department values('D113', 'R&D', 'Bengal', 'Roshani', 1);
insert into Department values('D114', 'Finance', 'Orissa', 'Neil', 4);
insert into Department values('D115', 'Sales', 'Kolkata', 'Dipika', 2);
-- 1.
Select Dep_Name from Department where Emp_id = (select Emp_id from Employee1 where Emp_Address = "Mumbai" && Emp_Salary <= 10000);

Alter table Department Add foreign key(Emp_Id) references Employee1(Emp_Id);

Alter Table Employee1 ADD Primary Key(Emp_Id);

-- 2
Select Emp_Name from Employee1 where Emp_id in(select Emp_id from Department where Dep_Location = "Kolkata" || Dep_Id = "D114");

-- 3
Select Emp_Name from Employee1 where Emp_Salary = (Select MAX(Emp_Salary) from Employee1);

-- 4
Select Emp_Salary from Employee1 where Emp_Salary =(Select MAX(Emp_Salary) from Employee1 where Emp_Salary<(Select MAX(Emp_Salary) from Employee1));

-- 5 union
Select Dep_Name from Department union Select Dep_Id from Department;

-- union all

Select Dep_Name from Department union all Select Dep_Id from Department;

-- intersect

Select Dep_Name from Department intersect Select Dep_Id from Department;

-- 6 simple join
Select * from Employee1 E JOIN Department D on E.Emp_id = D.Emp_Id;

-- natural join
Select * from Employee natural join Department;

-- full join
Select Emp_id, Emp_Name FROM Employee1 FULL OUTER JOIN Department ON Employee1.Emp_id = Department.Emp_Id;


SELECT * FROM Employee1 left JOIN Department ON Employee1.Emp_id = Department.Emp_Id;

-- 7
Select Dep_Location from Department where Emp_id = (Select Emp_id from Employee1 where Emp_Salary = (Select MIN(Emp_Salary) from Employee1));

-- 8
Select Emp_Salary from Employee1 where Emp_id in (select Emp_id from Department where Dep_Head_Name = "Michael" OR Dep_Location like "%i%");

-- 9
Select E.Emp_Name, D.Dep_Name from Employee1 E JOIN Department D on E.Emp_id = D.Emp_Id where E.Emp_hire_date = "Jan-1998";

-- 10
Update Employee1 set Emp_Salary = Emp_Salary + (Emp_Salary * 0.05) where Emp_id = (Select Emp_id from Department where Dep_Head_Name = "Roshani");

CREATE TABLE table_name (column1 data_type, column2 data_type, column3 data_type);

INSERT INTO table_name VALUES (value1, value2);