
-- permite agrupar las filas de una tabla según una o varias columnas. 
-- Esta agrupación nos da la posibilidad de aplicar funciones de agregación
--  como SUM(), COUNT(), AVG(), etc., a cada grupo, obteniendo resúmenes 
-- y estadísticas útiles de los datos. 


--  Conocer el total de ventas de cada vendedor, podemos agrupar los datos
-- por vendedor y usar la función SUM() para obtener el total de ventas de cada uno

SELECT vendedor, SUM( monto ) AS total_ventas
FROM ventas
GROUP BY vendedor;

-- En este caso, GROUP BY agrupa los registros por vendedor, y SUM(monto) calcula el total de ventas de cada grupo. 




-- HAVING 
-- HAVING es similar a la cláusula WHERE, pero mientras WHERE filtra las filas individuales antes de realizar la 
-- agrupación, HAVING filtra los grupos después de aplicar GROUP BY

-- Por ejemplo, si solo queremos ver los vendedores cuya suma total de ventas supere los $1000, podemos usar HAVING para filtrar esos grupos: 

SELECT vendedor, SUM( monto ) AS total_ventas
FROM ventas
GROUP BY vendedor 
HAVING SUM ( monto ) > 1000;

-- Aquí, HAVING filtra los resultados para mostrar solo los vendedores con ventas superiores a $1000. 