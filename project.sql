CREATE TABLE Courses1 (
    CourseID INT PRIMARY KEY IDENTITY,
    CourseName NVARCHAR(100) NOT NULL,
    Credits INT NOT NULL
);
CREATE TABLE Students1 (
    StudentID INT PRIMARY KEY IDENTITY,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    DateOfBirth DATE,
    EnrollmentDate DATE
);
CREATE TABLE Enrollments1 (
    EnrollmentID INT PRIMARY KEY IDENTITY,
    StudentID INT FOREIGN KEY REFERENCES Students(StudentID),
    CourseID INT FOREIGN KEY REFERENCES Courses(CourseID),
    EnrollmentDate DATE
);
INSERT INTO Courses (CourseName, Credits)
VALUES ('Introduction to SQL', 3),
       ('Data Structures', 4),
       ('Web Development', 3);
INSERT INTO Students (FirstName, LastName, DateOfBirth, EnrollmentDate)
VALUES ('John', 'Doe', '2000-01-15', '2022-08-20'),
       ('Jane', 'Smith', '1999-05-22', '2022-08-20'),
       ('Emily', 'Jones', '2001-11-30', '2022-08-20');
INSERT INTO Enrollments (StudentID, CourseID, EnrollmentDate)
VALUES (1, 1, '2022-08-20'),
       (1, 2, '2022-08-20'),
       (2, 2, '2022-08-20'),
       (2, 3, '2022-08-20'),
       (3, 1, '2022-08-20');
	   SELECT * FROM Students;
	   SELECT s.FirstName, s.LastName
FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID
JOIN Courses c ON e.CourseID = c.CourseID
WHERE c.CourseName = 'Introduction to SQL';

SELECT c.CourseName, COUNT(e.StudentID) AS NumberOfStudents FROM Courses c LEFT JOIN Enrollments e ON c.CourseID = e.CourseID GROUP BY c.CourseName;

SELECT s.FirstName, s.LastName FROM Students s JOIN Enrollments e ON s.StudentID = e.StudentID
GROUP BY s.FirstName, s.LastName HAVING COUNT(e.CourseID) > 1;

SELECT s.FirstName, s.LastName
FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID
JOIN Courses c ON e.CourseID = c.CourseID
WHERE c.CourseName = 'Introduction to SQL';

SELECT s.FirstName, s.LastName
FROM Students s
JOIN Enrollments e1 ON s.StudentID = e1.StudentID
JOIN Enrollments e2 ON s.StudentID = e2.StudentID
JOIN Courses c1 ON e1.CourseID = c1.CourseID
JOIN Courses c2 ON e2.CourseID = c2.CourseID
WHERE c1.CourseName = 'Introduction to SQL'
  AND c2.CourseName = 'Web Development';

  SELECT COUNT(*) AS TotalEnrollments
FROM Enrollments;



