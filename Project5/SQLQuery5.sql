SELECT COUNT(*) AS TemizMusteriSayisi FROM TemizMusteriler;
SELECT COUNT(*) AS TemizUrunSayisi FROM TemizUrunler;
SELECT COUNT(*) AS TemizSiparisSayisi FROM TemizSiparisler;

SELECT 
    (SELECT COUNT(*) FROM Musteriler) AS Toplam,
    (SELECT COUNT(*) FROM Musteriler WHERE Email IS NULL OR Email NOT LIKE '%@%.%' OR KayitTarihi IS NULL) AS Hatali;

SELECT 
    (SELECT COUNT(*) FROM Urunler) AS Toplam,
    (SELECT COUNT(*) FROM Urunler WHERE Fiyat IS NULL OR ParaBirimi IS NULL) AS Hatali;
