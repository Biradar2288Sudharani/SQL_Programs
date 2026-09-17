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

-- 21. INNER JOIN - Get employee name and department name.
SELECT e.emp_name, d.dept_name 
FROM Employees e 
INNER JOIN department d 
ON e.dept_id = d.dept_id;

-- 22. LEFT JOIN - Show all employees, even if they don't belong to a department. 
SELECT e.emp_name, d.dept_name
FROM employees e
LEFT JOIN department d
ON e.dept_id = d.dept_id;

-- 23. Find employees without a department
SELECT e.emp_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id
WHERE d.dept_id IS NULL;

-- 24. RIGHT JOIN
SELECT e.emp_name, d.dept_name
FROM employees e
RIGHT JOIN department d
ON e.dept_id = d.dept_id;

 -- 25. Join three tables - Find customer names and their order amounts. 
SELECT c.customer_name, o.order_id, o.amount
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id;

SELECT e.emp_name, d.dept_name
FROM employees e
JOIN department d
ON e.dept_id = d.dept_id;

-- 26. Customers who have never placed an order
SELECT c.customer_name
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL; 

-- 27. Find employees earning more than average salary
SELECT *
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);

-- 28. Find employee with highest salary
SELECT *
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
);

-- 29. Find second-highest salary
SELECT MAX(salary) AS second_highest
FROM employees
WHERE salary < (
    SELECT MAX(salary)
    FROM employees
);

-- 30. Find employees earning more than their department average
SELECT e.*
FROM employees e
WHERE e.salary > (
    SELECT AVG(e2.salary)
    FROM employees e2
    WHERE e2.dept_id = e.dept_id
);

-- 31. Find employees who work in the IT department
SELECT *
FROM employees
WHERE dept_id = (
    SELECT dept_id
    FROM departments
    WHERE dept_name = 'IT'
);

-- 32. Find unique cities
SELECT DISTINCT city
FROM customers;

-- 33. Find duplicate emails
SELECT email, COUNT(*) AS count
FROM employees
GROUP BY email
HAVING COUNT(*) > 1;

-- 34. Find duplicate employee names
SELECT emp_name, COUNT(*)
FROM employees
GROUP BY emp_name
HAVING COUNT(*) > 1;

-- 35. Categorize salaries
SELECT emp_name,
       salary,
       CASE
           WHEN salary >= 100000 THEN 'High'
           WHEN salary >= 50000 THEN 'Medium'
           ELSE 'Low'
       END AS salary_category
FROM employees;

-- 36. Count high/low salary employees
SELECT
    SUM(CASE WHEN salary >= 50000 THEN 1 ELSE 0 END)
        AS high_salary_count
FROM employees;

-- 37. Employees hired after January 1, 2025
SELECT *
FROM employees
WHERE hire_date > '2025-01-01';

-- 38. Employees hired in 2025
SELECT *
FROM employees
WHERE YEAR(hire_date) = 2025;

-- 39. Find employees hired in the last 30 days
SELECT *
FROM employees
WHERE hire_date >= CURRENT_DATE - INTERVAL 30 DAY;

-- 40. Orders placed today
SELECT *
FROM orders
WHERE DATE(order_date) = CURRENT_DATE;

-- 41. Monthly sales
SELECT
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(amount) AS total_sales
FROM orders
GROUP BY YEAR(order_date), MONTH(order_date);

-- 42. Update employee salary
UPDATE employees
SET salary = 60000
WHERE emp_id = 101;

UPDATE employees
SET salary = 60000;

-- 43. Increase salary by 10%
UPDATE employees
SET salary = salary * 1.10
WHERE dept_id = 2;

-- 44. Delete an employee
DELETE FROM employees
WHERE emp_id = 101;

-- 45. Delete duplicate records
DELETE e1
FROM employees e1
JOIN employees e2
ON e1.email = e2.email
AND e1.emp_id > e2.emp_id;

-- 46. Rank employees by salary
SELECT
    emp_name,
    salary,
    RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM employees;

-- 47. ROW_NUMBER()
SELECT
    emp_name,
    salary,
    ROW_NUMBER() OVER (ORDER BY salary DESC) AS row_num
FROM employees;

-- 48. DENSE_RANK()
SELECT
    emp_name,
    salary,
    DENSE_RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM employees;

-- 49. Highest-paid employee in each department
SELECT *
FROM (
    SELECT
        e.*,
        ROW_NUMBER() OVER (
            PARTITION BY dept_id
            ORDER BY salary DESC
        ) AS rn
    FROM employees e
) x
WHERE rn = 1;

-- 50. Top 3 salaries in each department
SELECT *
FROM (
    SELECT
        e.*,
        DENSE_RANK() OVER (
            PARTITION BY dept_id
            ORDER BY salary DESC
        ) AS salary_rank
    FROM employees e
) x
WHERE salary_rank <= 3;

-- 51. Basic CTE
WITH high_salary AS (
    SELECT *
    FROM employees
    WHERE salary > 80000
)
SELECT *
FROM high_salary;

-- 52. CTE for average salary
WITH avg_salary AS (
    SELECT AVG(salary) AS avg_sal
    FROM employees
)
SELECT e.*
FROM employees e
CROSS JOIN avg_salary a
WHERE e.salary > a.avg_sal;

-- 53. Combine two result sets
SELECT emp_name AS name
FROM employees
UNION
SELECT customer_name AS name
FROM customers;

-- 54. UNION ALL
SELECT emp_name AS name
FROM employees
UNION ALL
SELECT customer_name AS name
FROM customers;

-- 55. Replace NULL email with a default value
SELECT
    emp_name,
    COALESCE(email, 'Not Provided') AS email
FROM employees;

-- 56. Find employees with missing email
SELECT *
FROM employees
WHERE email IS NULL;

-- 57. Create table with constraints
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE,
    salary DECIMAL(10,2) CHECK (salary > 0),
    dept_id INT,
    FOREIGN KEY (dept_id)
        REFERENCES departments(dept_id)
);

-- 58. Transaction example
START TRANSACTION;
UPDATE accounts
SET balance = balance - 5000
WHERE account_id = 1;
UPDATE accounts
SET balance = balance + 5000
WHERE account_id = 2;
COMMIT;

-- 59. Rollback
START TRANSACTION;
UPDATE employees
SET salary = salary * 2;
ROLLBACK;

-- 60. Commit
START TRANSACTION;
UPDATE employees
SET salary = salary * 1.10;
COMMIT;

-- ***  Second-highest salary
SELECT MAX(salary)
FROM employees
WHERE salary < (
    SELECT MAX(salary)
    FROM employees
);

-- *** Third-highest salary
SELECT DISTINCT salary
FROM employees
ORDER BY salary DESC
LIMIT 1 OFFSET 2;

-- ***  Employees earning above average
SELECT *
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);

-- ***  Duplicate records
SELECT email, COUNT(*)
FROM employees
GROUP BY email
HAVING COUNT(*) > 1;

-- ***  Employees without department
SELECT e.*
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id
WHERE d.dept_id IS NULL;

-- ***  Highest salary per department
SELECT *
FROM (
    SELECT e.*,
           ROW_NUMBER() OVER (
               PARTITION BY dept_id
               ORDER BY salary DESC
           ) rn
    FROM employees e
) x
WHERE rn = 1;

-- ***  Department-wise employee count
SELECT dept_id, COUNT(*) AS total
FROM employees
GROUP BY dept_id;

-- ***  Department average salary
SELECT dept_id, AVG(salary) AS avg_salary
FROM employees
GROUP BY dept_id;

-- ***  Customers without orders
SELECT c.*
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- ***  Top 3 salaries in every department
SELECT *
FROM (
    SELECT e.*,
           DENSE_RANK() OVER (
               PARTITION BY dept_id
               ORDER BY salary DESC
           ) AS rnk
    FROM employees e
) x
WHERE rnk <= 3;

SELECT * FROM Employees;
SELECT * FROM Department;
SELECT * FROM Customers;
SELECT * FROM Orders;

UPDATE Orders SET status = NULL WHERE order_id = 'XYZ101';

