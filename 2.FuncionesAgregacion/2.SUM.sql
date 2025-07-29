-- realizar calculos acumulativos por columna
SELECT SUM(ingresos_mes)
FROM clientes;


-- SUM con filtro
-- Suma de los ingresos mes de solo los clientes que vivien en Madrid
SELECT SUM(ingresos_mes)
FROM clientes
WHERE ciudad = 'Madrid';


-- SUM ignora los valores null