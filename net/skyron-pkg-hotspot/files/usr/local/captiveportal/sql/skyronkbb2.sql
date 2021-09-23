/*
SQLyog Ultimate v9.63 
MySQL - 5.7.31-log : Database - radius
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`radius` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_turkish_ci */;

USE `radius`;

/*Table structure for table `personel` */

DROP TABLE IF EXISTS `personel`;

CREATE TABLE `personel` (
  `PId` int(11) DEFAULT NULL,
  `SCount` int(11) DEFAULT NULL,
  `Uname` varchar(15) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Upass` varchar(15) COLLATE utf8_turkish_ci DEFAULT NULL,
  `TcNo` varchar(12) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Adi` varchar(30) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Soyadi` varchar(30) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Unvan` varchar(150) COLLATE utf8_turkish_ci DEFAULT NULL,
  `BaslamaT` varchar(40) COLLATE utf8_turkish_ci DEFAULT NULL,
  `AyrilmaT` varchar(40) COLLATE utf8_turkish_ci DEFAULT NULL,
  `VergiNo` varchar(12) COLLATE utf8_turkish_ci DEFAULT NULL,
  `VegiDairesi` varchar(30) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Cep` varchar(12) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Adres1` varchar(150) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Adres2` varchar(150) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Il` varchar(30) COLLATE utf8_turkish_ci DEFAULT NULL,
  `IlceSemt` varchar(30) COLLATE utf8_turkish_ci DEFAULT NULL,
  `PostaKodu` varchar(6) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Tel` varchar(12) COLLATE utf8_turkish_ci DEFAULT NULL,
  `CepTel` varchar(12) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Fax` varchar(12) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Email` varchar(30) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Resim` mediumblob,
  `Notlar` mediumtext COLLATE utf8_turkish_ci,
  `prm1` char(1) COLLATE utf8_turkish_ci DEFAULT NULL,
  `prm2` char(1) COLLATE utf8_turkish_ci DEFAULT NULL,
  `prm3` char(1) COLLATE utf8_turkish_ci DEFAULT NULL,
  `prm4` char(1) COLLATE utf8_turkish_ci DEFAULT NULL,
  `prm5` char(1) COLLATE utf8_turkish_ci DEFAULT NULL,
  `prm6` char(1) COLLATE utf8_turkish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

/*Data for the table `personel` */

insert  into `personel`(`PId`,`SCount`,`Uname`,`Upass`,`TcNo`,`Adi`,`Soyadi`,`Unvan`,`BaslamaT`,`AyrilmaT`,`VergiNo`,`VegiDairesi`,`Cep`,`Adres1`,`Adres2`,`Il`,`IlceSemt`,`PostaKodu`,`Tel`,`CepTel`,`Fax`,`Email`,`Resim`,`Notlar`,`prm1`,`prm2`,`prm3`,`prm4`,`prm5`,`prm6`) values (0,16,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),(2,NULL,'m','alBDi421O9A=','','Mehmet','Demir','MCP','2005-09-01 00:00:00',NULL,NULL,'Erciyes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0','0','0','0','0'),(13,NULL,'admin','OsxbZvYyaKM=',NULL,'Mehmet','Demir',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0','0','0','0','0'),(16,NULL,'kasa','KJ34m49OISQ=',NULL,'kasa','kasa',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,'0','1','0','1','1','1');

/*Table structure for table `systems` */

DROP TABLE IF EXISTS `systems`;

CREATE TABLE `systems` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Prm1` int(11) DEFAULT NULL,
  `Prm2` varchar(30) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Prm3` varchar(30) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Prm4` varchar(30) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Prm5` varchar(30) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Prm6` varchar(30) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Prm7` varchar(30) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Prm8` varchar(30) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Prm9` varchar(30) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Prm10` varchar(30) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Prsvr` int(11) DEFAULT NULL,
  `Ipsvr` varchar(15) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Pcont` varchar(30) COLLATE utf8_turkish_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

/*Data for the table `systems` */

insert  into `systems`(`Id`,`Prm1`,`Prm2`,`Prm3`,`Prm4`,`Prm5`,`Prm6`,`Prm7`,`Prm8`,`Prm9`,`Prm10`,`Prsvr`,`Ipsvr`,`Pcont`) values (1,1,'10800','90','kayseriotp-mb1237','9477','0','0','0','0','0',NULL,'','http://gateway.mobilus.net/com');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
