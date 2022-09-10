/*
Reportes parte I - Repasamos INNER JOIN
Realizar una consulta de la facturación de e-market. Incluir la siguiente información:
● Id de la factura
● fecha de la factura
● nombre de la empresa de correo
● nombre del cliente
● categoría del producto vendido
● nombre del producto
● precio unitario
● cantidad
*/
select f.FacturaID as "Id Factura", f.FechaFactura, cor.Compania as "Empresa de correo",
cli.compania as "Nombre del cliente", c.CategoriaNombre as "Categoria", p.ProductoNombre as "Nombre del producto",
fd.PrecioUnitario as "Precio unitario", fd.Cantidad
from facturas as f
inner join clientes as cli ON cli.ClienteID = f.ClienteID
inner join facturadetalle as fd ON f.FacturaID = fd.FacturaID
inner join productos as p ON fd.ProductoID = p.ProductoID
inner join categorias as c ON p.CategoriaID= c.CategoriaID
inner join correos as cor ON f.EnvioVia = cor.CorreoID;


-- Reportes parte II - INNER, LEFT Y RIGHT JOIN
/*
1. Listar todas las categorías junto con información de sus productos. Incluir todas
las categorías aunque no tengan productos.
*/
select * from categorias
left join productos ON categorias.CategoriaID = productos.CategoriaID;

/*
2. Listar la información de contacto de los clientes que no hayan comprado nunca
en emarket.
*/
select * from clientes
left join facturas ON clientes.ClienteID = facturas.ClienteID
where facturas.ClienteID is null;

/*
3. Realizar un listado de productos. Para cada uno indicar su nombre, categoría, y
la información de contacto de su proveedor. Tener en cuenta que puede haber
productos para los cuales no se indicó quién es el proveedor.
*/
select productos.ProductoNombre as "Nombre del producto", categorias.CategoriaNombre as "Categoria",
proveedores.Contacto from productos
left join proveedores On productos.proveedorID = proveedores.proveedorId
left join categorias On productos.CategoriaID = categorias.CategoriaID;

/*
4. Para cada categoría listar el promedio del precio unitario de sus productos.
 */
select categorias.CategoriaNombre as Categoria, avg(facturadetalle.PrecioUnitario) from categorias
join productos ON categorias.CategoriaID = productos.CategoriaID
join facturadetalle ON productos.ProductoID = facturadetalle.ProductoID
group by categorias.CategoriaID;

/*
5. Para cada cliente, indicar la última factura de compra. Incluir a los clientes que
nunca hayan comprado en e-market.
*/
select clientes.Contacto, facturas.FacturaID, max(facturas.FechaFactura) from clientes
left join facturas ON clientes.ClienteID = facturas.ClienteID
group by clientes.ClienteID;

/*
6. Todas las facturas tienen una empresa de correo asociada (enviovia). Generar un
listado con todas las empresas de correo, y la cantidad de facturas
correspondientes. Realizar la consulta utilizando RIGHT JOIN.
*/
select correos.Compania, count(*) as "Cantidad de facturas" from facturas
right join correos ON facturas.EnvioVia = correos.CorreoID
group by correos.Compania