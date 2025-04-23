USE msdb;
GO

IF EXISTS (SELECT job_id FROM msdb.dbo.sysjobs WHERE name = N'AdventureWorks_FullBackup')
    EXEC msdb.dbo.sp_delete_job @job_name = N'AdventureWorks_FullBackup';
GO

EXEC dbo.sp_add_job
    @job_name = N'AdventureWorks_FullBackup',
    @enabled = 1,
    @description = N'Weekly full backup of AdventureWorks database';
GO

EXEC sp_add_jobstep
    @job_name = N'AdventureWorks_FullBackup',
    @step_name = N'Execute Full Backup',
    @subsystem = N'TSQL',
    @command = N'
DECLARE @BackupPath nvarchar(500)
SET @BackupPath = N''C:\SQLBackups\AdventureWorks\AW_Full_'' + CONVERT(nvarchar(20), GETDATE(), 112) + ''.bak''

BACKUP DATABASE [AdventureWorks2022] 
TO DISK = @BackupPath
WITH COMPRESSION, INIT, STATS = 10;

INSERT INTO BackupMonitor.dbo.BackupLog 
(DatabaseName, BackupType, BackupStart, BackupFinish, BackupPath, Status)
VALUES 
(''AdventureWorks2022'', ''Full'', GETDATE(), GETDATE(), @BackupPath, ''Success'');',
    @database_name = N'master';
GO

EXEC dbo.sp_add_schedule
    @schedule_name = N'WeeklyFullBackup',
    @freq_type = 8,
    @freq_interval = 1,
    @freq_recurrence_factor = 1,
    @active_start_time = 000000;
GO

EXEC sp_attach_schedule
    @job_name = N'AdventureWorks_FullBackup',
    @schedule_name = N'WeeklyFullBackup';
GO

EXEC dbo.sp_add_jobserver
    @job_name = N'AdventureWorks_FullBackup',
    @server_name = N'(local)';
GO