-- Tarih aralığında ülkelere göre sipariş analizi
SELECT 
    ShipCountry,
    COUNT(*) as TotalOrders,
    SUM(OrderAmount) as TotalAmount,
    AVG(OrderAmount) as AvgOrderAmount
FROM Orders
WHERE OrderDate >= DATEADD(MONTH, -6, GETDATE())
GROUP BY ShipCountry
ORDER BY TotalAmount DESC;

-- Bileşik indeks oluşturma
--CREATE NONCLUSTERED INDEX IX_Orders_OrderDate_ShipCountry
--ON Orders(OrderDate, ShipCountry)
--INCLUDE (OrderAmount);

--UPDATE STATISTICS Orders WITH FULLSCAN;