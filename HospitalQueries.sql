
USE HospitalAppointment;
GO

-- How many people have been referred for cardiothoracic?   
SELECT COUNT(*) AS 'Number of patients referred for cardiothoracic'
FROM 
	[dbo].[Patient] p 
	JOIN [dbo].[Referral] r
		ON (p.[patientNumber] = r.[patientNumber])
	JOIN [dbo].[Surgeon] s
		ON (s.[staffID] = r.[surgeon])
	WHERE department = 'cardiothoracic';
GO

-- What is the average time taken (in days) to see a Surgeon by Department? 
SELECT 
	s.[firstName] + ' ' + s.[lastName] AS Surgeon,
	AVG(DATEDIFF(day, [refDate], [FSA])) AS '(Days) Average Time Taken'
FROM [dbo].[Referral] r
	JOIN [dbo].[Patient] p
	ON (p.[patientNumber] = r.[patientNumber])
	JOIN [dbo].[Surgeon] s
	ON (s.[staffID] = r.[surgeon])
	JOIN [dbo].[Referrer] rr
	ON (rr.[referrerCode] = r.[referrerCode])
WHERE p.[HTE] = 'Yes'
GROUP BY s.[department], s.[firstName], s.[lastName];
GO


-- Who has each Surgeon had on their list and how long have they been waiting or did they wait? 
SELECT
	p.[firstName] + ' ' + p.[lastName] AS Patient,
	s.[firstName] + ' ' + s.[lastName] AS Surgeon,
	DATEDIFF(day, r.[refDate], r.[FSA]) as  'Days'
FROM [dbo].[Referral] r
	JOIN [dbo].[Patient] p
	ON (p.[patientNumber] = r.[patientNumber])
	JOIN [dbo].[Surgeon] s
	ON (s.[staffID] = r.[surgeon])
WHERE p.[HTE] = 'Yes'
GROUP BY 
	r.refDate, r.FSA,
	s.department, s.firstName, s.lastName,
	p.firstName, p.lastName;
GO


-- Assuming that all patients under 18 need to be seen by Paediatric Surgery, are there any patients who need to be reassigned? 
SELECT 
	p.[firstName] + ' ' + p.[lastName] AS Patient,
	DATEDIFF(yy, p.[DOB], r.[refDate]) AS 'Age of Patient'
FROM [dbo].[Referral] r
	JOIN [dbo].[Patient] p
	ON (p.[patientNumber] = r.[patientNumber])
	JOIN [dbo].[Referrer] rr
	ON (rr.[referrerCode] = r.[referrerCode])
WHERE p.[HTE] = 'Yes'
ORDER BY p.firstName, p.lastName, p.DOB;
GO

