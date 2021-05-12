CREATE DATABASE DBTaxi
GO

USE DBTaxi
GO

CREATE TABLE TblPersonas
(PKCorreo varchar(500) primary key,
P_Nombre varchar (50) not null,
S_Nombre varchar (50),
P_Apellido varchar (50) not null,
S_Apellido varchar (50),
FechaNacimiento date not null,
Celular varchar (20) not null,
FKId_TblSexo int not null,
Foto varchar (8000))


CREATE TABLE TblSexo
(PKId int identity(0,1) primary key,
Descripcion varchar (100))

ALTER TABLE TblPersonas
ADD CONSTRAINT FKId_TblSexo
FOREIGN KEY (FKId_TblSexo) REFERENCES TblSexo

INSERT INTO TblSexo(Descripcion) VALUES ('Masculino'), ('Femenino'),('Otro')

CREATE TABLE TblUsuarios
(FKUser varchar (500) primary key, /*Notese que aquí se aplica la teoria en el que el id de persona equivale al de usuario*/
Contraseña varchar (200) not null,
FKId_TblRol int not null,
FKId_TblEstado int not null,
FechaCreacion date not null)


CREATE TABLE TblEstado
(
PKId int identity(0,1) primary key,
Descripcion varchar(60) not null
)

ALTER TABLE TblUsuarios
ADD CONSTRAINT FKId_TblEstado
FOREIGN KEY (FKId_TblEstado) REFERENCES TblEstado

INSERT INTO TblEstado(Descripcion) VALUES ('Activo'),('Inactivo'),('Pendiente'),('Hecho') 

CREATE TABLE TblRol
(
PKId int identity(0,1) primary key,
Descripcion varchar(60) not null
)


ALTER TABLE TblUsuarios
ADD CONSTRAINT FKId_TblRol
FOREIGN KEY (FKId_TblRol) REFERENCES TblRol

INSERT INTO TblRol(Descripcion) VALUES ('Cliente'),('Conductor')

CREATE TABLE TblCarreras
(PKId int identity(0,1) primary key /*En la app crear un id aleatorio con el se confirme*/,
FKId_TblPersonas_Cliente varchar(500) not null,
Ubicacion varchar(200) not null, /*coordenadas cliente*/
MomentoSolicitud datetime not null,
Destino varchar(200) not null,
Cumplimiento datetime not null,
FKId_TblEstado int not null,
Precio money not null /*The will make this*/,
FKId_TblTaxi varchar(20) not null
)

ALTER TABLE TblCarreras
ADD CONSTRAINT FKId_TblPersonas_Cliente
FOREIGN KEY (FKId_TblPersonas_Cliente) REFERENCES TblPersonas

ALTER TABLE TblUsuarios
ADD CONSTRAINT FKId_TblEstado1
FOREIGN KEY (FKId_TblEstado) REFERENCES TblEstado



CREATE TABLE TblTaxi
(TaxPlaca varchar(20) primary key,
FKId_TblPersonas_Conductor varchar(500) not null,
FKId_TblTipo int not null)


ALTER TABLE TblTaxi
ADD CONSTRAINT FKId_TblPersonas_Conductor
FOREIGN KEY (FKId_TblPersonas_Conductor) REFERENCES TblPersonas

CREATE TABLE TblTipo
(
PKId int identity(0,1) primary key,
Descripcion varchar(60) not null
)

ALTER TABLE TblTaxi
ADD CONSTRAINT FKId_TblTipo
FOREIGN KEY (FKId_TblTipo) REFERENCES TblTipo


INSERT INTO TblTipo(Descripcion) VALUES ('Común'), ('De Lujo')
