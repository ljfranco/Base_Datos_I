/*Ejercitacion Playground BD_Movies*/

/*Consultas*/
/*SELECT*/
/*1. Mostrar todos los registros de la tabla de movies.*/
select *
from movies;

/*2. Mostrar el nombre, apellido y rating de todos los actores.*/

select first_name, last_name, rating
from actors;

/*3. Mostrar el título de todas las series.*/

select title
from series;

/*WHERE Y ORDER BY*/
/*4. Mostrar el nombre y apellido de los actores cuyo rating sea mayor a 7,5.*/

select first_name, last_name, rating from actors
where rating > 7.5;

/*5. Mostrar el título de las películas, el rating y los premios de las películas con
un rating mayor a 7,5 y con más de dos premios.*/

select title, rating, awards from movies
where rating > 7.5 and awards > 2;

/*6. Mostrar el título de las películas y el rating ordenadas por rating en forma
ascendente.*/

select title, rating from movies
order by rating;

/*BETWEEN y LIKE*/
/*7. Mostrar el título y rating de todas las películas cuyo título incluya Toy Story.*/

select title, rating from movies
where title like "%toy story";

/*8. Mostrar a todos los actores cuyos nombres empiecen con Sam.*/

select * from actors
where first_name like "Sam%";

/*9. Mostrar el título de las películas que salieron entre el ‘2004-01-01’ y
‘2008-12-31’.*/

select title from movies
where release_date between "2004-01-01" and "2008-12-31";

/*Consultas Alias, limit y offset*/

/*1. Mostrar el título de todas las series y usar alias para que el nombre del campo
este en español.*/

select title as Titulo from series;

/*2. Traer el título de las películas con el rating mayor a 3, con más de 1 premio y con
fecha de lanzamiento entre el año ‘1988-01-01’ al ‘2009-12-31’. Ordenar los
resultados por rating descendentemente.*/

select title from movies
where rating > 3 and awards > 1 and release_date between "1988-01-01" and "2009-12-31";

/*3. Traer el top 3 a partir del registro 10 de la consulta anterior.*/

select title from movies
where rating > 3 and awards > 1 and release_date between "1988-01-01" and "2009-12-31"
limit 3 
offset 10;

/*4. ¿Cuáles son los 3 peores episodios teniendo en cuenta su rating?*/

select * from episodes
order by rating
limit 3;

/*5. Obtener el listado de todos los actores. Quitar las columnas de fechas y película
favorita, además traducir los nombres de las columnas.*/

select id, first_name as Nombre, last_name as Apellido, rating as Clasificacion from actors;

/*Consultas Alias, limit y offset II*/
/*1. Mostrar el título de todas las series y usar alias para que tanto el nombre de la
tabla como el campo estén en español.*/

select title as Nombre from series;

/*2. Traer el título de las películas con el rating mayor a 3, con más de 1 premio y con
fecha de lanzamiento entre el año 1988 al 2009. Ordenar los resultados por
rating.*/

select title from movies
where rating > 3 and awards > 1 and release_date between "1988-01-01" and "2009-12-31"
order by rating;

/*3. Traer el top 3 a partir del registro 10 de la consulta anterior.*/
select title from movies
where rating > 3 and awards > 1 and release_date between "1988-01-01" and "2009-12-31"
order by rating
limit 3
offset 10;


/*4. ¿Cuáles son los 3 peores episodios teniendo en cuenta su rating?*/

select * from episodes
order by rating
limit 3;

/*5. Obtener el listado de todos los actores. Quitar las columnas de fechas y película
favorita, además traducir los nombres de las columnas.*/
select id, first_name as Nombre, last_name as Apellido, rating as Clasificacion from actors;


/*Ejercitación opcional III*/

/*Funciones de agregación, GROUP BY y HAVING*/
/*1. ¿Cuántas películas hay? */ 

select count(*) from movies;   /*21 peliculas */

/*2. ¿Cuántas películas tienen entre 3 y 7 premios?*/

select count(*) from movies
where awards between 3 and 7;   /*8 peliculas */

/*3. ¿Cuántas películas tienen entre 3 y 7 premios y un rating mayor a 7?*/

select count(*) from movies
where awards between 3 and 7 and rating > 7; /*8 peliculas */

/*4. Crear un listado a partir de la tabla de películas, mostrar un reporte de la
cantidad de películas por id. de género.*/

select count(*), genre_id from movies
group by genre_id;

/*5. De la consulta anterior, listar sólo aquellos géneros que tengan como suma
de premios un número mayor a 5.*/

select count(*), genre_id from movies
group by genre_id
having sum(awards) > 5;


/*Ejercitación adicional - Bases de datos IV
Join
1. Utilizando la base de datos de movies, queremos conocer, por un lado, los
títulos y el nombre del género de todas las series de la base de datos.*/

select title, genres.name from series
inner join genres on genre_id = genres.id;

/*2. Por otro, necesitamos listar los títulos de los episodios junto con el nombre y
apellido de los actores que trabajan en cada uno de ellos.*/

select episodes.title, actors.first_name, last_name from episodes
inner join actor_episode on episode_id = episodes.id
inner join actors on actors.id = actor_id ;
/*3. Para nuestro próximo desafío, necesitamos obtener a todos los actores o
actrices (mostrar nombre y apellido) que han trabajado en cualquier película
de la saga de La Guerra de las galaxias.*/

select first_name, last_name, movies.title from movies
inner join actor_movie on movie_id = movies.id
inner join actors on actor_id = actors.id
where movies.title like ("%Guerra de las galaxias%");

/*4. Crear un listado a partir de la tabla de películas, mostrar un reporte de la
cantidad de películas por nombre de género.*/

select genres.name, count(*) from movies
inner join genres on genre_id = genres.id
group by genres.name;
