 -- TASK 1 Identify the top 5 cities that have the maximumum number of employees
 USE hr;
 SELECT MAX(employee_id), city FROM employees 
 INNER JOIN departments ON departments.department_id=employees.department_id
 INNER JOIN locations ON locations.location_id=departments.location_id
 GROUP BY city LIMIT 5;
  -- INTERPRETATION: Seattle city has the highest number of employees i.e, 206
----------------------------------------------------------------------------------------------------------------------------------------------

-- TASK-2
-- List thhe first name, last name, countries, cities, departments and salaries
-- of the employees from top 5 cities 

SELECT * FROM countries;

CREATE VIEW top_5_city AS
 SELECT MAX(employee_id), city FROM employees 
 INNER JOIN departments ON departments.department_id=employees.department_id
 INNER JOIN locations ON locations.location_id=departments.location_id
 GROUP BY city LIMIT 5;
SELECT * FROM top_5_city;
SELECT * FROM employees;
SELECT * FROM locations;
SELECT employees.first_name,employees.last_name,countries.country_name,top_5_city.city,departments.department_name,employees.salary
FROM employees JOIN departments ON employees.department_id=departments.department_id 
JOIN locations ON departments.location_id=locations.location_id 
JOIN countries ON locations.country_id=countries.country_id
JOIN top_5_city ON locations.city=top_5_city.city LIMIT 5;
-------------------------------------------------------------------------------------------------------------------------------------------

-- TASK-3 List the cities in which the number of employees is less then 10

SELECT * FROM employees;
SELECT * FROM locations;
SELECT * FROM departments;
 SELECT city,COUNT(employee_id) FROM employees INNER JOIN departments 
 ON departments.department_id=employees.department_id
 INNER JOIN locations ON locations.location_id=departments.location_id
 GROUP BY city HAVING COUNT(employee_id)<10;
---------------------------------------------------------------------------------------------------------------------------------------------

 -- TASK 4 Find the average experience of the employees of each city identifies in Task 3

CREATE VIEW city_view2 AS
 SELECT city,COUNT(employee_id) FROM employees INNER JOIN departments 
 ON departments.department_id=employees.department_id
 INNER JOIN locations ON locations.location_id=departments.location_id
 GROUP BY city HAVING COUNT(employee_id)<10;
 
SELECT * FROM employees;
SELECT * FROM city_view2;

SELECT AVG(datediff(current_date,hire_date)/365)AS experience, city_view2.city from employees
JOIN departments ON employees.department_id=departments.department_id
JOIN locations ON locations.location_id=departments.location_id
JOIN city_view2 ON locations.city=city_view2.city GROUP BY city ;
--------------------------------------------------------------------------------------------------------
/*TASK-5 Find the first_name,last_name, email, Phone_number of employees idetified from city in task 1
& have completed 10 years in the organisation*/

SELECT * FROM top_5_city;
SELECT * FROM employees;
SELECT * FROM locations;
SELECT * FROM departments;
SELECT first_name,last_name,email,phone_number,(datediff(current_date,hire_date)/365)AS experience,
 top_5_city.city from employees
JOIN departments ON employees.department_id=employees.department_id
JOIN locations ON departments.location_id=locations.location_id
JOIN top_5_city ON locations.city=top_5_city.city
HAVING experience >10;

-------------------------------------------------------------------------------------------------------------------------------------------
-- TASK-6 List the IDs of the managers of the employees identified in Task 5

CREATE VIEW employee_details as
SELECT first_name,last_name,email,phone_number,(datediff(current_date,hire_date)/365)AS experience,
 top_5_city.city from employees
JOIN departments ON employees.department_id=employees.department_id
JOIN locations ON departments.location_id=locations.location_id
JOIN top_5_city ON locations.city=top_5_city.city
HAVING experience >10;

SELECT * FROM employee_details;
SELECT * FROM employees;

SELECT employee_details.first_name,employee_details.last_name, 
employee_details.email,employee_details.phone_number,employees.manager_id 
FROM employee_details JOIN employees ON employee_details.first_name=employees.first_name;

---------------------------------------------------------------------------------------------------------------------------------------------


