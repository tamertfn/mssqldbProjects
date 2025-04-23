USE master;
GO

-- Login'leri oluşturma
CREATE LOGIN test_user1 WITH PASSWORD = 'Test123!';
CREATE LOGIN test_user2 WITH PASSWORD = 'Test123!';
GO

USE PerformanceTestDB;
GO

-- Database kullanıcılarını oluşturma
CREATE USER test_user1 FOR LOGIN test_user1;
CREATE USER test_user2 FOR LOGIN test_user2;
GO

-- test_user1'e Orders tablosunu görüntüleme yetkisi verme
GRANT SELECT ON dbo.Orders TO test_user1;

-- test_user2'den Orders tablosunu görüntüleme yetkisini engelleme
DENY SELECT ON dbo.Orders TO test_user2;