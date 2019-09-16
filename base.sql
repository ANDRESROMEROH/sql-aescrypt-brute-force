conn system/root

drop table caracteres;

-- Tabla para almacenar los caracteres a utilizar
create table caracteres(
    caracter varchar2(1)
) tablespace SYSTEM;

-- Insert de cada uno de los caracteres
insert into caracteres(caracter) values ('A');
insert into caracteres(caracter) values ('B');
insert into caracteres(caracter) values ('C');
insert into caracteres(caracter) values ('D');
insert into caracteres(caracter) values ('E');
insert into caracteres(caracter) values ('F');
insert into caracteres(caracter) values ('G');
insert into caracteres(caracter) values ('H');
insert into caracteres(caracter) values ('I');
insert into caracteres(caracter) values ('J');
insert into caracteres(caracter) values ('K');
insert into caracteres(caracter) values ('L');
insert into caracteres(caracter) values ('M');
insert into caracteres(caracter) values ('N');
insert into caracteres(caracter) values ('O');
insert into caracteres(caracter) values ('P');
insert into caracteres(caracter) values ('Q');
insert into caracteres(caracter) values ('R');
insert into caracteres(caracter) values ('S');
insert into caracteres(caracter) values ('T');
insert into caracteres(caracter) values ('U');
insert into caracteres(caracter) values ('V');
insert into caracteres(caracter) values ('W');
insert into caracteres(caracter) values ('X');
insert into caracteres(caracter) values ('Y');
insert into caracteres(caracter) values ('Z');
insert into caracteres(caracter) values ('0');
insert into caracteres(caracter) values ('1');
insert into caracteres(caracter) values ('2');
insert into caracteres(caracter) values ('3');
insert into caracteres(caracter) values ('4');
insert into caracteres(caracter) values ('5');
insert into caracteres(caracter) values ('6');
insert into caracteres(caracter) values ('7');
insert into caracteres(caracter) values ('8');
insert into caracteres(caracter) values ('9');

-- Vista que efectua un "Producto Cartesiano" 
-- para generar todas las posibles combinaciones
create or replace view view_producto_cartesiano as
select (c1.caracter||c2.caracter||c3.caracter||c4.caracter) password 
from caracteres c1, caracteres c2,caracteres c3,caracteres c4;

exit