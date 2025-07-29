
-- BETWEEN permite filtrar los resultados dentro de un rango de valores:

-- Clientes entre 25 y 35 años. (incluye 25 y 35 en el rango)
SELECT nombre, apellido, edad
FROM clientes 
WHERE edad BETWEEN 25 AND 35;


-- Clientes que viven en Madrid y que tienen entre 18 y 30 años
SELECT nombre, apellido, edad, ciudad
FROM clientes
WHERE ciudad = 'Madrid' AND edad BETWEEN 18 AND 30;


-- Filtrando datos con fechas y Between
SELECT nombre, apellido, fecha_ingreso
FROM clientes
WHERE fecha_ingreso BETWEEN '2023-12-01' AND '2023-12-31';
