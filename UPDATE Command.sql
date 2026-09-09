USE sql_practice;
-- To shows all data in table 
SELECT * FROM employeee;
-- Basic syntax of UPDATE Commnad
UPDATE Employeee SET name = "Sudha" WHERE emp_id = 101; 
-- UPDATE Function in multiple columns and single row
UPDATE Employeee SET name = "Sudharani", age = 23, salary = 95000, department = "Full Stack Python" WHERE emp_id = 101;
UPDATE Employeee SET age = 28, City = "Hospete" WHERE emp_id = 102;
UPDATE Employeee SET age = 20, City = "Mumbai" WHERE emp_id = 104;
-- UPDATE Function in multiple rows and sigle column
UPDATE Employeee SET city = "Bengalore" WHERE emp_id IN (101, 103, 107); 
-- UPDATE Function in Multiple Rows and Multiple Columns 
UPDATE Employeee SET city = CASE emp_id
WHEN 101 THEN 'Pune'
When 103 THEN 'Ahamdabad'
WHEN 107 THEN 'Bengalore'
END,
age = CASE emp_id
WHEN 101 THEN 23
WHEN 103 THEN 24
WHEN 107 THEN 23
END,
salary = CASE emp_id 
WHEN 101 THEN 98000
WHEN 103 THEN 100000
WHEN 107 THEN 79000
END
WHERE emp_id IN (101,103,107);
-- UPDATE Function with ELSE cocept
UPDATE Employeee SET  
name = CASE emp_id
WHEN 105 THEN "Sudha"
WHEN 108 THEN "Sachi"
ELSE name -- Here else keeps old value, if there ID doesn't match 
END,
age = CASE emp_id 
WHEN 105 THEN 21
WHEN 108 THEN 22
END
WHERE emp_id IN (105, 108);