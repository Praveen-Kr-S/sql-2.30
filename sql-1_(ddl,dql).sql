-- create db
create database eswar_tech;
-- create table
use eswar_tech;
create table emp(id int,name varchar(50),dept varchar(50),salary int);
show tables;
-- describe table_name;
describe emp;
-- show columns from table_name;
show columns from emp;

-- to get query of table
-- show create table table_name;
show create table emp;

-- to create new column from exsit table
-- alter table table_name add column column_name datatype;
alter table emp add column phone int;

-- modify the column datatype in table
-- alter table table_name modify column column_name changing_datatype;
alter table emp modify column phone varchar(50);

-- modify the column name
-- alter table table rename column current_column to new_name;
alter table emp rename column id to emp_id;

-- remove column from table
-- alter table table_name drop/remove column column_name;
alter table emp drop column phone;

-- rename the table name
-- rename table current_name to new_name;
rename table employee to staff;

-- to remove all the rows from table
insert into staff values(5,"bosha","AI Engineer",95000);
-- truncate table table_name;
truncate table staff;

-- to remove table from db
-- drop table table_name;
drop table empy;

-- DQL (DATA QUERY LANGUAGE)
-- select all datas from table
-- select *(all columns) from table;
select * from staff;

-- column wise select
-- select coumnns_name from table_name;
select name,salary from staff;

-- row wise select  --> where = filter the given specfic data or row
-- select * from table where column_name = data;
select * from staff where name = "lisa";
select * from staff where emp_id = 2;





-- 07/08/2026
-- functions in sql

-- numeric or math function

-- count()
select count(*) from staff;
select count(*) from staff where dept="Hr";

-- avg
select avg(salary) from staff;
select avg(salary) from staff where dept = "Manager";
select dept,avg(salary) from staff group by dept having dept = "Manager";

-- sum()
select sum(salary) from staff;
select sum(salary) from staff where dept = "Hr";
select dept,sum(salary) from staff group by dept;

-- max()
select max(salary) from staff;
select dept,max(salary) from staff group by dept;
select name,max(salary) from staff group by name;

-- mix()
select min(salary) from staff;

-- text/varchar functions
-- ucase()
select ucase(name),dept,salary from staff;
select ucase(name) as name,dept,salary from staff;

-- char_length()
select name,char_length(name) from staff;

-- concat()
select name,concat("RS : ",salary) from staff;

-- format() --> 45,000.000
select name,concat("RS",format(salary,2)) from staff;

-- left(),right()
select name,left(name,2) from staff;
select name,right(name,3) from staff;


-- date
alter table staff add column hire_date date;
set sql_safe_updates = 0;
update staff set hire_date = "2024-11-15" where dept="manager";
update staff set hire_date = "2026-5-15" where dept not in ("manager","hr");

-- common date function
select now();
select date(now());
select time(now());

-- date_format function
select date_format(curdate(),"%d-%m-%y");
select date_format(curdate(),"%d/%m/%Y");
select date_format(curdate(),"%d/%m/%Y") as date;

-- datediff()
select datediff("2027-1-1",curdate()) as coundown;

-- date_add()
select date_add(curdate(),interval 2 day);
select date_add(curdate(),interval -1 day) as yesterday;

select date_add(curdate(),interval -1 month) as yesterday;
select date_add(curdate(),interval 2 month) as yesterday;

select date_add(curdate(),interval 2 year) as yesterday;
select date_add(curdate(),interval -2 year) as yesterday;





-- 13/5/2026
-- sql constraints
create table employee(
emp_id int primary key auto_increment,
name varchar(50) not null,email varchar(50) unique,
job_desc varchar(50) default "Unassigned",
salary int check (salary > 25000),
age int check (age >= 18)
);

describe employee;
-- primary key auto_increment
insert into employee(name,email,job_desc,salary,age) values ("Bosha","bs@gmail.com","Manager",800000,22);

-- not null
insert into employee(name,email,job_desc,salary,age) values (null,"bss@gmail.com","Manager",800000,22);
insert into employee(name,email,job_desc,salary,age) values ("Kiruthika","bss@gmail.com","Manager",800000,22);

-- unique
insert into employee(name,email,job_desc,salary,age) values ("Lisa","ls@gmail.com","Developer",750000,21);

-- default
insert into employee(name,email,salary,age) values ("Praveen","ps@gmail.com",750000,21);

-- check 
insert into employee(name,email,job_desc,salary,age) values ("Gnanambal","gn@gmail.com","Hr",65000,21);
insert into employee(name,email,job_desc,salary,age) values ("Kumar","kr@gmail.com","Developer",55000,24);

-- forign key
CREATE TABLE Branch (
    branch_id INT PRIMARY KEY AUTO_INCREMENT,
    br_name VARCHAR(40) NOT NULL,
    address VARCHAR(40)
);

insert into branch(branch_id,br_name,address) values(105,"Livewire NBS","Salem");
insert into branch(br_name,address) values("Livewire Kovai","Kovai"),
("Livewire Chennai","Ch"),("Livewire Bn","Bn");

CREATE TABLE Emp (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(40) NOT NULL,
    job_desc VARCHAR(40),
    salary INT,
    branch_id INT,
    CONSTRAINT fk_branchID
    FOREIGN KEY (branch_id)
    REFERENCES Branch(branch_id)
);

insert into emp(name,job_desc,salary,branch_id) values ("lisa","Hr",850000,105);
insert into emp(name,job_desc,salary,branch_id) values ("kiruthika","Developer",950000,108);


-- index
CREATE INDEX idx_name ON emp(name);

select * from emp where name = "lisa";


-- alter constraint query

alter table emp modify column name varchar(50);
insert into emp(name,job_desc,salary,branch_id) values (null,"Hr",850000,105);

-- default
ALTER TABLE Emp ALTER job_desc SET DEFAULT 'Unassigned';
insert into emp(name,salary,branch_id) values ("Praveen",850000,105);
ALTER TABLE Emp ALTER job_desc DROP DEFAULT;

-- Add CHECK:
ALTER TABLE Emp ADD CONSTRAINT check_salary CHECK (salary > 10000);
insert into emp(name,job_desc,salary,branch_id) values ("Kumar","Hr",5000,105);

-- Drop CHECK:
ALTER TABLE Emp DROP CHECK check_salary;
















