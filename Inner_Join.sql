USE sql_Practice;

/* In this sheet we completely study the INNER JOIN Concept
Syntax - SELECT columns
		 FROM table1
		 INNER JOIN table2
		 ON table1.column = table2.column;
*/ 

CREATE TABLE Employees1 (
    Emp_ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Dept_ID INT,
    Manager_ID INT,
    Salary INT,
    City VARCHAR(50)
);

SELECT * FROM Employees1;

CREATE TABLE Departments1 (
    Dept_ID INT PRIMARY KEY,
    Department_Name VARCHAR(50),
    Location VARCHAR(50)
);

SELECT * FROM Departments1;

CREATE TABLE Projects1 (
    Project_ID INT PRIMARY KEY,
    Project_Name VARCHAR(100),
    Dept_ID INT
);

SELECT * FROM Projects1;

CREATE TABLE Employee_Projects1 (
    Emp_ID INT,
    Project_ID INT
);

SELECT * FROM Employee_Projects1;

-- Join Example
SELECT * FROM Employees1
JOIN Departments1
ON Employees1.Dept_ID = Departments1. Dept_ID;

-- INNER JOIN — Practical Questions
-- Q1. Display employee name and department name. 
SELECT e.Name, d.Department_Name
FROM Employees1 AS e
INNER JOIN Departments1 AS d
ON e.Dept_ID = d.Dept_ID;

-- Q2. Display employee name, salary and department.
SELECT e.Name, e.Salary, d.Department_Name
FROM Employees1 AS e
INNER JOIN Departments1 AS d
ON e.Dept_ID = d.Dept_ID; 

-- Q3. Display employees working in Pune department.
SELECT e.Name, d.Department_Name
FROM Employees1 AS e
INNER JOIN Departments1 AS d
ON e.Dept_ID = d.Dept_ID 
WHERE d.Location = 'Pune';

-- Q4. Display employees whose department is Python.
SELECT e.Name, d.Department_Name
FROM Employees1 AS e
INNER JOIN Departments1 AS d
ON e.Dept_ID = d.Dept_ID
WHERE d.Department_Name = 'Python';

-- Q5. Display employees earning more than ₹60,000 with their department.
SELECT e.Name, e.Salary, d.Department_Name
FROM Employees1 AS e
INNER JOIN Departments1 AS d
ON e.Dept_ID = d.Dept_ID
WHERE e.Salary > 60000;

-- Q6. Display employee name, department and department location.
SELECT e.Name, d.Department_Name, d.Location
FROM Employees1 AS e
INNER JOIN Departments1 AS d
ON e.Dept_ID = d.Dept_ID;

-- Q7. Display Python employees earning more than ₹70,000.
SELECT e.Name, e.Salary, d.Department_Name
FROM Employees1 AS e
INNER JOIN Departments1 AS d
ON e.Dept_ID = d.Dept_ID
WHERE d.Department_Name = 'Python' AND e.Salary > 70000; 

-- Q8. Count employees department-wise.
SELECT d.Department_Name, COUNT(e.Emp_ID) AS Employee_Count
FROM Employees1 AS e
INNER JOIN Departments1 AS d
ON e.Dept_ID = d.Dept_ID
GROUP BY d.Department_Name; 

-- Q9. Find average salary department-wise.
SELECT d.Department_Name, AVG(e.Salary) AS Average_Salary
FROM Employees1 AS e
INNER JOIN Departments1 AS d
ON e.Dept_ID = d.Dept_ID
GROUP BY d.Department_Name; 

-- Q10. Find highest salary in each department.
SELECT d.Department_Name, MAX(e.Salary) AS Highest_Salary
FROM Employees1 AS e
INNER JOIN Departments1 AS d
ON e.Dept_ID = d.Dept_ID
GROUP BY d.Department_Name; 

-- INNER JOIN: Multiple Tables
-- Q11. Display employee name and project name. 
SELECT e.Name, p.Project_Name
FROM Employees1 e
INNER JOIN Projects1 p
ON e.Dept_ID = p.Dept_ID;
 -- OR
SELECT
    e.Name,
    p.Project_Name
FROM Employees1 e
INNER JOIN Employee_Projects1 ep
ON e.Emp_ID = ep.Emp_ID
INNER JOIN Projects1 p
ON ep.Project_ID = p.Project_ID;







