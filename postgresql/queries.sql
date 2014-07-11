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
Select Student.name
from Student
where Student.id=@v1;


-- 2. List the names of students with id in the range of v2 (id) to v3 (inclusive).
Select Student.name
from Student
where Student.id >=@v2 and Student.id <= @v3;


-- 2. List the names of students with id in the range of v2 (id) to v3 (inclusive).
Select Student.name
from Student
where Student.id BETWEEN @v2 AND @v3;

-- 3. List the names of students who have taken course v4 (crsCode).
Select Student.name
from Student, Transcript
Where Student.id=Transcript.StudId AND Transcript.crsCode=@v4;



-- 4. List the names of students who have taken a course taught by professor v5 (name).
Select Student.name
from Student, Transcript, Teaching, Professor
where Transcript.crsCode= Teaching.crsCode 
AND Student.id= Transcript.studId
AND Teaching.profID= Professor.ID
AND Professor.name= @v5;

-- 5. List the names of students who have taken a course from department v6 (deptId), but not v7.
Select Student.name
from Student, Transcript, Course
where Transcript.crsCode= Course.crsCode
and Student.id = Transcript.studId 
and Course.deptId = @v6 and Course.deptId <> @v7 ;

-- 6. List the names of students who have taken all courses offered by department v8 (deptId).
Select Student.name
from Student, Transcript, Course
where Transcript.studId = Student.id 
AND ALL Transcript.crsCode=Course.crsCode 
AND Course.deptId= @v8;

