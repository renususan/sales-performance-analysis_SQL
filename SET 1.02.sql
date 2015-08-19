/* 
	Purpose		: Write a single SQL statement to provide the MLS (Address) where home list price is equal or above the average list price 
				  within home's zip code.. 
	
	Author		: Renu Thomas
	Date		: 03/20/2015
	File Name	: SET 1.02.sql

*/


/*
	Computationally, this method is more efficient ,
	because the subquery reduces the number of records to be compared by aggregating over ZipCode
*/

SELECT 
	  A.*
FROM ##tblMLS  A
INNER JOIN 
(
	SELECT 
			ZipCode,
			AVG(ListPrice) AS "Average" 
	FROM ##tblMLS   
	GROUP BY ZipCode
) B
ON A.ZipCode=B.ZipCode
WHERE A.ListPrice>=B.Average
ORDER BY 1







