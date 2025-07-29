-- buscar valores que coincidan con un patrón. Se puede usar con dos comodines principales: 
-- %: Representa cualquier número de caracteres (incluyendo ninguno). 
-- _: Representa un solo carácter. 


-- si queremos encontrar todos los clientes cuyo nombre comience con "a", usaríamos la siguiente consulta: 
--  el % indica que puede haber cualquier número de caracteres después de la letra "a". 


SELECT nombre, apellido
FROM clientes
WHERE nombre LIKE 'a%';



-- Filtrar por coincidencias al final. Apellidos que terminen en '...ez'.
SELECT nombre, apellido
FROM clientes
WHERE apellido LIKE '%ez';




-- nombre tenga exactamente 5 caracteres, comience con "A" y termine con "e".
-- cada _ representa un caracter

SELECT nombre, apellido
FROM clientes
WHERE apellido LIKE 'A____e';   -- 3 espacios con _