USE DBHospital
GO


--TABLAS--

CREATE TABLE TblPersonas
(PkId varchar (20) primary key,
P_Nombre varchar (50) not null,
S_Nombre varchar (50),
P_Apellido varchar (50) not null,
S_Apellido varchar (50),
Telefono varchar (7),
Movil varchar (15) not null,
Direccion varchar (250) not null,
Correo varchar (200) not null,
FkId_TblTipoDocumento int not null,
FkId_TblSexo int not null,
FkId_TblRh int not null,
FkId_TblEstadoCivil int not null,
FkId_TblEps int not null,
FkNit_TblHospital varchar (15) not null)

CREATE TABLE TblTipoDocumento
(PkId int primary key identity (1,1),
Descripcion varchar (150) not null)

CREATE TABLE TblSexo
(PkId int primary key identity (1,1),
Descripcion varchar (80) not null)

CREATE TABLE TblRh
(PkId int primary key identity (1,1),
Descripcion varchar (3) not null)

CREATE TABLE TblEstadoCivil
(PkId int primary key identity (1,1),
Descripcion varchar (150) not null)

CREATE TABLE TblEps
(PkId int primary key identity (1,1),
Descripcion varchar (150) not null)

CREATE TABLE TblHospital
(PkNit varchar (15) primary key,
Nombre varchar (150) not null,
Direccion varchar (250) not null,
Telefono varchar (7) not null,
Coreo varchar (250) not null)

CREATE TABLE TblUsuarios
(PkId_TblPersonas varchar (15) primary key,
Contrasenia varchar (15) not null,
FkId_TblEstado int not null,
FkId_TblRol int not null)

CREATE TABLE TblEstado
(PkId int primary key identity (1,1),
Descripcion varchar (100) not null)

CREATE TABLE TblRol
(PkId int primary key,
Descripcion varchar (150) not null)

CREATE TABLE TblCitas
(PkN_Cita int primary key identity (1,1),
FkId_TblPersonas_TblUsuarios varchar (15) not null,
Fecha date not null,
Horad time not null,
HoraF time not null,
FkId_TblTipoCita int not null,
FkId_TblEstado int not null,
FkId_TblEspecialdad int not null,
Consultorio varchar (150))

CREATE TABLE  TblTipoCita
(PkId int primary key identity (1,1),
Descripcion varchar (150) not null,
Duracion time not null)

CREATE TABLE TblEspecialidad
(PkId int primary key,
Descripcion varchar (150) not null)

CREATE TABLE TblHistoriaClinica
(PkN_Historia int primary key identity (1,1),
FkId_TblPersonas varchar (20) not null,
Fecha date not null,
Hora time not null,
FkId_TblPersonas_TblUsuarios varchar (20) not null,
Observaciones varchar (250))

CREATE TABLE TblDet_TblHistoriaClinica
(PkId int primary key identity (1,1),
FkN_Historia_TblHistoriaClinica int not null,
FkN_Cita_TblCitas int not null,
Antecedentes varchar (250),
Medicamento varchar (250),
Enfermedades varchar (250),
Tratamientos varchar (250))

--LLAVES FORÄNEAS--
ALTER TABLE TblPersonas
ADD FOREIGN KEY (FkId_TblTipoDocumento)
REFERENCES TblTipoDocumento(PkId)