--code using LIKE

SELECT
EnglishProductName,
ReOrderPoint,
SafetyStockLevel,
CAST(ReOrderPoint AS DECIMAL(8,4)) AS CastReOrderPoint,
CAST(SafetyStockLevel AS DECIMAL(8,4)) AS CastSafetyStockLevel

FROM DimProduct
WHERE EnglishProductName LIKE 'B%'