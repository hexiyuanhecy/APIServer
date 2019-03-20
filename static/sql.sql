/*
SQLyog Ultimate v8.71 
MySQL _ 5.5.5_10.1.38_MariaDB : Database _ ixiaoping
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ixiaoping` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `ixiaoping`;

/*Table structure for table `dining_hall` */

DROP TABLE IF EXISTS `dining_hall`;

CREATE TABLE `dining_hall` (
  `dh_id` int(11) NOT NULL AUTO_INCREMENT,
  `sc_id` int(11) DEFAULT NULL,
  `us_id` int(11) DEFAULT NULL,
  `dh_name` varchar(32) DEFAULT NULL,
  `dh_add` varchar(32) DEFAULT NULL,
  `dh_info` varchar(128) DEFAULT NULL,
  `dh_kind` varchar(32) DEFAULT NULL,
  `dh_star` int(11) DEFAULT NULL,
  `dh_score` int(11) DEFAULT NULL,
  `dh_main_img` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`dh_id`),
  KEY `dh_sc` (`sc_id`),
  CONSTRAINT `dh_sc` FOREIGN KEY (`sc_id`) REFERENCES `school` (`sc_id`),
  CONSTRAINT `dh_us` FOREIGN KEY (`dh_id`) REFERENCES `user` (`dh_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert  into `dining_hall`(`dh_id`,`sc_id`,`us_id`,`dh_name`,`dh_add`,`dh_info`,`dh_kind`) values (1,1,1,'韩式烤肉拌饭','玫瑰园二楼','正宗的韩式烤肉拌饭，你值得拥有！','韩式料理');
/*Data for the table `dining_hall` */

/*Table structure for table `dining_hall_img` */

DROP TABLE IF EXISTS `dining_hall_img`;

CREATE TABLE `dining_hall_img` (
  `dh_img_id` int(11) NOT NULL AUTO_INCREMENT,
  `dh_id` int(11) DEFAULT NULL,
  `dg_img_path` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`dh_img_id`),
  KEY `img_dh` (`dh_id`),
  CONSTRAINT `img_dh` FOREIGN KEY (`dh_id`) REFERENCES `dining_hall` (`dh_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `dining_hall_img` */

/*Table structure for table `dish` */

DROP TABLE IF EXISTS `dish`;

CREATE TABLE `dish` (
  `ds_id` int(11) NOT NULL AUTO_INCREMENT,
  `dh_id` int(11) DEFAULT NULL,
  `ds_name` varchar(64) DEFAULT NULL,
  `ds_img_path` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`ds_id`),
  KEY `ds_sh` (`dh_id`),
  CONSTRAINT `ds_sh` FOREIGN KEY (`dh_id`) REFERENCES `dining_hall` (`dh_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `dish` */

/*Table structure for table `estimate` */

DROP TABLE IF EXISTS `estimate`;

CREATE TABLE `estimate` (
  `es_id` int(11) NOT NULL AUTO_INCREMENT,
  `dh_id` int(11) DEFAULT NULL,
  `us_id` int(11) DEFAULT NULL,
  `es_content` varchar(2048) DEFAULT NULL,
  `es_date` date DEFAULT NULL,
  `es_score` varchar(32) DEFAULT NULL,
  `es_star` varchar(32) DEFAULT NULL,
  `es_main_img` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`es_id`),
  KEY `es_dh` (`dh_id`),
  KEY `es_us` (`us_id`),
  CONSTRAINT `es_us` FOREIGN KEY (`us_id`) REFERENCES `user` (`us_id`),
  CONSTRAINT `es_dh` FOREIGN KEY (`dh_id`) REFERENCES `dining_hall` (`dh_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `estimate` */

/*Table structure for table `estimate_img` */

DROP TABLE IF EXISTS `estimate_img`;

CREATE TABLE `estimate_img` (
  `es_img_id` int(11) NOT NULL AUTO_INCREMENT,
  `es_id` int(11) DEFAULT NULL,
  `es_img_path` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`es_img_id`),
  KEY `img_es` (`es_id`),
  CONSTRAINT `img_es` FOREIGN KEY (`es_id`) REFERENCES `estimate` (`es_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `estimate_img` */

/*Table structure for table `school` */

DROP TABLE IF EXISTS `school`;

CREATE TABLE `school` (
  `sc_id` int(11) NOT NULL AUTO_INCREMENT,
  `sc_name` varchar(64) DEFAULT NULL,
  `sc_add` varchar(32) DEFAULT NULL,
  UNIQUE KEY `sc_id` (`sc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `school` */

insert  into `school`(`sc_id`,`sc_name`,`sc_add`) values (1,'浙江理工大学','杭州');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `us_id` int(11) NOT NULL,
  `dh_id` int(11) DEFAULT NULL,
  `us_ph` varchar(11) DEFAULT NULL,
  `us_name` varchar(32) DEFAULT NULL,
  `us_pwd` varchar(32) DEFAULT NULL,
  `us_pic` varchar(128) DEFAULT NULL,
  `us_sign` varchar(520) DEFAULT NULL,
  `us_birh` date DEFAULT NULL,
  `us_email` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`us_id`),
  KEY `FK_user` (`dh_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert  into `user`(`us_id`,`dh_id`,`us_ph`,`us_name`,`us_pwd`,`us_sign`,`us_email`) values (1,1,'18177310581','Admin','Admin','我就是我，不一样的烟火','153769507@qq.com');

/*Data for the table `user` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;