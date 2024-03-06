select Distinct Loan_Amount from Loan;

Select Int_Rate from Loan where Start_date > '2009-04-01';

Select distinct Instalments from Loan;

Select * from Loan where Interest is Null;

Select * from Loan where Interest is not Null;

Select * from Loan where Start_Date > '2008-12-31' && Installments > 36;

Select Cust_Name, Loan_amount from Loan where Installments != 36;

Select * from Loan where Loan_Amount between 400000 and 5000

Create view Account_Installments_view AS Select Acc_No, Cust_Name, Installments from Loan;

Select * from Account_Installments_view;

Drop view Account_Installments_view;

create table employee(ECode int, EName varchar(30) NOT NULL, DepCde int, Salary int, Age int, JoinDate date, UNIQUE(JoinDate));

insert into values(15, "Sameer Sharma", 123, 75000, 39, 2007-04-01);