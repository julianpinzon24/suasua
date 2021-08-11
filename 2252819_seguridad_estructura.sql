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



-- Volcando estructura para tabla persona
CREATE TABLE IF NOT EXISTS `persona` (
  `perId` int(11) NOT NULL COMMENT 'Nos muetsra el Id de la tabla persona',
  `perDocumento` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Nos muestra el documento de la persona',
  `perNombre` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Nos muestra el nombre de la persona',
  `perApellido` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Nos muestra el apellido de la persona',
  `perEstado` tinyint(1) NOT NULL DEFAULT '1',
  `perUsuSesion` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `per_created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `per_updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario_s_usuId` int(11) NOT NULL,
  PRIMARY KEY (`perId`,`usuario_s_usuId`),
  UNIQUE KEY `uniq_documento` (`perDocumento`),
  KEY `fk_persona_usuario_s1_idx` (`usuario_s_usuId`),
  CONSTRAINT `fk_persona_usuario_s1` FOREIGN KEY (`usuario_s_usuId`) REFERENCES `usuario_s` (`usuId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Esta tabla nos muestra los datos de la persona ';

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla rol
CREATE TABLE IF NOT EXISTS `rol` (
  `rolId` int(11) NOT NULL AUTO_INCREMENT,
  `rolNombre` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `rolDescripcion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `rolEstado` tinyint(1) NOT NULL DEFAULT '1',
  `rolUsuSesion` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rol_created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `rol_updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`rolId`),
  UNIQUE KEY `uniq_nombrerol` (`rolNombre`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla usuario_s
CREATE TABLE IF NOT EXISTS `usuario_s` (
  `usuId` int(11) NOT NULL AUTO_INCREMENT,
  `usuLogin` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `usuPassword` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `usuUsuSesion` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `usuEstado` tinyint(1) NOT NULL DEFAULT '1',
  `usuRemember_token` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `usu_created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `usu_updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`usuId`),
  UNIQUE KEY `uniq_login` (`usuLogin`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla usuario_s_roles
CREATE TABLE IF NOT EXISTS `usuario_s_roles` (
  `id_usuario_s` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  `fechaUserRol` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `obsFechaUserRol` text COLLATE utf8_unicode_ci,
  `usuRolUsuSesion` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_usuario_s`,`id_rol`),
  KEY `usuario_s_roles_fk_rolidrol` (`id_rol`),
  CONSTRAINT `usuario_s_roles_fk_rolidrol` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`rolId`),
  CONSTRAINT `usuario_s_roles_fk_usuario_sid` FOREIGN KEY (`id_usuario_s`) REFERENCES `usuario_s` (`usuId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- La exportación de datos fue deseleccionada.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
