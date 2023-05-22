SELECT
SalesOrderNumber,
sum(SalesAmount) AS [SalesAmount],
sum(TaxAmt) AS [TaxAmt],
OrderDate AS [date],
sum(OrderQuantity) AS [OrderQuantity],
SUM(SalesAmount) + SUM(TaxAmt) AS [invoice subtotal] 

FROM FactInternetSales
WHERE SalesTerritoryKey = 6
GROUP BY OrderDate, SalesOrderNumber
HAVING sum(SalesAmount) > 2500

ORDER BY SalesAmount DESC

OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY