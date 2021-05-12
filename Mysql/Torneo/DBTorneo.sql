CREATE DATABASE DBTorneos;

USE DBTorneos;

CREATE TABLE TblPersonas
(PkId varchar (15) primary key, 
FkId_TblTipoDocumento int not null,
P_Nombre varchar (100) not null, 
S_Nombre varchar (100),
P_Apellido varchar (100) not null,
S_Apellido varchar (100),
FecNacimiento date not null,
FkId_TblSexo int not null,
FkId_TblRh int not null,
FkId_TblEps int not null,
CertificadoEps VARCHAR (8000), /*Preguntar por esto*/
Movil varchar (15),
Correo varchar (150) NOT NULL,
IdCreador varchar (15),
Foto varchar(8000));
/*Se pone varchar para guardar la imagen en el servidor y poner en la base de datos la ruta en 
que se encuentra para invocarla*/

CREATE TABLE TblTipoDocumento
(PkId int primary key auto_increment,
Descripcion varchar (100) not null);

CREATE TABLE TblSexo
(PkId int primary key auto_increment,
Descripcion varchar (100) not null);

CREATE TABLE TblRh
(PkId int primary key auto_increment,
Descripcion varchar (100) not null);

CREATE TABLE TblEps
(PkId int primary key auto_increment,
Descripcion varchar (100) not null);

CREATE TABLE TblUsuarios
(PkId_TblPersonas VARCHAR (15) primary key,
Contrasenia varchar (25),
FkId_TblEstado int not null,
FkId_TblRol int not null,
FechaRegistro TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL); /*Pregunta por esto*/

CREATE TABLE TblEstado
(PkId int primary key auto_increment,
Descripcion varchar (100) not null);

CREATE TABLE TblRol
(PkId int primary key auto_increment,
Descripcion varchar (100) not null);

CREATE TABLE TblDisciplina
(PkId int primary key auto_increment,
Descripcion VARCHAR(150) NOT NULL,
FkId_TblTipoDisciplina int NOT NULL);

CREATE TABLE TblTipoDisciplina
(PkId int primary key auto_increment,
Descripcion varchar (100) not null);

CREATE TABLE TblEquipos
(PkId int primary key auto_increment,
Nombre varchar (150) not null,
FkId_TblPersonas_Delegado varchar (15),
FkId_TblDisciplina int not null,
N_Integrantes int not null,
FkId_TblEstado int not null,
FechaCreacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
Observaciones varchar (150)); 

CREATE TABLE TblDet_TblPersonas_TblEquipos
(PkId int primary key auto_increment,
FkId_TblEquipo int not null, /*por medio del equipo se sabe la disciplina*/
FkId_TblPersonas_Jugador VARCHAR(15) NOT NULL,
FkId_TblTorneo int not null,
FkId_TblPosición int not null,
FechaAgregadoEquipo TIMESTAMP DEFAULT CURRENT_TIMESTAMP not null);
/*FALTAN ESTA FORANEAS*/

CREATE TABLE TblPunto
(PkId int primary key auto_increment,
FkId_TblPersonas_Jugador varchar (15) NOT NULL,
FkId_TblEquipos int not null,
FkId_TblTipoGol int not null,
FkId_TblPartido int not null,
FechaHoraGol TIMESTAMP /*DEFAULT CURRENT_TIMESTAMP*/ NOT NULL,
Observaciones varchar (150));

CREATE TABLE TblTipoPunto
(PkId int primary key auto_increment,
Descripcion varchar (100) not null);

CREATE TABLE TblPartidos
(PkId int primary key auto_increment,
FechaHora_Inicio TIMESTAMP not null,
FechaHora_Fin TIMESTAMP not null,
FkId_TblEquipo_Visitante int not null,
N_PuntosVisitante int not null,
FkId_TblEquipo_Local int not null,
N_PuntosLocal int not null,
FkId_TblDet_Personas_Partidos int not null,
FkId_TblTorneo int not null,
EquipoGanador varchar (150),
EquipoPerdedor varchar (150));

CREATE TABLE TblTorneo
(PkId int primary key auto_increment,
FkId_TblPersonas_Administrador varchar (15) not null,
Nombre varchar (150) not null,
FechaInicio TIMESTAMP not null,
FechaFin TIMESTAMP not null,
FecHora_Ini_Inscripcion TIMESTAMP not null,
FecHora_Fin_Inscripcion TIMESTAMP not null,
PrecioInscripcion double,
CantidadEquipos int not null,
FkId_TblEstado int not null,
FkId_TblTipoTorneo int not null,
FkId_TblDisciplina int NOT NULL,
FkId_TblPremios int,
FechaCreacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP not null);

CREATE TABLE TblTipoTorneo
(PkId int primary key auto_increment,
Descripcion varchar (100) not null);

CREATE TABLE TblDet_Personas_Partidos
(PkId int primary key auto_increment,
FkId_TblPartido int not null,
FkId_TblPersonas_Arbitro varchar (15) not null,
FechaAsignacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP not null,
Observaciones varchar (150));

CREATE TABLE TblInscripcion
(PkId int primary key auto_increment,
FechaHora TIMESTAMP DEFAULT CURRENT_TIMESTAMP not null,
FkId_TblPersonas_Delegado varchar (15) not null,
FkId_TblTorneo int not null,
FkId_TblEquipos int not null,
FkId_TblTipoPago INT NOT NULL,
CodigoConfirmacionPago VARCHAR (15) NOT NULL,
PrecioPagado double);

CREATE TABLE TblPremio
(PkId int primary key auto_increment,
FkId_TblTorneo INT not null,
Premio VARCHAR (1500) not null,
FechaEntrega TIMESTAMP DEFAULT CURRENT_TIMESTAMP not null);

CREATE TABLE TblDet_Equipo_Premio
(PkId int primary key auto_increment,
FkId_TblEquipo INT not null, 
FkId_TblPremio int not null,
FechaEntrega TIMESTAMP);

CREATE TABLE TblDet_Jugador_Premio
(PkId int primary key auto_increment,
FkId_TblPersonas_Jugador varchar (15) not null, /*aca va el fk del detalle con que uno a la persona el equipo y torneo*/
FkId_TblPremio int not null,
FechaEntrega TIMESTAMP);

CREATE TABLE TblSanciones
(PkId int primary key auto_increment,
FkId_TblTipoSancion int not null,
FechaHora TIMESTAMP not null,
FkId_TblPartido int not null,
FkId_TblPersonas_Jugador varchar (15) not null,
FkId_TblPersonas_Arbitro varchar (15) not null,
FkId_TblEstado int not null,
Observaciones varchar (150));

CREATE TABLE TblTipoSancion
(PkId int primary key auto_increment,
Descripcion varchar (100) not null);


CREATE TABLE TblPuntuacion
(PkId int primary key auto_increment,
FkId_TblEquipo int not null,
FkId_TblTorneo int not null,
N_Goles int not null,
GolesFavor int not null,
GolesEnContra int not null,
Puntos_JuegoLimpio int not null, 
N_PartidosJugados int not null);



/*LLAVES FORÁNEAS*/
/*fk personas con tipo documento*/
ALTER TABLE TblPersonas ADD INDEX (FkId_TblTipoDocumento);

ALTER TABLE TblPersonas ADD FOREIGN KEY (FkId_TblTipoDocumento)
REFERENCES TblTipoDocumento(PkId);

/*fk personas con sexo*/
ALTER TABLE TblPersonas ADD INDEX (FkId_TblSexo);

ALTER TABLE TblPersonas ADD FOREIGN KEY (FkId_TblSexo)
REFERENCES TblSexo(PkId);

/*fk personas con rh*/
ALTER TABLE TblPersonas ADD INDEX (FkId_TblRh);

ALTER TABLE TblPersonas ADD FOREIGN KEY (FkId_TblRh)
REFERENCES TblRh(PkId);

/*fk personas con eps*/
ALTER TABLE TblPersonas ADD INDEX (FkId_TblEps);

ALTER TABLE  TblPersonas ADD FOREIGN KEY (FkId_TblEps)
REFERENCES TblEps(PkId);

/*fk usuarios con personas, para que el id de la persona sea igual al usuario*/
ALTER TABLE TblUsuarios ADD INDEX (PkId_TblPersonas);

ALTER TABLE TblUsuarios ADD FOREIGN KEY (PkId_TblPersonas) REFERENCES TblPersonas(PkId)

/*fk usuarios con estado*/
ALTER TABLE TblUsuarios ADD INDEX (FkId_TblEstado);

ALTER TABLE TblUsuarios ADD FOREIGN KEY (FkId_TblEstado)
REFERENCES TblEstado(PkId);

/*fk usuario con rol*/

ALTER TABLE TblPersonas ADD INDEX
(FkId_TblRol);

ALTER TABLE TblUsuarios ADD FOREIGN KEY (FkId_TblRol)
REFERENCES TblRol(PkId);

/*fk disciplina con tipo de disciplian (individual o en equipos)*/
ALTER TABLE TblDisciplina ADD INDEX
(FkId_TblTipoDisciplina);

ALTER TABLE TblDisciplina ADD FOREIGN KEY (FkId_TblTipoDisciplina)
REFERENCES TblTipoDisciplina(PkId);


/*fk equipos con estado*/
ALTER TABLE TblEquipos ADD INDEX
(FkId_TblEstado);

ALTER TABLE TblEquipos ADD FOREIGN KEY (FkId_TblEstado)
REFERENCES TblEstado(PkId);

/*fk equipos con delegado (técnico)*/
ALTER TABLE TblEquipos ADD INDEX
(FkId_TblPersonas_Delegado);

ALTER TABLE TblEquipos ADD FOREIGN KEY (FkId_TblPersonas_Delegado)
REFERENCES TblPersonas(PkId); 

/*fk del gol con el jugador que lo hizo*/
ALTER TABLE TblGol ADD INDEX
(FkId_TblPersonas_Jugador);

ALTER TABLE TblGol ADD FOREIGN KEY (FkId_TblPersonas_Jugador)
REFERENCES TblPersonas(PkId);

/*fk de gol con la persona que los anota (es decir, lo ingresa al sistema)*/
ALTER TABLE TblGol ADD INDEX
(FkId_TblPersonas_Planillero);

ALTER TABLE TblGol ADD FOREIGN KEY (FkId_TblPersonas_Planillero)
REFERENCES TblPersonas(PkId); 

/*fk tipo de gol, que cambiara por tipo de punto*/
ALTER TABLE TblGol ADD INDEX
(FkId_TblTipoGol);

ALTER TABLE TblGol ADD FOREIGN KEY (FkId_TblTipoGol)
REFERENCES TblTipoGol(PkId); 

/*fk de partido con equipo visitante*/
ALTER TABLE TblPartidos ADD INDEX
(FkId_TblEquipo_Visitante);

ALTER TABLE TblPartidos ADD FOREIGN KEY (FkId_TblEquipo_Visitante)
REFERENCES TblEquipos(PkId);

/*fk de partido con equipo local*/
ALTER TABLE TblPartidos ADD INDEX
(FkId_TblEquipo_Local);

ALTER TABLE TblPartidos ADD FOREIGN KEY (FkId_TblEquipo_Local)
REFERENCES TblEquipos(PkId);

/*fk del torneo con id del administrador*/
ALTER TABLE TblTorneo ADD INDEX
(FkId_TblPersonas_Administrador);

ALTER TABLE TblTorneo ADD FOREIGN KEY (FkId_TblPersonas_Administrador)
REFERENCES TblPersonas(PkId);

/*fk estado del torneo*/
ALTER TABLE TblTorneo ADD INDEX
(FkId_TblEstado);

ALTER TABLE TblTorneo ADD FOREIGN KEY (FkId_TblEstado)
REFERENCES TblEstado(PkId);

/*fk del torneo con el tipo del torneo*/
ALTER TABLE TblTorneo ADD INDEX
(FkId_TblTipoTorneo);

ALTER TABLE TblTorneo ADD FOREIGN KEY (FkId_TblTipoTorneo)
REFERENCES TblTipoTorneo(PkId); 

/*fk inscripcion con el delegado*/
ALTER TABLE TblInscripcion ADD INDEX
(FkId_TblPersonas_Delegado);

ALTER TABLE TblInscripcion ADD FOREIGN KEY (FkId_TblPersonas_Delegado)
REFERENCES TblPersonas(PkId);

/*fk de la inscripcion con el torneo*/
ALTER TABLE TblInscripcion ADD INDEX
(FkId_TblTorneo);

ALTER TABLE TblInscripcion ADD FOREIGN KEY (FkId_TblTorneo)
REFERENCES TblTorneo(PkId);

 /*fk inscripcion del equipo*/
ALTER TABLE TblInscripcion ADD INDEX
(FkId_TblEquipos);

ALTER TABLE TblInscripcion ADD FOREIGN KEY (FkId_TblEquipos)
REFERENCES TblEquipos(PkId);

/*fk para asignar al jugador un premio por medio de una tabla detalles*/
ALTER TABLE TblDet_Jugador_Premio ADD INDEX
(FkId_TblPersonas_Jugador);

ALTER TABLE TblDet_Jugador_Premio ADD FOREIGN KEY (FkId_TblPersonas_Jugador)
REFERENCES Tbl_personas(PkId);

/*fk del detalle para asignar el partido*/
ALTER TABLE TblDet_Personas_Partidos ADD INDEX
(FkId_TblPartido);

ALTER TABLE TblDet_Personas_Partidos ADD FOREIGN KEY (FkId_TblPartido)
REFERENCES TblPartidos(PkId);

/*fk detalle para agregar varios arbitros a un partido, id del árbitro*/
ALTER TABLE TblDet_Personas_Partidos ADD INDEX
(FkId_TblPersonas_Arbitro);

ALTER TABLE TblDet_Personas_Partidos ADD FOREIGN KEY (FkId_TblPersonas_Arbitro)
REFERENCES TblPersonas(PkId);

/*fk sancion con tipo de sancion*/
ALTER TABLE TblSanciones ADD INDEX
(FkId_TblTipoSancion);

ALTER TABLE TblSanciones ADD FOREIGN KEY (FkId_TblTipoSancion)
REFERENCES TblTipoSancion(PkId);
/*fk sancion con fk del partido en que dicha tiene lugar*/
ALTER TABLE TblSanciones ADD INDEX
(FkId_TblPartido);

ALTER TABLE TblSanciones ADD FOREIGN KEY (FkId_TblPartido)
REFERENCES TblPartidos(PkId);

/*fk sanción con fk del jugador al que se le hace la sanción*/
ALTER TABLE TblSanciones ADD INDEX
(FkId_TblPersonas_Jugador);

ALTER TABLE TblSanciones ADD FOREIGN KEY (FkId_TblPersonas_Jugador)
REFERENCES TblPersonas(PkId);

/*fk sancion con fk del arbitro que asigna la sanción*/
ALTER TABLE TblSanciones ADD INDEX
(FkId_TblPersonas_Arbitro);

ALTER TABLE TblSanciones ADD FOREIGN KEY (FkId_TblPersonas_Arbitro)
REFERENCES TblPersonas(PkId);

/*fk puntuación con equipos*/
ALTER TABLE TblPuntuacion ADD INDEX (FkId_TblEquipo);

ALTER TABLE TblPuntuacion ADD FOREIGN KEY (FkId_TblEquipo)
REFERENCES TblEquipos(PkId);

/*fk puntuacion con torneo*/
ALTER TABLE TblPuntuacion ADD INDEX (FkId_TblTorneo);

ALTER TABLE TblPuntuacion ADD FOREIGN KEY (FkId_TblTorneo)
REFERENCES TblTorneo(PkId);
