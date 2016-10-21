-- MySQL dump 10.13  Distrib 5.7.16, for Linux (x86_64)
--
-- Host: localhost    Database: slackpack
-- ------------------------------------------------------
-- Server version	5.7.16-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
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
SET character_set_client = utf8;
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
SET character_set_client = utf8;
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
SET character_set_client = utf8;
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
SET character_set_client = utf8;
/*!50001 CREATE VIEW `DstrbtnByCategory` AS SELECT 
 1 AS `Name`,
 1 AS `Packages`,
 1 AS `Percent`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `DstrbtnByFormat`
--

DROP TABLE IF EXISTS `DstrbtnByFormat`;
/*!50001 DROP VIEW IF EXISTS `DstrbtnByFormat`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `DstrbtnByFormat` AS SELECT 
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
SET character_set_client = utf8;
/*!50001 CREATE VIEW `DstrbtnByLicense` AS SELECT 
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
SET character_set_client = utf8;
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
SET character_set_client = utf8;
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
SET character_set_client = utf8;
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
SET character_set_client = utf8;
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
SET character_set_client = utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `archs` (
  `id` char(8) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `name` varchar(40) CHARACTER SET latin1 NOT NULL COMMENT 'Descriptive architecture name',
  `def` enum('no','yes') NOT NULL DEFAULT 'no' COMMENT 'Whether this architecture should be preselected in GUI elements such combos',
  `packages_total` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Total number of the packages for this acritecture',
  `packages` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Number of active packages for this architecture',
  PRIMARY KEY (`id`),
  KEY `idx_name` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Slackware Architectures';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT 'Category name',
  `name_bg` varchar(32) NOT NULL COMMENT 'Category name in Bulgarian',
  `packages_total` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Total number of the packages in this category',
  `packages` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Number of active packages in this category',
  PRIMARY KEY (`id`),
  KEY `idx_name` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Package categories';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `errors`
--

DROP TABLE IF EXISTS `errors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `errors` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `errid` varchar(16) CHARACTER SET ascii NOT NULL COMMENT 'Internal error code',
  `errcode` varchar(16) CHARACTER SET ascii DEFAULT NULL COMMENT 'External error code',
  `errmsg` varchar(256) NOT NULL COMMENT 'Text of the error message',
  `source` varchar(256) CHARACTER SET ascii DEFAULT NULL COMMENT 'Source of the error (program name, etc)',
  `type` enum('db','sys','usr','sp') NOT NULL COMMENT 'Type of the error - database, system, user, slackpack',
  `level` enum('info','warn','err') NOT NULL COMMENT 'Error level',
  `date` datetime NOT NULL COMMENT 'Date and time at which the error was recorded',
  PRIMARY KEY (`id`),
  KEY `idx_type` (`type`),
  KEY `idx_date` (`date`),
  KEY `new_level` (`level`),
  KEY `idx_errid` (`errid`),
  KEY `idx_errcode` (`errcode`),
  FULLTEXT KEY `idx_errmsg` (`errmsg`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Register for all errors that SlackPack encounters';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER  `slackpack`.`errors_ins` BEFORE INSERT ON `errors` FOR EACH ROW BEGIN
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `licenses` (
  `id` char(8) CHARACTER SET ascii NOT NULL,
  `name` varchar(30) CHARACTER SET ascii NOT NULL COMMENT 'License name',
  `description` text COMMENT 'Short description',
  `url` varchar(256) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL COMMENT 'URL with more info about the license or the official page of the license',
  `def` enum('no','yes') CHARACTER SET ascii NOT NULL DEFAULT 'no' COMMENT 'Whether this license should be preselected in GUI elements like combos',
  `packages_total` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Total number of the packages with this license',
  `packages` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Number of active packages with this license',
  `gpl_compat` enum('n','y') CHARACTER SET ascii DEFAULT NULL COMMENT 'Whether the license GPL Compatible. See http://www.gnu.org/licenses/license-list.html for more details.',
  PRIMARY KEY (`id`),
  KEY `idx_name` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Software licenses catalog';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `links`
--

DROP TABLE IF EXISTS `links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL COMMENT 'Link''s title',
  `title_bg` varchar(64) NOT NULL COMMENT 'Link''s title in Bulgarian',
  `url` varchar(256) NOT NULL COMMENT 'Link''s URL',
  `type` enum('leftbar','about','other') NOT NULL DEFAULT 'other' COMMENT 'Type of the link - where it''s used',
  `priority` int(10) unsigned NOT NULL,
  `status` enum('active','inactive','pending') NOT NULL DEFAULT 'pending' COMMENT 'Link''s status',
  PRIMARY KEY (`id`),
  KEY `idx_type_status` (`type`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mirrors`
--

DROP TABLE IF EXISTS `mirrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mirrors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL COMMENT 'Mirror name',
  `home_url` varchar(256) DEFAULT NULL COMMENT 'Mirror home page',
  `loc_city` varchar(64) DEFAULT NULL COMMENT 'Geographical location - city',
  `loc_country` varchar(32) NOT NULL COMMENT 'Geographical location - country',
  `loc_continent` varchar(16) NOT NULL COMMENT 'Geographical location - continent',
  `speed_local` int(10) unsigned DEFAULT NULL COMMENT 'Local speed in bps',
  `speed_int` int(10) unsigned DEFAULT NULL COMMENT 'International speed in bps',
  `sync_hours` int(10) unsigned DEFAULT NULL COMMENT 'Synchronization is done every how many hours',
  `sync_start` time DEFAULT NULL COMMENT 'First synchronization is done at what time',
  `logo` blob COMMENT 'Mirror logo image. Should be a png file with 88x31 dimension',
  `prime` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Whether this is primary site or not',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_name` (`name`) USING BTREE,
  KEY `idx_location` (`loc_city`,`loc_country`,`loc_continent`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SlackPack mirrors information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mirrors_dtl`
--

DROP TABLE IF EXISTS `mirrors_dtl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mirrors_dtl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mirror` int(11) NOT NULL COMMENT 'Reference to the general mirror info',
  `protocol` enum('ftp','http','rsync') NOT NULL COMMENT 'Protocol name',
  `url` varchar(1024) NOT NULL COMMENT 'Relative URL to the repositories',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_mirror` (`mirror`) USING BTREE,
  CONSTRAINT `fk_mirror` FOREIGN KEY (`mirror`) REFERENCES `mirrors` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Definitions of mirror protocols';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  `published` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `author` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_published` (`published`) USING BTREE,
  KEY `idx_update` (`updated`) USING BTREE,
  KEY `idx_author` (`author`) USING BTREE,
  CONSTRAINT `fk_news_author` FOREIGN KEY (`author`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Site news';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER  `slackpack`.`news_ins` BEFORE INSERT ON `news` FOR EACH ROW BEGIN
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
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER  `slackpack`.`news_updt` BEFORE UPDATE ON `news` FOR EACH ROW BEGIN
  SET NEW.updated = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `packages`
--

DROP TABLE IF EXISTS `packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `packages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL COMMENT 'Package UNIX name',
  `title` varchar(256) NOT NULL COMMENT 'Package name',
  `version` varchar(20) NOT NULL COMMENT 'Package version',
  `releasedate` date DEFAULT NULL COMMENT 'Version release date',
  `build` varchar(10) NOT NULL COMMENT 'Package build number',
  `license` char(8) CHARACTER SET ascii NOT NULL COMMENT 'Package license reference',
  `arch` char(8) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Package architecture reference',
  `slackver` int(10) unsigned NOT NULL COMMENT 'Package format (Slackware version) reference',
  `url` varchar(256) DEFAULT NULL COMMENT 'Project URL',
  `vendor` int(10) unsigned NOT NULL,
  `description` text COMMENT 'Package description',
  `serie` varchar(8) DEFAULT NULL,
  `category` int(10) unsigned NOT NULL COMMENT 'Package category',
  `slackbuild` enum('no','yes') NOT NULL DEFAULT 'no' COMMENT 'Is build script included',
  `frombinary` enum('no','yes') NOT NULL DEFAULT 'no' COMMENT 'Is it from binary release',
  `filename` varchar(256) NOT NULL COMMENT 'Package file name',
  `filesize` int(10) unsigned DEFAULT NULL COMMENT 'Package file size',
  `fileurl` varchar(1024) DEFAULT NULL COMMENT 'Package relative file URL',
  `filemd5` char(32) NOT NULL COMMENT 'MD5 hash for the package file',
  `filesign` text COMMENT 'GPG signature of the package file',
  `filedate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Package file creation date/time',
  `author` int(10) unsigned NOT NULL COMMENT 'Package author reference',
  `status` enum('ok','del','old','wait') NOT NULL DEFAULT 'ok' COMMENT 'Status of the package:\n''ok'' - means active, current pacakge\n''old'' - means obsoleted package\n''del'' - means deleted package\n''wait'' - means package which is not yet published',
  `versioned` enum('y','n') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_name` (`name`) USING BTREE,
  KEY `idx_version` (`version`) USING BTREE,
  KEY `idx_arch` (`arch`) USING BTREE,
  KEY `idx_license` (`license`) USING BTREE,
  KEY `idx_author` (`author`) USING BTREE,
  KEY `idx_slackbuild` (`slackbuild`) USING BTREE,
  KEY `idx_slackver` (`slackver`) USING BTREE,
  KEY `idx_category` (`category`) USING BTREE,
  KEY `idx_status` (`status`) USING BTREE,
  KEY `fk_vendor_idx` (`vendor`),
  KEY `fk_serie_idx` (`serie`),
  CONSTRAINT `fk_arch` FOREIGN KEY (`arch`) REFERENCES `archs` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_author` FOREIGN KEY (`author`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_category` FOREIGN KEY (`category`) REFERENCES `categories` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_license` FOREIGN KEY (`license`) REFERENCES `licenses` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_serie` FOREIGN KEY (`serie`) REFERENCES `soft_series` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_slackver` FOREIGN KEY (`slackver`) REFERENCES `slackvers` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_vendor` FOREIGN KEY (`vendor`) REFERENCES `vendors` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Slackwrare Packages Register';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER  `slackpack`.`packages_ai` AFTER INSERT ON `packages` FOR EACH ROW BEGIN
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
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER  `slackpack`.`packages_au` AFTER UPDATE ON `packages` FOR EACH ROW BEGIN
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
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER  `slackpack`.`packages_ad` AFTER DELETE ON `packages` FOR EACH ROW BEGIN
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `searches` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `query` varchar(128) NOT NULL COMMENT 'The query as passed from the search form',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The data at which the query was processed',
  `results` int(10) unsigned NOT NULL COMMENT 'Count of the returned packages',
  `arch` varchar(8) DEFAULT NULL COMMENT 'The selected architecture',
  `slackver` int(10) unsigned DEFAULT NULL COMMENT 'The selected Slackware version',
  `f_latestonly` enum('n','y') DEFAULT NULL COMMENT 'Whether ''Only latest'' was checked',
  `f_gplonly` enum('n','y') DEFAULT NULL COMMENT 'Whether ''Only GPL'' was checked',
  `f_sponly` enum('n','y') DEFAULT NULL COMMENT 'Whether ''Only with SlackBuild'' was checked',
  `f_nobin` enum('n','y') DEFAULT NULL COMMENT 'Whether ''no-binary'' was checked',
  PRIMARY KEY (`id`),
  KEY `idx_date` (`date`),
  KEY `idx_arch` (`arch`),
  KEY `idx_sver` (`slackver`),
  KEY `idx_flatestonly` (`f_latestonly`),
  KEY `idx_fgplonly` (`f_gplonly`),
  KEY `idx_fsponly` (`f_sponly`),
  KEY `idx_fnobin` (`f_nobin`),
  FULLTEXT KEY `idx_query` (`query`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Search queries register';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `slackvers`
--

DROP TABLE IF EXISTS `slackvers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slackvers` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(30) NOT NULL COMMENT 'Descriptive version name',
  `released` date DEFAULT NULL COMMENT 'Release date',
  `def` enum('no','yes') NOT NULL DEFAULT 'no' COMMENT 'Whether this version should be preselected in GUI elements such combos',
  `packages_total` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Total number of the packages for this Slackware version',
  `packages` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Number of active packages for this Slackware version',
  `str` varchar(10) NOT NULL COMMENT 'Version as a string',
  PRIMARY KEY (`id`),
  KEY `idx_released` (`released`) USING BTREE,
  KEY `idx_name` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Slackware Versions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `soft_series`
--

DROP TABLE IF EXISTS `soft_series`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `soft_series` (
  `id` varchar(8) NOT NULL,
  `title` text NOT NULL COMMENT 'Description',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_softseries_id_unq` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Software series';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sources`
--

DROP TABLE IF EXISTS `sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT 'Source pacakges and resources',
  `since` date DEFAULT NULL COMMENT 'Information effective since',
  `homepage_url` varchar(128) NOT NULL COMMENT 'Official site URL',
  `downloads_url` varchar(128) DEFAULT NULL COMMENT 'Downloads URL',
  `src_repo_url` varchar(128) DEFAULT NULL COMMENT '\nSource code repository URL',
  `bugs_url` varchar(128) DEFAULT NULL,
  `annon_ml_url` varchar(128) DEFAULT NULL COMMENT 'Release announcements mailing list URL',
  `annon_feed_url` varchar(128) DEFAULT NULL COMMENT 'Release announcements feed URL',
  `news_url` varchar(128) DEFAULT NULL COMMENT 'URL of news webpage',
  `advert_url` varchar(128) DEFAULT NULL COMMENT 'URL back to SlackPack',
  PRIMARY KEY (`id`),
  KEY `fk_src_pack_idx` (`name`),
  CONSTRAINT `fk_src_pack` FOREIGN KEY (`name`) REFERENCES `packages` (`name`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL COMMENT 'Name',
  `firstname` varchar(60) NOT NULL COMMENT 'First name',
  `nick` varchar(30) DEFAULT NULL COMMENT 'Nickname',
  `pkgsid` varchar(5) NOT NULL COMMENT 'The identifier used on packages',
  `email` varchar(256) NOT NULL COMMENT 'Users''s email',
  `password` char(42) NOT NULL COMMENT 'Users''s password as md5 hash',
  `registered` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Date of registration',
  `packages` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Number of the packages for this user',
  `lp_user` varchar(10) DEFAULT NULL COMMENT 'Username in linuxpackages.net',
  `lp_pass` blob COMMENT 'Password in linuxpackages.net encoded with AES',
  PRIMARY KEY (`id`),
  KEY `idx_name` (`name`) USING BTREE,
  KEY `idx_firstname` (`firstname`) USING BTREE,
  KEY `idx_nick` (`nick`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Package authors register';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vendors`
--

DROP TABLE IF EXISTS `vendors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendors` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(16) NOT NULL COMMENT 'Vendor''s short name',
  `title` varchar(64) NOT NULL COMMENT 'Vendor''s full name',
  `homeurl` varchar(256) NOT NULL COMMENT 'Vendor''s URL',
  `packages_total` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Total number of packages for the vendor',
  `packages` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Number of avtive packages for the vendor',
  PRIMARY KEY (`id`),
  KEY `idx_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Software vendors register';
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
/*!50003 SET character_set_client  = utf8 */ ;;
/*!50003 SET character_set_results = utf8 */ ;;
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
/*!50003 DROP FUNCTION IF EXISTS `percent_binrel` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
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
/*!50003 DROP FUNCTION IF EXISTS `percent_cur` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `percent_cur`() RETURNS float
    READS SQL DATA
    COMMENT 'Find the percent of the packages for Slackware Current'
BEGIN
  DECLARE cur_count INT;
  DECLARE all_count INT;
  SELECT count(*) INTO cur_count FROM packages WHERE slackver = '99999';
  SELECT count(*) INTO all_count FROM packages;
  RETURN (cur_count / all_count) * 100;
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
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
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
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
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
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
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
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `AvrgByMonth` AS select year(`packages`.`filedate`) AS `Year`,(count(0) / 12) AS `Average` from `packages` group by year(`packages`.`filedate`) desc */;
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
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `DstrbtnByArch` AS select `archs`.`name` AS `Name`,`archs`.`packages` AS `Packages`,round(((`archs`.`packages` * 100) / (select count(0) AS `count(*)` from `packages`)),2) AS `Percent` from `archs` order by `archs`.`name` */;
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
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `DstrbtnByCategory` AS select `categories`.`name` AS `Name`,`categories`.`packages` AS `Packages`,round(((`categories`.`packages` * 100) / (select count(0) AS `count(*)` from `packages`)),2) AS `Percent` from `categories` order by `categories`.`name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `DstrbtnByFormat`
--

/*!50001 DROP VIEW IF EXISTS `DstrbtnByFormat`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `DstrbtnByFormat` AS select `slackvers`.`name` AS `Name`,`slackvers`.`packages` AS `Packages`,round(((`slackvers`.`packages` * 100) / (select count(0) AS `count(*)` from `packages`)),2) AS `Percent` from `slackvers` order by `slackvers`.`name` */;
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
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `DstrbtnByLicense` AS select `licenses`.`name` AS `Name`,`licenses`.`packages` AS `Packages`,round(((`licenses`.`packages` * 100) / (select count(0) AS `count(*)` from `packages`)),2) AS `Percent` from `licenses` order by `licenses`.`name` */;
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
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `DstrbtnByTime` AS select year(`packages`.`filedate`) AS `Year`,month(`packages`.`filedate`) AS `Month`,count(0) AS `Packages` from `packages` group by year(`packages`.`filedate`) desc,month(`packages`.`filedate`) desc */;
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
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
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
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `NewsCal` AS select month(`nws`.`published`) AS `Month`,year(`nws`.`published`) AS `Year`,count(0) AS `News` from `news` `nws` group by month(`nws`.`published`),year(`nws`.`published`) order by year(`nws`.`published`) desc,month(`nws`.`published`) desc */;
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
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `Totals` AS select count(0) AS `TotalCount`,count(distinct `packages`.`name`) AS `DstnctCount`,sum(`packages`.`filesize`) AS `TotalSize` from `packages` where (`packages`.`status` = _utf8'ok') */;
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
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `Versions` AS select `p`.`title` AS `Name`,`c`.`name` AS `Category`,max(`p102`.`version`) AS `Slack102`,max(`p110`.`version`) AS `Slack110`,max(`p120`.`version`) AS `Slack120`,max(`p121`.`version`) AS `Slack121`,max(`p122`.`version`) AS `Slack122`,max(`p130`.`version`) AS `Slack130`,max(`p131`.`version`) AS `Slack131`,max(`p133`.`version`) AS `Slack1337`,max(`p140`.`version`) AS `Slack140`,max(`p141`.`version`) AS `Slack141`,max(`p142`.`version`) AS `Slack142` from ((((((((((((`packages` `p` left join `categories` `c` on((`p`.`category` = `c`.`id`))) left join `packages` `p102` on(((`p102`.`name` = `p`.`name`) and (`p102`.`slackver` = 102) and (`p102`.`status` = 'ok')))) left join `packages` `p110` on(((`p110`.`name` = `p`.`name`) and (`p110`.`slackver` = 110) and (`p110`.`status` = 'ok')))) left join `packages` `p120` on(((`p120`.`name` = `p`.`name`) and (`p120`.`slackver` = 120) and (`p120`.`status` = 'ok')))) left join `packages` `p121` on(((`p121`.`name` = `p`.`name`) and (`p121`.`slackver` = 121) and (`p121`.`status` = 'ok')))) left join `packages` `p122` on(((`p122`.`name` = `p`.`name`) and (`p122`.`slackver` = 122) and (`p122`.`status` = 'ok')))) left join `packages` `p130` on(((`p130`.`name` = `p`.`name`) and (`p130`.`slackver` = 130) and (`p130`.`status` = 'ok')))) left join `packages` `p131` on(((`p131`.`name` = `p`.`name`) and (`p131`.`slackver` = 131) and (`p131`.`status` = 'ok')))) left join `packages` `p133` on(((`p133`.`name` = `p`.`name`) and (`p133`.`slackver` = 1337) and (`p133`.`status` = 'ok')))) left join `packages` `p140` on(((`p140`.`name` = `p`.`name`) and (`p140`.`slackver` = 140) and (`p140`.`status` = 'ok')))) left join `packages` `p141` on(((`p141`.`name` = `p`.`name`) and (`p141`.`slackver` = 141) and (`p141`.`status` = 'ok')))) left join `packages` `p142` on(((`p142`.`name` = `p`.`name`) and (`p142`.`slackver` = 142) and (`p142`.`status` = 'ok')))) where (`p`.`slackver` <> 99999) group by `p`.`name` order by `p`.`title` */;
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

-- Dump completed on 2016-10-21 21:29:15
