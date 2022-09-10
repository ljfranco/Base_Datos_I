/*Consigna
Realizar una consulta sobre la tabla canciones con la siguiente información:
Solo los 10 primeros caracteres del nombre de la canción en mayúscula.
Los años de antigüedad que tiene cada canción desde su publicación. Ej: 25 años. 
El peso en KBytes en número entero (sin decimales, 1024 Bytes = 1 KB)
El precio formateado con 3 decimales, Ej: $100.123
El primer compositor de la canción (notar que si hay más de uno, estos se separan por coma)*/

select  left(upper(nombre),10) as nombre, 
round(bytes/1024) as Kb, 
format(precio_unitario,3),
case 
	when compositor = "" or compositor is null then "Sin Compositor"
    when compositor not like "%,%" then compositor
    else left(compositor, locate(",",compositor)-1)
    end as Compositor

 from canciones
 
 