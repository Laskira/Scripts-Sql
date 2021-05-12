-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-09-2019 a las 14:15:16
-- Versión del servidor: 10.3.16-MariaDB
-- Versión de PHP: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dbproyectosena`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbldet_jugador_premio`
--

CREATE TABLE `tbldet_jugador_premio` (
  `PkId` int(11) NOT NULL,
  `FkId_TblPersonas_Jugador` varchar(15) COLLATE utf8_spanish2_ci NOT NULL,
  `Premio` varchar(150) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbldet_personas_partidos`
--

CREATE TABLE `tbldet_personas_partidos` (
  `PkId` int(11) NOT NULL,
  `FkId_TblPartido` int(11) NOT NULL,
  `FkId_TblPersonas_Arbitro` varchar(15) COLLATE utf8_spanish2_ci NOT NULL,
  `Observaciones` varchar(150) COLLATE utf8_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbleps`
--

CREATE TABLE `tbleps` (
  `PkId` int(11) NOT NULL,
  `Descripcion` varchar(100) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `tbleps`
--

INSERT INTO `tbleps` (`PkId`, `Descripcion`) VALUES
(1, 'Savia Salud'),
(2, 'Sura');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblequipos`
--

CREATE TABLE `tblequipos` (
  `PkId` int(11) NOT NULL,
  `Nombre` varchar(150) COLLATE utf8_spanish2_ci NOT NULL,
  `FkId_TblPersonas_Delegado` varchar(15) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `N_Integrantes` int(11) NOT NULL,
  `FkId_TblEstado` int(11) NOT NULL,
  `Observaciones` varchar(150) COLLATE utf8_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblestado`
--

CREATE TABLE `tblestado` (
  `PkId` int(11) NOT NULL,
  `Descripcion` varchar(100) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `tblestado`
--

INSERT INTO `tblestado` (`PkId`, `Descripcion`) VALUES
(1, 'ACTIVO'),
(2, 'INACTIVO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblgol`
--

CREATE TABLE `tblgol` (
  `PkId` int(11) NOT NULL,
  `FkId_TblPersonas_Jugador` varchar(15) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `FkId_TblEquipos` int(11) NOT NULL,
  `FkId_TblTipoGol` int(11) NOT NULL,
  `FkId_TblPartido` int(11) NOT NULL,
  `Observaciones` varchar(150) COLLATE utf8_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblinscripcion`
--

CREATE TABLE `tblinscripcion` (
  `PkId` int(11) NOT NULL,
  `FechaHora` datetime NOT NULL,
  `FkId_TblPersonas_Delegado` varchar(15) COLLATE utf8_spanish2_ci NOT NULL,
  `FkId_TblTorneo` int(11) NOT NULL,
  `FkId_TblEquipos` int(11) NOT NULL,
  `PrecioPagado` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblpartidos`
--

CREATE TABLE `tblpartidos` (
  `PkId` int(11) NOT NULL,
  `FechaHora_Inicio` datetime NOT NULL,
  `FechaHora_Fin` datetime NOT NULL,
  `FkId_TblEquipo_Visitante` int(11) NOT NULL,
  `N_GolesVisitante` int(11) NOT NULL,
  `FkId_TblEquipo_Local` int(11) NOT NULL,
  `N_GolesLocal` int(11) NOT NULL,
  `FkId_TblDet_Personas_Partidos` int(11) NOT NULL,
  `FkId_TblTorneo` int(11) NOT NULL,
  `EquipoGanador` varchar(150) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `EquipoPerdedor` varchar(150) COLLATE utf8_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblpersonas`
--

CREATE TABLE `tblpersonas` (
  `PkId` varchar(15) COLLATE utf8_spanish2_ci NOT NULL,
  `FkId_TblTipoDocumento` int(11) NOT NULL,
  `P_Nombre` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `S_Nombre` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `P_Apellido` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `S_Apellido` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `FecNacimiento` date NOT NULL,
  `FkId_TblSexo` int(11) NOT NULL,
  `FkId_TblRh` int(11) NOT NULL,
  `FkId_TblEps` int(11) NOT NULL,
  `Movil` varchar(15) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `Correo` varchar(150) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `IdCreador` varchar(15) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `Foto` mediumblob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblpuntuacion`
--

CREATE TABLE `tblpuntuacion` (
  `PkId` int(11) NOT NULL,
  `FkId_TblEquipo` int(11) NOT NULL,
  `FkId_TblTorneo` int(11) NOT NULL,
  `N_Goles` int(11) NOT NULL,
  `GolesFavor` int(11) NOT NULL,
  `GolesEnContra` int(11) NOT NULL,
  `Puntos_JuegoLimpio` int(11) NOT NULL,
  `N_PartidosJugados` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblrh`
--

CREATE TABLE `tblrh` (
  `PkId` int(11) NOT NULL,
  `Descripcion` varchar(100) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `tblrh`
--

INSERT INTO `tblrh` (`PkId`, `Descripcion`) VALUES
(1, 'A+'),
(2, 'A-'),
(3, 'O+'),
(4, 'O-');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblrol`
--

CREATE TABLE `tblrol` (
  `PkId` int(11) NOT NULL,
  `Descripcion` varchar(100) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `tblrol`
--

INSERT INTO `tblrol` (`PkId`, `Descripcion`) VALUES
(1, 'ADMINISTRADOR'),
(2, 'DELEGADO'),
(3, 'JUGADOR');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblsanciones`
--

CREATE TABLE `tblsanciones` (
  `PkId` int(11) NOT NULL,
  `FkId_TblTipoSancion` int(11) NOT NULL,
  `FechaHora` datetime NOT NULL,
  `FkId_TblPartido` int(11) NOT NULL,
  `FkId_TblPersonas_Jugador` varchar(15) COLLATE utf8_spanish2_ci NOT NULL,
  `FkId_TblPersonas_Arbitro` varchar(15) COLLATE utf8_spanish2_ci NOT NULL,
  `FkId_TblEstado` int(11) NOT NULL,
  `Observaciones` varchar(150) COLLATE utf8_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblsexo`
--

CREATE TABLE `tblsexo` (
  `PkId` int(11) NOT NULL,
  `Descripcion` varchar(100) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `tblsexo`
--

INSERT INTO `tblsexo` (`PkId`, `Descripcion`) VALUES
(1, 'FEMENINO'),
(2, 'MASCULINO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbltipodocumento`
--

CREATE TABLE `tbltipodocumento` (
  `PkId` int(11) NOT NULL,
  `Descripcion` varchar(100) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `tbltipodocumento`
--

INSERT INTO `tbltipodocumento` (`PkId`, `Descripcion`) VALUES
(3, 'Cedula'),
(4, 'Tarjeta de identidad'),
(5, 'Documento extranjero');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbltipogol`
--

CREATE TABLE `tbltipogol` (
  `PkId` int(11) NOT NULL,
  `Descripcion` varchar(100) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbltiposancion`
--

CREATE TABLE `tbltiposancion` (
  `PkId` int(11) NOT NULL,
  `Descripcion` varchar(100) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbltipotorneo`
--

CREATE TABLE `tbltipotorneo` (
  `PkId` int(11) NOT NULL,
  `Descripcion` varchar(100) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbltorneo`
--

CREATE TABLE `tbltorneo` (
  `PkId` int(11) NOT NULL,
  `FkId_TblPersonas_Administrador` varchar(15) COLLATE utf8_spanish2_ci NOT NULL,
  `Nombre` varchar(150) COLLATE utf8_spanish2_ci NOT NULL,
  `FechaInicio` datetime NOT NULL,
  `FechaFin` datetime NOT NULL,
  `FecHora_Ini_Inscripcion` datetime NOT NULL,
  `FecHora_Fin_Inscripcion` datetime NOT NULL,
  `PrecioInscripcion` float DEFAULT NULL,
  `CantidadEquipos` int(11) NOT NULL,
  `FkId_TblEstado` int(11) NOT NULL,
  `FkId_TblTipoTorneo` int(11) NOT NULL,
  `Premio` varchar(150) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblusuarios`
--

CREATE TABLE `tblusuarios` (
  `PkId_TblPersonas` varchar(15) COLLATE utf8_spanish2_ci NOT NULL,
  `Correo` varchar(150) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `Contrasenia` varchar(25) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `FkId_TblEstado` int(11) NOT NULL,
  `FkId_TblRol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbldet_jugador_premio`
--
ALTER TABLE `tbldet_jugador_premio`
  ADD PRIMARY KEY (`PkId`),
  ADD KEY `FkId_TblPersonas_Jugador` (`FkId_TblPersonas_Jugador`);

--
-- Indices de la tabla `tbldet_personas_partidos`
--
ALTER TABLE `tbldet_personas_partidos`
  ADD PRIMARY KEY (`PkId`),
  ADD KEY `FkId_TblPartido` (`FkId_TblPartido`),
  ADD KEY `FkId_TblPersonas_Arbitro` (`FkId_TblPersonas_Arbitro`);

--
-- Indices de la tabla `tbleps`
--
ALTER TABLE `tbleps`
  ADD PRIMARY KEY (`PkId`);

--
-- Indices de la tabla `tblequipos`
--
ALTER TABLE `tblequipos`
  ADD PRIMARY KEY (`PkId`),
  ADD KEY `FkId_TblEstado` (`FkId_TblEstado`),
  ADD KEY `FkId_TblPersonas_Delegado` (`FkId_TblPersonas_Delegado`),
  ADD KEY `FkId_TblPersonas_Delegado_2` (`FkId_TblPersonas_Delegado`);

--
-- Indices de la tabla `tblestado`
--
ALTER TABLE `tblestado`
  ADD PRIMARY KEY (`PkId`);

--
-- Indices de la tabla `tblgol`
--
ALTER TABLE `tblgol`
  ADD PRIMARY KEY (`PkId`),
  ADD KEY `FkId_TblPersonas_Jugador` (`FkId_TblPersonas_Jugador`),
  ADD KEY `FkId_TblPersonas_Jugador_2` (`FkId_TblPersonas_Jugador`),
  ADD KEY `FkId_TblTipoGol` (`FkId_TblTipoGol`);

--
-- Indices de la tabla `tblinscripcion`
--
ALTER TABLE `tblinscripcion`
  ADD PRIMARY KEY (`PkId`),
  ADD KEY `FkId_TblPersonas_Delegado` (`FkId_TblPersonas_Delegado`),
  ADD KEY `FkId_TblTorneo` (`FkId_TblTorneo`),
  ADD KEY `FkId_TblEquipos` (`FkId_TblEquipos`);

--
-- Indices de la tabla `tblpartidos`
--
ALTER TABLE `tblpartidos`
  ADD PRIMARY KEY (`PkId`),
  ADD KEY `FkId_TblEquipo_Visitante` (`FkId_TblEquipo_Visitante`),
  ADD KEY `FkId_TblEquipo_Local` (`FkId_TblEquipo_Local`);

--
-- Indices de la tabla `tblpersonas`
--
ALTER TABLE `tblpersonas`
  ADD PRIMARY KEY (`PkId`),
  ADD KEY `FkId_TblTipoDocumento` (`FkId_TblTipoDocumento`),
  ADD KEY `FkId_TblSexo` (`FkId_TblSexo`),
  ADD KEY `FkId_TblRh` (`FkId_TblRh`),
  ADD KEY `FkId_TblEps` (`FkId_TblEps`);

--
-- Indices de la tabla `tblpuntuacion`
--
ALTER TABLE `tblpuntuacion`
  ADD PRIMARY KEY (`PkId`),
  ADD KEY `FkId_TblEquipo` (`FkId_TblEquipo`),
  ADD KEY `FkId_TblTorneo` (`FkId_TblTorneo`);

--
-- Indices de la tabla `tblrh`
--
ALTER TABLE `tblrh`
  ADD PRIMARY KEY (`PkId`);

--
-- Indices de la tabla `tblrol`
--
ALTER TABLE `tblrol`
  ADD PRIMARY KEY (`PkId`);

--
-- Indices de la tabla `tblsanciones`
--
ALTER TABLE `tblsanciones`
  ADD PRIMARY KEY (`PkId`),
  ADD KEY `FkId_TblTipoSancion` (`FkId_TblTipoSancion`),
  ADD KEY `FkId_TblPartido` (`FkId_TblPartido`),
  ADD KEY `FkId_TblPersonas_Jugador` (`FkId_TblPersonas_Jugador`),
  ADD KEY `FkId_TblPersonas_Arbitro` (`FkId_TblPersonas_Arbitro`);

--
-- Indices de la tabla `tblsexo`
--
ALTER TABLE `tblsexo`
  ADD PRIMARY KEY (`PkId`);

--
-- Indices de la tabla `tbltipodocumento`
--
ALTER TABLE `tbltipodocumento`
  ADD PRIMARY KEY (`PkId`);

--
-- Indices de la tabla `tbltipogol`
--
ALTER TABLE `tbltipogol`
  ADD PRIMARY KEY (`PkId`);

--
-- Indices de la tabla `tbltiposancion`
--
ALTER TABLE `tbltiposancion`
  ADD PRIMARY KEY (`PkId`);

--
-- Indices de la tabla `tbltipotorneo`
--
ALTER TABLE `tbltipotorneo`
  ADD PRIMARY KEY (`PkId`);

--
-- Indices de la tabla `tbltorneo`
--
ALTER TABLE `tbltorneo`
  ADD PRIMARY KEY (`PkId`),
  ADD KEY `FkId_TblPersonas_Administrador` (`FkId_TblPersonas_Administrador`),
  ADD KEY `FkId_TblEstado` (`FkId_TblEstado`),
  ADD KEY `FkId_TblTipoTorneo` (`FkId_TblTipoTorneo`);

--
-- Indices de la tabla `tblusuarios`
--
ALTER TABLE `tblusuarios`
  ADD PRIMARY KEY (`PkId_TblPersonas`),
  ADD KEY `FkId_TblEstado` (`FkId_TblEstado`),
  ADD KEY `FkId_TblRol` (`FkId_TblRol`),
  ADD KEY `PkId_TblPersonas` (`PkId_TblPersonas`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbldet_jugador_premio`
--
ALTER TABLE `tbldet_jugador_premio`
  MODIFY `PkId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbldet_personas_partidos`
--
ALTER TABLE `tbldet_personas_partidos`
  MODIFY `PkId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbleps`
--
ALTER TABLE `tbleps`
  MODIFY `PkId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tblequipos`
--
ALTER TABLE `tblequipos`
  MODIFY `PkId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tblestado`
--
ALTER TABLE `tblestado`
  MODIFY `PkId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tblgol`
--
ALTER TABLE `tblgol`
  MODIFY `PkId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tblinscripcion`
--
ALTER TABLE `tblinscripcion`
  MODIFY `PkId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tblpartidos`
--
ALTER TABLE `tblpartidos`
  MODIFY `PkId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tblpuntuacion`
--
ALTER TABLE `tblpuntuacion`
  MODIFY `PkId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tblrh`
--
ALTER TABLE `tblrh`
  MODIFY `PkId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tblrol`
--
ALTER TABLE `tblrol`
  MODIFY `PkId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tblsanciones`
--
ALTER TABLE `tblsanciones`
  MODIFY `PkId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tblsexo`
--
ALTER TABLE `tblsexo`
  MODIFY `PkId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tbltipodocumento`
--
ALTER TABLE `tbltipodocumento`
  MODIFY `PkId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tbltipogol`
--
ALTER TABLE `tbltipogol`
  MODIFY `PkId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbltiposancion`
--
ALTER TABLE `tbltiposancion`
  MODIFY `PkId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbltipotorneo`
--
ALTER TABLE `tbltipotorneo`
  MODIFY `PkId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbltorneo`
--
ALTER TABLE `tbltorneo`
  MODIFY `PkId` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbldet_jugador_premio`
--
ALTER TABLE `tbldet_jugador_premio`
  ADD CONSTRAINT `tbldet_jugador_premio_ibfk_1` FOREIGN KEY (`FkId_TblPersonas_Jugador`) REFERENCES `tblpersonas` (`PkId`);

--
-- Filtros para la tabla `tbldet_personas_partidos`
--
ALTER TABLE `tbldet_personas_partidos`
  ADD CONSTRAINT `tbldet_personas_partidos_ibfk_1` FOREIGN KEY (`FkId_TblPartido`) REFERENCES `tblpartidos` (`PkId`),
  ADD CONSTRAINT `tbldet_personas_partidos_ibfk_2` FOREIGN KEY (`FkId_TblPersonas_Arbitro`) REFERENCES `tblpersonas` (`PkId`);

--
-- Filtros para la tabla `tblequipos`
--
ALTER TABLE `tblequipos`
  ADD CONSTRAINT `tblequipos_ibfk_1` FOREIGN KEY (`FkId_TblEstado`) REFERENCES `tblestado` (`PkId`),
  ADD CONSTRAINT `tblequipos_ibfk_2` FOREIGN KEY (`FkId_TblPersonas_Delegado`) REFERENCES `tblpersonas` (`PkId`);

--
-- Filtros para la tabla `tblgol`
--
ALTER TABLE `tblgol`
  ADD CONSTRAINT `tblgol_ibfk_1` FOREIGN KEY (`FkId_TblPersonas_Jugador`) REFERENCES `tblpersonas` (`PkId`),
  ADD CONSTRAINT `tblgol_ibfk_2` FOREIGN KEY (`FkId_TblPersonas_Jugador`) REFERENCES `tblpersonas` (`PkId`),
  ADD CONSTRAINT `tblgol_ibfk_3` FOREIGN KEY (`FkId_TblTipoGol`) REFERENCES `tbltipogol` (`PkId`);

--
-- Filtros para la tabla `tblinscripcion`
--
ALTER TABLE `tblinscripcion`
  ADD CONSTRAINT `tblinscripcion_ibfk_1` FOREIGN KEY (`FkId_TblPersonas_Delegado`) REFERENCES `tblpersonas` (`PkId`),
  ADD CONSTRAINT `tblinscripcion_ibfk_2` FOREIGN KEY (`FkId_TblTorneo`) REFERENCES `tbltorneo` (`PkId`),
  ADD CONSTRAINT `tblinscripcion_ibfk_3` FOREIGN KEY (`FkId_TblEquipos`) REFERENCES `tblequipos` (`PkId`);

--
-- Filtros para la tabla `tblpartidos`
--
ALTER TABLE `tblpartidos`
  ADD CONSTRAINT `tblpartidos_ibfk_1` FOREIGN KEY (`FkId_TblEquipo_Visitante`) REFERENCES `tblequipos` (`PkId`),
  ADD CONSTRAINT `tblpartidos_ibfk_2` FOREIGN KEY (`FkId_TblEquipo_Local`) REFERENCES `tblequipos` (`PkId`);

--
-- Filtros para la tabla `tblpersonas`
--
ALTER TABLE `tblpersonas`
  ADD CONSTRAINT `tblpersonas_ibfk_1` FOREIGN KEY (`FkId_TblTipoDocumento`) REFERENCES `tbltipodocumento` (`PkId`),
  ADD CONSTRAINT `tblpersonas_ibfk_2` FOREIGN KEY (`FkId_TblSexo`) REFERENCES `tblsexo` (`PkId`),
  ADD CONSTRAINT `tblpersonas_ibfk_3` FOREIGN KEY (`FkId_TblRh`) REFERENCES `tblrh` (`PkId`),
  ADD CONSTRAINT `tblpersonas_ibfk_4` FOREIGN KEY (`FkId_TblEps`) REFERENCES `tbleps` (`PkId`);

--
-- Filtros para la tabla `tblpuntuacion`
--
ALTER TABLE `tblpuntuacion`
  ADD CONSTRAINT `tblpuntuacion_ibfk_1` FOREIGN KEY (`FkId_TblEquipo`) REFERENCES `tblequipos` (`PkId`),
  ADD CONSTRAINT `tblpuntuacion_ibfk_2` FOREIGN KEY (`FkId_TblTorneo`) REFERENCES `tbltorneo` (`PkId`);

--
-- Filtros para la tabla `tblsanciones`
--
ALTER TABLE `tblsanciones`
  ADD CONSTRAINT `tblsanciones_ibfk_1` FOREIGN KEY (`FkId_TblTipoSancion`) REFERENCES `tbltiposancion` (`PkId`),
  ADD CONSTRAINT `tblsanciones_ibfk_2` FOREIGN KEY (`FkId_TblPartido`) REFERENCES `tblpartidos` (`PkId`),
  ADD CONSTRAINT `tblsanciones_ibfk_3` FOREIGN KEY (`FkId_TblPersonas_Jugador`) REFERENCES `tblpersonas` (`PkId`),
  ADD CONSTRAINT `tblsanciones_ibfk_4` FOREIGN KEY (`FkId_TblPersonas_Arbitro`) REFERENCES `tblpersonas` (`PkId`);

--
-- Filtros para la tabla `tbltorneo`
--
ALTER TABLE `tbltorneo`
  ADD CONSTRAINT `tbltorneo_ibfk_1` FOREIGN KEY (`FkId_TblPersonas_Administrador`) REFERENCES `tblpersonas` (`PkId`),
  ADD CONSTRAINT `tbltorneo_ibfk_2` FOREIGN KEY (`FkId_TblEstado`) REFERENCES `tblestado` (`PkId`),
  ADD CONSTRAINT `tbltorneo_ibfk_3` FOREIGN KEY (`FkId_TblTipoTorneo`) REFERENCES `tbltipotorneo` (`PkId`);

--
-- Filtros para la tabla `tblusuarios`
--
ALTER TABLE `tblusuarios`
  ADD CONSTRAINT `tblusuarios_ibfk_1` FOREIGN KEY (`FkId_TblEstado`) REFERENCES `tblestado` (`PkId`),
  ADD CONSTRAINT `tblusuarios_ibfk_3` FOREIGN KEY (`PkId_TblPersonas`) REFERENCES `tblpersonas` (`PkId`),
  ADD CONSTRAINT `tblusuarios_ibfk_4` FOREIGN KEY (`FkId_TblRol`) REFERENCES `tblrol` (`PkId`),
  ADD CONSTRAINT `tblusuarios_ibfk_5` FOREIGN KEY (`FkId_TblRol`) REFERENCES `tblrol` (`PkId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
