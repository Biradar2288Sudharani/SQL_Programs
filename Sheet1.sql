USE sql_practice;

-- Create department table
CREATE TABLE Department(dept_id INT PRIMARY KEY, dept_name VARCHAR(50)); 

-- Inserting data in Department table 
INSERT INTO Department VALUES(101, 'Development'),
							 (102, 'Testing'),
                             (103, 'Manager'),
                             (104, 'Finance');

DELETE FROM Department WHERE dept_id IN (101, 102, 103, 104, 105, 106, 107, 108, 109, 110);
SELECT *  FROM Department;
SELECT * FROM Employees;
ALTER TABLE Department MODIFY COLUMN dept_id INT;
ALTER TABLE Employees MODIFY COLUMN manager_id INT;

-- Creating Employees Table
CREATE TABLE Employees(emp_id INT PRIMARY KEY,
						emp_name VARCHAR(50),
						salary INT,
						dept_id VARCHAR(10),
						manager_id VARCHAR(10),
						hire_date DATE,
						email VARCHAR(100)
                        );
                 
-- Inserting data in Employees Table 
INSERT INTO Employees VALUES(1, 'Sudharani Biradar', 80000, 101, 1111, '2025-09-04', 'sudha@gmail.com'),
					        (2, 'Shankar Biradar', 80000, 101, 1111, '2025-09-04', 'shankar@gmail.com'),
                            (3, 'Sachin Biradar', 80000, 101, 1111, '2025-09-04', 'sachin@gmail.com'),
                            (4, 'Srushti Biradar', 80000, 101, 1111, '2025-09-04', 'srushti@gmail.com'),
                            (5, 'Sagar Biradar', 80000, 101, 1111, '2025-09-04', 'sagar@gmail.com'),
                            (6, 'Sanvi Biradar', 80000, 101, 1111, '2025-09-04', 'sanvi@gmail.com'),
                            (7, 'Santosh Biradar', 80000, 101, 1111, '2025-09-04', 'santosh@gmail.com'),
                            (8, 'Ganesh Biradar', 80000, 101, 1111, '2025-09-04', 'ganesh@gmail.com'),
                            (9, 'Darshan Biradar', 80000, 101, 1111, '2025-09-04', 'darshan@gmail.com'),
                            (10, 'Ambika Biradar', 80000, 101, 1111, '2025-09-04', 'ambika@gmail.com');

UPDATE Employees SET email = NULL WHERE emp_id = 1;

UPDATE Employees SET dept_id = CASE emp_id
							  WHEN 2 THEN 101
                              WHEN 3 THEN 104
                              WHEN 4 THEN 103
                              WHEN 5 THEN 102
                              WHEN 6 THEN 101
                              WHEN 7 THEN 101
                              WHEN 8 THEN 102
                              WHEN 9 THEN 103
                              WHEN 10 THEN 104
                              END
                              WHERE emp_id IN (2, 3, 4, 5, 6, 7, 8, 9, 10);

-- Creating Customers Table
CREATE TABLE Customers(customer_id VARCHAR(10),
						customer_name VARCHAR(100),
						city VARCHAR(20),
						email VARCHAR(100)); 
                        
-- Inserting datas in Customers Table
INSERT INTO Customers VALUES('A101', 'Ravi Patil', 'Mumbai', 'ravi@gmail.com'),
							('A102', 'Kiran Tadave', 'Mumbai', 'kiran@gmail.com'),
                            ('A103', 'Prasad Yalmar', 'Mumbai', 'prasad@gmail.com'),
                            ('A104', 'Ajur Arati', 'Mumbai', 'arati@gmail.com'),
                            ('A105', 'Gauri Dhanshetti', 'Mumbai', 'gauri@gmail.com'),
                            ('A106', 'Malashri Huchgond', 'Mumbai', 'malashri@gmail.com'),
                            ('A107', 'Sujal Jagtap', 'Mumbai', 'sujal@gmail.com'),
                            ('A108', 'Megha Patil', 'Mumbai', 'megha@gmail.com'),
                            ('A109', 'Nikita Bhaji', 'Mumbai', 'nikita@gmail.com'),
                            ('A110', 'Manisha Mhetre', 'Mumbai', 'manisha@gmail.com');

UPDATE Customers SET customer_id = CASE customer_id
								   WHEN 'A106' THEN 'A101'
                                   WHEN 'A107' THEN 'A102'
                                   WHEN 'A108' THEN 'A103'
                                   WHEN 'A109' THEN 'A104'
                                   WHEN 'A110' THEN 'A105'
                                   END 
                                   WHERE customer_id IN ('A106', 'A107', 'A108', 'A109', 'A110');

SET SQL_SAFE_UPDATES = 0;
SELECT * FROM Customers;
SET SQL_SAFE_UPDATES = 1;
						
-- Creating Orders Table
CREATE TABLE Orders(order_id VARCHAR(10),
					customer_id VARCHAR(10),
					order_date DATE,
					amount INT,
					status VARCHAR(20)); 
                    
-- Inserting values into Orders Table
INSERT INTO Orders VALUES('XYZ101', 'A101', '2026-06-01', 1200, 'Done' ), 
						 ('XYZ102', 'A102', '2026-05-01', 1000, 'Pending'), 
                         ('XYZ103', 'A103', '2026-05-01', 1299, 'Done'), 
                         ('XYZ104', 'A104', '2026-04-01', 1200, 'Pending'), 
                         ('XYZ105', 'A105', '2026-03-01', 999, 'Done');
                         
SELECT * FROM Orders;


-- Questions part starts here onwards
-- 1. Display all employees
SELECT * FROM Employees;  

-- Display specific columns from employees table
SELECT emp_name, salary, email FROM Employees;

-- Find employees earning more than 50,000
SELECT * FROM Employees WHERE salary < 50000;

-- 4. Find employees earning between 40,000 and 80,000
SELECT emp_name, salary FROM Employees WHERE salary BETWEEN 40000 AND 80000; 

-- 5. Find employees from specific departments
SELECT * FROM Employees WHERE dept_id IN (101, 102, 103, 104);

-- 6. Find employees whose name starts with S
SELECT * FROM Employees WHERE emp_name LIKE 'S%'; 
 
-- 7. Find names ending with a
SELECT * FROM Employees WHERE emp_name LIKE '%a';

-- 8. Find names containing an
SELECT * FROM Employees WHERE emp_name LIKE '%an%'; 
 
-- 9. Find employees whose email is NULL
SELECT * FROM employees WHERE email IS NULL;

-- 10. Sort employees by salary
SELECT * FROM Employees ORDER BY salary DESC;
SELECT * FROM Employees ORDER BY salary ASC;
 
-- 11. Find total salary 
SELECT SUM(salary) AS TotalSalary FROM Employees;

-- 12. Find average salary
SELECT AVG(salary) AS AverageSalary FROM Employees;

-- 13. Find highest salary
SELECT MAX(salary) AS HighestSalary FROM Employees; 

-- 14. Find lowest salary
SELECT MIN(salary) AS LowestSalary FROM Employees;  

-- 15. Count employees
SELECT COUNT(*) FROM Employees; 

-- 16. Count employees who have an email
SELECT COUNT(email) FROM Employees; 

-- 17. Count employees in each department
SELECT dept_id, COUNT(*) AS EmployeeCount FROM Employees  GROUP BY dept_id ;

-- 18. Find average salary by department
SELECT dept_id, AVG(salary) AS AverageSalary FROM  Employees GROUP BY dept_id;

-- 19. Find maximum salary in each department
SELECT dept_id, MAX(salary) AS MaximumSalary FROM Employees GROUP BY dept_id; 

-- 20. Departments having more than 5 employees
SELECT dept_id, COUNT(*) AS employee_count
FROM employees
GROUP BY dept_id
HAVING COUNT(*) > 5; 

 

