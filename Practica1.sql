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
