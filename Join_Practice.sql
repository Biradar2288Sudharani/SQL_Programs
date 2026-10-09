-- Q66 Display all employee names with their department names.
SELECT
e.Name, 
d.Department_Name
FROM Employees1 e
INNER JOIN Departments1 d
ON e.Dept_ID = d.Dept_ID;

-- Q67 Display employee name and department location.


-- Q68 Display employees working in Java.

-- Q69 Display employees working in Testing.

-- Q70 Display employees whose salary is greater than ₹70,000 along with their department.

-- Q71 Display employees from Pune with department names.

-- Q72 Display department name and employee count.

-- Q73 Display department name and average salary.

-- Q74 Display department name and highest salary.

-- Q75 Display department name and total salary.

-- Q76 Display all departments, including departments with no employees.

-- Q77 Find departments having zero employees.

-- Q78 Find employees having no project.

-- Q79 Display all projects and their departments.

-- Q80 Find projects having no employees.

-- Q81 Display employees with their projects.

-- Q82 Display employees with department and project.

-- Q83 Count employees working on each project.

-- Q84 Find projects having more than 2 employees.

-- Q85 Find departments having more than 2 employees.

-- Q86 Display employee and manager names using SELF JOIN.

-- Q87 Find employees earning more than their manager.

-- Q88 Find managers managing more than 2 employees.

-- Q89 Display employee, manager, department and project.

-- Q90 Find the highest-paid employee in each department.

-- Q91 Find employees earning more than their department average.

-- Q92 Find departments whose total salary exceeds ₹1,00,000.

-- Q93 Find departments whose average salary exceeds ₹60,000.

-- Q94 Find departments without any project.

-- Q95 Find projects without any employee.