USE PerformanceTestDB;
GO

CREATE OR ALTER PROCEDURE GenerateTestData
    @RecordCount INT
AS
BEGIN
    SET NOCOUNT ON;
    
    DECLARE @Counter INT = 1;
    DECLARE @StatusTypes TABLE (Status NVARCHAR(20));
    INSERT INTO @StatusTypes VALUES ('Pending'),('Processing'),('Shipped'),('Delivered'),('Cancelled');
    
    WHILE @Counter <= @RecordCount
    BEGIN
        INSERT INTO Orders (
            CustomerID, 
            OrderDate, 
            OrderAmount, 
            ShipCity, 
            ShipCountry, 
            ProductID, 
            Quantity,
            Status)
        SELECT 
            ABS(CHECKSUM(NEWID()) % 1000), -- Random CustomerID
            DATEADD(DAY, -ABS(CHECKSUM(NEWID()) % 1000), GETDATE()), -- Random Date
            ROUND(RAND() * 10000, 2), -- Random Amount
            'City ' + CAST(ABS(CHECKSUM(NEWID()) % 100) AS VARCHAR), -- Random City
            'Country ' + CAST(ABS(CHECKSUM(NEWID()) % 20) AS VARCHAR), -- Random Country
            ABS(CHECKSUM(NEWID()) % 100), -- Random ProductID
            ABS(CHECKSUM(NEWID()) % 100), -- Random Quantity
            (SELECT TOP 1 Status FROM @StatusTypes ORDER BY NEWID()); -- Random Status

        SET @Counter += 1;
        
        -- Her 10000 kayıtta bir ilerleme mesajı
        IF @Counter % 10000 = 0
            PRINT 'Inserted ' + CAST(@Counter AS VARCHAR) + ' records';
    END;
END;
GO