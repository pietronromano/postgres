---TODO - change from colegio

-- Schema por defecto es "public"
SHOW search_path;
-- fijar el Schema por defecto, donde se crean las tablas
SET search_path = comercio; 

-- productos


CREATE TABLE clientes (
    id_cliente SERIAL PRIMARY KEY,
    nombres varchar(50) NOT NULL,
	apellidos varchar(50) NOT NULL,

    comentarios text,
    fecha_alta DATE DEFAULT CURRENT_DATE NOT NULL,
    activo bool DEFAULT true
);
-- clientes ----------------------------------------------------------------
insert into clientes
	(nif,nombres, apellidos, fecha_alta, activo, comentarios)
VALUES
	('76983214G', 'Juan', 'Romero', '2003-02-09', 'juanromero@gmail.com',NULL),
	('23451234J', 'Pablo', 'Guzman', '2003-12-23', 'pablog@gmail.com',NULL),
	('90078432Y', 'Julian', 'Martin', '2003-08-16', 'juanromero@gmail.com',NULL),
	('54678908I', 'Javier', 'Maroto', '2003-12-12', 'javierm@gmail.com','un comentario...'),
	('55467234X', 'Alvaro', 'Sotogrande', '2003-04-19', 'alvaros@gmail.com','otro comentario...'),
	('45457890G', 'Felipe', 'Cano', '2003-07-28', 'felipec@gmail.com','un comentario...'),
	('34126789K', 'Andres', 'Penelope', '2003-10-11', 'andresp@gmail.com','otro comentario...');

SELECT * FROM clientes;


CREATE TABLE categorias (
    id_categoria SERIAL PRIMARY KEY,
    nombre varchar(50) NOT NULL,
    padre integer,
    comentarios text
);


CREATE TABLE productos (
    id_producto UUID PRIMARY KEY,
    nombre varchar(50) NOT NULL,
    descripcion varchar(250) NOT NULL,
    id_categoria integer NOT NULL,
    comentarios text,
    fecha_alta DATE,
    activo bool DEFAULT true,
    precio numeric DEFAULT 9.99 NOT NULL,

    CONSTRAINT fk_categoria FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);


CREATE TABLE pedidos (
    id_pedido SERIAL PRIMARY KEY,
	id_cliente integer NOT NULL,
    fecha DATE DEFAULT CURRENT_DATE NOT NULL,
    pagado bool DEFAULT false,
	comentarios text,

    CONSTRAINT fk_cliente FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

CREATE TABLE pedidos_productos (
    id_pedido integer NOT NULL,
	id_producto UUID NOT NULL,
    cantidad integer NOT NULL CONSTRAINT chk_cantidad CHECK (cantidad > 0),
	comentarios text,
    PRIMARY KEY (id_pedido, id_producto),
    CONSTRAINT fk_producto FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
	CONSTRAINT fk_pedido FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido)
);