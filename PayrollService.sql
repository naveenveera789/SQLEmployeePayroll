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

/*UC5*/
select Name,Salary from employee_payroll where name = 'Naveen';
select * from employee_payroll
where start between cast('2021-10-01' as date) and getdate();

/*UC6*/
alter table employee_payroll add Gender char(1);
update employee_payroll set Gender = 'M' where name = 'Naveen' or name = 'John' or name = 'Sai';
update employee_payroll set Gender = 'F' where name = 'Rani';

/*UC7*/
alter table employee_payroll alter column Salary float;

select sum(Salary) from employee_payroll where Gender='M' group by Gender;
select SUM(Salary) from employee_payroll where Gender='F' group by Gender;

select avg(Salary) from employee_payroll where Gender='M' group by Gender;
select avg(Salary) from employee_payroll where Gender='F' group by Gender;

select min(Salary) from employee_payroll where Gender='M' group by Gender;
select min(Salary) from employee_payroll where Gender='F' group by Gender;

select max(Salary) from employee_payroll where Gender='M' group by Gender;
select max(Salary) from employee_payroll where Gender='F' group by Gender;

select count(Salary) from employee_payroll where Gender='M' group by Gender;
select count(Salary) from employee_payroll where Gender='F' group by Gender;

/*UC8*/
alter table employee_payroll add Phone varchar(16);
alter table employee_payroll add Address varchar(100) default 'TBD';
alter table employee_payroll add Department varchar(50) NOT NULL default '';

/*UC9*/
exec sp_rename 'employee_payroll.Salary', 'BasicPay', 'column';
alter table employee_payroll add Deductions float, TaxablePay float, IncomeTax float, NetPay float;
update employee_payroll set Phone='6958309476', Address='Bangalore' where Name='John';
update employee_payroll set Phone='8485098959', Address='Hyderabad' where Name='Naveen';
update employee_payroll set Phone='9534986760', Address='Hyderabad' where Name='Rani';
update employee_payroll set Phone='7847847504', Address='Mumbai' where Name='Sai';
update employee_payroll set Department='Sales', Deductions=1000, TaxablePay=500, IncomeTax=0.1*(BasicPay), NetPay=BasicPay-1500 where Name='John' or Name='Rani';
update employee_payroll set Department='Marketing', Deductions=1500, TaxablePay=500, IncomeTax=0.15*(BasicPay), NetPay=BasicPay-2000 where Name='Sai' or Name='Naveen';