/*Consignas
Clientes
1) ¿Cuántos clientes existen?*/

select count(*) as Cantidad
 from clientes;

/*2) ¿Cuántos clientes hay por ciudad?*/

select Ciudad, count(*) as Cantidad from clientes
group by Ciudad
order by count(*) desc;

/*Facturas
1) ¿Cuál es el total de transporte?*/

select sum(Transporte) from facturas;

/*2) ¿Cuál es el total de transporte por EnvioVia (empresa de envío)?*/

select EnvioVia, sum(Transporte) as Total from facturas
group by EnvioVia;


/*3) Calcular la cantidad de facturas por cliente. Ordenar descendentemente por
cantidad de facturas.*/

select ClienteID, count(*) as Total from facturas
group by ClienteID
order by count(*) desc;
	

/*4) Obtener el Top 5 de clientes de acuerdo a su cantidad de facturas.*/

select ClienteID, count(*) as Total from facturas
group by ClienteID
order by count(*) desc
limit 5;

/*5) ¿Cuál es el país de envío menos frecuente de acuerdo a la cantidad de facturas?*/

select PaisEnvio, count(*) as Total from facturas
group by PaisEnvio
order by count(*)
limit 1;

/*6) Se quiere otorgar un bono al empleado con más ventas. ¿Qué ID de empleado
realizó más operaciones de ventas?*/

select EmpleadoID, count(*) from facturas
group by EmpleadoID
order by count(*) desc
limit 1;

select facturas.EmpleadoID, empleados.Nombre, count(*)
from facturas
join empleados on empleados.EmpleadoID  = facturas.EmpleadoID
group by EmpleadoID
order by count(*) desc;




/*Factura detalle
1) ¿Cuál es el producto que aparece en más líneas de la tabla Factura Detalle?*/



/*2) ¿Cuál es el total facturado? Considerar que el total facturado es la suma de
/*cantidad por precio unitario.
3) ¿Cuál es el total facturado para los productos ID entre 30 y 50?
4) ¿Cuál es el precio unitario promedio de cada producto?
5) ¿Cuál es el precio unitario máximo?*/