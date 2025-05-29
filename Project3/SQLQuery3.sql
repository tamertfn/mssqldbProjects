USE project3db;
GO

-- db encryption key olusturuldu
CREATE DATABASE ENCRYPTION KEY
WITH ALGORITHM = AES_256
ENCRYPTION BY SERVER CERTIFICATE Project3Certificate;
GO

-- key enabled hale getirildi
ALTER DATABASE project3db
SET ENCRYPTION ON;
GO

-- testing purposes only
SELECT name, is_encrypted
FROM sys.databases
WHERE name = 'project3db'