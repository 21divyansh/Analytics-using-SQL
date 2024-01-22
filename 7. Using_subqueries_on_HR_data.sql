 -- TASK 1: Display the employee ID, first names, last names and department names of all employees using subquery
 USE hr;

SELECT employee_id,first_name,last_name,(SELECT department_name FROM departments d
WHERE e.department_id=d.department_id)department_name FROM employees e;
-----------------------------------------------------------------------------------------------------------------
 /*TASK 2: Display the firstnames,lastnames, and salaries of the employees whose salaries are greater than the average salary
  of all employees, grouped by the department IDs */
  
  SELECT AVG(salary) FROM employees;
  -- 6461.682243
  
  SELECT first_name,last_name,salary FROM employees WHERE salary > (SELECT AVG(salary) FROM employees);
  --------------------------------------------------------------------------------------------------------------------
   /* TASK 3: Display the firstnames and lastnames of those employees of the sales department
   who have a salary less than the average salary of all employees of the sales department */

SELECT*FROM departments;

SELECT AVG(salary) FROM employees WHERE department_id 
IN(SELECT department_id FROM departments WHERE department_name = "Sales");

SELECT first_name,last_name FROM employees WHERE salary <
(SELECT AVG(salary) FROM employees WHERE department_id 
IN(SELECT department_id FROM departments WHERE department_name = "Sales"));
------------------------------------------------------------------------------------------------------------
 /* TASK 4: Displaye the firstnames, lastnames and salaries of the employees who have a salary higher
 than the salaries of all IT programmers. Display the details of the employees in the ascending
 order of the salary, using subquery */
 
 SELECT AVG(salary) FROM employees WHERE job_id = "IT_PROG";
 
 SELECT first_name,last_name,salary FROM employees WHERE salary >
 ( SELECT AVG(salary) FROM employees WHERE job_id = "IT_PROG") ORDER BY salary ASC;
 ---------------------------------------------------------------------------------------------------------------
  /* TASK 5: Display the records of the employees with the minimum salary in the employees table,
  grouped by the jod_id column and arranged in the ascending order */
  
  SELECT MIN(salary) FROM employees;
  
  SELECT*FROM employees WHERE salary IN(SELECT MIN(salary) FROM employees
 GROUP BY job_id) ORDER BY salary ASC;
 ------------------------------------------------------------------------------------------------------------
 /* TASK 6: Display the firstnames, lastnames and department IDs of the employees whose 
 salary is greater than 60% of the sum of the salaries of all employees of their respective departments*/
 
 SELECT (SUM(salary*.6)) FROM employees; 

 SELECT e1.first_name, e1.last_name, e1.department_id FROM employees e1 WHERE salary>
 (SELECT (SUM(salary))*.6 FROM employees e2 WHERE e1.department_id=e2.department_id);
 ----------------------------------------------------------------------------------------------------------
 /* TASK 7 Display the first names and last names of all those employees who have their namagers based out of 
 UK, using subquery*/
 
 SELECT*FROM employees;
 SELECT*FROM departments;
 SELECT*FROM locations;
  SELECT first_name,last_name FROM employees WHERE manager_id IN 
 (SELECT manager_id FROM departments WHERE location_id IN
 (SELECT location_id FROM locations WHERE country_id = "UK"));
 ------------------------------------------------------------------------------------------------------------
  /* TASK 8: Display the firstnames,lastnames and salaries of top 5 highest paid employees
  and export the output as a CSV file. USE data export technique*/
   
SELECT first_name,last_name,salary FROM employees ORDER BY salary DESC LIMIT 5;
---------------------------------------------------------------------------------------------------------
 
 
 




  
  