select titulo
from albumes;

select primer_nombre, pais
from clientes
where pais like "USA";


select count(*) from clientes
where pais = "Brazil"
;

select count(*), id_genero from canciones
group by id_genero;

select sum(total) from facturas;

select avg(milisegundos), id_album as promemedio from canciones
group by id_album;

select min(bytes) from canciones;

select sum(total), id_cliente from facturas
group by id_cliente
having sum(total) > 45;	

select * from canciones,generos
where id_genero = generos.id 
and compositor = "willie Dixon" 
and generos.nombre = "blues";