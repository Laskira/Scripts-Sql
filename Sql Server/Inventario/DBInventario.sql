CREATE DATABASE DBInventario
GO

USE DBInventario
GO

CREATE TABLE TblProductos
(PkCodigo varchar (10) primary key,
Nombre varchar (50) not null,
Caracteristicas varchar (8000) not null,
Precio varchar (5) not null,
Stock bigint not null,
FkId_TblEstado int not null
)

CREATE TABLE TblEstado
(PkId int identity(0,1) primary key,
Descripcion varchar (50) not null)

CREATE TABLE TblCompras
(PkN_Compra int identity(0,1) primary key,
FkCodigo_TblProductos varchar (10) not null,
Fecha date not null,
Hora time not null,
SubTotal varchar (9) not null,
Iva varchar (9) not null,
Total varchar (18) not null 
)

CREATE TABLE TblDet_TblCompras
(PkId bigint identity(0,1) primary key, 
FkCodigo_TblProductos varchar (10) not null,
Fecha date not null,
Hora time  not null,
ContidadProd bigint not null)

ALTER TABLE TblProductos
ADD CONSTRAINT FkId_TblEstado
FOREIGN KEY (FkId_TblEstado)
REFERENCES TblEstado

ALTER TABLE TblCompras
ADD CONSTRAINT FkCodigo_TblProductos
FOREIGN KEY (FkCodigo_TblProductos)
REFERENCES TblProductos

ALTER TABLE TblDet_TblCompras
ADD CONSTRAINT FkCodigo_TblProductos1
FOREIGN KEY (FkCodigo_TblProductos)
REFERENCES TblProductos


INSERT INTO TblEstado
(Descripcion)
VALUES
('Disponible'), ('No Disponible')



