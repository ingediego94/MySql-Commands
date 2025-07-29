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


Renombrar un campo o columna:

        ALTER TABLE gender
        RENAME COLUMN person_gender TO sex;


Agregar un nuevo campo a una tabla ya existente. (tinyint es el bool):
        
        ALTER TABLE productos ADD disponible TINYINT;


Agregar un campo de tipo booleano a una tabla existente, con un valor por defecto (TRUE):

        ALTER TABLE productos 
        ADD activo BOOLEAN DEFAULT TRUE;


Agregar AUTO_INCREMENT a una tabla ya existente:

        ALTER TABLE productos
        MODIFY COLUMN id INT AUTO_INCREMENT;


        ALTER TABLE genders
        MODIFY COLUMN acronym VARCHAR(5);


Insertar nuevos registros en la BD:

        INSERT INTO productos 
        VALUES(1, 'monitor gamer', 'bello monitor gamer');


Modificar y/o actualizar un registro ya hecho:

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






---

## DCL: DATA CONTROL LANGUAGE
Los comandos DCL gestionan la seguridad y los permisos en una base de datos, definiendo quién puede acceder a los datos y qué acciones puede realizar. Esto garantiza la integridad y privacidad de la información. 

Usuarios y roles:
- Usuarios: Personas o aplicaciones con acceso a la base de datos. 
- Roles: Grupos de permisos asignados a usuarios para facilitar la gestión de autorizaciones. 


### GRANT (otorgar permisos):
Asigna permisos específicos a usuarios o roles, como consultar, insertar, modificar o eliminar datos.

1. Otorgar todos los privilegios sobre una base de datos específica:

        GRANT ALL PRIVILEGES ON basededatos.* TO 'usuario1'@'localhost';

- basededatos.*: todos los objetos (tablas, vistas, etc.) de la base de datos.

- 'usuario1'@'localhost': el nombre del usuario y el host desde el que se conecta.


2. Otorgar privilegios específicos sobre una base de datos:

        GRANT SELECT, INSERT, UPDATE ON basededatos.* TO 'usuario1'@'localhost';


3. Otorgar privilegios sobre una tabla específica:

        GRANT SELECT, INSERT, UPDATE ON bd.clientes TO 'usuario1'@'localhost';

Al usuario1 se le otorgan permisos para:
- SELECT: Consultar datos de la tabla clientes.
- INSERT: Insertar registros en la tabla clientes.
- UPDATE: Actualizar registros en la tabla clientes.


4. Otorgar permisos globales (sobre todas las bases de datos y tablas):

        GRANT ALL PRIVILEGES ON *.* TO 'usuario1'@'localhost' WITH GRANT OPTION;

- asterisco.asterisco: todas las bases de datos y tablas.

- WITH GRANT OPTION: permite que el usuario otorgue sus propios permisos a otros.


 5. Crear usuario y otorgar permisos (todo en uno):

        CREATE USER 'usuario1'@'localhost' IDENTIFIED BY 'tu_contraseña';
        GRANT ALL PRIVILEGES ON basededatos.* TO 'usuario1'@'localhost';




### REVOKE (Revocar permisos):
Retira permisos previamente asignados, restringiendo el acceso o acciones específicas.

        REVOKE SELECT ON clientes FROM  usuario1;

Si se revoca el permiso SELECT a usuario1, este ya no podrá consultar los datos de la tabla clientes, aunque otros permisos (como INSERT) permanecerán intactos a menos que también sean revocados.


 1. Revocar permisos específicos sobre una base de datos:

        REVOKE SELECT, INSERT ON basededatos.* FROM 'usuario1'@'localhost';

Esto quitará los permisos SELECT e INSERT sobre todas las tablas de la base de datos basededatos.


2. Revocar permisos sobre una tabla específica:

        REVOKE UPDATE ON basededatos.nombre_tabla FROM 'usuario1'@'localhost';

3. Revocar todos los permisos sobre una base de datos
Si no sabes qué permisos tiene, puedes revocar todos los posibles con:

        REVOKE ALL PRIVILEGES ON basededatos.* FROM 'usuario1'@'localhost';

4. Revocar permisos globales:

        REVOKE ALL PRIVILEGES ON *.* FROM 'usuario1'@'localhost';


5. Revocar la opción de otorgar permisos a otros (GRANT OPTION):

        REVOKE GRANT OPTION ON basededatos.* FROM 'usuario1'@'localhost';




### CONSULTAR QUE PERMISOS TIENEN UN USUARIO:

1. Ver permisos globales del usuario:

        SHOW GRANTS FOR 'usuario1'@'localhost';

Esto muestra todas las declaraciones GRANT asociadas a ese usuario, incluyendo permisos globales y específicos de bases de datos o tablas.


2. Ver los permisos del usuario actualmente conectado
Si ya estás conectado como usuario1, puedes simplemente ejecutar:

        SHOW GRANTS;


 3. Ver todos los usuarios y sus hosts (opcional, para verificar)

        SELECT User, Host FROM mysql.user;

Esto te ayuda a confirmar que estás consultando el usuario1 correcto (por ejemplo, puede haber un 'usuario1'@'%' y un 'usuario1'@'localhost').




---

## TCL: TRANSACTION CONTROL LANGUAGE

Los comandos TCL, aseguran que las operaciones en la base de datos sean consistentes y seguras, gestionando las transacciones para confirmar cambios exitosos o revertir errores, garantizando la integridad de los datos. 

### COMMIT: Guardar cambios.

Confirma y guarda de forma permanente todos los cambios realizados en una transacción, haciéndolos visibles para otros usuarios.
Durante una venta, tras insertar un nuevo pedido y actualizar el inventario, se utiliza COMMIT para garantizar que los cambios sean definitivos.

        -- Inserta un nuevo pedido:

        INSERT INTO pedidos(cliente_id, fecha, total) 
        VALUES (123, '2025-01-25', 250.55);


        -- Actualizar el inventario:

        UPDATE productos
        SET cantidad = cantidad - 1
        WHERE producto_id = 456;


        -- Si ambas operaciones fueron exitosas, confirmamos los cambios.

        COMMIT;



### ROLLBACK: Revertir cambios.

Deshace todos los cambios realizados en una transacción cuando ocurre un error, dejando la base de datos en su estado inicial.

Si al procesar una venta no se puede actualizar el inventario, ROLLBACK revierte tanto la inserción del pedido como cualquier cambio previo en la transacción.


        -- Inserta un nuevo pedido:

        INSERT INTO pedidos(cliente_id, fecha, total) 
        VALUES (123, '2025-01-25', 250.55);


        -- Actualizar el inventario:

        UPDATE productos
        SET cantidad = cantidad - 1
        WHERE producto_id = 456;


        -- Error al intentar actualizar el inventario (por ej. cantidad insuficiente):

        ROLLBACK;



### SAVEPOINT: Puntos de control.

Establece puntos dentro de una transacción para deshacer solo las operaciones realizadas después de ese punto, sin afectar las anteriores.

Durante la actualización de pedidos y clientes, un SAVEPOINT permite revertir únicamente la actualización de clientes si ocurre un error, dejando intactos los cambios previos.

        -- Comenzamos una transaccion:

        BEGIN;


        -- Inserta un nuevo pedido:

        INSERT INTO pedidos(cliente_id, fecha, total) 
        VALUES (123, '2025-01-25', 250.55);


        -- Establecer un punto de control:

        SAVEPOINT antes_actualizacion_cliente;


        -- Actualizar el nombre del cliente:

        UPDATE clientes
        SET nombre = 'Juan Perez'
        WHERE cliente_id = 123;
        

        -- Ocurre un error al actualizar el cliente
        -- Por ejemplo (el nombre ya existe)

        ROLLBACK TO antes_actualizacion_cliente;

        -- En este caso solo se revierte la actualizacion del cliente.
        -- pero el pedido sigue en la base de datos.

        COMMIT;
