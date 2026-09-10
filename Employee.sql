USE sql_practice;
CREATE TABLE Employee(ID INT PRIMARY KEY, Name VARCHAR(100),Department VARCHAR(50), Salary VARCHAR(20), Age VARCHAR(5), 
						City VARCHAR(20), Email VARCHAR(100), Phone_Number VARCHAR(15), Joining_Date DATE);
SELECT * FROM Employee;
ALTER TABLE Employee MODIFY COLUMN Salary INT;
UPDATE Employee SET Salary = CASE ID
							WHEN 102 THEN 150000
                            WHEN 106 THEN 145000
                            WHEN 111 THEN 100000
                            END
                            WHERE ID IN (102, 106, 111);
INSERT INTO Employee VALUES(101, "Biradar Sudharani", "Development", 90000, 24, "Pune", "sudha@gmail.com", "7709298002", "2025-09-04"),
							(102, "Biradar Shankar", "Project Manager", 115000, 28, "Benglore","shankar@gmail.com", "9686171763", "2022-02-09"),
                            (103, "Biradar Srushti", "Testing", 30000, 23, "Pune", "srushti@gmail.com", "7709298003", "2023-05-04"),
							(104, "Biradar Ambika", "Development", 25000, 22, "Benglore", "ambika@gmail.com", "9686171764", "2022-02-09"),
                            (105, "Biradar Darshan", "Testing", 20000, 21, "Pune", "darshan@gmail.com", "7609298002", "2023-09-04"),
							(106, "Biradar Sachin", "Develoment", 110000, 24, "Pune", "sachin@gmail.com", "7620750308", "2025-09-04"),
                            (107, "Biradar Sagar", "Development", 90000, 23, "Pune", "sagar@gmail.com", "7709297002", "2026-09-04"),
							(108, "Biradar Akshay", "Testing", 41000, 32, "Benglore", "akshay@gmail.com", "9686181863", "2024-02-09"),
                            (109, "Biradar Anusha", "HR", 24000, 26, "Pune", "anusha@gmail.com", "7709298082", "2022-09-04"),
							(110, "Biradar Ashwini", "HR", 25000, 28, "Mumbai", "ashwini@gmail.com", "7786171763", "2022-02-09"),
                            (111, "Biradar Vinod", "Project Manager", 105000, 31, "Pune", "vinod@gmail.com", "9109298002", "2023-09-04"),
							(112, "Biradar Vidhya", "Development", 70000, 27, "Mumbai", "vidhya@gmail.com", "8686171763", "2026-02-09"),
                            (113, "Biradar Varsha", "HR", 30000, 23, "Pune", "varsha@gmail.com", "7509298002", "2026-09-04"),
							(114, "Biradar Shravani", "Testing", 50000, 22, "Vijaypur", "shravani@gmail.com", "9386171763", "2026-02-09"),
                            (115, "Biradar Tanushri", "Development", 80000, 21, "Pune", "tanushri@gmail.com", "7039298002", "2025-09-04"),
							(116, "Biradar Ganesh", "Testing", 30000, 24, "Vijaypur", "ganesh@gmail.com", "9656171763", "2025-02-09"),
                            (117, "Biradar Pooja", "HR", 15000, 26, "Pune", "pooja@gmail.com", "7709293006", "2023-09-04"),
							(118, "Biradar Pushpa", "HR", 31000, 30, "Mumbai", "pushpa@gmail.com", "9686174000", "2022-02-09"),
                            (119, "Biradar Basavraj", "Development", 65000, 29, "Pune", "basavraj@gmail.com", "7709298000", "2022-09-04"),
							(120, "Biradar Mahantesh", "Testing", 45000, 27, "Mumbai", "mahantesh@gmail.com", "9373029933", "2022-02-09");
-- 1. Find the second highest salary from the Employee table.
SELECT MAX(Salary) AS SecondHighestSalary FROM Employee WHERE Salary < ( SELECT MAX(Salary) FROM Employee );

-- Using ORDER BY + LIMIT OFFSET 
SELECT DISTINCT Salary AS SecondHighest FROM Employee ORDER BY Salary DESC LIMIT 1 OFFSET 1;

-- Using LIMIT with 2 rows 
SELECT Salary AS SecondHighest FROM ( SELECT DISTINCT Salary FROM Employee ORDER BY Salary DESC LIMIT 2 ) AS Temp ORDER BY Salary ASC LIMIT 1;

-- Using DENSE_RANK (Best for duplicates modern method)
 SELECT Salary AS SecondHighest FROM (SELECT Salary, DENSE_RANK() OVER ( ORDER BY Salary DESC ) AS rnk FROM Employee) AS Ranked WHERE rnk = 2 LIMIT 1;
 
 -- Using ROW_NUMBER Window Function
 SELECT Salary AS SecondHighest FROM (SELECT DISTINCT Salary, ROW_NUMBER() OVER (ORDER BY Salary DESC) AS rn FROM Employee) AS T WHERE rn = 2;
 
 -- Using NOT IN 
 SELECT Salary AS SecondHighest FROM Employee WHERE Salary NOT IN (SELECT MAX(Salary) FROM Employee);
 
 -- Using Self Join / Correlated Subquerry
 SELECT MAX(E1.Salary) AS SecondHighest FROM Employee E1 WHERE E1.Salary < (SELECT MAX(E2.Salary) FROM Employee E2); -- OR
 SELECT MAX(e1.Salary) AS SecondHighest FROM Employee e1, Employee e2 WHERE e1.salary < e2.Salary;
 
 -- USING CTE (WITH Clause) 
 WITH RankedSalary AS (SELECT Salary, DENSE_RANK() OVER (ORDER BY Salary DESC) AS rnk FROM Employee) SELECT Salary AS SecondHighest FROM RankedSalary WHERE rnk = 2 LIMIT 1;
 

SELECT MAX(Salary) FROM Employee;