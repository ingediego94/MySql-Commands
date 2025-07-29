
-- IS NULL: ausencia de datos

SELECT nombre, apellido
FROM clientes
WHERE direccion IS NULL;



-- Buscar registros sin ausencia de datos:

SELECT nombre, apellido
FROM clientes
WHERE direccion IS NOT NULL;