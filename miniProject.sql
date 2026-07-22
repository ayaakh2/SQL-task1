CREATE DATABASE Training;

-- ---------- create  ----------------
CREATE TABLE Instructors(
instructorID int primary key,
FirstName varchar(20),
LastName varchar(20),
PhoneNumber varchar(15),
Email varchar(100),
HireDate date,
Salary float,
YearsOfExperience int);

CREATE TABLE Courses(
CourseID int primary key,
CourseName varchar(50),
Description varchar(400),
CourseFee int,
StartDate date,
EndDate date,
InstructorID int,
foreign key (InstructorID) references Instructors (instructorID));

CREATE TABLE Cities(
CityID int primary key,
CityName varchar(50),
Country varchar(50));

CREATE TABLE Students(
StudentID int primary key,
FirstName varchar(50),
LastName varchar(50),
BirthDate date,
PhoneNumber varchar(15),
Email varchar(100),
CityID int,
foreign key (CityID) references Cities (CityID));

CREATE TABLE CompletionStatus(
CompletionStatusID int primary key,
CompletionStatusTitle varchar(20));

CREATE TABLE Enrollment(
EnrollmentID int primary key,
StudentID int,
CourseID int,
EnrollmentDate date,
FinalGrade float,
CompletionStatusID int,
foreign key (StudentID) references Students (StudentID),
foreign key (CourseID) references Courses (CourseID),
foreign key (CompletionStatusID) references CompletionStatus (CompletionStatusID));

-- ---------- INSERT  ----------------

INSERT INTO CompletionStatus
VALUES (1, 'Completed'),
(2, 'In Progress'),
(3, 'Dropped');

INSERT INTO Cities VALUES (1,'Amman','Jordan'),
(2,'Irbid','Jordan'),
(3,'Zarqa','Jordan'),
(4,'Aqaba','Jordan'),
(5,'Madaba','Jordan'),
(6,'Salt','Jordan') ,
(7,'Jerash','Jordan'),
(8,'Ajloun','Jordan');

INSERT INTO Instructors VALUES (1,'Aya','Khallouf','0771111111','aya@center.com','2020-01-15',2200,10),
(2,'Sara','Ali','0792222222','sara@center.com','2021-03-12',1800,7),
(3,'Omar','Khaled','0793333333','omar@center.com','2019-05-10',2500,12),
(4,'Lina','Hassan','0794444444','lina@center.com','2022-09-01',1700,5),
(5,'Mohammad','Salem','0795555555','mohammad@center.com','2018-11-20',2600,15),
(6,'Noor','Yousef','0796666666','noor@center.com','2023-02-15',1600,3),
(7,'Rami','Naser','0797777777','rami@center.com','2021-07-05',1900,6),
(8,'Dana','Khalil','0798888888','dana@center.com','2020-08-18',2100,9);

INSERT INTO Courses VALUES (101,'HTML','HTML Basics',150,'2026-07-01','2026-08-01',1),
(102,'CSS','CSS Fundamentals',160,'2026-07-05','2026-08-10',2),
(103,'JavaScript','JavaScript Programming',200,'2026-07-10','2026-08-20',1),
(104,'SQL','Database Management',180,'2026-07-15','2026-08-25',3),
(105,'Python','Python Programming',220,'2026-07-20','2026-09-01',4),
(106,'Java','Java Fundamentals',240,'2026-08-01','2026-09-15',5),
(107,'C#','Object Oriented Programming',230,'2026-08-05','2026-09-20',6),
(108,'PHP','Backend Development',210,'2026-08-10','2026-09-25',7);

INSERT INTO Students VALUES (1,'Fahed','Diaa','2003-05-14','0799000001','ahmad@gmail.com',1),
(2,'Ahmad','Ali','2002-08-22','0799000002','ahmad@gmail.com',2),
(3,'Sara','Omar','2004-01-18','0799000003','sara@gmail.com',3),
(4,'Mohammad','Saleh','2001-09-10','0799000004','mohammad@gmail.com',4),
(5,'Lina','Hasan','2003-11-06','0799000005','lina@gmail.com',5),
(6,'Rama','Yousef','2002-06-15','0799000006','rama@gmail.com',6),
(7,'Yazan','Ahmad','2003-04-20','0799000007','yazan@gmail.com',7),
(8,'Noor','Khaled','2004-02-11','0799000008','noor@gmail.com',8);

INSERT INTO Enrollment VALUES (1,1,101,'2026-07-01',95,1),
(2,2,102,'2026-07-03',88,2),
(3,3,103,'2026-07-05',91,1),
(4,4,104,'2026-07-07',40,3),
(5,5,105,'2026-07-09',84,2),
(6,6,106,'2026-07-11',98,1),
(7,7,107,'2026-07-13',72,2),
(8,8,108,'2026-07-15',65,3);

-- ---------- select  ----------------

select * FROM Students;
select * FROM Instructors;
select * FROM Courses;

SELECT DISTINCT c.CourseName
FROM Courses c
JOIN Enrollment e
ON c.CourseID = e.CourseID
JOIN CompletionStatus cs
ON e.CompletionStatusID = cs.CompletionStatusID
WHERE cs.CompletionStatusTitle = 'Completed';

select s.FirstName
From Students s JOIN Enrollment e ON 
s.StudentID = e.StudentID
WHERE e.FinalGrade > 80;

SELECT s.FirstName
FROM Students s JOIN Cities c ON
s.CityID = c.CityID 
WHERE c.CityName ='Amman';

SELECT c.CourseName
FROM Courses c JOIN Instructors i ON
c.InstructorID = i.instructorID
WHERE i.FirstName ='Aya';

SELECT s.FirstName
From Students s Join Enrollment e ON
s.StudentID = e.StudentID
WHERE e.EnrollmentDate > '2026-07-05';

SELECT FirstName FROM Students WHERE FirstName LIKE 'A%';

select s.FirstName
From Students s JOIN Enrollment e ON 
s.StudentID = e.StudentID
WHERE e.FinalGrade BETWEEN 70 AND 90;

-- ---------- UPDATE  ----------------

UPDATE Enrollment SET FinalGrade = 90 WHERE StudentID =4;
UPDATE Students SET CityID = 1 WHERE StudentID =4;
UPDATE Courses SET CourseName = 'JavaScript' WHERE CourseID =106;
Update Instructors SET FirstName='Faris', PhoneNumber='0771234567',Email='faris@center.com', Salary = 2000 WHERE instructorID =7;
UPDATE Enrollment SET CompletionStatusID= 1 WHERE EnrollmentID=2;

-- ---------- DELETE  ----------------

DELETE FROM Enrollment WHERE EnrollmentID =8;
DELETE FROM Students WHERE StudentID =8;
DELETE FROM Courses WHERE CourseID =8;

DELETE from Enrollment
WHERE StudentID IN(
SELECT s.StudentID 
FROM Students s JOIN Enrollment e
on s.StudentID = e.StudentID
join CompletionStatus cs ON 
e.CompletionStatusID = cs.CompletionStatusID
where cs.CompletionStatusTitle = 'dropped ');

DELETE from Students
WHERE StudentID IN(
SELECT s.StudentID 
FROM Students s JOIN Enrollment e
on s.StudentID = e.StudentID
join CompletionStatus cs ON 
e.CompletionStatusID = cs.CompletionStatusID
where cs.CompletionStatusTitle = 'dropped ');

-- ---------- join  ----------------

SELECT Students.FirstName,Cities.CityName
FROM Students inner join Cities ON
Students.CityID = Cities.CityID;

SELECT*FROM Instructors LEFT JOIN Courses ON Instructors.instructorID = Courses.InstructorID;
SELECT*FROM Instructors Right JOIN Courses ON Instructors.instructorID = Courses.InstructorID;	
SELECT*FROM Instructors FULL OUTER JOIN Courses ON Instructors.instructorID = Courses.InstructorID;	

-- ---------- ALTER  ----------------

EXEC sp_rename 'CompletionStatus','Status';
EXEC sp_rename 'Students.PhoneNumber', 'Phone', 'COLUMN';

ALTER TABLE Students
ADD gender VARCHAR(10);

ALTER TABLE Students
DROP COLUMN Email;

ALTER TABLE Students
ALTER COLUMN FirstName VARCHAR(100);

