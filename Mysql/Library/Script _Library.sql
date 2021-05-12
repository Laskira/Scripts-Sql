CREATE DATABASE DBLibrary;

CREATE TABLE TblSucursales
(
   PKId int primary key auto_increment,
   Nombre varchar(200) not null,
   FechaCreacion timestamp default current_timestamp,
   FKId_TblEstado int not null,
   Direccion varchar(800) not null,
   Foto varchar(8000) not null

);



CREATE TABLE TblEstado
(
    PKId int primary key auto_increment,
    Descripcion varchar(200) not null
);

ALTER TABLE TblSucursales ADD INDEX (FKId_TblEstado);

ALTER TABLE TblSucursales ADD FOREIGN KEY (FKId_TblEstado) REFERENCES TblEstado(PKId);

CREATE TABLE TblPersonas
(
    PKId varchar(15) primary key,
    P_Nombre varchar(50) not null,
    S_Nombre varchar(50),
    P_Apellido varchar(50) not null,
    S_Apellido varchar(50),
    FKId_TblTipoDocumento int not null,
    FKId_TblSexo int not null,
    Correo varchar(200) not null,
    Movil varchar(11) not null,
    FechaNacimiento date not null, /*Para crear alertas en el sistema*/
    Direccion varchar (500) not null

);

CREATE TABLE TblTipoDocumento
(
    PKId int primary key auto_increment,
    Descripcion varchar(200) not null
);

ALTER TABLE TblPersonas ADD INDEX (FKId_TblTipoDocumento);

ALTER TABLE TblPersonas ADD FOREIGN KEY (FKId_TblTipoDocumento) REFERENCES TblTipoDocumento(PKId);

CREATE TABLE TblSexo
(
    PKId int primary key auto_increment,
    Descripcion varchar(200) not null
);

ALTER TABLE TblPersonas ADD INDEX (FKId_TblSexo);

ALTER TABLE TblPersonas ADD FOREIGN KEY (FKId_TblSexo) REFERENCES TblSexo(PKId);

CREATE TABLE TblUsuarios
(
    PKUsuario varchar(20) primary key,
    Contrasenia varchar(20) not null,
    FechaCreacion date not null DEFAULT CURRENT_DATE(),
    HoraCreacion time not null DEFAULT CURRENT_TIME()    

);

CREATE TABLE TblDet_TblPersonas_TblUsuarios
(
    PKId int primary key auto_increment,
    FKId_TblUsuarios varchar(20) not null,
    FKId_TblPersonas varchar(15) not null,
    FKId_TblRol int not null,
    FKId_TblEstado int not null,
    FechaCreacion date not null DEFAULT CURRENT_DATE(),
    HoraCreacion time not null DEFAULT CURRENT_TIME() 

);

ALTER TABLE TblDet_TblPersonas_TblUsuarios ADD INDEX (FKId_TblUsuarios);

ALTER TABLE TblDet_TblPersonas_TblUsuarios ADD FOREIGN KEY (FKId_TblUsuarios) REFERENCES TblUsuarios(PKUsuario);

ALTER TABLE TblDet_TblPersonas_TblUsuarios ADD INDEX (FKId_TblPersonas);

ALTER TABLE TblDet_TblPersonas_TblUsuarios ADD FOREIGN KEY (FKId_TblPersonas) REFERENCES TblPersonas(PKId);

CREATE TABLE TblRoles
(
    PKId int primary key auto_increment,
    Descripcion varchar(200) not null
);

ALTER TABLE TblDet_TblPersonas_TblUsuarios ADD INDEX (FKId_TblRol);

ALTER TABLE TblDet_TblPersonas_TblUsuarios ADD FOREIGN KEY (FKId_TblRol) REFERENCES TblRoles(PKId);

ALTER TABLE TblDet_TblPersonas_TblUsuarios ADD INDEX (FKId_TblEstado);

ALTER TABLE TblDet_TblPersonas_TblUsuarios ADD FOREIGN KEY (FKId_TblEstado) REFERENCES TblEstado(PKId);

CREATE TABLE TblContratos
(
  PkN_Contracto bigint auto_increment primary key,
  FKId_TblSucursal int not null,
  FKId_TblPersonas_Empleado varchar(15) not null,
  FKId_TblPersonas_Administrador varchar(15) not null,
  Fecha_Inicio date not null,
  Fecha_Fin date not null,
  Fecha_Creacion date not null default current_date,
  FKId_TblEstado int not null,
  Valor varchar (100) not null,
  Clausulas varchar (8000) not null /*Escaneada del constrato físico*/
);

ALTER TABLE TblContratos ADD INDEX (FKId_TblEstado);

ALTER TABLE TblContratos ADD FOREIGN KEY (FKId_TblEstado) REFERENCES TblEstado(PKId);

ALTER TABLE TblContratos ADD INDEX (FKId_TblSucursal);

ALTER TABLE TblContratos ADD FOREIGN KEY (FKId_TblSucursal) REFERENCES TblSucursales(PKId);

ALTER TABLE TblContratos ADD INDEX (FKId_TblPersonas_Empleado);

ALTER TABLE TblContratos ADD FOREIGN KEY (FKId_TblPersonas_Empleado) REFERENCES TblPersonas(PKId);

ALTER TABLE TblContratos ADD INDEX (FKId_TblPersonas_Administrador);

ALTER TABLE TblContratos ADD FOREIGN KEY (FKId_TblPersonas_Administrador) REFERENCES TblPersonas(PKId);


CREATE TABLE TblLibros
(
   PKId bigint primary key auto_increment,
   Referencia varchar(150) not null,
   Nombre varchar(500) not null,
   FKId_TblAutores bigint not null,
   FechaCreacion date default current_date not null,
   HoraCreacion time default current_time not null,
   FKId_TblPersonas varchar(15) not null, /*Quien ingresa el libro al sistema*/
   FKId_TblSucursales int not null,
   FKId_TblGeneros int not null,
   FKId_TblEstado int not null,
   FKId_TblTipoLibro int not null,
   CodigoBarras varchar(8000),
   ValorUnitario float not null,
   Stock int not null, /*Procedimiento*/
   StockMin int not null
);

ALTER TABLE TblLibros ADD INDEX (FKId_TblSucursales);

ALTER TABLE TblLibros ADD FOREIGN KEY (FKId_TblSucursales) REFERENCES TblSucursales(PKId);


ALTER TABLE TblLibros ADD INDEX (FKId_TblEstado);

ALTER TABLE TblLibros ADD FOREIGN KEY (FKId_TblEstado) REFERENCES TblEstado(PKId);

CREATE TABLE TblGeneros
(
    PKId int primary key auto_increment,
    Descripcion varchar(200) not null
);

ALTER TABLE TblLibros ADD INDEX (FKId_TblGeneros);

ALTER TABLE TblLibros ADD FOREIGN KEY (FKId_TblGeneros) REFERENCES TblGeneros(PKId);

CREATE TABLE TblTipoLibro
(
    PKId int primary key auto_increment,
    Descripcion varchar(150) not null
);

ALTER TABLE TblLibros ADD INDEX (FKId_TblTipoLibro );

ALTER TABLE TblLibros ADD FOREIGN KEY (FKId_TblTipoLibro ) REFERENCES TblTipoLibro(PKId);

CREATE TABLE TblAutores
(
   PKId bigint primary key auto_increment,
   P_Nombre varchar(50) not null,
   S_Nombre varchar(50),
   P_Apellido varchar(50) not null,
   S_Apellido varchar(50),
   Seudononimo varchar(300),
   FKId_TblSexo int not null,
   Biografia varchar(5000) not null,
   Foto varchar(8000)
);

ALTER TABLE TblAutores ADD INDEX (FKId_TblSexo);

ALTER TABLE TblAutores ADD FOREIGN KEY (FKId_TblSexo) REFERENCES TblSexo(PKId);

CREATE TABLE TblPrestamos
(
    PKId bigint primary key auto_increment,
    FKId_TblLibro bigint not null,
    FKId_TblPersonas_Prestamista varchar(15) not null,
    FKId_TblPersonas_Prestatario varchar(15) not null,
    FechaInicio date default current_date not null,
    HoraInicio time default current_time not null,
    FechaFin date not null,
    HoraFin time not null

);

ALTER TABLE TblPrestamos ADD INDEX (FKId_TblPersonas_Prestamista);

ALTER TABLE TblPrestamos ADD FOREIGN KEY (FKId_TblPersonas_Prestamista) REFERENCES TblPersonas(PKId);

ALTER TABLE TblPrestamos ADD INDEX (FKId_TblPersonas_Prestatario);

ALTER TABLE TblPrestamos ADD FOREIGN KEY (FKId_TblPersonas_Prestatario) REFERENCES TblPersonas(PKId);

ALTER TABLE TblPrestamos ADD INDEX (FKId_TblLibro);

ALTER TABLE TblPrestamos ADD FOREIGN KEY (FKId_TblLibro) REFERENCES TblLibros(PKId);


CREATE TABLE TblSanciones
(
    PKId bigint primary key auto_increment,
    Descripcion varchar(200) not null
);

CREATE TABLE TblDet_TblPersonas_TblSanciones
(
    PKId bigint primary key auto_increment,
    FKId_TblPersonas_Prestamista varchar(15) not null,
    FKId_TblPersonas_Prestatario varchar(15) not null,
    FKId_TblLibro bigint not null,
    FechaSancion date default current_date not null,
    HoraSancion time default current_time not null,
    InicioSancion date default current_date not null,
    FinSancion date default current_date not null,
    Observacionar varchar(3000)
    
);

ALTER TABLE TblDet_TblPersonas_TblSanciones ADD INDEX (FKId_TblPersonas_Prestamista);

ALTER TABLE TblDet_TblPersonas_TblSanciones ADD FOREIGN KEY (FKId_TblPersonas_Prestamista) REFERENCES TblPersonas(PKId);

ALTER TABLE TblDet_TblPersonas_TblSanciones ADD INDEX (FKId_TblPersonas_Prestatario);

ALTER TABLE TblDet_TblPersonas_TblSanciones ADD FOREIGN KEY (FKId_TblPersonas_Prestatario) REFERENCES TblPersonas(PKId);

ALTER TABLE TblDet_TblPersonas_TblSanciones ADD INDEX (FKId_TblLibro);

ALTER TABLE TblDet_TblPersonas_TblSanciones ADD FOREIGN KEY (FKId_TblLibro) REFERENCES TblLibros(PKId);



INSERT INTO TblSexo(Descripcion) VALUES ('Masculino');
INSERT INTO TblSexo(Descripcion) VALUES ('Femenino');
INSERT INTO TblSexo(Descripcion) VALUES ('Otro');

INSERT INTO TblRoles(Descripcion) VALUES ('Estudiante');
INSERT INTO TblRoles(Descripcion) VALUES ('Profesor');
INSERT INTO TblRoles(Descripcion) VALUES ('Particular');
INSERT INTO TblRoles(Descripcion) VALUES ('Empleado');
INSERT INTO TblRoles(Descripcion) VALUES ('Administrador');


INSERT INTO TblEstado(Descripcion) VALUES ('Activo');
INSERT INTO TblEstado(Descripcion) VALUES ('Inactivo');
INSERT INTO TblEstado(Descripcion) VALUES ('Disponible');
INSERT INTO TblEstado(Descripcion) VALUES ('No Disponible');
INSERT INTO TblEstado(Descripcion) VALUES ('Prestado');
INSERT INTO TblEstado(Descripcion) VALUES ('En Uso');
INSERT INTO TblEstado(Descripcion) VALUES ('No Usada');
INSERT INTO TblEstado(Descripcion) VALUES ('Inhabilitado');



INSERT INTO TblGeneros(Descripcion) VALUES ('Ciencia Ficción');
INSERT INTO TblGeneros(Descripcion) VALUES ('Fantasía');
INSERT INTO TblGeneros(Descripcion) VALUES ('Romance');
INSERT INTO TblGeneros(Descripcion) VALUES ('Historía');
INSERT INTO TblGeneros(Descripcion) VALUES ('Ficción General');
INSERT INTO TblGeneros(Descripcion) VALUES ('Comedia');
INSERT INTO TblGeneros(Descripcion) VALUES ('Realismo Mágico');


INSERT INTO `tblautores` (`PKId`, `P_Nombre`, `S_Nombre`, `P_Apellido`, `S_Apellido`, `Seudononimo`, `FKId_TblSexo`, `Biografia`, `Foto`) 
VALUES (NULL, 'Eric', 'Arthur', 'Blair', NULL, 'George Orwell', '1', 'Escritor y periodista británico, cuya obra lleva la marca de las experiencias personales vividas por el autor en tres etapas de su vida: su posición en contra del imperialismo británico que lo llevó al compromiso como representante de las fuerzas del orden colonial en Birmania durante su juventud; a favor del socialismo democrático, después de haber observado y sufrido las condiciones de vida de las clases sociales de los trabajadores de Londres y París; y en contra de los totalitarismos nazi y estalinista tras su participación en la guerra civil española. ', NULL);


INSERT INTO TblTipoDocumento(Descripcion) VALUES ('Cédula de ciudadania'); 
INSERT INTO TblTipoDocumento(Descripcion) VALUES ('Targeta de Identidad'); 
INSERT INTO TblTipoDocumento(Descripcion) VALUES ('Cédula de Extranjería');

INSERT INTO `tblpersonas` (`PKId`, `P_Nombre`, `S_Nombre`, `P_Apellido`, `S_Apellido`, `FKId_TblTipoDocumento`, `FKId_TblSexo`, `Correo`, `Movil`, `FechaNacimiento`, `Direccion`) 
VALUES ('1001022363', 'Yuli', 'Andrea', 'Goez', 'Zambrano', '1', '2', 'yagoez3@misena.edu', '3162427587', '2001-07-16', 'Barrio obrero');

INSERT INTO TblTipoLibro(Descripcion) VALUES ('Común'); 
INSERT INTO TblTipoLibro(Descripcion) VALUES ('Único');
INSERT INTO TblTipoLibro(Descripcion) VALUES ('De Importancia');
INSERT INTO TblTipoLibro(Descripcion) VALUES ('Raro'); 