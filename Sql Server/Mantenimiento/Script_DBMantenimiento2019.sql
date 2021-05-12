/*
Una empresa de soporte tecnico requiere el diseño de una base de datos 
para la gestión de los registros de los procedimientos ejecutados en la
infraestrutura tecnologica de dicha empresa, los registros coinciden
con las siguientes caracteristicas:
mentenimiento preventivo, correctivo y predictivo;
en el regristro se crea un caso el cual tenia asociados uno o mas equipos los cuales
ingresan por una averia particular, un técnico es asignando a para el 
registro del caso el cual debe asignar los perimetros  que atenderan 
los diferentes dispositivos de acuerdo a su especialidad, adicional a ello 
se debe llevar un registro detallado de cada acción realizada a los
equipos. 


*/

create database DBMantenimiento2019
go
use DBMantenimiento2019
go
create table TblEquipos
(	
	PKCodigo varchar(10) primary key,
	Caracteristicas varchar(8000) not null,
	FKId_TblEstado int not null,
	FKId_TblTipo int not null,
	Fecha date not null
)
create table TblEstado
(
	PKId int identity(0,1) primary key,
	Descripcion varchar(50) not null
)
insert into TblEstado(Descripcion) values ('En Funcionamiento'),('Mantenimiento'),('De Baja'),('Activo'),('Inactivo'),('Abierto'),('Cerrado')
create table TblTipo
(
	PKId int identity(0,1) primary key,
	Descripcion varchar(50) not null
)
insert into TblTipo(Descripcion) values ('PC Escritorio'),('PC Portatil'),('Impresora')
create table TblPersonas
(
	PKId varchar(11) primary key,
	P_Nombre varchar(50) not null,
	S_Nombre varchar(50) not null,
	P_Apellido varchar(50) not null,
	S_Apellido varchar(50) not null,
	Telefono varchar(10) not null,
	Correo varchar(100) not null
)
create table TblUsuarios
(
	PKUsuario varchar(100) primary key,
	Contrase�a varchar(11) not null,
	FKId_TblEstado int not null,
	FKId_TblRol int not null,
	Fecha date not null,
	FKId_TblPersonas varchar(11) not null
)
create table TblRol
(
	PKId int identity(0,1) primary key,
	Descripcion varchar(50) not null
)
insert into TblRol(Descripcion) values ('Administrador'),('Tecnico')
create table TblMantenimientos
(
	PKN_Registro bigint identity(1,1) primary key,
	FKCodigo_TblEquipos varchar(10) not null,
	Fecha date not null,
	FKUsuario_TblUsuarios varchar(100) not null,
	FKId_TblPersonas varchar(11) not null,
	Diagnostico varchar(8000) not null,
	Observaciones varchar(8000),
	FKId_TblEstado int not null,
	FKId_TblTipoMantenimiento int not null
)
create table TblTipoMantenimiento
(
	PKId int identity(0,1) primary key,
	Descripcion varchar(50) not null
)
insert into TblTipoMantenimiento(Descripcion) values ('Preventivo'),('Correctivo')
--relaciones tabla Equipos
alter table TblEquipos
add constraint FKId_TblEstado_Equipos
foreign key (FKId_TblEstado) references TblEstado
alter table TblEquipos
add constraint FKId_TblTipo
foreign key (FKId_TblTipo) references TblTipo
--relaciones tabla usuarios
alter table TblUsuarios
add constraint FKId_TblEstado_Usuarios
foreign key (FKId_TblEstado) references TblEstado
alter table TblUsuarios
add constraint FKId_TblRol
foreign key (FKId_TblRol) references TblRol
alter table TblUsuarios
add constraint FKId_TblPersonas_Persona
foreign key (FKId_TblPersonas) references TblPersonas
--relaciones tabla matenimientos
alter table TblMantenimientos
add constraint FKCodigo_TblEquipos
foreign key (FKCodigo_TblEquipos) references TblEquipos
alter table TblMantenimientos
add constraint FKUsuario_TblUsuarios
foreign key (FKUsuario_TblUsuarios) references TblUsuarios
alter table TblMantenimientos
add constraint FKId_TblPersonas_mantenimiento
foreign key (FKId_TblPersonas) references TblPersonas
alter table TblMantenimientos
add constraint FKId_TblEstado_mantenimiento
foreign key (FKId_TblEstado) references TblEstado
alter table TblMantenimientos
add constraint FKId_TblTipoMantenimiento
foreign key (FKId_TblTipoMantenimiento) references TblTipoMantenimiento