USE project3db;
GO

CREATE TABLE TestTablo ( --test edebilmek icin hizlica basit bi tablo olusturuyoruz (user1 olarak degil, admin olarak)
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Ad NVARCHAR(50),
    Soyad NVARCHAR(50)
);
GO

-- user1'e gecip test ediyoruz

-- INSERT testi
INSERT INTO TestTablo (Ad, Soyad)
VALUES ('Melisa', 'Test');

-- SELECT testi
SELECT * FROM TestTablo;


-- asagidaki sorgu tum loglari gotuntuler. toplam 103 kayit alýnmistir:
SELECT *
FROM sys.fn_get_audit_file('C:\Users\Melisa\Desktop\mssql-projects-3-4\mssqldbProjects\Project3\AuditLogs\Project3Audit_*.sqlaudit', DEFAULT, DEFAULT);