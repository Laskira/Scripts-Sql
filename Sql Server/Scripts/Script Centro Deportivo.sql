/*Realizar un progrma utilizando tecnología .net y como sistema de almacenamiento SqlServer,
que permita gestionar la información de un centro deportivo el cual desea mantener 
actualizada la información de los deportistas, rutinas de ejercicios y planes de 
entrenamiento a los cuales esta inscrito, adicional a ello debe almacenar un detallado
de cada entrenamiento realizado para llevar un registro de visitas del deportista y 
verificar que si esta cumpliendo con su cuota de ejercicio diaria.*/
CREATE DATABASE DBDeportistas
GO

USE DBDeportistas
GO

CREATE TABLE TblDeportistas
(PKId varchar(11) primary key,
P_Nombre varchar (50) not null,
S_Nombre varchar (50),
P_Apellido varchar (50) not null,
S_Apellido varchar (50),
FKId_TblSexo int not null,
Direccion varchar (150) not null,
Telefono varchar(11) not null,
Correo varchar (150) not null,
FechaNacimiento date not null,
Peso float not null
)


CREATE TABLE TblSexo
(
PKId int identity(0,1) primary key,
Descripcion varchar (100)
)

ALTER TABLE TblDeportistas --Relacion entidad sexo - deportistas
ADD CONSTRAINT FKId_TblSexo
FOREIGN KEY (FKId_TblSexo) REFERENCES TblSexo

INSERT INTO TblSexo(Descripcion) 
VALUES ('Masculino'), ('Femenino')
/**/

CREATE TABLE TblDeportes
(
PKId int identity(0,1) primary key,
Descripcion varchar (100) not null,
PrecioInscripcion money not null
)

CREATE TABLE TblInscripciones
(PKCodigo int identity(0,1) primary key,
FKId_TblDeportistas varchar(11) not null,
FKId_TblDeportes int not null,
Fecha date not null,
PrecioInscripcion money not null)


ALTER TABLE TblInscripciones --Relacion entidad inscripciones - deportistas
ADD CONSTRAINT FKId_TblDeportistas
FOREIGN KEY (FKId_TblDeportistas) REFERENCES TblDeportistas

ALTER TABLE TblInscripciones --Relacion entidad deportes - inscripciones
ADD CONSTRAINT FKId_TblDeportes
FOREIGN KEY (FKId_TblDeportes) REFERENCES TblDeportes

INSERT INTO TblDeportes(Descripcion, PrecioInscripcion) values('Futbol',10.000) 
INSERT INTO TblDeportes(Descripcion, PrecioInscripcion) values('Karate',10.000) 
INSERT INTO TblDeportes(Descripcion, PrecioInscripcion) values('Taekwondo',20.000) 
INSERT INTO TblDeportes(Descripcion, PrecioInscripcion) values('Ciclismo',15.000)



CREATE TABLE TblRutina
(
PKId bigint identity(0,1) primary key,
Descripcion varchar (250),
IntensidadHoraria varchar(3) not null,
FKId_TblDeportes int not null
)

ALTER TABLE TblRutina
ADD CONSTRAINT FKId_TblDeportes_01
FOREIGN KEY (FKId_TblDeportes) REFERENCES TblDeportes

CREATE TABLE TblSeguimiento
(
PKN_Registro bigint identity(0,1) primary key,
FKId_TblRutina bigint not null,
FKId_TblDeportista varchar(11) not null,
Fecha date not null,
Hora time not null
)