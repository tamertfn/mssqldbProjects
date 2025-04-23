-- İstatistikleri açalım
SET STATISTICS IO ON;
SET STATISTICS TIME ON;

SET STATISTICS PROFILE ON;

-- Belirli koşullara göre sipariş arama
SELECT 
    OrderID,
    OrderDate,
    OrderAmount,
    ShipCity,
    ShipCountry
FROM Orders WITH(INDEX(IX_Orders_Status_Amount_Country))
WHERE 
    Status = 'Delivered'
    AND OrderAmount > 5000
    AND ShipCountry LIKE 'Country 1%'
ORDER BY OrderDate DESC;

--Çoklu koşullar için optimize indeks
--CREATE NONCLUSTERED INDEX IX_Orders_Status_Amount_Country
--ON Orders(Status, OrderAmount, ShipCountry)
--INCLUDE (OrderDate, OrderID, ShipCity);