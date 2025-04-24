
DROP TABLE PlaylistTrack; --- hasar verildi ---

--- tam yedekleme ile kurtarma ---
USE master;

RESTORE DATABASE Chinook
FROM DISK = 'C:\Backup\Chinook_Full_Backup.bak'
WITH REPLACE 

--- dosya kaydedilip db'den cikildiktan ve master'a gecildikten sonra restorasyon islemi tamamlanir ---
--- neden, cunku mevcut db ustunde islem yapmaya devam ederken replace komutu calismamakta ---