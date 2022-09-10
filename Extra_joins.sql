/*Reportes - JOINS

Consignas:
1. Obtener los artistas que han actuado en una o más películas.*/
select distinct apellido, nombre from artista as a
inner join artista_x_pelicula as axp on a.id = axp.artista_id;


/*2. Obtener las películas donde han participado más de un artista según nuestra
base de datos.*/

select titulo, count(*) from pelicula as p
join artista_x_pelicula as axp on axp.pelicula_id = p.id
group by p.titulo
having count(*) > 1;

/*3. Obtener aquellos artistas que han actuado en alguna película, incluso
aquellos que aún no lo han hecho, según nuestra base de datos.*/

select distinct apellido, nombre, axp.pelicula_id as pelicula from artista as a
left join artista_x_pelicula as axp on axp.artista_id = a.id;


/*4. Obtener las películas que no se le han asignado artistas en nuestra base de
datos.*/

select distinct * from pelicula as p
left join artista_x_pelicula as axp on axp.pelicula_id = p.id
where axp.pelicula_id is null;


/*5. Obtener aquellos artistas que no han actuado en alguna película, según
nuestra base de datos.*/

select distinct apellido, nombre, axp.pelicula_id as pelicula from artista as a
left join artista_x_pelicula as axp on axp.artista_id = a.id
where axp.pelicula_id is null;

/*6. Obtener aquellos artistas que han actuado en dos o más películas según
nuestra base de datos.*/

select * , count(*)from artista as a
join artista_x_pelicula as axp on axp.artista_id = a.id
group by a.id
having count(*) >= 2;

/*7. Obtener aquellas películas que tengan asignado uno o más artistas, incluso
aquellas que aún no le han asignado un artista en nuestra base de datos.*/

select * from pelicula as p
left join artista_x_pelicula as axp on p.id = axp.pelicula_id
group by p.id
