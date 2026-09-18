USE sql_practice;
-- Creating Employees Table
CREATE TABLE Employees(emp_id INT PRIMARY KEY,
						emp_name VARCHAR(50),
						salary INT,
						dept_id VARCHAR(10),
						manager_id VARCHAR(10),
						hire_date DATE,
						email VARCHAR(100)
                        );