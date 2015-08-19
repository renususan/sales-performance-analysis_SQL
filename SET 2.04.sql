/* 
	Purpose		: Each product is a monthly subscription product.  This means the order sales transaction is recurring. 
				  Assume that for all products, the maximum number of monthly renewals of a product is 3 times (3 months max) For each sales transaction.  
				  We must forecast the next two billings and what days they will occur on.  
				  The amount is always the original sales amount.  See example of  the end result.   
				  Imagine this table contains 3 million rows.  You are using the same table you created in problem 1  above.  
				  Create a SQL file for this solution

	Author		: Renu Thomas
	Date		: 03/20/2015
	File Name	: SET 2.04.sql

*/


SELECT 
		OrderID ,
		ProductID ,
		ProductName ,
		'$'+CONVERT(varchar, CONVERT(money,Amount), 1) AS "Amount"	,
		TransactionDateStamp ,
		TransactionType ,
		ROW_NUMBER() over (PARTITION BY OrderId,ProductID order by TransactionDateStamp )  as "Renewal_Number" 
FROM
(
	SELECT 
		OrderID , 
		ProductID , 
		ProductName , 
		Amount , 
		TransactionDateStamp , 
		TransactionType 
	FROM ##tblSales
	UNION ALL
	
	SELECT 
		OrderID , 
		ProductID , 
		ProductName , 
		Amount , 
		DATEADD(mm,1,TransactionDateStamp) , 
		TransactionType 
	FROM ##tblSales
	UNION ALL
	SELECT 
		OrderID , 
		ProductID , 
		ProductName , 
		Amount , 
		DATEADD(mm,2,TransactionDateStamp) , 
		TransactionType 
	FROM ##tblSales
) temp 
ORDER BY OrderID,ProductID
