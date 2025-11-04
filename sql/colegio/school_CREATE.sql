/*
    Schema used for java-spring Hibernate examples
    https://github.com/pietronromano/java-spring/blob/main/hibernate/my-docs/schema.sql
*/
DROP SCHEMA IF EXISTS school;

-- Crear un Schema ----------------------------------------------------------------
CREATE SCHEMA school;

SET search_path = school; 

CREATE TABLE students(
	id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	date_of_birth DATE NOT NULL,
	email VARCHAR(100) CONSTRAINT unique_email UNIQUE NOT NULL,
	comments text
);

SELECT * FROM students