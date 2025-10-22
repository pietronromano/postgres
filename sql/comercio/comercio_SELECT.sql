/*
    --Ejemplos de consultas
    ###############################################################
*/

-- fijar el Schema por defecto, dos maneras
SET search_path = comercio;
SET search_path TO comercio; 

-- Seleccionar todas las columnas, ordenar por fecha_alta
SELECT * FROM clientes ORDER BY fecha_alta ASC;

-- Orden descendiente
SELECT * FROM clientes ORDER BY fecha_alta DESC;

-- Seleccionar los primeros 3
SELECT * FROM clientes ORDER BY fecha_alta ASC LIMIT 3;

----------------------------------------------------------------------
-- Comparison Operators: https://www.postgresql.org/docs/current/functions-comparison.html
-- igual a
SELECT * FROM clientes WHERE nif = '11111111A';

-- no igual a
SELECT * FROM clientes WHERE nif <> '11111111A';
SELECT * FROM clientes WHERE nif != '11111111A';

-- Seleccionar fecha_alta mayor que ">"
SELECT * FROM clientes WHERE fecha_alta > '2001-03-01';

-- Seleccionar fecha_alta menor que "<"
SELECT * FROM clientes WHERE fecha_alta < '2001-03-01';

-- Seleccionar fecha_alta ENTRE (inclusivo)
SELECT * FROM clientes WHERE fecha_alta BETWEEN '2001-01-01' AND '2003-03-31';

-- Comentarios no tiene valor (NULL)
SELECT * FROM clientes WHERE comentarios IS NULL;

-- Tiene valor (IS NOT NULL)
SELECT * FROM clientes WHERE comentarios IS NOT NULL;

----------------------------------------------------------------------------
-- Columnas
-- Seleccionar todas las columnas
SELECT * FROM clientes;

-- Seleccionar columnas específicas
SELECT nif, nombre, apellidos FROM clientes;

-- Combinar nombre y apellidos
SELECT nif, concat(nombres, ' ', apellidos) AS nombre_completo FROM clientes;


----------------------------------------------------------------------
-- JOINS: https://www.postgresql.org/docs/current/queries-table-expressions.html#QUERIES-JOIN
-- Seleccionar de clientes y pedidos
SELECT 
    clientes.id_cliente, nombres, clientes.apellidos, pedidos.fecha, pedidos.pagado
FROM clientes 
INNER JOIN pedidos 
ON pedidos.id_cliente = pedidos.id_cliente;
