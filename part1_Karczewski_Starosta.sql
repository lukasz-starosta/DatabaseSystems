USE master;
if exists(select 1 from master.dbo.sysdatabases where name = 'test_Karczewski_Starosta') drop database test_Karczewski_Starosta
GO

/* 2. */
CREATE DATABASE test_Karczewski_Starosta
GO

/* 4. */
use test_Karczewski_Starosta

/* 5. */
CREATE TABLE BANDS(
	band_id	INT PRIMARY KEY IDENTITY(1,1),
	name VARCHAR(40),
	origin_country VARCHAR(50),
	formed_year INT
);
GO

/* 6. */
SELECT COUNT(*) AS 'Initial Count' FROM BANDS
GO

/* 7. */
INSERT INTO BANDS(name, origin_country, formed_year)
	VALUES('The Beatles', 'England', 1960);
GO

/* 8. */
SELECT * FROM BANDS
GO

/* 9. */
SELECT COUNT(*) AS 'Count After Insert' FROM BANDS
GO

/* 10. */
CREATE TABLE MEMBERS(
	member_id INT PRIMARY KEY IDENTITY(100, 1),
	band_id INT,
	surname VARCHAR(60),
	name VARCHAR(50)
);
GO

/* 11. */
ALTER TABLE MEMBERS
ADD CONSTRAINT FK_Members_BandID FOREIGN KEY (band_id) REFERENCES BANDS(band_id);
GO

/* 12. */
INSERT INTO MEMBERS(name, surname, band_id)
VALUES ('John', 'Lennon', 1), ('Paul', 'McCartney', 1);
GO

/* 13. */
INSERT INTO BANDS(name, origin_country, formed_year)
VALUES ('Queen', 'Great Britain', 1971);
GO

/* 14. */
INSERT INTO MEMBERS(name, surname, band_id)
VALUES ('Freddie', 'Mercury', 2);
GO

/* 15. */
ALTER TABLE BANDS
ADD CONSTRAINT YearGreaterEqual1920_CHECK CHECK (formed_year >= 1920 );
GO

/* 16. */
/* This will throw an error because of the constraint above */
INSERT INTO BANDS(name, formed_year)
VALUES ('Invalid year', 1900);
GO
