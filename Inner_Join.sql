USE sql_Practice;

CREATE TABLE Employees (
    Emp_ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Dept_ID INT,
    Manager_ID INT,
    Salary INT,
    City VARCHAR(50)
);

CREATE TABLE Departments (
    Dept_ID INT PRIMARY KEY,
    Department_Name VARCHAR(50),
    Location VARCHAR(50)
);

CREATE TABLE Projects (
    Project_ID INT PRIMARY KEY,
    Project_Name VARCHAR(100),
    Dept_ID INT
);

CREATE TABLE Employee_Projects (
    Emp_ID INT,
    Project_ID INT
);

-- Q1. Display employee name and department name.
SELECT
    e.Name,
    d.Department_Name
FROM Employees e
INNER JOIN Departments d
ON e.Dept_ID = d.Dept_ID;
Important
e → Employees
d → Departments

-- Q2. Display employee name, salary and department.
SELECT
    e.Name,
    e.Salary,
    d.Department_Name
FROM Employees e
INNER JOIN Departments d
ON e.Dept_ID = d.Dept_ID;


-- Q3. Display employees working in Pune department.
SELECT
    e.Name,
    d.Department_Name
FROM Employees e
INNER JOIN Departments d
ON e.Dept_ID = d.Dept_ID
WHERE d.Location = 'Pune';
JOIN happens first conceptually, then filtering is applied.

-- Q4. Display employees whose department is Python.
SELECT
    e.Name,
    d.Department_Name
FROM Employees e
INNER JOIN Departments d
ON e.Dept_ID = d.Dept_ID
WHERE d.Department_Name = 'Python';

-- Q5. Display employees earning more than ₹60,000 with their department.
SELECT
    e.Name,
    e.Salary,
    d.Department_Name
FROM Employees e
INNER JOIN Departments d
ON e.Dept_ID = d.Dept_ID
WHERE e.Salary > 60000;

-- Q6. Display employee name, department and department location.
SELECT
    e.Name,
    d.Department_Name,
    d.Location
FROM Employees e
INNER JOIN Departments d
ON e.Dept_ID = d.Dept_ID;