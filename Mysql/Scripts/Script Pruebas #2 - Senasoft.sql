-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-10-2019 a las 00:29:32
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
-- Base de datos: `dbprueba_dos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblclientes`
--

CREATE TABLE `tblclientes` (
  `pkidentificacion` varchar(15) NOT NULL,
  `nombres` varchar(150) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `correo` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbldet_tblpedidos`
--

CREATE TABLE `tbldet_tblpedidos` (
  `pkid` int(11) NOT NULL,
  `fkN_pedido_tblpedid` int(11) DEFAULT NULL,
  `fkcodogo_tblproducto` varchar(15) DEFAULT NULL,
  `valor_unitario` float DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblestado`
--

CREATE TABLE `tblestado` (
  `pkid` int(11) NOT NULL,
  `Descripcion` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblhistoria_ingreso`
--

CREATE TABLE `tblhistoria_ingreso` (
  `pkid` int(11) NOT NULL,
  `fkusuario_tblusuario` varchar(15) DEFAULT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  `horas_ingreso` time DEFAULT NULL,
  `fecha_salida` date DEFAULT NULL,
  `hora_salida` time DEFAULT NULL,
  `tiempo` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbllugar`
--

CREATE TABLE `tbllugar` (
  `pkId` int(11) NOT NULL,
  `Descripcion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblpedidos`
--

CREATE TABLE `tblpedidos` (
  `pkn_pedido` int(11) NOT NULL,
  `fkusuario_tblusuario` varchar(15) DEFAULT NULL,
  `fkNit_tbltienda` int(11) DEFAULT NULL,
  `subtotal` float DEFAULT NULL,
  `iva` float DEFAULT NULL,
  `total` float DEFAULT NULL,
  `fecha` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblproductos`
--

CREATE TABLE `tblproductos` (
  `pkcodigo` varchar(15) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `valorunitario` float DEFAULT NULL,
  `stock` varchar(50) DEFAULT NULL,
  `fki_tblestado` int(11) DEFAULT NULL,
  `fknit_tbltienda` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblrol`
--

CREATE TABLE `tblrol` (
  `pkId` int(11) NOT NULL,
  `Descripcion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbltienda`
--

CREATE TABLE `tbltienda` (
  `pknit` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `fkid_tblLugar` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblusuarios`
--

CREATE TABLE `tblusuarios` (
  `pkusuario` varchar(15) NOT NULL,
  `contrasena` varchar(12) DEFAULT NULL,
  `fkidentificacion_tblcliente` varchar(15) DEFAULT NULL,
  `fkId_estado` int(11) DEFAULT NULL,
  `fkId_tblRol` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tblclientes`
--
ALTER TABLE `tblclientes`
  ADD PRIMARY KEY (`pkidentificacion`);

--
-- Indices de la tabla `tbldet_tblpedidos`
--
ALTER TABLE `tbldet_tblpedidos`
  ADD PRIMARY KEY (`pkid`),
  ADD KEY `fkN_pedido_tblpedid` (`fkN_pedido_tblpedid`),
  ADD KEY `fkcodogo_tblproducto` (`fkcodogo_tblproducto`);

--
-- Indices de la tabla `tblestado`
--
ALTER TABLE `tblestado`
  ADD PRIMARY KEY (`pkid`);

--
-- Indices de la tabla `tblhistoria_ingreso`
--
ALTER TABLE `tblhistoria_ingreso`
  ADD PRIMARY KEY (`pkid`),
  ADD KEY `fkusuario_tblusuario` (`fkusuario_tblusuario`);

--
-- Indices de la tabla `tbllugar`
--
ALTER TABLE `tbllugar`
  ADD PRIMARY KEY (`pkId`);

--
-- Indices de la tabla `tblpedidos`
--
ALTER TABLE `tblpedidos`
  ADD PRIMARY KEY (`pkn_pedido`),
  ADD KEY `fkusuario_tblusuario` (`fkusuario_tblusuario`),
  ADD KEY `fkNit_tbltienda` (`fkNit_tbltienda`);

--
-- Indices de la tabla `tblproductos`
--
ALTER TABLE `tblproductos`
  ADD PRIMARY KEY (`pkcodigo`),
  ADD KEY `fk_tblestado` (`fki_tblestado`),
  ADD KEY `fknit_tbltienda` (`fknit_tbltienda`);

--
-- Indices de la tabla `tblrol`
--
ALTER TABLE `tblrol`
  ADD PRIMARY KEY (`pkId`);

--
-- Indices de la tabla `tbltienda`
--
ALTER TABLE `tbltienda`
  ADD PRIMARY KEY (`pknit`),
  ADD KEY `fkid_tblLugar` (`fkid_tblLugar`);

--
-- Indices de la tabla `tblusuarios`
--
ALTER TABLE `tblusuarios`
  ADD PRIMARY KEY (`pkusuario`),
  ADD KEY `fkidentificacion_tblcliente` (`fkidentificacion_tblcliente`),
  ADD KEY `fkId_estado` (`fkId_estado`),
  ADD KEY `fkId_tblRol` (`fkId_tblRol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbldet_tblpedidos`
--
ALTER TABLE `tbldet_tblpedidos`
  MODIFY `pkid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tblestado`
--
ALTER TABLE `tblestado`
  MODIFY `pkid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tblhistoria_ingreso`
--
ALTER TABLE `tblhistoria_ingreso`
  MODIFY `pkid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbllugar`
--
ALTER TABLE `tbllugar`
  MODIFY `pkId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tblpedidos`
--
ALTER TABLE `tblpedidos`
  MODIFY `pkn_pedido` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tblrol`
--
ALTER TABLE `tblrol`
  MODIFY `pkId` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbldet_tblpedidos`
--
ALTER TABLE `tbldet_tblpedidos`
  ADD CONSTRAINT `tbldet_tblpedidos_ibfk_1` FOREIGN KEY (`fkN_pedido_tblpedid`) REFERENCES `tblpedidos` (`pkn_pedido`),
  ADD CONSTRAINT `tbldet_tblpedidos_ibfk_2` FOREIGN KEY (`fkcodogo_tblproducto`) REFERENCES `tblproductos` (`pkcodigo`);

--
-- Filtros para la tabla `tblhistoria_ingreso`
--
ALTER TABLE `tblhistoria_ingreso`
  ADD CONSTRAINT `tblhistoria_ingreso_ibfk_1` FOREIGN KEY (`fkusuario_tblusuario`) REFERENCES `tblusuarios` (`pkusuario`);

--
-- Filtros para la tabla `tblpedidos`
--
ALTER TABLE `tblpedidos`
  ADD CONSTRAINT `tblpedidos_ibfk_1` FOREIGN KEY (`fkusuario_tblusuario`) REFERENCES `tblusuarios` (`pkusuario`),
  ADD CONSTRAINT `tblpedidos_ibfk_2` FOREIGN KEY (`fkNit_tbltienda`) REFERENCES `tbltienda` (`pknit`);

--
-- Filtros para la tabla `tblproductos`
--
ALTER TABLE `tblproductos`
  ADD CONSTRAINT `tblproductos_ibfk_1` FOREIGN KEY (`fki_tblestado`) REFERENCES `tblestado` (`pkid`),
  ADD CONSTRAINT `tblproductos_ibfk_2` FOREIGN KEY (`fknit_tbltienda`) REFERENCES `tbltienda` (`pknit`);

--
-- Filtros para la tabla `tbltienda`
--
ALTER TABLE `tbltienda`
  ADD CONSTRAINT `tbltienda_ibfk_1` FOREIGN KEY (`fkid_tblLugar`) REFERENCES `tbllugar` (`pkId`);

--
-- Filtros para la tabla `tblusuarios`
--
ALTER TABLE `tblusuarios`
  ADD CONSTRAINT `tblusuarios_ibfk_1` FOREIGN KEY (`fkidentificacion_tblcliente`) REFERENCES `tblclientes` (`pkidentificacion`),
  ADD CONSTRAINT `tblusuarios_ibfk_2` FOREIGN KEY (`fkId_estado`) REFERENCES `tblestado` (`pkid`),
  ADD CONSTRAINT `tblusuarios_ibfk_3` FOREIGN KEY (`fkId_tblRol`) REFERENCES `tblrol` (`pkId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
