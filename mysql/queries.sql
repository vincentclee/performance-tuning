USE srs;

SELECT * FROM Student LIMIT 20;
SELECT * FROM Professor LIMIT 20;
SELECT * FROM Course LIMIT 20;
SELECT * FROM Teaching LIMIT 20;
SELECT * FROM Transcript LIMIT 20;

-- Queries for Project 4
-- -------------------------------------
SET @v1 = 935912;
SET @v2 = 100000;
SET @v3 = 200000;
SET @v4 = 'crsCode502260';
SET @v5 = 'name21039';
SET @v6 = 'deptId86002';
SET @v7 = 'deptId909941';
SET @v8 = 'cs';

-- 1. List the name of the student with id equal to v1 (id).
SELECT name FROM Student WHERE id = @v1;

-- 2. List the names of students with id in the range of v2 (id) to v3 (inclusive).
SELECT name FROM Student WHERE id BETWEEN @v2 AND @v3;

-- 3. List the names of students who have taken course v4 (crsCode).
SELECT name FROM Student WHERE id IN (SELECT studId FROM Transcript WHERE crsCode = @v4);

-- 4. List the names of students who have taken a course taught by professor v5 (name).
SELECT name FROM Student,
	(SELECT studId FROM Transcript,
		(SELECT crsCode, semester FROM Professor
			JOIN Teaching
			WHERE Professor.name = @v5 AND Professor.id = Teaching.profId) as alias1
	WHERE Transcript.crsCode = alias1.crsCode AND Transcript.semester = alias1.semester) as alias2
WHERE Student.id = alias2.studId;

-- 5. List the names of students who have taken a course from department v6 (deptId), but not v7.
SELECT * FROM Student, 
	(SELECT studId FROM Transcript, Course WHERE deptId = @v6 AND Course.crsCode = Transcript.crsCode
	AND studId NOT IN
	(SELECT studId FROM Transcript, Course WHERE deptId = @v7 AND Course.crsCode = Transcript.crsCode)) as alias
WHERE Student.id = alias.studId;

-- 6. List the names of students who have taken all courses offered by department v8 (deptId).
SELECT name FROM Student,
	(SELECT studId
	FROM Transcript
		WHERE crsCode IN
		(SELECT crsCode FROM Course WHERE deptId = @v8 AND crsCode IN (SELECT crsCode FROM Teaching))
		GROUP BY studId
		HAVING COUNT(*) = 
			(SELECT COUNT(*) FROM Course WHERE deptId = @v8 AND crsCode IN (SELECT crsCode FROM Teaching))) as alias
WHERE id = alias.studId;