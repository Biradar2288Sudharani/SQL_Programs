USE sql_practice;
CREATE TABLE TCS_Employee(emp_id INT PRIMARY KEY, 
emp_name VARCHAR(100),
department VARCHAR(20),
salary INT,
manager_id VARCHAR(20));
INSERT INTO TCS_Employee VALUES(101, 'Aarav', 'Engineering', 95000, 105),
(102, 'Meera', 'Engineering', 72000, 105),
(103, 'Kabir', 'Sales', 65000, 106),
(104, 'Isha', 'Sales', 92000, 106),
(105, 'Rohan', 'Engineering', 90000, 105),
(106, 'Neha', 'Sales', 88000, 106);
TRUNCATE TABLE TCS_Employee;
DROP TABLE TCS_Employee;
SHOW TABLES;
SELECT * FROM TCS_Employee;
SELECT * FROM Customers;
SELECT * FROM Orders;
DROP TABLE Customers;
DROP Table Orders;
CREATE TABLE Customers(customer_id INT PRIMARY KEY,
customer_name VARCHAR(50),
city VARCHAR(20));
INSERT INTO Customers VALUES(1, 'Aditi Sharma', 'Delhi'),
(2, 'Rahul Varma', 'Mumbai'),
(3, 'Simran Kaur', 'Pune'),
(4, 'Arjun Nair', 'Benglore');
CREATE TABLE Orders(order_id INT PRIMARY KEY,
customer_id INT,
amount INT,
status VARCHAR(20));
INSERT INTO Orders VALUES(501, 1, 2400, 'Delivered'),
(502, 1, 2400, 'Delivered'),
(503, 2, 2400, 'Delivered'),
(504, 2, 2400, 'Pending'),
(505, 3, 2400, 'Cancelled');
UPDATE Orders SET amount = CASE order_id
WHEN 502 THEN 3200
WHEN 503 THEN 1800
WHEN 504 THEN 4100
WHEN 505 THEN 950
END
WHERE order_id IN(502, 503, 504, 505);
SET SQL_SAFE_UPDATES = 0;
UPDATE Orders SET status = 'Cancelled' WHERE order_id = 'XYZ104';

-- 1.  Write a query to display all engineering employees ordered by sakary from highest to lowest.
SELECT * FROM TCS_Employee WHERE department = 'Engineering' ORDER BY salary DESC; 
SELECT * FROM TCS_Employee WHERE department = 'Engineering' ORDER BY salary ASC;
SELECT emp_name, salary FROM TCS_Employee WHERE department = 'Engineering' ORDER BY salary DESC;
SELECT emp_name, salary FROM TCS_Employee WHERE department = 'Engineering' ORDER BY salary ASC;
SELECT * FROM TCS_Employee WHERE department = 'Engineering' ORDER BY salary; -- If we not mention DESC or ASC we get by default ASC order

-- 2. Write a query to find the number of employees in each department.
SELECT department, COUNT(*) AS employee_count FROM TCS_Employee GROUP BY department ;
SELECT department, COUNT(*) AS employee_count FROM TCS_Employee GROUP BY department HAVING COUNT(*) >2;

-- 3. Write a query to find the second highest distinct salary.
SELECT MAX(salary) AS second_highest_salary FROM TCS_Employee WHERE salary < (SELECT MAX(salary) FROM TCS_Employee);

-- 4. Write a query to find employees earning more than the company average salary.
SELECT emp_name, salary FROM TCS_Employee WHERE salary > (SELECT AVG(salary) FROM TCS_Employee);
SELECT AVG(salary) FROM TCS_Employee;

-- 5. Write a query to find the highest salary in each department.
SELECT department, MAX(salary) AS highest_salary FROM TCS_Employee GROUP BY department;

-- 6. Write a query to find employees whose salary is higher than their manager salary.
SELECT e.emp_name, e.salary, 
m.emp_name AS manager_name,
m.salary AS manager_salary
FROM TCS_Employee e JOIN TCS_Employee m
ON e.manager_id = m.emp_id
WHERE e.salary > m.salary ;

-- 7. Write a query to display each order with the customer name.
SELECT o.order_id, c.customer_name, o.amount, o.status 
FROM Orders o JOIN Customers c 
ON o.customer_id = c.customer_id ;

-- 8. Write a query to find customers who have never placed an order.
SELECT c.customer_id, c.customer_name
FROM Customers c LEFT JOIN Orders o
ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- 9. Write a query to find customers who placed more than one order.
SELECT c.customer_name, COUNT(*) AS order_count
FROM Customers c JOIN Orders o 
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(*) > 1 ;

-- 10. Write a query to find the highest-spending customer based only on delivered orders.
SELECT c.customer_name, SUM(o.amount) AS total_spending
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
WHERE o.status = 'Delivered'
GROUP BY c.customer_id, c.customer_name
ORDER BY total_spending DESC
LIMIT 1;

-- 11. A table has 100 million records, We want to remove all rows as quickly as possible while keeping the table. Which SQL command will you use ?
TRUNCATE TABLE TCS_Employee;
SELECT * FROM TCS_Employee;

-- 12. A new intern should only be able to view the employee table but should not modify it. which SQL command will you use ?
GRANT SELECT ON TCS_Employee TO intern_user;

-- 13. An alias created in the SELECT list cannot be referenced in the WHERE clause of the same query. How does SQL's logical execution order explain this ?
SELECT salary * 12 AS annual_salary
FROM TCS_Employee
WHERE annual_salary > 600000;

-- 14. A ranking query conatains duplicate salaries. How will ROW_NUMBER(), RANK() and DENSE_RANK() assign values differently ?
SELECT employee, salary,
ROW_NUMBER() OVER(ORDER BY salary DESC) AS row_no,
RANK() OVER(ORDER BY salary DESC) AS rank_no,
DENSE_RANK() OVER(ORDER BY salary DESC) AS dense_rank_no
FROM TCS_Employee;

-- 15. A table caontains duplicate and NULL email values. How will COUNT(*), COUNT(email) and COUNT(DISTINCT email) differ ?
SELECT COUNT(*) AS total_rows, 
COUNT(email) AS non_null_emails,
COUNT(DISTINCT email) AS
unique_non_null_emails
FROM Customers;

-- 16. A report contains missing values across primary_phone, alternate_phone and emergency_phone.  How would you return the first available value and show not available when all three are NULL ?
SELECT customer_name, COALESCE(primary_phone, alternate_phone, emergency_phone, 'Not Available')
AS contact_phone
FROM Customers;

-- 17. Write a query to find each user's previous login date.(Window Functions)
SELECT user_id, login_date,
LAG(login_date) OVER (
PARTITION BY user_id
ORDER BY login_date
) AS previous_login
FROM User_logins;

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
-- 33.
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
-- 51.
-- 52.
-- 53.
-- 54.
-- 55.
-- 56.
-- 57.
-- 58.
-- 59.
-- 60.  
                        
