-- Fragmentasyona göre indeks bakımı
IF EXISTS (SELECT name FROM sys.procedures WHERE name = 'sp_IndexMaintenance')
    DROP PROCEDURE sp_IndexMaintenance;
GO

CREATE PROCEDURE sp_IndexMaintenance
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @TableName NVARCHAR(255)
    DECLARE @IndexName NVARCHAR(255)
    DECLARE @Fragmentation FLOAT

    DECLARE index_cursor CURSOR FOR
    SELECT 
        OBJECT_NAME(ips.object_id) AS TableName,
        i.name AS IndexName,
        ips.avg_fragmentation_in_percent
    FROM sys.dm_db_index_physical_stats(
        DB_ID('PerformanceTestDB'), NULL, NULL, NULL, 'LIMITED') ips
    JOIN sys.indexes i ON ips.object_id = i.object_id 
        AND ips.index_id = i.index_id
    WHERE ips.avg_fragmentation_in_percent > 5;

    OPEN index_cursor;
    FETCH NEXT FROM index_cursor INTO @TableName, @IndexName, @Fragmentation;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        IF @Fragmentation > 30
            EXEC('ALTER INDEX ' + @IndexName + ' ON ' + @TableName + ' REBUILD;')
        ELSE IF @Fragmentation > 5
            EXEC('ALTER INDEX ' + @IndexName + ' ON ' + @TableName + ' REORGANIZE;')

        FETCH NEXT FROM index_cursor INTO @TableName, @IndexName, @Fragmentation;
    END

    CLOSE index_cursor;
    DEALLOCATE index_cursor;
END;
GO