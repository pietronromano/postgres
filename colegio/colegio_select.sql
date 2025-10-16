-- fijar el Schema por defecto
SET search_path = colegio; 

-- Seleccionar todas las columnas, ordenar por fecha_nacimiento
SELECT * FROM alumnos ORDER BY fecha_nacimiento ASC;

-- Orden descendiente
SELECT * FROM alumnos ORDER BY fecha_nacimiento DESC;

-- Seleccionar los primeros 3
SELECT * FROM alumnos ORDER BY fecha_nacimiento ASC LIMIT 3;

-- Seleccionar todas las columnas, filtar sobre fecha_nacimiento
SELECT * FROM alumnos WHERE fecha_nacimiento > '2003-03-01';


# Seleccionar solo unas columnas
SELECT dni, nombre, apellidos FROM alumnos;

# Combinar nombre y apellidos
SELECT dni, concat(nombre, ' ', apellidos) AS nombre_completo FROM alumnos;


# Seleccionar de cursos y matriculas, juntarlas usando id_curso/id_curso
SELECT cursos.id_curso, cursos.nombre, matriculas.id_alumno
FROM cursos INNER JOIN matriculas 
ON cursos.id_curso = matriculas.id_curso

# Usar alias  c(cursos) m (matriculas) para abreviar las tablas
SELECT c.id_curso, c.nombre, m.id_alumno
FROM cursos AS c INNER JOIN matriculas AS m 
ON c.id_curso = m.id_curso

# Seleccionar de alumnos y matriculas, juntarlas usando dni/id_alumno
SELECT alumnos.nombre, alumnos.apellidos, matriculas.id_curso, matriculas.fecha_matricula
FROM alumnos INNER JOIN matriculas 
ON alumnos.dni = matriculas.id_alumno

# Usar alias a(alumnos) m(matriculas)
SELECT a.nombre, a.apellidos, m.id_curso, m.fecha_matricula
FROM alumnos AS a INNER JOIN matriculas AS m
ON a.dni = m.id_alumno