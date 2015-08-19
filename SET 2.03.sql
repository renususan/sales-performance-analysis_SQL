/* 
	Purpose		: Find me all rows where ProuctName contains a  'background' or 'Verification' and are both transacted prior to 2/1/2015.
				  Create a SQL file for this solution
	Author		: Renu Thomas
	Date		: 03/20/2015
	File Name	: SET 2.03.sql

*/

SELECT * 
FROM ##tblSales 
WHERE 
(
	LOWER(ProductName) LIKE '%background%' 
	OR 
	LOWER(ProductName) LIKE '%verification%'
)
AND 
CAST(TransactionDateStamp AS DATE)< CAST('2/1/2015' AS DATE)
ORDER BY OrderID;
