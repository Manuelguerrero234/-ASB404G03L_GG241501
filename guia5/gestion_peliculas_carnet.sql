-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-04-2025 a las 18:37:52
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
-- Base de datos: `gestion_peliculas_carnet`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actores`
--

CREATE TABLE `actores` (
  `codigo_actor` char(5) NOT NULL,
  `primer_nombre` varchar(50) NOT NULL,
  `primer_apellido` varchar(50) NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `nacionalidad` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `actores`
--

INSERT INTO `actores` (`codigo_actor`, `primer_nombre`, `primer_apellido`, `fecha_nacimiento`, `nacionalidad`) VALUES
('A001', 'Matthew', 'McConaughey', '1969-11-04', 'Estadounidense'),
('A002', 'Ivana', 'Baquero', '1994-06-11', 'Española'),
('A003', 'Liam', 'Neeson', '1952-06-07', 'Irlandés');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_actores_peliculas`
--

CREATE TABLE `detalle_actores_peliculas` (
  `codigo_actor` char(5) NOT NULL,
  `codigo_pelicula` char(10) NOT NULL,
  `personaje` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_actores_peliculas`
--

INSERT INTO `detalle_actores_peliculas` (`codigo_actor`, `codigo_pelicula`, `personaje`) VALUES
('A001', 'P001', 'Cooper'),
('A002', 'P002', 'Ofelia'),
('A003', 'P003', 'Oskar Schindler');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `directores`
--

CREATE TABLE `directores` (
  `codigo_director` char(5) NOT NULL,
  `primer_nombre` varchar(50) NOT NULL,
  `primer_apellido` varchar(50) NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `nacionalidad` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `directores`
--

INSERT INTO `directores` (`codigo_director`, `primer_nombre`, `primer_apellido`, `fecha_nacimiento`, `nacionalidad`) VALUES
('D001', 'Steven', 'Spielberg', '1946-12-18', 'Estadounidense'),
('D002', 'Christopher', 'Nolan', '1970-07-30', 'Británico'),
('D003', 'Guillermo', 'del Toro', '1964-10-09', 'Mexicano');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `generos`
--

CREATE TABLE `generos` (
  `codigo_genero` char(5) NOT NULL,
  `nombre_genero` varchar(50) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `generos`
--

INSERT INTO `generos` (`codigo_genero`, `nombre_genero`, `descripcion`) VALUES
('G001', 'Ciencia Ficción', 'Películas sobre tecnología futurista y espacio'),
('G002', 'Drama', 'Películas con contenido emocional intenso'),
('G003', 'Fantasía', 'Películas con elementos mágicos o sobrenaturales');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `peliculas`
--

CREATE TABLE `peliculas` (
  `codigo_pelicula` char(10) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `año_estreno` char(4) DEFAULT NULL,
  `duracion` int(11) DEFAULT NULL,
  `codigo_genero` char(5) DEFAULT NULL,
  `codigo_director` char(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `peliculas`
--

INSERT INTO `peliculas` (`codigo_pelicula`, `titulo`, `año_estreno`, `duracion`, `codigo_genero`, `codigo_director`) VALUES
('P001', 'Interestelar', '2014', 169, 'G001', 'D002'),
('P002', 'El Laberinto del Fauno', '2006', 118, 'G003', 'D003'),
('P003', 'La Lista de Schindler', '1993', 195, 'G002', 'D001');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actores`
--
ALTER TABLE `actores`
  ADD PRIMARY KEY (`codigo_actor`);

--
-- Indices de la tabla `detalle_actores_peliculas`
--
ALTER TABLE `detalle_actores_peliculas`
  ADD PRIMARY KEY (`codigo_actor`,`codigo_pelicula`),
  ADD KEY `codigo_pelicula` (`codigo_pelicula`);

--
-- Indices de la tabla `directores`
--
ALTER TABLE `directores`
  ADD PRIMARY KEY (`codigo_director`);

--
-- Indices de la tabla `generos`
--
ALTER TABLE `generos`
  ADD PRIMARY KEY (`codigo_genero`);

--
-- Indices de la tabla `peliculas`
--
ALTER TABLE `peliculas`
  ADD PRIMARY KEY (`codigo_pelicula`),
  ADD KEY `codigo_genero` (`codigo_genero`),
  ADD KEY `codigo_director` (`codigo_director`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_actores_peliculas`
--
ALTER TABLE `detalle_actores_peliculas`
  ADD CONSTRAINT `detalle_actores_peliculas_ibfk_1` FOREIGN KEY (`codigo_actor`) REFERENCES `actores` (`codigo_actor`),
  ADD CONSTRAINT `detalle_actores_peliculas_ibfk_2` FOREIGN KEY (`codigo_pelicula`) REFERENCES `peliculas` (`codigo_pelicula`);

--
-- Filtros para la tabla `peliculas`
--
ALTER TABLE `peliculas`
  ADD CONSTRAINT `peliculas_ibfk_1` FOREIGN KEY (`codigo_genero`) REFERENCES `generos` (`codigo_genero`),
  ADD CONSTRAINT `peliculas_ibfk_2` FOREIGN KEY (`codigo_director`) REFERENCES `directores` (`codigo_director`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
