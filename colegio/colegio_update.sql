-- fijar el Schema por defecto
SET search_path = colegio; 

UPDATE alumnos SET apellidos = 'Romero Blanco' WHERE dni = '76983214G';
SELECT * FROM alumnos WHERE dni = '76983214G';

-- Usar "RETURNING" para obtener los nuevos valores automáticamente
UPDATE matriculas SET fecha_matricula = '2025-11-01' WHERE id_matricula = 1
RETURNING id_matricula, fecha_matricula;

