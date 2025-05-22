INSERT INTO RaporSiparisler (
    SiparisID,
    MusteriAdSoyad,
    UrunAdi,
    Adet,
    SiparisTarihi,
    BirimFiyatTL,
    ToplamTutarTL
)
SELECT 
    s.SiparisID,
    m.TamAd,
    u.UrunAdi,
    s.Adet,
    s.SiparisTarihi_ISO,
    u.FiyatTL,
    u.FiyatTL * s.Adet
FROM TemizSiparisler s
JOIN TemizMusteriler m ON s.MusteriID = m.MusteriID
JOIN TemizUrunler u ON s.UrunID = u.UrunID;
