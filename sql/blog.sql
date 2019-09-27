/*
SQLyog Ultimate v12.5.0 (64 bit)
MySQL - 5.7.25 : Database - ry
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ry` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `ry`;

/*Table structure for table `blog_article` */

DROP TABLE IF EXISTS `blog_article`;

CREATE TABLE `blog_article` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `deleteTime` datetime DEFAULT NULL COMMENT '删除时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0：删除 1：存在',
  `userId` bigint(20) NOT NULL COMMENT '作者',
  `title` varchar(200) DEFAULT NULL COMMENT '标题',
  `description` varchar(200) DEFAULT NULL COMMENT '描述',
  `content` text COMMENT '正文',
  `img` varchar(500) DEFAULT NULL COMMENT '文章首图',
  `classifyId` bigint(20) NOT NULL COMMENT '分类id',
  `tagIds` varchar(100) DEFAULT NULL COMMENT '标签id',
  `tags` varchar(200) DEFAULT NULL COMMENT '标签',
  `clickCount` int(11) DEFAULT '0' COMMENT '点击数',
  `likeCount` int(11) DEFAULT '0' COMMENT '喜欢数',
  `viewCount` int(11) DEFAULT '0' COMMENT '浏览数',
  `commentCount` int(11) DEFAULT '0' COMMENT '评论数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='博客文章表';

/*Data for the table `blog_article` */

LOCK TABLES `blog_article` WRITE;

insert  into `blog_article`(`id`,`createTime`,`deleteTime`,`status`,`userId`,`title`,`description`,`content`,`img`,`classifyId`,`tagIds`,`tags`,`clickCount`,`likeCount`,`viewCount`,`commentCount`) values 
(4,'2019-09-23 23:24:30',NULL,1,1,'test','1','# 你好，这是一篇测试文章\n![](http://localhost/profile/blog/2019/09/23/80b63404dcbb8d49279d060841307b57.PNG)\n![](http://localhost/profile/blog/2019/09/23/379a28ca7c15f6ae39e9040dd8ef207c.PNG)','http://localhost/profile/blog/2019/09/23/062c899ea7829cc4adc004820811fecd.PNG',1,'1',NULL,9,4,12,0),
(5,'2019-09-24 23:49:20',NULL,1,1,'testtags','testtags','ces','http://localhost/profile/blog/2019/09/24/38daa1110fc200cfc90c93884acf62cc.PNG',1,'2','vue',0,25,22,5);

UNLOCK TABLES;

/*Table structure for table `blog_article_comment` */

DROP TABLE IF EXISTS `blog_article_comment`;

CREATE TABLE `blog_article_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `deleteTime` datetime DEFAULT NULL COMMENT '删除时间',
  `status` tinyint(4) DEFAULT '1' COMMENT '0删除  1 存在',
  `userId` bigint(20) DEFAULT NULL COMMENT '用户id',
  `userName` varchar(100) DEFAULT NULL COMMENT '用户名称',
  `content` text COMMENT '内容',
  `articleId` bigint(20) DEFAULT NULL COMMENT '文章id',
  `replyId` bigint(20) DEFAULT NULL COMMENT '回复父id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='文章评论表';

/*Data for the table `blog_article_comment` */

LOCK TABLES `blog_article_comment` WRITE;

insert  into `blog_article_comment`(`id`,`createTime`,`deleteTime`,`status`,`userId`,`userName`,`content`,`articleId`,`replyId`) values 
(1,'2019-09-25 16:25:05',NULL,1,NULL,'soulCoke','提交一个评论',5,NULL),
(2,'2019-09-25 16:29:09',NULL,1,NULL,'ceshiyixia','nihao',5,NULL),
(3,'2019-09-25 16:29:27',NULL,1,NULL,'ceshiyixia','sadsfgsdfgsdf',5,NULL),
(4,'2019-09-25 16:32:23',NULL,1,NULL,NULL,'adfasd',5,NULL),
(5,'2019-09-25 16:32:52',NULL,1,NULL,'asd','dafsfasd',5,NULL);

UNLOCK TABLES;

/*Table structure for table `blog_banner` */

DROP TABLE IF EXISTS `blog_banner`;

CREATE TABLE `blog_banner` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `url` varchar(500) NOT NULL COMMENT '图片地址',
  `description` varchar(100) DEFAULT NULL COMMENT '描述',
  `type` varchar(50) NOT NULL COMMENT '类型：自定义。自己根据用途',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='banner图';

/*Data for the table `blog_banner` */

LOCK TABLES `blog_banner` WRITE;

insert  into `blog_banner`(`id`,`url`,`description`,`type`) values 
(1,'http://localhost/profile/blog/2019/09/26/371a8d090eea9bea0014fb55735c994c.PNG','头部','headnav'),
(2,'http://localhost/profile/blog/2019/09/26/6c7b828bc93c91c80bc45565b17af3a3.PNG','友链','link'),
(3,'http://localhost/profile/blog/2019/09/26/b5745bd0ccff29d85acb1152e2be42c7.PNG','捐赠','donate'),
(4,'http://localhost/profile/blog/2019/09/26/7cb46786180fcbfd05d9e37b8edca3f6.PNG','支付宝收款码','zhifubao'),
(5,'http://localhost/profile/blog/2019/09/26/13b4418fb61c1adea76802b69aca49f4.PNG','微信收款码','weixin'),
(6,'http://localhost/profile/blog/2019/09/26/3d4d77ffff354d3ca9470077b8350e9d.PNG','关于','about'),
(7,'http://localhost/profile/blog/2019/09/27/5d019efb5efde55e1d4875656d7eedfb.PNG','留言','message');

UNLOCK TABLES;

/*Table structure for table `blog_classify` */

DROP TABLE IF EXISTS `blog_classify`;

CREATE TABLE `blog_classify` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `deleteTime` datetime DEFAULT NULL COMMENT '删除时间',
  `status` tinyint(1) DEFAULT NULL COMMENT '0:删除 1：存在',
  `name` varchar(50) NOT NULL COMMENT '分类名称',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='文章分类';

/*Data for the table `blog_classify` */

LOCK TABLES `blog_classify` WRITE;

insert  into `blog_classify`(`id`,`createTime`,`deleteTime`,`status`,`name`) values 
(1,'2019-09-14 18:38:13',NULL,1,'前端'),
(2,'2019-09-14 18:38:27',NULL,1,'后端'),
(3,'2019-09-14 18:51:57',NULL,1,'系统');

UNLOCK TABLES;

/*Table structure for table `blog_link` */

DROP TABLE IF EXISTS `blog_link`;

CREATE TABLE `blog_link` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(200) NOT NULL COMMENT '名称',
  `url` varchar(500) NOT NULL COMMENT '友链地址',
  `avatar` varchar(500) DEFAULT NULL COMMENT '头像地址',
  `introduction` varchar(1000) DEFAULT NULL COMMENT '简介',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='友链';

/*Data for the table `blog_link` */

LOCK TABLES `blog_link` WRITE;

insert  into `blog_link`(`id`,`name`,`url`,`avatar`,`introduction`) values 
(1,'soulCoke','http:www.baidu.com','http://f.youdao.com/?vendor=fanyi-new-bottom','这是一个测试友链');

UNLOCK TABLES;

/*Table structure for table `blog_message` */

DROP TABLE IF EXISTS `blog_message`;

CREATE TABLE `blog_message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `deleteTime` datetime DEFAULT NULL COMMENT '删除时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '0：删除 1：存在',
  `content` text COMMENT '内容',
  `replyId` bigint(20) DEFAULT NULL COMMENT '回复父id',
  `userId` bigint(20) DEFAULT NULL COMMENT '作者',
  `userName` varchar(50) DEFAULT NULL COMMENT '用户名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='留言表';

/*Data for the table `blog_message` */

LOCK TABLES `blog_message` WRITE;

UNLOCK TABLES;

/*Table structure for table `blog_tags` */

DROP TABLE IF EXISTS `blog_tags`;

CREATE TABLE `blog_tags` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `status` tinyint(1) DEFAULT '1' COMMENT '0:删除 1：存在',
  `classifyId` bigint(20) NOT NULL COMMENT '类别id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='标签表';

/*Data for the table `blog_tags` */

LOCK TABLES `blog_tags` WRITE;

insert  into `blog_tags`(`id`,`name`,`status`,`classifyId`) values 
(1,'javascript',1,1),
(2,'vue',1,1);

UNLOCK TABLES;

/*Table structure for table `gen_table` */

DROP TABLE IF EXISTS `gen_table`;

CREATE TABLE `gen_table` (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COMMENT='代码生成业务表';

/*Data for the table `gen_table` */

LOCK TABLES `gen_table` WRITE;

insert  into `gen_table`(`table_id`,`table_name`,`table_comment`,`class_name`,`tpl_category`,`package_name`,`module_name`,`business_name`,`function_name`,`function_author`,`options`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values 
(1,'blog_article','博客文章表','Article','crud','com.ruoyi.project.blog','blog','article','博客文章','ruoyi','{\"treeName\":\"\",\"treeParentCode\":\"\",\"treeCode\":\"\"}','admin','2019-09-13 19:07:09','','2019-09-14 17:51:06',''),
(2,'blog_article_comment','文章评论表','ArticleComment','crud','com.ruoyi.project.blog','blog','comment','文章评论','ruoyi','{\"treeName\":\"\",\"treeParentCode\":\"\",\"treeCode\":\"\"}','admin','2019-09-13 19:07:09','','2019-09-14 17:49:52',''),
(3,'blog_classify','文章分类','Classify','crud','com.ruoyi.project.blog','blog','classify','文章分类','ruoyi','{\"treeName\":\"\",\"treeParentCode\":\"\",\"treeCode\":\"\"}','admin','2019-09-13 19:07:09','','2019-09-14 17:48:22',''),
(4,'blog_message','留言表','Message','crud','com.ruoyi.project.blog','blog','message','留言','ruoyi','{\"treeName\":\"\",\"treeParentCode\":\"\",\"treeCode\":\"\"}','admin','2019-09-13 19:07:09','','2019-09-14 17:49:17',''),
(5,'blog_tags','标签表','Tags','crud','com.ruoyi.project.blog','blog','tags','标签','ruoyi','{\"treeName\":\"\",\"treeParentCode\":\"\",\"treeCode\":\"\"}','admin','2019-09-13 19:07:09','','2019-09-14 17:51:42',''),
(6,'sys_file_info','文件表','FileInfo','crud','com.ruoyi.project.system','system','info','文件','ruoyi','{\"treeName\":\"\",\"treeParentCode\":\"\",\"treeCode\":\"\"}','admin','2019-09-20 23:13:19','','2019-09-20 23:14:31',''),
(7,'blog_banner','banner图','Banner','crud','com.ruoyi.project.blog','blog','banner','banner图','ruoyi','{\"treeName\":\"\",\"treeParentCode\":\"\",\"treeCode\":\"\"}','admin','2019-09-26 00:22:24','','2019-09-26 00:27:19',''),
(8,'blog_link','友链','Link','crud','com.ruoyi.project.blog','blog','link','友链','ruoyi','{\"treeName\":\"\",\"treeParentCode\":\"\",\"treeCode\":\"\"}','admin','2019-09-26 00:22:24','','2019-09-26 00:27:35','');

UNLOCK TABLES;

/*Table structure for table `gen_table_column` */

DROP TABLE IF EXISTS `gen_table_column`;

CREATE TABLE `gen_table_column` (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COMMENT='代码生成业务表字段';

/*Data for the table `gen_table_column` */

LOCK TABLES `gen_table_column` WRITE;

insert  into `gen_table_column`(`column_id`,`table_id`,`column_name`,`column_comment`,`column_type`,`java_type`,`java_field`,`is_pk`,`is_increment`,`is_required`,`is_insert`,`is_edit`,`is_list`,`is_query`,`query_type`,`html_type`,`dict_type`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`) values 
(1,'1','id','主键','bigint(20)','Long','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2019-09-13 19:07:09',NULL,'2019-09-14 17:51:06'),
(2,'1','createTime','创建时间','datetime','Date','createTime','0','0',NULL,NULL,NULL,'1','1','EQ','datetime','',2,'admin','2019-09-13 19:07:09',NULL,'2019-09-14 17:51:06'),
(3,'1','deleteTime','删除时间','datetime','Date','deleteTime','0','0',NULL,NULL,NULL,NULL,NULL,'EQ','datetime','',3,'admin','2019-09-13 19:07:09',NULL,'2019-09-14 17:51:06'),
(4,'1','status','0：删除 1：存在','tinyint(1)','Integer','status','0','0','1',NULL,'1',NULL,NULL,'EQ','radio','',4,'admin','2019-09-13 19:07:09',NULL,'2019-09-14 17:51:06'),
(5,'1','userId','作者','bigint(20)','Long','userId','0','0','1','1',NULL,NULL,NULL,'EQ','input','',5,'admin','2019-09-13 19:07:09',NULL,'2019-09-14 17:51:06'),
(6,'1','title','标题','varchar(200)','String','title','0','0','1','1','1','1','1','EQ','input','',6,'admin','2019-09-13 19:07:09',NULL,'2019-09-14 17:51:06'),
(7,'1','description','描述','varchar(200)','String','description','0','0','1','1','1','1',NULL,'EQ','input','',7,'admin','2019-09-13 19:07:09',NULL,'2019-09-14 17:51:06'),
(8,'1','content','正文','text','String','content','0','0','1','1','1','1',NULL,'EQ','input','',8,'admin','2019-09-13 19:07:09',NULL,'2019-09-14 17:51:06'),
(9,'1','img','文章首图','varchar(500)','String','img','0','0','1','1','1','1',NULL,'EQ','textarea','',9,'admin','2019-09-13 19:07:09',NULL,'2019-09-14 17:51:06'),
(10,'1','classifyId','分类id','bigint(20)','Long','classifyId','0','0','1','1','1',NULL,'1','EQ','select','',10,'admin','2019-09-13 19:07:09',NULL,'2019-09-14 17:51:06'),
(11,'1','clickCount','点击数','int(11)','Long','clickCount','0','0',NULL,NULL,NULL,'1',NULL,'EQ','input','',11,'admin','2019-09-13 19:07:09',NULL,'2019-09-14 17:51:06'),
(12,'1','likeCount','喜欢数','int(11)','Long','likeCount','0','0',NULL,NULL,NULL,'1',NULL,'EQ','input','',12,'admin','2019-09-13 19:07:09',NULL,'2019-09-14 17:51:06'),
(13,'1','viewCount','浏览数','int(11)','Long','viewCount','0','0',NULL,NULL,NULL,'1',NULL,'EQ','input','',13,'admin','2019-09-13 19:07:09',NULL,'2019-09-14 17:51:06'),
(14,'1','tagIds','标签id','varchar(100)','String','tagIds','0','0','1','1','1',NULL,'1','EQ','select','',14,'admin','2019-09-13 19:07:09',NULL,'2019-09-14 17:51:06'),
(15,'1','commentCount','评论数','int(11)','Long','commentCount','0','0',NULL,NULL,NULL,'1',NULL,'EQ','input','',15,'admin','2019-09-13 19:07:09',NULL,'2019-09-14 17:51:06'),
(16,'2','id','主键','bigint(20)','Long','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2019-09-13 19:07:09',NULL,'2019-09-14 17:49:52'),
(17,'2','createTime','创建时间','datetime','Date','createTime','0','0',NULL,NULL,NULL,'1','1','EQ','datetime','',2,'admin','2019-09-13 19:07:09',NULL,'2019-09-14 17:49:52'),
(18,'2','deleteTime','删除时间','datetime','Date','deleteTime','0','0',NULL,NULL,NULL,NULL,NULL,'EQ','datetime','',3,'admin','2019-09-13 19:07:09',NULL,'2019-09-14 17:49:52'),
(19,'2','status','0删除 1 存在','tinyint(4)','Integer','status','0','0',NULL,NULL,'1',NULL,NULL,'EQ','radio','',4,'admin','2019-09-13 19:07:09',NULL,'2019-09-14 17:49:52'),
(20,'2','userId','用户id','bigint(20)','Long','userId','0','0',NULL,NULL,NULL,NULL,NULL,'EQ','input','',5,'admin','2019-09-13 19:07:09',NULL,'2019-09-14 17:49:52'),
(21,'2','content','内容','text','String','content','0','0',NULL,NULL,NULL,'1',NULL,'EQ','input','',6,'admin','2019-09-13 19:07:09',NULL,'2019-09-14 17:49:52'),
(22,'2','articleId','文章id','bigint(20)','Long','articleId','0','0',NULL,NULL,NULL,NULL,NULL,'EQ','input','',7,'admin','2019-09-13 19:07:09',NULL,'2019-09-14 17:49:52'),
(23,'2','replyId','回复父id','bigint(20)','Long','replyId','0','0',NULL,NULL,NULL,NULL,NULL,'EQ','input','',8,'admin','2019-09-13 19:07:09',NULL,'2019-09-14 17:49:52'),
(24,'3','id','主键','bigint(20)','Long','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2019-09-13 19:07:09',NULL,'2019-09-14 17:48:22'),
(25,'3','createTime','创建时间','datetime','Date','createTime','0','0','1',NULL,NULL,'1','1','EQ','datetime','',2,'admin','2019-09-13 19:07:09',NULL,'2019-09-14 17:48:22'),
(26,'3','deleteTime','删除时间','datetime','Date','deleteTime','0','0',NULL,NULL,NULL,NULL,NULL,'EQ','datetime','',3,'admin','2019-09-13 19:07:09',NULL,'2019-09-14 17:48:22'),
(27,'3','status','0:删除 1：存在','tinyint(1)','Integer','status','0','0',NULL,NULL,'1',NULL,NULL,'EQ','radio','',4,'admin','2019-09-13 19:07:09',NULL,'2019-09-14 17:48:22'),
(28,'3','name','分类名称','varchar(50)','String','name','0','0','1','1','1','1','1','LIKE','input','',5,'admin','2019-09-13 19:07:09',NULL,'2019-09-14 17:48:22'),
(29,'4','id','主键','bigint(20)','Long','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2019-09-13 19:07:09',NULL,'2019-09-14 17:49:17'),
(30,'4','createTime','创建时间','datetime','Date','createTime','0','0',NULL,NULL,NULL,'1','1','EQ','datetime','',2,'admin','2019-09-13 19:07:09',NULL,'2019-09-14 17:49:17'),
(31,'4','deleteTime','删除时间','datetime','Date','deleteTime','0','0',NULL,NULL,NULL,NULL,NULL,'EQ','datetime','',3,'admin','2019-09-13 19:07:09',NULL,'2019-09-14 17:49:17'),
(32,'4','status','0：删除 1：存在','tinyint(4)','Integer','status','0','0',NULL,NULL,NULL,NULL,NULL,'EQ','radio','',4,'admin','2019-09-13 19:07:09',NULL,'2019-09-14 17:49:17'),
(33,'4','content','内容','text','String','content','0','0',NULL,'1',NULL,'1',NULL,'EQ','input','',5,'admin','2019-09-13 19:07:09',NULL,'2019-09-14 17:49:17'),
(34,'4','replyId','回复父id','bigint(20)','Long','replyId','0','0',NULL,NULL,NULL,NULL,NULL,'EQ','input','',6,'admin','2019-09-13 19:07:09',NULL,'2019-09-14 17:49:17'),
(35,'4','userId','作者','bigint(20)','Long','userId','0','0',NULL,NULL,NULL,'1',NULL,'EQ','input','',7,'admin','2019-09-13 19:07:09',NULL,'2019-09-14 17:49:17'),
(36,'5','id','主键','bigint(20)','Long','id','1','0',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2019-09-13 19:07:09',NULL,'2019-09-14 17:51:42'),
(37,'5','name','名称','varchar(50)','String','name','0','0','1','1','1','1','1','LIKE','input','',2,'admin','2019-09-13 19:07:09',NULL,'2019-09-14 17:51:42'),
(38,'5','status','0:删除 1：存在','tinyint(1)','Integer','status','0','0',NULL,NULL,'1',NULL,NULL,'EQ','radio','',3,'admin','2019-09-13 19:07:09',NULL,'2019-09-14 17:51:42'),
(39,'6','id','id','bigint(20)','Long','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2019-09-20 23:13:19',NULL,'2019-09-20 23:14:31'),
(40,'6','createTime','创建时间','datetime','Date','createTime','0','0',NULL,'1','1','1','1','EQ','datetime','',2,'admin','2019-09-20 23:13:19',NULL,'2019-09-20 23:14:31'),
(41,'6','name','文件名称','varchar(100)','String','name','0','0',NULL,'1','1','1','1','LIKE','input','',3,'admin','2019-09-20 23:13:19',NULL,'2019-09-20 23:14:31'),
(42,'6','abPath','绝对路径','varchar(150)','String','abPath','0','0',NULL,'1','1','1','1','EQ','input','',4,'admin','2019-09-20 23:13:19',NULL,'2019-09-20 23:14:31'),
(43,'6','rtPath','相对路径','varchar(100)','String','rtPath','0','0',NULL,'1','1','1','1','EQ','input','',5,'admin','2019-09-20 23:13:19',NULL,'2019-09-20 23:14:31'),
(44,'6','url','网络地址','varchar(200)','String','url','0','0',NULL,'1','1','1','1','EQ','input','',6,'admin','2019-09-20 23:13:19',NULL,'2019-09-20 23:14:31'),
(45,'7','id','主键','bigint(20)','Long','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2019-09-26 00:22:24',NULL,'2019-09-26 00:27:19'),
(46,'7','url','图片地址','varchar(500)','String','url','0','0','1','1','1','1','1','EQ','input','',2,'admin','2019-09-26 00:22:24',NULL,'2019-09-26 00:27:19'),
(47,'7','description','描述','varchar(100)','String','description','0','0',NULL,'1','1','1','1','EQ','input','',3,'admin','2019-09-26 00:22:24',NULL,'2019-09-26 00:27:19'),
(48,'7','type','类型：自定义。自己根据用途','varchar(50)','String','type','0','0','1','1','1','1','1','EQ','select','',4,'admin','2019-09-26 00:22:24',NULL,'2019-09-26 00:27:19'),
(49,'8','id','主键','bigint(20)','Long','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2019-09-26 00:22:24',NULL,'2019-09-26 00:27:35'),
(50,'8','name','名称','varchar(200)','String','name','0','0','1','1','1','1','1','LIKE','input','',2,'admin','2019-09-26 00:22:24',NULL,'2019-09-26 00:27:35'),
(51,'8','url','友链地址','varchar(500)','String','url','0','0','1','1','1','1','1','EQ','textarea','',3,'admin','2019-09-26 00:22:24',NULL,'2019-09-26 00:27:35'),
(52,'8','avatar','头像地址','varchar(500)','String','avatar','0','0',NULL,'1','1','1','1','EQ','textarea','',4,'admin','2019-09-26 00:22:24',NULL,'2019-09-26 00:27:35'),
(53,'8','introduction','简介','varchar(1000)','String','introduction','0','0',NULL,'1','1','1','1','EQ','textarea','',5,'admin','2019-09-26 00:22:24',NULL,'2019-09-26 00:27:35');

UNLOCK TABLES;

/*Table structure for table `qrtz_blob_triggers` */

DROP TABLE IF EXISTS `qrtz_blob_triggers`;

CREATE TABLE `qrtz_blob_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `blob_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_blob_triggers` */

LOCK TABLES `qrtz_blob_triggers` WRITE;

UNLOCK TABLES;

/*Table structure for table `qrtz_calendars` */

DROP TABLE IF EXISTS `qrtz_calendars`;

CREATE TABLE `qrtz_calendars` (
  `sched_name` varchar(120) NOT NULL,
  `calendar_name` varchar(200) NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`,`calendar_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_calendars` */

LOCK TABLES `qrtz_calendars` WRITE;

UNLOCK TABLES;

/*Table structure for table `qrtz_cron_triggers` */

DROP TABLE IF EXISTS `qrtz_cron_triggers`;

CREATE TABLE `qrtz_cron_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `cron_expression` varchar(200) NOT NULL,
  `time_zone_id` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_cron_triggers` */

LOCK TABLES `qrtz_cron_triggers` WRITE;

insert  into `qrtz_cron_triggers`(`sched_name`,`trigger_name`,`trigger_group`,`cron_expression`,`time_zone_id`) values 
('RuoyiScheduler','TASK_CLASS_NAME1','DEFAULT','0/10 * * * * ?','Asia/Shanghai'),
('RuoyiScheduler','TASK_CLASS_NAME2','DEFAULT','0/15 * * * * ?','Asia/Shanghai'),
('RuoyiScheduler','TASK_CLASS_NAME3','DEFAULT','0/20 * * * * ?','Asia/Shanghai');

UNLOCK TABLES;

/*Table structure for table `qrtz_fired_triggers` */

DROP TABLE IF EXISTS `qrtz_fired_triggers`;

CREATE TABLE `qrtz_fired_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `entry_id` varchar(95) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `instance_name` varchar(200) NOT NULL,
  `fired_time` bigint(13) NOT NULL,
  `sched_time` bigint(13) NOT NULL,
  `priority` int(11) NOT NULL,
  `state` varchar(16) NOT NULL,
  `job_name` varchar(200) DEFAULT NULL,
  `job_group` varchar(200) DEFAULT NULL,
  `is_nonconcurrent` varchar(1) DEFAULT NULL,
  `requests_recovery` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_fired_triggers` */

LOCK TABLES `qrtz_fired_triggers` WRITE;

UNLOCK TABLES;

/*Table structure for table `qrtz_job_details` */

DROP TABLE IF EXISTS `qrtz_job_details`;

CREATE TABLE `qrtz_job_details` (
  `sched_name` varchar(120) NOT NULL,
  `job_name` varchar(200) NOT NULL,
  `job_group` varchar(200) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `job_class_name` varchar(250) NOT NULL,
  `is_durable` varchar(1) NOT NULL,
  `is_nonconcurrent` varchar(1) NOT NULL,
  `is_update_data` varchar(1) NOT NULL,
  `requests_recovery` varchar(1) NOT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_job_details` */

LOCK TABLES `qrtz_job_details` WRITE;

insert  into `qrtz_job_details`(`sched_name`,`job_name`,`job_group`,`description`,`job_class_name`,`is_durable`,`is_nonconcurrent`,`is_update_data`,`requests_recovery`,`job_data`) values 
('RuoyiScheduler','TASK_CLASS_NAME1','DEFAULT',NULL,'com.ruoyi.project.monitor.job.util.QuartzDisallowConcurrentExecution','0','1','0','0','��\0sr\0org.quartz.JobDataMap���迩��\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�����](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap�.�(v\n�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0TASK_PROPERTIESsr\0(com.ruoyi.project.monitor.job.domain.Job\0\0\0\0\0\0\0\0L\0\nconcurrentt\0Ljava/lang/String;L\0cronExpressionq\0~\0	L\0invokeTargetq\0~\0	L\0jobGroupq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0jobNameq\0~\0	L\0\rmisfirePolicyq\0~\0	L\0statusq\0~\0	xr\0)com.ruoyi.framework.web.domain.BaseEntity\0\0\0\0\0\0\0\0L\0createByq\0~\0	L\0\ncreateTimet\0Ljava/util/Date;L\0paramsq\0~\0L\0remarkq\0~\0	L\0searchValueq\0~\0	L\0updateByq\0~\0	L\0\nupdateTimeq\0~\0xpt\0adminsr\0java.util.Datehj�KYt\0\0xpw\0\0b,�)�xpt\0\0pppt\01t\00/10 * * * * ?t\0ryTask.ryNoParamst\0DEFAULTsr\0java.lang.Long;��̏#�\0J\0valuexr\0java.lang.Number������\0\0xp\0\0\0\0\0\0\0t\0系统默认（无参）t\03t\01x\0'),
('RuoyiScheduler','TASK_CLASS_NAME2','DEFAULT',NULL,'com.ruoyi.project.monitor.job.util.QuartzDisallowConcurrentExecution','0','1','0','0','��\0sr\0org.quartz.JobDataMap���迩��\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�����](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap�.�(v\n�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0TASK_PROPERTIESsr\0(com.ruoyi.project.monitor.job.domain.Job\0\0\0\0\0\0\0\0L\0\nconcurrentt\0Ljava/lang/String;L\0cronExpressionq\0~\0	L\0invokeTargetq\0~\0	L\0jobGroupq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0jobNameq\0~\0	L\0\rmisfirePolicyq\0~\0	L\0statusq\0~\0	xr\0)com.ruoyi.framework.web.domain.BaseEntity\0\0\0\0\0\0\0\0L\0createByq\0~\0	L\0\ncreateTimet\0Ljava/util/Date;L\0paramsq\0~\0L\0remarkq\0~\0	L\0searchValueq\0~\0	L\0updateByq\0~\0	L\0\nupdateTimeq\0~\0xpt\0adminsr\0java.util.Datehj�KYt\0\0xpw\0\0b,�)�xpt\0\0pppt\01t\00/15 * * * * ?t\0ryTask.ryParams(\'ry\')t\0DEFAULTsr\0java.lang.Long;��̏#�\0J\0valuexr\0java.lang.Number������\0\0xp\0\0\0\0\0\0\0t\0系统默认（有参）t\03t\01x\0'),
('RuoyiScheduler','TASK_CLASS_NAME3','DEFAULT',NULL,'com.ruoyi.project.monitor.job.util.QuartzDisallowConcurrentExecution','0','1','0','0','��\0sr\0org.quartz.JobDataMap���迩��\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�����](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap�.�(v\n�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0TASK_PROPERTIESsr\0(com.ruoyi.project.monitor.job.domain.Job\0\0\0\0\0\0\0\0L\0\nconcurrentt\0Ljava/lang/String;L\0cronExpressionq\0~\0	L\0invokeTargetq\0~\0	L\0jobGroupq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0jobNameq\0~\0	L\0\rmisfirePolicyq\0~\0	L\0statusq\0~\0	xr\0)com.ruoyi.framework.web.domain.BaseEntity\0\0\0\0\0\0\0\0L\0createByq\0~\0	L\0\ncreateTimet\0Ljava/util/Date;L\0paramsq\0~\0L\0remarkq\0~\0	L\0searchValueq\0~\0	L\0updateByq\0~\0	L\0\nupdateTimeq\0~\0xpt\0adminsr\0java.util.Datehj�KYt\0\0xpw\0\0b,�)�xpt\0\0pppt\01t\00/20 * * * * ?t\08ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)t\0DEFAULTsr\0java.lang.Long;��̏#�\0J\0valuexr\0java.lang.Number������\0\0xp\0\0\0\0\0\0\0t\0系统默认（多参）t\03t\01x\0');

UNLOCK TABLES;

/*Table structure for table `qrtz_locks` */

DROP TABLE IF EXISTS `qrtz_locks`;

CREATE TABLE `qrtz_locks` (
  `sched_name` varchar(120) NOT NULL,
  `lock_name` varchar(40) NOT NULL,
  PRIMARY KEY (`sched_name`,`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_locks` */

LOCK TABLES `qrtz_locks` WRITE;

insert  into `qrtz_locks`(`sched_name`,`lock_name`) values 
('RuoyiScheduler','STATE_ACCESS'),
('RuoyiScheduler','TRIGGER_ACCESS');

UNLOCK TABLES;

/*Table structure for table `qrtz_paused_trigger_grps` */

DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;

CREATE TABLE `qrtz_paused_trigger_grps` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_paused_trigger_grps` */

LOCK TABLES `qrtz_paused_trigger_grps` WRITE;

UNLOCK TABLES;

/*Table structure for table `qrtz_scheduler_state` */

DROP TABLE IF EXISTS `qrtz_scheduler_state`;

CREATE TABLE `qrtz_scheduler_state` (
  `sched_name` varchar(120) NOT NULL,
  `instance_name` varchar(200) NOT NULL,
  `last_checkin_time` bigint(13) NOT NULL,
  `checkin_interval` bigint(13) NOT NULL,
  PRIMARY KEY (`sched_name`,`instance_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_scheduler_state` */

LOCK TABLES `qrtz_scheduler_state` WRITE;

insert  into `qrtz_scheduler_state`(`sched_name`,`instance_name`,`last_checkin_time`,`checkin_interval`) values 
('RuoyiScheduler','DESKTOP-3AM41AK1569555670252',1569556454748,15000);

UNLOCK TABLES;

/*Table structure for table `qrtz_simple_triggers` */

DROP TABLE IF EXISTS `qrtz_simple_triggers`;

CREATE TABLE `qrtz_simple_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `repeat_count` bigint(7) NOT NULL,
  `repeat_interval` bigint(12) NOT NULL,
  `times_triggered` bigint(10) NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_simple_triggers` */

LOCK TABLES `qrtz_simple_triggers` WRITE;

UNLOCK TABLES;

/*Table structure for table `qrtz_simprop_triggers` */

DROP TABLE IF EXISTS `qrtz_simprop_triggers`;

CREATE TABLE `qrtz_simprop_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `str_prop_1` varchar(512) DEFAULT NULL,
  `str_prop_2` varchar(512) DEFAULT NULL,
  `str_prop_3` varchar(512) DEFAULT NULL,
  `int_prop_1` int(11) DEFAULT NULL,
  `int_prop_2` int(11) DEFAULT NULL,
  `long_prop_1` bigint(20) DEFAULT NULL,
  `long_prop_2` bigint(20) DEFAULT NULL,
  `dec_prop_1` decimal(13,4) DEFAULT NULL,
  `dec_prop_2` decimal(13,4) DEFAULT NULL,
  `bool_prop_1` varchar(1) DEFAULT NULL,
  `bool_prop_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_simprop_triggers` */

LOCK TABLES `qrtz_simprop_triggers` WRITE;

UNLOCK TABLES;

/*Table structure for table `qrtz_triggers` */

DROP TABLE IF EXISTS `qrtz_triggers`;

CREATE TABLE `qrtz_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `job_name` varchar(200) NOT NULL,
  `job_group` varchar(200) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `next_fire_time` bigint(13) DEFAULT NULL,
  `prev_fire_time` bigint(13) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `trigger_state` varchar(16) NOT NULL,
  `trigger_type` varchar(8) NOT NULL,
  `start_time` bigint(13) NOT NULL,
  `end_time` bigint(13) DEFAULT NULL,
  `calendar_name` varchar(200) DEFAULT NULL,
  `misfire_instr` smallint(2) DEFAULT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_triggers` */

LOCK TABLES `qrtz_triggers` WRITE;

insert  into `qrtz_triggers`(`sched_name`,`trigger_name`,`trigger_group`,`job_name`,`job_group`,`description`,`next_fire_time`,`prev_fire_time`,`priority`,`trigger_state`,`trigger_type`,`start_time`,`end_time`,`calendar_name`,`misfire_instr`,`job_data`) values 
('RuoyiScheduler','TASK_CLASS_NAME1','DEFAULT','TASK_CLASS_NAME1','DEFAULT',NULL,1569555670000,-1,5,'PAUSED','CRON',1569555670000,0,NULL,2,''),
('RuoyiScheduler','TASK_CLASS_NAME2','DEFAULT','TASK_CLASS_NAME2','DEFAULT',NULL,1569555675000,-1,5,'PAUSED','CRON',1569555670000,0,NULL,2,''),
('RuoyiScheduler','TASK_CLASS_NAME3','DEFAULT','TASK_CLASS_NAME3','DEFAULT',NULL,1569555680000,-1,5,'PAUSED','CRON',1569555670000,0,NULL,2,'');

UNLOCK TABLES;

/*Table structure for table `sys_config` */

DROP TABLE IF EXISTS `sys_config`;

CREATE TABLE `sys_config` (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='参数配置表';

/*Data for the table `sys_config` */

LOCK TABLES `sys_config` WRITE;

insert  into `sys_config`(`config_id`,`config_name`,`config_key`,`config_value`,`config_type`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values 
(1,'主框架页-默认皮肤样式名称','sys.index.skinName','skin-blue','Y','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'),
(2,'用户管理-账号初始密码','sys.user.initPassword','123456','Y','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','初始化密码 123456'),
(3,'主框架页-侧边栏主题','sys.index.sideTheme','theme-dark','Y','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','深色主题theme-dark，浅色主题theme-light');

UNLOCK TABLES;

/*Table structure for table `sys_dept` */

DROP TABLE IF EXISTS `sys_dept`;

CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 COMMENT='部门表';

/*Data for the table `sys_dept` */

LOCK TABLES `sys_dept` WRITE;

insert  into `sys_dept`(`dept_id`,`parent_id`,`ancestors`,`dept_name`,`order_num`,`leader`,`phone`,`email`,`status`,`del_flag`,`create_by`,`create_time`,`update_by`,`update_time`) values 
(100,0,'0','若依科技',0,'若依','15888888888','ry@qq.com','0','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00'),
(101,100,'0,100','深圳总公司',1,'若依','15888888888','ry@qq.com','0','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00'),
(102,100,'0,100','长沙分公司',2,'若依','15888888888','ry@qq.com','0','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00'),
(103,101,'0,100,101','研发部门',1,'若依','15888888888','ry@qq.com','0','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00'),
(104,101,'0,100,101','市场部门',2,'若依','15888888888','ry@qq.com','0','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00'),
(105,101,'0,100,101','测试部门',3,'若依','15888888888','ry@qq.com','0','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00'),
(106,101,'0,100,101','财务部门',4,'若依','15888888888','ry@qq.com','0','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00'),
(107,101,'0,100,101','运维部门',5,'若依','15888888888','ry@qq.com','0','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00'),
(108,102,'0,100,102','市场部门',1,'若依','15888888888','ry@qq.com','0','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00'),
(109,102,'0,100,102','财务部门',2,'若依','15888888888','ry@qq.com','0','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00');

UNLOCK TABLES;

/*Table structure for table `sys_dict_data` */

DROP TABLE IF EXISTS `sys_dict_data`;

CREATE TABLE `sys_dict_data` (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COMMENT='字典数据表';

/*Data for the table `sys_dict_data` */

LOCK TABLES `sys_dict_data` WRITE;

insert  into `sys_dict_data`(`dict_code`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values 
(1,1,'男','0','sys_user_sex','','','Y','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','性别男'),
(2,2,'女','1','sys_user_sex','','','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','性别女'),
(3,3,'未知','2','sys_user_sex','','','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','性别未知'),
(4,1,'显示','0','sys_show_hide','','primary','Y','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','显示菜单'),
(5,2,'隐藏','1','sys_show_hide','','danger','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','隐藏菜单'),
(6,1,'正常','0','sys_normal_disable','','primary','Y','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','正常状态'),
(7,2,'停用','1','sys_normal_disable','','danger','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','停用状态'),
(8,1,'正常','0','sys_job_status','','primary','Y','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','正常状态'),
(9,2,'暂停','1','sys_job_status','','danger','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','停用状态'),
(10,1,'默认','DEFAULT','sys_job_group','','','Y','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','默认分组'),
(11,2,'系统','SYSTEM','sys_job_group','','','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','系统分组'),
(12,1,'是','Y','sys_yes_no','','primary','Y','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','系统默认是'),
(13,2,'否','N','sys_yes_no','','danger','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','系统默认否'),
(14,1,'通知','1','sys_notice_type','','warning','Y','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','通知'),
(15,2,'公告','2','sys_notice_type','','success','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','公告'),
(16,1,'正常','0','sys_notice_status','','primary','Y','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','正常状态'),
(17,2,'关闭','1','sys_notice_status','','danger','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','关闭状态'),
(18,1,'新增','1','sys_oper_type','','info','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','新增操作'),
(19,2,'修改','2','sys_oper_type','','info','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','修改操作'),
(20,3,'删除','3','sys_oper_type','','danger','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','删除操作'),
(21,4,'授权','4','sys_oper_type','','primary','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','授权操作'),
(22,5,'导出','5','sys_oper_type','','warning','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','导出操作'),
(23,6,'导入','6','sys_oper_type','','warning','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','导入操作'),
(24,7,'强退','7','sys_oper_type','','danger','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','强退操作'),
(25,8,'生成代码','8','sys_oper_type','','warning','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','生成操作'),
(26,9,'清空数据','9','sys_oper_type','','danger','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','清空操作'),
(27,1,'成功','0','sys_common_status','','primary','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','正常状态'),
(28,2,'失败','1','sys_common_status','','danger','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','停用状态');

UNLOCK TABLES;

/*Table structure for table `sys_dict_type` */

DROP TABLE IF EXISTS `sys_dict_type`;

CREATE TABLE `sys_dict_type` (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COMMENT='字典类型表';

/*Data for the table `sys_dict_type` */

LOCK TABLES `sys_dict_type` WRITE;

insert  into `sys_dict_type`(`dict_id`,`dict_name`,`dict_type`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values 
(1,'用户性别','sys_user_sex','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','用户性别列表'),
(2,'菜单状态','sys_show_hide','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','菜单状态列表'),
(3,'系统开关','sys_normal_disable','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','系统开关列表'),
(4,'任务状态','sys_job_status','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','任务状态列表'),
(5,'任务分组','sys_job_group','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','任务分组列表'),
(6,'系统是否','sys_yes_no','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','系统是否列表'),
(7,'通知类型','sys_notice_type','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','通知类型列表'),
(8,'通知状态','sys_notice_status','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','通知状态列表'),
(9,'操作类型','sys_oper_type','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','操作类型列表'),
(10,'系统状态','sys_common_status','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','登录状态列表');

UNLOCK TABLES;

/*Table structure for table `sys_file_info` */

DROP TABLE IF EXISTS `sys_file_info`;

CREATE TABLE `sys_file_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `name` varchar(100) DEFAULT NULL COMMENT '文件名称',
  `abPath` varchar(150) DEFAULT NULL COMMENT '绝对路径',
  `rtPath` varchar(100) DEFAULT NULL COMMENT '相对路径',
  `url` varchar(200) DEFAULT NULL COMMENT '网络地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='文件表';

/*Data for the table `sys_file_info` */

LOCK TABLES `sys_file_info` WRITE;

UNLOCK TABLES;

/*Table structure for table `sys_job` */

DROP TABLE IF EXISTS `sys_job`;

CREATE TABLE `sys_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='定时任务调度表';

/*Data for the table `sys_job` */

LOCK TABLES `sys_job` WRITE;

insert  into `sys_job`(`job_id`,`job_name`,`job_group`,`invoke_target`,`cron_expression`,`misfire_policy`,`concurrent`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values 
(1,'系统默认（无参）','DEFAULT','ryTask.ryNoParams','0/10 * * * * ?','3','1','1','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
(2,'系统默认（有参）','DEFAULT','ryTask.ryParams(\'ry\')','0/15 * * * * ?','3','1','1','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
(3,'系统默认（多参）','DEFAULT','ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)','0/20 * * * * ?','3','1','1','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','');

UNLOCK TABLES;

/*Table structure for table `sys_job_log` */

DROP TABLE IF EXISTS `sys_job_log`;

CREATE TABLE `sys_job_log` (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='定时任务调度日志表';

/*Data for the table `sys_job_log` */

LOCK TABLES `sys_job_log` WRITE;

UNLOCK TABLES;

/*Table structure for table `sys_logininfor` */

DROP TABLE IF EXISTS `sys_logininfor`;

CREATE TABLE `sys_logininfor` (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(50) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=203 DEFAULT CHARSET=utf8mb4 COMMENT='系统访问记录';

/*Data for the table `sys_logininfor` */

LOCK TABLES `sys_logininfor` WRITE;

insert  into `sys_logininfor`(`info_id`,`login_name`,`ipaddr`,`login_location`,`browser`,`os`,`status`,`msg`,`login_time`) values 
(100,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','退出成功','2019-09-13 16:52:43'),
(101,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-09-13 16:52:47'),
(102,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','退出成功','2019-09-13 19:04:49'),
(103,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-09-13 19:04:54'),
(104,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','退出成功','2019-09-14 00:35:18'),
(105,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-09-14 00:35:23'),
(106,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','退出成功','2019-09-14 13:15:55'),
(107,'admin','127.0.0.1','内网IP','Chrome','Windows 10','1','验证码错误','2019-09-14 13:16:01'),
(108,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-09-14 13:16:04'),
(109,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','退出成功','2019-09-14 17:54:34'),
(110,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-09-14 17:54:40'),
(111,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-09-14 18:32:38'),
(112,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-09-14 18:34:47'),
(113,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-09-14 18:45:47'),
(114,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-09-14 20:52:56'),
(115,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','退出成功','2019-09-14 23:26:08'),
(116,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-09-14 23:26:19'),
(117,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-09-14 23:45:13'),
(118,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','退出成功','2019-09-15 00:30:33'),
(119,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-09-15 00:30:38'),
(120,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-09-15 00:51:53'),
(121,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-09-15 23:47:21'),
(122,'admin','127.0.0.1','内网IP','Chrome','Windows 10','1','验证码错误','2019-09-16 00:51:16'),
(123,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-09-16 00:51:19'),
(124,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-09-19 23:03:59'),
(125,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-09-19 23:38:09'),
(126,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-09-19 23:40:50'),
(127,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-09-20 19:19:57'),
(128,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-09-20 22:47:53'),
(129,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-09-20 23:37:53'),
(130,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-09-21 00:09:05'),
(131,'admin','127.0.0.1','内网IP','Chrome','Windows 10','1','验证码错误','2019-09-21 10:03:58'),
(132,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-09-21 10:04:00'),
(133,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-09-21 10:20:40'),
(134,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-09-21 10:40:55'),
(135,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-09-21 11:58:51'),
(136,'admin','127.0.0.1','内网IP','Chrome','Windows 10','1','验证码错误','2019-09-21 14:10:04'),
(137,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-09-21 14:10:06'),
(138,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-09-21 14:13:43'),
(139,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-09-21 14:20:40'),
(140,'admin','127.0.0.1','内网IP','Chrome','Windows 10','1','验证码错误','2019-09-21 14:24:21'),
(141,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-09-21 14:24:24'),
(142,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','退出成功','2019-09-21 14:34:14'),
(143,'admin','127.0.0.1','内网IP','Chrome','Windows 10','1','验证码错误','2019-09-21 14:34:19'),
(144,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-09-21 14:34:24'),
(145,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','退出成功','2019-09-21 15:01:32'),
(146,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-09-21 15:01:35'),
(147,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','退出成功','2019-09-21 15:06:44'),
(148,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-09-21 15:06:48'),
(149,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-09-21 15:34:27'),
(150,'admin','127.0.0.1','内网IP','Chrome','Windows 10','1','验证码错误','2019-09-21 19:37:28'),
(151,'admin','127.0.0.1','内网IP','Chrome','Windows 10','1','验证码错误','2019-09-21 19:37:31'),
(152,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-09-21 19:37:34'),
(153,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-09-22 23:33:07'),
(154,'admin','127.0.0.1','内网IP','Chrome','Windows 10','1','验证码错误','2019-09-22 23:49:39'),
(155,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-09-22 23:49:44'),
(156,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-09-22 23:57:12'),
(157,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-09-23 00:06:15'),
(158,'admin','127.0.0.1','内网IP','Chrome','Windows 10','1','验证码错误','2019-09-23 00:21:32'),
(159,'admin','127.0.0.1','内网IP','Chrome','Windows 10','1','验证码错误','2019-09-23 00:21:34'),
(160,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-09-23 00:21:37'),
(161,'admin','127.0.0.1','内网IP','Chrome','Windows 10','1','验证码错误','2019-09-23 00:27:20'),
(162,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-09-23 00:28:32'),
(163,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-09-23 00:58:01'),
(164,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-09-23 01:01:42'),
(165,'admin','127.0.0.1','内网IP','Chrome','Windows 10','1','验证码错误','2019-09-23 01:05:50'),
(166,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-09-23 01:05:53'),
(167,'admin','127.0.0.1','内网IP','Chrome','Windows 10','1','验证码错误','2019-09-23 01:08:22'),
(168,'admin','127.0.0.1','内网IP','Chrome','Windows 10','1','验证码错误','2019-09-23 01:08:26'),
(169,'admin','127.0.0.1','内网IP','Chrome','Windows 10','1','验证码错误','2019-09-23 01:08:29'),
(170,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-09-23 01:08:31'),
(171,'admin','127.0.0.1','内网IP','Chrome','Windows 10','1','验证码错误','2019-09-23 01:15:12'),
(172,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-09-23 01:15:14'),
(173,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-09-23 23:23:47'),
(174,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-09-24 21:38:54'),
(175,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-09-24 22:35:53'),
(176,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-09-24 23:48:32'),
(177,'admin','127.0.0.1','内网IP','Chrome','Windows 10','1','验证码错误','2019-09-26 00:21:17'),
(178,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-09-26 00:21:19'),
(179,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-09-26 00:26:39'),
(180,'admin','127.0.0.1','内网IP','Chrome','Windows 10','1','验证码错误','2019-09-26 00:30:58'),
(181,'admin','127.0.0.1','内网IP','Chrome','Windows 10','1','验证码错误','2019-09-26 00:31:01'),
(182,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-09-26 00:31:03'),
(183,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-09-26 00:34:30'),
(184,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-09-26 00:44:13'),
(185,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-09-26 11:47:24'),
(186,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','退出成功','2019-09-26 11:48:48'),
(187,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-09-26 11:49:03'),
(188,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','退出成功','2019-09-26 11:51:04'),
(189,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-09-26 11:51:33'),
(190,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-09-26 14:47:19'),
(191,'admin','127.0.0.1','内网IP','Chrome','Windows 10','1','验证码错误','2019-09-26 15:23:01'),
(192,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-09-26 15:23:07'),
(193,'admin','127.0.0.1','内网IP','Chrome','Windows 10','1','验证码错误','2019-09-26 15:24:36'),
(194,'admin','127.0.0.1','内网IP','Chrome','Windows 10','1','验证码错误','2019-09-26 15:35:47'),
(195,'admin','127.0.0.1','内网IP','Chrome','Windows 10','1','密码输入错误1次','2019-09-26 15:46:13'),
(196,'admin','127.0.0.1','内网IP','Chrome','Windows 10','1','验证码错误','2019-09-26 15:52:14'),
(197,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-09-26 15:52:17'),
(198,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-09-26 15:52:24'),
(199,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-09-26 16:00:15'),
(200,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-09-27 10:30:10'),
(201,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-09-27 11:32:49'),
(202,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-09-27 11:41:23');

UNLOCK TABLES;

/*Table structure for table `sys_menu` */

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `url` varchar(200) DEFAULT '#' COMMENT '请求地址',
  `target` varchar(20) DEFAULT '' COMMENT '打开方式（menuItem页签 menuBlank新窗口）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2051 DEFAULT CHARSET=utf8mb4 COMMENT='菜单权限表';

/*Data for the table `sys_menu` */

LOCK TABLES `sys_menu` WRITE;

insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values 
(1,'系统管理',0,1,'#','','M','0','','fa fa-gear','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','系统管理目录'),
(2,'系统监控',0,2,'#','','M','0','','fa fa-video-camera','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','系统监控目录'),
(3,'系统工具',0,3,'#','','M','0','','fa fa-bars','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','系统工具目录'),
(100,'用户管理',1,1,'/system/user','','C','0','system:user:view','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','用户管理菜单'),
(101,'角色管理',1,2,'/system/role','','C','0','system:role:view','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','角色管理菜单'),
(102,'菜单管理',1,3,'/system/menu','','C','0','system:menu:view','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','菜单管理菜单'),
(103,'部门管理',1,4,'/system/dept','','C','0','system:dept:view','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','部门管理菜单'),
(104,'岗位管理',1,5,'/system/post','','C','0','system:post:view','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','岗位管理菜单'),
(105,'字典管理',1,6,'/system/dict','','C','0','system:dict:view','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','字典管理菜单'),
(106,'参数设置',1,7,'/system/config','','C','0','system:config:view','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','参数设置菜单'),
(107,'通知公告',1,8,'/system/notice','','C','0','system:notice:view','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','通知公告菜单'),
(108,'日志管理',1,9,'#','','M','0','','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','日志管理菜单'),
(109,'在线用户',2,1,'/monitor/online','','C','0','monitor:online:view','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','在线用户菜单'),
(110,'定时任务',2,2,'/monitor/job','','C','0','monitor:job:view','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','定时任务菜单'),
(111,'数据监控',2,3,'/monitor/data','','C','0','monitor:data:view','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','数据监控菜单'),
(112,'服务监控',2,3,'/monitor/server','','C','0','monitor:server:view','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','服务监控菜单'),
(113,'表单构建',3,1,'/tool/build','','C','0','tool:build:view','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','表单构建菜单'),
(114,'代码生成',3,2,'/tool/gen','','C','0','tool:gen:view','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','代码生成菜单'),
(115,'系统接口',3,3,'/tool/swagger','','C','0','tool:swagger:view','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','系统接口菜单'),
(500,'操作日志',108,1,'/monitor/operlog','','C','0','monitor:operlog:view','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','操作日志菜单'),
(501,'登录日志',108,2,'/monitor/logininfor','','C','0','monitor:logininfor:view','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','登录日志菜单'),
(1000,'用户查询',100,1,'#','','F','0','system:user:list','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
(1001,'用户新增',100,2,'#','','F','0','system:user:add','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
(1002,'用户修改',100,3,'#','','F','0','system:user:edit','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
(1003,'用户删除',100,4,'#','','F','0','system:user:remove','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
(1004,'用户导出',100,5,'#','','F','0','system:user:export','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
(1005,'用户导入',100,6,'#','','F','0','system:user:import','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
(1006,'重置密码',100,7,'#','','F','0','system:user:resetPwd','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
(1007,'角色查询',101,1,'#','','F','0','system:role:list','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
(1008,'角色新增',101,2,'#','','F','0','system:role:add','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
(1009,'角色修改',101,3,'#','','F','0','system:role:edit','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
(1010,'角色删除',101,4,'#','','F','0','system:role:remove','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
(1011,'角色导出',101,5,'#','','F','0','system:role:export','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
(1012,'菜单查询',102,1,'#','','F','0','system:menu:list','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
(1013,'菜单新增',102,2,'#','','F','0','system:menu:add','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
(1014,'菜单修改',102,3,'#','','F','0','system:menu:edit','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
(1015,'菜单删除',102,4,'#','','F','0','system:menu:remove','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
(1016,'部门查询',103,1,'#','','F','0','system:dept:list','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
(1017,'部门新增',103,2,'#','','F','0','system:dept:add','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
(1018,'部门修改',103,3,'#','','F','0','system:dept:edit','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
(1019,'部门删除',103,4,'#','','F','0','system:dept:remove','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
(1020,'岗位查询',104,1,'#','','F','0','system:post:list','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
(1021,'岗位新增',104,2,'#','','F','0','system:post:add','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
(1022,'岗位修改',104,3,'#','','F','0','system:post:edit','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
(1023,'岗位删除',104,4,'#','','F','0','system:post:remove','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
(1024,'岗位导出',104,5,'#','','F','0','system:post:export','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
(1025,'字典查询',105,1,'#','','F','0','system:dict:list','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
(1026,'字典新增',105,2,'#','','F','0','system:dict:add','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
(1027,'字典修改',105,3,'#','','F','0','system:dict:edit','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
(1028,'字典删除',105,4,'#','','F','0','system:dict:remove','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
(1029,'字典导出',105,5,'#','','F','0','system:dict:export','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
(1030,'参数查询',106,1,'#','','F','0','system:config:list','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
(1031,'参数新增',106,2,'#','','F','0','system:config:add','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
(1032,'参数修改',106,3,'#','','F','0','system:config:edit','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
(1033,'参数删除',106,4,'#','','F','0','system:config:remove','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
(1034,'参数导出',106,5,'#','','F','0','system:config:export','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
(1035,'公告查询',107,1,'#','','F','0','system:notice:list','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
(1036,'公告新增',107,2,'#','','F','0','system:notice:add','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
(1037,'公告修改',107,3,'#','','F','0','system:notice:edit','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
(1038,'公告删除',107,4,'#','','F','0','system:notice:remove','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
(1039,'操作查询',500,1,'#','','F','0','monitor:operlog:list','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
(1040,'操作删除',500,2,'#','','F','0','monitor:operlog:remove','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
(1041,'详细信息',500,3,'#','','F','0','monitor:operlog:detail','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
(1042,'日志导出',500,4,'#','','F','0','monitor:operlog:export','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
(1043,'登录查询',501,1,'#','','F','0','monitor:logininfor:list','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
(1044,'登录删除',501,2,'#','','F','0','monitor:logininfor:remove','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
(1045,'日志导出',501,3,'#','','F','0','monitor:logininfor:export','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
(1046,'在线查询',109,1,'#','','F','0','monitor:online:list','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
(1047,'批量强退',109,2,'#','','F','0','monitor:online:batchForceLogout','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
(1048,'单条强退',109,3,'#','','F','0','monitor:online:forceLogout','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
(1049,'任务查询',110,1,'#','','F','0','monitor:job:list','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
(1050,'任务新增',110,2,'#','','F','0','monitor:job:add','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
(1051,'任务修改',110,3,'#','','F','0','monitor:job:edit','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
(1052,'任务删除',110,4,'#','','F','0','monitor:job:remove','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
(1053,'状态修改',110,5,'#','','F','0','monitor:job:changeStatus','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
(1054,'任务详细',110,6,'#','','F','0','monitor:job:detail','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
(1055,'任务导出',110,7,'#','','F','0','monitor:job:export','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
(1056,'生成查询',114,1,'#','','F','0','tool:gen:list','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
(1057,'生成修改',114,2,'#','','F','0','tool:gen:edit','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
(1058,'生成删除',114,3,'#','','F','0','tool:gen:remove','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
(1059,'预览代码',114,4,'#','','F','0','tool:gen:preview','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
(1060,'生成代码',114,5,'#','','F','0','tool:gen:code','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
(2000,'博客文章',2025,1,'/blog/article','menuItem','C','0','blog:article:view','#','admin','2018-03-01 00:00:00','admin','2019-09-14 00:37:22','博客文章菜单'),
(2001,'博客文章查询',2000,1,'#','','F','0','blog:article:list','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),
(2002,'博客文章新增',2000,2,'#','','F','0','blog:article:add','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),
(2003,'博客文章修改',2000,3,'#','','F','0','blog:article:edit','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),
(2004,'博客文章删除',2000,4,'#','','F','0','blog:article:remove','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),
(2005,'文章分类',2025,1,'/blog/classify','menuItem','C','0','blog:classify:view','#','admin','2018-03-01 00:00:00','admin','2019-09-14 00:37:42','文章分类菜单'),
(2006,'文章分类查询',2005,1,'#','','F','0','blog:classify:list','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),
(2007,'文章分类新增',2005,2,'#','','F','0','blog:classify:add','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),
(2008,'文章分类修改',2005,3,'#','','F','0','blog:classify:edit','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),
(2009,'文章分类删除',2005,4,'#','','F','0','blog:classify:remove','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),
(2010,'文章评论',2025,1,'/blog/comment','menuItem','C','0','blog:comment:view','#','admin','2018-03-01 00:00:00','admin','2019-09-14 00:37:55','文章评论菜单'),
(2011,'文章评论查询',2010,1,'#','','F','0','blog:comment:list','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),
(2012,'文章评论新增',2010,2,'#','','F','0','blog:comment:add','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),
(2013,'文章评论修改',2010,3,'#','','F','0','blog:comment:edit','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),
(2014,'文章评论删除',2010,4,'#','','F','0','blog:comment:remove','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),
(2015,'留言',2025,1,'/blog/message','menuItem','C','0','blog:message:view','#','admin','2018-03-01 00:00:00','admin','2019-09-14 00:38:27','留言菜单'),
(2016,'留言查询',2015,1,'#','','F','0','blog:message:list','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),
(2017,'留言新增',2015,2,'#','','F','0','blog:message:add','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),
(2018,'留言修改',2015,3,'#','','F','0','blog:message:edit','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),
(2019,'留言删除',2015,4,'#','','F','0','blog:message:remove','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),
(2020,'标签',2025,1,'/blog/tags','menuItem','C','0','blog:tags:view','#','admin','2018-03-01 00:00:00','admin','2019-09-14 00:38:37','标签菜单'),
(2021,'标签查询',2020,1,'#','','F','0','blog:tags:list','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),
(2022,'标签新增',2020,2,'#','','F','0','blog:tags:add','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),
(2023,'标签修改',2020,3,'#','','F','0','blog:tags:edit','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),
(2024,'标签删除',2020,4,'#','','F','0','blog:tags:remove','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),
(2025,'博客管理',0,1,'#','menuItem','M','0',NULL,'fa fa-newspaper-o','admin','2019-09-14 00:36:54','',NULL,''),
(2026,'文件',3,1,'/system/info','','C','0','system:info:view','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00','文件菜单'),
(2027,'文件查询',2026,1,'#','','F','0','system:info:list','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),
(2028,'文件新增',2026,2,'#','','F','0','system:info:add','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),
(2029,'文件修改',2026,3,'#','','F','0','system:info:edit','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),
(2030,'文件删除',2026,4,'#','','F','0','system:info:remove','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),
(2041,'banner图',2025,1,'/blog/banner','menuItem','C','0','blog:banner:view','#','admin','2018-03-01 00:00:00','admin','2019-09-26 00:32:25','banner图菜单'),
(2042,'banner图查询',2041,1,'#','','F','0','blog:banner:list','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),
(2043,'banner图新增',2041,2,'#','','F','0','blog:banner:add','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),
(2044,'banner图修改',2041,3,'#','','F','0','blog:banner:edit','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),
(2045,'banner图删除',2041,4,'#','','F','0','blog:banner:remove','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),
(2046,'友链',2025,1,'/blog/link','menuItem','C','0','system:link:view','#','admin','2018-03-01 00:00:00','admin','2019-09-26 00:32:48','友链菜单'),
(2047,'友链查询',2046,1,'#','','F','0','system:link:list','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),
(2048,'友链新增',2046,2,'#','','F','0','system:link:add','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),
(2049,'友链修改',2046,3,'#','','F','0','system:link:edit','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),
(2050,'友链删除',2046,4,'#','','F','0','system:link:remove','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00','');

UNLOCK TABLES;

/*Table structure for table `sys_notice` */

DROP TABLE IF EXISTS `sys_notice`;

CREATE TABLE `sys_notice` (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(2000) DEFAULT NULL COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='通知公告表';

/*Data for the table `sys_notice` */

LOCK TABLES `sys_notice` WRITE;

insert  into `sys_notice`(`notice_id`,`notice_title`,`notice_type`,`notice_content`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values 
(1,'温馨提醒：2018-07-01 若依新版本发布啦','2','新版本内容','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','管理员'),
(2,'维护通知：2018-07-01 若依系统凌晨维护','1','维护内容','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','管理员');

UNLOCK TABLES;

/*Table structure for table `sys_oper_log` */

DROP TABLE IF EXISTS `sys_oper_log`;

CREATE TABLE `sys_oper_log` (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `status` int(1) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=utf8mb4 COMMENT='操作日志记录';

/*Data for the table `sys_oper_log` */

LOCK TABLES `sys_oper_log` WRITE;

insert  into `sys_oper_log`(`oper_id`,`title`,`business_type`,`method`,`request_method`,`operator_type`,`oper_name`,`dept_name`,`oper_url`,`oper_ip`,`oper_location`,`oper_param`,`status`,`error_msg`,`oper_time`) values 
(100,'代码生成',6,'com.ruoyi.project.tool.gen.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":[\"blog_tags,blog_message,blog_classify,blog_article_comment,blog_article\"]}',0,NULL,'2019-09-13 19:07:09'),
(101,'代码生成',8,'com.ruoyi.project.tool.gen.controller.GenController.genCode()','GET',1,'admin','研发部门','/tool/gen/genCode/blog_article','127.0.0.1','内网IP','{}',0,NULL,'2019-09-13 20:39:15'),
(102,'代码生成',8,'com.ruoyi.project.tool.gen.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":[\"blog_article,blog_article_comment,blog_classify,blog_message,blog_tags\"]}',0,NULL,'2019-09-13 20:43:57'),
(103,'代码生成',8,'com.ruoyi.project.tool.gen.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":[\"blog_article,blog_article_comment,blog_classify,blog_message,blog_tags\"]}',0,NULL,'2019-09-13 20:44:45'),
(104,'代码生成',2,'com.ruoyi.project.tool.gen.controller.GenController.editSave()','POST',1,'admin','研发部门','/tool/gen/edit','127.0.0.1','内网IP','{\"tableId\":[\"1\"],\"tableName\":[\"blog_article\"],\"tableComment\":[\"博客文章表\"],\"className\":[\"Article\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"1\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"2\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"创建时间\"],\"columns[1].javaType\":[\"Date\"],\"columns[1].javaField\":[\"createtime\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"datetime\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"3\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"删除时间\"],\"columns[2].javaType\":[\"Date\"],\"columns[2].javaField\":[\"deletetime\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"datetime\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"4\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"0：删除 1：存在\"],\"columns[3].javaType\":[\"Integer\"],\"columns[3].javaField\":[\"status\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"radio\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"5\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"作者\"],\"columns[4].javaType\":[\"Long\"],\"columns[4].javaField\":[\"userid\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"6\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"标题\"],\"columns[5].javaType\":[\"String\"],\"colu',0,NULL,'2019-09-13 22:40:37'),
(105,'代码生成',2,'com.ruoyi.project.tool.gen.controller.GenController.editSave()','POST',1,'admin','研发部门','/tool/gen/edit','127.0.0.1','内网IP','{\"tableId\":[\"1\"],\"tableName\":[\"blog_article\"],\"tableComment\":[\"博客文章表\"],\"className\":[\"Article\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"1\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"2\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"创建时间\"],\"columns[1].javaType\":[\"Date\"],\"columns[1].javaField\":[\"createtime\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"datetime\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"3\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"删除时间\"],\"columns[2].javaType\":[\"Date\"],\"columns[2].javaField\":[\"deletetime\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"datetime\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"4\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"0：删除 1：存在\"],\"columns[3].javaType\":[\"Integer\"],\"columns[3].javaField\":[\"status\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"radio\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"5\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"作者\"],\"columns[4].javaType\":[\"Long\"],\"columns[4].javaField\":[\"userid\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"6\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"标题\"],\"columns[5].javaType\":[\"String\"],\"colu',0,NULL,'2019-09-13 22:41:05'),
(106,'代码生成',2,'com.ruoyi.project.tool.gen.controller.GenController.editSave()','POST',1,'admin','研发部门','/tool/gen/edit','127.0.0.1','内网IP','{\"tableId\":[\"2\"],\"tableName\":[\"blog_article_comment\"],\"tableComment\":[\"文章评论表\"],\"className\":[\"ArticleComment\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"16\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"17\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"创建时间\"],\"columns[1].javaType\":[\"Date\"],\"columns[1].javaField\":[\"createtime\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"datetime\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"18\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"删除时间\"],\"columns[2].javaType\":[\"Date\"],\"columns[2].javaField\":[\"deletetime\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"datetime\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"19\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"0删除  1 存在\"],\"columns[3].javaType\":[\"Integer\"],\"columns[3].javaField\":[\"status\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"radio\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"20\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"用户id\"],\"columns[4].javaType\":[\"Long\"],\"columns[4].javaField\":[\"userid\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"21\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"内容\"],\"columns[5].javaType\":[\"String\"],\"columns[5].javaField\":[\"content\"],\"column',0,NULL,'2019-09-13 22:41:26'),
(107,'代码生成',2,'com.ruoyi.project.tool.gen.controller.GenController.editSave()','POST',1,'admin','研发部门','/tool/gen/edit','127.0.0.1','内网IP','{\"tableId\":[\"3\"],\"tableName\":[\"blog_classify\"],\"tableComment\":[\"文章分类\"],\"className\":[\"Classify\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"24\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"25\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"创建时间\"],\"columns[1].javaType\":[\"Date\"],\"columns[1].javaField\":[\"createtime\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"datetime\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"26\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"删除时间\"],\"columns[2].javaType\":[\"Date\"],\"columns[2].javaField\":[\"deletedtime\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"datetime\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"27\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"0:删除 1：存在\"],\"columns[3].javaType\":[\"Integer\"],\"columns[3].javaField\":[\"status\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"radio\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"28\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"分类名称\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"name\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"LIKE\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.project.blog\"],\"moduleName\":[\"blog\"],\"businessName\":[\"classify\"]',0,NULL,'2019-09-13 22:41:36'),
(108,'代码生成',2,'com.ruoyi.project.tool.gen.controller.GenController.editSave()','POST',1,'admin','研发部门','/tool/gen/edit','127.0.0.1','内网IP','{\"tableId\":[\"4\"],\"tableName\":[\"blog_message\"],\"tableComment\":[\"留言表\"],\"className\":[\"Message\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"29\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"30\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"创建时间\"],\"columns[1].javaType\":[\"Date\"],\"columns[1].javaField\":[\"createtime\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"datetime\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"31\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"删除时间\"],\"columns[2].javaType\":[\"Date\"],\"columns[2].javaField\":[\"deletetime\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"datetime\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"32\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"0：删除 1：存在\"],\"columns[3].javaType\":[\"Integer\"],\"columns[3].javaField\":[\"status\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"radio\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"33\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"内容\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"content\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"34\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"回复父id\"],\"columns[5].javaType\":[\"Long\"],\"columns[5].javaField\":[\"replyid\"],\"columns[5].isInsert\":',0,NULL,'2019-09-13 22:41:44'),
(109,'代码生成',2,'com.ruoyi.project.tool.gen.controller.GenController.editSave()','POST',1,'admin','研发部门','/tool/gen/edit','127.0.0.1','内网IP','{\"tableId\":[\"5\"],\"tableName\":[\"blog_tags\"],\"tableComment\":[\"标签表\"],\"className\":[\"Tags\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"36\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"37\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"名称\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"name\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"38\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"0:删除 1：存在\"],\"columns[2].javaType\":[\"Integer\"],\"columns[2].javaField\":[\"status\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"radio\"],\"columns[2].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.project.blog\"],\"moduleName\":[\"blog\"],\"businessName\":[\"tags\"],\"functionName\":[\"标签\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode]\":[\"\"],\"params[treeName]\":[\"\"]}',0,NULL,'2019-09-13 22:41:55'),
(110,'代码生成',8,'com.ruoyi.project.tool.gen.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":[\"blog_article,blog_article_comment,blog_classify,blog_message,blog_tags\"]}',0,NULL,'2019-09-13 22:50:11'),
(111,'菜单管理',1,'com.ruoyi.project.system.menu.controller.MenuController.addSave()','POST',1,'admin','研发部门','/system/menu/add','127.0.0.1','内网IP','{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"博客管理\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-newspaper-o\"],\"visible\":[\"0\"]}',0,NULL,'2019-09-14 00:36:54'),
(112,'菜单管理',2,'com.ruoyi.project.system.menu.controller.MenuController.editSave()','POST',1,'admin','研发部门','/system/menu/edit','127.0.0.1','内网IP','{\"menuId\":[\"2000\"],\"parentId\":[\"2025\"],\"menuType\":[\"C\"],\"menuName\":[\"博客文章\"],\"url\":[\"/blog/article\"],\"target\":[\"menuItem\"],\"perms\":[\"blog:article:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}',0,NULL,'2019-09-14 00:37:23'),
(113,'菜单管理',2,'com.ruoyi.project.system.menu.controller.MenuController.editSave()','POST',1,'admin','研发部门','/system/menu/edit','127.0.0.1','内网IP','{\"menuId\":[\"2005\"],\"parentId\":[\"2025\"],\"menuType\":[\"C\"],\"menuName\":[\"文章分类\"],\"url\":[\"/blog/classify\"],\"target\":[\"menuItem\"],\"perms\":[\"blog:classify:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}',0,NULL,'2019-09-14 00:37:42'),
(114,'菜单管理',2,'com.ruoyi.project.system.menu.controller.MenuController.editSave()','POST',1,'admin','研发部门','/system/menu/edit','127.0.0.1','内网IP','{\"menuId\":[\"2010\"],\"parentId\":[\"2025\"],\"menuType\":[\"C\"],\"menuName\":[\"文章评论\"],\"url\":[\"/blog/comment\"],\"target\":[\"menuItem\"],\"perms\":[\"blog:comment:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}',0,NULL,'2019-09-14 00:37:55'),
(115,'菜单管理',2,'com.ruoyi.project.system.menu.controller.MenuController.editSave()','POST',1,'admin','研发部门','/system/menu/edit','127.0.0.1','内网IP','{\"menuId\":[\"2015\"],\"parentId\":[\"2025\"],\"menuType\":[\"C\"],\"menuName\":[\"留言\"],\"url\":[\"/blog/message\"],\"target\":[\"menuItem\"],\"perms\":[\"blog:message:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}',0,NULL,'2019-09-14 00:38:27'),
(116,'菜单管理',2,'com.ruoyi.project.system.menu.controller.MenuController.editSave()','POST',1,'admin','研发部门','/system/menu/edit','127.0.0.1','内网IP','{\"menuId\":[\"2020\"],\"parentId\":[\"2025\"],\"menuType\":[\"C\"],\"menuName\":[\"标签\"],\"url\":[\"/blog/tags\"],\"target\":[\"menuItem\"],\"perms\":[\"blog:tags:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}',0,NULL,'2019-09-14 00:38:37'),
(117,'代码生成',2,'com.ruoyi.project.tool.gen.controller.GenController.editSave()','POST',1,'admin','研发部门','/tool/gen/edit','127.0.0.1','内网IP','{\"tableId\":[\"1\"],\"tableName\":[\"blog_article\"],\"tableComment\":[\"博客文章表\"],\"className\":[\"Article\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"1\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"2\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"创建时间\"],\"columns[1].javaType\":[\"Date\"],\"columns[1].javaField\":[\"createTime\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"datetime\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"3\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"删除时间\"],\"columns[2].javaType\":[\"Date\"],\"columns[2].javaField\":[\"deletetime\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"datetime\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"4\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"0：删除 1：存在\"],\"columns[3].javaType\":[\"Integer\"],\"columns[3].javaField\":[\"status\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"radio\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"5\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"作者\"],\"columns[4].javaType\":[\"Long\"],\"columns[4].javaField\":[\"userId\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"6\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"标题\"],\"columns[5].javaType\":[\"String\"],\"columns[5].javaField\":[\"title\"',0,NULL,'2019-09-14 12:54:56'),
(118,'代码生成',2,'com.ruoyi.project.tool.gen.controller.GenController.editSave()','POST',1,'admin','研发部门','/tool/gen/edit','127.0.0.1','内网IP','{\"tableId\":[\"2\"],\"tableName\":[\"blog_article_comment\"],\"tableComment\":[\"文章评论表\"],\"className\":[\"ArticleComment\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"16\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"17\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"创建时间\"],\"columns[1].javaType\":[\"Date\"],\"columns[1].javaField\":[\"createTime\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"datetime\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"18\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"删除时间\"],\"columns[2].javaType\":[\"Date\"],\"columns[2].javaField\":[\"deleteTime\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"datetime\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"19\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"0删除 1 存在\"],\"columns[3].javaType\":[\"Integer\"],\"columns[3].javaField\":[\"status\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"radio\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"20\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"用户id\"],\"columns[4].javaType\":[\"Long\"],\"columns[4].javaField\":[\"userId\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"21\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"内容\"],\"columns[5].javaType\":[\"String\"],\"columns[5].javaField\":[\"content\"],\"columns',0,NULL,'2019-09-14 12:55:20'),
(119,'代码生成',2,'com.ruoyi.project.tool.gen.controller.GenController.editSave()','POST',1,'admin','研发部门','/tool/gen/edit','127.0.0.1','内网IP','{\"tableId\":[\"3\"],\"tableName\":[\"blog_classify\"],\"tableComment\":[\"文章分类\"],\"className\":[\"Classify\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"24\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"25\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"创建时间\"],\"columns[1].javaType\":[\"Date\"],\"columns[1].javaField\":[\"createTime\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"datetime\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"26\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"删除时间\"],\"columns[2].javaType\":[\"Date\"],\"columns[2].javaField\":[\"deleteTime\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"datetime\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"27\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"0:删除 1：存在\"],\"columns[3].javaType\":[\"Integer\"],\"columns[3].javaField\":[\"status\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"radio\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"28\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"分类名称\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"name\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"LIKE\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.project.blog\"],\"moduleName\":[\"blog\"],\"businessName\":[\"classify\"],',0,NULL,'2019-09-14 12:55:41'),
(120,'代码生成',2,'com.ruoyi.project.tool.gen.controller.GenController.editSave()','POST',1,'admin','研发部门','/tool/gen/edit','127.0.0.1','内网IP','{\"tableId\":[\"4\"],\"tableName\":[\"blog_message\"],\"tableComment\":[\"留言表\"],\"className\":[\"Message\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"29\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"30\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"创建时间\"],\"columns[1].javaType\":[\"Date\"],\"columns[1].javaField\":[\"createTime\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"datetime\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"31\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"删除时间\"],\"columns[2].javaType\":[\"Date\"],\"columns[2].javaField\":[\"deleteTime\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"datetime\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"32\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"0：删除 1：存在\"],\"columns[3].javaType\":[\"Integer\"],\"columns[3].javaField\":[\"status\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"radio\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"33\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"内容\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"content\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"34\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"回复父id\"],\"columns[5].javaType\":[\"Long\"],\"columns[5].javaField\":[\"replyId\"],\"columns[5].isInsert\":',0,NULL,'2019-09-14 12:56:01'),
(121,'代码生成',2,'com.ruoyi.project.tool.gen.controller.GenController.editSave()','POST',1,'admin','研发部门','/tool/gen/edit','127.0.0.1','内网IP','{\"tableId\":[\"5\"],\"tableName\":[\"blog_tags\"],\"tableComment\":[\"标签表\"],\"className\":[\"Tags\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"36\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"37\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"名称\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"name\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"38\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"0:删除 1：存在\"],\"columns[2].javaType\":[\"Integer\"],\"columns[2].javaField\":[\"status\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"radio\"],\"columns[2].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.project.blog\"],\"moduleName\":[\"blog\"],\"businessName\":[\"tags\"],\"functionName\":[\"标签\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode]\":[\"\"],\"params[treeName]\":[\"\"]}',0,NULL,'2019-09-14 12:56:04'),
(122,'代码生成',8,'com.ruoyi.project.tool.gen.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":[\"blog_article,blog_article_comment,blog_classify,blog_message,blog_tags\"]}',0,NULL,'2019-09-14 12:56:11'),
(123,'代码生成',2,'com.ruoyi.project.tool.gen.controller.GenController.editSave()','POST',1,'admin','研发部门','/tool/gen/edit','127.0.0.1','内网IP','{\"tableId\":[\"1\"],\"tableName\":[\"blog_article\"],\"tableComment\":[\"博客文章表\"],\"className\":[\"Article\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"1\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"2\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"创建时间\"],\"columns[1].javaType\":[\"Date\"],\"columns[1].javaField\":[\"createTime\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"datetime\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"3\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"删除时间\"],\"columns[2].javaType\":[\"Date\"],\"columns[2].javaField\":[\"deleteTime\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"datetime\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"4\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"0：删除 1：存在\"],\"columns[3].javaType\":[\"Integer\"],\"columns[3].javaField\":[\"status\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"radio\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"5\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"作者\"],\"columns[4].javaType\":[\"Long\"],\"columns[4].javaField\":[\"userId\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"6\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"标题\"],\"columns[5].javaType\":[\"String\"],\"columns[5].javaField\":[\"title\"',0,NULL,'2019-09-14 12:58:49'),
(124,'代码生成',8,'com.ruoyi.project.tool.gen.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":[\"blog_article,blog_article_comment,blog_classify,blog_message,blog_tags\"]}',0,NULL,'2019-09-14 12:59:15'),
(125,'代码生成',8,'com.ruoyi.project.tool.gen.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":[\"blog_article,blog_article_comment,blog_classify,blog_message,blog_tags\"]}',0,NULL,'2019-09-14 13:02:31'),
(126,'代码生成',8,'com.ruoyi.project.tool.gen.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":[\"blog_article,blog_article_comment,blog_classify,blog_message,blog_tags\"]}',0,NULL,'2019-09-14 13:29:50'),
(127,'代码生成',2,'com.ruoyi.project.tool.gen.controller.GenController.editSave()','POST',1,'admin','研发部门','/tool/gen/edit','127.0.0.1','内网IP','{\"tableId\":[\"5\"],\"tableName\":[\"blog_tags\"],\"tableComment\":[\"标签表\"],\"className\":[\"Tags\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"36\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"37\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"名称\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"name\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"38\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"0:删除 1：存在\"],\"columns[2].javaType\":[\"Integer\"],\"columns[2].javaField\":[\"status\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"radio\"],\"columns[2].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.project.blog\"],\"moduleName\":[\"blog\"],\"businessName\":[\"tags\"],\"functionName\":[\"标签\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode]\":[\"\"],\"params[treeName]\":[\"\"]}',0,NULL,'2019-09-14 13:45:34'),
(128,'代码生成',2,'com.ruoyi.project.tool.gen.controller.GenController.editSave()','POST',1,'admin','研发部门','/tool/gen/edit','127.0.0.1','内网IP','{\"tableId\":[\"1\"],\"tableName\":[\"blog_article\"],\"tableComment\":[\"博客文章表\"],\"className\":[\"Article\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"1\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"2\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"创建时间\"],\"columns[1].javaType\":[\"Date\"],\"columns[1].javaField\":[\"createTime\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"datetime\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"3\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"删除时间\"],\"columns[2].javaType\":[\"Date\"],\"columns[2].javaField\":[\"deleteTime\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"datetime\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"4\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"0：删除 1：存在\"],\"columns[3].javaType\":[\"Integer\"],\"columns[3].javaField\":[\"status\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"radio\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"5\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"作者\"],\"columns[4].javaType\":[\"Long\"],\"columns[4].javaField\":[\"userId\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"6\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"标题\"],\"columns[5].javaType\":[\"String\"],\"columns[5].javaField\":[\"title\"],\"columns[5].isInsert\":[\"1\"],\"columns[5].isEdit\":[\"1\"],\"columns[5].isList\":[\"1\"],\"columns[5].isQuery\":[\"1\"],\"columns[5].queryType\":[\"EQ\"],\"columns[5].htmlType\":[\"input\"],\"columns[5].dictType\":[\"\"],\"columns[6].c',0,NULL,'2019-09-14 17:45:53'),
(129,'代码生成',2,'com.ruoyi.project.tool.gen.controller.GenController.editSave()','POST',1,'admin','研发部门','/tool/gen/edit','127.0.0.1','内网IP','{\"tableId\":[\"2\"],\"tableName\":[\"blog_article_comment\"],\"tableComment\":[\"文章评论表\"],\"className\":[\"ArticleComment\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"16\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"17\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"创建时间\"],\"columns[1].javaType\":[\"Date\"],\"columns[1].javaField\":[\"createTime\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"datetime\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"18\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"删除时间\"],\"columns[2].javaType\":[\"Date\"],\"columns[2].javaField\":[\"deleteTime\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"datetime\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"19\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"0删除 1 存在\"],\"columns[3].javaType\":[\"Integer\"],\"columns[3].javaField\":[\"status\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"radio\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"20\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"用户id\"],\"columns[4].javaType\":[\"Long\"],\"columns[4].javaField\":[\"userId\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"21\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"内容\"],\"columns[5].javaType\":[\"String\"],\"columns[5].javaField\":[\"content\"],\"columns[5].isInsert\":[\"1\"],\"columns[5].isEdit\":[\"1\"],\"columns[5].queryType\":[\"EQ\"],\"columns[5].htmlType\":[\"input\"],\"columns[5].dictType\":[\"\"],\"columns[6].columnId\":[\"22\"],\"columns[6].sort\":[\"7\"],\"columns[6].columnComment\":[\"文章id\"],\"columns[6].javaType\":[\"Long\"],\"columns[6].javaField\":[\"articleId\"],\"columns[6].queryType\":[\"EQ\"],\"columns[6].htmlType\":[\"inp',0,NULL,'2019-09-14 17:47:45'),
(130,'代码生成',2,'com.ruoyi.project.tool.gen.controller.GenController.editSave()','POST',1,'admin','研发部门','/tool/gen/edit','127.0.0.1','内网IP','{\"tableId\":[\"3\"],\"tableName\":[\"blog_classify\"],\"tableComment\":[\"文章分类\"],\"className\":[\"Classify\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"24\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"25\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"创建时间\"],\"columns[1].javaType\":[\"Date\"],\"columns[1].javaField\":[\"createTime\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"datetime\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"26\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"删除时间\"],\"columns[2].javaType\":[\"Date\"],\"columns[2].javaField\":[\"deleteTime\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"datetime\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"27\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"0:删除 1：存在\"],\"columns[3].javaType\":[\"Integer\"],\"columns[3].javaField\":[\"status\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"radio\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"28\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"分类名称\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"name\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"LIKE\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.project.blog\"],\"moduleName\":[\"blog\"],\"businessName\":[\"classify\"],\"functionName\":[\"文章分类\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode]\":[\"\"],\"params[treeName]\":[\"\"]}',0,NULL,'2019-09-14 17:48:22'),
(131,'代码生成',2,'com.ruoyi.project.tool.gen.controller.GenController.editSave()','POST',1,'admin','研发部门','/tool/gen/edit','127.0.0.1','内网IP','{\"tableId\":[\"4\"],\"tableName\":[\"blog_message\"],\"tableComment\":[\"留言表\"],\"className\":[\"Message\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"29\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"30\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"创建时间\"],\"columns[1].javaType\":[\"Date\"],\"columns[1].javaField\":[\"createTime\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"datetime\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"31\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"删除时间\"],\"columns[2].javaType\":[\"Date\"],\"columns[2].javaField\":[\"deleteTime\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"datetime\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"32\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"0：删除 1：存在\"],\"columns[3].javaType\":[\"Integer\"],\"columns[3].javaField\":[\"status\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"radio\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"33\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"内容\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"content\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"34\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"回复父id\"],\"columns[5].javaType\":[\"Long\"],\"columns[5].javaField\":[\"replyId\"],\"columns[5].queryType\":[\"EQ\"],\"columns[5].htmlType\":[\"input\"],\"columns[5].dictType\":[\"\"],\"columns[6].columnId\":[\"35\"],\"columns[6].sort\":[\"7\"],\"columns[6].columnComment\":[\"作者\"],\"columns[6].javaType\":[\"Long\"],\"columns[6].javaField\":[\"userId\"],\"columns[6].isList\":[\"1\"],\"columns[6].queryType\":[\"EQ\"],\"columns[6].htmlType\":[\"input\"],\"columns[6].di',0,NULL,'2019-09-14 17:49:17'),
(132,'代码生成',2,'com.ruoyi.project.tool.gen.controller.GenController.editSave()','POST',1,'admin','研发部门','/tool/gen/edit','127.0.0.1','内网IP','{\"tableId\":[\"5\"],\"tableName\":[\"blog_tags\"],\"tableComment\":[\"标签表\"],\"className\":[\"Tags\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"36\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"37\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"名称\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"name\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"38\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"0:删除 1：存在\"],\"columns[2].javaType\":[\"Integer\"],\"columns[2].javaField\":[\"status\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"radio\"],\"columns[2].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.project.blog\"],\"moduleName\":[\"blog\"],\"businessName\":[\"tags\"],\"functionName\":[\"标签\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode]\":[\"\"],\"params[treeName]\":[\"\"]}',0,NULL,'2019-09-14 17:49:32'),
(133,'代码生成',2,'com.ruoyi.project.tool.gen.controller.GenController.editSave()','POST',1,'admin','研发部门','/tool/gen/edit','127.0.0.1','内网IP','{\"tableId\":[\"2\"],\"tableName\":[\"blog_article_comment\"],\"tableComment\":[\"文章评论表\"],\"className\":[\"ArticleComment\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"16\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"17\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"创建时间\"],\"columns[1].javaType\":[\"Date\"],\"columns[1].javaField\":[\"createTime\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"datetime\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"18\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"删除时间\"],\"columns[2].javaType\":[\"Date\"],\"columns[2].javaField\":[\"deleteTime\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"datetime\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"19\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"0删除 1 存在\"],\"columns[3].javaType\":[\"Integer\"],\"columns[3].javaField\":[\"status\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"radio\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"20\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"用户id\"],\"columns[4].javaType\":[\"Long\"],\"columns[4].javaField\":[\"userId\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"21\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"内容\"],\"columns[5].javaType\":[\"String\"],\"columns[5].javaField\":[\"content\"],\"columns[5].isList\":[\"1\"],\"columns[5].queryType\":[\"EQ\"],\"columns[5].htmlType\":[\"input\"],\"columns[5].dictType\":[\"\"],\"columns[6].columnId\":[\"22\"],\"columns[6].sort\":[\"7\"],\"columns[6].columnComment\":[\"文章id\"],\"columns[6].javaType\":[\"Long\"],\"columns[6].javaField\":[\"articleId\"],\"columns[6].queryType\":[\"EQ\"],\"columns[6].htmlType\":[\"input\"],\"columns[6].dictType\":[',0,NULL,'2019-09-14 17:49:52'),
(134,'代码生成',2,'com.ruoyi.project.tool.gen.controller.GenController.editSave()','POST',1,'admin','研发部门','/tool/gen/edit','127.0.0.1','内网IP','{\"tableId\":[\"1\"],\"tableName\":[\"blog_article\"],\"tableComment\":[\"博客文章表\"],\"className\":[\"Article\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"1\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"2\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"创建时间\"],\"columns[1].javaType\":[\"Date\"],\"columns[1].javaField\":[\"createTime\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"datetime\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"3\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"删除时间\"],\"columns[2].javaType\":[\"Date\"],\"columns[2].javaField\":[\"deleteTime\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"datetime\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"4\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"0：删除 1：存在\"],\"columns[3].javaType\":[\"Integer\"],\"columns[3].javaField\":[\"status\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"radio\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"5\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"作者\"],\"columns[4].javaType\":[\"Long\"],\"columns[4].javaField\":[\"userId\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"6\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"标题\"],\"columns[5].javaType\":[\"String\"],\"columns[5].javaField\":[\"title\"],\"columns[5].isInsert\":[\"1\"],\"columns[5].isEdit\":[\"1\"],\"columns[5].isList\":[\"1\"],\"columns[5].isQuery\":[\"1\"],\"columns[5].queryType\":[\"EQ\"],\"columns[5].isRequired\":[\"1\"],\"columns[5].htmlType\":[\"input\"],\"columns[5].dictType\":[\"\"],\"columns[6].columnId\":[\"7\"],\"columns[6].sort\":[\"7\"],\"columns[6].col',0,NULL,'2019-09-14 17:51:06'),
(135,'代码生成',2,'com.ruoyi.project.tool.gen.controller.GenController.editSave()','POST',1,'admin','研发部门','/tool/gen/edit','127.0.0.1','内网IP','{\"tableId\":[\"5\"],\"tableName\":[\"blog_tags\"],\"tableComment\":[\"标签表\"],\"className\":[\"Tags\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"36\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"37\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"名称\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"name\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"38\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"0:删除 1：存在\"],\"columns[2].javaType\":[\"Integer\"],\"columns[2].javaField\":[\"status\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"radio\"],\"columns[2].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.project.blog\"],\"moduleName\":[\"blog\"],\"businessName\":[\"tags\"],\"functionName\":[\"标签\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode]\":[\"\"],\"params[treeName]\":[\"\"]}',0,NULL,'2019-09-14 17:51:42'),
(136,'代码生成',8,'com.ruoyi.project.tool.gen.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":[\"blog_article,blog_article_comment,blog_classify,blog_message,blog_tags\"]}',0,NULL,'2019-09-14 17:51:56'),
(137,'代码生成',8,'com.ruoyi.project.tool.gen.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":[\"blog_article,blog_article_comment,blog_classify,blog_message,blog_tags\"]}',0,NULL,'2019-09-14 17:52:10'),
(138,'文章分类',1,'com.ruoyi.project.blog.classify.controller.ClassifyController.addSave()','POST',1,'admin','研发部门','/blog/classify/add','127.0.0.1','内网IP','{\"name\":[\"前端\"]}',0,NULL,'2019-09-14 18:38:13'),
(139,'文章分类',1,'com.ruoyi.project.blog.classify.controller.ClassifyController.addSave()','POST',1,'admin','研发部门','/blog/classify/add','127.0.0.1','内网IP','{\"name\":[\"后端\"]}',0,NULL,'2019-09-14 18:38:27'),
(140,'文章分类',1,'com.ruoyi.project.blog.classify.controller.ClassifyController.addSave()','POST',1,'admin','研发部门','/blog/classify/add','127.0.0.1','内网IP','{\"name\":[\"系统\"]}',0,NULL,'2019-09-14 18:51:56'),
(141,'标签',1,'com.ruoyi.project.blog.tags.controller.TagsController.addSave()','POST',1,'admin','研发部门','/blog/tags/add','127.0.0.1','内网IP','{\"name\":[\"javascript\"],\"classifyId\":[\"1\"]}',1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may involve com.ruoyi.project.blog.tags.mapper.TagsMapper.insertTags-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into blog_tags          ( name )           values ( ? )\r\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value','2019-09-14 21:49:02'),
(142,'标签',1,'com.ruoyi.project.blog.tags.controller.TagsController.addSave()','POST',1,'admin','研发部门','/blog/tags/add','127.0.0.1','内网IP','{\"name\":[\"javascript\"],\"classifyId\":[\"1\"]}',0,NULL,'2019-09-14 21:49:42'),
(143,'标签',2,'com.ruoyi.project.blog.tags.controller.TagsController.editSave()','POST',1,'admin','研发部门','/blog/tags/edit','127.0.0.1','内网IP','{\"id\":[\"1\"],\"name\":[\"javascript\"],\"classifyId\":[\"2\"]}',1,'\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'classifyId\' cannot be null\r\n### The error may involve com.ruoyi.project.blog.tags.mapper.TagsMapper.updateTags-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update blog_tags          SET name = ?,                          classifyId = ?          where id = ?\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'classifyId\' cannot be null\n; Column \'classifyId\' cannot be null; nested exception is java.sql.SQLIntegrityConstraintViolationException: Column \'classifyId\' cannot be null','2019-09-15 00:54:06'),
(144,'标签',2,'com.ruoyi.project.blog.tags.controller.TagsController.editSave()','POST',1,'admin','研发部门','/blog/tags/edit','127.0.0.1','内网IP','{\"id\":[\"1\"],\"name\":[\"javascript\"],\"classifyId\":[\"2\"]}',1,'\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'classifyId\' cannot be null\r\n### The error may involve com.ruoyi.project.blog.tags.mapper.TagsMapper.updateTags-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update blog_tags          SET name = ?,                          classifyId = ?          where id = ?\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'classifyId\' cannot be null\n; Column \'classifyId\' cannot be null; nested exception is java.sql.SQLIntegrityConstraintViolationException: Column \'classifyId\' cannot be null','2019-09-15 00:55:25'),
(145,'标签',2,'com.ruoyi.project.blog.tags.controller.TagsController.editSave()','POST',1,'admin','研发部门','/blog/tags/edit','127.0.0.1','内网IP','{\"id\":[\"1\"],\"name\":[\"javascript\"],\"classifyId\":[\"2\"]}',1,'\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'classifyId\' cannot be null\r\n### The error may involve com.ruoyi.project.blog.tags.mapper.TagsMapper.updateTags-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update blog_tags          SET name = ?,                          classifyId = ?          where id = ?\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'classifyId\' cannot be null\n; Column \'classifyId\' cannot be null; nested exception is java.sql.SQLIntegrityConstraintViolationException: Column \'classifyId\' cannot be null','2019-09-15 00:57:49'),
(146,'标签',2,'com.ruoyi.project.blog.tags.controller.TagsController.editSave()','POST',1,'admin',NULL,'/blog/tags/edit','127.0.0.1','内网IP','{\"id\":[\"1\"],\"name\":[\"javascript\"],\"classifyId\":[\"2\"]}',0,NULL,'2019-09-15 00:58:12'),
(147,'标签',2,'com.ruoyi.project.blog.tags.controller.TagsController.editSave()','POST',1,'admin',NULL,'/blog/tags/edit','127.0.0.1','内网IP','{\"id\":[\"1\"],\"name\":[\"javascript\"],\"classifyId\":[\"1\"]}',0,NULL,'2019-09-15 00:58:20'),
(148,'博客文章',1,'com.ruoyi.project.blog.article.controller.ArticleController.addSave()','POST',1,'admin','研发部门','/blog/article/add','127.0.0.1','内网IP','{\"title\":[\"test\"],\"description\":[\"rewrwq\"],\"img\":[\"sadfasfsdfasf\"],\"classifyId\":[\"1\"],\"tagIds\":[\"1\"],\"test-editormd-markdown-doc\":[\"#你好啊 明天就回家\"],\"content\":[\"#你好啊 明天就回家\"]}',1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'userId\' doesn\'t have a default value\r\n### The error may involve com.ruoyi.project.blog.article.mapper.ArticleMapper.insertArticle-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into blog_article          ( createTime,                                                    title,             description,             content,             img,             classifyId,                                                    tagIds )           values ( ?,                                                    ?,             ?,             ?,             ?,             ?,                                                    ? )\r\n### Cause: java.sql.SQLException: Field \'userId\' doesn\'t have a default value\n; Field \'userId\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'userId\' doesn\'t have a default value','2019-09-20 20:11:03'),
(149,'博客文章',1,'com.ruoyi.project.blog.article.controller.ArticleController.addSave()','POST',1,'admin','研发部门','/blog/article/add','127.0.0.1','内网IP','{\"title\":[\"test\"],\"description\":[\"rewrwq\"],\"img\":[\"sadfasfsdfasf\"],\"classifyId\":[\"1\"],\"tagIds\":[\"1\"],\"test-editormd-markdown-doc\":[\"#你好啊 明天就回家\"],\"content\":[\"#你好啊 明天就回家\"]}',1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'userId\' doesn\'t have a default value\r\n### The error may involve com.ruoyi.project.blog.article.mapper.ArticleMapper.insertArticle-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into blog_article          ( createTime,                                                    title,             description,             content,             img,             classifyId,                                                    tagIds )           values ( ?,                                                    ?,             ?,             ?,             ?,             ?,                                                    ? )\r\n### Cause: java.sql.SQLException: Field \'userId\' doesn\'t have a default value\n; Field \'userId\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'userId\' doesn\'t have a default value','2019-09-20 20:26:55'),
(150,'博客文章',1,'com.ruoyi.project.blog.article.controller.ArticleController.addSave()','POST',1,'admin',NULL,'/blog/article/add','127.0.0.1','内网IP','{\"title\":[\"test\"],\"description\":[\"rewrwq\"],\"img\":[\"sadfasfsdfasf\"],\"classifyId\":[\"1\"],\"tagIds\":[\"1\"],\"test-editormd-markdown-doc\":[\"#你好啊 明天就回家\"],\"content\":[\"#你好啊 明天就回家\"]}',0,NULL,'2019-09-20 20:28:38'),
(151,'博客文章',1,'com.ruoyi.project.blog.article.controller.ArticleController.addSave()','POST',1,'admin',NULL,'/blog/article/add','127.0.0.1','内网IP','{\"title\":[\"test\"],\"description\":[\"1231\"],\"img\":[\"asdfsadfsad\"],\"classifyId\":[\"1\"],\"tagIds\":[\"1\"],\"test-editormd-markdown-doc\":[\"# 你好啊，这是第一篇文章\"],\"content\":[\"# 你好啊，这是第一篇文章\"]}',0,NULL,'2019-09-20 20:31:30'),
(152,'代码生成',6,'com.ruoyi.project.tool.gen.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":[\"sys_file_info\"]}',0,NULL,'2019-09-20 23:13:19'),
(153,'代码生成',2,'com.ruoyi.project.tool.gen.controller.GenController.editSave()','POST',1,'admin','研发部门','/tool/gen/edit','127.0.0.1','内网IP','{\"tableId\":[\"6\"],\"tableName\":[\"sys_file_info\"],\"tableComment\":[\"文件表\"],\"className\":[\"FileInfo\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"39\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"id\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"40\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"创建时间\"],\"columns[1].javaType\":[\"Date\"],\"columns[1].javaField\":[\"createTime\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"datetime\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"41\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"文件名称\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"name\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"LIKE\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"42\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"绝对路径\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"abPath\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"43\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"相对路径\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"rtPath\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"44\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"网络地址\"],\"columns[5].javaType\":[\"String\"],\"columns[5].javaField\":[\"url\"],\"columns[5].isInsert\":[\"1\"],\"colu',0,NULL,'2019-09-20 23:14:12'),
(154,'代码生成',2,'com.ruoyi.project.tool.gen.controller.GenController.editSave()','POST',1,'admin','研发部门','/tool/gen/edit','127.0.0.1','内网IP','{\"tableId\":[\"6\"],\"tableName\":[\"sys_file_info\"],\"tableComment\":[\"文件表\"],\"className\":[\"FileInfo\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"39\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"id\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"40\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"创建时间\"],\"columns[1].javaType\":[\"Date\"],\"columns[1].javaField\":[\"createTime\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"datetime\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"41\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"文件名称\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"name\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"LIKE\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"42\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"绝对路径\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"abPath\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"43\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"相对路径\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"rtPath\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"44\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"网络地址\"],\"columns[5].javaType\":[\"String\"],\"columns[5].javaField\":[\"url\"],\"columns[5].isInsert\":[\"1\"],\"colu',0,NULL,'2019-09-20 23:14:31'),
(155,'代码生成',8,'com.ruoyi.project.tool.gen.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":[\"sys_file_info\"]}',0,NULL,'2019-09-20 23:14:40'),
(156,'个人信息',2,'com.ruoyi.project.system.user.controller.ProfileController.updateAvatar()','POST',1,'admin','研发部门','/system/user/profile/updateAvatar','127.0.0.1','内网IP','{}',0,NULL,'2019-09-21 00:11:30'),
(157,'博客文章',1,'com.ruoyi.project.blog.article.controller.ArticleController.addSave()','POST',1,'admin','研发部门','/blog/article/add','127.0.0.1','内网IP','{\"fileId\":[\"56575_1.jpg\"],\"initialPreview\":[\"[\\\"/img/profile.jpg\\\"]\"],\"initialPreviewConfig\":[\"[{\\\"type\\\":\\\"image\\\"}]\"],\"initialPreviewThumbTags\":[\"[]\"]}',1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'classifyId\' doesn\'t have a default value\r\n### The error may involve com.ruoyi.project.blog.article.mapper.ArticleMapper.insertArticle-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into blog_article          ( createTime,                                       userId )           values ( ?,                                       ? )\r\n### Cause: java.sql.SQLException: Field \'classifyId\' doesn\'t have a default value\n; Field \'classifyId\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'classifyId\' doesn\'t have a default value','2019-09-21 11:07:00'),
(158,'博客文章',1,'com.ruoyi.project.blog.article.controller.ArticleController.addSave()','POST',1,'admin',NULL,'/blog/article/add','127.0.0.1','内网IP','{\"title\":[\"test2\"],\"description\":[\"test2\"],\"classifyId\":[\"2\"],\"tagIds\":[\"1\"],\"test-editormd-markdown-doc\":[\"# test02\"],\"content\":[\"# test02\"]}',1,'','2019-09-21 11:23:02'),
(159,'博客文章',1,'com.ruoyi.project.blog.article.controller.ArticleController.addSave()','POST',1,'admin',NULL,'/blog/article/add','127.0.0.1','内网IP','{\"title\":[\"ces\"],\"description\":[\"1231\"],\"classifyId\":[\"1\"],\"tagIds\":[\"1\"],\"test-editormd-markdown-doc\":[\"uhoijh\"],\"content\":[\"uhoijh\"]}',1,'','2019-09-21 11:39:51'),
(160,'博客文章',1,'com.ruoyi.project.blog.article.controller.ArticleController.addSave()','POST',1,'admin','研发部门','/blog/article/add','127.0.0.1','内网IP','{\"title\":[\"ces\"],\"description\":[\"1231\"],\"classifyId\":[\"1\"],\"tagIds\":[\"1\"],\"test-editormd-markdown-doc\":[\"dsfsadsad\"],\"content\":[\"dsfsadsad\"]}',0,NULL,'2019-09-21 12:01:47'),
(161,'博客文章',2,'com.ruoyi.project.blog.article.controller.ArticleController.editSave()','POST',1,'admin','研发部门','/blog/article/edit','127.0.0.1','内网IP','{\"content\":[\"dsfsadsad\"]}',1,'','2019-09-21 14:11:00'),
(162,'博客文章',2,'com.ruoyi.project.blog.article.controller.ArticleController.editSave()','POST',1,'admin','研发部门','/blog/article/edit','127.0.0.1','内网IP','{\"content\":[\"dsfsadsad\"]}',0,NULL,'2019-09-21 14:13:57'),
(163,'博客文章',2,'com.ruoyi.project.blog.article.controller.ArticleController.editSave()','POST',1,'admin','研发部门','/blog/article/edit','127.0.0.1','内网IP','{\"content\":[\"dsfsadsad\"]}',0,NULL,'2019-09-21 14:15:56'),
(164,'博客文章',2,'com.ruoyi.project.blog.article.controller.ArticleController.editSave()','POST',1,'admin','研发部门','/blog/article/edit','127.0.0.1','内网IP','{\"id\":[\"3\"],\"title\":[\"ces\"],\"description\":[\"1231\"],\"classifyId\":[\"1\"],\"tagIds\":[\"1\"],\"test-editormd-markdown-doc\":[\"dsfsadsad\"],\"content\":[\"dsfsadsad\"]}',0,NULL,'2019-09-21 14:17:02'),
(165,'博客文章',2,'com.ruoyi.project.blog.article.controller.ArticleController.editSave()','POST',1,'admin','研发部门','/blog/article/edit','127.0.0.1','内网IP','{\"id\":[\"3\"],\"title\":[\"ces\"],\"description\":[\"1231\"],\"classifyId\":[\"1\"],\"tagIds\":[\"1\"],\"test-editormd-markdown-doc\":[\"dsfsadsad\"],\"content\":[\"dsfsadsad\"]}',0,NULL,'2019-09-21 14:21:00'),
(166,'博客文章',2,'com.ruoyi.project.blog.article.controller.ArticleController.editSave()','POST',1,'admin','研发部门','/blog/article/edit','127.0.0.1','内网IP','{\"id\":[\"3\"],\"title\":[\"ces\"],\"description\":[\"1231\"],\"classifyId\":[\"1\"],\"tagIds\":[\"1\"],\"test-editormd-markdown-doc\":[\"dsfsadsad\"],\"content\":[\"dsfsadsad\"]}',0,NULL,'2019-09-21 14:24:37'),
(167,'博客文章',3,'com.ruoyi.project.blog.article.controller.ArticleController.remove()','POST',1,'admin','研发部门','/blog/article/remove','127.0.0.1','内网IP','{\"ids\":[\"3\"]}',0,NULL,'2019-09-23 23:23:52'),
(168,'博客文章',3,'com.ruoyi.project.blog.article.controller.ArticleController.remove()','POST',1,'admin','研发部门','/blog/article/remove','127.0.0.1','内网IP','{\"ids\":[\"2\"]}',0,NULL,'2019-09-23 23:23:55'),
(169,'博客文章',3,'com.ruoyi.project.blog.article.controller.ArticleController.remove()','POST',1,'admin','研发部门','/blog/article/remove','127.0.0.1','内网IP','{\"ids\":[\"1\"]}',0,NULL,'2019-09-23 23:23:57'),
(170,'博客文章',1,'com.ruoyi.project.blog.article.controller.ArticleController.addSave()','POST',1,'admin','研发部门','/blog/article/add','127.0.0.1','内网IP','{\"title\":[\"test\"],\"description\":[\"1\"],\"classifyId\":[\"1\"],\"tagIds\":[\"1\"],\"test-editormd-markdown-doc\":[\"# 你好，这是一篇测试文章\\r\\n![](http://localhost/profile/blog/2019/09/23/80b63404dcbb8d49279d060841307b57.PNG)\"],\"content\":[\"# 你好，这是一篇测试文章\\n![](http://localhost/profile/blog/2019/09/23/80b63404dcbb8d49279d060841307b57.PNG)\"]}',0,NULL,'2019-09-23 23:24:30'),
(171,'博客文章',2,'com.ruoyi.project.blog.article.controller.ArticleController.editSave()','POST',1,'admin','研发部门','/blog/article/edit','127.0.0.1','内网IP','{\"id\":[\"4\"],\"title\":[\"test\"],\"description\":[\"1\"],\"classifyId\":[\"1\"],\"tagIds\":[\"1\"],\"test-editormd-markdown-doc\":[\"# 你好，这是一篇测试文章\\r\\n![](http://localhost/profile/blog/2019/09/23/80b63404dcbb8d49279d060841307b57.PNG)\\r\\n![](http://localhost/profile/blog/2019/09/23/379a28ca7c15f6ae39e9040dd8ef207c.PNG)\"],\"content\":[\"# 你好，这是一篇测试文章\\n![](http://localhost/profile/blog/2019/09/23/80b63404dcbb8d49279d060841307b57.PNG)\\n![](http://localhost/profile/blog/2019/09/23/379a28ca7c15f6ae39e9040dd8ef207c.PNG)\"]}',0,NULL,'2019-09-23 23:40:13'),
(172,'标签',1,'com.ruoyi.project.blog.tags.controller.TagsController.addSave()','POST',1,'admin','研发部门','/blog/tags/add','127.0.0.1','内网IP','{\"name\":[\"vue\"],\"classifyId\":[\"1\"]}',0,NULL,'2019-09-24 23:48:53'),
(173,'博客文章',1,'com.ruoyi.project.blog.article.controller.ArticleController.addSave()','POST',1,'admin','研发部门','/blog/article/add','127.0.0.1','内网IP','{\"title\":[\"testtags\"],\"description\":[\"testtags\"],\"classifyId\":[\"1\"],\"tagIds\":[\"1\",\"2\"],\"test-editormd-markdown-doc\":[\"ces\"],\"content\":[\"ces\"],\"tags\":[\"javascriptvue\"]}',0,NULL,'2019-09-24 23:49:19'),
(174,'博客文章',2,'com.ruoyi.project.blog.article.controller.ArticleController.editSave()','POST',1,'admin','研发部门','/blog/article/edit','127.0.0.1','内网IP','{\"id\":[\"5\"],\"title\":[\"testtags\"],\"description\":[\"testtags\"],\"classifyId\":[\"1\"],\"tagIds\":[\"1\",\"2\"],\"test-editormd-markdown-doc\":[\"ces\"],\"content\":[\"ces\"],\"tags\":[\"\"]}',0,NULL,'2019-09-24 23:55:40'),
(175,'博客文章',2,'com.ruoyi.project.blog.article.controller.ArticleController.editSave()','POST',1,'admin','研发部门','/blog/article/edit','127.0.0.1','内网IP','{\"id\":[\"5\"],\"title\":[\"testtags\"],\"description\":[\"testtags\"],\"classifyId\":[\"1\"],\"tagIds\":[\"1\",\"2\"],\"test-editormd-markdown-doc\":[\"ces\"],\"content\":[\"ces\"],\"tags\":[\"javascript,vue\"]}',0,NULL,'2019-09-24 23:57:13'),
(176,'博客文章',2,'com.ruoyi.project.blog.article.controller.ArticleController.editSave()','POST',1,'admin','研发部门','/blog/article/edit','127.0.0.1','内网IP','{\"id\":[\"5\"],\"title\":[\"testtags\"],\"description\":[\"testtags\"],\"classifyId\":[\"1\"],\"tagIds\":[\"2\"],\"test-editormd-markdown-doc\":[\"ces\"],\"content\":[\"ces\"],\"tags\":[\"vue\"]}',0,NULL,'2019-09-25 00:04:39'),
(177,'代码生成',6,'com.ruoyi.project.tool.gen.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":[\"blog_banner,blog_link\"]}',0,NULL,'2019-09-26 00:22:24'),
(178,'代码生成',2,'com.ruoyi.project.tool.gen.controller.GenController.editSave()','POST',1,'admin','研发部门','/tool/gen/edit','127.0.0.1','内网IP','{\"tableId\":[\"7\"],\"tableName\":[\"blog_banner\"],\"tableComment\":[\"banner图\"],\"className\":[\"Banner\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"45\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"46\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"图片地址\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"url\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"47\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"描述\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"description\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"48\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"类型：自定义。自己根据用途\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"type\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"select\"],\"columns[3].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.project.system\"],\"moduleName\":[\"system\"],\"businessName\":[\"banner\"],\"functionName\":[\"banner图\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode]\":[\"\"],\"params[treeName]\":[\"\"]}',0,NULL,'2019-09-26 00:23:09'),
(179,'代码生成',8,'com.ruoyi.project.tool.gen.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":[\"blog_banner,blog_link\"]}',0,NULL,'2019-09-26 00:23:34'),
(180,'代码生成',2,'com.ruoyi.project.tool.gen.controller.GenController.editSave()','POST',1,'admin','研发部门','/tool/gen/edit','127.0.0.1','内网IP','{\"tableId\":[\"7\"],\"tableName\":[\"blog_banner\"],\"tableComment\":[\"banner图\"],\"className\":[\"Banner\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"45\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"46\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"图片地址\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"url\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"47\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"描述\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"description\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"48\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"类型：自定义。自己根据用途\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"type\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"select\"],\"columns[3].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.project.blog\"],\"moduleName\":[\"blog\"],\"businessName\":[\"banner\"],\"functionName\":[\"banner图\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode]\":[\"\"],\"params[treeName]\":[\"\"]}',0,NULL,'2019-09-26 00:27:19'),
(181,'代码生成',2,'com.ruoyi.project.tool.gen.controller.GenController.editSave()','POST',1,'admin','研发部门','/tool/gen/edit','127.0.0.1','内网IP','{\"tableId\":[\"8\"],\"tableName\":[\"blog_link\"],\"tableComment\":[\"友链\"],\"className\":[\"Link\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"49\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"50\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"名称\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"name\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"51\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"友链地址\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"url\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"textarea\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"52\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"头像地址\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"avatar\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"textarea\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"53\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"简介\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"introduction\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"textarea\"],\"columns[4].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.project.blog\"],\"moduleName\":[\"blog\"],\"businessName\":[\"link\"],\"functionName\":[\"友链\"],',0,NULL,'2019-09-26 00:27:35'),
(182,'代码生成',8,'com.ruoyi.project.tool.gen.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":[\"blog_banner,blog_link\"]}',0,NULL,'2019-09-26 00:27:45'),
(183,'菜单管理',2,'com.ruoyi.project.system.menu.controller.MenuController.editSave()','POST',1,'admin','研发部门','/system/menu/edit','127.0.0.1','内网IP','{\"menuId\":[\"2041\"],\"parentId\":[\"2025\"],\"menuType\":[\"C\"],\"menuName\":[\"banner图\"],\"url\":[\"/blog/banner\"],\"target\":[\"menuItem\"],\"perms\":[\"blog:banner:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}',0,NULL,'2019-09-26 00:32:25'),
(184,'菜单管理',2,'com.ruoyi.project.system.menu.controller.MenuController.editSave()','POST',1,'admin','研发部门','/system/menu/edit','127.0.0.1','内网IP','{\"menuId\":[\"2046\"],\"parentId\":[\"2025\"],\"menuType\":[\"C\"],\"menuName\":[\"友链\"],\"url\":[\"/blog/link\"],\"target\":[\"menuItem\"],\"perms\":[\"system:link:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}',0,NULL,'2019-09-26 00:32:48'),
(185,'友链',1,'com.ruoyi.project.blog.link.controller.LinkController.addSave()','POST',1,'admin','研发部门','/blog/link/add','127.0.0.1','内网IP','{\"name\":[\"soulCoke\"],\"url\":[\"http:www.baidu.com\"],\"avatar\":[\"http://f.youdao.com/?vendor=fanyi-new-bottom\"],\"introduction\":[\"这是一个测试友链\"]}',0,NULL,'2019-09-26 00:35:20'),
(186,'banner图',1,'com.ruoyi.project.blog.banner.controller.BannerController.addSave()','POST',1,'admin','研发部门','/blog/banner/add','127.0.0.1','内网IP','{\"description\":[\"首页1\"],\"type\":[\"banner-01\"]}',0,NULL,'2019-09-26 00:46:10'),
(187,'banner图',1,'com.ruoyi.project.blog.banner.controller.BannerController.addSave()','POST',1,'admin','研发部门','/blog/banner/add','127.0.0.1','内网IP','{\"description\":[\"首页2\"],\"type\":[\"banner-02\"]}',0,NULL,'2019-09-26 14:47:56'),
(188,'banner图',1,'com.ruoyi.project.blog.banner.controller.BannerController.addSave()','POST',1,'admin','研发部门','/blog/banner/add','127.0.0.1','内网IP','{\"description\":[\"首页3\"],\"type\":[\"banner-03\"]}',0,NULL,'2019-09-26 14:48:11'),
(189,'banner图',1,'com.ruoyi.project.blog.banner.controller.BannerController.addSave()','POST',1,'admin','研发部门','/blog/banner/add','127.0.0.1','内网IP','{\"description\":[\"首页1\"],\"type\":[\"banner-04\"]}',0,NULL,'2019-09-26 14:48:26'),
(190,'banner图',1,'com.ruoyi.project.blog.banner.controller.BannerController.addSave()','POST',1,'admin','研发部门','/blog/banner/add','127.0.0.1','内网IP','{\"description\":[\"首页1\"],\"type\":[\"banner-05\"]}',0,NULL,'2019-09-26 15:23:26'),
(191,'banner图',1,'com.ruoyi.project.blog.banner.controller.BannerController.addSave()','POST',1,'admin','研发部门','/blog/banner/add','127.0.0.1','内网IP','{\"description\":[\"首页1\"],\"type\":[\"banner-06\"]}',0,NULL,'2019-09-26 15:24:11'),
(192,'banner图',2,'com.ruoyi.project.blog.banner.controller.BannerController.editSave()','POST',1,'admin','研发部门','/blog/banner/edit','127.0.0.1','内网IP','{\"id\":[\"1\"],\"description\":[\"首页1\"],\"type\":[\"headnav\"]}',1,'','2019-09-27 11:33:45'),
(193,'banner图',2,'com.ruoyi.project.blog.banner.controller.BannerController.editSave()','POST',1,'admin','研发部门','/blog/banner/edit','127.0.0.1','内网IP','{\"id\":[\"1\"],\"description\":[\"首页1\"],\"type\":[\"headnav\"]}',0,NULL,'2019-09-27 11:41:35'),
(194,'banner图',2,'com.ruoyi.project.blog.banner.controller.BannerController.editSave()','POST',1,'admin','研发部门','/blog/banner/edit','127.0.0.1','内网IP','{\"id\":[\"2\"],\"description\":[\"友链\"],\"type\":[\"link\"]}',0,NULL,'2019-09-27 11:41:52'),
(195,'banner图',2,'com.ruoyi.project.blog.banner.controller.BannerController.editSave()','POST',1,'admin','研发部门','/blog/banner/edit','127.0.0.1','内网IP','{\"id\":[\"1\"],\"description\":[\"头部\"],\"type\":[\"headnav\"]}',0,NULL,'2019-09-27 11:42:04'),
(196,'banner图',2,'com.ruoyi.project.blog.banner.controller.BannerController.editSave()','POST',1,'admin','研发部门','/blog/banner/edit','127.0.0.1','内网IP','{\"id\":[\"3\"],\"description\":[\"捐赠\"],\"type\":[\"donate\"]}',0,NULL,'2019-09-27 11:42:26'),
(197,'banner图',2,'com.ruoyi.project.blog.banner.controller.BannerController.editSave()','POST',1,'admin','研发部门','/blog/banner/edit','127.0.0.1','内网IP','{\"id\":[\"4\"],\"description\":[\"支付宝\"],\"type\":[\"zhifubao\"]}',0,NULL,'2019-09-27 11:42:38'),
(198,'banner图',2,'com.ruoyi.project.blog.banner.controller.BannerController.editSave()','POST',1,'admin','研发部门','/blog/banner/edit','127.0.0.1','内网IP','{\"id\":[\"5\"],\"description\":[\"微信收款码\"],\"type\":[\"weixin\"]}',0,NULL,'2019-09-27 11:42:56'),
(199,'banner图',2,'com.ruoyi.project.blog.banner.controller.BannerController.editSave()','POST',1,'admin','研发部门','/blog/banner/edit','127.0.0.1','内网IP','{\"id\":[\"4\"],\"description\":[\"支付宝收款码\"],\"type\":[\"zhifubao\"]}',0,NULL,'2019-09-27 11:43:02'),
(200,'banner图',2,'com.ruoyi.project.blog.banner.controller.BannerController.editSave()','POST',1,'admin','研发部门','/blog/banner/edit','127.0.0.1','内网IP','{\"id\":[\"6\"],\"description\":[\"关于\"],\"type\":[\"about\"]}',0,NULL,'2019-09-27 11:43:16'),
(201,'banner图',1,'com.ruoyi.project.blog.banner.controller.BannerController.addSave()','POST',1,'admin','研发部门','/blog/banner/add','127.0.0.1','内网IP','{\"description\":[\"留言\"],\"type\":[\"message\"]}',0,NULL,'2019-09-27 11:43:32');

UNLOCK TABLES;

/*Table structure for table `sys_post` */

DROP TABLE IF EXISTS `sys_post`;

CREATE TABLE `sys_post` (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='岗位信息表';

/*Data for the table `sys_post` */

LOCK TABLES `sys_post` WRITE;

insert  into `sys_post`(`post_id`,`post_code`,`post_name`,`post_sort`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values 
(1,'ceo','董事长',1,'0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
(2,'se','项目经理',2,'0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
(3,'hr','人力资源',3,'0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),
(4,'user','普通员工',4,'0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','');

UNLOCK TABLES;

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='角色信息表';

/*Data for the table `sys_role` */

LOCK TABLES `sys_role` WRITE;

insert  into `sys_role`(`role_id`,`role_name`,`role_key`,`role_sort`,`data_scope`,`status`,`del_flag`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values 
(1,'管理员','admin',1,'1','0','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','管理员'),
(2,'普通角色','common',2,'2','0','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','普通角色');

UNLOCK TABLES;

/*Table structure for table `sys_role_dept` */

DROP TABLE IF EXISTS `sys_role_dept`;

CREATE TABLE `sys_role_dept` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色和部门关联表';

/*Data for the table `sys_role_dept` */

LOCK TABLES `sys_role_dept` WRITE;

insert  into `sys_role_dept`(`role_id`,`dept_id`) values 
(2,100),
(2,101),
(2,105);

UNLOCK TABLES;

/*Table structure for table `sys_role_menu` */

DROP TABLE IF EXISTS `sys_role_menu`;

CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色和菜单关联表';

/*Data for the table `sys_role_menu` */

LOCK TABLES `sys_role_menu` WRITE;

insert  into `sys_role_menu`(`role_id`,`menu_id`) values 
(2,1),
(2,2),
(2,3),
(2,100),
(2,101),
(2,102),
(2,103),
(2,104),
(2,105),
(2,106),
(2,107),
(2,108),
(2,109),
(2,110),
(2,111),
(2,112),
(2,113),
(2,114),
(2,115),
(2,500),
(2,501),
(2,1000),
(2,1001),
(2,1002),
(2,1003),
(2,1004),
(2,1005),
(2,1006),
(2,1007),
(2,1008),
(2,1009),
(2,1010),
(2,1011),
(2,1012),
(2,1013),
(2,1014),
(2,1015),
(2,1016),
(2,1017),
(2,1018),
(2,1019),
(2,1020),
(2,1021),
(2,1022),
(2,1023),
(2,1024),
(2,1025),
(2,1026),
(2,1027),
(2,1028),
(2,1029),
(2,1030),
(2,1031),
(2,1032),
(2,1033),
(2,1034),
(2,1035),
(2,1036),
(2,1037),
(2,1038),
(2,1039),
(2,1040),
(2,1041),
(2,1042),
(2,1043),
(2,1044),
(2,1045),
(2,1046),
(2,1047),
(2,1048),
(2,1049),
(2,1050),
(2,1051),
(2,1052),
(2,1053),
(2,1054),
(2,1055),
(2,1056),
(2,1057),
(2,1058),
(2,1059),
(2,1060);

UNLOCK TABLES;

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) DEFAULT '' COMMENT '密码',
  `salt` varchar(20) DEFAULT '' COMMENT '盐加密',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(50) DEFAULT '' COMMENT '最后登陆IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='用户信息表';

/*Data for the table `sys_user` */

LOCK TABLES `sys_user` WRITE;

insert  into `sys_user`(`user_id`,`dept_id`,`login_name`,`user_name`,`user_type`,`email`,`phonenumber`,`sex`,`avatar`,`password`,`salt`,`status`,`del_flag`,`login_ip`,`login_date`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values 
(1,103,'admin','若依','00','ry@163.com','15888888888','1','/profile/avatar/2019/09/21/c9ebbba71a51c00a3500e4239b60a464.png','29c67a30398638269fe600f73a054934','111111','0','0','127.0.0.1','2019-09-27 11:41:24','admin','2018-03-16 11:33:00','ry','2019-09-27 11:41:23','管理员'),
(2,105,'ry','若依','00','ry@qq.com','15666666666','1','','8e6d98b90472783cc73c17047ddccf36','222222','0','0','127.0.0.1','2018-03-16 11:33:00','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','测试员');

UNLOCK TABLES;

/*Table structure for table `sys_user_online` */

DROP TABLE IF EXISTS `sys_user_online`;

CREATE TABLE `sys_user_online` (
  `sessionId` varchar(50) NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(50) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int(5) DEFAULT '0' COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='在线用户记录';

/*Data for the table `sys_user_online` */

LOCK TABLES `sys_user_online` WRITE;

insert  into `sys_user_online`(`sessionId`,`login_name`,`dept_name`,`ipaddr`,`login_location`,`browser`,`os`,`status`,`start_timestamp`,`last_access_time`,`expire_time`) values 
('97eddc6f-ec2e-496d-8831-46008ec9417f','admin','研发部门','127.0.0.1','内网IP','Chrome','Windows 10','on_line','2019-09-27 11:41:20','2019-09-27 11:46:42',1800000);

UNLOCK TABLES;

/*Table structure for table `sys_user_post` */

DROP TABLE IF EXISTS `sys_user_post`;

CREATE TABLE `sys_user_post` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户与岗位关联表';

/*Data for the table `sys_user_post` */

LOCK TABLES `sys_user_post` WRITE;

insert  into `sys_user_post`(`user_id`,`post_id`) values 
(1,1),
(2,2);

UNLOCK TABLES;

/*Table structure for table `sys_user_role` */

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户和角色关联表';

/*Data for the table `sys_user_role` */

LOCK TABLES `sys_user_role` WRITE;

insert  into `sys_user_role`(`user_id`,`role_id`) values 
(1,1),
(2,2);

UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
