-- Veritabani Olusturulmasi
CREATE DATABASE ETL_Projesi;
GO

USE ETL_Projesi;
GO

CREATE TABLE Musteriler (
    MusteriID INT PRIMARY KEY,
    Ad NVARCHAR(50),
    Soyad NVARCHAR(50),
    Email NVARCHAR(100),
    KayitTarihi DATE
);

CREATE TABLE Urunler (
    UrunID INT PRIMARY KEY,
    UrunAdi NVARCHAR(100),
    Fiyat DECIMAL(10,2),
    ParaBirimi NVARCHAR(10)
);

CREATE TABLE Siparisler (
    SiparisID INT PRIMARY KEY,
    MusteriID INT,
    UrunID INT,
    SiparisTarihi DATE,
    Adet INT,
    FOREIGN KEY (MusteriID) REFERENCES Musteriler(MusteriID),
    FOREIGN KEY (UrunID) REFERENCES Urunler(UrunID)
);
