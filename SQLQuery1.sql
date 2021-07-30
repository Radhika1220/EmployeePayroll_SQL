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