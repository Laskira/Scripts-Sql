-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-07-2019 a las 19:47:30
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
-- Base de datos: `dbagencia_viajes`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `Id` int(11) NOT NULL,
  `Nombre` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hoteles`
--

CREATE TABLE `hoteles` (
  `Id` int(11) NOT NULL,
  `Nombre` varchar(150) DEFAULT NULL,
  `Direccion` varchar(100) DEFAULT NULL,
  `Telefono` varchar(15) DEFAULT NULL,
  `Regimenes_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hoteles_plaza`
--

CREATE TABLE `hoteles_plaza` (
  `Id` int(11) NOT NULL,
  `Hotel_id` int(11) DEFAULT NULL,
  `Plaza_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hoteles_viaje`
--

CREATE TABLE `hoteles_viaje` (
  `Id` int(11) NOT NULL,
  `Vuelo_id` int(11) DEFAULT NULL,
  `Hotel_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plazas`
--

CREATE TABLE `plazas` (
  `Id` int(11) NOT NULL,
  `Nombre` varchar(100) DEFAULT NULL,
  `Clase_plaza` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `regimenes`
--

CREATE TABLE `regimenes` (
  `Id` int(11) NOT NULL,
  `Nombre` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursales`
--

CREATE TABLE `sucursales` (
  `Id` int(11) NOT NULL,
  `Nombre` varchar(100) DEFAULT NULL,
  `Hotel_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_clase`
--

CREATE TABLE `tipo_clase` (
  `Id` int(11) NOT NULL,
  `Nombre` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `turista`
--

CREATE TABLE `turista` (
  `Id` int(11) NOT NULL,
  `Nombre` varchar(150) DEFAULT NULL,
  `Apellido` varchar(150) DEFAULT NULL,
  `Direccion` varchar(150) DEFAULT NULL,
  `Telefono` varchar(15) DEFAULT NULL,
  `Sucursal_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `turistas_hoteles`
--

CREATE TABLE `turistas_hoteles` (
  `Id` int(11) NOT NULL,
  `Turista_id` int(11) DEFAULT NULL,
  `Hotel_id` int(11) DEFAULT NULL,
  `Fecha_llegada` date DEFAULT NULL,
  `Fecha_partida` date DEFAULT NULL,
  `Hora` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vuelos`
--

CREATE TABLE `vuelos` (
  `Id` int(11) NOT NULL,
  `Fecha` date DEFAULT NULL,
  `Origen` varchar(150) DEFAULT NULL,
  `Destino` varchar(150) DEFAULT NULL,
  `Estado_id` int(11) DEFAULT NULL,
  `Tipo_clase_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `hoteles`
--
ALTER TABLE `hoteles`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Regimenes_id` (`Regimenes_id`);

--
-- Indices de la tabla `hoteles_plaza`
--
ALTER TABLE `hoteles_plaza`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Hotel_id` (`Hotel_id`),
  ADD KEY `Plaza_id` (`Plaza_id`);

--
-- Indices de la tabla `hoteles_viaje`
--
ALTER TABLE `hoteles_viaje`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Vuelo_id` (`Vuelo_id`),
  ADD KEY `Hotel_id` (`Hotel_id`);

--
-- Indices de la tabla `plazas`
--
ALTER TABLE `plazas`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `regimenes`
--
ALTER TABLE `regimenes`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `sucursales`
--
ALTER TABLE `sucursales`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Hotel_id` (`Hotel_id`);

--
-- Indices de la tabla `tipo_clase`
--
ALTER TABLE `tipo_clase`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `turista`
--
ALTER TABLE `turista`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Sucursal_id` (`Sucursal_id`);

--
-- Indices de la tabla `turistas_hoteles`
--
ALTER TABLE `turistas_hoteles`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Hotel_id` (`Hotel_id`),
  ADD KEY `Turista_id` (`Turista_id`);

--
-- Indices de la tabla `vuelos`
--
ALTER TABLE `vuelos`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Estado_id` (`Estado_id`),
  ADD KEY `Tipo_clase_id` (`Tipo_clase_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `hoteles`
--
ALTER TABLE `hoteles`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `hoteles_plaza`
--
ALTER TABLE `hoteles_plaza`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `hoteles_viaje`
--
ALTER TABLE `hoteles_viaje`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `turista`
--
ALTER TABLE `turista`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `turistas_hoteles`
--
ALTER TABLE `turistas_hoteles`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `vuelos`
--
ALTER TABLE `vuelos`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `hoteles`
--
ALTER TABLE `hoteles`
  ADD CONSTRAINT `hoteles_ibfk_1` FOREIGN KEY (`Regimenes_id`) REFERENCES `regimenes` (`Id`);

--
-- Filtros para la tabla `hoteles_plaza`
--
ALTER TABLE `hoteles_plaza`
  ADD CONSTRAINT `hoteles_plaza_ibfk_1` FOREIGN KEY (`Hotel_id`) REFERENCES `hoteles` (`Id`),
  ADD CONSTRAINT `hoteles_plaza_ibfk_2` FOREIGN KEY (`Plaza_id`) REFERENCES `plazas` (`Id`);

--
-- Filtros para la tabla `hoteles_viaje`
--
ALTER TABLE `hoteles_viaje`
  ADD CONSTRAINT `hoteles_viaje_ibfk_1` FOREIGN KEY (`Vuelo_id`) REFERENCES `vuelos` (`Id`),
  ADD CONSTRAINT `hoteles_viaje_ibfk_2` FOREIGN KEY (`Hotel_id`) REFERENCES `hoteles` (`Id`);

--
-- Filtros para la tabla `sucursales`
--
ALTER TABLE `sucursales`
  ADD CONSTRAINT `sucursales_ibfk_1` FOREIGN KEY (`Hotel_id`) REFERENCES `hoteles` (`Id`);

--
-- Filtros para la tabla `turista`
--
ALTER TABLE `turista`
  ADD CONSTRAINT `turista_ibfk_1` FOREIGN KEY (`Sucursal_id`) REFERENCES `sucursales` (`Id`);

--
-- Filtros para la tabla `turistas_hoteles`
--
ALTER TABLE `turistas_hoteles`
  ADD CONSTRAINT `turistas_hoteles_ibfk_1` FOREIGN KEY (`Hotel_id`) REFERENCES `hoteles` (`Id`),
  ADD CONSTRAINT `turistas_hoteles_ibfk_2` FOREIGN KEY (`Turista_id`) REFERENCES `turista` (`Id`);

--
-- Filtros para la tabla `vuelos`
--
ALTER TABLE `vuelos`
  ADD CONSTRAINT `vuelos_ibfk_1` FOREIGN KEY (`Estado_id`) REFERENCES `estado` (`Id`),
  ADD CONSTRAINT `vuelos_ibfk_2` FOREIGN KEY (`Tipo_clase_id`) REFERENCES `tipo_clase` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
