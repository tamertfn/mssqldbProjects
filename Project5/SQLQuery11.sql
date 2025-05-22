SELECT
    (SELECT COUNT(*) FROM Musteriler) AS ToplamMusteri,
    (SELECT COUNT(*) FROM TemizMusteriler) AS TemizMusteri,
    (SELECT COUNT(*) FROM Musteriler) - (SELECT COUNT(*) FROM TemizMusteriler) AS HataliMusteri;

SELECT
    (SELECT COUNT(*) FROM Urunler) AS ToplamUrun,
    (SELECT COUNT(*) FROM TemizUrunler) AS TemizUrun,
    (SELECT COUNT(*) FROM Urunler) - (SELECT COUNT(*) FROM TemizUrunler) AS HataliUrun;

SELECT
    (SELECT COUNT(*) FROM Siparisler) AS ToplamSiparis,
    (SELECT COUNT(*) FROM TemizSiparisler) AS TemizSiparis,
    (SELECT COUNT(*) FROM Siparisler) - (SELECT COUNT(*) FROM TemizSiparisler) AS HataliSiparis;

SELECT
    CAST(COUNT(*) AS FLOAT) AS Toplam,
    CAST(SUM(CASE WHEN Email IS NOT NULL AND Email LIKE '%@%.%' AND KayitTarihi IS NOT NULL THEN 1 ELSE 0 END) AS FLOAT) AS Temiz,
    ROUND(100.0 * SUM(CASE WHEN Email IS NOT NULL AND Email LIKE '%@%.%' AND KayitTarihi IS NOT NULL THEN 1 ELSE 0 END) / COUNT(*), 2) AS TemizlikOraniYuzde
FROM Musteriler;
