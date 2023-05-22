--SQLCode Using CONCAT CASE AND

SELECT
CONCAT(FirstName,' ', LastName) AS CustomerName,
EmailAddress AS Email,
--NumberCarsOwned,
--HouseOwnerFlag,
CASE
    WHEN NumberCarsOwned BETWEEN 2 AND 3 THEN '2-3'
    WHEN NumberCarsOwned > = 4 THEN '4+'
    ELSE 'UNKWN'
END AS NumberOfCarsOwned

FROM DimCustomer
WHERE NumberCarsOwned > = 2 AND HouseOwnerFlag = 1