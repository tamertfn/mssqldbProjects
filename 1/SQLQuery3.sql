USE BackupMonitor;
GO

CREATE TABLE BackupLog (
    LogID INT IDENTITY(1,1) PRIMARY KEY,
    DatabaseName NVARCHAR(255),
    BackupType NVARCHAR(50),
    BackupStart DATETIME,
    BackupFinish DATETIME,
    BackupSize DECIMAL(18,2),
    BackupPath NVARCHAR(1000),
    Status NVARCHAR(50),
    ErrorMessage NVARCHAR(MAX)
);
GO