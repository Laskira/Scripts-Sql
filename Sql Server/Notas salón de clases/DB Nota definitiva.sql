
--EJEMPLO DE PROCEDIMIENTO ALMACENADO
/*Estudiante:
4 notas
1 = 30%
2 = 30%  =100%
3 = 10%   Saber si aprobo o no aprobo
4 = 30%*/

CREATE DATABASE DBDefinitiva
GO

USE DBDefinitiva
GO

CREATE TABLE TblEstudiantes
(
PkId varchar (11) primary key,
Nombres_Completos varchar (80) not null,
Correo varchar (50) not null
)

CREATE TABLE TblCalificaciones --Tabla de resultados
(
PkId int identity(0,1) primary key,
FkId_TblEstudiantes varchar (11) not null,
Fecha date not null,
Nota1 decimal not null,
Nota2 decimal not null,
Nota3 decimal not null,
Nota4 decimal not null,
Definitiva decimal not null,
FkId_TblEstado int not null)

CREATE TABLE TblEstado
(PkId int identity(0,1) primary key,
Descripcion varchar (50) not null)

INSERT INTO TblEstado
(Descripcion)
VALUES
('Aprobo'), ('No Aprobo')

ALTER TABLE TblCalificaciones
ADD CONSTRAINT FkId_TblEstudiantes
FOREIGN KEY (FkId_TblEstudiantes) REFERENCES TblEstudiantes

ALTER TABLE TblCalificaciones
ADD CONSTRAINT FkId_TblEstado
FOREIGN KEY (FkId_TblEstado) REFERENCES TblEstado

--Un cursor hace un recorrido en la base representa como * es  un parametro o varible
--
--EJECUCION SP_CalcularDefinitiva
EXECUTE SP_CalcularDefinitiva 5, 5, 5, 2, 123, 'Yuli Goez', 'yuli@gmail.com'

