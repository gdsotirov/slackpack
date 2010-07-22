-- MySQL dump 10.13  Distrib 5.1.48, for slackware-linux-gnu (i486)
--
-- Host: localhost    Database: slackpack
-- ------------------------------------------------------
-- Server version	5.1.48-log


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
-- Temporary table structure for view `AgingBuilds`
--

DROP TABLE IF EXISTS `AgingBuilds`;
/*!50001 DROP VIEW IF EXISTS `AgingBuilds`*/;
/*!50001 CREATE TABLE `AgingBuilds` (
  `Name` varchar(128),
  `LastReleaseDate` date,
  `LastVersion` varchar(20),
  `LastBuild` timestamp,
  `URL` varchar(256)
) ENGINE=MyISAM */;

--
-- Temporary table structure for view `AvrgByMonth`
--

DROP TABLE IF EXISTS `AvrgByMonth`;
/*!50001 DROP VIEW IF EXISTS `AvrgByMonth`*/;
/*!50001 CREATE TABLE `AvrgByMonth` (
  `Year` int(4),
  `Average` decimal(24,4)
) ENGINE=MyISAM */;

--
-- Temporary table structure for view `DstrbtnByArch`
--

DROP TABLE IF EXISTS `DstrbtnByArch`;
/*!50001 DROP VIEW IF EXISTS `DstrbtnByArch`*/;
/*!50001 CREATE TABLE `DstrbtnByArch` (
  `Name` varchar(40),
  `Packages` int(10) unsigned,
  `Percent` decimal(17,2)
) ENGINE=MyISAM */;

--
-- Temporary table structure for view `DstrbtnByCategory`
--

DROP TABLE IF EXISTS `DstrbtnByCategory`;
/*!50001 DROP VIEW IF EXISTS `DstrbtnByCategory`*/;
/*!50001 CREATE TABLE `DstrbtnByCategory` (
  `Name` varchar(32),
  `Packages` int(10) unsigned,
  `Percent` decimal(17,2)
) ENGINE=MyISAM */;

--
-- Temporary table structure for view `DstrbtnByFormat`
--

DROP TABLE IF EXISTS `DstrbtnByFormat`;
/*!50001 DROP VIEW IF EXISTS `DstrbtnByFormat`*/;
/*!50001 CREATE TABLE `DstrbtnByFormat` (
  `Name` varchar(30),
  `Packages` int(10) unsigned,
  `Percent` decimal(17,2)
) ENGINE=MyISAM */;

--
-- Temporary table structure for view `DstrbtnByLicense`
--

DROP TABLE IF EXISTS `DstrbtnByLicense`;
/*!50001 DROP VIEW IF EXISTS `DstrbtnByLicense`*/;
/*!50001 CREATE TABLE `DstrbtnByLicense` (
  `Name` varchar(30),
  `Packages` int(10) unsigned,
  `Percent` decimal(17,2)
) ENGINE=MyISAM */;

--
-- Temporary table structure for view `DstrbtnByTime`
--

DROP TABLE IF EXISTS `DstrbtnByTime`;
/*!50001 DROP VIEW IF EXISTS `DstrbtnByTime`*/;
/*!50001 CREATE TABLE `DstrbtnByTime` (
  `Year` int(4),
  `Month` int(2),
  `Packages` bigint(21)
) ENGINE=MyISAM */;

--
-- Temporary table structure for view `Latest20`
--

DROP TABLE IF EXISTS `Latest20`;
/*!50001 DROP VIEW IF EXISTS `Latest20`*/;
/*!50001 CREATE TABLE `Latest20` (
  `Id` int(10) unsigned,
  `Date` timestamp,
  `Name` varchar(128),
  `Version` varchar(20),
  `Build` varchar(10),
  `License` varchar(30),
  `Arch` char(8),
  `Architecture` varchar(40),
  `Slack` varchar(30),
  `URL` varchar(256),
  `Description` text
) ENGINE=MyISAM */;

--
-- Temporary table structure for view `NewsCal`
--

DROP TABLE IF EXISTS `NewsCal`;
/*!50001 DROP VIEW IF EXISTS `NewsCal`*/;
/*!50001 CREATE TABLE `NewsCal` (
  `Month` int(2),
  `Year` int(4),
  `News` bigint(21)
) ENGINE=MyISAM */;

--
-- Temporary table structure for view `Totals`
--

DROP TABLE IF EXISTS `Totals`;
/*!50001 DROP VIEW IF EXISTS `Totals`*/;
/*!50001 CREATE TABLE `Totals` (
  `TotalCount` bigint(21),
  `DstnctCount` bigint(21),
  `TotalSize` decimal(33,0)
) ENGINE=MyISAM */;

--
-- Temporary table structure for view `Versions`
--

DROP TABLE IF EXISTS `Versions`;
/*!50001 DROP VIEW IF EXISTS `Versions`*/;
/*!50001 CREATE TABLE `Versions` (
  `Name` varchar(256),
  `Category` varchar(32),
  `Slack102` varchar(20),
  `Slack110` varchar(20),
  `Slack120` varchar(20),
  `Slack121` varchar(20),
  `Slack122` varchar(20),
  `Slack130` varchar(20),
  `Slack131` varchar(20)
) ENGINE=MyISAM */;

--
-- Table structure for table `archs`
--

DROP TABLE IF EXISTS `archs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `archs` (
  `id` char(8) character set latin1 collate latin1_general_ci NOT NULL default '',
  `name` varchar(40) character set latin1 NOT NULL COMMENT 'Descriptive architecture name',
  `def` enum('no','yes') NOT NULL default 'no' COMMENT 'Whether this architecture should be preselected in GUI elements such combos',
  `packages_total` int(10) unsigned NOT NULL default '0' COMMENT 'Total number of the packages for this acritecture',
  `packages` int(10) unsigned NOT NULL default '0' COMMENT 'Number of active packages for this architecture',
  PRIMARY KEY  (`id`),
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
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(32) NOT NULL COMMENT 'Category name',
  `name_bg` varchar(32) NOT NULL COMMENT 'Category name in Bulgarian',
  `packages_total` int(10) unsigned NOT NULL default '0' COMMENT 'Total number of the packages in this category',
  `packages` int(10) unsigned NOT NULL default '0' COMMENT 'Number of active packages in this category',
  PRIMARY KEY  (`id`),
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
  `id` int(10) unsigned NOT NULL auto_increment,
  `errid` varchar(16) character set ascii NOT NULL COMMENT 'Internal error code',
  `errcode` varchar(16) character set ascii default NULL COMMENT 'External error code',
  `errmsg` varchar(256) NOT NULL COMMENT 'Text of the error message',
  `source` varchar(256) character set ascii default NULL COMMENT 'Source of the error (program name, etc)',
  `type` enum('db','sys','usr','sp') NOT NULL COMMENT 'Type of the error - database, system, user, slackpack',
  `level` enum('info','warn','err') NOT NULL COMMENT 'Error level',
  `date` datetime NOT NULL COMMENT 'Date and time at which the error was recorded',
  PRIMARY KEY  (`id`),
  KEY `idx_type` (`type`),
  KEY `idx_date` (`date`),
  KEY `new_level` (`level`),
  KEY `idx_errid` (`errid`),
  KEY `idx_errcode` (`errcode`),
  FULLTEXT KEY `idx_errmsg` (`errmsg`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Register for all errors that SlackPack encounters';
/*!40101 SET character_set_client = @saved_cs_client */;

/*!50003 SET @SAVE_SQL_MODE=@@SQL_MODE*/;

DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="" */;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER  `slackpack`.`errors_ins` BEFORE INSERT ON `errors` FOR EACH ROW BEGIN
  SET NEW.date = NOW();
END */;;

DELIMITER ;
/*!50003 SET SESSION SQL_MODE=@SAVE_SQL_MODE*/;

--
-- Table structure for table `licenses`
--

DROP TABLE IF EXISTS `licenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `licenses` (
  `id` char(8) character set ascii NOT NULL,
  `name` varchar(30) character set ascii NOT NULL COMMENT 'License name',
  `description` text COMMENT 'Short description',
  `url` varchar(256) character set latin1 collate latin1_general_ci default NULL COMMENT 'URL with more info about the license or the official page of the license',
  `def` enum('no','yes') character set ascii NOT NULL default 'no' COMMENT 'Whether this license should be preselected in GUI elements like combos',
  `packages_total` int(10) unsigned NOT NULL default '0' COMMENT 'Total number of the packages with this license',
  `packages` int(10) unsigned NOT NULL default '0' COMMENT 'Number of active packages with this license',
  `gpl_compat` enum('n','y') character set ascii default NULL COMMENT 'Is the license GPL Compatible?',
  PRIMARY KEY  (`id`),
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
  `id` int(10) unsigned NOT NULL auto_increment,
  `title` varchar(64) NOT NULL COMMENT 'Link''s title',
  `title_bg` varchar(64) NOT NULL COMMENT 'Link''s title in Bulgarian',
  `url` varchar(256) NOT NULL COMMENT 'Link''s URL',
  `type` enum('leftbar','about','other') NOT NULL default 'other' COMMENT 'Type of the link - where it''s used',
  `priority` int(10) unsigned NOT NULL,
  `status` enum('active','inactive','pending') NOT NULL default 'pending' COMMENT 'Link''s status',
  PRIMARY KEY  (`id`),
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
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(128) NOT NULL COMMENT 'Mirror name',
  `home_url` varchar(256) default NULL COMMENT 'Mirror home page',
  `loc_city` varchar(64) default NULL COMMENT 'Geographical location - city',
  `loc_country` varchar(32) NOT NULL COMMENT 'Geographical location - country',
  `loc_continent` varchar(16) NOT NULL COMMENT 'Geographical location - continent',
  `speed_local` int(10) unsigned default NULL COMMENT 'Local speed in bps',
  `speed_int` int(10) unsigned default NULL COMMENT 'International speed in bps',
  `sync_hours` int(10) unsigned default NULL COMMENT 'Synchronization is done every how many hours',
  `sync_start` time default NULL COMMENT 'First synchronization is done at what time',
  `logo` blob COMMENT 'Mirror logo image. Should be a png file with 88x31 dimension',
  `prime` tinyint(1) NOT NULL default '0' COMMENT 'Whether this is primary site or not',
  PRIMARY KEY  (`id`),
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
  `id` int(11) NOT NULL auto_increment,
  `mirror` int(11) NOT NULL COMMENT 'Reference to the general mirror info',
  `protocol` enum('ftp','http','rsync') NOT NULL COMMENT 'Protocol name',
  `url` varchar(1024) NOT NULL COMMENT 'Relative URL to the repositories',
  PRIMARY KEY  (`id`),
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
  `id` int(10) unsigned NOT NULL auto_increment,
  `title` varchar(128) NOT NULL default '',
  `body` text NOT NULL,
  `published` timestamp NOT NULL default '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL default '0000-00-00 00:00:00',
  `author` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `idx_published` (`published`) USING BTREE,
  KEY `idx_update` (`updated`) USING BTREE,
  KEY `idx_author` (`author`) USING BTREE,
  CONSTRAINT `fk_news_author` FOREIGN KEY (`author`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Site news';
/*!40101 SET character_set_client = @saved_cs_client */;

/*!50003 SET @SAVE_SQL_MODE=@@SQL_MODE*/;

DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `news_ins` BEFORE INSERT ON `news` FOR EACH ROW BEGIN
  SET NEW.updated = NOW();
END */;;

/*!50003 SET SESSION SQL_MODE="" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `news_updt` BEFORE UPDATE ON `news` FOR EACH ROW BEGIN
  SET NEW.updated = NOW();
END */;;

DELIMITER ;
/*!50003 SET SESSION SQL_MODE=@SAVE_SQL_MODE*/;

--
-- Table structure for table `packages`
--

DROP TABLE IF EXISTS `packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `packages` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(128) NOT NULL COMMENT 'Package UNIX name',
  `title` varchar(256) NOT NULL COMMENT 'Package name',
  `version` varchar(20) NOT NULL COMMENT 'Package version',
  `releasedate` date default NULL COMMENT 'Version release date',
  `build` varchar(10) NOT NULL COMMENT 'Package build number',
  `license` char(8) character set ascii NOT NULL COMMENT 'Package license reference',
  `arch` char(8) character set latin1 collate latin1_general_ci NOT NULL COMMENT 'Package architecture reference',
  `slackver` int(10) unsigned NOT NULL COMMENT 'Package format (Slackware version) reference',
  `url` varchar(256) default NULL COMMENT 'Project URL',
  `vendor` int(10) unsigned NOT NULL,
  `description` text COMMENT 'Package description',
  `category` int(10) unsigned NOT NULL COMMENT 'Package category',
  `slackbuild` enum('no','yes') NOT NULL default 'no' COMMENT 'Is build script included',
  `frombinary` enum('no','yes') NOT NULL default 'no' COMMENT 'Is it from binary release',
  `filename` varchar(256) NOT NULL COMMENT 'Package file name',
  `filesize` int(10) unsigned default NULL COMMENT 'Package file size',
  `fileurl` varchar(1024) DEFAULT NULL COMMENT 'Package relative file URL',
  `filemd5` char(32) NOT NULL COMMENT 'MD5 hash for the package file',
  `filesign` text COMMENT 'GPG signature of the package file',
  `filedate` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT 'Package file creation date/time',
  `author` int(10) unsigned NOT NULL COMMENT 'Package author reference',
  `status` enum('ok','del','old','wait') NOT NULL default 'ok' COMMENT 'Status of the package:\n''ok'' - means active, current pacakge\n''old'' - means obsoleted package\n''del'' - means deleted package\n''wait'' - means package which is not yet published',
  PRIMARY KEY  (`id`),
  KEY `idx_name` (`name`) USING BTREE,
  KEY `idx_version` (`version`) USING BTREE,
  KEY `idx_arch` (`arch`) USING BTREE,
  KEY `idx_license` (`license`) USING BTREE,
  KEY `idx_author` (`author`) USING BTREE,
  KEY `idx_slackbuild` (`slackbuild`) USING BTREE,
  KEY `idx_slackver` (`slackver`) USING BTREE,
  KEY `idx_category` (`category`) USING BTREE,
  KEY `idx_status` (`status`) USING BTREE,
  KEY `fk_vendor` (`vendor`),
  CONSTRAINT `fk_arch` FOREIGN KEY (`arch`) REFERENCES `archs` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_author` FOREIGN KEY (`author`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_category` FOREIGN KEY (`category`) REFERENCES `categories` (`id`),
  CONSTRAINT `fk_license` FOREIGN KEY (`license`) REFERENCES `licenses` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_slackver` FOREIGN KEY (`slackver`) REFERENCES `slackvers` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_vendor` FOREIGN KEY (`vendor`) REFERENCES `vendors` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Slackwrare Packages Register';
/*!40101 SET character_set_client = @saved_cs_client */;

/*!50003 SET @SAVE_SQL_MODE=@@SQL_MODE*/;

DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `packages_ai` AFTER INSERT ON `packages` FOR EACH ROW BEGIN
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

/*!50003 SET SESSION SQL_MODE="" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `packages_au` AFTER UPDATE ON `packages` FOR EACH ROW BEGIN
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

/*!50003 SET SESSION SQL_MODE="" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `packages_ad` AFTER DELETE ON `packages` FOR EACH ROW BEGIN
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
/*!50003 SET SESSION SQL_MODE=@SAVE_SQL_MODE*/;

--
-- Table structure for table `searches`
--

DROP TABLE IF EXISTS `searches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `searches` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `query` varchar(128) NOT NULL COMMENT 'The query as passed from the search form',
  `date` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT 'The data at which the query was processed',
  `results` int(10) unsigned NOT NULL COMMENT 'Count of the returned packages',
  `arch` varchar(8) default NULL COMMENT 'The selected architecture',
  `slackver` int(10) unsigned default NULL COMMENT 'The selected Slackware version',
  `f_latestonly` enum('n','y') default NULL COMMENT 'Whether ''Only latest'' was checked',
  `f_gplonly` enum('n','y') default NULL COMMENT 'Whether ''Only GPL'' was checked',
  `f_sponly` enum('n','y') default NULL COMMENT 'Whether ''Only with SlackBuild'' was checked',
  `f_nobin` enum('n','y') default NULL COMMENT 'Whether ''no-binary'' was checked',
  PRIMARY KEY  (`id`),
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
  `released` date default NULL COMMENT 'Release date',
  `def` enum('no','yes') NOT NULL default 'no' COMMENT 'Whether this version should be preselected in GUI elements such combos',
  `packages_total` int(10) unsigned NOT NULL default '0' COMMENT 'Total number of the packages for this Slackware version',
  `packages` int(10) unsigned NOT NULL default '0' COMMENT 'Number of active packages for this Slackware version',
  `str` varchar(10) NOT NULL COMMENT 'Version as a string',
  PRIMARY KEY  (`id`),
  KEY `idx_released` (`released`) USING BTREE,
  KEY `idx_name` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Slackware Versions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(60) NOT NULL COMMENT 'Name',
  `firstname` varchar(60) NOT NULL COMMENT 'First name',
  `nick` varchar(30) default NULL COMMENT 'Nickname',
  `pkgsid` varchar(5) NOT NULL COMMENT 'The identifier used on packages',
  `email` varchar(256) NOT NULL COMMENT 'Users''s email',
  `password` char(42) NOT NULL COMMENT 'Users''s password as md5 hash',
  `registered` timestamp NOT NULL default '0000-00-00 00:00:00' COMMENT 'Date of registration',
  `packages` int(10) unsigned NOT NULL default '0' COMMENT 'Number of the packages for this user',
  `lp_user` varchar(10) default NULL COMMENT 'Username in linuxpackages.net',
  `lp_pass` blob COMMENT 'Password in linuxpackages.net encoded with AES',
  PRIMARY KEY  (`id`),
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
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(16) NOT NULL COMMENT 'Vendor''s short name',
  `title` varchar(64) NOT NULL COMMENT 'Vendor''s full name',
  `homeurl` varchar(256) NOT NULL COMMENT 'Vendor''s URL',
  `packages_total` int(10) unsigned NOT NULL default '0' COMMENT 'Total number of packages for the vendor',
  `packages` int(10) unsigned NOT NULL default '0' COMMENT 'Number of avtive packages for the vendor',
  PRIMARY KEY  (`id`),
  KEY `idx_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Software vendors register';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'slackpack'
--
DELIMITER ;;
/*!50003 DROP FUNCTION IF EXISTS `percent_binrel` */;;
/*!50003 SET SESSION SQL_MODE=""*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 FUNCTION `percent_binrel`() RETURNS float
    READS SQL DATA
BEGIN
  DECLARE bin_count INT;
  DECLARE all_count INT;

  SELECT count(*) INTO bin_count FROM packages WHERE frombinary = 'yes';
  SELECT count(*) INTO all_count FROM packages;
  RETURN (bin_count / all_count) * 100;
END */;;
/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE*/;;
/*!50003 DROP FUNCTION IF EXISTS `percent_cur` */;;
/*!50003 SET SESSION SQL_MODE=""*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 FUNCTION `percent_cur`() RETURNS float
    READS SQL DATA
    COMMENT 'Find the percent of the packages for Slackware Current'
BEGIN
  DECLARE cur_count INT;
  DECLARE all_count INT;
  SELECT count(*) INTO cur_count FROM packages WHERE slackver = '99999';
  SELECT count(*) INTO all_count FROM packages;
  RETURN (cur_count / all_count) * 100;
END */;;
/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE*/;;
/*!50003 DROP FUNCTION IF EXISTS `percent_sb` */;;
/*!50003 SET SESSION SQL_MODE=""*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 FUNCTION `percent_sb`() RETURNS float
    READS SQL DATA
    COMMENT 'Find the percent of the packages with SlackBuild scripts'
BEGIN
  DECLARE with_sb INT;
  DECLARE all_count INT;
  SELECT count(*) INTO with_sb FROM packages WHERE slackbuild = 'yes';
  SELECT count(*) INTO all_count FROM packages;
  RETURN (with_sb / all_count) * 100;
END */;;
/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE*/;;
DELIMITER ;

--
-- Final view structure for view `AgingBuilds`
--

/*!50001 DROP TABLE `AgingBuilds`*/;
/*!50001 DROP VIEW IF EXISTS `AgingBuilds`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `AgingBuilds` AS select `packages`.`name` AS `Name`,max(`packages`.`releasedate`) AS `LastReleaseDate`,max(`packages`.`version`) AS `LastVersion`,max(`packages`.`filedate`) AS `LastBuild`,max(`packages`.`url`) AS `URL` from `packages` group by `packages`.`name` having (max(`packages`.`filedate`) <= (now() - interval 2 month)) order by max(`packages`.`filedate`) */;

--
-- Final view structure for view `AvrgByMonth`
--

/*!50001 DROP TABLE `AvrgByMonth`*/;
/*!50001 DROP VIEW IF EXISTS `AvrgByMonth`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `AvrgByMonth` AS select year(`packages`.`filedate`) AS `Year`,(count(0) / 12) AS `Average` from `packages` group by year(`packages`.`filedate`) desc */;

--
-- Final view structure for view `DstrbtnByArch`
--

/*!50001 DROP TABLE `DstrbtnByArch`*/;
/*!50001 DROP VIEW IF EXISTS `DstrbtnByArch`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `DstrbtnByArch` AS select `archs`.`name` AS `Name`,`archs`.`packages` AS `Packages`,round(((`archs`.`packages` * 100) / (select count(0) AS `count(*)` from `packages`)),2) AS `Percent` from `archs` order by `archs`.`name` */;

--
-- Final view structure for view `DstrbtnByCategory`
--

/*!50001 DROP TABLE `DstrbtnByCategory`*/;
/*!50001 DROP VIEW IF EXISTS `DstrbtnByCategory`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `DstrbtnByCategory` AS select `categories`.`name` AS `Name`,`categories`.`packages` AS `Packages`,round(((`categories`.`packages` * 100) / (select count(0) AS `count(*)` from `packages`)),2) AS `Percent` from `categories` order by `categories`.`name` */;

--
-- Final view structure for view `DstrbtnByFormat`
--

/*!50001 DROP TABLE `DstrbtnByFormat`*/;
/*!50001 DROP VIEW IF EXISTS `DstrbtnByFormat`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `DstrbtnByFormat` AS select `slackvers`.`name` AS `Name`,`slackvers`.`packages` AS `Packages`,round(((`slackvers`.`packages` * 100) / (select count(0) AS `count(*)` from `packages`)),2) AS `Percent` from `slackvers` order by `slackvers`.`name` */;

--
-- Final view structure for view `DstrbtnByLicense`
--

/*!50001 DROP TABLE `DstrbtnByLicense`*/;
/*!50001 DROP VIEW IF EXISTS `DstrbtnByLicense`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `DstrbtnByLicense` AS select `licenses`.`name` AS `Name`,`licenses`.`packages` AS `Packages`,round(((`licenses`.`packages` * 100) / (select count(0) AS `count(*)` from `packages`)),2) AS `Percent` from `licenses` order by `licenses`.`name` */;

--
-- Final view structure for view `DstrbtnByTime`
--

/*!50001 DROP TABLE `DstrbtnByTime`*/;
/*!50001 DROP VIEW IF EXISTS `DstrbtnByTime`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `DstrbtnByTime` AS select year(`packages`.`filedate`) AS `Year`,month(`packages`.`filedate`) AS `Month`,count(0) AS `Packages` from `packages` group by year(`packages`.`filedate`) desc,month(`packages`.`filedate`) desc */;

--
-- Final view structure for view `Latest20`
--

/*!50001 DROP TABLE `Latest20`*/;
/*!50001 DROP VIEW IF EXISTS `Latest20`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `Latest20` AS select `p`.`id` AS `Id`,`p`.`filedate` AS `Date`,`p`.`name` AS `Name`,`p`.`version` AS `Version`,`p`.`build` AS `Build`,`lic`.`name` AS `License`,`p`.`arch` AS `Arch`,`a`.`name` AS `Architecture`,`s`.`name` AS `Slack`,`p`.`url` AS `URL`,`p`.`description` AS `Description` from (((`packages` `p` join `licenses` `lic`) join `archs` `a`) join `slackvers` `s`) where ((`p`.`license` = `lic`.`id`) and (`p`.`arch` = `a`.`id`) and (`p`.`slackver` = `s`.`id`)) order by `p`.`filedate` desc limit 20 */;

--
-- Final view structure for view `NewsCal`
--

/*!50001 DROP TABLE `NewsCal`*/;
/*!50001 DROP VIEW IF EXISTS `NewsCal`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `NewsCal` AS select month(`nws`.`published`) AS `Month`,year(`nws`.`published`) AS `Year`,count(0) AS `News` from `news` `nws` group by month(`nws`.`published`),year(`nws`.`published`) order by year(`nws`.`published`) desc,month(`nws`.`published`) desc */;

--
-- Final view structure for view `Totals`
--

/*!50001 DROP TABLE `Totals`*/;
/*!50001 DROP VIEW IF EXISTS `Totals`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `Totals` AS select count(0) AS `TotalCount`,count(distinct `packages`.`name`) AS `DstnctCount`,sum(`packages`.`filesize`) AS `TotalSize` from `packages` where (`packages`.`status` = _utf8'ok') */;

--
-- Final view structure for view `Versions`
--

/*!50001 DROP TABLE `Versions`*/;
/*!50001 DROP VIEW IF EXISTS `Versions`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `Versions` AS select `p`.`title` AS `Name`,`c`.`name` AS `Category`,max(`p102`.`version`) AS `Slack102`,max(`p110`.`version`) AS `Slack110`,max(`p120`.`version`) AS `Slack120`,max(`p121`.`version`) AS `Slack121`,max(`p122`.`version`) AS `Slack122`,max(`p130`.`version`) AS `Slack130`,max(`p131`.`version`) AS `Slack131` from ((((((((`packages` `p` left join `categories` `c` on((`p`.`category` = `c`.`id`))) left join `packages` `p102` on(((`p102`.`name` = `p`.`name`) and (`p102`.`slackver` = 102) and (`p102`.`status` = 'ok')))) left join `packages` `p110` on(((`p110`.`name` = `p`.`name`) and (`p110`.`slackver` = 110) and (`p110`.`status` = 'ok')))) left join `packages` `p120` on(((`p120`.`name` = `p`.`name`) and (`p120`.`slackver` = 120) and (`p120`.`status` = 'ok')))) left join `packages` `p121` on(((`p121`.`name` = `p`.`name`) and (`p121`.`slackver` = 121) and (`p121`.`status` = 'ok')))) left join `packages` `p122` on(((`p122`.`name` = `p`.`name`) and (`p122`.`slackver` = 122) and (`p122`.`status` = 'ok')))) left join `packages` `p130` on(((`p130`.`name` = `p`.`name`) and (`p130`.`slackver` = 130) and (`p130`.`status` = 'ok')))) left join `packages` `p131` on(((`p131`.`name` = `p`.`name`) and (`p131`.`slackver` = 131) and (`p131`.`status` = 'ok')))) where (`p`.`slackver` <> 99999) group by `p`.`name` order by `p`.`title` */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-07-22  23:50:01
