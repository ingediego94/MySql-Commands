
-- Todos los clientes que vivan en Madrid, Barcelona, Medellin o New York:

SELECT nombre, apellido, ciudad
FROM clientes
WHERE ciudad IN ('Madrid', 'Barcelona', 'Medellin', 'New York');


-- Mismo ejemplo anterior y que en edad sea mayor a 30:
SELECT nombre, apellido, ciudad
FROM clientes
WHERE ciudad IN ('Madrid', 'Barcelona', 'Medellin', 'New York') AND edad > 30;


-- Clientes que no vivan ni en Bogotá ni en Tokio:
SELECT nombre, apellido, ciudad
FROM clientes
WHERE ciudad NOT IN ('Bogota', 'Tokio');
