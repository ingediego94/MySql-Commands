## COMO CARGAR MASIVAMENTE DATOS DE CSV A UNA TABLA EN MYSQL

1. Verificar el contenido del .csv

        head employees_sample.csv

Asegúrate de saber:

- Si tiene encabezados (nombres de columnas)
- Qué delimitador usa (usualmente una coma ,)
- El orden de las columnas y los tipos de datos aproximados.


2. Accede a MySQL desde la terminal:

        mysql -u root -p

- Ingresa tu contraseña cuando te la pida.


3. Selecciona la base de datos

        USE empresa_software;


4. Crea la tabla (si no existe)

En este caso el .csv tiene los siguientes campos:
        
        name, lastname, lastname2, email, charge, city, salary, age

Crear la tabla así:

        CREATE TABLE employees (
            id_employee INT AUTO_INCREMENT PRIMARY KEY,
            name VARCHAR(30),
            lastname VARCHAR(30),
            lastname2 VARCHAR(30),
            email VARCHAR(100),
            charge VARCHAR(20),
            city VARCHAR(25),
            salary DECIMAL(10,2),
            age INT 
        );


5. Sal de MySQL

        exit;

6. Mueve el archivo a una ruta accesible por MySQL

MySQL usualmente no puede leer archivos directamente de /home/usuario por permisos. Muévelo a /var/lib/mysql-files/:

        sudo mv employees_sample.csv /var/lib/mysql-files/

Y dale los permisos correctos:

        sudo chown mysql:mysql /var/lib/mysql-files/employees_sample.csv


7. Importa el CSV con LOAD DATA INFILE

        mysql -u root -p

Y ejecuta:

        USE empresa_software;

        LOAD DATA INFILE '/var/lib/mysql-files/employees_sample.csv'
        INTO TABLE empleados
        FIELDS TERMINATED BY ','
        ENCLOSED BY '"'
        LINES TERMINATED BY '\n'
        IGNORE 1 ROWS
        (name, lastname, lastname2, email, charge, city, salary, age);
    
Explicación:

- FIELDS TERMINATED BY ',': separador de campos
- ENCLOSED BY '"': campos entre comillas (opcional según el CSV)
- LINES TERMINATED BY '\n': salto de línea tipo UNIX
- IGNORE 1 ROWS: ignora la primera fila (encabezado)




