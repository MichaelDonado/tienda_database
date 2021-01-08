--Creamos la base de datos
create database tiendecita;

--Colocamos en uso la base de Datos 

USE tiendecita;

--Creamos nuestra primera tabla

create table categoria(
pk_id int(11) not null auto_increment,
nombre varchar(25),
marca varchar(25),
primary key (pk_id)
)engine=innodb;

--El insert into funciona para ingresar nuestros datos en la base de datos
--ejemplos
insert into categoria(nombre, marca) values('no lacteo', 'otros');
insert into categoria(nombre, marca) values('lacteo', 'colanta');
insert into categoria(nombre, marca) values('lacteo', 'milk');


create table producto(
pk_id int(11) not null auto_increment,
nombre varchar(25),
valor int(11), 
cantidad int(11),
fk_categoria int(11),
primary key (pk_id),
foreign key (fk_categoria) references categoria (pk_id)
)engine=innodb;

--ejemplos
insert into producto values(1,'Leche',5000, 7, 2);
insert into producto values(2,'Pastas',3000, 10, 1);
insert into producto values(3,'Queso',8000, 3, 1);
insert into producto values(4,'Water',2000, 0, 1);

--inner join ejemplo 
select p.pk_id, p.nombre as nombre_del_producto, p.valor, p.cantidad, c.nombre as nombre_categeria, c.marca
from categoria as c
inner join producto p
on  c.pk_id =  p.fk_categoria;
