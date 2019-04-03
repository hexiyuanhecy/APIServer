/*
SQLyog Ultimate v8.71 
MySQL - 5.5.5-10.1.38-MariaDB : Database - ixiaoping
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
  `dh_name` varchar(32) DEFAULT NULL,
  `dh_info` varchar(128) DEFAULT NULL,
  `dh_star` int(32) DEFAULT NULL,
  `dh_score` decimal(11,0) DEFAULT NULL,
  `dining` varchar(32) DEFAULT NULL,
  `dh_main_img` varchar(128) DEFAULT NULL,
  `dh_add` varchar(32) DEFAULT NULL,
  `breakfast` int(11) DEFAULT NULL,
  `noodles` int(11) DEFAULT NULL,
  `meat` int(11) DEFAULT NULL,
  `rice` int(11) DEFAULT NULL,
  `rihan` int(11) DEFAULT NULL,
  PRIMARY KEY (`dh_id`),
  KEY `dh_sc` (`sc_id`),
  CONSTRAINT `dh_sc` FOREIGN KEY (`sc_id`) REFERENCES `school` (`sc_id`),
  CONSTRAINT `dh_us` FOREIGN KEY (`dh_id`) REFERENCES `user` (`dh_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

/*Data for the table `dining_hall` */

insert  into `dining_hall`(`dh_id`,`sc_id`,`dh_name`,`dh_info`,`dh_star`,`dh_score`,`dining`,`dh_main_img`,`dh_add`,`breakfast`,`noodles`,`meat`,`rice`,`rihan`) values (1,1,'重庆小面','最具重庆特色的面食，你一定要进来尝尝！店内各种口味都有，酸甜咸辣你值得拥有！',103,'5','玫瑰园','11.jpg','玫瑰园3楼',1,1,0,0,0),(2,1,'纸包鸡','江湖纸包鸡，身处江湖的你不进来坐坐吗，我们一起畅谈江湖趣闻！',160,'5','紫薇阁','21.jpg','紫薇阁3楼',0,0,1,0,0),(3,1,'特色捞饭','各种好吃的捞饭这里都有，快来啊',150,'4','紫薇阁','31.jpg','紫薇阁3楼',0,0,0,1,0),(4,1,'特色水饺','各种口味的水饺，想吃就快来',53,'5','桂花园','41.jpg','桂花园2楼',1,1,0,0,0),(5,1,'三公面馆','三公面馆，上过天天向上的面馆',56,'4','玫瑰园','51.jpg','玫瑰园2楼',1,1,0,0,0),(6,1,'周记排骨饭','选用最新鲜的排骨，只为给你最好的体验',142,'5','玫瑰园','61.jpg','玫瑰园2楼',0,0,1,0,0),(7,1,'豪大大鸡排','最实惠的价格，最美味的鸡排',16,'4','紫薇阁','71.jpg','紫薇阁2楼',0,0,1,0,1),(8,1,'黄焖鸡米饭22','黄焖鸡米饭，不吃你就奥特曼啦',65,'5','玫瑰园','81.jpg','玫瑰园2楼',0,0,1,1,0),(9,1,'麻辣香锅22','又麻又辣的香锅，只为你给你最爽的感觉',89,'5','玫瑰园','91.jpg','玫瑰园2楼',0,0,NULL,0,0),(10,1,'营养快餐11','各种营养又美味的炒菜，都能在这里找到',29,'5','紫薇阁','101.jpg','桂花园1楼',1,0,NULL,1,0),(11,1,'灌汤锅贴','外焦里嫩、外香内有汤，一起吃吧',56,'4','玫瑰园','111.jpg','玫瑰园1楼',1,0,0,0,1),(12,1,'黄焖鸡米饭33','玫瑰园的黄焖鸡米饭，非常好吃的呀',10,'4','玫瑰园','121.jpg','玫瑰园3楼',0,1,1,1,0),(13,1,'老妈烫饭','最像妈妈烫的饭啦，最有妈妈味道的饭',69,'5','玫瑰园','131.jpg','玫瑰园3楼',0,0,0,1,0),(14,1,'可鱼可饭','有鱼有饭，可鱼可饭，好吃',78,'5','玫瑰园','141.jpg','玫瑰园2楼',0,0,1,0,0),(15,1,'嵊州美食','嵊州的美食哪里有，当然在嵊州美食啦',95,'5','玫瑰园','151.jpg','玫瑰园2楼',0,0,NULL,0,1),(16,1,'台湾石锅','来自台湾的石锅拌饭，过来尝尝台湾口味吗',66,'5','玫瑰园','161.jpg','玫瑰园2楼',0,0,NULL,1,0),(17,1,'板烧饭','石板烧出来的饭，可不是一般的饭哦',88,'5','紫薇阁','171.jpg','紫薇阁3楼',0,0,NULL,0,0),(18,1,'麻辣香锅33','最麻辣的香锅，就在紫薇阁的麻辣香锅',49,'5','紫薇阁','181.jpg','紫薇阁3楼',0,0,NULL,0,0),(19,1,'营养快餐13','最便宜最营养最方便，离学校最近的的快餐',89,'5','桂花园','191.jpg','桂花园3楼',2,0,NULL,1,0),(20,1,'营养快餐12','最好吃的的快餐，就在桂花园二楼的营养快餐',78,'5','桂花园','201.jpg','桂花园2楼',3,0,NULL,1,1),(21,1,'豆腐年糕','豆腐年糕，最简单的年糕温暖你的胃',67,'5','桂花园','211.jpg','桂花园1楼',4,0,0,0,0),(22,1,'美好时光','奶茶，奶盖，水果茶，只有你想不到没有我们做不出的奶茶',100,'5','桂花园','221.jpg','桂花园1楼',0,0,0,0,0),(23,1,'时光面包','早餐必来的面包店，十分好吃的哦',101,'5','桂花园','231.jpg','桂花园1楼',1,0,0,0,0),(24,1,'五谷鱼粉','五谷杂粮遇上鱼粉，将会是一场美味盛典',69,'5','玫瑰园','241.jpg','玫瑰园2楼',0,1,NULL,0,1);

/*Table structure for table `dining_hall_img` */

DROP TABLE IF EXISTS `dining_hall_img`;

CREATE TABLE `dining_hall_img` (
  `dh_img_id` int(11) NOT NULL AUTO_INCREMENT,
  `dh_id` int(11) DEFAULT NULL,
  `dh_img_path` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`dh_img_id`),
  KEY `img_dh` (`dh_id`),
  CONSTRAINT `img_dh` FOREIGN KEY (`dh_id`) REFERENCES `dining_hall` (`dh_id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

/*Data for the table `dining_hall_img` */

insert  into `dining_hall_img`(`dh_img_id`,`dh_id`,`dh_img_path`) values (1,1,'11.jpg'),(2,1,'21.jpg'),(3,1,'31.jpg'),(4,1,'41.jpg'),(5,1,'51.jpg'),(6,2,'12.jpg'),(7,2,'22.jpg'),(8,2,'32.jpg'),(9,2,'42.jpg'),(10,2,'52.jpg'),(11,3,'13.jpg'),(12,3,'23.jpg'),(13,3,'33.jpg'),(14,3,'43.jpg'),(15,3,'53.jpg'),(16,4,'14.jpg'),(17,4,'24.jpg'),(18,4,'34.jpg'),(19,4,'44.jpg'),(20,4,'54.jpg'),(21,5,'15.jpg'),(22,5,'25.jpg'),(23,5,'35.jpg'),(24,5,'45.jpg'),(25,5,'55.jpg'),(26,6,'16.jpg'),(27,6,'26.jpg'),(28,6,'36.jpg'),(29,6,'46.jpg'),(30,6,'56.jpg'),(31,7,'17.jpg'),(32,7,'27.jpg'),(33,7,'37.jpg'),(34,7,'47.jpg'),(35,7,'57.jpg'),(36,8,'18.jpg'),(37,8,'28.jpg'),(38,8,'38.jpg'),(39,8,'48.jpg'),(40,8,'58.jpg'),(41,9,'19.jpg'),(42,9,'29.jpg'),(43,9,'39.jpg'),(44,9,'49.jpg'),(45,9,'59.jpg'),(46,10,'110.jpg'),(47,10,'210.jpg'),(48,10,'310.jpg'),(49,10,'410.jpg'),(50,10,'510.jpg'),(51,11,'111.jpg'),(52,11,'211.jpg'),(53,11,'311.jpg'),(54,11,'411.jpg'),(55,11,'511.jpg');

/*Table structure for table `dish` */

DROP TABLE IF EXISTS `dish`;

CREATE TABLE `dish` (
  `ds_id` int(11) NOT NULL AUTO_INCREMENT,
  `dh_id` int(11) DEFAULT NULL,
  `ds_name` varchar(64) DEFAULT NULL,
  `ds_img_path` varchar(128) DEFAULT NULL,
  `hot` int(11) DEFAULT NULL,
  `rihan` int(11) DEFAULT NULL,
  `specialty` int(11) DEFAULT NULL,
  `noodles` int(11) DEFAULT NULL,
  `meat` int(11) DEFAULT NULL,
  `daily` int(11) DEFAULT NULL,
  PRIMARY KEY (`ds_id`),
  KEY `ds_sh` (`dh_id`),
  CONSTRAINT `ds_sh` FOREIGN KEY (`dh_id`) REFERENCES `dining_hall` (`dh_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

/*Data for the table `dish` */

insert  into `dish`(`ds_id`,`dh_id`,`ds_name`,`ds_img_path`,`hot`,`rihan`,`specialty`,`noodles`,`meat`,`daily`) values (1,1,'葱油拌面','1.jpg',0,0,0,0,0,0),(2,1,'西红柿鸡蛋面','2.jpg',0,0,1,1,0,0),(3,1,'家常炒面','3.jpg',0,0,NULL,0,1,0),(4,1,'肉丝面','4.jpg',0,1,1,1,0,0),(5,1,'红烧肉面','5.jpg',0,NULL,0,0,0,0),(6,2,'招牌纸包鸡','6.jpg',0,0,NULL,0,1,0),(7,2,'蒜香纸包鸡','7.jpg',0,0,0,0,0,0),(8,2,'纸包肉','8.jpg',0,0,0,1,0,0),(9,2,'纸包鸡柳','9.jpg',0,0,0,NULL,0,0),(10,2,'纸包牛柳','10.jpg',0,NULL,1,0,0,0),(11,3,'蛋炒饭','11.jpg',0,0,0,0,0,0),(12,3,'鲜蔬捞饭','12.jpg',0,0,0,0,0,0),(13,3,'烤肠捞饭','13.jpg',0,0,NULL,1,1,0),(14,3,'韩式捞饭','14.jpg',0,1,1,0,0,0),(15,3,'番茄鸡蛋捞饭','15.jpg',0,NULL,0,0,0,0),(16,4,'妈妈饺子','16.jpg',0,0,0,0,0,0),(17,4,'芹菜饺子','17.jpg',0,1,NULL,0,1,0),(18,4,'白菜饺子','18.jpg',0,0,1,NULL,0,0),(19,4,'肉馅饺子','19.jpg',0,0,0,0,0,0),(20,4,'全家福饺子','20.jpg',0,0,0,0,0,0),(21,5,'意式炒面','21.jpg',0,NULL,0,1,0,0),(22,5,'法式拌面','22.jpg',0,1,0,0,1,0),(23,5,'青椒意面','23.jpg',0,0,1,0,0,0),(24,5,'经典意大利面','24.jpg',0,1,0,0,0,0),(25,5,'番茄鸡蛋意面','25.jpg',0,0,NULL,1,1,0);

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
  `hot` int(11) DEFAULT NULL,
  `rihan` int(11) DEFAULT NULL,
  `specialty` int(11) DEFAULT NULL,
  `noodles` int(11) DEFAULT NULL,
  `meat` int(11) DEFAULT NULL,
  `daily` int(11) DEFAULT NULL,
  PRIMARY KEY (`es_id`),
  KEY `es_dh` (`dh_id`),
  KEY `es_us` (`us_id`),
  CONSTRAINT `es_dh` FOREIGN KEY (`dh_id`) REFERENCES `dining_hall` (`dh_id`),
  CONSTRAINT `es_us` FOREIGN KEY (`us_id`) REFERENCES `user` (`us_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

/*Data for the table `estimate` */

insert  into `estimate`(`es_id`,`dh_id`,`us_id`,`es_content`,`es_date`,`es_score`,`es_star`,`es_main_img`,`hot`,`rihan`,`specialty`,`noodles`,`meat`,`daily`) values (1,1,2,'最喜欢这个菜了，强推强推','2018-12-01','5.000000','56.000000',NULL,0,0,0,0,0,0),(2,1,1,'太好吃啦！就是生意太好了，人太多，排队排了好久，但是是真的好吃','2018-09-16','4.500000','45.000000',NULL,0,0,1,1,0,0),(3,2,1,'第N次来这里吃东西了，超好吃，强力推荐，一定要吃这家店的招牌','2019-01-16','4.900000','23.000000',NULL,0,0,NULL,0,1,0),(4,2,3,'每周必点的一顿，下课后直接飞奔而来。太好吃了','2019-03-26','4.600000','56.000000',NULL,0,1,1,1,0,0),(5,3,3,'最近爱上了这道菜，连续吃了三天也不腻，也是真好吃了','2019-03-06','4.500000','15.000000',NULL,0,NULL,0,0,0,0),(6,3,4,'这个菜挺好吃的，还不贵，老板热人还超好的','2019-01-06','4.700000','46.000000',NULL,0,0,NULL,0,1,0),(7,4,2,'这个味儿佷鲜，还不是很腻，超喜欢吃的','2018-12-01','4.800000','53.000000',NULL,0,0,0,0,0,0),(8,4,4,'我从未尝过如此美味的食物，真是好吃啊','2018-09-16','4.000000','49.000000',NULL,0,0,0,1,0,0),(9,5,1,'真是好吃的这个，特别是不知道吃啥的时，直接走进这家店准没错','2019-01-16','5.000000','67.000000',NULL,0,0,0,NULL,0,0),(10,5,6,'从大一开始就超喜欢这个店的东西，好吃便宜，非常感人','2019-03-26','4.900000','39.000000',NULL,0,NULL,1,0,0,0),(11,6,8,'上次把手机拉在这里了，老板很好心的给我保留着让我来拿，感恩，老板家的东西也超好吃','2019-03-06','4.600000','55.000000',NULL,0,0,0,0,0,0),(12,6,3,'浙理最好吃的电，没有之一，单方面承认，不接受反驳','2019-01-06','4.700000','66.000000',NULL,0,0,0,0,0,0),(13,7,4,'啊啊啊啊啊，最喜欢这个菜了，强推强推','2019-03-26','4.400000','49.000000',NULL,0,0,NULL,1,1,0),(14,7,5,'没什么好说的了，就是好吃！！！','2018-12-01','4.300000','68.000000',NULL,0,1,1,0,0,0),(15,8,5,'还蛮好吃的这个菜，偶尔跟室友一起来这家店吃，不会失望','2018-09-16','4.600000','85.000000',NULL,0,NULL,0,0,0,0),(16,8,2,'真是好吃的呀，不容错过的浙理良心商家，店铺','2019-01-16','4.900000','82.000000',NULL,0,0,0,0,0,0),(17,8,6,'好吃到飞上天，真是爽到飞起。这味道杠杠的','2019-03-26','4.500000','73.000000',NULL,0,1,NULL,0,1,0),(18,9,6,'很好吃，超好的，超美味的，哈哈哈哈哈哈哈哈哈哈哈哈来吃来吃啊','2019-03-06','4.600000','61.000000',NULL,0,0,1,NULL,0,0),(19,9,7,'十分满意吃的超开心的呢！！！','2019-01-06','4.700000','64.000000',NULL,0,0,0,0,0,0),(20,10,7,'昨天吃的这个菜，蛮好吃的，可以常来啊','2018-12-01','4.300000','29.000000',NULL,0,0,0,0,0,0),(21,10,7,'惊喜，以为会很一般，但是真的很好吃啊！','2018-09-16','4.600000','49.000000',NULL,0,NULL,0,1,0,0),(22,2,3,'每周必点的一顿，下课后直接飞奔而来。太好吃了','2019-03-26','4.600000','56.000000',NULL,0,1,1,1,0,0),(23,4,4,'我从未尝过如此美味的食物，真是好吃啊','2018-09-16','4.000000','49.000000',NULL,0,0,0,1,0,0),(24,6,3,'浙理最好吃的电，没有之一，单方面承认，不接受反驳','2019-01-06','4.700000','66.000000',NULL,0,0,0,0,0,0),(25,8,6,'好吃到飞上天，真是爽到飞起。这味道杠杠的','2019-03-26','4.500000','73.000000',NULL,0,1,NULL,0,1,0);

/*Table structure for table `estimate_img` */

DROP TABLE IF EXISTS `estimate_img`;

CREATE TABLE `estimate_img` (
  `es_img_id` int(11) NOT NULL AUTO_INCREMENT,
  `es_id` int(11) DEFAULT NULL,
  `es_img_path` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`es_img_id`),
  KEY `img_es` (`es_id`),
  CONSTRAINT `img_es` FOREIGN KEY (`es_id`) REFERENCES `estimate` (`es_id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

/*Data for the table `estimate_img` */

insert  into `estimate_img`(`es_img_id`,`es_id`,`es_img_path`) values (1,1,'11.jpg'),(2,1,'21.jpg'),(3,1,'31.jpg'),(4,1,'41.jpg'),(5,1,'51.jpg'),(6,2,'12.jpg'),(7,2,'22.jpg'),(8,2,'32.jpg'),(9,2,'42.jpg'),(10,2,'52.jpg'),(11,3,'13.jpg'),(12,3,'23.jpg'),(13,3,'33.jpg'),(14,3,'43.jpg'),(15,3,'53.jpg'),(16,4,'14.jpg'),(17,4,'24.jpg'),(18,4,'34.jpg'),(19,4,'44.jpg'),(20,4,'54.jpg'),(21,5,'15.jpg'),(22,5,'25.jpg'),(23,5,'35.jpg'),(24,5,'45.jpg'),(25,5,'55.jpg'),(26,6,'16.jpg'),(27,6,'26.jpg'),(28,6,'36.jpg'),(29,6,'46.jpg'),(30,6,'56.jpg'),(31,7,'17.jpg'),(32,7,'27.jpg'),(33,7,'37.jpg'),(34,7,'47.jpg'),(35,7,'57.jpg'),(36,8,'18.jpg'),(37,8,'28.jpg'),(38,8,'38.jpg'),(39,8,'48.jpg'),(40,8,'58.jpg'),(41,9,'19.jpg'),(42,9,'29.jpg'),(43,9,'39.jpg'),(44,9,'49.jpg'),(45,9,'59.jpg'),(46,10,'110.jpg'),(47,10,'210.jpg'),(48,10,'310.jpg'),(49,10,'410.jpg'),(50,10,'510.jpg'),(51,11,'111.jpg'),(52,11,'211.jpg'),(53,11,'311.jpg'),(54,11,'411.jpg'),(55,11,'511.jpg');

/*Table structure for table `school` */

DROP TABLE IF EXISTS `school`;

CREATE TABLE `school` (
  `sc_id` int(11) NOT NULL AUTO_INCREMENT,
  `sc_name` varchar(64) DEFAULT NULL,
  `sc_add` varchar(32) DEFAULT NULL,
  `sc_img` varchar(128) DEFAULT NULL,
  `sc_img1` varchar(128) DEFAULT NULL,
  `sc_img2` varchar(128) DEFAULT NULL,
  `sc_img3` varchar(128) DEFAULT NULL,
  `sc_img4` varchar(128) DEFAULT NULL,
  `sc_img5` varchar(128) DEFAULT NULL,
  UNIQUE KEY `sc_id` (`sc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

/*Data for the table `school` */

insert  into `school`(`sc_id`,`sc_name`,`sc_add`,`sc_img`,`sc_img1`,`sc_img2`,`sc_img3`,`sc_img4`,`sc_img5`) values (1,'浙江理工大学','杭州','zstu.jpg','zstu1.jpg','zstu2.jpg','zstu3.jpg','zstu4.jpg','zstu5.jpg'),(2,'杭州电子科技大学','杭州','dianzi.jpg','dianzi1.jpg','dianzi2.jpg','dianzi3.jpg','dianzi4.jpg','dianzi5.jpg'),(3,'中国计量大学','杭州','jiliang.jpg','jiliang1.jpg','jiliang2.jpg','jiliang3.jpg','jiliang4.jpg','jiliang5.jpg'),(4,'浙江传媒学院','杭州','chuanmei.jpg','chuanmei1.jpg','chuanmei2.jpg','chuanmei3.jpg','chuanmei4.jpg','chuanmei5.jpg'),(5,'浙江工商大学','杭州','NULL','NULL','NULL','NULL','NULL','NULL'),(6,'浙江工业大学','杭州','NULL','NULL','NULL','NULL','NULL','NULL'),(7,'杭州师范大学','杭州','NULL','NULL','NULL','NULL','NULL','NULL'),(8,'浙江大学','杭州','NULL','NULL','NULL','NULL','NULL','NULL'),(9,'浙江农林大学','杭州','NULL','NULL','NULL','NULL','NULL','NULL'),(10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

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

/*Data for the table `user` */

insert  into `user`(`us_id`,`dh_id`,`us_ph`,`us_name`,`us_pwd`,`us_pic`,`us_sign`,`us_birh`,`us_email`) values (1,1,'18177310581','Admin','Admin',NULL,'我就是我，不一样的烟火',NULL,'153769507@qq.com'),(2,0,'18177310581','admin','123456','1.jpg','我就是我，不一样的烟火','1999-03-15','153769507@qq.com'),(3,0,'15858197901','张三','123456','2.jpg','小小吃货一枚','2000-04-19','153769507@qq.com'),(4,0,'15858197906','李四','123456','3.jpg','尼古拉斯·赵四就是我，是的！','2000-10-01','153769507@qq.com');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
