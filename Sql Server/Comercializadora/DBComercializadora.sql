USE DBComercializadora
GO
  --Creacion de tablas--

create table TblProductos
 (
 PkCodigo varchar (20) primary key, 
 Nombre varchar (8000),
 Valor_unitario money, 
 Stock int not null,	
 FKId_TblCategoria int  not null,
 FKId_TblEstado int not null
 )

 create table TblCategoria
 (
PKId int identity (1,1) primary key,
Descripcion varchar (200) not null
)

create table TblEstado 
(
PKId int identity (1,1) primary key,
Descripcion varchar (200) not null
)

create table TblClientes
(
PKId varchar (11) primary key, 
Nombre varchar (100) not null,
Telefono varchar (11)  not null, 
Direccion varchar (100),
Correo varchar (200),
FKNit_TblTipo_Cliente varchar (20) not null
)

create table TblTipo_Cliente
(
PKNit int identity (1,1) primary key, 
Descripcion varchar (200) not null
)

create table  TblFacturas
(
PKN_Factura int identity (1,1) primary key,
FKNit_TblClientes varchar (100) not null,
Fecha date not null, 
Hora time not null, 
Subtotal money, 
IVA money, 
Total money,
FKId_TblTipoPago int not null 
)

create table TblTipoPago
(
PKId int identity (1,1) primary key,
Descripcion varchar (200) not null
)


 create table TblDet_TblFacturas
(
PKId int identity (1,1) primary key,
FKN_Factura_TblFacturas int not null,
FKCodigo_TblProductos varchar (20) not null, 
Valor_Unitario money, 
Iva_aplicado money,
Subtotal money, 
Cantidad int,
Total money, 
Porc_Iva float
)

