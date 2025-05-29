USE project3db;
GO

CREATE DATABASE AUDIT SPECIFICATION Project3AuditSpec -- user1in hangi hareketleri izleyecegini tanimlar
FOR SERVER AUDIT Project3Audit
ADD (SELECT ON DATABASE::project3db BY user1),
ADD (INSERT ON DATABASE::project3db BY user1)
WITH (STATE = ON);
GO