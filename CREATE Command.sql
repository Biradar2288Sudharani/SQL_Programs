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
-- Alter is modify the structure of an existing table 
ALTER TABLE Student MODIFY mobile_number VARCHAR(15);
-- Can we add new column in existing table - YES, Using ALTER Command
-- Now i rename the column name using ALTER RENAME Command
ALTER TABLE Student RENAME COLUMN mobile_number TO phone_number; 
ALTER TABLE Student ADD blood_group VARCHAR(10); 
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
        
    
