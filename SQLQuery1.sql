-----------UC1-------------
-----CREATE DATABASE 
create database payroll_service;

use payroll_service;
---------UC2-------------
create table employee_payroll
(
empId int identity(1,1) primary key,
name varchar(20) not null,
salary float,
startDate date,
emailId varchar(20)
);

----------UC3-------------

Insert into employee_payroll(name,salary,startDate,emailId) values ('Radhika',35000,'2021-06-21','radz@yahoo.com'),('Priya',50000,'2021-01-15','priya@yahoo.com');
Insert into employee_payroll values ('Arun',60000,'2021-03-13','arun12@gmail.com'),('Kishore',55000,'2021-05-23','ksihore@yahoo.com');
Insert into employee_payroll values ('Ajoy',70000,'2021-05-24','ajoyjones@yahoo.com');
----------UC4--------------
select * from employee_payroll;

--------UC5-----------
select name,salary from employee_payroll where name='Kishore';
-------------UC5----------------
select name,salary from employee_payroll where startDate between ('2021-05-01') and getdate();


-------------UC6----------
alter table employee_payroll add Gender char(1);
-----------UC6-------------
update employee_payroll set Gender='M' where name='Kishore' or name='Arun' or name='Ajoy';

update employee_payroll set Gender='F' where name='Radhika' or name='Priya';

--------UC7--------------
select sum(salary) as TotalSalary from employee_payroll;

select sum(salary)as TotalSalary ,gender  from employee_payroll where Gender='F' group by Gender;

select sum(salary)as TotalSalary,gender from employee_payroll group by Gender;

select avg(salary)as TotalSalary,gender  from employee_payroll group by Gender;

select min(salary) as minSalary ,gender from employee_payroll   group by gender;

select count(salary) as CountofGender ,gender from employee_payroll   group by gender;

select max(salary) as minSalary ,gender from employee_payroll   group by gender;


-------------UC8-----------(Adding the column of phone number,department,address)
alter table employee_payroll add PhoneNumber bigint;

alter table employee_payroll add Department varchar(20) not null default 'HR';

update employee_payroll set PhoneNumber=8945125478 where name='Kishore';
update employee_payroll set PhoneNumber=9845127810 where name='Arun';
update employee_payroll set PhoneNumber=8745123654 where name='Radhika';
update employee_payroll set PhoneNumber=9874512458 where name='Priya';
update employee_payroll set PhoneNumber=894561254 where name='Ajoy';


update employee_payroll set Department='HR' where name='Kishore';
update employee_payroll set Department='Accounts and Finance' where name='Arun';
update employee_payroll set Department='Product development' where name='Radhika';
update employee_payroll set Department='Business development' where name='Priya';
update employee_payroll set Department='Research development' where name='Ajoy';

alter table employee_payroll add Address varchar(25) default 'Not Provided';


update employee_payroll set Address='Chennai' where name='Kishore';
update employee_payroll set Address='Bangalore' where name='Arun';
update employee_payroll set Address='Puducherry' where name='Radhika';
update employee_payroll set Address='Mumbai' where name='Priya';
update employee_payroll set Address='Bhopal' where name='Ajoy';

------------UC9-------------------
Exec sp_rename 'employee_payroll.salary','Basic Pay','COLUMN';

alter table employee_payroll add Deductions float,TaxablePay float,IncomeTax float,NetPay float;

update employee_payroll set Deductions=1500 where Department='HR';
update employee_payroll set Deductions=1700 where Department='Accounts and Finance'
update employee_payroll set Deductions=2100 where Department='Product development';
update employee_payroll set Deductions=1570 where Department='Business development' ;
update employee_payroll set Deductions=2212 where Department='Research development';


update employee_payroll set NetPay=53500 where name='Kishore';
update employee_payroll set NetPay=58300 where name='Arun';
update employee_payroll set NetPay=32900 where name='Radhika';
update employee_payroll set NetPay=48430 where name='Priya';
update employee_payroll set NetPay=67788 where name='Ajoy';

update employee_payroll set IncomeTax=1000;

update employee_payroll set TaxablePay=300;


----------UC10--------------
Insert into employee_payroll values('Kishore',55000,'2021-05-23','kishore@yahoo.com','M',8945125478,'HR','Chennai',1500,300,1000,53500);

select * from employee_payroll;


---------------UC11---->Implement the ER Diagram------
---Company Table
Create Table Company
(CompanyID int identity(1,1) primary key,
CompanyName varchar(100))
---Insert the values
Insert into Company values ('Praveena'),('Sumathi')
---Retrieve the data
select * from company;

--Create Employee Table
create table Employee
(EmployeeID int identity(1,1) primary key,
Company_Id int,
EmployeeName varchar(200),
EmployeePhoneNum bigInt,
EmployeeAddress varchar(200),
StartDate date,
Gender char,
Foreign key (Company_Id) references Company(CompanyID)
)
---Insert the employee table
insert into Employee (Company_Id,EmployeeName,EmployeePhoneNum,EmployeeAddress,StartDate,Gender)values
(1,'Priyadarshini','9845781542','602 Seneca Drive','2018-09-15','F'),
(2,'Vishnu Priya','8954785124',' 2897 Freshour Circle, 94533','2019-03-12','F'),
(1,'Subhiksha','9874587158','4682 Hilltop Street','2020-02-06','F'),
(2,'Rajkumar','8974587197','4133 Hartway Street','2021-01-16','M');
---Retrieve the data
Select * from employee;

--Create Payroll Table
create table PayRollCalculate
(
Employee_Id int,
BasicPay float,
TaxablePay float,
IncomeTax float,
NetPay float,
Deductions float,
Foreign key (Employee_Id) references Employee(EmployeeID)
)
---Insert the values in payrollcalculate table
Insert into PayRollCalculate (Employee_Id,BasicPay,IncomeTax,Deductions)values
(2,50000,1000,1500),
(3,60000,1432,1700),
(4,75000,1300,1870),
(5,80000,3000,2300);
---Retrieve the data
Select * from PayRollCalculate;
--Set the taxablepay and netpay value using update
update PayRollCalculate set TaxablePay=BasicPay-Deductions;

update PayRollCalculate set NetPay=TaxablePay-IncomeTax;

--Create Department Table
create table DepartmentTable
(
DepartmentId int identity(1,1) primary key,
DepartName varchar(100)
)
--Insert the value
Insert into DepartmentTable values
('HR'),
('Accounts and Finance'),
('Product development');
--Retrieve the data
Select * from DepartmentTable;
----Create Employee Department table
create table EmployeeDept
(
Dept_Id int ,
Employee_Id int,
Foreign key (Employee_Id) references Employee(EmployeeID),
Foreign key (Dept_Id) references DepartmentTable(DepartmentID)
)
------Insert the values in employeedept table
Insert into EmployeeDept(Dept_Id,Employee_Id) values
(1,2),
(2,3),
(3,4),
(2,5);
--Retrieve the data
select * from EmployeeDept;