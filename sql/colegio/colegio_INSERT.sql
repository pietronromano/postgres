/*
    
    ###############################################################
*/

-- Schema por defecto es "public"
SHOW search_path;
-- fijar el Schema por defecto, donde se crean las tablas
SET search_path = colegio; 


-- alumnos ----------------------------------------------------------------
insert into alumnos
	(dni, nombre, apellidos, fecha_nacimiento, email, comentarios)
VALUES
	('76983214G', 'Juan', 'Romero', '2003-02-09', 'juanromero@gmail.com',NULL),
	('23451234J', 'Pablo', 'Guzman', '2003-12-23', 'pablog@gmail.com',NULL),
	('90078432Y', 'Julian', 'Martin', '2003-08-16', 'juanromero@gmail.com',NULL),
	('54678908I', 'Javier', 'Maroto', '2003-12-12', 'javierm@gmail.com','un comentario...'),
	('55467234X', 'Alvaro', 'Sotogrande', '2003-04-19', 'alvaros@gmail.com','otro comentario...'),
	('45457890G', 'Felipe', 'Cano', '2003-07-28', 'felipec@gmail.com','un comentario...'),
	('34126789K', 'Andres', 'Penelope', '2003-10-11', 'andresp@gmail.com','otro comentario...');

SELECT * FROM alumnos;


-- cursos ----------------------------------------------------------------

insert into cursos 
	(id_curso, nombre)
VALUES 
	('1º', 'Primer Curso'), 
	('2º', 'Segundo Curso');

SELECT * FROM cursos;


-- matriculas ----------------------------------------------------------------

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
