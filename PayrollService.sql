/*UC1*/
create database payroll_service;

use payroll_service;

/*UC2*/
create table employee_payroll(id int identity (1,1) primary key, Name varchar(150) NOT NULL, Salary float NOT NULL, Start date NOT NULL);
exec sp_help employee_payroll;

/*UC3*/
insert into employee_payroll(Name,Salary,Start) values
( 'Naveen', 400000, '2021-07-15'),
( 'John', 300000, '2021-10-13'),
( 'Rani', 280000, '2021-05-25'),
( 'Sai', 480000, '2021-09-10');

/*UC4*/
select * from employee_payroll;