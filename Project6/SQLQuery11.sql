-- 1. Senaryo onceden alinan full backupin yeniden yuklenmesi
-- SSMS'te: Restore → Database → From Device → select .bak


-- 2. Senaryo manuel rollback script
EXEC DropTableSafely @TableName = 'DersOgretimUyesi';
EXEC DropTableSafely @TableName = 'OgretimUyeleri';

-- Email ve Cinsiyet kolonlarını kaldır, tabloyu silme
EXEC DropTableSafely @TableName = 'Ogrenciler', @DropColumns = 1, @DropTable = 0;

-- Notu kolonunu kaldır, tabloyu silme
EXEC DropTableSafely @TableName = 'Kayitlar', @DropColumns = 1, @DropTable = 0;

DELETE FROM DatabaseVersions WHERE MajorVersion = 2 AND MinorVersion = 0;

SELECT * FROM DatabaseVersions; -- kontrol

