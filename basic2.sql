CREATE TABLE employee (
    emp_id INT,
    emp_name VARCHAR(50),
    salary INT,
    join_date DATE, 
    dept_id INT
);

INSERT INTO employee (emp_id, emp_name, salary, join_date, dept_id) VALUES 
(1, 'Ram', 50000, '1991-07-09', 101), 
(2, 'Shyam', 60000, '1991-07-07', 101), 
(3, 'Gita', 70000, '1991-07-08', 102), 
(4, 'Hari', 50000, '1991-07-05', 103),
(5, 'Prakash', 80000, '1991-07-01', 104), 
(6, 'Sita', 55000, '1991-08-01', 105), 
(7, 'Laxman', 65000, '1991-08-05', 106);


CREATE TABLE department (

  dept_id INT,

  dept_name VARCHAR (20)

);

INSERT into department (dept_id, dept_name) VALUES
(101, 'IT'),
(102, 'HR'),
(105, 'Accounts'),
(107, 'Complaince');

SELECT * FROM EMPLOYEE;

SELECT dept_id, COUNT(*) AS total_employees
FROM employee
GROUP BY dept_id
HAVING COUNT(*) > 3;

SELECT e.emp_id, e.emp_name, d.dept_name
FROM employee e
RIGHT JOIN department d
ON e.dept_id = d.dept_id
WHERE e.emp_id IS NULL;

SELECT e.emp_id, e.emp_name, d.dept_name
FROM employee e
LEFT JOIN department d
ON e.dept_id = d.dept_id
WHERE d.dept_id IS NULL;

SELECT MAX(salary) 
FROM employee 
WHERE salary < (SELECT MAX(salary) FROM employee);

SELECT EXTRACT(YEAR FROM join_date) AS hire_year,
       COUNT(*) 
FROM employee
GROUP BY EXTRACT(YEAR FROM join_date);

SELECT 
    emp_id,
    emp_name,
    salary,
    SUM(salary) OVER (ORDER BY emp_id) AS running_total_salary
FROM employee;