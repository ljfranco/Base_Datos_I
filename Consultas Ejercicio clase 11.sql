/*Ejercicio Clase 11*/

/*Categorias y productos*/
/*Punto 1*/
select *
from categorias;

/*Punto 2*/

select CategoriaNombre, Descripcion
from categorias;

/*Punto 3*/

select *
from productos;

/*Punto 4*/

select * 
from productos
where Discontinuado = 1;

/*Punto 5*/

select *
from productos
where ProveedorID = 8;

/*Punto 6*/

select *
from productos
where PrecioUnitario between 10 and 22;
/*where PrecioUnitario > 10 and PrecioUnitario < 22;*/

/*Punto 7*/

select *
from productos
where UnidadesStock < NivelReorden;

/* Punto 8*/

select *
from productos
where UnidadesStock < NivelReorden and UnidadesPedidas = 0;

/* Clientes*/

/*Punto 1*/

select Contacto, Compania, Titulo, Pais
from clientes
order by Pais;

/*Punto 2*/

select * 
from clientes
where Titulo like "%Owner%";

/*Punto 3*/

select *
from clientes
where Contacto like "C%";

/*Facturas*/

/*Punto 1*/

select *
from facturas
order by FechaFactura;

/*Punto 2*/

select *
from facturas
where PaisEnvio like "USA" and EnvioVia != 3;

/*Punto 3*/

select *
from facturas
where ClienteID like "GOURL";

/* Punto 4*/

select *
from facturas
where EmpleadoID in (2,3,5,8,9);

/* Parte II*/

/*Productos*/

/*Punto 1*/

select *
From productos
order by PrecioUnitario desc;

/*Punto 2*/

select *
from productos
order by PrecioUnitario desc
limit 5;

/*punto 3*/

select *
from productos
order by UnidadesStock desc
limit 10;

/*Factura Detalle*/

/*Punto 1*/

select FacturaID, ProductoNombre, Cantidad
from facturadetalle, productos
where facturadetalle.ProductoID = productos.ProductoID;

/*Punto 2*/

select FacturaID, ProductoNombre, Cantidad
from facturadetalle, productos
where facturadetalle.ProductoID = productos.ProductoID
order by Cantidad desc;

/*Punto 3*/

select FacturaID, ProductoNombre, Cantidad
from facturadetalle, productos
where facturadetalle.ProductoID = productos.ProductoID and Cantidad between 50 and 100
order by Cantidad desc;

/*Punto 4*/

select FacturaID,ProductoID, (PrecioUnitario * Cantidad) as Total
from facturadetalle;

/* Extras*/

/* Punto 1*/

select *
from clientes
where Pais like "Brazil" or Pais like "Mexico" or Titulo like "Sales%";

/*Punto 2*/

select *
from clientes
where Compania like "A%";

/*Punto 3*/

select Ciudad, Contacto as Apellido_y_nombre, Titulo as Puesto 
from clientes
where Ciudad like "Madrid";

/*Puesto 4*/

select *
from facturas
where FacturaID between 10000 and 10500;

/*Punto 5*/

select *
from facturas
where FacturaID between 10000 and 10500 or ClienteID like "B%";

/*Punto 6*/

select *
from facturas
where CiudadEnvio like "Vancouver" or EnvioVia = 3;

/*Punto 7*/

select EmpleadoID, Apellido, Nombre
from empleados
where Apellido like "Buchanan";

/*Punto 8*/

select *
from facturas
where EmpleadoID = 5;









