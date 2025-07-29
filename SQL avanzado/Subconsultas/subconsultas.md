# SUBCONSULTAS

## Que son?
Una subconsulta es una consulta anidada dentro de otra consulta. Sirve para devolver un conjunto de resultados que se pueden usar como entrada para otra consulta principal. Es una herramienta poderosa que nos permite realizar consultas más complejas, dividiendo el problema en partes más manejables.


Las subconsultas son como pequeñas "consultas auxiliares" que proporcionan información que la consulta principal necesita para resolver un problema. Pueden aparecer en diferentes partes de una consulta, como en las cláusulas SELECT, WHERE, FROM, o incluso HAVING.



## Nota Importante:
Las subconsultas siempre se ejecutan antes que la consulta principal. Esto significa que el resultado de la subconsulta se utiliza como un valor o conjunto de valores en la consulta principal para realizar las comparaciones o cálculos necesarios.

Antes de aprender sobre joins, es importante entender las subconsultas. Aunque son útiles, pueden afectar el rendimiento, especialmente si se anidan o aplican a tablas grandes. Los joins suelen ser una alternativa más eficiente.

Las subconsultas en el WHERE deben manejarse con cuidado para evitar errores, usando operadores como IN o EXISTS. Las subconsultas en el FROM actúan como tablas virtuales y requieren alias claros, mientras que las escalares (un solo valor) son más simples que las multicolumna.

Las subconsultas correlacionadas se ejecutan por fila, lo que puede ser menos eficiente que las no correlacionadas, que se ejecutan una sola vez. Aunque útiles para problemas complejos, pueden complicar la lectura del código. Por eso, es clave usar alias descriptivos y comentarios. En general, los joins son más claros y eficientes para consultas con múltiples tablas.