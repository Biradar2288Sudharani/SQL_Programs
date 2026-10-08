USE sql_practice;

/* In this sheet we completely study the Full Outer JOIN Concept
FULL OUTER JOIN returns: Matching records + unmatched records from LEFT + unmatched records from RIGHT
Syntax - SELECT *
         FROM Employees e
         FULL OUTER JOIN Departments d
         ON e.Dept_ID = d.Dept_ID;
*/

SELECT *
FROM Employees e
FULL OUTER JOIN Departments d
ON e.Dept_ID = d.Dept_ID;

-- MySQL Server does not support FULL OUTER JOIN directly, but we can achieve the same result using a combination of LEFT JOIN and RIGHT JOIN with UNION.
SELECT *
FROM Employees e
LEFT JOIN Departments d
ON e.Dept_ID = d.Dept_ID
UNION
SELECT *
FROM Employees e
RIGHT JOIN Departments d
ON e.Dept_ID = d.Dept_ID;

