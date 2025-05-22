SELECT * FROM Musteriler WHERE Email IS NULL;

SELECT * FROM Musteriler WHERE Email IS NOT NULL AND Email NOT LIKE '%@%.%';

SELECT * FROM Musteriler WHERE KayitTarihi IS NULL;

SELECT * FROM Urunler WHERE Fiyat IS NULL OR ParaBirimi IS NULL;

SELECT * FROM Siparisler WHERE SiparisTarihi IS NULL;
