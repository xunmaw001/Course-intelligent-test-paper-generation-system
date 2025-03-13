-- MySQL dump 10.13  Distrib 5.7.31, for Linux (x86_64)
--
-- Host: localhost    Database: ssms0i0l
-- ------------------------------------------------------
-- Server version	5.7.31

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
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='配置文件';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES (1,'picture1','http://localhost:8080/ssms0i0l/upload/picture1.jpg'),(2,'picture2','http://localhost:8080/ssms0i0l/upload/picture2.jpg'),(3,'picture3','http://localhost:8080/ssms0i0l/upload/picture3.jpg'),(6,'homepage',NULL);
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exampaper`
--

DROP TABLE IF EXISTS `exampaper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exampaper` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `name` varchar(200) NOT NULL COMMENT '试卷名称',
  `time` int(11) NOT NULL COMMENT '考试时长(分钟)',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '试卷状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1616316031302 DEFAULT CHARSET=utf8 COMMENT='试卷表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exampaper`
--

LOCK TABLES `exampaper` WRITE;
/*!40000 ALTER TABLE `exampaper` DISABLE KEYS */;
INSERT INTO `exampaper` VALUES (1616316031301,'2021-03-21 08:40:30','java课程设计',45,1);
/*!40000 ALTER TABLE `exampaper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examquestion`
--

DROP TABLE IF EXISTS `examquestion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `examquestion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `paperid` bigint(20) NOT NULL COMMENT '所属试卷id（外键）',
  `papername` varchar(200) NOT NULL COMMENT '试卷名称',
  `questionname` varchar(200) NOT NULL COMMENT '试题名称',
  `options` longtext COMMENT '选项，json字符串',
  `score` bigint(20) DEFAULT '0' COMMENT '分值',
  `answer` varchar(200) DEFAULT NULL COMMENT '正确答案',
  `analysis` longtext COMMENT '答案解析',
  `type` bigint(20) DEFAULT '0' COMMENT '试题类型，0：单选题 1：多选题 2：判断题 3：填空题（暂不考虑多项填空）',
  `sequence` bigint(20) DEFAULT '100' COMMENT '试题排序，值越大排越前面',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1616316212868 DEFAULT CHARSET=utf8 COMMENT='试题表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examquestion`
--

LOCK TABLES `examquestion` WRITE;
/*!40000 ALTER TABLE `examquestion` DISABLE KEYS */;
INSERT INTO `examquestion` VALUES (1616316104798,'2021-03-21 08:41:44',1616316031301,'java课程设计','java是什么语言','[{\"text\":\"A.高级语言\",\"code\":\"A\"},{\"text\":\"B.低级语言\",\"code\":\"B\"},{\"text\":\"C.程序语言\",\"code\":\"C\"},{\"text\":\"D.外国语言\",\"code\":\"D\"}]',5,'A','java是高级语言',0,1),(1616316137994,'2021-03-21 08:42:17',1616316031301,'java课程设计','java是什么，请详细说明','[]',20,'java就是...','java是是是',3,2),(1616316184668,'2021-03-21 08:43:04',1616316031301,'java课程设计','java事实上','[{\"text\":\"A.22\",\"code\":\"A\"},{\"text\":\"B.54\",\"code\":\"B\"},{\"text\":\"C.cd\",\"code\":\"C\"},{\"text\":\"D.1的\",\"code\":\"D\"}]',10,'A,C','java是',1,3),(1616316212867,'2021-03-21 08:43:32',1616316031301,'java课程设计','java怎么了','[{\"text\":\"A.对\",\"code\":\"A\"},{\"text\":\"B.错\",\"code\":\"B\"}]',5,'A','jva手术室',2,2);
/*!40000 ALTER TABLE `examquestion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examrecord`
--

DROP TABLE IF EXISTS `examrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `examrecord` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(200) DEFAULT NULL COMMENT '用户名',
  `paperid` bigint(20) NOT NULL COMMENT '试卷id（外键）',
  `papername` varchar(200) NOT NULL COMMENT '试卷名称',
  `questionid` bigint(20) NOT NULL COMMENT '试题id（外键）',
  `questionname` varchar(200) NOT NULL COMMENT '试题名称',
  `options` longtext COMMENT '选项，json字符串',
  `score` bigint(20) DEFAULT '0' COMMENT '分值',
  `answer` varchar(200) DEFAULT NULL COMMENT '正确答案',
  `analysis` longtext COMMENT '答案解析',
  `myscore` bigint(20) NOT NULL DEFAULT '0' COMMENT '试题得分',
  `myanswer` varchar(200) DEFAULT NULL COMMENT '考生答案',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1616316268816 DEFAULT CHARSET=utf8 COMMENT='考试记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examrecord`
--

LOCK TABLES `examrecord` WRITE;
/*!40000 ALTER TABLE `examrecord` DISABLE KEYS */;
INSERT INTO `examrecord` VALUES (1616316250090,'2021-03-21 08:44:09',1616315867511,NULL,1616316031301,'java课程设计',1616316104798,'java是什么语言','[{\"text\":\"A.高级语言\",\"code\":\"A\"},{\"text\":\"B.低级语言\",\"code\":\"B\"},{\"text\":\"C.程序语言\",\"code\":\"C\"},{\"text\":\"D.外国语言\",\"code\":\"D\"}]',5,'A','java是高级语言',5,'A'),(1616316259374,'2021-03-21 08:44:18',1616315867511,NULL,1616316031301,'java课程设计',1616316137994,'java是什么，请详细说明','[]',20,'java就是...','java是是是',0,'fff'),(1616316262591,'2021-03-21 08:44:22',1616315867511,NULL,1616316031301,'java课程设计',1616316212867,'java怎么了','[{\"text\":\"A.对\",\"code\":\"A\"},{\"text\":\"B.错\",\"code\":\"B\"}]',5,'A','jva手术室',5,'A'),(1616316268815,'2021-03-21 08:44:28',1616315867511,NULL,1616316031301,'java课程设计',1616316184668,'java事实上','[{\"text\":\"A.22\",\"code\":\"A\"},{\"text\":\"B.54\",\"code\":\"B\"},{\"text\":\"C.cd\",\"code\":\"C\"},{\"text\":\"D.1的\",\"code\":\"D\"}]',10,'A,C','java是',10,'A,C');
/*!40000 ALTER TABLE `examrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laoshi`
--

DROP TABLE IF EXISTS `laoshi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `laoshi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `laoshizhanghao` varchar(200) NOT NULL COMMENT '老师账号',
  `mima` varchar(200) NOT NULL COMMENT '密码',
  `laoshixingming` varchar(200) NOT NULL COMMENT '老师姓名',
  `chushengriqi` date DEFAULT NULL COMMENT '出生日期',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  `laoshishouji` varchar(200) DEFAULT NULL COMMENT '老师手机',
  `laoshiyouxiang` varchar(200) DEFAULT NULL COMMENT '老师邮箱',
  `zhaopian` varchar(200) DEFAULT NULL COMMENT '照片',
  PRIMARY KEY (`id`),
  UNIQUE KEY `laoshizhanghao` (`laoshizhanghao`)
) ENGINE=InnoDB AUTO_INCREMENT=1616315919931 DEFAULT CHARSET=utf8 COMMENT='老师';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laoshi`
--

LOCK TABLES `laoshi` WRITE;
/*!40000 ALTER TABLE `laoshi` DISABLE KEYS */;
INSERT INTO `laoshi` VALUES (21,'2021-03-21 08:35:06','老师1','123456','老师姓名1','2021-03-21','男','13823888881','773890001@qq.com','http://localhost:8080/ssms0i0l/upload/laoshi_zhaopian1.jpg'),(22,'2021-03-21 08:35:06','老师2','123456','老师姓名2','2021-03-21','男','13823888882','773890002@qq.com','http://localhost:8080/ssms0i0l/upload/laoshi_zhaopian2.jpg'),(23,'2021-03-21 08:35:06','老师3','123456','老师姓名3','2021-03-21','男','13823888883','773890003@qq.com','http://localhost:8080/ssms0i0l/upload/laoshi_zhaopian3.jpg'),(24,'2021-03-21 08:35:06','老师4','123456','老师姓名4','2021-03-21','男','13823888884','773890004@qq.com','http://localhost:8080/ssms0i0l/upload/laoshi_zhaopian4.jpg'),(25,'2021-03-21 08:35:06','老师5','123456','老师姓名5','2021-03-21','男','13823888885','773890005@qq.com','http://localhost:8080/ssms0i0l/upload/laoshi_zhaopian5.jpg'),(26,'2021-03-21 08:35:06','老师6','123456','老师姓名6','2021-03-21','男','13823888886','773890006@qq.com','http://localhost:8080/ssms0i0l/upload/laoshi_zhaopian6.jpg'),(1616315919930,'2021-03-21 08:38:39','21','21','21','2021-03-08','女','12345678909','ww@qq.com','http://localhost:8080/ssms0i0l/upload/1616315918653.png');
/*!40000 ALTER TABLE `laoshi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `title` varchar(200) NOT NULL COMMENT '标题',
  `introduction` longtext COMMENT '简介',
  `picture` varchar(200) NOT NULL COMMENT '图片',
  `content` longtext NOT NULL COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1616315974754 DEFAULT CHARSET=utf8 COMMENT='公告通知';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (61,'2021-03-21 08:35:06','标题1','简介1','http://localhost:8080/ssms0i0l/upload/news_picture1.jpg','内容1'),(62,'2021-03-21 08:35:06','标题2','简介2','http://localhost:8080/ssms0i0l/upload/news_picture2.jpg','内容2'),(63,'2021-03-21 08:35:06','标题3','简介3','http://localhost:8080/ssms0i0l/upload/news_picture3.jpg','内容3'),(64,'2021-03-21 08:35:06','标题4','简介4','http://localhost:8080/ssms0i0l/upload/news_picture4.jpg','内容4'),(65,'2021-03-21 08:35:06','标题5','简介5','http://localhost:8080/ssms0i0l/upload/news_picture5.jpg','内容5'),(66,'2021-03-21 08:35:06','标题6','简介6','http://localhost:8080/ssms0i0l/upload/news_picture6.jpg','内容6'),(1616315974753,'2021-03-21 08:39:34','系统介绍','该系统创建于2021年，主要...','http://localhost:8080/ssms0i0l/upload/1616315942288.png','<p>组卷系统</p>');
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='token表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
INSERT INTO `token` VALUES (1,1,'abo','users','管理员','mfwap03ba7dtexe70wow2q9z03rhmelu','2021-03-21 08:37:12','2021-03-21 09:37:12'),(2,1616315919930,'21','laoshi','管理员','pdegxdykn9ovjhnnd0hz2c97al106lni','2021-03-21 08:40:01','2021-03-21 09:40:02'),(3,1616315867511,'12','xuesheng','学生','7j22odd7nrydmo9d7gdj6y5w883l0cjq','2021-03-21 08:43:51','2021-03-21 09:43:51');
/*!40000 ALTER TABLE `token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'abo','abo','管理员','2021-03-21 08:35:06');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xuesheng`
--

DROP TABLE IF EXISTS `xuesheng`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xuesheng` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `xuehao` varchar(200) NOT NULL COMMENT '学号',
  `mima` varchar(200) NOT NULL COMMENT '密码',
  `xingming` varchar(200) NOT NULL COMMENT '姓名',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  `chushengriqi` date DEFAULT NULL COMMENT '出生日期',
  `shouji` varchar(200) DEFAULT NULL COMMENT '手机',
  `youxiang` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `zhaopian` varchar(200) DEFAULT NULL COMMENT '照片',
  PRIMARY KEY (`id`),
  UNIQUE KEY `xuehao` (`xuehao`)
) ENGINE=InnoDB AUTO_INCREMENT=1616315867512 DEFAULT CHARSET=utf8 COMMENT='学生';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xuesheng`
--

LOCK TABLES `xuesheng` WRITE;
/*!40000 ALTER TABLE `xuesheng` DISABLE KEYS */;
INSERT INTO `xuesheng` VALUES (11,'2021-03-21 08:35:05','学生1','123456','姓名1','男','2021-03-21','13823888881','773890001@qq.com','http://localhost:8080/ssms0i0l/upload/xuesheng_zhaopian1.jpg'),(12,'2021-03-21 08:35:05','学生2','123456','姓名2','男','2021-03-21','13823888882','773890002@qq.com','http://localhost:8080/ssms0i0l/upload/xuesheng_zhaopian2.jpg'),(13,'2021-03-21 08:35:05','学生3','123456','姓名3','男','2021-03-21','13823888883','773890003@qq.com','http://localhost:8080/ssms0i0l/upload/xuesheng_zhaopian3.jpg'),(14,'2021-03-21 08:35:06','学生4','123456','姓名4','男','2021-03-21','13823888884','773890004@qq.com','http://localhost:8080/ssms0i0l/upload/xuesheng_zhaopian4.jpg'),(15,'2021-03-21 08:35:06','学生5','123456','姓名5','男','2021-03-21','13823888885','773890005@qq.com','http://localhost:8080/ssms0i0l/upload/xuesheng_zhaopian5.jpg'),(16,'2021-03-21 08:35:06','学生6','123456','姓名6','男','2021-03-21','13823888886','773890006@qq.com','http://localhost:8080/ssms0i0l/upload/xuesheng_zhaopian6.jpg'),(1616315867511,'2021-03-21 08:37:47','12','12','12','男','2021-03-25','12345678908','1@qq.com','http://localhost:8080/ssms0i0l/upload/1616315866138.jpg');
/*!40000 ALTER TABLE `xuesheng` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-23 21:57:47
