/* 
	Purpose		: Create a SQL file that will create the tblMLS table and populate its data as shown below.  
				  Design the SQL script so that I can re-run this SQL file multiple times in the same session without causing duplicates.  
				  In otherwords the file should be able reset itself and allow me to re-create this table everytime the entire script is run. 
	
	Author		: Renu Thomas
	Date		: 03/20/2015
	File Name	: SET 1.01.sql

*/


DROP TABLE ##tblMLS

CREATE TABLE ##tblMLS
(
	MLS INT,
	Address VARCHAR(100), 
	ListPrice FLOAT,
	ZipCode VARCHAR(5)
);

INSERT INTO ##tblMLS VALUES (10001,'512 Florin  Rd',500000,'95112');
INSERT INTO ##tblMLS VALUES (10002,'622 Shorewood Rd',578000,'95112');
INSERT INTO ##tblMLS VALUES (10003,'84 Curve Rd',600000,'95112');
INSERT INTO ##tblMLS VALUES (10004,'21  Niner Rd',590000,'95112');
INSERT INTO ##tblMLS VALUES (10005,'54 Inflection',691000,'95112');
INSERT INTO ##tblMLS VALUES (10006,'99 Staples',241000,'95113');
INSERT INTO ##tblMLS VALUES (10007,'10-Hotwater Ln',339000,'95113');
INSERT INTO ##tblMLS VALUES (10008,'4115 University Rd',700000,'95113');
INSERT INTO ##tblMLS VALUES (10009,'100-Windflow Ct',305000,'95114');


SELECT * 
FROM ##tblMLS;
