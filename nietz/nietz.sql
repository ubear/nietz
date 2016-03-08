-- MySQL dump 10.13  Distrib 5.5.47, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: nietz
-- ------------------------------------------------------
-- Server version	5.5.47-0ubuntu0.14.04.1

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_0e939a4f` (`group_id`),
  KEY `auth_group_permissions_8373b171` (`permission_id`),
  CONSTRAINT `auth_group_permission_group_id_689710a9a73b7457_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_417f1b1c` (`content_type_id`),
  CONSTRAINT `auth__content_type_id_508cf46651277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add category',7,'add_category'),(20,'Can change category',7,'change_category'),(21,'Can delete category',7,'delete_category'),(22,'Can add game',8,'add_game'),(23,'Can change game',8,'change_game'),(24,'Can delete game',8,'delete_game');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) DEFAULT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$20000$uOUj89Ulera6$5KwjOssYmTZWm5so+1IRLUB9ODt4MjrdfrQWWZPr6Mc=','2016-03-04 12:38:30',1,'chyoo','','','chyoo@youku.com',1,1,'2016-03-02 09:14:15');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_e8701ad4` (`user_id`),
  KEY `auth_user_groups_0e939a4f` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_e8701ad4` (`user_id`),
  KEY `auth_user_user_permissions_8373b171` (`permission_id`),
  CONSTRAINT `auth_user_user_permissi_user_id_7f0938558328534a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_u_permission_id_384b62483d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `ctime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_name_7db22c19ac698fac_uniq` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (2,'角色扮演','2016-03-02 09:58:08'),(3,'网络游戏','2016-03-03 07:05:47'),(4,'网页游戏','2016-03-03 07:06:04'),(5,'手机游戏','2016-03-03 07:06:17'),(6,'战略决策','2016-03-06 08:07:21'),(7,'单机游戏','2016-03-06 08:10:18'),(8,'益智游戏','2016-03-06 08:48:06'),(9,'棋牌游戏','2016-03-06 08:50:06'),(10,'儿童游戏','2016-03-06 08:52:30'),(11,'即时游戏','2016-03-06 08:55:29'),(12,'剧情游戏','2016-03-06 08:57:09'),(13,'动漫游戏','2016-03-06 09:04:23'),(14,'神秘游戏','2016-03-06 09:12:06'),(15,'智力游戏','2016-03-07 02:21:09');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_417f1b1c` (`content_type_id`),
  KEY `django_admin_log_e8701ad4` (`user_id`),
  CONSTRAINT `django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `djang_content_type_id_697914295151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2016-03-02 09:18:45','3','juesebanyan',1,'',7,1),(2,'2016-03-02 09:19:00','3','juesebanyan',3,'',7,1),(3,'2016-03-02 09:58:08','2','????',1,'',7,1),(4,'2016-03-02 10:00:43','1','????',1,'',8,1),(5,'2016-03-03 06:52:04','1','????',2,'Changed logo.',8,1),(6,'2016-03-03 07:04:45','2','???',1,'',8,1),(7,'2016-03-03 07:05:47','3','????',1,'',7,1),(8,'2016-03-03 07:06:04','4','????',1,'',7,1),(9,'2016-03-03 07:06:17','5','????',1,'',7,1),(10,'2016-03-03 07:07:26','3','????',1,'',8,1),(11,'2016-03-03 07:10:48','4','??',1,'',8,1),(12,'2016-03-03 07:11:11','4','??',2,'Changed download.',8,1),(13,'2016-03-03 07:16:47','5','????',1,'',8,1),(14,'2016-03-03 07:32:46','3','????',2,'Changed active.',8,1),(15,'2016-03-03 08:10:19','5','????',2,'Changed logo and rotation.',8,1),(16,'2016-03-03 08:10:34','4','??',2,'Changed logo and rotation.',8,1),(17,'2016-03-03 08:10:45','3','????',2,'Changed logo and rotation.',8,1),(18,'2016-03-03 08:10:54','2','???',2,'Changed logo and rotation.',8,1),(19,'2016-03-03 08:11:06','1','????',2,'Changed logo and rotation.',8,1),(20,'2016-03-03 08:14:44','6','????',1,'',8,1),(21,'2016-03-04 05:38:49','7','????',1,'',8,1),(22,'2016-03-04 05:59:18','8','???',1,'',8,1),(23,'2016-03-04 06:54:16','9','???',1,'',8,1),(24,'2016-03-04 12:38:41','9','???',2,'??? active ?',8,1),(25,'2016-03-04 12:38:46','8','???',2,'??? active ?',8,1),(26,'2016-03-04 12:38:51','7','????',2,'??? active ?',8,1),(27,'2016-03-04 12:55:21','6','????',2,'??? active ?',8,1),(28,'2016-03-04 12:55:25','3','????',2,'??? active ?',8,1),(29,'2016-03-04 12:55:29','1','????',2,'??? active ?',8,1),(30,'2016-03-04 12:55:32','8','???',2,'??? active ?',8,1),(31,'2016-03-07 02:52:13','10','????',3,'',8,1),(32,'2016-03-07 02:53:51','11','????',2,'??? download ?',8,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_45f3b1d93ec8c61c_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(7,'app','category'),(8,'app','game'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2016-03-02 07:54:15'),(2,'auth','0001_initial','2016-03-02 07:54:17'),(3,'admin','0001_initial','2016-03-02 07:54:18'),(4,'sessions','0001_initial','2016-03-02 07:54:19'),(5,'contenttypes','0002_remove_content_type_name','2016-03-02 08:00:28'),(6,'auth','0002_alter_permission_name_max_length','2016-03-02 08:00:29'),(7,'auth','0003_alter_user_email_max_length','2016-03-02 08:00:29'),(8,'auth','0004_alter_user_username_opts','2016-03-02 08:00:29'),(9,'auth','0005_alter_user_last_login_null','2016-03-02 08:00:29'),(10,'auth','0006_require_contenttypes_0002','2016-03-02 08:00:29'),(11,'app','0001_initial','2016-03-02 09:02:40'),(12,'app','0002_auto_20160302_0912','2016-03-02 09:13:05');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('f35tf1oys9k29dt1z8p805uc3mslx6os','NDYyMjgwMmFkZDY1YWQ2YmE1MGIxZDhkN2JhMDQ1MDY0YjZlMDBiYTp7Il9hdXRoX3VzZXJfaGFzaCI6IjkzNjE4NWNlMTkwZTAzNGE1MzYzZTg2ODhkZjU2MTMxMDkxZjczNGYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2016-03-16 09:15:04'),('jmx56k7w3ook6zz17dp4tur5gepw8zqm','NDYyMjgwMmFkZDY1YWQ2YmE1MGIxZDhkN2JhMDQ1MDY0YjZlMDBiYTp7Il9hdXRoX3VzZXJfaGFzaCI6IjkzNjE4NWNlMTkwZTAzNGE1MzYzZTg2ODhkZjU2MTMxMDkxZjczNGYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2016-03-18 12:38:30');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game`
--

DROP TABLE IF EXISTS `game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `download` varchar(255) DEFAULT NULL,
  `logo` varchar(100) NOT NULL,
  `rotation` varchar(100) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `ctime` datetime NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `game_category_id_6751ea68ffec9b0c_fk_category_id` (`category_id`),
  CONSTRAINT `game_category_id_6751ea68ffec9b0c_fk_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game`
--

LOCK TABLES `game` WRITE;
/*!40000 ALTER TABLE `game` DISABLE KEYS */;
INSERT INTO `game` VALUES (1,'神战三国','http://pic12.nipic.com/20110217/6757620_105953632124_2.jpg','thumbs/shenzhan_yemRDLo.jpg','rotation/shenzhan_4U20K84.jpg',1,'2016-03-02 10:00:43',2),(2,'新征途','http://www.runoob.com/bootstrap/bootstrap-thumbnails.html','thumbs/5c8fc3ed67098066473f5686896d74bf_uDHrQAk.jpg','rotation/5c8fc3ed67098066473f5686896d74bf_quvw7rA.jpg',0,'2016-03-03 07:04:45',2),(3,'隋唐演义','https://docs.djangoproject.com/en/1.8/howto/static-files/deployment/','thumbs/43df72d1974e35a4ba51190cb050fe22_bfuBoD8.jpg','rotation/43df72d1974e35a4ba51190cb050fe22_OKypXts.jpg',0,'2016-03-03 07:07:26',5),(4,'斗仙','http://image.baidu.com','thumbs/20729c842b515991f259855cf0e9234c_b5yQNoE.jpg','rotation/20729c842b515991f259855cf0e9234c_lRTwEPs.jpg',0,'2016-03-03 07:10:48',4),(5,'龙之大陆','http://www.bootcss.com/','thumbs/78bfa12ddac5767210e3a5b59c28dc5d_8xPbGfw.jpg','rotation/78bfa12ddac5767210e3a5b59c28dc5d_hmhnyrx.jpg',0,'2016-03-03 07:16:47',3),(6,'黑暗之光','https://docs.djangoproject.com/en/1.8/howto/static-files/','thumbs/cd3e956638045988d9512036e9bec62b.png','rotation/cd3e956638045988d9512036e9bec62b.png',1,'2016-03-03 08:14:44',3),(7,'倚天屠龙','http://image.baidu.com/','thumbs/daa03430a68a8cc3c2a190e7c39abc4d.jpg','rotation/daa03430a68a8cc3c2a190e7c39abc4d.jpg',1,'2016-03-04 05:38:49',5),(8,'打天下','https://www.google.com/#q=translate','thumbs/d024e491901b9183c80ec1aa91d54515.jpg','rotation/d024e491901b9183c80ec1aa91d54515.jpg',0,'2016-03-04 05:59:18',2),(9,'大神坛','http://127.0.0.1:8000/admin/app/game/add/','thumbs/0d16c31248550463acebb55287b1fd7e.jpg','rotation/0d16c31248550463acebb55287b1fd7e.jpg',0,'2016-03-04 06:54:16',3),(11,'观音坐莲','http://localhost:8000/app/game/11/','thumbs/7ca624a7b6786e052a2be9fcd5afd5d1.png','rotation/7ca624a7b6786e052a2be9fcd5afd5d1.png',0,'2016-03-07 02:52:44',7),(12,'UUU测试','UUU测试','thumbs/20729c842b515991f259855cf0e9234c_yB2LXK3.jpg','rotation/20729c842b515991f259855cf0e9234c_GSefWEJ.jpg',0,'2016-03-07 03:16:22',2),(13,'英雄联盟','http://bootstrap-table.wenzhixin.net.cn/examples/','thumbs/179c622e3bcc542019433854fac8eaf6.jpg','rotation/179c622e3bcc542019433854fac8eaf6.jpg',0,'2016-03-07 03:55:36',3),(14,'十字军','http://localhost:8000/app/game/','thumbs/a85cad561dfa6f86bcbce83f1167d9b4.jpg','rotation/a85cad561dfa6f86bcbce83f1167d9b4.jpg',1,'2016-03-07 04:08:28',3),(15,'九阳神功','http://localhost:8000/app/game/','thumbs/eb4e077650ff66a7fdf8e98661a2ec52.jpg','rotation/eb4e077650ff66a7fdf8e98661a2ec52.jpg',1,'2016-03-08 07:24:54',3);
/*!40000 ALTER TABLE `game` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-03-08 15:26:49
