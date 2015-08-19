/* 
	Purpose		: Create a SQL file that will temporarily create a Sales table that has following dimensions and metrics.  
				  Please make this SQL file re-runnable.  Meaning if I run it multiple times I should not have issues with duplicates or with table schema.  
				  Create a SQL file for this solution
	
	Author		: Renu Thomas
	Date		: 03/20/2015
	File Name	: SET 2.01.sql

*/

DROP TABLE ##tblSales

CREATE TABLE ##tblSales
(
	OrderID INT,
	ProductID VARCHAR(10), 
	ProductName VARCHAR(50),
	Amount FLOAT,
	TransactionDateStamp DATE,
	TransactionType VARCHAR(10)
);


INSERT INTO ##tblSales VALUES (1001,'P201','Background Rpt',10,'1/13/2015','Sale');
INSERT INTO ##tblSales VALUES (1002,'P201','Background Rpt',10,'2/1/2015','Sale');
INSERT INTO ##tblSales VALUES (1003,'P204','Employment Verification',410,'1/1/2015','Sale');
INSERT INTO ##tblSales VALUES (1004,'P203','Phone Number Lookup',23,'1/29/2015','Sale');
INSERT INTO ##tblSales VALUES (1005,'P210','Monthly credit monitor',211,'1/21/2015','Sale');

SELECT * FROM ##tblSales;
