USE sql_practice;

/* In this sheet we completely study the Cross JOIN Concept
Cross JOIN returns: CROSS JOIN produces every possible combination of rows.
Syntax - SELECT * FROM Employees CROSS JOIN Departments;
If: Employees = 8 rows and Departments = 5 rows Then: 8 × 5 = 40 rows
There is normally no ON condition.
*/

-- Q24. Generate every employee-department combination.
SELECT
    e.Name,
    d.Department_Name
FROM Employees e
CROSS JOIN Departments d; 
