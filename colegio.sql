-- Schema por defecto es "public"
SHOW search_path;
-- fijar el Schema por defecto, donde se crean las tablas
SET search_path = colegio,public; 

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


insert into alumnos
	(dni, nombre, apellidos, fecha_nacimiento, email)
VALUES
	('76983214G', 'Juan', 'Romero', '2003-02-09', 'juanromero@gmail.com'),
	('23451234J', 'Pablo', 'Guzman', '2003-12-23', 'pablog@gmail.com'),
	('90078432Y', 'Julian', 'Martin', '2003-08-16', 'juanromero@gmail.com'),
	('54678908I', 'Javier', 'Maroto', '2003-12-12', 'javierm@gmail.com'),
	('55467234X', 'Alvaro', 'Sotogrande', '2003-04-19', 'alvaros@gmail.com'),
	('45457890G', 'Felipe', 'Cano', '2003-07-28', 'felipec@gmail.com'),
	('34126789K', 'Andres', 'Penelope', '2003-10-11', 'andresp@gmail.com');

SELECT * FROM alumnos;


-- cursos ----------------------------------------------------------------
CREATE TABLE cursos(
	id_curso VARCHAR(5) PRIMARY KEY,
	nombre VARCHAR(100) NOT NULL
);

insert into cursos 
	(id_curso, nombre)
VALUES 
	('1º', 'Primer Curso'), 
	('2º', 'Segundo Curso');

SELECT * FROM cursos;


-- matriculas ----------------------------------------------------------------
CREATE TABLE matriculas(
	id_matricula int PRIMARY KEY,
	id_alumno VARCHAR(20) NOT NULL,
	id_curso VARCHAR(5) NOT NULL,
	fecha_matricula DATE DEFAULT CURRENT_DATE NOT NULL,
	
	CONSTRAINT fk_alumno FOREIGN KEY (id_alumno) REFERENCES alumnos(dni),
	CONSTRAINT fk_curso FOREIGN KEY (id_curso) REFERENCES cursos(id_curso)
);

INSERT INTO matriculas
	(id_matricula, id_alumno, id_curso)
VALUES  
	(1, '76983214G', '1º'),
	(2, '23451234J', '1º'),
	(3, '90078432Y', '1º'),
	(4, '54678908I', '2º'),
	(5, '55467234X', '2º'),
	(6, '45457890G', '2º'),
	(7, '34126789K', '2º');

SELECT * from matriculas;


--V2 matriculas con ID automático SERIAL----------------------------------------------------------------
CREATE TABLE matriculas2(
	id_matricula SERIAL PRIMARY KEY,
	id_alumno VARCHAR(20) NOT NULL,
	id_curso VARCHAR(5) NOT NULL,
	fecha_matricula DATE DEFAULT CURRENT_DATE NOT NULL,
	
	CONSTRAINT fk_alumno FOREIGN KEY (id_alumno) REFERENCES alumnos(dni),
	CONSTRAINT fk_curso FOREIGN KEY (id_curso) REFERENCES cursos(id_curso)
);

--Insertar, no hace falta proporcionar el id_matricula
INSERT INTO matriculas2
	(id_alumno, id_curso)
VALUES  
	('76983214G', '1º'),
	('23451234J', '1º'),
	('90078432Y', '1º'),
	('54678908I', '2º'),
	('55467234X', '2º'),
	('45457890G', '2º'),
	('34126789K', '2º');

SELECT * from matriculas2;
