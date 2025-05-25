-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-05-2025 a las 14:21:52
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
-- Base de datos: `sistemaadopcionmascotas`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `Registrar_Adopcion` (IN `p_id_mascota` INT, IN `p_id_adoptante` INT, IN `p_id_empleado` INT)   BEGIN
    -- Registrar la adopción
    INSERT INTO Adopciones (id_mascota, id_adoptante, id_empleado, fecha_adopcion)
    VALUES (p_id_mascota, p_id_adoptante, p_id_empleado, CURDATE());
    
    -- Actualizar estado de la mascota a "Adoptada"
    UPDATE Mascotas 
    SET estado_adopcion = 'Adoptada' 
    WHERE id_mascota = p_id_mascota;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `adopciones`
--

CREATE TABLE `adopciones` (
  `id_adopcion` int(11) NOT NULL,
  `id_mascota` int(11) DEFAULT NULL,
  `id_adoptante` int(11) DEFAULT NULL,
  `id_empleado` int(11) DEFAULT NULL,
  `fecha_adopcion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `adopciones`
--

INSERT INTO `adopciones` (`id_adopcion`, `id_mascota`, `id_adoptante`, `id_empleado`, `fecha_adopcion`) VALUES
(1, 5, 1, 1, '2024-01-20'),
(2, 9, 3, 2, '2024-02-10'),
(3, 14, 5, 3, '2024-03-05'),
(4, 20, 7, 4, '2024-03-15'),
(5, 4, 2, 1, '2024-02-28'),
(6, 15, 4, 2, '2024-03-10'),
(7, 19, 6, 3, '2024-03-12'),
(8, 12, 8, 4, '2024-03-18');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `adopciones_completas`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `adopciones_completas` (
`adoptante` varchar(100)
,`mascota` varchar(50)
,`especie` varchar(20)
,`raza` varchar(30)
,`fecha_adopcion` date
,`empleado_responsable` varchar(100)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `adoptantes`
--

CREATE TABLE `adoptantes` (
  `id_adoptante` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `fecha_registro` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `adoptantes`
--

INSERT INTO `adoptantes` (`id_adoptante`, `nombre`, `direccion`, `telefono`, `email`, `fecha_registro`) VALUES
(1, 'Ana López', 'San Salvador, Colonia Escalón', '+50378945612', 'ana.lopez@email.com', '2024-01-10'),
(2, 'Carlos Martínez', 'Santa Tecla, Urbanización Las Flores', '+50365412378', 'carlos.m@email.com', '2024-02-05'),
(3, 'María García', 'Soyapango, Residencial Los Pinos', '+50371234567', 'maria.g@email.com', '2024-01-20'),
(4, 'Juan Pérez', 'San Miguel, Colonia Centro', '+50362345678', 'juan.perez@email.com', '2024-02-15'),
(5, 'Lucía Ramírez', 'Apopa, Barrio El Calvario', '+50379876543', 'lucia.r@email.com', '2024-03-01'),
(6, 'Pedro Sánchez', 'Mejicanos, Colonia San Roque', '+50361234567', 'pedro.s@email.com', '2024-01-25'),
(7, 'Sofía Hernández', 'Ilopango, Residencial Las Palmas', '+50374561234', 'sofia.h@email.com', '2024-02-20'),
(8, 'José González', 'Ciudad Delgado, Urbanización Montebello', '+50367891234', 'jose.g@email.com', '2024-03-10'),
(9, 'Elena Castro', 'Antiguo Cuscatlán, Colonia La Sultana', '+50371239876', 'elena.c@email.com', '2024-01-15'),
(10, 'Daniel Vásquez', 'San Marcos, Barrio San José', '+50364567890', 'daniel.v@email.com', '2024-02-28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `controles_postadopcion`
--

CREATE TABLE `controles_postadopcion` (
  `id_control` int(11) NOT NULL,
  `id_adopcion` int(11) DEFAULT NULL,
  `fecha_control` date DEFAULT NULL,
  `resultado` enum('Exitoso','Fallido') DEFAULT NULL,
  `observaciones` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `controles_postadopcion`
--

INSERT INTO `controles_postadopcion` (`id_control`, `id_adopcion`, `fecha_control`, `resultado`, `observaciones`) VALUES
(1, 1, '2024-02-20', 'Exitoso', 'La mascota se adaptó bien al hogar.'),
(2, 2, '2024-03-10', 'Exitoso', 'El adoptante sigue las recomendaciones veterinarias.'),
(3, 3, '2024-04-05', 'Fallido', 'La mascota presenta estrés por cambio de ambiente.'),
(4, 4, '2024-04-15', 'Exitoso', 'Todo en orden, mascota saludable.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `id_empleado` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `cargo` varchar(50) DEFAULT NULL,
  `fecha_contratacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id_empleado`, `nombre`, `cargo`, `fecha_contratacion`) VALUES
(1, 'Roberto Mendoza', 'Coordinador de Adopciones', '2023-01-15'),
(2, 'Laura Jiménez', 'Veterinario', '2023-05-20'),
(3, 'Mario Rodríguez', 'Asistente Administrativo', '2023-03-10'),
(4, 'Karla Gómez', 'Encargado de Seguimiento', '2023-07-05'),
(5, 'Fernando Torres', 'Voluntario', '2023-09-12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mascotas`
--

CREATE TABLE `mascotas` (
  `id_mascota` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `especie` varchar(20) NOT NULL,
  `raza` varchar(30) DEFAULT NULL,
  `edad` int(11) DEFAULT NULL,
  `estado_salud` varchar(50) DEFAULT NULL,
  `estado_adopcion` enum('Disponible','Adoptada') DEFAULT 'Disponible',
  `fecha_ingreso` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `mascotas`
--

INSERT INTO `mascotas` (`id_mascota`, `nombre`, `especie`, `raza`, `edad`, `estado_salud`, `estado_adopcion`, `fecha_ingreso`) VALUES
(1, 'Max', 'Perro', 'Labrador', 3, 'Sano', 'Disponible', '2024-01-15'),
(2, 'Luna', 'Gato', 'Siamés', 2, 'Sano', 'Disponible', '2024-02-20'),
(3, 'Rocky', 'Perro', 'Bulldog', 5, 'Problemas respiratorios', 'Disponible', '2024-03-10'),
(4, 'Milo', 'Perro', 'Golden Retriever', 1, 'Sano', 'Disponible', '2024-01-05'),
(5, 'Bella', 'Gato', 'Persa', 4, 'Sano', 'Adoptada', '2023-12-01'),
(6, 'Toby', 'Perro', 'Beagle', 2, 'Alergias', 'Disponible', '2024-02-15'),
(7, 'Lola', 'Perro', 'Chihuahua', 6, 'Problemas dentales', 'Disponible', '2024-03-01'),
(8, 'Simba', 'Gato', 'Mestizo', 1, 'Sano', 'Disponible', '2024-01-20'),
(9, 'Thor', 'Perro', 'Husky', 3, 'Sano', 'Adoptada', '2023-11-10'),
(10, 'Nala', 'Gato', 'Bengalí', 2, 'Sano', 'Disponible', '2024-02-05'),
(11, 'Bruno', 'Perro', 'Dálmata', 4, 'Sano', 'Disponible', '2024-03-15'),
(12, 'Lucky', 'Perro', 'Poodle', 5, 'Problemas articulares', 'Disponible', '2024-01-30'),
(13, 'Mia', 'Gato', 'Mestizo', 1, 'Sano', 'Disponible', '2024-02-10'),
(14, 'Rex', 'Perro', 'Pastor Alemán', 2, 'Sano', 'Adoptada', '2023-12-20'),
(15, 'Coco', 'Perro', 'Boxer', 3, 'Sano', 'Disponible', '2024-03-05'),
(16, 'Oliver', 'Gato', 'Angora', 4, 'Problemas renales', 'Disponible', '2024-01-25'),
(17, 'Zeus', 'Perro', 'Rottweiler', 5, 'Sano', 'Disponible', '2024-02-28'),
(18, 'Lily', 'Gato', 'Sphynx', 2, 'Sano', 'Disponible', '2024-03-12'),
(19, 'Rocco', 'Perro', 'Bulldog Francés', 1, 'Sano', 'Disponible', '2024-01-08'),
(20, 'Cleo', 'Gato', 'Mestizo', 3, 'Sano', 'Adoptada', '2023-11-25');

-- --------------------------------------------------------

--
-- Estructura para la vista `adopciones_completas`
--
DROP TABLE IF EXISTS `adopciones_completas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `adopciones_completas`  AS SELECT `a`.`nombre` AS `adoptante`, `m`.`nombre` AS `mascota`, `m`.`especie` AS `especie`, `m`.`raza` AS `raza`, `ad`.`fecha_adopcion` AS `fecha_adopcion`, `e`.`nombre` AS `empleado_responsable` FROM (((`adopciones` `ad` join `adoptantes` `a` on(`ad`.`id_adoptante` = `a`.`id_adoptante`)) join `mascotas` `m` on(`ad`.`id_mascota` = `m`.`id_mascota`)) join `empleados` `e` on(`ad`.`id_empleado` = `e`.`id_empleado`)) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `adopciones`
--
ALTER TABLE `adopciones`
  ADD PRIMARY KEY (`id_adopcion`),
  ADD KEY `id_mascota` (`id_mascota`),
  ADD KEY `id_adoptante` (`id_adoptante`),
  ADD KEY `id_empleado` (`id_empleado`);

--
-- Indices de la tabla `adoptantes`
--
ALTER TABLE `adoptantes`
  ADD PRIMARY KEY (`id_adoptante`);

--
-- Indices de la tabla `controles_postadopcion`
--
ALTER TABLE `controles_postadopcion`
  ADD PRIMARY KEY (`id_control`),
  ADD KEY `id_adopcion` (`id_adopcion`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id_empleado`);

--
-- Indices de la tabla `mascotas`
--
ALTER TABLE `mascotas`
  ADD PRIMARY KEY (`id_mascota`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `adopciones`
--
ALTER TABLE `adopciones`
  MODIFY `id_adopcion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `adoptantes`
--
ALTER TABLE `adoptantes`
  MODIFY `id_adoptante` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `controles_postadopcion`
--
ALTER TABLE `controles_postadopcion`
  MODIFY `id_control` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `id_empleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `mascotas`
--
ALTER TABLE `mascotas`
  MODIFY `id_mascota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `adopciones`
--
ALTER TABLE `adopciones`
  ADD CONSTRAINT `adopciones_ibfk_1` FOREIGN KEY (`id_mascota`) REFERENCES `mascotas` (`id_mascota`),
  ADD CONSTRAINT `adopciones_ibfk_2` FOREIGN KEY (`id_adoptante`) REFERENCES `adoptantes` (`id_adoptante`),
  ADD CONSTRAINT `adopciones_ibfk_3` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_empleado`);

--
-- Filtros para la tabla `controles_postadopcion`
--
ALTER TABLE `controles_postadopcion`
  ADD CONSTRAINT `controles_postadopcion_ibfk_1` FOREIGN KEY (`id_adopcion`) REFERENCES `adopciones` (`id_adopcion`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
