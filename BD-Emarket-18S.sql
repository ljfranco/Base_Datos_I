
 /*Ejercicio 1

1. Crear una vista para poder organizar los envíos de las facturas. Indicar número
de factura, fecha de la factura y fecha de envío, ambas en formato dd/mm/yyyy,
valor del transporte formateado con dos decimales, y la información del
domicilio del destino incluyendo dirección, ciudad, código postal y país, en una
columna llamada Destino.*/

create view datos_facturas as
select FacturaID as "N°Factura", date_format(FechaFactura,"%d/%m/%y") as "Fecha Factura",date_format(Fechaenvio,"%d/%m/%y") as "Fecha de Envio", 
format(transporte, "2") as "Valor Transporte", concat(DireccionEnvio," ", Ciudadenvio, " " , codigopostalenvio," ", paisenvio) as Destino
 from facturas;
 
 select * from datos_facturas;

/*2. Realizar una consulta con todos los correos y el detalle de las facturas que
usaron ese correo. Utilizar la vista creada.*/

select c.Compania, df.* from correos as c
join facturas as f on c.CorreoID = f.EnvioVia
join datos_facturas as df on f.FacturaID = df.N°Factura
;

/*3. ¿Qué dificultad o problema encontrás en esta consigna? Proponer alguna
alternativa o solución.*/

/*Ejercicio 2

1. Crear una vista con un detalle de los productos en stock. Indicar id, nombre del
producto, nombre de la categoría y precio unitario.*/

create view detalle_productos as 
select p.ProductoID, p.ProductoNombre, c.CategoriaNombre, p.PrecioUnitario from productos as p
join categorias as c on p.CategoriaID = c.CategoriaID;

select * from detalle_productos;


/*2. Escribir una consulta que liste el nombre y la categoría de todos los productos
vendidos. Utilizar la vista creada.*/

select distinct dp.producto, dp.categoria  from detalle_productos as dp
join facturadetalle as fd on dp.ProductoID = fd.ProductoID

/*3. ¿Qué dificultad o problema encontrás en esta consigna? Proponer alguna
alternativa o solución.*/