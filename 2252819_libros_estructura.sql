-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.6.21 - MySQL Community Server (GPL)
-- SO del servidor:              Win32
-- HeidiSQL Versión:             9.3.0.5059
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;



-- Volcando estructura para tabla categorialibro
CREATE TABLE IF NOT EXISTS `categorialibro` (
  `catLibId` int(11) NOT NULL AUTO_INCREMENT,
  `catLibNombre` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `catLibEstado` tinyint(1) NOT NULL DEFAULT '1',
  `catLibObservacion` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`catLibId`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla libros
CREATE TABLE IF NOT EXISTS `libros` (
  `isbn` int(5) NOT NULL DEFAULT '0',
  `titulo` varchar(236) DEFAULT NULL,
  `autor` varchar(305) DEFAULT NULL,
  `precio` varchar(10) DEFAULT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  `categoriaLibro_catLibId` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`isbn`,`categoriaLibro_catLibId`),
  KEY `fk_libros_categoriaLibro1_idx` (`categoriaLibro_catLibId`),
  CONSTRAINT `fk_libros_categoriaLibro1` FOREIGN KEY (`categoriaLibro_catLibId`) REFERENCES `categorialibro` (`catLibId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
