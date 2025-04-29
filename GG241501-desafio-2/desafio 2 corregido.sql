-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-04-2025 a las 22:47:23
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
-- Base de datos: `sakila`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vista_ganancias_pelicula_tienda`
--

CREATE TABLE `vista_ganancias_pelicula_tienda` (
  `store_id` tinyint(3) UNSIGNED DEFAULT NULL,
  `film_id` smallint(5) UNSIGNED DEFAULT NULL,
  `nombre_pelicula` varchar(128) DEFAULT NULL,
  `tienda_ubicacion` varchar(102) DEFAULT NULL,
  `total_ganancias` decimal(27,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vista_peliculas_info`
--

CREATE TABLE `vista_peliculas_info` (
  `film_id` smallint(5) UNSIGNED DEFAULT NULL,
  `nombre_pelicula` varchar(128) DEFAULT NULL,
  `actores` mediumtext DEFAULT NULL,
  `categorias` mediumtext DEFAULT NULL,
  `ubicacion_tienda` varchar(102) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
