UPDATE Ogrenciler
SET Email = 'ahmet.yilmaz@example.com', Cinsiyet = 'E'
WHERE OgrenciID = 1;

INSERT INTO OgretimUyeleri (Ad, Soyad, Unvan, BolumID)
VALUES ('Mehmet', 'Demir', 'Doç. Dr.', 1);

INSERT INTO DersOgretimUyesi (DersID, OgretimUyesiID)
VALUES (101, 1); -- varsayım: DersID 101, OgretimUyesiID 1

UPDATE Kayitlar
SET Notu = 85
WHERE KayitID = 1;

SELECT * FROM SchemaChangeLog ORDER BY EventDate DESC;

SELECT Email, Cinsiyet FROM Ogrenciler;
SELECT * FROM OgretimUyeleri;
SELECT * FROM DersOgretimUyesi;