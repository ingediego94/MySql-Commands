
-- contar la cantidad de registros de una tabla.
-- Incluye aquellos con valores incompletos o vacios

SELECT COUNT(*)
FROM clientes;



-- Tambien se lo puede aplicar a una sola columna
-- en este caso, COUNT(Teléfono) solo considera los registros donde 
-- la columna Teléfono tiene un valor válido, excluyendo aquellos con valores NULL.

SELECT COUNT(telefono)
FROM clientes;

-- Count(*): incluye todos los registros hasta aquellos con null
-- count(columna): Ignora los null



-- Usando COUNT con filtros
-- Saber cuantos clientes viven en Madrid

SELECT COUNT(*)
FROM clientes
WHERE ciudad = 'Madrid';



-- Contar valores unicos con Distinct.
-- saber cuántas ciudades diferentes tienen clientes registrados: 

SELECT COUNT( DISTINCT ciudad)
FROM clientes;