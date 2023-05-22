SELECT 
CONCAT(de.FirstName, ' ', de.LastName) AS EmployeeName,
ISNULL(de.Title,'UNKWN') AS EmployeeTitle,
ISNULL(dc.CurrencyName,'UNKWN') AS Currency,
ISNULL(SUM(fs.SalesAmount),0) AS TotalSalesAmount

FROM DimEmployee as de
    RIGHT JOIN FactResellerSales AS fs
    ON fs.EmployeeKey = de.EmployeeKey
   RIGHT JOIN DimSalesTerritory AS ds 
    ON fs.SalesTerritoryKey = ds.SalesTerritoryKey
   RIGHT JOIN DimCurrency AS dc
    ON dc.CurrencyKey = fs.CurrencyKey

 WHERE ds.SalesTerritoryGroup = N'Europe' AND de.[status] = N'Current'
 GROUP BY de.FirstName,de.LastName,de.Title,dc.CurrencyName
ORDER BY EmployeeName, TotalSalesAmount DESC
 