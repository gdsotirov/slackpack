-- MySQL dump 10.10
--
-- Host: localhost    Database: slackpack
-- ------------------------------------------------------
-- Server version	5.0.27-log

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
-- Temporary table structure for view `DstrbtnByArch`
--

DROP TABLE IF EXISTS `DstrbtnByArch`;
/*!50001 DROP VIEW IF EXISTS `DstrbtnByArch`*/;
/*!50001 CREATE TABLE `DstrbtnByArch` (
  `Name` varchar(40),
  `Packages` int(10) unsigned,
  `Percent` decimal(17,2)
) */;

--
-- Temporary table structure for view `DstrbtnByCategory`
--

DROP TABLE IF EXISTS `DstrbtnByCategory`;
/*!50001 DROP VIEW IF EXISTS `DstrbtnByCategory`*/;
/*!50001 CREATE TABLE `DstrbtnByCategory` (
  `Name` varchar(32),
  `Packages` int(10) unsigned,
  `Percent` decimal(17,2)
) */;

--
-- Temporary table structure for view `DstrbtnByLicense`
--

DROP TABLE IF EXISTS `DstrbtnByLicense`;
/*!50001 DROP VIEW IF EXISTS `DstrbtnByLicense`*/;
/*!50001 CREATE TABLE `DstrbtnByLicense` (
  `Name` varchar(30),
  `Packages` int(10) unsigned,
  `Percent` decimal(17,2)
) */;

--
-- Temporary table structure for view `DstrbtnBySlackVersion`
--

DROP TABLE IF EXISTS `DstrbtnBySlackVersion`;
/*!50001 DROP VIEW IF EXISTS `DstrbtnBySlackVersion`*/;
/*!50001 CREATE TABLE `DstrbtnBySlackVersion` (
  `Name` varchar(30),
  `Packages` int(10) unsigned,
  `Percent` decimal(17,2)
) */;

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
) */;

--
-- Temporary table structure for view `Totals`
--

DROP TABLE IF EXISTS `Totals`;
/*!50001 DROP VIEW IF EXISTS `Totals`*/;
/*!50001 CREATE TABLE `Totals` (
  `TotalCount` bigint(21),
  `DstnctCount` bigint(21),
  `TotalSize` decimal(33,0)
) */;

--
-- Table structure for table `archs`
--

DROP TABLE IF EXISTS `archs`;
CREATE TABLE `archs` (
  `id` char(8) character set latin1 collate latin1_general_ci NOT NULL default '',
  `name` varchar(40) character set latin1 NOT NULL COMMENT 'Descriptive architecture name',
  `def` enum('no','yes') NOT NULL default 'no' COMMENT 'Whether this architecture should be preselected in GUI elements such combos',
  `packages` int(10) unsigned NOT NULL default '0' COMMENT 'Number of the packages for this acritecture',
  PRIMARY KEY  (`id`),
  KEY `name_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Slackware Architectures';

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(32) NOT NULL COMMENT 'Category name',
  `packages` int(10) unsigned NOT NULL default '0' COMMENT 'Number of the packages in this category',
  PRIMARY KEY  (`id`),
  KEY `name_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Package categories';

--
-- Table structure for table `licenses`
--

DROP TABLE IF EXISTS `licenses`;
CREATE TABLE `licenses` (
  `id` char(8) character set latin1 collate latin1_general_ci NOT NULL default '',
  `name` varchar(30) character set latin1 NOT NULL COMMENT 'License name',
  `description` text COMMENT 'Short description',
  `url` varchar(256) character set latin1 collate latin1_general_ci default NULL COMMENT 'URL with more info about the license or the official page of the license',
  `def` enum('no','yes') character set latin1 collate latin1_general_ci NOT NULL default 'no' COMMENT 'Whether this license should be preselected in GUI elements like combos',
  `packages` int(10) unsigned NOT NULL default '0' COMMENT 'Number of the packages with this license',
  PRIMARY KEY  (`id`),
  KEY `name_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Software licenses catalog';

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `title` varchar(128) NOT NULL default '',
  `body` text NOT NULL,
  `published` timestamp NOT NULL default '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL default '0000-00-00 00:00:00',
  `author` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `pub_idx` (`published`),
  KEY `updt_idx` (`updated`),
  KEY `author_idx` (`author`),
  CONSTRAINT `author_news_key` FOREIGN KEY (`author`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Site news';

--
-- Table structure for table `packages`
--

DROP TABLE IF EXISTS `packages`;
CREATE TABLE `packages` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(128) NOT NULL,
  `version` varchar(20) NOT NULL,
  `releasedate` date NOT NULL default '0000-00-00',
  `build` varchar(10) default NULL,
  `license` char(8) character set latin1 collate latin1_general_ci NOT NULL default '',
  `arch` char(8) character set latin1 collate latin1_general_ci NOT NULL default '',
  `slackver` int(10) unsigned NOT NULL,
  `url` varchar(256) default NULL,
  `description` text,
  `category` int(10) unsigned NOT NULL,
  `slackbuild` enum('no','yes') NOT NULL default 'no',
  `frombinary` enum('no','yes') NOT NULL default 'no',
  `filename` varchar(256) NOT NULL default '',
  `filesize` int(10) unsigned NOT NULL default '0',
  `fileurl` varchar(1024) NOT NULL default '',
  `filemd5` char(32) NOT NULL default '',
  `filesign` text,
  `filedate` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `author` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `name_idx` (`name`),
  KEY `version_idx` (`version`),
  KEY `arch_idx` (`arch`),
  KEY `lic_idx` (`license`),
  KEY `author_idx` (`author`),
  KEY `sb_idx` (`slackbuild`),
  KEY `sver_idx` (`slackver`),
  KEY `cat_idx` (`category`),
  CONSTRAINT `lic_key` FOREIGN KEY (`license`) REFERENCES `licenses` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `slackver_key` FOREIGN KEY (`slackver`) REFERENCES `slackvers` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `arch_key` FOREIGN KEY (`arch`) REFERENCES `archs` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `author_key` FOREIGN KEY (`author`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Slackwrare Packages Register';

/*!50003 SET @OLD_SQL_MODE=@@SQL_MODE*/;
DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `packages_ins` AFTER INSERT ON `packages` FOR EACH ROW BEGIN
  UPDATE archs SET packages = packages + 1 WHERE id = NEW.arch;
  UPDATE categories SET number = number + 1 WHERE id = NEW.category;
  UPDATE licenses SET packages = packages + 1 WHERE id = NEW.license;
  UPDATE slackvers SET packages = packages + 1 WHERE id = NEW.slackver;
END */;;

/*!50003 SET SESSION SQL_MODE="" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `packages_updt` AFTER UPDATE ON `packages` FOR EACH ROW BEGIN
  UPDATE archs SET packages = packages - 1 WHERE id = OLD.arch;
  UPDATE archs SET packages = packages + 1 WHERE id = NEW.arch;
  UPDATE categories SET packages = packages - 1 WHERE id = OLD.category;
  UPDATE categories SET packages = packages + 1 WHERE id = NEW.category;
  UPDATE licenses SET packages = packages - 1 WHERE id = OLD.license;
  UPDATE licenses SET packages = packages + 1 WHERE id = NEW.license;
  UPDATE slackvers SET packages = packages - 1 WHERE id = OLD.slackver;
  UPDATE slackvers SET packages = packages + 1 WHERE id = NEW.slackver;
END */;;

/*!50003 SET SESSION SQL_MODE="" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `packages_del` AFTER DELETE ON `packages` FOR EACH ROW BEGIN
  UPDATE archs SET packages = packages - 1 WHERE id = OLD.arch;
  UPDATE categories SET packages = packages - 1 WHERE id = OLD.category;
  UPDATE licenses SET packages = packages - 1 WHERE id = OLD.license;
  UPDATE slackvers SET packages = packages - 1 WHERE id = OLD.slackver;
END */;;

DELIMITER ;
/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;

--
-- Table structure for table `slackvers`
--

DROP TABLE IF EXISTS `slackvers`;
CREATE TABLE `slackvers` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(30) NOT NULL COMMENT 'Descriptive version name',
  `released` date default NULL COMMENT 'Release date',
  `def` enum('no','yes') NOT NULL default 'no' COMMENT 'Whether this version should be preselected in GUI elements such combos',
  `packages` int(10) unsigned NOT NULL default '0' COMMENT 'Number of the packages for this Slackware version',
  PRIMARY KEY  (`id`),
  KEY `rel_idx` (`released`),
  KEY `name_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Slackware Versions';

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(60) NOT NULL default '',
  `firstname` varchar(60) NOT NULL default '',
  `email` varchar(256) NOT NULL default '',
  `password` varchar(32) NOT NULL,
  `registered` timestamp NOT NULL default '0000-00-00 00:00:00',
  `nick` varchar(30) default NULL,
  `packages` int(10) unsigned NOT NULL default '0' COMMENT 'Number of the packages for this user',
  PRIMARY KEY  (`id`),
  KEY `name_idx` (`name`),
  KEY `fname_idx` (`firstname`),
  KEY `nickname_idx` (`nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Package authors register';

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
  SELECT count(*) INTO cur_count FROM packages WHERE slackver = 'current';
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
-- Final view structure for view `DstrbtnByArch`
--

/*!50001 DROP TABLE IF EXISTS `DstrbtnByArch`*/;
/*!50001 DROP VIEW IF EXISTS `DstrbtnByArch`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `DstrbtnByArch` AS select `archs`.`name` AS `Name`,`archs`.`packages` AS `Packages`,round(((`archs`.`packages` * 100) / (select count(0) AS `count(*)` from `packages`)),2) AS `Percent` from `archs` order by `archs`.`name` */;

--
-- Final view structure for view `DstrbtnByCategory`
--

/*!50001 DROP TABLE IF EXISTS `DstrbtnByCategory`*/;
/*!50001 DROP VIEW IF EXISTS `DstrbtnByCategory`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `DstrbtnByCategory` AS select `categories`.`name` AS `Name`,`categories`.`packages` AS `Packages`,round(((`categories`.`packages` * 100) / (select count(0) AS `count(*)` from `packages`)),2) AS `Percent` from `categories` order by `categories`.`name` */;

--
-- Final view structure for view `DstrbtnByLicense`
--

/*!50001 DROP TABLE IF EXISTS `DstrbtnByLicense`*/;
/*!50001 DROP VIEW IF EXISTS `DstrbtnByLicense`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `DstrbtnByLicense` AS select `licenses`.`name` AS `Name`,`licenses`.`packages` AS `Packages`,round(((`licenses`.`packages` * 100) / (select count(0) AS `count(*)` from `packages`)),2) AS `Percent` from `licenses` order by `licenses`.`name` */;

--
-- Final view structure for view `DstrbtnBySlackVersion`
--

/*!50001 DROP TABLE IF EXISTS `DstrbtnBySlackVersion`*/;
/*!50001 DROP VIEW IF EXISTS `DstrbtnBySlackVersion`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `DstrbtnBySlackVersion` AS select `slackvers`.`name` AS `Name`,`slackvers`.`packages` AS `Packages`,round(((`slackvers`.`packages` * 100) / (select count(0) AS `count(*)` from `packages`)),2) AS `Percent` from `slackvers` order by `slackvers`.`name` */;

--
-- Final view structure for view `Latest20`
--

/*!50001 DROP TABLE IF EXISTS `Latest20`*/;
/*!50001 DROP VIEW IF EXISTS `Latest20`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `Latest20` AS select `p`.`id` AS `Id`,`p`.`filedate` AS `Date`,`p`.`name` AS `Name`,`p`.`version` AS `Version`,`p`.`build` AS `Build`,`lic`.`name` AS `License`,`p`.`arch` AS `Arch`,`a`.`name` AS `Architecture`,`s`.`name` AS `Slack`,`p`.`url` AS `URL`,`p`.`description` AS `Description` from (((`packages` `p` join `licenses` `lic`) join `archs` `a`) join `slackvers` `s`) where ((`p`.`license` = `lic`.`id`) and (`p`.`arch` = `a`.`id`) and (`p`.`slackver` = `s`.`id`)) order by `p`.`filedate` desc limit 20 */;

--
-- Final view structure for view `Totals`
--

/*!50001 DROP TABLE IF EXISTS `Totals`*/;
/*!50001 DROP VIEW IF EXISTS `Totals`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `Totals` AS select count(0) AS `TotalCount`,count(distinct `packages`.`name`) AS `DstnctCount`,sum(`packages`.`filesize`) AS `TotalSize` from `packages` */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2006-12-02 21:15:47
