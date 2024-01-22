-- Task 1 Extract data of customer who are inactive
 
 USE sakila;
SELECT* FROM customer;
 SELECT active,first_name FROM customer WHERE active=0;
 
 
------------------------------------------------------------------------------------------------
 -- TASK 2 Identify the first_name,last_name and emails of inactive customers
 
 SELECT first_name,last_name, email,active FROM customer WHERE active=0;
 
 -------------------------------------------------------------------------------------------
 
-- TASK 3 Identify the store_id having highest number of inactive customer

SELECT MAX(active),store_id FROM customer WHERE active=0 GROUP BY MAX(active);
SELECT store_id,MAX(active)as inactive FROM customer WHERE active=0 GROUP BY store_id;

-----------------------------------------------------------------------------------------------

 -- TASK 4 Idetify the movies name that are rated as PG -13
 
 SELECT title,rating FROM film WHERE rating= "PG-13";
 SELECT * FROM film;

--------------------------------------------------------------------------------------------------

 -- TASK 5 Identify the top three movies with PG-13 rating that have thw longest running time
 
 SELECT title,rating,length FROM film WHERE rating="PG-13" 
 ORDER BY length DESC LIMIT 3;
 
 ----------------------------------------------------------------------------------------------------
 
  -- TASK 6 Find the most popular PG-13 movies based on rental duration
  
  SELECT title,rating,rental_duration FROM film WHERE rating="PG-13"
  ORDER BY rental_duration ASC LIMIT 1;
  
  ----------------------------------------------------------------------------------------------------
  
   -- TASK 7 Find the average rental cost of the movies.alter
   
   SELECT title,AVG(rental_rate) FROM film GROUP BY title;
   
   ---------------------------------------------------------------------------------------------------
   
    -- TASK 8 Find the total replacement cost of all movies
    
SELECT title,replacement_cost FROM film ORDER BY replacement_cost DESC;

---------------------------------------------------------------------------------------------------------
 
  /*TASK 9 Identify the numbers of films from the categories:
Animation,Children*/

SELECT category_id,name FROM category WHERE name= "Animation" OR name= "Children";
SELECT*FROM category;
SELECT COUNT(category_id) FROM film_category WHERE category_id ='2' AND '3';
SELECT*FROM film_category;

 -----------------------------------------------------------------------------------------------------