/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.5.53 : Database - db_ggyin
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_ggyin` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `db_ggyin`;

/*Table structure for table `gy_account_log` */

DROP TABLE IF EXISTS `gy_account_log`;

CREATE TABLE `gy_account_log` (
  `log_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '日志id',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `user_money` decimal(10,2) DEFAULT '0.00' COMMENT '用户金额',
  `frozen_money` decimal(10,2) DEFAULT '0.00' COMMENT '冻结金额',
  `pay_points` mediumint(9) NOT NULL DEFAULT '0' COMMENT '支付积分',
  `change_time` int(10) unsigned NOT NULL COMMENT '变动时间',
  `desc` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `order_sn` varchar(50) DEFAULT NULL COMMENT '订单编号',
  `order_id` int(10) DEFAULT NULL COMMENT '订单id',
  PRIMARY KEY (`log_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

/*Data for the table `gy_account_log` */

insert  into `gy_account_log`(`log_id`,`user_id`,`user_money`,`frozen_money`,`pay_points`,`change_time`,`desc`,`order_sn`,`order_id`) values (1,1,'0.00','0.00',100,1534428640,'会员注册赠送积分','',0),(2,2,'0.00','0.00',100,1536222453,'会员注册赠送积分','',0),(3,1,'0.00','0.00',5,1536908119,'每日登陆赠送积分','',0),(4,1,'0.00','0.00',5,1536909115,'每日登陆赠送积分','',0),(5,1,'0.00','0.00',5,1536909202,'每日登陆赠送积分','',0),(6,1,'0.00','0.00',5,1536909582,'每日登陆赠送积分','',0),(7,1,'0.00','0.00',5,1537018599,'每日登陆赠送积分','',0),(8,1,'0.00','0.00',5,1537054121,'每日登陆赠送积分','',0),(9,1,'0.00','0.00',5,1537188489,'每日登陆赠送积分','',0),(10,1,'0.00','0.00',5,1537616491,'每日登陆赠送积分','',0),(11,1,'0.00','0.00',5,1537763232,'每日登陆赠送积分','',0),(12,1,'0.00','0.00',5,1538139440,'每日登陆赠送积分','',0),(13,1,'0.00','0.00',5,1538176770,'每日登陆赠送积分','',0),(14,1,'0.00','0.00',5,1538898628,'每日登陆赠送积分','',0),(15,1,'0.00','0.00',5,1539348468,'每日登陆赠送积分','',0),(16,1,'0.00','0.00',5,1539470555,'每日登陆赠送积分','',0),(17,1,'0.00','0.00',5,1539741726,'每日登陆赠送积分','',0),(18,1,'0.00','0.00',5,1539827099,'每日登陆赠送瓜豆','',0),(19,1,'0.00','0.00',5,1539914369,'每日登陆赠送瓜豆','',0),(20,1,'0.00','0.00',5,1540036048,'每日登陆赠送瓜豆','',0),(21,1,'0.00','0.00',5,1540259297,'每日登陆赠送瓜豆','',0),(22,2,'0.00','0.00',5,1541262836,'每日登陆赠送瓜豆','',0),(23,2,'0.00','0.00',5,1542162990,'每日登陆赠送瓜豆','',0),(24,1,'0.00','0.00',5,1542165416,'每日登陆赠送瓜豆','',0),(25,1,'0.00','0.00',5,1542594274,'每日登陆赠送瓜豆','',0),(26,1,'0.00','0.00',5,1542696510,'每日登陆赠送瓜豆','',0),(27,3,'0.00','0.00',20,1543058577,'会员注册赠送瓜豆','',0),(28,1,'0.00','0.00',5,1543212275,'每日登陆赠送瓜豆','',0),(29,1,'0.00','0.00',5,1547465035,'每日登陆赠送瓜豆','',0),(30,1,'0.00','0.00',5,1549794493,'每日登陆赠送瓜豆','',0),(31,1,'0.00','0.00',5,1549970594,'每日登陆赠送瓜豆','',0),(32,1,'0.00','0.00',5,1550051206,'每日登陆赠送瓜豆','',0);

/*Table structure for table `gy_ad` */

DROP TABLE IF EXISTS `gy_ad`;

CREATE TABLE `gy_ad` (
  `ad_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '广告id',
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '广告位置ID',
  `media_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '广告类型',
  `ad_name` varchar(60) NOT NULL DEFAULT '' COMMENT '广告名称',
  `ad_link` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `ad_code` text NOT NULL COMMENT '图片地址',
  `start_time` int(11) NOT NULL DEFAULT '0' COMMENT '投放时间',
  `end_time` int(11) NOT NULL DEFAULT '0' COMMENT '结束时间',
  `link_man` varchar(60) NOT NULL DEFAULT '' COMMENT '添加人',
  `link_email` varchar(60) NOT NULL DEFAULT '' COMMENT '添加人邮箱',
  `link_phone` varchar(60) NOT NULL DEFAULT '' COMMENT '添加人联系电话',
  `click_count` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '点击量',
  `enabled` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `orderby` smallint(6) DEFAULT '50' COMMENT '排序',
  `target` tinyint(1) DEFAULT '0' COMMENT '是否开启浏览器新窗口',
  `bgcolor` varchar(20) DEFAULT NULL COMMENT '背景颜色',
  PRIMARY KEY (`ad_id`),
  KEY `enabled` (`enabled`),
  KEY `position_id` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `gy_ad` */

insert  into `gy_ad`(`ad_id`,`pid`,`media_type`,`ad_name`,`ad_link`,`ad_code`,`start_time`,`end_time`,`link_man`,`link_email`,`link_phone`,`click_count`,`enabled`,`orderby`,`target`,`bgcolor`) values (1,2,0,'自定义广告名称','','/public/upload/ad/2018/10-29/723f11cfcdc971936b85289fec9be4c8.png',1451577600,1580486400,'','','',0,1,0,0,'#c0c0c0'),(2,2,0,'自定义广告名称','','/public/upload/ad/2018/10-29/7f5ff77f9dc8bff3c3760afdb9bbe767.png',1451577600,1577808000,'','','',0,1,0,0,'#c0c0c0'),(3,10,0,'自定义广告名称','/yinshua/13.html','/public/upload/ad/2018/11-08/f90fe11ee691864395a7bf6c080fd2b7.jpg',1451577600,1577808000,'','','',0,1,0,0,'#ffffff'),(4,20,0,'自定义广告名称','','/public/upload/ad/2018/11-08/2acc5b6d2e05485916e7157a42aa5a37.jpg',1451577600,1580486400,'','','',0,1,0,0,'#000000'),(5,402,0,'自定义广告名称','','/public/upload/ad/2018/04-24/b0ffa5a48fc4c0b6922fe1349ff705cf.jpg',1451577600,1577808000,'','','',0,1,0,0,'#000000'),(6,403,0,'自定义广告名称','','/public/upload/ad/2018/10-29/bf8bfb5da4570d22c250092ba9c3cb14.png',1451577600,1577808000,'','','',0,1,0,0,'#000000'),(7,404,0,'自定义广告名称','','/public/upload/ad/2018/04-16/c93d2daf5d6e22be29fb385ea797291b.jpg',1451577600,1577808000,'','','',0,1,0,0,'#000000'),(8,405,0,'自定义广告名称','','/public/upload/ad/2018/04-24/a7a54a5b527f0b1b069b8421378ad0fa.jpg',1451577600,1577808000,'','','',0,1,0,0,'#000000'),(9,2,0,'自定义广告名称','','/public/upload/ad/2018/10-29/9e6a69d1516de53d7f6acd0adfdabee6.png',1451577600,1546272000,'','','',0,1,0,0,'#000000'),(10,2,0,'自定义广告名称','','/public/upload/ad/2018/10-29/1c504dbe6186cae6c49c27f8fe076a2d.png',1451577600,1546272000,'','','',0,1,0,0,'#000000'),(11,2,0,'自定义广告名称','','/public/upload/ad/2018/10-29/d6cf01a70935c0e03c752bdea5bc343a.png',1451577600,1546272000,'','','',0,1,0,0,'#000000'),(12,403,0,'自定义广告名称','','/public/upload/ad/2018/10-29/3f294d1a5635848622bec7d84bf4608c.png',1451577600,1546272000,'','','',0,1,0,0,'#ffffff');

/*Table structure for table `gy_ad_position` */

DROP TABLE IF EXISTS `gy_ad_position`;

CREATE TABLE `gy_ad_position` (
  `position_id` int(3) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `position_name` varchar(60) NOT NULL DEFAULT '' COMMENT '广告位置名称',
  `ad_width` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '广告位宽度',
  `ad_height` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '广告位高度',
  `position_desc` varchar(255) NOT NULL DEFAULT '' COMMENT '广告描述',
  `position_style` text COMMENT '模板',
  `is_open` tinyint(1) DEFAULT '0' COMMENT '0关闭1开启',
  PRIMARY KEY (`position_id`)
) ENGINE=InnoDB AUTO_INCREMENT=406 DEFAULT CHARSET=utf8;

/*Data for the table `gy_ad_position` */

insert  into `gy_ad_position`(`position_id`,`position_name`,`ad_width`,`ad_height`,`position_desc`,`position_style`,`is_open`) values (1,'Cart页面自动增加广告位 1 ',0,0,'Cart页面',NULL,1),(2,'Index页面轮播图广告位 2 ',0,0,'Index页面',NULL,1),(9,'Index页面自动增加广告位 9 ',0,0,'Index页面',NULL,1),(10,'Index页面一楼第一个广告位 10 ',0,0,'Index页面',NULL,1),(11,'包装专区首页index二楼第一个',0,0,'包装index页面',NULL,1),(12,'包装专区首页index二楼第二个',0,0,'包装Index页面',NULL,1),(13,'Index页面自动增加广告位 13 ',0,0,'Index页面',NULL,1),(14,'Goods页面自动增加广告位 14 ',0,0,'Goods页面',NULL,1),(15,'Index页面二楼第一个广告位 15 ',0,0,'Index页面',NULL,1),(16,'Index页面二楼第二个广告位 16 ',0,0,'Index页面',NULL,1),(17,'Index页面自动增加广告位 17 ',0,0,'Index页面',NULL,1),(20,'Index页面一楼第二个广告位 20 ',0,0,'Index页面',NULL,1),(51,'Goods页面自动增加广告位 51 ',0,0,'Goods页面',NULL,1),(402,'积分商城首页',1224,200,'integralMall页面',NULL,1),(403,'包装专区首页index',0,0,'包装专区首页index 轮播图',NULL,1),(404,'包装专区首页index一楼第一个404',0,0,'包装专区首页index404',NULL,1),(405,'包装专区首页index一楼第二个405',0,0,'包装专区首页index405',NULL,1);

/*Table structure for table `gy_admin` */

DROP TABLE IF EXISTS `gy_admin`;

CREATE TABLE `gy_admin` (
  `admin_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `user_name` varchar(60) NOT NULL DEFAULT '' COMMENT '用户名',
  `email` varchar(60) NOT NULL DEFAULT '' COMMENT 'email',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `ec_salt` varchar(10) DEFAULT NULL COMMENT '秘钥',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `last_login` int(11) NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_ip` varchar(15) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `nav_list` text COMMENT '权限',
  `lang_type` varchar(50) NOT NULL DEFAULT '' COMMENT 'lang_type',
  `agency_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'agency_id',
  `suppliers_id` smallint(5) unsigned DEFAULT '0' COMMENT 'suppliers_id',
  `todolist` longtext COMMENT 'todolist',
  `role_id` smallint(5) DEFAULT '0' COMMENT '角色id',
  `province_id` int(8) unsigned DEFAULT '0' COMMENT '加盟商省级id',
  `city_id` int(8) unsigned DEFAULT '0' COMMENT '加盟商市级id',
  `district_id` int(8) unsigned DEFAULT '0' COMMENT '加盟商区级id',
  PRIMARY KEY (`admin_id`),
  KEY `user_name` (`user_name`) USING BTREE,
  KEY `agency_id` (`agency_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `gy_admin` */

insert  into `gy_admin`(`admin_id`,`user_name`,`email`,`password`,`ec_salt`,`add_time`,`last_login`,`last_ip`,`nav_list`,`lang_type`,`agency_id`,`suppliers_id`,`todolist`,`role_id`,`province_id`,`city_id`,`district_id`) values (1,'admin','admin@admin.com','257df54997de95b3369f34e50eba778b',NULL,1533780809,1550027432,'127.0.0.1','','',0,0,NULL,1,0,0,0),(2,'test','test@163.com','257df54997de95b3369f34e50eba778b','',1245044099,1523860733,'183.11.70.112','商品列表|goods.php?act=list,订单列表|order.php?act=list,用户评论|comment_manage.php?act=list,会员列表|users.php?act=list,商店设置|shop_config.php?act=list_edit','',0,0,'',1,0,0,0);

/*Table structure for table `gy_admin_log` */

DROP TABLE IF EXISTS `gy_admin_log`;

CREATE TABLE `gy_admin_log` (
  `log_id` bigint(16) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `admin_id` int(10) DEFAULT NULL COMMENT '管理员id',
  `log_info` varchar(255) DEFAULT NULL COMMENT '日志描述',
  `log_ip` varchar(30) DEFAULT NULL COMMENT 'ip地址',
  `log_url` varchar(50) DEFAULT NULL COMMENT 'url',
  `log_time` int(10) DEFAULT NULL COMMENT '日志时间',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8;

/*Data for the table `gy_admin_log` */

insert  into `gy_admin_log`(`log_id`,`admin_id`,`log_info`,`log_ip`,`log_url`,`log_time`) values (51,1,'发放1张中秋国庆大优惠','127.0.0.1','/index.php/admin/Coupon/send_coupon/cid/1',1537085467),(78,1,'后台登录','127.0.0.1','/index.php',1539852784),(79,1,'后台登录','127.0.0.1','/index.php',1539936399),(80,1,'后台登录','127.0.0.1','/index.php',1540036650),(81,1,'后台登录','127.0.0.1','/index.php',1540262533),(82,1,'后台登录','112.80.35.2','/index.php',1540279587),(83,1,'后台登录','180.109.183.253','/index.php',1540782161),(84,1,'后台登录','49.90.176.6','/index.php',1540799461),(85,1,'后台登录','112.80.35.2','/index.php',1541121404),(86,1,'后台登录','112.80.35.2','/index.php',1541122345),(87,1,'后台登录','112.80.35.2','/index.php',1541408673),(88,1,'后台登录','49.77.71.203','/index.php',1541563382),(89,1,'后台登录','112.80.35.2','/index.php',1541578231),(90,1,'后台登录','112.80.35.2','/index.php',1541726667),(91,1,'后台登录','112.80.35.2','/index.php',1542073554),(92,1,'后台登录','112.80.35.2','/index.php',1542163943),(93,1,'后台登录','112.80.35.2','/index.php',1542266934),(94,1,'后台登录','112.80.35.2','/index.php',1542333891),(95,1,'后台登录','112.80.35.2','/index.php',1542335226),(96,1,'后台登录','112.80.35.2','/index.php',1542594086),(97,1,'后台登录','112.80.35.2','/index.php',1542697693),(98,1,'后台登录','112.80.35.2','/index.php',1542764831),(99,1,'后台登录','112.80.35.2','/index.php',1542768424),(100,1,'后台登录','180.111.220.54','/index.php',1542793329),(101,1,'后台登录','49.90.159.50','/index.php',1543056231),(102,1,'后台登录','49.90.159.50','/index.php',1543061143),(103,1,'后台登录','49.95.43.166','/index.php',1543109343),(104,1,'后台登录','49.95.43.166','/index.php',1543146342),(105,1,'后台登录','127.0.0.1','/index.php',1547877125),(106,1,'后台登录','127.0.0.1','/index.php',1549268382),(107,1,'后台登录','127.0.0.1','/index.php',1549803111),(108,1,'后台登录','127.0.0.1','/index.php',1550027432);

/*Table structure for table `gy_admin_role` */

DROP TABLE IF EXISTS `gy_admin_role`;

CREATE TABLE `gy_admin_role` (
  `role_id` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) DEFAULT NULL COMMENT '角色名称',
  `act_list` text COMMENT '权限列表',
  `role_desc` varchar(255) DEFAULT NULL COMMENT '角色描述',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `gy_admin_role` */

insert  into `gy_admin_role`(`role_id`,`role_name`,`act_list`,`role_desc`) values (1,'超级管理员','all','管理全站'),(2,'编辑','4,22,23,48,52,31,45,49,61,62,14,18,19,20,21,50,24,25,26,41,53,27,28,29,30,32,33,34,35,46,47','违法接口'),(4,'客服','5,7,49,61,27,28,29,30,32','客服处理订单发货'),(6,'仓管员','11,12,13,14','仓管员'),(9,'运营专员','4,22,23,48,52,7,31,45,49,61,15,16,17,18,19,20,21,50,24,25,26,41,51,53','负责维护商品活动推广'),(10,'加盟商','27,28,29,30,33,34,35','加盟商查看管理订单'),(11,'文章管理','15,16,17,18,19,20,21,50,118,119,63','文章管理'),(17,'运营','27,28,29,30,32,33,34,35,121,123,63,64,68,69,78,81,82,83,84,86,96,97,98,99,106','负责用户订单');

/*Table structure for table `gy_area_region` */

DROP TABLE IF EXISTS `gy_area_region`;

CREATE TABLE `gy_area_region` (
  `shipping_area_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '物流配置id',
  `region_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '地区id对应region表id',
  PRIMARY KEY (`shipping_area_id`,`region_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `gy_area_region` */

/*Table structure for table `gy_article` */

DROP TABLE IF EXISTS `gy_article`;

CREATE TABLE `gy_article` (
  `article_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `cat_id` smallint(5) NOT NULL DEFAULT '0' COMMENT '类别ID',
  `title` varchar(150) NOT NULL DEFAULT '' COMMENT '文章标题',
  `content` longtext NOT NULL,
  `author` varchar(30) NOT NULL DEFAULT '' COMMENT '文章作者',
  `author_email` varchar(60) NOT NULL DEFAULT '' COMMENT '作者邮箱',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `article_type` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `is_open` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  `file_url` varchar(255) NOT NULL DEFAULT '' COMMENT '附件地址',
  `open_type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `link` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `description` mediumtext COMMENT '文章摘要',
  `click` int(11) DEFAULT '0' COMMENT '浏览量',
  `publish_time` int(11) DEFAULT NULL COMMENT '文章预告发布时间',
  `thumb` varchar(255) DEFAULT '' COMMENT '文章缩略图',
  PRIMARY KEY (`article_id`),
  KEY `cat_id` (`cat_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8;

/*Data for the table `gy_article` */

insert  into `gy_article`(`article_id`,`cat_id`,`title`,`content`,`author`,`author_email`,`keywords`,`article_type`,`is_open`,`add_time`,`file_url`,`open_type`,`link`,`description`,`click`,`publish_time`,`thumb`) values (1,2,'产品宣传册设计印刷如何做','&lt;p&gt;\r\n	我一直对商务印刷市场感兴趣。看来，当你确定一个成功的企业，不仅是纸张价格甚至建筑设计和营销物料的尖叫声质量。我包括在这一类别中的全部产品宣传册设计市场，可能是因为他们的地方，我在那里吃。他们对我是真实的，不只是数字在电脑屏幕上。&lt;/p&gt;&lt;p&gt;\r\n	下面谈谈产品宣传册设计如何做？当我们考虑做&lt;a class=&quot;ke-insertfile&quot; href=&quot;/yinshua/178.html&quot; target=&quot;_blank&quot;&gt;画册印刷&lt;/a&gt;时，我总是以环境设计（色彩、照明、标牌），包装设计，和印刷品。我总是能学到一些东西，因为公司清楚地理解品牌。&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;在这种情况下我和我的未婚妻立刻被吸引到一个美容产品的小册子。这里有一些事情我想整个食品营销有绝对正确。&lt;/span&gt; &lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;四页，8.5×11的小册子被印上明亮的白色涂层股票。我的未婚妻认为纸涂层，而事实上它是很光滑的，但在一个放大镜，我只看到一个光泽，墨水被放下。&lt;/span&gt; &lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;整个食品的职位本身的健康意识和环保意识。商业印刷本文选择作品对读者的魔法。一个明亮的白色片反映了很多光照亮的颜色。同时，一纸两软化颜色印刷在其表面，也给出了一个更平易近人的“感觉”的设计作品。这也意味着更低的成本（这是否是真实的）和环境的敏感性。感觉更少的企业。所有这一切都支持整个食品的使命。&lt;/span&gt; &lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;对于外部产品宣传册设计，绿色和棕色，以及阳光的黄色，继续这个环境的感觉。在四页的小册子，你看到一个女人的头后面的盖子。她有长长的卷发，她手里拿着一个泡芙球，大概是准备把它的种子穿过草地，所以新的蒲公英会盛开。在左上角，她的头后面，太阳照亮的不只是天空，而且在背景中的树木和她丰富的卷发。&lt;/span&gt; &lt;/p&gt;','','','',2,1,4294967295,'',0,'','',0,2147443200,''),(2,2,'如何设计和制作公司宣传册','&lt;p&gt;\r\n	很多非印刷行业的用户不清楚如何设计和制作&lt;a href=&quot;/yinshua/178.html&quot; target=&quot;_blank&quot;&gt;公司宣传册&lt;/a&gt;？其实，如果你折叠内页比较明亮的白色的商业印刷纸印刷的阳光，你将看到这只更聪明，因为它似乎与周围的网页元素。&lt;/p&gt;&lt;p&gt;\r\n	那是，没有什么能比纸的白亮的新闻片；然而，一个精明的设计师可以使读者看到一个眩目的太阳热，在这本小册子的封面。事实上，如果你看看小型在右上角就知道如何设计和制作公司宣传册，以及更小的整个食品标志逆转到纯白色你会看到太阳在天空中，强调女人的卷发其实是暗比式和只有一个精心设计的幻想的眩目的光。&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;在四页宣传册，标题似乎手绘。这是一个平易近人的设计时，散落在各地的两页的传播产品配对，出血掉页。大多数的颜色是土色，增强颜色的封面上，虽然有明亮的绿色，橙色，红色，黄色等。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;设计师在一个简单的将所有正文、无衬线字体，在连续列分组向传播中心。产品奠定随便往外边缘，点缀着迷迭香的叶子，植物的花，以增加对比度和继续的一块自然色调。&lt;/span&gt; &lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;背面继续休闲的设计和配色方案，添加优惠券的组合。那是，整个&lt;a href=&quot;/www.guaguayin.cn&quot; target=&quot;_blank&quot;&gt;呱呱印&lt;/a&gt;使用的的纸张产品是环保、优质的，通过颜色、字体设计师的选择和设计网格，然后进行初始购买方便和实惠的折扣，更加清楚如何设计和制作公司宣传册？&lt;/span&gt; &lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;把这个小宣传画册子上有一件事是它的效用。在四个板培养读者以及销售产品。一篇文章提供了指针如何你的头发颜色，而另一个人给你一个保湿护发配方，包括每种成分的剪影照片。&lt;/span&gt; &lt;/p&gt;','','','',2,1,4294967295,'',0,'','',0,2147443200,''),(3,2,'宣传册设计印刷公司的专业性','&lt;p&gt;\r\n	呱呱印是定制印刷供应商的挑战，我们最近提到一个长期存在的&lt;a href target=&quot;_blank&quot;&gt;商业印刷&lt;/a&gt;客户（设计师）曾来我想产生对销售单封底内侧口袋里的小册子。我们讨论这个电话，因为她刚刚遇到她的客户今天。&lt;/p&gt;&lt;p&gt;\r\n	有趣的是，我的客户希望这本小册子是长方形（景观而不是纵向）因为许多其它担保她设计的这家公司已经在这个格式制作。这是什么意思是一个24“x 9”平面&lt;a href=&quot;/yinshua/178.html&quot; target=&quot;_blank&quot;&gt;宣传册&lt;/a&gt;（12“x 9”折）与一个水平或垂直的封底内页袋，和四或八内页。&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;刚开始我向我的客户一个口袋文件夹制造商的网站，在那里她有了页面的网页后口袋夹盒子的刀模图（图纸显示的尺寸、褶皱、口袋大小/位置但没有设计：无型、无图像）。我的客户发现这个有用的收集她的想法，我能看看她提供并立刻明白她想要什么画。这是我们交流的格式的一种理想方式。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;&lt;strong&gt;宣传册设计印刷公司如何面对挑战？&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;我的客户在一个垂直的口袋的想法。她想知道我在想什么。我说，我喜欢这个主意，因为它比水平口袋更独特。然而，样品达林她告诉我有一个4平口袋，和一个同样大小的垂直口袋也许不包含8.5x 11。我担心的是，刀片就会失败，特别是我的客户的客户（最终用户）自计划使用他们的激光复印机粉产生的插入，在这一点上我的客户和我开始讨论工作纸的厚度。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;你可以看到，我们的第一关注无关的口袋文件夹的图形设计宣传册。而我们临近的工作作为一个体育项目是在手上，保持打开，并关闭。我们看大小，纸张厚度，口袋的尺寸，都在试图想象一个成品。平面设计以后会回来的。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;我的客户说，她只想约四到八页的小册子，骑马装订，版式也是宣传册设计印刷公司常用的。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;与她共享到目前为止的信息，我问我的客户是否会考虑为内页厚的纸张。我想让这本宣传画册子看上去并不吝啬。四到八页是一个简短的小册子。较厚的页面会使小册子看起来华丽。&lt;/span&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;或者，作为另一种选择，她可能会考虑，我建议小册子自盖片。也许封面封底加上下台内页可能是120或130。我的客户说她会考虑的。&lt;/span&gt;&lt;/p&gt;','','','',2,1,4294967295,'',0,'','',0,2147443200,''),(4,2,'宣传册制作要多少钱','&lt;p&gt;\r\n	如果你懂得印刷这样的事情（短期，高调片），那么你对&lt;a href=&quot;/yinshua/178.html&quot; target=&quot;_blank&quot;&gt;宣传册&lt;/a&gt;制作要多少钱一定不陌生，这涉及到人工、纸张、开机费、纸张损耗等诸多复杂的宣传册生产制作工艺。&lt;/p&gt;&lt;p&gt;\r\n	很早就开始，并涉及到你的商业印刷厂商从一开始。做大量的研究。如果你有一个短期，认为数字印刷定制。数字整理（激光切割等）现在是可用的。&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;审查样本（在线口袋文件夹maufacturers检查盒子的刀模图）。也请你的商业印刷供应商印刷纸的假人，以及印刷样品，所以你可以看到和感受到什么工作要完成。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;宣传册制作要多少钱和你的期望付出很多相关。选择你的自定义打印供应商基于他的印刷样品的质量，他的工作参考，任何工作的历史你可能与印刷公司，和你的信任级别的供应商不是单纯的价格。在这样的情况下，你会得到你所支付的。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;如任何宣传册印刷产品将得到大量使用，这将是审慎的外套的外盖以某种方式。选项包括紫外光固化涂料，水性，层压板，并按清漆。不幸的是，最后的选择，虽然便宜，可泛黄甚至改&lt;a href=&quot;/yinshua/1.html&quot; target=&quot;_blank&quot;&gt;宣传单页印刷&lt;/a&gt;底层油墨的颜色。因此，这将是重要的知道多久口袋文件夹手册将被使用。&lt;/span&gt;&lt;/p&gt;','','','',2,1,4294967295,'',0,'','',0,2147443200,''),(5,2,'宣传册彩印知多少','&lt;p&gt;\r\n	很多印刷包装行业的设计师朋友对宣传册制作用什么软件很清楚，但对&lt;strong&gt;宣传册彩印&lt;/strong&gt;技术、工艺、流程不甚了解。商业印刷我的客户是设计一个跨之间的一个小册子和一个口袋文件夹展示她的客户的业务。我的客户，谁是设计师，是我的一块市场，将一个小册子建议，或短的小册子，在前面，但会有一个口袋在室内的后盖，用户可以插入多个8.5“x 11”的营销材料的单板。&lt;/p&gt;&lt;p&gt;\r\n	宣传册彩印的折叠尺寸，我向我的客户考虑构建的口袋里的小册子，小册子/脊柱，或两者。的小册子，构建实质上是脊柱。这将允许一个建立在口袋里，基本上是一个额外的一块印刷股票，将口袋打开（像一个节点），允许插入多个销售单。我见过的1／4更大的基础上的口袋，但他们比口袋没有建立更脆弱，所以如果我的客户的客户只需要在后面的小册子里插入一些打印的纸张，我鼓励她放弃建造。但这是她必须以某种方式解决。&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;曾经的口袋夹小册子的尺寸已确定，这将是审慎的考虑后盖口袋形状。口袋可以是水平的，允许将要落在上面，也可以是垂直的，允许用户在滑销售单从侧面。在任何情况下，设计师可以利用口袋的能力“隐藏”的第一插入部分。事实上，设计师甚至可以持续到卖布口袋打印图像。&lt;/span&gt; &lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;比如这个&lt;a href=&quot;/yinshua/152.html&quot; target=&quot;_blank&quot;&gt;手提袋印刷&lt;/a&gt;的材料，对于这样的工作，我建议我的客户选择一种厚度达130，覆盖宣传册彩印。这会产生大量的印刷品。它不会感到脆弱。它也接受过很多的开启和关闭时间，没有宣传册当磨损或破烂的。&lt;/span&gt; &lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;无论她选择股票单面涂布或两将取决于油墨覆盖率。如果在这本&lt;a href=&quot;/yinshua/1.html&quot; target=&quot;_blank&quot;&gt;宣传单页&lt;/a&gt;的外部覆盖油墨印刷品（加上内部的口袋里，这是对新闻片的同一侧的外盖），然后一个C1s单面涂布。如果她想在纸张双面打印，然后C2S表将是可取的。对于销售表自己，我可能会建议也许是迟钝或光泽商业印刷的股票，根据宣传册彩印客户的喜好。&lt;/span&gt; &lt;/p&gt;','','','',2,1,4294967295,'',0,'','',0,2147443200,''),(6,2,'画册印刷厂哪家好','&lt;p&gt;\r\n	今天我们来聊聊&lt;strong&gt;画册印刷厂哪家好&lt;/strong&gt;？以及画册印刷厂的选择时要注意的事项，即使在知名大规模&lt;a href=&quot;/&quot; target=&quot;_blank&quot;&gt;画册印刷厂&lt;/a&gt;也不一定适合您，需要谨慎行事，我的客户从自定义打印厂商请求一纸假。这将是印刷文件夹宣传册的设计方法的，但它提供了一个好主意如何口袋文件夹的小册子将在手的感觉，折页也是它将如何耐用，如何卖单将放入后盖的口袋。&lt;/p&gt;&lt;p&gt;\r\n	除了&lt;a href=&quot;/zixun/107.html&quot; target=&quot;_blank&quot;&gt;宣传册彩印&lt;/a&gt;，我建议我的客户看口袋夹在线一些厂商专门口袋文件夹印刷将包括一系列的在他们的网页设计方案，文件夹宣传册的设计体现出不同的尺寸，不同的配置和位置的口袋，甚至不同形状的口袋（水平、垂直、扇形，粘在边缘，并没有建立）。这就像一个在线”理念的文件。“有这方面的信息，我的客户可能会要求印刷样品的审查选择物理结构和平面设计。&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;口袋等这些必须切断与金属模具。这增加了整体的口袋夹小册子的成本。但是在某些情况下，根据设计的不同，有些打印机可能手上有标准的模具，已用于其他产品如文件夹宣传册的设计方法。如果我的客户想要一个更独特的方法，她将需要支付已为她定制模具设计。她还需要更多的时间投入到计划的模具制造工作的组成部分，以便清楚画册印刷厂哪家好。&lt;/span&gt; &lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;对于口袋文件夹手册物理因素。小册子的整体规模，我鼓励我的客户去考虑一个9“x 12”的文件夹，如果插入口袋，走在后面的小册子口袋将8.5“x 11”。这将允许插入和删除销售单舒适的房间。&lt;/span&gt; &lt;/p&gt;','','','',2,1,4294967295,'',0,'','',0,2147443200,''),(7,2,'海报印刷材质有哪些','&lt;p&gt;\r\n	看看纸质样本书以及海报印刷材质有哪些？我们高质量的海报样品集合给你我们的印刷基板和分页装订选项的精彩概述。作出的决定更容易为自己，找到合适的&lt;strong&gt;海报印刷材质&lt;/strong&gt;，为您的&lt;a href=&quot;/yinshua/1.html&quot; target=&quot;_blank&quot;&gt;宣传单页印刷&lt;/a&gt;产品。看看自己的印刷质量和得到印象不同衬底上的影响。我们中立地打印 （没有我们公司的标志） 的样本集合进来方便的格式和最适合于客户来电-自己目前专业你可以触摸的样品。&lt;/p&gt;&lt;p&gt;\r\n	在 A5 大小的样本书是螺旋装订的容易阅读。所有材料样品是中性的我们的标志是只有在可拆卸的封面页上可见。在&amp;quot;详细信息&amp;quot;选项卡上，您可以了解更多关于书中所载的材料，以及海报印刷材质有哪些？&lt;/p&gt;&lt;p&gt;&lt;a href target=&quot;_blank&quot;&gt;呱呱印&lt;/a&gt;新的高质量的样本框包含各种纸类型和完成我们当前纸张样本书，我们材料样品中的原始样品从我们大幅面印刷的产品范围 （横幅、 旗帜、 照片打印） 新书和其他广告系统的物料样品如&lt;a href=&quot;/yinshua/152.html&quot; target=&quot;_blank&quot;&gt;手提袋印刷厂&lt;/a&gt;标志，波纹塑料板和更多。此外，它包括打印目录与我们产品类别的说明。&lt;/p&gt;&lt;p&gt;\r\n	示例框中概述了你我们广泛的产品范围，促进材料的选择和完成通过视觉和触觉的海报印刷样本。所以你可以看到自己如何文本和图像将显示在各自的面，让您选择最适合你的材料。&lt;/p&gt;&lt;p&gt;\r\n	由于它中性的设计海报印刷示例框是一个优秀的工具，以在具体和全面的方式告知您的客户。因为有一些事情你只需要看看自己。此外，高品质的海报印刷材质足以说服以其高质量的做工和易用性的方便的格式处理。&lt;/p&gt;&lt;p&gt;&lt;br/&gt; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;/p&gt;','','','',2,1,4294967295,'',0,'','',0,2147443200,''),(8,2,'海报印刷用什么纸','&lt;p&gt;\r\n	海报是一个强大的方式来传达您的信息向公众。在&lt;a href=&quot;/&quot; target=&quot;_blank&quot;&gt;海报印刷厂&lt;/a&gt;时，我们意识到海报印刷用什么纸很重要这一点，这就是为什么我们很自豪能够成为能够提供最高质量海报。我们的粒子群优化算法认证保证无与伦比的色彩保真度。你选择颜色，我们会打印它。许诺。结果你设想它的方法会帮助你的活力和持久的海报传递您的信息。我们提供种类繁多的海报，包括 XXL 大小和荧光的海报。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	XXL 海报导致 XXL 成功。如果你想要达到更广泛的受众和创建的视觉冲击，我们的XXL 海报是最好的选择。如果你正在寻找你的竞争对手有一个额外的优势，我们可以打印你的海报使用 UV 涂层技术。您的广告将会苏醒过来，并将更亮泽，更耐用。他们需要尽快解决呢？11 上午按顺序和你的海报将打印在同一天 ！&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;有时你只被需要你的竞争对手中脱颖而出就在于你的海报印刷用什么纸。你的海报与荧光色注入一些额外的生命。我们的霓虹灯的海报很难错过和借给特殊的触摸到你的广告。你放心好了你再也不会去注意。或者，如果你正在寻找的耐久性，我们可以在波纹塑料窗格上打印你的海报。他们不只坚固和耐气候性但他们也是可循环使用，因此，对环境友好。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;一旦你已经上传您的打印数据，你的海报将进入生产。我们会包装你的海报印刷纸张，避免运输损坏和必将他们交给你免费的标准的航运的门。易为一体，两个，打印 ！&lt;/span&gt;&lt;/p&gt;','','','',2,1,4294967295,'',0,'','',0,2147443200,''),(9,2,'海报印刷尺寸大罗列','&lt;p&gt;\r\n	海报印刷尺寸一般有如下几种，A2海报完美的打印，在大幅面。&lt;a href=&quot;/yinshua/96.html&quot; target=&quot;_blank&quot;&gt;A1海报印刷。&lt;/a&gt;适合户外使用。UV 完成海报高光，完全保护。离开了专业的印象，即使有少量印刷无需投入很多。我们灵活的解决方案在数字印刷中使用为您的成功 ！挑出几篇论文。有光泽或定期纸，我们有一些适合每个人。&lt;/p&gt;&lt;p&gt;\r\n	再说说其他大幅面印刷，它不一定要&lt;a href=&quot;/zixun/109.html&quot; target=&quot;_blank&quot;&gt;海报印刷材质&lt;/a&gt;！发现各种材料和申请大幅面海报印刷。优质铝型材织物海报是完美的营业场所和销售领域。帆布担架帧是受欢迎的室内设计和装饰元素，或做出一份特殊的礼物，当下令作为单一副本。户外广告事件，当事方和其他场合成为一阵微风与波纹塑料板-粘贴海报昨天 ！使用我们的产品组合来实现广告效果最大化。&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;波纹塑料板，户外使用的理想选择。你的海报广告由于抗冲击和耐撕裂材料会更长。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;担架框架，印在画布上无框架或边框。可用在许多大小为高的要求。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;织物海报，理想作为装饰或演示文稿的工具，用于室内;重型、阻燃材料。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;我们的海报纸样品印刷书为您提供了各种纸张类型和从我们在我们的商店提供的广泛的后整理技术的概述。海报印刷尺寸作为视觉和触觉评估印前，它可以帮助作出选择的决定。&lt;/span&gt;&lt;/p&gt;','','','',2,1,4294967295,'',0,'','',0,2147443200,''),(10,2,'名片印刷多少钱一盒','&lt;p&gt;\r\n	最近我有个邢台的朋友问邢台哪里定做名片便宜？其实，之前也有不少人咨询&lt;strong&gt;名片印刷多少钱一盒&lt;/strong&gt;？这主要要看名片的印刷纸张材质和印刷成品尺寸。一般名片的成品大小90mm*54mm，纸张材质类型一般分为：布纹纸、荷兰白纸、刚古纸。&lt;/p&gt;&lt;p&gt;\r\n	名片设计简单在线，我们新的在线设计程序没有问题！创建名片是很容易的使用我们的免费在线设计模板。像往常一样配置您的产品并选择&amp;quot;创建在线现在&amp;quot;在订购过程的结束。&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;名片时社交拓展人脉的必要条件。双面打印，塑料名片，经久耐用，耐磨；专属名片，这些名片让你难忘，彰显高端大气。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;名片，它是重要的第一印象 ！与我们定制的名片，你会留下持久的印象。名片同一天印刷，时间紧吗？然后使用我们同一天打印选项让您今天制作的名片。专属名片，与质量名片专用纸上创建一个持久的印象。塑料名片，塑料卡信用卡格式是理想忠诚卡、名片、袖珍日历。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;即使在今天的在线的网络社会，亲自制作持久的第一印象可以走很长的路，取得新的业务伙伴。名片的高质量可以改变这一切。我们提供广泛的纸张类型，重量和完成，以确保你的名片脱颖而出，达到桩顶！脱颖而出的名片！&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;名片用什么材质显档次，&lt;/span&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;与优雅名片创建一个真正令人难忘的印象︰ 我们提供各种各样的不同的纸张类型从知名厂商，允许您设计从所有其余脱颖而出的名片 ！&lt;/span&gt;&lt;/p&gt;','','','',2,1,4294967295,'',0,'','',0,2147443200,''),(11,2,'塑料名片多少钱一盒','&lt;p&gt;\r\n	上次我们说了&lt;a href=&quot;/zixun/112.html&quot; target=&quot;_blank&quot;&gt;名片印刷多少钱一盒&lt;/a&gt;，今天来谈谈塑料名片多少钱一盒？有人不理解塑料名片是什么？为什么要塑料名片？塑料名片通常是透明pvc磨砂名片，那么平均1张多少钱，每张大概0.7-1.5元。&lt;/p&gt;&lt;p&gt;\r\n	高档塑料名片制作工艺较普通材质名片工艺复杂些，商业名片制作直接厂家制作印刷PVC名片，PVC名片分为透明名片盒不透明PVC名片，不透明名片大多以多彩色为主，透明名片大多以简洁大方为主，这两种都可加特殊工艺：磨砂，哑面，烫金、银、烫镭射金、印，过UV等，根据工艺不同，价格有所差异，标准名片是1000张起做共220元，一盒可装200张、250张名片。PVC名片具有独特的瑰丽色，还有不少广州朋友问广州供应PVC名片多少钱一盒？广州哪里有做PVC名片厂家，而这一切在&lt;a href=&quot;/&quot; target=&quot;_blank&quot;&gt;呱呱印&lt;/a&gt;都可以搞定。&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;塑料名片分为如下几种：&lt;/span&gt; &lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;塑料名片格式是理想忠诚卡、名片、袖珍日历。&lt;/span&gt; &lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;塑料名片还可以有签名域，自定义尺寸的签名域变成定制的忠诚卡和会员卡的塑料卡。&lt;/span&gt; &lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;塑料名片的磁条，磁条名片是装有磁条能够存储数据的塑料卡片。用于识别目的的理想。&lt;/span&gt; &lt;/p&gt;','','','',2,1,4294967295,'',0,'','',0,2147443200,''),(12,2,'做名片去哪里可以做','&lt;p&gt;\r\n	很多人不知道做&lt;strong&gt;名片去哪里可以做&lt;/strong&gt;？尤其是工艺复杂些的塑料名片，&lt;a href=&quot;/zixun/113.html&quot; target=&quot;_blank&quot;&gt;塑料名片&lt;/a&gt;格式是理想忠诚卡、袖珍日历、名片以及员工徽章。选择标准塑料卡、签名域与卡、卡与磁条之间存储信息或合并的版本的要求。由于熟悉驾驶执照格式与圆角，我们的塑料名片将融入任何客户的钱包或钱夹。硬质pvc材料是特别是鲁棒性和耐候性。&lt;/p&gt;&lt;p&gt;\r\n	发挥你的创造力和目前的图片，你和你的业务值得。从折叠到塑料名片，我们有不同的解决方案来帮助您获得超过竞争对手的优势。我们&lt;a href target=&quot;_blank&quot;&gt;呱呱印&lt;/a&gt;的UV涂层卡将帮助您告诉您的名片和其他人之间的区别的联系人。另外，带有圆角你可以个性化你的卡你最初设想他们的方式。&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;我们提供广泛的纸张材质供选择，你可以选择最适合您的需要的纸张重量：从标准但可靠350g艺术打印纸张到我们更结实，耐用。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;除了我们广泛的名片，我们很自豪地说我们有最全面的投资组合的打印产品之一在互联网上。无论多么精确或紧急您的印刷需求，我们将提供您的产品安全和按时，因为我们先进的印刷生产、物流过程。从室外大幅面打印到传单，我们是呱呱印，一个在线设计印刷平台，让你不再烦心比较做名片去哪里可以做的问题。&lt;/span&gt;&lt;/p&gt;','','','',2,1,4294967295,'',0,'','',0,2147443200,''),(13,2,'纸袋手提袋印刷多少钱','&lt;p&gt;\r\n	纸购物袋是在时尚和购物行业在21世纪最有效的营销工具之一其成为廉价的广告工具作为良好的广告。呱呱印提供世界类保费纸袋设计和印刷制作服务在南京、宿迁、连云港比和我们制造各种极其创造长期持久的广告印象的纸袋。我们提供优质纸袋&lt;a href=&quot;/yinshua/152.html&quot; target=&quot;_blank&quot;&gt;手提袋印刷&lt;/a&gt;和生产所使用的最先进的质量纸张袋印刷设备与制造和出口到各地北京、上海、贵州、徐州、苏州等一样。纸包的制造单元为满足你的最后期限，即使你订货批量太的7天24小时运行。&lt;/p&gt;&lt;p&gt;\r\n	我们提供纸袋牛皮纸袋，由于我们100%原浆与褐色牛皮纸袋系列，色的保费质量纸袋与100%原浆。多颜色印刷的纸袋，叠层的纸袋，特别豪华纸袋印刷用最好的质量，整理，压花、击凹、热冲压、现货UV、水性上光油和口服脊髓灰质炎疫苗艺术无光和亚光光泽纸袋和豪华再生纸袋，织带柄纸袋和绳子与保费线。粘贴你的重型底部可以携带10至15公斤体重在我们生产的纸袋纸袋手提袋，那么这样纸袋手提袋印刷多少钱呢？&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;根据划伤表面无光泽和光泽整理证明分层，在各种厚度和大小你可以具备250g、200g、300和350g，食品董事会以及艺术纸手挽袋印刷表面无光泽或光泽纸。提供优质纸袋中自定义的大小、形状和任何大小。我们有训练有素和经验丰富的机器操作员，合格的劳动力，照顾纸袋整理在绑定和生产出高质量完成在一路的生产。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;','','','',2,1,4294967295,'',0,'','',0,2147443200,''),(14,2,'饭店开业宣传单如何印刷','&lt;p&gt;\r\n	我们开饭店的时候，常常为了吸引客户，要去印刷厂制作宣传单作为饭店开业使用，这就是&lt;strong&gt;饭店开业宣传单&lt;/strong&gt;，在这里爱玉米孔一个好游戏。所以当我们看到瑞秋设计了她自己的模式使用我们地板图形产品，我们都完全感兴趣 ！玉米-孔，一个院子游戏非常受欢迎的中西部地区，涉及两个平台用圆圈切进去，两组的四个豆袋 （充满宣传广告，因此优势在单页上很明显），和两个或四个球员。目标是要把你豆袋到对面的月台，或甚至更好，扔进洞里。一旦团队达刀饭店开业宣传单设计结束。呱呱印向我们解释了这个项目来了当思考活动和游戏在发生碰撞饭店开业宣传单。雷切尔做了大部分她印刷内部，所以当主任正步行穿过大厅，注意到她已经打印了她墙紧贴，他一把抱住他们的在线印刷设计平台的想法。虽然爱上了这个想法，瑞秋说她犹豫了，因为她手上都有乙烯会不会一直很好的游戏。正是在这一刻，她再一次转向&lt;a href=&quot;/yinshua/1.html&quot; target=&quot;_blank&quot;&gt;宣传单页印刷&lt;/a&gt;。&lt;/p&gt;&lt;p&gt;\r\n	饭店开业宣传单此前主要做杂志印刷发生碰撞的营前一年。她最初订购200个完美&lt;a href=&quot;/yinshua/116.html&quot; target=&quot;_blank&quot;&gt;台历印刷&lt;/a&gt;，但是有点少于一周前营地，她意识到他们需要 00多个。她联系了呱呱印客户服务代表，立即告诉她这不成问题了。这本饭店开业宣传单抵达的南京短的三天后，第一批饭店开业宣传单和饭店同样完美的条件立即印象深刻的。高质量，高质量的客户服务，是产品的什么赢得了她为以后的饭店开业宣传单设计印刷新选择。&amp;nbsp;&lt;/p&gt;','','','',2,1,4294967295,'',0,'','',0,2147443200,''),(15,2,'手提袋印刷定制纸袋 铜版纸','&lt;p&gt;\r\n	我们使用纸袋印刷纸张为&lt;strong&gt;手提袋印刷定制纸袋铜版纸&lt;/strong&gt;，为胶版印刷.数字印刷和激光切割甚至小斑点在尖锐的边缘，黑暗物质的丝网印刷，UV印刷直接打印到准备好的袋子.提供了现成的袋，以及自定义的包中的任何设计和颜色。成衣袋将帮助为您的迫切要求和快速印刷和交付以防您需要在4个小时生产。&lt;/p&gt;&lt;p&gt;\r\n	我们现成的手提袋印刷定制纸袋有不同的大小和质量如A5大小，a4和A3大小&lt;a href=&quot;/www.guaguayin.cn/yinshua/152.html&quot; target=&quot;_blank&quot;&gt;手提袋印刷&lt;/a&gt;，手提袋定制的有棕色工艺和白工艺，以及哑光面纸大和 x 大纸袋在白色和棕色也可用在哑。在超过 15 不同大小的无纺的布袋，黄麻纤维袋和棉布袋也帆布袋在不同大小套房盖，长袍盖服装袋在无纺布材料以便宜的价格。你为什么选择印刷手提袋印刷定制纸，那我们主推的还是铜版纸。这样的手提袋印刷效果质量最好，可靠和真正，便宜的价格，准时交货。&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;我们还提供各种印刷服务，如画册小册子、&lt;a href=&quot;/www.guaguayin.cn/yinshua/1.html&quot; target=&quot;_blank&quot;&gt;宣传单页印刷&lt;/a&gt;、广告宣传单、目录、名片、挂绳、气球、礼品及促销品像USB、电源、促销笔、礼品袋、包装纸、徽章、与绣、纸盒、礼品盒、文件文件夹、文件盒、气球配件、应力球、高尔夫球、激光雕刻、塑料id卡、会员卡、 pvc出入卡，服装吊牌印刷身份证持有人袋氦气罐的气球，气球拱门和立场，汽车遮阳伞，杯子印刷，印刷的帽和t恤和新闻界和转移印花，绣花，热染料升华作品、UV印刷、激光切割婚礼邀请卡、明信片印刷以及更多手袋印刷品。&lt;/span&gt;&lt;/p&gt;','','','',2,1,4294967295,'',0,'','',0,2147443200,''),(16,2,'纸袋印刷厂报价怎么看','&lt;p&gt;\r\n	为您的业务的个性化的纸袋将新方法添加到客户购买和留下持久的质量印象。&lt;strong&gt;纸袋印刷报价&lt;/strong&gt;也是一个机会来巩固你的品牌标识，当然其购物的使最终丰富的经验为您的客户端。你可以选择绳柄纸袋、花边手柄纸袋、线程购物袋、复合层压的纸包、保费纸袋、再生的纸包、艺术遮罩和艺术面纸袋与模切柄纸袋。它是重要的你纸袋质量激发的信心在您的业务。是在纸袋印刷让更优雅的你，可以把压花、黄金或银挫败、层压、局部 uv、油漆等。&lt;/p&gt;&lt;p&gt;\r\n	制作纸袋、携带袋、购物袋为您添加更多的美丽的业务和创造持久和最终购物体验到你客户。纸袋是最好的和可能的方式与您的客户端创建最终的购物体验。我们提供自定义具有不同&lt;a href=&quot;/yinshua/152.html&quot; target=&quot;_blank&quot;&gt;手提袋印刷&lt;/a&gt;风格的句柄、绳、复合纸袋、挫败、压花、现货UV给你最好的推广经验在你的品牌和业务。&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;我们通常提供叠的纸包装袋，购物商场、中心、时装直营店、服装行业、超级市场、酒店、展览中心，婚礼派对等.如何获得购物袋印刷在迪拜？还有为什么购物袋要打印？是由印刷购物袋有几个贯流式和精彩的购物体验也购物袋使代价的广告和品牌的印象，它将给您的客户。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;购物袋印刷在迪拜是真的很容易接触我们今天和得到你购物袋印刷真的很便宜的价格和最佳质量的打印，在海湾地区。我们提供广泛的购物袋、复膜的袋、礼品袋、纸袋、保费袋奢侈品纸袋印刷等。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;目录印刷是21世纪一个常用的词和其非常重要的工具，市场所有的产品和服务，没有目录没有介绍或有促进无疑是我们彻底图形设计套件提供设计徽标、目录、小册子、产品目录和年度报告，保证吸引眼球的甚至最烦躁的完善。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;我们的目录设计和印刷团队提供边缘到边界印刷服务向其客户保持不败的质量和侵略性的价格。总是还有一丝希望，我们的服务和质量优于领先的广告机构，我们的价格与普通的印刷机将竞争。它是一个公平的机会，享受得到我们美妙的设计和印刷服务，真的很实惠的价格和准时交货太。&lt;/span&gt;&lt;/p&gt;','','','',2,1,4294967295,'',0,'','',0,2147443200,''),(17,2,'定制手提袋印刷与设计公司','&lt;p&gt;&lt;strong&gt;定制印刷手提袋&lt;/strong&gt;是一个重要的业务，因为它一举两得。袋是一个产品，许多印刷公司定期购买。但通过支付更多的前期成本和有定制印刷与贵公司的徽标和颜色，它转变为一个独特的营销工具。&lt;/p&gt;&lt;p&gt;\r\n	想想在商场购物。每个店都有自己独特的包有自己独特的定制&lt;a href=&quot;/yinshua/152.html&quot; target=&quot;_blank&quot;&gt;手提袋印刷&lt;/a&gt;品牌。一些零售商甚至被称为他们的行李。如果你看到一个袋子，说，你知道它来自呱呱印！虽然它不是一个包，如果你看到一个蓝色的小盒子，你知道它是从印刷厂的！&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;定制印刷手提袋是一个活广告，为您的企业，会在他们头上的路人的种植种子的眼睛。另外，有定制箱包企业通常被认为比其他公司的人用普通的塑料手提袋更高档。&lt;/span&gt; &lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;我们所有的行李都是由最高质量的定制手提袋印刷材料，我们可以打印出8种不同的颜色，所以我们可以解决任何标志手提袋设计无论是简单还是复杂！我们位于5个仓库在南京和加急服务可在某些项目。&lt;/span&gt; &lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;我们有四个不同的子类的自定义包选择：定制印刷塑料手提袋，定制印刷纸袋、塑料袋、环保手提袋定制印刷。更多的信息和具体的产品类别点击查看下！&lt;/span&gt; &lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;广告艺术的塑料袋购物袋提供了行业中最大的品种。从高密度循环处理购物者，多彩的模切购物袋、T恤袋等等，我们都保证有适合您的应用程序以极具竞争力的价格的购物袋。我们所有的购物袋可定制您的确切大小和厚度规格，印刷多达8种颜色，包括定制手提袋印刷过程。&lt;/span&gt; &lt;/p&gt;','','','',2,1,4294967295,'',0,'','',0,2147443200,''),(18,2,'企业产品画册设计如何做','&lt;p&gt;\r\n	我最近为4页的宣传画册或自盖到印刷机通常我工作。这是一个短期（250，500，或1000份）近一平方的工作，所以印刷机的价格在他的惠普Indigo数字印刷机的宣传画册。基于对部分客户的描述，我给印刷机使用胶印设备工作的选项（如双色工作）或数字技术，他认为数字印刷会更划算。&lt;/p&gt;&lt;p&gt;\r\n	他的价格是伟大的，在我的预期非常一致。鉴于此自定义印刷供应商通常是低出价，我没有投标工作的任何其他商业印刷厂商。我的客户很满意这个计划。&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;然而，我的客户的客户问的第二个投标，所以我招标工作一个新的印刷机。我一直称这个特殊的商业印刷厂。参考了恒星，但在我之前试图启动这台打印机工作时，其价格已经太高了。&lt;/span&gt; &lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;因此我预计第二打印机回来的价格高于第一&lt;a href=&quot;/yinshua/178.html&quot; target=&quot;_blank&quot;&gt;企业画册印刷&lt;/a&gt;报价。但他们均显著降低，而他们基于偏移的自定义打印（双色胶印）。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;我该怎么办呢？其实我还没有准备好成功。这是一个敷衍的二投标。&lt;/span&gt; &lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;在选择一个新的画册印刷机的因素：&lt;/span&gt; &lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;作为一个印刷经纪人，我不得不决定是否鼓励我的客户认为这是一个新的打印机。价格是正确的（低几百元）。我的同事推荐了企业画册印刷机和他做了很多工作。这个打印机因此是一个已知量。我觉得我可以依赖他。&lt;/span&gt; &lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;不过，我给打印机问类似的工作宣传画册样本，在与我的客户的规格线的东西。基于样本，我会决定是否与我的客户分享新打印机的报价。我会找这样的事情，甚至装饰，赏心悦目，和严格的登记。&lt;/span&gt; &lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;然后我可能会采取一种信仰的飞跃。当然，这是一个相当小的工作，我通常喜欢去开始一个新的印刷出来的东西比较小，容易建立信任，并从那里。&lt;/span&gt; &lt;/p&gt;&lt;p&gt;我还对另外两个新的印刷机，我说过去这一年来我的列表的思想。这就是我决定交出一份真正的宣传画册工作。&lt;br/&gt; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;/p&gt;','','','',2,1,4294967295,'',0,'','',0,2147443200,''),(19,2,'创意海报设计作品欣赏','&lt;p&gt;\r\n	我从一个大学朋友一个关于创意海报设计作品欣赏的电子邮件，一个海报印刷的书设计师在这个博客写了我无数次。刚进入杂货店，海报说。“我正在设计一张海报，我害怕。我不知道如何去做。”&lt;/p&gt;&lt;p&gt;\r\n	所以我叫她在我的手机，我走过去，水果和蔬菜的海报设计图片欣赏不错。&lt;/p&gt;&lt;p&gt;\r\n	原来，她没有复制，五个小时，到创意海报设计作品发稿时，只有她的客户的方向用她设计的相关教材的图表。这让我思考。有从中汲取设计信息的最初的产品将是一个很好的起点。这是我作为她的第一步：我告诉她把图像，设计网格，从原型和字体（她已经产生的初始印刷的书）。我说，这些相同的元素会把课本和一个共同的“海报设计。”会议的与会者（显然，海报是一个会议）将看到的相似性和关联的印刷书和海报。即使他们这样做是在潜意识里，它仍然会使“品牌意识”。（想想星巴克的标志，即使在印刷图文店亭被许多其他的标志。是立即识别）&lt;/p&gt;&lt;p&gt;\r\n	我说，如果她没有抄袭，她应该写一些。我告诉她说“谁”“在哪里，”“为什么”“什么”和“什么时候”，“你的客户可以随时更改它，”我说，这不像海报印刷的书，一张海报，是从远处看。我告诉我的朋友做型大以及短。&lt;/p&gt;&lt;p&gt;\r\n	我朋友的海报设计，我呼吁更新打印的书籍设计师，有助于进一步。她叫了另一个设计师，问了一个快速和肮脏的产品。有趣的是，我的朋友，这本书的设计师便把她的助理的工作和修改了它。&lt;/p&gt;&lt;p&gt;\r\n	正如我所预料的那样，字体已经从客户端的教材绘制。从顶部的海报，最初的设计包括所有帽齐左相当长的标题。书籍设计者把这个标题和中心，运行所有的方式在海报上放置一个棕色的规则线穿过页面立即下标题。这种分离的标题文本。它的标题一个信息块（便于读者吸收）。规则线也提供了一个“钩”像一个晾衣绳，从其中的所有其他元素可以挂海报。&lt;/p&gt;&lt;p&gt;\r\n	在颜色的规则，我的朋友打印的书籍设计师把三个图在一个45度的角的单词的标题。在另一个的上面，这三头吸引了读者的眼球下页。对每个人的权利是其图。三图表格式一样，这样读者就知道接近他们的“相似”或“平等”。图表看上去都是一样的除了南京。我的朋友用绿色和浅版的深棕色给人以衔接到一块。绿色也出现一个巨大的初始上限从海报的左栏的文本颜色。&lt;br/&gt;&lt;/p&gt;','','','',2,1,4294967295,'',0,'','',0,2147443200,''),(20,2,'宣传海报设计印刷流程了解','&lt;p&gt;&lt;strong&gt;宣传海报设计&lt;/strong&gt;和印刷顺着海报的左侧，有一个初始盖深五线左对齐设置。&lt;a href=&quot;/yinshua/96.html&quot; target=&quot;_blank&quot;&gt;海报设计印刷&lt;/a&gt;最初的最初帽浅绿色（三图匹配的图表图像）。我建议她把它深绿色。然后匹配两绿色（突出）在海报标题字。我知道这会使读者的眼睛跳从标题到初始帽。&lt;/p&gt;&lt;p&gt;\r\n	在左栏文本阅读，观众都知道跳到三图表标题然后将选出海报扫描图。颜色会加强这些直观的连接。&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;我的朋友打印的宣传海报设计师，浅棕色的数字和百分比来区分每个图从别人。据推测，如果读者看到了什么，他/她会知道，宣传海报的差距基于两大设计风格，粗体字的标题，和一个小男人和女人的图标集。南京城市将澄清在图表的差异。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;在文本的左边海报，宣传海报设计者已经取得了一定的单词全部大写，在大胆和对比的字体，和浅棕色。如果观众看什么，他/她仍然得到海报的内容要点。与浅棕色的颜色会使文本右边的图左。图头也会作为一个锚，导致右眼下页。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;下面的文字和图表，宣传海报设计者把另一个水平线横跨整页。它匹配的规则只是标题下面，创建一个宣传海报的中央部分的框架。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;下面这条规则，她把另一头：“三教训。”她排版字“三”在棕色墨水。（如果你扫描的文章在互联网上，你会发现很多短，精辟的文章，是这样开头的：“三种方式来做这个或那个。”它抓住读者的注意力。他/她知道时间的承诺需要得到如此多的人生问题的答案的水平。）&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;横向上，下面这个标题，大数字开始，设计师把三的教训，在自己的每一个列（同等深度）使用相同的男性和女性的图标，她对上面的图表中创建了一个小例子，在相同的颜色。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;由于所有这些设计选择，读者的眼睛知道如何通过图表的进展。最终的产品是快速和肮脏的模拟印刷宣传海报设计师的助理更好（海报设计）提供了。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;我做了一个最后的建议。我提醒&lt;a href=&quot;/&quot; target=&quot;_blank&quot;&gt;印刷厂&lt;/a&gt;朋友，谁来为80cmx 180cm进行宣传海报设计，海报是从远处看。无论多么好的看起来在电脑屏幕上，我鼓励她打印出一个平铺的复制，在颜色，粘贴在一起，并把它挂在墙上看看会是什么样子。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;你可以从我朋友的海报进行宣传，考虑这些步骤，你设计你的下一张海报的时候，尤其是如果你是创新的海报设计，涉及的学科整体看以前设计的材料（书或抵押），使用相同的字体，颜色和图像设计网格。这将确保海报反映了你的企业形象。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;决定你希望读者的目光穿越您的宣传海报，并使用颜色、类型、结构和规则的内容，方便阅读，经常检查宣传海报设计的出血尺寸。&lt;/span&gt;&lt;/p&gt;','','','',2,1,4294967295,'',0,'','',0,2147443200,''),(21,2,' 产品包装盒印刷制作','&lt;p&gt;&lt;strong&gt;产品包装盒印刷&lt;/strong&gt;我的客户刚刚收到她的工作，其中包括十二个制版，骑马装订印刷书在包装盒印刷里。本书是6cmx 9cm四色封面格式，它们适合在滑盒是四色机板叠层瓦楞纸板。&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;我问我的客户如何工作看起来当&lt;a href=&quot;/&quot; target=&quot;_blank&quot;&gt;包装盒印刷&lt;/a&gt;样品到达，她表示书但对于稍微偏离中心的艺术包装盒印刷上遗憾的快乐。她收到了一个样品的工作。打印机已经寄出所有其他集合到地址数据库列表我的客户提供了。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;哎哟。几件事情打扰我比不满的客户。所以我问她送我的包装盒印刷展示艺术中心照片。然后我把这些对商业印刷厂商所做的工作。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;首先，我向我的客户的照片而不是包装盒印刷本身，这样我就可以进行产品包装盒印刷制作。拿起包装盒印刷要花时间。发送盒打印机会采取额外的时间。请求的照片作为电子邮件附件是更直接的。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;给你一些背景下，滑移的情况下已经有三英寸宽以容纳十二短的印刷书籍。在它的后面是一个完整的9高，但这个向下倾斜在前面约6cm提供易于访问的书。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;在产品包装盒印刷制作的两侧前端的文字和照片里促进书刊印刷书回来。我可以看到，包括不完全集中，稍微倾斜的背景上的cmyk颜色。在前面滑盒我的客户包括，该系列的标题；一个列表的分离，结合部分包括；和公司logo。本中心的列表的垂直轴没有正集中在盒面板，和所有类型的稍倾斜以及。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;弄明白到底产品包装盒印刷制作发生了什么，我查了PDF格式的包装盒印刷证明。这个PDF图像显示所有文件，将皮瓣折叠粘箱制作完成。这是令人难以置信的复杂，所有的皮瓣和胶标签。证据显示图像的精确定位（前面和后面的主要书籍封面）在包装盒印刷的两侧，加上艺术的更高的后面板和较短的前面板。我可以看到艺术应该降落（打印后，复膜、模切、折叠和粘合）。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;虽然他可以看到的样品包装盒的照片精度不够，他在打印店检查其他样品没有偏心或倾斜。可能还有包装的纸箱很好。这不是一个产品包装盒印刷质量的保证。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;','','','',2,1,4294967295,'',0,'','',0,2147443200,''),(22,2,'纸盒包装盒厂家哪家好','&lt;p&gt;&lt;strong&gt;纸盒包装盒厂家&lt;/strong&gt;的印刷机常常是一些陈旧设备。也有些损坏。我们的印刷机将这些提供给我的客户，如果她收到的投诉，需要发出一个或两个新的包装盒印刷一个不满意的顾客（即最终用户）。&lt;/p&gt;&lt;p&gt;\r\n	这是发人深省的纸盒包装盒厂家提供信息：纸盒&lt;a href target=&quot;_blank&quot;&gt;包装盒厂家&lt;/a&gt;制造不至于抵消自定义打印紧。而胶印机可以提供一张从印刷元件定位完美的余地，纸盒包装盒厂家可能有一个余地，这也被认为是可以接受的。为什么？因为所有纸盒包装盒的模切、折叠、涂胶操作实际上会放大和加剧丝毫偏离完全定位。箱需要转换多个操作会使问题恶化。&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;在未来的纸盒包装盒设计，将不把矩形安全（书的封面）在一个位置，如果有任何偏差，完美的位置是显而易见的。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;尽管我不快乐，我可以看到纸盒包装盒印刷机的点。在本书的印刷，这可能是像把12pt规则四周书封面的周长。除了最精确的修剪会使周围盖覆盖印刷规则看起来不均匀。由于商业印刷是一个物理过程，和所有印刷，印刷后（或完成）运算放大误差，兼具平版印刷和印后加工业务在心灵的极限设计是明智的。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;当然，一些包装盒印刷–也许最盒–接近完美，特别是在盒的印刷机问题的滑移情况。不幸的是，我的客户的样品是不完美的。但正如我可以看到印刷地图恶化为褶皱的众多放大放置任何错误的错误，我可以看到我的印刷机的点。但如果我没有多年来开发这样一个长期的与他的关系，我可能没有回应他这样的信念。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;对于纸盒包装盒复杂的工作，对印刷机的完全信任你的工作。如果出了什么事，他会诚实地告诉你什么是印刷机的故障，什么是可接受的，或在公差范围内，对于特定的商业纸盒包装盒印刷和整理工作。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;期待包装盒印刷到不是完美的，由于个体数量的步骤的过程中，会放大缺陷。设计你的印刷产品从而减少任何偏差的影响的张贴在包装盒印刷中。&lt;/span&gt;&lt;/p&gt;','','','',2,1,4294967295,'',0,'','',0,2147443200,''),(23,2,'高档精美礼品包装盒厂家','&lt;p&gt;\r\n	精美礼品包装盒的客户我准备了一套教材。这组由四个原印刷书籍三每个副本放置在一个瓦楞盒套。是什么让这个特别有趣的是精美礼品包装盒，我的客户和我都不生产包装盒印刷的每一天。因此这是一个新颖和挑战。&lt;/p&gt;&lt;p&gt;\r\n	为了确保成功，有一些事情要考虑，一些规格确认，并注意一些物理特性。如果你还生产盒装套印刷的书，你可能会找到对精美礼品包装盒有用的信息。&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;他们将48或52页（两本书每个长度）。单面涂布）的股票，精美礼品包装盒书中的文本页面将印刷在高档白色不透明文本股票。一旦出版，该书将鞍缝合和插入盒和盒将收缩包装。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;首先，文本和封面很厚，这将给一种物质对短书。更长的书，我会建议定制下高档的精美礼品包装盒。幸运的是，纸的厚度会使页面完全不透明的，并有从印刷书页一面反面不显示。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;\r\n	现在，包装盒印刷，了解书的组成将有助于了解的盒套必要的规格。基本上，每箱包含三份各四册，占总数的十二，鞍缝合印刷书籍。&lt;/p&gt;&lt;p&gt;\r\n	基于封面和文字材料厚度，以及书籍的数量每箱集书印刷机建议我的客户一个很宽的滑移的情况下创造艺术。这将允许为松散的书籍的小房间（因此容易从盒）。&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;为了便于学生和教师都删除和替换框内的书，前面的包装盒印刷将只有5“高，和后面将满9”高度的书。这将保护书籍也让他们很容易从盒中去除，和宽度将允许所有十二本书舒舒服服地坐在盒套。&lt;/span&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;就是说，精美礼品包装盒的印刷还计划将两箱和书一纸假以确保一切都将按计划。&lt;/span&gt;&lt;/p&gt;','','','',2,1,4294967295,'',0,'','',0,2147443200,''),(24,2,'结婚礼品包装盒如何挑选','&lt;p&gt;\r\n	结婚礼品包装盒不仅仅是一个结婚的声明。这是一个物理的产品，在其本身。它有一个功能，必须考虑。它必须包含和保护书籍，使他们易于拆卸和多次更换。因此，我很高兴地得知，打印机计划制造假货的整个设置有模具切割箱子的夹层的电子组装前。为了结婚礼品包装盒做这危险的错误。使切割模具花费很多金钱和时间。如果有需要的尺寸错了，更换会妥协的计划及预算。&lt;/p&gt;&lt;p&gt;\r\n	另一个要考虑的是所需要的&lt;a href=&quot;/zixun/128.html&quot; target=&quot;_blank&quot;&gt;高档精美礼包装盒&lt;/a&gt;生产与转换。我不能绝对肯定这部分的箱制造结婚礼品包装盒需要转包（除&lt;a href target=&quot;_blank&quot;&gt;印刷厂&lt;/a&gt;的模具制造，及模切和组装盒形式），但这需要额外的时间。分包总，和打印机放弃一些控制措施在生产过程中由于转包生产的需要。但在某些情况下是必要的。很少有商业印刷供应商可以做这种工作的内部在盈利的基础上。&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;对于结婚礼品包装盒复杂的工作，可能需要专门的工作，问问你的印刷供应商关于分包劳动的需要。请将如何影响价格、进度和工作质量。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;一份精确的一盒为一套印刷的结婚礼品包装盒，有印刷机为您提供精确的尺寸（和图）的艺术你将需要准备。然后，一旦您提交的结婚礼品包装盒设计稿件图片，请确认它是正确的。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;确保你的印刷机创建一个结婚礼品包装盒工作如。如果他不这是一个结婚礼品包装盒。请看包装盒印刷和书籍以确保它能满足你的需要和期望的结婚感受。&lt;/span&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;证明早期经常。我建议你使用结婚礼品包装盒的设计稿格式是jpg，或PDF格式。我的未婚妻，只带回家一个结婚礼品包装盒，我说，“哇。我想，“这是有效的结婚放肆。这是一个基于一个结婚礼品包装盒的本能反应。这之前，任何与产品互动。事实上我还没有尝试过的结婚呢，尽管我知道它的味道会。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;有效的结婚礼品是有效的设计和有效的自定义打印。这些都是礼品，如果你愿意。他们的结合创造出“哇”的时刻。&lt;/span&gt;&lt;/p&gt;','','','',2,1,4294967295,'',0,'','',0,2147443200,''),(25,2,'瓦楞纸板折叠纸盒设计包装','&lt;p&gt;\r\n	这种印刷产品的技术术语是“折叠纸盒”因为它是平面印刷，然后折叠和粘到纸箱的牙膏就是最好的&lt;strong&gt;瓦楞纸板折叠纸盒设计&lt;/strong&gt;包装。这种特殊的纸箱是由两个元素：一个印刷瓦楞纸箱折叠成一个长方体与纸板开槽和向外暴露，并与所有的槽斜放在盒尺寸。不像大多数的瓦楞纸板，这暴露了瓦楞纸纸箱包装设计的方案。大多数波纹板夹在两平板纸板之间的凹槽。&lt;/p&gt;&lt;p&gt;\r\n	裹在瓦楞纸板纸箱印刷磨砂“套”，它涵盖了所有的四个边的瓦楞纸箱。然而，它的盒型两边暴露，所以你可以看到内盒的对角槽。&lt;a href target=&quot;_blank&quot;&gt;包装盒印刷&lt;/a&gt;的主要是印在泥土色调。&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;在我看来，为牙膏纸盒的折叠提供了一个有机的“感觉”到的触觉槽盒（柔韧，其斜罗纹触摸粗糙一点）。我觉得有趣的是，波纹内盒实现这种有机的感觉不是通过任何自定义打印但通过对槽纸，简单的颜色，纹理，和斜罗纹图案。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;外印刷套筒加强这几种方式有机的主题：森林绿，米色，和锈褐色颜色偏移印在布纹板提供一个温和的和复杂的，但在同一时间，简单的和有机的，感觉。对于大多数复制字体和标志相应的无衬线字体的脸，给当代但又简单而有序的看片。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;的营销文案内容强化了主题。单词和短语，如“无谷，“无氟”、“有机”、“无氯，”、“正宗”地位这一特殊的牙膏产品谨慎、环保意识的消费者会购买。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;使用的材料自定义打印“绿色”的折叠纸盒复制突出指出，百分之80回收材料制成的纸到纸箱和胶版印刷纸。此外，而不是使用基于印刷油墨石油、定制印刷供应商使用更环保大豆油墨。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;所以简单的说，营销团队的字体确定促销副本，配色方案，论文，和自定义打印技术一起提出这个特殊的牙膏作为一个有机的，地球友好的选择清洁和美白牙齿瓦楞纸板折叠纸盒设计包装。&lt;/span&gt;&lt;/p&gt;','','','',2,1,4294967295,'',0,'','',0,2147443200,''),(26,2,'定做礼品包装盒厂家','&lt;p&gt;\r\n	一个精明的定做礼品包装盒厂家设想理想的客户和他们的发现激起他的兴趣的方法。其中关键的方法是列表的属性，喜欢和不喜欢的，这个“虚拟”的人。在这种情况下，例如，理想的客户可能是25到40岁的一个愿望，保护环境，并希望同时避免化学添加剂使用健康美容产品。谁知道呢？也许他/她甚至喜欢皮划艇和攀岩的周末。也许他/她有一顶上的自行车架斯巴鲁。&lt;/p&gt;&lt;p&gt;\r\n	心中有了这个理想的定做礼品包装盒厂家，一个精明的营销人员再使用广告文案，字体，设计网格，纸的选择，和纸的纹理（的瓦楞纸板，在这种情况下，开槽）与潜在买家建立感情。如果定做礼品包装盒厂家的人员可以使用自定义打印设计工具，在他/她的处理引起买家感与品牌价值的联系，营销人员可以进行销售。&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;张贴在包装盒印刷，商业印刷和高档包装体现了艺术性和豪华。我想描述包装一拉直我的未婚妻刚买的。也许“喷一下”是一个更好的词，因为这包装盒印刷真的给我留下了深刻的印象在其设计和自定义打印工作。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;这个包装盒印刷是在产品包装价值的地方卖奢侈品制造商。根据新闻运行的长度，我的猜测是，包装盒印刷可能花费几美元或更多生产每一单位。因为它包含了一个30美元的专业美发工具，定做礼品包装盒厂家投入的金钱包装不总成本的一个微不足道的部分。&lt;/span&gt;&lt;/p&gt;','','','',2,1,4294967295,'',0,'','',0,2147443200,''),(27,2,'包装盒印刷的尺寸是多少钱','&lt;p&gt;\r\n	这个包装盒印刷是约6cm高＊18cm宽。铰链箱顶上前，和超出&lt;a href=&quot;http://www.guaguayin.cn/&quot; target=&quot;_blank&quot;&gt;包装盒印刷&lt;/a&gt;的前盖扣在纸板上。仔细检查后，我看见两磁铁在印刷纸。&lt;/p&gt;&lt;p&gt;&lt;strong&gt;包装盒印刷的尺寸&lt;/strong&gt;的底部，背部，顶部和前面都是一片，延伸超出内盒。封面看起来就像是一面由打印机生产精装书。超厚胶的板建成，覆盖包括外压料已延伸到箱盖的内边。在大致相同的方式作为一个精装书的封面卷边纸覆盖的印刷包装盒，额外的压料盖的扁铁箱盖内侧，几乎延伸到了边缘的外部文件。&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;包装盒印刷里面是一个成型的塑料托盘的陶瓷扁铁，头发拉直工具。托盘的可见的一面是像一个柔软的触感UV涂层。它是软的、模糊的，像一个桃子皮。&lt;/span&gt; &lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;最后，有三个，三倍宣传册在包装盒印刷中，印重，薄膜复合文本的股票（一个在北京，一个在安徽，一个在上海）。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;内部新闻片、层压到封面纸，褶皱的翻边伸入盒印刷人造斑马条纹金属油墨。金属银墨衬托磨砂黑色背景。无论是油墨太厚了。&lt;/span&gt; &lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;起初，我认为包装盒印刷的尺寸这是一个样本自定义屏幕印刷。然而，我用放大镜看网点的黑墨下。包装盒印刷的尺寸在这一点上，我认为印制了黑色然后第二击中固体黑色增加黑色油墨密度屏幕。此外，我认为他会用银做的一样（可能是一个双重打击的墨）。&lt;/span&gt; &lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;最内层箱内部似乎略有斑驳，哑光黑色。我想这可能是柔性版印刷包装盒。&lt;/span&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;我还看到在枯燥的外部包装盒样本，已经在包装盒印刷的边缘，延伸一寸左右进入室内之前被粘平贴胶板组成的包装盒印刷。&lt;/span&gt; &lt;/p&gt;','','','',2,1,4294967295,'',0,'','',0,2147443200,''),(28,2,'高档礼品包装盒价格','&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	银色，黄色型和图形装饰&lt;a href=&quot;/&quot; target=&quot;_blank&quot;&gt;包装盒印刷&lt;/a&gt;的外观。&lt;strong&gt;高档礼品包装盒&lt;/strong&gt;显然是烫印箔由于其反射的金属光泽，但我不肯定的黄色。它是如此丰富。它可能包括一些荧光油墨或一些不透明的白色混合到PMS黄（没有网点，所以它不是一个颜色的建立）。也许这是一个双重打击黄。单调的银色斑马条纹比银更压抑，所以我想条纹已与墨水而不是烫印箔创建。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	我们从高档礼品包装盒价格中学到什么？&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;高档礼品包装盒是很实用的。甚至在杂志印刷，书籍印刷的巨变之中，与报纸印刷、销售产品&lt;a href=&quot;/zixun/132.html&quot; target=&quot;_blank&quot;&gt;包装盒印刷尺寸&lt;/a&gt;实际上是成长。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;扁铁校直工具是一块130美元的发型师的设备，直到它被放在一个折扣商店。包装盒印刷的设计师（和营销人支持她或他）认为5元）箱将出售价值130元的矫直铁。这是一个公平的承诺资金以及设计和生产的时间。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;我个人认为，直到材料可以发明，将产品在屏幕上的数字投影图像可以被投射的，我们高档礼品包装盒既有高端和低端产品包装。蒂凡尼专卖店和其他奢侈品商店将提供的是艺术作品的购物袋。即使在含有微波晚餐食品杂货店的包装盒印刷将在可预见的未来。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;张贴在包装盒印刷，纸和整理，纸板包装盒。商业印刷，高档礼品包装盒中的进展。&lt;/span&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;在一个世界里胶印和数字印刷定制正在为数字通信媒体如电子书，在一个地方–Yelp和脸谱网产品包装工作实际上是成长。&lt;/span&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;数字包装机的研究进展。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;直到最近，在包装上的数字印刷定制的主要焦点已经自定义标签。软包装在自定义标签印刷，胶印和柔印的选项包括。然而，这意味着高档礼品包装盒价格已经开始改变。&lt;br/&gt;德鲁巴印刷展会突出高档礼品包装盒，将为折叠纸盒和软包装市场的理想。&lt;br/&gt; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;/p&gt;','','','',2,1,4294967295,'',0,'','',0,2147443200,''),(29,2,'高档礼品包装盒生产厂家','&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	高档礼品包装盒生产厂家常常接受29.5cmx 20.9cm的成品尺寸，这让包装盒印刷厂产生较大的印刷品或在新闻片施加更多的单位的能力。高档礼品包装盒的迭代已经接受了压片前接近12“x 18”。可容纳更大的包装片将潜在竞争头对头对单张纸胶印机。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	在产品和包装的可持续性是一个决定性的因素，许多人在购买消费品。能力生产更环保的包装通过数字印刷定制是一大卖点，特别是在条款的减少浪费和提高生产力的数字印刷品质。&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;数据和图像，大规模定制高档礼品包装盒已经成为必不可少的。新的、更大的格式的数字印刷机允许结合可变数据券、门票、包装、调查、对话营销与产品包装工作，从而将高档礼品包装盒生产厂家变得利润更加微薄，高档礼品包装盒价格更佳低廉。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;数字印刷机如高档礼品包装盒生产厂家允许商业印刷厂商添加单个条形码或QR码包装可变数据的能力。这有助于跟踪单个产品、编码和控制库存，并识别假冒产品。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;在平版印刷的进步，Rapida、海德堡这些都是包装印刷机厂家，&lt;/span&gt;&lt;a href=&quot;http://www.guaguayin.cn&quot; target=&quot;_blank&quot;&gt;呱呱印&lt;/a&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;在偏移的重量级人物都定制印刷，这些公司已扩大其胶印选择产品的包装，如在德鲁巴和其他地方。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;例如，一个特定的新闻，海德堡速霸提供印刷机八台、涂布单元，以及UV油墨印刷能力。高档礼品包装盒生产厂家允许在线印刷枯燥和光泽清漆的效果，和不透明的白色，金属油墨的使用，和底物如铝涂布纸板。&lt;/span&gt;&lt;/p&gt;','','','',2,1,4294967295,'',0,'','',0,2147443200,''),(30,2,'茶叶礼品包装盒印刷厂家','&lt;p&gt;\r\n	与其他商业印刷领域，&lt;strong&gt;茶叶礼品包装盒&lt;/strong&gt;印刷厂家面临的成本、质量、和转向压力。可以打印多个设计效果在加快制造过程和控制成本。越来越多的，如金属箔印刷可以有效地制造如此抢眼的效果，让包装真正站在了商店的货架上。&lt;/p&gt;&lt;p&gt;\r\n	冲压自动化提高了准备时间，减少浪费，提高整体效率。例如，海德堡速霸包括自动化桩改变在馈线和传递新闻结束。它是越来越有可能提供醒目的包装更快更经济。&lt;/p&gt;&lt;p&gt;\r\n	许多茶叶礼品包装盒印刷厂家将这些包装机的混合，包括胶印和喷墨的能力。这意味着变量的数据可以在新闻添加运行，而不是在一个单独的通。打印机可以使用这样的功能添加QR码，条形码，和其他变量的数据，或用于错误检测。&lt;/p&gt;&lt;p&gt;\r\n	闭环，电眼装置不断监控彩色密度的新闻，作出调整以匹配预设颜色数据。这将导致更快的吞吐量和减少浪费，以及改进的色彩保真度。&lt;/p&gt;&lt;p&gt;\r\n	茶叶礼品包装盒印刷必包括自动化进程同步。例如，必达印刷机可以同时按下自动洗毛毯，自动改变印版滚筒，滚筒。再次，速度转化为节约成本和提高周转时间。&lt;/p&gt;&lt;p&gt;&lt;a href=&quot;http://www.guaguayin.cn/zixun/134.html&quot; target=&quot;_blank&quot;&gt;高档礼品包装盒生产厂家&lt;/a&gt;生产软包装消耗了大量的电力由于长按运行和高热量的要求（例如干燥油墨在卷筒纸印刷机、烤箱）。考虑节能减排、高宝已经发展，捕获热量从初始干燥机组，利用它为后续的干燥工艺，减少热量，节约能源，降低碳排放。因此，&lt;a href=&quot;http://www.guaguayin.cn/zixun/133.html&quot; target=&quot;_blank&quot;&gt;高档礼品包装盒价格&lt;/a&gt;一直居高不下。&lt;/p&gt;&lt;p&gt;\r\n	产品&lt;a href=&quot;http://www.guaguayin.cn&quot; target=&quot;_blank&quot;&gt;包装印刷&lt;/a&gt;似乎受数字媒体的侵犯。可以说，数字技术已经在提高速度、仪器的质量，成本，和对环境的影响自定义印刷工作。&lt;/p&gt;','','','',2,1,4294967295,'',0,'','',0,2147443200,''),(31,2,'水果礼品包装盒批发哪里好','&lt;p&gt;\r\n	张贴在&lt;strong&gt;水果礼品包装盒&lt;/strong&gt;印刷，标签和不干胶印刷，标签印刷，大幅面打印，胶印，纸和整理，纸板包装，未来印刷水果礼品包装盒是什么样的？哪里批发更合适？&lt;/p&gt;&lt;p&gt;\r\n	维基百科定义的“水果礼品包装盒”为“在一个给定的舞台上塑造或影响趋势或预示未来事件的任何实体。”在竞技场和偏移数字印刷，这个词合适德鲁巴完美。&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;水果礼品包装盒是典型的印刷展会。在杜塞尔多夫举办的南京13天，本次活动汇集了专家从印刷领域的各方面知识分享和讨论的趋势。在许多情况下，&lt;a href=&quot;http://www.guaguayin.cn&quot; target=&quot;_blank&quot;&gt;呱呱印&lt;/a&gt;的各种公司的高层管理人员参加，因为主要的商业印刷设备制造商已经站在南京，这些管理者为了他们的新机，折叠设备，这样，在北京展会。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;此外，根据包装水果礼品包装盒的网站，今年的包装行业反映国际存在，包括190000多名外国游客，随着与会者代表中国，人数最多的印度，比利时，法国，荷兰，大不列颠，美国，瑞士，和意大利。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;这是否说明定制印刷的未来？&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;当你考虑南京的与会者和他们的“决策者”地位的国际性，加上新的设备由Goss和HP等厂商在显示列表中，加上重型压力机设备放置的贸易展在实际订单数高，你可以看到占卜的趋势在德鲁巴能够给我们一个全球印刷的国家观。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;水果礼品包装盒是不是死了。OEM（原始包装设备制造商）正在大力投资于新的商业印刷工艺和设备（数字和胶印）因为他们设备的买家。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;其实水果礼品包装盒无处不在。与会者的国际性质证明了定制印刷国际市场。&lt;br/&gt; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;/p&gt;','','','',2,1,4294967295,'',0,'','',0,2147443200,''),(32,2,'哪里卖u优盘礼品包装盒','&lt;p&gt;\r\n	在u&lt;strong&gt;优盘礼品包装盒&lt;/strong&gt;展览印刷的主要趋势包括：数码印刷、包装印刷材料，混合动力技术的混合胶印和数字印刷，油墨技术等新技，环保印刷的做法，并在商业印刷技术的自动化。&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;多个优盘礼品包装盒工作流导向而不是技术导向的趋势包括集成的媒体宣传；未来印刷书籍，报纸、&lt;a href=&quot;/yinshua/152.html&quot; target=&quot;_blank&quot;&gt;手提袋印刷&lt;/a&gt;，和杂志印刷对话营销，包装。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;\r\n	在全球层面上，对于优盘礼品包装盒这意味着什么？&lt;/p&gt;&lt;p&gt;\r\n	印刷必须与数字媒体的竞争。电子书正在创造越来越大的足迹。许多优盘礼品包装盒都将员工为他们的数字和印刷版和印刷版的频率降低到一周几个问题。&lt;/p&gt;&lt;p&gt;\r\n	然而，印刷&lt;a href=&quot;/zixun/136.html&quot; target=&quot;_blank&quot;&gt;水果礼品包装盒&lt;/a&gt;（胶印和数字）可以做数字媒体不能的事情。纹理UV涂层（软触摸和砂纸）表明，数字媒体不能提供触觉经验。这仍然是很重要的，在某种程度上，对于一些印刷产品，对绝大多数人来说。&lt;/p&gt;&lt;p&gt;印刷买家要求更快的周转，更多的定制工作。优盘礼品包装盒设备提供胶印和数字能力能适应短，可变数据的工作期限很紧。&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;买家，在一般情况下，不接受“优盘礼品包装盒”广告。越来越多的广告主发展与买家互动的方式，通过集成推广工作涉及数字和胶印以及各种形式的社交媒体。研究开始反映跨媒体计划的协同性。例如，一个直销和QR码和流苏的结合可以产生比一个只打印或电子邮件广告的主动性更高的响应率。优盘礼品包装盒的客户希望供应商能与他们互动。综合媒体服务这个目的。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;包装是不会消失的，尤其是优盘礼品包装盒。当我们进入一家杂货店或计算机存储、包装有助于产品的销售力。就是说，能够创造一个包装盒印刷或1000正变得越来越重要，因此数字定制印刷技术已经进入包装工作。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;数字印刷一般来说似乎是未来的浪潮。许多高端单张纸数字印刷机是可容纳更大的新闻片尺寸（而这样做是竞争的头部与胶印单张纸印刷机的头）。另外，卷筒纸喷墨印刷机来使用报纸和书籍。数字设备的更大，更快，更好，越相媲美或超过平版胶印质量。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;所以我们在这里。这是一个激动人心的时刻。下一个优盘礼品包装盒将在六月2016在德国举行。谁知道会显示（甚至一些新的3D打印机）。&lt;/span&gt;&lt;/p&gt;','','','',2,1,4294967295,'',0,'','',0,2147443200,''),(33,2,'巧克力礼品包装盒图片','&lt;p&gt;\r\n	巧克力礼品包装盒包括张贴在印书，包装盒印刷，数字印刷，大幅面打印，杂志印刷，胶印等。我和我的未婚妻装了这本周的图片巧克力礼品包装盒。&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;几年前，在印刷另一个巧克力礼品包装盒，我以为我看到了一切，当我打开沉重的牌盒只看见一袋标有“砖”（他们是一个懒惰的苏珊式旋转展示架。镇流器）但是巧克力礼品包装盒真的把巧克力装进去了。&lt;/span&gt; &lt;/p&gt;&lt;p&gt;\r\n	有趣的是，在巧克力的汇编指令出现在四页的指导手册。文本显示究竟如何扭转他们使他们看起来像是一个博爱的人。让他们在的地方，每个可以有两条双面胶带。巧克力礼品包装盒图片显示在哪里放在“草地”这部分。&lt;/p&gt;&lt;p&gt;\r\n	这是如何相关的自定义印刷？你可能会问，这涉及到巧克力礼品包装盒的商业印刷。我看到了两个非常直接的联系。&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;首先，如果你仔细看，你可以看到人造巧克力没有巧克力礼品包装盒。他们的纸板罐贴花是一个毫不起眼的巧克力。有人印装缸，每一个顶部和底部的图像与另一幅图像缠在两侧。自定义印刷厂商已经做了很多工作。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;\r\n	为什么纸板用于巧克力礼品包装盒的印刷？你也可以使用&lt;a href=&quot;/www.guaguayin.cn/yinshua/152.html&quot; target=&quot;_blank&quot;&gt;手提袋印刷&lt;/a&gt;，我不知道，但这里有一些关于巧克力礼品包装盒图片的想法。&lt;/p&gt;&lt;p&gt;\r\n	如果断裂或撕裂，巧克力可以有锯齿状边缘，可能引起事故。这电影工作室，设计师，和电影院越来越试图避免事故的人与堆头，特别是越来越多的物理材料在堆头，堆头成为更具互动性。&lt;/p&gt;&lt;p&gt;巧克力礼品包装盒的敏感的营销：也许设计师本大幅面印刷件要避免推动特别的巧克力（再为责任问题对于植入式广告）。也许工作室希望避免明确促进啤酒给未成年人谁会看到这，毕竟，纸板巧克力能与一个毫不起眼的标签贴在其表面能给人的印象是一个巧克力巧克力礼品包装盒可以不识别一个特定的巧克力或者包装盒图片的话。&lt;br/&gt; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;/p&gt;','','','',2,1,4294967295,'',0,'','',0,2147443200,''),(34,2,'中秋礼品包装盒设计印刷','&lt;p&gt;&lt;strong&gt;中秋礼品包装盒&lt;/strong&gt;的成本相当于创造一个礼品包装盒可以出纸板允许设计者在电影制片厂避免需要&lt;a href=&quot;http://www.guaguayin.cn/zixun/138.html&quot; target=&quot;_blank&quot;&gt;巧克力礼品包装盒&lt;/a&gt;的嘲笑。也许创造模拟巧克力的成本超过（可观，我会假设）模拟出一个纸管成本，印刷中秋礼品包装盒标签四种颜色印花纸，然后，使用热熔胶，贴上贴花在两侧，顶部，和中秋&lt;a href=&quot;http://www.guaguayin.cn/&quot; target=&quot;_blank&quot;&gt;礼品包装盒&lt;/a&gt;（公司送员工的中秋礼品在全国大部分，大概）。&lt;/p&gt;&lt;p&gt;\r\n	什么是你的大幅面中秋礼品包装盒？&lt;/p&gt;&lt;p&gt;\r\n	我们从中学到什么？首先，考虑多个自定义中秋礼品包装盒印刷选项和你的大幅面打印工作的各种材料。成本是一个因素。副本你需要产生以及特定材料的可访问性是两个更多的考虑数。跟你的商业印刷供应商早期。事实上，该项目更古怪，你越早开始制作大幅面中秋礼品包装盒实物模型，你越早应该涉及印刷供应商。&lt;/p&gt;&lt;p&gt;\r\n	同时考虑航运物流中秋礼品包装盒，当你创造的东西容易粉碎为三罐啤酒，你需要考虑航运物流。这家公司的所有中秋礼品插入一个额外的纸箱纸盒内主要包含这。不这样做可能会损害了很多工作，浪费了很多钱。所以不要只设计了一个大幅面打印件。也想想你将如何得到它到它的目的地安装。&lt;/p&gt;&lt;p&gt;\r\n	另外，我想让你知道这些看上去多么真实。中秋礼品包装盒的生产经理走进房间，我们使用的是组装的中秋礼品包装盒，看厌恶的时候，他指着啤酒罐，问道：“那是什么？“很显然，他以为我们是在公司送员工的中秋礼品包装盒。&lt;/p&gt;','','','',2,1,4294967295,'',0,'','',0,2147443200,''),(35,2,'创意白酒礼品包装盒设计图','&lt;p&gt;\r\n	创意白酒礼品包装盒用于油墨技术包含异常大小几十纳米小颗粒颜料。（要知道，人的头发大约是100000纳米宽。）因为这些创意白酒&lt;a href=&quot;http://www.baozhuang100.net&quot; target=&quot;_blank&quot;&gt;礼品包装&lt;/a&gt;颗粒吸收光这么好，他们提供的图像质量没有见过的数字和胶印印刷定制。创意白酒礼品包装盒进程提供脆，非常均匀的网点，高光泽光泽，和无与伦比的CMYK色域。&lt;/p&gt;&lt;p&gt;\r\n	但有更多的耐久性：创意白酒礼品包装盒生产过程产生一个非常耐用，耐磨的油墨表面。&lt;/p&gt;&lt;p&gt;\r\n	不同的印刷基材，不像许多其他的数字商业印刷过程中，油墨技术允许印刷的涂布和未涂布新闻片，回收纸箱的股票，新闻纸和塑料包装薄膜。预处理的基板与一个特殊的涂层是不必要的，没有印刷后的干燥过程是必要的。&lt;/p&gt;&lt;p&gt;节约成本：墨膜厚度（约500纳米）约一半厚度可比膜的胶印油墨。这大大降低了招聘成本的墨水。结合了预处理成本和干燥后成本的消除，墨水储蓄将总计达大幅降低成本每页。&lt;/p&gt;&lt;p&gt;\r\n	环保工艺：墨水少效益的环境。此外，水性过程也比现有技术更加环保和节能，由于减少耗材的综合效益和提高印刷速度。同时，创意白酒礼品包装盒设计是远小于其他数码印刷和胶印相比微不足道。&lt;/p&gt;&lt;p&gt;\r\n	创意白酒礼品包装印刷机不仅仅是小而快的。他们也在他们的配置变化。这些商业印刷机可以使用高达八的油墨的颜色可以产生600或1200 DPI的打印输出。&lt;/p&gt;','','','',2,1,4294967295,'',0,'','',0,2147443200,''),(36,2,'虫草礼品包装盒批发','&lt;p&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;大量的&lt;strong&gt;虫草礼品包装盒批发&lt;/strong&gt;，都会反映在生产中，远离纸板组合向现实世界的对象。在过去的一个月中，&lt;a href=&quot;/zixun/139.html&quot; target=&quot;_blank&quot;&gt;中秋礼品包装盒&lt;/a&gt;已经是潮流，我已经组装一牌用金属街标志杆固定在基础上模拟草。我还组建了两个织物覆盖的椅子印刷流程。&lt;br/&gt;任何看起来真实印刷虫草礼品包装盒的兴趣，吸引他们进入印刷的真实厂家。我认为它的强大互联网营销。我也认为这是迷人的，这是当时计算机技术包括虚拟现实和增强现实的发生。&lt;br/&gt;有空间自定义印刷是工业4.0时代的缩影，似乎。然而，使胶印和数字印刷的可行的替代品，完全电子化的媒体，它有助于减轻打印触觉特质。毕竟，你不能碰任何东西在电脑屏幕上。&lt;br/&gt;张贴在包装盒印刷，大幅面印刷产品，纸和整理，&lt;a href=&quot;/yinshua/96.html&quot; target=&quot;_blank&quot;&gt;海报印刷&lt;/a&gt;等都是为了虫草礼品包装盒批发更优惠。我么你也一次次的重新定义。&lt;br/&gt;&lt;/p&gt;&lt;p&gt;\r\n	定制印刷：印刷过程中油墨技术，突破！最近我一直在阅读有关突破自动包装过程将在几天公布，被称为“世界上最大的贸易博览会，印刷和媒体行业。”&lt;/p&gt;&lt;p&gt;这个过程被称为™油墨技术，它已经引发了相当大的兴趣和热情，因为它的创造者，&lt;a href target=&quot;_blank&quot;&gt;呱呱印&lt;/a&gt;还推出了靛蓝数字印刷机在1993回。&lt;br/&gt;为什么虫草礼品包装盒，它是如此特别？&lt;br/&gt;油墨技术将针对商业印刷，包装，和其技术的出版市场，这与质量和纸张高速数字印刷定制的变量数据管理相结合的一个显着较低的成本比现有方案可以提供的虫草礼品包装盒批发。&lt;br/&gt; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;/p&gt;','','','',2,1,4294967295,'',0,'','',0,2147443200,''),(37,2,'专业定制设计水果包装盒','&lt;p&gt;&lt;strong&gt;定制设计水果包装盒&lt;/strong&gt;还来在印刷厂将完善单张版本，所以在任何情况下，印刷机可以印刷双方印刷纸的同时。他们快速的单张纸印刷机运行在11000张/小时，而卷筒纸印刷机运行在高达200米/分钟。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	什么样的自定义印刷工作将受益于定制设计水果包装盒？&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;由于各种定制设计水果包装盒的配置（例如，单张纸和网络），油墨技术应该进入所有区域的自定义包装印刷，特别是一般的商业工作，书和杂志，直接邮件，水果礼品包装盒纸箱印刷、软包装、和标签。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;由于颜色的保真度，油墨技术都应该适合这种审美要求的工作作为食品和水果包装盒营销和&lt;a href=&quot;/zixun/138.html&quot; target=&quot;_blank&quot;&gt;巧克力礼品包装盒&lt;/a&gt;的推广。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;为什么定制水果包装盒的油墨技术是重要的？&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;原因之一是电子和社交媒体已经站稳脚跟是价格。中秋礼品包装盒的费用几乎没有复制发行一本电子书相对于纸质书的成本。一个新的进程，如油墨技术，提高印刷效率和质量的同时降低成本有很大的希望。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;第二个原因电子书已经站稳脚跟是其进入市场的速度。定制设计水果包装盒能够更好地竞争与数字媒体，因为这些定制印刷的快。&lt;/span&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;由于油墨技术是一种数字喷墨过程，海德堡印刷机可以产生无限可变的打印纸，用于印刷产品的大规模定制设计水果包装盒。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;为什么我相信我一直在阅读有关油墨技术，简短的回答是靛蓝。我发现没有更好的数字印刷机。作为一个印刷经纪人，我把我的越来越多的客户工作商业印刷靛蓝设备供应商。毫无疑问，靛蓝的对手胶印的色彩保真度。如果&lt;a href target=&quot;_blank&quot;&gt;呱呱印&lt;/a&gt;创造的靛蓝，我迫不及待地想看到呱呱印将如何改变定制商务印刷产业。&lt;/span&gt;&lt;/p&gt;','','','',2,1,4294967295,'',0,'','',0,2147443200,''),(38,2,'透明礼品包装盒厂家哪家好','&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	张贴在印书，透明礼品包装盒印刷，数字印刷，杂志印刷，自定义打印：将&lt;strong&gt;透明礼品包装盒&lt;/strong&gt;的产品包装流程，几十年来，透明礼品包装盒一直是劳动密集型、材料密集、时间密集、印后加工工艺。商业透明礼品包装盒不得不等待外部供应商创建切割模具，然后建立和操作印刷或模切机完成切割工作。即使是模具制造商不得不储存原材料–木材，金属，并随着成品仓库橡胶–死自己，这是保持未来的工作。因此，模具制造商必须承担额外的仓储费用、保险费用、库存费用等。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	但这是改变。一个由两个前透明礼品包装盒员工成立的新公司带来了模切工艺进入数字时代。&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;不像一个漂亮的自定义透明礼品包装盒的工作，一个好的包装工作是无形的，或至少不注意自己。如果你看到创意白酒礼品包装盒制作结果，那就出事了。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;但你真的看到结果的每一天。口袋文件夹后有透明礼品包装盒已印刷的纸张是模切。每一个产品包装在食品杂货店、百货店、药品店也有定制印刷包装完成工作后。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;模切的加工过程（即，一个过程的自定义包装印刷运行），新闻片未使用的部分砍去，丢弃。这是所谓的“转换部分，“把平压片放进一个包装盒印刷里。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;例如，一个纸箱中含有四的黄油是一个平压表包含许多纸盒印刷影像并排通过商业包装机。在凸版印刷，模切规则嵌入金属片木把新闻片扁但未组装的包装盒印刷一样千篇一律的排骨揉成饼干。这些箱子可以折叠、粘合、组装到成品包装（即转换为透明礼品包装盒）。&lt;/span&gt;&lt;/p&gt;','','','',2,1,4294967295,'',0,'','',0,2147443200,''),(39,2,'鸡蛋卷礼品包装盒图片','&lt;p&gt;\r\n	鸡蛋卷礼品包装盒是一个巨大的市场。几乎所有的在所有的商店你经常看到你需要的某种产品的包装，通常包括某种包装纸或纸板。在这个包装定制印刷涉及品牌等营销设计工作，希望把顾客转化为买家。所以简单来说，包装和包装影响购买，因此是一个庞大而利润丰厚的市场。&lt;/p&gt;&lt;p&gt;\r\n	但鸡蛋卷礼品包装盒市场也细分。越来越多的营销他们的产品设计注重购买大众更小的部分。这意味着更多的自定义印刷包装运行还小的印刷过程和运行成。这是有问题的，因为包装盒的传统方法涉及时间，鸡蛋卷礼品包装盒实际上做包装盒涉及时间，做包装本身涉及的时间。这是一个劳动密集型、时间密集、材料密集型的过程。&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;但是如果你可以用激光切割的&lt;a href=&quot;/zixun/138.html&quot; target=&quot;_blank&quot;&gt;巧克力礼品包装盒&lt;/a&gt;纸箱包装吗？&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;“用”是一个术语，用来描述基于激光切割。激光器的评分和切割，然后变成了产品包装，新闻纸口袋文件夹，或任何其他以前开发的产品。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;一旦鸡蛋卷礼品包装盒的结构已被证实，它将需要确定其装饰。这本书的打印机将打印的四色油墨加上PMS在光泽印刷文本表，将叠&lt;a href target=&quot;_blank&quot;&gt;包装盒印刷&lt;/a&gt;的白色/棕色的“电子”结构（前、后面，和侧面）。的电子结构是基本的瓦楞纸板印刷新闻纸覆盖，所以它会轻，耐用，灵活。打印机也会添加水性涂料的鸡蛋卷礼品包装盒印刷来保护他们，一旦印刷和层压完成后，打印机的分包商（盒转换器）将制作成成品箱。这些鸡蛋卷礼品包装盒印刷，打印机会将十二本书在收缩包装每盒装然后纸箱包装它交付。&lt;/span&gt;&lt;/p&gt;','','','',2,1,4294967295,'',0,'','',0,2147443200,''),(40,2,'食品礼品包装盒设计','&lt;p&gt;\r\n	外面的&lt;strong&gt;食品礼品包装盒&lt;/strong&gt;印刷是哑光黑（可能是一个双重打击黑加暗紫外涂料或清漆）。黑色金属箔切割模具应用热量和压力，包括文本的设计与美的话。均匀度和黑色光泽，热冲压的话建议他们用箔而不是墨水。类似的效果，可以产生光泽UV涂层磨砂黑色墨水，但对比的强度让我觉得这是烫印箔。&lt;/p&gt;&lt;p&gt;\r\n	两名前海德堡员工已经成立了一家名为食品礼品包装盒设计的数字评分和切割机，采用数字数据从设计工作站绘制数字达林（将在新闻片切割图案）在转鼓。图像在滚筒驱动激光切割掉新闻片未使用的部分准备空白然后可以粘成的纸箱都没有死。&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;数字模切是一个潜在的巨大的发展，因为它不需要木材，金属和橡胶库存，死的传统了。它也释放更少的二氧化碳到大气中，不使用木（轻重要考虑增加政府监管）。这个过程需要更少的运营商，最小的准备（几分钟而不是几小时内），不存储模。因此，短期运行是可能的（甚至一个原型）。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;这是一个很好的商业意识，从产品的食品礼品包装盒可以准备市场更快，因为&lt;a href target=&quot;_blank&quot;&gt;印刷公司&lt;/a&gt;可以产生更多的目标更集中的方式更多的市场资金较少的包装品种。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;新机器之称的食品礼品包装盒设计。它可以在经济上的得分和/或削减任何地方从一项到10000项。&lt;/span&gt;&lt;/p&gt;','','','',2,1,4294967295,'',0,'','',0,2147443200,''),(41,2,'江苏南京印刷厂给你印刷最低价','&lt;p&gt;\r\n	在&lt;strong&gt;南京印刷厂&lt;/strong&gt;印刷的地方，海德堡这些都是印刷机器的宝，在偏移的重量级人物自定义打印，这些公司已扩大其胶印选择产品的包装，如在常州和苏州其他地方。&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;例如，一个特定的新闻，海德堡速霸XL 105-8 + llylx3提供印刷机八台、涂布单元，以及UV油墨印刷能力。它允许在线印刷枯燥和光泽清漆的效果，和不透明的白色，金属油墨的使用，和底物如铝涂布纸板。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;\r\n	这是为什么&lt;a href target=&quot;_blank&quot;&gt;南京印刷厂&lt;/a&gt;有这么低的印刷价格呢？&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;与其他商业印刷领域，包装面临的成本、质量、和转向压力。可以打印多个设计效果在加快制造过程和控制成本。越来越多的，如金属箔印刷可以有效地制造如此抢眼的效果，让包装真正站在了商店的货架上。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;冲压自动化提高了准备时间，减少浪费，提高整体效率。例如，海德堡速霸XL 105-8 + llylx3包括自动化桩改变在馈线和传递新闻结束。它是越来越有可能提供醒目的包装更快更经济。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;许多这些包装机的混合，南京印刷厂包括胶印和喷墨的能力。这意味着变量的数据可以在新闻添加运行，而不是在一个单独的通。南京印刷厂可以使用这样的功能添加QR码，条形码，和其他变量的数据，或用于错误检测。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;闭环，电眼装置不断监控彩色密度的新闻，南京印刷厂作出调整以匹配预设颜色数据。这将导致更快的吞吐量和减少浪费，以及改进的色彩保真度。印刷&lt;/span&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;机必包括自动化进程同步。例如，41“必达印刷机可以同时按下自动洗毛毯，自动改变印版滚筒，滚筒。再次，速度转化为节约成本和提高周转时间。&lt;/span&gt;&lt;/p&gt;','','','',2,1,4294967295,'',0,'','',0,2147443200,''),(42,2,'南京印刷书籍大概多少钱','&lt;p&gt;\r\n	多个工作流导向而不是技术导向的趋势包括集成的媒体宣传；未来印刷书籍，报纸印刷，和杂志印刷对话营销；包装。&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;在全球层面上，这意味着什么？&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;南京印刷书&lt;/strong&gt;必须与数字媒体的竞争。电子书正在创造越来越大的足迹。许多报纸都将员工为他们的数字和印刷版和印刷版的频率降低到一周几个问题。&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;然而，南京印刷书（胶印和数字）可以做数字媒体不能的事情。纹理UV涂层（软触摸和砂纸）表明，数字媒体不能提供触觉经验。这仍然是很重要的，在某种程度上，对于一些印刷产品，对绝大多数人来说，南京印刷书大概多少钱不是问题。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;南京印刷书买家要求更快的周转，更多的定制工作。设备提供胶印和数字能力能适应短，可变数据的工作期限很紧。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;买家，在一般情况下，不接受“谈论”广告。越来越多的广告主发展与买家互动的方式，通过集成推广工作涉及数字和胶印以及各种形式的社交媒体。研究开始反映跨媒体计划的协同性。例如，一个直销和QR码和流苏的结合可以产生比一个只打印或电子邮件广告的主动性更高的响应率。客户希望供应商能与他们互动。南京印刷书籍、综合媒体服务这个目的。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;包装是不会消失，&lt;a href=&quot;/zixun/146.html&quot; target=&quot;_blank&quot;&gt;江苏南京印刷厂&lt;/a&gt;也不会的。当我们进入一家杂货店或计算机存储、包装有助于产品的销售力。就是说，能够创造一个盒子或1000正变得越来越重要，因此数字定制印刷技术已经进入包装工作。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;数字印刷一般来说似乎是未来的浪潮。许多高端单张纸数字印刷机是可容纳更大的新闻片尺寸（而这样做是竞争的头部与胶印单张纸印刷机的头）。另外，卷筒纸喷墨印刷机来使用报纸和书籍。数字设备的更大，更快，更好，越相媲美或超过平版胶印质量。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;所以我们在这里。南京印刷书这是一个激动人心的时刻。下一个德鲁巴将在六月2016在德国举行。谁知道会显示（甚至一些新的3D打印机）。张贴在印书，包装盒印刷，数字印刷，大幅面打印，杂志印刷，胶印，印前，南京印刷书大概多少钱应该知道答案了。&lt;/span&gt;&lt;/p&gt;','','','',2,1,4294967295,'',0,'','',0,2147443200,''),(43,2,'南京印刷公司的啤酒标签印刷','&lt;p&gt;\r\n	我和我的未婚妻装了这本周的电影，它与三或四罐啤酒，想到了南京印刷公司如何做&lt;strong&gt;啤酒标签印刷&lt;/strong&gt;这件事以及啤酒标签印刷哪家好？&lt;/p&gt;&lt;p&gt;\r\n	几年前，在安装另一个牌，我以为我看到了一切，当我打开沉重的牌盒只看见一袋标有“砖”（他们是一个懒惰的苏珊式旋转展示架。镇流器）但是啤酒罐真的把蛋糕。&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;有趣的是，在啤酒罐的汇编指令出现在四页的指导手册。文本显示究竟如何扭转他们使他们看起来像是一个博爱的人。让他们在的地方，每个可以有两条双面胶带。教学印刷书显示在哪里放在“草地”这部分。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;你可能会问，这涉及啤酒标签商业印刷。我看到了两个非常直接的联系。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;首先，如果你仔细看，你可以看到人造啤酒罐没有金属。他们的纸板罐贴花是一个毫不起眼的啤酒标签。有人印装缸，每一个顶部和底部的图像与另一幅图像缠在两侧。&lt;a href target=&quot;_blank&quot;&gt;南京印刷公司&lt;/a&gt;已经做了很多工作。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;为什么纸板和金属？我不知道，但这里有关于啤酒标签印刷的一些想法：&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;如果断裂或撕裂，铝啤酒可以有锯齿状边缘，可能引起事故。这电影工作室，设计师，和电影院越来越试图避免事故的人与堆头，特别是越来越多的物理材料在堆头，堆头成为更具互动性。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;啤酒标签敏感的营销，也许设计师本大幅面打印件要避免推动特别的啤酒（再为责任问题对于植入式广告）。也许工作室希望避免明确促进啤酒给未成年人谁会看到这（毕竟，纸板啤酒标签能与一个毫不起眼的标签贴在其表面能给人的印象是一个啤酒可以不识别一个特定的啤酒或者啤酒的话）。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;\r\n	创造一个假啤酒可以出纸板允许设计者在电影制片厂避免需要铝啤酒罐的嘲笑。也许创造模拟铝罐的成本超过（可观，我会假设）模拟出一个纸管成本，印刷啤酒标签四种颜色80 #或100 #搪瓷印花纸，然后，使用热熔胶，贴上贴花在两侧，顶部，和每牌三罐底（乘以影院在全国大部分，大概）。&lt;/p&gt;','','','',2,1,4294967295,'',0,'','',0,2147443200,''),(44,2,'啤酒包装盒设计如何做好','&lt;p&gt;我们从&lt;strong&gt;啤酒包装盒设计&lt;/strong&gt;中学到什么？首先，考虑多个包装厂选项和你的大幅面印刷工作的各种材料。成本是一个因素。副本你需要产生以及特定材料的可访问性是两个更多的考虑数。跟你的商业印刷供应商早期。事实上，该项目更古怪，你越早开始制作大幅面啤酒包装盒设计实物模型，你越早应该涉及印刷公司供应商。&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;同时，啤酒包装盒要考虑航运物流。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	当你创造的东西容易粉碎为三罐啤酒，你需要考虑航运物流。这家公司的所有三罐插入一个额外的纸箱纸盒内主要包含这。不这样做可能会损害了很多工作，浪费了很多钱。所以不要只设计了啤酒包装盒。也想想你将如何得到它到它的目的地安装。&lt;/p&gt;&lt;p&gt;另外，我想让你知道这些看上去多么真实。电影院的经理走进房间，我们使用的是组装的啤酒标签印刷，看厌恶的时候，他指着啤酒罐的啤酒包装盒，问道：“那是什么？“很显然，他以为我们是在上班时间喝酒。&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;大幅面啤酒包装盒设计，反映在电影堆头，远离纸板组合向现实世界的对象。在过去的一个月中，我已经组装一牌用金属街标志杆固定在基础上模拟草。我还组建了两个织物覆盖的椅子拍照堆头。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;任何看起来真实拍摄的电影观众的兴趣，吸引他们进入电影的虚构世界（和电影牌）。我认为它的强大营销。我也认为这是迷人的，这是当时计算机技术包括虚拟现实和增强现实的发生。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;啤酒包装盒设计水平有高低，似乎。然而，使胶印和数字印刷的可行的替代品，完全电子化的媒体，它有助于减轻打印触觉特质。毕竟，你不能碰任何东西在电脑屏幕上。&lt;br/&gt; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;/p&gt;','','','',2,1,4294967295,'',0,'','',0,2147443200,''),(45,2,'南京印刷机械制造代理','&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	印刷机不仅仅是小而快的。他们也在他们的配置变化。这些商业印刷机可以使用高达八的油墨的颜色可以产生600或1200 DPI的打印输出。&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;&lt;strong&gt;南京印刷机械制造&lt;/strong&gt;还来在Web和完善单张版本，所以在任何情况下，&lt;a href=&quot;/&quot; target=&quot;_blank&quot;&gt;印刷厂&lt;/a&gt;可以印刷双方印刷纸的同时。他们快速的单张纸印刷机运行在11000张/小时，而卷筒纸印刷机运行在高达200米/分钟（650英尺/分钟）。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	什么样的南京印刷机械制造工作将受益？&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;由于各种媒体的配置（例如，单张纸和网络），油墨技术应该进入所有区域的自定义打印，特别是一般的商业工作，书和杂志，直接邮件，纸箱印刷、软包装、和标签。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;由于颜色的保真度，油墨技术都应该适合这种审美要求的工作作为食品和化妆品营销。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;为什么油墨技术是重要的？&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;原因之一是电子和社交媒体已经站稳脚跟是价格。它的费用几乎没有复制发行一本电子书相对于纸质书的成本。一个新的进程，如油墨技术，提高印刷效率和质量的同时降低成本有很大的希望。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;第二个原因电子书已经站稳脚跟是其进入市场的速度。南京印刷机械能够更好地竞争与数字媒体，因为这些定制印刷的快。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;由于油墨技术是一种数字喷墨过程，南京印刷机械制造可以产生无限可变的打印纸，用于印刷产品的大规模定制。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;为什么我相信我一直在阅读有关南京印刷机械制造的油墨技术？&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;简短的回答是靛蓝。我发现没有更好的数字印刷机。作为一个印刷经纪人，我把我的越来越多的客户工作商业印刷靛蓝设备供应商。毫无疑问，靛蓝的对手胶印的色彩保真度。如果南京印刷机创造的靛蓝，我迫不及待地想看到南京印刷厂将如何改变定制印刷业。&lt;/span&gt;&lt;/p&gt;','','','',2,1,4294967295,'',0,'','',0,2147443200,''),(46,2,'南京印刷包装厂的数字模切产品包装流程','&lt;p&gt;\r\n	几十年来，模切一直是劳动密集型、材料密集、时间密集、印后加工工艺。商业印刷机不得不等待外部供应商创建切割模具，然后建立和操作印刷或模切机完成切割工作。即使&lt;strong&gt;南京印刷包装厂&lt;/strong&gt;是模具制造商不得不储存原材料–木材，金属，并随着成品仓库橡胶–死自己，这是保持未来的工作。因此，模具制造商必须承担额外的仓储费用、保险费用、库存费用等。&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;但这是改变。一个由两个前HP Indigo员工成立的新&lt;a href=&quot;/&quot; target=&quot;_blank&quot;&gt;画册印刷&lt;/a&gt;公司带来了模切工艺进入数字时代。&lt;/span&gt; &lt;/p&gt;&lt;p&gt;\r\n	首先，什么是模切？&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;不像一个漂亮的南京印刷包装厂的工作，一个好的模切工作是无形的，或至少不注意自己。如果你看到结果，出事了。&lt;/span&gt; &lt;/p&gt;&lt;p&gt;\r\n	但你真的看到结果的每一天。口袋文件夹后有商业打印机已打印的纸张是模切。每一个产品包装在食品包装盒杂货店、百货店、药品店也有定制印刷模切完成工作后。&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;模切的加工过程（即，一个过程的自定义打印运行），新闻片未使用的部分砍去，丢弃。这是所谓的“转换部分，“把平压片放进一个盒子里。&lt;/span&gt; &lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;例如，一个纸箱中含有四的黄油是一个平压表包含许多纸盒印刷影像并排通过商业打印机。在凸版印刷，模切规则嵌入金属片木把新闻片扁但未组装的盒子一样千篇一律的排骨揉成饼干。这些箱子可以折叠、粘合、组装到成品包装（即转换）。&lt;/span&gt; &lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;包装市场巨大但分段。&lt;/span&gt; &lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;产品包装是一个巨大的市场。几乎所有的在所有的商店你经常看到你需要的某种产品的包装，通常包括某种模切纸或纸板。在这个包装定制印刷涉及品牌等营销设计工作，希望把顾客转化为买家。所以简单来说，包装和包装影响购买，因此南京印刷包装是一个庞大而利润丰厚的市场。&lt;/span&gt; &lt;/p&gt;','','','',2,1,4294967295,'',0,'','',0,2147443200,''),(47,2,'南京印刷包装盒“盒印刷”类别档案','&lt;p&gt;\r\n	一商业印刷我的客户刚刚收到她的工作，其中包括十二个短，骑马装订印刷书在盒子里。本书是6“x 9”四色封面格式，它们适合在滑盒是四色机板叠层瓦楞纸板。&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;我问我的客户如何工作看起来当样品到达，她表示书但对于稍微偏离中心的艺术盒子上遗憾的快乐。她收到了一个样品的工作。&lt;strong&gt;南京印刷包装盒&lt;/strong&gt;已经寄出所有其他集合到地址数据库列表我的客户提供了。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;\r\n	几件事情打扰我比不满的客户。所以我问她送我的盒子展示艺术中心照片。然后我把这些对商业印刷厂商所做的工作。&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;（首先，我向我的客户的照片而不是南京印刷&lt;a href target=&quot;_blank&quot;&gt;包装盒&lt;/a&gt;本身，这样我就可以立即与打印机通信。拿起盒子要花时间。发送盒打印机会采取额外的时间。请求的照片作为电子邮件附件是更直接的。）&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;一个描述波纹滑的情况，也是南京印刷包装盒的拿手好戏。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;给你一些背景下，滑移的情况下已经有三英寸宽以容纳十二短的印刷书籍。在它的后面是一个完整的9高，但这个向下倾斜在前面约6”提供易于访问的书。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;在南京印刷包装盒的两侧前端的文字和照片里促进书刊印刷书回来（从大文本的个别章节）。我可以看到，包括不完全集中，稍微倾斜的背景上的PMS颜色。在前面滑盒我的客户包括，该系列的标题；一个列表的分离，结合部分包括；和公司标志（全反式）。本中心的列表的垂直轴没有正集中在盒面板，和所有类型的稍倾斜以及。&lt;/span&gt;&lt;/p&gt;','','','',2,1,4294967295,'',0,'','',0,2147443200,''),(48,2,'南京印刷厂业务员、经理招聘','&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	印前经理（3名）&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	职位要求：&lt;/p&gt;&lt;p&gt;1、负责梳理&lt;em&gt;南京印刷厂&lt;/em&gt;印前工作各个岗位，建立标准作业流程，培新新员工；&lt;br/&gt;2、统筹公司投产后的印前制作工作；&lt;br/&gt;3、与合作工厂的印刷做对接，做好质量控制计划及流程；&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	4、协助公司系统开发人员开发、测试印前处理流程。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	您的特质：&lt;/p&gt;&lt;p&gt;1、大专以上学历，具备良好的普通话水平，5年以上大型印刷企业工作经验和3年以上CTP部门管理经验；&lt;br/&gt;2、熟悉印刷工艺、书刊，彩盒工艺；&lt;br/&gt;3、精通CTP制作及印刷厂前后的工作流程，数码打样、CIP3、色彩管理软件及相关测量仪器﹑印刷流程管理软件﹑熟练使用电脑排版及拼大版软件，懂矫色工作；&lt;br/&gt;4、有良好的部门建设与管理能力，较强的统筹规划能力，擅长沟通协调。&lt;br/&gt;&lt;/p&gt;','','','',2,1,4294967295,'',0,'','',0,2147443200,''),(49,2,'南京印刷单色机领机招聘','&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	领机招聘岗位职责：&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	1、根据客户需求，提供相应的印刷标准和解决方案，能做印刷厂业务员经理招聘的事情；&lt;/p&gt;&lt;p&gt;2、确定符合要求的油墨、纸张等印刷工艺原料；&lt;br/&gt;3、跟踪印刷订单的生产和制作，协调各环节的工作；&lt;br/&gt;任职资格：&lt;br/&gt;印刷或相关专业专科以上学历；&lt;br/&gt;精通印刷工艺及流程，熟悉印前设计软件及流程；&lt;br/&gt;敬业精神及团队精神，较强的协调能力、沟通能力和承压能力。&lt;br/&gt; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;/p&gt;','','','',2,1,4294967295,'',0,'','',0,2147443200,''),(50,2,'南京印刷师傅招聘信息','&lt;p&gt;\r\n	海德堡四色印刷机副手，要有较强的责任心，能吃苦耐劳 任职资格：有3年以上工作经验工作时间。&lt;/p&gt;&lt;p&gt;\r\n	本次招聘为&lt;strong&gt;南京印刷师傅招聘&lt;/strong&gt;直聘，全程不收取任何费用！&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;面试合格者立即上岗，凡有意者均可电话联系、预约面试时间！&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;一、工作岗位：从印刷辅助工、装订工做起，做为技术人员培养，工厂基层领导储备。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;男，年龄1‌‌8---35周岁，中专及以上学历，身体健全。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;&lt;a href=&quot;/zixun/154.html&quot; target=&quot;_blank&quot;&gt;南京印刷厂业务员、经理招聘&lt;/a&gt;岗位职责：1、按时完成指令单下达的生产任务；2、保证机器的正常运转，负责电脑控制台的操作；3、按要求校核产品烫金位置；4、按纸盒烫金质量标准检查烫印精度，确保烫印质量及数量。任职资格：1、大专以上学历，数控或机械相关专业；2、熟悉烫金工艺过程并能熟练操作；3、有上进心，工作积极、踏实，具有一定的领导协调能力。特别提醒：由于简历筛选比较繁琐，本公司暂不接收简历，请直接在本公司招聘页面右下方的在线人事助理进行对话或留言（电话+姓名+学历+专业+年龄），公司会第一时间与您联系！注意：更多福利待遇面试过程可详细了解以公司最新政策为准，达内集团竭诚欢迎您加入！&lt;/span&gt;&lt;/p&gt;','','','',2,1,4294967295,'',0,'','',0,2147443200,''),(51,2,'南京印刷厂家栖霞区印刷彩盒的挑战','&lt;p&gt;\r\n	当然，一些盒子–也许最盒–接近完美，特别是在盒的删除问题的滑移情况。不幸的是，&lt;strong&gt;南京栖霞区印刷厂家&lt;/strong&gt;的客户的样品是不完美的。但正如我可以看到印刷地图恶化为褶皱的众多放大放置任何错误的错误，我可以看到我的打印机的点。但如果我没有多年来开发这样一个长期的与他的关系，我（和我的客户）可能没有回应他这样的信念。&lt;/p&gt;&lt;p&gt;\r\n	你可以从这一个案研究学习什么？&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;对于复杂的工作，完全信任你的工作。如果出了什么事，他会诚实地告诉你什么是打印机的故障，什么是可接受的，或在公差范围内，对于特定的商业&lt;a href=&quot;/yinshua/152.html&quot; target=&quot;_blank&quot;&gt;手提袋印刷&lt;/a&gt;和整理工作。&lt;/span&gt; &lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;期待&lt;a href=&quot;http://www.guaguayin.cn&quot; target=&quot;_blank&quot;&gt;包装盒&lt;/a&gt;印刷到不是完美的，由于个体数量的步骤的过程中，会放大缺陷。南京栖霞区印刷厂家设计你的印刷产品从而减少任何偏差的影响。&lt;/span&gt; &lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;南京栖霞区印刷厂家准备一套教材的艺术。这组由四个原印刷书籍三每个副本放置在一个瓦楞盒套。是什么让这个特别有趣的是，我的客户和我都不生产盒子的每一天。因此这是一个新颖和挑战。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;为了确保成功，有一些事情要考虑，一些规格确认，并注意彩盒一些物理特性。如果你还生产盒装套印刷的书，你可能会找到有用的信息。&lt;/span&gt; &lt;/p&gt;&lt;p&gt;首先，该书本书是6“x 9”政府教育文章针对高中观众翻译。他们将48或52页（两本书每个长度）。盖将印上12pt，和书中的文本页面将印刷在白色不透明文本股票。一旦出版，该书将鞍缝合和插入盒和盒将收缩包装。&lt;br/&gt; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;/p&gt;','','','',2,1,4294967295,'',0,'','',0,2147443200,''),(52,2,'南京印刷包装企业营销如何做','&lt;p&gt;&lt;strong&gt;南京印刷包装企业&lt;/strong&gt;的印刷经营范围：企业画册样本、产品说明书、包装彩盒、彩页（DM）、海报、手提袋、吊牌、台历挂历印刷、笔记本、名片、不干胶标签、电脑打印纸、无碳复写联单、各类企业表单、信签、纸杯、丝印、UV、无尘纸等各种纸品印刷。 机器设备：海德堡四色、华光四色等 印刷后道：啤形、裁切、击突、压凹、轧痕、烫金、过胶、折页、装订、打孔、上浆、包装等。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	首先，文本和封面很厚，这将给一种物质对短书。更长的书，我会建议纸的厚度会使页面完全不透明的，并有从印刷书页一面反面不显示。&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;了解书的组成将有助于了解的盒套必要的规格。基本上，每箱包含三份各四册，占总数的十二，鞍缝合&lt;a href target=&quot;_blank&quot;&gt;印刷&lt;/a&gt;书籍。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;基于封面和文字材料厚度，以及书籍的数量每箱集书打印机建议我的客户一个2.5“宽的滑移的情况下创造艺术。这将允许为松散的书籍的小房间（因此容易从盒）。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;为了便于学生和教师都删除和替换框内的书，前面的盒子将只有5“高，和后面将满9”高度的书。这将保护书籍也让他们很容易从盒中去除，和宽度将允许所有十二本书舒舒服服地坐在盒套。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;就是说，这本书的南京印刷包装企业还计划将两箱和书一纸假以确保一切都将按计划。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;一旦箱体的结构已被证实，它将需要确定其装饰。这本书的打印机将打印的四色油墨加上PMS在70，光泽印刷文本表，将叠盒子的白色/棕色的“电子”结构（前、后面，和侧面）。电子结构是基本的瓦楞纸板印刷新闻纸覆盖，所以它会轻，耐用，灵活。打印机也会添加水性涂料的盒子来保护他们，一旦印刷和层压完成后，印刷机的分包商（盒转换器）将制作成成品箱。这些盒子，打印机会将十二本书在收缩包装每盒装然后纸箱包装它交付。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;注意事项：&lt;/span&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;一盒不仅仅是一个营销的声明。这是一个物理的产品，在其本身。它有一个功能，必须考虑。它必须包含和保护书籍，使他们易于拆卸和多次更换。因此，我很高兴地得知，南京印刷包装企业计划制造假货的整个设置有模具切割箱子的夹层的电子组装前。为了不做这危险的错误。使切割模具花费很多金钱和时间。如果有需要的尺寸错了，更换会妥协的计划及预算。&lt;/span&gt;&lt;/p&gt;','','','',2,1,4294967295,'',0,'','',0,2147443200,''),(53,2,'高档的牙膏纸箱包装设计欣赏','&lt;p&gt;\r\n	我的未婚妻，只带回家一个牙膏盒，我说，“哇。我想，“这是有效的营销。这是一个基于一个品牌即时债券深的本能反应。这之前，任何与产品互动。事实上我还没有尝试过的牙膏呢，尽管我知道它的味道会。&lt;/p&gt;&lt;p&gt;\r\n	有效的营销是有效的设计和有效的牙膏纸箱设计。这些都是积木，如果你愿意。他们的结合创造出“哇”的时刻。&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;牙膏盒设计，首先，让我描述&lt;strong&gt;牙膏盒纸箱&lt;/strong&gt;。瓦楞纸板折叠纸盒！&lt;/span&gt; &lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;这种印刷产品的技术术语是“折叠纸盒”因为它是平面印刷，然后折叠和粘到纸箱的牙膏。这种特殊的纸箱是由两个元素：一个印刷瓦楞纸箱（2“x 2”x 7“）折叠成一个长方体与纸板开槽和向外暴露，并与所有的槽斜放在盒尺寸。不像大多数的瓦楞纸板，这暴露了瓦楞纸纸箱。大多数波纹板夹在两平板纸板之间的凹槽。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;裹在瓦楞纸板纸箱印刷磨砂“套”，它涵盖了所有的四个边的瓦楞纸箱。然而，它的叶子约3 / 4“两边暴露，所以你可以看到内盒的对角槽。“包装”或“套”是印在泥土色调。&lt;/span&gt; &lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;在我看来，为牙膏纸盒&lt;a href=&quot;http://www.guaguayin.cn&quot; target=&quot;_blank&quot;&gt;包装盒&lt;/a&gt;的折叠提供了一个有机的“感觉”到的触觉槽盒（柔韧，其斜罗纹触摸粗糙一点）。我觉得有趣的是，牙膏纸箱包装盒的波纹内盒实现这种有机的感觉不是通过任何自定义打印但通过对槽纸，简单的颜色，纹理，和斜罗纹图案。&lt;/span&gt; &lt;/p&gt;','','','',2,1,4294967295,'',0,'','',0,2147443200,''),(54,2,'南京印刷单位如何使外印刷套筒加强','&lt;p&gt;\r\n	森林绿，米色，和锈褐色颜色偏移印在布纹板提供一个温和的和复杂的，但在同一时间，简单的和有机的，感觉。对于大多数复制Helvetica字体和标志相应的无衬线字体的脸（与字母之间的额外的跟踪）给当代但又简单而有序的看片。&lt;/p&gt;&lt;p&gt;\r\n	营销文案内容强化了主题。单词和短语，如“无谷，“无氟”、“有机”、“无氯，”、“正宗”地位这一特殊的牙膏产品谨慎、环保意识的消费者会购买。&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;&lt;em&gt;&lt;strong&gt;南京印刷单位&lt;/strong&gt;&lt;/em&gt;使用的材料印刷“绿色”的折叠纸盒复制突出指出，百分之80回收材料制成的牙膏纸箱和胶版印刷纸。此外，而不是使用基于&lt;a href=&quot;http://www.guaguayin.cn&quot; target=&quot;_blank&quot;&gt;印刷&lt;/a&gt;油墨石油、定制印刷供应商使用更环保大豆油墨。&lt;/span&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;所以简单的说，营销团队的字体确定促销副本，，配色方案，论文，&lt;a href=&quot;/zixun/152.html&quot; target=&quot;_blank&quot;&gt;南京印刷包装厂&lt;/a&gt;单位一起提出这个特殊的牙膏作为一个有机的，地球友好的选择清洁和美白牙齿。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;一个精明的营销设想理想的客户和他们的发现激起他的兴趣的方法。其中关键的方法是列表的属性，喜欢和不喜欢的，这个“虚拟”的人。在这种情况下，例如，理想的客户可能是25到40岁的一个愿望，保护环境，并希望同时避免化学添加剂使用健康美容产品。谁知道呢？也许他/她甚至喜欢皮划艇和攀岩的周末。也许他/她有一顶上的自行车架斯巴鲁。&lt;/span&gt; &lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;心中有了这个理想的买家，一个精明的营销人员再使用广告文案，字体，设计网格，纸的选择，和纸的纹理（的瓦楞纸板，在这种情况下，开槽）与潜在买家建立感情。如果营销人员可以使用自定义打印设计工具在他/她的处理引起买家感与品牌价值的联系，营销人员可以进行销售。&lt;/span&gt; &lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;因此这里的早餐麦片和酸奶，一杯拿铁咖啡冲下来，然后接着使用牙线和刷牙这个超级有机牙膏。&lt;/span&gt; &lt;/p&gt;','','','',2,1,4294967295,'',0,'','',0,2147443200,''),(55,2,'高档茶叶包装盒批发体现了艺术性和豪华','&lt;p&gt;\r\n	我想描述包装一拉直我的未婚妻刚买的。也许“喷一下”是一个更好的词，因为这盒子真的给我留下了深刻的印象在其设计。&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;这个盒子是在产品包装价值的地方卖奢侈品制造商。根据新闻运行的长度，我的猜测是，盒子可能花费几美元或更多生产每一单位。因为它包含了一个30元的专业美发工具，投入的金钱包装不总成本的一个微不足道的部分。&lt;/span&gt; &lt;/p&gt;&lt;p&gt;\r\n	高档茶叶包装盒批发要注意盒子的尺寸。&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;这个&lt;strong&gt;高档茶叶包装盒&lt;/strong&gt;批发是约3“高12”，6“深。铰链箱顶上前，和超出盒子的前盖扣在纸板上。仔细检查后，我看见两磁铁在印刷纸。&lt;/span&gt; &lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;高档茶叶包装盒的底部，背部，顶部和前面都是一片，延伸超出内盒。封面看起来就像是一面由打印机生产精装书。超厚胶的板建成，覆盖包括外压料已延伸到箱盖的内边。在大致相同的方式作为一个精装书的封面卷边纸覆盖的印刷书的，额外的压料盖的扁铁箱盖内侧，几乎延伸到了边缘的外部文件。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;盒子里面是一个成型的塑料托盘的陶瓷扁铁，头发拉直工具。托盘的可见的一面是像一个柔软的触感UV涂层。它是软的、模糊的，像一个桃子皮。&lt;/span&gt; &lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;内部新闻片、层压到封面纸，褶皱的翻边伸入盒印刷人造斑马条纹金属油墨。金属银墨衬托磨砂黑色背景。无论是油墨太厚了。&lt;/span&gt; &lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;起初，我认为这是一个样本自定义屏幕&lt;a href=&quot;http://www.guaguayin.cn&quot; target=&quot;_blank&quot;&gt;印刷&lt;/a&gt;。然而，我用放大镜看网点的黑墨下。在这一点上（不知道），我认为记者印制了黑色然后第二击中固体黑色增加黑色油墨密度屏幕。此外，我认为他会用银做的一样（可能是一个双重打击的墨）。&lt;/span&gt; &lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;最内层箱内部似乎略有斑驳，哑光黑色。我想这可能是柔性版印刷。&lt;/span&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;我还看到在枯燥的外部新闻片已经在高档茶叶包装盒的边缘，延伸一寸左右进入室内之前被粘平贴胶板组成的盒子。&lt;/span&gt; &lt;/p&gt;','','','',2,1,4294967295,'',0,'','',0,2147443200,''),(56,2,'吊牌印刷机械设备厂价格多少','&lt;p&gt;\r\n	在一个世界里胶印和数字印刷定制正在为数字通信媒体如电子书，在一个地方产品包装工作实际上是成长的过程。&lt;/p&gt;&lt;p&gt;\r\n	数字包装机的研究进展，直到最近，在包装上的数字印刷定制的主要焦点已经自定义标签。软包装在自定义标签印刷，胶印和柔印的选项包括。然而，这已经开始改变。&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;&lt;strong&gt;吊牌印刷&lt;/strong&gt;机械设备厂印刷展会突出了HP，将为折叠纸盒和软包装市场的理想。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;新闻的接受29.5″x 20.9”新闻片让运营商产生较大的印刷品或在新闻片施加更多的单位的能力。靛蓝的迭代已经接受了压片前接近12“x 18”。可容纳更大的新闻片将使HP Indigo的潜在竞争头对头对单张纸胶印机。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;在产品和包装的可持续性是一个决定性的因素，许多人在购买消费品。能力生产更环保的包装通过数字印刷定制是一大卖点，特别是在条款的减少浪费和提高生产力的数字印刷品质。&lt;/span&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;数据和图像，吊牌印刷机械设备的大规模定制已经成为必不可少的。新的、更大的格式的数字印刷机允许结合可变数据券、门票、包装、调查、对话营销与产品包装工作，从而将吊牌印刷机械设备厂的价格降得更低。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;数字印刷机如HP允许商业印刷厂商添加单个条形码或QR码包装可变数据的能力。这有助于跟踪单个产品、编码和控制库存，并识别假冒产品。&lt;/span&gt;&lt;/p&gt;','','','',2,1,4294967295,'',0,'','',0,2147443200,''),(57,2,'书本印刷厂用什么纸箱包装','&lt;p&gt;\r\n	我的一个客户是新闻完美结合的教科书印刷，也是&lt;strong&gt;书本印刷厂&lt;/strong&gt;。但这篇文章不是关于她印刷的书。这是关于纸箱，她的书将船。&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;忘记，最好的定制印刷的工作是很容易的（无论是书籍、小册子、或其他）是无用的直到你让它进入你的客户在原始状态的手。因此，包含你的工作和保护它在运输是整个工作的一个特别重要的组成部分的纸板箱。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;\r\n	我的客户的盒子，大多数箱子是标准尺寸。无论是标准尺寸的可能（有很多选择），它通常是更大的比我的客户需要的盒子。她需要每箱包含20的6“x 9”的教材，和她一样有描述性信息（印刷的书，标题的一个口号，一个地址，和书籍的纸箱数量包含）印在盒子上的标签不。&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;去年还对纸箱印刷没有时间，所以她只能用自粘岩性标签。他们看起来很好，但他们不是作为信息的印迹直接在纸箱的吸引力。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;为什么书本印刷厂是重要的？因为我的客户的客户将看到的第一件事将纸箱，不是书本印刷厂。作为一个顾问曾经告诉我，当我是一个艺术总监，“一个公司发出的一切都是公司的一个广告。“当时它是一个新的概念。现在它是一个概念，我的生活。和我的客户的生活，太。这样的指导规则是，盒子是我的客户的公司的广告，他们看上去很好。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;目前还不错。但是当最终期限的到来，我的客户仍然需要一些主管的批准，因此箱印艺术文件开始有点晚了。我关心的是。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;专业的工作，由书本印刷厂来做。纸箱需要印刷和转换。他们可以是丝网印刷。他们可以通过柔性版印刷（简单的艺术），使用橡胶印版和油墨。或者他们可以有平版胶印印刷衬垫粘齿，瓦楞纸板的内筋。最后的选择是最贵的（和它提供的印刷质量最高的）。&lt;/span&gt;&lt;/p&gt;','','','',2,1,4294967295,'',0,'','',0,2147443200,''),(58,2,'瓦楞纸箱的未来生产方式','&lt;p&gt;\r\n	事情在变场。如果你读了媒体关于近期&lt;a href=&quot;http://www.guaguayin.cn&quot; target=&quot;_blank&quot;&gt;南京印刷&lt;/a&gt;展在中国，你会看到，包装是一个增长的行业，&lt;strong&gt;瓦楞纸箱&lt;/strong&gt;和数字印刷和转换是提高跨越式发展。即使现在有些厂商能够喷墨艺术对箱。（的胶印印刷辊的压力会粉碎瓦楞的股票，这就是为什么丝网印刷和柔性版印刷的方式通常是盒子装饰。）喷墨打印的步骤后，数字转换可以使用激光切割纸板折痕和空格而不是依靠金属模具（规则，需要几天的时间来手动构建模具切割）。&lt;/p&gt;&lt;p&gt;\r\n	瓦楞纸箱让我们可以从这个案例研究学习什么？&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;箱制造需要很长的时间，需要高度专业化的技能。它涉及到分包商通常要求严格证明的期限。这不是一个买方市场。所以，提交你的盒子艺术早把证据立即。&lt;/span&gt; &lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;阅读贸易杂志和保持在瓦楞纸箱和数字框转换数字印刷的发展。它会让你的生活更容易。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;早期发现你的商业印刷供应商是否你的瓦楞纸箱需要定制工作。即使价格低，进度可能是艰巨的。&lt;/span&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;考虑标签作为一种替代。您的打印机可以购买标准箱，并打印和应用在自己的工厂的标签，由分包商避免任何自定义的工作。这可能不那么好，但在紧要关头，瓦楞纸箱，它往往是一个很好的选择。&lt;/span&gt; &lt;/p&gt;','','','',2,1,4294967295,'',0,'','',0,2147443200,''),(59,2,'图书印刷公司：永远尊重图书革命','&lt;p&gt;\r\n	我是一个272页的经纪自定义&lt;strong&gt;图书印刷公司&lt;/strong&gt;，6“x 9”完美结合的教科书，印在不透明文本文件与12pt UV涂布封面。对于媒体运行印刷的书3000份，对于图书印刷公司来说就是命根子。&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;最初，图书印刷公司谈判一三周的时间表与打印机和我的客户。这本书的封面将在星期五准备好，和文本将提早准备在接下来的星期一早晨。从最初的星期五开始日期的三周内，我的客户都会收到她的书。&lt;/span&gt; &lt;/p&gt;&lt;p&gt;\r\n	一旦工作已经完成并获得这本特殊的书打印机（谁是更高的出价，其中，图书印刷公司主要是在质量和及时的交货记录的选择），有一个延迟。无论是封面和文字上传在营业结束星期一打印机的网站。（这样的时钟真的在星期二上午开始。）&lt;/p&gt;&lt;p&gt;我没有在确认书打印收到的所有文件被确认轻微的延迟不会危及三周&lt;a href=&quot;http://www.guaguayin.cn&quot; target=&quot;_blank&quot;&gt;画册印刷&lt;/a&gt;和交货计划的第一件事。由于这种特殊的打印机实际上已经成功地满足了在前几年的一个为期两周的时间表，我们的客户服务代表是不用担心的。然而，这是已经证实了这一重要的。&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;图书印刷公司的代表发表文字和支付证明后，我的客户上传的印刷书籍艺术档案约48小时。这是一个快速转身。通常，我的客户就已证明到次日（星期四）打印收据上星期五，但她需要审批主管谁离开了谁就下一天返回。我的客户想返回一个星期一星期五（上午8:00）交货证明。她问我是否会妥协的时间表。&lt;/span&gt; &lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;我检查了打印机的客户服务代表，听说这些文件镀定于星期一下午，这样的标记，随着提交PDF页面证明早期星期一收据（三修正页面，原来）将离开的时间更正，修改PDF校样，镀金。&lt;/span&gt; &lt;/p&gt;','','','',2,1,4294967295,'',0,'','',0,2147443200,''),(60,2,'南京印刷广告设计制作公司','&lt;p&gt;&lt;strong&gt;南京印刷广告设计制作公司&lt;/strong&gt;像所有关于时间表似乎说明了时间和过程的紧密协调的本书印刷植物这里有一些想法。&lt;/p&gt;&lt;p&gt;\r\n	首先，你的工作是不是唯一的一个&lt;a href=&quot;http://www.guaguayin.cn&quot; target=&quot;_blank&quot;&gt;南京印刷&lt;/a&gt;广告设计制作公司的生产计划。因此，它是讨论任何改变日程安排与您的客户服务代表尽快极其重要。如果日程安排很紧（例如，前几年的两周按计划我客户的书有没有额外的一天，这是更加重要的打样）。毕竟，你的书和其他客户的书都必须经过生产过程，都必须符合在规定时间内，根据现有的设备和劳动力。&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;就是说，通常南京印刷广告设计制作公司有一个回旋的余地了。我的客户的工作日程计划书印刷镀一周最终技术文件提交后。因为我的客户不需要这一切的准备时间，我在南京印刷广告设计制作公司晚提交文件的一天和她已故的回报证明的一天（允许她主管的监督）没有打破计划。在某些情况下它可能弥补时间。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;一些更紧密安排供应商可能没有能够把握这个时间表。我的许多客户的其他估计较低，在某些情况下，这些厂商将有更多的工作要通过管道。甚至一天的延迟，在这些情况下有可能破表。&lt;/span&gt;&lt;/p&gt;','','','',2,1,4294967295,'',0,'','',0,2147443200,''),(61,2,'南京印刷名片公司哪家好','&lt;p&gt;\r\n	如果你有一个长期的关系本书的&lt;strong&gt;名片印刷&lt;/strong&gt;，你更可能是能够克服延迟。这不是一个保证，但你的供应商要你回来工作。所以他会尽可能满足你的调度需求。&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;如果事情变得紧张，你的印刷机可能会给你一些先进的副本，或分批装运。这是极限，但是。请记住，除了在与其他客户对印刷及印后设备的时间，你是从事多个复杂过程（更多的书比宣传册和其他小项目）。例如，印刷的书都要做一次，如装订和包装的书。你不能在经济上产生的新闻运行的一部分，然后回去以后完成。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;\r\n	你的书印刷机假定你的最后文件是准确的。我的客户是在她的文件提交晚了一点，但他很清楚&lt;a href=&quot;http://www.guaguayin.cn&quot; target=&quot;_blank&quot;&gt;南京印刷&lt;/a&gt;名片公司哪家好。但她只有三校正页（272）需要在打印机所取代，记者准备的文件。&lt;/p&gt;&lt;p&gt;当一切都失败了，你的计划已经泄露，你可以弥补时间放弃硬拷贝样张。在我的客户的情况下，她收到的证据提交文件后48小时。这个本书的打印机给她硬拷贝样张，然后她回到他们通过联邦或者UPS。这额外的一天。如果计划被泄露，我会处理所有打样几乎通过网络服务器的选择。这可能没有精确的复印件证明，但虚拟打样并消除任何证据证明发货延迟自发送在线即时。在自己的名片印刷采购工作清楚知道南京印刷名片公司哪家好，你总是可以要求颜色的硬拷贝证明（如盖），然后依靠虚拟包装打样。&lt;/p&gt;','','','',2,1,4294967295,'',0,'','',0,2147443200,''),(62,2,' 南京哪里有印刷包装的','&lt;p&gt;\r\n	我的包装厂的时刻曾是我的助理负责包装印刷，很久以前。具有讽刺意味的是，我以前的设计，生产，和这个特定的打印购买印刷书。善有善报，来临。但是印刷包装的规格很重要。&lt;/p&gt;&lt;p&gt;\r\n	很多人在乎产品有问题，是因为不清楚&lt;strong&gt;南京哪里有印刷包装&lt;/strong&gt;。比如如果有一个272页的精装书，3000本，6“x 9”的格式，在&lt;a href=&quot;/zixun/165.html&quot; target=&quot;_blank&quot;&gt;高档茶叶包装盒&lt;/a&gt;中，不透明的白色涂层股票与12pt封面制作。由于封面和封底将四色油墨加上PMS的打印，和室内覆盖（正面和背面）将印刷在4cp油墨等，覆盖股票将被涂覆的两侧（C2S）表。文本打印黑色，所以70 #不透明的股票就足够了，如果不大方。这是272页的印刷书将由于70mm文本表体积。从内部将更大的文本文件。&lt;/p&gt;&lt;p&gt;\r\n	我的客户最初给了我一篇270页的页面数。这是不能被4整除，8，或16，所以打印机需要完成新闻签名添加页面。这使得一个完整的272页（十七16页的签名），这是什么五打印机就是我标出来用于打印工作的估计。&lt;/p&gt;&lt;p&gt;\r\n	我也加入到我的客户的规格，三到五分的内页文字都流血。在某些情况下，根据书的大小（在这种情况下，6“×9”），媒体的签名的大小（本例中是16页），以及打印机的按大小，可能没有足够的空间用于放书，打印机的标志，和出血对记者表。为了解决这个问题，一台打印机可能搬书到另一个，更大的新闻，这可能推升价格。所以我想要的打印机之前估计的工作知道流血。&lt;/p&gt;&lt;p&gt;\r\n	在外盖，我的客户要求的UV涂层。有些包装机不具备这种能力。相反，他们选择了在水性涂料设备。别人宁愿叠盖。在所有的情况下，我只是问书打印机要具体如果他们需要偏离规格。&lt;/p&gt;&lt;p&gt;\r\n	这也是真正的对文本进行替换。这个打印机有不同的“房子”（这将花费少，已为众多客户大批量购买）。所以我要做的是让打印机在他们的估计是特异的，而且我会让我的客户决定。（一个南京包装厂报价，一个选择的印刷技术不透明，和一个选择了H。）&lt;/p&gt;&lt;p&gt;既然我选择了五个&lt;a href target=&quot;_blank&quot;&gt;南京包装厂&lt;/a&gt;，位于任何地方从中西部向东部的州，我知道运费会考虑的，所以我对交货提供具体的邮政编码。&lt;/p&gt;','','','',2,1,4294967295,'',0,'','',0,2147443200,''),(63,2,'画册印刷的产品目录如何设计','&lt;p&gt;\r\n	让你的印刷机替代纸可能产生可观的储蓄。但要确保你知道纸打印机已包含在投标，并要求印刷样品是安全的。&lt;/p&gt;&lt;p&gt;\r\n	忘了包装和运输成本，这很容易。如果你需要具体的包装（我的客户需要20本&lt;a href target=&quot;_blank&quot;&gt;宣传画册&lt;/a&gt;/每箱），让它知道要成本。得到一个货运成本，提供一个邮政编码，一个所有交货地点和交货地点的故障，是否有一个码头（或在办公室交付）。打破一个防滑的书然后移动纸箱的办公室电梯一层将花费超过一个码头交货。不要措手不及。指定这些早期的讨论与您的打印机。&lt;/p&gt;&lt;p&gt;\r\n	考虑进度。如果你需要书马上，你可能有更少的选项，因为文章必须被发现，以有利的条款，以及打印机开始印刷之前装运。这是更好地与您的打印机早让他们知道工作来了，即使你不知道它什么时候会准备好的。&lt;/p&gt;&lt;p&gt;\r\n	定制印刷：扩大墨集胶印。为让&lt;strong&gt;画册印刷&lt;/strong&gt;厂曾经说过，“越变越保持不变，画册的产品目录不是越多越好。”&lt;/p&gt;&lt;p&gt;\r\n	在的情况下自定义打印这绝对是真实的。我很高兴看到，“固定的调色板印刷”是一个在商业印刷的主要趋势。&lt;/p&gt;&lt;p&gt;因为我发现它有趣的是，我看到了本质上相同（或类似）技术，当我在上世纪90年代艺术总监。然后我想这个概念是有趣的；现在，我很高兴看到它的回报。&lt;/p&gt;&lt;p&gt;\r\n	在色彩上的科学新闻，当你产生一个胶印机你有几个选项工作增添色彩：您可以添加任何额外的颜色。那就是，你可以打印作业在黑色墨水，或黑色的额外屏幕（即灰色）。&lt;/p&gt;&lt;p&gt;\r\n	你可以使用四色墨水打印的工作过程（即青、马真塔、黄、黑）。通过叠加的半色调网屏的四过程透明彩色油墨，你可以模拟一个大范围的色调。如果你不能完全匹配，你选择的颜色与颜色建立的过程，你可以添加一个或多个PMS油墨。这些特殊颜色的油墨公司或内部专家混合油墨。你在打印一个PMS颜色使用的输墨装置的新闻而不是模拟颜色重叠透明屏幕的青、马真塔、黄色和黑色墨水。&lt;/p&gt;','','','',2,1,4294967295,'',0,'','',0,2147443200,''),(64,2,'画册印刷如何做企业宣传册','&lt;p&gt;\r\n	问题是你不能模拟所有可能的颜色在PMS色域只使用青、马真塔、黄色和黑色墨水。如果你的&lt;a href=&quot;/&quot; target=&quot;_blank&quot;&gt;公司宣传画册&lt;/a&gt;的颜色（例如）必须精确匹配&lt;strong&gt;企业宣传册&lt;/strong&gt;，通常你需要添加一个PMS颜色你的CMYK（四色）油墨进行匹配。（你也可以使用一个额外的“触摸板”的PMS颜色匹配–说深蓝色的–提高平版胶印复制艺术片，或是一个五彩缤纷的服装，食品，或汽车的海报。）&lt;/p&gt;&lt;p&gt;\r\n	原因添加额外的颜色是有问题的，你需要一个更大的新闻和更多的输墨装置（也许五或八个单位，而不是四）。这将提高商业印刷你工作的价格。&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;从打印机的角度来看，&lt;a href=&quot;/zixun/123.html&quot; target=&quot;_blank&quot;&gt;企业产品画册设计&lt;/a&gt;的油墨配置从四种颜色4cp加额外的PMS颜色可以时间和劳动密集型，因为他需要洗墨单位改变油墨的配置。这需要时间，所以他会亏钱（或需要提高他的价格）。&lt;/span&gt; &lt;/p&gt;&lt;p&gt;\r\n	“固定的调色板印刷背后的想法”，针对这些问题，企业宣传册公司一直在扩大彩色电视机长时间工作。&lt;/p&gt;&lt;p&gt;早在上世纪90年代，当我还是一个艺术总监，一个公司，我曾与加入橙色和绿色的四个过程的颜色和所谓的结果“六色”（显然，这成为一个PANTONE商标法）。另一家公司有一个版本的过程中他们被称为“高保真色彩。”当时的目标是要建立尽可能广泛的色域匹配PMS的颜色最。在洗UPS存钱似乎不再是一个问题。&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;现在，根据“南京2016个关键主题带来行业4的前列”的Cary Sherburne，技术，被称为“固定的调色板印刷”或“扩展色域印刷。”引用舍伯恩的文章描述固定颜色产品显示在德鲁巴，“公司包括X-Rite PANTONE、Esko、朝日光化，柯达，海德堡和更多的分享了这一过程的印刷技术使用多达七种颜色的想法和解决方案（CMYK加上橙色、紫色和绿色或蓝色），使超过90%的PANTONE色彩来实现。”&lt;/span&gt; &lt;/p&gt;','','','',2,1,4294967295,'',0,'','',0,2147443200,''),(65,2,'家具公司画册印刷厂如何设计','&lt;p&gt;\r\n	首先，要注意，我在上世纪90年代的色彩高保真六色或经验与当下之间是很有趣的，我们有一个巨大的改善数字印刷定制。多年来，我已经看到了喷墨印刷机的“扩展颜色集。”也就是说，家具&lt;a href target=&quot;_blank&quot;&gt;公司画册印刷厂&lt;/a&gt;为了扩大色彩的大幅面喷墨机可以生产的数量，生产厂家有亮的青色和洋红加；不同的黑色油墨；橙色、绿色或红色，绿色，和；蓝墨水一般的青色，马真塔，黄，黑。换句话说，通过添加这些颜色（创造一七或八色墨水组），喷墨印刷机制造商在大幅面喷墨印刷机的色彩还原能力有显著提高。&lt;/p&gt;&lt;p&gt;\r\n	把它的色彩管理技术带回胶印和柔印告诉我，更多的传统厂商试图通过解决客户的需要进行更准确的色彩保持相关趋势。&lt;/p&gt;&lt;p&gt;\r\n	此外，打印机运行机与一个固定的调色板，可以避免额外的洗起也帮一些对新闻工作。在过去，在过程中的颜色和其他工作印刷黑色加上一个或多个PMS颜色有些工作印刷，它通常是不可能制定出一个不同的客户工作在同一个新闻片。固定颜色印刷，只要客户的所有工作都在同一纸画册，唯一的主要因素为工作是否可以联合起来将是工作和新闻片可用房间的尺寸。&lt;/p&gt;&lt;p&gt;\r\n	自定义打印多份工作的同时，始终使用相同的inksets避免洗UPS将节省打印机的时间和金钱。快速化妆准备和联动工作会减少贵重材料的使用，加快印刷工艺，从而使印刷更具竞争力数字印刷短按运行。和更长的打印作业没有个性化，将有一个市场需求，胶印和柔印仍将是最具成本效益的解决方案。&lt;/p&gt;&lt;p&gt;我有两个家具“啊哈！“最近的时刻商业印刷场，我想与你分享他们的反映当前的大众文化的价值观和商业媒体。&lt;/p&gt;&lt;p&gt;\r\n	作为一个家具公司画册印刷厂的印刷经纪人，我一直在寻找新的客户，通常通过转诊因为它能更好地工作。我被一个以前的同事给两个名字，并在研究了他们的家具公司画册印刷厂，我起草了给每个描述的服务，我可以给他们一封信。&lt;/p&gt;&lt;p&gt;\r\n	但当我准备发送的邮件，我做不到。他们的网站没有电子邮件联系信息。只是有电话号码。一个LED的答录机，和其他领导的接待员没有潜在买家的邮件地址打印。&lt;/p&gt;&lt;p&gt;\r\n	我被难住了。下一步要做什么？我认为这两个潜在客户是温暖的线索，因为我以前的同事所说的好的，说他们会让我知道好的人。&lt;/p&gt;&lt;p&gt;\r\n	然后一个灯泡去在我头上。寄一本画册。当然，一个身体，手签的印刷的画册。我对两家公司的地址。为什么不呢？&lt;/p&gt;','','','',2,1,4294967295,'',0,'','',0,2147443200,''),(66,2,'南京印刷宣传页如何设计','&lt;p&gt;\r\n	当我第一次读到“直接在商业印刷、杂志印刷、&lt;strong&gt;南京印刷宣传页&lt;/strong&gt;”，我的设想，对喷气二传手，服装喷墨和热升华印刷的文人，和模型。我想象着高端时尚场所和通道。&lt;/p&gt;&lt;p&gt;\r\n	所以当我的未婚妻和我漫步在南京的木板路，我惊讶地看到一个小的T恤印花店提供打印照片”直接从您的iPhone”到他们的T恤，都可以定制出&lt;a href target=&quot;_blank&quot;&gt;印刷宣传页&lt;/a&gt;。&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;这真的是一个衡量当前的时代精神（在这一特殊历史时期的情绪和语气）。这是婚姻的印刷宣传页。此外，它反映了业余摄影师的荣耀。这些不是专业摄影图像的浪漫的南京。他们是你自己的照片你自己的T恤，照片拍摄的你。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;在销售中，他们说，一个潜在的客户没有听到比他或她自己的名字听起来更令人愉快。这可能是真的。在这种情况下，我们可以假设，很多人没有图像比他们自己更讨人喜欢。创造“自拍”以及“selfie”会让你拿着相机足够远，从你的脸上带上你自己的照片的增殖，将证明这个印刷宣传页在南京是明智的。&lt;/span&gt; &lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;所以如果你是一个商人，记住这一点。还认为，人们喜欢发放宣传页，发表声明。对于那些喜欢地推的广告公司，南京印刷宣传页已成为新的“权力的领带，”一个机会让一个人乃至政治声明，对一个人的喜欢，不喜欢的，价值观，理想，等等。&lt;/span&gt; &lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;如果你将此进展直接到南京印刷宣传页，你基本上可以把世界上最喜欢的彩页单页进行宣传，用世界上最容易掌握的印刷机（喷墨打印机），加上世界上最喜欢的图片（自己的脸），做一个真正的个人声明。&lt;/span&gt; &lt;/p&gt;','','','',2,1,4294967295,'',0,'','',0,2147443200,''),(67,2,'呱呱印提供封套印刷公司地址','&lt;p&gt;&lt;strong&gt;提供封套印刷公司&lt;/strong&gt;总有特殊印刷样品，因为我总是谈论自定义打印。我们已成为一个印刷迷，我总是有源源不断的新想法从她。&lt;/p&gt;&lt;p&gt;\r\n	我们最近在海滩上，她给了我三的商业印刷样品，抓住了我的眼睛。这是她给我的是什么，以及我的评价是为什么他们的工作特别好或从提供封套印刷公司身上能学到什么：&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;首先，一头放在一个单独的印刷纸张粘在前面或后面的记者签名。在许多情况下，我看到了逃亡的胶用于此过程允许的附件容易去除。逃亡的胶是橡胶水泥。你可以很容易地剥离一个印张（甚至一个物体像一个塑料卡）已经逃亡到另一个印张粘贴。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;这个特殊的问题，包括假盖世界杂志（或附加盖），与标识的杂志（通常被称为“旗”）印刷在上面盖重光泽压光片（上面的香水广告嘲笑看起来像一个实际的杂志封面）。它有“广告”印刷在上面，但对我来说，它看起来像一个真正的盖（完整的提供封套印刷公司地址，淘汰箱运输路线排序信息，和智能邮件条码）。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;现在我已经看过很多类似的尖端组件添加到杂志的封面，但是他们已经在布里斯托尔生产的纸涂层牛皮纸大部分（明信片的股票）。他们看上去像封面包装，并为他们传授信息最多的部分（通常是时候更新我的订阅）上发布的品牌和一些轻营销文案。不&lt;/span&gt;是什么尖端印刷机器，但有趣的是，我一定到我的未婚妻剥下来的杂志封面，这实际上是真正的盖。该标识是可信的。这是性感的。现在，强大的市场营销。&lt;/p&gt;','','','',2,1,4294967295,'',0,'','',0,2147443200,''),(68,2,'上海封套印刷多少钱','&lt;p&gt;\r\n	封套制作需要一些严重的营销的魔力去充电超过5元的一个小袋子薯片。这个特定的&lt;strong&gt;上海封套印刷&lt;/strong&gt;供应商成功地。&lt;/p&gt;&lt;p&gt;\r\n	下一件，这会被认为是“灵活包装，“是印在黑色固体重覆盖油墨。用放大镜可以看到坚实的黑色油墨覆盖在黑色的网点。我学会了这项技术在我艺术总监。黑色墨水本身可以洗掉。因为我能看到一些缺陷的油墨通过我的放大镜观察时（这地方看起来有点不均匀和水），我的猜想是，工作已经印与柔印设备。这是通常用于软包装。&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;为了减少轻微褪色的墨水看，设计者指定的黑色墨水在黑色的半色调网屏（作为替代，他或她也会选择一个“富黑”油墨，复合油墨和黑色其他颜色）。这精美的作品。它使整个包看起来郁郁葱葱的放纵。这也使得四色苹果和逆转，手写的类型（实际上只是一个模拟手工刻字）跳脱页。&lt;/span&gt; &lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;企业封套设计可爱，和模拟手工刻字为产品提供了一个轻松、随意的感觉。有机标准（无麸质，无脂肪，非转基因，等等）提供一个健康的、可持续的光环，针对客户在金融层次上的人要健康环保。如果我有现金，我会付出这么多的这样一个口径产品。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;不用说上海封套印刷多少钱，既然你的企业需要，就要用封套包装和名片、宣传单页等，所有这一切的魔力必须穿过茂密的油墨覆盖传送，图像和背景之间的对比，俏皮的字体，和“脆麦片”营销文案。这是一个成功的。&lt;/span&gt; &lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;上海封套印刷样品的真的是少了一个营销的成功和更多的教育工具，提供了在一个小的格式都是为了掌握模切、概念你需要得分，和折叠（以及层压印刷封面四色瓦楞纸板股票）。&lt;/span&gt; &lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;是什么吸引我这个简单旅行包（被称为“折叠纸盒”工作“瓦楞纸板”）是其教育价值。如果你拆开上海封套纸箱，把它与印刷方面，完全平坦的，你可以看到纸板开槽，所有分数折扁盒成三维完成的作品，所有的模切标签加框的前面的模切窗口，再加上一个标签，已点在允许的连接盒的四个侧面（不包括顶部和底部）在一个硬纸板做的立方体。&lt;/span&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;另一方面，你有一张搪瓷平版纸，四种颜色印刷和层压纸板。&lt;/span&gt; &lt;/p&gt;','','','',2,1,4294967295,'',0,'','',0,2147443200,''),(69,2,'南京印刷生产厂家面临产业升级','&lt;p&gt;\r\n	当你把&lt;strong&gt;南京印刷生产厂家&lt;/strong&gt;包起来都贴标签，他们该去的地方，你有一个三维产品。它不再是一个平面，南京印刷生产厂家印刷的&lt;a href=&quot;/Article/detail/id/148.html&quot; target=&quot;_blank&quot;&gt;宣传单页印刷&lt;/a&gt;纸张都是很好的。这是你可以握在你的手中，一个对象的一个立方体，甚至在制造商将玩具盒子里。&lt;/p&gt;&lt;p&gt;\r\n	是什么让这个有趣的我，超越教育提供多箱构造，是建立在每箱，设计师必须考虑成品的物理性能包装以及它的设计（如何在出现）和其印刷生产厂家市场信息（包括副本的内容和图形设计的情感效果）。&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;但一旦它在数不清南京印刷生产厂家的物品企业，所有这一切都在窗外。这只是你的盒子。你会买它，或者你不？&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;我长大了。我喜欢印刷书籍与纸质发票。有永久性的和有形的关于油墨纸张。具有讽刺意味的是，然而，我发现互联网是了解新的商业印刷技术最好的地方。&lt;/span&gt; &lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;例如，在最近的南京印刷技术展览会在南京读书，我学到了很多新的数字设备，但我发现自己无法完全掌握的一些物理过程只能在的话。&lt;/span&gt; &lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;第一技术研究通过视频而不是文字描述和事实表是新的切割和压痕产生的印刷设备：欧氏线。&lt;/span&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;我已经习惯于传统方法切割和压痕的创建和使用的金属模具和橡胶部件连接到扁平的木片，我无法用我的大脑在如何做这个数字没有物理、金属模具。&lt;/span&gt; &lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;我去南京使南京印刷生产厂家都去进修生产变革，产业升级、拥抱互联网，如&lt;a href target=&quot;_blank&quot;&gt;呱呱印&lt;/a&gt;。我可以看到设备喷射聚合物脊上压鼓，他们会在纸基板，它通过南京印刷生产厂家的机器。看到这些事情发生的过程就可以理解。&lt;/span&gt; &lt;/p&gt;&lt;p&gt;\r\n	然后我看到了激光是如何能把纸基板，提供成品纸箱板，就可以组装。视频显示了激光快速地移动纸基板作为它通过设备在实际燃烧规律。谁能把握这一过程完全从书面描述为从几秒钟的视频吗？如果一张图片胜过一千句话，然后视频是无价的。&lt;/p&gt;','','','',2,1,4294967295,'',0,'','',0,2147443200,''),(70,2,'如何提升手提袋印刷制作工艺','&lt;p&gt;\r\n	我一直很清楚，&lt;strong&gt;手提袋印刷制作工艺&lt;/strong&gt;商业印刷不是装饰塑料瓶选择护发产品。我理解的手提袋印刷制作工艺过程就是胶印辊压力会粉碎几乎比其他任何纸张和包装板。事实上，我的理解是，柔性版印刷的或自定义的丝网印刷是任何可压碎的衬底选择的技术。&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;所以当我读到一篇文章提到手提袋印刷制作工艺，我看手提袋印刷网站上的录像胶印在塑料瓶等产品做头发。就好象是在新闻一飞，目睹多点到底新闻毯子可能接触到的瓶子接触没有粉碎他们。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;\r\n	只有几秒钟的视频给我留下最深刻的印象，因为我可以看到链运行的输送带数百或数千瓶，一个接一个，对胶印平版印刷机橡皮滚筒的旋转。我能看到准确的接触点为旋转机滚筒上沉积的图形（甚至小描述型）上旋转的塑料瓶。什么可能是一个混乱的实际上是一个永无止境的线装饰着小瓶子，清爽型和图形。&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;又一次，我不能想象这相当以及通过阅读一段文字的看到即使是几秒钟的视频展示操作机。&lt;/span&gt; &lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;我们可以从这个手提袋印刷制作工艺经验中学习什么？&lt;/span&gt; &lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;无论这些经历教会了我关于人类心理学的一些东西，视频的美德作为一种学习工具，&lt;a href target=&quot;_blank&quot;&gt;手提袋印刷&lt;/a&gt;制作工艺和数字媒体可以相互补充。这里有一些关于这个问题的思考：&lt;/span&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;我认为人是习惯的动物。他们看到他们曾经看到或希望看到的，他们往往不能想象新的做事方式。以我为例，我是如此习惯于锤薄金属规则为木材创造得分的想法（或增加）模具和切割，我不能想象一个机器可以用数字信息来喷射流体，能够凝固成压痕规则而不使用金属模具模具。在这种情况下，一个视频都差。它给我的人啊！“直观地把握过程的时刻。&lt;/span&gt; &lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;在理解物理过程，如商业印刷或完成，甚至一个业余视频是有帮助的。高端视频产品价值像专业演员，配音，音乐，或是没有必要的。&lt;/span&gt; &lt;/p&gt;','','','',2,1,4294967295,'',0,'','',0,2147443200,''),(71,2,'苏州手提袋印刷材质如何辨别','&lt;p&gt;\r\n	因为我现在理解&lt;strong&gt;苏州手提袋印刷&lt;/strong&gt;的核心制造工艺，如果我想进一步扩大我的知识，然后书面文件说明的过程和审查设备规格将是非常有帮助的。在这种情况下，印刷媒体和视频会互补的教育工具，每个都有自己的长处。&lt;/p&gt;&lt;p&gt;\r\n	我的下一个洞察涉及更多的苏州手提袋商业印刷到数字媒体。我能看到发明的记者会。苏州生产的塑料瓶，胶印机的实际印刷垂直导向的图像，不同于任何其他的新闻我看到。苏州手提袋印刷材质永无止境的发展塑料瓶垂直下降在旋转床前的位置，这纺瓶在精确的速度存墨。（在大多数情况下，这将是一个水平的过程，与滚轮会粉碎衬底。）这背后的智慧是惊人的工作流。&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;我的第五个评论也涉及更多手提袋材质数字印刷定制整理。看激光喷射基材切割空白纸箱周围，看到喷嘴喷射聚合物材料，硬化成皱脊的旋转鼓，我清楚，数字整理并不仅仅是数字印刷进入它自己。不久前，数字印刷更像是激光复印。然后改进，并对图像进行色彩鲜艳明快，但你不得不移动压板的传统的模拟加工设备来完成工作。现在的厂家越来越严重，解决制造过程中的所有组件，放下油墨纸张切割、压痕、折叠工作数字。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;一副只给了我一个链接到一篇关于苏州手提袋印刷材质2017和油墨技术。这次似乎真的是一个真正的，准备好黄金时间的技术，并且证明在实际的承诺按购买者的苏州。&lt;/span&gt;&lt;/p&gt;','','','',2,1,4294967295,'',0,'','',0,2147443200,''),(72,2,'青岛手提袋印刷厂面临行业洗牌','&lt;p&gt;\r\n	在最简单的术语，&lt;strong&gt;青岛手提袋印刷厂&lt;/strong&gt;的印刷喷墨墨水专用涉及到加热运输手提袋。墨滴迅速扁平化和失去水分，形成超薄聚合物油墨表面图像的传送带上。从传送带，将图像传送到商业印刷纸。（不像喷墨油墨不直接喷到纸上。）在它被转移到承印物上，墨膜完全干燥。这允许优越的油墨墨层（墨坐在顶部的纸纤维）。网点是特别脆（因为没有网点），及油墨薄膜不仅减少了油墨的成本而且还提供了一个更宽的色域。由于该过程的性质（使用现成的印刷股票的能力），纸张成本可以控制。&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;那么如何青岛手提袋印刷厂新闻发布会，为新的商业印刷设备的预订单，青岛手提袋印刷厂都涉及到另一个？&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;根据新闻稿，在2016、以下重量级致力于纳米油墨技术工艺：“在中国最大的出版&lt;a href=&quot;http://www.guaguayin.cn&quot; target=&quot;_blank&quot;&gt;印刷包装盒&lt;/a&gt;，将青岛手提袋带到短期，版本出版物市场（杂志）。这将涉及“杂志的质量”，对轻量涂布和未涂布新闻纸工作。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;\r\n	通过互联网，大量的个人定制的一个广泛的青岛手提袋印刷命令的标志，和其他产品。”&lt;/p&gt;&lt;p&gt;这些测试的网站将包括青岛手提袋印刷厂等供应商。另一个测试网站将南京、北京、青岛，“土司总部全球印刷和包装供应商”。青岛手提袋印刷厂将安装一个超级印刷机与完善能力。&lt;br/&gt; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;/p&gt;','','','',2,1,4294967295,'',0,'','',0,2147443200,''),(73,2,'不干胶印刷厂家哪家好','&lt;p&gt;\r\n	当然，&lt;strong&gt;不干胶印刷厂家&lt;/strong&gt;哪家好是个很难回答的问题，每个不干胶印刷厂家都有自己的特长和短处。你可以说这只是宣传资料。然而，我认为它意味深长，四/图形，爱兰德等突出的供应商，和想象！得到背后的技术。他们把自己的名誉受损，这说了很多关于他们的信仰在不干胶印刷厂。&lt;/p&gt;&lt;p&gt;\r\n	该技术将减少准备时间，让大幅面打印，并保持胶印质量，这将建立在平版胶印油墨技术可行的竞争。&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;不干胶印刷印刷机的具体配置（兰达S10标准；双面印刷；不干胶印刷新闻网站，可以打印刷56cm的出版物目录，直接邮寄工作分钟）解决商业印刷的主要增长领域（一般的商业印刷；短期，高版本的期刊；采购和销售点的格式显示；大点的折叠纸盒和软包装）。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;短期内，对变量的性质允许包装印刷油墨技术以应对市场趋势和经济运行打印小改变促销包装或个性化的信息传递活动。&lt;/span&gt; &lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;总之，&lt;a href target=&quot;_blank&quot;&gt;呱呱印&lt;/a&gt;将提供不胶印质量和速度同时提供大规模定制能力，较小的新闻运行的版本并按运行选项，甚至经济模型和测试的营销举措。&lt;/span&gt; &lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;如果所有这些测试网站是满意的不干胶印刷机，这将建立油墨技术为主流，负担得起的替代更传统的商业印刷如胶印和柔印技术。&lt;/span&gt; &lt;/p&gt;','','','',2,1,4294967295,'',0,'','',0,2147443200,''),(74,2,'长沙酒标签印刷厂','&lt;p&gt;&lt;strong&gt;酒标签印刷&lt;/strong&gt;指向一些视频关于艺术家的织物标签，这些印刷视频你看画家用她的整个身体让艺术。一只手拿什么似乎是一个木炭画棒（或石墨棒或蜡笔效果），她将在巨大的画布（或纸）重复圈和环在她身体的物理运动（各种瑜伽伸展）。（这是依稀让人想起天使在雪地里而是用纸张或画布，石墨或木炭，作为媒体。）&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;喜欢酒标签印刷设计行动绘画，长沙酒标签印刷厂的作品是在瞬间快照她的身体运动。她抓住她的竞技运动（几乎一个冥想与运动）在圆圈和石墨，结束了重复的几何图案，让我想起了形式由“螺旋形”。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;\r\n	从酒标签印刷厂营销的角度来看，这是辉煌的。在标签塑料手提袋（实质上是一个打印的产品，即使它是功能性的艺术）让你的在线体验。在这一壮举的多渠道营销，你得到的不仅是塑料袋也多感官体验（视频和音频轨道加上有时飘渺，有时部落原声带）描述的艺术家的作品。&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;它为什么这么好的一个营销水平？&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;酒标签产品便宜但耐用。这个寄存器值”，“这增加酒标签印刷厂的品牌形象（和那些携带手提包的图片）。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;整体的“感觉”的包袋是“艺术”，而不是“艺术”（商业印刷技术捕获所有的素描，污点和缺陷）这随着极简主义（和日本鱼画视觉参考）使袋的一个高文化的整体色调。再次，通过联系，这延伸到酒标签的厂家。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;产品回收。这一呼吁环保意识的年轻人，他们大概是酒标签印刷厂公司的主要客户。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;所以我要远离这一切是一个营销技巧增强酒标签印刷设计的欣赏。难怪做的这么好一个品牌。谁主管谁懂艺术、数字技术、多渠道营销和心理学。&lt;/span&gt;&lt;/p&gt;','','','',2,1,4294967295,'',0,'','',0,2147443200,''),(75,2,'南京印刷塑料袋的厂家','&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	这个过程可以消除&lt;strong&gt;南京印刷塑料袋的厂家&lt;/strong&gt;标签。这是一个大的南京印刷塑料袋的厂家。另一方面，我读过的东西说在&lt;a href=&quot;http://www.guaguayin.cn&quot; target=&quot;_blank&quot;&gt;商业印刷&lt;/a&gt;的增长领域是标签，包装，和大幅面印刷。对这些服务的需求正在迅速增长去年同期，但这个技术可以消除需要自定义标签。我不确定这会在所有情况下都是真的，但技术是理想的位置，在一个增长的行业。此外，该设备将有利于自定义标签印刷的美学，因为印刷直接在没有标签的对象留下一个集成的、优雅的、有机的印象。印刷的图像成为对象的一部分，而不只是一个粘片印刷纸贴在产品。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	在所有的情况下，我看到了定制丝印用来装饰物，印刷品表面都需要基本持平（即使它是一个杯子，圆面仍然可以滚动圆柱杯为自定义的丝网印刷提供一个平坦的表面）。然而，根据施乐的产品资料，从喷墨印刷头基板的距离将允许在不规则表面印刷（本文参考曲线和微台阶面）。这将大大扩大的数量和项目上的直接对象的喷墨设备印刷种类。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	使用十油墨的能力将扩展色域很大，可能允许设计师以匹配几乎任何PMS颜色。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	速度是值得尊敬的。相比丝网印刷（一次的时间都花在了建立过程），数字印刷可以很慢。然而，印刷每小时30对象能力使得该设备更适合较长的数字生产运行。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	时间会告诉我们，但我认为这可能是一个改变南京印刷塑料袋的厂家游戏规则。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	我看过一个视频近日在呱呱印上。它表明一个激光切割机生产一系列的“亲切”的标签，然后卷标签卷而去除废料，废。我觉得这是中期年代再次和我看原来的南京印刷塑料袋的厂家。激光真的时代已经到来。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	首先，一个信息点。“吻切”是贯穿磨砂标签底纸完整而离开。做到这一点的一个激光，主要燃烧而不是削减衬底，令人印象深刻。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	这里是一个视频的简短描述，可以发现在线。（我相信很多激光切割制造商都有自己的版本。）首先，宽卷退绕张力辊预印标签通过为玻璃覆盖的塔，激光冲过报刊表跟踪的所有标签的轮廓。你可以看到明亮的火焰为激光烧穿了纸料，而真空立即把烟和纸灰从外壳。（视频、激光的控制台盖已被删除，所以你可以看到如何激光工作。）&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	作为平版纸网页左激光外壳，它通过多辊，消除周围的标签系列印刷废纸。滚轮彼时纸到卷筒的Web。我鼓励你去找到这个或任何其他视频演示激光切割。这真的很让人印象深刻。&lt;/p&gt;','','','',2,1,4294967295,'',0,'','',0,2147443200,''),(76,2,'南京激光印刷制本厂有限公司','&lt;p&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;对激光切割的到来之前，印刷机在画册印刷时用旋转模具或模具。金属规则插入木头的刀模的一侧穿过了底停在木头或金属，在纸。然后，&lt;strong&gt;南京印刷制本厂&lt;/strong&gt;有限公司将废弃物（不需要）被删除。你可以从口袋夹名片的酒瓶标签这样做什么。然而，它需要时间和金钱成本使金属模具。因此，你不能在经济上使一个单一的原型模具。这是唯一符合成本效益的长期印刷模切产品运行。&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	然后，用激光切割的未来，商业印刷供应商可以使用数字数据控制激光束将从一个地方复制到其成品拷贝数量无限。由于激光切割不需要金属模具，无需付死，等待他们的是由专家，并小心存放，使用后。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	激光或旋转模切：每个的利弊,随着广播电视、激光切割的出现，就成为一个问题的选项。南京印刷制本厂有限公司的旋转模具仍使用，他们提供的好处激光不。这里有一个表时要用一个与其他。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	激光可以切割复杂图案。金属模具不能旋转。所以如果你是模切雪花变成一张名片，例如，你想使用激光。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	激光可以有效地降低产品的成本，因为没有钱去制作模具。因此，如果你想产生一个奇特的科隆纸箱模切原型，激光切割将是技术的选择。如果你想推出一个巨大的运行同一个科隆纸箱模切可能是可取的，因为它比激光切割速度更快。在这一点上，你可以传播到整个新闻运行的金属模具的成本。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	市场对新产品的速度通常是很重要的。如果是这种情况，激光切割的工作是理想的因为没有等待时间的模具制造商创建模具旋转机或平板机。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	激光不会平淡如金属切削的规则。如果你使用的是南京印刷制本厂有限公司金属旋死，他们最终会枯燥和需要更换。这要花费时间和金钱。激光切割，避免了这个问题。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	激光器比旋转模切速度较慢，特别是切割厚材料时。厚的纸（或其它基板）减慢激光刀但有任何影响的金属模具的旋转或平板模切。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	如果您使用的是激光切割机的100种不同的切割方式，没有存储空间，由于模具规范只存在于数字的形式在计算机。另一方面，如果你做的旋转模切然后存储100死了，你会需要额外的存储空间，以保证他们的安全和锋利。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	不仅制作金属模具也使用旋转或平板机需要熟练的劳动力。相反，一旦你知道如何使用激光切割机，该设备的整体运行比旋转模切，因为它需要更少的工作更轻松。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	激光切割设备的费用，购买比旋转模切设备多。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	激光切割设备可设置，然后重新组合比旋转模切设备快得多的新工作。&lt;/p&gt;','','','',2,1,4294967295,'',0,'','',0,2147443200,''),(77,2,'南京印刷厂吊牌印刷如何变革','&lt;p&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;所以一个快速回答的问题可能是：使用原型和短期运行在快速变化是必要的激光，旋转或平板（传统金属模切）当底物难以切割和/或当你有一个长期模切做。理想情况下你会访问技术。&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	另一种选择：刀绘图仪。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	我没有提到的另一个选择，我碰到过，其中包括金属切削刀具和激光切割的数字信息。该机被称为“刀机，“一些大幅面喷墨印刷机的配置这样的工具。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	基本上垂直于刀柄是一张乙烯在（以上来自呱呱印的吊牌标签印刷，例如），利用计算机数字信息精确地跟踪每个标签的周长。然后，操作者可以剥离废料，留下“亲切”印刷标签底纸。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	我在网上看到的&lt;strong&gt;南京印刷厂吊牌&lt;/strong&gt;印刷很小，比金属规则模切速度较慢，但理想的一个小的由一个小厂生产。事实上，这将是一个理想的商业印刷厂商谁不想成熟的模切，有短期的工作，不想分包工作。&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/public/upload/article/2018/11-07/8f8f093f1328e01bfb6c91e7f5c00a13.jpg&quot; title=&quot;吊牌印刷厂&quot; alt=&quot;吊牌印刷厂&quot;/&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	对于自定义印刷贸易的影响，所有这些选项实际上说了很多关于商业印刷的状态，特别是南京印刷厂吊牌印刷创建标签是一个庞大而迅速增长的组件的自定义印刷世界。这是大企业，并有不断增长的需求。否则，厂家不会争先恐后地提供模切数字期权。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	市场上模切机的具体尺寸（绘图仪和激光切割）似乎正适合标签制作要求。它是明确的，短的，个性化的运行现在的规范标签、贴、等。的大小，格式，南京印刷厂吊牌印刷和激光切割都支持小格式，短期经济和个性化要求的标签和标签生产吊牌印刷。&lt;/p&gt;','','','',2,1,4294967295,'',0,'','',0,2147443200,''),(78,2,'南京印刷制本厂有限公司','&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	对激光切割的到来之前，印刷机在画册印刷时用旋转模具或模具。金属规则插入木头的刀模的一侧穿过了底停在木头或金属，在纸。然后，&lt;strong&gt;南京印刷制本厂&lt;/strong&gt;有限公司将废弃物（不需要）被删除。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	你可以从口袋夹名片的酒瓶标签这样做什么。然而，它需要时间和金钱成本使金属模具。因此，你不能在经济上使一个单一的原型模具。这是唯一符合成本效益的长期印刷模切产品运行。然后，用激光切割的未来，商业印刷供应商可以使用数字数据控制激光束将从一个地方复制到其成品拷贝数量无限。由于激光切割不需要金属模具，无需付死，等待他们的是由专家，并小心存放，使用后。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	激光或旋转模切：每个的利弊。随着广播电视、激光切割的出现，就成为一个问题的选项。南京印刷制本厂有限公司的旋转模具仍使用，他们提供的好处激光不。这里有一个表时要用一个与其他：激光可以切割复杂图案。金属模具不能旋转。所以如果你是模切雪花变成一张名片，例如，你想使用激光。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	激光可以有效地降低产品的成本，因为没有钱去制作模具。因此，如果你想产生一个奇特的科隆纸箱模切原型，激光切割将是技术的选择。如果你想推出一个巨大的运行同一个科隆纸箱模切可能是可取的，因为它比激光切割速度更快。在这一点上，你可以传播到整个新闻运行的金属模具的成本。&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/public/upload/article/2018/11-07/2a1d79d1257c5a366d1cbdfc48158601.jpg&quot; title=&quot;南京印刷制本厂&quot; alt=&quot;南京印刷制本厂&quot;/&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	市场对新产品的速度通常是很重要的。如果是这种情况，激光切割的工作是理想的因为没有等待时间的模具制造商创建模具旋转机或平板机。激光不会平淡如金属切削的规则。如果你使用的是南京印刷制本厂有限公司金属旋死，他们最终会枯燥和需要更换。这要花费时间和金钱。激光切割，避免了这个问题。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	激光器比旋转模切速度较慢，特别是切割厚材料时。厚的纸（或其它基板）减慢激光刀但有任何影响的金属模具的旋转或平板模切。如果您使用的是激光切割机的100种不同的切割方式，没有存储空间，由于模具规范只存在于数字的形式在计算机。另一方面，如果你做的旋转模切然后存储100死了，你会需要额外的存储空间，以保证他们的安全和锋利。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	不仅制作金属模具也使用旋转或平板机需要熟练的劳动力。相反，一旦你知道如何使用激光切割机，该设备的整体运行比旋转模切，因为它需要更少的工作更轻松。激光切割设备的费用，购买比旋转模切设备多。激光切割设备可设置，然后重新组合比旋转模切设备快得多的新工作。&lt;/p&gt;','','','',2,1,4294967295,'',0,'','',0,2147443200,''),(79,2,'南京印刷票据带背胶的好处','&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	我是一个帮助客户最近有高的网页数印刷的书一个简短的新闻运行：500份488页，8.5“×11”精装书。里面的文字是四色全。我认为，由于短期内的长度，这将是一个数字媒体的完美契合。因为我有一个与HP Indigo印刷机密切合作，我找我的眼镜销售代表，但我对她的回答感到惊讶。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	她说，印书要便宜，通过抵消光刻由于每一页上的四色工作。她说，“&lt;strong&gt;南京印刷票据带背胶&lt;/strong&gt;”将是一个杀手，当你考虑在每四页的点击（C，M，Y，K）488页。所以她要的书我对她的商业印刷公司的胶印设备。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	大多数印刷机租赁他们的数码印刷设备。他们不拥有它。因此，数字印刷机制造商收取费用（印刷机每次点击费）支付维修费用（修理以保持“时间”的现场设备到绝对最低）有时耗材（例如液体调色剂，）。这个点击费用通常是在每一个页面，每色率增加（即，由数字媒体展示次数）。因此，商业印刷供应商通过对客户成本。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	所以我让我的印刷机客户的工作是说，假设500份488页南京印刷票据带背胶的四点击收费每页为青色，马真塔，黄色，黑色，价格会超过印刷作业的成本通过平版印刷。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	如何比较胶印数码印刷？数字媒体（的情况下HP Indigo商业印刷我的工作与生产厂商）的四幅（相互层叠）在橡皮布滚筒创建全彩图像再将图像从毯子的印刷纸。静电电荷保持液体碳粉（墨水）在毯子上直到转印纸。&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/public/upload/article/2018/11-07/c39790a41fce1fef23b28468655cc908.jpg&quot; title=&quot;&quot; alt=&quot;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/Uploads/Picture/2017-03-07/58be0b0441d6d.jpg&quot; title=&quot;南京印刷票据&quot; alt=&quot;南京印刷票据&quot;/&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	以类似方式，胶印机印刷图像，彩色的颜色，本文通过出版社，从输墨装置对输墨装置。四印刷板（青、马真塔、黄、黑）各出版社毯产生图像，和毯子转让四处理图像到基板（上下各一个）。一旦按下表经过四输墨装置，进行了全过程的颜色放在另一个接收图像。（记住，南京印刷票据带背胶过程的颜色是透明的，所以青、马真塔，黄色，和黑色的图像不模糊的另一个。而他们共同创造和提高彩色图像。）&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	可以说，数字和胶印商业印刷，转移最终印刷图像的毯子上，毯子上的印刷纸是相似的。因此，它并没有让我吃惊，我客户的四色对惠普Indigo数字印刷机的报价，488页的南京印刷票据带背胶要高，实际上成本比胶印平版印刷机运行的工作。&lt;/p&gt;','','','',2,1,4294967295,'',0,'','',0,2147443200,''),(80,2,'海报印刷带背胶有多实用','&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	这一点我很高兴听到来自同事，自定义印刷工作价格的&lt;strong&gt;海报印刷带背胶&lt;/strong&gt;是基于印刷油墨的实际使用而不是按点击收费。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	所以我做了一些研究。HP T410是一个大的格式，卷筒纸书出版社。它本质上是一个网络新闻（就像一个偏置网络新闻）。但在这种情况下，而不是使用平板印刷，数字印刷机印书通过喷墨印刷头阵列（就像一个巨大的、卷筒版本的桌面喷墨印刷机）。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	当你比较描述两按文献（HP Indigo和HP T410），你会看到，油墨的干燥是每台机器上的处理方式不同。在电子照相数码印刷机（例如HP Indigo，），图像已经干了时，它是从橡皮布滚筒转印到承印物上（四种颜色转一次）。因此，有很多的灵活性，在印刷基板上可以使用，因为干图像不会渗入纸张纤维。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	相反，在惠普T410，喷墨机的规格表，红外（IR）可参考浮干燥机区为干燥法。所以基本上一个特定频率的光固化油墨（大概是瞬间，与UV油墨，在UV光固化）。为什么会这样？&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	我的同事指出，没有点击收费这数字印刷机，客户只须支付由平方英寸彩色。有了这些海报印刷带背胶信息，我做了更多的研究海报印刷带背胶。我验证了他的要求（产品文献证实，您只需支付您使用的墨水）。&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/public/upload/article/2018/11-07/f192df39e50513ee1062a5f901fda11e.jpg&quot; title=&quot;&quot; alt=&quot;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/Uploads/Picture/2017-03-08/58bfa700d4874.jpg&quot; title=&quot;海报印刷带背胶&quot; alt=&quot;海报印刷带背胶&quot;/&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	这是一个由于以下原因而戏剧性的新要求。在平版胶印机，如果你把任何过程的彩色图像甚至一页，你还在支付，特别是新闻片方在所有页四色。（这可能是一个16页的新闻形式或一个32页的新闻形式。16页，8页）总之，你付出了很多“开放”的一个侧面的新闻形式进行色彩。所以，如果你够聪明，你会利用的费用和放置过程的颜色（许多）的新闻“形式”特别这一侧的其他页面（一个新闻片，最终会被折叠成一个按“签名”的一方）为了分配成本。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	相反，在HP Indigo，如果你印刷任何色彩任何个人页的一本书，你所有的四种颜色（四点击收取费用）。即使你的彩色图像是一个小的标志，这是真的。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	但基于HP的文学，如果你使用海报印刷带背胶，你同样的海报印刷带背胶过程，颜色分布会收取较高或较低的只靠平方英寸的彩色印刷图像的大小。我的客户的印刷书，定价工作基于颜色的数量，而不是彩色的页数可能会产生一个庞大的储蓄。我们将要看到的。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	我需要先看看，我的假设是，并不是所有的印刷机有HP T410。事实上，我认为海报印刷带背胶，相对较少的印刷机做。毕竟，概念印刷书籍使用喷墨技术，网络媒体是相对较新的。&lt;/p&gt;&lt;p&gt;然而，如果我能找到一个这样的商业印刷供应商，如果喷墨印刷的工作对涂布纸生产样品相媲美的HP Indigo数字印刷的照相，我会惊喜。&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;','','','',2,1,4294967295,'',0,'','',0,2147443200,''),(81,2,'杂志印刷的成本及费用解析','&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	我的一个亲密的朋友是个杂志迷。他最近的一篇文章引起了我的注意在3月份的&lt;strong&gt;杂志印刷&lt;/strong&gt;行业趋势，介绍了3D印刷汽车零件的研究进展。我不得不承认，我是持怀疑态度的，因为我是在上世纪70年代，当我在我哥哥的塑料摩托车骑。但我错了，然后（这是一个很好的自行车），和做一些阅读现在3D印刷汽车零部件，我成为好处感兴趣。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	这篇文章我的朋友送给我的是一列由杂志印刷成本生态题为“三维类：行业呈现出一种新的方式来设计和制造汽车。&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/public/upload/article/2018/11-07/2ee79c66455865c6efcf18c4cf6cca91.jpg&quot; title=&quot;&quot; alt=&quot;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/Uploads/Picture/2017-03-09/58c0ae23a8c1f.jpg&quot; title=&quot; 杂志印刷&quot; alt=&quot; 杂志印刷&quot;/&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	本文对印刷厂的工作，他研究了气体和混合动力汽车，由于他对地球的关注对环境的影响。他发现，制造车辆和燃料占到车辆的环境影响百分之75（据阿贡国家实验室的生命周期GREET模型数据）。于是他开始寻找金属冲压和焊接汽车部件的替代品。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	因此建立发散3D在南京，江苏南京，在那里他用“现成的碳纤维管和单品，“随着3D自定义印刷，创建一个汽车底盘，是制造和重量比传统产品轻便宜。它将“适应任何类型的身体、动力总成、内涵与特征”（“三维类：行业呈现出一种新的方式来设计和制造汽车”）。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	根据这篇文章，一个“原型叶片采用69节点的杂志印刷的费用过程中，每一种都是3D印刷的激光烧结粉末铝连接一个错综复杂的碳纤维管和蜂窝铝或碳纤维板都是现成的商品的部分”（“三维类：行业呈现出一种新的方式来设计和制造汽车”）。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	（有趣的一点是，激光烧结是一系列的过程，包括直接金属激光烧结、选择性激光烧结、和电子束添加剂制造，使用激光或电子束熔化和熔合金属粉末或金属丝做成可用stable-3-d形式，建立物质逐层从三维计算机辅助设计模型。）&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	包装盒的文章指出底线：制造成本和复杂性的“急剧下降”，由此推断杂志印刷的成本，如果有在制造复杂的下降，将有一个减少对环境的影响。&lt;/p&gt;','','','',2,1,4294967295,'',0,'','',0,2147443200,''),(82,2,'海报印刷157克铜版纸有多好','&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	当我读这篇文章，我想起了&lt;strong&gt;海报印刷157克铜版纸&lt;/strong&gt;在60年代，让孩子与有限数量的联锁塑料件建立任何东西。Czinger似乎做的是识别那些需要独特，生产这些三维添加剂制造，然后利用这些定制的汽车零件与标准（虽然简单，比平时更轻）部分完成汽车底盘的建设过程。简单等于便宜，减少对环境的破坏。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	如果汽车底盘强但比平时要轻得多，看来，燃油效率将提高。性能车，这将等同于更快的速度。然而，这也等同于在燃油效率大幅提高。更少的燃料，呱呱印在他最初的研究发现，与不太复杂的制造相结合，减少对环境的影响，车辆。&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/public/upload/article/2018/11-07/8a0680a1091e78f8fdb79f8e4ba8eb9d.jpg&quot; title=&quot;海报印刷157克铜版纸&quot; alt=&quot;海报印刷157克铜版纸&quot;/&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	Czinger的发散3D过程显然回避画汽车零部件的需要。Markus的文章指出，“非复合材料车身塑造的颜色或包装”（“三维类：行业呈现出一种新的方式来设计和制造汽车”）。消除汽车生产的绘画步骤将大大降低挥发性有机化合物（VOCs），进一步减少生产过程对环境的影响。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	从制造业总体来看（反对特别是汽车行业），数字化生产独特的部分下架商品部分结合简化的研究和开发，但海报印刷157克铜版纸仍然流行。最终的海报印刷生产。更具体地说，原型可以使内部快，然后改变响应测试次数。相反，没有三维制造，该样机的部分将需要发送注塑成型，这将是一个分包的过程中采取了大量的时间和金钱。总之，添加剂制造将使汽车的设计更加“灵活”，因此，更快，更便宜，并响应测试更容易调整。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	应用三维印刷技术的定制汽车生产将简化制造工艺，最大限度地减少库存，使“流水线”范式过时。例如，传统的方法是依靠数量有限的制造工厂，生产各种汽车零部件。这些零件被生产流水线上批量，并运出，放在最后使用的库存。（大部分是因为它是冲压或注塑模具数量巨大的汽车零部件在同一时间，然后存放。便宜）相反，使用三维添加剂制造，汽车零部件制造商可以生产只有特定的海报印刷157克铜版纸部分在需要的时候，可能消除或大大减少库存以及作为废物。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	这是更昂贵的安装三维定制印刷设备比建造生产设施的金属冲压和注塑成型。另一种方式把这句话是说，汽车零部件生产企业的进入成本较低，如果他们使用三维添加剂制造比如果他们需要具备传统制造与模具机械厂。据推测，这可能会导致大量的全国各地的汽车配件生产需要的基础上，小企业的成长。而不是有一个“中心”系统，所有被发送从一个制造商组成，制造将基于一个“细胞”系统，与最近的细胞制造汽车所需要的零件。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	这意味着范式的转变，从重视汽车零件本身对数字信息从汽车零部件可数字印刷。汽车零件本身也成为一种商品，但数字化制造信息的专有海报印刷157克铜版纸的价值将大幅上升。除了制造的下放，我认为这可能是一个三维的更深远的影响自定义印刷。&lt;/p&gt;','','','',2,1,4294967295,'',0,'','',0,2147443200,''),(83,2,'精装书籍印刷工艺及价格漫谈','&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	第一篇文章是来自Pew研究中心（网络、科技）网站，“使得一些关于&lt;strong&gt;印刷书籍&lt;/strong&gt;和阅读一般国家索赔，然后支持图表和统计。（多年来我一直在皮尤研究中心。一个毫无保留的信任）.&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	这是要求基于其调查和分析了Pew研究中心（引用）：“纸质书继续比电子书和有声书更受欢迎。”文章还说，在过去的十二个月，超过两倍的人读纸质书和电子书阅读。“近四十的美国人读纸质书完全；只有6%的数字只有书的读者。”&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	“超过1/4（28%）的中国人在印刷和数字格式的读的书都是精装书籍印刷工艺。”“38%读纸质书而不读任何数字格式的书。”&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	“与那些没有上大学的相比，大学毕业生更容易读的书一般，更愿意阅读印刷书籍，更容易消费数字图书内容。”&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	“…年轻人更可能比他们的长辈读的书在各种数字格式，但也更容易阅读和印刷书籍：72%去年已经阅读印刷书籍，有61%的老年人相比。”&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	“美国人的分享阅读的人为了研究兴趣的一个特定的主题在最近几年有所增加。”这与那些读到紧跟时事，那些学校学习或工作，和那些为了乐趣而阅读。自2011以来，“美国人的分享读书为了兴趣研究主题也增加了10个百分点…，从74%到84%。”&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/public/upload/article/2018/11-07/4ce4f02e0a0cc0254915388ca3273a13.jpg&quot; title=&quot;精装书籍印刷&quot; alt=&quot;精装书籍印刷&quot;/&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	“女性比男性更容易读的书一般也更愿意阅读印刷书籍。”&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	我们可以从这些信息中学习什么？首先，佩尤研究中心的统计数据表明印刷书籍不会去任何地方很快。他们还从读者比电子媒体。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	然而，许多人，尤其是年轻人，做阅读电子书以及印刷书籍价格，为乐，为工作或学习，随时了解时事，或他们感兴趣的研究课题。但是比印刷图书的电子书阅读器仍然是非常高的。文章还指出，虽然电子书读者人数从2011增加到2014，从17%到28%，不过它也从此保持稳定。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	格里芬出版社，“世界上最先进的书印刷机”，本文介绍的硬件和先进的图书印刷流程，注意以下（引用）：“公司已经安装了一个hpt410单色数码印刷机。”它补充说：“全一科尔布斯装订线到后面。”&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	“在试图创造这样的线–印在格里芬新的HP Indigo 10000和HP Indigo 7800印刷机现场–以前绊脚石盖。”格里芬说盖在scodix超亲箔点缀。”&lt;/p&gt;','','','',2,1,4294967295,'',0,'','',0,2147443200,''),(84,2,'印刷一本书要多少钱','&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	“格里芬正在产生一些45000本或1600万本书每一天的一年，在数字端到端的线，那么&lt;strong&gt;印刷一本书要多少钱&lt;/strong&gt;？”“它有两个其他惠普单色reelfed数码印刷机。”&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	格里芬”将保持其胶印机长期工作。”Peter George，首席执行官格里芬的母公司，PMP，指出，“亚马逊进入图书市场“改变了一切”，导致当地出版商要求快速印刷和短期运行，”他说，“印刷书籍显然是在这里停留。Kindle已经趋于平稳。”&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/public/upload/article/2018/11-07/88c1ddb273dffa4dea87d166fb50093a.jpg&quot; title=&quot;&quot; alt=&quot;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	我们可以从这些信息中学习什么？本文简洁地反映了&lt;a href=&quot;http://www.guaguayin.cn&quot; target=&quot;_blank&quot;&gt;印刷&lt;/a&gt;出版的当下。这是我从中推断出我的印刷一本书要多少钱？这无关乎数字阅读！&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	书刊印刷，最高效的设备是专用的，黑色的，碳粉数字印刷机。对我来说，格里芬按购买hpt410单色数码印刷机反映了公司认为，印刷书籍的工作比例最高将Bulk-Only文本块。相反的，有没有更好的设备，本书涵盖了比惠普Indigo数字印刷机。在我看来，没有什么更接近胶印印刷质量。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	就是说，需求印刷书籍一般高，反映在格里芬按预计年产1600万本书，从中推出印刷一本书要多少钱。（HP T410新闻–和HP最新的T400系列压力机–成本在2元到300万元之间（取决于新闻的插件）。这表明了严重的格里芬出版社关于“纸上的油墨的未来。”&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	直到最近，关注的焦点一直是印刷油墨在纸面上的数字。新闻片然后通过传统的模拟加工。现在有数字的粘合剂（本文引用一科尔布斯装订线）。按制造商已经开发了端到端的解决方案，将数字印刷和数字装订设备。这反映了厂商致力于数字图书生产，和他们的意识，消费者和企业都表现出对数字图书印刷需求。&lt;/p&gt;','','','',2,1,4294967295,'',0,'','',0,2147443200,''),(85,2,'南京标签印刷厂哪家好','&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	我们为什么需要印刷吊牌？为什么标签价格不透明？真的，导入南京标签印刷，就为了推广产品？&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;在南京标签报价你广泛的捏造的定制的价格标签和吊牌标签印刷。吊牌正迅速成为最有用的工具来提供需要的信息，关于贵公司产品在品牌之一。我们做各种吊牌印刷选项，如单侧和根据您的业务要求纸的两面印刷标签新潮、装饰或平原。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; 标签和挂标签可以帮助你获得知名度和促进您的业务，同时创造出专业的形象。骏马的行业和业务的公司，以促进并找出自己的品牌标签正在非常进口作用在时尚。&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;如果你要创业卖你手工项目布 （或如果你只是想让你看起来很花俏的手工艺品），它有道理要有正确的标签吗？这里是工艺的最好的布标签印刷公司在南京，不只是工艺的服装，但配件，钱包或任何种。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;我们提供你广泛的定制的布标签，标签、标签、贴纸、包装盒和其他包装作品在您的预算。印刷出的标签是一个伟大的选择，当你想要带有复杂设计的标签。你可以实现非常详细的以印刷出的标签和你有更大的自由与信息，您可以加入他们。选择哪种类型的印刷的标签会为你工作时，请考虑您的服装面料。&lt;/span&gt;&lt;/p&gt;','','','',2,1,4294967295,'',0,'','我们为什么需要印刷吊牌？为什么标签价格不透明？真的，导入南京标签印刷，就为了推广产品？',0,2147443200,''),(128,1,'支付方式','&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	呱呱印支持账户余额支付、银联支付、企业网银、支付宝支付、微信支付、转账汇款等方式进行支付，可根据您的使用喜好进行选择。南京地区支持货到付款，签约大客户可签约月结。&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/public/upload/article/2018/11-08/ea812c66710c1a3f344caa58fa5f6780.jpg&quot; title=&quot;&quot; alt=&quot;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	温馨提示：&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	1、您可以通过网上银行、银行柜台汇款、ATM机转账等方式进行汇款；&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	2、汇款时请多加一个尾数，以便准确为您进行款项确认；&amp;nbsp;&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	3、汇款后请联系客服，以便及时为您确认款项到达；&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	4、如&lt;span style=&quot;line-height:1.5;&quot;&gt;需开发票，请汇款至我司对公账户。&lt;/span&gt;&lt;/p&gt;','','','',2,1,4294967295,'',0,'','',0,2147443200,''),(129,1,'购买流程','&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	1、在呱呱印官网，找到自己所要印刷的产品，我们提供如下几种印刷产品：&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; 常规爆款印品－严选主流高性价比的印刷品，您可以查看印品描述并直接在线下单；&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; 定制印刷－在线自助组合搭配不同规格参数，自动获取报价并直接在线下单；&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; 现货通用品－精选通用现货产品，可一件起订并直接在线下单；&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; 包装盒定制设计－专版定制各类包装盒的设计、打烊、印刷，可免费获取报价；&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	2、进入产品页面，按步骤确定印刷属性及数量，设置好点击&amp;quot;立即购买&amp;quot;&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	3、进入提交订单页面，按步骤填写收货信息，提交成功后进入支付页面完成&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	4、如您自己拥有印刷文件，下单付款后，需您上传文件，呱呱印客服审稿安排印刷，如不符合印刷要求，会联系您。如您选择使用我们的设计服务，设计师将与您沟通定稿；&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;\r\n	5、下单付款完成后，我们会根据产品生产周期，如期将印品通过物流公司送到您手上。&lt;/p&gt;','','','',2,1,4294967295,'',0,'','',0,2147443200,''),(130,1,' 配送方式及费用','<div style=\"font-size:14px;font-family:微软雅黑;color:#666666;background-color:#FFFFFF;\">\r\n	呱呱印目前支持快递、物流（德邦物流、佳吉物流）、自取三种配送方式。您可根据实际情况选择，具体配送费用详见提交订单页面。\r\n</div>\r\n<div style=\"font-size:14px;font-family:微软雅黑;color:#666666;background-color:#FFFFFF;\">\r\n	（1）快递：\r\n</div>\r\n<div style=\"font-size:14px;font-family:微软雅黑;color:#666666;background-color:#FFFFFF;\">\r\n	呱呱印暂不支持指定快递，具体发货快递会根据您所在的区域系统自动分配。快递默认为韵达、圆通、中通快递，偏远地区或乡镇区域由EMS配送；\r\n</div>\r\n<div style=\"font-size:14px;font-family:微软雅黑;color:#666666;background-color:#FFFFFF;\">\r\n	其中，全国站（华中地区、华北地区）发韵快递；\r\n</div>\r\n<div style=\"font-size:14px;font-family:微软雅黑;color:#666666;background-color:#FFFFFF;\">\r\n	全国站（华东地区）发中通快递\r\n</div>\r\n<div style=\"font-size:14px;font-family:微软雅黑;color:#666666;background-color:#FFFFFF;\">\r\n	全国站（华南地区）发圆通快递\r\n</div>\r\n<div style=\"font-size:14px;font-family:微软雅黑;color:#666666;background-color:#FFFFFF;\">\r\n	加急快递：由顺丰配送，客户需补快递费用差价或顺丰到付。\r\n</div>\r\n<div style=\"font-size:14px;font-family:微软雅黑;color:#666666;background-color:#FFFFFF;\">\r\n	具体待订单发货之后可以在订单里面查看\r\n</div>\r\n<span style=\"color:#666666;font-family:\'Microsoft Yahei\', Verdana, Tahoma, sans-serif;line-height:12px;background-color:#FFFFFF;\">&nbsp;</span> \r\n<div style=\"font-size:14px;font-family:微软雅黑;color:#666666;background-color:#FFFFFF;\">\r\n	（2）物流：\r\n</div>\r\n<div style=\"font-size:14px;font-family:微软雅黑;color:#666666;background-color:#FFFFFF;\">\r\n	发到离收货地址最近的物流公司营业网点，需要亲自去物流公司的营业网点领取货物。\r\n</div>\r\n<div style=\"font-size:14px;font-family:微软雅黑;color:#666666;background-color:#FFFFFF;\">\r\n	物流比快递运送周期长，且必须持收货人身份证原件上门自取。\r\n</div>\r\n<div style=\"font-size:14px;font-family:微软雅黑;color:#666666;background-color:#FFFFFF;\">\r\n	提示：货物信息发出后将无法更改，请您核对好信息，方便收货。\r\n</div>\r\n<span style=\"color:#666666;font-family:\'Microsoft Yahei\', Verdana, Tahoma, sans-serif;line-height:12px;background-color:#FFFFFF;\">&nbsp;</span> \r\n<div style=\"font-size:14px;font-family:微软雅黑;color:#666666;background-color:#FFFFFF;\">\r\n	（3）自取：\r\n</div>\r\n<div style=\"font-size:14px;font-family:微软雅黑;color:#666666;background-color:#FFFFFF;\">\r\n	出货之后，我们会电话通知您，接到电话通知之后即可去对应自取点取货，运费全免。\r\n</div>\r\n<p style=\"font-size:14px;font-family:微软雅黑;color:#666666;background-color:#FFFFFF;\">\r\n	取货地点持续扩充中，请您在下单选择配送方式时查看具体内容。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>','','','',2,1,4294967295,'',0,'',NULL,0,2147483647,''),(131,3,'退换货说明','印刷品属于定制商品，由于过程复杂，可能会出现数量损耗的问题。为了保障您的权益，您在收到商品后，经过核对数量之后若发现数量不足或个别损耗，我们将根据实收款退还相关差额：<br />\r\n<span>实收款=实际量“可用”量÷标示量×商品总价</span><br />\r\n<span>请您在收到商品后，仔细核对数量。如发现包装严重破损或货量明显缺失，请速与客服联系。</span><br />\r\n<br />\r\n<span>● 什么情况可以进行退款？</span><br />\r\n<span>印刷类订单：仅限在未进行印刷情况下的订单，可申请退款</span><br />\r\n<span>设计类订单：原创设计订单的设计需求未通过审核，或在规定时间为无任何设计师进行设计投稿，可申请退款。</span><br />\r\n<span>退款将会按照原支付来路进行退还。</span><br />\r\n<img src=\"/Uploads/Editor/2016-09-24/57e68263c7f8a.png\" alt=\"\" /><br />\r\n<span>● 什么是账户余额？可以提现吗？</span><br />\r\n<p>\r\n	<span>因客户方面原因造成的退款以及售后补偿，将退还至账户余额中，</span><span>账户余额暂不可以提现</span><span>。</span>\r\n</p>\r\n<p>\r\n	<span>●关于退款流程</span>\r\n</p>\r\n<span>请联系在线客服，告知您的用户ID和退款金额，并提供如下必要资料：</span><br />\r\n<span>支付宝提现：支付宝账户名、账号对应姓名</span><br />\r\n<span>银行账户提现：银行名称、账号、开户姓名（注：非信用卡）</span><br />\r\n<span>客服人员在收到您的资料后核对无误将提交至财务尽快为您处理。</span><br />\r\n<span>如您使用优惠券购买了单个商品，商品退货时现金券不退还，只退还您的实际支付金额；</span><br />\r\n您使用优惠券的订单中有多个商品，优惠券抵扣金额将按商品价格比例分配到每一个商品之中。若订单中的商品发生部分退货，退回款项则为退货商品价格减去对应的优惠券抵扣金额。\r\n<p>\r\n	<span>●退款到账时间</span> \r\n</p>\r\n<span>支付宝提现：自受理之日起3个工作日内转至您的支付宝账号</span><br />\r\n<span>银行提现：自受理之日起5-7个工作日内转至您的银行卡</span>','','','',2,1,4294967295,'',0,'',NULL,0,2147483647,''),(132,3,'发票制度','呱呱印商品印刷产品及原创设计均为含税价格。<br />\r\n<span style=\"font-size:14px;\"><strong>如何获得发票？</strong></span><br />\r\n目前下单时填写发票信息，即可开具发票，发票将随印刷品一并寄出。<br />\r\n<strong><span style=\"font-size:14px;\">发票金额</span></strong><br />\r\n&nbsp;呱呱印仅开具现金购物金额的发票，不含发票寄送运费、优惠券、礼品卡、余额支付等金额。&nbsp;<br />\r\n<strong><span style=\"font-size:14px;\">发票抬头</span></strong><br />\r\n呱呱印提供正规机打发票，发票抬头不能为空，因此需填写个人或单位名称。<br />\r\n发票抬头为个人的，请提供身份证号码，为单位的，请提供单位税号。<br />\r\n<strong><span style=\"font-size:14px;\">发票寄送</span></strong><br />\r\n为尽最大可能快速、便捷地为客户提供服务，呱呱印商品直接从全国各地的印刷厂发货，故有的发票不能随产品一同寄出，可在发票中心统一申请开票，开票金额大于等于200元，我们将免费为您寄送。开票金额少于200元，需补交快递费10元或选择快递到付。如果您不急于报销，可以累积满200元后统一开票。<br />\r\n<span style=\"font-size:14px;\"><strong>发票类型与区别</strong></span><br />\r\n现呱呱印可开具增值税普通发票和增值税专用发票，具体区别及所需资料如下：<br />\r\n1、开具增值税普通发票，需提供：<br />\r\n若为企业单位，需提供正确无误的公司名称和税务登记证号及购买的订单编号。<br />\r\n若为个人，需提供正确无误的姓名和身份证号码及购买的订单编号。<br />\r\n2、开具增值税专用发票（需具备一般纳税人资格的企事业单位），提供以下资料：<br />\r\n开票信息（公司名称、纳税人识别号、企业开户银行、银行账号、注册地址、注册电话和购买的订单编号）<br />\r\n补开发票时效<br />\r\n呱呱印可以为您补开从下单日之日起90天内的发票，超出下单日期90天的订单，呱呱印不能为您补开发票。给您带来不便敬请谅解！&nbsp;<br />','','','',2,1,4294967295,'',0,'',NULL,0,2147483647,''),(133,3,'售后政策','呱呱印是国内领先的、深受用户喜爱的网络设计印刷平台，具有完善的信誉和服务保障。<br />\r\n<br />\r\n1. 呱呱印出品的所有印刷品，均符合国家及有关部门的技术标准和规范，满足用户订单要求。<br />\r\n如出现质量问题，可全部免费重印发货，相关费用由呱呱印为您承担。（注：呱呱印不承担印刷品及运费以外的其他引申费用。）<br />\r\n以名片产品为例，用户可参照以下质量标准，检验收到的名片成品是否符合要求。<br />\r\n1）印刷内容无误：为用户提交名片设计稿中所承载的所有名片内容；<br />\r\n2）印刷材质无误：为用户提交名片订单时所选取的印刷纸质；<br />\r\n3）印刷墨色均匀：名片成品整体色调调和，没有大面积的颜色不均；<br />\r\n4）名片色值与名片设计稿相符：名片印刷色差部分在行业公认标准内，即C.M.Y.K各值误差±10%以内的视为与原设计稿色值相符，为正常印刷品；<br />\r\n5）名片尺寸划一：成品尺寸标准为名片设计稿裁切出血后尺寸，长、宽尺寸允许公差±1.5mm。<br />\r\n注：如果您收到的印刷成品颜色、裁切、圆角切割等误差在正常范围内，则不属印刷质量问题，还请谅解。<br />\r\n<br />\r\n非我方原因造成的产品质量不良包括：<br />\r\n1）非我方原因造成的印刷稿版式或文字有错误、图片精度未达到300dpi的等.<br />\r\n2）由设计师或客服提醒之后客户自行确认过印刷的文件，后期出现的文件内容不符、切边、四色模糊、脏版、折不准等<br />\r\n3）产品签收后产生的受潮、染色等<br />\r\n4）收到的印刷成品颜色、裁切、圆角切割等误差在正常范围内<br />\r\n5）执意使用紫色、深蓝色、橙色、咖啡色、强金属色、渐变红色这几种颜色印刷而产生色差的订单<br />\r\n6）我方准时出货，因物流公司原因造成货物晚到的<br />\r\n7)其他由于用户原因造成的<br />\r\n<br />\r\n2. 印刷品属于定制商品，大多采用拼版印刷方式，价格便宜出货速度快，但是机器大批量作业，过程复杂，难免会出现个别数量损耗以及正常的误差问题。为了保障您的权益，您在收到商品后，经过核对数量之后若发现数量不足或个别损耗，我们将根据实收款退还相关差额：<br />\r\n实收款=实际量“可用”量÷标示量×商品总价<br />\r\n请您在收到商品后，仔细核对数量。如发现包装严重破损或货量明显缺失，请速与客服联系。<br />\r\n<br />\r\n3. 对于签收后，客户发现的商品质量问题，呱呱印同样会为您解决。<br />\r\n请将20-30份的问题产品叠放在一起，露出问题所在地方，拍摄清晰照片若干发给在线客服MM，我们将核实处理。<br />\r\n<br />\r\n4. 运输过程中的损坏全部由呱呱印承担。<br />\r\n特别提醒：鉴于印刷行业的特殊性，如您在收货后发现有任何问题，请务必于收到实物后3天内联系我们！即包裹签收之日起3天内为处理有效期，超过此失效的问题订单无法处理，如有不便之处敬请见谅！<br />\r\n注：如发现包装严重破损或被雨水打湿等严重现象，签收人可拒收。<br />\r\n<br />\r\n<p>\r\n	经核实是呱呱印原因造成印刷质量问题的，相关解决方案如下：\r\n</p>\r\n<p>\r\n	<table style=\"width:100%;\" cellpadding=\"2\" cellspacing=\"0\" border=\"1\" bordercolor=\"#000000\">\r\n		<tbody>\r\n			<tr>\r\n				<td style=\"text-align:center;\">\r\n					问题种类\r\n				</td>\r\n				<td style=\"text-align:center;\">\r\n					对应情况\r\n				</td>\r\n				<td style=\"text-align:center;\">\r\n					解决方案\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"text-align:center;\">\r\n					<span>严重色差</span><br />\r\n				</td>\r\n				<td style=\"text-align:center;\">\r\n					<span>颜色偏差超过行业规定范围（±10%）以上&nbsp;</span><br />\r\n				</td>\r\n				<td style=\"text-align:center;\">\r\n					<span>重印/补偿</span><br />\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"text-align:center;\">\r\n					<span>内容出错</span><br />\r\n				</td>\r\n				<td style=\"text-align:center;\">\r\n					<span>名片实物显示内容与客户定制模板不同</span><br />\r\n				</td>\r\n				<td style=\"text-align:center;\">\r\n					<span>重印/补偿&nbsp;</span><br />\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"text-align:center;\">\r\n					<span>质量损坏&nbsp;</span><br />\r\n				</td>\r\n				<td style=\"text-align:center;\">\r\n					<span>切边、成品上有污渍或杂质、图案或字迹模糊不清晰等</span><br />\r\n				</td>\r\n				<td style=\"text-align:center;\">\r\n					<span>重印/补偿&nbsp;</span><br />\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"text-align:center;\">\r\n					<span>工艺错误</span><br />\r\n				</td>\r\n				<td style=\"text-align:center;\">\r\n					<span>未按照客户要求工艺制作</span><br />\r\n				</td>\r\n				<td style=\"text-align:center;\">\r\n					<span>补偿/退费</span><br />\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"text-align:center;\">\r\n					<span>快递相关</span><br />\r\n				</td>\r\n				<td style=\"text-align:center;\">\r\n					<span>错件、货物严重损坏等</span><br />\r\n				</td>\r\n				<td style=\"text-align:center;\">\r\n					<span>重印/补偿</span><br />\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"text-align:center;\">\r\n					<span>实物破损</span><br />\r\n				</td>\r\n				<td style=\"text-align:center;\">\r\n					<span>出现边缘破损、毛边、起膜、起皱等影响正常使用的情况</span><br />\r\n				</td>\r\n				<td style=\"text-align:center;\">\r\n					<span>补偿/退费</span><br />\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"text-align:center;\">\r\n					<span>数量缺失</span><br />\r\n				</td>\r\n				<td style=\"text-align:center;\">\r\n					<span>超过总数量5%且不低于50</span><br />\r\n				</td>\r\n				<td style=\"text-align:center;\">\r\n					<span>补印/退费</span><br />\r\n				</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n<strong><br />\r\n</strong>\r\n</p>\r\n<p>\r\n	<span style=\"line-height:1.5;\">解决方案说明：</span>\r\n</p>\r\n补偿：返还一定比例积分至用户呱呱印或在客户下次订制时增加印刷量<br />\r\n退费：退还客户已支付费用中未实际操作部分<br />\r\n重印：指按订单数量全部重新印刷后补发普通快递件<br />\r\n补印：订单按缺失部分数量重新印刷后补发普通快递件<br />\r\n<br />','','','',2,1,4294967295,'',0,'',NULL,0,2147483647,''),(134,4,'联系我们','&lt;p&gt;您好，如需帮助请按照以下方式联系我们，我们会及时回复。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;电话：025-85563008 （周一至周六 09:00～18:00）&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;邮 箱：service@guaguayin.cn&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;地 址：南京市江宁区双麒路南圩28号&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;在线客服：&lt;a target=&quot;_blank&quot; href=&quot;http://wpa.qq.com/msgrd?v=3&amp;uin=1172760429&amp;site=qq&amp;menu=yes&quot;&gt;&lt;img src=&quot;http://wpa.qq.com/pa?p=2:1172760429:51&quot; alt=&quot;点击这里给我发消息&quot; title=&quot;点击这里给我发消息&quot;/&gt;&lt;/a&gt;&lt;/p&gt;','','','联系我们',2,1,1541562586,'',0,'','',1038,1541606400,''),(135,4,'诚聘英才','&lt;p&gt;加入呱呱印&lt;/p&gt;&lt;p&gt;我们是一群怀揣着一点点梦想的年轻人；&lt;/p&gt;&lt;p&gt;我们是互联网的忠实信徒，相信世界正在因互联网而改变；&lt;/p&gt;&lt;p&gt;我们崇信技术的力量；&lt;/p&gt;&lt;p&gt;我们倾向于组建小而精悍的团队；&lt;/p&gt;&lt;p&gt;我们喜欢快速反应的工作节奏；&lt;/p&gt;&lt;p&gt;我们挚爱正在从事的工作，那是我们相当一部分的乐趣所在；&lt;/p&gt;&lt;p&gt;我们热爱我们的用户，对用户的喜怒哀乐感同身受；&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;我们在寻找新成员&lt;/p&gt;&lt;p&gt;我们的事业正在迅猛发展，诚邀和我们一样有梦想、有激情的年轻人加盟，共创未来。&lt;/p&gt;&lt;p&gt;可发送简历至：hr@guaguayin.cn，并注明应聘岗位名称，谢谢！&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;市场专员（5人）&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;职位要求：&lt;/p&gt;&lt;p&gt;&amp;nbsp;1.一年以上互联网市场工作经验，有EDM与微博推广经验者优先。&lt;/p&gt;&lt;p&gt;2.优秀的执行力&amp;amp;沟通能力。&lt;/p&gt;&lt;p&gt;3.快速反应，有专研精神，勇于承受压力和接受挑战。&amp;nbsp;&lt;/p&gt;&lt;p&gt;工作职责：&lt;/p&gt;&lt;p&gt;&amp;nbsp;1.推广活动的策划、执行与监控。&lt;/p&gt;&lt;p&gt;2.平面、网络等媒介资源整合、询价和筛选、进行定量研究和分析。&lt;/p&gt;&lt;p&gt;3.建立并维护与各网站、媒体机构等合作方的良好合作关系。&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;运营专员（2人）&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;职位要求：&lt;/p&gt;&lt;p&gt;&amp;nbsp;1.对网络十分熟悉，最好有互联网工作经验，或者很喜欢各种时尚论坛，长时间“浸泡”。&lt;/p&gt;&lt;p&gt;2.思维活跃、反应快，十分懂得与人沟通交流，并有较强的执行力。&amp;nbsp;&lt;/p&gt;&lt;p&gt;工作职责：&lt;/p&gt;&lt;p&gt;&amp;nbsp;1.网站内容组织，用户管理。&lt;/p&gt;&lt;p&gt;2.线上线下活动策划执行。&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;印前经理 （3人）&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;职位要求：&lt;/p&gt;&lt;p&gt;1、负责梳理印前工作各个岗位，建立标准作业流程，培新新员工；&lt;/p&gt;&lt;p&gt;2、统筹公司投产后的印前制作工作；&lt;/p&gt;&lt;p&gt;3、与合作工厂的印刷做对接，做好质量控制计划及流程；&lt;/p&gt;&lt;p&gt;4、协助公司系统开发人员开发、测试印前处理流程。&lt;/p&gt;&lt;p&gt;您的特质：&lt;/p&gt;&lt;p&gt;1、大专以上学历，具备良好的普通话水平，5年以上大型印刷企业工作经验和3年以上CTP部门管理经验；&lt;/p&gt;&lt;p&gt;2、熟悉印刷工艺、书刊，彩盒工艺；&lt;/p&gt;&lt;p&gt;3、精通CTP制作及印前、印后的工作流程，数码打样、CIP3、色彩管理软件及相关测量仪器﹑印刷流程管理软件﹑熟练使用电脑排版及拼大版软件，懂矫色工作；&lt;/p&gt;&lt;p&gt;4、有良好的部门建设与管理能力，较强的统筹规划能力，擅长沟通协调。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;网站UI设计师（2人）&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;职位描述：&lt;/p&gt;&lt;p&gt;&amp;nbsp;1.参与产品团队的前期概念界定, 讨论产品原型。&lt;/p&gt;&lt;p&gt;2.根据产品原型设计交互细节。&amp;nbsp;&lt;/p&gt;&lt;p&gt;3.平衡易用性和美观确定最终可视化界面。&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;职位要求：&lt;/p&gt;&lt;p&gt;&amp;nbsp;1.独特的视觉和艺术感觉。&amp;nbsp;&lt;/p&gt;&lt;p&gt;2.良好的沟通能力,能在协作中准确传达你的设计意图。&lt;/p&gt;&lt;p&gt;3.兼有设计和人机交互学科教育背景者优先。&lt;/p&gt;&lt;p&gt;4.简历请附设计作品。&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;测试工程师（1人）&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;职位要求：&lt;/p&gt;&lt;p&gt;&amp;nbsp;1.能根据需求文档、设计文档编写测试计划、测试用例以及测试报告。&lt;/p&gt;&lt;p&gt;2.对软件测试有浓厚的兴趣和丰富的经验，有很强的分析能力和定位问题的能力。&lt;/p&gt;&lt;p&gt;3.工作态度认真严谨，有较强的表达和沟通能力及文档编辑能力，对细节认真思考，有相当的逻辑能力。&lt;/p&gt;&lt;p&gt;4.熟悉常规测试软件（如Loadrunner等）。&lt;/p&gt;&lt;p&gt;5.熟悉PHP脚本语言、Mysql数据库、服务器工作原理者更佳。&amp;nbsp;&lt;/p&gt;&lt;p&gt;工作职责：&lt;/p&gt;&lt;p&gt;&amp;nbsp;1.根据项目计划制定项目测试用例并实施，保证项目质量和进度。&lt;/p&gt;&lt;p&gt;2.设计与执行测试用例，跟踪定位产品软件中的缺陷或问题。&lt;/p&gt;&lt;p&gt;3.与项目相关人员就项目进度和问题进行沟通。&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;产品经理(1人)&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;职位描述：&lt;/p&gt;&lt;p&gt;&amp;nbsp;1.负责呱呱印产品，制定产品发展策略。&lt;/p&gt;&lt;p&gt;2.挖掘把握用户对呱呱印社交产品的各层次需求。&lt;/p&gt;&lt;p&gt;3.对日常数据进行跟踪研究，定期分析运营效果。&lt;/p&gt;&lt;p&gt;4.协同设计、研发、推广、运营团队，确保产品的研发运营进度。&amp;nbsp;&lt;/p&gt;&lt;p&gt;职位要求：&lt;/p&gt;&lt;p&gt;&amp;nbsp;1.电商类产品重度用户。&lt;/p&gt;&lt;p&gt;2.热爱互联网，关注新鲜事物和用户行为变化。&lt;/p&gt;&lt;p&gt;3.出色的语言能力和组织沟通协调能力。&lt;/p&gt;&lt;p&gt;4.具有敏锐的市场意识与良好的运营思维。&lt;/p&gt;&lt;p&gt;5.简历请附上产品体验报告&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;交互设计师(1名)&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;职位要求：&lt;/p&gt;&lt;p&gt;&amp;nbsp;1. 2年或以上的无线产品交互设计经验，关注最新的无线产品设计，电子商务或导购类设计经验优先；&lt;/p&gt;&lt;p&gt;2. 熟悉无线领域的发展及多个无线平台的交互特性，并能对无线交互有独特见解；&amp;nbsp;&lt;/p&gt;&lt;p&gt;3. 快速构建高质量的信息构架、流程图、线框图；&lt;/p&gt;&lt;p&gt;4. 有优秀的创意性与逻辑思维能力；&amp;nbsp;&lt;/p&gt;&lt;p&gt;5. 性乐观开朗，善于和各种背景的人合作，充满好奇心；&amp;nbsp;&lt;/p&gt;&lt;p&gt;6. 熟悉Photoshop、Visio、Axure等设计软件；&amp;nbsp;&lt;/p&gt;&lt;p&gt;职位职责：&lt;/p&gt;&lt;p&gt;&amp;nbsp;1. 负责无线相关产品的交互设计，能分析用户的核心需求，完成信息架构，设计流程及原型；&amp;nbsp;&lt;/p&gt;&lt;p&gt;2. 熟悉用户需求分析方法，掌握可用性相关知识，能对产品进行可用性测试和分析，并提出改进方案；&amp;nbsp;&lt;/p&gt;&lt;p&gt;3. 参与无线产品的规划构思，提出产品的核心设计原则，指导设计；&amp;nbsp;&lt;/p&gt;&lt;p&gt;4. 竞品与专题研究，撰写分析文档。&lt;/p&gt;','','','',2,0,1541562869,'',0,'','',1083,1541606400,''),(136,4,'服务条款','&lt;p&gt;一、呱呱印服务条款的确认和接纳&lt;/p&gt;&lt;p&gt;呱呱印（以下简称本站）的各项电子服务的所有权和运作权归本站。本站提供的服务将完全按照其发布的服务条款和操作规则严格执行。用户必须完全同意所有服务条款并完成注册程序，才能成为本站的正式用户。用户确认：本协议条款是处理双方权利义务的当然约定依据，除非违反国家强制性法律，否则始终有效。在下订单的同时，您也同时承认了您拥有购买这些产品的权利能力和行为能力，并且将您对您在订单中提供的所有信息的真实性负责。&lt;/p&gt;&lt;p&gt;二、服务简介&lt;/p&gt;&lt;p&gt;本站运用自己的操作系统通过国际互联网络为用户提供网络服务。同时，用户必须：&lt;/p&gt;&lt;p&gt;1. 自行配备上网的所需设备，包括个人电脑、调制解调器或其他必备上网装置。&lt;/p&gt;&lt;p&gt;2. 自行负担个人上网所支付的与此服务有关的电话费用、网络费用。&lt;/p&gt;&lt;p&gt;基于本站所提供的网络服务的重要性，用户应同意：&lt;/p&gt;&lt;p&gt;1. 提供详尽、准确的个人资料。&lt;/p&gt;&lt;p&gt;2. 不断更新注册资料，符合及时、详尽、准确的要求。&lt;/p&gt;&lt;p&gt;本站对用户的电子邮件、手机号等隐私资料进行保护，承诺不会在未获得用户许可的情况下擅自将用户的个人资料信息出租或出售给任何第三方，但以下情况除外：&lt;/p&gt;&lt;p&gt;1. 用户同意让第三方共享资料；&lt;/p&gt;&lt;p&gt;2. 用户同意公开其个人资料，享受为其提供的产品和服务；&lt;/p&gt;&lt;p&gt;3. 本站需要听从法庭传票、法律命令或遵循法律程序；&lt;/p&gt;&lt;p&gt;4. 本站发现用户违反了本站服务条款或本站其它使用规定。&lt;/p&gt;&lt;p&gt;关于用户隐私的具体协议以本站的隐私声明为准。&lt;/p&gt;&lt;p&gt;如果用户提供的资料包含有不正确的信息，本站保留结束用户使用网络服务资格的权利。&lt;/p&gt;&lt;p&gt;三、价格和数量&lt;/p&gt;&lt;p&gt;本站将尽最大努力保证您所购商品与网站上公布的价格一致，但价目表和声明并不构成要约。本站有权在发现了其网站上显现的产品及订单的明显错误或缺货的情况下，单方面撤回任何承诺。同时，本站保留对产品订购的数量的限制权。&lt;/p&gt;&lt;p&gt;产品的价格和可获性都在本站上指明。这类信息将随时更改且不发任何通知。商品的价格都包含了增值税。如果发生了意外情况，在确认了您的订单后，由于供应商提价，税额变化引起的价格变化，或是由于网站的错误等造成商品价格变化，您有权取消您的订单，并希望您能及时通过电子邮件或电话通知本站客户服务部。&lt;/p&gt;&lt;p&gt;四、服务条款的修改&lt;/p&gt;&lt;p&gt;本站将可能不定期的修改本用户协议的有关条款，一旦条款及服务内容产生变动，本站将会在重要页面上提示修改内容。如果不同意本站对条款内容所做的修改，用户可以主动取消获得的网络服务。如果用户继续使用本站的服务，则视为接受服务条款的变动。本站保留随时修改或中断服务而不需告知用户的权利。本站行使修改或中断服务的权利，不需对用户或第三方负责。&lt;/p&gt;&lt;p&gt;五、用户的帐户，密码和安全性&lt;/p&gt;&lt;p&gt;用户一旦注册成功，成为本站的合法用户，将得到一个密码和用户名。您可随时根据指示改变您的密码。用户将对用户名和密码安全负全部责任。另外，每个用户都要对以其用户名进行的所有活动和事件负全责。用户若发现任何非法使用用户帐户或存在安全漏洞的情况，请立即通告本站。&lt;/p&gt;&lt;p&gt;六、拒绝提供担保&lt;/p&gt;&lt;p&gt;用户个人对网络服务的使用承担风险。本站对此不作任何类型的担保，不论是明确的或隐含的，但是不对商业性的隐含担保、特定目的和不违反规定的适当担保作限制。本站不担保服务一定能满足用户的要求，也不担保服务不会受中断，对服务的及时性，安全性，出错发生都不作担保。本站对在本站上得到的任何商品购物服务或交易进程，不作担保。&lt;/p&gt;&lt;p&gt;七、有限责任&lt;/p&gt;&lt;p&gt;本站对任何直接、间接、偶然、特殊及继起的损害不负责任，这些损害可能来自：不正当使用网络服务，在网上购买商品或进行同类型服务，在网上进行交易，非法使用网络服务或用户传送的信息有所变动。这些行为都有可能会导致本站的形象受损，所以本站事先提出这种损害的可能性。&lt;/p&gt;&lt;p&gt;八、对用户信息的存储和限制&lt;/p&gt;&lt;p&gt;本站不对用户所发布信息的删除或储存失败负责。本站有判定用户的行为是否符合本站服务条款的要求和精神的保留权利，如果用户违背了服务条款的规定，本站有中断对其提供网络服务的权利。&lt;/p&gt;&lt;p&gt;九、保障用户&lt;/p&gt;&lt;p&gt;同意保障和维护本站全体成员的利益，负责支付由用户使用超出业务范围引起的律师费用，违反服务条款的损害补偿费用等。&lt;/p&gt;&lt;p&gt;十、结束服务&lt;/p&gt;&lt;p&gt;用户或本站可随时根据实际情况中断一项或多项网络服务。本站不需对任何个人或第三方负责而随时中断服务。用户对后来的条款修改有 异议，或对本站的服务不满，可以行使如下权利：&lt;/p&gt;&lt;p&gt;1. 停止使用本站的网络服务。&lt;/p&gt;&lt;p&gt;2. 通告本站停止对该用户的服务。&lt;/p&gt;&lt;p&gt;结束用户服务后，用户使用网络服务的权利马上中止。从那时起，用户有权利，本站也没有义务传送任何未处理的信息或未完成的服务给户或第三方。&lt;/p&gt;&lt;p&gt;十一、通告&lt;/p&gt;&lt;p&gt;所有发给用户的通告都可通过重要页面的公告或电子邮件或常规的信件传送。本站的活动信息也将定期通过页面公告及电子邮件方式向用户发送。用户协议条款的修改、服务变更、或其它重要事件的通告都会以此形式进行。&lt;/p&gt;&lt;p&gt;十二、参与广告策划&lt;/p&gt;&lt;p&gt;用户在他们发表的信息中加入宣传资料或参与广告策划，在本站的免费服务上展示他们的产品，任何这类促销方法，包括运输货物、付款、服务、商业条件、担保及与广告有关的描述都只是在相应的用户和广告销售商之间发生。本站不承担任何责任，本站没有义务为这类广告销售负任何一部分的责任。&lt;/p&gt;&lt;p&gt;十三、网络服务内容的所有权&lt;/p&gt;&lt;p&gt;本站定义的网络服务内容包括：文字、软件、声音、图片、录象、图表、广告中的全部内容；电子邮件的全部内容；本站为用户提供的其他信息。所有这些内容受版权、商标、标签和其它财产所有权法律的保护。所以，用户只能在本站和广告商授权下才能使用这些内容，而不能擅自复制、再造这些内容、或创造与内容有关的派生产品。本站所有的文章版权归原文作者和本站共同所有，任何人需要转载本站的文章，必须征得原文作者或本站授权。&lt;/p&gt;&lt;p&gt;十四、责任限制&lt;/p&gt;&lt;p&gt;如因不可抗力或其他本站无法控制的原因使本站销售系统崩溃或无法正常使用导致网上交易无法完成或丢失有关的信息、记录等，本站不承担责任。但是本站会尽可能合理地协助处理善后事宜，并努力使客户免受经济损失&lt;/p&gt;&lt;p&gt;除了本站的使用条件中规定的其它限制和除外情况之外，在中国法律法规所允许的限度内，对于因交易而引起的或与之有关的任何直接的、间接的、特殊的、附带的、后果性的或惩罚性的损害，或任何其它性质的损害，本站、本站的董事、管理人员、雇员、代理或其它代表在任何情况下都不承担责任。本站的全部责任，不论是合同、保证、侵权（包括过失）项下的还是其它的责任，均不超过您所购买的与该索赔有关的商品价值额。&lt;/p&gt;&lt;p&gt;十五、法律管辖和适用&lt;/p&gt;&lt;p&gt;本协议的订立、执行和解释及争议的解决均应适用中国法律。&lt;/p&gt;&lt;p&gt;如发生本站服务条款与中国法律相抵触时，则这些条款将完全按法律规定重新解释，而其它合法条款则依旧保持对用户产生法律效力和影响。本协议的规定是可分割的，如本协议任何规定被裁定为无效或不可执行，该规定可被删除而其余条款应予以执行。&lt;/p&gt;&lt;p&gt;如双方就本协议内容或其执行发生任何争议，双方应尽力友好协商解决；协商不成时，任何一方均可向本站所在地的人民法院提起诉讼。&lt;/p&gt;&lt;p&gt;如本用户协议未包含的内容在法律声明、隐私条款等网站文件中有所规定的，这些规定将被视为用户协议的补充条款，与用户协议具备同等法律效力，用户应当予以遵守。&lt;/p&gt;','','','',2,0,1541562980,'',0,'','',1247,1541606400,''),(137,4,'隐私声明','&lt;p&gt;个人信息&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;当您注册帮一把服务时，我们会要求您提供个人信息。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;我们可能将收集的信息与从其他帮一把服务和其他公司获取的信息相结合。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;我们会使用 cookie 及其他技术跟踪您与我们网站和服务的交互活动，以便提供个性化用户体验。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;用户权利&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;在成功登录之后，用户可以在&amp;quot;帐号信息&amp;quot;下修改其隐私设置或更新个人或组织信息及密码。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;信息的使用&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;我们利用收集的信息来提供您请求的服务。 我们的服务可能包括个性化内容显示和广告。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;我们利用您的信息向您通知有关帮一把及其附属公司其他产品或服务的动态情况，并发送与帮一把服务相关的调查问卷邀请。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;在未得到您的许可之前，本站不会把您的任何个人信息提供给无关的第三方（包括公司或个人）&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;免责条款&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;在如下情况下，本站将不对您的隐私泄露承担责任：&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;您同意让第三方共享资料。&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;您同意公开你的个人资料，享受为您提供的产品和服务。&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;本站需要听从法庭传票、法律命令或遵循法律程序。&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;因黑客行为或用户的保管疏忽导致帐号、密码遭他人非法使用。&lt;/p&gt;','','','',2,0,1541563450,'',0,'','',1050,1541606400,'');

/*Table structure for table `gy_article_bak` */

DROP TABLE IF EXISTS `gy_article_bak`;

CREATE TABLE `gy_article_bak` (
  `article_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `cat_id` smallint(5) NOT NULL DEFAULT '0' COMMENT '类别ID',
  `cat_id2` smallint(5) DEFAULT '0' COMMENT '扩展类别ID',
  `title` varchar(150) NOT NULL DEFAULT '' COMMENT '文章标题',
  `content` longtext NOT NULL COMMENT '文章内容',
  `author` varchar(30) NOT NULL DEFAULT '' COMMENT '文章作者',
  `author_email` varchar(60) NOT NULL DEFAULT '' COMMENT '作者邮箱',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `article_type` tinyint(1) unsigned NOT NULL DEFAULT '2' COMMENT '文章类型',
  `is_open` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否开启',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `file_url` varchar(255) NOT NULL DEFAULT '' COMMENT '附件地址',
  `open_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'open_type',
  `link` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `description` mediumtext COMMENT '文章摘要',
  `click` int(11) DEFAULT '0' COMMENT '浏览量',
  `publish_time` int(11) DEFAULT '0' COMMENT '文章发布时间',
  `thumb` varchar(255) DEFAULT '' COMMENT '文章缩略图',
  PRIMARY KEY (`article_id`),
  KEY `cat_id` (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `gy_article_bak` */

/*Table structure for table `gy_article_cat` */

DROP TABLE IF EXISTS `gy_article_cat`;

CREATE TABLE `gy_article_cat` (
  `cat_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(20) DEFAULT NULL COMMENT '类别名称',
  `cat_type` smallint(6) DEFAULT '0' COMMENT '默认分组',
  `parent_id` smallint(6) DEFAULT '0' COMMENT '夫级ID',
  `show_in_nav` tinyint(1) DEFAULT '0' COMMENT '是否导航显示',
  `sort_order` smallint(6) DEFAULT '50' COMMENT '排序',
  `cat_desc` varchar(255) DEFAULT NULL COMMENT '分类描述',
  `keywords` varchar(30) DEFAULT NULL COMMENT '搜索关键词',
  `cat_alias` varchar(20) DEFAULT NULL COMMENT '别名',
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `gy_article_cat` */

insert  into `gy_article_cat`(`cat_id`,`cat_name`,`cat_type`,`parent_id`,`show_in_nav`,`sort_order`,`cat_desc`,`keywords`,`cat_alias`) values (1,'支付及配送',1,0,1,1,'支付','支付',NULL),(2,'印刷知识',1,0,1,3,'印刷','印刷',NULL),(3,'售后服务',1,0,1,2,'','',NULL),(4,'关于我们',1,0,0,4,'','',NULL),(5,'4',1,0,0,5,'','',NULL),(6,'3',1,0,0,6,'','',NULL),(7,'2',1,0,0,7,'','',NULL),(8,'1',1,0,0,9,'','',NULL);

/*Table structure for table `gy_brand` */

DROP TABLE IF EXISTS `gy_brand`;

CREATE TABLE `gy_brand` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '品牌表',
  `name` varchar(60) NOT NULL DEFAULT '' COMMENT '品牌名称',
  `logo` varchar(80) NOT NULL DEFAULT '' COMMENT '品牌logo',
  `desc` text NOT NULL COMMENT '品牌描述',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '品牌地址',
  `sort` int(3) unsigned NOT NULL DEFAULT '50' COMMENT '排序',
  `cat_name` varchar(128) DEFAULT '' COMMENT '品牌分类',
  `parent_cat_id` int(11) DEFAULT '0' COMMENT '分类id',
  `cat_id` int(10) DEFAULT '0' COMMENT '分类id',
  `is_hot` tinyint(1) DEFAULT '0' COMMENT '是否推荐',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `gy_brand` */

/*Table structure for table `gy_cart` */

DROP TABLE IF EXISTS `gy_cart`;

CREATE TABLE `gy_cart` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '购物车表',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `session_id` char(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'session',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `goods_sn` varchar(60) NOT NULL DEFAULT '' COMMENT '商品货号',
  `goods_name` varchar(120) NOT NULL DEFAULT '' COMMENT '商品名称',
  `market_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '市场价',
  `goods_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '本店价',
  `member_goods_price` decimal(10,2) DEFAULT '0.00' COMMENT '会员折扣价',
  `goods_num` smallint(5) unsigned DEFAULT '0' COMMENT '购买数量',
  `num_key` varchar(50) DEFAULT NULL COMMENT '购买数量数组的key,如果不为空就是爆品',
  `goods_file_id` tinyint(4) DEFAULT '0' COMMENT '1 使用自己的设计 2 需要帮我设计',
  `goods_send_date` int(5) DEFAULT '0' COMMENT '出货周期',
  `item_id` int(11) DEFAULT '0' COMMENT '规格ID',
  `spec_key` varchar(64) DEFAULT '' COMMENT '商品规格key 对应gy_spec_goods_price 表',
  `spec_key_name` varchar(64) DEFAULT '' COMMENT '商品规格组合名称',
  `bar_code` varchar(64) DEFAULT '' COMMENT '商品条码',
  `selected` tinyint(1) DEFAULT '1' COMMENT '购物车选中状态',
  `add_time` int(11) DEFAULT '0' COMMENT '加入购物车的时间',
  `prom_type` tinyint(1) DEFAULT '0' COMMENT '0 普通订单,1 限时抢购, 2 团购 , 3 促销优惠,7 搭配购',
  `prom_id` int(11) DEFAULT '0' COMMENT '活动id',
  `sku` varchar(128) DEFAULT '' COMMENT 'sku',
  `combination_group_id` int(8) unsigned NOT NULL DEFAULT '0' COMMENT ' 搭配购的组id/cart_id',
  `is_sheji` tinyint(2) DEFAULT '0' COMMENT '0不是设计 1是设计',
  `mobile` int(11) DEFAULT NULL COMMENT '设计文件moblie',
  `linkqq` int(16) DEFAULT NULL COMMENT '设计文件QQ',
  `shejicontent` text COMMENT '设计描述',
  PRIMARY KEY (`id`),
  KEY `session_id` (`session_id`),
  KEY `user_id` (`user_id`),
  KEY `goods_id` (`goods_id`),
  KEY `spec_key` (`spec_key`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `gy_cart` */

insert  into `gy_cart`(`id`,`user_id`,`session_id`,`goods_id`,`goods_sn`,`goods_name`,`market_price`,`goods_price`,`member_goods_price`,`goods_num`,`num_key`,`goods_file_id`,`goods_send_date`,`item_id`,`spec_key`,`spec_key_name`,`bar_code`,`selected`,`add_time`,`prom_type`,`prom_id`,`sku`,`combination_group_id`,`is_sheji`,`mobile`,`linkqq`,`shejicontent`) values (1,0,'btl48i5b77ui16r6a1sro4rd33',1,'TP0000001','宣传单页彩页国民款，一纸在手，客户我有','0.80','0.20','0.20',500,'0',1,3,0,'','','',1,1550046566,0,0,'',0,0,NULL,NULL,NULL),(5,1,'v394tovagbjk4kietmlheksof3',22,'GGY0000022','设计单页彩页国民款，一纸在手，客户我有','0.00','10.00','10.00',1,'',0,0,0,'','','',1,1550051659,0,0,'',0,1,NULL,NULL,NULL);

/*Table structure for table `gy_combination` */

DROP TABLE IF EXISTS `gy_combination`;

CREATE TABLE `gy_combination` (
  `combination_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `desc` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `is_on_sale` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '上下架，0下，1上',
  `start_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '活动有效起始时间',
  `end_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '活动有效截止时间',
  PRIMARY KEY (`combination_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组合促销表';

/*Data for the table `gy_combination` */

/*Table structure for table `gy_combination_goods` */

DROP TABLE IF EXISTS `gy_combination_goods`;

CREATE TABLE `gy_combination_goods` (
  `combination_id` int(10) NOT NULL,
  `goods_name` varchar(255) NOT NULL DEFAULT '' COMMENT '商品名称',
  `key_name` varchar(255) NOT NULL DEFAULT '' COMMENT '规格名称',
  `goods_id` int(10) NOT NULL,
  `item_id` int(10) NOT NULL,
  `original_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '原价/商城价',
  `price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '优惠价格',
  `is_master` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1主0从'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组合促销商品映射关系表';

/*Data for the table `gy_combination_goods` */

/*Table structure for table `gy_comment` */

DROP TABLE IF EXISTS `gy_comment`;

CREATE TABLE `gy_comment` (
  `comment_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论id',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `email` varchar(60) NOT NULL DEFAULT '' COMMENT 'email邮箱',
  `username` varchar(60) NOT NULL DEFAULT '' COMMENT '用户名',
  `content` text NOT NULL COMMENT '评论内容',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `ip_address` varchar(15) NOT NULL DEFAULT '' COMMENT 'ip地址',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否显示',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论用户',
  `img` text COMMENT '晒单图片',
  `order_id` mediumint(8) DEFAULT '0' COMMENT '订单id',
  `deliver_rank` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '物流评价等级',
  `goods_rank` tinyint(1) DEFAULT '0' COMMENT '商品评价等级',
  `service_rank` tinyint(1) DEFAULT '0' COMMENT '商家服务态度评价等级',
  `zan_num` int(10) NOT NULL DEFAULT '0' COMMENT '被赞数',
  `zan_userid` varchar(255) NOT NULL DEFAULT '' COMMENT '点赞用户id',
  `is_anonymous` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否匿名评价:0不是，1是',
  `rec_id` int(11) DEFAULT NULL COMMENT '订单商品表ID',
  `sort` int(4) unsigned NOT NULL DEFAULT '100' COMMENT '排序',
  PRIMARY KEY (`comment_id`),
  KEY `parent_id` (`parent_id`),
  KEY `id_value` (`goods_id`),
  KEY `order_id` (`order_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `gy_comment` */

/*Table structure for table `gy_config` */

DROP TABLE IF EXISTS `gy_config`;

CREATE TABLE `gy_config` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `name` varchar(50) DEFAULT NULL COMMENT '配置的key键名',
  `value` varchar(512) DEFAULT NULL COMMENT '配置的val值',
  `inc_type` varchar(64) DEFAULT NULL COMMENT '配置分组',
  `desc` varchar(50) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=utf8;

/*Data for the table `gy_config` */

insert  into `gy_config`(`id`,`name`,`value`,`inc_type`,`desc`) values (1,'site_url','http://www.tpshop.cn','shop_info',NULL),(2,'record_no','苏ICP备18055031','shop_info',NULL),(3,'store_name','呱呱印','shop_info',NULL),(5,'store_title','呱呱印_画册_宣传单_折页_手提袋_包装盒_设计和印刷服务平台','shop_info',NULL),(6,'store_desc','呱呱印是领先的在线设计印刷全产业链电商平台，为您提供优质的单页，折页，封套，海报，台历，手提袋，纸杯，礼品包装盒，名片，会员卡，宣传单，易拉宝，X展架，封套，企业画册，宣传册，档案袋，文件袋等设计和印刷服务！','shop_info',NULL),(7,'store_keyword','手提袋,折页,海报,画册,茶叶包装盒设计','shop_info',NULL),(8,'contact','钱经理','shop_info',NULL),(9,'phone','025-85563008','shop_info',NULL),(10,'address','兴智路6-3号兴智科技园c座','shop_info',NULL),(11,'qq','1172760429','shop_info',NULL),(12,'qq2','1172760429','shop_info',NULL),(13,'qq3','1172760429','shop_info',NULL),(14,'freight_free','0','shopping',NULL),(15,'point_rate','100','shopping',NULL),(16,'is_mark','0','water',NULL),(17,'mark_txt','呱呱印','water',NULL),(18,'mark_img','/public/upload/water/2018/01-26/9da13305eb67822d8403b13d7fc29827.png','water',NULL),(19,'mark_width','40','water',NULL),(20,'mark_height','40','water',NULL),(21,'mark_degree','40','water',NULL),(22,'mark_quality','100','water',NULL),(23,'sel','9','water',NULL),(24,'sms_url','https://yunpan.cn/OcRgiKWxZFmjSJ','sms',NULL),(25,'sms_user','','sms',NULL),(26,'sms_pwd','访问密码 080e','sms',NULL),(27,'regis_sms_enable','1','sms','发送短信开关'),(28,'sms_time_out','120','sms',NULL),(30,'file_size','20','basic',NULL),(31,'default_storage','1000000000','basic',NULL),(32,'warning_storage','10000','basic',NULL),(33,'tax','6','basic','发票税率'),(34,'is_remind','0','basic',NULL),(35,'order_finish_time','','basic',NULL),(36,'order_cancel_time','','basic',NULL),(37,'hot_keywords','手提袋|茶叶包装盒|宣传画册|不干胶|海报|礼品包装盒','basic',NULL),(38,'__hash__','8d9fea07e44955760d3407524e469255_6ac8706878aa807db7ffb09dd0b02453','sms',NULL),(40,'app_test','0','basic',NULL),(41,'switch','0','distribut','分销设置1开0关'),(42,'condition','0','distribut',NULL),(43,'name','我的分销商','distribut',NULL),(44,'pattern','0','distribut',NULL),(45,'order_rate','20','distribut',NULL),(46,'first_name','一级分销','distribut',NULL),(47,'first_rate','70','distribut',NULL),(48,'second_name','二级分销','distribut',NULL),(49,'second_rate','20','distribut',NULL),(50,'third_name','三级分销','distribut',NULL),(51,'third_rate','10','distribut',NULL),(52,'date','1','distribut',NULL),(53,'need','100','basic',NULL),(54,'min','50','basic',NULL),(55,'auto_confirm_date','10','shopping',NULL),(56,'sms_appkey','LTAIZzR2DLIUplRt','sms',NULL),(57,'sms_secretKey','0Sf8btrHI3wxuYYccdzU4jf8e4nTWh','sms',NULL),(58,'sms_product','呱呱印','sms',NULL),(59,'sms_templateCode','SMS_101234567890','sms',NULL),(60,'smgy_server','ssl://smtp.qq.com','smtp',NULL),(61,'smgy_port','465','smtp',NULL),(62,'smgy_user','123456@qq.com','smtp',NULL),(63,'smgy_pwd','123456','smtp',NULL),(64,'regis_smgy_enable','1','smtp',NULL),(65,'test_eamil','123456@qq.com','smtp',NULL),(66,'mobile','18761640729','shop_info',NULL),(67,'province','10808','shop_info',NULL),(68,'city','10809','shop_info',NULL),(69,'district','10876','shop_info',NULL),(70,'forget_pwd_sms_enable','1','sms',NULL),(71,'bind_mobile_sms_enable','1','sms',NULL),(72,'order_add_sms_enable','0','sms',NULL),(73,'order_pay_sms_enable','0','sms',NULL),(74,'order_shipping_sms_enable','0','sms',NULL),(75,'form_submit','ok','distribut',NULL),(76,'form_submit','ok','shop_info',NULL),(77,'form_submit','ok','shopping',NULL),(78,'reduce','2','shopping',NULL),(79,'form_submit','ok','',NULL),(80,'reg_integral','20','basic','注册送积分'),(81,'file_size','20','basic',NULL),(82,'default_storage','1000000000','basic',NULL),(84,'need','100','basic',NULL),(85,'min','50','basic',NULL),(87,'hot_keywords','手提袋|茶叶包装盒|宣传画册|不干胶|海报|礼品包装盒','basic',NULL),(88,'point_min_limit','10','shopping',NULL),(89,'point_use_percent','100','shopping',NULL),(90,'inc_type','smtp','smtp',NULL),(91,'mark_type','text','water',NULL),(92,'need','100','basic',NULL),(93,'min','50','basic',NULL),(94,'form_submit','ok','push',NULL),(95,'jpush_app_key','123456','push',NULL),(96,'jpush_master_secret','123456','push',NULL),(98,'sms_platform','1','sms',NULL),(99,'form_submit','ok','oss',NULL),(100,'oss_key_id','123456','oss',NULL),(101,'oss_key_secret','1','oss',NULL),(102,'oss_endpoint','oss-cn-shenzhen.aliyuncs.com','oss',NULL),(103,'oss_bucket','how1','oss',NULL),(104,'android_app_path','public/upload/appfile/androidapp_0.12.1_170706_104041.apk','mobile_app',NULL),(105,'android_app_version','0.12.1','mobile_app',NULL),(106,'android_app_log','测试日记','mobile_app',NULL),(107,'oss_switch','0','oss',NULL),(108,'mark_txt_size','12','water',NULL),(109,'mark_txt_color','#000000','water',NULL),(110,'qrcode_menu_word','distribut_qrcode','distribut',NULL),(111,'qrcode_input_word','我的二维码','distribut',NULL),(112,'qr_back','/public/upload/weixin/2017/10-27/e9823d589b202818c86511be60a6b65a.jpg','distribut',NULL),(113,'qr_big_back','/public/upload/weixin/2017/10-27/ddbf260c88c706b38473dc6972b66c42.jpg','distribut',NULL),(114,'auto_service_date','16','shopping',NULL),(115,'integral_use_enable','0','shopping',NULL),(116,'store_logo','/public/upload/logo/2018/10-09/9bb9a618df13968c12e8605fc56ac2a2.jpg','shop_info',NULL),(117,'invite','1','basic',NULL),(118,'invite_integral','20','basic','邀请送积分'),(119,'store_user_logo','/public/upload/logo/2018/08-08/4742e2a90abe896ea099012165a9f209.png','shop_info',NULL),(120,'sign_on_off','1','sign',NULL),(121,'sign_integral','10','sign',NULL),(122,'sign_signcount','7','sign',NULL),(123,'sign_award','20','sign',NULL),(124,'own_rate','10','distribut',NULL),(125,'store_ico','/public/upload/logo/2018/04-09/516bc70315079d81dc3726991672b4af.png','shop_info',NULL),(126,'regrade','1','distribut',NULL),(127,'rechargevip_on_off','0','basic',NULL),(128,'rechargevip_price','1','basic',NULL),(129,'rechargevip_rebate_on_off','0','basic',NULL),(130,'rechargevip_rebate','1','basic',NULL),(131,'is_bind_account','1','basic',NULL),(132,'virtual_goods_sms_enable','0','sms',NULL),(133,'form_submit','ok','kdniao',NULL),(134,'kdniao_switch','1','kdniao',NULL),(135,'kdniao_id','123456','express',NULL),(136,'kdniao_key','123456','express',NULL),(137,'form_submit','ok','express',NULL),(138,'express_switch','0','express',NULL),(139,'kd100_key','123456','express',NULL),(140,'kdniao_id','123456','express',NULL),(141,'kdniao_key','123456','express',NULL),(142,'admin_login_logo','/public/static/images/logo/admin_login_logo_default.png','shop_info',NULL),(143,'admin_home_logo','/public/upload/logo/2018/04-10/da91523a817bc5adcb2c4c123bbf6e3f.png','shop_info',NULL),(144,'wap_home_logo','/public/static/images/logo/wap_home_logo_default.png','shop_info',NULL),(145,'wap_login_logo','/public/upload/logo/2018/03-16/f3e95de4bf31b237ee7ca125053f84b8.png','shop_info',NULL),(146,'login_integral','5','basic','登录送积分'),(147,'userinfo_integral','50','basic','完善资料赠送积分');

/*Table structure for table `gy_coupon` */

DROP TABLE IF EXISTS `gy_coupon`;

CREATE TABLE `gy_coupon` (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '表id',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '优惠券名字',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '发放类型 0下单赠送1 指定发放 2 免费领取 3线下发放',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '优惠券金额',
  `condition` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '使用条件',
  `createnum` int(11) DEFAULT '0' COMMENT '发放数量',
  `send_num` int(11) DEFAULT '0' COMMENT '已领取数量',
  `use_num` int(11) DEFAULT '0' COMMENT '已使用数量',
  `send_start_time` int(11) DEFAULT NULL COMMENT '发放开始时间',
  `send_end_time` int(11) DEFAULT NULL COMMENT '发放结束时间',
  `use_start_time` int(11) DEFAULT NULL COMMENT '使用开始时间',
  `use_end_time` int(11) DEFAULT NULL COMMENT '使用结束时间',
  `add_time` int(11) DEFAULT NULL COMMENT '添加时间',
  `status` int(2) DEFAULT NULL COMMENT '状态：1有效,2无效',
  `use_type` tinyint(1) DEFAULT '0' COMMENT '使用范围：0全店通用1指定商品可用2指定分类商品可用',
  PRIMARY KEY (`id`),
  KEY `use_end_time` (`use_end_time`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `gy_coupon` */

insert  into `gy_coupon`(`id`,`name`,`type`,`money`,`condition`,`createnum`,`send_num`,`use_num`,`send_start_time`,`send_end_time`,`use_start_time`,`use_end_time`,`add_time`,`status`,`use_type`) values (1,'中秋国庆大优惠',1,'20.00','20.00',20,1,1,1537074127,1539666127,1537074127,1542344527,1537074279,1,2),(2,'下单赠送',0,'30.00','30.00',50,0,0,1537171561,1539677161,1537085161,1542355561,1537085222,1,0),(3,'免费领取',2,'40.00','40.00',5,1,0,1537085236,1539677236,1537085236,1542355636,1537085299,1,1),(4,'线下发放',3,'60.00','60.00',2,1,0,1537085308,1539677308,1537085308,1542355708,1537085349,1,2);

/*Table structure for table `gy_coupon_list` */

DROP TABLE IF EXISTS `gy_coupon_list`;

CREATE TABLE `gy_coupon_list` (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '表id',
  `cid` int(8) NOT NULL DEFAULT '0' COMMENT '优惠券 对应coupon表id',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '发放类型 1 按订单发放 2 注册 3 邀请 4 按用户发放',
  `uid` int(8) NOT NULL DEFAULT '0' COMMENT '用户id',
  `order_id` int(8) NOT NULL DEFAULT '0' COMMENT '订单id',
  `get_order_id` int(11) DEFAULT '0' COMMENT '优惠券来自订单ID',
  `use_time` int(11) NOT NULL DEFAULT '0' COMMENT '使用时间',
  `code` varchar(10) DEFAULT '' COMMENT '优惠券兑换码',
  `send_time` int(11) NOT NULL DEFAULT '0' COMMENT '发放时间',
  `status` tinyint(1) DEFAULT '0' COMMENT '0未使用1已使用2已过期',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `uid` (`uid`),
  KEY `code` (`code`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `gy_coupon_list` */

insert  into `gy_coupon_list`(`id`,`cid`,`type`,`uid`,`order_id`,`get_order_id`,`use_time`,`code`,`send_time`,`status`) values (1,4,3,0,0,0,0,'MsjK1tGE',1537085406,0),(2,1,1,1,0,0,0,'',1537085467,0),(3,3,2,1,0,0,0,'',1537095878,0);

/*Table structure for table `gy_delivery_doc` */

DROP TABLE IF EXISTS `gy_delivery_doc`;

CREATE TABLE `gy_delivery_doc` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '发货单ID',
  `order_id` int(11) unsigned NOT NULL COMMENT '订单ID',
  `order_sn` varchar(64) NOT NULL DEFAULT '' COMMENT '订单编号',
  `user_id` int(11) unsigned NOT NULL COMMENT '用户ID',
  `admin_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `consignee` varchar(64) NOT NULL DEFAULT '' COMMENT '收货人',
  `zipcode` varchar(6) DEFAULT NULL COMMENT '邮编',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '联系手机',
  `country` int(11) unsigned NOT NULL COMMENT '国ID',
  `province` int(11) unsigned NOT NULL COMMENT '省ID',
  `city` int(11) unsigned NOT NULL COMMENT '市ID',
  `district` int(11) unsigned NOT NULL COMMENT '区ID',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '地址',
  `shipping_code` varchar(32) DEFAULT NULL COMMENT '物流code',
  `shipping_name` varchar(64) DEFAULT NULL COMMENT '快递名称',
  `shipping_price` decimal(10,2) DEFAULT '0.00' COMMENT '运费',
  `invoice_no` varchar(255) DEFAULT '' COMMENT '物流单号',
  `tel` varchar(64) DEFAULT NULL COMMENT '座机电话',
  `note` text COMMENT '管理员添加的备注信息',
  `best_time` int(11) DEFAULT NULL COMMENT '友好收货时间',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '是否删除',
  `send_type` tinyint(1) DEFAULT '0' COMMENT '发货方式0自填快递1在线预约2电子面单3无需物流',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='发货单';

/*Data for the table `gy_delivery_doc` */

insert  into `gy_delivery_doc`(`id`,`order_id`,`order_sn`,`user_id`,`admin_id`,`consignee`,`zipcode`,`mobile`,`country`,`province`,`city`,`district`,`address`,`shipping_code`,`shipping_name`,`shipping_price`,`invoice_no`,`tel`,`note`,`best_time`,`create_time`,`is_del`,`send_type`) values (1,15,'201809242028246652',1,1,'邵先生','','18761659049',0,10808,10809,10903,'网络小镇','ZTO','中通快递','8.00','280649828535',NULL,'',NULL,1537792422,0,0);

/*Table structure for table `gy_distribut_goods` */

DROP TABLE IF EXISTS `gy_distribut_goods`;

CREATE TABLE `gy_distribut_goods` (
  `user_id` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `goods_name` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `goods_price` decimal(10,2) DEFAULT NULL COMMENT '商品价格',
  `sales` int(11) DEFAULT NULL COMMENT '销量'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分销商销售表';

/*Data for the table `gy_distribut_goods` */

/*Table structure for table `gy_distribut_level` */

DROP TABLE IF EXISTS `gy_distribut_level`;

CREATE TABLE `gy_distribut_level` (
  `level_id` tinyint(2) unsigned NOT NULL AUTO_INCREMENT,
  `level_type` tinyint(1) DEFAULT '0' COMMENT '分销等级类别',
  `rate1` decimal(6,2) DEFAULT '0.00' COMMENT '一级佣金比例',
  `rate2` decimal(6,2) DEFAULT '0.00' COMMENT '二级佣金比例',
  `rate3` decimal(6,2) DEFAULT '0.00' COMMENT '三级佣金比例',
  `order_money` decimal(12,2) DEFAULT '0.00' COMMENT '升级条件',
  `level_name` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`level_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `gy_distribut_level` */

/*Table structure for table `gy_expense_log` */

DROP TABLE IF EXISTS `gy_expense_log`;

CREATE TABLE `gy_expense_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) DEFAULT NULL COMMENT '操作管理员',
  `money` decimal(10,2) DEFAULT NULL COMMENT '支出金额',
  `integral` int(10) DEFAULT '0' COMMENT '赠送积分',
  `type` tinyint(1) DEFAULT '0' COMMENT '支出类型0用户提现,1订单退款,2其他,3注册,4邀请,5分享,6评论',
  `addtime` int(11) DEFAULT NULL COMMENT '日志记录时间',
  `log_type_id` int(11) DEFAULT '0' COMMENT '业务关联ID',
  `user_id` int(10) DEFAULT '0' COMMENT '涉及会员id',
  `user_name` int(10) DEFAULT '0' COMMENT '涉及用户',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='平台支出金额或赠送积分日志';

/*Data for the table `gy_expense_log` */

/*Table structure for table `gy_feedback` */

DROP TABLE IF EXISTS `gy_feedback`;

CREATE TABLE `gy_feedback` (
  `msg_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '默认自增ID',
  `parent_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '回复留言ID',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `user_name` varchar(60) NOT NULL DEFAULT '',
  `msg_title` varchar(200) NOT NULL DEFAULT '' COMMENT '留言标题',
  `msg_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '留言类型',
  `msg_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '处理状态',
  `msg_content` text NOT NULL COMMENT '留言内容',
  `msg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '留言时间',
  `message_img` varchar(255) NOT NULL DEFAULT '',
  `order_id` int(11) unsigned NOT NULL DEFAULT '0',
  `msg_area` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`msg_id`),
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `gy_feedback` */

/*Table structure for table `gy_flash_sale` */

DROP TABLE IF EXISTS `gy_flash_sale`;

CREATE TABLE `gy_flash_sale` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL DEFAULT '' COMMENT '活动标题',
  `goods_id` int(10) NOT NULL COMMENT '参团商品ID',
  `item_id` bigint(20) DEFAULT '0' COMMENT '对应spec_goods_price商品规格id',
  `price` float(10,2) NOT NULL COMMENT '活动价格',
  `goods_num` int(10) DEFAULT '1' COMMENT '商品参加活动数',
  `buy_limit` int(11) NOT NULL DEFAULT '1' COMMENT '每人限购数',
  `buy_num` int(11) NOT NULL DEFAULT '0' COMMENT '已购买人数',
  `order_num` int(10) DEFAULT '0' COMMENT '已下单数',
  `description` text COMMENT '活动描述',
  `start_time` int(11) NOT NULL COMMENT '开始时间',
  `end_time` int(11) NOT NULL COMMENT '结束时间',
  `is_end` tinyint(1) DEFAULT '0' COMMENT '是否已结束',
  `goods_name` varchar(255) DEFAULT NULL COMMENT '商品名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `gy_flash_sale` */

/*Table structure for table `gy_freight_config` */

DROP TABLE IF EXISTS `gy_freight_config`;

CREATE TABLE `gy_freight_config` (
  `config_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置id',
  `first_unit` double(16,4) NOT NULL DEFAULT '0.0000' COMMENT '首(重：体积：件）',
  `first_money` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '首(重：体积：件）运费',
  `continue_unit` double(16,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT '继续加（件：重量：体积）区间',
  `continue_money` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '继续加（件：重量：体积）的运费',
  `template_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '运费模板ID',
  `is_default` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否是默认运费配置.0不是，1是',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COMMENT='运费配置表';

/*Data for the table `gy_freight_config` */

insert  into `gy_freight_config`(`config_id`,`first_unit`,`first_money`,`continue_unit`,`continue_money`,`template_id`,`is_default`) values (2,1000.0000,'8.00',1000.0000,'2.00',2,0),(3,1000.0000,'12.00',1000.0000,'6.00',2,0),(5,1000.0000,'18.00',1000.0000,'12.00',2,0),(6,1000.0000,'22.00',1000.0000,'16.00',2,0),(7,1000.0000,'14.00',1000.0000,'1.00',1,0),(8,1000.0000,'21.00',1000.0000,'4.00',1,0),(9,1000.0000,'24.00',1000.0000,'5.00',1,0),(10,1000.0000,'53.00',1000.0000,'16.00',1,0);

/*Table structure for table `gy_freight_region` */

DROP TABLE IF EXISTS `gy_freight_region`;

CREATE TABLE `gy_freight_region` (
  `template_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '模板id',
  `config_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '运费模板配置ID',
  `region_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'region表id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `gy_freight_region` */

insert  into `gy_freight_region`(`template_id`,`config_id`,`region_id`) values (1,7,10543),(1,7,10808),(1,7,12596),(1,7,14234),(1,8,338),(1,8,1),(1,8,19280),(1,8,16068),(1,8,636),(1,8,24022),(1,8,25579),(1,8,21387),(1,8,28240),(1,8,17359),(1,9,8558),(1,9,7531),(1,9,5827),(1,9,33007),(1,9,31929),(1,9,41877),(1,9,3102),(1,9,30164),(1,9,37906),(1,9,39556),(1,9,31563),(1,9,45753),(1,9,4670),(1,9,43776),(1,9,45286),(1,10,46047),(1,10,41103),(2,2,12596),(2,2,14234),(2,2,10543),(2,2,10808),(2,3,16068),(2,3,338),(2,3,19280),(2,3,1),(2,3,636),(2,3,21387),(2,3,24022),(2,3,25579),(2,3,28240),(2,3,17359),(2,5,4670),(2,5,43776),(2,5,45286),(2,5,45753),(2,6,46047),(2,6,41103);

/*Table structure for table `gy_freight_template` */

DROP TABLE IF EXISTS `gy_freight_template`;

CREATE TABLE `gy_freight_template` (
  `template_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '运费模板ID',
  `template_name` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '模板名称',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 件数；1 商品重量；2 商品体积',
  `is_enable_default` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否启用使用默认运费配置,0:不启用，1:启用',
  PRIMARY KEY (`template_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COMMENT='运费模板表';

/*Data for the table `gy_freight_template` */

insert  into `gy_freight_template`(`template_id`,`template_name`,`type`,`is_enable_default`) values (1,'货运物流',1,0),(2,'普通快递',1,0);

/*Table structure for table `gy_friend_link` */

DROP TABLE IF EXISTS `gy_friend_link`;

CREATE TABLE `gy_friend_link` (
  `link_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `link_name` varchar(255) NOT NULL DEFAULT '' COMMENT '链接名称',
  `link_url` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `link_logo` varchar(255) NOT NULL DEFAULT '' COMMENT '链接logo',
  `orderby` tinyint(3) unsigned NOT NULL DEFAULT '50' COMMENT '排序',
  `is_show` tinyint(1) DEFAULT '1' COMMENT '是否显示',
  `target` tinyint(1) DEFAULT '1' COMMENT '是否新窗口打开',
  PRIMARY KEY (`link_id`),
  KEY `show_order` (`orderby`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `gy_friend_link` */

insert  into `gy_friend_link`(`link_id`,`link_name`,`link_url`,`link_logo`,`orderby`,`is_show`,`target`) values (1,'手提袋印刷厂','http://www.guaguayin.cn','',1,1,1);

/*Table structure for table `gy_goods` */

DROP TABLE IF EXISTS `gy_goods`;

CREATE TABLE `gy_goods` (
  `goods_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `cat_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `extend_cat_id` int(11) DEFAULT '0' COMMENT '扩展分类id',
  `goods_sn` varchar(60) NOT NULL DEFAULT '' COMMENT '商品编号',
  `goods_name` varchar(120) NOT NULL DEFAULT '' COMMENT '商品名称',
  `mobile_name` varchar(120) DEFAULT '' COMMENT '商品手机端名称',
  `click_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击数',
  `brand_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '品牌id',
  `store_count` smallint(5) unsigned NOT NULL DEFAULT '10' COMMENT '库存数量',
  `comment_count` smallint(5) DEFAULT '0' COMMENT '商品评论数',
  `unit` varchar(50) DEFAULT '' COMMENT '数量单位',
  `weight` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '商品重量克为单位',
  `send_date` int(5) DEFAULT '0' COMMENT '预计发货时间',
  `volume` double(10,4) unsigned DEFAULT '0.0000' COMMENT '商品体积。单位立方米',
  `goods_num` varchar(255) DEFAULT '' COMMENT '爆品印品的时候填写500,1000,2000等',
  `market_price` varchar(255) DEFAULT '' COMMENT '市场价',
  `shop_price` varchar(255) NOT NULL DEFAULT '' COMMENT '本店价',
  `cost_price` varchar(255) DEFAULT '' COMMENT '商品成本价',
  `price_ladder` text COMMENT '价格阶梯',
  `goods_use_scene` text COMMENT '商品使用场景',
  `goods_rec_star` smallint(2) DEFAULT NULL COMMENT '推荐指数',
  `goods_comment` text COMMENT '商品评价',
  `goods_spec` text COMMENT '产品规格',
  `goods_rec_reason` text COMMENT '推荐理由',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '商品关键词',
  `goods_remark` varchar(255) NOT NULL DEFAULT '' COMMENT '商品简单描述',
  `goods_content` text COMMENT '商品详细描述',
  `mobile_content` text COMMENT '手机端商品详情',
  `original_img` varchar(255) NOT NULL DEFAULT '' COMMENT '商品上传原始图',
  `is_virtual` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否为虚拟商品 1是，0否',
  `virtual_indate` int(11) DEFAULT '0' COMMENT '虚拟商品有效期',
  `virtual_limit` smallint(6) DEFAULT '0' COMMENT '虚拟商品购买上限',
  `virtual_refund` tinyint(1) DEFAULT '1' COMMENT '是否允许过期退款， 1是，0否',
  `virtual_sales_sum` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '虚拟销售量',
  `virtual_collect_sum` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '虚拟收藏量',
  `collect_sum` int(11) unsigned NOT NULL COMMENT '收藏量',
  `is_on_sale` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否上架',
  `is_free_shipping` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否包邮0否1是',
  `on_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品上架时间',
  `sort` smallint(4) unsigned NOT NULL DEFAULT '50' COMMENT '商品排序',
  `is_recommend` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐',
  `is_new` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否新品',
  `is_hot` tinyint(1) DEFAULT '0' COMMENT '是否热卖',
  `last_update` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后更新时间',
  `goods_type` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '商品所属类型id，取值表goods_type的cat_id',
  `spec_type` smallint(5) DEFAULT '0' COMMENT '商品规格类型，取值表goods_type的cat_id',
  `give_integral` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '购买商品赠送积分',
  `exchange_integral` int(10) NOT NULL DEFAULT '0' COMMENT '积分兑换：0不参与积分兑换，积分和现金的兑换比例见后台配置',
  `suppliers_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '供货商ID',
  `sales_sum` int(11) DEFAULT '0' COMMENT '商品销量',
  `prom_type` tinyint(1) DEFAULT '0' COMMENT '0默认1抢购2团购3优惠促销4预售5虚拟(5其实没用)6拼团7搭配购',
  `prom_id` int(11) NOT NULL DEFAULT '0' COMMENT '优惠活动id',
  `commission` decimal(10,2) DEFAULT '0.00' COMMENT '佣金用于分销分成',
  `spu` varchar(128) DEFAULT '' COMMENT 'SPU',
  `sku` varchar(128) DEFAULT '' COMMENT 'SKU',
  `template_id` int(11) unsigned DEFAULT '0' COMMENT '运费模板ID',
  `video` varchar(255) DEFAULT '' COMMENT '视频',
  `is_sheji` tinyint(3) DEFAULT '0',
  PRIMARY KEY (`goods_id`),
  KEY `goods_sn` (`goods_sn`),
  KEY `cat_id` (`cat_id`),
  KEY `last_update` (`last_update`),
  KEY `brand_id` (`brand_id`),
  KEY `goods_number` (`store_count`),
  KEY `goods_weight` (`weight`),
  KEY `sort_order` (`sort`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

/*Data for the table `gy_goods` */

insert  into `gy_goods`(`goods_id`,`cat_id`,`extend_cat_id`,`goods_sn`,`goods_name`,`mobile_name`,`click_count`,`brand_id`,`store_count`,`comment_count`,`unit`,`weight`,`send_date`,`volume`,`goods_num`,`market_price`,`shop_price`,`cost_price`,`price_ladder`,`goods_use_scene`,`goods_rec_star`,`goods_comment`,`goods_spec`,`goods_rec_reason`,`keywords`,`goods_remark`,`goods_content`,`mobile_content`,`original_img`,`is_virtual`,`virtual_indate`,`virtual_limit`,`virtual_refund`,`virtual_sales_sum`,`virtual_collect_sum`,`collect_sum`,`is_on_sale`,`is_free_shipping`,`on_time`,`sort`,`is_recommend`,`is_new`,`is_hot`,`last_update`,`goods_type`,`spec_type`,`give_integral`,`exchange_integral`,`suppliers_id`,`sales_sum`,`prom_type`,`prom_id`,`commission`,`spu`,`sku`,`template_id`,`video`,`is_sheji`) values (1,7,0,'TP0000001','宣传单页彩页国民款，一纸在手，客户我有','单页国民款',504,0,1000,0,'','9.40',3,0.0000,'500,1000,2000,3000,5000','0.8','0.2,0.16,0.14,0.13,0.09','0.00',NULL,'汽车4s店营销、饭店开业、辅导班开业、白酒宣传、家电促销、婚庆庆典、购物网站宣传、学校招生、企业招商',5,'印刷的效果很不错！ 清晰分明，颜色也很不错，纸张的克数可以说是足克足量的，难得！ 尤其设计，很有耐心！ 快递速度也超乎想象的快！ 整体很满意的感觉，应该还会有合作的！','成品尺寸： A4 16开(210*285mm)；纸张类型：铜版157g；正背颜色：双面彩色印刷','营销利器、画面适中、应用最广、性价比超高','单页,宣传','助力企业形象、宣传企业产品的有效方式。让客户舍不得丢弃的收藏级宣传单页，包邮！','&lt;p&gt;1&lt;br/&gt;&lt;/p&gt;',NULL,'/public/upload/goods/2018/11-05/05c371ce572ace5afe2e7997f6be78f9.jpg',0,0,0,1,0,0,1,1,1,0,50,1,0,1,0,1,0,0,0,0,0,0,0,'0.00','','',1,'',0),(2,3,0,'TP0000002','水果盒子，畅销15年，良心推荐','',101,0,65535,0,'','600.00',0,0.0000,'','400.00','200.00','0.00',NULL,'招标、光盘、企业办公、标书制作、档案袋、文件夹等',4,'在呱呱印做了很多印刷品，封套印刷给的报价也很照顾，标准的企业封套尺寸，作为知名封套设计印刷厂，已经是我们公司签约的长期彩色封套印刷公司了。','成品尺寸：210宽＊285高＊70mm下兜口；纸张类型：铜版250g；后道工艺：单面覆哑膜；','优质纸张、品质保证；精致印刷、环保油墨','','彩色印刷插页封套，整理纸张，同时可附上企业名片和宣传单，形成整合的一套文件材料，包邮！','&lt;p&gt;&lt;span style=&quot;font-family:&amp;#39;&amp;#39;, &amp;#39;&amp;#39;, &amp;#39;应用字体&amp;#39;;&quot;&gt;在呱呱印做了很多印刷品，封套印刷给的报价也很照顾，标准的企业封套尺寸，作为知名封套设计印刷厂，已经是我们公司签约的长期彩色封套印刷公司&lt;/span&gt;&lt;br/&gt;&lt;/p&gt;',NULL,'/public/upload/goods/2018/08-16/86d28e9cc4f0ad9c841c1087e60a90e7.png',0,0,0,1,0,0,0,1,0,0,50,1,0,1,0,0,0,0,0,0,0,0,0,'0.00','','',1,'',0),(3,38,0,'GGY0000003','封套 创业款，畅销15年，良心推荐','封套创业款',143,0,1000,0,'个','19.30',5,0.0000,'500,1000','4.2','2.76,1.98','',NULL,'招标、光盘、企业办公、标书制作、档案袋、文件夹等',5,'在呱呱印做了很多印刷品，封套印刷给的报价也很照顾，标准的企业封套尺寸，作为知名封套设计印刷厂，已经是我们公司签约的长期彩色封套印刷公司了。',' 成品尺寸：213宽＊300高＊70mm下兜口；纸张类型：铜版300g；后道工艺：单面覆哑膜；','优质纸张、品质保证；精致印刷、环保油墨','封套','彩色印刷插页封套，整理纸张，同时可附上企业名片和宣传单，形成整合的一套文件材料，包邮！','',NULL,'/public/upload/goods/2018/11-05/56f0f2f9c8b2aab9ba586f81ebd3d1bd.jpg',0,0,0,1,0,0,0,1,1,0,50,1,0,1,0,2,0,0,0,0,0,0,0,'0.00','','',1,'',0),(4,12,0,'TP0000004','新款绿茶叶密封罐包装礼盒定制','新款绿茶叶密封罐包装礼盒定制',100,0,65535,0,'','0.00',0,0.0000,'','150.00','100.00','0.00',NULL,'简约中式田园风，罐盖采用精致盖钮小巧玲珑，方便拿捏，无纺布包裹，真正保鲜；罐底人工打磨平整，不伤桌面，稳重大方。',5,'手感高档、密封性能好、符合环保绿色包装的要求，也不算贵，比我们这边的包装厂里价位低。','尺寸：34cm*19cm*13.5cm；原料材质：优质陶土哥窑；工艺：贴花','内放两个最大直径13.5cm，高度13.5cm，水容量约800ml；罐内以无纺布包边，与罐口严丝合缝，保鲜性极好。','','定窑树枝陶艺茶叶罐礼盒套装，器美养眼，茶香沁心','&lt;p&gt;&lt;span style=&quot;font-family:&amp;#39;&amp;#39;, &amp;#39;&amp;#39;, &amp;#39;应用字体&amp;#39;;font-weight:200;font-size:13px;color:#999999;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/public/upload/goods/2018/11-23/121de8904b47ef31146f00e16c0a9d3f.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/public/upload/goods/2018/11-23/3242a62966e359147fc2949a4c0b5945.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/public/upload/goods/2018/11-23/fecfb28977b8d9ebfe15d57a206032e8.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/public/upload/goods/2018/11-23/073418705e150eb5b3aa202aee7eb0e7.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/public/upload/goods/2018/11-23/6a369e88e64f33e403982750f345293b.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/public/upload/goods/2018/11-23/9e41fd1b9a18a1eaf1f125544b76fd98.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/public/upload/goods/2018/11-23/065a800af8e138dda2f2b6f7d8b19ac7.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/public/upload/goods/2018/11-23/4293414b2da4d87ca274a1c2913b5615.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/public/upload/goods/2018/11-23/35afd7b21522e68f5333799237370533.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/public/upload/goods/2018/11-23/93c3fcb929c979dbda15bc5acda2b958.jpg&quot; title=&quot;&quot; alt=&quot;&quot;/&gt;&lt;/p&gt;',NULL,'/public/upload/goods/2018/11-23/1b17947a3fd40a5a2c43e6df7d2fe848.jpg',0,0,0,1,0,0,0,1,1,0,50,1,0,1,0,2,0,0,0,0,0,0,0,'0.00','','',1,'',0),(7,2,0,'TP0000007','精致公司宣传画册 pro，样本说明书印刷，一册在手，生意我有','画册pro',217,0,1000,0,'本','86.40',5,0.0000,'500,1000,2000,3000','4.6','2.9,1.9,1.45,1.42','',NULL,'企业品牌宣传、产品推广、建筑装潢、机械制作、餐饮美食、旅游酒店、美容婚庆、教育培训、房产汽车',5,'公司最近要设计和印刷宣传画册，画册到货后，感觉手感厚实细腻，内页纸张更加挺括，也是质感良好的骑马钉画册，适合想高端的成品介绍、公司品牌介绍、产品说明等。','成品尺寸：A4 (285*210mm) 竖版画册；纸张类型：封面铜版纸250g、内页铜版纸157g，厚重、光泽；页数：8张（16页）；后道工艺：封面覆哑膜；装订方式：骑马钉装订','富有创意的画册，给客户感染力更强；宣传有&quot;力&quot;，产品才能更有&quot;利&quot; ','企业宣传画册','全方位立体展示企业或个人的风貌、理念，让您的营销发挥得淋漓尽致','',NULL,'/public/upload/goods/2018/11-08/dadb4947047322d6a87b39137d86c3f6.jpg',0,0,0,1,0,0,0,1,1,0,50,1,0,1,0,1,0,0,0,0,-1000,0,0,'0.00','','',1,'',0),(8,14,0,'GGY0000008','小米移动电源 限量抢兑','小米移动电源 限量抢兑',51,0,65535,0,'','0.00',0,0.0000,'','69','69.00','0.00',NULL,'',0,'','','','','','',NULL,'/public/upload/goods/2018/09-14/b1f90acb7fece07eb4f0accd47bd09a1.jpg',0,0,0,1,0,0,0,1,1,0,50,1,0,1,0,0,0,0,100,0,0,0,0,'0.00','','',1,'',0),(9,15,0,'GGY0000009','手提袋定制','手提袋定制',121,0,65535,0,'个','0.00',5,0.0000,'100,200,500,1000','','1','',NULL,'',0,'','','','手提袋,手袋','','',NULL,'/public/upload/goods/2018/11-08/39cb3e285b92d5d4d8b94271a9783612.png',0,0,0,1,0,0,0,1,1,0,50,1,0,1,0,3,0,0,0,0,0,0,0,'0.00','','',1,'',0),(10,16,0,'GGY0000010','三折页V5款，爆爽手感，先于时代','三折页V5款',26,0,1000,0,'','11.90',3,0.0000,'500','0.9','0.43','',NULL,'汽车4s店营销、饭店开业、辅导班开业、白酒宣传、家电促销、婚庆庆典、购物网站宣传、学校招生、企业招商等',5,'考虑过4折页印刷，二折页印刷，最终选择这个v5款三折页，真的很威武，打开感较强，打开后的首页容易抓住浏览者的眼球，适合安排我们这些推广内容！ 整体很满意感觉，期待下次合作！\r\n','折后尺寸：210*95mm；展开尺寸：A4 (210*285mm)；纸张类型：铜版200g ；双面覆哑膜；折法：荷包折，由外向内折，打开感更强','三折页，两折三页，两道折痕，宛如马甲线般性感','折页','最常用的折页，成本低，携带方便，适合简洁的产品促销宣传！做一份让用户主动带走的宣传折页，江浙沪包邮！','',NULL,'/public/upload/goods/2018/11-05/3beb08d3dbb0e5fbddc4c2d2e77ef9b4.jpg',0,0,0,1,0,0,0,1,1,0,3,1,0,1,0,1,0,0,0,0,0,0,0,'0.00','','',0,'',0),(11,22,0,'GGY0000011','海报 蓝天款，与蓝天白云融为一体','印刷海报蓝天款',12,0,65535,0,'张','47.88',3,0.0000,'500,1000','','1.7,1.05','2.8',NULL,'店庆、周年庆、促销海报、开业活动海报、连锁店批量张贴等',5,'以前不知道海报印刷多少钱一张？呱呱印是专业的海报印刷厂，耐心告诉我们海报用什么材质最适合，最终给我们的海报印刷价格很便宜，还免了海报形象设计费用，我们办展会印刷这个海报做宣传真是明智的选择！','成品尺寸：420*570mm(A2,4开)；纸张类型：200g铜版纸；正背颜色：单面彩色印刷   ','高端设计、过目不忘；色彩鲜亮、文字清晰','宣传,海报','尺寸、画面适中，大纬度，视觉冲击力较好！','',NULL,'/public/upload/goods/2018/11-08/8b662e2cdae49e7c65965c356d03f85f.jpg',0,0,0,1,0,0,0,1,1,0,4,1,1,1,0,1,0,0,0,0,0,0,0,'0.00','','',0,'',0),(12,18,0,'GGY0000012','台历air，企业专属定制，为您带来365天持续宣传','台历air',14,0,65535,0,'本','95.55',10,0.0000,'500,1000','15','10.4,7.5','',NULL,'公司采购办公使用，宣传台历，礼品台历送给员工、客户、合作伙伴、粉丝',5,'新年2017年我们定做了企业台历，也做了公司广告台历印刷，作为礼品台历送给客户。给人印象高端大气，稳如泰山，厂家用加厚纸张，光滑有内涵，翻页感觉很流畅。','成品尺寸：8寸（250*140mm）；页数：13页（封面1张，内页12张）；纸张类型：铜版250g；装订方式：YO简圈装订；底座：2cm加厚版','采用高档铜版纸，色彩还原度更，高细节展示更细腻，摸上去手感独特','台历,挂历','精致小巧 适合企业文化宣传 形象展示','',NULL,'/public/upload/goods/2018/11-08/6b7e0d84bc3082c27cc0be8fd38d738b.jpg',0,0,0,1,0,0,0,1,1,0,5,0,0,1,0,1,0,0,0,0,0,0,0,'0.00','','',0,'',0),(13,6,0,'GGY0000013','手提袋note，让每个人都成为您的流动广告','手提袋note',78,0,65535,0,'个','67.00',5,0.0000,'100,200,500,1000','9.9','6.2,3.75,2.16,1.9','',NULL,'企业商务、服装厂、酒类、茶叶、化妆品、鞋子、礼品',5,'纸质手提袋是日常商务活动中最常见的印刷品之一，我们理解工序复杂，耗工较多，所以特别是小批量手提袋成本居高。感谢呱呱印新生产方式，重新定义手提袋价格，给我们价格低至0.99元/个！','成品尺寸：中号袋 (高360mm*宽260mm*侧80mm)；纸张类型：250g白卡纸（竖版） ；后道工艺：单面覆哑膜； 穿绳方式：多色提绳，专业承重检测合格后出货，连接处精选优质马蹄扣，比传统更牢固','精选优质环保白卡纸，纸张质感更佳良好，承重性更高更好；表面覆膜，防水坚固','手提袋,手袋','100%纯木浆进口环保白卡纸，印刷更高档，拎到哪里都是焦点！','',NULL,'/public/upload/goods/2018/11-08/c410487b9d5031f192f74ca00656568d.jpg',0,0,0,1,0,0,0,1,0,0,10,0,0,0,0,1,0,0,0,0,0,0,0,'0.00','','',1,'',0),(14,17,0,'GGY0000014','名片梦想款，再大梦想从一张名片开启','名片梦想款',16,0,65535,0,'盒','150.00',3,0.0000,'2,5,10','18','9.9,8,6','',NULL,'企业合作、商务洽谈、拜访客户、参加会议、认识伙伴',5,'很光滑的切边，裁剪整齐，无毛边。呱呱印的名片模版也很多，满足我个性名片设计，定制专属风格，服务也很贴心，我么参加了微信活动，免费拿了抵用券，很满意的一次名片印刷！','100张/盒；成品尺寸：90*54mm切直角；纸张类型：300g高级铜版纸 ；后道工艺：双面覆哑膜   ','纸面均匀光洁，质优价廉，色彩表现力强，打造身份利器！','名片','最常用名片，适用多种场合，办公常备的优质名片！','',NULL,'/public/upload/goods/2018/11-13/101116614e0e7f869ea56e6e92462552.jpg',0,0,0,1,0,0,0,1,1,0,50,0,0,0,0,0,0,0,0,0,0,0,0,'0.00','','',2,'',0),(15,15,0,'GGY0000015','画册定制','画册定制',86,0,0,0,'本','0.00',0,0.0000,'200,500,1000,2000,3000','','12','',NULL,'',0,'','','','','','',NULL,'/public/upload/goods/2018/11-20/afd09ea358a7babdc7a0c6a33dbd992d.jpg',0,0,0,1,0,0,0,1,0,0,50,1,0,1,0,3,0,0,0,0,0,0,0,'0.00','','',1,'',0),(16,15,0,'GGY0000016','单页定制','单页定制',24,0,0,0,'','0.00',0,0.0000,'500,1000,2000,3000,5000,10000','','0.9','',NULL,'',0,'','','','','','',NULL,'/public/upload/goods/2018/11-20/5614583f4b2ebb0583e1d22070e4d04f.jpg',0,0,0,1,0,0,0,1,1,0,50,1,0,1,0,3,0,0,0,0,0,0,0,'0.00','','',0,'',0),(17,127,0,'GGY0000017','贵州都匀毛尖茶叶烟条礼盒装 ','贵州都匀毛尖茶叶烟条礼盒装 ',24,0,65535,0,'','0.00',0,0.0000,'','','1','',NULL,'采用烟条礼盒包装设计，赋予小盒小包概念，彰显中国十大名茶，送礼首选',4,'包装精美，感觉不错，茶叶包装很好适合送人，小包装拿着方便！都匀毛尖茶叶的确很好，口感已不错。自己喝，送礼都非常好。','手提袋尺寸：360*280＊80mm；烟盒尺寸：250＊14mm','精致礼盒，一个手提袋装2条，每条10小盒，每小盒4包，每小包3克，每小包冲泡一杯茶','','明前春茶云雾炒青绿茶，包邮！','&lt;p&gt;&lt;img src=&quot;/public/upload/goods/2018/11-23/3f8bcc7bc7a5e153a1809de721e69cd4.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/public/upload/goods/2018/11-23/6f2e6bcbc1ac9c5ab774201c8603edc3.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/public/upload/goods/2018/11-23/196062138db7c7995dc0b6776246f049.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/public/upload/goods/2018/11-23/28b245c458da59abb8a9fb7fec2b0894.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/public/upload/goods/2018/11-23/204f62f06585d5ade91a82a12e0ade99.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/public/upload/goods/2018/11-23/67084357d2e9c0db67ad37daf228de1d.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;',NULL,'/public/upload/goods/2018/11-23/02576ea6cd6a525416ae545a20ebc3d8.jpg',0,0,0,1,0,0,0,1,1,0,50,0,0,1,0,2,0,0,0,0,0,0,0,'0.00','','',0,'',0),(18,128,0,'GGY0000018','高山云雾绿茶礼盒 ','高山云雾绿茶礼盒 ',3,0,65535,0,'','0.00',0,0.0000,'','','1','',NULL,'茶凉了，谁来为我续上，续一盅前世未曾品尝的好茶，让茶水捂热冰冷的骨骼，让粉红的桃花开满我苍白的面容。',5,'订购了很多一套的样品，发货快没有破损，质量都不错下次大量要货。','四罐礼盒尺寸：高38cm*长28cm*宽9cm；两罐礼盒尺寸：高35cm*长25cm*宽9cm；罐子尺寸：高9cm*长14cm*宽9cm；罐子材质: 金属','1个礼盒，1个手提袋，铁罐加内膜袋盒金丝绳；2罐4罐装，四罐礼盒共大概装1斤茶叶，两罐礼盒共大概装半斤茶叶，一罐礼盒共大概装125g茶叶，具体以实际容量为准。','','金属茶叶罐包装盒','&lt;p&gt;&lt;img src=&quot;/public/upload/goods/2018/11-23/65429ea48ef42f021d02432e6006ac9d.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/public/upload/goods/2018/11-23/609f86cfdeb7ec4732f524a606e5fd12.gif&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/public/upload/goods/2018/11-23/bccfa0dd4b42f92a76795f325afc0622.gif&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/public/upload/goods/2018/11-23/39974895e71ceb4f136b8d29fe93c332.gif&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/public/upload/goods/2018/11-23/eef1b74add5025fe34cc85d495f3f92c.gif&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/public/upload/goods/2018/11-23/31524b204d39f0c7f34a70ca067d5c78.gif&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/public/upload/goods/2018/11-23/9984ca58a0ea73225444099a94b949fe.gif&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;',NULL,'/public/upload/goods/2018/11-23/d5885a17e623e3f42991172ac1ee9580.gif',0,0,0,1,0,0,0,1,1,0,50,0,0,1,0,2,0,0,0,0,0,0,0,'0.00','','',0,'',0),(19,46,0,'GGY0000019','玫瑰花茶干果陈皮包装','玫瑰花茶干果陈皮包装',5,0,65535,0,'','0.00',0,0.0000,'','','1','',NULL,'花茶香味浓郁，茶汤色深。外形条索紧结匀整，色泽黄绿尚润，红黑两色，典雅大气！',4,'礼盒很好，很精致，就是物流稍慢，提前预定比较好些。','包装材质：纸盒＋玻璃瓶；外盒尺寸：31*21*9cm；内罐尺寸：直径6.5cm，高度15.5cm；装箱数量：16套/箱；个性定制：激光雕刻，玻璃瓶内不干胶标签','手提袋＋纸盒＋玻璃瓶，三罐精致包装，每一次使用都信手捏来。','','一片心意，一盒好礼，玻璃瓶经典三罐装','&lt;p&gt;&lt;img src=&quot;/public/upload/goods/2018/11-23/b30f4ce980eaca59b7c83908db86773e.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/public/upload/goods/2018/11-23/c13d0342e0c6bf6255f2100da9006dc1.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/public/upload/goods/2018/11-23/4378d79f5cdf577576403d6f12d2cbd3.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/public/upload/goods/2018/11-23/cbcbaecb0bf11afcfab4a56bc3a3ef9f.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;',NULL,'/public/upload/goods/2018/11-23/a8ca15667e893b6764083ad6921022a5.jpg',0,0,0,1,0,0,0,1,1,0,50,0,0,1,0,0,0,0,0,0,0,0,0,'0.00','','',0,'',0),(20,9,0,'GGY0000020','黄山毛峰茶礼品盒','黄山毛峰茶礼品盒',8,0,65535,0,'','0.00',0,0.0000,'','','1','',NULL,'黄山毛峰新茶古法制茶，百年技艺传承，鲜醇耐泡，匠心独运的礼袋设计，回归自然的清新，与茶性的悠然自得十分契合',5,'茶叶礼盒包装精美，中秋送礼，大气有档次，老字号的品质让人放心。物流迅速，总之，满意。','尺寸：31cm*24cm*9.5cm ；容量：2罐*125g','精致礼盒外装，内装典雅2罐*125g大容量，有料有面子。','','礼盒超值半斤设计，大份量，送礼倍有面','&lt;p&gt;&lt;img src=&quot;/public/upload/goods/2018/11-23/16761847350b5084747beeae5d476ca7.jpg&quot;/&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://118.25.46.184:8000/public/upload/goods/2018/11-23/916992acaac733df19fee70abbbbe008.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/public/upload/goods/2018/11-23/52dcc4ad4d9281bc46c5216d31c859ee.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/public/upload/goods/2018/11-23/e7d567b027033fd050076ccb3e18b974.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/public/upload/goods/2018/11-23/55c20b6e00f2c3e035a7655d63a2fc40.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/public/upload/goods/2018/11-23/611a271f4c0d7a034cc255059735f50a.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/public/upload/goods/2018/11-23/76fbb984d3107b0c683c26f7d6225652.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/public/upload/goods/2018/11-23/6ff457e664bf71e3691cb50e1e6a7984.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;',NULL,'/public/upload/goods/2018/11-23/d93b87c22e5644571f6849e87e5e4a59.jpg',0,0,0,1,0,0,0,1,1,0,50,0,0,1,0,0,0,0,0,0,0,0,0,'0.00','','',0,'',0),(21,52,0,'GGY0000021','珍稀白茶礼盒装 茅山安吉白茶','珍稀白茶礼盒装 茅山安吉白茶',9,0,65535,0,'','0.00',0,0.0000,'','','1','',NULL,'甄选明前“安吉白叶一号”鲜叶，使得口感更加鲜爽，实乃白茶中的佳品，匠心鼎造，品味不凡，独特的小袋礼盒包装更显尊贵',5,'白茶包装美美的，好评收好！身边的朋友要是买白茶叶包装盒，就推荐你们家，没跑了，赞赞赞！','单条礼盒装；容量：36包；净含量：2g*36包；工艺：烫金','烟条式独立包装，外观精致；食品级铝箔小包，36包装； 拉丝塑料膜紧缩茶鲜，更密封','','烫金礼盒 高端典雅 鲜香爽口 送礼佳品','&lt;p&gt;&lt;img src=&quot;/public/upload/goods/2018/11-23/44e2065b19360c8ec302715d0904fb53.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/public/upload/goods/2018/11-23/6bab6d7ec1f25c1c97774fbcce0768bc.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/public/upload/goods/2018/11-23/ef3c705872bc988a4781e8f7f5857dc9.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/public/upload/goods/2018/11-23/a014cf814e1b906a00ac5f2de3dc9e35.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/public/upload/goods/2018/11-23/0c547ab81845300564e98f03e393cbdb.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/public/upload/goods/2018/11-23/2834ddab5baa754185342949eadbe565.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/public/upload/goods/2018/11-23/5fa1198fb0f0e3f9de30d491e8329e1b.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/public/upload/goods/2018/11-23/741bb2711566a9ee744beae41db656f8.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;',NULL,'/public/upload/goods/2018/11-23/b794002c011e7c464a55f0ccb4914d13.jpg',0,0,0,1,0,0,0,1,1,0,50,0,0,1,0,0,0,0,0,0,0,0,0,'0.00','','',0,'',0),(22,2,0,'GGY0000022','设计单页彩页国民款，一纸在手，客户我有','单页',73,0,10,0,'','0.00',0,0.0000,'','','10.00','',NULL,'',0,'','','','','','&lt;p&gt;设计图片&lt;/p&gt;',NULL,'/public/upload/goods/2018/09-14/b1f90acb7fece07eb4f0accd47bd09a1.jpg',0,0,0,1,0,0,0,1,1,0,50,0,0,0,0,0,0,0,0,0,0,0,0,'0.00','','',0,'',1);

/*Table structure for table `gy_goods_activity` */

DROP TABLE IF EXISTS `gy_goods_activity`;

CREATE TABLE `gy_goods_activity` (
  `act_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '活动ID',
  `act_name` varchar(255) NOT NULL DEFAULT '' COMMENT '活动名称',
  `act_desc` text NOT NULL COMMENT '活动描述',
  `act_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '活动类型:1预售2拼团',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '参加活动商品ID',
  `spec_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '商品规格ID',
  `goods_name` varchar(255) NOT NULL DEFAULT '' COMMENT '商品名称',
  `start_time` int(10) unsigned NOT NULL COMMENT '活动开始时间',
  `end_time` int(10) unsigned NOT NULL COMMENT '活动结束时间',
  `is_finished` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否已结束:0,正常；1,成功结束；2，失败结束。',
  `ext_info` text NOT NULL COMMENT '活动扩展配置',
  `act_count` mediumint(8) NOT NULL DEFAULT '0' COMMENT '商品购买数',
  PRIMARY KEY (`act_id`),
  KEY `act_name` (`act_name`,`act_type`,`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `gy_goods_activity` */

/*Table structure for table `gy_goods_attr` */

DROP TABLE IF EXISTS `gy_goods_attr`;

CREATE TABLE `gy_goods_attr` (
  `goods_attr_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品属性id自增',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `attr_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '属性id',
  `attr_value` text NOT NULL COMMENT '属性值',
  `attr_price` varchar(255) NOT NULL DEFAULT '' COMMENT '属性价格',
  PRIMARY KEY (`goods_attr_id`),
  KEY `goods_id` (`goods_id`),
  KEY `attr_id` (`attr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `gy_goods_attr` */

insert  into `gy_goods_attr`(`goods_attr_id`,`goods_id`,`attr_id`,`attr_value`,`attr_price`) values (2,3,2,'天地盖盒','0'),(3,4,2,'书型盒','0'),(6,4,3,'硬纸板','0'),(7,17,2,'天地盖盒','0'),(8,17,3,'硬纸板','0'),(9,18,2,'天地盖盒','0'),(10,18,3,'硬纸板','0');

/*Table structure for table `gy_goods_attribute` */

DROP TABLE IF EXISTS `gy_goods_attribute`;

CREATE TABLE `gy_goods_attribute` (
  `attr_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '属性id',
  `attr_name` varchar(60) NOT NULL DEFAULT '' COMMENT '属性名称',
  `type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '属性分类id',
  `attr_index` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0不需要检索 1关键字检索 2范围检索',
  `attr_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0唯一属性 1单选属性 2复选属性',
  `attr_input_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT ' 0 手工录入 1从列表中选择 2多行文本框',
  `attr_values` text NOT NULL COMMENT '可选值列表',
  `order` tinyint(3) unsigned NOT NULL DEFAULT '50' COMMENT '属性排序',
  PRIMARY KEY (`attr_id`),
  KEY `cat_id` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `gy_goods_attribute` */

insert  into `gy_goods_attribute`(`attr_id`,`attr_name`,`type_id`,`attr_index`,`attr_type`,`attr_input_type`,`attr_values`,`order`) values (2,'盒型',2,1,0,1,'天地盖盒    \r\n书型盒      \r\n箱式盒    \r\n抽拉盒     \r\n手提盒     \r\n异形盒     \r\n圆筒盒\r\n其他',50),(3,'材质',2,1,0,1,'硬纸板     \r\n白卡纸\r\n金银卡纸     \r\n牛卡纸\r\n瓦楞纸\r\n木质      \r\n皮质     \r\n铁盒    \r\n锦盒    \r\n软包',50);

/*Table structure for table `gy_goods_category` */

DROP TABLE IF EXISTS `gy_goods_category`;

CREATE TABLE `gy_goods_category` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品分类id',
  `name` varchar(90) NOT NULL DEFAULT '' COMMENT '商品分类名称',
  `mobile_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '手机端显示的商品分类名',
  `parent_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `parent_id_path` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '家族图谱',
  `level` tinyint(1) DEFAULT '0' COMMENT '等级',
  `sort_order` tinyint(1) unsigned NOT NULL DEFAULT '50' COMMENT '顺序排序',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `image` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '分类图片',
  `is_hot` tinyint(1) DEFAULT '0' COMMENT '是否推荐为热门分类',
  `cat_group` tinyint(1) DEFAULT '0' COMMENT '分类分组默认0',
  `commission_rate` tinyint(1) DEFAULT '0' COMMENT '分佣比例',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=utf8;

/*Data for the table `gy_goods_category` */

insert  into `gy_goods_category`(`id`,`name`,`mobile_name`,`parent_id`,`parent_id_path`,`level`,`sort_order`,`is_show`,`image`,`is_hot`,`cat_group`,`commission_rate`) values (1,'画册 宣传单 折页','画册 宣传单 折页',8,'0_8_1',2,1,1,'',1,0,0),(2,'画册','画册',1,'0_8_1_2',3,2,1,'',0,0,0),(3,'现货通用品','现货通用品',0,'0_3',1,3,0,'',0,0,0),(4,'包装盒定制设计','包装盒定制设计',0,'0_4',1,8,1,'',0,0,0),(5,'手提袋 台历 菜谱','手提袋 台历 菜谱',8,'0_8_5',2,2,1,'',0,0,0),(6,'手提袋','手提袋',5,'0_8_5_6',3,1,1,'',0,0,0),(7,'单页','单页',1,'0_8_1_7',3,1,1,'',0,0,0),(8,'爆品快购','爆品快购',0,'0_8',1,0,1,'',0,0,0),(9,'茶叶包装盒','茶叶包装盒',4,'0_4_9',2,0,1,'',0,0,0),(11,'红茶包装盒','红茶',9,'0_4_9_11',3,0,1,'',0,0,0),(12,'绿茶包装盒','绿茶包装盒',9,'0_4_9_12',3,0,1,'',0,0,0),(14,'积分商城','积分商城',0,'0_14',1,4,0,'',0,0,0),(15,'定制印品','定制印品',0,'0_15',1,5,0,'',0,0,0),(16,'折页','折页',1,'0_8_1_16',3,3,1,'',0,0,0),(17,'名片','名片',31,'0_8_31_17',3,4,1,'',0,0,0),(18,'台历','台历',5,'0_8_5_18',3,2,1,'',0,0,0),(20,'菜谱','菜谱',5,'0_8_5_20',3,4,1,'',0,0,0),(21,'海报 展架 易拉宝','海报 展架 易拉宝',8,'0_8_21',2,3,1,'',0,0,0),(22,'海报','海报',21,'0_8_21_22',3,0,1,'',0,0,0),(23,'展架','展架',21,'0_8_21_23',3,0,1,'',0,0,0),(24,'易拉宝','易拉宝',21,'0_8_21_24',3,0,1,'',0,0,0),(31,'红包 信封 名片','红包 信封 名片',8,'0_8_31',2,5,1,'',0,0,0),(34,'红包','红包',31,'0_8_31_34',3,0,1,'',0,0,0),(35,'信封','信封',31,'0_8_31_35',3,0,1,'',0,0,0),(36,'不干胶 封套 卡券','不干胶 封套 卡券',8,'0_8_36',2,6,1,'',0,0,0),(37,'不干胶','不干胶',36,'0_8_36_37',3,0,1,'',0,0,0),(38,'封套','封套',36,'0_8_36_38',3,0,1,'',0,0,0),(39,'卡券','卡券',36,'0_8_36_39',3,0,1,'',0,0,0),(41,'档案袋 单据 便签','档案袋 单据 便签',8,'0_8_41',2,7,1,'',0,0,0),(42,'档案袋','档案袋',41,'0_8_41_42',3,0,1,'',0,0,0),(43,'单据','单据',41,'0_8_41_43',3,0,1,'',0,0,0),(45,'便签','便签',41,'0_8_41_45',3,0,1,'',0,0,0),(46,'花茶包装盒','花茶包装盒',9,'0_4_9_46',3,0,1,'',0,0,0),(47,'雨花茶包装盒','雨花茶包装盒',9,'0_4_9_47',3,0,1,'',0,0,0),(48,'养生茶包装盒','养生茶包装盒',9,'0_4_9_48',3,0,1,'',0,0,0),(49,'碧螺春茶包装盒','碧螺春茶包装盒',9,'0_4_9_49',3,0,1,'',0,0,0),(50,'铁观音茶盒','铁观音',9,'0_4_9_50',3,0,1,'',0,0,0),(51,'龙井茶包装盒','龙井茶包装盒',9,'0_4_9_51',3,0,1,'',0,0,0),(52,'白茶包装盒','白茶',9,'0_4_9_52',3,0,1,'',0,0,0),(53,'乌龙茶包装盒','乌龙茶包装盒',9,'0_4_9_53',3,0,1,'',0,0,0),(54,'普洱茶包装盒','普洱茶包装盒',9,'0_4_9_54',3,0,1,'',0,0,0),(55,'酒类包装盒','酒类包装盒',4,'0_4_55',2,0,1,'',0,0,0),(56,'白酒礼盒','白酒礼盒',55,'0_4_55_56',3,0,1,'',0,0,0),(57,'红酒礼盒','红酒礼盒',55,'0_4_55_57',3,0,1,'',0,0,0),(58,'保健酒礼盒','保健酒礼盒',55,'0_4_55_58',3,0,1,'',0,0,0),(65,'食品/礼品包装盒','食品/礼品包装盒',4,'0_4_65',2,0,1,'',0,0,0),(66,'月饼礼盒','月饼礼盒',65,'0_4_65_66',3,0,1,'',0,0,0),(67,'粽子礼盒','粽子礼盒',65,'0_4_65_67',3,0,1,'',0,0,0),(68,'土特产包装盒','土特产包装盒',65,'0_4_65_68',3,0,1,'',0,0,0),(69,'蜂蜜/糖果/零食包装盒','糖果零食包装盒',65,'0_4_65_69',3,0,1,'',0,0,0),(70,'海鲜/螃蟹/龙虾包装盒','螃蟹龙虾包装盒',65,'0_4_65_70',3,0,1,'',0,0,0),(71,'生鲜水果包装盒','生鲜水果包装盒',65,'0_4_65_71',3,0,1,'',0,0,0),(72,'大米/粮油/鸡蛋包装盒','粮油鸡蛋包装盒',65,'0_4_65_72',3,0,1,'',0,0,0),(73,'坚果干货包装盒','坚果干货包装盒',65,'0_4_65_73',3,0,1,'',0,0,0),(74,'咖啡/奶茶包装盒','咖啡/奶茶',65,'0_4_65_74',3,0,1,'',0,0,0),(75,'蛋糕/糕点包装盒','蛋糕/糕点包装盒',65,'0_4_65_75',3,0,1,'',0,0,0),(76,'服装服饰包装盒','服装服饰包装盒',4,'0_4_76',2,0,1,'',0,0,0),(77,'鞋盒衣服包装盒','鞋盒衣服包装盒',76,'0_4_76_77',3,0,1,'',0,0,0),(78,'围巾/丝巾包装盒','围巾/丝巾包装盒',76,'0_4_76_78',3,0,1,'',0,0,0),(79,'手表/皮带/手套包装盒','手表/皮带/手套包装盒',76,'0_4_76_79',3,0,1,'',0,0,0),(80,'内衣/内裤/文胸包装盒','内衣/内裤/文胸包装盒',76,'0_4_76_80',3,0,1,'',0,0,0),(81,'眼镜/首饰/项链包装盒','眼镜/首饰/项链包装盒',76,'0_4_76_81',3,0,1,'',0,0,0),(82,'领带/领结包装盒','领带/领结包装盒',76,'0_4_76_82',3,0,1,'',0,0,0),(83,'袖扣/钥匙扣包装盒','袖扣/钥匙扣包装盒',76,'0_4_76_83',3,0,1,'',0,0,0),(84,'肩背包/钱包/手提包包装盒','肩背包/钱包/手提包包装盒',76,'0_4_76_84',3,0,1,'',0,0,0),(85,'运动户外包装盒','运动户外包装盒',76,'0_4_76_85',3,0,1,'',0,0,0),(86,'家纺布艺包装盒','家纺布艺包装盒',76,'0_4_76_86',3,0,1,'',0,0,0),(87,'床上用品包装盒','床上用品包装盒',76,'0_4_76_87',3,0,1,'',0,0,0),(88,'化妆品包装盒','化妆品包装盒',4,'0_4_88',2,0,1,'',0,0,0),(89,'洗面奶/保湿水/ 香皂包装盒','洗面奶/保湿水/ 香皂包装盒',88,'0_4_88_89',3,0,1,'',0,0,0),(90,'日霜/晚霜/手霜包装盒','日霜/晚霜/手霜包装盒',88,'0_4_88_90',3,0,1,'',0,0,0),(91,'面膜/染发剂/染发膏包装盒','面膜/染发剂/染发膏包装盒',88,'0_4_88_91',3,0,1,'',0,0,0),(92,'香粉/粉底/精油包装盒','香粉/粉底/精油包装盒',88,'0_4_88_92',3,0,1,'',0,0,0),(93,'唇膏/睫毛膏包装盒','唇膏/睫毛膏包装盒',88,'0_4_88_93',3,0,1,'',0,0,0),(94,'香水/古龙水包装盒','香水/古龙水包装盒',88,'0_4_88_94',3,0,1,'',0,0,0),(95,'牙膏包装盒','牙膏包装盒',88,'0_4_88_95',3,0,1,'',0,0,0),(96,'剃须刀/电吹风包装盒','剃须刀/电吹风包装盒',88,'0_4_88_96',3,0,1,'',0,0,0),(97,'理发器/美容仪包装盒','理发器/美容仪包装盒',88,'0_4_88_97',3,0,1,'',0,0,0),(98,'3c数码包装盒','3c数码包装盒',4,'0_4_98',2,0,1,'',0,0,0),(99,'智能手机盒','智能手机盒',98,'0_4_98_99',3,0,1,'',0,0,0),(100,'充电宝包装盒','充电宝包装盒',98,'0_4_98_100',3,0,1,'',0,0,0),(101,'摄像头/耳机包装盒','摄像头/耳机包装盒',98,'0_4_98_101',3,0,1,'',0,0,0),(102,'手表/相机包装盒','手表/相机包装盒',98,'0_4_98_102',3,0,0,'',0,0,0),(103,'鼠标键盘/小音响包装盒','鼠标键盘/小音响包装盒',98,'0_4_98_103',3,0,1,'',0,0,0),(104,'路由器/U盘网卡包装盒','路由器/U盘网卡包装盒',98,'0_4_98_104',3,0,1,'',0,0,0),(105,'笔记本/平板电脑包装盒','笔记本/平板电脑包装盒',98,'0_4_98_105',3,0,1,'',0,0,0),(108,'母婴包装盒','母婴包装盒',4,'0_4_108',2,0,1,'',0,0,0),(109,'模型玩具包装盒','模型玩具包装盒',108,'0_4_108_109',3,0,1,'',0,0,0),(110,' 积木包装盒',' 积木包装盒',108,'0_4_108_110',3,0,1,'',0,0,0),(111,'玩具车包装盒','玩具车包装盒',108,'0_4_108_111',3,0,1,'',0,0,0),(112,'早教机/学习机包装盒','早教机/学习机包装盒',108,'0_4_108_112',3,0,1,'',0,0,0),(113,'纸尿裤/拉拉裤包装盒','纸尿裤/拉拉裤包装盒',108,'0_4_108_113',3,0,1,'',0,0,0),(114,'湿巾/奶瓶包装盒','湿巾/奶瓶包装盒',108,'0_4_108_114',3,0,1,'',0,0,0),(115,'医药保健品包装盒','医药保健品包装盒',4,'0_4_115',2,0,1,'',0,0,0),(116,'燕窝虫草包装盒','燕窝虫草包装盒',115,'0_4_115_116',3,0,1,'',0,0,0),(117,'人参鲍鱼包装盒','人参鲍鱼包装盒',115,'0_4_115_117',3,0,1,'',0,0,0),(118,'药材精油包装盒','药材精油包装盒',115,'0_4_115_118',3,0,1,'',0,0,0),(120,'中药饮片/药片包装盒','中药饮片/药片包装盒',115,'0_4_115_120',3,0,1,'',0,0,0),(121,'养生茶饮包装盒','养生茶饮包装盒',115,'0_4_115_121',3,0,1,'',0,0,0),(122,'冲剂/糖浆包装盒','冲剂/糖浆包装盒',115,'0_4_115_122',3,0,1,'',0,0,0),(123,'成人用品包装盒','成人用品包装盒',115,'0_4_115_123',3,0,1,'',0,0,0),(124,'止血贴/退热贴包装盒','止血贴/退热贴包装盒',115,'0_4_115_124',3,0,1,'',0,0,0),(125,'阿胶/燕窝/玛卡滋补养生包装盒','阿胶/燕窝/玛卡滋补养生包装盒',115,'0_4_115_125',3,0,1,'',0,0,0),(126,'体温计/血压计/助听器医疗保健包装盒','体温计/血压计/助听器医疗保健包装盒',115,'0_4_115_126',3,0,1,'',0,0,0),(127,'都匀毛尖包装盒','都匀毛尖',9,'0_4_9_127',3,0,1,'',0,0,0),(128,'云雾茶包装盒','云雾茶',9,'0_4_9_128',3,0,1,'',0,0,0),(129,'黄山毛峰包装盒','黄山毛峰',9,'0_4_9_129',3,0,1,'',0,0,0),(130,'信阳毛尖包装盒','信阳毛尖',9,'0_4_9_130',3,0,1,'',0,0,0),(131,'六安瓜片包装盒','六安瓜片',9,'0_4_9_131',3,0,1,'',0,0,0),(133,'金骏眉包装盒','金骏眉',9,'0_4_9_133',3,0,1,'',0,0,0),(134,'正山小种包装盒','正山小种',9,'0_4_9_134',3,0,1,'',0,0,0),(136,'私房茶包装盒','私房茶',9,'0_4_9_136',3,0,1,'',0,0,0),(137,'太平猴魁包装盒','太平猴魁',9,'0_4_9_137',3,0,1,'',0,0,0),(138,'霍山黄芽包装盒','霍山黄芽',9,'0_4_9_138',3,0,1,'',0,0,0),(139,'恩施玉露包装盒','恩施玉露',9,'0_4_9_139',3,0,1,'',0,0,0),(140,'武夷岩茶包装盒','武夷岩茶',9,'0_4_9_140',3,0,1,'',0,0,0),(141,'小青柑包装盒','小青柑',9,'0_4_9_141',3,0,1,'',0,0,0),(142,'外卖打包盒','外卖打包盒',65,'0_4_65_142',3,0,1,'',0,0,0),(143,'五谷杂粮包装盒','五谷杂粮',65,'0_4_65_143',3,0,1,'',0,0,0);

/*Table structure for table `gy_goods_collect` */

DROP TABLE IF EXISTS `gy_goods_collect`;

CREATE TABLE `gy_goods_collect` (
  `collect_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`collect_id`),
  KEY `user_id` (`user_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `gy_goods_collect` */

insert  into `gy_goods_collect`(`collect_id`,`user_id`,`goods_id`,`add_time`) values (1,1,1,1535511193);

/*Table structure for table `gy_goods_consult` */

DROP TABLE IF EXISTS `gy_goods_consult`;

CREATE TABLE `gy_goods_consult` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品咨询id',
  `goods_id` int(11) DEFAULT '0' COMMENT '商品id',
  `company` varchar(255) CHARACTER SET latin1 DEFAULT NULL COMMENT '公司名',
  `company_address` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `linkname` varchar(255) CHARACTER SET latin1 DEFAULT NULL COMMENT '联系人',
  `username` varchar(32) DEFAULT '' COMMENT '网名，手机',
  `add_time` int(11) DEFAULT '0' COMMENT '咨询时间',
  `consult_type` tinyint(1) DEFAULT '1' COMMENT '1 商品咨询 2 支付咨询 3 配送 4 售后 5 反馈 6 加盟',
  `content` varchar(1024) DEFAULT '' COMMENT '咨询内容',
  `parent_id` int(11) DEFAULT '0' COMMENT '父id 用于管理员回复',
  `is_show` tinyint(1) DEFAULT '0' COMMENT '是否显示',
  `status` tinyint(1) DEFAULT '0' COMMENT '管理员回复状态，0未回复，1已回复',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `gy_goods_consult` */

/*Table structure for table `gy_goods_coupon` */

DROP TABLE IF EXISTS `gy_goods_coupon`;

CREATE TABLE `gy_goods_coupon` (
  `coupon_id` int(8) NOT NULL COMMENT '优惠券id',
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '指定的商品id：为零表示不指定商品',
  `goods_category_id` smallint(5) NOT NULL DEFAULT '0' COMMENT '指定的商品分类：为零表示不指定分类',
  PRIMARY KEY (`coupon_id`,`goods_id`,`goods_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `gy_goods_coupon` */

insert  into `gy_goods_coupon`(`coupon_id`,`goods_id`,`goods_category_id`) values (1,0,2),(3,7,0),(4,0,0);

/*Table structure for table `gy_goods_images` */

DROP TABLE IF EXISTS `gy_goods_images`;

CREATE TABLE `gy_goods_images` (
  `img_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '图片id 自增',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `image_url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片地址',
  PRIMARY KEY (`img_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8;

/*Data for the table `gy_goods_images` */

insert  into `gy_goods_images`(`img_id`,`goods_id`,`image_url`) values (3,2,'/public/upload/goods/2018/08-16/86d28e9cc4f0ad9c841c1087e60a90e7.png'),(4,2,'/public/upload/goods/2018/08-16/0096bea666fd88c74466fde3a6902ae1.png'),(20,8,'/public/upload/goods/2018/09-14/a41492bdf930038ec912c660e7ed2354.jpg'),(21,8,'/public/upload/goods/2018/09-14/b1f90acb7fece07eb4f0accd47bd09a1.jpg'),(31,1,'/public/upload/goods/2018/11-05/05c371ce572ace5afe2e7997f6be78f9.jpg'),(33,7,'/public/upload/goods/2018/11-05/ee216ac4b02ae98ad67096f4cec86825.jpg'),(34,7,'/public/upload/goods/2018/11-05/780084c7f0c0803b1a276b87c40b26d5.jpg'),(35,7,'/public/upload/goods/2018/11-05/89289d2b16a6cb83022c695a5befe6bd.jpg'),(36,7,'/public/upload/goods/2018/11-05/78461df2e96eb22661e3804d4427eb07.jpg'),(37,7,'/public/upload/goods/2018/11-05/675ff09b6155e8ed968087b9b8db05ed.jpg'),(38,7,'/public/upload/goods/2018/11-05/7b44bcb023b425c110f1f377c7f3fdac.jpg'),(39,10,'/public/upload/goods/2018/11-05/77b4e7c0b19a2058aa788960272aec86.jpg'),(40,10,'/public/upload/goods/2018/11-05/da667afb61f4349b02b76436502cb494.jpg'),(41,10,'/public/upload/goods/2018/11-05/689a03e26ea6d12bd4cdb19b32ffb371.jpg'),(42,10,'/public/upload/goods/2018/11-05/9e8173e7c2bb546f6aedfe1e96df40d1.jpg'),(43,10,'/public/upload/goods/2018/11-05/3beb08d3dbb0e5fbddc4c2d2e77ef9b4.jpg'),(44,3,'/public/upload/goods/2018/11-05/3916623a2452cecff2a7d6af36f7ad2e.jpg'),(45,3,'/public/upload/goods/2018/11-05/8aa1d9dd5498811f062aea779d4dc935.jpg'),(46,3,'/public/upload/goods/2018/11-05/02fb2669f299cea562fd993dbb63e0e0.jpg'),(47,3,'/public/upload/goods/2018/11-05/96b4f854263361de3349039607d6c643.jpg'),(48,3,'/public/upload/goods/2018/11-05/56f0f2f9c8b2aab9ba586f81ebd3d1bd.jpg'),(50,1,'/public/upload/goods/2018/11-08/744054c400ce978f684fc60f09d4c190.jpg'),(51,1,'/public/upload/goods/2018/11-08/4537fbdfdda9c8c095cb42975f77e88c.jpg'),(52,1,'/public/upload/goods/2018/11-08/4a9ef0bb6163e661bacb33791fe2f040.jpg'),(53,11,'/public/upload/goods/2018/11-08/8b662e2cdae49e7c65965c356d03f85f.jpg'),(54,11,'/public/upload/goods/2018/11-08/8ae351a4a3b0051644481602732c6fc5.jpg'),(55,11,'/public/upload/goods/2018/11-08/4f55a44327ce75a1a71a2b2990868af8.jpg'),(56,11,'/public/upload/goods/2018/11-08/5d150327e986b0309764ab1d52d5ee9b.jpg'),(57,11,'/public/upload/goods/2018/11-08/d744e6311adea318e4f1c4ef5377fea6.jpg'),(58,12,'/public/upload/goods/2018/11-08/10e4d1ae2d0fc0aa8532066905d1fc4d.jpg'),(59,12,'/public/upload/goods/2018/11-08/60d3e205710cacc932142bf230e227d3.jpg'),(60,12,'/public/upload/goods/2018/11-08/eba94df7ddd175f3f919f05cc48652c3.jpg'),(61,12,'/public/upload/goods/2018/11-08/47a2306c1e5b7f9bf70244207db398b1.jpg'),(62,12,'/public/upload/goods/2018/11-08/d652a66607c016ff39c7d15dc3ce1e84.jpg'),(63,12,'/public/upload/goods/2018/11-08/6b7e0d84bc3082c27cc0be8fd38d738b.jpg'),(64,13,'/public/upload/goods/2018/11-08/3f4869580301adb4ad7e56576901f141.jpg'),(65,13,'/public/upload/goods/2018/11-08/119eb8c31b4e1a4259dbea6b2dbda95a.jpg'),(66,13,'/public/upload/goods/2018/11-08/c410487b9d5031f192f74ca00656568d.jpg'),(67,7,'/public/upload/goods/2018/11-08/dadb4947047322d6a87b39137d86c3f6.jpg'),(71,9,'/public/upload/goods/2018/11-08/39cb3e285b92d5d4d8b94271a9783612.png'),(72,1,'/public/upload/goods/2018/11-09/c24d87c856c5d19d74760a4e3386248c.jpg'),(73,14,'/public/upload/goods/2018/11-13/78b38c6b8feff09f2f449dba8be10b87.jpg'),(74,14,'/public/upload/goods/2018/11-13/ac3cff1ecfdc30d84ad378d155091f6c.jpg'),(75,14,'/public/upload/goods/2018/11-13/c868070f7251da94d19a32ec3dee40e5.jpg'),(76,14,'/public/upload/goods/2018/11-13/101116614e0e7f869ea56e6e92462552.jpg'),(77,15,'/public/upload/goods/2018/11-20/afd09ea358a7babdc7a0c6a33dbd992d.jpg'),(78,16,'/public/upload/goods/2018/11-20/5614583f4b2ebb0583e1d22070e4d04f.jpg'),(79,4,'/public/upload/goods/2018/11-23/1f6d3ebd4311ed2356ce8ed011caf40c.jpg'),(80,4,'/public/upload/goods/2018/11-23/dfe0a7268753964029bb44afe286d6fd.jpg'),(81,4,'/public/upload/goods/2018/11-23/35d84114e56f5528f1b661db65a8bd01.jpg'),(82,4,'/public/upload/goods/2018/11-23/1b17947a3fd40a5a2c43e6df7d2fe848.jpg'),(83,17,'/public/upload/goods/2018/11-23/5c51f6812dba3932fc2bb9e817facc9e.jpg'),(84,17,'/public/upload/goods/2018/11-23/7ee9bac1414c65961d3f334699142be5.jpg'),(85,17,'/public/upload/goods/2018/11-23/86b33c8421c39893dd7ba997de9c88a8.jpg'),(86,17,'/public/upload/goods/2018/11-23/02576ea6cd6a525416ae545a20ebc3d8.jpg'),(87,18,'/public/upload/goods/2018/11-23/77ddd1acb0c72fd37715e64da36340ec.gif'),(88,18,'/public/upload/goods/2018/11-23/6f1623314dfd7520451fee5cf57fbfc4.gif'),(89,18,'/public/upload/goods/2018/11-23/139294cfab3e0915790eed18194913e3.gif'),(90,18,'/public/upload/goods/2018/11-23/d5885a17e623e3f42991172ac1ee9580.gif'),(91,19,'/public/upload/goods/2018/11-23/bf6b5736f57febb436f2757167d0c0c0.jpg'),(92,19,'/public/upload/goods/2018/11-23/177e00cb999432501a94cf6e5fa41920.jpg'),(93,19,'/public/upload/goods/2018/11-23/6e84c34a9604ca74b7ab9e5b4817923e.jpg'),(94,19,'/public/upload/goods/2018/11-23/a8ca15667e893b6764083ad6921022a5.jpg'),(95,20,'/public/upload/goods/2018/11-23/542f99c4579ff850eb24c10250d9724e.jpg'),(96,20,'/public/upload/goods/2018/11-23/d93b87c22e5644571f6849e87e5e4a59.jpg'),(97,21,'/public/upload/goods/2018/11-23/becb082b4785ae427f9b625322a6fa46.jpg'),(98,21,'/public/upload/goods/2018/11-23/b794002c011e7c464a55f0ccb4914d13.jpg'),(99,22,'/public/upload/goods/thumb/9/goods_sub_thumb_23_400_400.jpeg'),(100,22,'/public/upload/goods/thumb/9/goods_sub_thumb_22_400_400.jpeg'),(101,22,'/public/upload/goods/2018/09-14/b1f90acb7fece07eb4f0accd47bd09a1.jpg');

/*Table structure for table `gy_goods_type` */

DROP TABLE IF EXISTS `gy_goods_type`;

CREATE TABLE `gy_goods_type` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id自增',
  `name` varchar(60) NOT NULL DEFAULT '' COMMENT '类型名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='商品模型';

/*Data for the table `gy_goods_type` */

insert  into `gy_goods_type`(`id`,`name`) values (1,'爆款印品'),(2,'包装专区'),(3,'定制印品');

/*Table structure for table `gy_goods_visit` */

DROP TABLE IF EXISTS `gy_goods_visit`;

CREATE TABLE `gy_goods_visit` (
  `visit_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `user_id` int(11) NOT NULL COMMENT '会员ID',
  `visittime` int(11) NOT NULL COMMENT '浏览时间',
  `cat_id` int(11) NOT NULL COMMENT '商品分类ID',
  `extend_cat_id` int(11) NOT NULL COMMENT '商品扩展分类ID',
  PRIMARY KEY (`goods_id`,`user_id`,`visit_id`),
  KEY `visit_id` (`visit_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COMMENT='商品浏览历史表';

/*Data for the table `gy_goods_visit` */

insert  into `gy_goods_visit`(`visit_id`,`goods_id`,`user_id`,`visittime`,`cat_id`,`extend_cat_id`) values (1,1,1,1549888857,2,0),(11,1,2,1542981526,2,0),(25,1,3,1543214172,7,0),(2,2,1,1539848160,3,0),(3,2,2,1542989234,3,0),(32,2,3,1543207637,3,0),(7,3,1,1539848252,4,0),(14,3,2,1542981593,38,0),(26,3,3,1543209911,38,0),(9,4,1,1537794672,11,0),(13,4,2,1542989417,11,0),(38,4,3,1543209798,12,0),(4,5,1,1536288813,2,0),(5,6,1,1536288790,2,0),(6,7,1,1550051398,2,0),(12,7,2,1542981524,2,0),(28,7,3,1543213786,2,0),(8,8,1,1547465818,14,0),(42,8,3,1543207653,14,0),(10,9,1,1542597309,15,0),(16,9,2,1542989277,15,0),(34,9,3,1543207151,15,0),(15,10,2,1542269293,16,0),(29,10,3,1543060044,16,0),(17,12,2,1542270471,18,0),(35,12,3,1543060481,18,0),(19,13,2,1542693815,6,0),(31,13,3,1543213852,6,0),(22,14,2,1542708144,17,0),(41,14,3,1543065542,17,0),(20,15,1,1543212856,15,0),(18,15,2,1542989283,15,0),(33,15,3,1543213803,15,0),(21,16,2,1542989291,15,0),(27,16,3,1543206630,15,0),(23,17,2,1542989518,127,0),(36,17,3,1543207424,127,0),(30,18,3,1543058919,128,0),(24,19,2,1542987984,46,0),(37,19,3,1543062607,46,0),(39,20,3,1543062613,9,0),(40,21,3,1543062671,52,0),(43,22,1,1550051639,2,0);

/*Table structure for table `gy_group_buy` */

DROP TABLE IF EXISTS `gy_group_buy`;

CREATE TABLE `gy_group_buy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '团购ID',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '活动名称',
  `start_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '开始时间',
  `end_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '结束时间',
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品ID',
  `item_id` bigint(20) DEFAULT '0' COMMENT '对应spec_goods_price商品规格id',
  `price` decimal(10,2) NOT NULL COMMENT '团购价格',
  `goods_num` int(10) DEFAULT '0' COMMENT '商品参团数',
  `buy_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品已购买数',
  `order_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '已下单人数',
  `virtual_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '虚拟购买数',
  `rebate` decimal(10,1) NOT NULL COMMENT '折扣',
  `intro` text COMMENT '本团介绍',
  `goods_price` decimal(10,2) NOT NULL COMMENT '商品原价',
  `goods_name` varchar(200) NOT NULL DEFAULT '' COMMENT '商品名称',
  `recommended` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐 0.未推荐 1.已推荐',
  `views` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '查看次数',
  `is_end` tinyint(1) DEFAULT '0' COMMENT '是否结束',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='团购商品表';

/*Data for the table `gy_group_buy` */

/*Table structure for table `gy_hijack` */

DROP TABLE IF EXISTS `gy_hijack`;

CREATE TABLE `gy_hijack` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `hijack_url` varchar(255) DEFAULT NULL COMMENT '劫持URL',
  `page_url` varchar(255) DEFAULT NULL COMMENT '发生页面url',
  `add_time` int(15) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `gy_hijack` */

/*Table structure for table `gy_invoice` */

DROP TABLE IF EXISTS `gy_invoice`;

CREATE TABLE `gy_invoice` (
  `invoice_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `invoice_type` tinyint(1) DEFAULT '0' COMMENT '0普通发票1电子发票2增值税发票',
  `invoice_money` decimal(10,2) DEFAULT '0.00' COMMENT '发票金额',
  `invoice_title` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '发票抬头',
  `invoice_desc` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '发票内容',
  `invoice_rate` decimal(10,4) DEFAULT NULL COMMENT '发票税率',
  `taxpayer` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '纳税人识别号',
  `status` tinyint(1) DEFAULT '0' COMMENT '发票状态0待开1已开2作废',
  `atime` int(11) DEFAULT '0' COMMENT '开票时间',
  `ctime` int(11) DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`invoice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='发票信息表';

/*Data for the table `gy_invoice` */

/*Table structure for table `gy_kf_access` */

DROP TABLE IF EXISTS `gy_kf_access`;

CREATE TABLE `gy_kf_access` (
  `role_id` smallint(6) unsigned NOT NULL,
  `node_id` smallint(6) unsigned NOT NULL,
  `pid` smallint(6) unsigned NOT NULL,
  `level` tinyint(1) NOT NULL,
  `module` varchar(50) DEFAULT NULL,
  KEY `groupId` (`role_id`),
  KEY `nodeId` (`node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `gy_kf_access` */

/*Table structure for table `gy_kf_admin` */

DROP TABLE IF EXISTS `gy_kf_admin`;

CREATE TABLE `gy_kf_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_name` varchar(155) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` smallint(6) unsigned NOT NULL COMMENT '组ID',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态 1:启用 0:禁止',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注说明',
  `last_login_time` int(11) unsigned NOT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(15) DEFAULT NULL COMMENT '最后登录IP',
  `last_location` varchar(100) DEFAULT NULL COMMENT '最后登录位置',
  `storeid` int(11) unsigned NOT NULL COMMENT '企业id（店铺id）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `gy_kf_admin` */

/*Table structure for table `gy_kf_answer` */

DROP TABLE IF EXISTS `gy_kf_answer`;

CREATE TABLE `gy_kf_answer` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `que_id` int(11) unsigned NOT NULL COMMENT '问题id',
  `content` varchar(255) NOT NULL COMMENT '内容',
  `add_time` int(11) unsigned NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `gy_kf_answer` */

/*Table structure for table `gy_kf_attr_question` */

DROP TABLE IF EXISTS `gy_kf_attr_question`;

CREATE TABLE `gy_kf_attr_question` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(255) NOT NULL COMMENT '问题分类名称',
  `pid` int(11) unsigned NOT NULL COMMENT '父分类id',
  `storeid` int(11) unsigned NOT NULL DEFAULT '1' COMMENT '所属店铺id',
  `add_time` int(11) unsigned NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `gy_kf_attr_question` */

/*Table structure for table `gy_kf_chatlog` */

DROP TABLE IF EXISTS `gy_kf_chatlog`;

CREATE TABLE `gy_kf_chatlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_id` varchar(55) NOT NULL COMMENT '网页用户随机编号(仅为记录参考记录)',
  `kefu_id` varchar(55) NOT NULL COMMENT '客服的id',
  `content` text NOT NULL COMMENT '发送的内容',
  `timeline` int(10) NOT NULL COMMENT '记录时间',
  `is_delete` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除  0：未删除 1：已删除',
  `need_send` tinyint(1) DEFAULT '0' COMMENT '0 不需要推送 1 需要推送',
  `from_name` varchar(155) NOT NULL DEFAULT '' COMMENT '消息来源用户名',
  `to_name` varchar(155) NOT NULL DEFAULT '' COMMENT '接收消息用户名',
  `storeid` int(11) unsigned NOT NULL DEFAULT '1' COMMENT '店铺id',
  `store_name` varchar(50) NOT NULL COMMENT '客服所属店铺名称',
  PRIMARY KEY (`id`),
  KEY `fromid` (`from_id`(4)),
  KEY `toid` (`kefu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `gy_kf_chatlog` */

/*Table structure for table `gy_kf_kefu` */

DROP TABLE IF EXISTS `gy_kf_kefu`;

CREATE TABLE `gy_kf_kefu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(155) DEFAULT NULL,
  `pwd` varchar(155) DEFAULT NULL COMMENT '密码',
  `sign` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0' COMMENT '0下线 1在线',
  `storeid` int(11) unsigned NOT NULL DEFAULT '1' COMMENT '店铺id，默认1',
  `Auditing` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否审核  0：待审核  1：审核通过  2：审核不通过',
  `store_name` varchar(50) NOT NULL COMMENT '客服所属店铺名称',
  `is_delete` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除  0：未删除 1：已删除',
  `role` smallint(6) unsigned NOT NULL DEFAULT '5' COMMENT '组ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `gy_kf_kefu` */

/*Table structure for table `gy_kf_node` */

DROP TABLE IF EXISTS `gy_kf_node`;

CREATE TABLE `gy_kf_node` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '节点名称',
  `title` varchar(50) NOT NULL COMMENT '菜单名称',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否激活 1：是 2：否',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注说明',
  `pid` smallint(6) unsigned NOT NULL COMMENT '父ID',
  `level` tinyint(1) unsigned NOT NULL COMMENT '节点等级',
  `data` varchar(255) DEFAULT NULL COMMENT '附加参数',
  `sort` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '排序权重',
  `display` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '菜单显示类型 0:不显示 1:导航菜单 2:左侧菜单',
  PRIMARY KEY (`id`),
  KEY `level` (`level`),
  KEY `pid` (`pid`),
  KEY `status` (`status`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `gy_kf_node` */

/*Table structure for table `gy_kf_question` */

DROP TABLE IF EXISTS `gy_kf_question`;

CREATE TABLE `gy_kf_question` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) NOT NULL COMMENT '名称',
  `link` varchar(255) DEFAULT NULL COMMENT '连接',
  `add_time` int(11) unsigned NOT NULL COMMENT '添加时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用 0 ：不启用  1：启用',
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '父级id',
  `storeid` int(11) unsigned NOT NULL DEFAULT '1' COMMENT '店铺id',
  `is_host` tinyint(1) unsigned NOT NULL COMMENT '是否热门  0：否 1：是',
  `is_common` tinyint(1) unsigned NOT NULL COMMENT '是否常见 0：否 1：是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='问题分类表';

/*Data for the table `gy_kf_question` */

/*Table structure for table `gy_kf_robot` */

DROP TABLE IF EXISTS `gy_kf_robot`;

CREATE TABLE `gy_kf_robot` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `robot_name` varchar(32) NOT NULL COMMENT '名称',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  `storeid` int(11) unsigned NOT NULL COMMENT '店铺id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `gy_kf_robot` */

/*Table structure for table `gy_kf_role` */

DROP TABLE IF EXISTS `gy_kf_role`;

CREATE TABLE `gy_kf_role` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '后台组名',
  `pid` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `status` tinyint(1) unsigned DEFAULT '0' COMMENT '是否激活 1：是 0：否',
  `sort` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '排序权重',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注说明',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `gy_kf_role` */

/*Table structure for table `gy_kf_role_user` */

DROP TABLE IF EXISTS `gy_kf_role_user`;

CREATE TABLE `gy_kf_role_user` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` smallint(6) unsigned NOT NULL,
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `gy_kf_role_user` */

/*Table structure for table `gy_kf_slogan` */

DROP TABLE IF EXISTS `gy_kf_slogan`;

CREATE TABLE `gy_kf_slogan` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '提示语id主键',
  `slogan` varchar(55) DEFAULT NULL COMMENT '标语（客服加载欢迎语）',
  `slogan_status` tinyint(1) unsigned DEFAULT '1' COMMENT '提示语状态  0：不开启  1：开启',
  `auditing` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否审核提示语  0：待审核  1：审核通过  2：审核不通过',
  `timeline` int(11) unsigned DEFAULT NULL COMMENT '提示语设置时间',
  `storeid` int(11) unsigned NOT NULL COMMENT '提示语所属店铺id',
  `is_delete` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除  0：未删除 1：已删除',
  `kefuid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '客服id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `gy_kf_slogan` */

/*Table structure for table `gy_kf_store` */

DROP TABLE IF EXISTS `gy_kf_store`;

CREATE TABLE `gy_kf_store` (
  `storeid` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '店铺id',
  `store_name` varchar(55) NOT NULL COMMENT '店铺名称',
  `avatar` varchar(255) NOT NULL COMMENT '店铺头像',
  `auditing` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否审核  0：待审核  1：审核通过  2：审核不通过',
  `timeline` int(11) unsigned DEFAULT NULL COMMENT '提示语设置时间',
  `is_delete` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除  0：未删除 1：已删除',
  `webid` varchar(255) NOT NULL COMMENT '网站域名',
  `phone` char(11) NOT NULL COMMENT '企业电话',
  `city` varchar(255) NOT NULL COMMENT '企业地址',
  `email` varchar(255) NOT NULL COMMENT '企业邮箱',
  PRIMARY KEY (`storeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `gy_kf_store` */

/*Table structure for table `gy_kf_suggest` */

DROP TABLE IF EXISTS `gy_kf_suggest`;

CREATE TABLE `gy_kf_suggest` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '客户意见反馈主键id',
  `storeid` int(11) unsigned NOT NULL COMMENT '店铺id',
  `kehuid` varchar(255) NOT NULL COMMENT '客户id',
  `is_satisfied` tinyint(1) unsigned NOT NULL DEFAULT '3' COMMENT '满意度 0：很不满意  1：不满意 2：一般 3：满意 4：非常满意',
  `suggest` varchar(255) DEFAULT NULL COMMENT '建议',
  `timeline` int(11) unsigned DEFAULT NULL COMMENT '反馈时间',
  `is_delete` tinyint(1) unsigned NOT NULL COMMENT '是否删除  0：未删除   1：已删除',
  `kefu_id` int(11) unsigned NOT NULL COMMENT '客服id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户意见表';

/*Data for the table `gy_kf_suggest` */

/*Table structure for table `gy_kf_weixin_merchant` */

DROP TABLE IF EXISTS `gy_kf_weixin_merchant`;

CREATE TABLE `gy_kf_weixin_merchant` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '联关v1_store表主键',
  `storeid` int(11) DEFAULT NULL,
  `wx_type` tinyint(1) DEFAULT '0' COMMENT '众公号类型',
  `wx_url` varchar(100) DEFAULT NULL,
  `wx_token` varchar(50) DEFAULT NULL,
  `wx_EncodingAESKey` varchar(50) DEFAULT NULL COMMENT '消息加密密钥',
  `wx_raw_id` varchar(30) DEFAULT NULL COMMENT '微信原始ID',
  `wx_AppId` varchar(20) DEFAULT NULL,
  `wx_AppSecret` varchar(50) DEFAULT NULL,
  `wx_Random` tinyint(1) DEFAULT '0' COMMENT '是否随机回复',
  `wx_Subscribe` text COMMENT '关注后的回复',
  `wx_NoneReply` text COMMENT '无匹配时的回复',
  `media_id` varchar(255) DEFAULT NULL COMMENT '关注回复',
  `media_id2` varchar(255) DEFAULT NULL COMMENT '无匹配回复',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `gy_kf_weixin_merchant` */

/*Table structure for table `gy_message` */

DROP TABLE IF EXISTS `gy_message`;

CREATE TABLE `gy_message` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '管理者id',
  `message` text NOT NULL COMMENT '站内信内容',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '个体消息：0，全体消息1',
  `category` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT ' 系统消息：0，活动消息：1',
  `send_time` int(10) unsigned NOT NULL COMMENT '发送时间',
  `data` text COMMENT '消息序列化内容',
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `gy_message` */

/*Table structure for table `gy_mobile_block_info` */

DROP TABLE IF EXISTS `gy_mobile_block_info`;

CREATE TABLE `gy_mobile_block_info` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `block_id` int(11) NOT NULL COMMENT '所属板块id',
  `block_type` int(8) unsigned NOT NULL COMMENT '板块类型',
  `title` varchar(120) DEFAULT NULL COMMENT '标题、描述、文字内容',
  `block_content` varchar(255) DEFAULT NULL COMMENT '其它信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `gy_mobile_block_info` */

/*Table structure for table `gy_mobile_template` */

DROP TABLE IF EXISTS `gy_mobile_template`;

CREATE TABLE `gy_mobile_template` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `is_index` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否设为首页 0否 1是',
  `template_name` varchar(64) NOT NULL COMMENT '模板名称',
  `template_html` longtext NOT NULL COMMENT '保存编辑后的HTML',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示 0不显示  1显示',
  `add_time` int(11) unsigned NOT NULL COMMENT '添加时间',
  `block_info` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `gy_mobile_template` */

/*Table structure for table `gy_navigation` */

DROP TABLE IF EXISTS `gy_navigation`;

CREATE TABLE `gy_navigation` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '前台导航表',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '导航名称',
  `is_show` tinyint(1) DEFAULT '1' COMMENT '是否显示',
  `is_new` tinyint(1) DEFAULT '1' COMMENT '是否新窗口',
  `sort` smallint(6) DEFAULT '50' COMMENT '排序',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '链接地址',
  `position` enum('top','bottom') CHARACTER SET latin1 NOT NULL DEFAULT 'top' COMMENT '菜单位置，top顶部，bottom底部',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `gy_navigation` */

insert  into `gy_navigation`(`id`,`name`,`is_show`,`is_new`,`sort`,`url`,`position`) values (1,'爆品快购',1,0,5,'/yinshua.html','top'),(2,'包装专区',1,0,2,'/baozhuang.html','top'),(3,'好礼兑换',1,0,1,'/haoli.html','top'),(4,'定制印品',1,1,4,'/yinpin.html','top'),(5,'现货直达',1,1,3,'/xianhuo.html','top'),(6,'我要设计',1,1,2,'/sheji.html','top');

/*Table structure for table `gy_news` */

DROP TABLE IF EXISTS `gy_news`;

CREATE TABLE `gy_news` (
  `article_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `cat_id` smallint(5) NOT NULL DEFAULT '0' COMMENT '类别ID',
  `title` varchar(150) NOT NULL DEFAULT '' COMMENT '文章标题',
  `tags` char(64) DEFAULT NULL COMMENT '新闻标签',
  `content` longtext NOT NULL,
  `author` varchar(30) NOT NULL DEFAULT '' COMMENT '文章作者',
  `author_email` varchar(60) NOT NULL DEFAULT '' COMMENT '作者邮箱',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `article_type` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `is_open` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  `file_url` varchar(255) NOT NULL DEFAULT '' COMMENT '附件地址',
  `open_type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `link` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `description` mediumtext COMMENT '文章摘要',
  `click` int(11) DEFAULT '0' COMMENT '浏览量',
  `publish_time` int(11) DEFAULT NULL COMMENT '文章预告发布时间',
  `thumb` varchar(255) DEFAULT '' COMMENT '文章缩略图',
  PRIMARY KEY (`article_id`),
  KEY `cat_id` (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `gy_news` */

/*Table structure for table `gy_news_cat` */

DROP TABLE IF EXISTS `gy_news_cat`;

CREATE TABLE `gy_news_cat` (
  `cat_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(20) DEFAULT NULL COMMENT '类别名称',
  `cat_type` smallint(6) DEFAULT '0' COMMENT '默认分组',
  `parent_id` smallint(6) DEFAULT '0' COMMENT '夫级ID',
  `show_in_nav` tinyint(1) DEFAULT '0' COMMENT '是否导航显示',
  `sort_order` smallint(6) DEFAULT '50' COMMENT '排序',
  `cat_desc` varchar(255) DEFAULT NULL COMMENT '分类描述',
  `keywords` varchar(30) DEFAULT NULL COMMENT '搜索关键词',
  `cat_alias` varchar(20) DEFAULT NULL COMMENT '别名',
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `gy_news_cat` */

/*Table structure for table `gy_oauth_users` */

DROP TABLE IF EXISTS `gy_oauth_users`;

CREATE TABLE `gy_oauth_users` (
  `tu_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '表自增ID',
  `user_id` mediumint(8) NOT NULL COMMENT '用户表ID',
  `openid` varchar(255) NOT NULL COMMENT '第三方开放平台openid',
  `oauth` varchar(50) NOT NULL COMMENT '第三方授权平台',
  `unionid` varchar(255) DEFAULT NULL COMMENT 'unionid',
  `oauth_child` varchar(50) DEFAULT NULL COMMENT 'mp标识来自公众号, open标识来自开放平台,用于标识来自哪个第三方授权平台, 因为同是微信平台有来自公众号和开放平台',
  PRIMARY KEY (`tu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `gy_oauth_users` */

/*Table structure for table `gy_order` */

DROP TABLE IF EXISTS `gy_order`;

CREATE TABLE `gy_order` (
  `order_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `order_sn` varchar(20) NOT NULL DEFAULT '' COMMENT '订单编号',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `order_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '订单状态',
  `shipping_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '发货状态',
  `pay_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '支付状态',
  `banknum` varchar(245) DEFAULT NULL COMMENT '银行转账回单',
  `file_status` tinyint(1) DEFAULT '0' COMMENT '0待上传 1 已上传',
  `consignee` varchar(60) NOT NULL DEFAULT '' COMMENT '收货人',
  `country` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '国家',
  `province` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '省份',
  `city` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '城市',
  `district` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '县区',
  `twon` int(11) DEFAULT '0' COMMENT '乡镇',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '地址',
  `zipcode` varchar(60) NOT NULL DEFAULT '' COMMENT '邮政编码',
  `mobile` varchar(60) NOT NULL DEFAULT '' COMMENT '手机',
  `email` varchar(60) NOT NULL DEFAULT '' COMMENT '邮件',
  `shipping_code` varchar(32) NOT NULL DEFAULT '' COMMENT '物流code',
  `shipping_name` varchar(120) NOT NULL DEFAULT '' COMMENT '物流名称',
  `pay_code` varchar(32) NOT NULL DEFAULT '' COMMENT '支付code',
  `pay_name` varchar(120) NOT NULL DEFAULT '' COMMENT '支付方式名称',
  `invoice_title` varchar(256) DEFAULT '' COMMENT '发票抬头',
  `taxpayer` varchar(30) DEFAULT '' COMMENT '纳税人识别号',
  `goods_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品总价',
  `shipping_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '邮费',
  `user_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '使用余额',
  `coupon_price` decimal(10,2) DEFAULT '0.00' COMMENT '优惠券抵扣',
  `integral` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '使用积分',
  `integral_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '使用积分抵多少钱',
  `order_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '应付款金额',
  `total_amount` decimal(10,2) DEFAULT '0.00' COMMENT '订单总价',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下单时间',
  `shipping_time` int(11) DEFAULT '0' COMMENT '最后新发货时间',
  `confirm_time` int(10) DEFAULT '0' COMMENT '收货确认时间',
  `pay_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '支付时间',
  `transaction_id` varchar(255) DEFAULT NULL COMMENT '第三方平台交易流水号',
  `prom_id` int(11) unsigned DEFAULT '0' COMMENT '活动ID',
  `prom_type` tinyint(4) unsigned DEFAULT '0' COMMENT '订单类型：0普通订单4预售订单5虚拟订单6拼团订单',
  `order_prom_id` smallint(6) NOT NULL DEFAULT '0' COMMENT '活动id',
  `order_prom_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '活动优惠金额',
  `discount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '价格调整',
  `payment_type` tinyint(1) DEFAULT '0' COMMENT '1在线支付2企业转账3货到付款',
  `delivery_time` tinyint(4) DEFAULT '0' COMMENT '0=都可以,1=工作日,2=双休',
  `user_note` varchar(255) NOT NULL DEFAULT '' COMMENT '用户备注',
  `admin_note` varchar(255) DEFAULT '' COMMENT '管理员备注',
  `parent_sn` varchar(100) DEFAULT NULL COMMENT '父单单号',
  `is_distribut` tinyint(1) DEFAULT '0' COMMENT '是否已分成0未分成1已分成',
  `paid_money` decimal(10,2) DEFAULT '0.00' COMMENT '订金',
  `shop_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '自提点门店id',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户假删除标识,1:删除,0未删除',
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `order_sn` (`order_sn`),
  KEY `user_id` (`user_id`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

/*Data for the table `gy_order` */

insert  into `gy_order`(`order_id`,`order_sn`,`user_id`,`order_status`,`shipping_status`,`pay_status`,`banknum`,`file_status`,`consignee`,`country`,`province`,`city`,`district`,`twon`,`address`,`zipcode`,`mobile`,`email`,`shipping_code`,`shipping_name`,`pay_code`,`pay_name`,`invoice_title`,`taxpayer`,`goods_price`,`shipping_price`,`user_money`,`coupon_price`,`integral`,`integral_money`,`order_amount`,`total_amount`,`add_time`,`shipping_time`,`confirm_time`,`pay_time`,`transaction_id`,`prom_id`,`prom_type`,`order_prom_id`,`order_prom_amount`,`discount`,`payment_type`,`delivery_time`,`user_note`,`admin_note`,`parent_sn`,`is_distribut`,`paid_money`,`shop_id`,`deleted`) values (15,'201809242028246652',1,1,1,0,NULL,1,'邵先生',0,10808,10809,10903,10904,'网络小镇','','18761659049','','zhongtong','中通快递','cod','到货付款','','','1000.00','8.00','0.00','0.00',0,'0.00','1008.00','1008.00',1537792104,1537792423,0,0,NULL,0,0,0,'0.00','0.00',0,0,'','',NULL,0,'0.00',0,0),(19,'201810131316376908',1,0,0,1,NULL,0,'邵先生',0,10808,10809,10903,10904,'网络小镇','','18761659049','','','','alipay','PC端支付宝','','','500.00','103.00','0.00','0.00',0,'0.00','603.00','603.00',1539407797,0,0,1539440443,NULL,0,0,0,'0.00','0.00',2,0,'','',NULL,0,'0.00',0,0),(23,'201810171148455485',1,0,0,5,NULL,0,'邵先生',0,10808,10809,10903,10904,'网络小镇','','18761659049','','','','banktrans','银行转账','','','500.00','103.00','0.00','0.00',0,'0.00','603.00','603.00',1539748125,0,0,0,NULL,0,0,0,'0.00','0.00',2,0,'','',NULL,0,'0.00',0,0),(24,'201810171654525623',1,1,0,5,'23434342',0,'邵先生',0,10808,10809,10903,10904,'网络小镇','','18761659049','','','','banktrans','银行转账','','','400.00','163.00','0.00','0.00',0,'0.00','563.00','563.00',1539766492,0,0,0,NULL,0,0,0,'0.00','0.00',2,0,'','',NULL,0,'0.00',0,0),(25,'201810171734309006',1,0,0,5,'8779789789',0,'邵先生',0,10808,10809,10903,10904,'网络小镇','','18761659049','','','','banktrans','银行转账','','','400.00','163.00','0.00','0.00',0,'0.00','563.00','563.00',1539768870,0,0,1539768879,NULL,0,0,0,'0.00','0.00',2,0,'','',NULL,0,'0.00',0,0),(26,'201810171741437231',1,3,0,0,'asdfas',0,'邵先生',0,10808,10809,10903,10904,'网络小镇','','18761659049','','','','banktrans','银行转账','','','500.00','103.00','0.00','0.00',0,'0.00','603.00','603.00',1539769303,0,0,1539770386,NULL,0,0,0,'0.00','0.00',2,0,'','',NULL,0,'0.00',0,0),(27,'201810181125028118',1,3,0,0,NULL,0,'邵先生',0,10808,10809,10903,10904,'网络小镇','','18761659049','','','','','','','','500.00','62.00','0.00','0.00',0,'0.00','562.00','562.00',1539833102,0,0,0,NULL,0,0,0,'0.00','0.00',1,0,'','',NULL,0,'0.00',0,0),(28,'201810191743569245',1,3,0,0,NULL,0,'邵先生',0,10808,10809,10903,10904,'网络小镇','','18761659049','','','','','','','','500.00','28.00','0.00','0.00',0,'0.00','528.00','528.00',1539942236,0,0,0,NULL,0,0,0,'0.00','0.00',1,0,'','',NULL,0,'0.00',0,0),(29,'201810202023447204',1,3,0,0,NULL,0,'邵先生',0,10808,10809,10903,10904,'网络小镇','','18761659049','','','','','','','','500.00','28.00','0.00','0.00',0,'0.00','528.00','528.00',1540038224,0,0,0,NULL,0,0,0,'0.00','0.00',2,0,'','',NULL,0,'0.00',0,0),(30,'201811241924309764',3,0,0,0,NULL,0,'钱韦',0,10808,10809,10876,10880,'和燕路4403号','','18761640729','','','','alipay','PC端支付宝','','','100.00','0.00','0.00','0.00',0,'0.00','100.00','100.00',1543058670,0,0,0,NULL,0,0,0,'0.00','0.00',1,0,'','',NULL,0,'0.00',0,0),(31,'201811241942005984',3,0,0,0,NULL,0,'钱韦',0,10808,10809,10876,10880,'和燕路4403号','','18761640729','','','','','','','','160.00','0.00','0.00','0.00',0,'0.00','160.00','160.00',1543059720,0,0,0,NULL,0,0,0,'0.00','0.00',1,0,'','',NULL,0,'0.00',0,0),(32,'201811242119599258',3,0,0,0,NULL,0,'钱韦',0,10808,10809,10876,10880,'和燕路4403号','','18761640729','','','','weixin','微信支付','','','19.80','0.00','0.00','0.00',0,'0.00','19.80','19.80',1543065599,0,0,0,NULL,0,0,0,'0.00','0.00',1,0,'','',NULL,0,'0.00',0,0),(33,'201902101942279341',1,0,0,0,NULL,0,'邵先生',0,10808,10809,10903,10904,'网络小镇','','18761659049','','','','','','','','100.00','0.00','0.00','0.00',0,'0.00','100.00','100.00',1549798947,0,0,0,NULL,0,0,0,'0.00','0.00',1,0,'','',NULL,0,'0.00',0,0),(34,'201902112041221342',1,0,0,0,NULL,0,'邵先生',0,10808,10809,10903,10904,'网络小镇','','18761659049','','','','','','','','10.00','0.00','0.00','0.00',0,'0.00','10.00','10.00',1549888882,0,0,0,NULL,0,0,0,'0.00','0.00',1,0,'','',NULL,0,'0.00',0,0),(35,'201902112128073695',1,3,0,0,NULL,0,'邵先生',0,10808,10809,10903,10904,'网络小镇','','18761659049','','','','alipay','PC端支付宝','','','10.00','0.00','0.00','0.00',0,'0.00','10.00','10.00',1549891687,0,0,0,NULL,0,0,0,'0.00','0.00',1,0,'','',NULL,0,'0.00',0,0);

/*Table structure for table `gy_order_action` */

DROP TABLE IF EXISTS `gy_order_action`;

CREATE TABLE `gy_order_action` (
  `action_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `order_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '订单ID',
  `action_user` int(11) DEFAULT '0' COMMENT '操作人 0 为用户操作，其他为管理员id',
  `order_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '订单状态',
  `shipping_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '配送状态',
  `pay_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '支付状态',
  `action_note` varchar(255) NOT NULL DEFAULT '' COMMENT '操作备注',
  `log_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  `status_desc` varchar(255) DEFAULT NULL COMMENT '状态描述',
  PRIMARY KEY (`action_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;

/*Data for the table `gy_order_action` */

insert  into `gy_order_action`(`action_id`,`order_id`,`action_user`,`order_status`,`shipping_status`,`pay_status`,`action_note`,`log_time`,`status_desc`) values (1,1,0,0,0,0,'您提交了订单，请等待系统确认',1535446286,'提交订单'),(2,2,0,0,0,0,'您提交了订单，请等待系统确认',1535522634,'提交订单'),(3,1,0,3,0,0,'您取消了订单',1535596587,'用户取消订单'),(4,3,0,0,0,0,'您提交了订单，请等待系统确认',1535601167,'提交订单'),(5,4,0,0,0,0,'您提交了订单，请等待系统确认',1535610056,'提交订单'),(6,5,0,0,0,0,'您提交了订单，请等待系统确认',1535610336,'提交订单'),(7,6,0,0,0,0,'您提交了订单，请等待系统确认',1535610368,'提交订单'),(8,2,0,3,0,0,'您取消了订单',1535803718,'用户取消订单'),(9,3,0,3,0,0,'您取消了订单',1535803718,'用户取消订单'),(10,4,0,3,0,0,'您取消了订单',1535803718,'用户取消订单'),(11,5,0,3,0,0,'您取消了订单',1535803718,'用户取消订单'),(12,6,0,3,0,0,'您取消了订单',1535803718,'用户取消订单'),(13,7,0,0,0,0,'您提交了订单，请等待系统确认',1535807369,'提交订单'),(14,8,0,0,0,0,'您提交了订单，请等待系统确认',1535807484,'提交订单'),(15,7,0,3,0,0,'您取消了订单',1536215154,'用户取消订单'),(16,8,0,3,0,0,'您取消了订单',1536215154,'用户取消订单'),(17,9,0,0,0,0,'您提交了订单，请等待系统确认',1536286136,'提交订单'),(18,10,0,0,0,0,'您提交了订单，请等待系统确认',1536288195,'提交订单'),(19,11,0,0,0,0,'您提交了订单，请等待系统确认',1536291269,'提交订单'),(20,9,0,3,0,0,'您取消了订单',1536448083,'用户取消订单'),(21,10,0,3,0,0,'您取消了订单',1536448084,'用户取消订单'),(22,11,0,3,0,0,'您取消了订单',1536448084,'用户取消订单'),(23,12,0,0,0,0,'您提交了订单，请等待系统确认',1536466250,'提交订单'),(24,12,1,0,0,0,'修改订单',1536466302,'修改订单'),(25,12,0,3,0,0,'您取消了订单',1536630620,'用户取消订单'),(26,13,0,0,0,0,'您提交了订单，请等待系统确认',1537086120,'提交订单'),(27,14,0,0,0,0,'您提交了订单，请等待系统确认',1537188523,'提交订单'),(28,13,0,3,0,0,'您取消了订单',1537616491,'用户取消订单'),(29,14,0,3,0,0,'您取消了订单',1537616491,'用户取消订单'),(30,15,0,0,0,0,'您提交了订单，请等待系统确认',1537792104,'提交订单'),(31,15,1,0,0,0,'',1537792217,'确认订单'),(32,15,1,1,1,0,'',1537792423,'delivery'),(33,16,0,0,0,0,'您提交了订单，请等待系统确认',1538176967,'提交订单'),(34,16,0,3,0,0,'您取消了订单',1538898629,'用户取消订单'),(35,17,0,0,0,0,'您提交了订单，请等待系统确认',1539388275,'提交订单'),(36,18,0,0,0,0,'您提交了订单，请等待系统确认',1539407338,'提交订单'),(37,19,0,0,0,0,'您提交了订单，请等待系统确认',1539407797,'提交订单'),(38,19,0,0,0,1,'',1539440444,'付款成功'),(39,20,0,0,0,0,'您提交了订单，请等待系统确认',1539470593,'提交订单'),(40,21,0,0,0,0,'您提交了订单，请等待系统确认',1539470809,'提交订单'),(41,22,0,0,0,0,'您提交了订单，请等待系统确认',1539470838,'提交订单'),(42,17,0,3,0,0,'您取消了订单',1539741726,'用户取消订单'),(43,18,0,3,0,0,'您取消了订单',1539741726,'用户取消订单'),(44,20,0,3,0,0,'您取消了订单',1539741727,'用户取消订单'),(45,21,0,3,0,0,'您取消了订单',1539741727,'用户取消订单'),(46,22,0,3,0,0,'您取消了订单',1539741727,'用户取消订单'),(47,23,0,0,0,0,'您提交了订单，请等待系统确认',1539748126,'提交订单'),(48,24,0,0,0,0,'您提交了订单，请等待系统确认',1539766492,'提交订单'),(49,24,1,0,0,5,'',1539767826,'确认订单'),(50,25,0,0,0,0,'您提交了订单，请等待系统确认',1539768871,'提交订单'),(51,25,1,0,0,5,'',1539769132,'取消付款'),(52,25,1,0,0,5,'',1539769168,'取消付款'),(53,26,0,0,0,0,'您提交了订单，请等待系统确认',1539769303,'提交订单'),(54,26,1,0,0,1,'',1539769443,'取消付款'),(55,26,0,0,0,1,'订单取消付款',1539769443,'用户取消已付款订单'),(56,26,1,0,0,1,'',1539770412,'取消付款'),(57,26,0,0,0,1,'订单取消付款',1539770412,'用户取消已付款订单'),(58,27,0,0,0,0,'您提交了订单，请等待系统确认',1539833102,'提交订单'),(59,28,0,0,0,0,'您提交了订单，请等待系统确认',1539942236,'提交订单'),(60,26,0,3,0,0,'您取消了订单',1540036048,'用户取消订单'),(61,27,0,3,0,0,'您取消了订单',1540036048,'用户取消订单'),(62,29,0,0,0,0,'您提交了订单，请等待系统确认',1540038224,'提交订单'),(63,28,0,3,0,0,'您取消了订单',1540259297,'用户取消订单'),(64,29,0,3,0,0,'您取消了订单',1540259297,'用户取消订单'),(65,30,0,0,0,0,'您提交了订单，请等待系统确认',1543058670,'提交订单'),(66,31,0,0,0,0,'您提交了订单，请等待系统确认',1543059720,'提交订单'),(67,32,0,0,0,0,'您提交了订单，请等待系统确认',1543065599,'提交订单'),(68,33,0,0,0,0,'您提交了订单，请等待系统确认',1549798947,'提交订单'),(69,34,0,0,0,0,'您提交了订单，请等待系统确认',1549888882,'提交订单'),(70,35,0,0,0,0,'您提交了订单，请等待系统确认',1549891688,'提交订单'),(71,35,0,3,0,0,'您取消了订单',1549972337,'用户取消订单');

/*Table structure for table `gy_order_goods` */

DROP TABLE IF EXISTS `gy_order_goods`;

CREATE TABLE `gy_order_goods` (
  `rec_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id自增',
  `order_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `goods_name` varchar(120) NOT NULL DEFAULT '' COMMENT '商品名称',
  `goods_sn` varchar(60) NOT NULL DEFAULT '' COMMENT '商品货号',
  `goods_num` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT '购买数量',
  `final_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品实际购买价',
  `goods_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '本店价',
  `cost_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品成本价',
  `member_goods_price` decimal(10,2) DEFAULT '0.00' COMMENT '会员折扣价',
  `give_integral` mediumint(8) unsigned DEFAULT '0' COMMENT '购买商品赠送积分',
  `goods_send_date` int(4) DEFAULT '0' COMMENT '出货日期',
  `goods_file_id` tinyint(4) DEFAULT '0' COMMENT '印刷文件 1使用自己的设计 2需要帮我设计',
  `goods_file_url` text COMMENT '印刷文件路径',
  `goods_file_name` varchar(254) DEFAULT NULL COMMENT '印刷文件文件名',
  `goods_file_state` int(4) DEFAULT '0' COMMENT '印刷文件审核状态 0 未审核 1 通过 2 不通过',
  `spec_key` varchar(128) DEFAULT '' COMMENT '商品规格key',
  `spec_key_name` varchar(128) DEFAULT '' COMMENT '规格对应的中文名字',
  `bar_code` varchar(64) NOT NULL DEFAULT '' COMMENT '条码',
  `is_comment` tinyint(1) DEFAULT '0' COMMENT '是否评价',
  `prom_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0 普通订单,1 限时抢购, 2 团购 , 3 促销优惠,4预售',
  `prom_id` int(11) unsigned DEFAULT '0' COMMENT '活动id',
  `is_send` tinyint(1) DEFAULT '0' COMMENT '0未发货，1已发货，2已换货，3已退货',
  `delivery_id` int(11) DEFAULT '0' COMMENT '发货单ID',
  `sku` varchar(128) DEFAULT '' COMMENT 'sku',
  `shejicontent` text,
  `linkqq` int(16) DEFAULT NULL,
  `mobile` int(11) DEFAULT NULL,
  PRIMARY KEY (`rec_id`),
  KEY `order_id` (`order_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

/*Data for the table `gy_order_goods` */

insert  into `gy_order_goods`(`rec_id`,`order_id`,`goods_id`,`goods_name`,`goods_sn`,`goods_num`,`final_price`,`goods_price`,`cost_price`,`member_goods_price`,`give_integral`,`goods_send_date`,`goods_file_id`,`goods_file_url`,`goods_file_name`,`goods_file_state`,`spec_key`,`spec_key_name`,`bar_code`,`is_comment`,`prom_type`,`prom_id`,`is_send`,`delivery_id`,`sku`,`shejicontent`,`linkqq`,`mobile`) values (20,15,7,'新款名片112216','TP0000007',2000,'0.50','0.50',NULL,'0.50',0,0,1,NULL,NULL,1,'2',NULL,'',0,0,0,1,1,'',NULL,NULL,NULL),(24,19,7,'新款名片112216','TP0000007',1000,'0.50','0.50','0.00','0.50',0,0,1,NULL,NULL,0,'','','',0,0,0,0,0,NULL,NULL,NULL,NULL),(28,23,7,'新款名片112216','TP0000007',1000,'0.50','0.50','0.00','0.50',0,0,1,NULL,NULL,0,'','','',0,0,0,0,0,NULL,NULL,NULL,NULL),(29,24,1,'宣传单页彩页国民款，一纸在手，客户我有','TP0000001',800,'0.50','0.50',NULL,'0.50',0,0,1,NULL,NULL,0,'7',NULL,'',0,0,0,0,0,'',NULL,NULL,NULL),(30,25,1,'宣传单页彩页国民款，一纸在手，客户我有','TP0000001',800,'0.50','0.50',NULL,'0.50',0,0,1,NULL,NULL,0,'7',NULL,'',0,0,0,0,0,'',NULL,NULL,NULL),(31,26,7,'新款名片112216','TP0000007',1000,'0.50','0.50','0.00','0.50',0,0,1,NULL,NULL,0,'','','',0,0,0,0,0,NULL,NULL,NULL,NULL),(32,27,7,'新款名片112216','TP0000007',1000,'0.50','0.50','0.00','0.50',0,0,1,NULL,NULL,0,'','','',0,0,0,0,0,NULL,NULL,NULL,NULL),(33,28,7,'新款名片112216','TP0000007',1000,'0.50','0.50','0.00','0.50',0,0,1,NULL,NULL,0,'','','',0,0,0,0,0,NULL,NULL,NULL,NULL),(34,29,7,'新款名片112216','TP0000007',1000,'0.50','0.50','0.00','0.50',0,0,1,NULL,NULL,0,'','','',0,0,0,0,0,NULL,NULL,NULL,NULL),(35,30,1,'宣传单页彩页国民款，一纸在手，客户我有','TP0000001',500,'0.20','0.20','0.00','0.20',0,0,1,NULL,NULL,0,'','','',0,0,0,0,0,NULL,NULL,NULL,NULL),(36,31,1,'宣传单页彩页国民款，一纸在手，客户我有','TP0000001',1000,'0.16','0.16','0.00','0.16',0,0,1,NULL,NULL,0,'','','',0,0,0,0,0,NULL,NULL,NULL,NULL),(37,32,14,'名片梦想款，再大梦想从一张名片开启','GGY0000014',2,'9.90','9.90','0.00','9.90',0,0,1,NULL,NULL,0,'','','',0,0,0,0,0,NULL,NULL,NULL,NULL),(38,33,1,'宣传单页彩页国民款，一纸在手，客户我有','TP0000001',500,'0.20','0.20','0.00','0.20',0,0,1,'/public/upload/user/1/goods_file//c1218b7ab196f6d722bffc406a142fa9.jpg','logo-heng.jpg',0,'','','',0,0,0,0,0,NULL,NULL,NULL,NULL),(39,34,22,'设计单页彩页国民款，一纸在手，客户我有','GGY0000022',1,'10.00','10.00','0.00','10.00',0,0,0,NULL,NULL,0,'','','',0,0,0,0,0,'',NULL,NULL,NULL),(40,35,22,'设计单页彩页国民款，一纸在手，客户我有','GGY0000022',1,'10.00','10.00','0.00','10.00',0,0,0,NULL,NULL,0,'','','',0,0,0,0,0,NULL,'体骄傲，很好',1208175555,NULL);

/*Table structure for table `gy_payment` */

DROP TABLE IF EXISTS `gy_payment`;

CREATE TABLE `gy_payment` (
  `pay_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `pay_code` varchar(20) NOT NULL DEFAULT '' COMMENT '支付code',
  `pay_name` varchar(120) NOT NULL DEFAULT '' COMMENT '支付方式名称',
  `pay_fee` varchar(10) NOT NULL DEFAULT '' COMMENT '手续费',
  `pay_desc` text NOT NULL COMMENT '描述',
  `pay_order` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'pay_coder',
  `pay_config` text NOT NULL COMMENT '配置',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '开启',
  `is_cod` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否货到付款',
  `is_online` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否在线支付',
  PRIMARY KEY (`pay_id`),
  UNIQUE KEY `pay_code` (`pay_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `gy_payment` */

/*Table structure for table `gy_pick_up` */

DROP TABLE IF EXISTS `gy_pick_up`;

CREATE TABLE `gy_pick_up` (
  `pickup_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自提点id',
  `pickup_name` varchar(255) NOT NULL DEFAULT '' COMMENT '自提点名称',
  `pickup_pic` varchar(255) DEFAULT NULL COMMENT '门店头像',
  `pickup_details` text COMMENT '门店简介',
  `pickup_address` varchar(255) NOT NULL DEFAULT '' COMMENT '自提点地址',
  `pickup_phone` varchar(30) NOT NULL DEFAULT '' COMMENT '自提点电话',
  `pickup_contact` varchar(20) NOT NULL DEFAULT '' COMMENT '自提点联系人',
  `province_id` int(11) NOT NULL COMMENT '省id',
  `city_id` int(11) NOT NULL COMMENT '市id',
  `district_id` int(11) NOT NULL COMMENT '区id',
  `longitude` decimal(10,7) DEFAULT '0.0000000' COMMENT '经度',
  `latitude` decimal(10,7) DEFAULT '0.0000000' COMMENT '纬度',
  `open` tinyint(2) DEFAULT '0' COMMENT '营业开始时间',
  `close` tinyint(2) DEFAULT '0' COMMENT '营业打烊时间',
  `suppliersid` int(11) NOT NULL COMMENT '供应商id',
  PRIMARY KEY (`pickup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='自提点表';

/*Data for the table `gy_pick_up` */

/*Table structure for table `gy_plugin` */

DROP TABLE IF EXISTS `gy_plugin`;

CREATE TABLE `gy_plugin` (
  `code` varchar(13) DEFAULT NULL COMMENT '插件编码',
  `name` varchar(55) DEFAULT NULL COMMENT '中文名字',
  `version` varchar(255) DEFAULT NULL COMMENT '插件的版本',
  `author` varchar(30) DEFAULT NULL COMMENT '插件作者',
  `config` text COMMENT '配置信息',
  `config_value` text COMMENT '配置值信息',
  `desc` varchar(255) DEFAULT NULL COMMENT '插件描述',
  `status` tinyint(1) DEFAULT '0' COMMENT '是否启用',
  `payment_type` tinyint(1) DEFAULT '0' COMMENT '1.在线支付 2.企业转账 3.货到付款',
  `type` varchar(50) DEFAULT NULL COMMENT '插件类型 payment支付 login 登陆 shipping物流',
  `icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `bank_code` text COMMENT '网银配置信息',
  `scene` tinyint(1) DEFAULT '0' COMMENT '使用场景 0PC+手机 1手机 2PC 3APP 4小程序'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `gy_plugin` */

insert  into `gy_plugin`(`code`,`name`,`version`,`author`,`config`,`config_value`,`desc`,`status`,`payment_type`,`type`,`icon`,`bank_code`,`scene`) values ('alipayMobile','手机网站支付宝','1.0','\'\'','a:6:{i:0;a:4:{s:4:\"name\";s:14:\"alipay_account\";s:5:\"label\";s:15:\"支付宝帐户\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:0:\"\";}i:1;a:4:{s:4:\"name\";s:10:\"alipay_key\";s:5:\"label\";s:21:\"交易安全校验码\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:0:\"\";}i:2;a:4:{s:4:\"name\";s:14:\"alipay_partner\";s:5:\"label\";s:17:\"合作者身份ID\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:0:\"\";}i:3;a:4:{s:4:\"name\";s:18:\"alipay_private_key\";s:5:\"label\";s:6:\"秘钥\";s:4:\"type\";s:8:\"textarea\";s:5:\"value\";s:0:\"\";}i:4;a:4:{s:4:\"name\";s:17:\"alipay_pay_method\";s:5:\"label\";s:19:\" 选择接口类型\";s:4:\"type\";s:6:\"select\";s:6:\"option\";a:2:{i:0;s:24:\"使用担保交易接口\";i:1;s:30:\"使用即时到帐交易接口\";}}i:5;a:4:{s:4:\"name\";s:7:\"is_bank\";s:5:\"label\";s:18:\"是否开通网银\";s:4:\"type\";s:6:\"select\";s:6:\"option\";a:2:{i:0;s:3:\"否\";i:1;s:3:\"是\";}}}',NULL,'手机端网站支付宝 ',0,0,'payment','logo.jpg','N;',1),('appWeixinPay','App微信支付','1.0','\'\'','a:3:{i:0;a:5:{s:4:\"name\";s:5:\"appid\";s:5:\"label\";s:20:\"绑定支付的APPID\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:0:\"\";s:4:\"hint\";s:0:\"\";}i:1;a:4:{s:4:\"name\";s:5:\"mchid\";s:5:\"label\";s:9:\"商户号\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:0:\"\";}i:2;a:4:{s:4:\"name\";s:3:\"key\";s:5:\"label\";s:18:\"商户支付密钥\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:0:\"\";}}',NULL,'微信开放平台支付信息',0,0,'payment','logo.jpg','N;',3),('miniAppPay','微信小程序支付','1.0','\'\'','a:4:{i:0;a:5:{s:4:\"name\";s:5:\"appid\";s:5:\"label\";s:20:\"绑定支付的APPID\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:0:\"\";s:4:\"hint\";s:0:\"\";}i:1;a:4:{s:4:\"name\";s:5:\"mchid\";s:5:\"label\";s:9:\"商户号\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:0:\"\";}i:2;a:4:{s:4:\"name\";s:3:\"key\";s:5:\"label\";s:18:\"商户支付密钥\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:0:\"\";}i:3;a:4:{s:4:\"name\";s:9:\"appsecret\";s:5:\"label\";s:15:\"小程序secret\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:0:\"\";}}',NULL,'微信小程序支付信息',0,0,'payment','logo.jpg','N;',4),('alipay','支付宝快捷登陆','1.0','\'\'','a:2:{i:0;a:4:{s:4:\"name\";s:14:\"alipay_partner\";s:5:\"label\";s:17:\"合作者身份ID\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:0:\"\";}i:1;a:4:{s:4:\"name\";s:10:\"alipay_key\";s:5:\"label\";s:15:\"安全检验码\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:0:\"\";}}',NULL,'支付宝快捷登陆插件 ',0,0,'login','logo.jpg','N;',NULL),('qq','QQ登陆','1.0','\'\'','a:2:{i:0;a:4:{s:4:\"name\";s:6:\"app_id\";s:5:\"label\";s:6:\"app_id\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:0:\"\";}i:1;a:4:{s:4:\"name\";s:10:\"app_secret\";s:5:\"label\";s:10:\"app_secret\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:0:\"\";}}','a:2:{s:6:\"app_id\";s:9:\"101510962\";s:10:\"app_secret\";s:32:\"96b071b0750890e7830fd1286308ab97\";}','QQ登陆插件 ',1,0,'login','logo.jpg','N;',NULL),('weixin','微信登录','1.0','\'\'','a:2:{i:0;a:4:{s:4:\"name\";s:5:\"appid\";s:5:\"label\";s:17:\"开放平台appid\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:0:\"\";}i:1;a:4:{s:4:\"name\";s:6:\"secret\";s:5:\"label\";s:18:\"开放平台secret\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:0:\"\";}}',NULL,'微信扫码登录插件 ',1,0,'login','logo.jpg','N;',NULL),('helloworld','HelloWorld插件','v1.2.0,v1.2.1,v1.2.2,v1.2.3','\'\'','',NULL,'适合v1.2.0 , v1.2.1',0,0,'function','logo.jpg','N;',NULL),('cod','到货付款','1.0','\'\'','a:1:{i:0;a:4:{s:4:\"name\";s:9:\"code_desc\";s:5:\"label\";s:12:\"配送描述\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:0:\"\";}}',NULL,'货到付款插件 ',0,0,'payment','logo.jpg','N;',0),('banktrans','银行转账','1.0','','a:1:{i:0;a:4:{s:4:\"name\";s:9:\"code_desc\";s:5:\"label\";s:12:\"配送描述\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:0:\"\";}}','','银行转账付款插件 ',1,0,'payment','logo.jpg','N;',0),('tenpay','PC端财付通','1.0','','a:2:{i:0;a:4:{s:4:\"name\";s:7:\"partner\";s:5:\"label\";s:7:\"partner\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:0:\"\";}i:1;a:4:{s:4:\"name\";s:3:\"key\";s:5:\"label\";s:3:\"key\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:0:\"\";}}',NULL,'PC端财付通插件 ',0,0,'payment','logo.jpg','N;',2),('unionpay','银联在线支付','1.0','\'\'','a:4:{i:0;a:4:{s:4:\"name\";s:12:\"unionpay_mid\";s:5:\"label\";s:9:\"商户号\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:15:\"777290058130619\";}i:1;a:4:{s:4:\"name\";s:21:\"unionpay_cer_password\";s:5:\"label\";s:25:\" 商户私钥证书密码\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:6:\"000000\";}i:2;a:4:{s:4:\"name\";s:13:\"unionpay_user\";s:5:\"label\";s:19:\" 企业网银账号\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:12:\"123456789001\";}i:3;a:4:{s:4:\"name\";s:17:\"unionpay_password\";s:5:\"label\";s:19:\" 企业网银密码\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:6:\"789001\";}}',NULL,'银联在线支付插件 ',0,0,'payment','logo.jpg','N;',0),('weixinH5','微信支付','1.0','\'\'','a:3:{i:0;a:4:{s:4:\"name\";s:5:\"appid\";s:5:\"label\";s:20:\"绑定支付的APPID\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:0:\"\";}i:1;a:4:{s:4:\"name\";s:5:\"mchid\";s:5:\"label\";s:9:\"商户号\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:0:\"\";}i:2;a:4:{s:4:\"name\";s:3:\"key\";s:5:\"label\";s:18:\"商户支付密钥\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:0:\"\";}}',NULL,'微信支付【H5】',0,NULL,'payment','logo.jpg','N;',1),('alipay','PC端支付宝','1.0','','a:6:{i:0;a:5:{s:4:\"name\";s:14:\"alipay_account\";s:5:\"label\";s:15:\"支付宝帐户\";s:11:\"description\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:0:\"\";}i:1;a:5:{s:4:\"name\";s:10:\"alipay_key\";s:5:\"label\";s:21:\"交易安全校验码\";s:11:\"description\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:0:\"\";}i:2;a:5:{s:4:\"name\";s:14:\"alipay_partner\";s:5:\"label\";s:17:\"合作者身份ID\";s:11:\"description\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:0:\"\";}i:3;a:5:{s:4:\"name\";s:18:\"alipay_private_key\";s:5:\"label\";s:6:\"秘钥\";s:11:\"description\";s:36:\"APP端所需秘钥,PC端无需配置\";s:4:\"type\";s:8:\"textarea\";s:5:\"value\";s:0:\"\";}i:4;a:5:{s:4:\"name\";s:17:\"alipay_pay_method\";s:5:\"label\";s:19:\" 选择接口类型\";s:4:\"type\";s:6:\"select\";s:6:\"option\";a:2:{i:1;s:24:\"使用担保交易接口\";i:2;s:30:\"使用即时到帐交易接口\";}s:11:\"description\";s:0:\"\";}i:5;a:5:{s:4:\"name\";s:7:\"is_bank\";s:5:\"label\";s:18:\"是否开通网银\";s:11:\"description\";s:0:\"\";s:4:\"type\";s:6:\"select\";s:6:\"option\";a:2:{i:0;s:3:\"否\";i:1;s:3:\"是\";}}}','a:6:{s:14:\"alipay_account\";s:0:\"\";s:10:\"alipay_key\";s:0:\"\";s:14:\"alipay_partner\";s:0:\"\";s:18:\"alipay_private_key\";s:0:\"\";s:17:\"alipay_pay_method\";s:1:\"1\";s:7:\"is_bank\";s:1:\"1\";}','PC端支付宝插件 ',1,1,'payment','logo.jpg','a:8:{s:12:\"招商银行\";s:9:\"CMB-DEBIT\";s:18:\"中国工商银行\";s:10:\"ICBC-DEBIT\";s:12:\"交通银行\";s:10:\"COMM-DEBIT\";s:18:\"中国建设银行\";s:9:\"CCB-DEBIT\";s:18:\"中国民生银行\";s:4:\"CMBC\";s:12:\"中国银行\";s:9:\"BOC-DEBIT\";s:18:\"中国农业银行\";s:3:\"ABC\";s:12:\"上海银行\";s:6:\"SHBANK\";}',2),('weixin','微信支付','1.0','','a:4:{i:0;a:4:{s:4:\"name\";s:5:\"appid\";s:5:\"label\";s:20:\"绑定支付的APPID\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:0:\"\";}i:1;a:4:{s:4:\"name\";s:5:\"mchid\";s:5:\"label\";s:9:\"商户号\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:0:\"\";}i:2;a:4:{s:4:\"name\";s:3:\"key\";s:5:\"label\";s:18:\"商户支付密钥\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:0:\"\";}i:3;a:4:{s:4:\"name\";s:9:\"appsecret\";s:5:\"label\";s:57:\"公众帐号secert（仅JSAPI支付的时候需要配置)\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:0:\"\";}}','','PC端+微信公众号支付',1,1,'payment','logo.jpg','N;',0);

/*Table structure for table `gy_pre_sell` */

DROP TABLE IF EXISTS `gy_pre_sell`;

CREATE TABLE `gy_pre_sell` (
  `pre_sell_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '预售id',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `goods_name` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '商品名称',
  `item_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '规格id',
  `item_name` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '规格名称',
  `title` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '预售标题',
  `desc` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '预售描述',
  `deposit_goods_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订购商品数',
  `deposit_order_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订购订单数',
  `stock_num` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '预售库存',
  `sell_start_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '活动开始时间',
  `sell_end_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '活动结束时间',
  `pay_start_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '尾款支付开始时间',
  `pay_end_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '尾款支付结束时间',
  `deposit_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '订金',
  `price_ladder` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '价格阶梯。预定人数达到多少个时，价格为多少钱',
  `delivery_time_desc` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '开始发货时间描述',
  `store_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '店铺id',
  `is_finished` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否已结束:0,正常；1，结束（待处理）；2,成功结束；3，失败结束。',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '团购状态，0待审核，1正常2拒绝3关闭',
  PRIMARY KEY (`pre_sell_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `gy_pre_sell` */

/*Table structure for table `gy_prom_goods` */

DROP TABLE IF EXISTS `gy_prom_goods`;

CREATE TABLE `gy_prom_goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '活动ID',
  `title` varchar(60) NOT NULL DEFAULT '' COMMENT '促销活动名称',
  `type` int(2) NOT NULL DEFAULT '0' COMMENT '促销类型',
  `expression` varchar(100) NOT NULL DEFAULT '' COMMENT '优惠体现',
  `description` text COMMENT '活动描述',
  `start_time` int(11) NOT NULL COMMENT '活动开始时间',
  `end_time` int(11) NOT NULL COMMENT '活动结束时间',
  `is_end` tinyint(1) DEFAULT '0' COMMENT '是否已结束',
  `group` varchar(255) DEFAULT NULL COMMENT '适用范围',
  `prom_img` varchar(150) DEFAULT NULL COMMENT '活动宣传图片',
  `buy_limit` int(10) DEFAULT NULL COMMENT '每人限购数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `gy_prom_goods` */

/*Table structure for table `gy_prom_order` */

DROP TABLE IF EXISTS `gy_prom_order`;

CREATE TABLE `gy_prom_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL DEFAULT '' COMMENT '活动名称',
  `type` int(2) NOT NULL DEFAULT '0' COMMENT '活动类型',
  `money` float(10,2) DEFAULT '0.00' COMMENT '最小金额',
  `expression` varchar(100) DEFAULT NULL COMMENT '优惠体现',
  `description` text COMMENT '活动描述',
  `start_time` int(11) DEFAULT NULL COMMENT '活动开始时间',
  `end_time` int(11) DEFAULT NULL COMMENT '活动结束时间',
  `is_close` tinyint(1) DEFAULT '0',
  `group` varchar(255) DEFAULT NULL COMMENT '适用范围',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `gy_prom_order` */

/*Table structure for table `gy_rebate_log` */

DROP TABLE IF EXISTS `gy_rebate_log`;

CREATE TABLE `gy_rebate_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分成记录表',
  `user_id` int(11) DEFAULT '0' COMMENT '获佣用户',
  `buy_user_id` int(11) DEFAULT '0' COMMENT '购买人id',
  `nickname` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '购买人名称',
  `order_sn` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '订单编号',
  `order_id` int(11) DEFAULT '0' COMMENT '订单id',
  `goods_price` decimal(10,2) DEFAULT '0.00' COMMENT '订单商品总额',
  `money` decimal(10,2) DEFAULT '0.00' COMMENT '获佣金额',
  `level` tinyint(1) DEFAULT '1' COMMENT '获佣用户级别',
  `create_time` int(11) DEFAULT '0' COMMENT '分成记录生成时间',
  `confirm` int(11) DEFAULT '0' COMMENT '确定收货时间',
  `status` tinyint(1) DEFAULT '0' COMMENT '0未付款,1已付款, 2等待分成(已收货) 3已分成, 4已取消',
  `confirm_time` int(11) DEFAULT '0' COMMENT '确定分成或者取消时间',
  `remark` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '如果是取消, 有取消备注',
  `detail` varchar(1024) DEFAULT NULL COMMENT '记录该笔佣金中来自每个商品的分佣详情',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `gy_rebate_log` */

/*Table structure for table `gy_recharge` */

DROP TABLE IF EXISTS `gy_recharge`;

CREATE TABLE `gy_recharge` (
  `order_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '会员ID',
  `nickname` varchar(50) DEFAULT NULL COMMENT '会员昵称',
  `order_sn` varchar(30) NOT NULL DEFAULT '' COMMENT '充值单号',
  `account` decimal(10,2) DEFAULT '0.00' COMMENT '充值金额',
  `ctime` int(11) DEFAULT NULL COMMENT '充值时间',
  `pay_time` int(11) DEFAULT NULL COMMENT '支付时间',
  `pay_code` varchar(20) DEFAULT NULL,
  `pay_name` varchar(80) DEFAULT NULL COMMENT '支付方式',
  `pay_status` tinyint(1) DEFAULT '0' COMMENT '充值状态0:待支付 1:充值成功 2:交易关闭',
  `buy_vip` tinyint(1) DEFAULT '0' COMMENT '是否为VIP充值，1是',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `gy_recharge` */

insert  into `gy_recharge`(`order_id`,`user_id`,`nickname`,`order_sn`,`account`,`ctime`,`pay_time`,`pay_code`,`pay_name`,`pay_status`,`buy_vip`) values (1,1,'18761659049','rechargewAhfn1rEcv','50.00',1535611899,NULL,'alipay','PC端支付宝',0,0);

/*Table structure for table `gy_region` */

DROP TABLE IF EXISTS `gy_region`;

CREATE TABLE `gy_region` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `name` varchar(32) DEFAULT NULL COMMENT '地区名称',
  `level` tinyint(4) DEFAULT '0' COMMENT '地区等级 分省市县区',
  `parent_id` int(10) DEFAULT NULL COMMENT '父id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47503 DEFAULT CHARSET=utf8;

/*Data for the table `gy_region` */


/*Table structure for table `gy_remittance` */

DROP TABLE IF EXISTS `gy_remittance`;

CREATE TABLE `gy_remittance` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分销用户转账记录表',
  `user_id` int(11) DEFAULT '0' COMMENT '汇款的用户id',
  `bank_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '收款银行名称',
  `account_bank` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '银行账号',
  `account_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '开户人名称',
  `money` decimal(10,2) DEFAULT '0.00' COMMENT '汇款金额',
  `status` tinyint(1) DEFAULT '0' COMMENT '0汇款失败 1汇款成功',
  `handle_time` int(11) DEFAULT '0' COMMENT '处理时间',
  `create_time` int(11) DEFAULT '0' COMMENT '申请时间',
  `remark` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '汇款备注',
  `admin_id` int(11) DEFAULT '0' COMMENT '处理管理员id',
  `withdrawals_id` int(11) DEFAULT '0' COMMENT '提现申请表id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `gy_remittance` */

/*Table structure for table `gy_reply` */

DROP TABLE IF EXISTS `gy_reply`;

CREATE TABLE `gy_reply` (
  `reply_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '回复id',
  `comment_id` int(10) NOT NULL COMMENT '评论id：关联评论表',
  `parent_id` int(10) NOT NULL DEFAULT '0' COMMENT '父类id，0为最顶级',
  `content` text NOT NULL COMMENT '回复内容',
  `user_name` varchar(255) NOT NULL DEFAULT '' COMMENT '回复人的昵称',
  `to_name` varchar(255) NOT NULL DEFAULT '' COMMENT '被回复人的昵称',
  `deleted` tinyint(1) unsigned zerofill NOT NULL DEFAULT '0' COMMENT '未删除0；删除：1',
  `reply_time` int(10) unsigned NOT NULL COMMENT '回复时间',
  PRIMARY KEY (`reply_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `gy_reply` */

/*Table structure for table `gy_return_goods` */

DROP TABLE IF EXISTS `gy_return_goods`;

CREATE TABLE `gy_return_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '退货申请表id自增',
  `rec_id` int(11) DEFAULT '0' COMMENT 'order_goods表id',
  `order_id` int(11) DEFAULT '0' COMMENT '订单id',
  `order_sn` varchar(1024) CHARACTER SET utf8 DEFAULT '' COMMENT '订单编号',
  `goods_id` int(11) DEFAULT '0' COMMENT '商品id',
  `goods_num` int(10) DEFAULT '1' COMMENT '退货数量',
  `type` tinyint(1) DEFAULT '0' COMMENT '0仅退款 1退货退款 2换货',
  `reason` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT '退换货原因',
  `describe` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT '问题描述',
  `imgs` varchar(512) CHARACTER SET utf8 DEFAULT '' COMMENT '拍照图片路径',
  `addtime` int(11) DEFAULT '0' COMMENT '申请时间',
  `status` tinyint(1) DEFAULT '0' COMMENT '-2用户取消-1不同意0待审核1通过2已发货3已收货4换货完成5退款完成',
  `remark` varchar(1024) CHARACTER SET utf8 DEFAULT '' COMMENT '客服备注',
  `user_id` int(11) DEFAULT '0' COMMENT '用户id',
  `spec_key` varchar(64) CHARACTER SET utf8 DEFAULT '' COMMENT '商品规格key 对应gy_spec_goods_price 表',
  `seller_delivery` text CHARACTER SET utf8 COMMENT '换货服务，卖家重新发货信息',
  `refund_money` decimal(10,2) DEFAULT '0.00' COMMENT '退还金额',
  `refund_deposit` decimal(10,2) DEFAULT '0.00' COMMENT '退还余额',
  `refund_integral` int(11) DEFAULT '0' COMMENT '退还积分',
  `refund_type` tinyint(1) DEFAULT '0' COMMENT '退款类型',
  `refund_mark` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '退款备注',
  `refund_time` int(11) DEFAULT '0' COMMENT '退款时间',
  `is_receive` tinyint(4) DEFAULT '0' COMMENT '申请售后时是否收到货物',
  `delivery` text CHARACTER SET utf8 COMMENT '用户发货信息',
  `checktime` int(11) DEFAULT NULL COMMENT '卖家审核时间',
  `receivetime` int(11) DEFAULT NULL COMMENT '卖家收货时间',
  `canceltime` int(11) DEFAULT NULL COMMENT '用户取消时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `gy_return_goods` */

/*Table structure for table `gy_search_word` */

DROP TABLE IF EXISTS `gy_search_word`;

CREATE TABLE `gy_search_word` (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '搜索表ID',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '搜索关键词，商品关键词',
  `pinyin_full` varchar(255) NOT NULL DEFAULT '' COMMENT '拼音全拼',
  `pinyin_simple` varchar(255) NOT NULL DEFAULT '' COMMENT '拼音简写',
  `search_num` int(8) NOT NULL DEFAULT '0' COMMENT '搜索次数',
  `goods_num` int(8) NOT NULL DEFAULT '0' COMMENT '商品数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='搜索关键词表';

/*Data for the table `gy_search_word` */

insert  into `gy_search_word`(`id`,`keywords`,`pinyin_full`,`pinyin_simple`,`search_num`,`goods_num`) values (1,'水果','shuiguo','sg',2,1),(2,'宣传单页彩页','xuanchuandanyecaiye','xcdycy',18,1),(3,'宣传单页','xuanchuandanye','xcdy',5,1),(4,'茶叶包装盒','chayebaozhuanghe','cybzh',6,2),(5,'单页','danye','dy',3,2),(6,'宣传画册','xuanchuanhuace','xchc',4,1),(7,'手提袋','shoutidai','std',4,2),(8,'海报','haibao','hb',1,1);

/*Table structure for table `gy_shipping` */

DROP TABLE IF EXISTS `gy_shipping`;

CREATE TABLE `gy_shipping` (
  `shipping_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '物流公司id',
  `shipping_name` varchar(255) NOT NULL DEFAULT '' COMMENT '物流公司名称',
  `shipping_code` varchar(255) NOT NULL DEFAULT '' COMMENT '物流公司编码',
  `is_open` tinyint(1) DEFAULT '1' COMMENT '是否启用',
  `shipping_desc` varchar(255) NOT NULL DEFAULT '' COMMENT '物流描述',
  `shipping_logo` varchar(255) NOT NULL DEFAULT '' COMMENT '物流公司logo',
  `template_width` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '运单模板宽度',
  `template_height` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '运单模板高度',
  `template_offset_x` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '运单模板左偏移量',
  `template_offset_y` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '运单模板上偏移量',
  `template_img` varchar(255) NOT NULL DEFAULT '' COMMENT '运单模板图片',
  `template_html` text NOT NULL COMMENT '打印项偏移校正',
  PRIMARY KEY (`shipping_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `gy_shipping` */

insert  into `gy_shipping`(`shipping_id`,`shipping_name`,`shipping_code`,`is_open`,`shipping_desc`,`shipping_logo`,`template_width`,`template_height`,`template_offset_x`,`template_offset_y`,`template_img`,`template_html`) values (1,'中通快递','ZTO',1,'中通快递中通快递中通快递中通快递中通快递','/public/upload/shipping_logo/2018/04-10/103a82cce3efc0254cd1f2082c8d9b48.jpg',840,480,0,0,'/public/upload/plugins/2018/04-10/166782900e08fe4e0ae2220d7dd7aaeb.jpg','\r\n                            \r\n                                                                    ');

/*Table structure for table `gy_shipping_area` */

DROP TABLE IF EXISTS `gy_shipping_area`;

CREATE TABLE `gy_shipping_area` (
  `shipping_area_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `shipping_area_name` varchar(150) NOT NULL DEFAULT '' COMMENT '配送区域名称',
  `shipping_code` varchar(50) NOT NULL DEFAULT '0' COMMENT '物流id',
  `config` text NOT NULL COMMENT '配置首重续重等...序列化存储',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `is_default` tinyint(1) DEFAULT '0' COMMENT '是否默认',
  PRIMARY KEY (`shipping_area_id`),
  KEY `shipping_id` (`shipping_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `gy_shipping_area` */

/*Table structure for table `gy_shop` */

DROP TABLE IF EXISTS `gy_shop`;

CREATE TABLE `gy_shop` (
  `shop_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '门店索引id',
  `shop_name` varchar(50) NOT NULL DEFAULT '' COMMENT '门店名称',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '会员id',
  `user_name` varchar(50) NOT NULL DEFAULT '' COMMENT '会员名称',
  `shopper_name` varchar(50) NOT NULL DEFAULT '' COMMENT '店主卖家用户名',
  `province_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '门店所在省份ID',
  `city_id` mediumint(8) NOT NULL DEFAULT '0' COMMENT '门店所在城市ID',
  `district_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '门店所在地区ID',
  `shop_address` varchar(100) NOT NULL DEFAULT '' COMMENT '详细地区',
  `longitude` decimal(10,7) NOT NULL DEFAULT '0.0000000' COMMENT '门店地址经度',
  `latitude` decimal(10,7) NOT NULL DEFAULT '0.0000000' COMMENT '门店地址纬度',
  `shop_zip` varchar(10) NOT NULL DEFAULT '' COMMENT '邮政编码',
  `suppliers_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '供应商id，0表示没有',
  `shop_status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '门店状态，0关闭，1开启',
  `work_start_time` varchar(10) NOT NULL DEFAULT '' COMMENT '每天营业起始时间',
  `work_end_time` varchar(10) NOT NULL DEFAULT '' COMMENT '每天营业截止时间',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '开店时间',
  `shop_phone_code` varchar(20) NOT NULL DEFAULT '' COMMENT '联系电话区号',
  `shop_phone` varchar(20) NOT NULL DEFAULT '' COMMENT '商家电话',
  `monday` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '星期一是否营业,0不是,1是',
  `tuesday` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '星期二是否营业，0不是1是',
  `wednesday` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '星期三是否营业，0不是1是',
  `thursday` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '星期四是否营业，0不是1是',
  `friday` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '星期五是否营业，0不是1是',
  `saturday` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '星期六是否营业，0不是1是',
  `sunday` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '星期日是否营业，0不是1是',
  `deleted` tinyint(1) unsigned zerofill NOT NULL DEFAULT '0' COMMENT '未删除0，已删除1',
  PRIMARY KEY (`shop_id`),
  KEY `store_name` (`shop_name`),
  KEY `store_state` (`shop_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='门店自提点表';

/*Data for the table `gy_shop` */

/*Table structure for table `gy_shop_images` */

DROP TABLE IF EXISTS `gy_shop_images`;

CREATE TABLE `gy_shop_images` (
  `shop_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '门店id',
  `image_url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片地址',
  KEY `shop_id` (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `gy_shop_images` */

/*Table structure for table `gy_shop_order` */

DROP TABLE IF EXISTS `gy_shop_order`;

CREATE TABLE `gy_shop_order` (
  `shop_order_id` int(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '提货核销码。主键',
  `order_id` mediumint(8) NOT NULL,
  `order_sn` varchar(20) NOT NULL,
  `shop_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '门店id',
  `take_time` datetime NOT NULL COMMENT '提货时间',
  `is_write_off` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否核销。0未核销，1已核销',
  `write_off_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '核销时间',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '记录插入时间',
  PRIMARY KEY (`shop_order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='门店订单表';

/*Data for the table `gy_shop_order` */

/*Table structure for table `gy_shopper` */

DROP TABLE IF EXISTS `gy_shopper`;

CREATE TABLE `gy_shopper` (
  `shopper_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '门店id',
  `shopper_name` varchar(50) NOT NULL DEFAULT '' COMMENT '门店账号',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '门店Id',
  `last_login_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `add_time` int(11) unsigned DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`shopper_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='门店自提点管理员表';

/*Data for the table `gy_shopper` */

/*Table structure for table `gy_shopper_log` */

DROP TABLE IF EXISTS `gy_shopper_log`;

CREATE TABLE `gy_shopper_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '日志编号',
  `log_content` varchar(50) NOT NULL DEFAULT '' COMMENT '日志内容',
  `log_time` int(10) unsigned NOT NULL COMMENT '日志时间',
  `log_shopper_id` int(10) unsigned NOT NULL COMMENT '卖家编号',
  `log_shopper_name` varchar(50) NOT NULL DEFAULT '' COMMENT '门店帐号',
  `log_shop_id` int(10) unsigned NOT NULL COMMENT '门店id',
  `log_shopper_ip` varchar(50) NOT NULL DEFAULT '' COMMENT '门店ip',
  `log_url` varchar(50) NOT NULL DEFAULT '' COMMENT '日志url',
  `log_state` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '日志状态(0-失败 1-成功)',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='门店自提点管理员日志';

/*Data for the table `gy_shopper_log` */

/*Table structure for table `gy_sms_log` */

DROP TABLE IF EXISTS `gy_sms_log`;

CREATE TABLE `gy_sms_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表id',
  `mobile` varchar(11) DEFAULT '' COMMENT '手机号',
  `session_id` varchar(128) DEFAULT '' COMMENT 'session_id',
  `add_time` int(11) DEFAULT '0' COMMENT '发送时间',
  `code` varchar(10) DEFAULT '' COMMENT '验证码',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '发送状态,1:成功,0:失败',
  `msg` varchar(255) DEFAULT NULL COMMENT '短信内容',
  `scene` int(1) DEFAULT '0' COMMENT '发送场景,1:用户注册,2:找回密码,3:客户下单,4:客户支付,5:商家发货,6:身份验证',
  `error_msg` text COMMENT '发送短信异常内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `gy_sms_log` */

/*Table structure for table `gy_sms_template` */

DROP TABLE IF EXISTS `gy_sms_template`;

CREATE TABLE `gy_sms_template` (
  `tpl_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `sms_sign` varchar(50) NOT NULL DEFAULT '' COMMENT '短信签名',
  `sms_tpl_code` varchar(100) NOT NULL DEFAULT '' COMMENT '短信模板ID',
  `tpl_content` varchar(512) NOT NULL DEFAULT '' COMMENT '发送短信内容',
  `send_scene` varchar(100) NOT NULL DEFAULT '' COMMENT '短信发送场景',
  `add_time` int(11) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`tpl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `gy_sms_template` */

insert  into `gy_sms_template`(`tpl_id`,`sms_sign`,`sms_tpl_code`,`tpl_content`,`send_scene`,`add_time`) values (1,'呱呱印','SMS_151179058','验证码${code}，用户注册新账号, 请勿告诉他人，感谢您的支持!','1',1542595322),(2,'呱呱印','SMS_151233905','验证码${code}，用于密码找回，如非本人操作，请及时检查账户安全','2',1542595338),(5,'呱呱印','SMS_151179067','本次验证码是：${code}（15分钟内有效），您正在设置支付密码。验证码打死也不要告诉别人哦。［呱呱印］','9',1542596818),(6,'呱呱印','SMS_151179063','本次验证码是：${code}（15分钟内有效），您正在修改手机号。验证码打死也不要告诉别人哦。［呱呱印］','8',1542596839);

/*Table structure for table `gy_spec` */

DROP TABLE IF EXISTS `gy_spec`;

CREATE TABLE `gy_spec` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '规格表',
  `type_id` int(11) DEFAULT '0' COMMENT '规格类型',
  `name` varchar(55) DEFAULT NULL COMMENT '规格名称',
  `order` int(11) DEFAULT '50' COMMENT '排序',
  `search_index` tinyint(1) DEFAULT '1' COMMENT '是否需要检索：1是，0否',
  `des` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `gy_spec` */

insert  into `gy_spec`(`id`,`type_id`,`name`,`order`,`search_index`,`des`) values (3,3,'成品尺寸',50,1,NULL),(4,3,'纸张',9,1,NULL),(5,3,'克数',8,1,NULL),(6,3,'正背颜色',6,1,NULL),(7,3,'覆膜',7,1,NULL),(8,3,'内文P数',18,1,NULL),(9,3,'封面材质',20,1,NULL),(10,3,'内文材质',19,1,NULL),(11,3,'装订方式',18,1,NULL);

/*Table structure for table `gy_spec_goods_price` */

DROP TABLE IF EXISTS `gy_spec_goods_price`;

CREATE TABLE `gy_spec_goods_price` (
  `item_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '规格商品id',
  `goods_id` int(11) DEFAULT '0' COMMENT '商品id',
  `key` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '规格键名',
  `key_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '规格键名中文',
  `goods_num` varchar(255) DEFAULT '' COMMENT '商品订购数量 例如：500,1000 等',
  `price` varchar(255) DEFAULT '' COMMENT '价格和商品数量对应单价',
  `market_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '市场价',
  `goods_send_date` int(11) DEFAULT '0' COMMENT '出货周期',
  `goods_weight` decimal(10,2) DEFAULT '0.00' COMMENT '商品重量',
  `goods_volume` decimal(10,2) DEFAULT '0.00' COMMENT '商品体积',
  `cost_price` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '成本价',
  `commission` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '佣金用于分销分成',
  `store_count` int(11) unsigned DEFAULT '10' COMMENT '库存数量',
  `bar_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '商品条形码',
  `sku` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT 'SKU',
  `spec_img` varchar(255) DEFAULT NULL COMMENT '规格商品主图',
  `prom_id` int(10) DEFAULT '0' COMMENT '活动id',
  `prom_type` tinyint(2) DEFAULT '0' COMMENT '参加活动类型',
  `is_active` tinyint(2) DEFAULT '0' COMMENT '是否有效0有效 1 无效',
  PRIMARY KEY (`item_id`),
  KEY `key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;

/*Data for the table `gy_spec_goods_price` */

insert  into `gy_spec_goods_price`(`item_id`,`goods_id`,`key`,`key_name`,`goods_num`,`price`,`market_price`,`goods_send_date`,`goods_weight`,`goods_volume`,`cost_price`,`commission`,`store_count`,`bar_code`,`sku`,`spec_img`,`prom_id`,`prom_type`,`is_active`) values (34,9,'17_37_38_51',NULL,'','4.5,2.8,1.8,1.6','9.00',5,'49.00','0.00',NULL,NULL,10000,'','','',0,0,0),(35,9,'17_37_39_51',NULL,'','5.8,3.4,2.0,1.8','9.00',5,'66.00','0.00',NULL,NULL,10000,'','','',0,0,0),(36,9,'17_37_40_51',NULL,'','5.8,3.4,2.0,1.8','7.00',5,'62.00','0.00',NULL,NULL,10000,'','','',0,0,0),(37,9,'17_37_41_51',NULL,'','6.2,3.8,2.2,1.9','7.00',5,'73.00','0.00',NULL,NULL,10000,'','','',0,0,0),(38,9,'17_37_42_51',NULL,'','6.2,3.8,2.2,1.9','7.00',5,'67.00','0.00',NULL,NULL,10000,'','','',0,0,0),(39,9,'17_37_43_51',NULL,'','6.2,3.8,2.2,1.9','7.00',5,'72.00','0.00',NULL,NULL,10000,'','','',0,0,0),(40,9,'17_37_44_51',NULL,'','6.9,4.1,2.3,2.1','7.00',5,'75.00','0.00',NULL,NULL,10000,'','','',0,0,0),(41,9,'17_37_45_51',NULL,'','6.9,4.1,2.3,2.1','7.00',5,'82.00','0.00',NULL,NULL,10000,'','','',0,0,0),(42,9,'17_37_46_51',NULL,'','6.9,4.1,2.3,2.1','7.00',5,'78.00','0.00',NULL,NULL,10000,'','','',0,0,0),(43,9,'17_37_47_51',NULL,'','6.9,4.1,2.3,2.1','7.00',5,'83.00','0.00',NULL,NULL,10000,'','','',0,0,0),(45,15,'51_54_61_62_64_66',NULL,'','5.7,3,2.2,1.5,1.3','10.00',5,'76.00','0.00',NULL,NULL,0,'','','',0,0,0),(46,15,'51_55_61_62_64_66',NULL,'','7.4,3.8,2.8,1.9,1.7','11.00',5,'91.00','0.00',NULL,NULL,0,'','','',0,0,0),(47,15,'51_56_61_62_64_66',NULL,'','8.3,4.3,3.2,2.2,1.9','12.00',5,'107.00','0.00',NULL,NULL,0,'','','',0,0,0),(48,15,'51_57_61_62_64_66',NULL,'','9.8,5.2,3.8,2.6,2.2','15.00',5,'122.00','0.00',NULL,NULL,0,'','','',0,0,0),(49,15,'51_58_61_62_64_66',NULL,'','10.9,5.7,4.2,2.9,2.5','16.00',5,'137.00','0.00',NULL,NULL,0,'','','',0,0,0),(50,15,'51_59_61_62_64_66',NULL,'','12.8,6.5,4.8,3.3,2.9','19.00',5,'153.00','0.00',NULL,NULL,0,'','','',0,0,0),(51,15,'51_60_61_62_64_66',NULL,'','13.4,7.1,5.3,3.6,3.3','20.00',5,'168.00','0.00',NULL,NULL,0,'','','',0,0,0),(52,15,'51_53_61_63_64_66',NULL,'','4.9,2.58,1.83,1.19,1.12','8.00',5,'68.00','0.00',NULL,NULL,0,'','','',0,0,0),(53,15,'51_54_61_63_64_66',NULL,'','6,3.18,2.32,1.49,1.28','10.00',5,'86.00','0.00',NULL,NULL,0,'','','',0,0,0),(54,15,'51_55_61_63_64_66',NULL,'','7.8,4.1,2.96,1.86,1.73','12.00',5,'105.00','0.00',NULL,NULL,0,'','','',0,0,0),(55,15,'51_56_61_63_64_66',NULL,'','8.75,4.7,3.47,2.17,1.96','14.00',5,'124.00','0.00',NULL,NULL,0,'','','',0,0,0),(56,15,'51_57_61_63_64_66',NULL,'','10.5,5.64,4.13,2.55,2.19','15.00',5,'143.00','0.00',NULL,NULL,0,'','','',0,0,0),(57,15,'51_58_61_63_64_66',NULL,'','11.6,6.24,4.66,2.88,2.52','16.00',5,'162.00','0.00',NULL,NULL,0,'','','',0,0,0),(58,15,'51_59_61_63_64_66',NULL,'','13.5,7.16,5.32,3.26,2.94','17.00',5,'180.00','0.00',NULL,NULL,0,'','','',0,0,0),(59,15,'51_60_61_63_64_66',NULL,'','14.55,7.76,5.85,3.6,3.36','19.00',5,'200.00','0.00',NULL,NULL,0,'','','',0,0,0),(60,15,'52_53_61_62_64_66',NULL,'','4.7,2.5,1.8,1.2,1.1','8.00',5,'61.00','0.00',NULL,NULL,0,'','','',0,0,0),(61,15,'52_54_61_62_64_66',NULL,'','5.7,3,2.2,1.5,1.3','10.00',5,'76.00','0.00',NULL,NULL,0,'','','',0,0,0),(62,15,'52_55_61_62_64_66',NULL,'','7.4,3.8,2.8,1.9,1.7','11.00',5,'91.00','0.00',NULL,NULL,0,'','','',0,0,0),(63,15,'52_56_61_62_64_66',NULL,'','8.3,4.3,3.2,2.2,1.9','12.00',5,'107.00','0.00',NULL,NULL,0,'','','',0,0,0),(64,15,'52_57_61_62_64_66',NULL,'','9.8,5.2,3.8,2.6,2.2','15.00',5,'122.00','0.00',NULL,NULL,0,'','','',0,0,0),(65,15,'52_58_61_62_64_66',NULL,'','10.9,5.7,4.2,2.9,2.5','16.00',5,'137.00','0.00',NULL,NULL,0,'','','',0,0,0),(66,15,'52_59_61_62_64_66',NULL,'','12.8,6.5,4.8,3.3,2.9','19.00',5,'153.00','0.00',NULL,NULL,0,'','','',0,0,0),(67,15,'52_60_61_62_64_66',NULL,'','13.4,7.1,5.3,3.6,3.3','20.00',5,'168.00','0.00',NULL,NULL,0,'','','',0,0,0),(68,15,'52_53_61_63_64_66',NULL,'','4.9,2.58,1.83,1.19,1.12','8.00',5,'68.00','0.00',NULL,NULL,0,'','','',0,0,0),(69,15,'52_54_61_63_64_66',NULL,'','6,3.18,2.32,1.49,1.28','10.00',5,'86.00','0.00',NULL,NULL,0,'','','',0,0,0),(70,15,'52_55_61_63_64_66',NULL,'','7.8,4.1,2.96,1.86,1.73','12.00',5,'105.00','0.00',NULL,NULL,0,'','','',0,0,0),(71,15,'52_56_61_63_64_66',NULL,'','8.75,4.7,3.47,2.17,1.96','14.00',5,'124.00','0.00',NULL,NULL,0,'','','',0,0,0),(72,15,'52_57_61_63_64_66',NULL,'','10.5,5.64,4.13,2.55,2.19','15.00',5,'143.00','0.00',NULL,NULL,0,'','','',0,0,0),(73,15,'52_58_61_63_64_66',NULL,'','11.6,6.24,4.66,2.88,2.52','16.00',5,'162.00','0.00',NULL,NULL,0,'','','',0,0,0),(74,15,'52_59_61_63_64_66',NULL,'','13.5,7.16,5.32,3.26,2.94','17.00',5,'180.00','0.00',NULL,NULL,0,'','','',0,0,0),(75,15,'52_60_61_63_64_66',NULL,'','14.55,7.76,5.85,3.6,3.36','19.00',5,'200.00','0.00',NULL,NULL,0,'','','',0,0,0),(76,16,'15_18_36_66',NULL,'','0.3,0.2,0.13,0.12,0.1,0.08','0.70',4,'9.40','0.00',NULL,NULL,0,'','','',0,0,1),(77,16,'16_18_36_66',NULL,'','0.48,0.29,0.19,0.16,0.15,0.14','0.80',3,'12.00','0.00',NULL,NULL,0,'','','',0,0,1),(78,16,'17_18_36_66',NULL,'','0.52,0.36,0.24,0.19,0.18,0.16','0.90',3,'15.00','0.00',NULL,NULL,0,'','','',0,0,0),(79,16,'18_36_66_77',NULL,'','0.28,0.17,0.12,0.11,0.08.0.07','0.60',3,'6.30','0.00',NULL,NULL,0,'','','',0,0,0),(80,15,'51_53_61_62_64_66',NULL,'','4.7,2.5,1.8,1.2,1.1','7.00',5,'61.00','0.00',NULL,NULL,0,'','','',0,0,0);

/*Table structure for table `gy_spec_image` */

DROP TABLE IF EXISTS `gy_spec_image`;

CREATE TABLE `gy_spec_image` (
  `goods_id` int(11) DEFAULT '0' COMMENT '商品规格图片表id',
  `spec_image_id` int(11) DEFAULT '0' COMMENT '规格项id',
  `src` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '商品规格图片路径'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `gy_spec_image` */

insert  into `gy_spec_image`(`goods_id`,`spec_image_id`,`src`) values (10,9,''),(10,10,''),(13,9,''),(13,10,''),(7,9,''),(7,10,''),(11,9,''),(11,10,''),(12,9,''),(12,10,''),(1,9,''),(1,10,''),(9,38,''),(9,39,''),(9,40,''),(9,41,''),(9,42,''),(9,43,''),(9,44,''),(9,45,''),(9,46,''),(9,47,''),(9,66,''),(9,79,''),(9,80,''),(9,61,''),(9,62,''),(9,63,''),(9,53,''),(9,54,''),(9,55,''),(9,56,''),(9,57,''),(9,58,''),(9,59,''),(9,60,''),(9,67,''),(9,68,''),(9,69,''),(9,70,''),(9,71,''),(9,72,''),(9,73,''),(9,74,''),(9,75,''),(9,76,''),(9,64,''),(9,65,''),(9,36,''),(9,37,''),(9,15,''),(9,16,''),(9,17,''),(9,77,''),(9,78,''),(9,51,''),(9,52,''),(9,18,''),(9,19,''),(15,38,''),(15,39,''),(15,40,''),(15,41,''),(15,42,''),(15,43,''),(15,44,''),(15,45,''),(15,46,''),(15,47,''),(15,66,''),(15,79,''),(15,80,''),(15,61,''),(15,62,''),(15,63,''),(15,53,''),(15,54,''),(15,55,''),(15,56,''),(15,57,''),(15,58,''),(15,59,''),(15,60,''),(15,67,''),(15,68,''),(15,69,''),(15,70,''),(15,71,''),(15,72,''),(15,73,''),(15,74,''),(15,75,''),(15,76,''),(15,64,''),(15,65,''),(15,36,''),(15,37,''),(15,15,''),(15,16,''),(15,17,''),(15,77,''),(15,78,''),(15,51,''),(15,52,''),(15,18,''),(15,19,''),(16,38,''),(16,39,''),(16,40,''),(16,41,''),(16,42,''),(16,43,''),(16,44,''),(16,45,''),(16,46,''),(16,47,''),(16,66,''),(16,79,''),(16,80,''),(16,61,''),(16,62,''),(16,63,''),(16,53,''),(16,54,''),(16,55,''),(16,56,''),(16,57,''),(16,58,''),(16,59,''),(16,60,''),(16,67,''),(16,68,''),(16,69,''),(16,70,''),(16,71,''),(16,72,''),(16,73,''),(16,74,''),(16,75,''),(16,76,''),(16,64,''),(16,65,''),(16,36,''),(16,37,''),(16,15,''),(16,16,''),(16,17,''),(16,77,''),(16,78,''),(16,51,''),(16,52,''),(16,18,''),(16,19,'');

/*Table structure for table `gy_spec_item` */

DROP TABLE IF EXISTS `gy_spec_item`;

CREATE TABLE `gy_spec_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '规格项id',
  `spec_id` int(11) DEFAULT NULL COMMENT '规格id',
  `item` varchar(255) DEFAULT NULL COMMENT '规格项',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;

/*Data for the table `gy_spec_item` */

insert  into `gy_spec_item`(`id`,`spec_id`,`item`) values (15,5,'157g'),(16,5,'200g'),(17,5,'250g'),(18,6,'双面印刷'),(19,6,'单面印刷'),(36,4,'铜版纸'),(37,4,'白卡纸'),(38,3,'高320mm*宽225mm*侧边60mm'),(39,3,'高330mm*宽260mm*侧边100mm'),(40,3,'高330mm*宽260mm*侧边80mm'),(41,3,'高260mm*宽330mm*侧边100mm'),(42,3,'高360mm*宽260mm*侧边80mm'),(43,3,'高360mm*宽260mm*侧边100mm'),(44,3,'高400mm*宽280mm*侧边70mm'),(45,3,'高400mm*宽300mm*侧边80mm'),(46,3,'高400mm*宽280mm*侧边80mm'),(47,3,'高400mm*宽280mm*侧边100mm'),(51,7,'覆哑膜'),(52,7,'覆光膜'),(53,8,'8p'),(54,8,'12p'),(55,8,'16p'),(56,8,'20p'),(57,8,'24p'),(58,8,'28p'),(59,8,'32p'),(60,8,'36p'),(61,9,'250克铜版纸'),(62,10,'128克铜版纸'),(63,10,'157克铜版纸'),(64,11,'骑马钉'),(65,11,'无线胶装'),(66,3,'210mm*285mm'),(67,8,'40p'),(68,8,'44p'),(69,8,'48p'),(70,8,'52p'),(71,8,'56p'),(72,8,'60p'),(73,8,'64p'),(74,8,'68p'),(75,8,'72p'),(76,8,'76p'),(77,5,'105g'),(78,5,'128g'),(79,3,'三折后210mm*95mm'),(80,3,'90mm*54mm');

/*Table structure for table `gy_stock_log` */

DROP TABLE IF EXISTS `gy_stock_log`;

CREATE TABLE `gy_stock_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) DEFAULT NULL COMMENT '商品ID',
  `goods_name` varchar(100) DEFAULT NULL COMMENT '商品名称',
  `goods_spec` varchar(50) DEFAULT NULL COMMENT '商品规格',
  `order_sn` varchar(30) DEFAULT NULL COMMENT '订单编号',
  `muid` int(11) DEFAULT NULL COMMENT '操作用户ID',
  `stock` int(11) DEFAULT NULL COMMENT '更改库存',
  `ctime` int(11) DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `gy_stock_log` */

insert  into `gy_stock_log`(`id`,`goods_id`,`goods_name`,`goods_spec`,`order_sn`,`muid`,`stock`,`ctime`) values (1,16,'单页定制',NULL,'',1,0,1543833401),(2,16,'单页定制',NULL,'',1,0,1543833401),(3,16,'单页定制',NULL,'',1,0,1543833401),(4,16,'单页定制',NULL,'',1,0,1543833401),(5,16,'单页定制',NULL,'',1,0,1543835147),(6,16,'单页定制',NULL,'',1,0,1543835147),(7,16,'单页定制',NULL,'',1,0,1543835147),(8,16,'单页定制',NULL,'',1,0,1543835147),(9,22,'设计单页彩页国民款，一纸在手，客户我有',NULL,'',1,NULL,1547877251),(10,22,'设计单页彩页国民款，一纸在手，客户我有',NULL,'',1,-10,1547882911);

/*Table structure for table `gy_storage` */

DROP TABLE IF EXISTS `gy_storage`;

CREATE TABLE `gy_storage` (
  `storage_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `storage_name` varchar(128) NOT NULL COMMENT '仓储名称',
  `is_open` tinyint(1) unsigned DEFAULT '1' COMMENT '仓储是否启用  0不启用  1启用',
  `province_id` int(11) unsigned NOT NULL COMMENT '省id',
  `city_id` int(11) unsigned NOT NULL COMMENT '市id',
  `district_id` int(11) unsigned NOT NULL COMMENT '区id',
  `address` varchar(255) NOT NULL COMMENT '仓储详细地址',
  `name` varchar(120) NOT NULL COMMENT '仓储负责人姓名',
  `mobile` char(15) NOT NULL COMMENT '仓储负责人联系电话',
  `capacity` int(11) unsigned NOT NULL COMMENT '仓储容量(前台取用单位立方米)',
  PRIMARY KEY (`storage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `gy_storage` */

/*Table structure for table `gy_suppliers` */

DROP TABLE IF EXISTS `gy_suppliers`;

CREATE TABLE `gy_suppliers` (
  `suppliers_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '供应商ID',
  `suppliers_name` varchar(255) NOT NULL DEFAULT '' COMMENT '供应商名称',
  `suppliers_desc` mediumtext NOT NULL COMMENT '供应商描述',
  `is_check` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '供应商状态',
  `suppliers_contacts` varchar(255) NOT NULL DEFAULT '' COMMENT '供应商联系人',
  `suppliers_phone` varchar(20) NOT NULL DEFAULT '' COMMENT '供应商电话',
  `province_id` int(10) unsigned DEFAULT NULL COMMENT '所在省份id',
  `city_id` int(10) unsigned DEFAULT NULL COMMENT '所在城市id',
  PRIMARY KEY (`suppliers_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `gy_suppliers` */

/*Table structure for table `gy_system_article` */

DROP TABLE IF EXISTS `gy_system_article`;

CREATE TABLE `gy_system_article` (
  `doc_id` mediumint(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `doc_code` varchar(255) NOT NULL COMMENT '调用标识码',
  `doc_title` varchar(255) NOT NULL COMMENT '标题',
  `doc_content` text NOT NULL COMMENT '内容',
  `doc_time` int(10) unsigned NOT NULL COMMENT '添加时间/修改时间',
  PRIMARY KEY (`doc_id`),
  UNIQUE KEY `doc_code` (`doc_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统文章表';

/*Data for the table `gy_system_article` */

/*Table structure for table `gy_system_menu` */

DROP TABLE IF EXISTS `gy_system_menu`;

CREATE TABLE `gy_system_menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '权限名字',
  `group` varchar(20) DEFAULT NULL COMMENT '所属分组',
  `right` text COMMENT '权限码(控制器+动作)',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '删除状态 1删除,0正常',
  `type` tinyint(2) DEFAULT '0' COMMENT '所属模块类型 0admin 1home 2mobile 3api',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8;

/*Data for the table `gy_system_menu` */

insert  into `gy_system_menu`(`id`,`name`,`group`,`right`,`is_del`,`type`) values (4,'广告管理','content','Article@notice_list',0,0),(5,'网站设置','system','System@index,System@handle',0,0),(6,'权限资源','system','System@right_list,System@edit_right',0,0),(7,'前台导航设置','system','System@navigationList,System@addEditNav,System@delNav',0,0),(8,'管理员管理','system','Admin@index,Admin@admin_info,Admin@adminHandle',0,0),(9,'角色管理','system','Admin@role,Admin@role_info,Admin@roleSave,Admin@roleDel',0,0),(10,'供应商管理','system','Admin@supplier,Admin@supplier_info,Admin@supplierHandle',0,0),(12,'会员资金','member','User@account_log,User@account_edit',0,0),(13,'会员管理','member','User@index,User@ajaxindex,User@detail,User@address,User@delete,User@search_user,User@ajax_delete,User@add_user,User@export_user,User@ajax_distribut_tree,User@sendMessage,User@doSendMessage,User@sendMail,User@doSendMail,User@transfer',0,0),(14,'会员等级','member','User@level,User@levelList,User@levelHandle',0,0),(15,'商品类型','goods','Goods@goodsTypeList,Goods@addEditGoodsType,Goods@delGoodsType',0,0),(16,'商品编辑','goods','Goods@addEditGoods,Goods@delGoods,Goods@del_goods_images',0,0),(17,'商品列表','goods','Goods@goodsList,Goods@ajaxGoodsList,Goods@updateField,Goods@initGoodsSearchWord,Goods@initLocationJsonJs',0,0),(18,'商品规格','goods','Goods@ajaxGetSpecList,Goods@delGoodsSpec,Goods@addEditSpec,Goods@ajaxSpecList,Goods@specList,Goods@ajaxGetSpecSelect',0,0),(19,'商品分类','goods','Goods@categoryList,Goods@addEditCategory,Goods@delGoodsCategory',0,0),(20,'商品属性','goods','Goods@ajaxGetAttrList,Goods@goodsAttributeList,Goods@ajaxGoodsAttributeList,Goods@addEditGoodsAttribute,Goods@ajaxGetAttrInput',0,0),(21,'商品品牌','goods','Goods@brandList,Goods@delBrand,Goods@addEditBrand',0,0),(22,'广告列表','content','Ad@adList,Ad@adHandle,Ad@ad,Ad@changeAdField',0,0),(23,'广告位','content','Ad@position,Ad@positionList,Ad@positionHandle',0,0),(24,'团购管理','marketing','Promotion@group_buy,Promotion@group_buy_list,Promotion@groupbuyHandle',0,0),(25,'限时抢购','marketing','Promotion@flash_sale,Promotion@flash_sale_info,Promotion@flash_sale_del',0,0),(26,'促销管理','marketing','Promotion@prom_goods_list,Promotion@prom_goods_info,Promotion@prom_goods_save,Promotion@prom_goods_del,Promotion@get_goods,Promotion@search_goods,Promotion@index,Promotion@prom_order_list,Promotion@prom_order_info,Promotion@prom_order_save,Promotion@prom_order_del,Promotion@group_buy_list,Promotion@group_buy,Promotion@groupbuyHandle,Promotion@flash_sale,Promotion@flash_sale_info,Promotion@flash_sale_del',0,0),(27,'订单列表','order','Order@index,Order@ajaxindex,Order@detail',0,0),(28,'订单发货','order','Order@deliveryHandle,Order@delivery_info,Order@delivery_list',0,0),(29,'退换货处理','order','Order@return_del,Order@return_info,Order@add_return_goods,Order@ajax_return_list,Order@return_list,Order@refund_order_list,Order@refund_order_info,Order@refund_order,Order@refund_back,Order@refund_balance',0,0),(30,'拆分订单','order','Order@split_order,Order@search_goods',0,0),(31,'修改订单','system','Order@edit_order,Order@search_goods',0,0),(32,'添加订单','order','Order@add_order,Order@search_goods',0,0),(33,'处理订单','order','Order@pay_cancel,Order@delete_order,Order@order_action,Order@editprice,Order@order_log,Order@delOrderLogo,Order@ajaxOrderNotice',0,0),(34,'导出订单','order','Order@export_order',0,0),(35,'打印订单','order','Order@order_print,Order@shipping_print',0,0),(36,'插件列表','tools','Plugin@index,Plugin@install,Plugin@setting',0,0),(37,'打印设置','tools','Plugin@shipping_list,Plugin@shipping_desc,Plugin@shipping_print,Plugin@edit_shipping_print,Plugin@shipping_list_edit,Plugin@del_area',0,0),(38,'数据备份','tools','Tools@index,Tools@backup,Tools@optimize,Tools@repair',0,0),(39,'数据还原','tools','Tools@restore,Tools@restoreData,Tools@restoreUpload,Tools@downFile,Tools@delSqlFiles',0,0),(40,'地区管理','tools','Tools@region,Tools@regionHandle',0,0),(41,'公众号设置','marketing','Wechat@index,Wechat@setting,Wechat@get_access_token,Wechat@select_goods',0,0),(42,'文本回复','tools','Wechat@text,Wechat@add_text,Wechat@del_text',0,0),(43,'微信功能','tools','Wechat@menu,Wechat@del_menu,Wechat@pub_menu,Wechat@index,Wechat@setting,Wechat@add_auto_reply,Wechat@ajax_news,Wechat@handle_text,Wechat@update_auto_reply,Wechat@news_edit,Wechat@delete_auto_reply,Wechat@template_msg,Wechat@delete_news,Wechat@fans_list,Wechat@set_template_msg,Wechat@delete_single_news,Wechat@fan_info,Wechat@handle_news,Wechat@reset_template_msg,Wechat@send_text_msg,Wechat@send_news_msg,Wechat@auto_reply,Wechat@auto_reply_edit,Wechat@materials,Wechat@text_edit',0,0),(44,'图文回复','tools','Wechat@img,Wechat@add_img,Wechat@del_img,Wechat@preview',0,0),(45,'模板管理','system','Template@templateList,Template@changeTemplate',0,0),(46,'销售概况','count','Report@index,Report@finance,Report@user,Report@expense_log',0,0),(47,'销售排行','count','Report@saleTop,Report@userTop,Report@saleList',0,0),(48,'专题管理','content','Topic@topic,Topic@topicList,Topic@topicHandle',0,0),(49,'操作日志','system','Admin@log,Order@order_log',0,0),(50,'评论咨询','goods','Comment@index,Comment@detail,Comment@ask_list,Comment@ajax_ask_list,Comment@del,Comment@op,Comment@ask_handle,Comment@consult_info',0,0),(51,'优惠券','marketing','Coupon@coupon_info,Coupon@index,Coupon@make_coupon,Coupon@ajax_get_user,Coupon@send_coupon,Coupon@send_cancel,Coupon@del_coupon,Coupon@coupon_list,Coupon@coupon_list_del,Coupon@addEditCoupon',0,0),(52,'友情链接','content','Article@link,Article@linkList,Article@linkHandle',0,0),(53,'分销管理','marketing','Distribut@set,Distribut@remittance,Distribut@tree,Distribut@rebate_log,Distribut@ajax_lower,Distribut@withdrawals,Distribut@editRebate,Distribut@delWithdrawals,Distribut@editWithdrawals',0,0),(60,'自提点管理','system','Pickup@index,Pickup@ajaxPickupList,Pickup@add,Pickup@edit_address',0,0),(61,'刷新缓存','system','System@cleanCache,System@ClearGoodsHtml,System@ClearGoodsThumb,System@ClearAritcleHtml',0,0),(62,'修改管理员密码','system','Admin@modify_pwd',0,0),(63,'基本页','buy','Index@index,Index@notice,Index@qr_code_raw,Index@qr_code,Index@verify,Index@ajax_favorite,Index@truncate_tables,Channel@index,Tperror@tp404',0,1),(64,'商品相关','buy','Goods@index,Goods@goodsInfo,Goods@activity,Goods@getRegion,Goods@goodsList,Goods@region,Goods@dispatching,Goods@search,Goods@ajax_consult,Goods@ajaxComment,Goods@goodsConsult,Goods@collect_goods,Goods@open_add_cart,Goods@all_category,Goods@all_brand',0,1),(67,'积分商城','activity','Goods@integralMall,Cart@integral2,Cart@integral,Cart@buyIntegralGoods',0,1),(68,'购物车','buy','Cart@index,Cart@AsyncUpdateCart,Cart@changeNum,Cart@delete,Cart@getStoreCoupon,Cart@ajaxAddCart,Cart@cart2,Cart@ajaxAddress,Cart@ajaxPickup,Cart@replace_pickup,Cart@ajax_PickupPoint,Cart@cart3,Cart@cart4,Cart@header_cart_list,Cart@invoice,Cart@save_invoice,Cart@cartCouponExchange',0,1),(69,'支付','buy','Payment@getCode,Payment@getPay,Payment@notifyUrl,Payment@returnUrl,Payment@refundBack,Payment@transferBack',0,1),(70,'订单管理','user','Order@order_list,Order@order_detail,Order@del_order,Order@cancel_order,Order@cancel_order_info,Order@refund_order,Order@record_refund_order,Order@comment,Order@delComment,Order@ajaxZan,Order@reply_add,Order@order_confirm,Order@return_goods_index,Order@return_goods,Order@return_goods_list,Order@return_goods_info,Order@return_goods_refund,Order@income,Order@lower_list,Order@receiveConfirm,Order@return_goods_cancel,Order@comment_list,Order@add_comment,Order@virtual_order',0,1),(71,'虚拟商品','virtual','Virtual@buy_virtual,Virtual@buy_step,Virtual@virtual_list,Virtual@buy_step2,Virtual@add_order,Virtual@check_virtual_goods,Virtual@virtual_confirm,Virtual@virtual_order',0,1),(72,'文章','article','Article@index,Article@articleList,Article@detail',0,1),(73,'专题','article','Topic@topicList,Topic@detail,Topic@info',0,1),(74,'秒杀','activity','Activity@ajax_flash_sale,Activity@flash_sale_list',0,1),(75,'团购促销','activity','Activity@group_list,Activity@promoteList,Activity@coupon_list,Activity@get_coupon',0,1),(76,'预售','activity','Activity@pre_sell_list,Activity@pre_sell',0,1),(77,'微信通知','wechat','Weixin@index',0,1),(78,'基本接口','buy','Api@getRegion,Api@getTwon,Api@getProvince,Api@getRegionByParentId,Api@issetMobile,Api@ad_show,Api@check_validate_code,Api@check_order_pay_status,Api@send_validate_code,Api@doCookieArea,Api@queryExpress,Api@searchKey,Api@issetMobileOrEmail,Api@get_category,LoginApi@login,LoginApi@callback',0,1),(79,'上传','article','Uploadify@upload,Uploadify@delupload,Uploadify@fileList,Uploadify@preview,Uploadify@index,Uploadify@imageUp',0,1),(80,'用户中心','user','User@index,User@logout,User@account,User@coupon,User@login,User@add_address,User@address_list,User@reg,User@do_login,User@pop_login,User@edit_address,User@set_default,User@del_address,User@save_pickup,User@info,User@email_validate,User@mobile_validate,User@goods_collect,User@del_goods_collect,User@password,User@forget_pwd,User@set_pwd,User@finished,User@bind_account,User@bind_guide,User@bind_reg,User@bind_auth,User@bind_remove,User@check_captcha,User@check_username,User@identity,User@verify,User@safety_settings,User@withdrawals,User@recharge,User@message_notice,User@ajax_message_notice,User@set_message_notice,User@paypwd,User@ajaxZan,User@del_visit_log,User@visit_log,User@myCollect,User@historyLog,User@rechargevip,User@setAddressDefault',0,1),(81,'基本页','buy','Index@index,Index@categoryList,Index@mobanlist,Index@goodsList,Index@ajaxGetMore,Index@ajaxGetWxConfig,Channel@index',0,2),(82,'基本接口','buy','LoginApi@login,LoginApi@callback',0,2),(83,'购物车','buy','Cart@index,Cart@AsyncUpdateCart,Cart@changeNum,Cart@delete,Cart@cart2,Cart@ajaxAddress,Cart@ajaxAddCart,Cart@cart4,Cart@cart3,Cart@invoice,Cart@save_invoice',0,2),(84,'商品相关','buy','Goods@index,Goods@search,Goods@activity,Goods@categoryList,Goods@goodsList,Goods@ajaxGoodsList,Goods@goodsInfo,Goods@goodsAttr,Goods@ajaxComment,Goods@comment,Goods@ajaxSearch,Goods@brandstreet,Goods@collect_goods',0,2),(85,'积分商城','activity','Cart@integral2,Cart@buyIntegralGoods,Goods@integralMall,Cart@integral',0,2),(86,'支付','buy','Payment@getCode,Payment@getPay,Payment@notifyUrl,Payment@returnUrl',0,2),(87,'订单管理','user','Order@order_list,Order@order_detail,Order@express,Order@team_list,Order@team_detail,Order@cancel_order,Order@order_confirm,Order@refund_order,Order@record_refund_order,Order@return_goods,Order@return_goods_list,Order@return_goods_info,Order@checkReturnInfo,Order@return_goods_refund,Order@comment,Order@ajaxZan,Order@replyComment,Order@receiveConfirm,Order@comment_info,Order@return_goods_cancel,Order@wait_receive,Order@add_comment',0,2),(88,'用户中心','user','User@index,User@logout,User@account,User@account_list,User@account_detail,User@coupon,User@login,User@do_login,User@reg,User@bind_guide,User@bind_account,User@address_list,User@add_address,User@edit_address,User@set_default,User@del_address,User@userinfo,User@setMobile,User@email_validate,User@mobile_validate,User@collect_list,User@cancel_collect,User@points,User@message_list,User@points_list,User@verify,User@set_pwd,User@find_pwd,User@forget_pwd,User@password,User@accountManage,User@recharge,User@recharge_list,User@withdrawals_list,User@withdrawals,User@myfocus,User@set_notice,User@sign,User@message_notice,User@visit_log,User@user_sign,User@ajax_message_notice,User@rechargevip,User@del_visit_log,User@clear_visit_log,User@paypwd,User@set_message_notice',0,2),(89,'秒杀','activity','Activity@flash_sale_list,Activity@ajax_flash_sale',0,2),(90,'预售','activity','Activity@pre_sell_list,Activity@pre_sell,Cart@pre_sell_cart',0,2),(91,'团购促销','activity','Activity@index,Activity@group_list,Activity@discount_list,Activity@promote_goods,Activity@coupon_list,Activity@getCoupon',0,2),(92,'拼团','activity','Team@index,Team@category,Team@AjaxTeamList,Team@info,Team@ajaxCheckTeam,Team@ajaxTeamFound,Team@addOrder,Team@order,Team@getOrderInfo,Team@getOrderInfo2,Team@found,Team@ajaxGetMore,Team@lottery',0,2),(93,'分销','distribut','Distribut@index,Distribut@lower_list,Distribut@order_list,Distribut@verify,Distribut@qr_code,Distribut@must_see,Distribut@my_store,Distribut@set_store,Distribut@add_goods,Distribut@goods_list,Distribut@rankings,Distribut@rebate_log',0,2),(94,'虚拟商品','virtual','Virtual@buy_virtual,Virtual@buy_step,Virtual@virtual_list,Virtual@buy_step2,Virtual@virtual_order,Virtual@add_order,Virtual@check_virtual_goods,Virtual@virtual_confirm',0,2),(95,'文章','article','Article@news,Article@detail',0,2),(96,'基本接口','buy','Index@homePage,Index@recommend,Index@favourite,Index@getConfig,Index@getPluginConfig,Index@get_region,Index@brand_street',0,3),(97,'商品相关','buy','Goods@index,Goods@goodsCategoryList,Goods@goodsSecAndThirdCategoryList,Goods@goodsList,Goods@search,Goods@goods_activity,Goods@goodsInfo,Goods@goodsContent,Goods@goodsThumImages,Goods@similar,Goods@guessYouLike,Goods@collectGoodsOrNo,Goods@getGoodsComment,Goods@dispatching',0,3),(98,'购物车','buy','Cart@addCart,Cart@delCart,Cart@cartList,Cart@cart2,Cart@cart3,Cart@cart4',0,3),(99,'支付','buy','Payment@alipayNotify,Payment@alipay_sign,Payment@pay_arrival,Wxpay@initPlugin,Wxpay@notify,Wxpay@dopay',0,3),(100,'积分商城','activity','Goods@integralMall,Cart@integral2,Cart@integral',0,3),(101,'文章','article','Article@info',0,3),(102,'订单管理','user','Order@return_goods_list,Order@order_detail,Order@del_order,Order@return_goods_info,Order@receiveConfirm,Order@return_goods_status,Order@upload_return_goods_img,Order@refund_order,Order@return_goods_cancel',0,3),(103,'用户中心','user','User@login,User@logout,User@reg,User@bind_account,User@thirdLogin,User@password,User@userInfo,User@updateUserInfo,User@forgetPassword,User@forgetPasswordInfo,User@check_sms,User@change_mobile,User@getAddressList,User@addAddress,User@del_address,User@setDefaultAddress,User@getCouponList,User@getGoodsCollect,User@cancelOrder,User@getOrderList,User@orderConfirm,User@add_comment,User@upload_comment_img,User@account,User@return_goods_list,User@return_goods_status,User@return_goods_info,User@visit_log,User@del_visit_log,User@clear_visit_log,User@verify,User@upload_headpic,User@message_notice,User@message,User@message_switch,User@clear_message,User@message_list,User@about_us,User@token_status,User@recharge_list,User@account_list,User@comment,User@withdrawals,User@withdrawals_list,User@comment_num,User@express,User@paypwd,User@points_list,User@checkcoupon',0,3),(104,'秒杀','activity','Activity@flash_sale_list,Activity@flash_sale_time',0,3),(105,'团购促销','activity','Activity@group_list,Activity@group,Activity@coupon_list,Activity@coupon_center,Activity@coupon_type_list,Activity@get_coupon,Activity@promote_list,Activity@promote_goods',0,3),(106,'分销','buy','Distribut@index,Distribut@lower_list,Distribut@order_list,Distribut@qr_code,Distribut@goods_list,Distribut@store_summery,Distribut@my_store,Distribut@store,Distribut@rebate_log,Distribut@rankings,Distribut@goods_types,Distribut@must_see,Distribut@add_goods',0,3),(107,'招商加盟','supplier','Supplier@add_supplier',0,3),(108,'消息推送','message','Message@message_read',0,3),(109,'广告','article','Ad@ad_home,Ad@ad_category,Ad@ad_common',0,3),(110,'应用管理','app','App@latest',0,3),(111,'基础功能','system','Admin@index,Admin@role,Admin@supplierHandle,Admin@modify_pwd,Admin@role_info,Admin@roleSave,Admin@admin_info,Admin@adminHandle,Admin@roleDel,Admin@login,Admin@log,Admin@supplier,Admin@logout,Admin@vertify,Admin@supplier_info,Index@index,Index@welcome,Index@get_sys_info,Index@pushVersion,Index@changeTableVal,Index@about',0,0),(112,'预售','marketing','Promotion@pre_sell_fail,Promotion@pre_sell_success,Promotion@pre_sell_del,Promotion@pre_sell_info,Promotion@pre_sell_list',0,0),(113,'拼团','marketing','Team@index,Team@team_list,Team@team_info,Team@info,Team@save,Team@order_list,Team@delete,Team@team_found,Team@confirmFound,Team@bonus,Team@refundFound,Team@doBonus,Team@lottery',0,0),(114,'短信模板','system','SmsTemplate@index,SmsTemplate@addEditSmsTemplate,SmsTemplate@delTemplate',0,0),(115,'提现申请','member','User@withdrawals,User@recharge,User@remittance,User@get_withdrawals_list,User@delWithdrawals,User@editWithdrawals,User@withdrawals_update',0,0),(116,'会员签到','member','User@signList,User@ajaxsignList,User@signRule',0,0),(117,'文章管理','content','Article@categoryList,Article@category,Article@articleList,Article@categoryHandle,Article@article,Article@aticleHandle,Article@link,Article@linkHandle,Article@linkList',0,0),(118,'淘宝导入','goods','Import@index,Import@upload_data,Import@add_data',0,0),(119,'库存日志','goods','Goods@stock_list',0,0),(120,'运费模板','content','Freight@info,Freight@index,Freight@save,Freight@delete,Freight@area',0,0),(121,'发票管理','order','Invoice@index,Invoice@ajaxindex,Invoice@changetime,Invoice@export_invoice',0,0),(122,'应用管理','tools','MobileApp@index,MobileApp@ios_audit,MobileApp@handle',0,0),(123,'虚拟订单','order','Order@virtual_list,Order@virtual_info,Order@virtual_cancel,Order@generateVirtualCode,Order@verify_code',0,0),(124,'自定义手机模板','system','Block@index,Block@add_data,Block@ajaxreturn_block',0,0),(125,'手机模板装修','system','Block@index,Block@get_flash,Block@pageList,Block@goods_list_block,Block@ajaxGoodsList,Block@add_data,Block@set_index,Block@delete',0,0);

/*Table structure for table `gy_system_module` */

DROP TABLE IF EXISTS `gy_system_module`;

CREATE TABLE `gy_system_module` (
  `mod_id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `module` enum('top','menu','module') DEFAULT 'module',
  `level` tinyint(1) DEFAULT '3',
  `ctl` varchar(20) DEFAULT '',
  `act` varchar(30) DEFAULT '',
  `title` varchar(20) DEFAULT '',
  `visible` tinyint(1) DEFAULT '1',
  `parent_id` smallint(6) DEFAULT '0',
  `orderby` smallint(6) DEFAULT '50',
  `icon` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`mod_id`)
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=utf8;

/*Data for the table `gy_system_module` */

insert  into `gy_system_module`(`mod_id`,`module`,`level`,`ctl`,`act`,`title`,`visible`,`parent_id`,`orderby`,`icon`) values (1,'top',1,'','','系统',1,0,50,'0'),(2,'top',1,'','','设置',1,0,50,'0'),(3,'top',1,'','','会员',1,0,50,'0'),(4,'top',1,'','','商家',1,0,50,'0'),(5,'top',1,'','','内容',1,0,50,'0'),(6,'top',1,'','','运营',1,0,50,'fa-home'),(7,'menu',2,'','','权限管理',1,1,2,'fa-cog'),(8,'menu',2,'','','模块管理',1,1,3,'fa-table'),(9,'menu',2,'','','网站设置',1,2,50,'fa-pencil'),(10,'menu',2,'','','会员管理',1,3,50,'fa-user'),(11,'menu',2,'','','商品管理',1,4,50,'fa-tasks'),(12,'menu',2,'','','内容管理',1,5,50,'fa-navicon'),(13,'menu',2,'','','广告管理',1,6,50,'fa-star'),(14,'menu',2,'','','促销管理',1,4,50,'fa-retweet'),(15,'menu',2,'','','插件工具',1,6,20,'fa-plug'),(16,'menu',2,'','','微信管理',1,6,50,'fa-home'),(17,'menu',2,'','','订单管理',1,4,50,'fa-flag'),(18,'module',3,'Comment','index','评论管理',1,10,50,'0'),(19,'module',3,'Admin','role','角色管理',1,7,50,'0'),(20,'module',3,'Admin','index','管理员列表',1,7,50,'0'),(21,'module',3,'System','menu','菜单管理',1,8,50,'0'),(22,'module',3,'System','module','模块管理',1,8,50,'0'),(23,'module',3,'Admin','log','管理员日志',1,7,50,'0'),(24,'module',3,'Goods','categoryList','商品分类',1,11,50,'0'),(25,'module',3,'Goods','goodsList','商品列表',1,11,50,'0'),(26,'module',3,'Goods','goodsTypeList','商品类型',1,11,50,'0'),(27,'module',3,'Goods','specList','商品规格',1,11,50,'0'),(28,'module',3,'Goods','goodsAttributeList','商品属性',1,11,50,'0'),(29,'module',3,'Goods','brandList','商品品牌',1,11,50,'0'),(30,'module',3,'Order','index','订单列表',1,17,50,'0'),(31,'module',3,'Order','delivery_list','发货单列表',1,17,50,'0'),(32,'module',3,'Order','return_list','退货单列表',1,17,50,'0'),(33,'module',3,'User','levelList','会员等级',1,10,50,'0'),(34,'module',3,'User','index','会员列表',1,10,50,'0'),(35,'module',3,'System','index','网站设置',1,9,50,'0'),(36,'module',3,'System','navigationList','导航设置',1,9,50,'0'),(37,'module',3,'Ad','positionList','广告位',1,13,50,'0'),(38,'module',3,'Ad','adList','广告列表',1,13,50,'0'),(39,'module',3,'Article','categoryList','文章分类',1,12,50,'0'),(40,'module',3,'Article','articleList','文章列表',1,12,50,'0'),(41,'module',3,'Article','linkList','友情链接',1,12,50,'0'),(42,'module',3,'Topic','topicList','专题列表',1,12,50,'0'),(43,'module',3,'Coupon','index','优惠券',1,14,50,'0'),(44,'module',3,'Wechat','index','公众号管理',1,16,50,'0'),(45,'module',3,'Wechat','menu','微信菜单管理',1,16,50,'0'),(46,'module',3,'Wechat','text','文本回复',1,16,50,'0'),(47,'module',3,'Wechat','img','图文回复',1,16,50,'0'),(48,'module',3,'Wechat','nes','组合回复',1,16,50,'0'),(49,'module',3,'Plugin','index','插件列表',1,15,50,'0'),(50,'module',3,'Promotion','index','组合促销',0,14,50,'0'),(51,'menu',2,'','','模板管理',1,2,50,'fa-book'),(52,'module',3,'Template','templateList?t=pc','PC端模板',1,51,50,'0'),(53,'module',3,'Template','templateList?t=mobile','手机端模板',1,51,50,'0'),(54,'module',3,'Tools','index','数据备份',1,15,50,NULL),(55,'menu',2,'','','报表统计',1,6,50,'fa-bar-chart'),(56,'module',3,'report','index','销售概况',1,55,50,NULL),(57,'module',3,'report','saleTop','销售排行',1,55,50,NULL),(58,'module',3,'report','userTop','会员排行',1,55,50,NULL),(59,'module',3,'Promotion','group_buy_list','团购管理',1,14,50,NULL),(60,'module',3,'report','saleList','销售明细',1,55,50,NULL),(61,'module',3,'report','user','会员统计',1,55,50,NULL),(62,'module',3,'Promotion','flash_sale','限时抢购',1,14,50,NULL),(63,'module',3,'Tools','restore','数据还原',1,15,50,NULL),(64,'module',3,'Order','add_order','添加订单',1,17,50,NULL),(65,'module',3,'report','finance','财务统计',1,55,50,NULL),(66,'module',3,'Admin','role_info','编辑角色',0,7,50,NULL),(67,'module',3,'Admin','role_save','保存角色',0,7,50,NULL),(68,'module',3,'Admin','roleDel','删除角色',0,7,50,NULL),(69,'module',3,'Admin','admin_info','编辑管理员',0,7,50,NULL),(70,'module',3,'Admin','adminHandle','保存管理员',0,7,50,NULL),(71,'module',3,'System','create_menu','添加菜单',0,8,50,NULL),(72,'module',3,'System','menuSave','保存菜单',0,8,50,NULL),(73,'module',3,'System','ctl_detail','添加控制模块',0,8,50,NULL),(74,'module',3,'System','ctlSave','保存控制模块',0,8,50,NULL),(75,'module',3,'System','handle','保存设置',0,9,50,NULL),(76,'module',3,'System','addEditNav','保存导航',0,9,50,NULL),(77,'module',3,'Template','changeTemplate','切换模板',0,51,50,NULL),(78,'module',3,'System','delNav','删除导航',0,9,50,NULL),(79,'module',3,'Comment','detail','评论详情',0,10,50,NULL),(80,'module',3,'Comment','op','评论回复',0,10,50,NULL),(81,'module',3,'Comment','del','删除评论',0,10,50,NULL),(82,'module',3,'User','level','新增等级',0,10,50,NULL),(83,'module',3,'User','levelHandle','保存等级',0,10,50,NULL),(84,'module',3,'User','detail','查看会员',0,10,50,NULL),(85,'module',3,'User','account_log','会员消费记录',0,10,50,NULL),(86,'module',3,'User','account_edit','会员资金调节',0,10,50,NULL),(87,'module',3,'User','address','会员收货地址',0,10,50,NULL),(88,'module',3,'Goods','addEditGoods','新增商品',0,11,50,NULL),(89,'module',3,'Goods','addEditCategory','编辑商品分类',0,11,50,NULL),(90,'module',3,'Goods','delGoodsCategory','删除商品分类',0,11,50,NULL),(91,'module',3,'Goods','changeGoodsField','修改商品字段',0,11,50,NULL),(92,'module',3,'Goods','addEditGoodsType','编辑商品类型',0,11,50,NULL),(93,'module',3,'Goods','addEditGoodsAttribute','编辑商品属性',0,11,50,NULL),(94,'module',3,'Goods','delGoods','删除商品',0,11,50,NULL),(95,'module',3,'Goods','delGoodsType','删除商品类型',0,11,50,NULL),(96,'module',3,'Goods','delGoodsAttribute','删除商品属性',0,11,50,NULL),(97,'module',3,'Goods','delGoodsSpec','删除商品规格',0,11,50,NULL),(98,'module',3,'Goods','addEditSpec','编辑商品规格',0,11,50,NULL),(99,'module',3,'Goods','addEditBrand','编辑品牌',0,11,50,NULL),(100,'module',3,'Goods','delBrand','删除品牌',0,11,50,NULL),(101,'module',3,'Coupon','coupon_info','添加优惠券',0,14,50,NULL),(102,'module',3,'Promotion','group_buy','添加团购',0,14,50,NULL),(103,'module',3,'Promotion','groupbuyHandle','保存团购',0,14,50,NULL),(104,'module',3,'Promotion','get_goods','选择商品',0,14,50,NULL),(105,'module',3,'Coupon','coupon_info','编辑优惠券',0,14,50,NULL),(106,'module',3,'Coupon','del_coupon','删除优惠券',0,14,50,NULL),(107,'module',3,'Coupon','send_coupon','发放优惠券',0,14,50,NULL),(108,'module',3,'Order','edit_order','编辑订单',0,17,50,NULL),(109,'module',3,'Order','split_order','拆分订单',0,17,50,NULL),(110,'module',3,'Order','deatil','订单详情',0,17,50,NULL),(111,'module',3,'Order','editprice','修改订单金额',0,17,50,NULL),(112,'module',3,'Order','delete_order','删除订单',0,17,50,NULL),(113,'module',3,'Order','pay_cancel','取消付款',0,17,50,NULL),(114,'module',3,'Order','order_print','订单打印',0,17,50,NULL),(115,'module',3,'Order','shipping_print','打印快递',0,17,50,NULL),(116,'module',3,'Order','deliveryHandle','发货处理',0,17,50,NULL),(117,'module',3,'Order','delivery_info','发货单详情',0,17,50,NULL),(118,'module',3,'Order','return_info','退货单信息',0,17,50,NULL),(119,'module',3,'Order','return_del','删除退货单',0,17,50,NULL),(120,'module',3,'Order','order_action','订单流程处理',0,17,50,NULL),(121,'module',3,'Order','export_order','导出订单',0,17,50,NULL),(122,'module',3,'Order','search_goods','搜索商品',0,17,50,NULL),(123,'module',3,'Order','add_return_goods','生成退货单',0,17,50,NULL),(124,'module',3,'Article','category','编辑文章分类',0,12,50,NULL),(125,'module',3,'Article','categoryHandle','保存文章分类',0,12,50,NULL),(126,'module',3,'Article','article','编辑文章',0,12,50,NULL),(127,'module',3,'Article','aticleHandle','保存文章',0,12,50,NULL),(128,'module',3,'Article','link','编辑友情链接',0,12,50,NULL),(129,'module',3,'Article','linkHandle','保存友情链接',0,12,50,NULL),(130,'module',3,'Topic','topic','新增专题',0,12,50,NULL),(131,'module',3,'Topic','topicHandle','保存专题',0,12,50,NULL),(132,'module',3,'Ad','position','添加广告位',0,13,50,NULL),(133,'module',3,'Ad','positionHandle','保存广告位',0,13,50,NULL),(134,'module',3,'Ad','ad','添加广告',0,13,50,NULL),(135,'module',3,'Ad','adHandle','保存广告',0,13,50,NULL),(136,'module',3,'Tools','backup','生成备份文件',0,15,50,NULL),(137,'module',3,'Tools','restoreData','还原SQL文件',0,15,50,NULL),(138,'module',3,'Tools','optimize','优化数据表',0,15,50,NULL),(139,'module',3,'Tools','repair','修改数据表',0,15,50,NULL),(140,'module',3,'Tools','restoreUpload','上传SQL文件',0,15,50,NULL),(141,'module',3,'Tools','downFile','下载SQL文件',0,15,50,NULL),(142,'module',3,'Tools','delSqlFiles','删除SQL文件',0,15,50,NULL),(143,'module',3,'Promotion','prom_order_list','订单促销',1,14,50,NULL),(144,'module',3,'Promotion','bargain','砍价管理',0,14,50,NULL),(145,'menu',2,'','','分销管理',1,6,50,'fa-user'),(146,'module',3,'Promotion','prom_goods_list','商品促销',1,14,50,NULL),(148,'module',3,'Distribut','tree','分销关系',1,145,50,NULL),(149,'module',3,'Distribut','set','分销设置',1,145,50,NULL),(150,'module',3,'Distribut','withdrawals','提现申请记录',1,145,50,NULL),(151,'module',3,'Distribut','remittance','汇款记录',1,145,50,NULL),(152,'module',3,'Distribut','rebate_log','分成记录',1,145,50,NULL),(153,'module',3,'Tools','region','地区管理',1,15,50,NULL),(154,'module',3,'Comment','ask_list','商品咨询',1,10,50,NULL);

/*Table structure for table `gy_team_activity` */

DROP TABLE IF EXISTS `gy_team_activity`;

CREATE TABLE `gy_team_activity` (
  `team_id` int(10) NOT NULL AUTO_INCREMENT,
  `act_name` varchar(255) DEFAULT '' COMMENT '拼团活动标题',
  `team_type` tinyint(1) DEFAULT '0' COMMENT '拼团活动类型,0分享团1佣金团2抽奖团',
  `time_limit` int(11) DEFAULT '0' COMMENT '成团有效期。单位（秒)',
  `team_price` decimal(10,2) DEFAULT '0.00' COMMENT '拼团价',
  `needer` int(10) DEFAULT '2' COMMENT '需要成团人数',
  `goods_name` varchar(255) DEFAULT '' COMMENT '商品名称',
  `goods_id` int(11) DEFAULT '0' COMMENT '商品id',
  `item_id` int(10) DEFAULT '0' COMMENT '商品规格id',
  `bonus` decimal(10,2) DEFAULT '0.00' COMMENT '团长佣金',
  `stock_limit` int(11) DEFAULT '0' COMMENT '抽奖限量',
  `buy_limit` smallint(4) DEFAULT '0' COMMENT '单次团购买限制数0为不限制',
  `sales_sum` int(10) unsigned DEFAULT '0' COMMENT '已拼多少件',
  `virtual_num` int(10) DEFAULT '0' COMMENT '虚拟销售基数',
  `share_title` varchar(100) DEFAULT NULL COMMENT '分享标题',
  `share_desc` varchar(255) DEFAULT NULL COMMENT '分享描述',
  `share_img` varchar(150) DEFAULT NULL COMMENT '分享图片',
  `sort` smallint(4) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `is_recommend` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐',
  `status` tinyint(1) DEFAULT '0' COMMENT '0关闭1正常',
  `is_lottery` tinyint(1) DEFAULT '0' COMMENT '是否已经抽奖.1是，0否',
  PRIMARY KEY (`team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='拼团活动表';

/*Data for the table `gy_team_activity` */

/*Table structure for table `gy_team_follow` */

DROP TABLE IF EXISTS `gy_team_follow`;

CREATE TABLE `gy_team_follow` (
  `follow_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `follow_user_id` int(11) DEFAULT '0' COMMENT '参团会员id',
  `follow_user_nickname` varchar(100) DEFAULT NULL COMMENT '参团会员昵称',
  `follow_user_head_pic` varchar(255) DEFAULT NULL COMMENT '会员头像',
  `follow_time` int(11) DEFAULT '0' COMMENT '参团时间',
  `order_id` int(11) DEFAULT '0' COMMENT '订单id',
  `found_id` int(10) DEFAULT '0' COMMENT '开团ID',
  `found_user_id` int(11) DEFAULT '0' COMMENT '开团人user_id',
  `team_id` int(10) DEFAULT '0' COMMENT '拼团活动id',
  `status` tinyint(1) DEFAULT '0' COMMENT '参团状态0:待拼单(表示已下单但是未支付)1拼单成功(已支付)2成团成功3成团失败',
  `is_win` tinyint(1) DEFAULT '0' COMMENT '抽奖团是否中奖',
  PRIMARY KEY (`follow_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='参团表';

/*Data for the table `gy_team_follow` */

/*Table structure for table `gy_team_found` */

DROP TABLE IF EXISTS `gy_team_found`;

CREATE TABLE `gy_team_found` (
  `found_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `found_time` int(11) DEFAULT '0' COMMENT '开团时间',
  `found_end_time` int(11) DEFAULT '0' COMMENT '成团截止时间',
  `user_id` int(11) DEFAULT '0' COMMENT '团长id',
  `team_id` int(10) DEFAULT '0' COMMENT '拼团活动id',
  `nickname` varchar(100) DEFAULT NULL COMMENT '团长用户名昵称',
  `head_pic` varchar(255) DEFAULT '' COMMENT '团长头像',
  `order_id` int(11) DEFAULT '0' COMMENT '团长订单id',
  `join` int(8) DEFAULT '1' COMMENT '已参团人数',
  `need` int(8) DEFAULT '1' COMMENT '需多少人成团',
  `price` decimal(10,2) DEFAULT '0.00' COMMENT '拼团价格',
  `goods_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品原价',
  `status` tinyint(1) DEFAULT '0' COMMENT '拼团状态0:待开团(表示已下单但是未支付)1:已经开团(团长已支付)2:拼团成功,3拼团失败',
  `bonus_status` tinyint(1) DEFAULT '0' COMMENT '团长佣金领取状态：0无1领取',
  PRIMARY KEY (`found_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='开团表';

/*Data for the table `gy_team_found` */

/*Table structure for table `gy_team_lottery` */

DROP TABLE IF EXISTS `gy_team_lottery`;

CREATE TABLE `gy_team_lottery` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT '0' COMMENT '幸运儿手机',
  `order_id` int(11) DEFAULT '0' COMMENT '订单id',
  `order_sn` varchar(50) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT '' COMMENT '幸运儿手机',
  `team_id` int(11) DEFAULT '0' COMMENT '拼团活动ID',
  `nickname` varchar(100) DEFAULT '' COMMENT '会员昵称',
  `head_pic` varchar(150) DEFAULT '' COMMENT '幸运儿头像',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `gy_team_lottery` */

/*Table structure for table `gy_topic` */

DROP TABLE IF EXISTS `gy_topic`;

CREATE TABLE `gy_topic` (
  `topic_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `topic_title` varchar(100) DEFAULT NULL COMMENT '专题标题',
  `topic_image` varchar(100) DEFAULT NULL COMMENT '专题封面',
  `topic_background_color` varchar(20) DEFAULT NULL COMMENT '专题背景颜色',
  `topic_background` varchar(100) DEFAULT NULL COMMENT '专题背景图',
  `topic_content` text COMMENT '专题详情',
  `topic_repeat` varchar(20) DEFAULT '' COMMENT '背景重复方式',
  `topic_state` tinyint(1) DEFAULT '1' COMMENT '专题状态1-草稿、2-已发布',
  `topic_margin_top` tinyint(3) DEFAULT '0' COMMENT '正文距顶部距离',
  `ctime` int(11) DEFAULT NULL COMMENT '专题创建时间',
  PRIMARY KEY (`topic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `gy_topic` */

/*Table structure for table `gy_user_address` */

DROP TABLE IF EXISTS `gy_user_address`;

CREATE TABLE `gy_user_address` (
  `address_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `consignee` varchar(60) NOT NULL DEFAULT '' COMMENT '收货人',
  `email` varchar(60) NOT NULL DEFAULT '' COMMENT '邮箱地址',
  `country` int(11) NOT NULL DEFAULT '0' COMMENT '国家',
  `province` int(11) NOT NULL DEFAULT '0' COMMENT '省份',
  `city` int(11) NOT NULL DEFAULT '0' COMMENT '城市',
  `district` int(11) NOT NULL DEFAULT '0' COMMENT '地区',
  `twon` int(11) DEFAULT '0' COMMENT '乡镇',
  `address` varchar(120) NOT NULL DEFAULT '' COMMENT '地址',
  `zipcode` varchar(60) NOT NULL DEFAULT '' COMMENT '邮政编码',
  `mobile` varchar(60) NOT NULL DEFAULT '' COMMENT '手机',
  `is_default` tinyint(1) DEFAULT '0' COMMENT '默认收货地址',
  `longitude` decimal(10,7) NOT NULL DEFAULT '0.0000000' COMMENT '地址经度',
  `latitude` decimal(10,7) NOT NULL DEFAULT '0.0000000' COMMENT '地址纬度',
  PRIMARY KEY (`address_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `gy_user_address` */

insert  into `gy_user_address`(`address_id`,`user_id`,`consignee`,`email`,`country`,`province`,`city`,`district`,`twon`,`address`,`zipcode`,`mobile`,`is_default`,`longitude`,`latitude`) values (1,1,'邵先生','',0,10808,10809,10903,10904,'网络小镇','','18761659049',1,'118.8371680','31.9587160'),(2,1,'王老师','',0,1,2,3,10,'朝阳街988号','0101111011','18776567892',0,'116.4369030','39.9266890'),(3,2,'孙俊','',0,10543,10544,10545,10546,'新窑路','','15150670962',0,'121.4751490','31.2354890'),(4,3,'钱韦','',0,10808,10809,10876,10880,'和燕路4403号','','18761640729',0,'118.8267620','32.1425860');

/*Table structure for table `gy_user_collection` */

DROP TABLE IF EXISTS `gy_user_collection`;

CREATE TABLE `gy_user_collection` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户下载收集表',
  `mobile` varchar(11) DEFAULT '' COMMENT '用户手机号',
  `contact` varchar(32) DEFAULT '' COMMENT '联系人',
  `why_down` varchar(32) DEFAULT '' COMMENT '下载原因',
  `add_time` int(11) DEFAULT '0' COMMENT '申请时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `gy_user_collection` */

/*Table structure for table `gy_user_distribution` */

DROP TABLE IF EXISTS `gy_user_distribution`;

CREATE TABLE `gy_user_distribution` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '分销会员id',
  `user_name` varchar(50) DEFAULT NULL COMMENT '会员昵称',
  `goods_id` int(11) DEFAULT NULL COMMENT '商品id',
  `goods_name` varchar(150) DEFAULT NULL COMMENT '商品名称',
  `cat_id` smallint(6) DEFAULT '0' COMMENT '商品分类ID',
  `brand_id` mediumint(8) DEFAULT '0' COMMENT '商品品牌',
  `share_num` int(10) DEFAULT '0' COMMENT '分享次数',
  `sales_num` int(11) DEFAULT '0' COMMENT '分销销量',
  `addtime` int(11) DEFAULT NULL COMMENT '加入个人分销库时间',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户选择分销商品表';

/*Data for the table `gy_user_distribution` */

/*Table structure for table `gy_user_extend` */

DROP TABLE IF EXISTS `gy_user_extend`;

CREATE TABLE `gy_user_extend` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned DEFAULT '0',
  `invoice_title` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '发票抬头',
  `taxpayer` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '纳税人识别号',
  `invoice_desc` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '不开发票/明细',
  `realname` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '真实姓名',
  `idcard` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '身份证号',
  `cash_alipay` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT '提现支付宝号',
  `cash_unionpay` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT '提现银行卡号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `gy_user_extend` */

insert  into `gy_user_extend`(`id`,`user_id`,`invoice_title`,`taxpayer`,`invoice_desc`,`realname`,`idcard`,`cash_alipay`,`cash_unionpay`) values (1,1,'个人','','不开发票',NULL,NULL,'',''),(2,2,'个人','','明细',NULL,NULL,'','');

/*Table structure for table `gy_user_level` */

DROP TABLE IF EXISTS `gy_user_level`;

CREATE TABLE `gy_user_level` (
  `level_id` smallint(4) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `level_name` varchar(30) DEFAULT NULL COMMENT '头衔名称',
  `amount` decimal(10,2) DEFAULT NULL COMMENT '等级必要金额',
  `discount` smallint(4) DEFAULT '0' COMMENT '折扣',
  `describe` varchar(200) DEFAULT NULL COMMENT '头街 描述',
  PRIMARY KEY (`level_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `gy_user_level` */

/*Table structure for table `gy_user_message` */

DROP TABLE IF EXISTS `gy_user_message`;

CREATE TABLE `gy_user_message` (
  `rec_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `message_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '消息id',
  `category` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '系统消息0，活动消息',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '查看状态：0未查看，1已查看',
  PRIMARY KEY (`rec_id`),
  KEY `user_id` (`user_id`),
  KEY `message_id` (`message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `gy_user_message` */

/*Table structure for table `gy_user_msg_tpl` */

DROP TABLE IF EXISTS `gy_user_msg_tpl`;

CREATE TABLE `gy_user_msg_tpl` (
  `mmt_code` varchar(50) NOT NULL COMMENT '用户消息模板编号',
  `mmt_name` varchar(50) NOT NULL COMMENT '模板名称',
  `mmt_message_switch` tinyint(3) unsigned NOT NULL COMMENT '站内信接收开关',
  `mmt_message_content` varchar(255) NOT NULL COMMENT '站内信消息内容',
  `mmt_short_switch` tinyint(3) unsigned NOT NULL COMMENT '短信接收开关',
  `mmt_short_content` varchar(255) NOT NULL COMMENT '短信接收内容',
  `mmt_mail_switch` tinyint(3) unsigned NOT NULL COMMENT '邮件接收开关',
  `mmt_mail_subject` varchar(255) NOT NULL COMMENT '邮件标题',
  `mmt_mail_content` text NOT NULL COMMENT '邮件内容',
  PRIMARY KEY (`mmt_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户消息模板';

/*Data for the table `gy_user_msg_tpl` */

/*Table structure for table `gy_user_sign` */

DROP TABLE IF EXISTS `gy_user_sign`;

CREATE TABLE `gy_user_sign` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT '0' COMMENT '用户id',
  `sign_total` int(11) DEFAULT '0' COMMENT '累计签到天数',
  `sign_count` int(11) DEFAULT '0' COMMENT '连续签到天数',
  `sign_last` char(11) DEFAULT '0' COMMENT '最后签到时间，时间格式20170907',
  `sign_time` text CHARACTER SET utf8 COMMENT '历史签到时间，以逗号隔开',
  `cumtrapz` int(11) DEFAULT '0' COMMENT '用户累计签到总积分',
  `this_month` int(6) DEFAULT NULL COMMENT '本月累计积分',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `gy_user_sign` */

/*Table structure for table `gy_user_store` */

DROP TABLE IF EXISTS `gy_user_store`;

CREATE TABLE `gy_user_store` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `store_name` varchar(50) DEFAULT NULL COMMENT '店铺名',
  `true_name` varchar(50) DEFAULT NULL COMMENT '真名',
  `qq` varchar(20) NOT NULL DEFAULT '' COMMENT 'QQ',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号码',
  `store_img` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺图片',
  `store_time` int(10) unsigned NOT NULL COMMENT '开店时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `mobile` (`mobile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户店铺信息表';

/*Data for the table `gy_user_store` */

/*Table structure for table `gy_users` */

DROP TABLE IF EXISTS `gy_users`;

CREATE TABLE `gy_users` (
  `user_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `email` varchar(60) NOT NULL DEFAULT '' COMMENT '邮件',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `paypwd` varchar(32) DEFAULT NULL COMMENT '支付密码',
  `sex` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0 保密 1 男 2 女',
  `birthday` int(11) NOT NULL DEFAULT '0' COMMENT '生日',
  `user_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '用户金额',
  `frozen_money` decimal(10,2) DEFAULT '0.00' COMMENT '冻结金额',
  `distribut_money` decimal(10,2) DEFAULT '0.00' COMMENT '累积分佣金额',
  `underling_number` int(5) DEFAULT '0' COMMENT '用户下线总数',
  `pay_points` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '消费积分',
  `address_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '默认收货地址',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_login` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_ip` varchar(15) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `qq` varchar(20) NOT NULL DEFAULT '' COMMENT 'QQ',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号码',
  `mobile_validated` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否验证手机',
  `oauth` varchar(10) DEFAULT '' COMMENT '第三方来源 wx weibo alipay',
  `openid` varchar(100) DEFAULT NULL COMMENT '第三方唯一标示',
  `unionid` varchar(100) DEFAULT NULL,
  `head_pic` varchar(255) DEFAULT NULL COMMENT '头像',
  `province` int(6) DEFAULT '0' COMMENT '省份',
  `city` int(6) DEFAULT '0' COMMENT '市区',
  `district` int(6) DEFAULT '0' COMMENT '县',
  `email_validated` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否验证电子邮箱',
  `nickname` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '第三方返回昵称',
  `level` tinyint(1) DEFAULT '1' COMMENT '会员等级',
  `discount` decimal(10,2) DEFAULT '1.00' COMMENT '会员折扣，默认1不享受',
  `total_amount` decimal(10,2) DEFAULT '0.00' COMMENT '消费累计额度',
  `is_lock` tinyint(1) DEFAULT '0' COMMENT '是否被锁定冻结',
  `is_distribut` tinyint(1) DEFAULT '0' COMMENT '是否为分销商 0 否 1 是',
  `first_leader` int(11) DEFAULT '0' COMMENT '第一个上级',
  `second_leader` int(11) DEFAULT '0' COMMENT '第二个上级',
  `third_leader` int(11) DEFAULT '0' COMMENT '第三个上级',
  `token` varchar(64) DEFAULT '' COMMENT '用于app 授权类似于session_id',
  `message_mask` tinyint(1) NOT NULL DEFAULT '63' COMMENT '消息掩码',
  `push_id` varchar(30) NOT NULL DEFAULT '' COMMENT '推送id',
  `distribut_level` tinyint(2) DEFAULT '0' COMMENT '分销商等级',
  `is_vip` tinyint(1) DEFAULT '0' COMMENT '是否为VIP ：0不是，1是',
  PRIMARY KEY (`user_id`),
  KEY `email` (`email`),
  KEY `underling_number` (`underling_number`),
  KEY `mobile` (`mobile_validated`),
  KEY `openid` (`openid`),
  KEY `unionid` (`unionid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `gy_users` */

insert  into `gy_users`(`user_id`,`email`,`password`,`paypwd`,`sex`,`birthday`,`user_money`,`frozen_money`,`distribut_money`,`underling_number`,`pay_points`,`address_id`,`reg_time`,`last_login`,`last_ip`,`qq`,`mobile`,`mobile_validated`,`oauth`,`openid`,`unionid`,`head_pic`,`province`,`city`,`district`,`email_validated`,`nickname`,`level`,`discount`,`total_amount`,`is_lock`,`is_distribut`,`first_leader`,`second_leader`,`third_leader`,`token`,`message_mask`,`push_id`,`distribut_level`,`is_vip`) values (1,'','94bfb154d8600ec625a531b123283d09',NULL,0,0,'0.00','0.00','0.00',0,235,0,1534428640,1550051317,'','','18761659049',1,'',NULL,NULL,'/public/images/icon_goods_thumb_empty_300.png',0,0,0,0,'18761659049',1,'1.00','0.00',0,1,0,0,0,'b9022f0b98c15d3300fb467bc91dc225',63,'0',0,0),(2,'','1ca85a4b951847478a266c30b53d29fc',NULL,0,0,'0.00','0.00','0.00',0,110,0,1536222453,1542162990,'','','15150670964',1,'',NULL,NULL,'/public/images/icon_goods_thumb_empty_300.png',0,0,0,0,'15150670964',1,'1.00','0.00',0,1,0,0,0,'0f66ce0bbbd9d73409d77434dad02220',63,'0',0,0),(3,'','d49e569d496d81b2e2ca250d08debe0f',NULL,0,0,'0.00','0.00','0.00',0,20,0,1543058577,1543058577,'','','18761640729',1,'',NULL,NULL,'',0,0,0,0,'18761640729',1,'1.00','0.00',0,1,0,0,0,'6073c97bc2097cbcdd17f77951cd9b82',63,'0',0,0);

/*Table structure for table `gy_virtual_shop` */

DROP TABLE IF EXISTS `gy_virtual_shop`;

CREATE TABLE `gy_virtual_shop` (
  `user_id` int(11) DEFAULT NULL,
  `shop_name` varchar(100) DEFAULT NULL COMMENT '店铺名称',
  `shop_level` tinyint(1) DEFAULT '0' COMMENT '店铺等级',
  `shop_intro` text COMMENT '店铺介绍',
  `shop_logo` varchar(255) DEFAULT NULL COMMENT '店铺logo',
  `shop_phone` varchar(20) DEFAULT NULL,
  `shop_qq` varchar(20) DEFAULT NULL,
  `shop_theme` tinyint(1) DEFAULT '0' COMMENT '店铺模板风格'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分销商虚拟店铺表';

/*Data for the table `gy_virtual_shop` */

/*Table structure for table `gy_vr_order_code` */

DROP TABLE IF EXISTS `gy_vr_order_code`;

CREATE TABLE `gy_vr_order_code` (
  `rec_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '兑换码表索引id',
  `order_id` int(11) NOT NULL COMMENT '虚拟订单id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '买家ID',
  `vr_code` varchar(18) NOT NULL DEFAULT '' COMMENT '兑换码',
  `vr_state` tinyint(4) NOT NULL DEFAULT '0' COMMENT '使用状态 0:(默认)未使用1:已使用2:已过期',
  `vr_usetime` int(11) NOT NULL DEFAULT '0' COMMENT '使用时间',
  `pay_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '实际支付金额(结算)',
  `vr_indate` int(11) NOT NULL DEFAULT '0' COMMENT '过期时间',
  `refund_lock` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '退款锁定状态:0为正常,1为锁定,2为同意,默认为0',
  `vr_invalid_refund` tinyint(4) NOT NULL DEFAULT '1' COMMENT '允许过期退款1是0否',
  PRIMARY KEY (`rec_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='兑换码表';

/*Data for the table `gy_vr_order_code` */

/*Table structure for table `gy_withdrawals` */

DROP TABLE IF EXISTS `gy_withdrawals`;

CREATE TABLE `gy_withdrawals` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '提现申请表',
  `user_id` int(11) DEFAULT '0' COMMENT '用户id',
  `money` decimal(10,2) DEFAULT '0.00' COMMENT '提现金额',
  `create_time` int(11) DEFAULT '0' COMMENT '申请时间',
  `check_time` int(11) DEFAULT '0' COMMENT '审核时间',
  `pay_time` int(11) DEFAULT '0' COMMENT '支付时间',
  `refuse_time` int(11) DEFAULT '0' COMMENT '拒绝时间',
  `bank_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '银行名称 如支付宝 微信 中国银行 农业银行等',
  `bank_card` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '银行账号或支付宝账号',
  `realname` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '提款账号真实姓名',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '提现备注',
  `taxfee` decimal(10,2) DEFAULT '0.00' COMMENT '税收手续费',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态：-2删除作废-1审核失败0申请中1审核通过2付款成功3付款失败',
  `pay_code` varchar(100) DEFAULT NULL COMMENT '付款对账流水号',
  `error_code` varchar(255) DEFAULT NULL COMMENT '付款失败错误代码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `gy_withdrawals` */

/*Table structure for table `gy_wx_img` */

DROP TABLE IF EXISTS `gy_wx_img`;

CREATE TABLE `gy_wx_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表id',
  `keyword` char(255) NOT NULL COMMENT '关键词',
  `desc` text NOT NULL COMMENT '简介',
  `pic` char(255) NOT NULL COMMENT '封面图片',
  `url` char(255) NOT NULL COMMENT '图文外链地址',
  `createtime` varchar(13) NOT NULL COMMENT '创建时间',
  `uptatetime` varchar(13) NOT NULL COMMENT '更新时间',
  `token` char(30) NOT NULL COMMENT 'token',
  `title` varchar(60) NOT NULL COMMENT '标题',
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品id',
  `goods_name` varchar(50) DEFAULT NULL COMMENT '商品名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信图文';

/*Data for the table `gy_wx_img` */

/*Table structure for table `gy_wx_keyword` */

DROP TABLE IF EXISTS `gy_wx_keyword`;

CREATE TABLE `gy_wx_keyword` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '微信关键词表',
  `keyword` char(255) NOT NULL,
  `pid` int(11) NOT NULL COMMENT '对应表ID，如wx_reply的id',
  `type` varchar(30) NOT NULL COMMENT '关键词操作类型 auto_reply',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `gy_wx_keyword` */

/*Table structure for table `gy_wx_material` */

DROP TABLE IF EXISTS `gy_wx_material`;

CREATE TABLE `gy_wx_material` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '微信公众号素材',
  `media_id` varchar(64) DEFAULT '' COMMENT '微信媒体id',
  `type` varchar(10) NOT NULL COMMENT '素材类型：text、image、news、video',
  `data` text COMMENT 'json数据',
  `update_time` int(10) unsigned DEFAULT NULL COMMENT '更新时间',
  `key` char(32) DEFAULT NULL COMMENT '便于查询的key，现用于image',
  PRIMARY KEY (`id`),
  KEY `media_id` (`media_id`),
  KEY `key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `gy_wx_material` */

/*Table structure for table `gy_wx_menu` */

DROP TABLE IF EXISTS `gy_wx_menu`;

CREATE TABLE `gy_wx_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level` tinyint(1) DEFAULT '1' COMMENT '菜单级别',
  `name` varchar(50) NOT NULL DEFAULT '',
  `sort` int(5) DEFAULT '0' COMMENT '排序',
  `type` varchar(20) DEFAULT '' COMMENT '0 view 1 click',
  `value` varchar(255) DEFAULT NULL,
  `token` varchar(50) NOT NULL DEFAULT '',
  `pid` int(11) DEFAULT '0' COMMENT '上级菜单',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `gy_wx_menu` */

/*Table structure for table `gy_wx_msg` */

DROP TABLE IF EXISTS `gy_wx_msg`;

CREATE TABLE `gy_wx_msg` (
  `msgid` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NOT NULL COMMENT '系统用户ID',
  `titile` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `createtime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `sendtime` int(11) NOT NULL DEFAULT '0' COMMENT '发送时间',
  `issend` tinyint(1) DEFAULT '0' COMMENT '0未发送1成功2失败',
  `sendtype` tinyint(1) DEFAULT '1' COMMENT '0单人1所有',
  PRIMARY KEY (`msgid`),
  KEY `uid` (`admin_id`),
  KEY `createymd` (`sendtime`),
  KEY `fake_id` (`titile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `gy_wx_msg` */

/*Table structure for table `gy_wx_news` */

DROP TABLE IF EXISTS `gy_wx_news`;

CREATE TABLE `gy_wx_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '图文子素材id',
  `update_time` int(10) unsigned DEFAULT NULL COMMENT '更新时间',
  `title` varchar(64) DEFAULT '' COMMENT '标题',
  `material_id` int(10) unsigned DEFAULT NULL COMMENT '图片素材id，一个图片为素材可包括几个子图文',
  `author` varchar(8) DEFAULT '' COMMENT '作者',
  `content` text COMMENT 'html内容',
  `digest` varchar(120) DEFAULT '' COMMENT '摘要',
  `thumb_url` text COMMENT '封面链接',
  `thumb_media_id` varchar(64) DEFAULT '' COMMENT '封面媒体id',
  `content_source_url` text COMMENT '原文链接',
  `show_cover_pic` int(1) DEFAULT '0' COMMENT '是否显示封面',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信图文';

/*Data for the table `gy_wx_news` */

/*Table structure for table `gy_wx_reply` */

DROP TABLE IF EXISTS `gy_wx_reply`;

CREATE TABLE `gy_wx_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '微信关键词回复表',
  `rule` varchar(32) DEFAULT NULL COMMENT '规则名',
  `update_time` int(10) unsigned DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL COMMENT '回复类型keyword,default,follow',
  `msg_type` varchar(10) DEFAULT NULL COMMENT '回复消息类型text,news',
  `data` text COMMENT 'text使用该自动存储文本',
  `material_id` int(10) unsigned DEFAULT NULL COMMENT 'news、image的素材id等',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `gy_wx_reply` */

/*Table structure for table `gy_wx_text` */

DROP TABLE IF EXISTS `gy_wx_text`;

CREATE TABLE `gy_wx_text` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表id',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `uname` varchar(90) NOT NULL COMMENT '用户名',
  `keyword` char(255) NOT NULL COMMENT '关键词',
  `precisions` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'precisions',
  `text` text NOT NULL COMMENT 'text',
  `createtime` varchar(13) NOT NULL COMMENT '创建时间',
  `updatetime` varchar(13) NOT NULL COMMENT '更新时间',
  `click` int(11) NOT NULL COMMENT '点击',
  `token` char(30) NOT NULL COMMENT 'token',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文本回复表';

/*Data for the table `gy_wx_text` */

/*Table structure for table `gy_wx_tpl_msg` */

DROP TABLE IF EXISTS `gy_wx_tpl_msg`;

CREATE TABLE `gy_wx_tpl_msg` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '微信模板消息',
  `title` varchar(32) CHARACTER SET gbk DEFAULT '' COMMENT '模板标题',
  `template_sn` varchar(64) CHARACTER SET gbk DEFAULT '' COMMENT '模板编号',
  `template_id` varchar(64) CHARACTER SET gbk DEFAULT '' COMMENT '模板id',
  `remark` varchar(255) CHARACTER SET gbk DEFAULT '' COMMENT '留言',
  `is_use` tinyint(1) DEFAULT '0' COMMENT '该模板是否启用',
  `add_time` int(10) unsigned DEFAULT NULL COMMENT '添加模板的时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `gy_wx_tpl_msg` */

/*Table structure for table `gy_wx_user` */

DROP TABLE IF EXISTS `gy_wx_user`;

CREATE TABLE `gy_wx_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表id',
  `uid` int(11) NOT NULL COMMENT 'uid',
  `wxname` varchar(60) NOT NULL DEFAULT '' COMMENT '公众号名称',
  `aeskey` varchar(256) NOT NULL DEFAULT '' COMMENT 'aeskey',
  `encode` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'encode',
  `appid` varchar(50) NOT NULL DEFAULT '' COMMENT 'appid',
  `appsecret` varchar(50) NOT NULL DEFAULT '' COMMENT 'appsecret',
  `wxid` varchar(64) NOT NULL DEFAULT '' COMMENT '公众号原始ID',
  `weixin` char(64) NOT NULL COMMENT '微信号',
  `headerpic` char(255) NOT NULL COMMENT '头像地址',
  `token` char(255) NOT NULL COMMENT 'token',
  `w_token` varchar(150) NOT NULL DEFAULT '' COMMENT '微信对接token',
  `create_time` int(11) NOT NULL COMMENT 'create_time',
  `updatetime` int(11) NOT NULL COMMENT 'updatetime',
  `tplcontentid` varchar(2) NOT NULL DEFAULT '' COMMENT '内容模版ID',
  `share_ticket` varchar(150) NOT NULL DEFAULT '' COMMENT '分享ticket',
  `share_dated` char(15) NOT NULL COMMENT 'share_dated',
  `authorizer_access_token` varchar(200) NOT NULL DEFAULT '' COMMENT 'authorizer_access_token',
  `authorizer_refresh_token` varchar(200) NOT NULL DEFAULT '' COMMENT 'authorizer_refresh_token',
  `authorizer_expires` char(10) NOT NULL COMMENT 'authorizer_expires',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '类型',
  `web_access_token` varchar(200) DEFAULT '' COMMENT ' 网页授权token',
  `web_refresh_token` varchar(200) DEFAULT '' COMMENT 'web_refresh_token',
  `web_expires` int(11) NOT NULL COMMENT '过期时间',
  `qr` varchar(200) NOT NULL DEFAULT '' COMMENT 'qr',
  `menu_config` text COMMENT '菜单',
  `wait_access` tinyint(1) DEFAULT '0' COMMENT '微信接入状态,0待接入1已接入',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`) USING BTREE,
  KEY `uid_2` (`uid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COMMENT='微信公共帐号';

/*Data for the table `gy_wx_user` */

insert  into `gy_wx_user`(`id`,`uid`,`wxname`,`aeskey`,`encode`,`appid`,`appsecret`,`wxid`,`weixin`,`headerpic`,`token`,`w_token`,`create_time`,`updatetime`,`tplcontentid`,`share_ticket`,`share_dated`,`authorizer_access_token`,`authorizer_refresh_token`,`authorizer_expires`,`type`,`web_access_token`,`web_refresh_token`,`web_expires`,`qr`,`menu_config`,`wait_access`) values (31,0,'搜豹网络科技','',0,'wxdc25f2bdbd6b911d','ef4688d7161cfe329bfbb8a3b7b3bdb7','gh_e29462503ebe','ThinkphpShop','/public/upload/weixin/2018/04-27/df678dc5faa6cfc99989ea734694259d.jpg','xkopzw1490691329','soubao123456',1490691329,0,'','','','','','',1,'9_ztdL3qhqHHAgFTIANDMStPvneUubYL0sANeFHEYDXu_qzElDwaQeSNwwhi1EfpDXzFwOeP05e0wMRpsJvQVVjnmhiWtZIqOwj4RwIdhXQnB1WPP0yw4pv8x2c_NA2ykcPKD-V6aTa3mFDKO9YJSaAAALWF','',1524884051,'/public/upload/weixin/2018/04-27/76091e055bbf23d4a6a76fddf152fd92.png',NULL,1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;