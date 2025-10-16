-- Schema por defecto es "public"
SHOW search_path;
-- fijar el Schema por defecto, donde se crean las tablas
SET search_path = colegio; 

-- Eliminar tablas y esquema si ya existen: permite empezar de cero
DROP TABLE IF EXISTS matriculas; -- quitar esta primero, porque hace referencia a otras
DROP TABLE IF EXISTS matriculas2; -- quitar esta primero, porque hace referencia a otras
DROP TABLE IF EXISTS cursos; -- después de matriculas, que le hace referencia
DROP TABLE IF EXISTS alumnos; -- después de matriculas, que le hace referencia

-- Eliminar Schema último
DROP SCHEMA IF EXISTS colegio;

-- Crear un Schema ----------------------------------------------------------------
CREATE SCHEMA colegio;


-- alumnos ----------------------------------------------------------------
CREATE TABLE alumnos(
	dni VARCHAR(20) PRIMARY KEY,
	nombre VARCHAR(100) NOT NULL,
	apellidos VARCHAR(100) NOT NULL,
	fecha_nacimiento DATE NOT NULL,
	email VARCHAR(100) NOT NULL
);



-- cursos ----------------------------------------------------------------
CREATE TABLE cursos(
	id_curso VARCHAR(5) PRIMARY KEY,
	nombre VARCHAR(100) NOT NULL
);


-- matriculas ----------------------------------------------------------------
CREATE TABLE matriculas(
	id_matricula int PRIMARY KEY,
	id_alumno VARCHAR(20) NOT NULL,
	id_curso VARCHAR(5) NOT NULL,
	fecha_matricula DATE DEFAULT CURRENT_DATE NOT NULL,
	
	CONSTRAINT fk_alumno FOREIGN KEY (id_alumno) REFERENCES alumnos(dni),
	CONSTRAINT fk_curso FOREIGN KEY (id_curso) REFERENCES cursos(id_curso)
);


--V2 matriculas con ID automático SERIAL----------------------------------------------------------------
CREATE TABLE matriculas2(
	id_matricula SERIAL PRIMARY KEY,
	id_alumno VARCHAR(20) NOT NULL,
	id_curso VARCHAR(5) NOT NULL,
	fecha_matricula DATE DEFAULT CURRENT_DATE NOT NULL,
	
	CONSTRAINT fk_alumno FOREIGN KEY (id_alumno) REFERENCES alumnos(dni),
	CONSTRAINT fk_curso FOREIGN KEY (id_curso) REFERENCES cursos(id_curso)
);


