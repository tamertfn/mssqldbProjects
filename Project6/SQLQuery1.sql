CREATE DATABASE UniversiteDB;
GO

USE UniversiteDB;
GO

-- 1. Ogrenciler tablosu
CREATE TABLE Ogrenciler (
    OgrenciID INT IDENTITY(1,1) PRIMARY KEY,
    Ad VARCHAR(100) NOT NULL,
    Soyad VARCHAR(100) NOT NULL,
    TCNo CHAR(11) UNIQUE NOT NULL,
    DogumTarihi DATE NOT NULL
);
GO

-- 2. Bolumler tablosu
CREATE TABLE Bolumler (
    BolumID INT PRIMARY KEY,
    BolumAdi VARCHAR(150) NOT NULL,
    FakulteAdi VARCHAR(150) NOT NULL
);
GO

-- 3. Dersler tablosu
CREATE TABLE Dersler (
    DersID INT PRIMARY KEY,
    DersAdi VARCHAR(150) NOT NULL,
    Kredi INT CHECK (Kredi > 0),
    BolumID INT FOREIGN KEY REFERENCES Bolumler(BolumID)
);
GO

-- 4. Kayitlar tablosu
CREATE TABLE Kayitlar (
    KayitID INT IDENTITY(1,1) PRIMARY KEY,
    OgrenciID INT FOREIGN KEY REFERENCES Ogrenciler(OgrenciID),
    DersID INT FOREIGN KEY REFERENCES Dersler(DersID),
    Yil INT CHECK (Yil >= 2000),
    Donem VARCHAR(10) CHECK (Donem IN ('Guz', 'Bahar'))
);
GO
