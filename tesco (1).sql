-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-11-2023 a las 09:59:32
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tesco`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno`
--

CREATE TABLE `alumno` (
  `AlumnoID` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `ApellidoPaterno` varchar(50) NOT NULL,
  `ApellidoMaterno` varchar(50) NOT NULL,
  `FechaNacimiento` date DEFAULT NULL,
  `telefono` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `Sexo` char(1) DEFAULT NULL,
  `CarreraID` int(11) DEFAULT NULL,
  `Contrasena` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `alumno`
--

INSERT INTO `alumno` (`AlumnoID`, `Nombre`, `ApellidoPaterno`, `ApellidoMaterno`, `FechaNacimiento`, `telefono`, `email`, `Sexo`, `CarreraID`, `Contrasena`) VALUES
(1, 'Juan', 'Pérez', 'López', '2000-05-15', '555-123-4567', 'juan@example.com', 'M', 1, ''),
(13, 'Viviana', 'Montolla', 'Vallejo', '2001-09-17', '5539457895', 'vivigrot20@gmail.com', 'F', 8, ''),
(14, 'Brandon', 'Montolla', 'Ramirez', '2001-09-17', '5539589641', 'vivigrot22@gmail.com', 'F', 11, ''),
(26, 'Brayan', 'Salinas', 'Diaz', '2003-10-15', '5539684676', 'brayansadi55@gmail.com', 'M', 1, '$2y$10$oZh.FfBqGG0Lpj6jfY1l8uOpgv.68HKBgNq1.WQbzk4pZ6BcljGlq'),
(27, 'Jaqueline', 'Raya', 'Perez', '2003-11-15', '5562320773', 'jaquebb15@gmail.com', 'F', 1, '$2y$10$V89CWAsu0mRjOGIO0UjSpe4dvhDJMfUelhciDdBrrBOk88.BNjbD2'),
(28, 'Angela Nereida', 'Montolla', 'Vallejo', '2000-02-04', '5539589641', 'angelapolis25@gmail.com', 'F', 1, '$2y$10$7ykdRA7WoUE4Gy5xVIFa0e8gC53baSHJ4na5G/22j1qBnKU6M8A62');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asesores`
--

CREATE TABLE `asesores` (
  `AsesorID` int(11) NOT NULL,
  `NombreAsesor` varchar(100) DEFAULT NULL,
  `DisponibilidadHorario` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `becas`
--

CREATE TABLE `becas` (
  `BecaID` int(11) NOT NULL,
  `AlumnoID` int(11) DEFAULT NULL,
  `TipoBeca` varchar(50) DEFAULT NULL,
  `DetallesBeca` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrera`
--

CREATE TABLE `carrera` (
  `CarreraID` int(11) NOT NULL,
  `NombreCarrera` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `carrera`
--

INSERT INTO `carrera` (`CarreraID`, `NombreCarrera`) VALUES
(1, 'Ingenieria Sistemas Computacionales'),
(2, 'Ingeniería Industrial'),
(3, 'Ingeniería Electromecánica'),
(4, 'Ingeniería Mecatrónica'),
(5, 'Ingeniería Ambiental'),
(6, 'Ingeniería Materiales'),
(7, 'Ingeniería Gestión Empresarial'),
(8, 'Ingeniería Tecnologías de Información y Comunicación'),
(9, 'Ingeniería Química'),
(10, 'Ingeniería Civil'),
(11, 'Licenciatura en Administración');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `graduacion`
--

CREATE TABLE `graduacion` (
  `GraduacionID` int(11) NOT NULL,
  `AlumnoID` int(11) DEFAULT NULL,
  `TipoGraduacion` varchar(50) DEFAULT NULL,
  `AsesorID` int(11) DEFAULT NULL,
  `FechaGraduacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial`
--

CREATE TABLE `historial` (
  `HistorialID` int(11) NOT NULL,
  `AlumnoID` int(11) DEFAULT NULL,
  `DetallesCalificaciones` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horario`
--

CREATE TABLE `horario` (
  `HorarioID` int(11) NOT NULL,
  `AlumnoID` int(11) DEFAULT NULL,
  `DetallesHorario` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripcion`
--

CREATE TABLE `inscripcion` (
  `InscripcionID` int(11) NOT NULL,
  `AlumnoID` int(11) DEFAULT NULL,
  `FechaInscripcion` date DEFAULT NULL,
  `PagoInscripcion` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `UsuarioID` int(11) NOT NULL,
  `AlumnoID` int(11) DEFAULT NULL,
  `NombreUsuario` varchar(50) NOT NULL,
  `ContraseñaHash` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`UsuarioID`, `AlumnoID`, `NombreUsuario`, `ContraseñaHash`) VALUES
(1, 1, 'juan@example.com', 'Hola');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD PRIMARY KEY (`AlumnoID`),
  ADD KEY `CarreraID` (`CarreraID`);

--
-- Indices de la tabla `asesores`
--
ALTER TABLE `asesores`
  ADD PRIMARY KEY (`AsesorID`);

--
-- Indices de la tabla `becas`
--
ALTER TABLE `becas`
  ADD PRIMARY KEY (`BecaID`),
  ADD KEY `AlumnoID` (`AlumnoID`);

--
-- Indices de la tabla `carrera`
--
ALTER TABLE `carrera`
  ADD PRIMARY KEY (`CarreraID`);

--
-- Indices de la tabla `graduacion`
--
ALTER TABLE `graduacion`
  ADD PRIMARY KEY (`GraduacionID`),
  ADD KEY `AlumnoID` (`AlumnoID`),
  ADD KEY `AsesorID` (`AsesorID`);

--
-- Indices de la tabla `historial`
--
ALTER TABLE `historial`
  ADD PRIMARY KEY (`HistorialID`),
  ADD KEY `AlumnoID` (`AlumnoID`);

--
-- Indices de la tabla `horario`
--
ALTER TABLE `horario`
  ADD PRIMARY KEY (`HorarioID`),
  ADD KEY `AlumnoID` (`AlumnoID`);

--
-- Indices de la tabla `inscripcion`
--
ALTER TABLE `inscripcion`
  ADD PRIMARY KEY (`InscripcionID`),
  ADD KEY `AlumnoID` (`AlumnoID`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`UsuarioID`),
  ADD KEY `AlumnoID` (`AlumnoID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alumno`
--
ALTER TABLE `alumno`
  MODIFY `AlumnoID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `asesores`
--
ALTER TABLE `asesores`
  MODIFY `AsesorID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `becas`
--
ALTER TABLE `becas`
  MODIFY `BecaID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `carrera`
--
ALTER TABLE `carrera`
  MODIFY `CarreraID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `graduacion`
--
ALTER TABLE `graduacion`
  MODIFY `GraduacionID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `historial`
--
ALTER TABLE `historial`
  MODIFY `HistorialID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `horario`
--
ALTER TABLE `horario`
  MODIFY `HorarioID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inscripcion`
--
ALTER TABLE `inscripcion`
  MODIFY `InscripcionID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `UsuarioID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD CONSTRAINT `alumno_ibfk_1` FOREIGN KEY (`CarreraID`) REFERENCES `carrera` (`CarreraID`);

--
-- Filtros para la tabla `becas`
--
ALTER TABLE `becas`
  ADD CONSTRAINT `becas_ibfk_1` FOREIGN KEY (`AlumnoID`) REFERENCES `alumno` (`AlumnoID`);

--
-- Filtros para la tabla `graduacion`
--
ALTER TABLE `graduacion`
  ADD CONSTRAINT `graduacion_ibfk_1` FOREIGN KEY (`AlumnoID`) REFERENCES `alumno` (`AlumnoID`),
  ADD CONSTRAINT `graduacion_ibfk_2` FOREIGN KEY (`AsesorID`) REFERENCES `asesores` (`AsesorID`);

--
-- Filtros para la tabla `historial`
--
ALTER TABLE `historial`
  ADD CONSTRAINT `historial_ibfk_1` FOREIGN KEY (`AlumnoID`) REFERENCES `alumno` (`AlumnoID`);

--
-- Filtros para la tabla `horario`
--
ALTER TABLE `horario`
  ADD CONSTRAINT `horario_ibfk_1` FOREIGN KEY (`AlumnoID`) REFERENCES `alumno` (`AlumnoID`);

--
-- Filtros para la tabla `inscripcion`
--
ALTER TABLE `inscripcion`
  ADD CONSTRAINT `inscripcion_ibfk_1` FOREIGN KEY (`AlumnoID`) REFERENCES `alumno` (`AlumnoID`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`AlumnoID`) REFERENCES `alumno` (`AlumnoID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
