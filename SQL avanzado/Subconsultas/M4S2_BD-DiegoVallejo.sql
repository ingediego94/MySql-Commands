/*
	CREACION DE BASE DE DATOS PARA LA GESTION ACADEMICA DE UNIVERSIDAD
		MODULO 4 SEMANA 2 (M4S2)
		BY: Diego Vallejo Z.
		Clan Hopper | Riwi
*/


-- To show all databases.
SHOW DATABASES;

-- To create a new database named: gestion_academica_universidad.
CREATE DATABASE gestion_academica_universidad;

-- To use the new database.
USE gestion_academica_universidad;

-- CREATION OF TABLES:

-- Creation of table career.
CREATE TABLE careers(
	id_career 	INT AUTO_INCREMENT PRIMARY KEY,
    career 		VARCHAR(30) NOT NULL UNIQUE,
    status		BOOLEAN NOT NULL,
	created_at	TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at	TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Creation of table document_types.
CREATE TABLE document_types(
	id_document_type	INT AUTO_INCREMENT PRIMARY KEY,
    document_type		VARCHAR(20) NOT NULL UNIQUE,
    acronym_doc_type	VARCHAR(5) NOT NULL UNIQUE,
    status 				BOOLEAN NOT NULL,
    created_at			TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at			TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Creation of table gender.
CREATE TABLE genders(
	id_gender	INT AUTO_INCREMENT PRIMARY KEY,
    gender		VARCHAR(20) NOT NULL,
    created_at	TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at	TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Creation of table students.
CREATE TABLE students(
	id_student		INT AUTO_INCREMENT PRIMARY KEY,
    name			VARCHAR(20) NOT NULL,
    lastname_1		VARCHAR(20) NOT NULL,
    lastname_2		VARCHAR(20),
    email			VARCHAR(50) NOT NULL UNIQUE,
    id_gender		INT NOT NULL,
    id_document_type INT NOT NULL,
    number_doc_type	INT NOT NULL UNIQUE,
    id_career		INT NOT NULL,
    birth_date		DATE NOT NULL,
    start_date		DATE NOT NULL,
    status			BOOLEAN NOT NULL,
    created_at		TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at		TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


-- Creation of table academic_departments.
CREATE TABLE academic_depts(
	id_academic_dept	INT AUTO_INCREMENT PRIMARY KEY,
    academic_dept		VARCHAR(30) NOT NULL UNIQUE,
    status 				BOOLEAN NOT NULL,
	created_at			TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at			TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


-- Creation of table teachers.
CREATE TABLE teachers(
	id_teacher		INT AUTO_INCREMENT PRIMARY KEY,
    name			VARCHAR(25) NOT NULL,
    lastname_1		VARCHAR(25) NOT NULL,
    lastname_2		VARCHAR(25),
    email			VARCHAR(50) NOT NULL UNIQUE,
    id_academic_dept INT NOT NULL,
    experience_years INT NOT NULL,
    status			BOOLEAN NOT NULL,
	created_at		TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at		TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


-- Creation of table courses.
CREATE TABLE courses(
	id_course	INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(30) NOT NULL UNIQUE,
    course_code	INT NOT NULL,
    number_credits INT NOT NULL,
    semester	INT NOT NULL,
    id_teacher	INT NOT NULL,
    status		BOOLEAN NOT NULL,
	created_at	TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at	TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


-- Creation of table inscriptions.
CREATE TABLE inscriptions(
	id_inscription 		INT AUTO_INCREMENT PRIMARY KEY,
    id_student			INT NOT NULL,
    id_course			INT NOT NULL,
    iscription_date		DATE NOT NULL,
    final_grade			DATE NOT NULL,
	created_at			TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at			TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


-- ----------------------------------------------------------------------------------------------

-- Doing relations between tables.

-- Relation between students and genders.
ALTER TABLE students
ADD CONSTRAINT fk_students_genders
FOREIGN KEY (id_gender) REFERENCES genders(id_gender);


-- Relation between students and document_types.
ALTER TABLE students
ADD CONSTRAINT fk_students_document_types
FOREIGN KEY (id_document_type) REFERENCES document_types(id_document_type);


-- Relation between students and careers.
ALTER TABLE students
ADD CONSTRAINT fk_students_careers
FOREIGN KEY (id_career) REFERENCES careers(id_career);

-- Relation between inscriptions and students.
ALTER TABLE inscriptions
ADD CONSTRAINT fk_inscriptions_students
FOREIGN KEY (id_student) REFERENCES students(id_student);

-- Relation between teachers and academic_depts.
ALTER TABLE teachers
ADD CONSTRAINT fk_teachers_academic_depts
FOREIGN KEY (id_academic_dept) REFERENCES academic_depts(id_academic_dept);


-- Relation between courses and teachers.
ALTER TABLE courses
ADD CONSTRAINT fk_courses_teachers
FOREIGN KEY (id_teacher) REFERENCES teachers(id_teacher);


-- Relation between inscriptions and courses.
ALTER TABLE inscriptions
ADD CONSTRAINT fk_inscriptions_courses
FOREIGN KEY (id_course) REFERENCES courses(id_course);


-- ----------------------------------------------------------------------------------------------
-- Input registers on tables.
-- Input registers on careers.
INSERT INTO careers(career, status)
VALUES('Software Engineering', true);

INSERT INTO careers(career, status)
VALUES('Civil Engineering', true);

INSERT INTO careers(career, status)
VALUES('Mathematical Engineering', true);


-- Input registers on document_types:
INSERT INTO document_types(document_type, acronym_doc_type, status)
VALUES('Cédula de ciudadanía', 'CC', true);

INSERT INTO document_types(document_type, acronym_doc_type, status)
VALUES('Tarjeta de Identidad', 'TI', true);

INSERT INTO document_types(document_type, acronym_doc_type, status)
VALUES('Pasaporte', 'PP', true);

-- Input registers on genders:
INSERT INTO genders(gender)
VALUES('Masculino');

INSERT INTO genders(gender)
VALUES('Femenino');


-- Input registers on students:
INSERT INTO students(name, lastname_1, lastname_2, email, id_gender, id_document_type, number_doc_type, id_career, birth_date, start_date, status)
VALUES('Diego','Vallejo','Zapata', 'diego@gmail.com', 1, 1, 1085310999, 1, '1994-03-04', '2025-03-26', 1);

INSERT INTO students(name, lastname_1, lastname_2, email, id_gender, id_document_type, number_doc_type, id_career, birth_date, start_date, status)
VALUES('Sara','Gonzales','Escobar', 'sara@gmail.com', 2, 1, 108232219, 2, '1999-05-11', '2025-04-12', 1);

INSERT INTO students(name, lastname_1, lastname_2, email, id_gender, id_document_type, number_doc_type, id_career, birth_date, start_date, status)
VALUES('Valentina','Zamora','Vasquez', 'valen@gmail.com', 2, 2, 232310999, 1, '2008-07-31', '2025-05-22', 1);

INSERT INTO students(name, lastname_1, lastname_2, email, id_gender, id_document_type, number_doc_type, id_career, birth_date, start_date, status)
VALUES('Carlos','Garcia','Torres', 'esteban@gmail.com', 1, 1, 1023231212, 1, '1999-12-04', '2025-01-28', 1);

INSERT INTO students(name, lastname_1, lastname_2, email, id_gender, id_document_type, number_doc_type, id_career, birth_date, start_date, status)
VALUES('Julian','Jimenez','Chica', 'j.jimenez@gmail.com', 1, 1, 1000310399, 3, '2000-11-14', '2023-05-29', 1);

INSERT INTO students(name, lastname_1, lastname_2, email, id_gender, id_document_type, number_doc_type, id_career, birth_date, start_date, status)
VALUES('Maria','Stauffemberg','Lopez', 'maria.s@gmail.com', 2, 3, 18383999, 3, '1990-06-04', '2022-03-01', 1);


-- Input registers on academic_depts


-- Input registers on teachers


-- Input registers on courses


-- Input registers on inscriptions
