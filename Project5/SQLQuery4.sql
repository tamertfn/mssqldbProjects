SELECT * INTO TemizMusteriler FROM Musteriler WHERE 1=0;

INSERT INTO TemizMusteriler
SELECT * FROM Musteriler
WHERE Email IS NOT NULL AND Email LIKE '%@%.%' AND KayitTarihi IS NOT NULL;

SELECT * INTO TemizUrunler FROM Urunler WHERE 1=0;

INSERT INTO TemizUrunler
SELECT * FROM Urunler
WHERE Fiyat IS NOT NULL AND ParaBirimi IS NOT NULL;

SELECT * INTO TemizSiparisler FROM Siparisler WHERE 1 = 0;

INSERT INTO TemizSiparisler
SELECT s.*
FROM Siparisler s
JOIN TemizMusteriler m ON s.MusteriID = m.MusteriID
JOIN TemizUrunler u ON s.UrunID = u.UrunID
WHERE s.SiparisTarihi IS NOT NULL;




