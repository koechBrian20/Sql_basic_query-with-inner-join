--sql code using multiple filters
SELECT
do.OrganizationName AS Organization,
dac.AccountDescription AS Account,
dac.AccountType AS AccountType,
SUM(fs.Amount) AS Amnt


FROM FactFinance AS fs
    INNER JOIN DimScenario AS ds
    ON fs.ScenarioKey = ds.ScenarioKey
    INNER JOIN DimOrganization AS do
    ON fs.OrganizationKey = do.OrganizationKey
    INNER JOIN DimAccount AS dac
    ON fs.AccountKey = dac.AccountKey 
    INNER JOIN DimDate AS dd
    ON fs.DateKey = dd.DateKey

 WHERE 
    dd.EnglishMonthName = N'January'
    AND dd.CalendarYear = 2011
    AND OrganizationName = N'SouthWest Division'
    AND AccountType = N'Expenditures'
    AND ScenarioName = N'Actual'
 GROUP BY do.OrganizationName, dac.AccountDescription, dac.AccountType