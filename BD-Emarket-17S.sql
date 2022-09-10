/*Vistas - Parte I

Clientes

1. Crear una vista con los siguientes datos de los clientes: ID, contacto, y el
Fax. En caso de que no tenga Fax, colocar el teléfono, pero aclarándolo. Por
ejemplo: “TEL: (01) 123-4567”.*/

create view Contacto_Clientes as 
select ClienteID, Contacto, 
case
	when fax = "" or fax is null then concat("Tel: ", telefono)
    else Fax
    end as Fax
 from clientes;
 
 select * from contacto_clientes;

/*2. Se necesita listar los números de teléfono de los clientes que no tengan
fax. Hacerlo de dos formas distintas:
a. Consultando la tabla de clientes.
b. Consultando la vista de clientes.*/
-- A
select ClienteID, Contacto, Telefono from clientes
where fax = "" or fax is null;

-- B
select * from contacto_clientes
where fax like "Tel:%";

/*Proveedores

1. Crear una vista con los siguientes datos de los proveedores: ID,
contacto, compañía y dirección. Para la dirección tomar la dirección,
ciudad, código postal y país.*/
create view datos_proveedor as
select ProveedorID, Contacto, Compania, concat(direccion," ", ciudad," ", codigopostal," ", pais) as Dirección 
from proveedores;

select * from datos_proveedor;
 
/*2. Listar los proveedores que vivan en la calle Americanas en Brasil. Hacerlo
de dos formas distintas:
a. Consultando la tabla de proveedores.*/

select * from proveedores
where Direccion like "%Americanas%" and pais like "%Brazil%";

/*b. Consultando la vista de proveedores.*/

select * from datos_proveedor
where dirección	like "%Americanas%Brazil";

/*Vistas - Parte II
1. Crear una vista de productos que se usará para control de stock. Incluir el ID
y nombre del producto, el precio unitario redondeado sin decimales, las
unidades en stock y las unidades pedidas. Incluir además una nueva
columna PRIORIDAD con los siguientes valores:
■ BAJA: si las unidades pedidas son cero.
■ MEDIA: si las unidades pedidas son menores que las unidades
en stock.
■ URGENTE: si las unidades pedidas no duplican el número de
unidades.
■ SUPER URGENTE: si las unidades pedidas duplican el número
de unidades en caso contrario.*/


create view control_stock as 
select ProductoID, ProductoNombre, round(PrecioUnitario) as Precio, UnidadesStock, UnidadesPedidas,
case
	when unidadespedidas = 0 then "BAJA"
    when unidadespedidas < unidadesstock then "MEDIA"
    when unidadespedidas < unidadesstock *2 then "URGENTE"
    else "SUPER URGENTE"
    end as Prioridad
 from productos;
 
 select * from control_stock;

/*2. Se necesita un reporte de productos para identificar problemas de stock.
Para cada prioridad indicar cuántos productos hay y su precio promedio.
No incluir las prioridades para las que haya menos de 5 productos.*/

select prioridad, count(*), avg(precio) from control_stock
group by prioridad
having count(*) >= 5;
