## PRINCIPALES COMANDOS PARA TRABAJAR MySql EN TERMINAL DE UBUNTU

### Crear una BD, tablas y columnas:

Abrir MySql desde terminal:

	mysql -u root -p

	
Crear una nueva base de datos:

	CREATE DATABASE bd_prueba;


Ver todas las BD creadas:

	SHOW DATABASES;


Mostrar todas las tablas de la BD:

        SHOW TABLES;


Usar una BD en específico:

        USE bd_prueba;


Crear una nueva tabla:

        CREATE TABLE productos(
                id INT PRIMARY KEY,
                nombre_prod VARCHAR(20),
                descr_prod VARCHAR(50)
        );

Ver el detalle de los campos de una tabla:

        DESCRIBE productos;

Agregar un nuevo campo a una tabla ya existente. (tinyint es el bool):
        
        ALTER TABLE productos ADD disponible TINYINT;


Agregar AUTO_INCREMENT a una tabla ya existente:

        ALTER TABLE productos
        MODIFY COLUMN id INT AUTO_INCREMENT;


        ALTER TABLE genders
        MODIFY COLUMN acronym VARCHAR(5);


Insertar nuevos registros en la BD:

        INSERT INTO productos 
        VALUES(1, 'monitor gamer', 'bello monitor gamer');


Modificar un registro ya hecho:

        UPDATE genders
        SET col_gender = 'Femenino'
        WHERE id = 4;
        
Ver todos los registros de la tabla:

        SELECT * 
        FROM productos;
        


Crear una nueva tabla ya con NOT NULL, AUTO_INCREMENT, UNIQUE, PK, FK y relación a otra tabla.

        CREATE TABLE usuarios(
                id INT NOT NULL AUTO_INCREMENT,
                nombre VARCHAR(25) NOT NULL,
                apellido VARCHAR(27) NOT NULL, 
                email VARCHAR(50) NOT NULL UNIQUE,
                fechaNac DATE NOT NULL,
                alternativa INT UNIQUE,
                PRIMARY KEY (id),
                FOREIGN KEY (alternativa) REFERENCES productos(id)
        );



Crear una tabla con campos de marca de tiempo de creación y modificación:

        CREATE TABLE genders( 
                id_gender INT PRIMARY KEY AUTO_INCREMENT, 
                gender VARCHAR(15) UNIQUE NOT NULL, 
                acronym VARCHAR(4) UNIQUE NOT NULL, 
                        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
                        updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP 
                );



## Relacion de tablas:

Como crear una relacion entre dos tablas luego de ya tener las tablas creadas y darle un nombre especifico a la relacion:

        ALTER TABLE usuarios
        ADD CONSTRAINT fk_usuarios_producto
        FOREIGN KEY (alternativa) REFERENCES productos(id);

El nombre fk_... lleva primero la tabla donde se va a posicionar la FK. El primer parentesis tambien hace mención al campo de FK a esa primera tabla. En REFERENCES () va el id de la tabla con la PK.



Como eliminar la relacion entre dos tablas:

1. Conocer las relaciones de la tabla:

        SHOW CREATE TABLE usuarios;

2. Borramos la relacion que hay entre las dos tablas, en este caso el nombre de la relacion es usuarios_ibfk_1:

        ALTER TABLE usuarios 
        DROP FOREIGN KEY usuarios_ibfk_1;


---
Relacionar una tabla desde su creación (moodle):

        CREATE TABLE empleados( 
         id_empleado INT AUTO_INCREMENT PRIMARY KEY, 
         nombre VARCHAR(100) NOT NULL, 
         apellido VARCHAR(100) NOT NULL, 
         id_tipo_documento INT, 
         numero_de_documento VARCHAR(40) NOT NULL, 
         created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
         updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, 

                ON UPDATE CASCADE 
                ON DELETE SET NULL 
                REFERENCES tipos_de_documento(id_tipo_documento) 
                FOREIGN KEY (id_tipo_documento)
        );
---
### Vaciar y eliminar:

Eliminar un registro de una tabla:

        DELETE FROM genders
        WHERE id = 4;

Eliminar una columna de la tabla:

        ALTER TABLE productos
        DROP COLUMN campoEliminar;


Vaciar una tabla sin necesidad de eliminar la tabla por completo:

        TRUNCATE TABLE usuarios;


Eliminar una tabla:

        DROP TABLE usuarios;


Eliminar una base de datos por completo:

        DROP DATABASE bd_prueba;


---
### MOSTRAR DATOS

Seleccionar todos los registros de una tabla:

        SELECT * 
        FROM nombreTabla;


Seleccionar solo ciertas columnas:

        SELECT nombre, apellido, email
        FROM usuarios;


Seleccionar columnas asignandole alias:

        SELECT nombre AS name, 
                apellido AS lastname, 
                email
        FROM usuarios;



### JOINS

Hacer un join con tres tablas:

        SELECT  p.id_patient AS id, 
                p.name AS nombre, 
                p.last_name AS apellido_1, 
                p.last_name_2 AS apellido_2, 
                p.born_date AS fecha_nac, 
                g.id_gender AS genero,
                bt.blood_type AS tipo_sangre,
                rh.rh AS rh
        FROM patients AS p
        JOIN genders AS g
                ON p.id_gender = g.id_gender
        JOIN blood_type AS bt
                ON p.id_blood_type = bt.id_blood_type
        JOIN rh 
                ON bt.id_rh = rh.id_rh;

