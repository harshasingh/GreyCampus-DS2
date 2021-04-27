CREATE TABLE students(
	student_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	homeroom_number INTEGER,
	phone VARCHAR(25) UNIQUE NOT NULL,
	email VARCHAR(100) UNIQUE,
	graduation_year INTEGER
)

SELECT * FROM students;

CREATE TABLE teachers(
	teacher_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	homeroom_number INTEGER,
	department VARCHAR(60),
	phone VARCHAR(25) UNIQUE NOT NULL,
	email VARCHAR(200) UNIQUE
)

SELECT * FROM teachers;

INSERT INTO students
(first_name,last_name, homeroom_number,phone,graduation_year)
VALUES('Mark','Watney',5,'777-555-1234','2035');

INSERT INTO students
(student_id,first_name,last_name, homeroom_number,phone,graduation_year)
VALUES(2,'Mickey','Watney',5,'777-555-1234','2035');

SELECT * FROM students;

INSERT INTO students
(first_name,last_name, homeroom_number,graduation_year)
VALUES('Harsha','Singh',29,'2021');

INSERT INTO teachers
(first_name, last_name,homeroom_number,phone,department,email)
VALUES('Jonas','Salk',5,'777-555-4321','Biology','jsalk@school.org');

INSERT INTO teachers
(teacher_id,first_name, last_name,homeroom_number,phone,department,email)
VALUES(1,'Jim','Salk',8,'777-575-4321','Biology','jsalk@school.org');

INSERT INTO teachers
(teacher_id,first_name, last_name,homeroom_number,phone,department,email)
VALUES('Jim','Salk',8,'777-555-4321','Biology','jsalk@school.org');

INSERT INTO teachers
(teacher_id,first_name, last_name,homeroom_number,phone,department,email)
VALUES(2,'Jim','Salk',8,'777-575-4321','Biology','jsalk@school.org');

SELECT * FROM teachers;






