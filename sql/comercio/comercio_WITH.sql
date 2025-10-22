


/*
    WITH, CTEs
    REFS: 
        - https://www.postgresql.org/docs/18/queries-with.html
        - Learn PostreSQL - Second Edition, Chapter 5 Advanced Statements->  Exploring CTEs
*/
SET search_path = comercio; 

--Recursive CTE para crear un árbol
WITH RECURSIVE arbol_categorias AS (
     -- non recursive statement: categories sin padre, nivel empieza en 0
     -- CAST(categoria AS text) se requiere porque la expresión recursiva abajo es tipo "text": arbol_categorias.categoria || ' -> ' || categorias.categoria 
     SELECT id_categoria,id_padre,CAST(categoria AS text) AS arbol, 0 AS nivel
     FROM categorias WHERE id_padre IS NULL
     UNION 
     -- recursive statement
     SELECT categorias.id_categoria, categorias.id_padre,arbol_categorias.arbol || ' -> ' || categorias.categoria,  arbol_categorias.nivel + 1
     FROM categorias
     JOIN arbol_categorias  ON arbol_categorias.id_categoria = categorias.id_padre
)
SELECT id_categoria, id_padre, nivel, arbol FROM arbol_categorias
order by nivel; 

