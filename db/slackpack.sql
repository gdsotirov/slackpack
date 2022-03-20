-- MySQL dump 10.13  Distrib 8.0.28, for Linux (x86_64)
--
-- Host: localhost    Database: slackpack
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `AgingBuilds`
--

DROP TABLE IF EXISTS `AgingBuilds`;
/*!50001 DROP VIEW IF EXISTS `AgingBuilds`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `AgingBuilds` AS SELECT 
 1 AS `Name`,
 1 AS `LastReleaseDate`,
 1 AS `LastVersion`,
 1 AS `LastBuild`,
 1 AS `URL`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `AvrgByMonth`
--

DROP TABLE IF EXISTS `AvrgByMonth`;
/*!50001 DROP VIEW IF EXISTS `AvrgByMonth`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `AvrgByMonth` AS SELECT 
 1 AS `Year`,
 1 AS `Average`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `DstrbtnByArch`
--

DROP TABLE IF EXISTS `DstrbtnByArch`;
/*!50001 DROP VIEW IF EXISTS `DstrbtnByArch`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `DstrbtnByArch` AS SELECT 
 1 AS `Name`,
 1 AS `Packages`,
 1 AS `Percent`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `DstrbtnByCategory`
--

DROP TABLE IF EXISTS `DstrbtnByCategory`;
/*!50001 DROP VIEW IF EXISTS `DstrbtnByCategory`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `DstrbtnByCategory` AS SELECT 
 1 AS `Name`,
 1 AS `Packages`,
 1 AS `Percent`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `DstrbtnByLicense`
--

DROP TABLE IF EXISTS `DstrbtnByLicense`;
/*!50001 DROP VIEW IF EXISTS `DstrbtnByLicense`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `DstrbtnByLicense` AS SELECT 
 1 AS `Name`,
 1 AS `Packages`,
 1 AS `Percent`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `DstrbtnBySlackVersion`
--

DROP TABLE IF EXISTS `DstrbtnBySlackVersion`;
/*!50001 DROP VIEW IF EXISTS `DstrbtnBySlackVersion`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `DstrbtnBySlackVersion` AS SELECT 
 1 AS `Name`,
 1 AS `Packages`,
 1 AS `Percent`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `DstrbtnByTime`
--

DROP TABLE IF EXISTS `DstrbtnByTime`;
/*!50001 DROP VIEW IF EXISTS `DstrbtnByTime`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `DstrbtnByTime` AS SELECT 
 1 AS `Year`,
 1 AS `Month`,
 1 AS `Packages`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Latest20`
--

DROP TABLE IF EXISTS `Latest20`;
/*!50001 DROP VIEW IF EXISTS `Latest20`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Latest20` AS SELECT 
 1 AS `Id`,
 1 AS `Date`,
 1 AS `Name`,
 1 AS `Version`,
 1 AS `Build`,
 1 AS `License`,
 1 AS `Arch`,
 1 AS `Architecture`,
 1 AS `Slack`,
 1 AS `URL`,
 1 AS `Description`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `NewsCal`
--

DROP TABLE IF EXISTS `NewsCal`;
/*!50001 DROP VIEW IF EXISTS `NewsCal`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `NewsCal` AS SELECT 
 1 AS `Month`,
 1 AS `Year`,
 1 AS `News`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Totals`
--

DROP TABLE IF EXISTS `Totals`;
/*!50001 DROP VIEW IF EXISTS `Totals`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Totals` AS SELECT 
 1 AS `TotalCount`,
 1 AS `DstnctCount`,
 1 AS `TotalSize`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Versions`
--

DROP TABLE IF EXISTS `Versions`;
/*!50001 DROP VIEW IF EXISTS `Versions`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Versions` AS SELECT 
 1 AS `Name`,
 1 AS `Category`,
 1 AS `Slack102`,
 1 AS `Slack110`,
 1 AS `Slack120`,
 1 AS `Slack121`,
 1 AS `Slack122`,
 1 AS `Slack130`,
 1 AS `Slack131`,
 1 AS `Slack1337`,
 1 AS `Slack140`,
 1 AS `Slack141`,
 1 AS `Slack142`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `archs`
--

DROP TABLE IF EXISTS `archs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `archs` (
  `id` char(8) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `name` varchar(40) NOT NULL COMMENT 'Descriptive architecture name',
  `def` enum('no','yes') NOT NULL DEFAULT 'no' COMMENT 'Default or not',
  `packages_total` int unsigned NOT NULL DEFAULT '0' COMMENT 'Total number of the packages for this architecture',
  `packages` int unsigned NOT NULL DEFAULT '0' COMMENT 'Number of active packages for this architecture',
  PRIMARY KEY (`id`),
  KEY `idx_name` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=ascii COMMENT='Slackware Architectures';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT 'Category name in English',
  `name_bg` varchar(32) NOT NULL COMMENT 'Category name in Bulgarian',
  `packages_total` int unsigned NOT NULL DEFAULT '0' COMMENT 'Total number of the packages in this category',
  `packages` int unsigned NOT NULL DEFAULT '0' COMMENT 'Number of active packages in this category',
  PRIMARY KEY (`id`),
  KEY `idx_name` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Package categories';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `errors`
--

DROP TABLE IF EXISTS `errors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `errors` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `errcode` varchar(32) NOT NULL COMMENT 'Internal error code',
  `errmsg` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Text of the error message',
  `source` varchar(256) DEFAULT NULL COMMENT 'Source of the error (program name, etc)',
  `type` enum('db','sys','usr','sp') NOT NULL COMMENT 'Type of the error - database, system, user, slackpack',
  `level` enum('info','warn','err') NOT NULL COMMENT 'Error level',
  `date` datetime NOT NULL COMMENT 'Date and time at which the error was recorded',
  PRIMARY KEY (`id`),
  KEY `idx_type` (`type`),
  KEY `idx_date` (`date`),
  KEY `idx_level` (`level`),
  KEY `idx_errcode` (`errcode`),
  FULLTEXT KEY `idx_errmsg` (`errmsg`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii COMMENT='Register for all errors that SlackPack encounters';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `errors_ins` BEFORE INSERT ON `errors` FOR EACH ROW BEGIN
  SET NEW.date = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `licenses`
--

DROP TABLE IF EXISTS `licenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `licenses` (
  `id` char(8) NOT NULL,
  `name` varchar(30) NOT NULL COMMENT 'License name',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT 'Short description',
  `url` varchar(256) DEFAULT NULL COMMENT 'URL with more info about the license or the official page of the license',
  `def` enum('no','yes') NOT NULL DEFAULT 'no' COMMENT 'Whether this license should be preselected in GUI elements like combos',
  `packages_total` int unsigned NOT NULL DEFAULT '0' COMMENT 'Total number of the packages with this license',
  `packages` int unsigned NOT NULL DEFAULT '0' COMMENT 'Number of active packages with this license',
  `gpl_compat` enum('n','y') DEFAULT NULL COMMENT 'Whether the license GPL Compatible. See http://www.gnu.org/licenses/license-list.html for more details.',
  PRIMARY KEY (`id`),
  KEY `idx_name` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=ascii COMMENT='Software licenses catalog';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `links`
--

DROP TABLE IF EXISTS `links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `links` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL COMMENT 'Title in English',
  `title_bg` varchar(64) NOT NULL COMMENT 'Title in Bulgarian',
  `url` varchar(256) NOT NULL COMMENT 'Absolute URL to link to',
  `type` enum('leftbar','about','other') CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT 'other' COMMENT 'List type (i.e. where is link used)',
  `priority` int unsigned NOT NULL COMMENT 'Ordinal number for sorting in list',
  `status` enum('active','inactive','pending') CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT 'pending' COMMENT 'Status defining whether link is active or not',
  PRIMARY KEY (`id`),
  KEY `idx_type_status` (`type`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Lists of links for site';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mirrors`
--

DROP TABLE IF EXISTS `mirrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mirrors` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL COMMENT 'Mirror name',
  `home_url` varchar(256) DEFAULT NULL COMMENT 'Mirror home page',
  `loc_city` varchar(64) DEFAULT NULL COMMENT 'Geographical location - city',
  `loc_country` varchar(32) NOT NULL COMMENT 'Geographical location - country',
  `loc_continent` varchar(16) NOT NULL COMMENT 'Geographical location - continent',
  `speed_local` int unsigned DEFAULT NULL COMMENT 'Local speed in bps',
  `speed_int` int unsigned DEFAULT NULL COMMENT 'International speed in bps',
  `sync_hours` int unsigned DEFAULT NULL COMMENT 'Synchronization is done every how many hours',
  `sync_start` time DEFAULT NULL COMMENT 'First synchronization is done at what time',
  `logo` blob COMMENT 'Mirror logo image. Should be a png file with 88x31 dimension',
  `prime` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'Whether this is primary site or not',
  `active` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'Whether mirror is active or not',
  PRIMARY KEY (`id`),
  KEY `idx_name` (`name`) USING BTREE,
  KEY `idx_location` (`loc_city`,`loc_country`,`loc_continent`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='SlackPack mirrors information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mirrors_dtl`
--

DROP TABLE IF EXISTS `mirrors_dtl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mirrors_dtl` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `mirror` int unsigned NOT NULL COMMENT 'Reference to the general mirror info',
  `protocol` enum('ftp','http','rsync') CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL COMMENT 'Protocol name',
  `url` varchar(1024) NOT NULL COMMENT 'Relative URL to the repositories',
  `active` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'Whether URL is active or not',
  PRIMARY KEY (`id`),
  KEY `idx_mirror` (`mirror`) USING BTREE,
  CONSTRAINT `fk_mirror` FOREIGN KEY (`mirror`) REFERENCES `mirrors` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Definitions of mirror protocols';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `body` text NOT NULL,
  `published` timestamp NULL DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `author` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_published` (`published`) USING BTREE,
  KEY `idx_update` (`updated`) USING BTREE,
  KEY `idx_author` (`author`) USING BTREE,
  CONSTRAINT `fk_news_author` FOREIGN KEY (`author`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Site news';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `news_ins` BEFORE INSERT ON `news` FOR EACH ROW BEGIN
  SET NEW.updated = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `news_updt` BEFORE UPDATE ON `news` FOR EACH ROW BEGIN
  SET NEW.updated = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `package_deps`
--

DROP TABLE IF EXISTS `package_deps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package_deps` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `pack_id` int unsigned NOT NULL COMMENT 'For package',
  `dep_type` enum('req','sugg','conf') NOT NULL COMMENT 'Dependency type - requires, suggests, conflicts',
  `dep_name` varchar(64) NOT NULL,
  `dep_sign` varchar(4) DEFAULT NULL,
  `dep_version` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_pack_id` (`pack_id`),
  CONSTRAINT `fk_pkgdeps_pack_id` FOREIGN KEY (`pack_id`) REFERENCES `packages` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=ascii COMMENT='Packages dependencies register';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `packages`
--

DROP TABLE IF EXISTS `packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `packages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL COMMENT 'Package UNIX name',
  `title` varchar(256) NOT NULL COMMENT 'Package name',
  `version` varchar(20) NOT NULL COMMENT 'Package version',
  `releasedate` date DEFAULT NULL COMMENT 'Version release date',
  `build` varchar(10) NOT NULL COMMENT 'Package build number',
  `license` char(8) NOT NULL COMMENT 'Package license reference',
  `arch` char(8) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL COMMENT 'Package architecture reference',
  `slackver` int unsigned NOT NULL COMMENT 'Package format (Slackware version) reference',
  `url` varchar(256) DEFAULT NULL COMMENT 'Project URL',
  `vendor` int unsigned NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT 'Package description',
  `serie` varchar(8) NOT NULL,
  `category` int unsigned NOT NULL COMMENT 'Package category',
  `slackbuild` enum('no','yes') NOT NULL DEFAULT 'no' COMMENT 'Is build script included',
  `frombinary` enum('no','yes') NOT NULL DEFAULT 'no' COMMENT 'Is it from binary release',
  `filename` varchar(256) NOT NULL COMMENT 'Package file name',
  `filesize` int unsigned NOT NULL COMMENT 'Package file size',
  `filemd5` char(32) NOT NULL COMMENT 'MD5 hash for the package file',
  `filesign` text NOT NULL COMMENT 'GPG signature of the package file',
  `filedate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Package file creation date/time',
  `author` int unsigned NOT NULL COMMENT 'Package author reference',
  `status` enum('ok','del','old','wait') NOT NULL DEFAULT 'ok' COMMENT 'Status of the package (ok - means active, old - means obsoleted, del - means deleted, wait - means not yet published)',
  `versioned` enum('y','n','g') DEFAULT NULL,
  `security_fix` tinyint DEFAULT '0' COMMENT 'Whether or not the package includes security fixes',
  `contents` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT 'Dump of package contents',
  `contents_json` json DEFAULT NULL COMMENT 'Package contents (files only) as JSON array',
  PRIMARY KEY (`id`),
  KEY `idx_name` (`name`) USING BTREE,
  KEY `idx_version` (`version`) USING BTREE,
  KEY `idx_license` (`license`) USING BTREE,
  KEY `idx_author` (`author`) USING BTREE,
  KEY `idx_slackbuild` (`slackbuild`) USING BTREE,
  KEY `idx_slackver` (`slackver`) USING BTREE,
  KEY `idx_category` (`category`) USING BTREE,
  KEY `idx_status` (`status`) USING BTREE,
  KEY `fk_vendor_idx` (`vendor`),
  KEY `fk_serie_idx` (`serie`),
  KEY `idx_arch` (`arch`) USING BTREE,
  CONSTRAINT `fk_arch` FOREIGN KEY (`arch`) REFERENCES `archs` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_author` FOREIGN KEY (`author`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_category` FOREIGN KEY (`category`) REFERENCES `categories` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_license` FOREIGN KEY (`license`) REFERENCES `licenses` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_serie` FOREIGN KEY (`serie`) REFERENCES `soft_series` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_slackver` FOREIGN KEY (`slackver`) REFERENCES `slackvers` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_vendor` FOREIGN KEY (`vendor`) REFERENCES `vendors` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=ascii COMMENT='Slackware Packages Register';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `packages_bi` BEFORE INSERT ON `packages` FOR EACH ROW BEGIN
  IF NEW.contents IS NOT NULL AND NEW.contents_json IS NULL THEN
    SET NEW.contents_json = extract_files(NEW.contents);
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `packages_ai` AFTER INSERT ON `packages` FOR EACH ROW BEGIN
  UPDATE archs      SET packages_total = packages_total + 1 WHERE id = NEW.arch;
  UPDATE categories SET packages_total = packages_total + 1 WHERE id = NEW.category;
  UPDATE licenses   SET packages_total = packages_total + 1 WHERE id = NEW.license;
  UPDATE slackvers  SET packages_total = packages_total + 1 WHERE id = NEW.slackver;
  UPDATE vendors    SET packages_total = packages_total + 1 WHERE id = NEW.vendor;

  IF NEW.status = 'ok' THEN
    UPDATE archs      SET packages = packages + 1 WHERE id = NEW.arch;
    UPDATE categories SET packages = packages + 1 WHERE id = NEW.category;
    UPDATE licenses   SET packages = packages + 1 WHERE id = NEW.license;
    UPDATE slackvers  SET packages = packages + 1 WHERE id = NEW.slackver;
    UPDATE vendors    SET packages = packages + 1 WHERE id = NEW.vendor;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `packages_bu` BEFORE UPDATE ON `packages` FOR EACH ROW BEGIN
  IF NEW.contents IS NOT NULL AND NEW.contents_json IS NULL THEN
    SET NEW.contents_json = extract_files(NEW.contents);
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `packages_au` AFTER UPDATE ON `packages` FOR EACH ROW BEGIN
  IF OLD.arch <> NEW.arch THEN
    UPDATE archs SET packages_total = packages_total - 1 WHERE id = OLD.arch;
    UPDATE archs SET packages_total = packages_total + 1 WHERE id = NEW.arch;
  END IF;

  IF OLD.category <> NEW.category THEN
    UPDATE categories SET packages_total = packages_total - 1 WHERE id = OLD.category;
    UPDATE categories SET packages_total = packages_total + 1 WHERE id = NEW.category;
  END IF;

  IF OLD.license <> NEW.license THEN
    UPDATE licenses SET packages_total = packages_total - 1 WHERE id = OLD.license;
    UPDATE licenses SET packages_total = packages_total + 1 WHERE id = NEW.license;
  END IF;

  IF OLD.slackver <> NEW.slackver THEN
    UPDATE slackvers SET packages_total = packages_total - 1 WHERE id = OLD.slackver;
    UPDATE slackvers SET packages_total = packages_total + 1 WHERE id = NEW.slackver;
  END IF;

  IF OLD.vendor <> NEW.vendor THEN
    UPDATE vendors SET packages_total = packages_total - 1 WHERE id = OLD.vendor;
    UPDATE vendors SET packages_total = packages_total + 1 WHERE id = NEW.vendor;
  END IF;

  IF NEW.status = 'ok' THEN
    UPDATE archs      SET packages = packages + 1 WHERE id = NEW.arch;
    UPDATE categories SET packages = packages + 1 WHERE id = NEW.category;
    UPDATE licenses   SET packages = packages + 1 WHERE id = NEW.license;
    UPDATE slackvers  SET packages = packages + 1 WHERE id = NEW.slackver;
    UPDATE vendors    SET packages = packages + 1 WHERE id = NEW.vendor;
  END IF;

  IF OLD.status = 'ok' THEN
    UPDATE archs      SET packages = packages - 1 WHERE id = OLD.arch;
    UPDATE categories SET packages = packages - 1 WHERE id = OLD.category;
    UPDATE licenses   SET packages = packages - 1 WHERE id = OLD.license;
    UPDATE slackvers  SET packages = packages - 1 WHERE id = OLD.slackver;
    UPDATE vendors    SET packages = packages - 1 WHERE id = OLD.vendor;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `packages_ad` AFTER DELETE ON `packages` FOR EACH ROW BEGIN
  UPDATE archs      SET packages_total = packages_total - 1 WHERE id = OLD.arch;
  UPDATE categories SET packages_total = packages_total - 1 WHERE id = OLD.category;
  UPDATE licenses   SET packages_total = packages_total - 1 WHERE id = OLD.license;
  UPDATE slackvers  SET packages_total = packages_total - 1 WHERE id = OLD.slackver;
  UPDATE vendors    SET packages_total = packages_total - 1 WHERE id = OLD.vendor;

  IF OLD.status = 'ok' THEN
    UPDATE archs      SET packages = packages - 1 WHERE id = OLD.arch;
    UPDATE categories SET packages = packages - 1 WHERE id = OLD.category;
    UPDATE licenses   SET packages = packages - 1 WHERE id = OLD.license;
    UPDATE slackvers  SET packages = packages - 1 WHERE id = OLD.slackver;
    UPDATE vendors    SET packages = packages - 1 WHERE id = OLD.vendor;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `searches`
--

DROP TABLE IF EXISTS `searches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `searches` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `query` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'The query as passed from the search form',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The data at which the query was processed',
  `results` int unsigned NOT NULL COMMENT 'Count of the returned packages',
  `arch` varchar(8) DEFAULT NULL COMMENT 'The selected architecture',
  `slackver` int unsigned DEFAULT NULL COMMENT 'The selected Slackware version',
  `f_latestonly` enum('n','y') DEFAULT NULL COMMENT 'Whether Only latest was checked',
  `f_gplonly` enum('n','y') DEFAULT NULL COMMENT 'Whether Only GPL was checked',
  `f_sponly` enum('n','y') DEFAULT NULL COMMENT 'Whether Only with SlackBuild was checked',
  `f_nobin` enum('n','y') DEFAULT NULL COMMENT 'Whether Exclude packages from binary releases was checked',
  PRIMARY KEY (`id`),
  KEY `idx_date` (`date`),
  KEY `idx_arch` (`arch`),
  KEY `idx_sver` (`slackver`),
  KEY `idx_flatestonly` (`f_latestonly`),
  KEY `idx_fgplonly` (`f_gplonly`),
  KEY `idx_fsponly` (`f_sponly`),
  KEY `idx_fnobin` (`f_nobin`),
  FULLTEXT KEY `idx_query` (`query`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii COMMENT='Search queries register';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `slackvers`
--

DROP TABLE IF EXISTS `slackvers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slackvers` (
  `id` int unsigned NOT NULL,
  `distro` char(10) NOT NULL COMMENT 'Distribution',
  `name` varchar(30) NOT NULL COMMENT 'Descriptive version name',
  `released` datetime DEFAULT NULL COMMENT 'Release date and time in UTC',
  `annon_url` varchar(128) DEFAULT NULL COMMENT 'Announcement URL (if any)',
  `eol` date DEFAULT NULL COMMENT 'End of life date (if any)',
  `def` enum('no','yes') NOT NULL DEFAULT 'no' COMMENT 'Whether this version should be preselected in GUI elements such combos',
  `packages_total` int unsigned NOT NULL DEFAULT '0' COMMENT 'Total number of the packages for this Slackware version',
  `packages` int unsigned NOT NULL DEFAULT '0' COMMENT 'Number of active packages for this Slackware version',
  `str` varchar(10) NOT NULL COMMENT 'Version as a string',
  `active` tinyint NOT NULL DEFAULT '1' COMMENT 'Open for package registration',
  PRIMARY KEY (`id`),
  KEY `idx_released` (`released`) USING BTREE,
  KEY `idx_name` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=ascii COMMENT='Slackware Versions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `soft_series`
--

DROP TABLE IF EXISTS `soft_series`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `soft_series` (
  `id` varchar(8) NOT NULL,
  `desc` text NOT NULL COMMENT 'Description',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii COMMENT='Software series';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sources`
--

DROP TABLE IF EXISTS `sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sources` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT 'Source pacakges and resources',
  `since` date DEFAULT NULL COMMENT 'Information effective since',
  `homepage_url` varchar(128) NOT NULL COMMENT 'Official site URL',
  `downloads_url` varchar(128) DEFAULT NULL COMMENT 'Downloads URL',
  `src_repo_url` varchar(128) DEFAULT NULL COMMENT '\nSource code repository URL',
  `bugs_url` varchar(128) DEFAULT NULL COMMENT 'URL for reporting bugs',
  `annon_ml_url` varchar(128) DEFAULT NULL COMMENT 'Release announcements mailing list URL',
  `annon_feed_url` varchar(128) DEFAULT NULL COMMENT 'Release announcements feed URL',
  `news_url` varchar(128) DEFAULT NULL COMMENT 'URL of news webpage',
  `advert_url` varchar(128) DEFAULT NULL COMMENT 'URL back to SlackPack',
  PRIMARY KEY (`id`),
  KEY `fk_src_pack_idx` (`name`),
  CONSTRAINT `fk_src_pack` FOREIGN KEY (`name`) REFERENCES `packages` (`name`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=ascii;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL COMMENT 'Name',
  `firstname` varchar(60) NOT NULL COMMENT 'First name',
  `nick` varchar(30) DEFAULT NULL COMMENT 'Nickname',
  `pkgsid` varchar(5) NOT NULL COMMENT 'The identifier used on packages',
  `email` varchar(256) NOT NULL COMMENT 'E-mail address of user',
  `password` char(42) NOT NULL COMMENT 'User password as md5 hash',
  `registered` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date of registration',
  `packages` int unsigned NOT NULL DEFAULT '0' COMMENT 'Number of the packages for this user',
  `lp_user` varchar(10) DEFAULT NULL COMMENT 'Username in linuxpackages.net',
  `lp_pass` blob COMMENT 'Password in linuxpackages.net encoded with AES',
  PRIMARY KEY (`id`),
  KEY `idx_name` (`name`) USING BTREE,
  KEY `idx_firstname` (`firstname`) USING BTREE,
  KEY `idx_nick` (`nick`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Package authors register';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vendors`
--

DROP TABLE IF EXISTS `vendors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendors` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(16) NOT NULL COMMENT 'Short name of vendor',
  `title` varchar(64) NOT NULL COMMENT 'Full name of vendor',
  `homeurl` varchar(256) NOT NULL COMMENT 'Homepage URL',
  `packages_total` int unsigned NOT NULL DEFAULT '0' COMMENT 'Total number of packages for the vendor',
  `packages` int unsigned NOT NULL DEFAULT '0' COMMENT 'Number of avtive packages for the vendor',
  PRIMARY KEY (`id`),
  KEY `idx_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii COMMENT='Software vendors register';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'slackpack'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `sp_cleanup` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb3 */ ;;
/*!50003 SET character_set_results = utf8mb3 */ ;;
/*!50003 SET collation_connection  = utf8_general_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`192.168.79.%`*/ /*!50106 EVENT `sp_cleanup` ON SCHEDULE EVERY 1 DAY STARTS '2014-09-07 23:45:00' ON COMPLETION NOT PRESERVE ENABLE COMMENT 'Cleanup slackpack schema 15 minutes before midnight' DO BEGIN
  CALL cleanup_searches;
END */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'slackpack'
--
/*!50003 DROP FUNCTION IF EXISTS `extract_files` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `extract_files`(cntnts LONGTEXT) RETURNS json
    DETERMINISTIC
BEGIN
  DECLARE jstr JSON DEFAULT '[]';
  DECLARE nl_pos INTEGER DEFAULT INSTR(cntnts, '\n');
  DECLARE ln VARCHAR(1024);

  WHILE nl_pos > 0 DO
    SET ln = SUBSTRING(cntnts, 1, nl_pos - 1);

    IF LENGTH(ln) > 0 AND ln NOT LIKE 'd%' THEN /* not an empty line and not directory */
      /* The string after last space should be the file name */
      SET jstr = JSON_ARRAY_APPEND(jstr, '$', SUBSTRING_INDEX(ln, ' ', -1));
    END IF;

    SET cntnts = SUBSTR(cntnts, nl_pos + 1);
    SET nl_pos = INSTR(cntnts, '\n'); /* next line */
  END WHILE;

  RETURN jstr;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `list_matching_contents` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `list_matching_contents`(jdoc JSON, q VARCHAR(128)) RETURNS text CHARSET utf8mb3
    DETERMINISTIC
BEGIN
  DECLARE res_paths JSON;
  DECLARE res_paths_len INTEGER;
  DECLARE res_paths_idx INTEGER DEFAULT 0;
  DECLARE cur_path VARCHAR(32);
  DECLARE mcntnts TEXT DEFAULT '';

  SET res_paths = JSON_SEARCH(jdoc, 'all', CONCAT('%', q, '%'));

  IF JSON_TYPE(res_paths) = 'STRING' THEN
    SET mcntnts = JSON_UNQUOTE(JSON_EXTRACT(jdoc, JSON_UNQUOTE(res_paths)));
  ELSEIF JSON_TYPE(res_paths) = 'ARRAY' THEN
    SET res_paths_len = JSON_LENGTH(res_paths);

    WHILE res_paths_idx < res_paths_len DO
      SET cur_path = JSON_EXTRACT(res_paths, CONCAT('$[', res_paths_idx, ']'));
      IF res_paths_idx > 0 THEN
        SET mcntnts = CONCAT(mcntnts, ', ', JSON_UNQUOTE(JSON_EXTRACT(jdoc, JSON_UNQUOTE(cur_path))));
      ELSE
        SET mcntnts = CONCAT(mcntnts, JSON_UNQUOTE(JSON_EXTRACT(jdoc, JSON_UNQUOTE(cur_path))));
      END IF;

      SET res_paths_idx = res_paths_idx + 1;
    END WHILE;
  ELSE
    SET mcntnts = '';
  END IF;

  RETURN mcntnts;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `percent_binrel` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `percent_binrel`() RETURNS float
    READS SQL DATA
BEGIN
  DECLARE bin_count INT;
  DECLARE all_count INT;

  SELECT count(*) INTO bin_count FROM packages WHERE frombinary = 'yes';
  SELECT count(*) INTO all_count FROM packages;
  RETURN (bin_count / all_count) * 100;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `percent_sb` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `percent_sb`() RETURNS float
    READS SQL DATA
    COMMENT 'Find the percent of the packages with SlackBuild scripts'
BEGIN
  DECLARE with_sb INT;
  DECLARE all_count INT;

  SELECT count(*) INTO with_sb FROM packages WHERE slackbuild = 'yes';
  SELECT count(*) INTO all_count FROM packages;
  RETURN (with_sb / all_count) * 100;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cleanup_searches` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cleanup_searches`()
BEGIN
  DELETE FROM searches
   WHERE (   LOWER(`query`) IN ('epay', 'online', 'paypal', 'repo', 'site')
          OR `query` LIKE '%.n%'
          OR `query` LIKE '%.com%'
          OR `query` LIKE '%.uk%'
          OR `query` LIKE '%test%'
          OR `query` RLIKE '^[a-zA-Z][0-9]$'
          OR `query` RLIKE '^[0-9]+$'
          OR `query` NOT RLIKE '^[a-zA-Z0-9\.\,\-\_\ \+]+$'
          OR (    `query` RLIKE '^[a-zA-Z]{2}$'
              AND LOWER(`query`) NOT IN ('go', 'gd', 'mc', 'qt')
             )
         )
     AND results = 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `AgingBuilds`
--

/*!50001 DROP VIEW IF EXISTS `AgingBuilds`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `AgingBuilds` AS select `packages`.`name` AS `Name`,max(`packages`.`releasedate`) AS `LastReleaseDate`,max(`packages`.`version`) AS `LastVersion`,max(`packages`.`filedate`) AS `LastBuild`,max(`packages`.`url`) AS `URL` from `packages` group by `packages`.`name` having (max(`packages`.`filedate`) <= (now() - interval 2 month)) order by max(`packages`.`filedate`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `AvrgByMonth`
--

/*!50001 DROP VIEW IF EXISTS `AvrgByMonth`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `AvrgByMonth` AS select year(`packages`.`filedate`) AS `Year`,(count(0) / 12) AS `Average` from `packages` group by year(`packages`.`filedate`) order by year(`packages`.`filedate`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `DstrbtnByArch`
--

/*!50001 DROP VIEW IF EXISTS `DstrbtnByArch`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `DstrbtnByArch` AS select `archs`.`name` AS `Name`,`archs`.`packages` AS `Packages`,round(((`archs`.`packages` * 100) / (select count(0) from `packages`)),2) AS `Percent` from `archs` order by `archs`.`name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `DstrbtnByCategory`
--

/*!50001 DROP VIEW IF EXISTS `DstrbtnByCategory`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `DstrbtnByCategory` AS select `categories`.`name` AS `Name`,`categories`.`packages` AS `Packages`,round(((`categories`.`packages` * 100) / (select count(0) from `packages`)),2) AS `Percent` from `categories` order by `categories`.`name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `DstrbtnByLicense`
--

/*!50001 DROP VIEW IF EXISTS `DstrbtnByLicense`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `DstrbtnByLicense` AS select `licenses`.`name` AS `Name`,`licenses`.`packages` AS `Packages`,round(((`licenses`.`packages` * 100) / (select count(0) from `packages`)),2) AS `Percent` from `licenses` order by `licenses`.`name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `DstrbtnBySlackVersion`
--

/*!50001 DROP VIEW IF EXISTS `DstrbtnBySlackVersion`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `DstrbtnBySlackVersion` AS select `slackvers`.`name` AS `Name`,`slackvers`.`packages` AS `Packages`,round(((`slackvers`.`packages` * 100) / (select count(0) from `packages`)),2) AS `Percent` from `slackvers` order by `slackvers`.`name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `DstrbtnByTime`
--

/*!50001 DROP VIEW IF EXISTS `DstrbtnByTime`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `DstrbtnByTime` AS select year(`packages`.`filedate`) AS `Year`,month(`packages`.`filedate`) AS `Month`,count(0) AS `Packages` from `packages` group by year(`packages`.`filedate`),month(`packages`.`filedate`) order by year(`packages`.`filedate`) desc,month(`packages`.`filedate`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Latest20`
--

/*!50001 DROP VIEW IF EXISTS `Latest20`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `Latest20` AS select `p`.`id` AS `Id`,`p`.`filedate` AS `Date`,`p`.`name` AS `Name`,`p`.`version` AS `Version`,`p`.`build` AS `Build`,`lic`.`name` AS `License`,`p`.`arch` AS `Arch`,`a`.`name` AS `Architecture`,`s`.`name` AS `Slack`,`p`.`url` AS `URL`,`p`.`description` AS `Description` from (((`packages` `p` join `licenses` `lic`) join `archs` `a`) join `slackvers` `s`) where ((`p`.`license` = `lic`.`id`) and (`p`.`arch` = `a`.`id`) and (`p`.`slackver` = `s`.`id`)) order by `p`.`filedate` desc limit 20 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `NewsCal`
--

/*!50001 DROP VIEW IF EXISTS `NewsCal`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `NewsCal` AS select month(`nmy`.`published`) AS `Month`,year(`nmy`.`published`) AS `Year`,count(0) AS `News` from `news` `nmy` where (`nmy`.`published` is not null) group by month(`nmy`.`published`),year(`nmy`.`published`) union all select 99 AS `Month`,year(`ny`.`published`) AS `Year`,count(0) AS `News` from `news` `ny` where (`ny`.`published` is not null) group by year(`ny`.`published`) order by `Year` desc,`Month` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Totals`
--

/*!50001 DROP VIEW IF EXISTS `Totals`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `Totals` AS select count(0) AS `TotalCount`,count(distinct `packages`.`name`) AS `DstnctCount`,sum(`packages`.`filesize`) AS `TotalSize` from `packages` where (`packages`.`status` = 'ok') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Versions`
--

/*!50001 DROP VIEW IF EXISTS `Versions`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `Versions` AS select `pkgs`.`Title` AS `Name`,`pkgs`.`Category` AS `Category`,max(`pkgs`.`Slack102`) AS `Slack102`,max(`pkgs`.`Slack110`) AS `Slack110`,max(`pkgs`.`Slack120`) AS `Slack120`,max(`pkgs`.`Slack121`) AS `Slack121`,max(`pkgs`.`Slack122`) AS `Slack122`,max(`pkgs`.`Slack130`) AS `Slack130`,max(`pkgs`.`Slack131`) AS `Slack131`,max(`pkgs`.`Slack1337`) AS `Slack1337`,max(`pkgs`.`Slack140`) AS `Slack140`,max(`pkgs`.`Slack141`) AS `Slack141`,max(`pkgs`.`Slack142`) AS `Slack142` from (select `p102`.`title` AS `Title`,`c`.`name` AS `Category`,`p102`.`version` AS `Slack102`,NULL AS `Slack110`,NULL AS `Slack120`,NULL AS `Slack121`,NULL AS `Slack122`,NULL AS `Slack130`,NULL AS `Slack131`,NULL AS `Slack1337`,NULL AS `Slack140`,NULL AS `Slack141`,NULL AS `Slack142` from (`categories` `c` join `packages` `p102`) where ((`p102`.`slackver` = 102) and (`p102`.`status` = 'ok') and (`p102`.`category` = `c`.`id`)) union all select `p110`.`title` AS `Title`,`c`.`name` AS `Category`,NULL AS `Slack102`,`p110`.`version` AS `Slack110`,NULL AS `Slack120`,NULL AS `Slack121`,NULL AS `Slack122`,NULL AS `Slack130`,NULL AS `Slack131`,NULL AS `Slack1337`,NULL AS `Slack140`,NULL AS `Slack141`,NULL AS `Slack142` from (`categories` `c` join `packages` `p110`) where ((`p110`.`slackver` = 110) and (`p110`.`status` = 'ok') and (`p110`.`category` = `c`.`id`)) union all select `p120`.`title` AS `Title`,`c`.`name` AS `Category`,NULL AS `Slack102`,NULL AS `Slack110`,`p120`.`version` AS `Slack120`,NULL AS `Slack121`,NULL AS `Slack122`,NULL AS `Slack130`,NULL AS `Slack131`,NULL AS `Slack1337`,NULL AS `Slack140`,NULL AS `Slack141`,NULL AS `Slack142` from (`categories` `c` join `packages` `p120`) where ((`p120`.`slackver` = 120) and (`p120`.`status` = 'ok') and (`p120`.`category` = `c`.`id`)) union all select `p121`.`title` AS `Title`,`c`.`name` AS `Category`,NULL AS `Slack102`,NULL AS `Slack110`,NULL AS `Slack120`,`p121`.`version` AS `Slack121`,NULL AS `Slack122`,NULL AS `Slack130`,NULL AS `Slack131`,NULL AS `Slack1337`,NULL AS `Slack140`,NULL AS `Slack141`,NULL AS `Slack142` from (`categories` `c` join `packages` `p121`) where ((`p121`.`slackver` = 121) and (`p121`.`status` = 'ok') and (`p121`.`category` = `c`.`id`)) union all select `p122`.`title` AS `Title`,`c`.`name` AS `Category`,NULL AS `Slack102`,NULL AS `Slack110`,NULL AS `Slack120`,NULL AS `Slack121`,`p122`.`version` AS `Slack122`,NULL AS `Slack130`,NULL AS `Slack131`,NULL AS `Slack1337`,NULL AS `Slack140`,NULL AS `Slack141`,NULL AS `Slack142` from (`categories` `c` join `packages` `p122`) where ((`p122`.`slackver` = 122) and (`p122`.`status` = 'ok') and (`p122`.`category` = `c`.`id`)) union all select `p130`.`title` AS `Title`,`c`.`name` AS `Category`,NULL AS `Slack102`,NULL AS `Slack110`,NULL AS `Slack120`,NULL AS `Slack121`,NULL AS `Slack122`,`p130`.`version` AS `Slack130`,NULL AS `Slack131`,NULL AS `Slack1337`,NULL AS `Slack140`,NULL AS `Slack141`,NULL AS `Slack142` from (`categories` `c` join `packages` `p130`) where ((`p130`.`slackver` = 130) and (`p130`.`status` = 'ok') and (`p130`.`category` = `c`.`id`)) union all select `p131`.`title` AS `Title`,`c`.`name` AS `Category`,NULL AS `Slack102`,NULL AS `Slack110`,NULL AS `Slack120`,NULL AS `Slack121`,NULL AS `Slack122`,NULL AS `Slack130`,`p131`.`version` AS `Slack131`,NULL AS `Slack1337`,NULL AS `Slack140`,NULL AS `Slack141`,NULL AS `Slack142` from (`categories` `c` join `packages` `p131`) where ((`p131`.`slackver` = 131) and (`p131`.`status` = 'ok') and (`p131`.`category` = `c`.`id`)) union all select `p133`.`title` AS `Title`,`c`.`name` AS `Category`,NULL AS `Slack102`,NULL AS `Slack110`,NULL AS `Slack120`,NULL AS `Slack121`,NULL AS `Slack122`,NULL AS `Slack130`,NULL AS `Slack131`,`p133`.`version` AS `Slack1337`,NULL AS `Slack140`,NULL AS `Slack141`,NULL AS `Slack142` from (`categories` `c` join `packages` `p133`) where ((`p133`.`slackver` = 1337) and (`p133`.`status` = 'ok') and (`p133`.`category` = `c`.`id`)) union all select `p140`.`title` AS `Title`,`c`.`name` AS `Category`,NULL AS `Slack102`,NULL AS `Slack110`,NULL AS `Slack120`,NULL AS `Slack121`,NULL AS `Slack122`,NULL AS `Slack130`,NULL AS `Slack131`,NULL AS `Slack1337`,`p140`.`version` AS `Slack140`,NULL AS `Slack141`,NULL AS `Slack142` from (`categories` `c` join `packages` `p140`) where ((`p140`.`slackver` = 140) and (`p140`.`status` = 'ok') and (`p140`.`category` = `c`.`id`)) union all select `p141`.`title` AS `Title`,`c`.`name` AS `Category`,NULL AS `Slack102`,NULL AS `Slack110`,NULL AS `Slack120`,NULL AS `Slack121`,NULL AS `Slack122`,NULL AS `Slack130`,NULL AS `Slack131`,NULL AS `Slack1337`,NULL AS `Slack140`,`p141`.`version` AS `Slack141`,NULL AS `Slack142` from (`categories` `c` join `packages` `p141`) where ((`p141`.`slackver` = 141) and (`p141`.`status` = 'ok') and (`p141`.`category` = `c`.`id`)) union all select `p142`.`title` AS `Title`,`c`.`name` AS `Category`,NULL AS `Slack102`,NULL AS `Slack110`,NULL AS `Slack120`,NULL AS `Slack121`,NULL AS `Slack122`,NULL AS `Slack130`,NULL AS `Slack131`,NULL AS `Slack1337`,NULL AS `Slack140`,NULL AS `Slack141`,`p142`.`version` AS `Slack142` from (`categories` `c` join `packages` `p142`) where ((`p142`.`slackver` = 142) and (`p142`.`status` = 'ok') and (`p142`.`category` = `c`.`id`))) `pkgs` group by `pkgs`.`Title`,`pkgs`.`Category` order by `pkgs`.`Title` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-20 20:36:36
