USE srs;

SELECT * FROM Student LIMIT 20;
SELECT * FROM Professor LIMIT 20;
SELECT * FROM Course LIMIT 20;
SELECT * FROM Teaching LIMIT 20;
SELECT * FROM Transcript LIMIT 20;

-- Queries for Project 4
-- -------------------------------------
SET @v1 = 774861;
SET @v2 = 396624;
SET @v3 = 763176;
SET @v4 = 'crsCode917489';
SET @v5 = 'name10747';
SET @v6 = 'deptId160435';
SET @v7 = 'deptId78889';
SET @v8 = 'deptId14420';

-- 1. List the name of the student with id equal to v1 (id).
SELECT name FROM Student WHERE id = @v1;
RESET QUERY CACHE;
FLUSH QUERY CACHE;

EXPLAIN EXTENDED SELECT name FROM Student WHERE id = @v1;

-- 2. List the names of students with id in the range of v2 (id) to v3 (inclusive).
SELECT name FROM Student PARTITIONS FORCE INDEX (id_index) WHERE id BETWEEN @v2 AND @v3;
RESET QUERY CACHE;
FLUSH QUERY CACHE;

EXPLAIN EXTENDED SELECT name FROM Student PARTITIONS FORCE INDEX (id_index) WHERE id BETWEEN @v2 AND @v3;
EXPLAIN PARTITIONS SELECT name FROM Student PARTITIONS FORCE INDEX (id_index) WHERE id BETWEEN @v2 AND @v3;

-- 3. List the names of students who have taken course v4 (crsCode).
SELECT name FROM Student
	JOIN Transcript
		ON Transcript.StudId = Student.Id
WHERE Transcript.CrsCode = @v4;
RESET QUERY CACHE;
FLUSH QUERY CACHE;

EXPLAIN EXTENDED SELECT name FROM Student
	JOIN Transcript
		ON Transcript.StudId = Student.Id
WHERE Transcript.CrsCode = @v4;


-- 4. List the names of students who have taken a course taught by professor v5 (name).
SELECT DISTINCT Student.name FROM Student
	JOIN Transcript
		ON Transcript.StudId = Student.Id
	JOIN Teaching
		ON Teaching.CrsCode = Transcript.CrsCode AND Teaching.Semester = Transcript.Semester
	JOIN Professor
		ON Professor.Id = Teaching.ProfId
WHERE Professor.Name = @v5;
RESET QUERY CACHE;
FLUSH QUERY CACHE;


EXPLAIN EXTENDED SELECT DISTINCT Student.name FROM Student
	JOIN Transcript
		ON Transcript.StudId = Student.Id
	JOIN Teaching
		ON Teaching.CrsCode = Transcript.CrsCode AND Teaching.Semester = Transcript.Semester
	JOIN Professor
		ON Professor.Id = Teaching.ProfId
WHERE Professor.Name = @v5;

-- 5. List the names of students who have taken a course from department v6 (deptId), but not v7.
SELECT name FROM Student, 
	(SELECT studId FROM Transcript, Course WHERE deptId = @v6 AND Course.crsCode = Transcript.crsCode
	AND studId NOT IN
	(SELECT studId FROM Transcript, Course WHERE deptId = @v7 AND Course.crsCode = Transcript.crsCode)) as alias
WHERE Student.id = alias.studId;
RESET QUERY CACHE;
FLUSH QUERY CACHE;

EXPLAIN EXTENDED SELECT name FROM Student, 
	(SELECT studId FROM Transcript, Course WHERE deptId = @v6 AND Course.crsCode = Transcript.crsCode
	AND studId NOT IN
	(SELECT studId FROM Transcript, Course WHERE deptId = @v7 AND Course.crsCode = Transcript.crsCode)) as alias
WHERE Student.id = alias.studId;

-- 6. List the names of students who have taken all courses offered by department v8 (deptId).
SELECT name FROM Student
JOIN Transcript
	ON Student.id = Transcript.studId
		WHERE crsCode IN
		(SELECT crsCode FROM Course WHERE deptId = @v8 AND crsCode IN (SELECT crsCode FROM Teaching))
		GROUP BY studId
		HAVING COUNT(*) = 
			(SELECT COUNT(*) FROM Course WHERE deptId = @v8 AND crsCode IN (SELECT crsCode FROM Teaching));
RESET QUERY CACHE;
FLUSH QUERY CACHE;


EXPLAIN EXTENDED SELECT name FROM Student
JOIN Transcript 
	ON Student.id = Transcript.studId 
		WHERE crsCode IN
		(SELECT crsCode FROM Course WHERE deptId = @v8 AND crsCode IN (SELECT crsCode FROM Teaching))
		GROUP BY studId
		HAVING COUNT(*) = 
			(SELECT COUNT(*) FROM Course WHERE deptId = @v8 AND crsCode IN (SELECT crsCode FROM Teaching));



