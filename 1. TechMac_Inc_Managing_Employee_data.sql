 -- task1 Create database'techmac_db'


create database techmac_db;-- creating database;
use techmac_db;
---------------------------------------------------------------------------------
 /*task 2 Create table 'techhyve_employees',techcloud_employees','techsoft_employees'
and use constraints*/


create table techmac_db.techhyve_employees(Employee_id char(50) primary key,
firstname varchar(100),lastname varchar(100),gender varchar(50),
age int check(age>21 and age<55));
select*from techhyve_employees;
create table techmac_db.techcloud_employees(Employee_id char(50) primary key,
firstname varchar(100), lastname varchar(100),gender varchar(50),
age int check(age>21 and age<55));
create table techmac_db.techsoft_employees(Employee_id char(50) primary key,
firstname varchar(100),lastname varchar(100),gender varchar(50),
age int check(age>21 and age<55));
--------------------------------------------------------------------------------
/* Task 3 Alter the tables and add 'communication_proficiency' & set default as'1'*/


alter table techhyve_employees add column(communication_proficiency int);
alter table techcloud_employees add column(communication_proficiency int);
alter table techsoft_employees add column(communication_proficiency int);
alter table techhyve_employees add check(communication_proficiency between 1 and 5);
alter table techhyve_employees alter communication_proficiency set default 1;
alter table techcloud_employees add check(communication_proficiency between 1 and 5);
alter table techcloud_employees alter communication_proficiency set default 1;
alter table techsoft_employees add check(communication_proficiency between 1 and 5);
alter table techsoft_employees alter communication_proficiency set default 1; 
----------------------------------------------------------------------------------
/* Task 4 insert the data in the columns*/


Insert into techhyve_employees(employee_id,firstname,lastname,gender,age,communication_proficiency)
values("TH0001","Eli","Evans","male",'26','1'),
("TH0002","Carlos","Simmons","male",'32','2'),
("TH0003","Kathie","Bryant","female",'25','1'),
("TH0004","Joey","hughes","male",'41','4'),
("TH0005","Alice","matthews","female",'52','4');
insert into techcloud_employees(employee_id,firstname,lastname,gender,age,communication_proficiency)
values("TC0001","Teresa","Bryant","female",'39','2'),
("TC0002","Alexis","Patterson","male",'48','5'),
("TC0003","Rose","Bell","female",'42','3'),
("TC0004","Gemma","Watkins","female",'44','3'),
("TC0005","Kington","Martinez","male",'29','2');
insert into techsoft_employees(employee_id,firstname,lastname,gender,age,communication_proficiency)
values("TS0001","Peter","Burtler","male",'44','4'),
("TS0002","Harold","Simmons","male",'54','4'),
("TS0003","Juliana","Sanders","female",'36','2'),
("TS0004","Paul","Ward","male",'29','2'),
("TS0005","Nicole","Bryant","female",'30','2');
------------------------------------------------------------------------------------------------------
/* Task 5 Backup the three tables & save in new database*/


create database backup_techmac_db;
use backup_techmac_db;
create table techhyve_employees_bkp like techmac_db.techhyve_employees;
insert techhyve_employees_bkp select*from techmac_db.techhyve_employees;
create table techcloud_employees_bkp like techmac_db.techcloud_employees;
insert techcloud_employees_bkp select*from techmac_db.techcloud_employees;
create table techsoft_employees_bkp like techmac_db.techsoft_employees;
select*from techhyve_employees_bkp;
-----------------------------------------------------------------------------------------------
/* Task 6 Delete data from 'techhyve_employees',techcloud_employees'*/


use techmac_db;
delete from techhyve_employees where employee_id= "TH0003";
delete from techhyve_employees where employee_id= "TH0005";
delete from techcloud_employees where employee_id= "TC0001";
delete from techcloud_employees where employee_id= "TC0004";
-------------------------------------------------------------------------------------------------
/* Task 7 Merge Techhyve and techcloud table & insert in a new table*/


insert ignore into techmac_db.techhyve_employees select*from techmac_db.techcloud_employees;
select*from techhyve_employees;
alter table techhyve_employees rename to techyvecloud_employees;
select*from techcloud_employees;



