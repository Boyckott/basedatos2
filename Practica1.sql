-- Crearemos una tabla muy simple para probar el poder de PL SQL 

CREATE TABLE DANCE(ID_DANCE INTEGER, NOMBRE VARCHAR2(40), EDAD INTEGER);
--Prendemos el servidor en modo de desarrolador 
SET SERVEROUTPUT ON;
--Vamos a empezar con un bloque PL SQL 
DECLARE 
--Aqui se declaran las variables
EDAD INTEGER;
YEARS INTEGER;
BEGIN
--Aqui la logica de tu programita
YEARS:=24;
EDAD:=YEARS*365;

DBMS_OUTPUT.PUT_LINE('TU EDAD EN DIAS ES '||EDAD);

END;
/
--CREAR UN BLOQUE PL SQL QUE GENERE 200,000 REGISTRO EN SECUENCIA ASCENDENTE EN LA TABLA DANCE 
BEGIN 

FOR I IN 1..200000 LOOP 
  INSERT INTO DANCE VALUES(I,'CAMPOS',44);
  
  END LOOP;
  END; 
  /
  
--HACEMOS UN SELECT PARA VER QUE DIABLOS HIZO 
SELECT * FROM DANCE;

--SISTEMA DE PELICULAS LA DE SALA SERA TU TAREA 

CREATE TABLE PELICULA (
                      ID_PELICULA INTEGER, 
                      TITULO VARCHAR2(120),
                      SINOPSIS VARCHAR2(500),
                      CLASIFICACION VARCHAR2(5),
                      CONSTRAINT PK_ID_PELICULA PRIMARY KEY(ID_PELICULA)
                      );
                      DESCRIBE PELICULA;
                    
CREATE TABLE HORARIOS (
                      ID_HORARIO INTEGER,
                      ID_PELICULA INTEGER,
                      HORARIO VARCHAR2(8),
                      CONSTRAINT FK_ID_HORARIO PRIMARY KEY(ID_HORARIO),
                      CONSTRAINT FK1_ID_PELICULA FOREIGN KEY (ID_PELICULA) REFERENCES PELICULA(ID_PELICULA)
                      );
                      DESCRIBE HORARIOS;
                      
CREATE SEQUENCE sec_pelicula
start WITH 1
increment by 1
nomaxvalue;


--solamente se puede asociar una secuencia a una sola tabla 

--para asociarla se necesita un nuevo objeto de base de datos, este objeto va a ser el que insertara el o los nuevos registros en pelicula : en resumen 
--jamas se usa un insert into... en oracle cuanto tiene un primary key auto-generado 
