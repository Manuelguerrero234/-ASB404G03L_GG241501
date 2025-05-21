-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-05-2025 a las 14:52:59
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
-- Estructura Stand-in para la vista `vista_ganancias_pelicula_tienda`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_ganancias_pelicula_tienda` (
`store_id` tinyint(3) unsigned
,`film_id` smallint(5) unsigned
,`nombre_pelicula` varchar(128)
,`tienda_ubicacion` varchar(102)
,`total_ganancias` decimal(27,2)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_peliculas_info`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_peliculas_info` (
`film_id` smallint(5) unsigned
,`nombre_pelicula` varchar(128)
,`actores` mediumtext
,`categorias` mediumtext
,`tienda_ubicacion` varchar(102)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_ganancias_pelicula_tienda`
--
DROP TABLE IF EXISTS `vista_ganancias_pelicula_tienda`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_ganancias_pelicula_tienda`  AS SELECT `s`.`store_id` AS `store_id`, `f`.`film_id` AS `film_id`, `f`.`title` AS `nombre_pelicula`, concat(`ci`.`city`,', ',`co`.`country`) AS `tienda_ubicacion`, sum(`p`.`amount`) AS `total_ganancias` FROM (((((((`payment` `p` join `rental` `r` on(`p`.`rental_id` = `r`.`rental_id`)) join `inventory` `i` on(`r`.`inventory_id` = `i`.`inventory_id`)) join `film` `f` on(`i`.`film_id` = `f`.`film_id`)) join `store` `s` on(`i`.`store_id` = `s`.`store_id`)) join `address` `a` on(`s`.`address_id` = `a`.`address_id`)) join `city` `ci` on(`a`.`city_id` = `ci`.`city_id`)) join `country` `co` on(`ci`.`country_id` = `co`.`country_id`)) GROUP BY `s`.`store_id`, `f`.`film_id` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_peliculas_info`
--
DROP TABLE IF EXISTS `vista_peliculas_info`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_peliculas_info`  AS SELECT `f`.`film_id` AS `film_id`, `f`.`title` AS `nombre_pelicula`, group_concat(distinct concat(`a`.`first_name`,' ',`a`.`last_name`) separator ', ') AS `actores`, group_concat(distinct `c`.`name` separator ', ') AS `categorias`, concat(`ci`.`city`,', ',`co`.`country`) AS `tienda_ubicacion` FROM (((((((((`film` `f` join `film_actor` `fa` on(`f`.`film_id` = `fa`.`film_id`)) join `actor` `a` on(`fa`.`actor_id` = `a`.`actor_id`)) join `film_category` `fc` on(`f`.`film_id` = `fc`.`film_id`)) join `category` `c` on(`fc`.`category_id` = `c`.`category_id`)) join `inventory` `i` on(`i`.`film_id` = `f`.`film_id`)) join `store` `s` on(`i`.`store_id` = `s`.`store_id`)) join `address` `addr` on(`s`.`address_id` = `addr`.`address_id`)) join `city` `ci` on(`addr`.`city_id` = `ci`.`city_id`)) join `country` `co` on(`ci`.`country_id` = `co`.`country_id`)) GROUP BY `f`.`film_id`, `s`.`store_id` ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
