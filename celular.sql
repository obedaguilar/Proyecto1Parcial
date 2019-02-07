-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 06-02-2019 a las 07:14:54
-- Versión del servidor: 5.7.24
-- Versión de PHP: 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `celular`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `audio`
--

DROP TABLE IF EXISTS `audio`;
CREATE TABLE IF NOT EXISTS `audio` (
  `idAudio` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) DEFAULT NULL,
  `Descripcion` varchar(500) DEFAULT NULL,
  `audio_prueba` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`idAudio`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `camara`
--

DROP TABLE IF EXISTS `camara`;
CREATE TABLE IF NOT EXISTS `camara` (
  `idCamara` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) DEFAULT NULL,
  `Descripcion` varchar(500) DEFAULT NULL,
  `img_foto` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`idCamara`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `celular`
--

DROP TABLE IF EXISTS `celular`;
CREATE TABLE IF NOT EXISTS `celular` (
  `idCelular` int(11) NOT NULL AUTO_INCREMENT,
  `Modelo` varchar(45) DEFAULT NULL,
  `V_promo` varchar(500) DEFAULT NULL,
  `im_celular` varchar(45) DEFAULT NULL,
  `Rendimiento_des` varchar(500) DEFAULT NULL,
  `idCamara` int(11) NOT NULL,
  `idPantalla` int(11) NOT NULL,
  `idAudio` int(11) NOT NULL,
  `idSeguridad` int(11) NOT NULL,
  `idMarca` int(11) NOT NULL,
  PRIMARY KEY (`idCelular`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `for_pago`
--

DROP TABLE IF EXISTS `for_pago`;
CREATE TABLE IF NOT EXISTS `for_pago` (
  `idFor_Pago` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) DEFAULT NULL,
  `Descripcion` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`idFor_Pago`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `for_pago_has_celular`
--

DROP TABLE IF EXISTS `for_pago_has_celular`;
CREATE TABLE IF NOT EXISTS `for_pago_has_celular` (
  `idFor_Pago` int(11) NOT NULL,
  `idCelular` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

DROP TABLE IF EXISTS `marca`;
CREATE TABLE IF NOT EXISTS `marca` (
  `idMarca` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idMarca`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pantalla`
--

DROP TABLE IF EXISTS `pantalla`;
CREATE TABLE IF NOT EXISTS `pantalla` (
  `idPantalla` int(11) NOT NULL AUTO_INCREMENT,
  `Caracteristicas` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`idPantalla`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seguridad`
--

DROP TABLE IF EXISTS `seguridad`;
CREATE TABLE IF NOT EXISTS `seguridad` (
  `idSeguridad` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) DEFAULT NULL,
  `Descripcion` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`idSeguridad`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
