

INSERT INTO TblSexo(PkId, Descripcion) VALUES ('', 'Masculino');
INSERT INTO TblSexo(PkId, Descripcion) VALUES ('', 'Femenino');

INSERT INTO TblTipoDocumento(PkId, Descripcion) VALUES ('', 'Cedúla')
INSERT INTO TblTipoDocumento(PkId, Descripcion) VALUES ('', 'Tarjeta de identidad');
INSERT INTO TblTipoDocumento(PkId, Descripcion) VALUES ('', 'Documento extranjero');

INSERT INTO TblRh(PkId, Descripcion) VALUES ('', 'A+');
INSERT INTO TblRh(PkId, Descripcion) VALUES ('', 'A-');
INSERT INTO TblRh(PkId, Descripcion) VALUES ('', 'O+');
INSERT INTO TblRh(PkId, Descripcion) VALUES ('', 'O-');

INSERT INTO TbEps(PkId, Descripcion) VALUES ('', 'Savia Salud');
INSERT INTO TblEps(PkId, Descripcion) VALUES ('', 'Sura');

INSERT INTO TblEstado(PkId, Descripcion) VALUES ('', 'Activo');
INSERT INTO TblEstado(PkId, Descripcion) VALUES ('', 'Inactivo');

INSERT INTO TblRol(PkId, Descripcion) VALUES ('', 'Administrador');
INSERT INTO TblRol(PkId, Descripcion) VALUES ('', 'Delegado');
INSERT INTO TblRol(PkId, Descripcion) VALUES ('', 'Jugador');
INSERT INTO TblRol(PkId, Descripcion) VALUES ('', 'Árbitro');

/*Organizador*/
INSERT INTO `tbl_personas` 
(`PkId`, `FkId_tbl_tipo_documento`, `P_Nombre`, `S_Nombre`, `P_Apellido`, `S_Apellido`, `FecNacimiento`, `FkId_tbl_sexo`, `FkId_tbl_rh`, `FkId_tbl_eps`, `FkId_TblEquipo`, `Movil`, `Correo`, `Foto`) 
VALUES ('9876545', '1', 'Jamir', NULL, 'Berrio', NULL, '1978-11-28', '2', '2', '1', NULL, '39076456', 'jamir@gmail.com', NULL);

INSERT INTO `tbl_usuarios` (`PkId_tbl_personas`, `Correo`, `Contrasenia`, `FkId_tbl_estado`, `FkId_tbl_rol`) 
VALUES ('9876545', 'jamir@gmail.com', '9876545', '1', '1');

/*TORNEOS*/

INSERT INTO `tbl_torneo` (`PkId`, `Nombre`, `FechaInicio`, `FechaFin`, `FecHora_Ini_Inscripcion`, `FecHora_Fin_Inscripcion`, `PrecioInscripcion`, `CantidadEquipos`, `FkId_tbl_estado`, `FkId_tbl_tipo_torneo`, `Premio`)
 VALUES 
(NULL, 'A.D.S', '2019-09-01 09:16:00', '2019-09-30 17:00:00', '2019-09-01 06:15:00', '2019-09-04 08:20:00', '25000', '4', '1', '1', 'UN VIAJE TODO PAGO A ARBOLETE');
/*2 TORNEO */
INSERT INTO `tbl_torneo` (`PkId`, `Nombre`, `FechaInicio`, `FechaFin`, `FecHora_Ini_Inscripcion`, `FecHora_Fin_Inscripcion`, `PrecioInscripcion`, `CantidadEquipos`, `FkId_tbl_estado`, `FkId_tbl_tipo_torneo`, `Premio`)
 VALUES 
(NULL, 'SISTEMAS', '2019-10-01 15:35:00', '2019-10-30 11:21:00', '2019-09-27 11:19:00', '2019-09-30 13:16:00', '40000', '3', '1', '1', '5000.0000.000 MILLONES');

/*Árbitro 1*/
INSERT INTO `tbl_personas` 
(`PkId`, `FkId_tbl_tipo_documento`, `P_Nombre`, `S_Nombre`, `P_Apellido`, `S_Apellido`, `FecNacimiento`, `FkId_tbl_sexo`, `FkId_tbl_rh`, `FkId_tbl_eps`, `FkId_TblEquipo`, `Movil`, `Correo`, `Foto`) 
VALUES ('555555', '1', 'Carlos', NULL, 'Lopez', NULL, '2000-10-28', '2', '7', '2', NULL, '31234567000', 'carlos@gmail.com', NULL);

INSERT INTO `tbl_usuarios` (`PkId_tbl_personas`, `Correo`, `Contrasenia`, `FkId_tbl_estado`, `FkId_tbl_rol`) 
VALUES ('555555', 'andres@gmail.com', '555555', '1', '4');

/*Árbitro 2*/
INSERT INTO `tbl_personas` 
(`PkId`, `FkId_tbl_tipo_documento`, `P_Nombre`, `S_Nombre`, `P_Apellido`, `S_Apellido`, `FecNacimiento`, `FkId_tbl_sexo`, `FkId_tbl_rh`, `FkId_tbl_eps`, `FkId_TblEquipo`, `Movil`, `Correo`, `Foto`) 
VALUES ('98567860', '1', 'Samuel', NULL, 'Diaz', NULL, '1079-04-18', '2', '2', '1', NULL, '3070987678', 'felipe@gmail.com', NULL);

INSERT INTO `tbl_usuarios` (`PkId_tbl_personas`, `Correo`, `Contrasenia`, `FkId_tbl_estado`, `FkId_tbl_rol`) 
VALUES ('98567860', 'felipe@gmail.com', '98567860', '1', '4');

/*Delegado 1 (técnico)*/
INSERT INTO `tbl_personas` 
(`PkId`, `FkId_tbl_tipo_documento`, `P_Nombre`, `S_Nombre`, `P_Apellido`, `S_Apellido`, `FecNacimiento`, `FkId_tbl_sexo`, `FkId_tbl_rh`, `FkId_tbl_eps`, `FkId_TblEquipo`, `Movil`, `Correo`, `Foto`) 
VALUES ('1001022363', '2', 'Yuli', NULL, 'Goez', NULL, '2002-04-28', '1', '3', '1', NULL, '3218787989', 'yuli@gmail.com', NULL);

INSERT INTO `tbl_usuarios` (`PkId_tbl_personas`, `Correo`, `Contrasenia`, `FkId_tbl_estado`, `FkId_tbl_rol`) 
VALUES ('1001022363', 'yuli@gmail.com', '1001022363', '1', '2');


/*Delegado 2 (técnico)*/
INSERT INTO `tbl_personas` 
(`PkId`, `FkId_tbl_tipo_documento`, `P_Nombre`, `S_Nombre`, `P_Apellido`, `S_Apellido`, `FecNacimiento`, `FkId_tbl_sexo`, `FkId_tbl_rh`, `FkId_tbl_eps`, `FkId_TblEquipo`, `Movil`, `Correo`, `Foto`) 
VALUES ('1578675578', '1', 'Andres', NULL, 'Arias', NULL, '1089-04-08', '2', '4', '2', NULL, '3249008775', 'andres@gmail.com', NULL);

INSERT INTO `tbl_usuarios` (`PkId_tbl_personas`, `Correo`, `Contrasenia`, `FkId_tbl_estado`, `FkId_tbl_rol`) 
VALUES ('1578675578', 'andres@gmail.com', '1578675578', '1', '2');

/*EQUIPOS*/
/*Equipo 1*/
INSERT INTO `tbl_equipos` (`PkId`, `Nombre`, `FkId_tbl_personas_delegado`, `N_Integrantes`, `FkId_tbl_estado`, `Observaciones`) 
VALUES (NULL, 'Águilas', '1001022363', '11', '1', NULL);

/*inscripcion de un equipo en un torneo*/

INSERT INTO `tbl_inscripcion` (`PkId`, `FechaHora`, `FkId_tbl_personas_delegado`, `FkId_tbl_torneo`, `FkId_tbl_equipos`, `PrecioPagado`) 
VALUES (NULL, current_timestamp(), '1001022363', '0', '0', '25.000');

/*Equipo 2*/
INSERT INTO `tbl_equipos` (`PkId`, `Nombre`, `FkId_tbl_personas_delegado`, `N_Integrantes`, `FkId_tbl_estado`, `Observaciones`) 
VALUES (NULL, 'Leones', '1578675578', '11', '1', NULL);

/*inscripcion de un equipo en un torneo*/
INSERT INTO `tbl_inscripcion` (`PkId`, `FechaHora`, `FkId_tbl_personas_delegado`, `FkId_tbl_torneo`, `FkId_tbl_equipos`, `PrecioPagado`) 
VALUES (NULL, current_timestamp(), '1578675578', '0', '1', '25.000');

/*JUGADORES*/
/*Jugador 1*/
INSERT INTO `tbl_personas` 
(`PkId`, `FkId_tbl_tipo_documento`, `P_Nombre`, `S_Nombre`, `P_Apellido`, `S_Apellido`, `FecNacimiento`, `FkId_tbl_sexo`, `FkId_tbl_rh`, `FkId_tbl_eps`, `FkId_TblEquipo`, `Movil`, `Correo`, `Foto`) 
VALUES ('100001', '1', 'Camilo', 'Andres', 'Zambrano', NULL, '2000-12-18', '2', '3', '1', '0', '3076680011', 'camilo@gmail.com', NULL);

INSERT INTO `tbl_usuarios` (`PkId_tbl_personas`, `Correo`, `Contrasenia`, `FkId_tbl_estado`, `FkId_tbl_rol`) 
VALUES ('100001', 'camilo@gmail.com', '100001', '1', '3');


/*Jugador 2*/
INSERT INTO `tbl_personas` 
(`PkId`, `FkId_tbl_tipo_documento`, `P_Nombre`, `S_Nombre`, `P_Apellido`, `S_Apellido`, `FecNacimiento`, `FkId_tbl_sexo`, `FkId_tbl_rh`, `FkId_tbl_eps`, `FkId_TblEquipo`, `Movil`, `Correo`, `Foto`) 
VALUES ('222222', '1', 'Maicol', NULL, 'Soto', NULL, '2001-07-09', '2', '2', '1', '1', '35776546678', 'maicol@gmail.com', NULL);

INSERT INTO `tbl_usuarios` (`PkId_tbl_personas`, `Correo`, `Contrasenia`, `FkId_tbl_estado`, `FkId_tbl_rol`) 
VALUES ('222222', 'maicol@gmail.com', '222222', '1', '3');


/*AGREGAR DELEGADO A EQUIPO*/
UPDATE `tbl_personas` SET `FkId_TblEquipo` = '0' WHERE `tbl_personas`.`PkId` = '1001022363';

UPDATE `tbl_personas` SET `FkId_TblEquipo` = '1' WHERE `tbl_personas`.`PkId` = '1578675578';

/*partido*/
INSERT INTO `tbl_partidos` (`PkId`, `FechaHora_Inicio`, `FechaHora_Fin`, `FkId_tbl_equipo_visitante`, `N_GolesVisitante`, `FkId_tbl_equipo_local`, `N_GolesLocal`, `FkId_tbl_torneo`, `EquipoGanador`, `EquipoPerdedor`) 
VALUES ('0', '2019-09-13 04:10:00', '2019-09-13 07:00:00', '0', '', '1', '', '0', NULL, NULL);

/*GOL HECHO POR UN JUGADOR*/
/*Gol Local 1*/
INSERT INTO `tbl_gol` (`PkId`, `FkId_tbl_personas_jugador`, `FkId_tbl_equipos`, `FkId_tbl_tipo_gol`, `FkId_tbl_partido`, `Observaciones`) 
VALUES (NULL, '222222', '1', '1', '0', NULL);

/*Gol visitante 1*/
INSERT INTO `tbl_gol` (`PkId`, `FkId_tbl_personas_jugador`, `FkId_tbl_equipos`, `FkId_tbl_tipo_gol`, `FkId_tbl_partido`, `Observaciones`) 
VALUES (NULL, '100001', '0', '5', '0', NULL);

/*Gol visitante 2*/
INSERT INTO `tbl_gol` (`PkId`, `FkId_tbl_personas_jugador`, `FkId_tbl_equipos`, `FkId_tbl_tipo_gol`, `FkId_tbl_partido`, `Observaciones`) 
VALUES (NULL, '100001', '0', '5', '0', NULL);
