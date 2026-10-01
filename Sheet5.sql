-- In this sheet we learn some advance queries.
USE sql_practice;
/* Suppose you have:
Customers Table 
ID	Name
1	Sudha
2	Shankar
3	Sachi
Orders Table
Order_ID	Customer_ID
101	            1
102	            1
103	            2
Question - Write a query to display: Customer Name, Number of Orders, Even customers who haven't placed any orders.
           Hint: You'll need a LEFT JOIN with GROUP BY and COUNT().
*/  

CREATE TABLE Que1Customers(ID INT PRIMARY KEY, Name VARCHAR(50));
INSERT INTO Que1Customers VALUES(1, 'Sudha'), (2, 'Shankar'), (3, 'Sachi');
CREATE TABLE Que1Orders(Order_ID INT, Customers_ID INT);
INSERT INTO Que1Orders VALUES(101, 1), (102, 1), (103, 2);
SELECT c.Name AS CustomerNamr,
COUNT(o.Order_ID) AS NumberOfOrders 
FROM Que1Customers c 
LEFT JOIN Que1Orders o ON c.ID = o.Customers_ID
GROUP BY c.ID, c.Name
ORDER BY c.ID;

/* 2 - Employees Table
ID	Name	Project_ID
1	Sudha	101
2	Shankar	102
Projects Table
Project_ID	Project
101	        Smart Prep
102	        Hospital AI
103	        E-Commerce
Question - Display, Project Name, Employee Name, Even projects without employees.
           Hint: RIGHT JOIN (or swap the tables and use LEFT JOIN).
*/

CREATE TABLE Que2Emp(ID INT, Name VARCHAR(50), Project_ID INT);
INSERT INTO Que2Emp VALUES(1, 'Sudha', 101), (2, 'Shankar', 102);
CREATE TABLE Que2Project(Project_ID INT, Project_Name VARCHAR(100));
INSERT INTO Que2Project VALUES(101, 'Smart Prep'), (102, 'DNS'), (103, 'E-com');
SELECT p.Project_Name AS Project_Name,
e.Name AS Employee_Name
FROM Que2Project p
LEFT JOIN Que2Emp e ON p.Project_ID = e.Project_ID
ORDER BY p.Project_ID;
-- OR
SELECT p.Project_Name AS Project_Name, 
e.Name AS Emp_Name
FROM Que2Emp e
RIGHT JOIN Que2Project p ON e.Project_ID = p.Project_ID; 

/* 3 - Employee Table
Emp_ID	Name	  Manager_ID
1	   CEO	         NULL
2	   CTO	          1
3	   HR Head	      1
4	   Python Lead	  2
5	   Developer	  4
Question: Write a query to display:
Employee	Manager
CTO	        CEO
HR Head	    CEO
Python Lead	CTO
Developer	Python Lead
*/

CREATE TABLE Que3Emp(Emp_ID INT, Name VARCHAR(50), Manager_ID INT NULL);
ALTER TABLE Que3Emp modify Manager_ID VARCHAR(20) NULL;
INSERT INTO Que3Emp VALUES(1, 'CEO', NULL), (2, 'CTO', 1), (3, 'HR Head', 1), (4, 'Python Lead', 2), (5, 'Developer', 4);
SELECT e.Name AS Employee,
m.Name AS Manager
FROM Que3Emp e
INNER JOIN Que3Emp m ON e.Manager_ID = m.Emp_ID
ORDER BY e.Emp_ID;
-- OR
SELECT e.Name AS Employee,
m.Name AS Manager
FROM Que3Emp e
LEFT JOIN Que3Emp m ON e.Manager_ID = m.Emp_ID; 

/*4 - Employee Table
Name	Salary
A	    100
B	    90
C	    90
D	    80
What is the output?
SELECT
Name,
RANK() OVER(ORDER BY Salary DESC)
FROM Employee;

Answer
Name	Rank
A	     1
B	     2
C	     2
D	     4
*/

CREATE TABLE Que4(Name VARCHAR(50), Salary INT);
INSERT INTO Que4 VALUES('A', 100),('B', 90), ('C', 90), ('D', 80);
SELECT Name, RANK() OVER(ORDER BY Salary DESC) FROM Que4;