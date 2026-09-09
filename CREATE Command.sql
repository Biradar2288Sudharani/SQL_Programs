-- Create New Database
CREATE DATABASE Sudharani;

-- Deleting the existed database 
DROP DATABASE Sudharani;

-- Activating the database means, to use database to my work 
USE Sudharani;

-- Create a new TABLE
-- CREATE TABLE Student(
-- 	std_id INT PRIMARY KEY, 
-- 	name VARCHAR(50), 
-- 	age INT, 
-- 	branch VARCHAR(10), 
-- 	mobile_number INT,
--     email_id VARCHAR(50),
--     city VARCHAR(20),
--     admission_date DATE
-- )

--  To shows all data in table 
SELECT * FROM Student;

-- Insering the single row in table 
INSERT INTO Student VALUES (101, "Biradar Sudharani", 23, "CSE", "7709298002", "sudha@gmail.com", "Pune", "2021-11-13");

-- Insering the multiple rows in table 
INSERT INTO Student Values (102, "Biradar Shankar", 28, "AIML", "7066172288", "shankar@gmail.com", "Hospete", "2021-11-13"),
							(103, "Biradar Darshan", 20, "IT", "9686171763", "darchank@gmail.com", "Vijaypur", "2021-11-13"),
                            (104, "Biradar Sachin", 24, "AIDS", "7620750308", "sachin@gmail.com", "Dagandra", "2021-11-13"),
                            (105, "Biradar Srushti", 22, "CSE", "9373029933", "srushti@gmail.com", "Hubli", "2021-11-13"),
                            (106, "Biradar Sagarr", 23, "AIML", "9271182818", "sagar@gmail.com", "Bengalore", "2021-11-13");
                            
-- Alter is modify the structure of an existing table (ALTER Command having 3 main clauses they are ADD, MODIFY, RENAME)
ALTER TABLE Student MODIFY phone_number VARCHAR(15);
ALTER TABLE Student MODIFY phone_number VARCHAR(20); -- Single column modify 
ALTER TABLE Student MODIFY name VARCHAR(70), MODIFY email_id VARCHAR(110), MODIFY branch VARCHAR(25); -- Multi column modify 

-- Now we see ALTER Command ADD clause Examples (ADD clause is, add the new columns in existed table)
-- Can we add new column in existing table - YES, Using ALTER Command ADD Clause 
ALTER TABLE Student ADD blood_group VARCHAR(10);  -- Here we add single column in existed table

-- Can we add multiple columns in existed table - YES 
ALTER TABLE Student ADD Division VARCHAR(10), ADD Marks VARCHAR(10), ADD Grade VARCHAR(10);  -- Here we add the multiple columns in one query

-- Can we change existed column name ? - YES, Using ALTER Command RENAME Clause (RENAME clause is change the column name or table name)
ALTER TABLE Student RENAME COLUMN mobile_number TO phone_number; -- Single column rename
ALTER TABLE Student RENAME COLUMN Division TO division, RENAME COLUMN Marks TO marks, RENAME COLUMN Grade TO grade; -- Multiple column renames

-- changing the Table name
ALTER TABLE Student RENAME Students;
RENAME TABLE Student TO Students;

-- Now my table blood group column is null so here i add data in blood group column using UPDATE Command(Updating multi rows and sigle column)
UPDATE Student 
	SET blood_group = CASE std_id
		WHEN 101 THEN 'A+'
        WHEN 102 THEN 'A+'
        WHEN 103 THEN 'A+'
        WHEN 104 THEN 'O+'
        WHEN 105 THEN 'A+'
        WHEN 106 THEN 'O+'
	END
	WHERE std_id IN (101,102,103,104,105,106);
UPDATE Student SET age=24 WHERE std_id=101; -- Updating single row and single column 
UPDATE Student SET email_id = "darshan@gmail.com" WHERE std_id=103; -- Updating single row and single column 

UPDATE Student SET division = CASE std_id 
					WHEN 101 THEN 'A'
					WHEN 102 THEN 'B'
                    WHEN 103 THEN 'A'
					WHEN 104 THEN 'B'
					WHEN 105 THEN 'C'
                    WHEN 106 THEN 'A'
                    END,
					marks = CASE std_id
                    WHEN 101 THEN 98
                    WHEN 102 THEN 98
                    WHEN 103 THEN 99
                    WHEN 104 THEN 95 
                    WHEN 105 THEN 97 
                    WHEN 106 THEN 100
                    END,
                    grade = CASE std_id
                    WHEN 101 THEN 'A+'
                    WHEN 102 THEN 'A+'
                    WHEN 103 THEN 'A+'
                    WHEN 104 THEN 'A+'
                    WHEN 105 THEN 'A+'
                    WHEN 106 THEN 'A+'
                    END
                    WHERE std_id IN(101, 102, 103, 104, 105, 106);
                    
ALTER TABLE Student MODIFY grade VARCHAR(20);
UPDATE Student SET name = "Biradar Sagar" WHERE std_id = 106;

-- DELETE Command (DELETE removes one or more columns from a table) 
-- We can perform DELETE Operation on Employee Table 
CREATE Table Employee(empid INT Primary Key, name VARCHAR(100), age VARCHAR(10), city VARCHAR(20), phone VARCHAR(15));

INSERT Employee VALUES(105, 'Sudharani', 24, 'Pune', 7709298002,'B'),
					  (106, 'Shankar', 28, 'Hospete', 70661722288, 'A'),
                      (107, 'Sachi', 23, 'Dhagandra', 7620750308, 'B'),
                      (108, 'Srushti', 20, 'Vijaypur', 9373029933, 'A'),
                      (109, 'Darshan', 22, 'Pune', 9686171763, 'A'),
                      (110, 'Sagar', 25, 'Benglore', 7620750303, 'B');

SELECT * FROM Employee;
UPDATE Employee SET division = CASE empid
							WHEN 101 THEN 'A'
                            WHEN 102 THEN 'A'
                            WHEN 103 THEN 'B' 
                            WHEN 104 THEN 'A'
                            END
                            WHERE empid IN (101, 102, 103, 104);
                            
ALTER TABLE Employee ADD COLUMN division VARCHAR(20);

SET SQL_SAFE_UPDATES = 0; -- This one query safe mode offs 

SET SQL_SAFE_UPDATES = 1; --  This one query on the safe mode

-- IF you want delete all records in the employee table then use below query
DELETE FROM Employee; 

-- If you deleting single row then use this query 
DELETE FROM Employee WHERE empid = 105;

-- If you delete multiple rows not all rows then use this query 
DELETE FROM Employee WHERE empid = 103 OR empid = 104; --  OR
DELETE FROM Employee WHERE empid IN (101, 102);

-- DELETE Command with OPERATOR
-- 1. DELETE Command with AND / OR
DELETE FROM Employee WHERE city = 'Pune' and age = 22;

-- 2. DELETE Command with comparision >, <, =, !=
DELETE FROM Employee WHERE age > 26;

-- 3. DELETE Command with BETWEEN
DELETE FROM Employee WHERE empid BETWEEN 101 AND 103;

-- 4. DELETE Command with LIKE
DELETE FROM Employee WHERE name LIKE 'A%';

-- 5. DELETE Command with IS NULL / IS NOT NULL
DELETE FROM Employee WHERE division IS NULL;

-- 6. DELETE Command with IN
DELETE FROM Employee WHERE empid IN (101, 102, 103);

-- Can I delete columns using DELETE Command ? - NO, DELETE Commands operates only rows not a columns.
-- If you want to delete the columns, use ALTER Command. like
ALTER TABLE Employee DROP COLUMN domain;


















































































































































































































































































































