CREATE TABLE RaporSiparisler (
    SiparisID INT PRIMARY KEY,
    MusteriAdSoyad NVARCHAR(100),
    UrunAdi NVARCHAR(100),
    Adet INT,
    SiparisTarihi VARCHAR(10),
    BirimFiyatTL DECIMAL(12,2),
    ToplamTutarTL DECIMAL(14,2)
);
