USE sql_practice;

/* In this sheet we completely study the Left JOIN Concept
LEFT JOIN returns: ALL records from LEFT table + matching records from RIGHT table
Syntax - SELECT columns
		 FROM table1
		 LEFT JOIN table2
		 ON table1.column = table2.column;
*/ 

-- LEFT JOIN — Practical Questions
-- Q16. Display all employees with their department. 
SELECT e.Name, d.Department_Name
FROM Employees1 e
LEFT JOIN Departments1 d
ON e.Dept_ID = d.Dept_ID;

-- Q17. Display all employees, including employees without a project.
SELECT e.Name,  p.Project_Name
FROM Employees1 e
LEFT JOIN Employee_Projects1 ep
ON e.Emp_ID = ep.Emp_ID
INNER JOIN Projects1 p
ON ep.Project_ID = p.Project_ID;

-- Q18. Find employees who don't have a project.
SELECT 
e.Name
FROM Employees1 e
LEFT JOIN Employee_Projects1 ep
ON  e.Emp_ID = ep.Emp_ID 
WHERE ep.Project_ID IS NULL;

-- Q19. Find departments that have no employees.
SELECT d.Department_Name
FROM Departments1 d
LEFT JOIN Employees1 e
ON e.Dept_ID = d.Dept_ID
WHERE e.Emp_ID IS NULL;

-- Q20. Display all departments and employee count, including departments with zero employees.
SELECT
d.Department_Name, COUNT(e.Emp_ID) AS Employee_Count
FROM Departments1 d
LEFT JOIN Employees1 e
ON d.Dept_ID = e.Dept_ID
GROUP BY d.Department_Name; 

--  










