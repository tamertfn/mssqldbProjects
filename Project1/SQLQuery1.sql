CREATE DATABASE PerformanceTestDB;
GO

USE PerformanceTestDB;
GO

CREATE TABLE Orders (
    OrderID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT,
    OrderDate DATETIME,
    OrderAmount DECIMAL(18,2),
    ShipCity NVARCHAR(100),
    ShipCountry NVARCHAR(100),
    ProductID INT,
    Quantity INT,
    Status NVARCHAR(20),
    LastModifiedDate DATETIME DEFAULT GETDATE()
);
GO