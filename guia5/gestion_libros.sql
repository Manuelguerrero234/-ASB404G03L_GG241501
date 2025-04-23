-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-04-2025 a las 18:37:20
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `gestion_libros`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autor`
--

CREATE TABLE `autor` (
  `codigo_autor` char(5) NOT NULL,
  `primer_nombre` varchar(50) DEFAULT NULL,
  `primer_apellido` varchar(50) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `nacionalidad` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `autor`
--

INSERT INTO `autor` (`codigo_autor`, `primer_nombre`, `primer_apellido`, `fecha_nacimiento`, `nacionalidad`) VALUES
('ASB02', 'ALEJANDRO', 'MELENDEZ', '2025-03-07', 'EL SALVADOR'),
('ASBO0', 'MIGUEL', 'MELENDEZ', '2025-03-04', 'EL SALVADOR');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_autor_libro`
--

CREATE TABLE `detalle_autor_libro` (
  `codigo_autor` char(5) NOT NULL,
  `codigo_libro` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `editorial`
--

CREATE TABLE `editorial` (
  `codigo_editorial` char(5) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `pais` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

CREATE TABLE `libros` (
  `codigo_libro` char(10) NOT NULL,
  `tulo` varchar(50) DEFAULT NULL,
  `isbn` varchar(20) DEFAULT NULL,
  `edicion` char(4) DEFAULT NULL,
  `codigo_editorial` char(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `autor`
--
ALTER TABLE `autor`
  ADD PRIMARY KEY (`codigo_autor`);

--
-- Indices de la tabla `detalle_autor_libro`
--
ALTER TABLE `detalle_autor_libro`
  ADD PRIMARY KEY (`codigo_autor`,`codigo_libro`),
  ADD KEY `codigo_libro` (`codigo_libro`);

--
-- Indices de la tabla `editorial`
--
ALTER TABLE `editorial`
  ADD PRIMARY KEY (`codigo_editorial`);

--
-- Indices de la tabla `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`codigo_libro`),
  ADD KEY `codigo_editorial` (`codigo_editorial`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_autor_libro`
--
ALTER TABLE `detalle_autor_libro`
  ADD CONSTRAINT `detalle_autor_libro_ibfk_1` FOREIGN KEY (`codigo_autor`) REFERENCES `autor` (`codigo_autor`),
  ADD CONSTRAINT `detalle_autor_libro_ibfk_2` FOREIGN KEY (`codigo_libro`) REFERENCES `libros` (`codigo_libro`);

--
-- Filtros para la tabla `libros`
--
ALTER TABLE `libros`
  ADD CONSTRAINT `libros_ibfk_1` FOREIGN KEY (`codigo_editorial`) REFERENCES `editorial` (`codigo_editorial`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
