/*
    
    ###############################################################
*/


-- fijar el Schema por defecto, dos maneras
SET search_path = colegio;
SET search_path TO colegio; 

-- Seleccionar todas las columnas, ordenar por fecha_nacimiento
SELECT * FROM alumnos ORDER BY fecha_nacimiento ASC;

-- Orden descendiente
SELECT * FROM alumnos ORDER BY fecha_nacimiento DESC;

-- Ordenar por 2 columnas, Seleccionar los primeros 3
SELECT * FROM alumnos ORDER BY nombres,fecha_nacimiento ASC LIMIT 3;

----------------------------------------------------------------------
-- Comparison Operators: https://www.postgresql.org/docs/current/functions-comparison.html
-- igual a
SELECT * FROM alumnos WHERE dni = '23451234J';

-- no igual a
SELECT * FROM alumnos WHERE dni <> '23451234J';
SELECT * FROM alumnos WHERE dni != '23451234J';

-- Seleccionar fecha_nacimiento mayor que ">"
SELECT * FROM alumnos WHERE fecha_nacimiento > '2003-03-01';

-- Seleccionar fecha_nacimiento menor que "<"
SELECT * FROM alumnos WHERE fecha_nacimiento < '2003-03-01';

-- Seleccionar fecha_nacimiento ENTRE (inclusivo)
SELECT * FROM alumnos WHERE fecha_nacimiento BETWEEN '2003-01-01' AND '2003-02-09';


-- Seleccionar varios appelidos 
SELECT * FROM alumnos WHERE apellidos IN ('Maroto','Cano','Penelope');



-- Comentarios no tiene valor (NULL)
SELECT * FROM alumnos WHERE comentarios IS NULL;

-- Tiene valor (IS NOT NULL)
SELECT * FROM alumnos WHERE comentarios IS NOT NULL;

-- Si la columns comentarios contiene 'comentario' con cualquier número de characteres antes o después
SELECT * FROM alumnos WHERE comentarios LIKE '%comentario%';

----------------------------------------------------------------------------
-- Columnas
-- Seleccionar todas las columnas
SELECT * FROM alumnos;


-- Seleccionar columnas específicas
SELECT dni, nombres, apellidos FROM alumnos;

-- Combinar nombre y apellidos
SELECT dni, CONCAT(nombres, ' ', apellidos) AS nombre_completo FROM alumnos;


----------------------------------------------------------------------
/*
    JOINS: https://www.postgresql.org/docs/current/queries-table-expressions.html#QUERIES-JOIN
*/

-- Seleccionar de cursos y matriculas, juntarlas usando id_curso/id_curso
SELECT cursos.id_curso, cursos.nombre, matriculas.id_alumno
FROM cursos INNER JOIN matriculas 
ON cursos.id_curso = matriculas.id_curso

-- Usar alias  c(cursos) m (matriculas) para abreviar las tablas
SELECT c.id_curso, c.nombre, m.id_alumno
FROM cursos AS c INNER JOIN matriculas AS m 
ON c.id_curso = m.id_curso

-- Seleccionar de alumnos y matriculas, juntarlas usando dni/id_alumno
SELECT alumnos.nombres, alumnos.apellidos, matriculas.id_curso, matriculas.fecha_matricula
FROM alumnos INNER JOIN matriculas 
ON alumnos.dni = matriculas.id_alumno

-- Usar alias a(alumnos) m(matriculas)
SELECT a.nombre, a.apellidos, m.id_curso, m.fecha_matricula
FROM alumnos AS a INNER JOIN matriculas AS m
ON a.dni = m.id_alumno