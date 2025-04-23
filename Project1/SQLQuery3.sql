-- 7. Prosedürü çalıştıralım (100,000 kayıt ekleyelim)
EXEC GenerateTestData 100000;
GO

-- 8. Kontrol edelim
SELECT COUNT(*) as TotalRecords FROM Orders;