BACKUP DATABASE Chinook
TO DISK = 'C:\Backup\Chinook_Full_Backup.bak';
--- tam yedekleme ---

BACKUP DATABASE Chinook
TO DISK = 'C:\Backup\Chinook_Full_Backup.bak';
WITH DIFFERENTIAL;
--- art�k yedekleme ---

BACKUP LOG Chinook
TO DISK = 'C:\Backup\Chinook_Full_Backup.bak';
--- fark yedekleme ---