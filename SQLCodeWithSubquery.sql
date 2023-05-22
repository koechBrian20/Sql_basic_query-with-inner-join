--SQLCode with Subquery

SELECT
dac.AccountDescription AS Account,
ROUND(sum(fs.Amount),4) AS Amnt,
		ROUND(SUM(fs.Amount)/(SELECT SUM(fs.Amount) FROM FactFinance AS fs
			INNER JOIN DimOrganization AS do
			ON fs.OrganizationKey = do.OrganizationKey
			INNER JOIN DimAccount AS dac
			ON dac.AccountKey = fs.AccountKey
			INNER JOIN DimScenario AS ds
			ON fs.ScenarioKey = ds.ScenarioKey
			INNER JOIN DimDate AS dd
			ON fs.DateKey = dd.DateKey  

		 WHERE ScenarioName = N'Actual'
			AND CalendarYear = 2013
			AND OrganizationName = N'Canadian Division'   
			AND AccountType = N'Expenditures'),4) AS PCTofTotal

FROM FactFinance AS fs
    INNER JOIN DimOrganization AS do
    ON fs.OrganizationKey = do.OrganizationKey
    INNER JOIN DimAccount AS dac
    ON dac.AccountKey = fs.AccountKey
    INNER JOIN DimScenario AS ds
    ON fs.ScenarioKey = ds.ScenarioKey
    INNER JOIN DimDate AS dd
    ON fs.DateKey = dd.DateKey  

 WHERE ScenarioName = N'Actual'
    AND CalendarYear = 2013
    AND OrganizationName = N'Canadian Division'   
    AND AccountType = N'Expenditures'

GROUP BY dac.AccountDescription    

 ORDER BY Amnt DESC   