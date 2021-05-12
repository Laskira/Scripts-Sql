/*
Diseñar una base de datos que permita la gestión de un taller automotriz, que ofrece los siguientes servicios, platoneria, pintura, mecanica, mentenimiento preventivo y correctivo de sistemas de freno, cambio de aceite; el taller cuenta con varios empleados, los cuales tienen los siguientes cargos: jefe de taller, mecanico, pintor, platonero; los servicios se facturan a la placa asociada del vehiculo teniendo en cuenta que un vehiculo puede llevar varios servicios, y generar una unica factura.

*/

USE DBSoporte
GO

CREATE TABLE TblTecnicos
(PKId int  identity (1,1) primary key,
NombreCompleto varchar (150),
Telefono varchar(15), 
Correo varchar (150),
FKId_TblEspecialidad int)

CREATE TABLE TblEspecialidad
(PKId int identity (1,1) primary key,
Descripcion varchar (80))

CREATE TABLE TblUsuarios
(PKId_TblTecnicos int identity (1,1)primary key,
Contrasenia varchar (15),
FKid_TblRol int,
FKId_TblEstado int)

CREATE TABLE TblRol
(PKId int identity (1,1) primary key,
Descripcion varchar (100))

CREATE TABLE TblEstado
(PKId  int identity (1,1) primary key,
Descripcion varchar (80))

CREATE TABLE TblEquipos
(PKSerial varchar (20) primary key,
Caracteristicas varchar (150)
)


CREATE TABLE TblCasos
(PKNo_Caso int identity (1,1) primary key,
FKId_TblTecnicos_TblUsuarios int,
FKId_TblEstado int,
Fecha_Creacion date,
Hora_Creacion time,
Fecha_Cierre date,
Hora_Cierre time,
Comentarios varchar (1000))

CREATE TABLE TblTipoMto
(PKId int identity (1,1) primary key,
Descripcion varchar (100))

CREATE TABLE TblDet_TblCasos
(PKId int identity (1,1) primary key,
FKNo_caso_TblCaso int,
FKSerial_TblEquipos varchar (20),
Observaciones varchar (300),
FKId_TblTecnicos_TblUsuarios int,
FKId_TblEstado int,
Fecha_Cierre date,
Hora_Cierre time, 
FKId_TblTipoMto int)

------------------------Llaves foraneas--------------------------- 
ALTER TABLE  TblTecnicos
ADD FOREIGN KEY (FKId_TblEspecialidad)
REFERENCES TblEspecialidad(PKId) 


ALTER TABLE  TblUsuarios
ADD FOREIGN KEY (PKId_TblTecnicos)
REFERENCES TblTecnicos(PKId)

ALTER TABLE TblCasos
ADD FOREIGN KEY (FKId_TblTecnicos_TblUsuarios) 
REFERENCES TblUsuarios(PKId_TblTecnicos)

ALTER TABLE TblDet_TblCasos
ADD FOREIGN KEY (FKId_TblTecnicos_TblUsuarios) 
REFERENCES TblUsuarios(PKId_TblTecnicos)

ALTER TABLE TblUsuarios
ADD FOREIGN KEY (FKId_TblRol) 
REFERENCES TblRol(PKId)

ALTER TABLE TblUsuarios
ADD FOREIGN KEY (FKId_TblEstado) 
REFERENCES TblEstado(PKId)

ALTER TABLE TblCasos
ADD FOREIGN KEY (FKId_TblEstado) 
REFERENCES TblEstado(PKId)

ALTER TABLE TblDet_TblCasos
ADD FOREIGN KEY (FKNo_caso_TblCaso) 
REFERENCES TblCasos(PKNo_Caso)

ALTER TABLE TblDet_TblCasos
ADD CONSTRAINT FKSerial_TblEquipos
FOREIGN KEY (FKSerial_TblEquipos) 
REFERENCES TblEquipos
