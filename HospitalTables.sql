--	Drop Tables
/**
DROP TABLE Patient;
DROP TABLE Surgeon;
DROP TABLE Referrer;
DROP TABLE Referral;
DROP TABLE FSA;
**/


--	Create Patient Table
CREATE TABLE Patient 
(
	NHI			VARCHAR(20) PRIMARY KEY,
	firstName	VARCHAR(20) NOT NULL,
	lastName	VARCHAR(20) NOT NULL,
	DOB			DATE NOT NULL,
	GENDER		CHAR(1) NOT NULL
);
GO

--	Create Surgeon Table
CREATE TABLE Surgeon
(
	staffID		INT PRIMARY KEY,
	department	VARCHAR(20) NOT NULL,
	firstName	VARCHAR(20) NOT NULL,
	lastName	VARCHAR(20) NOT NULL
);
GO

--	Create referrer Table
CREATE TABLE Referrer
(
	referrerCode	INT PRIMARY KEY,
	refferedFrom	VARCHAR(8) NOT NULL,
	firstName		VARCHAR(20) NOT NULL,
	lastName		VARCHAR(20) NOT NULL
);
GO

--	Create Refferal Table
CREATE TABLE Referral
(
	refCode			INT PRIMARY KEY,
	referrerCode	INT,
	refDate			DATE NOT NULL,
	yearMonth		VARCHAR(15) NOT NULL,
	waitlistDate	DATE NOT NULL,
	HTE				VARCHAR(3),
	FOREIGN KEY (referrerCode) REFERENCES referrer(referrerCode),
);
GO

--	Create FSA Table
CREATE TABLE FSA 
(
	surgeon			INT,
	FSADate			DATE NOT NULL,
	PRIMARY KEY (surgeon, FSADate),
	FOREIGN KEY (surgeon) REFERENCES Surgeon (staffID)
);
GO