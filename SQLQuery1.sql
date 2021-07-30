-----------UC1-------------
-----CREATE DATABASE 
create database payroll_service;

use payroll_service;

create table employee_payroll
(
empId int identity(1,1) primary key,
name varchar(20) not null,
salary float,
startDate date,
emailId varchar(20)
);

