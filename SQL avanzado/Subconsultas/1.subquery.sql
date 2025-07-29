-- Determinar el listado de los empleados con un salario mayor al promedio de 
-- salario de todos los empleados.

SELECT nombre, salario
FROM empleados
WHERE salario > (
    SELECT AVG( salario )
    FROM empleados
);

/*
La subconsulta se ejecuta primero, calculando el salario promedio de todos los 
empleados. Luego, la consulta principal compara el salario de cada empleado con 
el promedio obtenido en la subconsulta. De esta manera, el resultado final será 
una lista de empleados cuyos salarios son mayores que el promedio general de la 
empresa.

*/