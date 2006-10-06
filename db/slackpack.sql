-- MySQL dump 10.10
--
-- Host: localhost    Database: slackpack
-- ------------------------------------------------------
-- Server version	5.0.24a-log

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
  `Count` int(10) unsigned,
  `Percent` decimal(17,2)
) */;

--
-- Temporary table structure for view `DstrbtnByCategory`
--

DROP TABLE IF EXISTS `DstrbtnByCategory`;
/*!50001 DROP VIEW IF EXISTS `DstrbtnByCategory`*/;
/*!50001 CREATE TABLE `DstrbtnByCategory` (
  `Name` varchar(32),
  `Count` int(10) unsigned,
  `Percent` decimal(17,2)
) */;

--
-- Temporary table structure for view `DstrbtnByLicense`
--

DROP TABLE IF EXISTS `DstrbtnByLicense`;
/*!50001 DROP VIEW IF EXISTS `DstrbtnByLicense`*/;
/*!50001 CREATE TABLE `DstrbtnByLicense` (
  `Name` varchar(30),
  `Count` int(10) unsigned,
  `Percent` decimal(17,2)
) */;

--
-- Temporary table structure for view `DstrbtnBySlackVersion`
--

DROP TABLE IF EXISTS `DstrbtnBySlackVersion`;
/*!50001 DROP VIEW IF EXISTS `DstrbtnBySlackVersion`*/;
/*!50001 CREATE TABLE `DstrbtnBySlackVersion` (
  `Name` varchar(30),
  `Count` int(10) unsigned,
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
  `Architecture` varchar(40),
  `Slack` varchar(30),
  `URL` varchar(256),
  `Description` text,
  `AuthorName` varchar(60),
  `AuthorFirstName` varchar(60),
  `AuthorEmail` varchar(256)
) */;

--
-- Temporary table structure for view `Totals`
--

DROP TABLE IF EXISTS `Totals`;
/*!50001 DROP VIEW IF EXISTS `Totals`*/;
/*!50001 CREATE TABLE `Totals` (
  `TotalCount` bigint(21),
  `TotalSize` decimal(33,0)
) */;

--
-- Table structure for table `arch`
--

DROP TABLE IF EXISTS `arch`;
CREATE TABLE `arch` (
  `id` char(8) character set latin1 collate latin1_general_ci NOT NULL default '',
  `name` varchar(40) character set latin1 NOT NULL COMMENT 'Descriptive architecture name',
  `default` enum('no','yes') NOT NULL default 'no' COMMENT 'Whether this architecture should be preselected in GUI elements such combos',
  `count` int(10) unsigned NOT NULL default '0' COMMENT 'Count of the packages for this acritecture',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Slackware Architectures';

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
CREATE TABLE `authors` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(60) NOT NULL default '',
  `firstname` varchar(60) NOT NULL default '',
  `email` varchar(256) NOT NULL default '',
  `password` varchar(32) NOT NULL,
  `registered` timestamp NOT NULL default '0000-00-00 00:00:00',
  `nickname` varchar(30) default NULL,
  `packs` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `name_idx` (`name`),
  KEY `fname_idx` (`firstname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Package authors register';

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(32) NOT NULL COMMENT 'Category name',
  `count` int(10) unsigned NOT NULL default '0' COMMENT 'Count of the packages in this category',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Package categories';

--
-- Table structure for table `licenses`
--

DROP TABLE IF EXISTS `licenses`;
CREATE TABLE `licenses` (
  `id` char(8) character set latin1 collate latin1_general_ci NOT NULL default '',
  `name` varchar(30) character set latin1 NOT NULL COMMENT 'License name',
  `desc` text COMMENT 'Short description',
  `url` varchar(256) character set latin1 collate latin1_general_ci default NULL COMMENT 'URL with more info about the license or the official page of the license',
  `default` enum('no','yes') character set latin1 collate latin1_general_ci NOT NULL default 'no' COMMENT 'Whether this license should be preselected in GUI elements like combos',
  `count` int(10) unsigned NOT NULL default '0' COMMENT 'Count of the packages with this license',
  PRIMARY KEY  (`id`)
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
  KEY `author_news_key` (`author`),
  CONSTRAINT `author_news_key` FOREIGN KEY (`author`) REFERENCES `authors` (`id`)
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
  `slackver` char(8) character set latin1 collate latin1_general_ci NOT NULL default '',
  `url` varchar(256) default NULL,
  `desc` text,
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
  `date` date default NULL,
  `time` time default NULL,
  PRIMARY KEY  (`id`,`name`,`license`,`arch`,`slackver`,`category`,`filedate`,`author`),
  KEY `name_idx` (`name`),
  KEY `version_idx` (`version`),
  KEY `arch_idx` (`arch`),
  KEY `slackver_idx` (`slackver`),
  KEY `lic_key` (`license`),
  KEY `author_key` (`author`),
  CONSTRAINT `arch_key` FOREIGN KEY (`arch`) REFERENCES `arch` (`id`),
  CONSTRAINT `author_key` FOREIGN KEY (`author`) REFERENCES `authors` (`id`),
  CONSTRAINT `lic_key` FOREIGN KEY (`license`) REFERENCES `licenses` (`id`),
  CONSTRAINT `slackver_key` FOREIGN KEY (`slackver`) REFERENCES `slackver` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Slackwrare Packages Register';

/*!50003 SET @OLD_SQL_MODE=@@SQL_MODE*/;
DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `counts_on_ins` AFTER INSERT ON `packages` FOR EACH ROW BEGIN
  UPDATE `arch` SET `count` = `count` + 1 WHERE `id` = NEW.`arch`;
  UPDATE `categories` SET `count` = `count` + 1 WHERE `id` = NEW.`category`;
  UPDATE `licenses` SET `count` = `count` + 1 WHERE `id` = NEW.`license`;
  UPDATE `slackver` SET `count` = `count` + 1 WHERE `id` = NEW.`slackver`;
END */;;

/*!50003 SET SESSION SQL_MODE="" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `counts_on_updt` AFTER UPDATE ON `packages` FOR EACH ROW BEGIN
  UPDATE `arch` SET `count` = `count` - 1 WHERE `id` = OLD.`arch`;
  UPDATE `arch` SET `count` = `count` + 1 WHERE `id` = NEW.`arch`;
  UPDATE `categories` SET `count` = `count` - 1 WHERE `id` = OLD.`category`;
  UPDATE `categories` SET `count` = `count` + 1 WHERE `id` = NEW.`category`;
  UPDATE `licenses` SET `count` = `count` - 1 WHERE `id` = OLD.`license`;
  UPDATE `licenses` SET `count` = `count` + 1 WHERE `id` = NEW.`license`;
  UPDATE `slackver` SET `count` = `count` - 1 WHERE `id` = OLD.`slackver`;
  UPDATE `slackver` SET `count` = `count` + 1 WHERE `id` = NEW.`slackver`;
END */;;

/*!50003 SET SESSION SQL_MODE="" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `counts_on_del` AFTER DELETE ON `packages` FOR EACH ROW BEGIN
  UPDATE `arch` SET `count` = `count` - 1 WHERE `id` = OLD.`arch`;
  UPDATE `categories` SET `count` = `count` - 1 WHERE `id` = OLD.`category`;
  UPDATE `licenses` SET `count` = `count` - 1 WHERE `id` = OLD.`license`;
  UPDATE `slackver` SET `count` = `count` - 1 WHERE `id` = OLD.`slackver`;
END */;;

DELIMITER ;
/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;

--
-- Table structure for table `slackver`
--

DROP TABLE IF EXISTS `slackver`;
CREATE TABLE `slackver` (
  `id` char(8) character set latin1 collate latin1_general_ci NOT NULL default '',
  `name` varchar(30) NOT NULL COMMENT 'Descriptive version name',
  `released` date default NULL COMMENT 'Release date',
  `default` enum('no','yes') NOT NULL default 'no' COMMENT 'Whether this version should be preselected in GUI elements such combos',
  `count` int(10) unsigned NOT NULL default '0' COMMENT 'Count of the packages for this Slackware version',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Slackware Versions';

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
/*!50001 VIEW `DstrbtnByArch` AS select `arch`.`name` AS `Name`,`arch`.`count` AS `Count`,round(((`arch`.`count` * 100) / (select count(0) AS `count(*)` from `packages`)),2) AS `Percent` from `arch` order by `arch`.`name` */;

--
-- Final view structure for view `DstrbtnByCategory`
--

/*!50001 DROP TABLE IF EXISTS `DstrbtnByCategory`*/;
/*!50001 DROP VIEW IF EXISTS `DstrbtnByCategory`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `DstrbtnByCategory` AS select `categories`.`name` AS `Name`,`categories`.`count` AS `Count`,round(((`categories`.`count` * 100) / (select count(0) AS `count(*)` from `packages`)),2) AS `Percent` from `categories` order by `categories`.`name` */;

--
-- Final view structure for view `DstrbtnByLicense`
--

/*!50001 DROP TABLE IF EXISTS `DstrbtnByLicense`*/;
/*!50001 DROP VIEW IF EXISTS `DstrbtnByLicense`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `DstrbtnByLicense` AS select `licenses`.`name` AS `Name`,`licenses`.`count` AS `Count`,round(((`licenses`.`count` * 100) / (select count(0) AS `count(*)` from `packages`)),2) AS `Percent` from `licenses` order by `licenses`.`name` */;

--
-- Final view structure for view `DstrbtnBySlackVersion`
--

/*!50001 DROP TABLE IF EXISTS `DstrbtnBySlackVersion`*/;
/*!50001 DROP VIEW IF EXISTS `DstrbtnBySlackVersion`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `DstrbtnBySlackVersion` AS select `slackver`.`name` AS `Name`,`slackver`.`count` AS `Count`,round(((`slackver`.`count` * 100) / (select count(0) AS `count(*)` from `packages`)),2) AS `Percent` from `slackver` order by `slackver`.`name` */;

--
-- Final view structure for view `Latest20`
--

/*!50001 DROP TABLE IF EXISTS `Latest20`*/;
/*!50001 DROP VIEW IF EXISTS `Latest20`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `Latest20` AS select `p`.`id` AS `Id`,`p`.`filedate` AS `Date`,`p`.`name` AS `Name`,`p`.`version` AS `Version`,`p`.`build` AS `Build`,`l`.`name` AS `License`,`a`.`name` AS `Architecture`,`s`.`name` AS `Slack`,`p`.`url` AS `URL`,`p`.`desc` AS `Description`,`u`.`name` AS `AuthorName`,`u`.`firstname` AS `AuthorFirstName`,`u`.`email` AS `AuthorEmail` from ((((`packages` `p` join `licenses` `l`) join `arch` `a`) join `slackver` `s`) join `authors` `u`) where ((`p`.`license` = `l`.`id`) and (`p`.`arch` = `a`.`id`) and (`p`.`slackver` = `s`.`id`) and (`p`.`author` = `u`.`id`)) order by `p`.`date` desc,`p`.`time` desc limit 20 */;

--
-- Final view structure for view `Totals`
--

/*!50001 DROP TABLE IF EXISTS `Totals`*/;
/*!50001 DROP VIEW IF EXISTS `Totals`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `Totals` AS select count(0) AS `TotalCount`,sum(`packages`.`filesize`) AS `TotalSize` from `packages` */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

