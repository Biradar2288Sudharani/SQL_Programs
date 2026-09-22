USE sql_practice;

CREATE TABLE Emp(Emp_ID INT PRIMARY KEY,
Emp_Name VARCHAR(100),
Gender VARCHAR(10),
Salary INT,
City VARCHAR(10));

SELECT * FROM Emp;

INSERT INTO Emp VALUES(1, 'Arjun', 'M', 75000, 'Pune'),
(2, 'Ekadanta', 'M', 125000, 'Bengalore'),
(3, 'Lalita', 'F', 150000, 'Mathura'),
(4, 'Madhav', 'M', 250000, 'Delhi'),
(5, 'Visakha', 'F', 120000, 'Mathura');

CREATE TABLE EmpDetail(Emp_ID INT PRIMARY KEY,
Project VARCHAR(10),
EmpPosition VARCHAR(20),
DOJ DATE);

INSERT INTO EmpDetail VALUES(1, 'P1', 'Executive', '2019-01-26'),
(2, 'P2', 'Executive', '2020-04-05'),
(3, 'P1', 'Lead', '2021-10-21'),
(4, 'P3', 'Manager', '2018-11-29'),
(5, 'P2', 'Manager', '2020-01-08');

SELECT * FROM EmpDetail;
SELECT * FROM Emp;

-- 1. Find the list of employees whose salary ranges between 2L to 3L.
SELECT Emp_Name, Salary FROM Emp
WHERE Salary > 200000 AND Salary < 300000;
SELECT Emp_Name, Salary FROM Emp
WHERE Salary BETWEEn 100000 AND 300000;

-- 2. Write a query to retrive the list of employees from the same city.
SELECT e1.Emp_ID, e1.Emp_Name, e1.City
FROM Emp e1, Emp e2
WHERE e1.City = e2.City AND e1.Emp_ID != e2.Emp_ID;

-- 3. Query to find the null values in the employee table.
SELECT * FROM Emp 
WHERE Emp_ID IS NULL;

-- 4. Query to find the cumulative sum of employees salary.
SELECT emp_ID, Salary, SUM(Salary) OVER (ORDER BY Emp_ID) AS CumulativeSum
FROM Emp;

-- 5. What is the male and female employees ratio.
SELECT 
COUNT(CASE WHEN Gender = 'M' THEN 1 END) * 100.0 / COUNT(*) AS MalePct,
COUNT(CASE WHEN Gender = 'F' THEN 1 END) * 100.0 / COUNT(*) AS FemalePct
FROM Emp;

-- 6. Write a query to fetch 50% records from the employee table.
SELECT * FROM Emp 
WHERE Emp_ID <= (SELECT COUNT(Emp_ID)/2 FROM Emp);

-- 7. Write a query to fetch the employees salary but replace the LAST 2 digits with 'XX' i.e 12345 will be 123XX.
SELECT Salary, 
CONCAT(LEFT(Salary, CHAR_LENGTH(Salary)-2), 'XX') as marked_salary
FROM Emp;

-- 8. Write a query to fetch even and odd rows from employee table.
-- (General solution using ROW_NUMBER()) Fetch even rows
SELECT * FROM (
SELECT *, ROW_NUMBER() OVER(ORDER BY Emp_ID) AS RowNumber FROM Emp) 
AS Emp WHERE Emp.RowNumber % 2 = 0;
-- Fetch odd rows
SELECT * FROM (
SELECT *, ROW_NUMBER() OVER(ORDER BY Emp_ID) AS RowNumber FROM Emp) AS Emp
WHERE Emp.RowNumber % 2 = 1;
-- Alternative Solution - If you have an auto increment field like EmpID then we can use the MOD() function
-- Fetch even rows
SELECT * FROM Emp WHERE MOD(Emp_ID, 2) = 0;
-- Fetch odd rows
SELECT * FROM Emp WHERE MOD(Emp_ID, 2) = 1;

-- 9. Write a query to find all the employee names whose name:
-- Begin with 'A'
SELECT * FROM Emp WHERE Emp_Name LIKE 'A%';
-- Contains 'A' alphabet at second place
SELECT * FROM Emp WHERE Emp_Name LIKE '_a%';
-- Contains 'Y' alphabet at second last place
SELECT * FROM Emp WHERE Emp_Name LIKE '%Y_';
-- Ends with 'L' and contains 4 alphabets
SELECT * FROM Emp WHERE Emp_Name LIKE '____L';
-- Begins with 'V' and ends with 'A'
SELECT * FROM Emp WHERE Emp_Name LIKE 'V%a';

-- 10. Write a query to find the list of employee names which is:
-- Starting with vowels (a,e,i,o,u) without duplicates
SELECT DISTINCT Emp_Name FROM Emp
WHERE LOWER(Emp_Name) REGEXP '^[aeiou]';
-- Ending with vowels (a,e,i,o,u) without duplicates
SELECT DISTINCT Emp_Name FROM Emp
WHERE LOWER(Emp_Name) REGEXP '[aeiou]$';
-- Stating and ending with vowels (a,e,i,o,u) without duplicates
SELECT DISTINCT Emp_Name FROM Emp
WHERE LOWER(Emp_Name) REGEXP '^[aeiou] *[aeiou]$'; 

-- 11. Find Nth hghest salary from employee table with and without using the TOP/LIMIT keywords.
-- General solution without using TOP/LIMIT
SET @N = 3;
SELECT Salary FROM Emp e1
WHERE @N-1 = (
SELECT COUNT(DISTINCT(e2.Salary))
FROM Emp e2
WHERE e2.Salary > e1.Salary );
SELECT * FROM Emp;
SELECT Salary FROM Emp e1
WHERE @N = (
SELECT COUNT(DISTINCT(e2.Salary))
FROM Emp e2
WHERE e2.Salary >= e1.Salary );
-- Using LIMIT
SET @N = 3;
SELECT Salary FROM Emp 
ORDER BY Salary DESC 
LIMIT 1 OFFSET 2;

-- 12. Write a query to find and remove duplicate records from a table.
SELECT Emp_ID, EMp_Name, Gender, Salary, City, 
COUNT(*) AS Duplicate_Count
FROM Emp
GROUP BY Emp_ID, Emp_Name, Gender, Salary, City
HAVING COUNT(*) > 1;
DELETE FROM Emp WHERE Emp_ID IN
(SELECT Emp_ID FROM Emp GROUP BY Emp_ID 
HAVING COUNT(*) > 1);

-- 13. Write query to retrive the list of employees working in same project.
WITH CTE AS
(SELECT e.Emp_ID, e.Emp_Name, ed.Project
FROM Emp AS e
INNER JOIN EmpDetail AS ed
ON e.Emp_ID = ed.Emp_ID)
SELECT c1.Emp_Name, c2.Emp_Name, c1.Project
FROM CTE c1, CTE c2
WHERE c1.Project = c2.Project 
AND c1.Emp_ID != c2.Emp_ID 
AND c1.Emp_ID < c2.Emp_ID;

SELECT * FROM EmpDetail;

-- 14. Show the employee with the highest salary for each project.
SELECT ed.Project, MAX(e.Salary) AS ProjectSal
FROM Emp AS e
INNER JOIN empDetail AS ed
ON e.Emp_ID = ed.Emp_ID
GROUP BY Project 
ORDER BY ProjectSal DESC; 

WITH CTE AS 
( SELECT Project, Emp_Name, Salary,
ROW_NUMBER() OVER(PARTITION BY Project ORDER BY Salary DESC) AS row_rank
FROM Emp AS E
INNER JOIN EmpDetail AS ed
ON e.Emp_ID = ed.Emp_ID)
SELECT Project, Emp_Name, Salary 
FROM CTE
WHERE row_rank = 1;

-- 15. Query to find the total count of employees joined each year.
SELECT YEAR(ed.DOJ) AS JoinYear, COUNT(*) AS EmpCount
FROM EmpDetail AS ed
GROUP BY JoinYear
ORDER BY JoinYear ASC;
SELECT * FROM EmpDetail;

-- 16. Create 3 groups based on salary column, salary less than 1L is low, between 1 - 2L is medium and above 2L is high.alter
SELECT Emp_Name, Salary,
CASE 
WHEN Salary > 200000 THEN 'HIGH'
WHEN Salary >= 100000 AND Salary <= 200000 THEN 'Medium'
ELSE 'Low'
END AS SalaryStatus
FROM Emp;

/* 17. Write query to pivot the data in the employee table and retrive the total salary for each city. 
The result should display the EmpID, EmpName and seperate columns for each city 
(Mathura, Pune, Delhi) Containing the corresponding total salary*/
SELECT Emp_ID, Emp_Name,
SUM(CASE WHEN City = 'Mathura' THEN Salary END) AS "Mathura",
SUM(CASE WHEN City = 'Pune' THEN Salary END) AS "Pune",
SUM(CASE WHEN City = 'Delhi' THEN Salary END) AS "Delhi"
FROM Emp
GROUP BY Emp_ID, Emp_Name;

-- 18.
-- 19.
-- 20.
-- 21.
-- 22.
-- 23.
-- 24.
-- 25.
-- 26.
-- 27.
-- 28.
-- 29.
-- 30.
-- 31.
-- 32.
-- 33..
-- 34.
-- 35.
-- 36.
-- 37.
-- 38.
-- 39.
-- 40.
-- 41.
-- 42.
-- 43.
-- 44.
-- 45.
-- 46.
-- 47.
-- 48.
-- 49.
-- 50.
