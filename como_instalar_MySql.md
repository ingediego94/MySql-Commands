## GUÍA DE COMO INSTALAR MySql EN LINUX

1. Abrimos la terminal:

        Ctrl + Alt + T

2. Iniciammos como 'sudo su' y escribimos la contraseña:

        sudo su
        password: ********

3. Actualizamos paquetes:

        sudo apt update

        sudo apt upgrade

4. Le damos instalar:

        sudo apt install mysql-server

        Desea continuar?  y
        

5. Verificamos instalacion:

        sudo systemctl status mysql


6. Salir del resultado de que arroja lo anterior:

        q


7. Comprobamos la version de MySql:

        mysql --version

8. 

        sudo mysql


9. Configuramos el usuario root:

        alter user 'root'@'localhost' identified with mysql_native_password by 'tuClaveDeseada';

    En 'tuClaveDeseada' debes colocar una contraseña que tu desees.
    No olvidar esa clave.


10. Salimos de MySql:

        exit


11. Instalamos workbench community desde la tienda de aplicaciones.

12. Iniciamos workbench en la conexion de root e ingresamos la contraseña y ya estaría listo para usar.

---
### Referencias:

link video tutorial:

EdTics Academy. Como INSTALAR MySQL y MySQL Workbench en Ubuntu Linux Fácil para Principiantes. (2024). Recuperado de: https://www.youtube.com/watch?v=3PKm03KXsHw