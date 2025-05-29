CREATE PROCEDURE DropTableSafely
    @TableName NVARCHAR(128),
    @DropColumns BIT = 1,     -- 1: kolonları sil, 0: silme
    @DropTable BIT = 1        -- 1: tabloyu sil, 0: sadece kolonları kaldır
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @SQL NVARCHAR(MAX);
    DECLARE @ConstraintName NVARCHAR(128);
    DECLARE @ColumnName NVARCHAR(128);

    PRINT '🔎 Başlatılıyor: ' + @TableName;

    -- Step 1: DROP CHECK constraints
    DECLARE cur_constraints CURSOR FOR
    SELECT name
    FROM sys.check_constraints
    WHERE parent_object_id = OBJECT_ID(@TableName);

    OPEN cur_constraints;
    FETCH NEXT FROM cur_constraints INTO @ConstraintName;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @SQL = 'ALTER TABLE ' + QUOTENAME(@TableName) + ' DROP CONSTRAINT ' + QUOTENAME(@ConstraintName);
        EXEC sp_executesql @SQL;

        PRINT '✔️ Constraint silindi: ' + @ConstraintName;

        FETCH NEXT FROM cur_constraints INTO @ConstraintName;
    END

    CLOSE cur_constraints;
    DEALLOCATE cur_constraints;

    -- Step 2: DROP columns
    IF @DropColumns = 1
    BEGIN
        DECLARE cur_columns CURSOR FOR
        SELECT name
        FROM sys.columns
        WHERE object_id = OBJECT_ID(@TableName)
            AND is_identity = 0; -- İstersen is_primary_key kontrolü de ekleyebiliriz

        OPEN cur_columns;
        FETCH NEXT FROM cur_columns INTO @ColumnName;

        WHILE @@FETCH_STATUS = 0
        BEGIN
            SET @SQL = 'ALTER TABLE ' + QUOTENAME(@TableName) + ' DROP COLUMN ' + QUOTENAME(@ColumnName);
            BEGIN TRY
                EXEC sp_executesql @SQL;
                PRINT '✔️ Kolon silindi: ' + @ColumnName;
            END TRY
            BEGIN CATCH
                PRINT '⚠️ Kolon silinemedi: ' + @ColumnName + ' (' + ERROR_MESSAGE() + ')';
            END CATCH;

            FETCH NEXT FROM cur_columns INTO @ColumnName;
        END

        CLOSE cur_columns;
        DEALLOCATE cur_columns;
    END

    -- Step 3: DROP table
    IF @DropTable = 1
    BEGIN
        SET @SQL = 'DROP TABLE ' + QUOTENAME(@TableName);
        BEGIN TRY
            EXEC sp_executesql @SQL;
            PRINT '🗑️ Tablo silindi: ' + @TableName;
        END TRY
        BEGIN CATCH
            PRINT '❌ Tablo silinemedi: ' + @TableName + ' (' + ERROR_MESSAGE() + ')';
        END CATCH;
    END
END;
