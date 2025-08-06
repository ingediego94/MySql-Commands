INSTALAR:

        npm install express mysql2 csv-parser mult
er

- Crear una BD así:

        CREATE DATABASE riwi;

        USE riwi;

        CREATE TABLE employees(
            idEmployee INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
            name VARCHAR(100),
            lastname VARCHAR(58),
            lastname2 VARCHAR(58),
            email VARCHAR(58),
            charge VARCHAR(58),
            city VARCHAR(100),
            salary FLOAT,
            age INT
        );


- Como vamos a trabajar con import, en el package.json agregamos esta linea:

        "type": "module",

- Creamos un archivo llamado db.js y le insertamos la logica de conexion.

- Creamos un csv que tenga las mismas columnas de la tabla que creamos en la BD, a exepcion del ID

- Creamos un archivo llamado employeeService.js

- Creamos un archivo llamado app.js

- Link del api:

        http://localhost:3000/employee


