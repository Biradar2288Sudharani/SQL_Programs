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