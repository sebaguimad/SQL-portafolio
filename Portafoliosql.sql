/*Borrar tablas en caso de que existan*/
DROP TABLE IF EXISTS  productos,detalle_pago, direccion_usuario,usuarios, metodo_pago,carrito,compra,detalle_compra;

/**Creacion de tablas**/

/*Tablas principalmente asociadas a productos*/

CREATE TABLE productos
(
    id integer NOT NULL,
    nombre_producto character varying(50),
    precio integer,
	existencias integer,
    PRIMARY KEY (id)
);
/*Tablas principalmente asociadas a usuarios*/
CREATE TABLE usuarios
(
    rut character varying (4) ,
	contraseña character varying(20),
	nombre_cliente character varying(50),
	apellido_cliente character varying(50),
	email character varying(50),
    PRIMARY KEY (rut)
	
);

CREATE TABLE direccion_usuario
(
    id serial NOT NULL,
    direccion character varying(50),
	comuna character varying(50),
	ciudad character varying(50),
	region character varying(50),
	usuario_rut character varying (4),
    PRIMARY KEY (id),
	FOREIGN KEY (usuario_rut) REFERENCES usuarios(rut)
);


CREATE TABLE carrito
(
    id serial NOT NULL,
	cantidad integer,
	producto_id integer,
	usuario_rut character varying(4),
    PRIMARY KEY (id),
	FOREIGN KEY (producto_id) REFERENCES productos(id),
	FOREIGN KEY (usuario_rut) REFERENCES usuarios(rut)
);

CREATE TABLE metodo_pago
(
    id serial NOT NULL,
	metodo character varying(20),
	usuario_rut character varying(4),
    PRIMARY KEY (id),
	FOREIGN KEY (usuario_rut) REFERENCES usuarios(rut)
);

/*Tablas principalmente asociadas a la compra*/

CREATE TABLE detalle_pago
(
    id serial NOT NULL,
	estado character varying(12),
	metodo character varying(20),
    PRIMARY KEY (id)
);

CREATE TABLE compra
(
    id serial NOT NULL,
	usuario_rut character varying(4),
	fecha date,
	detallepago_id integer,
    PRIMARY KEY (id),
	FOREIGN KEY (detallepago_id) REFERENCES detalle_pago(id),
	FOREIGN KEY (usuario_rut) REFERENCES usuarios(rut)

);

CREATE TABLE detalle_compra
(
    id serial NOT NULL,
	producto_id integer,
	cantidad_compra integer,
	compra_id integer,
    PRIMARY KEY (id),
	FOREIGN KEY (producto_id) REFERENCES productos(id),
	FOREIGN KEY (compra_id) REFERENCES compra(id)
);


/**Poblar con almenos 5 datos por tabla**/

insert into productos values (1,'Cheesecake Arandanos 1p',1990,17);
insert into productos values (2,'Cheesecake Arandanos',12990,2);
insert into productos values (3,'Torta Chocolate 1p',1590,4);
insert into productos values (4,'Cheescake Manjar',18990,0);
insert into productos values (5,'Dona chocolate 1u',1290,17);
insert into productos values (6,'Profiterol 1u',1390,5);
insert into productos values (7,'Queque Manzana ',7990,18);
insert into productos values (8,'Queque Limon ',7990,12);
select*from productos;

insert into usuarios values ('11-1','contraseña1','jose','perez','jose.perez@gmail.com');
insert into usuarios values ('12-2','contraseña2','daniela','ponce','daniela.ponce@gmail.com');
insert into usuarios values ('13-3','contraseña3','luis','lopez','luiz.lopez@gmail.com');
insert into usuarios values ('14-4','contraseña4','ximena','hernandez','ximena.hernandez@gmail.com');
insert into usuarios values ('15-5','contraseña5','felipe','rozas','felipe.rozas@gmail.com');
select*from usuarios;

insert into direccion_usuario values (default,'av colon 31','peñalolen','santiago','RM','11-1');
insert into direccion_usuario values (default,'calle el olivo 1221','maipu','santiago','RM','11-1');
insert into direccion_usuario values (default,'labo albano 18889','maipu','santiago','RM','12-2');
insert into direccion_usuario values (default,'labo de lugano 16787','maipu','santiago','RM','13-3');
insert into direccion_usuario values (default,'labo carezza 1234','maipu','santiago','RM','15-5');
select*from direccion_usuario;

insert into carrito values (default,3,1,'15-5');
insert into carrito values (default,3,3,'15-5');
insert into carrito values (default,1,1,'11-1');
insert into carrito values (default,1,8,'11-1');
insert into carrito values (default,1,7,'12-2');
insert into carrito values (default,1,6,'14-4');
select*from carrito;

insert into metodo_pago values (default,'debito','11-1');
insert into metodo_pago values (default,'debito','12-2');
insert into metodo_pago values (default,'credito','13-3');
insert into metodo_pago values (default,'debito','13-3');
insert into metodo_pago values (default,'debito','14-4');
insert into metodo_pago values (default,'transferencia','15-5');
select*from metodo_pago;

insert into detalle_pago values (default,'finalizado','credito');
insert into detalle_pago values (default,'finalizado','debito');
insert into detalle_pago values (default,'finalizado','debito');
insert into detalle_pago values (default,'finalizado','debito');
insert into detalle_pago values (default,'finalizado','debito');
insert into detalle_pago values (default,'finalizado','credito');
insert into detalle_pago values (default,'finalizado','transferencia');
insert into detalle_pago values (default,'finalizado','debito');
insert into detalle_pago values (default,'finalizado','transferencia');
insert into detalle_pago values (default,'finalizado','debito');
select*from detalle_pago;

insert into compra values (default,'11-1','12-12-2021',1);
insert into compra values (default,'12-2','01-01-2022',2);
insert into compra values (default,'13-3','23-03-2022',3);
insert into compra values (default,'11-1','24-03-2022',4);
insert into compra values (default,'12-2','13-04-2022',5);
insert into compra values (default,'12-2','07-05-2022',6);
insert into compra values (default,'15-5','05-06-2022',7);
insert into compra values (default,'12-2','28-07-2022',8);
insert into compra values (default,'12-2','13-12-2022',9);
insert into compra values (default,'15-5','13-12-2022',10);
select*from compra;

insert into detalle_compra values (default,5,1,1);
insert into detalle_compra values (default,1,2,1);
insert into detalle_compra values (default,7,1,2);
insert into detalle_compra values (default,8,1,2);
insert into detalle_compra values (default,2,1,3);
insert into detalle_compra values (default,1,2,4);
insert into detalle_compra values (default,3,4,4);
insert into detalle_compra values (default,3,2,5);
insert into detalle_compra values (default,1,1,5);
insert into detalle_compra values (default,7,1,5);
insert into detalle_compra values (default,4,1,5);
insert into detalle_compra values (default,6,3,6);
insert into detalle_compra values (default,5,3,6);
insert into detalle_compra values (default,5,3,7);
insert into detalle_compra values (default,6,2,8);
insert into detalle_compra values (default,1,3,8);
insert into detalle_compra values (default,3,2,8);
insert into detalle_compra values (default,6,3,9);
insert into detalle_compra values (default,1,8,10);
insert into detalle_compra values (default,5,2,10);
select*from detalle_compra;

/***Preguntas****/

/**Rebaja del 20%**/
/*Se utiliza update para actualizar y round para redondear*/
update productos set precio=round(precio*0.8,0);

/* se crea una tabla para almacenar los precios antiguos*/
CREATE TABLE precios_pasados
(
    id integer NOT NULL,
    nombre_producto character varying(50),
    precio integer,
	existencias integer,
    PRIMARY KEY (id)
);

Create function guardar_datos() returns Trigger
as 
$$
begin

Insert into precios_pasados values (old.id, old.nombre_producto , old.precio, old.existencias);

return new;
End
$$
Language plpgsql;

Create Trigger TR_Update before update on productos
for each row
execute procedure guardar_datos();


/**Listar productos con stock critico <=5**/

/*Se selecciona el nombre y las existencias de los productos, fijando la cantidad y ordenando ascendentemente*/
select nombre_producto, existencias 
from productos
where existencias<=5
order by existencias asc;

/**Simular la compra de al menos 3 productos, calcular sub total, iva y total**/

/*1.Insertamos las compras (el id sera=11 ya tenemos 10 anteriores)*/
insert into detalle_pago values (default,'finalizado','debito');
insert into compra values (default,'14-4','14-12-2022',(SELECT MAX(id) from detalle_pago));
insert into detalle_compra values (default,1,2,(SELECT MAX(id) from detalle_pago));
insert into detalle_compra values (default,5,3,(SELECT MAX(id) from detalle_pago));
insert into detalle_compra values (default,8,1,(SELECT MAX(id) from detalle_pago));

SELECT setval(pg_get_serial_sequence('compra', 'id'), coalesce(MAX(id), 1))
from compra;

/*

CREATE OR REPLACE FUNCTION insertar_compra(estado varchar, modo varchar, rut varchar, fecha date, detalle_id integer, cantidad integer) RETURNS VOID AS
$$
 	SELECT setval(pg_get_serial_sequence('detalle_pago', 'id'), coalesce(MAX(id), 1))
	from detalle_pago;
	SELECT setval(pg_get_serial_sequence('compra', 'id'), coalesce(MAX(id), 1))
	from compra;
	SELECT setval(pg_get_serial_sequence('detalle_compra', 'id'), coalesce(MAX(id), 1))
	from detalle_compra;
    insert into detalle_pago values (default,estado,modo);
	insert into compra values (default,rut,fecha,(SELECT MAX(id) from detalle_pago));
	insert into detalle_compra values (default,detalle_id,cantidad,(SELECT MAX(id) from detalle_pago));

$$
LANGUAGE SQL

Select insertar_compra('finalizado','debito','14-4','14-12-2022',1,2)

drop function insertar_compra
*/



/*2. Generamos una Tabla de calculos como una pseudo boleta, incluye nombre,cantidad, valor id=11
para ello unimos la tabla de detalles, compra y producto
*/

/*esto se puede anidar al interior de la funcion para generar la pseudo boleta*/

select nombre_producto, cantidad_compra, precio, (precio*cantidad_compra) as valor_cantidadxprecio
from detalle_compra 
inner join compra 
on compra.id=detalle_compra.compra_id
inner join productos
on productos.id=detalle_compra.producto_id
where compra.id=(SELECT MAX(id) from compra);

/*2. Generamos un Subtotal
con el mismo conjunto de tablas anteriores generamos el calculo de subtotal -> precio*cantidad*/
select sum(precio*cantidad_compra) as subtotal
from detalle_compra 
inner join compra 
on compra.id=detalle_compra.compra_id
inner join productos
on productos.id=detalle_compra.producto_id
where compra.id=11

/*3. Calculamos el iva
De lamisma forma que el sub total pero multiplicando el 19% y redondeando*/
select round((sum(precio*cantidad_compra))*0.19,0) as iva,
from detalle_compra 
inner join compra 
on compra.id=detalle_compra.compra_id
inner join productos
on productos.id=detalle_compra.producto_id
where compra.id=11;

/*4. Calculamos el total
Similar a la forma anterior pero hora sumando la compra con el 0.19 es decir, x1,19*/
select  round(sum((precio*cantidad_compra*1.19)),0) as Total
from detalle_compra 
inner join compra 
on compra.id=detalle_compra.compra_id
inner join productos
on productos.id=detalle_compra.producto_id
where compra.id=11; 

/**Mostrar el total de ventas del mes de diciembre 2022**/
/*Similar al total anterior pero en vez de filtrar la id de la compra filtramos la fecha en mes y año extrayendo la informacion de la vaariable data*/
select  count(distinct compra_id) as numero_compras, round(sum((precio*cantidad_compra*1.19)),0) as Total
from detalle_compra 
inner join compra 
on compra.id=detalle_compra.compra_id
inner join productos
on productos.id=detalle_compra.producto_id
where (extract(month from fecha)=12) and (extract(year from fecha)=2022);

/**Listar el comportamiento del usuario que mas compras realizo en 2022**/

/**El problema de esta tabla es que si hay más de una persona que realizaron más compras entonces arroja solo una**/
/*Primero veremos como seleccionar al con mas compras,anidando una consulta donde ordenamos la cuenta de las compras y seleccionamos el primero*/
select usuario_rut as max_comprador
from( select usuario_rut,count(usuario_rut) as n_compras
	from compra
	group by usuario_rut
	order by n_compras desc
	limit 1) as tabla_calculada 

/*select usuario_rut as max_comprador
from( select usuario_rut,count(usuario_rut) as n_compras
	from compra
	group by usuario_rut) as tabla_calculada 
	where n_compras=(SELECT MAX(n_compras) 
					 FROM (select usuario_rut,count(usuario_rut) as n_compras
					 from compra
					 group by usuario_rut) as tabla_calculada);*/
	
/*Ahora vemos el comportamiento de los compradores para este caso consideraremos su comportamiento como cuales compras realiza, cuando y de que monto,
ademas para completar la informacion mostraremos su rut y nombre completo, para ellos unimos las tablas de usuarios,compra,detalles_compray productos
, y filtramos por el rut anidando la consulta anterior y agrupamos*/

select rut, concat(nombre_cliente,' ',apellido_cliente) as nombre_completo,fecha,compra_id, round(sum((precio*cantidad_compra*1.19)),0) as Total_compra
from usuarios
inner join compra 
on usuarios.rut=compra.usuario_rut
inner join detalle_compra
on compra.id=detalle_compra.compra_id
inner join productos
on productos.id=detalle_compra.producto_id
group by compra_id,rut,fecha
having (extract(year from fecha)=2022) 
and rut=(select usuario_rut as max_comprador
		from( select usuario_rut,count(usuario_rut) as n_compras
			from compra
			group by usuario_rut
			order by n_compras desc
			limit 1) as tabla_calculada) 



