CREATE DATABASE DBMercado
GO

USE DBMercado
GO

CREATE TABLE TblTienda
(
  PKNit varchar(20) primary key,
  Nombre varchar(200) not null,
  Contacto  varchar(20) not null,
  Direccion varchar(250) not null,
  Correo varchar(250) not null,
  FKId_TblLugar int not null
)

CREATE TABLE TblLugar
(
  PKId int identity(0,1) primary key,
  Descripcion varchar(200) not null
)

ALTER TABLE TblTienda
ADD CONSTRAINT FKId_TblLugar
FOREIGN KEY (FKId_TblLugar)
REFERENCES TblLugar


CREATE TABLE TblProductos
(
   PKSerial varchar(20) primary key,
   Especificaciones  varchar(200) not null,
   PrecioUnitario money not null,
   Peso float  not null,
   Marca varchar(150) not null,
   FKId_TblTipo int not null,
   FKNit_TblTienda varchar(20) not null,
   Stock int not null,
   StockMin int not null
)

ALTER TABLE TblProductos
ADD CONSTRAINT FKNit_TblTienda
FOREIGN KEY (FKNit_TblTienda)
REFERENCES TblTienda

CREATE TABLE TblTipo
(
  PKId int identity(0,1) primary key,
  Descripcion varchar(200) not null
)

ALTER TABLE TblProductos
ADD CONSTRAINT FKId_TblTipo
FOREIGN KEY (FKId_TblTipo)
REFERENCES TblTipo

CREATE TABLE TblClientes
(
  PKId varchar(20) primary key,
  P_Nombre varchar(50) not null,
  S_Nombre varchar(50) not null,
  P_Apellido varchar(50) not null,
  S_Apellido varchar(50) not null,
  Contacto varchar(20) not null,
  FKId_TblSexo int not null,
  Edad int not null,
  FechaNac int not null,
  FKId_TblEstadoCivil int not null,
  Correo varchar(200) not null
)
CREATE TABLE TblSexo
(
  PKId int identity(0,1) primary key,
  Descripcion varchar(200) not null
)

ALTER TABLE TblClientes
ADD CONSTRAINT FKId_TblSexo
FOREIGN KEY (FKId_TblSexo)
REFERENCES TblSexo

CREATE TABLE TblEstadoCivil
(
  PKId int identity(0,1) primary key,
  Descripcion varchar(200) not null
)

ALTER TABLE TblClientes
ADD CONSTRAINT FKId_TblEstadoCivil
FOREIGN KEY (FKId_TblEstadoCivil)
REFERENCES TblEstadoCivil

CREATE TABLE TblDir_Envio
(
  PKId int identity(0,1) primary key,
  FKId_TblClientes varchar(20) not null,
  Direccion varchar(200) not null
)

ALTER TABLE TblDir_Envio
ADD CONSTRAINT FKId_TblClientes
FOREIGN KEY (FKId_TblClientes)
REFERENCES TblClientes

CREATE TABLE TblUsuario
(
  PKUsuario varchar(20) primary key,
  Contraseña varchar(20) not null,
  FKId_TblClientes varchar(20) not null,
  FKId_TblEstado int not null,
  Fecha date not null,
  Puntaje int not null,
  FKId_TblNivel int not null

)

ALTER TABLE TblUsuario
ADD CONSTRAINT FKId_TblClientes1
FOREIGN KEY (FKId_TblClientes)
REFERENCES TblClientes

CREATE TABLE TblEstado
(
  PKId int identity(0,1) primary key,
  Descripcion varchar(200) not null
)

ALTER TABLE TblUsuario
ADD CONSTRAINT FKId_TblEstado
FOREIGN KEY (FKId_TblEstado)
REFERENCES TblEstado

CREATE TABLE TblNivel
(
  PKId int identity(0,1) primary key,
  Descripcion varchar(200) not null
)

ALTER TABLE TblUsuario
ADD CONSTRAINT FKId_TblNivel
FOREIGN KEY (FKId_TblNivel)
REFERENCES TblNivel


CREATE TABLE TblEnvios
(
  PKN_Envio bigint identity(0,1) primary key,
  FKN_Factura_TblFacturas bigint not null, 
  FechaRegistro date not null,
  FKId_TblEstado int not null,
  FKId_TblDestino int not null,
  NombreDestino  varchar(100) not null

)


ALTER TABLE TblEnvios
ADD CONSTRAINT FKId_TblEstado1
FOREIGN KEY (FKId_TblEstado)
REFERENCES TblEstado


CREATE TABLE TblDestino
(
  PKId int identity(0,1) primary key,
  Descripcion varchar(200) not null
)

ALTER TABLE TblEnvios
ADD CONSTRAINT FKId_TblDestino
FOREIGN KEY (FKId_TblDestino)
REFERENCES TblDestino

CREATE TABLE TblFacturas
(
  PKN_Factura bigint identity(0,1) primary key,
  FKNit_TblTienda varchar(20) not null,
  FKUsuario_TblUsuario varchar(20) not null,
  Fecha date not null,
  SubTotal money not null,
  Iva float not null,
  Total money not null
)

ALTER TABLE TblFacturas
ADD CONSTRAINT FKNit_TblTienda1
FOREIGN KEY (FKNit_TblTienda)
REFERENCES TblTienda

ALTER TABLE TblFacturas
ADD CONSTRAINT FKUsuario_TblUsuario2
FOREIGN KEY (FKUsuario_TblUsuario)
REFERENCES TblUsuario

CREATE TABLE TblDet_TblFacturas
(
   PKId bigint identity(0,1) primary key,
   FKN_Factura_TblFacturas bigint not null,
   FKSerial_TblProductos varchar(20) not null,
   Cantidad int not null, 
   ValorUnitario money not null
)

ALTER TABLE TblDet_TblFacturas
ADD CONSTRAINT FKN_Factura_TblFacturas
FOREIGN KEY (FKN_Factura_TblFacturas)
REFERENCES TblFacturas

ALTER TABLE TblDet_TblFacturas
ADD CONSTRAINT FKSerial_TblProductos
FOREIGN KEY (FKSerial_TblProductos)
REFERENCES TblProductos


  