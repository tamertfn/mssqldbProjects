USE project3db;
GO

CREATE USER user1 FOR LOGIN user1; 
GO

GRANT SELECT ON SCHEMA::dbo TO user1; --kullaniciya sadece select yetkisi verdik