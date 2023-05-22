# Sql_basic_query-with-inner-join
an SQL query displaying how to write an sql code using an inner join

*I first begin by joining the Fact internet sales table to the customer dimension table using the customer key column, then proceed to joinning the currency dimension table to the fact table using the CurrencyKey column.

*using the where function i would like to return all rows where the currency name is US Dollar then group them by firstname, lastname ,email and currency.

*Using the Top function in conjunction with an orderby statement i return 100 rows with the most sales

```sql
SELECT TOP(100)
CONCAT(Dc.FirstName,' ',Dc.LastName) AS CustomerName,
Dc.EmailAddress,
SUM(Fs.SalesAmnt) AS SalesAmount,
FROM FactInternetSales AS Fs
	INNER JOIN Dim.Customer AS Dc
	ON Fs.customerKey = Dc.CustomerKey
	INNER JOIN DimCurrency AS dcy
	ON Fs.CurrencyKey = dcy.CurrencyKey
WHERE dcy.CurrencyName = N'US DOLLAR'	
	
GROUP BY Dc.FirstName,Dc.LastName,EmailAddress--,dcy.CurrencyName
ORDER BY SalesAmount DESC	
