# MySQL-Front 5.0  (Build 1.0)

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE */;
/*!40101 SET SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES */;
/*!40103 SET SQL_NOTES='ON' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;


# Host: 127.0.0.1    Database: thomas2
# ------------------------------------------------------
# Server version 5.5.5-10.1.13-MariaDB

DROP DATABASE IF EXISTS `thomas2`;
CREATE DATABASE `thomas2` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `thomas2`;

#
# Table structure for table about
#

CREATE TABLE `about` (
  `aboname` varchar(30) NOT NULL COMMENT '域名',
  `abotitle` varchar(20) NOT NULL COMMENT '站点标题',
  `abokeyword` varchar(50) NOT NULL COMMENT '关键字',
  `abocontact` varchar(20) NOT NULL COMMENT '联系人',
  `abotel` varchar(11) NOT NULL COMMENT '联系电话',
  `aboemail` varchar(20) DEFAULT NULL COMMENT '网站联系邮箱',
  `aboaddress` varchar(50) NOT NULL COMMENT '联系地址',
  `abodescription` text NOT NULL COMMENT '网站描述',
  PRIMARY KEY (`aboname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='网站信息表';
INSERT INTO `about` VALUES ('www.thomasyzt.cn:888','杭职软件技术协会','JavaServerPage、HTML、CSS','余卓腾','15967772136','15967772136@163.com','杭州职业技术学院','没有！土豪可以扫扫下方二维码噢~ c');
/*!40000 ALTER TABLE `about` ENABLE KEYS */;
UNLOCK TABLES;

#
# Table structure for table admin
#

CREATE TABLE `admin` (
  `admid` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增编号，主键',
  `admname` varchar(20) NOT NULL COMMENT '登录帐号',
  `admpassword` varchar(20) NOT NULL COMMENT '登录密码',
  `admnickname` varchar(20) NOT NULL COMMENT '管理员昵称',
  `admpic` varchar(255) NOT NULL COMMENT '管理员头像',
  PRIMARY KEY (`admid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员表';
INSERT INTO `admin` VALUES (1,'admin','123456','管理员','20161103084746640.jpg');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

#
# Table structure for table city
#

CREATE TABLE `city` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` int(11) DEFAULT NULL COMMENT '0:省 1:市',
  `name` varchar(255) DEFAULT NULL COMMENT '省市名称',
  `provinceid` int(11) DEFAULT NULL COMMENT '省id',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='省市表';
INSERT INTO `city` VALUES (1,0,'北京市',1);
INSERT INTO `city` VALUES (2,0,'上海市',2);
INSERT INTO `city` VALUES (3,0,'浙江省',3);
INSERT INTO `city` VALUES (4,0,'安徽省',4);
INSERT INTO `city` VALUES (5,0,'江西省',5);
INSERT INTO `city` VALUES (6,0,'江苏省',6);
INSERT INTO `city` VALUES (7,1,'朝阳区',1);
INSERT INTO `city` VALUES (8,1,'东城区',1);
INSERT INTO `city` VALUES (9,1,'西城区',1);
INSERT INTO `city` VALUES (10,1,'崇文区',1);
INSERT INTO `city` VALUES (11,1,'其他',1);
INSERT INTO `city` VALUES (12,1,'黄浦区',2);
INSERT INTO `city` VALUES (13,1,'徐汇区',2);
INSERT INTO `city` VALUES (14,1,'普陀区',2);
INSERT INTO `city` VALUES (15,1,'虹口区',2);
INSERT INTO `city` VALUES (16,1,'其他',2);
INSERT INTO `city` VALUES (17,1,'杭州市',3);
INSERT INTO `city` VALUES (18,1,'宁波市',3);
INSERT INTO `city` VALUES (19,1,'温州市',3);
INSERT INTO `city` VALUES (20,1,'台州市',3);
INSERT INTO `city` VALUES (21,1,'绍兴市',3);
INSERT INTO `city` VALUES (22,1,'其他',3);
INSERT INTO `city` VALUES (23,1,'其他',4);
INSERT INTO `city` VALUES (24,1,'其他',5);
INSERT INTO `city` VALUES (25,1,'其他',6);
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

#
# Table structure for table customer
#

CREATE TABLE `customer` (
  `cusid` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增编号，主键',
  `cusname` varchar(20) NOT NULL COMMENT '登录帐号',
  `cuspassword` varchar(20) NOT NULL COMMENT '登录密码',
  `cusnickname` varchar(20) NOT NULL COMMENT '用户昵称',
  `cussex` varchar(2) NOT NULL COMMENT '用户性别',
  `cusemail` varchar(20) NOT NULL COMMENT '用户邮箱',
  `custel` varchar(11) NOT NULL COMMENT '用户电话',
  `cusaddress` varchar(20) DEFAULT NULL COMMENT '地址',
  `cuspic` varchar(255) NOT NULL COMMENT '用户头像',
  PRIMARY KEY (`cusid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='用户表';
INSERT INTO `customer` VALUES (1,'1511102031','123456','阿腾','男','402890539@qq.com','15967772136','18','20161028012256884.jpg');
INSERT INTO `customer` VALUES (2,'1560101009','123456','琪琪','男','280602100@qq.com','13575441898','17','default.jpg');
INSERT INTO `customer` VALUES (3,'1511102043','123456','阿凯','男','1193083111@qq.com','13586827536','17','default.jpg');
INSERT INTO `customer` VALUES (4,'1511103023','123456','戚博','男','760744383@qq.com','11111111111','17','p13.jpg');
INSERT INTO `customer` VALUES (5,'1592010216','123456','东旭','男','343099045@163.com','11111111111','17','default.jpg');
INSERT INTO `customer` VALUES (6,'1510101011','123456','于琪','男','2211654555@qq.com','11111111111','17','default.jpg');
INSERT INTO `customer` VALUES (7,'1511111111','123456','水军1','男','402890539@qq.com','11012345678','17','default.jpg');
INSERT INTO `customer` VALUES (8,'1511111112','123456','水军2','男','402890539@qq.com','11012345678','8','default.jpg');
INSERT INTO `customer` VALUES (9,'1511111113','123456','水军3','男','402890539@qq.com','11012345678','17','default.jpg');
INSERT INTO `customer` VALUES (10,'1510202050','19961120.','美美美','女','may1668091344@qq.com','13738577573','17','444.jpg');
INSERT INTO `customer` VALUES (11,'1511102039','123123','21312312','男','402890539@qq.com','11012345678','18','default.jpg');
INSERT INTO `customer` VALUES (12,'1511102035','123123','1231231234','男','402890539@qq.com','11012345678','7','default.jpg');
INSERT INTO `customer` VALUES (13,'1511102036','123123','123123123','男','402890539@qq.com','11012345678','7','default.jpg');
INSERT INTO `customer` VALUES (14,'1511102037','1231231231','21312312312','男','402890539@qq.com','11112345678','7','default.jpg');
INSERT INTO `customer` VALUES (15,'1511102024','123123312','123123','男','402890539@qq.com','11012345678','13','default.jpg');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

#
# Table structure for table data
#

CREATE TABLE `data` (
  `dataid` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增编号，主键',
  `dataname` varchar(20) DEFAULT NULL COMMENT '资源名称',
  `datalink` varchar(100) NOT NULL COMMENT '资源链接',
  `datatime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发布时间',
  PRIMARY KEY (`dataid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='资源表';
INSERT INTO `data` VALUES (1,'ckeditor编辑器','20161029093702.zip','2016-10-29 21:37:02');
/*!40000 ALTER TABLE `data` ENABLE KEYS */;
UNLOCK TABLES;

#
# Table structure for table message
#

CREATE TABLE `message` (
  `mesid` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增编号，主键',
  `mesnickname` varchar(20) NOT NULL COMMENT '用户昵称',
  `mestext` text NOT NULL COMMENT '用户留言',
  `mestime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '留言时间',
  PRIMARY KEY (`mesid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='留言表';
INSERT INTO `message` VALUES (1,'管理员','欢迎来到留言板，请登录后再留言\r\n','2016-10-01');
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

#
# Table structure for table notice
#

CREATE TABLE `notice` (
  `notid` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增编号，主键',
  `nottitle` varchar(30) NOT NULL COMMENT '公告标题',
  `notauthor` varchar(20) NOT NULL COMMENT '发布人',
  `notcontent` text NOT NULL COMMENT '公告内容',
  `nottime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发布时间',
  PRIMARY KEY (`notid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='公告表';
INSERT INTO `notice` VALUES (1,'asdf sdf sdf','管理员','<p><img alt=\"\" src=\"../upload/20161029104159224.png\" style=\"height:296px; width:400px\" />aaaaaaaaaaaaaaaaaaaaaa</p>\r\n','2016-10-29 22:42:17');
INSERT INTO `notice` VALUES (2,'adasdasd','管理员','<p>asaaaaaaaaaaaaaaa<img alt=\"\" src=\"upload/20161029104308276.jpeg\" /><img alt=\"\" src=\"/thomas2/upload/20161103071414689.gif\" style=\"height:144px; width:513px\" /></p>\r\n','2016-10-29 22:43:18');
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;
UNLOCK TABLES;

#
# Table structure for table roster
#

CREATE TABLE `roster` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `job` varchar(255) DEFAULT '成员' COMMENT '职务',
  `name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `sex` varchar(255) DEFAULT NULL COMMENT '性别',
  `department` varchar(255) DEFAULT '信息工程学院软件技术专业' COMMENT '系院',
  `classess` varchar(255) DEFAULT NULL COMMENT '班级',
  `tel` varchar(255) DEFAULT NULL COMMENT '电话',
  `dormitory` varchar(255) DEFAULT NULL COMMENT '寝室',
  `fee` int(11) DEFAULT '0' COMMENT '会费',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COMMENT='花名册';
INSERT INTO `roster` VALUES (1,'会长','吴耀杰','男','信息工程学院软件技术专业','软件1512','15395823373','嵩阳11#419',1);
INSERT INTO `roster` VALUES (2,'副会长','余卓腾','男','信息工程学院软件技术专业','软件1512','15967772136','嵩阳11#605',1);
INSERT INTO `roster` VALUES (3,'纪检部部长','汤明','男','信息工程学院软件技术专业','软件1512','18100177318','嵩阳11#605',1);
INSERT INTO `roster` VALUES (4,'财务部部长','郑凯','男','信息工程学院软件技术专业','软件1512','13586827536','嵩阳11#606',1);
INSERT INTO `roster` VALUES (5,'技术部部长','戚博','男','信息工程学院软件技术专业','软件1513','18100172257','嵩阳06#521',1);
INSERT INTO `roster` VALUES (6,'技术部部长','吕宽','男','信息工程学院软件技术专业','软件1511','15868842515','嵩阳11#116',1);
INSERT INTO `roster` VALUES (7,'人事部部长','李国超','男','信息工程学院软件技术专业','软件1512','15868840802','嵩阳11#603',1);
INSERT INTO `roster` VALUES (8,'人事部部长','徐楚量','男','信息工程学院软件技术专业','软件1513','15857500608','嵩阳06#511',1);
INSERT INTO `roster` VALUES (9,'成员','七根萝卜','男','信息工程学院软件技术专业','软件1513','12345678900','嵩阳06#111',0);
INSERT INTO `roster` VALUES (10,'成员','梁彬彬','男','信息工程学院软件技术专业','软件1611','15957584742','嵩阳11#106',1);
INSERT INTO `roster` VALUES (11,'成员','王正国','男','信息工程学院软件技术专业','软件1611','18268567255','嵩阳11#109',1);
INSERT INTO `roster` VALUES (12,'成员','陈文树','男','信息工程学院软件技术专业','软件1613','13676740308','嵩阳11#312',1);
INSERT INTO `roster` VALUES (13,'成员','徐智豪','男','信息工程学院软件技术专业','软件1613','13386539310','嵩阳11#319',1);
INSERT INTO `roster` VALUES (14,'成员','陈林静','女','信息工程学院软件技术专业','软件1613','13819762113','嵩阳04#524',1);
INSERT INTO `roster` VALUES (15,'成员','王佳琛','男','信息工程学院软件技术专业','软件1613','13093772050','嵩阳11#319',1);
INSERT INTO `roster` VALUES (16,'成员','洪晨磊','男','信息工程学院软件技术专业','软件1613','15356121301','嵩阳11#312',1);
INSERT INTO `roster` VALUES (17,'成员','黄昭辉','男','信息工程学院软件技术专业','软件1612','15867708141','嵩阳11#308',1);
INSERT INTO `roster` VALUES (18,'成员','鲍晓晴','女','信息工程学院软件技术专业','软件1612','18958040182','嵩阳04#520',1);
INSERT INTO `roster` VALUES (19,'成员','闵嘉经','男','信息工程学院软件技术专业','软件1611','15968848457','嵩阳11#106',1);
INSERT INTO `roster` VALUES (20,'成员','傅浩楠','男','信息工程学院软件技术专业','软件1613','18268855955','嵩阳11#319',1);
INSERT INTO `roster` VALUES (21,'成员','陈宣骁','男','信息工程学院软件技术专业','软件1613','13867790397','嵩阳11#312',1);
INSERT INTO `roster` VALUES (22,'成员','周建伟','男','信息工程学院软件技术专业','软件1611','15079831812','嵩阳11#104',0);
INSERT INTO `roster` VALUES (23,'成员','张瑞寅','男','信息工程学院软件技术专业','软件1611','13357144201','嵩阳11#105',0);
INSERT INTO `roster` VALUES (24,'成员','陈光瑜','男','信息工程学院软件技术专业','软件1613','15384019827','嵩阳11#312',1);
INSERT INTO `roster` VALUES (25,'成员','张元双','男','信息工程学院软件技术专业','软件1613','13093773370','嵩阳11#317',1);
INSERT INTO `roster` VALUES (26,'成员','熊伟霖','男','信息工程学院软件技术专业','软件1613','18879644546','嵩阳11#410',1);
INSERT INTO `roster` VALUES (27,'成员','邹嘉伟','男','信息工程学院软件技术专业','软件1612','13335719477','嵩阳11#303',0);
INSERT INTO `roster` VALUES (28,'成员','周旭栋','男','信息工程学院软件技术专业','软件1611','18258058587','嵩阳11#104',0);
INSERT INTO `roster` VALUES (29,'成员','蒲宇翔','男','信息工程学院软件技术专业','软件1613','13386537712','嵩阳11#317',0);
INSERT INTO `roster` VALUES (30,'成员','程亮','男','信息工程学院软件技术专业','软件1612','13093773070','嵩阳10#308',1);
INSERT INTO `roster` VALUES (31,'成员','陈锦涛','男','信息工程学院软件技术专业','软件1613','17826828313','嵩阳11#412',0);
INSERT INTO `roster` VALUES (32,'成员','刘盈','男','信息工程学院软件技术专业','软件1611','15968854184','嵩阳06#411',0);
INSERT INTO `roster` VALUES (33,'成员','陈溢涛','男','信息工程学院软件技术专业','软件1612','18158137503','嵩阳11#301',1);
INSERT INTO `roster` VALUES (34,'成员','郑建明','男','信息工程学院软件技术专业','软件技术1612','13336037229','嵩阳11#301',1);
INSERT INTO `roster` VALUES (35,'成员','金磊磊','男','信息工程学院软件技术专业','软件1613','15306819956','嵩阳11#417',1);
INSERT INTO `roster` VALUES (36,'成员','马锦超','男','信息工程学院软件技术专业','软件1611','159-6884-8149','11#106',1);
INSERT INTO `roster` VALUES (37,'成员','吴克翻','男','信息工程学院软件技术专业','软件1611','13336038931','嵩阳11#110',0);
/*!40000 ALTER TABLE `roster` ENABLE KEYS */;
UNLOCK TABLES;

#
# Table structure for table visitors
#

CREATE TABLE `visitors` (
  `visid` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增编号，主键',
  `visnum` int(100) NOT NULL COMMENT '访客数',
  PRIMARY KEY (`visid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='访客表';
INSERT INTO `visitors` VALUES (1,2815);
/*!40000 ALTER TABLE `visitors` ENABLE KEYS */;
UNLOCK TABLES;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
