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
