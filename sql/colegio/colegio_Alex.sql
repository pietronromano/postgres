-- fijar el Schema por defecto, donde se crean las tablas
SET search_path = colegio; 

SELECT * FROM alumnos;


-- Requisito: Seleccionar cursos y los alumnos matriculados en cada curso
-- Seleccionar de cursos y matriculas, juntarlas usando cursos.id_curso = matriculas.id_curso

select cursos.id_curso, cursos.nombre from cursos

select matriculas.id_alumno from matriculas

select alumnnos.nombres, alumnos.apellidos from alumnos


select 
	cursos.id_curso, cursos.nombre, 
	matriculas.id_alumno,
	alumnos.nombres, alumnos.apellidos
from cursos inner join matriculas on cursos.id_curso = matriculas.id_curso
inner join alumnos on alumnos.id_alumno = matriculas.id_alumno








