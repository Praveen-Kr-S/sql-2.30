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




-- 15/05/2026
-- SQL joins

create database school_system;
use school_system;

create table student_data(std_id int primary key auto_increment, std_name varchar(50),course_id int);
create table course_data(course_id int primary key, course_name varchar(50));


insert into student_data(std_name,course_id) values("Kumar",227),("Praveen",225),
("lisa",228),("Bosha",223),
("sabarish",221),("kiruthika",230);

insert into student_data(std_name,course_id) values("Gnanambal",228),("Keerthana",234);

insert into course_data values(223,"Python"),
(230,"Data Analytics"),(221,"Java"),(228,"React.js");


-- inner join
-- returns only matching datas in both a tables
select std_id,std_name,course_data.course_id,course_name from student_data inner join course_data
on student_data.course_id = course_data.course_id;

-- left join
select std_id,std_name,course_data.course_id,student_data.course_id from 
student_data left join course_data on student_data.course_id = course_data.course_id;

-- right join
select course_name,course_data.course_id,student_data.std_name from 
student_data right join course_data on student_data.course_id = course_data.course_id;

-- full join using union
select std_id,std_name,course_data.course_name,course_data.course_id from student_data left join course_data
on student_data.course_id = course_data.course_id
union
select std_id,std_name,course_data.course_name,course_data.course_id from 
student_data right join course_data on student_data.course_id = course_data.course_id;

select * from student_data left join course_data
on student_data.course_id = course_data.course_id
union
select * from 
student_data right join course_data on student_data.course_id = course_data.course_id;


-- cross join
create table institute(brand_id int, branch_name varchar(50));
create table course(course_id int, course_name varchar(50));

insert into institute values(11,"Livewire Salem"),(12,"Livewire Kovai"),(13,"Livewire Chnnai");
insert into course values(112,"Python"),(123,"Java"),(133,"React.Js"),(134,"Django");


select * from institute cross join course;
select brand_id,branch_name,course_name from institute cross join course;
select brand_id,branch_name,course_name from institute,course;



-- 19/05/2026
-- view in sql
create database gnanambal_tech;
use gnanambal_tech;

CREATE TABLE student_data(
    std_id INT,
    std_name VARCHAR(50),
    course_id INT
);

INSERT INTO student_data VALUES
(1,"Kumar",227),
(2,"Ravi",228),
(3,"Priya",227);

-- view
create view std_view as select std_id,std_name from student_data;
select * from std_view;
select course_id from std_view;

-- view with condition
create view sql_std as select * from student_data where course_id = 227;
select * from sql_std;
select std_name,course_id from sql_std;

-- update view
create or replace view std_view as select * from student_data;
select course_id from std_view;
select * from std_view;

-- remove view
DROP VIEW std_view;

-- subquery
select std_id,std_name from student_data where course_id = (select max(course_id) from student_data);
select * from student_data where course_id = (select max(course_id) from student_data);
-- select * from student_data where course_id = 228;




-- sub-query and their types

CREATE DATABASE Alpha_school;
CREATE TABLE student_data(
    std_id INT,
    std_name VARCHAR(50),
    marks INT
);

INSERT INTO student_data VALUES
(1,'Kumar',85),
(2,'Ravi',60),
(3,'Priya',95),
(4,'Arun',70),
(5,'Divya',88),
(6,'Suresh',76),
(7,'Meena',91),
(8,'Vijay',67),
(9,'Karthik',82),
(10,'Nisha',73),
(11,'Lokesh',58),
(12,'Anitha',99),
(13,'Hari',80),
(14,'Deepa',65),
(15,'Sanjay',87);


-- 1.find students above avg marks
-- conditional operator --> =,!=,>,<,<=,>=
select avg(marks) from student_data;
select * from student_data where marks > (select avg(marks) from student_data);

-- 2.select highest mark student
select * from student_data where marks = (select max(marks) from student_data);

-- 3.select lowest mark student
select * from student_data where marks = (select min(marks) from student_data);


-- types of sub-query
CREATE TABLE student_info(
    std_id INT,
    std_name VARCHAR(50),
    marks INT,
    course_id INT
);

INSERT INTO student_info VALUES
(1,'Kumar',85,101),
(2,'Ravi',60,102),
(3,'Priya',95,101),
(4,'Arun',70,103),
(5,'Divya',88,101),
(6,'Suresh',76,102),
(7,'Meena',91,101),
(8,'Vijay',67,103),
(9,'Karthik',82,102),
(10,'Nisha',73,101),
(11,'Lokesh',58,103),
(12,'Anitha',99,101),
(13,'Hari',80,102),
(14,'Deepa',65,103),
(15,'Sanjay',87,101);


CREATE TABLE course_data(
    course_id INT,
    course_name VARCHAR(50)
);

INSERT INTO course_data VALUES
(101,'Python'),
(102,'Java'),
(103,'SQL');

-- multi - row sub query
select * from student_info where course_id in 
(select course_id from course_data where course_name = "Java");

-- nested sub-query
SELECT * FROM student_info WHERE marks > 
( 
SELECT AVG(marks) FROM student_info WHERE marks >
( SELECT MIN(marks) FROM student_data WHERE marks > 70)
);

