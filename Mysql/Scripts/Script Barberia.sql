-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-07-2019 a las 19:47:41
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
-- Base de datos: `dbbarberia`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_barbero`
--

CREATE TABLE `tbl_barbero` (
  `pk_id_barbero` int(11) NOT NULL,
  `nombre` varchar(150) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `correo` varchar(150) DEFAULT NULL,
  `fk_horario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_cita`
--

CREATE TABLE `tbl_cita` (
  `pk_id_cita` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `fk_cliente` int(11) DEFAULT NULL,
  `fk_peinado` int(11) DEFAULT NULL,
  `fk_barbero` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_clientes`
--

CREATE TABLE `tbl_clientes` (
  `pk_id_cli` int(11) NOT NULL,
  `nombre` varchar(150) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `fk_estilo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_estilos`
--

CREATE TABLE `tbl_estilos` (
  `pk_id_estilo` int(11) NOT NULL,
  `descripcion` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbl_barbero`
--
ALTER TABLE `tbl_barbero`
  ADD PRIMARY KEY (`pk_id_barbero`),
  ADD KEY `pk_id_barbero` (`pk_id_barbero`),
  ADD KEY `pk_id_barbero_2` (`pk_id_barbero`),
  ADD KEY `pk_id_barbero_3` (`pk_id_barbero`),
  ADD KEY `pk_id_barbero_4` (`pk_id_barbero`);

--
-- Indices de la tabla `tbl_cita`
--
ALTER TABLE `tbl_cita`
  ADD PRIMARY KEY (`pk_id_cita`),
  ADD KEY `fk_cliente` (`fk_cliente`),
  ADD KEY `fk_cliente_2` (`fk_cliente`),
  ADD KEY `fk_barbero` (`fk_barbero`),
  ADD KEY `fk_peinado` (`fk_peinado`);

--
-- Indices de la tabla `tbl_clientes`
--
ALTER TABLE `tbl_clientes`
  ADD PRIMARY KEY (`pk_id_cli`);

--
-- Indices de la tabla `tbl_estilos`
--
ALTER TABLE `tbl_estilos`
  ADD PRIMARY KEY (`pk_id_estilo`),
  ADD KEY `pk_id_estilo` (`pk_id_estilo`),
  ADD KEY `pk_id_estilo_2` (`pk_id_estilo`),
  ADD KEY `pk_id_estilo_3` (`pk_id_estilo`),
  ADD KEY `pk_id_estilo_4` (`pk_id_estilo`),
  ADD KEY `pk_id_estilo_5` (`pk_id_estilo`),
  ADD KEY `pk_id_estilo_6` (`pk_id_estilo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbl_cita`
--
ALTER TABLE `tbl_cita`
  MODIFY `pk_id_cita` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_clientes`
--
ALTER TABLE `tbl_clientes`
  MODIFY `pk_id_cli` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbl_barbero`
--
ALTER TABLE `tbl_barbero`
  ADD CONSTRAINT `tbl_barbero_ibfk_1` FOREIGN KEY (`pk_id_barbero`) REFERENCES `tbl_cita` (`fk_barbero`);

--
-- Filtros para la tabla `tbl_clientes`
--
ALTER TABLE `tbl_clientes`
  ADD CONSTRAINT `tbl_clientes_ibfk_1` FOREIGN KEY (`pk_id_cli`) REFERENCES `tbl_cita` (`fk_cliente`);

--
-- Filtros para la tabla `tbl_estilos`
--
ALTER TABLE `tbl_estilos`
  ADD CONSTRAINT `tbl_estilos_ibfk_1` FOREIGN KEY (`pk_id_estilo`) REFERENCES `tbl_cita` (`fk_peinado`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
