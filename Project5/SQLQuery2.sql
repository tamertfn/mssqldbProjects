-- Musteriler
INSERT INTO Musteriler VALUES
(1, 'Ahmet', 'Yılmaz', 'ahmet@example.com', '2023-01-10'),
(2, 'Mehmet', 'Demir', NULL, '2023-02-15'), -- Eksik email
(3, 'Ayşe', 'Yıldız', 'ayseyildiz.com', '2023-03-20'), -- Yanlış formatta email
(4, 'Zeynep', 'Kaya', 'zeynep@example.com', NULL); -- Eksik kayıt tarihi

-- Urunler
INSERT INTO Urunler VALUES
(1, 'Laptop', 15000.00, 'TRY'),
(2, 'Telefon', 850.00, 'USD'),
(3, 'Klavye', NULL, 'USD'), -- Eksik fiyat
(4, 'Mouse', 20.00, NULL); -- Eksik para birimi

-- Siparisler
INSERT INTO Siparisler VALUES
(1, 1, 1, '2023-04-01', 1),
(2, 2, 2, '2023-04-03', 2),
(3, 3, 3, '2023-04-05', 1),
(4, 4, 4, NULL, 1); -- Eksik sipariş tarihi
