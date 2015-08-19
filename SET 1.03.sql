/* 
	Purpose		: Create a single SQL SELECT statement displaying 5 new columns from tblMLS 
	Author		: Renu Thomas
	Date		: 03/20/2015
	File Name	: SET 1.03.sql

*/


SELECT 
	A.*,
	CONVERT(varchar, CONVERT(money,A.ListPrice), 1) AS 'ListPrice_Formatted' ,
	ROUND(B.Average,0) AS 'AvgZipListPrice',
	SUBSTRING(REPLACE(A.Address,'-',' '),0,CHARINDEX(' ', REPLACE(A.Address,'-',' '))) AS 'Street_Number',
	SUBSTRING(REPLACE(A.Address,'-',' '),
			CHARINDEX(' ',REPLACE(A.Address,'-',' '))+1,
			LEN(A.Address+' ')-
			(LEN(SUBSTRING(REPLACE(A.Address+' ','-',' '),0,CHARINDEX(' ', REPLACE(A.Address+' ','-',' '))))+1	+
			LEN(SUBSTRING(REPLACE(A.Address+' ','-',' '), CHARINDEX(' ',REPLACE(A.Address+' ','-',' '),
				CHARINDEX(' ',REPLACE(A.Address+' ','-',' '))+1) ,len(A.Address+' '))))) AS 'StreetName' ,
	CASE 
		WHEN CHARINDEX(' ', REPLACE(A.Address,'-',' '))<CHARINDEX(' ',REVERSE(REPLACE(A.Address,'-',' ')))
		THEN ''
		ELSE RIGHT(REPLACE(A.Address,'-',' '),CHARINDEX(' ',REVERSE(REPLACE(A.Address,'-',' '))))
	END AS 'PostFix'
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


