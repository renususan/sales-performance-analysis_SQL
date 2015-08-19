
/* 
	Purpose		: Find me all rows where ProductName contains a 'background' in its name.   
				  Create a SQL file for this solution
	Author		: Renu Thomas
	Date		: 03/20/2015
	File Name	: SET 2.02.sql

*/

SELECT * 
FROM ##tblSales 
WHERE LOWER(ProductName) LIKE '%background%'
