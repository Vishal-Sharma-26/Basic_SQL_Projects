-- Create DataBase
create Database EmployeesManagementSystem

-- Table schema for employees
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    department_id INT,
    salary DECIMAL(10, 2),
    hire_date DATE
);

-- Table schema for departments
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

-- Sample data for employees
INSERT INTO departments (department_id, department_name) VALUES
(1, 'HR'),
(2, 'Engineering');

INSERT INTO employees (employee_id, first_name, last_name, email, department_id, salary, hire_date) VALUES
(1, 'John', 'Doe', 'john@example.com', 1, 50000.00, '2020-01-01'),
(2, 'Jane', 'Smith', 'jane@example.com', 2, 60000.00, '2020-02-01');

-- Sample SQL queries
-- Select all employees
SELECT * FROM employees;

-- Update employee salary
UPDATE employees SET salary = 55000.00 WHERE employee_id = 1;

-- Delete employee
DELETE FROM employees WHERE employee_id = 2;

select * from employees