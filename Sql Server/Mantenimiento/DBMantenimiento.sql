

CREATE DATABASE DBMantenimiento


CREATE TABLE TblEquipos(
	PkSerial varchar(25) primary key,
	Caracteristicas varchar(100) NOT NULL,
	Modelo varchar(100) NOT NULL, --This in an inventory is called reference--
	FkId_TblEstado int NOT NULL,
	FkId_TblClientes varchar (15) NOT NULL)

CREATE TABLE TblEstado(
	PkId int IDENTITY(0,1) NOT NULL primary key,
	Descripcion varchar(50) NOT NULL)

	CREATE TABLE TblEstado(
	PkId int IDENTITY(0,1) NOT NULL primary key,
	Descripcion varchar(50) NOT NULL)


CREATE TABLE TblPersonas
(PkId varchar (15) primary key,
P_Nombre varchar (80) not null,
S_Nombre varchar (80) not null,
P_Apellido varchar (80) not null,
S_Apellido varchar (80) not null,
Contacto varchar (20)  not null,
Direcccion varchar (100)  not null,
FkId_TblSexo int not null,
FkId_TblRol int not null
)


CREATE TABLE TblSexo
(PkId int identity(0,1) primary key, 
Descripcion varchar (50) not null) 


CREATE TABLE TblRol
(PkId int identity(0,1) primary key, 
Descripcion varchar (50) not null) 

CREATE TABLE TblMantenimiento(
	[PkId] [int] IDENTITY(0,1) NOT NULL primary key,
	[FkSerial_TblEquipos] [varchar](25) NOT NULL,
	[Fecha] [date] NOT NULL,
	[Hora] [time]NOT NULL,
	FkId_TblPersonas varchar (15) not null,
	Descripcion varchar (200)  not null) 


--LLAVES FORANEAS--

ALTER TABLE TblPersonas
ADD CONSTRAINT FkId_TblSexo
FOREIGN KEY (FkId_TblSexo) 
REFERENCES TblSexo(PkId)

ALTER TABLE TblEquipos
ADD CONSTRAINT FkId_TblPersonas
FOREIGN KEY (FkId_TblPersonas)
REFERENCES TblPersonas(PkId)

ALTER TABLE TblEquipos
ADD CONSTRAINT FkId_TblEstado
FOREIGN KEY (FkId_TblEstado)
REFERENCES TblEstado(PkId)

	ALTER TABLE TblPersonas
ADD CONSTRAINT FkId_TblRol
FOREIGN KEY (FkId_TblRol) 
REFERENCES TblRol

ALTER TABLE TblMantenimiento
ADD CONSTRAINT FkSerial_TblEquipos
FOREIGN KEY (FkSerial_TblEquipos) 
REFERENCES TblEquipos

--INSERT-

INSERT INTO TblEstado
(Descripcion)
VALUES
('Activo'), ('En reparacion'), ('Reparado')

INSERT INTO TblSexo(Descripcion) VALUES ('Masculino'), ('Femenino')

