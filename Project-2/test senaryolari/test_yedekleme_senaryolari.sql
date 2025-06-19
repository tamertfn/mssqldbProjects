--- creating test data ---
INSERT INTO Playlist (PlaylistId, Name)
VALUES (19, 'BackupTest_Playlist');

SELECT * FROM Playlist WHERE PlaylistId = 19;

--- backup islemi tamamlanir ---
BACKUP DATABASE Chinook
TO DISK = 'C:\Backup\Chinook_Test.bak'
WITH INIT;

--- Chinook'u test amaciyla siliyoruz ---
USE master;
GO
ALTER DATABASE Chinook SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
GO
DROP DATABASE Chinook

--- restorasyon islemi tamamlanir ---
RESTORE DATABASE Chinook
FROM DISK = 'C:\Backup\Chinook_Test.bak'
WITH REPLACE

--- Chinook'a geri donuyoruz ---
USE Chinook;
GO

SELECT * FROM Playlist; --- 19 ID'de test verisi gozukurse basarili yedekleme yapmisiz demektir ---
