-- Seleccionamos todas las columnas de la tabla ciudades con el filtro de 
-- ciudad = 'Madrid'

SELECT *
FROM ciudad
WHERE ciudad = 'Madrid';



-- Seleccionar Madrid o Barcelona:
SELECT nombre, ciudad
FROM clientes
WHERE ciudad = 'Madrid' OR ciudad = 'Barcelona';



-- Seleccionar solo aquellos clientes que no son de Barcelona:

SELECT nombre, ciudad
FROM clientes
WHERE NOT ciudad = 'Barcelona';