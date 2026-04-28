Create database test_db;



CREATE TABLE emp(
id INT,
name VARCHAR (30),
salary INT
);

INSERT INTO emp (id, name, salary) VALUES 
(1, 'BIPINA', 2000), 
(2, 'BIPINA', 3000),
(3, 'RAM', 3000),
(4, 'HARI', 3000);

SELECT * FROM emp;
DELETE FROM emp WHERE id = 3;-- Create employees table
CREATE TABLE employees (
    emp_id INT,
    name VARCHAR(50),
    department_id INT
);

-- Create departments table
CREATE TABLE departments (
    department_id INT,
    department_name VARCHAR(50)
);

-- Insert data into employees
INSERT INTO employees VALUES
(1, 'Tony Stark', 101),
(2, 'Bruce Banner', 102),
(3, 'Steve Rodgers', 103),
(4, 'Thor Odinson', NULL);

-- Insert data into departments
INSERT INTO departments VALUES
(101, 'Ironman'),
(102, 'Hulk'),
(104, 'Thor');

-- View employees table
SELECT * FROM employees;

-- View departments table
SELECT * FROM departments;

----------------------------------------------------
-- INNER JOIN (only matching records)
----------------------------------------------------
SELECT e.name, d.department_name
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id;

----------------------------------------------------
-- LEFT JOIN (all employees + matching departments)
----------------------------------------------------
SELECT e.name, d.department_name
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id;

----------------------------------------------------
-- RIGHT JOIN (all departments + matching employees)
----------------------------------------------------
SELECT e.name, d.department_name
FROM employees e
RIGHT JOIN departments d
ON e.department_id = d.department_id;

CREATE TABLE employees (
    emp_id INT,
    name VARCHAR(50),
    department_id INT
);

CREATE TABLE departments (
    department_id INT,
    department_name VARCHAR(50)
);

INSERT INTO employees VALUES
(1, 'Tony Stark', 101),
(2, 'Bruce Banner', 102),
(3, 'Steve Rodgers', 103),
(4, 'Thor Odinson', NULL);

INSERT INTO departments VALUES
(101, 'Ironman'),
(102, 'Hulk'),
(104, 'Thor');

SELECT * FROM employees;

SELECT * FROM departments;

-- INNER JOIN
SELECT e.name, d.department_name
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id;

-- LEFT JOIN
SELECT e.name, d.department_name
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id;
FUNTION() OVER(
  PARTITON BY column   ## PARTITON BY - Divide data into groups, ORDER BY - ORder rows within group 
  ORDER BY column
)
 
FUNTION() - ROW_NUMBER(), RANK() and DENSE_RANK()
# ROW_NUMBER() - Assign unique number to each row
 
SELECT name, department , salary,
ROW_NUMBER() OVER (PARTITION By department order by salary DESC) AS row_num
from emp;
 
# Groups by department, order by slary (highest First) and assigns row_number
 
 
# RANK() - same rank for same values, skips numbers
 
SELECT name, salary,
RANK() OVER (order by salary DESC) AS rank_val
from emp;
 
 
# DENSE_RANK() - Same rank but no gaps
SELECT name, salary,
DENSE_RANK() OVER (order by salary DESC) AS DENSE
from emp;

-- 
