USE BackupMonitor;
GO

CREATE PROCEDURE LogBackupOperation
    @DatabaseName NVARCHAR(255),
    @BackupType NVARCHAR(50),
    @BackupPath NVARCHAR(1000),
    @Status NVARCHAR(50),
    @ErrorMessage NVARCHAR(MAX) = NULL
AS
BEGIN
    INSERT INTO BackupLog (
        DatabaseName, 
        BackupType, 
        BackupStart, 
        BackupFinish, 
        BackupPath, 
        Status, 
        ErrorMessage
    )
    VALUES (
        @DatabaseName,
        @BackupType,
        GETDATE(),
        GETDATE(),
        @BackupPath,
        @Status,
        @ErrorMessage
    );
END
GO