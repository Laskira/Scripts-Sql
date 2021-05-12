/*
Elaborar un diseño de base de datos que permita gestionar la información de una oficina de
abogados, la cual tiene las siguientes características.
un abogado puede tener a cargo uno o mas casos de diferentes clientes y en juzgados diferentes, cada
caso debe llevar un seguimiento de cada revisión que se hace, se debe tener también en cuenta que el
cliente puede tener mas de un medio de comunicación ya sea, teléfono fijo, móvil, correo electrónico,
redes sociales entre otros.
*/


CREATE DATABASE DBAbogados
GO

USE DBAbogados
GO

CREATE TABLE TblOficinas
(
PkNit varchar (20) primary key,
Nombre varchar (500) not null,
Contacto varchar (30) not null,
Direccion varchar (600) not null,
Correo varchar (200) not null,
FkId_TblLugar bigint not null 
)

CREATE TABLE TblLugar 
(
PkId bigint identity(0,1) primary key,
Descripcion varchar (100)
)

ALTER TABLE TblOficinas
ADD CONSTRAINT FkId_TblLugar
FOREIGN KEY (FkId_TblLugar) REFERENCES TblLugar

INSERT INTO TblLugar(Descripcion) 
VALUES ('Apartad�'), ('Chigorodo'), ('Turbo'), ('Carepa'), ('Mutata'), ('Necocli'), ('Arboletes')

CREATE TABLE TblPersonas
(
PkId varchar (15) primary key,
FkId_TblTipoDocumento int not null,
P_Nombre varchar (50) not null,
S_Nombre varchar (50),
P_Apellido varchar (50) not null,
S_Apellido varchar (50),
Contacto varchar (20) not null,
Correo varchar (200) not null,
Dirrecion varchar (300) not null,
FkId_TblSexo int not null,
FkId_TblEstadoCivil int not null,
Altura varchar (3),
Peso varchar (3),
Edad varchar (3),
FkId_TblRh int not null,
FkId_TblColor int not null,
Descripcion_Perfil varchar (8000) not null,
Fot varchar (8000) not null
)

CREATE TABLE TblTipoDocumento
(
PkId int identity(0,1) primary key,
Descripcion varchar (100)
)

ALTER TABLE TblPersonas --Relacion entidad tipodocumento - personas
ADD CONSTRAINT FkId_TblTipoDocumento
FOREIGN KEY (FkId_TblTipoDocumento) REFERENCES TblTipoDocumento

INSERT INTO TblTipoDocumento(Descripcion) 
VALUES ('CC'), ('TI'), ('CE'), ('PAS'), ('ViS')

CREATE TABLE TblSexo
(
PkId int identity(0,1) primary key,
Descripcion varchar (100)
)

ALTER TABLE TblPersonas --Relacion entidad sexo - personas
ADD CONSTRAINT FkId_TblSexo
FOREIGN KEY (FkId_TblSexo) REFERENCES TblSexo

INSERT INTO TblSexo(Descripcion) 
VALUES ('Masculino'), ('Femenino'), ('Otro')

CREATE TABLE TblEstadoCivil
(
PkId int identity(0,1) primary key,
Descripcion varchar (100)
)

ALTER TABLE TblPersonas --Relacion entidad EstadoCivil - personas
ADD CONSTRAINT FkId_TblEstadoCivil
FOREIGN KEY (FkId_TblEstadoCivil) REFERENCES TblEstadoCivil

INSERT INTO TblEstadoCivil(Descripcion) 
VALUES ('Soltero(a)'), ('Casado(a)'), ('Uni�n libre'), ('Divorciado(a)'), ('Viudo(a)'),  ('Comprometido(a)')

CREATE TABLE TblRh
(
PkId int identity(0,1) primary key,
Descripcion varchar (100)
)

ALTER TABLE TblPersonas --Relacion entidad Rh - personas
ADD CONSTRAINT FkId_TblRh
FOREIGN KEY (FkId_TblRh) REFERENCES TblRh

INSERT INTO TblRh(Descripcion) 
VALUES ('O-'), ('O+'), ('A-'), ('A+'), ('B-'), ('B+'), ('AB-'),('AB+') 

CREATE TABLE TblColor
(
PkId int identity(0,1) primary key,
Descripcion varchar (100)
)

ALTER TABLE TblPersonas --Relacion entidad Color - personas
ADD CONSTRAINT FkId_TblColor
FOREIGN KEY (FkId_TblColor) REFERENCES TblColor

INSERT INTO TblColor(Descripcion) 
VALUES ('Muy claro'), ('Claro'), ('Medio'), ('Mediterraneo'), ('Oscuro'), ('Muy Oscuro')

CREATE TABLE TblContratos
(
  PkN_Contracto bigint identity(0,1) primary key,
  FkNit_TblOficinas varchar(20) not null,
  FkId_TblPersonas varchar(15) not null,
  Fecha_Inicio date not null,
  Fecha_Fin date not null,
  Fecha_Creacion date not null,
  Valor varchar (100) not null,
  Clausulas varchar (8000) not null --Escaneada del constrato f�sico
)

ALTER TABLE TblContratos --Relacion entidad Oficina - Contrato
ADD CONSTRAINT FkNit_TblOficinas_Constrato
FOREIGN KEY (FkNit_TblOficinas) REFERENCES TblOficinas


ALTER TABLE TblContratos --Relacion entidad Personas - Contrato
ADD CONSTRAINT FkId_TblPersonas_Contratos
FOREIGN KEY (FkId_TblPersonas) REFERENCES TblPersonas

CREATE TABLE TblUsuarios
(
PkUsuario varchar(100) primary key,
Contrase�a varchar(15) not null,
Fecha_Creacion date not null
)

--ESTO DE DONDE SALE(�?)
ALTER TABLE TblUsuarios--Relacion entidad Personas - Contrato
ADD CONSTRAINT FkId_TblPersonas_Usuarios
FOREIGN KEY (FkId_TblPersonas) REFERENCES TblPersonas

--NO USAR

CREATE TABLE TblDet_TblPersonas_TblUsuarios
(
PkId bigint identity(1,1) primary key,
FkUsuario_TblUsuarios varchar (100) not null,
FkId_TblRol int not null,
FkId_TblEstado int not null,
FkId_TblPersonas varchar (15) not null
)

CREATE TABLE TblRol
(
PkId int identity(0,1) primary key,
Descripcion varchar (50)
)

CREATE TABLE TblEstado
(
PkId int identity(0,1) primary key,
Descripcion varchar (50)
)

ALTER TABLE TblDet_TblPersonas_TblUsuarios --Relacion entidad Usuarios - Det_TblPersonas_TblUsuarios
ADD CONSTRAINT FkUsuario_TblUsuarios_Det
FOREIGN KEY (FkUsuario_TblUsuarios) REFERENCES TblUsuarios


ALTER TABLE TblDet_TblPersonas_TblUsuarios --Relacion entidad Usuarios - Rol
ADD CONSTRAINT FkId_TblRol
FOREIGN KEY (FkId_TblRol) REFERENCES TblRol

ALTER TABLE TblDet_TblPersonas_TblUsuarios --Relacion entidad Usuarios - Estado
ADD CONSTRAINT FkId_TblEstado_Det
FOREIGN KEY (FkId_TblEstado) REFERENCES TblEstado

ALTER TABLE TblDet_TblPersonas_TblUsuarios --Relacion entidad Usuarios - Personas
ADD CONSTRAINT FkId_TblPersonas
FOREIGN KEY (FkId_TblPersonas) REFERENCES TblPersonas

INSERT INTO TblRol(Descripcion)
VALUES ('Administrador(a)'), ('Abogado(a)'), ('Cliente'), ('Secretario(a)')

INSERT INTO TblEstado(Descripcion)
VALUES ('Activo'), ('Inactivo'), --usuarios
('Abierto'), ('Cerrado') --casos

CREATE TABLE TblCasos
(
PkN_Caso bigint identity(0,1) primary key,
FkId_TblDet_TblPersonas_TblUsuarios bigint not null,
FkId_TblTipoCaso int not null,
FkId_TblEstado int not null,
Fecha_Creacion date not null,
Fecha_Apertura date not null,
Fecha_Cierre date not null,
FkUsuario_TblUsuarios varchar(100) not null,
Rese�a varchar (8000) not null
)

CREATE TABLE TblTipoCaso
(
PkId int identity(0,1) primary key,
Descripcion varchar (50)
)

ALTER TABLE TblCasos --Relacion entidad Casos - TipoCaso
ADD CONSTRAINT FkId_TblTipoCaso
FOREIGN KEY (FkId_TblTipoCaso) REFERENCES TblTipoCaso

INSERT INTO TblTipoCaso(Descripcion)
VALUES ('Penal'), ('Procesal'), ('Inmobiliario'), ('Civil'), ('Laboral'), ('Familiar'), ('Mercantil')

ALTER TABLE TblCasos --Relacion entidad Casos - Det_TblPersonas_TblUsuarios
ADD CONSTRAINT FkId_TblDet_TblPersonas_TblUsuarios
FOREIGN KEY (FkId_TblDet_TblPersonas_TblUsuarios) REFERENCES TblDet_TblPersonas_TblUsuarios

ALTER TABLE TblCasos --Relacion entidad Casos - Estado
ADD CONSTRAINT FkId_TblEstado_Casos
FOREIGN KEY (FkId_TblEstado) REFERENCES TblEstado

ALTER TABLE TblCasos --Relacion entidad Casos - Usuarios
ADD CONSTRAINT FkUsuario_TblUsuarios_Casos
FOREIGN KEY (FkUsuario_TblUsuarios) REFERENCES TblUsuarios

CREATE TABLE TblEvidencias
(
PkN_Evidencia bigint identity (1,1)primary key,
FkN_Caso_TblCasos bigint not null,
Fecha date not null,
Hora time not null,
Numero int not null,
Descripcion varchar (8000) not null
)

ALTER TABLE TblEvidencias --Relacion entidad Evidencias - Casos
ADD CONSTRAINT FkN_Caso_TblCasos_Evidencia
FOREIGN KEY (FkN_Caso_TblCasos) REFERENCES TblCasos

CREATE TABLE TblBitacoras
(
PkN_Consecutivo bigint identity (1,1)primary key,
FkN_Caso_TblCasos bigint not null,
Descripcion varchar(100) not null,
Fecha date,
Hora time
)

ALTER TABLE TblBitacoras
ADD CONSTRAINT FkN_Caso_TblCaso_Bitacora
FOREIGN KEY (FkN_Caso_TblCasos) REFERENCES TblCasos
