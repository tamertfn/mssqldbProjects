-- Versiyon bilgilerini tutan table
CREATE TABLE DatabaseVersions (
    VersionID INT IDENTITY(1,1) PRIMARY KEY,
    MajorVersion INT,
    MinorVersion INT,
    PatchVersion INT,
    ReleaseDate DATETIME DEFAULT GETDATE(),
    Description VARCHAR(500),
    AppliedBy VARCHAR(100),
    AppliedDate DATETIME DEFAULT GETDATE()
);

-- Olusturulacak DDL triggerin yakaladigi degisikliklerin tutulacagi table
CREATE TABLE SchemaChangeLog (
    LogID INT IDENTITY(1,1) PRIMARY KEY,
    EventType VARCHAR(100),
    ObjectName VARCHAR(255),
    DatabaseName VARCHAR(100),
    SchemaName VARCHAR(100),
    LoginName VARCHAR(100),
    EventDate DATETIME DEFAULT GETDATE(),
    DDLCommand XML
);
