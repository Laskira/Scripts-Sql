CREATE DATABASE DBFacturacion

USE DBFacturacion
GO
--Tablas--
CREATE TABLE TblSexo
(PkId int primary key,
Descripcion varchar (50))

CREATE TABLE TblPersonas
(PkId int primary key identity(1,1),
P_Nombre varchar (100) not null,
S_Nombre varchar (100) not null,
P_Apellidos varchar (100) not null,
Telefono varchar (15),
Correo varchar (150),
FkId_TblSexo int not null,
FkId_TblEstadoCivil int not null, 
Cant_Hijos int,
S_Apellido varchar (150))


CREATE TABLE TblEstadoCivil
(PkId int primary key,
Descripcion varchar (100))

CREATE TABLE TblRol
(PkId int primary key,
Descripcion varchar (100))

CREATE TABLE TblEstado
(PkId int primary key,
Descripcion varchar (100))

CREATE TABLE TblEmpresa
(PkNit varchar (80) primary key,
Descripcion varchar (100))

CREATE TABLE TblUbicacion
(PkId int primary key,
Descripcion varchar (100))

CREATE TABLE TblSucursales
(PkNit varchar (80) primary key,
N_Sucursal int,
FkNit_TblEmpresa varchar (80),
Dirrecion varchar (180),
Telefono varchar (15),
FkId_TblUbicacion int)

CREATE TABLE TblUsuarios
(PkId_TblPersonas int primary key,
Contrasenia varchar (15),
FkId_TblRol int,
FkId_TblEstado int,
FkNit_TblSucursal varchar (80))

CREATE TABLE TblProductos
(PkCodigo int primary key identity(1,1),
Caracteristicas varchar (150),
Nombre varchar (100),
Stock_Min int,
Stock int,
FkId_TblEstado int,
FkNit_TblSucursal varchar (80),
Valor_Unitario float)

CREATE TABLE TblTipoPago
(PkId int primary key,
Descripcion varchar (100))

CREATE TABLE TblFacturas
(PkN_Factura int primary key identity(1,1),
FkId_TblPersonas int,
FkId_TblPersonas_TblUsuarios int,
Fecha date,
SubTotal float,
Iva float,
Total float,
FKId_TblTipoPago int)

CREATE TABLE TblHistorial
(PkId int primary key identity(1,1),
FkId_TblPersonas_TblUsuarios int,
Fecha_I date,
Hora_I time,
Fecha_S date,
Hora_S time)

CREATE TABLE TblDet_TblFacturas
(PkId int primary key identity(1,1),
FkN_Factura int,
FkCodigo_TblProductos int,
Cantidad int,
Valor_Unitario float)


--LLAVES FORANEAS--

ALTER TABLE TblPersonas
ADD FOREIGN KEY (FkId_TblSexo)
REFERENCES TblSexo(PkId)

ALTER TABLE TblPersonas
ADD FOREIGN KEY (FkId_TblEstadoCivil)
REFERENCES TblEstadoCivil(PkId)

ALTER TABLE TblUsuarios
ADD FOREIGN KEY (PkId_TblPersonas)
REFERENCES TblPersonas(PkId)

ALTER TABLE TblUsuarios
ADD FOREIGN KEY (FkId_TblRol)
REFERENCES TblRol(PkId)

ALTER TABLE TblUsuarios
ADD FOREIGN KEY (FkId_TblEstado)
REFERENCES TblEstado(PkId)

ALTER TABLE TblUsuarios
ADD FOREIGN KEY (FkNit_TblSucursal)
REFERENCES TblSucursales(PkNit)

ALTER TABLE TblHistorial
ADD FOREIGN KEY (FkId_TblPersonas_TblUsuarios)
REFERENCES TblUsuarios(PkId_TblPersonas)

ALTER TABLE TblSucursales
ADD FOREIGN KEY (FkNit_TblEmpresa)
REFERENCES TblEmpresa(PkNit)

ALTER TABLE TblSucursales
ADD FOREIGN KEY (FkId_TblUbicacion)
REFERENCES TblUbicacion(PkId)

ALTER TABLE TblProductos
ADD FOREIGN KEY (FkId_TblEstado)
REFERENCES TblEstado(PkId)

ALTER TABLE TblProductos
ADD FOREIGN KEY (FkNit_TblSucursal)
REFERENCES TblSucursales(PkNit)

ALTER TABLE TblDet_TblFacturas
ADD FOREIGN KEY (FkCodigo_TblProductos)
REFERENCES TblProductos(PkCodigo)

ALTER TABLE TblFacturas
ADD FOREIGN KEY (FkId_TblPersonas)
REFERENCES TblPersonas(PkId)

ALTER TABLE TblFacturas
ADD FOREIGN KEY (FkId_TblPersonas_TblUsuarios )
REFERENCES TblUsuarios(PkId_TblPersonas)

ALTER TABLE TblFacturas
ADD FOREIGN KEY (FKId_TblTipoPago)
REFERENCES TblTipoPago(PkId)

ALTER TABLE TblHistorial
ADD FOREIGN KEY (FkId_TblPersonas_TblUsuarios )
REFERENCES TblUsuarios(PkId_TblPersonas)

--DATOS INSERTADOS EN LAS ENTIDADES FUERTES--

INSERT INTO TblSexo(PkId,Descripcion) VALUES ('1', 'Masculino')
INSERT INTO TblSexo(PkId,Descripcion) VALUES ('2', 'Feneminino')

INSERT INTO TblEstadoCivil(PkId, Descripcion) VALUES('1', 'Soltero(a)')
INSERT INTO TblEstadoCivil(PkId, Descripcion) VALUES('2', 'Casado(a)')
INSERT INTO TblEstadoCivil(PkId, Descripcion) VALUES('3', 'Unión libre')


INSERT INTO TblEstado(PkId, Descripcion) VALUES ('1', 'Disponible')
INSERT INTO TblEstado(PkId, Descripcion) VALUES ('2', 'No Disponible')
