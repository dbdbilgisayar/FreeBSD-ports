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

/*Table structure for table `5651dhcplog` */

DROP TABLE IF EXISTS `5651dhcplog`;

CREATE TABLE `5651dhcplog` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `IpAddr` varchar(12) COLLATE utf8_turkish_ci DEFAULT NULL,
  `ScopSDate` date DEFAULT NULL,
  `ScopSTime` time DEFAULT NULL,
  `ScopADate` date DEFAULT NULL,
  `ScopATime` time DEFAULT NULL,
  `Mac` varchar(20) COLLATE utf8_turkish_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

/*Table structure for table `abone` */

DROP TABLE IF EXISTS `abone`;

CREATE TABLE `abone` (
  `CId` int(11) NOT NULL AUTO_INCREMENT,
  `Tur` int(11) DEFAULT NULL,
  `Ip_adr` varchar(15) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Mac_adr` varchar(20) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Kullaniciadi` varchar(64) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Sifre` varchar(12) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Info` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `PriceId` int(11) DEFAULT NULL,
  `sms` varchar(30) COLLATE utf8_turkish_ci DEFAULT NULL,
  `FirmaUnvan` varchar(30) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Adi` varchar(30) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Soyadi` varchar(30) COLLATE utf8_turkish_ci DEFAULT NULL,
  `TcNo` varchar(12) COLLATE utf8_turkish_ci DEFAULT NULL,
  `AnneKizlikSoyadi` varchar(30) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Adres1` varchar(150) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Adres2` varchar(150) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Il` varchar(30) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Ilce` varchar(30) COLLATE utf8_turkish_ci DEFAULT NULL,
  `CepTel` varchar(15) COLLATE utf8_turkish_ci DEFAULT NULL,
  `EvTel` varchar(15) COLLATE utf8_turkish_ci DEFAULT NULL,
  `IsTel` varchar(15) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Email` varchar(30) COLLATE utf8_turkish_ci DEFAULT NULL,
  `OdaNo` varchar(10) COLLATE utf8_turkish_ci DEFAULT NULL,
  `BaslamaT` date DEFAULT NULL,
  `BitisT` date DEFAULT NULL,
  `DogumTarihi` date DEFAULT NULL,
  `VegiNo` varchar(12) COLLATE utf8_turkish_ci DEFAULT NULL,
  `VergiDairesi` varchar(30) COLLATE utf8_turkish_ci DEFAULT NULL,
  `RuhsatNo` varchar(30) COLLATE utf8_turkish_ci DEFAULT NULL,
  `KaseNo` varchar(30) COLLATE utf8_turkish_ci DEFAULT NULL,
  `IsyeriNo` varchar(30) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Notlar` text COLLATE utf8_turkish_ci,
  `Resim` blob,
  `SCount` int(11) DEFAULT NULL,
  `Sure` time DEFAULT NULL,
  `kaydeden` varchar(30) COLLATE utf8_turkish_ci DEFAULT NULL,
  `ktarihi` datetime DEFAULT NULL,
  `degistiren` varchar(30) COLLATE utf8_turkish_ci DEFAULT NULL,
  `dtarihi` datetime DEFAULT NULL,
  PRIMARY KEY (`CId`),
  UNIQUE KEY `CId_UNIQUE` (`CId`)
) ENGINE=InnoDB AUTO_INCREMENT=81659 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

/*Table structure for table `abonetest` */

DROP TABLE IF EXISTS `abonetest`;

CREATE TABLE `abonetest` (
  `CId` int(11) NOT NULL AUTO_INCREMENT,
  `Tur` int(11) DEFAULT NULL,
  `Ip_adr` varchar(15) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Mac_adr` varchar(15) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Kullaniciadi` varchar(64) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Sifre` varchar(12) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Info` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `PriceId` int(11) DEFAULT NULL,
  `sms` varchar(30) COLLATE utf8_turkish_ci DEFAULT NULL,
  `FirmaUnvan` varchar(30) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Adi` varchar(30) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Soyadi` varchar(30) COLLATE utf8_turkish_ci DEFAULT NULL,
  `TcNo` varchar(12) COLLATE utf8_turkish_ci DEFAULT NULL,
  `AnneKizlikSoyadi` varchar(30) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Adres1` varchar(150) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Adres2` varchar(150) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Il` varchar(30) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Ilce` varchar(30) COLLATE utf8_turkish_ci DEFAULT NULL,
  `CepTel` varchar(15) COLLATE utf8_turkish_ci DEFAULT NULL,
  `EvTel` varchar(15) COLLATE utf8_turkish_ci DEFAULT NULL,
  `IsTel` varchar(15) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Email` varchar(30) COLLATE utf8_turkish_ci DEFAULT NULL,
  `BaslamaT` date DEFAULT NULL,
  `BitisT` date DEFAULT NULL,
  `DogumTarihi` date DEFAULT NULL,
  `VegiNo` varchar(12) COLLATE utf8_turkish_ci DEFAULT NULL,
  `VergiDairesi` varchar(30) COLLATE utf8_turkish_ci DEFAULT NULL,
  `RuhsatNo` varchar(30) COLLATE utf8_turkish_ci DEFAULT NULL,
  `KaseNo` varchar(30) COLLATE utf8_turkish_ci DEFAULT NULL,
  `IsyeriNo` varchar(30) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Notlar` text COLLATE utf8_turkish_ci,
  `Resim` blob,
  `SCount` int(11) DEFAULT NULL,
  `Sure` time DEFAULT NULL,
  `Surem` varchar(12) COLLATE utf8_turkish_ci DEFAULT NULL,
  `ktarihi` datetime DEFAULT NULL,
  `kaydeden` varchar(30) COLLATE utf8_turkish_ci DEFAULT NULL,
  `dtarihi` datetime DEFAULT NULL,
  `degistiren` varchar(30) COLLATE utf8_turkish_ci DEFAULT NULL,
  PRIMARY KEY (`CId`),
  UNIQUE KEY `CId_UNIQUE` (`CId`)
) ENGINE=InnoDB AUTO_INCREMENT=81661 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

/*Table structure for table `access_details` */

DROP TABLE IF EXISTS `access_details`;

CREATE TABLE `access_details` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Tarih` date DEFAULT NULL,
  `Saat` time DEFAULT NULL,
  `Duration` varchar(20) COLLATE utf8_turkish_ci DEFAULT NULL,
  `ClIpAddr` varchar(20) COLLATE utf8_turkish_ci DEFAULT NULL,
  `ClMac` varchar(20) COLLATE utf8_turkish_ci DEFAULT NULL,
  `ClResutCode` varchar(20) COLLATE utf8_turkish_ci DEFAULT NULL,
  `ClSize` varchar(20) COLLATE utf8_turkish_ci DEFAULT NULL,
  `RequestMethod` varchar(10) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Url` varchar(250) COLLATE utf8_turkish_ci DEFAULT NULL,
  `UrlO` varchar(500) COLLATE utf8_turkish_ci DEFAULT NULL,
  `MD5Hash` varchar(250) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Hash` varchar(250) COLLATE utf8_turkish_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=52567310 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

/*Table structure for table `adres` */

DROP TABLE IF EXISTS `adres`;

CREATE TABLE `adres` (
  `CId` int(11) DEFAULT NULL,
  `SCount` int(11) DEFAULT NULL,
  `Tur` int(11) DEFAULT NULL,
  `Adres1` varchar(150) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Adres2` varchar(150) COLLATE utf8_turkish_ci DEFAULT NULL,
  `IlceSemt` varchar(30) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Il` varchar(30) COLLATE utf8_turkish_ci DEFAULT NULL,
  `PostaKodu` varchar(6) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Tel` varchar(11) COLLATE utf8_turkish_ci DEFAULT NULL,
  `CepTel` varchar(11) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Faks` varchar(11) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Email` varchar(30) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Web` varchar(30) COLLATE utf8_turkish_ci DEFAULT NULL,
  `HaberlesmeA` varchar(5) COLLATE utf8_turkish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

/*Table structure for table `cinfo` */

DROP TABLE IF EXISTS `cinfo`;

CREATE TABLE `cinfo` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Ip` varchar(20) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Mac` varchar(20) COLLATE utf8_turkish_ci NOT NULL,
  `IfName` varchar(20) COLLATE utf8_turkish_ci DEFAULT NULL,
  `HostName` varchar(200) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Manufacture` varchar(200) COLLATE utf8_turkish_ci DEFAULT NULL,
  PRIMARY KEY (`Id`,`Mac`)
) ENGINE=InnoDB AUTO_INCREMENT=623347 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

/*Table structure for table `cui` */

DROP TABLE IF EXISTS `cui`;

CREATE TABLE `cui` (
  `clientipaddress` varchar(15) COLLATE utf8_turkish_ci NOT NULL DEFAULT '',
  `callingstationid` varchar(50) COLLATE utf8_turkish_ci NOT NULL DEFAULT '',
  `username` varchar(64) COLLATE utf8_turkish_ci NOT NULL DEFAULT '',
  `cui` varchar(32) COLLATE utf8_turkish_ci NOT NULL DEFAULT '',
  `creationdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastaccounting` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`username`,`clientipaddress`,`callingstationid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

/*Table structure for table `log` */

DROP TABLE IF EXISTS `log`;

CREATE TABLE `log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ad` text COLLATE utf8_turkish_ci NOT NULL,
  `soyad` text COLLATE utf8_turkish_ci NOT NULL,
  `telefon` text COLLATE utf8_turkish_ci NOT NULL,
  `hata` text COLLATE utf8_turkish_ci NOT NULL,
  `hatakodu` text COLLATE utf8_turkish_ci NOT NULL,
  `username` text COLLATE utf8_turkish_ci NOT NULL,
  `password` text COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

/*Table structure for table `log_access` */

DROP TABLE IF EXISTS `log_access`;

CREATE TABLE `log_access` (
  `UTime` varchar(200) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Tarih` varchar(200) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Saat` varchar(200) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Duration` varchar(200) COLLATE utf8_turkish_ci DEFAULT NULL,
  `ClIpAddr` varchar(200) COLLATE utf8_turkish_ci DEFAULT NULL,
  `ClMac` varchar(200) COLLATE utf8_turkish_ci DEFAULT NULL,
  `ClResutCode` varchar(200) COLLATE utf8_turkish_ci DEFAULT NULL,
  `ClSize` varchar(200) COLLATE utf8_turkish_ci DEFAULT NULL,
  `RequestMethod` varchar(200) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Url` varchar(500) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Ayrac` varchar(500) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Dst` varchar(500) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Dst_Ip` varchar(500) COLLATE utf8_turkish_ci DEFAULT NULL,
  `UrlO` varchar(1000) COLLATE utf8_turkish_ci DEFAULT NULL,
  `MD5Hash` varchar(1000) COLLATE utf8_turkish_ci DEFAULT NULL,
  `SHA256hash` varchar(1000) COLLATE utf8_turkish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

/*Table structure for table `logtodb` */

DROP TABLE IF EXISTS `logtodb`;

CREATE TABLE `logtodb` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Tarih` varchar(200) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Saat` varchar(200) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Duration` varchar(200) COLLATE utf8_turkish_ci DEFAULT NULL,
  `ClIpAddr` varchar(200) COLLATE utf8_turkish_ci DEFAULT NULL,
  `ClMac` varchar(200) COLLATE utf8_turkish_ci DEFAULT NULL,
  `ClResultCode` varchar(200) COLLATE utf8_turkish_ci DEFAULT NULL,
  `ClSize` varchar(200) COLLATE utf8_turkish_ci DEFAULT NULL,
  `RequestMethod` varchar(200) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Url` varchar(500) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Ayrac` varchar(500) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Dst` varchar(500) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Dst_Ip` varchar(500) COLLATE utf8_turkish_ci DEFAULT NULL,
  `UrlO` varchar(1000) COLLATE utf8_turkish_ci DEFAULT NULL,
  `MD5Hash` varchar(1000) COLLATE utf8_turkish_ci DEFAULT NULL,
  `SHA256hash` varchar(1000) COLLATE utf8_turkish_ci DEFAULT NULL,
  KEY `Id` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=23193911 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

/*Table structure for table `mernis` */

DROP TABLE IF EXISTS `mernis`;

CREATE TABLE `mernis` (
  `Id` int(11) DEFAULT NULL,
  `CId` int(11) DEFAULT NULL,
  `SCount` int(11) DEFAULT NULL,
  `Seri` varchar(5) COLLATE utf8_turkish_ci DEFAULT NULL,
  `No` varchar(10) COLLATE utf8_turkish_ci DEFAULT NULL,
  `TcNo` varchar(11) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Soyadi` varchar(30) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Adi` varchar(30) COLLATE utf8_turkish_ci DEFAULT NULL,
  `BabaAdi` varchar(30) COLLATE utf8_turkish_ci DEFAULT NULL,
  `AnaAdi` varchar(30) COLLATE utf8_turkish_ci DEFAULT NULL,
  `DogumYeri` varchar(30) COLLATE utf8_turkish_ci DEFAULT NULL,
  `DogumTarihi` varchar(40) COLLATE utf8_turkish_ci DEFAULT NULL,
  `MedeniHali` varchar(15) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Dini` varchar(15) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Il` varchar(30) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Ilce` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `MahalleKoy` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `CiltNo` varchar(5) CHARACTER SET utf8 DEFAULT NULL,
  `AileSiraNo` varchar(5) CHARACTER SET utf8 DEFAULT NULL,
  `SiraNo` varchar(5) CHARACTER SET utf8 DEFAULT NULL,
  `VerildigiYer` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `VerilisNedeni` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `KayitNo` varchar(5) CHARACTER SET utf8 DEFAULT NULL,
  `VerilisTarihi` varchar(40) CHARACTER SET utf8 DEFAULT NULL,
  `OnceliSoyadi` varchar(30) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

/*Table structure for table `nas` */

DROP TABLE IF EXISTS `nas`;

CREATE TABLE `nas` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nasname` varchar(128) COLLATE utf8_turkish_ci NOT NULL,
  `shortname` varchar(32) COLLATE utf8_turkish_ci DEFAULT NULL,
  `type` varchar(30) COLLATE utf8_turkish_ci DEFAULT 'other',
  `ports` int(5) DEFAULT NULL,
  `secret` varchar(60) COLLATE utf8_turkish_ci NOT NULL DEFAULT 'secret',
  `server` varchar(64) COLLATE utf8_turkish_ci DEFAULT NULL,
  `community` varchar(50) COLLATE utf8_turkish_ci DEFAULT NULL,
  `description` varchar(200) COLLATE utf8_turkish_ci DEFAULT 'RADIUS Client',
  PRIMARY KEY (`id`),
  KEY `nasname` (`nasname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

/*Table structure for table `nfilter` */

DROP TABLE IF EXISTS `nfilter`;

CREATE TABLE `nfilter` (
  `Id` int(11) DEFAULT NULL,
  `Sno` varchar(150) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Mac` varchar(150) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Ip` varchar(150) COLLATE utf8_turkish_ci DEFAULT NULL,
  `CpuI` varchar(150) COLLATE utf8_turkish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

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

/*Table structure for table `radacct` */

DROP TABLE IF EXISTS `radacct`;

CREATE TABLE `radacct` (
  `radacctid` bigint(21) NOT NULL AUTO_INCREMENT,
  `acctsessionid` varchar(64) COLLATE utf8_turkish_ci NOT NULL DEFAULT '',
  `acctuniqueid` varchar(32) COLLATE utf8_turkish_ci NOT NULL DEFAULT '',
  `username` varchar(64) COLLATE utf8_turkish_ci NOT NULL DEFAULT '',
  `groupname` varchar(64) COLLATE utf8_turkish_ci NOT NULL DEFAULT '',
  `realm` varchar(64) COLLATE utf8_turkish_ci DEFAULT '',
  `nasipaddress` varchar(15) COLLATE utf8_turkish_ci NOT NULL DEFAULT '',
  `nasportid` varchar(15) COLLATE utf8_turkish_ci DEFAULT NULL,
  `nasporttype` varchar(32) COLLATE utf8_turkish_ci DEFAULT NULL,
  `acctstarttime` datetime DEFAULT NULL,
  `acctstoptime` datetime DEFAULT NULL,
  `acctsessiontime` int(12) DEFAULT NULL,
  `acctauthentic` varchar(32) COLLATE utf8_turkish_ci DEFAULT NULL,
  `connectinfo_start` varchar(50) COLLATE utf8_turkish_ci DEFAULT NULL,
  `connectinfo_stop` varchar(50) COLLATE utf8_turkish_ci DEFAULT NULL,
  `acctinputoctets` bigint(20) DEFAULT NULL,
  `acctoutputoctets` bigint(20) DEFAULT NULL,
  `calledstationid` varchar(50) COLLATE utf8_turkish_ci NOT NULL DEFAULT '',
  `callingstationid` varchar(50) COLLATE utf8_turkish_ci NOT NULL DEFAULT '',
  `acctterminatecause` varchar(32) COLLATE utf8_turkish_ci NOT NULL DEFAULT '',
  `servicetype` varchar(32) COLLATE utf8_turkish_ci DEFAULT NULL,
  `framedprotocol` varchar(32) COLLATE utf8_turkish_ci DEFAULT NULL,
  `framedipaddress` varchar(15) COLLATE utf8_turkish_ci NOT NULL DEFAULT '',
  `acctstartdelay` int(12) DEFAULT NULL,
  `acctstopdelay` int(12) DEFAULT NULL,
  `xascendsessionsvrkey` varchar(10) COLLATE utf8_turkish_ci DEFAULT NULL,
  `acctupdatetime` datetime DEFAULT NULL,
  `framedipv6address` varchar(50) COLLATE utf8_turkish_ci DEFAULT NULL,
  `framedipv6prefix` varchar(50) COLLATE utf8_turkish_ci DEFAULT NULL,
  `framedinterfaceid` varchar(50) COLLATE utf8_turkish_ci DEFAULT NULL,
  `delegatedipv6prefix` varchar(50) COLLATE utf8_turkish_ci DEFAULT NULL,
  PRIMARY KEY (`radacctid`),
  KEY `username` (`username`),
  KEY `framedipaddress` (`framedipaddress`),
  KEY `acctsessionid` (`acctsessionid`),
  KEY `acctsessiontime` (`acctsessiontime`),
  KEY `acctuniqueid` (`acctuniqueid`),
  KEY `acctstarttime` (`acctstarttime`),
  KEY `acctstoptime` (`acctstoptime`),
  KEY `nasipaddress` (`nasipaddress`)
) ENGINE=InnoDB AUTO_INCREMENT=3599991 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

/*Table structure for table `radcheck` */

DROP TABLE IF EXISTS `radcheck`;

CREATE TABLE `radcheck` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(64) COLLATE utf8_turkish_ci NOT NULL DEFAULT '',
  `attribute` varchar(64) COLLATE utf8_turkish_ci NOT NULL DEFAULT '',
  `op` char(2) COLLATE utf8_turkish_ci NOT NULL DEFAULT '==',
  `value` varchar(253) COLLATE utf8_turkish_ci NOT NULL DEFAULT '',
  `tip` varchar(5) COLLATE utf8_turkish_ci NOT NULL,
  `telefon` varchar(15) COLLATE utf8_turkish_ci NOT NULL,
  `tcno` varchar(12) COLLATE utf8_turkish_ci NOT NULL,
  `ad` varchar(30) COLLATE utf8_turkish_ci NOT NULL,
  `soyad` varchar(30) COLLATE utf8_turkish_ci NOT NULL,
  `adsoyad` varchar(60) COLLATE utf8_turkish_ci NOT NULL,
  `tarih` varchar(12) COLLATE utf8_turkish_ci NOT NULL,
  `sifre` varchar(6) COLLATE utf8_turkish_ci NOT NULL,
  `dtarih` varchar(6) COLLATE utf8_turkish_ci NOT NULL,
  `kaydeden` varchar(30) COLLATE utf8_turkish_ci DEFAULT NULL,
  `ktarihi` datetime DEFAULT NULL,
  `degistiren` varchar(30) COLLATE utf8_turkish_ci DEFAULT NULL,
  `dtarihi` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `username` (`username`(32))
) ENGINE=InnoDB AUTO_INCREMENT=244990 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

/*Table structure for table `radchecktest` */

DROP TABLE IF EXISTS `radchecktest`;

CREATE TABLE `radchecktest` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(64) COLLATE utf8_turkish_ci NOT NULL DEFAULT '',
  `attribute` varchar(64) COLLATE utf8_turkish_ci NOT NULL DEFAULT '',
  `op` char(2) COLLATE utf8_turkish_ci NOT NULL DEFAULT '==',
  `value` varchar(253) COLLATE utf8_turkish_ci NOT NULL DEFAULT '',
  `tip` varchar(5) COLLATE utf8_turkish_ci NOT NULL,
  `telefon` varchar(15) COLLATE utf8_turkish_ci NOT NULL,
  `tcno` varchar(12) COLLATE utf8_turkish_ci NOT NULL,
  `ad` varchar(30) COLLATE utf8_turkish_ci NOT NULL,
  `soyad` varchar(30) COLLATE utf8_turkish_ci NOT NULL,
  `adsoyad` varchar(60) COLLATE utf8_turkish_ci NOT NULL,
  `tarih` varchar(8) COLLATE utf8_turkish_ci NOT NULL,
  `sifre` varchar(6) COLLATE utf8_turkish_ci NOT NULL,
  `dtarih` varchar(6) COLLATE utf8_turkish_ci NOT NULL,
  `kaydeden` varchar(30) COLLATE utf8_turkish_ci DEFAULT NULL,
  `ktarihi` datetime DEFAULT NULL,
  `degistiren` varchar(30) COLLATE utf8_turkish_ci DEFAULT NULL,
  `dtarihi` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `username` (`username`(32))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

/*Table structure for table `radgroupcheck` */

DROP TABLE IF EXISTS `radgroupcheck`;

CREATE TABLE `radgroupcheck` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `groupname` varchar(64) COLLATE utf8_turkish_ci NOT NULL DEFAULT '',
  `attribute` varchar(64) COLLATE utf8_turkish_ci NOT NULL DEFAULT '',
  `op` char(2) COLLATE utf8_turkish_ci NOT NULL DEFAULT '==',
  `value` varchar(253) COLLATE utf8_turkish_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `groupname` (`groupname`(32))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

/*Table structure for table `radgroupreply` */

DROP TABLE IF EXISTS `radgroupreply`;

CREATE TABLE `radgroupreply` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `groupname` varchar(64) COLLATE utf8_turkish_ci NOT NULL DEFAULT '',
  `attribute` varchar(64) COLLATE utf8_turkish_ci NOT NULL DEFAULT '',
  `op` char(2) COLLATE utf8_turkish_ci NOT NULL DEFAULT '=',
  `value` varchar(253) COLLATE utf8_turkish_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `groupname` (`groupname`(32))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

/*Table structure for table `radippool` */

DROP TABLE IF EXISTS `radippool`;

CREATE TABLE `radippool` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pool_name` varchar(30) COLLATE utf8_turkish_ci NOT NULL,
  `framedipaddress` varchar(15) COLLATE utf8_turkish_ci NOT NULL DEFAULT '',
  `nasipaddress` varchar(15) COLLATE utf8_turkish_ci NOT NULL DEFAULT '',
  `calledstationid` varchar(30) COLLATE utf8_turkish_ci NOT NULL,
  `callingstationid` varchar(30) COLLATE utf8_turkish_ci NOT NULL,
  `expiry_time` datetime DEFAULT NULL,
  `username` varchar(64) COLLATE utf8_turkish_ci NOT NULL DEFAULT '',
  `pool_key` varchar(30) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `radippool_poolname_expire` (`pool_name`,`expiry_time`),
  KEY `framedipaddress` (`framedipaddress`),
  KEY `radippool_nasip_poolkey_ipaddress` (`nasipaddress`,`pool_key`,`framedipaddress`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

/*Table structure for table `radpostauth` */

DROP TABLE IF EXISTS `radpostauth`;

CREATE TABLE `radpostauth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) COLLATE utf8_turkish_ci NOT NULL DEFAULT '',
  `pass` varchar(64) COLLATE utf8_turkish_ci NOT NULL DEFAULT '',
  `reply` varchar(32) COLLATE utf8_turkish_ci NOT NULL DEFAULT '',
  `authdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1343720 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

/*Table structure for table `radreply` */

DROP TABLE IF EXISTS `radreply`;

CREATE TABLE `radreply` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(64) COLLATE utf8_turkish_ci NOT NULL DEFAULT '',
  `attribute` varchar(64) COLLATE utf8_turkish_ci NOT NULL DEFAULT '',
  `op` char(2) COLLATE utf8_turkish_ci NOT NULL DEFAULT '=',
  `value` varchar(253) COLLATE utf8_turkish_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `username` (`username`(32))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

/*Table structure for table `radusergroup` */

DROP TABLE IF EXISTS `radusergroup`;

CREATE TABLE `radusergroup` (
  `username` varchar(64) COLLATE utf8_turkish_ci NOT NULL DEFAULT '',
  `groupname` varchar(64) COLLATE utf8_turkish_ci NOT NULL DEFAULT '',
  `priority` int(11) NOT NULL DEFAULT '1',
  KEY `username` (`username`(32))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

/*Table structure for table `regcheck` */

DROP TABLE IF EXISTS `regcheck`;

CREATE TABLE `regcheck` (
  `Cid` int(20) NOT NULL AUTO_INCREMENT,
  `TcNo` varchar(12) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Adi` varchar(30) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Soyadi` varchar(30) COLLATE utf8_turkish_ci DEFAULT NULL,
  `DogumYil` year(4) DEFAULT NULL,
  `CepTel` varchar(15) COLLATE utf8_turkish_ci DEFAULT NULL,
  `OdaNo` varchar(12) COLLATE utf8_turkish_ci DEFAULT NULL,
  `BaslamaT` date DEFAULT NULL,
  `BitisT` date DEFAULT NULL,
  `Kaydeden` varchar(30) COLLATE utf8_turkish_ci DEFAULT NULL,
  `KTarihi` datetime DEFAULT NULL,
  `Degistiren` varchar(30) COLLATE utf8_turkish_ci DEFAULT NULL,
  `dTarihi` datetime DEFAULT NULL,
  KEY `Cid` (`Cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

/*Table structure for table `smslogs` */

DROP TABLE IF EXISTS `smslogs`;

CREATE TABLE `smslogs` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Tarih` datetime DEFAULT NULL,
  `Saat` datetime DEFAULT NULL,
  `Sms` varchar(640) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Gsm` varchar(15) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Username` varchar(50) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Sifre` varchar(10) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Geridonus` varchar(20) COLLATE utf8_turkish_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=81661 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

/*Table structure for table `smslogstest` */

DROP TABLE IF EXISTS `smslogstest`;

CREATE TABLE `smslogstest` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Tarih` datetime DEFAULT NULL,
  `Saat` datetime DEFAULT NULL,
  `Sms` varchar(640) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Gsm` varchar(15) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Username` varchar(50) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Sifre` varchar(10) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Geridonus` varchar(20) COLLATE utf8_turkish_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

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

/*Table structure for table `test` */

DROP TABLE IF EXISTS `test`;

CREATE TABLE `test` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ADI` varchar(60) COLLATE utf8_turkish_ci DEFAULT NULL,
  `SOYADI` varchar(60) COLLATE utf8_turkish_ci DEFAULT NULL,
  `TCNO` varchar(12) COLLATE utf8_turkish_ci DEFAULT NULL,
  `USERNAME` varchar(60) COLLATE utf8_turkish_ci DEFAULT NULL,
  `PASSWD` varchar(60) COLLATE utf8_turkish_ci DEFAULT NULL,
  `TARIH` varchar(12) COLLATE utf8_turkish_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

/*Table structure for table `test2` */

DROP TABLE IF EXISTS `test2`;

CREATE TABLE `test2` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ADI` varchar(60) COLLATE utf8_turkish_ci DEFAULT NULL,
  `SOYADI` varchar(60) COLLATE utf8_turkish_ci DEFAULT NULL,
  `USERNAME` varchar(60) COLLATE utf8_turkish_ci DEFAULT NULL,
  `PWD` varchar(60) COLLATE utf8_turkish_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

/*Table structure for table `weblogdetay` */

DROP TABLE IF EXISTS `weblogdetay`;

CREATE TABLE `weblogdetay` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Tarih` date DEFAULT NULL,
  `Saat` time DEFAULT NULL,
  `Mid1` varchar(20) COLLATE utf8_turkish_ci DEFAULT NULL,
  `SIp` varchar(20) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Mid2` varchar(20) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Mid3` varchar(20) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Httptype` varchar(10) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Url` varchar(250) COLLATE utf8_turkish_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

/*Table structure for table `weblogzaman` */

DROP TABLE IF EXISTS `weblogzaman`;

CREATE TABLE `weblogzaman` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Tarih` date DEFAULT NULL,
  `Aciklama` varchar(250) COLLATE utf8_turkish_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

/*Table structure for table `wimax` */

DROP TABLE IF EXISTS `wimax`;

CREATE TABLE `wimax` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) COLLATE utf8_turkish_ci NOT NULL DEFAULT '',
  `authdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `spi` varchar(16) COLLATE utf8_turkish_ci NOT NULL DEFAULT '',
  `mipkey` varchar(400) COLLATE utf8_turkish_ci NOT NULL DEFAULT '',
  `lifetime` int(12) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  KEY `spi` (`spi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

/* Procedure structure for procedure `SP_USER_EKLE` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_USER_EKLE` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_USER_EKLE`(
  IN k_username VARCHAR (64),
  IN k_sifre VARCHAR (253),
  IN k_baslamat DATE ,
  IN k_bitist DATE ,
  IN k_sured VARCHAR (253),
  IN k_sures VARCHAR (253),
  IN k_telefon VARCHAR (15),
  IN k_tcno VARCHAR (12),
  IN k_ad VARCHAR (30),
  IN k_soyad VARCHAR (30),
  IN k_sms VARCHAR (640),
  IN k_geridonus VARCHAR(20),
  IN k_tarih VARCHAR (8),
  IN k_dtarih VARCHAR (60),
  IN k_kaydeden VARCHAR (30),
  IN k_ktarihi DATETIME , 
  IN k_degistiren VARCHAR (30),
  IN k_dtarihi DATETIME  
  
)
BEGIN
IF k_telefon <>'' THEN	
	 
	INSERT INTO `radius`.`radcheck`
		    (`username`, `attribute`,`op`,`value`,`tip`,`telefon`,`tcno`,`ad`,`soyad`,`adsoyad`,`tarih`,`sifre`,`dtarih`,`kaydeden`,`ktarihi`,`degistiren`,`dtarihi`)
	     VALUES (k_username, 'User-Password','==', k_sifre,'2', k_telefon, k_tcno,k_ad,k_soyad,'', k_tarih, k_sifre, k_dtarih,k_kaydeden,k_ktarihi, k_degistiren, k_dtarihi);      
	 
	INSERT INTO `radius`.`radcheck`
		    (`username`, `attribute`,`op`,`value`,`tip`,`telefon`,`tcno`,`ad`,`soyad`,`adsoyad`,`tarih`,`sifre`,`dtarih`,`kaydeden`,`ktarihi`,`degistiren`,`dtarihi`)
	     VALUES (k_username, 'Expiration','==', k_sured,'2', k_telefon, k_tcno,k_ad,k_soyad,'', k_tarih, k_sifre, k_dtarih,k_kaydeden,k_ktarihi, k_degistiren, k_dtarihi);      
	 
	INSERT INTO `radius`.`radcheck`
		    (`username`, `attribute`,`op`,`value`,`tip`,`telefon`,`tcno`,`ad`,`soyad`,`adsoyad`,`tarih`,`sifre`,`dtarih`,`kaydeden`,`ktarihi`,`degistiren`,`dtarihi`)
	     VALUES (k_username, 'Max-Daily-Session',':=',k_sures,'2', k_telefon, k_tcno,k_ad,k_soyad,'', k_tarih, k_sifre, k_dtarih,k_kaydeden,k_ktarihi, k_degistiren, k_dtarihi);      
	 
	INSERT INTO `radius`.`radcheck`
		    (`username`, `attribute`,`op`,`value`,`tip`,`telefon`,`tcno`,`ad`,`soyad`,`adsoyad`,`tarih`,`sifre`,`dtarih`,`kaydeden`,`ktarihi`,`degistiren`,`dtarihi`)
	     VALUES (k_username, 'Acct-Input-Octets',':=','838860800','2', k_telefon, k_tcno,k_ad,k_soyad,'', k_tarih, k_sifre, k_dtarih,k_kaydeden,k_ktarihi, k_degistiren, k_dtarihi);      
	 
	INSERT INTO `Abone` (`Adi`,`Soyadi`,`TcNo`,`CepTel`,`KullaniciAdi`,`Sifre`,`BaslamaT`,`BitisT`,`DogumTarihi`,`kaydeden`,`ktarihi`,`degistiren`,`dtarihi`) 
		VALUES (k_ad, k_soyad, k_tcno, k_telefon, k_username, k_sifre, k_baslamat,k_bitist, k_tarih,k_kaydeden,k_ktarihi,k_degistiren,k_dtarihi);
	 
	INSERT INTO `Abonetest` (`Adi`,`Soyadi`,`TcNo`,`CepTel`,`KullaniciAdi`,`Sifre`,`BaslamaT`,`BitisT`,`Surem`,`DogumTarihi`,`kaydeden`,`ktarihi`,`degistiren`,`dtarihi`) 
		VALUES (k_ad, k_soyad, k_tcno, k_telefon, k_username, k_sifre, k_baslamat,k_bitist, k_sures, k_tarih, k_kaydeden, k_ktarihi, k_degistiren, k_dtarihi);
END IF;
	
 
IF k_geridonus <> 'm' THEN  
	IF k_telefon <>'' THEN	
		INSERT INTO smslogs (Tarih,Saat,Sms,Gsm,Username,Sifre,Geridonus) VALUES (k_ktarihi,k_ktarihi,k_sms,k_telefon,k_username,k_sifre,k_geridonus);
	END IF;
END IF;
           
END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_USER_EKLE0` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_USER_EKLE0` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_USER_EKLE0`(
  IN k_ipadr VARCHAR (15),	
  IN k_macadr VARCHAR (15),	
  IN k_username VARCHAR (64),
  IN k_sifre VARCHAR (253),
  IN k_baslamat DATE ,
  IN k_bitist DATE ,
  IN k_sured VARCHAR (253),
  IN k_sures VARCHAR (253),
  IN k_kota VARCHAR (253),
  IN k_stimeout VARCHAR (253),
  IN k_itimeout VARCHAR (253),
  IN k_telefon VARCHAR (15),
  IN k_tcno VARCHAR (12),
  IN k_ad VARCHAR (30),
  IN k_soyad VARCHAR (30),
  IN k_sms VARCHAR (640),
  IN k_smsal VARCHAR (640),  
  IN k_geridonus VARCHAR(20),
  IN k_tarih VARCHAR (8),
  IN k_dtarih VARCHAR (60),
  IN k_kaydeden VARCHAR (30),
  IN k_ktarihi DATETIME , 
  IN k_degistiren VARCHAR (30),
  IN k_dtarihi DATETIME  
  
)
BEGIN
IF k_telefon <>'' THEN	
	 
	INSERT INTO `radius`.`radcheck`
		    (`username`, `attribute`,`op`,`value`,`tip`,`telefon`,`tcno`,`ad`,`soyad`,`adsoyad`,`tarih`,`sifre`,`dtarih`,`kaydeden`,`ktarihi`,`degistiren`,`dtarihi`)
	     VALUES (k_username, 'Cleartext-Password',':=', k_sifre,'2', k_telefon, k_tcno,k_ad,k_soyad,'', k_tarih, k_sifre, k_dtarih,k_kaydeden,k_ktarihi, k_degistiren, k_dtarihi);      
	 
	INSERT INTO `radius`.`radcheck`
		    (`username`, `attribute`,`op`,`value`,`tip`,`telefon`,`tcno`,`ad`,`soyad`,`adsoyad`,`tarih`,`sifre`,`dtarih`,`kaydeden`,`ktarihi`,`degistiren`,`dtarihi`)
	     VALUES (k_username, 'Expiration',':=', k_sured,'2', k_telefon, k_tcno,k_ad,k_soyad,'', k_tarih, k_sifre, k_dtarih,k_kaydeden,k_ktarihi, k_degistiren, k_dtarihi);      
	 
	IF k_sures <>'' THEN	
	INSERT INTO `radius`.`radcheck`
		    (`username`, `attribute`,`op`,`value`,`tip`,`telefon`,`tcno`,`ad`,`soyad`,`adsoyad`,`tarih`,`sifre`,`dtarih`,`kaydeden`,`ktarihi`,`degistiren`,`dtarihi`)
	     VALUES (k_username, 'Max-Daily-Session',':=',k_sures,'2', k_telefon, k_tcno,k_ad,k_soyad,'', k_tarih, k_sifre, k_dtarih,k_kaydeden,k_ktarihi, k_degistiren, k_dtarihi);      
	END IF;
		     
	 
	INSERT INTO `Abone` (`Ip_adr`,`Mac_adr`,`Adi`,`Soyadi`,`TcNo`,`CepTel`,`KullaniciAdi`,`Sifre`,`BaslamaT`,`BitisT`,`DogumTarihi`,`sms`,`kaydeden`,`ktarihi`,`degistiren`,`dtarihi`) 
		VALUES (k_ipadr, k_macadr, k_ad, k_soyad, k_tcno, k_telefon, k_username, k_sifre, k_baslamat,k_bitist, k_tarih, k_smsal,k_kaydeden,k_ktarihi,k_degistiren,k_dtarihi);
	 
	INSERT INTO `Abonetest` (`Ip_adr`,`Mac_adr`,`Adi`,`Soyadi`,`TcNo`,`CepTel`,`KullaniciAdi`,`Sifre`,`BaslamaT`,`BitisT`,`Surem`,`DogumTarihi`,`sms`,`kaydeden`,`ktarihi`,`degistiren`,`dtarihi`) 
		VALUES (k_ipadr, k_macadr, k_ad, k_soyad, k_tcno, k_telefon, k_username, k_sifre, k_baslamat,k_bitist, k_sures, k_tarih, k_smsal, k_kaydeden, k_ktarihi, k_degistiren, k_dtarihi);
END IF;
	
 
IF k_geridonus <> 'm' THEN  
	IF k_telefon <>'' THEN	
		INSERT INTO smslogs (Tarih,Saat,Sms,Gsm,Username,Sifre,Geridonus) VALUES (k_ktarihi,k_ktarihi,k_sms,k_telefon,k_username,k_sifre,k_geridonus);
	END IF;
END IF;
           
END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_USER_EKLE1` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_USER_EKLE1` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_USER_EKLE1`(
	
  IN k_username VARCHAR (64),
  IN k_sifre VARCHAR (253),
  IN k_baslamat DATE ,
  IN k_bitist DATE ,
  IN k_sured VARCHAR (253),
  IN k_sures VARCHAR (253),
  IN k_kota VARCHAR (253),
  IN k_stimeout VARCHAR (253),
  IN k_itimeout VARCHAR (253),
  IN k_telefon VARCHAR (15),
  IN k_tcno VARCHAR (12),
  IN k_ad VARCHAR (30),
  IN k_soyad VARCHAR (30),
  IN k_sms VARCHAR (640),
  IN k_smsal VARCHAR (640),  
  IN k_geridonus VARCHAR(20),
  IN k_tarih VARCHAR (8),
  IN k_dtarih VARCHAR (60),
  IN k_kaydeden VARCHAR (30),
  IN k_ktarihi DATETIME , 
  IN k_degistiren VARCHAR (30),
  IN k_dtarihi DATETIME  
  
)
BEGIN
IF k_telefon <>'' THEN	
	 
	INSERT INTO `radius`.`radcheck`
		    (`username`, `attribute`,`op`,`value`,`tip`,`telefon`,`tcno`,`ad`,`soyad`,`adsoyad`,`tarih`,`sifre`,`dtarih`,`kaydeden`,`ktarihi`,`degistiren`,`dtarihi`)
	     VALUES (k_username, 'Cleartext-Password',':=', k_sifre,'2', k_telefon, k_tcno,k_ad,k_soyad,'', k_tarih, k_sifre, k_dtarih,k_kaydeden,k_ktarihi, k_degistiren, k_dtarihi);      
	 
	INSERT INTO `radius`.`radcheck`
		    (`username`, `attribute`,`op`,`value`,`tip`,`telefon`,`tcno`,`ad`,`soyad`,`adsoyad`,`tarih`,`sifre`,`dtarih`,`kaydeden`,`ktarihi`,`degistiren`,`dtarihi`)
	     VALUES (k_username, 'Expiration',':=', k_sured,'2', k_telefon, k_tcno,k_ad,k_soyad,'', k_tarih, k_sifre, k_dtarih,k_kaydeden,k_ktarihi, k_degistiren, k_dtarihi);      
	 
	IF k_sures <>'' THEN	
	INSERT INTO `radius`.`radcheck`
		    (`username`, `attribute`,`op`,`value`,`tip`,`telefon`,`tcno`,`ad`,`soyad`,`adsoyad`,`tarih`,`sifre`,`dtarih`,`kaydeden`,`ktarihi`,`degistiren`,`dtarihi`)
	     VALUES (k_username, 'Max-Daily-Session',':=',k_sures,'2', k_telefon, k_tcno,k_ad,k_soyad,'', k_tarih, k_sifre, k_dtarih,k_kaydeden,k_ktarihi, k_degistiren, k_dtarihi);      
	END IF;
		     
	 
	INSERT INTO `Abone` (`Adi`,`Soyadi`,`TcNo`,`CepTel`,`KullaniciAdi`,`Sifre`,`BaslamaT`,`BitisT`,`DogumTarihi`,`sms`,`kaydeden`,`ktarihi`,`degistiren`,`dtarihi`) 
		VALUES ( k_ad, k_soyad, k_tcno, k_telefon, k_username, k_sifre, k_baslamat,k_bitist, k_tarih, k_smsal,k_kaydeden,k_ktarihi,k_degistiren,k_dtarihi);
	 
	INSERT INTO `Abonetest` (`Adi`,`Soyadi`,`TcNo`,`CepTel`,`KullaniciAdi`,`Sifre`,`BaslamaT`,`BitisT`,`Surem`,`DogumTarihi`,`sms`,`kaydeden`,`ktarihi`,`degistiren`,`dtarihi`) 
		VALUES (k_ad, k_soyad, k_tcno, k_telefon, k_username, k_sifre, k_baslamat,k_bitist, k_sures, k_tarih, k_smsal, k_kaydeden, k_ktarihi, k_degistiren, k_dtarihi);
END IF;
	
 
IF k_geridonus <> 'm' THEN  
	IF k_telefon <>'' THEN	
		INSERT INTO smslogs (Tarih,Saat,Sms,Gsm,Username,Sifre,Geridonus) VALUES (k_ktarihi,k_ktarihi,k_sms,k_telefon,k_username,k_sifre,k_geridonus);
	END IF;
END IF;
           
END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_USER_EKLE1a` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_USER_EKLE1a` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_USER_EKLE1a`(
  IN k_tur INT,
  IN k_ip_adr VARCHAR (64),  
  IN k_mac_adr VARCHAR (64),
  IN k_username VARCHAR (64),
  IN k_sifre VARCHAR (253),
  IN k_baslamat DATE ,
  IN k_bitist DATE ,
  IN k_sured VARCHAR (253),
  IN k_sures VARCHAR (253),
  IN k_kota VARCHAR (253),
  IN k_stimeout VARCHAR (253),
  IN k_itimeout VARCHAR (253),
  IN k_telefon VARCHAR (15),
  IN k_tcno VARCHAR (12),
  IN k_ad VARCHAR (30),
  IN k_soyad VARCHAR (30),
  IN k_sms VARCHAR (640),
  IN k_smsal VARCHAR (640),  
  IN k_geridonus VARCHAR(20),
  IN k_tarih VARCHAR (8),
  IN k_dtarih VARCHAR (60),
  IN k_kaydeden VARCHAR (30),
  IN k_ktarihi DATETIME , 
  IN k_degistiren VARCHAR (30),
  IN k_dtarihi DATETIME  
  
)
BEGIN
IF k_telefon <>'' THEN	
	 
	INSERT INTO `radius`.`radcheck`
		    (`username`, `attribute`,`op`,`value`,`tip`,`telefon`,`tcno`,`ad`,`soyad`,`adsoyad`,`tarih`,`sifre`,`dtarih`,`kaydeden`,`ktarihi`,`degistiren`,`dtarihi`)
	     VALUES (k_username, 'Cleartext-Password',':=', k_sifre,'2', k_telefon, k_tcno,k_ad,k_soyad,'', k_tarih, k_sifre, k_dtarih,k_kaydeden,k_ktarihi, k_degistiren, k_dtarihi);      
	 
	INSERT INTO `radius`.`radcheck`
		    (`username`, `attribute`,`op`,`value`,`tip`,`telefon`,`tcno`,`ad`,`soyad`,`adsoyad`,`tarih`,`sifre`,`dtarih`,`kaydeden`,`ktarihi`,`degistiren`,`dtarihi`)
	     VALUES (k_username, 'Expiration',':=', k_sured,'2', k_telefon, k_tcno,k_ad,k_soyad,'', k_tarih, k_sifre, k_dtarih,k_kaydeden,k_ktarihi, k_degistiren, k_dtarihi);      
	 
	IF k_sures <>'' THEN	
	INSERT INTO `radius`.`radcheck`
		    (`username`, `attribute`,`op`,`value`,`tip`,`telefon`,`tcno`,`ad`,`soyad`,`adsoyad`,`tarih`,`sifre`,`dtarih`,`kaydeden`,`ktarihi`,`degistiren`,`dtarihi`)
	     VALUES (k_username, 'Max-Daily-Session',':=',k_sures,'2', k_telefon, k_tcno,k_ad,k_soyad,'', k_tarih, k_sifre, k_dtarih,k_kaydeden,k_ktarihi, k_degistiren, k_dtarihi);      
	END IF;
		     
	 
	INSERT INTO `Abone` (`Tur`,`Ip_adr`,`Mac_adr`,`Adi`,`Soyadi`,`TcNo`,`CepTel`,`KullaniciAdi`,`Sifre`,`BaslamaT`,`BitisT`,`DogumTarihi`,`sms`,`kaydeden`,`ktarihi`,`degistiren`,`dtarihi`) 
		VALUES ( k_tur, k_ip_adr, k_mac_adr, k_ad, k_soyad, k_tcno, k_telefon, k_username, k_sifre, k_baslamat,k_bitist, k_tarih, k_smsal,k_kaydeden,k_ktarihi,k_degistiren,k_dtarihi);
	 
	INSERT INTO `Abonetest` (`Tur`,`Ip_adr`,`Mac_adr`,`Adi`,`Soyadi`,`TcNo`,`CepTel`,`KullaniciAdi`,`Sifre`,`BaslamaT`,`BitisT`,`Surem`,`DogumTarihi`,`sms`,`kaydeden`,`ktarihi`,`degistiren`,`dtarihi`) 
		VALUES (k_tur, k_ip_adr, k_mac_adr, k_ad, k_soyad, k_tcno, k_telefon, k_username, k_sifre, k_baslamat,k_bitist, k_sures, k_tarih, k_smsal, k_kaydeden, k_ktarihi, k_degistiren, k_dtarihi);
END IF;
	
 
IF k_geridonus <> 'm' THEN  
	IF k_telefon <>'' THEN	
		INSERT INTO smslogs (Tarih,Saat,Sms,Gsm,Username,Sifre,Geridonus) VALUES (k_ktarihi,k_ktarihi,k_sms,k_telefon,k_username,k_sifre,k_geridonus);
	END IF;
END IF;
           
END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_USER_EKLE2` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_USER_EKLE2` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_USER_EKLE2`(
  IN k_username VARCHAR (64),
  IN k_sifre VARCHAR (253),
  IN k_baslamat DATE ,
  IN k_bitist DATE ,
  IN k_sured VARCHAR (253),
  IN k_sures VARCHAR (253),
  IN k_kota VARCHAR (253),
  IN k_stimeout VARCHAR (253),
  IN k_itimeout VARCHAR (253),
  IN k_telefon VARCHAR (15),
  IN k_email VARCHAR (30),
  IN k_odano VARCHAR (10),
  IN k_tcno VARCHAR (12),
  IN k_ad VARCHAR (30),
  IN k_soyad VARCHAR (30),
  IN k_sms VARCHAR (640),
  IN k_smsal VARCHAR (640),  
  IN k_geridonus VARCHAR(20),
  IN k_tarih VARCHAR (8),
  IN k_dtarih VARCHAR (60),
  IN k_kaydeden VARCHAR (30),
  IN k_ktarihi DATETIME , 
  IN k_degistiren VARCHAR (30),
  IN k_dtarihi DATETIME  
  
)
BEGIN
IF k_telefon <>'' THEN	
	 
	INSERT INTO `radius`.`radcheck`
		    (`username`, `attribute`,`op`,`value`,`tip`,`telefon`,`tcno`,`ad`,`soyad`,`adsoyad`,`tarih`,`sifre`,`dtarih`,`kaydeden`,`ktarihi`,`degistiren`,`dtarihi`)
	     VALUES (k_username, 'User-Password','==', k_sifre,'2', k_telefon, k_tcno,k_ad,k_soyad,'', k_tarih, k_sifre, k_dtarih,k_kaydeden,k_ktarihi, k_degistiren, k_dtarihi);      
	 
	INSERT INTO `radius`.`radcheck`
		    (`username`, `attribute`,`op`,`value`,`tip`,`telefon`,`tcno`,`ad`,`soyad`,`adsoyad`,`tarih`,`sifre`,`dtarih`,`kaydeden`,`ktarihi`,`degistiren`,`dtarihi`)
	     VALUES (k_username, 'Expiration','==', k_sured,'2', k_telefon, k_tcno,k_ad,k_soyad,'', k_tarih, k_sifre, k_dtarih,k_kaydeden,k_ktarihi, k_degistiren, k_dtarihi);      
	 
	IF k_sures <>'' THEN	
	INSERT INTO `radius`.`radcheck`
		    (`username`, `attribute`,`op`,`value`,`tip`,`telefon`,`tcno`,`ad`,`soyad`,`adsoyad`,`tarih`,`sifre`,`dtarih`,`kaydeden`,`ktarihi`,`degistiren`,`dtarihi`)
	     VALUES (k_username, 'Max-Daily-Session',':=',k_sures,'2', k_telefon, k_tcno,k_ad,k_soyad,'', k_tarih, k_sifre, k_dtarih,k_kaydeden,k_ktarihi, k_degistiren, k_dtarihi);      
	END IF;
	
	 
	IF k_kota <>'' THEN	
	INSERT INTO `radius`.`radcheck`
		    (`username`, `attribute`,`op`,`value`,`tip`,`telefon`,`tcno`,`ad`,`soyad`,`adsoyad`,`tarih`,`sifre`,`dtarih`,`kaydeden`,`ktarihi`,`degistiren`,`dtarihi`)
	     VALUES (k_username, 'Acct-Input-Octets',':=',k_kota,'2', k_telefon, k_tcno,k_ad,k_soyad,'', k_tarih, k_sifre, k_dtarih,k_kaydeden,k_ktarihi, k_degistiren, k_dtarihi);      
	END IF;
	 
	IF k_stimeout <>'' THEN	
	INSERT INTO `radius`.`radcheck`
		    (`username`, `attribute`,`op`,`value`,`tip`,`telefon`,`tcno`,`ad`,`soyad`,`adsoyad`,`tarih`,`sifre`,`dtarih`,`kaydeden`,`ktarihi`,`degistiren`,`dtarihi`)
	     VALUES (k_username, 'Session-Timeout',':=',k_stimeout,'2', k_telefon, k_tcno,k_ad,k_soyad,'', k_tarih, k_sifre, k_dtarih,k_kaydeden,k_ktarihi, k_degistiren, k_dtarihi);      
	 END IF;
	 
	IF k_itimeout <>'' THEN	
	INSERT INTO `radius`.`radcheck`
		    (`username`, `attribute`,`op`,`value`,`tip`,`telefon`,`tcno`,`ad`,`soyad`,`adsoyad`,`tarih`,`sifre`,`dtarih`,`kaydeden`,`ktarihi`,`degistiren`,`dtarihi`)
	     VALUES (k_username, 'Idle-Timeout',':=',k_itimeout,'2', k_telefon, k_tcno,k_ad,k_soyad,'', k_tarih, k_sifre, k_dtarih,k_kaydeden,k_ktarihi, k_degistiren, k_dtarihi);      
	END IF;
	     
	 
	INSERT INTO `Abone` (`Adi`,`Soyadi`,`TcNo`,`CepTel`,`Email`,`OdaNo`,`KullaniciAdi`,`Sifre`,`BaslamaT`,`BitisT`,`DogumTarihi`,`sms`,`kaydeden`,`ktarihi`,`degistiren`,`dtarihi`) 
		VALUES (k_ad, k_soyad, k_tcno, k_telefon, k_email, k_odano, k_username, k_sifre, k_baslamat,k_bitist, k_tarih, k_smsal,k_kaydeden,k_ktarihi,k_degistiren,k_dtarihi);
	 
	INSERT INTO `Abonetest` (`Adi`,`Soyadi`,`TcNo`,`CepTel`,`Email`,`OdaNo`,`KullaniciAdi`,`Sifre`,`BaslamaT`,`BitisT`,`Surem`,`DogumTarihi`,`sms`,`kaydeden`,`ktarihi`,`degistiren`,`dtarihi`) 
		VALUES (k_ad, k_soyad, k_tcno, k_telefon,k_email, k_odano, k_username, k_sifre, k_baslamat,k_bitist, k_sures, k_tarih, k_smsal, k_kaydeden, k_ktarihi, k_degistiren, k_dtarihi);
END IF;
	
 
IF k_geridonus <> 'm' THEN  
	IF k_telefon <>'' THEN	
		INSERT INTO smslogs (Tarih,Saat,Sms,Gsm,Username,Sifre,Geridonus) VALUES (k_ktarihi,k_ktarihi,k_sms,k_telefon,k_username,k_sifre,k_geridonus);
	END IF;
END IF;
           
END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_USER_SIL` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_USER_SIL` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_USER_SIL`(
  IN k_username VARCHAR (64),
  IN k_tcno VARCHAR (12)
)
BEGIN
   DELETE FROM radcheck WHERE tcno=k_tcno AND username=k_username;
   DELETE FROM Abone WHERE TcNo=k_tcno AND Kullaniciadi=k_username;
END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_USER_UPDATE1` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_USER_UPDATE1` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_USER_UPDATE1`(
  IN k_username VARCHAR (64),
  IN k_sifre VARCHAR (253),
  IN k_sure_exp VARCHAR (253),
  IN k_sure_mds VARCHAR (253),
  IN k_AcctIO VARCHAR (253),
  IN k_SessionT VARCHAR (253),
  IN k_IdleT VARCHAR (253),  
  IN k_BandwidthUp VARCHAR (253),  
  IN k_BandwidthDown VARCHAR (253),  
  IN k_RedirURL VARCHAR (253),  
  IN k_SimultaneousUse VARCHAR (253),  
  IN k_tcno VARCHAR (12),
  IN k_telefon VARCHAR (12),
  IN k_ad VARCHAR (12),
  IN k_soyad VARCHAR (12),
  IN k_tarih VARCHAR (8),
  IN k_dtarih VARCHAR (8),
  IN k_kaydeden VARCHAR (30),  
  IN k_ktarihi DATETIME , 
  IN k_degistiren VARCHAR (30),
  IN k_dtarihi DATETIME  
  
)
BEGIN
	IF k_sifre <> '' THEN
	UPDATE `radius`.`radcheck` SET `username`=k_username, `value`=k_sifre,`degistiren`= k_degistiren,`dtarihi`=k_dtarihi 
	        WHERE tcno=k_tcno AND username=k_username AND `attribute`='User-Password';
	END IF;
	
	IF k_sure_exp <> '0' THEN
	UPDATE `radius`.`radcheck`  SET `value`=k_sure_exp,`degistiren`=k_degistiren,`dtarihi`=k_dtarihi
	        WHERE tcno=k_tcno AND username=k_username AND `attribute`='Expiration';
	END IF;
	
		 
	IF k_sure_mds <> '0' THEN	
		IF EXISTS (SELECT * FROM `radius`.`radcheck` WHERE tcno=k_tcno AND username=k_username AND `attribute`='Max-Daily-Session') THEN
		   UPDATE `radius`.`radcheck`  SET `value`=k_sure_mds ,  `degistiren`=k_degistiren, `dtarihi`=k_dtarihi
			WHERE tcno=k_tcno AND username=k_username AND `attribute`='Max-Daily-Session';
		ELSE
	           INSERT INTO `radius`.`radcheck`
		    (`username`, `attribute`,`op`,`value`,`tip`,`telefon`,`tcno`,`ad`,`soyad`,`adsoyad`,`tarih`,`sifre`,`dtarih`,`kaydeden`,`ktarihi`,`degistiren`,`dtarihi`)
			VALUES (k_username, 'Max-Daily-Session',':=',k_sure_mds,'2', k_telefon, k_tcno,k_ad,k_soyad,'', k_tarih, k_sifre, k_dtarih,k_kaydeden,k_ktarihi, k_degistiren, k_dtarihi);      
		END IF;
	ELSE
	   DELETE FROM `radius`.`radcheck`  WHERE tcno=k_tcno AND username=k_username AND `attribute`='Max-Daily-Session';
	END IF;
	
	
	IF k_AcctIO <> '0' THEN	
		IF EXISTS (SELECT * FROM `radius`.`radcheck` WHERE tcno=k_tcno AND username=k_username AND `attribute`='Acct-Input-Octets') THEN
		   UPDATE `radius`.`radcheck`  SET `value`=k_AcctIO ,  `degistiren`=k_degistiren, `dtarihi`=k_dtarihi
			WHERE tcno=k_tcno AND username=k_username AND `attribute`='Acct-Input-Octets';
		ELSE
	           INSERT INTO `radius`.`radcheck`
		    (`username`, `attribute`,`op`,`value`,`tip`,`telefon`,`tcno`,`ad`,`soyad`,`adsoyad`,`tarih`,`sifre`,`dtarih`,`kaydeden`,`ktarihi`,`degistiren`,`dtarihi`)
			VALUES (k_username, 'Acct-Input-Octets',':=',k_AcctIO,'2', k_telefon, k_tcno,k_ad,k_soyad,'', k_tarih, k_sifre, k_dtarih,k_kaydeden,k_ktarihi, k_degistiren, k_dtarihi);      
		END IF;
	ELSE
	   DELETE FROM `radius`.`radcheck`  WHERE tcno=k_tcno AND username=k_username AND `attribute`='Acct-Input-Octets';
	END IF;	
	
     
 	IF k_SessionT  <> '0' THEN	
		IF EXISTS (SELECT * FROM `radius`.`radcheck` WHERE tcno=k_tcno AND username=k_username AND `attribute`='Session-Timeout') THEN
		   UPDATE `radius`.`radcheck`  SET `value`=k_SessionT  ,  `degistiren`=k_degistiren, `dtarihi`=k_dtarihi
			WHERE tcno=k_tcno AND username=k_username AND `attribute`='Session-Timeout';
		ELSE
	           INSERT INTO `radius`.`radcheck`
		    (`username`, `attribute`,`op`,`value`,`tip`,`telefon`,`tcno`,`ad`,`soyad`,`adsoyad`,`tarih`,`sifre`,`dtarih`,`kaydeden`,`ktarihi`,`degistiren`,`dtarihi`)
			VALUES (k_username, 'Session-Timeout',':=',k_SessionT ,'2', k_telefon, k_tcno,k_ad,k_soyad,'', k_tarih, k_sifre, k_dtarih,k_kaydeden,k_ktarihi, k_degistiren, k_dtarihi);      
		END IF;
	ELSE
	   DELETE FROM `radius`.`radcheck`  WHERE tcno=k_tcno AND username=k_username AND `attribute`='Session-Timeout';
	END IF;       
	IF k_IdleT <> '0' THEN	
		IF EXISTS (SELECT * FROM `radius`.`radcheck` WHERE tcno=k_tcno AND username=k_username AND `attribute`='Idle-Timeout') THEN
		   UPDATE `radius`.`radcheck`  SET `value`=k_IdleT ,  `degistiren`=k_degistiren, `dtarihi`=k_dtarihi
			WHERE tcno=k_tcno AND username=k_username AND `attribute`='Idle-Timeout';
		ELSE
	           INSERT INTO `radius`.`radcheck`
		    (`username`, `attribute`,`op`,`value`,`tip`,`telefon`,`tcno`,`ad`,`soyad`,`adsoyad`,`tarih`,`sifre`,`dtarih`,`kaydeden`,`ktarihi`,`degistiren`,`dtarihi`)
			VALUES (k_username, 'Idle-Timeout',':=',k_IdleT,'2', k_telefon, k_tcno,k_ad,k_soyad,'', k_tarih, k_sifre, k_dtarih,k_kaydeden,k_ktarihi, k_degistiren, k_dtarihi);      
		END IF;
	ELSE
	   DELETE FROM `radius`.`radcheck`  WHERE tcno=k_tcno AND username=k_username AND `attribute`='Idle-Timeout';
	END IF;
	
	IF k_BandwidthUp <> '0' THEN	
		IF EXISTS (SELECT * FROM `radius`.`radcheck` WHERE tcno=k_tcno AND username=k_username AND `attribute`='WISPr-Bandwidth-Max-Up') THEN
		   UPDATE `radius`.`radcheck`  SET `value`=k_BandwidthUp ,  `degistiren`=k_degistiren, `dtarihi`=k_dtarihi
			WHERE tcno=k_tcno AND username=k_username AND `attribute`='WISPr-Bandwidth-Max-Up';
		ELSE
	           INSERT INTO `radius`.`radcheck`
		    (`username`, `attribute`,`op`,`value`,`tip`,`telefon`,`tcno`,`ad`,`soyad`,`adsoyad`,`tarih`,`sifre`,`dtarih`,`kaydeden`,`ktarihi`,`degistiren`,`dtarihi`)
			VALUES (k_username, 'WISPr-Bandwidth-Max-Up',':=',k_BandwidthUp,'2', k_telefon, k_tcno,k_ad,k_soyad,'', k_tarih, k_sifre, k_dtarih,k_kaydeden,k_ktarihi, k_degistiren, k_dtarihi);      
		END IF;
	ELSE
	   DELETE FROM `radius`.`radcheck`  WHERE tcno=k_tcno AND username=k_username AND `attribute`='WISPr-Bandwidth-Max-Up';
	END IF;     
	IF k_BandwidthDown <> '0' THEN	
		IF EXISTS (SELECT * FROM `radius`.`radcheck` WHERE tcno=k_tcno AND username=k_username AND `attribute`='WISPr-Bandwidth-Max-Down') THEN
		   UPDATE `radius`.`radcheck`  SET `value`=k_BandwidthDown ,  `degistiren`=k_degistiren, `dtarihi`=k_dtarihi
			WHERE tcno=k_tcno AND username=k_username AND `attribute`='WISPr-Bandwidth-Max-Down';
		ELSE
	           INSERT INTO `radius`.`radcheck`
		    (`username`, `attribute`,`op`,`value`,`tip`,`telefon`,`tcno`,`ad`,`soyad`,`adsoyad`,`tarih`,`sifre`,`dtarih`,`kaydeden`,`ktarihi`,`degistiren`,`dtarihi`)
			VALUES (k_username, 'WISPr-Bandwidth-Max-Down',':=',k_BandwidthDown,'2', k_telefon, k_tcno,k_ad,k_soyad,'', k_tarih, k_sifre, k_dtarih,k_kaydeden,k_ktarihi, k_degistiren, k_dtarihi);      
		END IF;
	ELSE
	   DELETE FROM `radius`.`radcheck`  WHERE tcno=k_tcno AND username=k_username AND `attribute`='WISPr-Bandwidth-Max-Down';
	END IF;     
	IF k_RedirURL <> '0' THEN	
		IF EXISTS (SELECT * FROM `radius`.`radcheck` WHERE tcno=k_tcno AND username=k_username AND `attribute`='WISPr-Redirection-URL') THEN
		   UPDATE `radius`.`radcheck`  SET `value`=k_RedirURL ,  `degistiren`=k_degistiren, `dtarihi`=k_dtarihi
			WHERE tcno=k_tcno AND username=k_username AND `attribute`='WISPr-Redirection-URL';
		ELSE
	           INSERT INTO `radius`.`radcheck`
		    (`username`, `attribute`,`op`,`value`,`tip`,`telefon`,`tcno`,`ad`,`soyad`,`adsoyad`,`tarih`,`sifre`,`dtarih`,`kaydeden`,`ktarihi`,`degistiren`,`dtarihi`)
			VALUES (k_username, 'WISPr-Redirection-URL',':=',k_RedirURL,'2', k_telefon, k_tcno,k_ad,k_soyad,'', k_tarih, k_sifre, k_dtarih,k_kaydeden,k_ktarihi, k_degistiren, k_dtarihi);      
		END IF;
	ELSE
	   DELETE FROM `radius`.`radcheck`  WHERE tcno=k_tcno AND username=k_username AND `attribute`='WISPr-Redirection-URL';
	END IF;
	
	
	IF k_SimultaneousUse <> '0' THEN	
		IF EXISTS (SELECT * FROM `radius`.`radcheck` WHERE tcno=k_tcno AND username=k_username AND `attribute`='Simultaneous-Use') THEN
		   UPDATE `radius`.`radcheck`  SET `value`=k_SimultaneousUse ,  `degistiren`=k_degistiren, `dtarihi`=k_dtarihi
			WHERE tcno=k_tcno AND username=k_username AND `attribute`='Simultaneous-Use';
		ELSE
	           INSERT INTO `radius`.`radcheck`
		    (`username`, `attribute`,`op`,`value`,`tip`,`telefon`,`tcno`,`ad`,`soyad`,`adsoyad`,`tarih`,`sifre`,`dtarih`,`kaydeden`,`ktarihi`,`degistiren`,`dtarihi`)
			VALUES (k_username, 'Simultaneous-Use',':=',k_SimultaneousUse,'2', k_telefon, k_tcno,k_ad,k_soyad,'', k_tarih, k_sifre, k_dtarih,k_kaydeden,k_ktarihi, k_degistiren, k_dtarihi);      
		END IF;
	ELSE
	   DELETE FROM `radius`.`radcheck`  WHERE tcno=k_tcno AND username=k_username AND `attribute`='Simultaneous-Use';
	END IF;
END */$$
DELIMITER ;

/*Table structure for table `rapor` */

DROP TABLE IF EXISTS `rapor`;

/*!50001 DROP VIEW IF EXISTS `rapor` */;
/*!50001 DROP TABLE IF EXISTS `rapor` */;

/*!50001 CREATE TABLE  `rapor`(
 `Kullaniciadi` varchar(64) ,
 `Sifre` varchar(12) ,
 `Adi` varchar(30) ,
 `Soyadi` varchar(30) ,
 `TcNo` varchar(12) ,
 `CepTel` varchar(15) ,
 `BaslamaT` date ,
 `BitisT` date ,
 `Surem` varchar(12) ,
 `framedipaddress` varchar(15) ,
 `acctstarttime` datetime ,
 `acctstoptime` datetime 
)*/;

/*Table structure for table `userlist` */

DROP TABLE IF EXISTS `userlist`;

/*!50001 DROP VIEW IF EXISTS `userlist` */;
/*!50001 DROP TABLE IF EXISTS `userlist` */;

/*!50001 CREATE TABLE  `userlist`(
 `Adi` varchar(30) ,
 `Soyadi` varchar(30) ,
 `TcNo` varchar(12) ,
 `username` varchar(64) ,
 `value` varchar(253) 
)*/;

/*Table structure for table `webanaliz` */

DROP TABLE IF EXISTS `webanaliz`;

/*!50001 DROP VIEW IF EXISTS `webanaliz` */;
/*!50001 DROP TABLE IF EXISTS `webanaliz` */;

/*!50001 CREATE TABLE  `webanaliz`(
 `Id` bigint(20) ,
 `Tarih` date ,
 `Saat` time ,
 `Duration` varchar(20) ,
 `ClIpAddr` varchar(20) ,
 `ClMac` varchar(20) ,
 `ClResutCode` varchar(20) ,
 `ClSize` varchar(20) ,
 `RequestMethod` varchar(10) ,
 `Url` varchar(250) ,
 `UrlO` varchar(500) ,
 `MD5Hash` varchar(250) ,
 `Hash` varchar(250) ,
 `oMD5` varchar(32) ,
 `Ohash` varchar(64) 
)*/;

/*View structure for view rapor */

/*!50001 DROP TABLE IF EXISTS `rapor` */;
/*!50001 DROP VIEW IF EXISTS `rapor` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `rapor` AS select `abonetest`.`Kullaniciadi` AS `Kullaniciadi`,`abonetest`.`Sifre` AS `Sifre`,`abonetest`.`Adi` AS `Adi`,`abonetest`.`Soyadi` AS `Soyadi`,`abonetest`.`TcNo` AS `TcNo`,`abonetest`.`CepTel` AS `CepTel`,`abonetest`.`BaslamaT` AS `BaslamaT`,`abonetest`.`BitisT` AS `BitisT`,`abonetest`.`Surem` AS `Surem`,`radacct`.`framedipaddress` AS `framedipaddress`,`radacct`.`acctstarttime` AS `acctstarttime`,`radacct`.`acctstoptime` AS `acctstoptime` from (`abonetest` join `radacct` on((`abonetest`.`Kullaniciadi` = `radacct`.`username`))) */;

/*View structure for view userlist */

/*!50001 DROP TABLE IF EXISTS `userlist` */;
/*!50001 DROP VIEW IF EXISTS `userlist` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `userlist` AS select `abonetest`.`Adi` AS `Adi`,`abonetest`.`Soyadi` AS `Soyadi`,`abonetest`.`TcNo` AS `TcNo`,`radcheck`.`username` AS `username`,`radcheck`.`value` AS `value` from (`abonetest` join `radcheck` on((`abonetest`.`TcNo` = `radcheck`.`tcno`))) */;

/*View structure for view webanaliz */

/*!50001 DROP TABLE IF EXISTS `webanaliz` */;
/*!50001 DROP VIEW IF EXISTS `webanaliz` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `webanaliz` AS (select `access_details`.`Id` AS `Id`,`access_details`.`Tarih` AS `Tarih`,`access_details`.`Saat` AS `Saat`,`access_details`.`Duration` AS `Duration`,`access_details`.`ClIpAddr` AS `ClIpAddr`,`access_details`.`ClMac` AS `ClMac`,`access_details`.`ClResutCode` AS `ClResutCode`,`access_details`.`ClSize` AS `ClSize`,`access_details`.`RequestMethod` AS `RequestMethod`,`access_details`.`Url` AS `Url`,`access_details`.`UrlO` AS `UrlO`,`access_details`.`MD5Hash` AS `MD5Hash`,`access_details`.`Hash` AS `Hash`,md5(`access_details`.`UrlO`) AS `oMD5`,sha2(`access_details`.`UrlO`,'') AS `Ohash` from `access_details` order by `access_details`.`Id` desc) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
