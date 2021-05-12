/*
Diseñar una base de datos que permita la gestión de un taller automotriz, que ofrece los siguientes servicios, platoneria, pintura, mecanica, mentenimiento preventivo y correctivo de sistemas de freno, cambio de aceite; el taller cuenta con varios empleados, los cuales tienen los siguientes cargos: jefe de taller, mecanico, pintor, platonero; los servicios se facturan a la placa asociada del vehiculo teniendo en cuenta que un vehiculo puede llevar varios servicios, y generar una unica factura.
*/

use DBTaller
go

CREATE TABLE TblCargo
(
PKId int identity (0,1) primary key,
Descripcion varchar (100)
)

CREATE TABLE TblDet_TblDet_TblOrdenTrabajo_TblServicios
( PKId bigint identity (1,1) primary key,
FKId_TblDet_TblOrdenTrabajo bigint not null,
FKCodigo_TblServicos varchar (50) not null,
Valor varchar (10) not null
 )

 CREATE TABLE TblDet_TblOrdenTrabajo
(
PKId bigint identity (1,1) primary key,
FKN_Orden_Tbl_OrdenTrabajo bigint not null,
FKId_TblEmpleados varchar (11) not null,
Hora_Inicio time not null,
Fecha_Inicio date not null,
Hora_Fin time not null,
Fecha_Fin date not null,
FKId_TblEstado int not null)

CREATE TABLE TblEmpleados
(
PKId varchar (11) primary key,
Nombres varchar (50)not null,
Apellidos varchar (50)not null,
Contacto varchar (30) not null,
FKId_TblCargo int not null,
FKNit_TblServiteca varchar (15),
Salario varchar (10),
Arl varchar (50)not null,
Eps varchar (50)not null
)

CREATE TABLE TblEstados
 (PKId int identity (0,1) primary key,
 Descripcion varchar (50) not null)

 CREATE TABLE TblLugar
(
PKId int identity (0,1) primary key,
Descripcion varchar (50) not null
)
 CREATE TABLE TblOrdenTrabajo
 (
 PKN_Orden bigint identity (1,1) primary key,
 FKId_TblEmpleados varchar (11) not null,
 Fecha date not null,
 FKPlaca_TblVehiculos varchar (8) not null,
 Subtotal varchar (10) not null,
 Iva varchar (10) not null,
 Total varchar (10) not null,
 FKId_TblEstado int not null)

 CREATE TABLE TblSeguridadSocial
(
PKId varchar (11) primary key,
Arl varchar (50) not null,
Eps varchar (50) not null,
Pension varchar (50) not null,
Fecha date not null
)

 CREATE TABLE TblServicios
 (
 PKCodigo varchar (50)primary key,
 Descripcion varchar (100) NOT NULL,
 Valor varchar (10) NOT NULL,
 Fecha date NOT NULL)

 CREATE TABLE TblServiteca
(PKId_Nit varchar(15) primary key,
Nombre varchar (200) not null,
Direccion varchar (300) NOT NULL,
Telefono varchar (11) NOT NULL,
FKId_TblLugar int not null
)

 CREATE TABLE TblVehiculos
(
PKPlaca varchar (50) primary key,
Especificaciones varchar (8000) NOT NULL,
 FKId_tipo_veh int not null,
 Modelo varchar (100) NOT NULL,
 Fecha date NOT NULL
 )

CREATE TABLE TblTipo_Vehiculo
 ( PKId int identity (0,1) primary key,
Especificaciones varchar (1000) not null,
Modelo varchar (100) not null,
Fecha date not null)

 ALTER TABLE TblDet_TblDet_TblOrdenTrabajo_TblServicios
 ADD CONSTRAINT FKId_TblDet_TblOrdenTrabajo
 FOREIGN KEY (FKId_TblDet_TblOrdenTrabajo) REFERENCES FTblDet_TblOrdenTrabajo




 ALTER TABLE TblOrdenTrabajo
ADD CONSTRAINT FKId_TblTblEstado1
FOREIGN KEY (FKId_TblEstado) REFERENCES TblEstados
ON UPDATE CASCADE

ALTER TABLE TblOrdenTrabajo 
ADD CONSTRAINT FKId_TblEmpleados1
FOREIGN KEY (FKId_TblEmpleados) REFERENCES TblEmpleados

ALTER TABLE TblDet_TblOrdenTrabajo
ADD CONSTRAINT  FKId_TblEmpleados2
FOREIGN KEY (FKId_TblEmpleados) REFERENCES TblEmpleados

ALTER TABLE TblDet_TblOrdenTrabajo
ADD CONSTRAINT FKId_TblEstado2
FOREIGN KEY (FKId_TblEstado) REFERENCES TblEstados

ALTER TABLE TblDet_TblOrdenTrabajo
ADD CONSTRAINT FKN_Orden_Tbl_OrdenTrabajo
FOREIGN KEY  (FKN_Orden_Tbl_OrdenTrabajo) REFERENCES TblOrdenTrabajo

ALTER TABLE TblVehiculos
ADD FOREIGN KEY (FKId_tipo_veh) 
REFERENCES TblTipo_Vehiculo(PKId)

ALTER TABLE TblVehiculos
 ADD FOREIGN KEY (FKId_tipo_veh)
 REFERENCES TblTIpo_Vehiculo(PKId)

ALTER TABLE TblServiteca
ADD CONSTRAINT FKId_TblLugar
FOREIGN KEY (FKId_TblLugar) REFERENCES TblLugar 


ALTER TABLE TblDet_TblDet_TblOrdenTrabajo_TblServicios
ADD FOREIGN KEY (FKCodigo_TblServicos) 
REFERENCES TblServicios(PKCodigo)






INSERT INTO TblCargo ( Descripcion) VALUES ('Jefe de taller') --No se agrega el PKId porque al ser --
INSERT INTO TblCargo (Descripcion) VALUES ('Mecanico')--un valor autoincrementable el sistema lo agregara automaticamente--
INSERT INTO TblCargo (Descripcion) VALUES ('Latonero')
INSERT INTO TblCargo (Descripcion) VALUES ('Pintor')


 
INSERT INTO TblEstados(PKId, Descripcion) 
VALUES (0, 'En Proceso'), (1, 'Completado')

INSERT INTO TblLugar (Descripcion) VALUES ('Apartado')
INSERT INTO TblLugar (Descripcion) VALUES ('Chigorodo')
INSERT INTO TblLugar (Descripcion) VALUES ('Carepa')
INSERT INTO TblLugar (Descripcion) VALUES ('Turbo')


INSERT INTO TblServicios(PKCodigo,Descripcion,Valor,Fecha)
 VALUES 
 ('MecB', 'Mecanica Basica', '100000', GETDATE()),
 ('MecFren', 'Mecanica Frenos', '150000', GETDATE()),
 ('LatB', 'Latoneria Basica', '80000', GETDATE()),
 ('LatC', 'Latoneria Completa', '160000', GETDATE()),
 ('PinB', 'Pintura Basica', '90000', GETDATE()),
 ('PinC', 'Pintura Completa', '200000', GETDATE())

 INSERT INTO TblServiteca(PKId_Nit, Nombre, Direccion, Telefono, FKId_TblLugar) 
 VALUES ('1001022363', 'Goez', 'B/Obrero', '3162427597', 0)


