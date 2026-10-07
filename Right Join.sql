USE sql_practice;

/* In this sheet we completely study the Right JOIN Concept
RIGHT JOIN returns: ALL records from RIGHT table + matching records from LEFT table
Syntax - SELECT columns
         FROM table1
		 RIGHT JOIN table2
		 ON table1.column = table2.column;

LEFT JOIN
FROM Employees e
LEFT JOIN Departments d
means: Keep ALL Employees

RIGHT JOIN
FROM Employees e
RIGHT JOIN Departments d
means: Keep ALL Departments
*/ 

-- Q21. Display all departments and matching employees.
SELECT e.Name, d.Department_Name
FROM Employees1 e
RIGHT JOIN Departments1 d
ON d.Dept_ID = e.Dept_ID; 

-- Q22. Find departments without employees - using RIGHT JOIN.
SELECT d.Department_Name
FROM Employees1 e
RIGHT JOIN Departments1 d
ON e.Dept_ID = d.Dept_ID
WHERE e.Emp_ID IS NULL;

-- Q23. Display all departments with employee names and salaries.
SELECT d.Department_Name, e.Name, e.Salary
FROM Employees1 e
RIGHT JOIN Departments1 d
ON e.Dept_ID = d.Dept_ID; 



















