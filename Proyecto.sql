CREATE TABLE LIBRO (ID_LIBRO INTEGER, 
      NOMBRE VARCHAR2 (100),
      EDITORIAL VARCHAR2 (40), 
      AUTOR VARCHAR2 (40),
      CONSTRAINT PK_ID_LIBRO PRIMARY KEY (ID_LIBRO));


INSERT INTO LIBRO VALUES(1,'Cuentos de la Alhambra','Espasa Libros - Edición 2001', 'Washington Irving (Estados Unidos)');
INSERT INTO LIBRO VALUES(2,'Yo, Robot','Edhasa- Edición 2004', 'Isaac Asimov (Estados Unidos)');
INSERT INTO LIBRO VALUES(3,'El asesinato de Roger Ackroyd','RBA Libros- Edición 2007', 'Agatha Christie (Gran Bretaña)');
INSERT INTO LIBRO VALUES(4,'La leyenda de Sleepy Hollow','Editorial Alba - Edición 2000', 'Washington Irving (Estados Unidos)');
INSERT INTO LIBRO VALUES(5,'Un cadáver en la biblioteca','RBA Libros- Edición 2007', 'Agatha Christie (Gran Bretaña)');
INSERT INTO LIBRO VALUES(6,'El tren de la 4:50','RBA Libros- Edición 2007', 'Agatha Christie (Gran Bretaña)');
INSERT INTO LIBRO VALUES(7,'Un elefante ocupa mucho espacio','Alfaguara Infantil - Edición 2004', 'Elsa Bornemann (Argentina)');
INSERT INTO LIBRO VALUES(8,'Legado en los huesos','Ediciones Destino - 2013', 'Dolores Redondo (España)');
INSERT INTO LIBRO VALUES(9,'Robopocalipsis','Plaza & Janés Editores - Edición 2012', 'Daniel H. Wilson (Estados Unidos)');
INSERT INTO LIBRO VALUES(10,'El valle de los leones','Plaza & Janés Editores - Edición 2012', 'Ken Follet (Reino Unido)');

SELECT * FROM  LIBRO;

create table persona(
id_persona integer,
nom varchar2(300),
dir varchar2(100),
cp integer,
muni varchar2(40),
tel varchar2(20),
mail varchar2(60),
password varchar2(60),
CONSTRAINT PK2_id_persona PRIMARY KEY (id_persona));

INSERT INTO PERSONA VALUES(10,'Mario Hernández','Calle chopo #15 Colonia Viveros Xalostoc',55340,'Ecatepec','57559097','mario.hernandezv07@gmail.com','1234');
INSERT INTO PERSONA VALUES(20,'Ricardo Gonzales','Calle tulipan #45 Colonia Santa Clara',55350,'Ecatepec','57778432','ric.rodg@gmail.com','1234');
INSERT INTO PERSONA VALUES(1,'Jorge Perez','Calle fresno #84 Colonia Palomas',55380,'Ecatepec','57496375','jorgep.01@gmail.com','1234');

SELECT * FROM  persona;

create table renta(
id_renta integer,
lid_libro integer,
pid_persona integer,
CONSTRAINT PK3_id_renta PRIMARY KEY (id_renta),
CONSTRAINT FK1_id_libro FOREIGN KEY (lid_libro) REFERENCES libro(id_libro),
CONSTRAINT FK2_id_persona FOREIGN KEY (pid_persona) REFERENCES persona(id_persona));

CREATE SEQUENCE sec_libro
start WITH 1
increment by 1
nomaxvalue;

CREATE SEQUENCE sec_persona
start WITH 1
increment by 1
nomaxvalue;

CREATE SEQUENCE sec_renta
start WITH 1
increment by 1
nomaxvalue;

create or replace 
PROCEDURE guardar_libro
(
my_id_libro out varchar2,
my_nombre in varchar2,
my_editorial in varchar2,
my_autor in varchar2
) AS 
BEGIN
  select sec_libro.nextval into my_id_libro from dual;
  insert into libro values(my_id_libro, my_nombre, my_editorial,my_autor);
END guardar_libro;
/
