USE InternshipApplicationDB;

-- SANAJANA
-- Average number of applications submitted by each candidate
SELECT AVG(ApplicationCount) AS AverageApplicationsPerCandidate
FROM (
    SELECT CandidateID, COUNT(*) AS ApplicationCount
    FROM CandidateApplication
    GROUP BY CandidateID
) AS ApplicationCounts;

-- List of candidates with the highest number of interviews
SELECT c.CandidateID, c.FirstName, c.LastName, COUNT(i.InterviewID) AS NumberOfInterviews
FROM Candidate c
JOIN Interview i ON c.CandidateID = i.CandidateID
GROUP BY c.CandidateID, c.FirstName, c.LastName
ORDER BY COUNT(i.InterviewID) DESC;

-- Success rate of interviews at different locations
SELECT i.Location, 
       COUNT(*) AS TotalInterviews, 
       SUM(CASE WHEN ca.Status = 'Accepted' THEN 1 ELSE 0 END) AS SuccessfulInterviews,
       SUM(CASE WHEN ca.Status = 'Accepted' THEN 1.0 ELSE 0 END) / COUNT(*) * 100 AS SuccessRate
FROM Interview i
JOIN CandidateApplication ca ON i.CandidateID = ca.CandidateID
GROUP BY i.Location;

-- Most preferred job locations among candidates
SELECT LocationPreference, COUNT(*) AS PreferenceCount
FROM Preference
GROUP BY LocationPreference
ORDER BY COUNT(*) DESC;

-- Employers with the highest average ratings from candidates
SELECT e.Name, AVG(r.Score) AS AverageRating
FROM Employer e
JOIN Rating r ON e.EmployerID = r.EmployerID
GROUP BY e.Name
HAVING COUNT(r.Score) > 3  -- Considering only employers with more than 3 ratings
ORDER BY AverageRating DESC;

--Bonus
WITH SuccessfulApplications AS (
    SELECT ca.CandidateID, 
           COUNT(DISTINCT ca.InternshipListingID) AS InternshipsAccepted
    FROM CandidateApplication ca
    WHERE ca.Status = 'Accepted'
    GROUP BY ca.CandidateID
    HAVING COUNT(DISTINCT ca.InternshipListingID) > 2
)
SELECT c.FirstName, c.LastName, sa.InternshipsAccepted, p.InterestArea, p.ExpectedSalary
FROM SuccessfulApplications sa
JOIN Candidate c ON sa.CandidateID = c.CandidateID
JOIN Preference p ON c.CandidateID = p.CandidateID
WHERE p.ExpectedSalary > 50000
ORDER BY sa.InternshipsAccepted DESC, p.ExpectedSalary DESC;



-- HUNG
-- Count of applications per internship over time
SELECT il.Title, COUNT(ca.InternshipListingID) AS ApplicationCount, MONTH(ca.DateApplied) AS Month
FROM InternshipListing il
JOIN CandidateApplication ca ON il.InternshipListingID = ca.InternshipListingID
GROUP BY il.Title, MONTH(ca.DateApplied);

-- Number of internships offered by each employer
SELECT e.Name, COUNT(il.InternshipListingID) AS InternshipCount
FROM Employer e
JOIN InternshipListing il ON e.EmployerID = il.EmployerID
GROUP BY e.Name;

--Employer Ratings and Internship Listing
WITH EmployerRatings AS (
    SELECT e.EmployerID, e.Name, AVG(r.Score) AS AverageRating
    FROM Employer e
    JOIN Rating r ON e.EmployerID = r.EmployerID
    GROUP BY e.EmployerID, e.Name
    HAVING AVG(r.Score) > 3.5
)
SELECT er.Name, er.AverageRating, COUNT(il.InternshipListingID) AS ListingsCount
FROM EmployerRatings er
JOIN InternshipListing il ON er.EmployerID = il.EmployerID
GROUP BY er.Name, er.AverageRating
ORDER BY ListingsCount DESC, er.AverageRating DESC;

-- Analysis of feedback given by candidates to employers
SELECT e.Name, COUNT(r.RatingID) AS FeedbackCount, AVG(r.Score) AS AverageScore
FROM Employer e
JOIN Rating r ON e.EmployerID = r.EmployerID
GROUP BY e.Name;

-- Demand for internships in different locations
SELECT il.Location, COUNT(ca.InternshipListingID) AS ApplicationCount
FROM InternshipListing il
JOIN CandidateApplication ca ON il.InternshipListingID = ca.InternshipListingID
GROUP BY il.Location;

--Bonus
WITH ApplicationStats AS (
    SELECT
        c.CandidateID,
        c.FirstName,
        c.LastName,
        COUNT(DISTINCT ca.InternshipListingID) AS UniqueApplications,
        COUNT(ca.CandidateApplicationID) AS TotalApplications,
        MAX(ca.DateApplied) AS LastApplicationDate
    FROM Candidate c
    LEFT JOIN CandidateApplication ca ON c.CandidateID = ca.CandidateID
    GROUP BY c.CandidateID, c.FirstName, c.LastName
    HAVING COUNT(ca.CandidateApplicationID) > 2
)
SELECT
    ApplicationStats.FirstName,
    ApplicationStats.LastName,
    ApplicationStats.UniqueApplications,
    ApplicationStats.TotalApplications,
    ApplicationStats.LastApplicationDate,
    Preference.LocationPreference
FROM ApplicationStats
JOIN Preference ON ApplicationStats.CandidateID = Preference.CandidateID;
 

-- JOE
-- Analysis of candidate attendance at events
SELECT e.Name, e.Date, COUNT(ce.CandidateID) AS AttendeeCount
FROM Event e
JOIN CandidateEvent ce ON e.EventID = ce.EventID
GROUP BY e.Name, e.Date;

-- Most popular types of events based on candidate attendance
SELECT e.Description, COUNT(ce.EventID) AS AttendanceCount
FROM Event e
JOIN CandidateEvent ce ON e.EventID = ce.EventID
GROUP BY e.Description
ORDER BY COUNT(ce.EventID) DESC;

-- Trends in document submissions over time
SELECT d.DocumentType, COUNT(d.DocumentID) AS DocumentCount, MONTH(d.UploadDate) AS Month, ca.CandidateID
FROM Document d
JOIN CandidateApplication ca ON d.ApplicationID = ca.CandidateApplicationID
GROUP BY d.DocumentType, MONTH(d.UploadDate), ca.CandidateID
ORDER BY MONTH(d.UploadDate), d.DocumentType;


-- Correlation between application status and document submissions
SELECT ca.Status, COUNT(d.DocumentID) AS DocumentCount
FROM CandidateApplication ca
JOIN Document d ON ca.CandidateApplicationID = d.ApplicationID
GROUP BY ca.Status;

-- Impact of event attendance on application rates
WITH EventAttendance AS (
    SELECT ce.CandidateID, COUNT(ce.EventID) AS EventsAttended
    FROM CandidateEvent ce
    GROUP BY ce.CandidateID
)
SELECT ea.EventsAttended, COUNT(ca.CandidateID) AS ApplicationsMade
FROM EventAttendance ea
JOIN CandidateApplication ca ON ea.CandidateID = ca.CandidateID
GROUP BY ea.EventsAttended;

--Bonus
-- Query: Candidate Application Status Distribution
SELECT
    ca.Status,
    COUNT(*) AS StatusCount,
    AVG(p.ExpectedSalary) AS AvgExpectedSalary
FROM
    CandidateApplication ca
JOIN
    Preference p ON ca.CandidateID = p.CandidateID
GROUP BY
    ca.Status
HAVING
    COUNT(*) > 2
ORDER BY
    StatusCount DESC;

-- DATABASE OBJECTS
-- Create the user-defined function to calculate the total applications by a candidate
CREATE FUNCTION dbo.GetTotalApplicationsByCandidate (@CandidateID INT)
RETURNS INT
AS
BEGIN
    DECLARE @TotalApplications INT;
    SELECT @TotalApplications = COUNT(*) 
    FROM CandidateApplication 
    WHERE CandidateID = @CandidateID;
    RETURN @TotalApplications;
END;

-- Use the UDF to retrieve candidates with specific application criteria
DECLARE @MinApplications INT = 3;  -- Define the minimum number of applications to filter by

SELECT 
    c.CandidateID, 
    c.FirstName, 
    c.LastName, 
    dbo.GetTotalApplicationsByCandidate(c.CandidateID) AS TotalApplications,
    ca.Status AS ApplicationStatus,  -- Include the application status
    il.Title AS ApplicationTitle,
    il.Location AS ApplicationLocation
FROM Candidate c
INNER JOIN CandidateApplication ca ON c.CandidateID = ca.CandidateID
INNER JOIN InternshipListing il ON ca.InternshipListingID = il.InternshipListingID
WHERE dbo.GetTotalApplicationsByCandidate(c.CandidateID) > @MinApplications
ORDER BY dbo.GetTotalApplicationsByCandidate(c.CandidateID) DESC;











