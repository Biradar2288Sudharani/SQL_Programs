USE sql_practice;
CREATE TABLE IBM(Emp_ID INT PRIMARY KEY, Name VARCHAR(100), Department VARCHAR(20), Salary INT,
Age INT, City VARCHAR(20), Joining_Date DATE, Manager VARCHAR(10) NULL );

INSERT INTO IBM VALUES(101,	'Sudha', 'Python', 50000, 22, 'Pune', '2024-01-10', 'Rahul'),
(102, 'Ravi', 'Java', 65000, 25, 'Mumbai', '2023-03-18', 'NULL'),
(103, 'Shankar', 'Testing', 45000, 24, 'Pune', '2024-05-12', 'Ankit'),
(104, 'Sachin', 'Python', 74000, 28, 'Delhi', '2022-11-05', 'Rahul'),
(105, 'Neha', 'HR', 40000, 26, 'Mumbai', '2025-02-20', 'NULL'),
(106, 'Karan', 'Python', 80000, 30, 'Pune', '2021-06-05', 'Rahul'),
(107, 'Sneha', 'Testing', 42000, 23, 'Hyderabad', '2024-07-30', 'Ankit'),
(108, 'Arjun', 'Java', 90000, 31, 'Bengalore', '2020-09-25', 'NULL');

-- 🟢 PART A — SELECT Practice
-- Q1 Display all employee details. 
SELECT * FROM IBM;

-- Q2 Display only Name, Salary and Department
SELECT Name, Salary, Department FROM IBM; 

-- Q3 Display only employee names.
SELECT Name FROM IBM;

-- Q4 Display all departments.
SELECT DISTINCT Department FROM IBM; 
SELECT Department FROM IBM GROUP BY Department;
SELECT Department FROM IBM UNION SELECT Department FROM IBM;

-- Q5 Display all cities.
SELECT DISTINCT City FROM IBM;
SELECT City FROM IBM GROUP BY City;
SELECT City FROM IBM UNION SELECT City FROM IBM;

-- 🟢 PART B — WHERE Practice
-- Q6 Show employees whose salary is greater than ₹50,000.
SELECT Salary FROM IBM WHERE Salary > 50000; 
SELECT * FROM IBM WHERE Salary > 50000;
SELECT Name, Salary FROM IBM WHERE Salary > 50000;

-- Q7 Show employees younger than 25.
SELECT Name, Age FROM IBM WHERE Age > 25;  
SELECT * FROM IBM WHERE Age > 25;
SELECT Name, Age FROM IBM WHERE Age > 25;

-- Q8 Show employees from Pune.
SELECT Name, City FROM IBM WHERE City = 'Pune'; 

-- Q9 Show employees from Mumbai.
SELECT Name, City FROM IBM WHERE City = 'Mumbai';

-- Q10 Show employees whose department is Python.
SELECT Name, Department FROM IBM WHERE Department = 'Python'; 

-- 🟢 PART C — AND Practice
-- Q11 Show Python developers whose salary is greater than ₹60,000.
SELECT Department, Salary FROM IBM WHERE Department = 'Python' AND Salary > 60000;
SELECT * FROM IBM WHERE Department = 'Python' AND Salary > 60000;
SELECT Name, Department, Salary FROM IBM WHERE Department = 'Python' AND Salary > 60000;

-- Q12 Show employees from Pune whose age is less than 25.
SELECT Name, City, Age FROM IBM WHERE  City = 'Pune' AND Age < 25;
SELECT * FROM IBM WHERE City = 'Pune' AND Age < 25;

-- Q13 Show Java developers from Mumbai.
SELECT Name, Department, City FROM IBM WHERE Department = 'Java' AND City = 'Mumbai';
SELECT * FROM IBM WHERE Department = 'Java' AND City = 'Mumbai';

-- Q15 Show employees whose salary is greater than 40,000 and age greater than 24.
SELECT Name, Salary, Age FROM IBM WHERE Salary > 40000 AND Age > 24; 
SELECT * FROM IBM WHERE Salary > 40000 AND Age > 24;

-- 🟢 PART D — OR Practice
-- Q16 Show employees from Pune OR Mumbai.
SELECT Name, City FROM IBM WHERE City = 'Pune' OR City = 'Mumbai';

-- Q17 Show employees in Python OR Java department.
SELECT Name, Department FROM IBM WHERE Department = 'Python' OR Department = 'Java';

-- Q18 Show employees whose salary is greater than ₹80,000 OR whose age is below 23.
SELECT Name, Salary, Age FROM IBM WHERE Salary > 80000 OR Age < 23;

-- Q19 Show employees from Bangalore OR Hyderabad.
SELECT Name, City FROM IBM WHERE City = 'Bengalore' OR City = 'Hyderabad';

-- Q20 Show employees managed by Rahul OR Ankit.
SELECT Name, Manager FROM IBM WHERE Manager = 'Rahul' OR Manager = 'Ankit';
 
-- 🟢 PART E — NOT Practice
-- Q21 Show employees NOT from Pune.
SELECT Name, City FROM IBM WHERE City NOT IN ('Pune');
SELECT * FROM IBM WHERE City NOT IN ('Pune');

-- Q22 Show employees NOT in HR department.
SELECT Name, Department FROM IBM WHERE Department NOT IN ('HR');
SELECT * FROM IBM WHERE Department NOT IN ('HR');

-- Q23 Show employees whose salary is NOT greater than ₹50,000.
SELECT Name, Salary FROM IBM WHERE NOT Salary > 50000 ;
SELECT Name, Salary FROM IBM WHERE Salary <= 50000;
SELECT * FROM IBM WHERE NOT Salary > 50000 ;
SELECT * FROM IBM WHERE Salary <= 50000;

-- Q24 Show employees NOT managed by Rahul.
SELECT Name, Manager FROM IBM WHERE Manager NOT IN ('Rahul'); 
SELECT * FROM IBM WHERE Manager NOT IN ('Rahul');

 -- Q25 Show employees NOT from Mumbai.
SELECT Name, City FROM IBM WHERE City NOT IN ('Mumbai');
SELECT * FROM IBM WHERE City NOT IN ('Mumbai');

-- 🟢 PART F — BETWEEN Practice
-- Q26 Show employees whose salary is between ₹40,000 and ₹70,000.
SELECT * FROM IBM WHERE Salary BETWEEN 40000 AND 70000;
SELECT Name, Salary FROM IBM WHERE Salary BETWEEN 40000 AND 70000;

-- Q27 Show employees whose age is between 23 and 30.
SELECT * FROM IBM WHERE Age BETWEEN 23 AND 30;
SELECT Name, Age FROM IBM WHERE Age BETWEEN 23 AND 30;

-- Q28 Show employees who joined between 2023-01-01 and 2024-12-31.
SELECT * FROM IBM WHERE Joining_Date BETWEEN '2023-01-01' AND '2024-12-31';
SELECT Name, Joining_Date FROM IBM WHERE Joining_Date BETWEEN '2023-01-01' AND '2024-12-31';

-- Q29 Show employees whose Emp_ID is between 103 and 107.
SELECT * FROM IBM WHERE Emp_ID BETWEEN 103 AND 107; 
SELECT Name, Emp_id FROM IBM WHERE Emp_ID BETWEEN 103 AND 107;

-- Q30 Show salaries between ₹45,000 and ₹90,000.
SELECT * FROM IBM WHERE Salary BETWEEN 45000 AND 90000;
SELECT Name, Salary FROM IBM WHERE Salary BETWEEN 45000 AND 90000;

-- 🟢 PART G — IN Practice
-- Q31 Show employees from Pune Mumbai Delhi
SELECT * FROM IBM WHERE City IN ('Pune','Mumbai','Delhi');
SELECT Name, City FROM IBM WHERE City IN('Pune', 'Mumbai', 'Delhi');

-- Q32 Show employees working in Python Testing 
SELECT * FROM IBM WHERE Department IN('Python', 'Testing');
SELECT Name, Department FROM IBM WHERE Department IN('Python', 'Testing');

-- Q33 Show employees whose age is 22 24 31
SELECT * FROM IBM WHERE Age IN(22, 24, 31);
SELECT Name, Age FROM IBM WHERE Age IN(22, 24, 31);

-- Q34 Show employees managed by Rahul, Ankit
SELECT * FROM IBM WHERE Manager IN('Rahul', 'Ankit');
SELECT Name, Manager FROM IBM WHERE Manager IN('Rahul', 'Ankit');

-- Q35 Show employees NOT from Pune, Mumbai
SELECT * FROM IBM WHERE City NOT IN('Pune', 'Mumbai');
SELECT Name, City FROM IBM WHERE City NOT IN('Pune', 'Mumbai');
SELECT * FROM IBM WHERE City IN('Delhi', 'Hyderabad', 'Bengalore');
SELECT Name, City FROM IBM WHERE City IN('Delhi', 'Hyderabad', 'Bengalore');
 
-- 🟢 PART H — LIKE Practice
-- Q36 Show employees whose name starts with A.
SELECT * FROM IBM WHERE Name LIKE 'A%';

-- Q37 Show employees whose name starts with S.
SELECT * FROM IBM WHERE Name LIKE 'S%';

-- Q38 Show employees whose name ends with a.
SELECT * FROM IBM WHERE Name LIKE '%a';

-- Q39 Show employees whose name contains "ra".
SELECT * FROM IBM WHERE Name LIKE '%ra%';

-- Q40 Show employees whose city starts with B.
SELECT * FROM IBM WHERE City LIKE 'B%';

-- 🟢 PART I — ORDER BY Practice
-- Q41 Display employees by salary (ascending).
SELECT * FROM IBM ORDER BY Salary ASC;

-- Q42 Display employees by salary (descending).
SELECT * FROM IBM ORDER BY Salary DESC; 

-- Q43 Sort employees by age.
SELECT * FROM IBM ORDER BY Age;

-- Q44 Sort employees by joining date (newest first).
SELECT * FROM IBM ORDER BY Joining_Date DESC;

-- Q45 Sort employees first by department then salary descending.
SELECT * FROM IBM ORDER BY Department ASC, Salary DESC; -- This will sort department A-Z and inside each department, highest salary first.

-- 🟢 PART J — DISTINCT Practice
-- Q46 Display unique cities.
SELECT DISTINCT City FROM IBM;

-- Q47 Display unique departments.
SELECT DISTINCT Department FROM IBM;

-- Q48 Display unique managers.
SELECT DISTINCT Manager FROM IBM;

-- Q49 Display unique ages.
SELECT DISTINCT Age FROM IBM;

-- Q50 Display unique combinations of Department City. 
SELECT DISTINCT Department, City FROM IBM;

-- 🟢 PART K — LIMIT Practice
-- Q51 Display first 5 employees. 
SELECT * FROM IBM LIMIT 5;
SELECT Name FROM IBM LIMIT 5; 

-- Q52 Display top 3 highest salary employees. 
SELECT * FROM IBM ORDER BY Salary DESC LIMIT 3;

-- Q53 Display youngest employee.
SELECT * FROM IBM ORDER BY Age ASC LIMIT 1;

-- Q54 Display oldest employee.
SELECT * FROM IBM ORDER BY Age DESC LIMIT 1;

-- Q55 Display highest-paid Python developer. 
SELECT * FROM IBM WHERE Department = 'Python' ORDER BY Salary DESC LIMIT 1;

-- 🟢 PART L — Aggregate Functions
-- Q56 Count total employees. 
SELECT COUNT(*) FROM IBM;

-- Q57 Count employees in Python.
SELECT COUNT(Department) FROM IBM WHERE Department = 'Python';
SELECT COUNT(*) FROM IBM WHERE Department = 'Python';

-- Q58 Find total salary.
SELECT SUM(Salary) FROM IBM;

-- Q59 Find average salary.
SELECT AVG(Salary) FROM IBM;

-- Q60 Find highest salary. 
SELECT MAX(Salary) FROM IBM;

-- Q61 Find lowest salary.  
SELECT MIN(Salary) FROM IBM; 

-- Q62 Find average age.
SELECT AVG(Age) FROM IBM;

-- Q63 Find total salary of Python department.
SELECT SUM(Salary) FROM IBM WHERE Department = 'Python'; 

-- Q64 Find highest salary in Testing.
SELECT MAX(Salary) FROM IBM WHERE Department = 'Testing';

-- Q65 Count employees whose manager is Rahul.
SELECT COUNT(Manager) FROM IBM WHERE Manager = 'Rahul'; 

-- 🟢 PART M — GROUP BY
-- Q66 Count employees department-wise.
SELECT Department, COUNT(*)  FROM IBM GROUP BY Department;
SELECT Department, COUNT(Department)  FROM IBM GROUP BY Department;

-- Q67 Average salary department-wise.
SELECT Department, AVG(Salary) FROM IBM GROUP BY Department;

-- Q68 Maximum salary department-wise.
SELECT Department, MAX(Salary) FROM IBM GROUP BY Department;

-- Q69 Minimum salary department-wise. 
SELECT Department, MIN(Salary) FROM IBM GROUP BY Department;   

-- Q70 Total salary department-wise.
SELECT Department, SUM(Salary) FROM IBM GROUP BY Department;  

-- Q71 Count employees city-wise.
SELECT City, COUNT(*) FROM IBM GROUP BY City; 

-- Q72 Average age city-wise.
SELECT City, AVG(Age) FROM IBM GROUP BY City;

-- Q73 Count employees manager-wise.  
SELECT Manager, COUNT(*) FROM IBM GROUP BY Manager;

-- Q74 Maximum salary city-wise.
SELECT City, MAX(Salary) FROM IBM GROUP BY City;

-- Q75 Average salary manager-wise.
SELECT Manager, AVG(Salary) FROM IBM GROUP BY Manager;

-- 🟢 PART N — HAVING
-- Q76 Show departments having more than 2 employees.
SELECT Department, COUNT(Department) FROM IBM GROUP BY Department HAVING COUNT(Department) > 2;

-- Q77 Show departments whose average salary is greater than ₹60,000.
SELECT Department, AVG(Salary) FROM IBM GROUP BY Department HAVING AVG(Salary) > 60000;

-- Q78 Show cities having more than one employee.
SELECT City, COUNT(*) FROM IBM GROUP BY City HAVING COUNT(City) > 1;

-- Q79 Show managers managing more than two employees.
SELECT Manager, COUNT(*) FROM IBM GROUP BY Manager HAVING COUNT(Manager) > 2;

-- Q80 Show departments whose maximum salary is above ₹75,000.
SELECT Department, MAX(Salary) FROM IBM GROUP BY Department HAVING MAX(Salary) > 75000;

-- 🟢 PART O — CASE
-- Q81 Show salary status: High, Medium, Low 
SELECT Name, Salary,  
CASE WHEN Salary > 70000 THEN 'High'
     WHEN Salary > 50000 THEN 'Medium'
     ELSE 'Low'
     END AS SalaryStatus
     FROM IBM;

-- Q82 Display age category: Young, Adult, Senior
SELECT Name, Age, CASE WHEN Age > 27 THEN 'Senior'
                       WHEN Age > 23 THEN 'Adult'
                       ELSE 'Young'
                       END AS AgeStatus
                       FROM IBM;

-- Q83 Display department type: Technical, Non-Technical
SELECT Department, CASE WHEN Department IN('Python', 'Java', 'Testing') THEN 'Technical'
                             ELSE 'Non - Technical'
                             END AS DepartmentStatus
                             FROM IBM GROUP BY Department;
                             
-- Q84 Display salary bonus: Salary >70000 Bonus Eligible Else Not Eligible
SELECT Name, Salary, CASE WHEN Salary > 70000 THEN 'Eligible'
                          ELSE 'Not Eligible'
                          END AS SalaryBonus
                          FROM IBM;
                          
-- Q85 Display experience category using joining year.
SELECT Name, Joining_Date, CASE WHEN Joining_Date < '2022-01-01' THEN 'Senior'
                                WHEN Joining_Date < '2025-01-01' THEN 'Junior'
                                ELSE 'Intern'
                                END AS Joining_Year
                                FROM IBM;

-- 🟢 PART P — NULL
-- Q86 Show employees whose manager is NULL.  
SELECT * FROM IBM WHERE Manager IS NULL;

-- Q87 Show employees whose manager is NOT NULL.
SELECT * FROM IBM WHERE Manager IS NOT NULL;

-- Q88 Replace NULL managers with "No Manager"
SELECT Name, COALESCE(Manager, 'No Manager') AS Manager FROM IBM;

-- Q89 Count employees whose manager is NULL.
SELECT COUNT(*) FROM IBM  WHERE Manager IS NULL;

-- Q90 Display manager name using COALESCE.
SELECT Name, COALESCE(Manager, 'No Manager') AS ManagerName FROM IBM;

--  Q91 Find the second highest salary.
SELECT MAX(Salary) AS SecondHighestSalary FROM IBM WHERE Salary < (SELECT MAX(Salary) FROM IBM);

-- Q92 Find employees earning more than the average salary.
SELECT * FROM IBM WHERE Salary > (SELECT AVG(Salary) FROM IBM);

-- Q93 Find departments having the highest average salary.
SELECT Department, AVG(Salary) AS AvgSalary FROM IBM GROUP BY Department ORDER BY AvgSalary DESC LIMIT 1;

-- Q94 Find cities where more than two employees work.
SELECT City, COUNT(*) AS EmployeeCount FROM IBM GROUP BY City HAVING COUNT(*) > 2;

-- Q95 Find the total salary of employees from Pune.
SELECT SUM(Salary) AS TotalSalaryPune FROM IBM WHERE City = 'Pune';

-- Q96 Find the average salary of employees whose age is above 25.
SELECT AVG(Salary) FROM IBM WHERE Age > 25;

-- Q97 Find departments where the minimum salary is greater than ₹45,000.
SELECT Department, MIN(Salary) AS MinSalary FROM IBM GROUP BY Department HAVING MIN(Salary) > 45000;

-- Q98 Show employees who joined after 2023 and whose salary is above ₹50,000.
SELECT * FROM IBM WHERE YEAR(Joining_Date) > '2023 - 01 - 01' AND Salary > 50000;

-- Q99 Display the top 2 youngest Python developers.
SELECT * FROM IBM WHERE Department = 'Python' OR Department LIKE 'Python' ORDER BY Age ASC LIMIT 2;

-- Q100 Write a query to display: Department, Number of Employees, Highest Salary, Lowest Salary, Average Salary, Total Salary But display only departments having at least 2 employees, and sort the result by highest average salary
SELECT Department, 
COUNT(*) AS NumberOfEmployees,
MAX(Salary) AS HighestSalary,
MIN(Salary) AS LowestSalary,
AVG(Salary) AS AverageSalary,
SUM(Salary) AS Total_Salary
FROM IBM 
GROUP BY Department 
HAVING COUNT(*) >= 2
ORDER BY AverageSalary DESC;






 
SET SQL_SAFE_UPDATES = 0; -- This one query safe mode offs 

SET SQL_SAFE_UPDATES = 1; --  This one query on the safe mode

-- SELECT Name, Age, Joining_Date FROM IBM;

SELECT * FROM IBM;

 
  

