-- 1
Select Dep_Name from Department where Emp_id = (select Emp_id from Employee1 where Emp_Address="Mumbai" && Emp_Salary < 10000);

-- 2
Select Emp_Name from Employee1 where Emp_id in  (select Emp_id from Department where Dep_Location = "Kolkata" || Dep_Id = 'D114');

-- 3
Select Emp_Name from Employee1 where Emp_Salary = (Select Max(Emp_Salary) from Employee1);

-- 4
Select Emp_Salary from Employee1 where Emp_Salary = (Select Max(Emp_Salary) from Employee1 < (Select Max(Emp_Salary) from Employee1 where Emp_Salary));

-- 5 UNION
Select Emp_Salary from Employee1 UNION Select Dep_Head_Name from Department;

-- 5 UNION ALL
Select Emp_id from employee1 UNION ALL Select Dep_Id from Department;d from

-- 5 INTERSECT
Select Emp_id from Employee1 intersect Select Dep_id from Department;

-- 6 . Perform simple join(.), Cross Join and natural join and full join on any table
Select Employee1.Emp_id, Department.Dep_Id from Employee1 INNER JOIN Department On Employee1.Emp_id = Department.Emp_id;

-- cross join
Select Employee1.Emp_id, Department.Dep_Id from Employee1 CROSS JOIN Department;

-- natural join
Select Employee1.Emp_id, Department.Dep_id from Employee1 NATURAL JOIN Department; 

-- 7
Select Dep_Location from Department where Emp_id = (Select Emp_id from Employee1 where Emp_Salary = (Select MIN(Emp_Salary) from Employee1));

-- 8
Select Emp_Salary from Employee1 where Emp_id in (Select Emp_id from Department where Dep_Head_Name = "Michael" || Dep_Location like "%i%");

-- 9
Select Emp_Name, Dep_Name from Employee1 INNER JOIN Department on Employee1.Emp_id = Department.Emp_id where Emp_hire_date like 'Jan-1998';

-- 10
Update Employee1 set Emp_Salary = (Emp_Salary*0.05)+ Emp_Salary where Emp_id = (Select Emp_id from Department where Dep_Head_Name = 'Roshani');

-- Extra Questions

-- 1
Select Employee1.Emp_Name, Department.Dep_Name from Employee1 inner join Department on Employee1.Emp_id = Department.Emp_id; 

-- 2
Select d.Dep_Name, d.Dep_Location from Department d JOIN Employee1 e on d.Dep_Id = e.Emp_id GROUP BY d.Dep_Name, d.Dep_Location ;

-- 3 Ascending order
Select Emp_Name from Employee1 Order By Emp_Name Asc;

-- 4 descedning order
Select Emp_Name from Employee1 ORDER BY Emp_Salary Desc;

-- 5 Find the Employee names who have the same salary as any other Employee.
Select e1.Emp_Name, e2.Emp_Name FROM Employee1 e1 Join Employee1 e2 ON e1.Emp_Salary = e2.Emp_Salary && e1.Emp_id != e2.Emp_id;

-- 6 Display the Employee names and their respective Department names sorted in descending order of salaries.
Select e.Emp_Name, d.Dep_Name from Employee1 e Inner Join Department d  on e.Emp_id = d.Emp_id Order by Emp_Salary desc;

-- 7.Find the Employee names and their salaries where the salary is within the top 10% of all salaries.
Select Emp_Name, Emp_Salary from Employee1 where Emp_Salary >=(Select Percentile_Cont(0.9) within group (order by Emp_Salary Desc) from Employee1);

-- 8 Rename a table
Alter table Employee1 Rename to Employee;

-- 9 Add primary key
Alter table Employee ADD PRIMARY KEY(Emp_id);

-- 10 Creating a new column and adding foreign key
Alter table Employee Add Rollno varchar(4);
Alter table employee Add Foreign key(Rollno) refrences Student(Rollno); 
Update Employee Set Rollno = 'A05' where Emp_id = 1;
Update Employee Set Rollno = 'A01' where Emp_id = 2;
Update Employee Set Rollno = 'A02' where Emp_id = 3;
Update Employee Set Rollno = 'A04' where Emp_id = 4;
Update Employee Set Rollno = 'A03' where Emp_id = 5;

-- 11 Dropping foreign key connection
Alter table Employee Drop Foreign key Rollno;

-- 12 Not null
Alter table Employee add column Rollno varchar(4) not null;

-- 13 Unique



