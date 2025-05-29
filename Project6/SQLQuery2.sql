-- Bölümler
INSERT INTO Bolumler (BolumID, BolumAdi, FakulteAdi)
VALUES 
(1, 'Bilgisayar Mühendisliği', 'Mühendislik Fakültesi'),
(2, 'İşletme', 'İktisadi ve İdari Bilimler Fakültesi');

-- Dersler
INSERT INTO Dersler (DersID, DersAdi, Kredi, BolumID)
VALUES
(101, 'Veritabanı Sistemleri', 4, 1),
(102, 'Algoritmalar', 3, 1),
(201, 'İşletme Yönetimi', 3, 2);

-- Öğrenciler
INSERT INTO Ogrenciler (Ad, Soyad, TCNo, DogumTarihi)
VALUES
('Ahmet', 'Yılmaz', '12345678901', '2000-05-10'),
('Elif', 'Kaya', '98765432109', '2001-03-25');

-- Kayıtlar
INSERT INTO Kayitlar (OgrenciID, DersID, Yil, Donem)
VALUES
(1, 101, 2023, 'Guz'),
(1, 102, 2023, 'Guz'),
(2, 201, 2023, 'Bahar');
