--1
---Created query to pull: employee number, last name, first name, gender, and salary of that employee. 
---I made an inner join based on employee number 

SELECT e.emp_no, e.last_name AS "Last Name", e.first_name AS "First Name", e.gender, s.salary
FROM "Salaries" AS s
JOIN "Employees" AS e ON
e.emp_no = s.emp_no;

-------------------------------------------------------------------------------------------
--2
---I found the employees hired between the beginning of 1986 and the very end of 1986
---I then ordered by the hire date column

SELECT first_name, last_name, hire_date
FROM "Employees"
WHERE hire_date >= DATE '1986-01-01' AND hire_date < DATE '1986-12-31'
ORDER BY hire_date;

-------------------------------------------------------------------------------------------
---3
---User Inner Joins with Employee Deparment being the middle ground for Manager, Employee, and Department

SELECT d.dept_no, d.dept_name AS "Department Name", m.emp_no, e.last_name AS "Last Name", e.first_name AS "First Name", 
m.from_date AS "Start Date", m.to_date AS "End Date" 
FROM "Employee_Department" AS ed
INNER JOIN "Employees" AS e ON (ed.emp_no = e.emp_no)
INNER JOIN "Department" AS d ON (ed.dept_no = d.dept_no)
INNER JOIN "Manager_Department" AS m ON (ed.emp_no = m.emp_no);

-------------------------------------------------------------------------------------------
---4
---I made an Inner Join based on the table Employee_Deparment.  
---I brought Employee and Department tables together through Employeement_Department being the middle ground

SELECT e.emp_no, e.last_name AS "Last Name", e.first_name AS "First Name", d.dept_name AS "Department Name"
FROM "Employee_Department" AS ed
INNER JOIN "Employees" AS e ON (ed.emp_no = e.emp_no)
INNER JOIN "Department" AS d ON (ed.dept_no = d.dept_no)
ORDER BY e.last_name;


-------------------------------------------------------------------------------------------
---5
----I pulled first and last name from Employees. I made a strict search for first name
----I made a wild card search for last name

SELECT first_name, last_name
FROM "Employees"
WHERE first_name = 'Hercules' and last_name LIKE 'B%';

-------------------------------------------------------------------------------------------
---6
---I copied query from problem 4
---Then I did a WHERE statment to filter through only employees with Sales

SELECT e.emp_no, e.last_name AS "Last Name", e.first_name AS "First Name", d.dept_name AS "Department Name"
FROM "Employee_Department" AS ed
INNER JOIN "Employees" AS e ON (ed.emp_no = e.emp_no)
INNER JOIN "Department" AS d ON (ed.dept_no = d.dept_no)
WHERE d.dept_name = 'Sales'
ORDER BY e.last_name;

-------------------------------------------------------------------------------------------
---7
---I copied my Inner Join query from above
---Then I did a WHERE statment to filter through only employees with Sales and Development

SELECT e.emp_no, e.last_name AS "Last Name", e.first_name AS "First Name", d.dept_name AS "Department Name"
FROM "Employee_Department" AS ed
INNER JOIN "Employees" AS e ON (ed.emp_no = e.emp_no)
INNER JOIN "Department" AS d ON (ed.dept_no = d.dept_no)
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development'
ORDER BY e.last_name;

-------------------------------------------------------------------------------------------
---8
----I needed to know the last name, and how much the last name appeared
----I grouped by the last name

SELECT last_name, COUNT(last_name)
FROM "Employees"
GROUP BY last_name
ORDER BY last_name;

