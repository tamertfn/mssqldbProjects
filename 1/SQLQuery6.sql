USE msdb;
GO

EXEC dbo.sp_add_job
    @job_name = N'Backup_Monitoring_Report',
    @enabled = 1,
    @description = N'Daily backup monitoring report generation';

EXEC sp_add_jobstep
    @job_name = N'Backup_Monitoring_Report',
    @step_name = N'Run PowerShell Monitor',
    @subsystem = N'PowerShell',
    @command = N'C:\SQLBackups\Scripts\backup_monitor.ps1',
    @retry_attempts = 3,
    @retry_interval = 5;


EXEC dbo.sp_add_schedule
    @schedule_name = N'DailyBackupReport',
    @freq_type = 4,
    @freq_interval = 1,
    @active_start_time = 060000;

EXEC sp_attach_schedule
    @job_name = N'Backup_Monitoring_Report',
    @schedule_name = N'DailyBackupReport';