-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-10-2019 a las 00:30:16
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
-- Base de datos: `dbbiblioteca`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblautor`
--

CREATE TABLE `tblautor` (
  `PkId` int(11) NOT NULL,
  `Nombres` varchar(150) DEFAULT NULL,
  `Apellidos` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblclase`
--

CREATE TABLE `tblclase` (
  `PkId` int(11) NOT NULL,
  `Descripcion` varchar(100) DEFAULT NULL,
  `Tiempo_Maximo` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbldet_autor_libros`
--

CREATE TABLE `tbldet_autor_libros` (
  `PkId` int(11) NOT NULL,
  `FkAutor` int(11) DEFAULT NULL,
  `FkLibro` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbleditorial`
--

CREATE TABLE `tbleditorial` (
  `PkId` int(11) NOT NULL,
  `Nombre` varchar(150) DEFAULT NULL,
  `Correo` varchar(150) DEFAULT NULL,
  `Telefono` varchar(15) DEFAULT NULL,
  `Direccion` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblestado`
--

CREATE TABLE `tblestado` (
  `PkId` int(11) NOT NULL,
  `Descripcion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbllibros`
--

CREATE TABLE `tbllibros` (
  `PkCodiigo` int(11) NOT NULL,
  `Titulo` varchar(200) DEFAULT NULL,
  `NumeroPaginas` int(4) DEFAULT NULL,
  `FkDet_Autor_Libros` int(11) DEFAULT NULL,
  `FkClase` int(11) DEFAULT NULL,
  `FkEstado` int(11) DEFAULT NULL,
  `FkEditorial` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblprestamos`
--

CREATE TABLE `tblprestamos` (
  `PkId` int(11) NOT NULL,
  `FechaInicio` date DEFAULT NULL,
  `FechaDevoluciin` date DEFAULT NULL,
  `FkUsuario` varchar(15) DEFAULT NULL,
  `FkLibros` int(11) DEFAULT NULL,
  `FkEstado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblusuarios`
--

CREATE TABLE `tblusuarios` (
  `PkCarnet` varchar(15) NOT NULL,
  `Nombre` varchar(150) DEFAULT NULL,
  `Direccion` varchar(150) DEFAULT NULL,
  `FkPrestamos` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tblautor`
--
ALTER TABLE `tblautor`
  ADD PRIMARY KEY (`PkId`);

--
-- Indices de la tabla `tblclase`
--
ALTER TABLE `tblclase`
  ADD PRIMARY KEY (`PkId`);

--
-- Indices de la tabla `tbldet_autor_libros`
--
ALTER TABLE `tbldet_autor_libros`
  ADD PRIMARY KEY (`PkId`),
  ADD KEY `FkAutor` (`FkAutor`),
  ADD KEY `FkLibro` (`FkLibro`);

--
-- Indices de la tabla `tbleditorial`
--
ALTER TABLE `tbleditorial`
  ADD PRIMARY KEY (`PkId`);

--
-- Indices de la tabla `tblestado`
--
ALTER TABLE `tblestado`
  ADD PRIMARY KEY (`PkId`);

--
-- Indices de la tabla `tbllibros`
--
ALTER TABLE `tbllibros`
  ADD PRIMARY KEY (`PkCodiigo`),
  ADD KEY `FkDet_Autor_Libros` (`FkDet_Autor_Libros`),
  ADD KEY `FkClase` (`FkClase`),
  ADD KEY `FkEstado` (`FkEstado`),
  ADD KEY `FkEditorial` (`FkEditorial`);

--
-- Indices de la tabla `tblprestamos`
--
ALTER TABLE `tblprestamos`
  ADD PRIMARY KEY (`PkId`),
  ADD KEY `FkUsuario` (`FkUsuario`),
  ADD KEY `FkLibros` (`FkLibros`),
  ADD KEY `FkEstado` (`FkEstado`);

--
-- Indices de la tabla `tblusuarios`
--
ALTER TABLE `tblusuarios`
  ADD PRIMARY KEY (`PkCarnet`),
  ADD KEY `FkPrestamos` (`FkPrestamos`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tblautor`
--
ALTER TABLE `tblautor`
  MODIFY `PkId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbllibros`
--
ALTER TABLE `tbllibros`
  MODIFY `PkCodiigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tblprestamos`
--
ALTER TABLE `tblprestamos`
  MODIFY `PkId` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbldet_autor_libros`
--
ALTER TABLE `tbldet_autor_libros`
  ADD CONSTRAINT `tbldet_autor_libros_ibfk_1` FOREIGN KEY (`FkAutor`) REFERENCES `tblautor` (`PkId`),
  ADD CONSTRAINT `tbldet_autor_libros_ibfk_2` FOREIGN KEY (`FkLibro`) REFERENCES `tbllibros` (`PkCodiigo`);

--
-- Filtros para la tabla `tbllibros`
--
ALTER TABLE `tbllibros`
  ADD CONSTRAINT `tbllibros_ibfk_1` FOREIGN KEY (`FkDet_Autor_Libros`) REFERENCES `tbldet_autor_libros` (`PkId`),
  ADD CONSTRAINT `tbllibros_ibfk_2` FOREIGN KEY (`FkClase`) REFERENCES `tblclase` (`PkId`),
  ADD CONSTRAINT `tbllibros_ibfk_3` FOREIGN KEY (`FkEstado`) REFERENCES `tblestado` (`PkId`),
  ADD CONSTRAINT `tbllibros_ibfk_4` FOREIGN KEY (`FkEditorial`) REFERENCES `tbleditorial` (`PkId`);

--
-- Filtros para la tabla `tblprestamos`
--
ALTER TABLE `tblprestamos`
  ADD CONSTRAINT `tblprestamos_ibfk_1` FOREIGN KEY (`FkUsuario`) REFERENCES `tblusuarios` (`PkCarnet`),
  ADD CONSTRAINT `tblprestamos_ibfk_2` FOREIGN KEY (`FkLibros`) REFERENCES `tbllibros` (`PkCodiigo`),
  ADD CONSTRAINT `tblprestamos_ibfk_3` FOREIGN KEY (`FkEstado`) REFERENCES `tblestado` (`PkId`);

--
-- Filtros para la tabla `tblusuarios`
--
ALTER TABLE `tblusuarios`
  ADD CONSTRAINT `tblusuarios_ibfk_1` FOREIGN KEY (`FkPrestamos`) REFERENCES `tblprestamos` (`PkId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
