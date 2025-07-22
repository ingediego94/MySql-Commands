## PRINCIPALES COMANDOS PARA TRABAJAR MySql EN TERMINAL DE UBUNTU

### Crear una BD, tablas y columnas:

Abrir MySql desde terminal:

	    mysql -u root -p
	
Crear una nueva base de datos:

	    CREATE DATABASE bd_prueba;

Ver todas las BD creadas:

	    SHOW DATABASES;

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


Insertar nuevos registros en la BD:

        INSERT INTO productos 
        VALUES(1, 'monitor gamer', 'bello monitor gamer');
        
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


Como crear una relacion entre dos tablas luego de ya tener las tablas creadas y darle un nombre especifico a la relacion:

        ALTER TABLE usuarios
        ADD CONSTRAINT fk_usuarios_producto
        FOREIGN KEY (alternativa) REFERENCES productos(id);



Como eliminar la relacion entre dos tablas:

1. Conocer las relaciones de la tabla:

        SHOW CREATE TABLE usuarios;

2. Borramos la relacion que hay entre las dos tablas, en este caso el nombre de la relacion es usuarios_ibfk_1:

        ALTER TABLE usuarios 
        DROP FOREIGN KEY usuarios_ibfk_1;


---
### Vaciar y eliminar:

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




