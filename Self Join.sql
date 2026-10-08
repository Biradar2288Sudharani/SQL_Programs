USE sql_practice;

/* In this sheet we completely study the Self JOIN Concept
Self JOIN returns: A table joins with itself.
Syntax - 
Useful for:Employee → Manager
           Employee → Supervisor
           Employee → Mentor
           Category → Parent Category
*/

-- Q25. Display employee name and manager name.
SELECT
    e.Name AS Employee,
    m.Name AS Manager
FROM Employees e
LEFT JOIN Employees m
ON e.Manager_ID = m.Emp_ID;

-- Q26. Display employees who have a manager.
SELECT
    e.Name AS Employee,
    m.Name AS Manager
FROM Employees e
INNER JOIN Employees m
ON e.Manager_ID = m.Emp_ID;

-- Q27. Display employees who don't have a manager.
SELECT
    e.Name
FROM Employees e
LEFT JOIN Employees m
ON e.Manager_ID = m.Emp_ID
WHERE e.Manager_ID IS NULL;
