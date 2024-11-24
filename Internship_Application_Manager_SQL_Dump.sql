USE InternshipApplicationDB;

-- Candidate Table
CREATE TABLE Candidate (
    CandidateID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Phone VARCHAR(20),
    AcademicDetails NVARCHAR(MAX)
);

-- Preference Table
CREATE TABLE Preference (
    PreferenceID INT PRIMARY KEY,
    InterestArea VARCHAR(100),
    ExpectedSalary DECIMAL(10, 2),
    WorkSchedule VARCHAR(50),
    LocationPreference VARCHAR(100),
    SkillsMatch NVARCHAR(MAX),
    CandidateID INT
);

-- Employer Table
CREATE TABLE Employer (
    EmployerID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL
);

-- InternshipListing Table
CREATE TABLE InternshipListing (
    InternshipListingID INT PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    EmployerID INT,
    Description NVARCHAR(MAX),
    ApplicationDeadline DATE,
    Location VARCHAR(100)
);

-- Rating Table
CREATE TABLE Rating (
    RatingID INT PRIMARY KEY,
    CandidateID INT,
    EmployerID INT,
    Score DECIMAL(3, 2),
    Comments NVARCHAR(MAX),
    DateGiven DATE
);

-- CandidateApplication Table
CREATE TABLE CandidateApplication (
    CandidateApplicationID INT PRIMARY KEY,
    CandidateID INT,
    InternshipListingID INT,
    DateApplied DATE,
    Status VARCHAR(50)
);

-- Interview Table
CREATE TABLE Interview (
    InterviewID INT PRIMARY KEY,
    Date DATE,
    Time TIME,
    Location VARCHAR(100),
    InternshipListingID INT,
    CandidateID INT
);

-- Event Table
CREATE TABLE Event (
    EventID INT PRIMARY KEY,
    Name VARCHAR(100),
    Date DATE,
    Location VARCHAR(100),
    Description NVARCHAR(MAX)
);

-- CandidateEvent Table
CREATE TABLE CandidateEvent (
    CandidateID INT,
    EventID INT,
    Status VARCHAR(50),
    PRIMARY KEY (CandidateID, EventID)
);

-- Document Table
CREATE TABLE Document (
    DocumentID INT PRIMARY KEY,
    ApplicationID INT,
    DocumentType VARCHAR(50),
    DocumentURL VARCHAR(255),
    UploadDate DATE
);

-- INSERT statement for Candidate table
INSERT INTO Candidate (CandidateID, FirstName, LastName, Email, Phone, AcademicDetails)
VALUES
  (1, 'Jordan', 'Jones', 'jordan.jones@example.com', '1-555-1825', 'Artificial Intelligence'),
  (2, 'Morgan', 'Garcia', 'morgan.garcia@example.com', '1-555-4477', 'Database Management'),
  (3, 'Morgan', 'Smith', 'morgan.smith@mail.com', '1-555-6393', 'Cybersecurity'),
  (4, 'Riley', 'Johnson', 'riley.johnson@techjobs.com', '1-555-7742', 'Web Development'),
  (5, 'Casey', 'Miller', 'casey.miller@mail.com', '1-555-8578', 'Web Development'),
  (6, 'Jordan', 'Davis', 'jordan.davis@mail.com', '1-555-8202', 'Network Administration'),
  (7, 'Dakota', 'Jones', 'dakota.jones@techjobs.com', '1-555-2180', 'Database Management'),
  (8, 'Alex', 'Williams', 'alex.williams@techjobs.com', '1-555-8568', 'Artificial Intelligence'),
  (9, 'Jamie', 'Davis', 'jamie.davis@mail.com', '1-555-7040', 'Data Science'),
  (10, 'Taylor', 'Miller', 'taylor.miller@example.com', '1-555-6407', 'Data Science'),
  (11, 'Casey', 'Rodriguez', 'casey.rodriguez@mail.com', '1-555-7911', 'Computer Science'),
  (12, 'Alex', 'Brown', 'alex.brown@example.com', '1-555-1098', 'Cybersecurity'),
  (13, 'Sam', 'Johnson', 'sam.johnson@example.com', '1-555-9387', 'Database Management'),
  (14, 'Dakota', 'Brown', 'dakota.brown@example.com', '1-555-9804', 'Cybersecurity'),
  (15, 'Jamie', 'Miller', 'jamie.miller@techjobs.com', '1-555-8140', 'Database Management');

-- Preference table insert statements
INSERT INTO Preference (PreferenceID, InterestArea, ExpectedSalary, WorkSchedule, LocationPreference, SkilsMatch, CandidateID)
VALUES
    (1, 'Software Development', 64500, 'Full-time', 'Chicago', 'JavaScript', 2),
    (2, 'IT Support', 93500, 'Remote', 'New York', 'JavaScript', 1),
    (3, 'Software Development', 70500, 'Flexible', 'Austin', 'Python', 1),
    (4, 'Web Development', 84000, 'Part-time', 'New York', 'Python', 2),
    (5, 'Data Science', 81200, 'Full-time', 'San Francisco', 'Python', 9),
    (6, 'Data Science', 102500, 'Full-time', 'San Francisco', 'SQL', 3),
    (7, 'Data Science', 88500, 'Full-time', 'Austin', 'SQL', 1),
    (8, 'IT Support', 68500, 'Flexible', 'San Francisco', 'SQL', 6),
    (9, 'Data Science', 105500, 'Full-time', 'Chicago', 'JavaScript', 10),
    (10, 'Software Development', 94500, 'Flexible', 'New York', 'Java', 8),
    (11, 'Data Science', 63000, 'Part-time', 'Austin', 'JavaScript', 15),
    (12, 'Data Science', 112000, 'Flexible', 'Chicago', 'SQL', 7),
    (13, 'IT Support', 89000, 'Remote', 'Austin', 'SQL', 1),
    (14, 'Data Science', 104500, 'Remote', 'Chicago', 'SQL', 5),
    (15, 'Web Development', 96500, 'Full-time', 'Chicago', 'Java', 12),
    (16, 'IT Support', 63500, 'Part-time', 'Austin', 'Java', 8),
    (17, 'Web Development', 67000, 'Flexible', 'San Francisco', 'Python', 5),
    (18, 'IT Support', 101500, 'Flexible', 'New York', 'SQL', 2),
    (19, 'Data Science', 56500, 'Remote', 'New York', 'JavaScript', 13),
    (20, 'IT Support', 83000, 'Full-time', 'San Francisco', 'JavaScript', 2),
    (21, 'Web Development', 91500, 'Remote', 'Chicago', 'Java', 15),
    (22, 'IT Support', 72000, 'Full-time', 'Austin', 'JavaScript', 2),
    (23, 'IT Support', 75500, 'Flexible', 'Chicago', 'JavaScript', 12),
    (24, 'IT Support', 71000, 'Full-time', 'San Francisco', 'Python', 8),
    (25, 'IT Support', 54000, 'Flexible', 'New York', 'Python', 2),
    (26, 'Software Development', 85500, 'Full-time', 'Chicago', 'Java', 7),
    (27, 'Data Science', 54500, 'Remote', 'New York', 'SQL', 13),
    (28, 'Data Science', 59000, 'Flexible', 'Austin', 'Python', 11),
    (29, 'Data Science', 61500, 'Full-time', 'Chicago', 'JavaScript', 2),
    (30, 'IT Support', 90500, 'Full-time', 'San Francisco', 'Python', 5),
    (31, 'Software Development', 84500, 'Flexible', 'New York', 'SQL', 10),
    (32, 'Software Development', 115500, 'Full-time', 'San Francisco', 'JavaScript', 7),
    (33, 'Software Development', 66500, 'Remote', 'Chicago', 'Java', 5),
    (34, 'Data Science', 108000, 'Remote', 'Austin', 'JavaScript', 11),
    (35, 'Web Development', 54500, 'Part-time', 'Austin', 'JavaScript', 2),
    (36, 'Data Science', 83000, 'Remote', 'Austin', 'Java', 9),
    (37, 'IT Support', 61000, 'Remote', 'Austin', 'SQL', 2),
    (38, 'Data Science', 62500, 'Part-time', 'San Francisco', 'JavaScript', 4),
    (39, 'IT Support', 112500, 'Remote', 'San Francisco', 'Java', 4),
    (40, 'IT Support', 80500, 'Remote', 'New York', 'Python', 9),
    (41, 'Software Development', 66500, 'Flexible', 'New York', 'SQL', 11),
    (42, 'Software Development', 87000, 'Remote', 'San Francisco', 'Python', 2),
    (43, 'Data Science', 92500, 'Full-time', 'Austin', 'SQL', 14),
    (44, 'Software Development', 70000, 'Remote', 'Chicago', 'Python', 11),
    (45, 'Software Development', 61500, 'Flexible', 'Austin', 'SQL', 5);

-- Employer table insert statements
INSERT INTO Employer (EmployerID, Name)
VALUES
(1, 'InnovateTech Solutions'),
(2, 'ByteCraft Industries'),
(3, 'DataTech Innovations'),
(4, 'Software Wizards Inc.'),
(5, 'NetConnect Systems'),
(6, 'CyberVanguard Labs'),
(7, 'WebSolutions Pro'),
(8, 'TechGrowth Partners'),
(9, 'CodeCrafters Corp.'),
(10, 'DataStream Innovations'),
(11, 'PixelForge Studios'),
(12, 'InfiniteLoop Technologies'),
(13, 'Futurix Solutions'),
(14, 'ByteMatrix Labs'),
(15, 'CyberLink Innovations');

-- InternshipListing table insert statements
INSERT INTO InternshipListing (InternshipListingID, Title, EmployerID, Description, ApplicationDeadline, Location)
VALUES
    (1, 'Software Engineering Intern', 13, 'Join our team as a Software Engineering Intern and work on cutting-edge projects using the latest technologies. You will have the opportunity to collaborate with experienced developers and gain hands-on experience in software development.', '8/30/2023 5:03', 'San Francisco, CA'),
    (2, 'Data Analyst Intern', 15, 'We are seeking a Data Analyst Intern to assist in analyzing and interpreting data to drive business decisions. This internship offers the chance to work with real datasets and develop analytical skills.', '9/14/2023 6:49', 'New York City, NY'),
    (3, 'Marketing Intern', 11, 'As a Marketing Intern, you will support our marketing team in creating and executing marketing campaigns, managing social media accounts, and conducting market research. Join us to learn the ropes of digital marketing.', '7/24/2023 1:45', 'Los Angeles, CA'),
    (4, 'Graphic Design Intern', 7, 'Be part of our creative team as a Graphic Design Intern. You will work on designing visual materials, including brochures, logos, and digital graphics, and gain exposure to the world of graphic design.', '12/5/2023 4:01', 'Chicago, IL'),
    (5, 'Finance Internship', 11, 'Join our Finance team as an Intern and assist in financial analysis, budgeting, and reporting. This internship provides valuable experience in financial management.', '10/9/2023 4:35', 'Houston, TX'),
    (6, 'Human Resources Intern', 2, 'As a Human Resources Intern, you will support HR initiatives such as recruitment, employee onboarding, and HR administration. Gain insights into HR practices and processes.', '3/5/2023 17:29', 'Boston, MA'),
    (7, 'Web Development Intern', 12, 'Work on web development projects and learn front-end and back-end technologies as a Web Development Intern. Collaborate with our development team to build and maintain websites.', '11/13/2023 18:34', 'Seattle, WA'),
    (8, 'Content Writing Intern', 7, 'Join our Content Writing team and improve your writing skills as an intern. Create engaging and informative content for our website, blog, and social media platforms.', '9/29/2023 0:21', 'Denver, CO'),
    (9, 'Digital Marketing Intern', 10, 'Learn the ins and outs of digital marketing as an intern. Assist in managing online advertising campaigns, optimizing SEO, and analyzing marketing performance data.', '11/19/2023 8:27', 'Austin, TX'),
    (10, 'Product Management Intern', 7, 'Work closely with our Product Management team to help define product strategies, conduct market research, and assist in product development efforts. Gain hands-on experience in product management.', '2/16/2023 3:02', 'San Diego, CA'),
    (11, 'Software Engineering Intern', 3, 'Join our team as a Software Engineering Intern and work on exciting projects. Collaborate with skilled developers and contribute to the development of software applications.', '5/28/2023 3:18', 'San Jose, CA'),
    (12, 'Data Science Intern', 10, 'We are looking for a Data Science Intern to work on data analysis and machine learning projects. Gain practical experience in data science and analytics.', '4/14/2023 23:40', 'Austin, TX'),
    (13, 'Social Media Intern', 10, 'As a Social Media Intern, you will manage our social media profiles, create engaging content, and analyze social media performance. Get hands-on experience in social media marketing.', '8/6/2023 14:46', 'Miami, FL'),
    (14, 'UX/UI Design Intern', 5, 'Join our UX/UI Design team and work on designing user-friendly interfaces. Collaborate with experienced designers and contribute to the user experience of our products.', '2/1/2023 6:23', 'Portland, OR'),
    (15, 'Business Development Intern', 5, 'Assist our Business Development team in identifying growth opportunities, conducting market research, and building relationships with clients. Learn about business strategy and development.', '1/9/2023 23:17', 'Dallas, TX');

-- Rating table insert statements
INSERT INTO Rating (RatingID, CandidateID, EmployerID, Score, Comments, DateGiven)
VALUES
    (1, 12, 1, 1.27, 'Outstanding employer, fosters growth and innovation.', '3/29/2023 2:26'),
    (2, 14, 1, 4.62, 'Exceptional workplace, highly recommend.', '4/27/2023 21:54'),
    (3, 2, 14, 3.16, 'Positive work culture, promotes employee engagement.', '11/5/2023 11:06'),
    (4, 5, 10, 4.74, 'Adequate employer, provides necessary resources.', '11/20/2023 0:46'),
    (5, 15, 5, 1.65, 'Could enhance communication and transparency.', '10/8/2023 3:25'),
    (6, 4, 13, 3.05, 'Below-average employer, consider other options.', '8/15/2023 17:28'),
    (7, 4, 7, 4.31, 'Challenging work environment, lacks support.', '10/21/2023 3:44'),
    (8, 13, 9, 1.79, 'Negative workplace, not a recommended choice.', '12/2/2023 16:07'),
    (9, 15, 3, 1.89, 'Excellent candidate, exemplary skills and dedication.', '10/4/2023 0:51'),
    (10, 8, 13, 4.16, 'Consistently delivers high-quality work, a valuable team member.', '12/19/2023 19:08'),
    (11, 7, 14, 2.68, 'Impressive expertise and a positive contributor.', '2/26/2023 18:34'),
    (12, 7, 12, 1.44, 'Skilled and reliable, an asset to the organization.', '3/2/2023 19:08'),
    (13, 14, 11, 2.49, 'Exceeded all expectations, a top-tier candidate.', '10/5/2023 8:48'),
    (14, 10, 10, 1.84, 'Solid performance, meets standards consistently.', '7/24/2023 3:32'),
    (15, 3, 13, 2.27, 'Shows potential and room for growth.', '5/5/2023 17:48'),
    (16, 12, 7, 1.32, 'Improvement needed in some areas, but has potential.', '10/8/2023 21:04'),
    (17, 14, 12, 1.6, 'Requires additional training and development.', '4/30/2023 23:06'),
    (18, 12, 15, 1.03, 'Not meeting expectations, improvement needed.', '11/9/2023 5:47'),
    (19, 8, 15, 3.64, 'Good potential but lacks consistency.', '2/5/2023 18:02'),
    (20, 11, 2, 4.92, 'Average performance, room for improvement.', '11/22/2023 5:20'),
    (21, 10, 15, 2.41, 'Showing promise but needs guidance.', '10/12/2023 5:39'),
    (22, 15, 6, 4.17, 'Struggles with consistency and attention to detail.', '5/18/2023 23:24'),
    (23, 7, 6, 4.65, 'Could benefit from further training and support.', '12/4/2023 4:36'),
    (24, 5, 9, 3.45, 'Promising but requires more experience.', '4/23/2023 22:35'),
    (25, 8, 13, 2.04, 'Not meeting expectations, needs improvement.', '2/19/2023 1:59'),
    (26, 13, 7, 1.41, 'Inconsistent performance, potential is there.', '3/11/2023 13:44'),
    (27, 14, 5, 4.09, 'Has potential but needs to focus on development.', '8/24/2023 0:59'),
    (28, 10, 12, 4.83, 'Improvement needed in multiple areas.', '6/4/2023 5:39'),
    (29, 13, 5, 3.71, 'Meets basic requirements, but lacks enthusiasm.', '9/2/2023 20:13'),
    (30, 2, 3, 3, 'Below expectations, needs significant improvement.', '9/5/2023 16:35'),
    (31, 8, 11, 4.56, 'Shows potential but requires additional coaching.', '9/14/2023 5:43'),
    (32, 11, 5, 4.09, 'Requires substantial improvement in skills.', '12/29/2023 0:37'),
    (33, 11, 9, 2.41, 'Falls short of expectations, not recommended.', '10/30/2023 2:46'),
    (34, 8, 8, 4.54, 'Dissatisfactory performance, not suitable.', '12/15/2023 0:13'),
    (35, 9, 7, 1.09, 'Exceptional candidate, exemplary skills and dedication.', '1/6/2023 1:29'),
    (36, 9, 7, 1.01, 'Consistently delivers high-quality work, a valuable team member.', '4/16/2023 0:39'),
    (37, 2, 10, 2.74, 'Impressive expertise and a positive contributor.', '12/20/2023 3:50'),
    (38, 12, 1, 4.7, 'Skilled and reliable, an asset to the organization.', '3/3/2023 18:06'),
    (39, 13, 13, 3.23, 'Exceeded all expectations, a top-tier candidate.', '4/18/2023 22:13'),
    (40, 8, 1, 1.34, 'Solid performance, meets standards consistently.', '5/17/2023 18:22'),
    (41, 3, 5, 4.24, 'Shows potential and room for growth.', '11/22/2023 22:15'),
    (42, 10, 15, 1.11, 'Improvement needed in some areas, but has potential.', '11/15/2023 7:46'),
    (43, 11, 13, 3.68, 'Requires additional training and development.', '11/6/2023 21:25'),
    (44, 1, 5, 4.14, 'Not meeting expectations, improvement needed.', '2/23/2023 9:12'),
    (45, 5, 2, 3.99, 'Outstanding employer, fosters growth and innovation.', '9/10/2023 3:37');

-- CandidateApplication table insert statements
INSERT INTO CandidateApplication (CandidateApplicationID, CandidateID, InternshipListingID, DateApplied, Status)
VALUES
(1, 4, 9, '2023-08-02', 'Under Review'),
(2, 10, 7, '2023-10-10', 'Submitted'),
(3, 13, 7, '2023-08-15', 'Accepted'),
(4, 2, 15, '2023-07-17', 'Accepted'),
(5, 11, 9, '2023-04-03', 'Rejected'),
(6, 12, 2, '2023-10-22', 'Submitted'),
(7, 13, 9, '2023-01-01', 'Accepted'),
(8, 14, 11, '2023-07-30', 'Submitted'),
(9, 5, 13, '2023-09-15', 'Submitted'),
(10, 1, 5, '2023-06-30', 'Accepted'),
(11, 6, 1, '2023-02-05', 'Under Review'),
(12, 6, 3, '2023-01-03', 'Submitted'),
(13, 15, 6, '2023-10-24', 'Rejected'),
(14, 2, 1, '2023-07-01', 'Accepted'),
(15, 7, 4, '2023-05-14', 'Accepted'),
(16, 2, 7, '2023-06-16', 'Accepted'),
(17, 13, 9, '2023-12-29', 'Accepted'),
(18, 8, 11, '2023-09-08', 'Rejected'),
(19, 11, 11, '2023-11-11', 'Submitted'),
(20, 9, 6, '2023-01-12', 'Submitted'),
(21, 9, 1, '2023-09-02', 'Rejected'),
(22, 12, 11, '2023-07-29', 'Under Review'),
(23, 3, 4, '2023-02-22', 'Under Review'),
(24, 15, 3, '2023-12-21', 'Submitted'),
(25, 9, 12, '2023-07-11', 'Submitted'),
(26, 9, 10, '2023-01-15', 'Submitted'),
(27, 2, 5, '2023-12-08', 'Submitted'),
(28, 13, 6, '2023-06-25', 'Accepted'),
(29, 9, 2, '2023-03-05', 'Accepted'),
(30, 15, 9, '2023-02-07', 'Submitted'),
(31, 14, 2, '2023-10-12', 'Under Review'),
(32, 3, 12, '2023-03-07', 'Submitted'),
(33, 12, 5, '2023-10-17', 'Under Review'),
(34, 1, 9, '2023-08-17', 'Accepted'),
(35, 8, 12, '2023-10-17', 'Rejected'),
(36, 11, 10, '2023-06-18', 'Submitted'),
(37, 13, 3, '2023-03-01', 'Under Review'),
(38, 9, 5, '2023-12-20', 'Submitted'),
(39, 12, 5, '2023-12-08', 'Submitted'),
(40, 3, 4, '2023-12-02', 'Submitted'),
(41, 9, 15, '2023-02-19', 'Submitted'),
(42, 14, 10, '2023-12-02', 'Under Review'),
(43, 12, 12, '2023-03-06', 'Rejected'),
(44, 15, 8, '2023-03-06', 'Accepted'),
(45, 4, 12, '2023-04-12', 'Accepted');

-- Document table insert statements
INSERT INTO Document (DocumentID, ApplicationID, DocumentType, DocumentURL, UploadDate)
VALUES
    (1, 13, 'Reference Letter', 'https://docs.example.com/doc_1.pdf', '5/23/2023'),
    (2, 29, 'Cover Letter', 'https://docs.example.com/doc_2.pdf', '1/29/2023'),
    (3, 17, 'Reference Letter', 'https://docs.example.com/doc_3.pdf', '11/16/2023'),
    (4, 23, 'Portfolio', 'https://docs.example.com/doc_4.pdf', '1/22/2023'),
    (5, 27, 'Reference Letter', 'https://docs.example.com/doc_5.pdf', '6/29/2023'),
    (6, 41, 'Cover Letter', 'https://docs.example.com/doc_6.pdf', '4/25/2023'),
    (7, 33, 'Reference Letter', 'https://docs.example.com/doc_7.pdf', '8/16/2023'),
    (8, 25, 'Resume', 'https://docs.example.com/doc_8.pdf', '3/8/2023'),
    (9, 44, 'Portfolio', 'https://docs.example.com/doc_9.pdf', '9/7/2023'),
    (10, 25, 'Portfolio', 'https://docs.example.com/doc_10.pdf', '10/6/2023'),
    (11, 4, 'Cover Letter', 'https://docs.example.com/doc_11.pdf', '11/17/2023'),
    (12, 17, 'Portfolio', 'https://docs.example.com/doc_12.pdf', '12/29/2023'),
    (13, 19, 'Portfolio', 'https://docs.example.com/doc_13.pdf', '9/13/2023'),
    (14, 41, 'Portfolio', 'https://docs.example.com/doc_14.pdf', '2/3/2023'),
    (15, 45, 'Resume', 'https://docs.example.com/doc_15.pdf', '7/15/2023'),
    (16, 33, 'Portfolio', 'https://docs.example.com/doc_16.pdf', '6/9/2023'),
    (17, 6, 'Cover Letter', 'https://docs.example.com/doc_17.pdf', '1/8/2023'),
    (18, 36, 'Cover Letter', 'https://docs.example.com/doc_18.pdf', '3/5/2023'),
    (19, 9, 'Cover Letter', 'https://docs.example.com/doc_19.pdf', '1/24/2023'),
    (20, 25, 'Resume', 'https://docs.example.com/doc_20.pdf', '5/8/2023'),
    (21, 24, 'Cover Letter', 'https://docs.example.com/doc_21.pdf', '9/16/2023'),
    (22, 32, 'Cover Letter', 'https://docs.example.com/doc_22.pdf', '1/19/2023'),
    (23, 35, 'Portfolio', 'https://docs.example.com/doc_23.pdf', '11/12/2023'),
    (24, 32, 'Resume', 'https://docs.example.com/doc_24.pdf', '8/18/2023'),
    (25, 42, 'Reference Letter', 'https://docs.example.com/doc_25.pdf', '7/12/2023'),
    (26, 33, 'Cover Letter', 'https://docs.example.com/doc_26.pdf', '11/6/2023'),
    (27, 30, 'Resume', 'https://docs.example.com/doc_27.pdf', '6/22/2023'),
    (28, 37, 'Portfolio', 'https://docs.example.com/doc_28.pdf', '12/22/2023'),
    (29, 3, 'Reference Letter', 'https://docs.example.com/doc_29.pdf', '2/13/2023'),
    (30, 45, 'Portfolio', 'https://docs.example.com/doc_30.pdf', '6/25/2023'),
    (31, 24, 'Cover Letter', 'https://docs.example.com/doc_31.pdf', '5/30/2023'),
    (32, 2, 'Portfolio', 'https://docs.example.com/doc_32.pdf', '12/8/2023'),
    (33, 43, 'Portfolio', 'https://docs.example.com/doc_33.pdf', '5/3/2023'),
    (34, 10, 'Cover Letter', 'https://docs.example.com/doc_34.pdf', '10/27/2023'),
    (35, 8, 'Reference Letter', 'https://docs.example.com/doc_35.pdf', '5/18/2023'),
    (36, 20, 'Cover Letter', 'https://docs.example.com/doc_36.pdf', '5/19/2023'),
    (37, 38, 'Portfolio', 'https://docs.example.com/doc_37.pdf', '5/28/2023'),
    (38, 11, 'Resume', 'https://docs.example.com/doc_38.pdf', '5/20/2023'),
    (39, 5, 'Reference Letter', 'https://docs.example.com/doc_39.pdf', '9/21/2023'),
    (40, 11, 'Cover Letter', 'https://docs.example.com/doc_40.pdf', '8/13/2023'),
    (41, 39, 'Resume', 'https://docs.example.com/doc_41.pdf', '7/20/2023'),
    (42, 24, 'Resume', 'https://docs.example.com/doc_42.pdf', '6/11/2023'),
    (43, 7, 'Reference Letter', 'https://docs.example.com/doc_43.pdf', '2/19/2023'),
    (44, 21, 'Portfolio', 'https://docs.example.com/doc_44.pdf', '8/4/2023'),
    (45, 44, 'Reference Letter', 'https://docs.example.com/doc_45.pdf', '7/7/2023');

-- Interview table insert statements
INSERT INTO Interview (InterviewID, Date, Time, Location, InternshipListingID, CandidateID)
VALUES
(1, '7/3/2023 3:48', '20:01:31', 'InterviewRoom1', 11, 11),
(2, '11/28/2023 17:45', '20:01:31', 'InterviewRoom2', 6, 11),
(3, '10/20/2023 20:45', '20:01:31', 'InterviewRoom3', 8, 8),
(4, '6/4/2023 14:20', '20:01:31', 'InterviewRoom4', 6, 5),
(5, '3/19/2023 5:56', '20:01:31', 'InterviewRoom5', 5, 8),
(6, '7/18/2023 4:24', '20:01:31', 'InterviewRoom6', 2, 1),
(7, '3/28/2023 6:15', '20:01:31', 'InterviewRoom7', 12, 2),
(8, '6/22/2023 17:54', '20:01:31', 'InterviewRoom8', 4, 2),
(9, '5/30/2023 0:50', '20:01:31', 'InterviewRoom9', 11, 1),
(10, '10/9/2023 22:50', '20:01:31', 'InterviewRoom10', 5, 15),
(11, '8/7/2023 6:56', '20:01:31', 'InterviewRoom1', 2, 15),
(12, '9/20/2023 0:04', '20:01:31', 'InterviewRoom2', 5, 6),
(13, '2/23/2023 1:18', '20:01:31', 'InterviewRoom3', 4, 2),
(14, '4/12/2023 20:59', '20:01:31', 'InterviewRoom4', 11, 1),
(15, '7/23/2023 0:55', '20:01:31', 'InterviewRoom5', 5, 8),
(16, '4/8/2023 15:04', '20:01:31', 'InterviewRoom6', 13, 10),
(17, '6/26/2023 22:29', '20:01:31', 'InterviewRoom7', 1, 7),
(18, '12/2/2023 15:28', '20:01:31', 'InterviewRoom8', 6, 13),
(19, '11/26/2023 18:29', '20:01:31', 'InterviewRoom9', 6, 2),
(20, '5/21/2023 20:48', '20:01:31', 'InterviewRoom10', 1, 9),
(21, '7/5/2023 13:08', '20:01:31', 'InterviewRoom1', 5, 12),
(22, '8/27/2023 3:45', '20:01:31', 'InterviewRoom2', 2, 5),
(23, '11/6/2023 7:43', '20:01:31', 'InterviewRoom3', 11, 5),
(24, '8/4/2023 1:13', '20:01:31', 'InterviewRoom4', 11, 4),
(25, '4/26/2023 15:30', '20:01:31', 'InterviewRoom5', 3, 7),
(26, '4/7/2023 23:57', '20:01:31', 'InterviewRoom6', 4, 10),
(27, '9/3/2023 19:26', '20:01:31', 'InterviewRoom7', 6, 9),
(28, '5/8/2023 23:42', '20:01:31', 'InterviewRoom8', 4, 8),
(29, '5/8/2023 12:47', '20:01:31', 'InterviewRoom9', 7, 1),
(30, '1/4/2023 15:21', '20:01:31', 'InterviewRoom10', 13, 14),
(31, '9/21/2023 7:29', '20:01:31', 'InterviewRoom1', 15, 4),
(32, '9/18/2023 2:20', '20:01:31', 'InterviewRoom2', 4, 6),
(33, '7/9/2023 13:26', '20:01:31', 'InterviewRoom3', 9, 1),
(34, '3/15/2023 2:28', '20:01:31', 'InterviewRoom4', 14, 11),
(35, '1/25/2023 3:09', '20:01:31', 'InterviewRoom5', 8, 11),
(36, '6/22/2023 18:53', '20:01:31', 'InterviewRoom6', 9, 5),
(37, '10/13/2023 5:07', '20:01:31', 'InterviewRoom7', 14, 4),
(38, '8/12/2023 6:06', '20:01:31', 'InterviewRoom8', 5, 12),
(39, '2/27/2023 21:00', '20:01:31', 'InterviewRoom9', 6, 3),
(40, '5/30/2023 8:34', '20:01:31', 'InterviewRoom10', 7, 13),
(41, '8/3/2023 6:41', '20:01:31', 'InterviewRoom1', 11, 13),
(42, '2/22/2023 21:37', '20:01:31', 'InterviewRoom2', 4, 3),
(43, '8/14/2023 18:56', '20:01:31', 'InterviewRoom3', 4, 5),
(44, '4/15/2023 7:54', '20:01:31', 'InterviewRoom4', 11, 13),
(45, '10/22/2023 21:17', '20:01:31', 'InterviewRoom5', 4, 11);

-- Event table insert statements
INSERT INTO Event (EventID, Name, Date, Location, Description)
VALUES
    (1, 'TechCon 2023', '5/8/2023 22:20', 'Venue1', 'The largest tech conference of the year, featuring cutting-edge presentations and workshops on emerging technologies.'),
    (2, 'DataScience Summit', '5/24/2023 4:28', 'Venue2', 'Join top data scientists and analysts for a deep dive into data science methodologies and best practices.'),
    (3, 'CodeCrafters Conference', '8/1/2023 21:38', 'Venue3', 'For software developers and engineers, this conference explores the latest trends and coding techniques.'),
    (4, 'WebDev Expo', '4/25/2023 7:12', 'Venue4', 'Explore the future of web development with expert speakers and hands-on workshops.'),
    (5, 'CyberSecurity Symposium', '3/9/2023 2:15', 'Venue5', 'A gathering of cybersecurity experts to discuss strategies for protecting digital assets.'),
    (6, 'AI Innovators Forum', '8/3/2023 0:43', 'Venue6', 'Discover the potential of artificial intelligence and its impact on industries worldwide.'),
    (7, 'CloudTech Summit', '8/28/2023 10:33', 'Venue7', 'Explore the latest cloud technologies and their role in modern businesses.'),
    (8, 'DevOps World', '9/12/2023 6:21', 'Venue8', 'Learn about the intersection of development and operations and how DevOps is reshaping IT.'),
    (9, 'AnalyticsXperience', '9/21/2023 10:41', 'Venue9', 'Unlock the power of data analytics to drive informed decision-making.'),
    (10, 'Blockchain Connect', '9/3/2023 2:40', 'Venue10', 'Explore the transformative potential of blockchain technology and its real-world applications.'),
    (11, 'MobileTech Showcase', '10/19/2023 11:40', 'Venue11', 'Discover the latest advancements in mobile technology and app development.'),
    (12, 'IoT Revolution Conference', '8/26/2023 23:04', 'Venue12', 'Explore the Internet of Things and its impact on industries ranging from healthcare to manufacturing.'),
    (13, 'Software Engineering Symposium', '8/24/2023 11:54', 'Venue13', 'For software engineers and architects, this symposium delves into software design and development.'),
    (14, 'TechStartup Expo', '7/25/2023 9:49', 'Venue14', 'Connect with startups, investors, and tech enthusiasts in this vibrant startup ecosystem.'),
    (15, 'Digital Transformation Summit', '10/21/2023 20:03', 'Venue15', 'Learn how digital transformation is reshaping industries and business strategies.');

-- CandidateEvent table insert statements
INSERT INTO CandidateEvent (CandidateID, EventID, Status)
VALUES
    (13, 9, 'Attended'),
    (5, 14, 'Cancelled'),
    (4, 4, 'Registered'),
    (3, 11, 'Registered'),
    (15, 2, 'Cancelled'),
    (6, 9, 'Attended'),
    (2, 1, 'Cancelled'),
    (12, 14, 'Cancelled'),
    (4, 6, 'Attended'),
    (9, 11, 'Attended'),
    (4, 5, 'Cancelled'),
    (15, 9, 'Registered'),
    (12, 9, 'Registered'),
    (11, 4, 'Registered'),
    (15, 13, 'Attended'),
    (12, 10, 'Cancelled'),
    (13, 3, 'Registered'),
    (1, 3, 'Registered'),
    (14, 9, 'Cancelled'),
    (8, 10, 'Cancelled'),
    (3, 8, 'Registered'),
    (2, 4, 'Cancelled'),
    (3, 5, 'Registered'),
    (15, 13, 'Registered'),
    (8, 14, 'Attended'),
    (5, 13, 'Registered'),
    (2, 12, 'Registered'),
    (2, 6, 'Registered'),
    (1, 8, 'Cancelled'),
    (5, 15, 'Registered'),
    (9, 3, 'Cancelled'),
    (15, 10, 'Attended'),
    (7, 15, 'Registered'),
    (13, 10, 'Registered'),
    (8, 1, 'Registered'),
    (10, 4, 'Attended'),
    (2, 5, 'Attended'),
    (4, 13, 'Registered'),
    (2, 2, 'Cancelled'),
    (8, 5, 'Cancelled'),
    (4, 12, 'Cancelled'),
    (15, 2, 'Attended'),
    (15, 2, 'Registered'),
    (3, 15, 'Attended'),
    (4, 13, 'Attended');

-- Foreign Key Constraints
ALTER TABLE Preference ADD FOREIGN KEY (CandidateID) REFERENCES Candidate(CandidateID);
ALTER TABLE InternshipListing ADD FOREIGN KEY (EmployerID) REFERENCES Employer(EmployerID);
ALTER TABLE Rating ADD FOREIGN KEY (CandidateID) REFERENCES Candidate(CandidateID);
ALTER TABLE Rating ADD FOREIGN KEY (EmployerID) REFERENCES Employer(EmployerID);
ALTER TABLE CandidateApplication ADD FOREIGN KEY (CandidateID) REFERENCES Candidate(CandidateID);
ALTER TABLE CandidateApplication ADD FOREIGN KEY (InternshipListingID) REFERENCES InternshipListing(InternshipListingID);
ALTER TABLE Interview ADD FOREIGN KEY (InternshipListingID) REFERENCES InternshipListing(InternshipListingID);
ALTER TABLE Interview ADD FOREIGN KEY (CandidateID) REFERENCES Candidate(CandidateID);
ALTER TABLE CandidateEvent ADD FOREIGN KEY (CandidateID) REFERENCES Candidate(CandidateID);
ALTER TABLE CandidateEvent ADD FOREIGN KEY (EventID) REFERENCES Event(EventID);
ALTER TABLE Document ADD FOREIGN KEY (ApplicationID) REFERENCES CandidateApplication(CandidateApplicationID);
