SELECT * FROM Student ORDER BY RAND() LIMIT 2;
SELECT * FROM Transcript ORDER BY RAND() LIMIT 1;
SELECT * FROM Professor ORDER BY RAND() LIMIT 1;
SELECT * FROM Professor GROUP BY deptId HAVING COUNT(deptId) = 2;


RESET QUERY CACHE;
FLUSH QUERY CACHE;

SELECT @v1;
SELECT @v2;
SELECT @v3;
SELECT @v4;
SELECT @v5;
SELECT @v6;
SELECT @v7;
SELECT @v8;


SELECT COUNT(*) FROM Student;
SELECT COUNT(*) FROM Professor;
SELECT COUNT(*) FROM Course;
SELECT COUNT(*) FROM Teaching;
SELECT COUNT(*) FROM Transcript;


SELECT * FROM Student PROCEDURE ANALYSE();
SELECT * FROM Professor PROCEDURE ANALYSE();
SELECT * FROM Course PROCEDURE ANALYSE();
SELECT * FROM Teaching PROCEDURE ANALYSE();
SELECT * FROM Transcript PROCEDURE ANALYSE();


-- partition stuff
ALTER TABLE Student REMOVE PARTITIONING;

SHOW VARIABLES LIKE '%partition%';
SHOW PLUGINS;

ALTER TABLE `srs`.`Student` 
PARTITION BY RANGE(id) PARTITIONS 20(
PARTITION p00 VALUES LESS THAN (50000),
PARTITION p01 VALUES LESS THAN (100000),
PARTITION p02 VALUES LESS THAN (150000),
PARTITION p03 VALUES LESS THAN (200000),
PARTITION p04 VALUES LESS THAN (250000),
PARTITION p05 VALUES LESS THAN (300000),
PARTITION p06 VALUES LESS THAN (350000),
PARTITION p07 VALUES LESS THAN (400000),
PARTITION p08 VALUES LESS THAN (450000),
PARTITION p09 VALUES LESS THAN (500000),

PARTITION p10 VALUES LESS THAN (550000),
PARTITION p11 VALUES LESS THAN (600000),
PARTITION p12 VALUES LESS THAN (650000),
PARTITION p13 VALUES LESS THAN (700000),
PARTITION p14 VALUES LESS THAN (750000),
PARTITION p15 VALUES LESS THAN (800000),
PARTITION p16 VALUES LESS THAN (850000),
PARTITION p17 VALUES LESS THAN (900000),
PARTITION p18 VALUES LESS THAN (950000),
PARTITION p19 VALUES LESS THAN (1000000)
);









