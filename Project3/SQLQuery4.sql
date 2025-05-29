USE master;
GO

CREATE SERVER AUDIT Project3Audit
TO FILE (
	FILEPATH = 'C:\Users\Melisa\Desktop\mssql-projects-3-4\mssqldbProjects\Project3\AuditLogs\',
	MAXSIZE = 10 MB,
	MAX_ROLLOVER_FILES = 10,
	RESERVE_DISK_SPACE = OFF
)
WITH (
	QUEUE_DELAY = 1000,
	ON_FAILURE = CONTINUE
);
GO

ALTER SERVER AUDIT project3Audit --activate audit
WITH (STATE = ON);
GO