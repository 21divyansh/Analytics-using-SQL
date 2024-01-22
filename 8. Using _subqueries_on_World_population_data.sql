 -- Sakila Database
/* TASK1 :Identify and display the film IDs and the exisiting number of copies for
'brotherhood blanket','Soup Wisdom'*/

USE sakila;
SELECT*FROM film;
SELECT *FROM customer;
SELECT * FROM rental;
SELECT* FROM store;
SELECT film_id,COUNT(inventory.film_id) AS No_of_copies FROM
film JOIN inventory USING(film_id) WHERE title  ="Brotherhood blanket" OR 
"Soup Wisdom" GROUP BY inventory.film_id;


---------------------------------------------------------------------------------------------
/* TASK2: Calculate and display the total number of movies ineach genre*/

SELECT COUNT(film.title) FROM film JOIN film_category
ON film_category.film_id=film.film_id JOIN category
ON category.category_id=film_category.category_id GROUP BY name;

------------------------------------------------------------------------------------------------

/* TASK 3 Display the first names and lastnames of top 3 actors whose movies the 
highest replacement cost */

SELECT first_name,last_name FROM actor WHERE actor_id IN 
(SELECT actor_id FROM film_actor WHERE film_id IN
(SELECT film_id FROM film ORDER BY replacement_cost DESC)) LIMIT 3;

--------------------------------------------------------------------------------------------

/* TASK 4 Calculate and display the total sale amout for each type of movie */

SELECT*FROM film;
SELECT*FROM film_category;
SELECT* FROM payment;
SELECT*FROM category;
SELECT * FROM inventory;

SELECT category.name,SUM(payment.amount) FROM category JOIN
film_category ON film_category.category_id=category.category_id JOIN
inventory on inventory.film_id=film_category.film_id JOIN
rental ON inventory.inventory_id=rental.inventory_id JOIN
payment ON rental.rental_id=payment.rental_id GROUP BY category.name;

---------------------------------------------------------------------------------------------
