-- MySQL dump 10.10
--
-- Host: localhost    Database: slackpack
-- ------------------------------------------------------
-- Server version	5.0.22-log

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
-- Table structure for table `Latest25`
--

DROP TABLE IF EXISTS `Latest25`;
/*!50001 DROP VIEW IF EXISTS `Latest25`*/;
/*!50001 DROP TABLE IF EXISTS `Latest25`*/;
/*!50001 CREATE TABLE `Latest25` (
  `Id` int(10) unsigned,
  `Name` varchar(128),
  `Version` varchar(20),
  `Build` varchar(10),
  `License` char(8),
  `Architecture` char(8),
  `Slack` char(8),
  `URL` varchar(256)
) */;

--
-- Table structure for table `Totals`
--

DROP TABLE IF EXISTS `Totals`;
/*!50001 DROP VIEW IF EXISTS `Totals`*/;
/*!50001 DROP TABLE IF EXISTS `Totals`*/;
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
  `name` varchar(40) character set latin1 NOT NULL default '',
  `default` enum('no','yes') NOT NULL default 'no',
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
-- Table structure for table `licenses`
--

DROP TABLE IF EXISTS `licenses`;
CREATE TABLE `licenses` (
  `id` char(8) character set latin1 collate latin1_general_ci NOT NULL default '',
  `name` varchar(30) character set latin1 NOT NULL default '',
  `desc` text,
  `url` varchar(256) character set latin1 collate latin1_general_ci default NULL,
  `default` enum('no','yes') character set latin1 collate latin1_general_ci NOT NULL default 'no',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Software licenses catalog';

--
-- Table structure for table `packages`
--

DROP TABLE IF EXISTS `packages`;
CREATE TABLE `packages` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(128) NOT NULL,
  `version` varchar(20) NOT NULL,
  `build` varchar(10) default NULL,
  `license` char(8) character set latin1 collate latin1_general_ci NOT NULL default '',
  `arch` char(8) character set latin1 collate latin1_general_ci NOT NULL default '',
  `slackver` char(8) character set latin1 collate latin1_general_ci NOT NULL default '',
  `url` varchar(256) default NULL,
  `desc` text,
  `slackbuild` enum('no','yes') NOT NULL default 'no',
  `filename` varchar(256) NOT NULL default '',
  `filesize` int(10) unsigned NOT NULL default '0',
  `fileurl` varchar(1024) NOT NULL default '',
  `filemd5` char(32) NOT NULL default '',
  `filesign` text,
  `author` int(10) unsigned NOT NULL,
  `date` date default NULL,
  `time` time default NULL,
  PRIMARY KEY  (`id`,`author`),
  KEY `name_idx` (`name`),
  KEY `version_idx` (`version`),
  KEY `arch_idx` (`arch`),
  KEY `slackver_idx` (`slackver`),
  KEY `lic_key` (`license`),
  KEY `author_key` (`author`),
  CONSTRAINT `author_key` FOREIGN KEY (`author`) REFERENCES `authors` (`id`),
  CONSTRAINT `arch_key` FOREIGN KEY (`arch`) REFERENCES `arch` (`id`),
  CONSTRAINT `lic_key` FOREIGN KEY (`license`) REFERENCES `licenses` (`id`),
  CONSTRAINT `slackver_key` FOREIGN KEY (`slackver`) REFERENCES `slackver` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Slackwrare Packages Register';

--
-- Table structure for table `slackver`
--

DROP TABLE IF EXISTS `slackver`;
CREATE TABLE `slackver` (
  `id` char(8) character set latin1 collate latin1_general_ci NOT NULL default '',
  `name` varchar(30) NOT NULL default '',
  `released` date default NULL,
  `default` enum('no','yes') NOT NULL default 'no',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Slackware Versions';

--
-- View structure for view `Latest25`
--

/*!50001 DROP TABLE IF EXISTS `Latest25`*/;
/*!50001 DROP VIEW IF EXISTS `Latest25`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `Latest25` AS select `packages`.`id` AS `Id`,`packages`.`name` AS `Name`,`packages`.`version` AS `Version`,`packages`.`build` AS `Build`,`packages`.`license` AS `License`,`packages`.`arch` AS `Architecture`,`packages`.`slackver` AS `Slack`,`packages`.`url` AS `URL` from `packages` order by `packages`.`date` desc,`packages`.`time` desc limit 25 */;

--
-- View structure for view `Totals`
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

