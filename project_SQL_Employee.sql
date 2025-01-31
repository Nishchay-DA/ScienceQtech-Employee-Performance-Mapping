create database employee;
/* 3.	Write a query to fetch EMP_ID, FIRST_NAME, LAST_NAME, GENDER, 
and DEPARTMENT from the employee record table, and make a list of 
employees and details of their department.
*/
SELECT EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT AS DEPARTMENT
FROM emp_record_table;

/*4.	Write a query to fetch EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPARTMENT, 
	and EMP_RATING if the EMP_RATING is: 
●	less than two
●	greater than four 
●	between two and four
*/
SELECT EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT AS DEPARTMENT, EMP_RATING
FROM emp_record_table
WHERE EMP_RATING < 2;
SELECT EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT AS DEPARTMENT, EMP_RATING
FROM emp_record_table
WHERE EMP_RATING > 4;
SELECT EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT AS DEPARTMENT, EMP_RATING
FROM emp_record_table
WHERE EMP_RATING BETWEEN 2 AND 4;

/*5.Write a query to concatenate the FIRST_NAME and the LAST_NAME of employees
 in the Finance department from the employee table and then give the resultant column alias as NAME.]
 */
 SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME) AS NAME
FROM emp_record_table
WHERE DEPT = 'Finance';

/*6.Write a query to list only those employees who have someone reporting to them.
 Also, show the number of reporters (including the President).
 */
SELECT MANAGER_ID AS EMP_ID, COUNT(EMP_ID) AS REPORTER_COUNT
FROM emp_record_table
WHERE MANAGER_ID IS NOT NULL
GROUP BY 1;

/*7.Write a query to list down all the employees from the healthcare and
 finance departments using union. Take data from the employee record table.
*/
SELECT EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT
FROM emp_record_table
WHERE DEPT = 'Healthcare'

UNION

SELECT EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT
FROM emp_record_table
WHERE DEPT = 'Finance';

/*8.Write a query to list down employee details such as 
EMP_ID,FIRST_NAME, LAST_NAME, ROLE, DEPARTMENT, and EMP_RATING 
grouped by dept.Also include the respective employee rating 
along with the max emp rating for the department.
*/
SELECT 
    EMP_ID,
    FIRST_NAME,
    LAST_NAME,
    ROLE,
    DEPT AS DEPARTMENT,
    EMP_RATING,
    MAX(EMP_RATING) OVER (PARTITION BY DEPT) AS MAX_EMP_RATING
FROM 
    emp_record_table
ORDER BY 
    DEPARTMENT, EMP_RATING DESC;


/*9.Write a query to calculate the minimum and the maximum salary of 
the employees in each role. Take data from the employee record table.
*/
SELECT 
    ROLE,
    MIN(SALARY) AS MIN_SALARY,
    MAX(SALARY) AS MAX_SALARY
FROM 
    emp_record_table
GROUP BY 
    ROLE;
select * from emp_record_table;

/*10.Write a query to assign ranks to each employee based on their experience.
 Take data from the employee record table.
*/
SELECT EMP_ID,FIRST_NAME,LAST_NAME,ROLE,DEPT AS DEPARTMENT,EXP,
    RANK() OVER (ORDER BY EXP DESC) AS EXPERIENCE_RANK
FROM emp_record_table;

/*11.Write a query to create a view that displays employees in various countries
 whose salary is more than six thousand. Take data from the employee record table.
*/
CREATE VIEW High_Salary_Employees AS
SELECT 
    EMP_ID,
    FIRST_NAME,
    LAST_NAME,
    COUNTRY,
    SALARY
FROM 
    emp_record_table
WHERE 
    SALARY > 6000;
select * from high_salary_employees;

/*12.Write a nested query to find employees with experience of more than ten years.
 Take data from the employee record table.
*/
SELECT EMP_ID, FIRST_NAME, LAST_NAME, ROLE, DEPT AS DEPARTMENT, EXP
FROM emp_record_table
WHERE EXP > 10;

/*13.Write a query to create a stored procedure to retrieve the details of the 
employees whose experience is more than three years. 
Take data from the employee record table.
*/
DELIMITER &&
CREATE PROCEDURE GetExperiencedEmployees()
BEGIN
    SELECT 
        EMP_ID,
        FIRST_NAME,
        LAST_NAME,
        ROLE,
        DEPT AS DEPARTMENT,
        EXP AS EXPERIENCE,
        COUNTRY,
        CONTINENT,
        SALARY,
        EMP_RATING
    FROM 
        emp_record_table
    WHERE 
        EXP > 3;
	END &&
/*14.	Write a query using stored functions in the project table to check 
whether the job profile assigned to each employee in the data science team 
matches the organization’s set standard.
The standard being:
For an employee with experience less than or equal to 2 years assign 'JUNIOR DATA SCIENTIST',
For an employee with the experience of 2 to 5 years assign 'ASSOCIATE DATA SCIENTIST',
For an employee with the experience of 5 to 10 years assign 'SENIOR DATA SCIENTIST',
For an employee with the experience of 10 to 12 years assign 'LEAD DATA SCIENTIST',
For an employee with the experience of 12 to 16 years assign 'MANAGER'.
*/

/*15.Create an index to improve the cost and performance of the query to find the 
employee whose FIRST_NAME is ‘Eric’ in the employee table after checking the execution plan.
*/

/*16.Write a query to calculate the bonus for all the employees, based on their ratings
 and salaries (Use the formula: 5% of salary * employee rating).
*/
  SELECT 
    EMP_ID,
    FIRST_NAME,
    LAST_NAME,
    ROLE,
    DEPT AS DEPARTMENT,
    SALARY,
    EMP_RATING,
    (0.05 * SALARY * EMP_RATING) AS BONUS
FROM 
    emp_record_table;

/*17.Write a query to calculate the average salary distribution based on the 
continent and country. Take data from the employee record table.
*/
select continent, country, avg(salary)
from emp_record_table
group by 1, 2
order by 1, 2;






