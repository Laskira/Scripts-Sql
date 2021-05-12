/*
Diseñar una base de datos que permita utilizando la tecnologia de procedimientos almacenados calcular la velocidad promedio de un vehiculo teniendo en cuenta que la velovidad es igual a espacio, sobre tiempo

v= e/t
1. v >10 v <=40 Demasiado lento
2. v>10 40 v <80 Adecuado
3.

*/

CREATE DATABABASE DBVelocidad3

USE DBVelocidad 
GO

CREATE TABLE TblVelocidad
(
PKId int identity(1,1) primary key,
Espacio float not null,
Tiempo float not null,
Velocidad float not null,
FKId_TblEstado int not null
)
GO 
CREATE TABLE TblEstado
(
PKId  int identity(1,1),
Descripcion varchar (500)
)
GO 

--parte en dos bloques el archivo usando el orden de prioridad
-- 1. database 2.table 3.procedimiento almacenado
CREATE PROCEDURE SP_CalcularVelocidad
@espacio float, @tiempo float
AS BEGIN
DECLARE @velocidad float
DECLARE @estado int
SET @velocidad = @espacio / @tiempo

IF(@velocidad >10) and (@velocidad<=40)--rango 10 a 40
SET @estado=1
IF(@velocidad >40) and (@velocidad<=80)--rango 41 a 80
SET @estado=2
IF(@velocidad >80)--rango 80 en adelante
SET @estado=3
INSERT INTO TblVelocidad
(Espacio,Tiempo,Velocidad,FKId_TblEstado)
VALUES 
(@espacio,@tiempo,@velocidad,@estado)
END