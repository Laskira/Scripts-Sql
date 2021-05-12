-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-07-2019 a las 19:48:23
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
-- Base de datos: `dblaboratiorio1`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblcopia_articulo`
--

CREATE TABLE `tblcopia_articulo` (
  `id_cop_art` int(11) NOT NULL,
  `tit_cop_art` varchar(100) DEFAULT NULL,
  `aut_cop_art` varchar(100) DEFAULT NULL,
  `edi_cop_art` varchar(300) DEFAULT NULL,
  `prec_cop_art` int(11) DEFAULT NULL,
  `fecha_create_cop_art` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tblcopia_articulo`
--

INSERT INTO `tblcopia_articulo` (`id_cop_art`, `tit_cop_art`, `aut_cop_art`, `edi_cop_art`, `prec_cop_art`, `fecha_create_cop_art`) VALUES
(5, 'PHP básico', 'Pepito Perez', 'Rama', 40000, '2019-05-28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_articulo`
--

CREATE TABLE `tbl_articulo` (
  `id_art` int(11) NOT NULL,
  `tit_art` varchar(100) DEFAULT NULL,
  `aut_art` varchar(100) DEFAULT NULL,
  `edi_art` varchar(300) DEFAULT NULL,
  `prec_art` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbl_articulo`
--

INSERT INTO `tbl_articulo` (`id_art`, `tit_art`, `aut_art`, `edi_art`, `prec_art`) VALUES
(1, 'Redes cisco', 'Ernesto Arigasello', 'Alfaomega - Rama', 60000),
(2, 'Facebook y twiter para adultos', 'Veloso Claudio', 'Alfaomega', 52000),
(3, 'Creacion de un portal con php y mysql', 'Jacobo Gómez Lopez', 'Alfaomega - Rama', 40000),
(4, 'Administración de sistemas operativos', 'Julio Gómez Lopez', 'Alfaomega - Rama', 55000),
(5, 'PHP básico', 'Pepito Perez', 'Rama', 40000);

--
-- Disparadores `tbl_articulo`
--
DELIMITER $$
CREATE TRIGGER `tblcopia_articulo` AFTER INSERT ON `tbl_articulo` FOR EACH ROW INSERT INTO tblcopia_articulo(id_cop_art, tit_cop_art, aut_cop_art, edi_cop_art, prec_cop_art, fecha_create_cop_art) VALUES (new.id_art, new.tit_art, new.aut_art, new.edi_art, new.prec_art, now())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_articuloxpedido`
--

CREATE TABLE `tbl_articuloxpedido` (
  `id_art_ped` int(11) NOT NULL,
  `id_ped_artped` int(11) DEFAULT NULL,
  `can_art_artped` int(11) DEFAULT NULL,
  `val_ven_art_artped` int(11) DEFAULT NULL,
  `id_art_artped` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbl_articuloxpedido`
--

INSERT INTO `tbl_articuloxpedido` (`id_art_ped`, `id_ped_artped`, `can_art_artped`, `val_ven_art_artped`, `id_art_artped`) VALUES
(1, 1, 5, 40000, 3),
(2, 1, 12, 55000, 4),
(3, 1, 5, 65000, 1),
(4, 2, 10, 55000, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_aseguramientos`
--

CREATE TABLE `tbl_aseguramientos` (
  `asecodigo` int(11) NOT NULL,
  `asefechainicio` datetime DEFAULT NULL,
  `asefechaexpiracio` datetime DEFAULT NULL,
  `asevalorasegurado` int(11) DEFAULT NULL,
  `asecosto` int(11) DEFAULT NULL,
  `aseplaca` varchar(20) DEFAULT NULL,
  `aseestado` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbl_aseguramientos`
--

INSERT INTO `tbl_aseguramientos` (`asecodigo`, `asefechainicio`, `asefechaexpiracio`, `asevalorasegurado`, `asecosto`, `aseplaca`, `aseestado`) VALUES
(1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 30000000, 500000, 'FLL420', 'Vigente'),
(2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 35000000, 600000, 'DKZ820', 'Vigente'),
(3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5000000, 800000, 'DKZ820', 'Vencido');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_automotores`
--

CREATE TABLE `tbl_automotores` (
  `autoplaca` varchar(6) NOT NULL,
  `automarca` varchar(30) NOT NULL,
  `autotipo` int(11) NOT NULL,
  `automodelo` int(11) NOT NULL,
  `autonumpasajeros` int(11) NOT NULL,
  `autocilindraje` int(11) DEFAULT NULL,
  `autonumchasis` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbl_automotores`
--

INSERT INTO `tbl_automotores` (`autoplaca`, `automarca`, `autotipo`, `automodelo`, `autonumpasajeros`, `autocilindraje`, `autonumchasis`) VALUES
('DKZ820', 'Renault Stepway', 1, 2008, 5, 1600, 'wywzzz157kk009d45'),
('FLL420', 'Chevrolet corsa', 1, 2003, 5, 1400, 'wywzzz167kk009d25'),
('KJQ920', 'Kia Sportage', 2, 2009, 7, 2000, 'wywzzz157kk009d45');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_cliente`
--

CREATE TABLE `tbl_cliente` (
  `id_cli` varchar(11) NOT NULL,
  `nom_cli` varchar(30) NOT NULL,
  `ape_cli` varchar(30) NOT NULL,
  `dir_cli` varchar(100) DEFAULT NULL,
  `dep_cli` varchar(20) DEFAULT NULL,
  `mes_cum_cli` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbl_cliente`
--

INSERT INTO `tbl_cliente` (`id_cli`, `nom_cli`, `ape_cli`, `dir_cli`, `dep_cli`, `mes_cum_cli`) VALUES
('1098765789', 'Catalina', 'Zapata', 'Av el Libertador No.30-14', 'Cauca', 'Marzo'),
('13890234', 'Roger', 'Ariza', 'Cra 30 No.13-45', 'Antioquia', 'Junio'),
('63502718', 'Maritza', 'Rojas', 'Calle 34 No.14-45', 'Santander', 'Abril'),
('77191956', 'Juan Carlos', 'Arenas', 'Diagonal 23 No.12-34 apto 101', 'Valle', 'Marzo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_compañia`
--

CREATE TABLE `tbl_compañia` (
  `comnit` varchar(11) NOT NULL,
  `comnombre` varchar(30) DEFAULT NULL,
  `comañofun` int(11) DEFAULT NULL,
  `comreplegal` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbl_compañia`
--

INSERT INTO `tbl_compañia` (`comnit`, `comnombre`, `comañofun`, `comreplegal`) VALUES
('800890890-2', 'Seguros Atlantida', 1998, 'Carlos Lopez'),
('899999999-1', 'Aseguradora Rojas', 1991, 'Luis Fernando Rojas'),
('899999999-5', 'Seguros del Estadio', 2001, 'Maria Margarita Perez');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_copia_profesor`
--

CREATE TABLE `tbl_copia_profesor` (
  `doc_cod_prof` varchar(11) NOT NULL,
  `nom_cod_prof` varchar(30) DEFAULT NULL,
  `ape_cop_prof` varchar(30) DEFAULT NULL,
  `cate_cop_prof` int(11) DEFAULT NULL,
  `sal_cop_prof` int(11) DEFAULT NULL,
  `fecha_create_cop_prof` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_curso`
--

CREATE TABLE `tbl_curso` (
  `cod_cur` int(11) NOT NULL,
  `nom_curs` varchar(100) NOT NULL,
  `horas_curs` int(11) DEFAULT NULL,
  `valor_curs` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbl_curso`
--

INSERT INTO `tbl_curso` (`cod_cur`, `nom_curs`, `horas_curs`, `valor_curs`) VALUES
(149842, 'Fundamentos de Bases de datos', 40, 500000),
(250067, 'Fundamentos de SQL', 20, 700000),
(289011, 'Manejo de Mysql', 45, 550000),
(345671, 'Fundamentos of Oracle', 60, 3000000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_estudiante`
--

CREATE TABLE `tbl_estudiante` (
  `doc_est` int(11) NOT NULL,
  `nom_est` varchar(30) NOT NULL,
  `ape_est` varchar(30) NOT NULL,
  `edad_est` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbl_estudiante`
--

INSERT INTO `tbl_estudiante` (`doc_est`, `nom_est`, `ape_est`, `edad_est`) VALUES
(63502720, 'Maria', 'Perez', 23),
(91245678, 'Carlos José', 'Lopez', 25),
(1098098097, 'Jonatan', 'Ardilla', 17),
(1098765678, 'Carlos', 'Martinez', 19);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_estudiantesxcurso`
--

CREATE TABLE `tbl_estudiantesxcurso` (
  `id_est_curso` int(11) NOT NULL,
  `cod_cur_estcur` int(11) DEFAULT NULL,
  `fec_ini_estcur` date DEFAULT NULL,
  `doc_est_estcur` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbl_estudiantesxcurso`
--

INSERT INTO `tbl_estudiantesxcurso` (`id_est_curso`, `cod_cur_estcur`, `fec_ini_estcur`, `doc_est_estcur`) VALUES
(1, 289011, '0000-00-00', 1098765678),
(2, 250067, '0000-00-00', 63502720),
(3, 289011, '0000-00-00', 1098098097),
(4, 345671, '0000-00-00', 63502720);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_incidentes`
--

CREATE TABLE `tbl_incidentes` (
  `incicodigo` int(11) NOT NULL,
  `incifecha` date DEFAULT NULL,
  `inciplaca` varchar(6) NOT NULL,
  `incilugar` varchar(40) NOT NULL,
  `incicanheridos` int(11) DEFAULT NULL,
  `incifatalidades` int(11) DEFAULT NULL,
  `incicanautosinvolucrados` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbl_incidentes`
--

INSERT INTO `tbl_incidentes` (`incicodigo`, `incifecha`, `inciplaca`, `incilugar`, `incicanheridos`, `incifatalidades`, `incicanautosinvolucrados`) VALUES
(1, '0000-00-00', 'DKZ820', 'Bucaramanga', 0, 0, 2),
(2, '0000-00-00', 'FLL420', 'Girón', 1, 0, 1),
(3, '0000-00-00', 'FLL420', 'Bucaramanga', 1, 0, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_pedido`
--

CREATE TABLE `tbl_pedido` (
  `id_ped` int(11) NOT NULL,
  `id_cli_ped` varchar(11) NOT NULL,
  `fec_ped` date DEFAULT NULL,
  `val_ped` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbl_pedido`
--

INSERT INTO `tbl_pedido` (`id_ped`, `id_cli_ped`, `fec_ped`, `val_ped`) VALUES
(1, '63502718', '2012-02-25', 120000),
(2, '77191956', '2012-04-30', 55000),
(3, '63502718', '2011-12-10', 260000),
(4, '1098765789', '2012-02-25', 1800000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_profesor`
--

CREATE TABLE `tbl_profesor` (
  `doc_prof` varchar(11) NOT NULL,
  `nom_prof` varchar(30) NOT NULL,
  `ape_prof` varchar(30) NOT NULL,
  `cate_prof` int(11) DEFAULT NULL,
  `sal_prof` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbl_profesor`
--

INSERT INTO `tbl_profesor` (`doc_prof`, `nom_prof`, `ape_prof`, `cate_prof`, `sal_prof`) VALUES
('1098765789', 'Alejandra', 'Torres', 4, 1100000),
('13.826.789', 'Maritza', 'Angarita', 1, 550000),
('63.502.720', 'Martha', 'Rojas', 2, 690000),
('91.216.904', 'Carlos', 'Perez', 3, 950000);

--
-- Disparadores `tbl_profesor`
--
DELIMITER $$
CREATE TRIGGER `tblcopia_profesor` AFTER INSERT ON `tbl_profesor` FOR EACH ROW insert into tblcopia_profesor(doc_cod_prof, nom_cod_prof, ape_cop_prof, cate_cop_prof, sal_cop_prof, fecha_create_cop_prof) VALUES (new.doc_prof, new.nom_prof, new.ape_prof, new.cate_prof, new.sal_prof,now())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_tipoautomotores`
--

CREATE TABLE `tbl_tipoautomotores` (
  `autotipo` int(11) NOT NULL,
  `autnombre` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbl_tipoautomotores`
--

INSERT INTO `tbl_tipoautomotores` (`autotipo`, `autnombre`) VALUES
(1, 'Automóviles'),
(2, 'Camperos'),
(3, 'Camiones');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tblcopia_articulo`
--
ALTER TABLE `tblcopia_articulo`
  ADD PRIMARY KEY (`id_cop_art`);

--
-- Indices de la tabla `tbl_articulo`
--
ALTER TABLE `tbl_articulo`
  ADD PRIMARY KEY (`id_art`),
  ADD KEY `id_art` (`id_art`);

--
-- Indices de la tabla `tbl_articuloxpedido`
--
ALTER TABLE `tbl_articuloxpedido`
  ADD PRIMARY KEY (`id_art_ped`),
  ADD KEY `id_art_artped` (`id_art_artped`),
  ADD KEY `id_ped_artped` (`id_ped_artped`);

--
-- Indices de la tabla `tbl_aseguramientos`
--
ALTER TABLE `tbl_aseguramientos`
  ADD PRIMARY KEY (`asecodigo`),
  ADD KEY `aseplaca` (`aseplaca`);

--
-- Indices de la tabla `tbl_automotores`
--
ALTER TABLE `tbl_automotores`
  ADD PRIMARY KEY (`autoplaca`),
  ADD KEY `autotipo` (`autotipo`),
  ADD KEY `autoplaca` (`autoplaca`),
  ADD KEY `autoplaca_2` (`autoplaca`);

--
-- Indices de la tabla `tbl_cliente`
--
ALTER TABLE `tbl_cliente`
  ADD PRIMARY KEY (`id_cli`),
  ADD KEY `id_cli_2` (`id_cli`),
  ADD KEY `id_cli` (`id_cli`);

--
-- Indices de la tabla `tbl_compañia`
--
ALTER TABLE `tbl_compañia`
  ADD PRIMARY KEY (`comnit`);

--
-- Indices de la tabla `tbl_copia_profesor`
--
ALTER TABLE `tbl_copia_profesor`
  ADD PRIMARY KEY (`doc_cod_prof`);

--
-- Indices de la tabla `tbl_curso`
--
ALTER TABLE `tbl_curso`
  ADD PRIMARY KEY (`cod_cur`),
  ADD KEY `cod_cur` (`cod_cur`);

--
-- Indices de la tabla `tbl_estudiante`
--
ALTER TABLE `tbl_estudiante`
  ADD PRIMARY KEY (`doc_est`),
  ADD KEY `doc_est` (`doc_est`);

--
-- Indices de la tabla `tbl_estudiantesxcurso`
--
ALTER TABLE `tbl_estudiantesxcurso`
  ADD PRIMARY KEY (`id_est_curso`),
  ADD KEY `cod_cur_estcur` (`cod_cur_estcur`),
  ADD KEY `doc_est_estcur` (`doc_est_estcur`);

--
-- Indices de la tabla `tbl_incidentes`
--
ALTER TABLE `tbl_incidentes`
  ADD PRIMARY KEY (`incicodigo`),
  ADD KEY `inciplaca` (`inciplaca`);

--
-- Indices de la tabla `tbl_pedido`
--
ALTER TABLE `tbl_pedido`
  ADD PRIMARY KEY (`id_ped`),
  ADD KEY `id_cli_ped` (`id_cli_ped`),
  ADD KEY `id_ped` (`id_ped`);

--
-- Indices de la tabla `tbl_profesor`
--
ALTER TABLE `tbl_profesor`
  ADD PRIMARY KEY (`doc_prof`);

--
-- Indices de la tabla `tbl_tipoautomotores`
--
ALTER TABLE `tbl_tipoautomotores`
  ADD PRIMARY KEY (`autotipo`),
  ADD KEY `autotipo` (`autotipo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbl_estudiantesxcurso`
--
ALTER TABLE `tbl_estudiantesxcurso`
  MODIFY `id_est_curso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbl_articuloxpedido`
--
ALTER TABLE `tbl_articuloxpedido`
  ADD CONSTRAINT `tbl_articuloxpedido_ibfk_1` FOREIGN KEY (`id_art_artped`) REFERENCES `tbl_articulo` (`id_art`),
  ADD CONSTRAINT `tbl_articuloxpedido_ibfk_2` FOREIGN KEY (`id_ped_artped`) REFERENCES `tbl_pedido` (`id_ped`);

--
-- Filtros para la tabla `tbl_aseguramientos`
--
ALTER TABLE `tbl_aseguramientos`
  ADD CONSTRAINT `tbl_aseguramientos_ibfk_1` FOREIGN KEY (`aseplaca`) REFERENCES `tbl_automotores` (`autoplaca`);

--
-- Filtros para la tabla `tbl_automotores`
--
ALTER TABLE `tbl_automotores`
  ADD CONSTRAINT `tbl_automotores_ibfk_1` FOREIGN KEY (`autotipo`) REFERENCES `tbl_tipoautomotores` (`autotipo`);

--
-- Filtros para la tabla `tbl_estudiantesxcurso`
--
ALTER TABLE `tbl_estudiantesxcurso`
  ADD CONSTRAINT `tbl_estudiantesxcurso_ibfk_1` FOREIGN KEY (`doc_est_estcur`) REFERENCES `tbl_estudiante` (`doc_est`),
  ADD CONSTRAINT `tbl_estudiantesxcurso_ibfk_2` FOREIGN KEY (`cod_cur_estcur`) REFERENCES `tbl_curso` (`cod_cur`);

--
-- Filtros para la tabla `tbl_incidentes`
--
ALTER TABLE `tbl_incidentes`
  ADD CONSTRAINT `tbl_incidentes_ibfk_1` FOREIGN KEY (`inciplaca`) REFERENCES `tbl_automotores` (`autoplaca`);

--
-- Filtros para la tabla `tbl_pedido`
--
ALTER TABLE `tbl_pedido`
  ADD CONSTRAINT `tbl_pedido_ibfk_1` FOREIGN KEY (`id_cli_ped`) REFERENCES `tbl_cliente` (`id_cli`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
