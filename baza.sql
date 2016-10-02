/*
SQLyog Trial v12.1 (64 bit)
MySQL - 5.6.12-log : Database - projekat
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`projekat` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `projekat`;

/*Table structure for table `clan` */

DROP TABLE IF EXISTS `clan`;

CREATE TABLE `clan` (
  `ime` varchar(30) DEFAULT NULL,
  `prezime` varchar(30) DEFAULT NULL,
  `jmbg` varchar(13) DEFAULT NULL,
  `telefon` varchar(30) DEFAULT NULL,
  `ulicaibroj` varchar(30) DEFAULT NULL,
  `datumosnivanja` date DEFAULT NULL,
  `clanid` varchar(10) NOT NULL,
  `mestoid` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`clanid`),
  KEY `mestoid` (`mestoid`),
  CONSTRAINT `clan_ibfk_2` FOREIGN KEY (`mestoid`) REFERENCES `mesto` (`mestoid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `clan` */

insert  into `clan`(`ime`,`prezime`,`jmbg`,`telefon`,`ulicaibroj`,`datumosnivanja`,`clanid`,`mestoid`) values ('jovanaaa','jovanaaa','1144998715144','3355555','jove ilica11','2015-05-05','1','3'),('darioooooooo','dario','6666666555232','333323','jove ilica','2015-04-16','2','2');

/*Table structure for table `film` */

DROP TABLE IF EXISTS `film`;

CREATE TABLE `film` (
  `filmid` varchar(10) NOT NULL,
  `naziv` varchar(50) DEFAULT NULL,
  `godinasnimanja` int(4) DEFAULT NULL,
  `zanr` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`filmid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `film` */

insert  into `film`(`filmid`,`naziv`,`godinasnimanja`,`zanr`) values ('1','film1',1998,'komedija'),('2','film2',2010,'horor'),('3','film3',2015,'akcija');

/*Table structure for table `kopija` */

DROP TABLE IF EXISTS `kopija`;

CREATE TABLE `kopija` (
  `kopijaid` varchar(10) NOT NULL,
  `filmid` varchar(10) NOT NULL,
  `rbr` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`kopijaid`,`filmid`),
  KEY `filmid` (`filmid`),
  CONSTRAINT `kopija_ibfk_1` FOREIGN KEY (`filmid`) REFERENCES `film` (`filmid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `kopija` */

insert  into `kopija`(`kopijaid`,`filmid`,`rbr`) values ('1','1','1'),('2','1','2'),('3','2','3'),('4','2','4'),('5','3','5');

/*Table structure for table `mesto` */

DROP TABLE IF EXISTS `mesto`;

CREATE TABLE `mesto` (
  `mestoid` varchar(10) NOT NULL,
  `ptt` int(10) DEFAULT NULL,
  `naziv` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`mestoid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `mesto` */

insert  into `mesto`(`mestoid`,`ptt`,`naziv`) values ('1',11000,'Beograd'),('2',11211,'Borca'),('3',34000,'Kraljevo');

/*Table structure for table `osoba` */

DROP TABLE IF EXISTS `osoba`;

CREATE TABLE `osoba` (
  `osobaid` varchar(10) NOT NULL,
  `ime` varchar(20) DEFAULT NULL,
  `prezime` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`osobaid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `osoba` */

insert  into `osoba`(`osobaid`,`ime`,`prezime`) values ('1','joca','joca'),('2','anaa','ana'),('3','dragan','dragan'),('4','milos','milos');

/*Table structure for table `radnici` */

DROP TABLE IF EXISTS `radnici`;

CREATE TABLE `radnici` (
  `radniciid` varchar(10) NOT NULL,
  `ime` varchar(10) DEFAULT NULL,
  `prezime` varchar(20) DEFAULT NULL,
  `korisnickoime` varchar(20) DEFAULT NULL,
  `korisnickasifra` varchar(20) DEFAULT NULL,
  `telefon` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`radniciid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `radnici` */

insert  into `radnici`(`radniciid`,`ime`,`prezime`,`korisnickoime`,`korisnickasifra`,`telefon`) values ('1','jocaR','jocaR','jjj','jjj','555-555'),('2','biljaR','biljaR','bbb','bbb','444-444');

/*Table structure for table `uloga` */

DROP TABLE IF EXISTS `uloga`;

CREATE TABLE `uloga` (
  `filmid` varchar(10) NOT NULL,
  `osobaid` varchar(10) NOT NULL,
  `ulogaid` varchar(10) NOT NULL,
  `nazivuloge` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`filmid`,`osobaid`,`ulogaid`),
  KEY `osobaid` (`osobaid`),
  CONSTRAINT `uloga_ibfk_1` FOREIGN KEY (`filmid`) REFERENCES `film` (`filmid`),
  CONSTRAINT `uloga_ibfk_2` FOREIGN KEY (`osobaid`) REFERENCES `osoba` (`osobaid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `uloga` */

insert  into `uloga`(`filmid`,`osobaid`,`ulogaid`,`nazivuloge`) values ('1','1','1','glumi'),('1','1','2','reditelj'),('1','2','1','glumi'),('2','3','1','glumi'),('2','4','3','reziser');

/*Table structure for table `zaduzenje` */

DROP TABLE IF EXISTS `zaduzenje`;

CREATE TABLE `zaduzenje` (
  `zaduzenjeid` varchar(10) NOT NULL,
  `clanid` varchar(10) NOT NULL,
  `kopijaid` varchar(10) NOT NULL,
  `filmid` varchar(10) NOT NULL,
  `datumzaduzenja` date DEFAULT NULL,
  `datumrazduzenja` date DEFAULT NULL,
  `razduzio` varchar(10) DEFAULT NULL,
  `zaduzio` varchar(10) DEFAULT NULL,
  `statuszaduzenja` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`zaduzenjeid`,`clanid`,`kopijaid`,`filmid`),
  KEY `kopijaid` (`kopijaid`,`filmid`),
  KEY `clanid` (`clanid`),
  KEY `razduzio` (`razduzio`),
  KEY `zaduzio` (`zaduzio`),
  CONSTRAINT `zaduzenje_ibfk_1` FOREIGN KEY (`kopijaid`, `filmid`) REFERENCES `kopija` (`kopijaid`, `filmid`),
  CONSTRAINT `zaduzenje_ibfk_2` FOREIGN KEY (`clanid`) REFERENCES `clan` (`clanid`),
  CONSTRAINT `zaduzenje_ibfk_3` FOREIGN KEY (`razduzio`) REFERENCES `radnici` (`radniciid`),
  CONSTRAINT `zaduzenje_ibfk_4` FOREIGN KEY (`zaduzio`) REFERENCES `radnici` (`radniciid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `zaduzenje` */

insert  into `zaduzenje`(`zaduzenjeid`,`clanid`,`kopijaid`,`filmid`,`datumzaduzenja`,`datumrazduzenja`,`razduzio`,`zaduzio`,`statuszaduzenja`) values ('1','1','1','1','2015-06-29','2015-07-02','1','2','vraceno'),('2','2','2','1','2015-07-03',NULL,NULL,'1','nije vrace'),('3','1','3','2','2015-05-26','2015-06-10','2','2','vraceno');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
