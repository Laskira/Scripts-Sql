-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-07-2019 a las 19:48:13
-- Versión del servidor: 10.3.15-MariaDB
-- Versión de PHP: 7.1.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dbhospital`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_citas`
--

CREATE TABLE `tbl_citas` (
  `pkn_cita` int(11) NOT NULL,
  `fkid_tblclientes` int(11) DEFAULT NULL,
  `fk_codigo_tblmedicos` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `fkcodigo_tblconsultorio` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_clientes`
--

CREATE TABLE `tbl_clientes` (
  `pk_id` int(11) NOT NULL,
  `nombres` varchar(150) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `correo` varchar(150) DEFAULT NULL,
  `fk_tblsexo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_consultorios`
--

CREATE TABLE `tbl_consultorios` (
  `pk_codigo` int(11) NOT NULL,
  `descripcion` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbl_consultorios`
--

INSERT INTO `tbl_consultorios` (`pk_codigo`, `descripcion`) VALUES
(2, 'Cardiologia'),
(3, 'Pediatria'),
(4, 'Odontologia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_especialidad`
--

CREATE TABLE `tbl_especialidad` (
  `pk_id` int(11) NOT NULL,
  `descripcion` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbl_especialidad`
--

INSERT INTO `tbl_especialidad` (`pk_id`, `descripcion`) VALUES
(1, 'M‚dico general'),
(2, 'Od¢ntologo'),
(3, 'Anestesiologo'),
(4, 'Cardiologo'),
(5, 'Pediatria');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_medicos`
--

CREATE TABLE `tbl_medicos` (
  `pk_codigo` int(11) NOT NULL,
  `nombres` varchar(150) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `fkid_tblespecialidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbl_medicos`
--

INSERT INTO `tbl_medicos` (`pk_codigo`, `nombres`, `telefono`, `fkid_tblespecialidad`) VALUES
(1, 'Felipe Lopez', '3140981256', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_sexo`
--

CREATE TABLE `tbl_sexo` (
  `pk_id` int(11) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbl_sexo`
--

INSERT INTO `tbl_sexo` (`pk_id`, `descripcion`) VALUES
(1, 'Masculino'),
(2, 'Femenino');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbl_citas`
--
ALTER TABLE `tbl_citas`
  ADD PRIMARY KEY (`pkn_cita`),
  ADD KEY `fkid_tblclientes` (`fkid_tblclientes`),
  ADD KEY `fk_codigo_tblmedicos` (`fk_codigo_tblmedicos`),
  ADD KEY `fkcodigo_tblconsultorio` (`fkcodigo_tblconsultorio`);

--
-- Indices de la tabla `tbl_clientes`
--
ALTER TABLE `tbl_clientes`
  ADD PRIMARY KEY (`pk_id`),
  ADD KEY `fk_tblsexo` (`fk_tblsexo`);

--
-- Indices de la tabla `tbl_consultorios`
--
ALTER TABLE `tbl_consultorios`
  ADD PRIMARY KEY (`pk_codigo`);

--
-- Indices de la tabla `tbl_especialidad`
--
ALTER TABLE `tbl_especialidad`
  ADD PRIMARY KEY (`pk_id`);

--
-- Indices de la tabla `tbl_medicos`
--
ALTER TABLE `tbl_medicos`
  ADD PRIMARY KEY (`pk_codigo`),
  ADD KEY `fkid_tblespecialidad` (`fkid_tblespecialidad`);

--
-- Indices de la tabla `tbl_sexo`
--
ALTER TABLE `tbl_sexo`
  ADD PRIMARY KEY (`pk_id`),
  ADD KEY `pk_id` (`pk_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbl_citas`
--
ALTER TABLE `tbl_citas`
  MODIFY `pkn_cita` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_consultorios`
--
ALTER TABLE `tbl_consultorios`
  MODIFY `pk_codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tbl_especialidad`
--
ALTER TABLE `tbl_especialidad`
  MODIFY `pk_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tbl_medicos`
--
ALTER TABLE `tbl_medicos`
  MODIFY `pk_codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tbl_sexo`
--
ALTER TABLE `tbl_sexo`
  MODIFY `pk_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbl_citas`
--
ALTER TABLE `tbl_citas`
  ADD CONSTRAINT `tbl_citas_ibfk_1` FOREIGN KEY (`fkid_tblclientes`) REFERENCES `tbl_clientes` (`pk_id`),
  ADD CONSTRAINT `tbl_citas_ibfk_2` FOREIGN KEY (`fk_codigo_tblmedicos`) REFERENCES `tbl_medicos` (`pk_codigo`),
  ADD CONSTRAINT `tbl_citas_ibfk_3` FOREIGN KEY (`fkcodigo_tblconsultorio`) REFERENCES `tbl_consultorios` (`pk_codigo`);

--
-- Filtros para la tabla `tbl_clientes`
--
ALTER TABLE `tbl_clientes`
  ADD CONSTRAINT `tbl_clientes_ibfk_1` FOREIGN KEY (`fk_tblsexo`) REFERENCES `tbl_sexo` (`pk_id`);

--
-- Filtros para la tabla `tbl_medicos`
--
ALTER TABLE `tbl_medicos`
  ADD CONSTRAINT `tbl_medicos_ibfk_1` FOREIGN KEY (`fkid_tblespecialidad`) REFERENCES `tbl_especialidad` (`pk_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
