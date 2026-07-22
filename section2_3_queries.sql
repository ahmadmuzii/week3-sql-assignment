-- ==========================================
-- SECTION 2 - MEDIUM
-- ==========================================

-- Q1: Find the average salary for each department.

SELECT department, AVG(salary) AS AverageSalary
FROM employees
GROUP BY department;


-- Q2: Show only departments whose average salary is above 60,000.

SELECT department, AVG(salary) AS AverageSalary
FROM employees
GROUP BY department
HAVING AVG(salary) > 60000;


-- Q3: Count how many employees work in each department.

SELECT department, COUNT(*) AS EmployeeCount
FROM employees
GROUP BY department;


-- Q4: Show each employee's name along with their department name and location.

SELECT
    e.name AS EmployeeName,
    d.department_name,
    d.location
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.id;


-- Q5: Show all employees and their department name,
-- including employees whose department may not match.

SELECT
    e.name AS EmployeeName,
    d.department_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.id;


-- Q6: Find all employees who earn more than the company's overall average salary.

SELECT *
FROM employees
WHERE salary >
(
    SELECT AVG(salary)
    FROM employees
);


-- Q7: List departments that currently have at least one employee assigned.

SELECT *
FROM departments d
WHERE EXISTS
(
    SELECT 1
    FROM employees e
    WHERE e.dept_id = d.id
);


-- Q8: Show each employee's name next to their manager's name.

SELECT
    e.name AS Employee,
    m.name AS Manager
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.id;


-- Q9: Show employee name, salary, bonus and total pay.

SELECT
    name,
    salary,
    bonus,
    salary + COALESCE(bonus,0) AS TotalPay
FROM employees;


-- Q10: List all employees hired during 2021.

SELECT *
FROM employees
WHERE YEAR(hire_date) = 2021;



-- ==========================================
-- SECTION 3 - HARD
-- ==========================================

-- Q1: Rank employees by salary within their own department.

SELECT
    name,
    department,
    salary,
    RANK() OVER
    (
        PARTITION BY department
        ORDER BY salary DESC
    ) AS SalaryRank
FROM employees;


-- Q2: Find the top 2 highest-paid employees in every department.

WITH RankedEmployees AS
(
    SELECT
        *,
        ROW_NUMBER() OVER
        (
            PARTITION BY department
            ORDER BY salary DESC
        ) AS RowNum
    FROM employees
)

SELECT *
FROM RankedEmployees
WHERE RowNum <= 2;


-- Q3: Show each employee's salary next to the salary
-- of the employee just below them.

SELECT
    name,
    salary,
    LEAD(salary) OVER
    (
        ORDER BY salary DESC
    ) AS NextLowerSalary
FROM employees;


-- Q4: Using a CTE, find employees earning above 60,000
-- then count how many such employees exist per department.

WITH HighSalaryEmployees AS
(
    SELECT *
    FROM employees
    WHERE salary > 60000
)

SELECT
    department,
    COUNT(*) AS EmployeeCount
FROM HighSalaryEmployees
GROUP BY department;


-- Q5: Combine names of IT and Sales employees with no duplicates.

SELECT name
FROM employees
WHERE department = 'IT'

UNION

SELECT name
FROM employees
WHERE department = 'Sales';


-- Q6: Show department name, location,
-- employee count and average salary,
-- only where average salary exceeds 55,000.

SELECT
    d.department_name,
    d.location,
    COUNT(e.id) AS EmployeeCount,
    AVG(e.salary) AS AverageSalary
FROM departments d
INNER JOIN employees e
ON d.id = e.dept_id
GROUP BY
    d.department_name,
    d.location
HAVING AVG(e.salary) > 55000;


-- Q7: Find employees whose salary is greater than
-- the average salary of their own department.

SELECT *
FROM employees e
WHERE salary >
(
    SELECT AVG(salary)
    FROM employees
    WHERE department = e.department
);


-- Q8: Find all employees who manage at least one employee.

SELECT *
FROM employees e
WHERE EXISTS
(
    SELECT 1
    FROM employees sub
    WHERE sub.manager_id = e.id
);