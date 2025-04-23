-- Test sorguları
USE PerformanceTestDB;
GO

-- Sorgu 1: Ağır bir GROUP BY sorgusu
SELECT 
    ShipCountry,
    COUNT(*) as OrderCount,
    AVG(OrderAmount) as AvgAmount,
    MAX(OrderDate) as LastOrder
FROM Orders
GROUP BY ShipCountry
ORDER BY OrderCount DESC;

-- Sorgu 2: JOIN işlemi
SELECT 
    o.OrderID,
    o.OrderDate,
    o.OrderAmount,
    COUNT(*) OVER (PARTITION BY o.ShipCountry) as CountryOrderCount
FROM Orders o
WHERE o.OrderAmount > 5000;

-- Sorgu 3: Yoğun CPU kullanan sorgu
SELECT 
    OrderID,
    OrderDate,
    OrderAmount,
    LAG(OrderAmount) OVER (ORDER BY OrderDate) as PrevAmount,
    LEAD(OrderAmount) OVER (ORDER BY OrderDate) as NextAmount
FROM Orders
WHERE DATEPART(YEAR, OrderDate) = 2024;