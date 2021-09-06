
USE HospitalAppointment;
GO


--	Drop Tables
DROP TABLE Referral;
DROP TABLE Patient;
DROP TABLE Surgeon;
DROP TABLE Referrer;

*/


--	Create Patient Table
CREATE TABLE Patient 
(
	patientNumber INT IDENTITY(1,1) PRIMARY KEY,
	NHI			VARCHAR(20) NOT NULL,
	firstName	VARCHAR(20) NOT NULL,
	lastName	VARCHAR(20) NOT NULL,
	DOB			DATE NOT NULL,
	gender		VARCHAR(10) NOT NULL,
	HTE			VARCHAR(3) NOT NULL,
);
GO

--	Create Surgeon Table
CREATE TABLE Surgeon
(
	staffID		INT IDENTITY(1,1) PRIMARY KEY,
	department	VARCHAR(20) NOT NULL,
	firstName	VARCHAR(20) NOT NULL,
	lastName	VARCHAR(20) NOT NULL
);
GO

--	Create referrer Table
CREATE TABLE Referrer
(
	referrerCode	INT IDENTITY(1,1) PRIMARY KEY,
	refferedFrom	VARCHAR(20) NOT NULL,
	firstName		VARCHAR(20) NOT NULL,
	lastName		VARCHAR(20) NOT NULL
);
GO

--	Create Refferal Table
CREATE TABLE Referral
(
	refCode			INT IDENTITY(1,1) PRIMARY KEY,
	referrerCode	INT,
	patientNumber	INT,
	surgeon			INT,
	refDate			DATE NOT NULL,
	waitlistDate	DATE NOT NULL,
	FSA				DATE,
	FOREIGN KEY	(referrerCode) REFERENCES Referrer(referrerCode),
	FOREIGN KEY (patientNumber) REFERENCES Patient(patientNumber),
	FOREIGN KEY (surgeon) REFERENCES Surgeon(staffID)
);
GO

-- INSERT DATA
-- Patient
BULK INSERT [dbo].[Patient]
FROM 'C:\Users\JulanRay\OneDrive - Ara Institute of Canterbury\2021\Bachelor (Sem2)\BCDE103\Assessment\Assignment 1\Submit\Iteration1\Database Code\Patient.csv'
 WITH
      (
         FIELDTERMINATOR =',',
         ROWTERMINATOR ='\n',
		 FIRSTROW = 2
      );
GO

-- Referrer
BULK INSERT [dbo].[Referrer]
FROM 'C:\Users\JulanRay\OneDrive - Ara Institute of Canterbury\2021\Bachelor (Sem2)\BCDE103\Assessment\Assignment 1\Submit\Iteration1\Database Code\Referrer.csv'
 WITH
      (
         FIELDTERMINATOR =',',
         ROWTERMINATOR ='\n',
		 FIRSTROW = 2
      );
GO

-- Surgeon
BULK INSERT [dbo].[Surgeon]
from 'C:\Users\JulanRay\OneDrive - Ara Institute of Canterbury\2021\Bachelor (Sem2)\BCDE103\Assessment\Assignment 1\Submit\Iteration1\Database Code\Surgeon.csv'
 WITH
      (
         FIELDTERMINATOR =',',
         ROWTERMINATOR ='\n',
		 FIRSTROW = 2
      );
GO

-- Referral
BULK INSERT [dbo].[Referral]
FROM 'C:\Users\JulanRay\OneDrive - Ara Institute of Canterbury\2021\Bachelor (Sem2)\BCDE103\Assessment\Assignment 1\Submit\Iteration1\Database Code\Referral.csv'
 WITH
      (
         FIELDTERMINATOR =',',
         ROWTERMINATOR ='\n',
		 FIRSTROW = 2
      );
GO



-- DISPLAY TEST
SELECT * FROM [dbo].[Patient];
GO

SELECT * FROM [dbo].[Referrer];
GO

SELECT * FROM [dbo].[Surgeon];
GO

SELECT * FROM [dbo].[Referral];
GO

