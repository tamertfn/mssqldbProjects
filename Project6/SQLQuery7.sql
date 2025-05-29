ALTER TABLE Ogrenciler ADD
    Email VARCHAR(150),
    Cinsiyet CHAR(1) CHECK (Cinsiyet IN ('E', 'K'));

CREATE TABLE OgretimUyeleri (
    OgretimUyesiID INT IDENTITY(1,1) PRIMARY KEY,
    Ad VARCHAR(100),
    Soyad VARCHAR(100),
    Unvan VARCHAR(50),
    BolumID INT FOREIGN KEY REFERENCES Bolumler(BolumID)
);

CREATE TABLE DersOgretimUyesi (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    DersID INT FOREIGN KEY REFERENCES Dersler(DersID),
    OgretimUyesiID INT FOREIGN KEY REFERENCES OgretimUyeleri(OgretimUyesiID)
);

ALTER TABLE Kayitlar ADD Notu FLOAT CHECK (Notu BETWEEN 0 AND 100);

INSERT INTO DatabaseVersions (
    MajorVersion, MinorVersion, PatchVersion, Description, AppliedBy
)
VALUES (2, 0, 0, 'Ogrenci bilgileri genişletildi, ogretim üyeleri sistemi eklendi, not alanı tanımlandı.', SYSTEM_USER);
