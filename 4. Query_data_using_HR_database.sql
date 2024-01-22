USE hr;
 -- TASK 1 Find the count of all the employees in the organisation
SELECT COUNT(employee_id) FROM employees;
 -- Interpretation: There is total 107 count of employees
 -------------------------------------------------------------------------------------------------------------------
  -- TASK 2 Find the departmnet ID wise count of employees in the organization
  SELECT department_id,COUNT(employee_id) FROM employees GROUP BY department_id;
   -- Interpretation: Department_id=50 has the highest count of employees i.e, 45
   ------------------------------------------------------------------------------------------------------------------
    -- TASK 3 Find the first_name,last_names,salaries of those employees with salary > $6000
    SELECT first_name,last_name,salary FROM employees WHERE salary >'6000';
     -- Interpretation: The employee name "Steven King" has the highest salary i.e, $24000
     -----------------------------------------------------------------------------------------------------------------
      -- TASK 4 Determine the count of employees earning greater than $20000
      SELECT COUNT(employee_id),salary FROM employees WHERE salary > 20000 GROUP BY employee_id;
       -- Interpretation: There is only 1 employee earning greater than $20000 i.e, $24000
       ---------------------------------------------------------------------------------------------------------------
        -- TASK 5 List the details of employees getting commission to decide the % of bonus they should receive
        SELECT*FROM employees;
        SELECT commission_pct FROM employees ORDER BY commission_pct DESC;
         -- Interpretation: There are 35 employees eligible of bonus as per commission rate
         -------------------------------------------------------------------------------------------------------------
          -- TASK 6 List the employees by their full names who get commission 
          SELECT CONCAT(first_name,'_',last_name)AS Fullname,commission_pct FROM employees
          ORDER BY commission_pct DESC;
            /*Interpretation: There are total 35 employees to be invited as per commission where
           John_Russell has the highest commission i.e, 0.40*/
           ----------------------------------------------------------------------------------------------------------
			-- TASK 7 Fetch details of employees who get commission- Employee ID,Employee name, Email ID, PH. NO. 
            SELECT employee_id,CONCAT(first_name,'_',last_name)AS employee_Full_name,email,phone_number FROM
            employees ORDER BY commission_pct DESC;
            -----------------------------------------------------------------------------------------------------------
             -- TASK 8 Identify the top three department_ID having highest total salary
             SELECT department_id,MAX(salary) FROM employees GROUP BY department_id ORDER BY MAX(salary)
             LIMIT 3;
             -------------------------------------------------------------------------------------------------------
              -- TASK 9 List details of employees from IT department
              SELECT * FROM employees WHERE department_id IN (SELECT department_id FROM departments
              WHERE department_name= "IT");
              -----------------------------------------------------------------------------------------------------------
               -- TASK 10 Find the count of all employees in the IT and their avg salary
               SELECT COUNT(employee_id),AVG(salary) FROM employees WHERE department_id IN
               (SELECT department_id FROM departments WHERE department_name = "IT");
               -------------------------------------------------------------------------------------------------------
			-/*ASK 11 Identify the department ID and NO.employees for the department in which salary range
               is between $7000-$10000*/
            SELECT  department_id,COUNT(employee_id) FROM employees WHERE salary BETWEEN 7000 AND 10000
            GROUP BY department_id;
            ----------------------------------------------------------------------------------------------------------
               
             
			
           