-- Q28. Display Python employees earning above ₹60,000.
SELECT
    e.Name,
    e.Salary,
    d.Department_Name
FROM Employees e
JOIN Departments d
ON e.Dept_ID = d.Dept_ID
WHERE d.Department_Name = 'Python'
AND e.Salary > 60000;

-- Q29. Display employees from Pune with their department.
SELECT
    e.Name,
    e.City,
    d.Department_Name
FROM Employees e
JOIN Departments d
ON e.Dept_ID = d.Dept_ID
WHERE e.City = 'Pune';

-- PART 13 — JOIN + ORDER BY
-- Q30. Display employees and departments sorted by salary descending.
SELECT
    e.Name,
    d.Department_Name,
    e.Salary
FROM Employees e
JOIN Departments d
ON e.Dept_ID = d.Dept_ID
ORDER BY e.Salary DESC;

-- Q31. Display departments alphabetically and employees by salary.
SELECT
    d.Department_Name,
    e.Name,
    e.Salary
FROM Employees e
JOIN Departments d
ON e.Dept_ID = d.Dept_ID
ORDER BY d.Department_Name ASC,
         e.Salary DESC;

-- PART 14 — JOIN + GROUP BY
-- Q32. Count employees in each department.
SELECT
    d.Department_Name,
    COUNT(e.Emp_ID) AS Employee_Count
FROM Departments d
LEFT JOIN Employees e
ON d.Dept_ID = e.Dept_ID
GROUP BY d.Department_Name;

-- Q33. Find average salary department-wise.
SELECT
    d.Department_Name,
    AVG(e.Salary) AS Average_Salary
FROM Departments d
LEFT JOIN Employees e
ON d.Dept_ID = e.Dept_ID
GROUP BY d.Department_Name;

-- Q34. Find total salary department-wise.
SELECT
    d.Department_Name,
    SUM(e.Salary) AS Total_Salary
FROM Departments d
LEFT JOIN Employees e
ON d.Dept_ID = e.Dept_ID
GROUP BY d.Department_Name;

-- PART 15 — JOIN + HAVING
-- Q35. Find departments having more than 2 employees.
SELECT
    d.Department_Name,
    COUNT(e.Emp_ID) AS Employee_Count
FROM Departments d
LEFT JOIN Employees e
ON d.Dept_ID = e.Dept_ID
GROUP BY d.Department_Name
HAVING COUNT(e.Emp_ID) > 2;

-- Q36. Find departments whose average salary is greater than ₹60,000.
SELECT
    d.Department_Name,
    AVG(e.Salary) AS Average_Salary
FROM Departments d
JOIN Employees e
ON d.Dept_ID = e.Dept_ID
GROUP BY d.Department_Name
HAVING AVG(e.Salary) > 60000;
PART 16 — JOIN + Aggregate Functions

-- Q37. Find highest-paid employee in each department.
SELECT
    d.Department_Name,
    MAX(e.Salary) AS Highest_Salary
FROM Departments d
JOIN Employees e
ON d.Dept_ID = e.Dept_ID
GROUP BY d.Department_Name;

-- Q38. Find lowest-paid employee in each department.
SELECT
    d.Department_Name,
    MIN(e.Salary) AS Lowest_Salary
FROM Departments d
JOIN Employees e
ON d.Dept_ID = e.Dept_ID
GROUP BY d.Department_Name;

-- Q39. Find total employees and total salary for each department.
SELECT
    d.Department_Name,
    COUNT(e.Emp_ID) AS Total_Employees,
    SUM(e.Salary) AS Total_Salary
FROM Departments d
LEFT JOIN Employees e
ON d.Dept_ID = e.Dept_ID
GROUP BY d.Department_Name;

-- PART 17 — JOIN + Multiple Conditions
-- Q40. Find Python employees from Pune earning above ₹60,000.
SELECT
    e.Name,
    e.Salary,
    e.City,
    d.Department_Name
FROM Employees e
JOIN Departments d
ON e.Dept_ID = d.Dept_ID
WHERE d.Department_Name = 'Python'
AND e.City = 'Pune'
AND e.Salary > 60000;

-- PART 18 — JOIN + CASE
-- Q41. Display employee, department and salary category.
SELECT
    e.Name,
    d.Department_Name,
    e.Salary,
    CASE
        WHEN e.Salary >= 70000 THEN 'High'
        WHEN e.Salary >= 50000 THEN 'Medium'
        ELSE 'Low'
    END AS Salary_Category
FROM Employees e
JOIN Departments d
ON e.Dept_ID = d.Dept_ID;

-- PART 19 — JOIN + NULL
-- Q42. Display all employees and show No Project if they don't have one.
SELECT
    e.Name,
    COALESCE(p.Project_Name, 'No Project') AS Project
FROM Employees e
LEFT JOIN Employee_Projects ep
ON e.Emp_ID = ep.Emp_ID
LEFT JOIN Projects p
ON ep.Project_ID = p.Project_ID;

-- PART 20 — Find Missing Records
-- Q43. Find employees who are not assigned to any project.
SELECT
    e.Emp_ID,
    e.Name
FROM Employees e
LEFT JOIN Employee_Projects ep
ON e.Emp_ID = ep.Emp_ID
WHERE ep.Emp_ID IS NULL;

-- Q44. Find departments without employees.
SELECT
    d.Dept_ID,
    d.Department_Name
FROM Departments d
LEFT JOIN Employees e
ON d.Dept_ID = e.Dept_ID
WHERE e.Emp_ID IS NULL;

-- Q45. Find projects without employees.
SELECT
    p.Project_ID,
    p.Project_Name
FROM Projects p
LEFT JOIN Employee_Projects ep
ON p.Project_ID = ep.Project_ID
WHERE ep.Emp_ID IS NULL;

-- PART 21 — JOIN Three Tables
-- Q46. Display employee, department and project.
SELECT
    e.Name,
    d.Department_Name,
    p.Project_Name
FROM Employees e
JOIN Departments d
ON e.Dept_ID = d.Dept_ID
JOIN Employee_Projects ep
ON e.Emp_ID = ep.Emp_ID
JOIN Projects p
ON ep.Project_ID = p.Project_ID;

-- Q47. Find all Python employees working on FastBox.
SELECT
    e.Name,
    d.Department_Name,
    p.Project_Name
FROM Employees e
JOIN Departments d
ON e.Dept_ID = d.Dept_ID
JOIN Employee_Projects ep
ON e.Emp_ID = ep.Emp_ID
JOIN Projects p
ON ep.Project_ID = p.Project_ID
WHERE d.Department_Name = 'Python'
AND p.Project_Name = 'FastBox';

-- Q48. Count employees working on each project.
SELECT
    p.Project_Name,
    COUNT(ep.Emp_ID) AS Employee_Count
FROM Projects p
LEFT JOIN Employee_Projects ep
ON p.Project_ID = ep.Project_ID
GROUP BY p.Project_Name;

-- Q49. Display project name and department name.
SELECT
    p.Project_Name,
    d.Department_Name
FROM Projects p
JOIN Departments d
ON p.Dept_ID = d.Dept_ID;

-- Q50. Display project, department and department location.
SELECT
    p.Project_Name,
    d.Department_Name,
    d.Location
FROM Projects p
JOIN Departments d
ON p.Dept_ID = d.Dept_ID;

-- PART 22 — Interview-Level JOIN Questions
-- Q51. Find employees earning more than their department's average salary.
SELECT
    e.Name,
    e.Salary,
    d.Department_Name
FROM Employees e
JOIN Departments d
ON e.Dept_ID = d.Dept_ID
WHERE e.Salary >
(
    SELECT AVG(e2.Salary)
    FROM Employees e2
    WHERE e2.Dept_ID = e.Dept_ID
);

-- Q52. Find the highest-paid employee in every department.
SELECT
    e.Name,
    e.Salary,
    d.Department_Name
FROM Employees e
JOIN Departments d
ON e.Dept_ID = d.Dept_ID
WHERE e.Salary =
(
    SELECT MAX(e2.Salary)
    FROM Employees e2
    WHERE e2.Dept_ID = e.Dept_ID
);

-- Q53. Find departments whose total salary exceeds ₹1,00,000.
SELECT
    d.Department_Name,
    SUM(e.Salary) AS Total_Salary
FROM Departments d
JOIN Employees e
ON d.Dept_ID = e.Dept_ID
GROUP BY d.Department_Name
HAVING SUM(e.Salary) > 100000;

-- Q54. Find departments having at least 2 employees and average salary above ₹50,000.
SELECT
    d.Department_Name,
    COUNT(e.Emp_ID) AS Employee_Count,
    AVG(e.Salary) AS Average_Salary
FROM Departments d
JOIN Employees e
ON d.Dept_ID = e.Dept_ID
GROUP BY d.Department_Name
HAVING COUNT(e.Emp_ID) >= 2
AND AVG(e.Salary) > 50000;

-- Q55. Find employees whose salary is higher than their manager's salary.
SELECT
    e.Name AS Employee,
    e.Salary AS Employee_Salary,
    m.Name AS Manager,
    m.Salary AS Manager_Salary
FROM Employees e
JOIN Employees m
ON e.Manager_ID = m.Emp_ID
WHERE e.Salary > m.Salary;

-- PART 23 — Advanced JOIN Questions
-- Q56. Display each employee with manager and department.
SELECT
    e.Name AS Employee,
    m.Name AS Manager,
    d.Department_Name
FROM Employees e
LEFT JOIN Employees m
ON e.Manager_ID = m.Emp_ID
JOIN Departments d
ON e.Dept_ID = d.Dept_ID;

-- Q57. Count how many employees each manager manages.
SELECT
    m.Name AS Manager,
    COUNT(e.Emp_ID) AS Employee_Count
FROM Employees m
JOIN Employees e
ON m.Emp_ID = e.Manager_ID
GROUP BY m.Name;

-- Q58. Find managers who manage more than 2 employees.
SELECT
    m.Name AS Manager,
    COUNT(e.Emp_ID) AS Employee_Count
FROM Employees m
JOIN Employees e
ON m.Emp_ID = e.Manager_ID
GROUP BY m.Name
HAVING COUNT(e.Emp_ID) > 2;

-- Q59. Display every department and its projects.
SELECT
    d.Department_Name,
    p.Project_Name
FROM Departments d
LEFT JOIN Projects p
ON d.Dept_ID = p.Dept_ID;

-- Q60. Find departments that don't have any project.
SELECT
    d.Department_Name
FROM Departments d
LEFT JOIN Projects p
ON d.Dept_ID = p.Dept_ID
WHERE p.Project_ID IS NULL;

-- PART 24 — JOIN + DISTINCT
-- Q61. Display unique cities where employees from Python department work.
SELECT DISTINCT
    e.City
FROM Employees e
JOIN Departments d
ON e.Dept_ID = d.Dept_ID
WHERE d.Department_Name = 'Python';

-- Q62. Display unique departments having employees in Pune.
SELECT DISTINCT
    d.Department_Name
FROM Employees e
JOIN Departments d
ON e.Dept_ID = d.Dept_ID
WHERE e.City = 'Pune';

-- PART 25 — JOIN + ORDER BY + LIMIT
-- Q63. Find the highest-paid employee and their department.
SELECT
    e.Name,
    e.Salary,
    d.Department_Name
FROM Employees e
JOIN Departments d
ON e.Dept_ID = d.Dept_ID
ORDER BY e.Salary DESC
LIMIT 1;

-- Q64. Find the top 3 highest-paid employees with departments.
SELECT
    e.Name,
    e.Salary,
    d.Department_Name
FROM Employees e
JOIN Departments d
ON e.Dept_ID = d.Dept_ID
ORDER BY e.Salary DESC
LIMIT 3;

-- PART 26 — JOIN + Date/Other Filters
-- Q65. Display employees who joined after 2023 with their department.
SELECT
    e.Name,
    e.Joining_Date,
    d.Department_Name
FROM Employees e
JOIN Departments d
ON e.Dept_ID = d.Dept_ID
WHERE e.Joining_Date > '2023-01-01';

-- PART 27 — JOIN Order of Execution
SELECT
    d.Department_Name,
    COUNT(e.Emp_ID)
FROM Departments d
LEFT JOIN Employees e
ON d.Dept_ID = e.Dept_ID
WHERE e.Salary > 50000
GROUP BY d.Department_Name
HAVING COUNT(e.Emp_ID) > 1
ORDER BY COUNT(e.Emp_ID) DESC;