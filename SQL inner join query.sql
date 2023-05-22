SELECT TOP(100)
CONCAT(Dc.FirstName,' ',Dc.LastName) AS CustomerName,
Dc.EmailAddress,
SUM(Fs.SalesAmnt) AS SalesAmount,
--dcy.currencyName AS Currency
FROM FactInternetSales AS Fs
	INNER JOIN Dim.Customer AS Dc
	ON Fs.customerKey = Dc.CustomerKey
	INNER JOIN DimCurrency AS dcy
	ON Fs.CurrencyKey = dcy.CurrencyKey
WHERE dcy.CurrencyName = N'US DOLLAR'	
	
GROUP BY Dc.FirstName,Dc.LastName,EmailAddress--,dcy.CurrencyName
--HAVING dcy.CurrencyName = N'US DOLLAR'
ORDER BY SalesAmount DESC	