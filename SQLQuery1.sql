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

