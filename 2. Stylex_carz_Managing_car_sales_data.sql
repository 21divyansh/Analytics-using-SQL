-- TASK 1 Create database named 'stylexcars_db' and use it

CREATE DATABASE stylexcarz_db;
USE stylexcarz_db;

----------------------------------------------------------------------------------------------

 /*TASK 2 Create three tables to store the details and name 'salesperson','customers,
and 'orders' */

CREATE TABLE salesperson(salesperson_id INT PRIMARY KEY,
salesperson_name VARCHAR(100) NOT NULL,
salesperson_city VARCHAR(50) NOT NULL,
commission_rate INT NOT NULL);
CREATE TABLE customers(customer_id INT PRIMARY KEY,
first_name VARCHAR(100) NOT NULL,
last_name VARCHAR(100) NOT NULL,
city VARCHAR(50) NOT NULL,
c_rating INT NOT NULL);
CREATE TABLE orders(order_id INT PRIMARY KEY,
amount INT NOT NULL,
order_date INT NOT NULL,
salesperson_id INT NOT NULL,
customer_id INT NOT NULL);

-------------------------------------------------------------------------------------------

/* TASK 3 Insert data as per the downloaded sheet */

INSERT INTO salesperson(salesperson_id,salesperson_name,salesperson_city,commission_rate)
VALUES('10001',"William","New york",'12'),
('1002',"Liam","New jersey",'13'),
('1003',"Axelrod","San jose",'10'),
('1004',"James","San diego",'11'),
('1005',"Fran","Austin",'26'),
('1007',"Oliver","New york",'15'),
('1008',"John","Atlanta",'2'),
('1009',"Charles","New jersey",'2');
INSERT INTO customers(customer_id,last_name,first_name,city,c_rating)
VALUES('2001',"Hoffman","Anny","New york",'1'),
('2002',"Giovanni","Jenny","New jersey",'2'),
('2003',"Liu","Williams","San jose",'3'),
('2004',"Grass","Harry","San diego",'3'),
('2005',"Clemens","John","Austin",'4'),
('2006',"Cisneros","Fanny","New york",'4'),
('2007',"Pereira","Jonathan","Atlalnta",'3');
INSERT INTO orders(order_id,amount,order_date,salesperson_id,customer_id)
VALUES('3001','23',2020-02-01,'1009','2007'),
('3002','20',2021-02-23,'1009','2007'),
('3003','89',2021-03-06,'1002','2002'),
('3004','67',2021-04-02,'1004','2002'),
('3005','30',2021-07-30,'1001','2007'),
('3006','35',2021-09-18,'1001','2004'),
('3007','19',2021-10-02,'1001','2001'),
('3008','21',2021-10-09,'1003','2003'),
('3009','45',2021-10-10,'1009','2005');

--------------------------------------------------------------------------------------------------
/* TASK 4 Increase the commission of the salesperson whos commission is below 15% */

UPDATE salesperson SET commission_rate = '15'
WHERE commission_rate <= '15';
SET SQL_SAFE_UPDATES=0;
SELECT*FROM salesperson;
  
----------------------------------------------------------------------------------------------------

/* TASK 5 Backup the orders data into a new database named orders_bkp */

CREATE DATABASE order_backup;
USE order_backup;
CREATE TABLE IF NOT EXISTS order_bkp
LIKE stylexcarz_db.orders;
INSERT INTO order_bkp
SELECT*FROM stylexcarz_db.orders;
SELECT*FROM order_bkp;

------------------------------------------------------------------------------------------------------

/* TASK 6 Increase the ratings by 3 points of the customer who have placed order for more than
once */

USE stylexcarz_db;
SELECT*FROM orders;
UPDATE customers SET c_rating=c_rating+3
WHERE customer_id= '2007';
UPDATE customers SET c_rating=c_rating+3
WHERE customer_id= '2002';
SELECT*FROM customers;

-----------------------------------------------------------------------------------------------------------------




  
  
 



 