CREATE DATABASE srs;

USE srs;

-- Student Registration database schema
-- -------------------------------------
CREATE TABLE Student (
	Id INT,
	Name VARCHAR(255),
	Address VARCHAR(255),
	Status VARCHAR(255)
);

CREATE TABLE Professor (
	Id INT,
	Name VARCHAR(255),
	DeptId VARCHAR(255)
);

CREATE TABLE Course (
	DeptId VARCHAR(255),
	CrsCode VARCHAR(255),
	CrsName VARCHAR(255),
	Descr VARCHAR(255)
);

CREATE TABLE Teaching (
	ProfId INT,
	CrsCode VARCHAR(255),
	Semester VARCHAR(255)
);

CREATE TABLE Transcript (
	StudId INT,
	CrsCode VARCHAR(255),
	Semester VARCHAR(255),
	Grade VARCHAR(255)
);


-- Data Population
-- -------------------------------------
INSERT INTO Student (Id, Name, Address, Status)
	VALUES (111111111, 'John Doe', '123 Main St.', 'Freshman'),
	(666666666, 'Joseph Public', '666 Hollow Rd.', 'Sophomore'),
	(111223344, 'Mary Smith', '1 Lake St.', 'Freshman'),
	(987654321, 'Bart Simpson', 'Fox 5 TV', 'Senior'),
	(023456789, 'Homer Simpson', 'Fox 5 TV', 'Senior'),
	(123454321, 'Joe Blow', '6 Yard Ct.', 'Junior');

INSERT INTO Professor (Id, Name, DeptId)
	VALUES (101202303, 'John Smyth', 'CS'),
	(783432188, 'Adrian Jones', 'MGT'),
	(121232343, 'David Jones', 'EE'),
	(864297531, 'Qi Chen', 'MAT'),
	(555666777, 'Mary Doe', 'CS'),
	(009406321, 'Jacob Taylor', 'MGT'),
	(900120450, 'Ann White', 'MAT');

INSERT INTO Course (DeptId, CrsCode, CrsName, Descr)
	VALUES ('CS', 'CS305', 'Database Systems', 'On the road to high-paying job'),
	('CS', 'CS315', 'Transaction Processing', 'Recover from your worst crashes'),
	('MGT', 'MGT123', 'Market Analysis', 'Get rich quick'),
	('EE', 'EE101', 'Electronic Circuits', 'Build your own computer'),
	('MAT', 'MAT123', 'Algebra', 'The world where 2 * 2 != 4');

INSERT INTO Teaching (ProfId, CrsCode, Semester)
	VALUES (009406321, 'MGT123', 'F1994'),
	(121232343, 'EE101', 'S1991'),
	(555666777, 'CS305', 'F1995'),
	(101202303, 'CS315', 'S1997'),
	(900120450, 'MAT123', 'S1996'),
	(121232343, 'EE101', 'F1995'),
	(101202303, 'CS305', 'S1996'),
	(900120450, 'MAT123', 'F1997'),
	(783432188, 'MGT123', 'F1997');

INSERT INTO Transcript (StudId, CrsCode, Semester, Grade)
	VALUES (666666666, 'MGT123', 'F1994', 'A'),
	(666666666, 'EE101', 'S1991', 'B'),
	(666666666, 'MAT123', 'F1997', 'B'),
	(987654321, 'CS305', 'F1995', 'C'),
	(987654321, 'MGT123', 'F1994', 'B'),
	(123454321, 'CS315', 'S1997', 'A'),
	(123454321, 'CS305', 'S1996', 'A'),
	(123454321, 'MAT123', 'S1996', 'C'),
	(023456789, 'EE101', 'F1995', 'B'),
	(023456789, 'CS305', 'S1996', 'A'),
	(111111111, 'EE101', 'F1997', 'A'),
	(111111111, 'MAT123', 'F1997', 'B'),
	(111111111, 'MGT123', 'F1997', 'B');

-- -------------------------------------
-- WARNING
-- -------------------------------------
TRUNCATE TABLE Student;
TRUNCATE TABLE Professor;
TRUNCATE TABLE Course;
TRUNCATE TABLE Teaching;
TRUNCATE TABLE Transcript;
