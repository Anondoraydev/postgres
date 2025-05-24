CREATE TABLE employees (
    emp_id INT,
    emp_name VARCHAR(50),
    dept_id INT
);

CREATE TABLE departments (
    dept_id INT,
    dept_name VARCHAR(50)
);

-- Data insert into employees table
INSERT INTO employees VALUES (1, 'John Doe', 101);

INSERT INTO employees VALUES (2, 'Jone Smith', 102);

-- Data insert into departments table
INSERT INTO departments VALUES (101, 'HR');

INSERT INTO departments VALUES (102, 'IT');

SELECT * FROM employees;

SELECT * FROM departments;

-- cross JOIN
SELECT * FROM employees CROSS JOIN departments;

SELECT * FROM employees NATURAL JOIN departments;