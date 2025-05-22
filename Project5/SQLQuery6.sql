ALTER TABLE TemizUrunler ADD FiyatTL DECIMAL(12,2);
GO

UPDATE TemizUrunler
SET FiyatTL = 
    CASE 
        WHEN ParaBirimi = 'USD' THEN Fiyat * 30
        WHEN ParaBirimi = 'TRY' THEN Fiyat
        ELSE NULL
    END;
GO

ALTER TABLE TemizMusteriler ADD TamAd NVARCHAR(100);
GO

UPDATE TemizMusteriler
SET TamAd = Ad + ' ' + Soyad;
GO

ALTER TABLE TemizSiparisler ADD SiparisTarihi_ISO VARCHAR(10);
GO

UPDATE TemizSiparisler
SET SiparisTarihi_ISO = CONVERT(VARCHAR, SiparisTarihi, 23);
GO