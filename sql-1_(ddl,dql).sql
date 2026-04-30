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
