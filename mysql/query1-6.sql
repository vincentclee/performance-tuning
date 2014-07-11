-- query1
SELECT transcript.studId
FROM transcript
WHERE transcript.grade=92597;

-- query2
SELECT name
FROM Student
WHERE Student.id BETWEEN 3000 AND 5000;

-- query3
SELECT name FROM Student NATURAL JOIN transcript WHERE crsCode IN (SELECT crsCode FROM transcript WHERE crsCode=121601);

-- query4
SELECT student.name
FROM student, transcript, course
WHERE course.deptId=235325 AND course.deptId!=23532;

-- query5
SELECT student.name
FROM student,transcript
WHERE ( SELECT student.id FROM transcript WHERE 
(SELECT crsCode FROM professor, teaching WHERE professor.id=873242 AND teaching.profId=professor.id));

-- query6
SELECT student.name
FROM student, transcript NATURAL JOIN ( SELECT teaching.crsCode
		FROM teaching,course 
		WHERE course.crsCode=teaching.crsCode AND course.deptId=323252) AS t1
WHERE transcript.crsCode=t1.crsCode;
