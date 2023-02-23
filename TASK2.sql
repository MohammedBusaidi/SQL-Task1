CREATE TABLE department(
	dep_id INTEGER PRIMARY KEY,
	dep_name VARCHAR(20),
	dep_location VARCHAR(15)
);
CREATE TABLE salary_grade (
	grade INTEGER,
	min_salary INTEGER,
	max_salary INTEGER
);
CREATE TABLE employees (
	emp_id INTEGER PRIMARY KEY,
	emp_name VARCHAR(15),
	job_name VARCHAR(10),
	manager_id INTEGER,
	hire_date DATE,
	salary DECIMAL(10, 2),
	commission DECIMAL(7,2),
	dep_id INTEGER,
	FOREIGN KEY (dep_id) REFERENCES department(dep_id)
);
SELECT * FROM department;
SELECT * FROM salary_grade;
INSERT INTO department VALUES 
	(1001, 'FINANCE', 'SYDNEY'),
	(2001, 'AUDIT', 'MELBOURNE'),
	(3001, 'MARKETING', 'PERTH'),
	(4001, 'PRODUCTION', 'BRISBANE');
INSERT INTO salary_grade VALUES 
	(1, 800, 1300),
	(2, 1301, 1500),
	(3, 1501, 2100),
	(4, 2101, 3100),
	(5, 3101, 9999);
INSERT INTO employees VALUES 
	(68319, 'KAYLING', 'PRESIDENT', null, '1991-11-18', 6000.00, null, 1001),
	(66928, 'BLAZE', 'MANAGER', 68319, '1991-05-01', 2750.00, null, 3001),
	(67832, 'CLARE', 'MANAGER', 68319, '1991-06-09', 2550.00, null, 1001),
	(65646, 'JONAS', 'MANAGER', 68319,  '1991-04-02', 2957.00, null, 2001),
	(67858, 'SCARLET', 'ANALYST', 65646, '1997-04-19', 3100.00, null, 2001),
	(69062, 'FRANK', 'ANALYST', 65646, '1991-12-03', 3100.00, null, 2001),
	(63679, 'SANDRINE', 'CLERK', 69062, '1990-12-18', 900.00, null, 2001),
	(64989, 'ADELYN', 'SALESMAN', 66928,  '1991-02-20',  1700.00, 400.00, 3001),
	(65271, 'WADE', 'SALESMAN', 66928,   '1991-02-22', 1350.00, 600.00, 3001),
	(66564, 'MADDEN', 'SALESMAN', 66928,  '1991-09-28', 1350.00, 1500.00, 3001),
	(68454, 'TUCKER', 'SALESMAN', 66928,  '1991-09-08', 1600.00, 0.00, 3001),
	(68736, 'ADNRES', 'CLERK', 67858,  '1997-05-23', 1200.00, null, 2001),
	(69000, 'JULIUS', 'CLERK', 66928,  '1991-12-03', 1050.00, null, 3001),
	(69324, 'MARKER', 'CLERK', 67832,  '1992-01-23', 1400.00, null, 1001);


/*1. Write a SQL query to find the salaries of all employees. Return salary.*/
SELECT salary FROM employees;
/*2. Write a SQL query to find the unique designations of the employees. Return job name*/
SELECT DISTINCT job_name FROM employees;
/*3. Write a SQL query to list the employees’ name, increased their salary by 15%*/
SELECT emp_name, salary = salary * 1.15 FROM employees;
/*4. Write a SQL query to list the employee's name and job name as a format of "Employee & Job"*/
SELECT emp_name AS Employee, job_name AS Job FROM employees AS Employee;
/*5. Write a SQL query to find those employees with hire date in the format like February 22, 1991. Return employee ID, employee name, salary, hire date.*/
SELECT emp_id, emp_name, salary, hire_date FROM employees WHERE hire_date = '1991-02-22';
/*6. Write a SQL query to count the number of employees who have total income more than 2200 */
SELECT COUNT(*) FROM employees WHERE salary > 2200;
/*7. Write a SQL query to find the unique jobs with their corresponding department id. */
SELECT DISTINCT job_name, dep_id FROM employees;
/*8. Write a SQL query to find those employees who do not belong to the department 2001. Return complete information about the employees. */
SELECT * FROM employees WHERE dep_id != 2001;
/*9. Write a SQL query to find those employees who joined before 1991. Return complete information about the employees */
SELECT * FROM employees WHERE hire_date < '1991-01-01';
/*10. Write a SQL query to calculate the average salary of employees who work as analysts. Return average salary. */
SELECT AVG(salary) as AvgSalary FROM employees WHERE job_name = 'ANALYST';
/*11. Write a SQL query to find the details of the employees who's name start start with B or end with E */
SELECT * FROM employees WHERE emp_name like 'B%' OR emp_name like '%E';
/*12. Write a SQL query to find the details of the employees who's department name start start with B or end with E */
SELECT * FROM department, employees WHERE dep_name like 'B%' OR dep_name like '%E';
/*13. Write a SQL query to find the details of the employees who's department location start start with F or end with N */
SELECT * FROM department, employees  WHERE dep_location like 'F%' OR dep_location like '%N';
/*14. Write a SQL query to identify employees whose commissions exceed their salaries. Return complete information about the employees, department location and department name */
SELECT emp_id, emp_name, job_name, manager_id, hire_date, salary, commission, dep_location, dep_name 
FROM employees, department WHERE commission > salary;
/*15. Write a SQL query to identify those employees whose salaries exceed 3000 after receiving a 25% salary increase */
SELECT * FROM employees WHERE salary * 1.25 > 3000.00;
/*16. Write a SQL query to find out which employees joined in the month of January. Return complete information about the employees. */
SELECT * FROM employees where month (hire_date) = '01';
/*17. Write a SQL query to separate the names of employees and their managers by the string 'works for'. */
SELECT  CONCAT (e.emp_name, ' works for ', m.emp_name) FROM employees e, employees m WHERE e.manager_id = m.emp_id;
/*18. Write a SQL query to find those employees whose designation is ‘CLERK’. Return complete information about the employees. */
SELECT * FROM employees WHERE job_name = 'CLERK';
/*19. Write a SQL query to identify employees with more than 27 years of experience. Return complete information about the employees. */
SELECT * FROM employees WHERE DATEDIFF(year, hire_date , GETDATE()) > 27;
/*20. Write a SQL query to find those employees whose salaries are less than 3500. Return complete information about the employees. */
SELECT * FROM employees WHERE salary < 3500;
/*21. Write a SQL query to find the employee whose designation is ‘ANALYST’. Return employee name, job name and salary. */
SELECT emp_id, job_name, salary FROM employees WHERE job_name = 'ANALYST';
/*22.  Write a SQL query to identify those employees who joined the company in 1991. Return complete information about the employees. */
SELECT *FROM employees where year (hire_date) = '1991';
/*23. Write a SQL query to identify those employees who joined the company after 1991. Return complete information about the employees. */\
SELECT *FROM employees where year (hire_date) > '1991';
/*24.  Write a SQL query to find those employees who joined before 1st April 1991. Return employee ID, employee name, hire date and salary. */
SELECT emp_name, emp_id, hire_date, salary FROM employees where hire_date < '1991/04/01';
/*25. Write a SQL query identify the employees who do not report to a manager. Return employee name, job name. */
SELECT emp_name, job_name FROM employees WHERE job_name != 'MANAGER';
/*26. Write a SQL query to find the employees who joined on the 1st of May 1991. Return complete information about the employees. */
SELECT *FROM employees where hire_date = '1991/05/01';
/*27. Write a SQL query to identify the experience of the employees who work under the manager whose ID number is 68319. Return employee ID, employee name, salary, experience */
SELECT emp_id, emp_name, salary,  DATEDIFF(year, hire_date , GETDATE()) AS experiance FROM employees WHERE manager_id = 68319;
/*28. Write a SQL query to find out which employees earn more than 100 per day as a salary. Return employee ID, employee name, salary, and experience. */
SELECT emp_id, emp_name, salary, DATEDIFF(year, hire_date , GETDATE()) AS experiance FROM employees WHERE salary / 30 > 100;
/*29. Write a SQL query to identify those employees who retired after 31-Dec-99, completing eight years of service. Return employee name. */
SELECT emp_name FROM employees WHERE DATEDIFF(year, hire_date , '1999/12/31') >= 8;
/*30. Write a SQL query to identify the employees whose salaries are odd. Return complete information about the employee */
SELECT *FROM employees WHERE salary % 2 = 1;
/*31. Write a SQL query to identify employees whose salaries contain only three digits. Return complete information about the employees. */
SELECT *FROM employees WHERE salary >= 100 AND salary <= 999;
/*32. Write a SQL query to find those employees who joined in the month of APRIL. Return complete information about the employees */
SELECT * FROM employees where month (hire_date) = '04';
/*33. Write a SQL query to find out which employees joined the company before the 19th of the month. Return complete information about the employees */
SELECT * FROM employees where day (hire_date) = '18';
/*34. Write a SQL query to identify those employees who have been working as a SALESMAN and month portion of the experience is more than 10. Return complete information about the employees. */
SELECT * FROM employees WHERE job_name = 'SALESMAN' AND DATEDIFF(year, hire_date , GETDATE()) > 10;
/*35. Write a SQL query to find those employees of department id 3001 or 1001 and joined in the year 1991. Return complete information about the employees. */
SELECT * FROM employees WHERE year(hire_date) = '1991' AND dep_id = 3001 OR dep_id = 1001;
/*36. Write a SQL query to find the employees who are working for the department ID 1001 or 2001. Return complete information about the employees. */
SELECT * FROM employees WHERE dep_id = 1001 OR dep_id = 2001;
/*37. Write a SQL query to find those employees whose designation is ‘CLERK’ and work in the department ID 2001. Return complete information about the employees. */
SELECT * FROM employees WHERE job_name = 'CLERK' AND dep_id = 2001;
/*38. Write a SQL query to find those employees who are either CLERK or MANAGER. Return complete information about the employees. */
SELECT * FROM employees WHERE job_name = 'CLERK' OR job_name = 'MANAGER';
/*39. Write a SQL query to identify those employees who joined in any month other than February. Return complete information about the employees.*/
SELECT * FROM employees WHERE month(hire_date) != '02';
/*40. Write a SQL query to identify the employees who joined the company in June 1991. Return complete information about the employees. */
SELECT * FROM employees WHERE hire_date = '1991/06/01';
/*41. Write a SQL query to search for all employees with an annual salary between 24000 and 50000 (Begin and end values are included.). Return complete information about the employees. */
SELECT * FROM employees WHERE salary * 12 BETWEEN 24000 AND 50000;
/*42. Write a SQL query to identify all employees who joined the company on 1st May, 20th February, and 3rd December 1991. Return complete information about the employees. */
SELECT * FROM employees WHERE hire_date IN ('1991/05/01', '1991/02/20', '1991/12/03');
/*43. Write a SQL query to find out which employees are working under the managers 63679, 68319, 66564, or 69000. Return complete information about the employees. */
SELECT *FROM employees WHERE manager_id IN (63679, 68319, 66564, 69000);
/*44. Write a SQL query to find those employees who joined in 90's. Return complete information about the employees. */
SELECT *FROM employees WHERE year(hire_date) >= '90'
/*45. Write a SQL query to find those managers who are in the department 1001 or 2001. Return complete information about the employees. */
SELECT * FROM employees WHERE job_name = 'MANAGER' AND (dep_id = 1001 OR dep_id =2001);
/*46. Write a SQL query to identify employees who joined in the month of FEBRUARY with a salary range of 1001 to 2000 (Begin and end values are included.). Return complete information about the employees. */
SELECT * FROM employees WHERE month(hire_date) = '02' AND salary BETWEEN 1001 AND 2000;
/*47. Write a SQL query to find those employees who joined before or after the year 1991. Return complete information about the employees. */
SELECT * FROM employees WHERE year(hire_date) <'1991' OR year(hire_date) > '1991';
/*48. Write a SQL query to find employees along with their department details. Return employee ID, employee name, job name, manager ID, hire date, salary, commission, department ID, and department name. */
SELECT emp_id, emp_name, job_name, manager_id, hire_date, salary, commission, dep_id FROM employees;
/*49. Write a SQL query to identify those employees who earn 60000 or more per year or do not work as ANALYST. Return employee name, job name, (12*salary) as Annual Salary, department ID, and grade. */
SELECT e.emp_name, e.job_name, (12*e.salary) AS "Annual Salary", e.dep_id, d.dep_name, s.grade FROM employees e, department d, salary_grade s WHERE e.dep_id = d.dep_id
  AND e.salary BETWEEN s.min_salary AND s.max_salary AND (((12*e.salary)>= 60000) OR (e.job_name != 'ANALYST'));
/*50. Write a SQL query to identify employees whose salaries are higher than their managers' salaries. Return employee name, job name, manager ID, salary, manager name, manager's salary*/
SELECT * FROM employees w, employees m WHERE w.manager_id = m.emp_id AND w.salary> m.salary;
/*51. Write a SQL query to find those employees whose salary is between 2000 and 5000 (Begin and end values are included.) and location is PERTH. Return employee name, department ID, salary, and commission*/
SELECT e.emp_name, e.dep_id, e.salary, e.commission FROM employees e, department d WHERE e.dep_id = d.dep_id AND d.dep_location = 'PERTH' AND e.salary BETWEEN 2000 AND 5000;
/*52. Write a SQL query to find the employees whose department ID is 1001 or 3001 and whose salary grade is not 4. They joined the company before 1992-12-31. Return grade, employee name.*/
SELECT e.emp_name, s.grade FROM employees e, salary_grade s WHERE e.dep_id IN (1001, 3001)
AND hire_date < ('1992/12/31') AND (e.salary BETWEEN s.min_salary AND s.max_salary AND s.grade != 4);
/*53. Write a SQL query to find those employees whose manager name is JONAS. Return employee id, employee name, job name, manager ID, hire date, salary, department ID, employee name. */
