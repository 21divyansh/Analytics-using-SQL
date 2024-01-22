 -- TASK1 Display the first_name,last_name, actor, and the details of the last_updated column
 USE sakila;
 SELECT * FROM actor;
 
 ------------------------------------------------------------------------------------------------
/*TASK2 A. Display the full names of all actors
B.Display the firstnames of actors along with the count of repeated first name.  
C. Display the lastnames of actors along with the count of repeated lastnames.*/

SELECT CONCAT(first_name,last_name)as full_name FROM actor;
SELECT COUNT(first_name),first_name FROM actor GROUP BY first_name;
SELECT COUNT(last_name),last_name FROM actor GROUP BY last_name;

-----------------------------------------------------------------------------------------------------
 -- TASK 3 Display the count of movies grouped by the ratings 
 SELECT * FROM film;
 SELECT rating,COUNT(title) FROM film GROUP BY rating;
 ------------------------------------------------------------------------------------------------------
  -- TASK4 Display the average rental rates based on movie ratings
 SELECT rating,AVG(rental_rate) FROM film GROUP BY rating;
 ----------------------------------------------------------------------------------------------------------
  -- TASK 5 Display the movie title where the replacement cost is up to $9
 
 SELECT title,replacement_cost FROM film WHERE replacement_cost=9.99;
 SELECT title,replacement_cost FROM film WHERE replacement_cost BETWEEN '15' AND '20';
 SELECT title, MAX(replacement_cost),MIN(rental_rate) FROM film GROUP BY title;
 -------------------------------------------------------------------------------------------------------
  -- TASK 6 Display the list of movies with number of actors listed for each
	SELECT*FROM film_actor;
SELECT film.film_id,film.title,COUNT(film_actor.actor_id)FROM film
 INNER JOIN film_actor ON film.film_id=film_actor.film_id GROUP BY film.film_id;
 ------------------------------------------------------------------------------------------------
  -- TASK 7 Display the movie titles with "k" & "Q"
  SELECT title FROM film WHERE title LIKE 'K%';
   SELECT title FROM film WHERE title LIKE 'Q%';
   ------------------------------------------------------------------------------------------------
    -- TASK 8 Display first and last names of all actors who are a part of 'Agent Truman'
 SELECT first_name,last_name from actor
    WHERE actor_id IN(SELECT actor_id FROM film_actor WHERE film_id=
    (SELECT film_id FROM film WHERE title ='AGENT TRUMAN'));
    --------------------------------------------------------------------------------------------------------
 -- TASK 9 Display the movies fall under family category
 SELECT*FROM category;
 SELECT title FROM film WHERE film_id IN (SELECT film_id FROM film_category WHERE
category_id=(SELECT category_id FROM category WHERE name ='family'));
----------------------------------------------------------------------------------------------------
 -- TASK 10 Display the title of movies as per the most frequently rented movies
SELECT *FROM rental;
SELECT title FROM film WHERE last_update IN (SELECT last_update FROM rental
 WHERE rental_date=current_date());
 ------------------------------------------------------------------------------------------------------
  --/*TASK 11 Display the number of movie categories where the average difference between
  the movie replacement cost and the rental rate is greater than $15*/
SELECT COUNT(name) FROM category WHERE category_id IN(
SELECT category_id FROM film_category WHERE film_id=(
SELECT film_id FROM film GROUP BY film_id HAVING AVG(replacement_cost)-AVG(rental_rate) >15));
----------------------------------------------------------------------------------------------------------
 -- TASK 12 Display the names of categories and the number of movies per category
 SELECT category.name,film.film_id FROM category
 INNER JOIN film_category ON category.category_id=film_category.category_id
 INNER JOIN film ON film_category.film_id=film.film_id;
 ----------------------------------------------------------------------------------------------------------------

  