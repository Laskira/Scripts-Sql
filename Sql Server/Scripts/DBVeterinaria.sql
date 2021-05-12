/*
Una clinica veterinaria requiere diseñar un sistema que permita solicitar cupos
para la atención de las mascotas de sus clientes, la clinica ofrece varios 
servicios dentro de los cuales se encuentra:
baño, esterilizacion, vacunación, entre otros
La clinica tiene varias sucursales en la ciudad, le debe permitir al cliente seleccionar la sucursal,
el servicio, el horario de atención y los datos básicos de la mascota a atender,
se debe tener en cuenta que el cliente cuenta con un usuario y contraseña para
ingresar a la plataforma, luego registrar a sus mascotas, para realizar la
programación de cupos.
*/

CREATE DATABASE DBVeterinaria
USE DBVeterinaria
GO
--TABLAS--
CREATE TABLE TblCiudad
(PKId int identity (1,1) primary key, 
Descripcion varchar (100))

CREATE TABLE TblTipo
(PKId int identity (1,1) primary key, 
Descripcion varchar (100))

CREATE TABLE TblSucursales
(PKNit varchar (15) primary key,
Nombre varchar (100),
Telefono varchar (15),
Correo varchar (100),
FKId_TblCiudad int,
FKId_TblTipo int,
Horario varchar (90))

CREATE TABLE TblDet_TblServicios_TblSucursal
(PKId int identity (1,1) primary key,
FKId_TblServicios int,
FKNit_TblSucursales varchar (15))

CREATE TABLE TblClientes
(PKId varchar (15) primary key,
Nombre varchar (150),
Telefono varchar (15),
Correo varchar (150))

CREATE TABLE TblUsuarios
(PKId varchar (15) primary key,
Contrase�a varchar(15),
FKId_TblEstado int)

CREATE TABLE TblMascotas
(PKId int identity (1,1) primary key,
Nombre varchar (150),
FKId_TblSexo int,
Edad varchar (3),
Raza varchar (150),
Fecha date,
FKId_TblClientes_TblUsuarios varchar (15))

CREATE TABLE TblEstado
(PKId int identity (1,1) primary key, 
Descripcion varchar (100))

CREATE TABLE TblSexo
(PKId int identity (1,1) primary key, 
Descripcion varchar (100))

CREATE TABLE TblCitas
(PKN_Registro int identity (1,1) primary key, 
FKId_TblClientes_TblUsuarios varchar (15),
Fecha date,
Hora time,
Subtotal bigint,
Iva bigint,
Total bigint)

CREATE TABLE TblDet_TblCitas
(PKId int identity (1,1) primary key,
FKId_TblMascotas int,
FKId_TblN_Registro int,
FKId_TblEstado int)

CREATE TABLE TblDet_TblDet_TblCitas_TblDet_TblServicios_TblSucursal
(PKId int identity (1,1) primary key,
FKId_TblDet_TblDet_Tblcitas int,
FKId_TblDet_TblServicios_TblSucursales int)

CREATE TABLE TblServicios
(PKId int identity (1,1) primary key, 
Descripcion varchar (100))

--RELACIONES--
ALTER TABLE TblDet_TblServicios_TblSucursal
ADD CONSTRAINT FKId_TblServicios
FOREIGN KEY (FKId_TblServicios) 
REFERENCES TblServicios

ALTER TABLE TblDet_TblServicios_TblSucursal
ADD CONSTRAINT FKNit_TblSucursales
FOREIGN KEY (FKNit_TblSucursales) 
REFERENCES TblSucursales

ALTER TABLE TblSucursales
ADD CONSTRAINT FKId_TblCiudad
FOREIGN KEY (FKId_TblCiudad) 
REFERENCES TblCiudad

ALTER TABLE TblSucursales
ADD CONSTRAINT FKId_TblTipo
FOREIGN KEY (FKId_TblTipo) 
REFERENCES TblTipo

ALTER TABLE TblDet_TblCitas
ADD CONSTRAINT PKId
FOREIGN KEY (PKId) 
REFERENCES TblDet_TblDet_TblCitas_TblDet_TblServicios_TblSucursal

ALTER TABLE TblDet_TblCitas
ADD CONSTRAINT FKId_TblMascotas
FOREIGN KEY (FKId_TblMascotas) 
REFERENCES TblMascotas

ALTER TABLE TblDet_TblCitas
ADD CONSTRAINT FKId_TblN_Registro
FOREIGN KEY (FKId_TblN_Registro) 
REFERENCES TblCitas

ALTER TABLE TblDet_TblCitas
ADD CONSTRAINT FKId_TblEstado
FOREIGN KEY (FKId_TblEstado) 
REFERENCES TblEstado

ALTER TABLE TblCitas
ADD CONSTRAINT FKId_TblClientes_TblUsuarios
FOREIGN KEY (FKId_TblClientes_TblUsuarios)
REFERENCES TblUsuarios

ALTER TABLE TblUsuarios
ADD CONSTRAINT FKId_TblEstado1
FOREIGN KEY (FKId_TblEstado)
REFERENCES TblEstado

ALTER TABLE TblMascotas
ADD CONSTRAINT FKId_TblSexo
FOREIGN KEY (FKId_TblSexo)
REFERENCES TblSexo

ALTER TABLE TblMascotas
ADD CONSTRAINT FKId_TblClientes_TblUsuarios1
FOREIGN KEY (FKId_TblClientes_TblUsuarios)
REFERENCES TblUsuarios

ALTER TABLE TblUsuarios
ADD CONSTRAINT PKId2
FOREIGN KEY (PKId)
REFERENCES TblClientes