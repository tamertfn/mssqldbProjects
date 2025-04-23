USE master;
GO

IF EXISTS (SELECT name FROM sys.databases WHERE name = 'BackupMonitor')
BEGIN
    ALTER DATABASE BackupMonitor SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE BackupMonitor;
END
GO

-- Yeni db
CREATE DATABASE BackupMonitor;
GO