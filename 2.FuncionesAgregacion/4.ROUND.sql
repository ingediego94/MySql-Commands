-- Redondear a 2 decimales

SELECT nombre_producto, 
    ROUND(precio,2) AS precio_redondeado
FROM productos;



-- ROUND con AVG
SELECT ROUND( AVG( precio), 2) AS precio_prom
FROM productos;


-- Redondeo a solo enteros, sin decimal
SELECT ROUND( SUM( precio), 0) AS precio_total
FROM productos;