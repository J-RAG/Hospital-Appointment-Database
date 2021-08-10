CREATE DATABASE MagazineEX;
GO

USE MagazineEX;
GO

-- CREATE TABLE
CREATE TABLE Category (
	categoryCode	CHAR(2) PRIMARY KEY NOT NULL,
	categoryDesc	VARCHAR(20)
);
GO


-- INSERT DATA
Insert into  Category Values('E1', 'Entertainment');
Insert into  Category Values('G1', 'Gardening');
Insert into  Category Values('G2', 'Gossip');
Insert into  Category Values('H1', 'Health');
Insert into  Category Values('H2', 'Home');
Insert into  Category Values('L1', 'Lifestyle');
Insert into  Category Values('T1', 'Television');

-- TEST TABLE
SELECT * FROM [dbo].[Category];
GO