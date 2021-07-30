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
