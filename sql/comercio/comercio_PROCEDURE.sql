/*

    SEE:
        - https://www.postgresql.org/docs/current/sql-createprocedure.html

    USAGE: call (pedidos_insert(num_pedidos)
*/

SET search_path TO comercio;

CREATE PROCEDURE pedidos_insert(num_pedidos integer)
LANGUAGE SQL
AS 
$$

    FOR i IN 1..10 LOOP
        INSERT INTO tbl VALUES (a);

    END LOOP;

$$;

