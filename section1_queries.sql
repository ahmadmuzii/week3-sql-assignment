/*CREATE DATABASE Week3Assignment;
GO

USE Week3Assignment;
GO*/


IF OBJECT_ID('employees', 'U') IS NOT NULL
DROP TABLE employees;

IF OBJECT_ID('departments', 'U') IS NOT NULL
DROP TABLE departments;

CREATE TABLE departments (
    id INT PRIMARY KEY,
    department_name VARCHAR(50),
    location VARCHAR(50)
);

CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(30),
    dept_id INT,
    salary DECIMAL(10,2),
    bonus DECIMAL(10,2),
    manager_id INT,
    hire_date DATE,
    FOREIGN KEY (dept_id) REFERENCES departments(id)
);

INSERT INTO departments (id, department_name, location)
VALUES
(1, 'IT', 'Lahore'),
(2, 'Sales', 'Karachi'),
(3, 'HR', 'Islamabad'),
(4, 'Finance', 'Lahore'),
(5, 'Marketing', 'Karachi');

INSERT INTO employees (id, name, department, dept_id, salary, bonus, manager_id, hire_date)
VALUES
(1,  'Ali',     'IT',        1, 95000, 5000, NULL, '2019-03-11'),
(2,  'Sara',    'IT',        1, 72000, 3000, 1,    '2020-06-15'),
(3,  'Usman',   'IT',        1, 68000, NULL, 1,    '2021-01-20'),
(4,  'Fatima',  'IT',        1, 61000, 2000, 1,    '2022-08-05'),
(5,  'Hamza',   'Sales',     2, 58000, 4000, NULL, '2018-11-01'),
(6,  'Ayesha',  'Sales',     2, 62000, NULL, 5,    '2019-09-14'),
(7,  'Bilal',   'Sales',     2, 54000, 1500, 5,    '2021-04-22'),
(8,  'Mariam',  'Sales',     2, 59000, 2500, 5,    '2022-02-10'),
(9,  'Zainab',  'HR',        3, 50000, NULL, NULL, '2017-07-19'),
(10, 'Hassan',  'HR',        3, 48000, 1000, 9,    '2020-12-01'),
(11, 'Sana',    'HR',        3, 52000, NULL, 9,    '2023-01-15'),
(12, 'Kamran',  'Finance',   4, 88000, 6000, NULL, '2016-05-30'),
(13, 'Nida',    'Finance',   4, 71000, 3000, 12,   '2019-10-08'),
(14, 'Omar',    'Finance',   4, 67000, NULL, 12,   '2021-06-17'),
(15, 'Iqra',    'Finance',   4, 73000, 2500, 12,   '2020-03-25'),
(16, 'Tariq',   'Marketing', 5, 56000, 1800, NULL, '2018-02-14'),
(17, 'Rabia',   'Marketing', 5, 60000, NULL, 16,   '2022-09-09'),
(18, 'Asad',    'Marketing', 5, 55000, 1200, 16,   '2023-05-03'),
(19, 'Mahnoor', 'IT',        1, 64000, 2200, 1,    '2023-07-12'),
(20, 'Danish',  'Sales',     2, 57000, NULL, 5,    '2021-11-28');

SELECT * FROM departments;
SELECT * FROM employees;