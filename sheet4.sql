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
 
 
 

SELECT * FROM IBM;

 
  

