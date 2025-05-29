USE master;
GO

CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'master123'; --create master key
GO

CREATE CERTIFICATE Project3Certificate
WITH SUBJECT = 'TDE Sertifikasý - Project 3';
GO