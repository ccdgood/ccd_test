-- MySQL dump 10.13  Distrib 5.7.31, for Linux (x86_64)
--
-- Host: localhost    Database: computer_status
-- ------------------------------------------------------
-- Server version	5.7.31-0ubuntu0.18.04.1

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
-- Current Database: `computer_status`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `computer_status` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `computer_status`;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add computer_status',7,'add_computer_status'),(20,'Can change computer_status',7,'change_computer_status'),(21,'Can delete computer_status',7,'delete_computer_status'),(22,'Can add show_address',8,'add_show_address'),(23,'Can change show_address',8,'change_show_address'),(24,'Can delete show_address',8,'delete_show_address');
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
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$100000$uiwnHTOuJtHo$OKmBm7bB1LLcpVxi3xix874F47BJENxSKXEd486L27w=','2020-08-24 13:14:20.114864',1,'admin','','','admin@mail.com',1,1,'2020-08-03 15:28:18.406312');
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
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2020-08-03 16:32:57.075498','1','WP\\ccd',2,'[{\"changed\": {\"fields\": [\"it_number\", \"seat_number\", \"asset_users\"]}}]',7,1),(2,'2020-08-04 16:13:49.708511','1','WP\\ccd',2,'[{\"changed\": {\"fields\": [\"asset_users\"]}}]',7,1),(3,'2020-08-06 11:05:21.727097','12','WP\\liyaozong',2,'[{\"changed\": {\"fields\": [\"it_number\", \"seat_number\", \"asset_users\"]}}]',7,1),(4,'2020-08-06 11:52:34.191612','14','WP\\liyaozong',2,'[{\"changed\": {\"fields\": [\"it_number\"]}}]',7,1),(5,'2020-08-06 11:52:53.271164','14','WP\\liyaozong',2,'[{\"changed\": {\"fields\": [\"seat_number\"]}}]',7,1),(6,'2020-08-06 11:53:07.003761','14','WP\\liyaozong',2,'[{\"changed\": {\"fields\": [\"asset_users\"]}}]',7,1),(7,'2020-08-07 15:34:26.625878','17','WP\\liyaozong',3,'',7,1),(8,'2020-08-11 10:59:12.699600','12','WP\\liyaozong',3,'',7,1),(9,'2020-08-17 08:19:55.760096','45','WP\\zhangliucheng',3,'',7,1),(10,'2020-08-24 07:12:22.908949','103','WP\\ccd_cm',3,'',7,1),(11,'2020-08-24 13:20:52.503867','118','WP\\ccd',3,'',7,1),(12,'2020-08-24 13:48:11.966976','121','WP\\qwe',3,'',7,1),(13,'2020-08-28 09:19:35.267680','227','WP\\zhuliyan',3,'',7,1),(14,'2020-09-02 10:18:16.351464','304','WP\\zhuliyan',3,'',7,1),(15,'2020-09-02 10:19:48.889159','322','',3,'',7,1),(16,'2020-09-02 10:19:48.894099','316','',3,'',7,1);
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
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(7,'sign','computer_status'),(8,'sign','show_address');
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
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-08-03 15:26:24.652463'),(2,'auth','0001_initial','2020-08-03 15:26:30.282849'),(3,'admin','0001_initial','2020-08-03 15:26:31.381465'),(4,'admin','0002_logentry_remove_auto_add','2020-08-03 15:26:31.426835'),(5,'contenttypes','0002_remove_content_type_name','2020-08-03 15:26:32.175969'),(6,'auth','0002_alter_permission_name_max_length','2020-08-03 15:26:32.682216'),(7,'auth','0003_alter_user_email_max_length','2020-08-03 15:26:33.178219'),(8,'auth','0004_alter_user_username_opts','2020-08-03 15:26:33.234543'),(9,'auth','0005_alter_user_last_login_null','2020-08-03 15:26:33.616245'),(10,'auth','0006_require_contenttypes_0002','2020-08-03 15:26:33.632450'),(11,'auth','0007_alter_validators_add_error_messages','2020-08-03 15:26:33.699699'),(12,'auth','0008_alter_user_username_max_length','2020-08-03 15:26:34.773043'),(13,'auth','0009_alter_user_last_name_max_length','2020-08-03 15:26:35.255696'),(14,'sessions','0001_initial','2020-08-03 15:26:35.621768'),(15,'sign','0001_initial','2020-08-03 15:26:35.959390'),(16,'sign','0002_auto_20200624_1557','2020-08-03 15:26:35.988681'),(17,'sign','0003_auto_20200701_1025','2020-08-03 15:26:37.035859'),(18,'sign','0004_auto_20200821_0905','2020-08-21 09:05:51.656640'),(19,'sign','0004_auto_20200820_1725','2020-08-21 09:08:42.488987');
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
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('30y6w2k2314j6obdgjl1s90ee42use4f','NTE2OTFjMmVhNzA1MDA3YTAwOTE1Y2MyYTY4ZjJkNjc1ZDQ3MTE2OTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMjIzMzY5ZTNmOTk5NWVlYTY2YTI5OWI4YTFlNTQ1ZmY2NTY0OTU1In0=','2020-09-07 07:12:02.171072'),('76lb9s7lrpx4h4t2x7kdsginn22j8qod','NTE2OTFjMmVhNzA1MDA3YTAwOTE1Y2MyYTY4ZjJkNjc1ZDQ3MTE2OTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMjIzMzY5ZTNmOTk5NWVlYTY2YTI5OWI4YTFlNTQ1ZmY2NTY0OTU1In0=','2020-08-21 13:44:53.305535'),('ffgg29lv8ofl2qakd33urrxw3awxftr6','NTE2OTFjMmVhNzA1MDA3YTAwOTE1Y2MyYTY4ZjJkNjc1ZDQ3MTE2OTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMjIzMzY5ZTNmOTk5NWVlYTY2YTI5OWI4YTFlNTQ1ZmY2NTY0OTU1In0=','2020-08-20 11:04:34.689824'),('hrsxrz8rmeu2brmri9wn7dbxw4a4sl1f','NTE2OTFjMmVhNzA1MDA3YTAwOTE1Y2MyYTY4ZjJkNjc1ZDQ3MTE2OTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMjIzMzY5ZTNmOTk5NWVlYTY2YTI5OWI4YTFlNTQ1ZmY2NTY0OTU1In0=','2020-08-17 15:30:10.946691'),('kwuvm6pa407rd8g53cn8rsf0h5q0gjoe','NTE2OTFjMmVhNzA1MDA3YTAwOTE1Y2MyYTY4ZjJkNjc1ZDQ3MTE2OTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMjIzMzY5ZTNmOTk5NWVlYTY2YTI5OWI4YTFlNTQ1ZmY2NTY0OTU1In0=','2020-08-27 08:55:58.582298'),('o1yqwa4h4iv9hipmyhtwun2vfh5x5tiy','NTE2OTFjMmVhNzA1MDA3YTAwOTE1Y2MyYTY4ZjJkNjc1ZDQ3MTE2OTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMjIzMzY5ZTNmOTk5NWVlYTY2YTI5OWI4YTFlNTQ1ZmY2NTY0OTU1In0=','2020-09-07 13:14:20.144427'),('p4bvxxxudnf1foyh7yy2cqfoc7z79k6e','NTE2OTFjMmVhNzA1MDA3YTAwOTE1Y2MyYTY4ZjJkNjc1ZDQ3MTE2OTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMjIzMzY5ZTNmOTk5NWVlYTY2YTI5OWI4YTFlNTQ1ZmY2NTY0OTU1In0=','2020-08-31 16:11:01.830589'),('r1ogrpkuum1afbgt5goe0rtkjddmy7w4','NTE2OTFjMmVhNzA1MDA3YTAwOTE1Y2MyYTY4ZjJkNjc1ZDQ3MTE2OTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMjIzMzY5ZTNmOTk5NWVlYTY2YTI5OWI4YTFlNTQ1ZmY2NTY0OTU1In0=','2020-08-18 13:40:03.083877'),('ttm83jsvrgtxwtid7keo5hdwr6zeuzrg','NTE2OTFjMmVhNzA1MDA3YTAwOTE1Y2MyYTY4ZjJkNjc1ZDQ3MTE2OTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMjIzMzY5ZTNmOTk5NWVlYTY2YTI5OWI4YTFlNTQ1ZmY2NTY0OTU1In0=','2020-09-03 11:36:48.844867'),('uoew05ap89a11ijk1zthvp873kdn6z1m','NTE2OTFjMmVhNzA1MDA3YTAwOTE1Y2MyYTY4ZjJkNjc1ZDQ3MTE2OTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMjIzMzY5ZTNmOTk5NWVlYTY2YTI5OWI4YTFlNTQ1ZmY2NTY0OTU1In0=','2020-09-02 10:35:10.358010');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sign_computer_status`
--

DROP TABLE IF EXISTS `sign_computer_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sign_computer_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `name_yu` varchar(20) NOT NULL,
  `computer_name` varchar(100) NOT NULL,
  `system_type` varchar(100) NOT NULL,
  `c_cpu` varchar(100) NOT NULL,
  `c_memory` varchar(100) NOT NULL,
  `c_network` varchar(100) NOT NULL,
  `c_display` varchar(100) NOT NULL,
  `c_date` varchar(100) NOT NULL,
  `mac_network` varchar(100) NOT NULL,
  `it_number` varchar(100) NOT NULL,
  `seat_number` varchar(100) NOT NULL,
  `asset_users` varchar(100) NOT NULL,
  `c_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sign_computer_status_name_computer_name_mac_n_271aecd7_uniq` (`name`,`computer_name`,`mac_network`)
) ENGINE=InnoDB AUTO_INCREMENT=498 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sign_computer_status`
--

LOCK TABLES `sign_computer_status` WRITE;
/*!40000 ALTER TABLE `sign_computer_status` DISABLE KEYS */;
INSERT INTO `sign_computer_status` VALUES (1,'WP\\ccd','wp.com','PC-20200721OJEO','Microsoft Windows 7 旗舰版 [6.1.7601]','Intel(R) Core(TM) i5-6400 CPU @ 2.70GHz','7.91 GB','192.168.30.54','NVIDIA GeForce GTX 960','WDC WD10EZEX-00WN4A0 SCSI Disk Device931.51 GBKingston DataTraveler 3.0 USB Device28.82 GB','34:97:F6:99:9D:54','ZX-BG-DN-007','2楼9排5座','陈迅才','2020-09-08 15:31:28.811259'),(2,'WP\\lilulu','wp.com','PC-20200605MLFJ','Microsoft Windows 7 旗舰版 [6.1.7601]','Intel(R) Core(TM) i3-2120 CPU @ 3.30GHz','7.98 GB','192.168.30.57','ATI Radeon HD 4800 Series         ','WDC WD3200AAJS-00L7A0 ATA Device298.09 GB','00:E0:4C:45:9F:4E','','','','2020-09-09 09:09:53.754274'),(3,'WP\\luoyan','wp.com','LILY-XZ','Microsoft Windows 7 旗舰版 [6.1.7601]','Intel(R) Core(TM) i3-3220 CPU @ 3.30GHz','3.89 GB','192.168.10.65','Intel(R) HD Graphics','ST500DM002-1BD142 ATA Device465.76 GBWDC WD1600AAJS-22PSA0 ATA Device149.05 GB','74:46:A0:9D:02:79','','','','2020-09-07 09:27:33.723513'),(4,'WP\\songkexin','wp.com','PC-20200722IIHX','Microsoft Windows 7 旗舰版 [6.1.7601]','Intel(R) Core(TM) i5-3470 CPU @ 3.20GHz','3.88 GB','192.168.30.70','Intel(R) HD Graphics','ST500DM002-1BD142465.76 GB','2C:44:FD:0F:C1:0D','','','','2020-09-09 09:00:29.885339'),(14,'WP\\liyaozong','wp.com','LIYAOZONG-PC','Microsoft Windows 10 教育版[10.0.18362]','Intel(R) Core(TM) i5-4460  CPU @ 3.20GHz','7.90 GB','192.168.30.55','NVIDIA GeForce GTX 750 TiIntel(R) HD Graphics 4600','ST1000DM010-2EP102931.51 GBST3500418AS465.76 GB','40:8D:5C:91:71:D3','WP-DN-SH-223-2','1楼2排4座','李耀宗','2020-09-09 09:05:11.694068'),(23,'WP\\sunwentao','wp.com','SWT-PC','Microsoft Windows 10 专业版[10.0.18363]','Intel(R) Core(TM) i5-4460  CPU @ 3.20GHz','7.94 GB','192.168.10.75','NVIDIA GeForce GTX 750 Ti','Samsung SSD 750 EVO 250GB232.88 GBWDC WD10EZEX-08WN4A0931.51 GB','0C:9D:92:19:EE:83','','','','2020-08-28 10:14:10.321971'),(32,'WP\\zhoulei','wp.com','DESKTOP-RD1KFR2','Microsoft Windows 10 专业版[10.0.10240]','Intel(R) Core(TM) i5-9400 CPU @ 2.90GHz','7.87 GB','192.168.50.58','Intel(R) UHD Graphics 630','WDC WDS240G2G0A-00JH30223.57 GB','A8:5E:45:A0:55:9C','','','','2020-08-28 08:51:27.106978'),(41,'WP\\sunyuhu','wp.com','DESKTOP-IAH61UE','Microsoft Windows 10 教育版[10.0.18362]','Intel(R) Core(TM) i5-4460  CPU @ 3.20GHz','7.94 GB','192.168.50.54','AMD Radeon R5 235','Generic- SD/MMC/MS PRO USB Device BWDC WD5000AAKX-22ERMA0465.76 GB','D8:CB:8A:14:FC:57','','','','2020-08-28 08:43:54.767855'),(43,'WP\\zhangzhenhua','wp.com','DESKTOP-GK9JIIP','Microsoft Windows 10 专业版[10.0.10240]','Intel(R) Core(TM) i7-10700K CPU @ 3.80GHz','15.92 GB','192.168.30.53','Microsoft 基本显示适配器','KINGSTON SA400S37240G223.57 GBWDC WD2003FYYS-02W0B11.82 TB','18:C0:4D:1C:9B:76','','','','2020-08-27 09:25:45.122708'),(48,'WP\\zhangliucheng','wp.com','DESKTOP-0I1LUKE','Microsoft Windows 10 专业版[10.0.18362]','Intel(R) Core(TM) i5-9400F CPU @ 2.90GHz','7.94 GB','192.168.30.51','NVIDIA GeForce GTX 1660','WDC WDS240G2G0A-00JH30223.57 GB','2C:F0:5D:53:A7:A0','','','','2020-08-20 09:05:07.076905'),(112,'WP\\xiaojingrong','wp.com','DESKTOP-NPIOHE1','Microsoft Windows 10 专业版[10.0.10240]','Intel(R) Core(TM) i5-6400 CPU @ 2.70GHz','7.91 GB','192.168.20.103','NVIDIA GeForce GTX 960','KINGSTON SHFS37A120G111.79 GBST500DM002-1ER14C465.76 GB','D0:17:C2:93:E6:C0','','','','2020-08-24 08:58:46.868695'),(113,'WP\\wuhan','wp.com','WUHAN_RS','Microsoft Windows 10 专业版[10.0.10240]','Intel(R) Core(TM) i5-9400 CPU @ 2.90GHz','7.84 GB','192.168.30.74','Microsoft 基本显示适配器','WDC WD10EZEX-75WN4A1931.51 GB','E4:54:E8:DA:E8:58','','','','2020-08-27 09:00:37.392388'),(115,'WP\\tianrenfen','wp.com','TIANRENFEN-GGSY','Microsoft Windows 10 专业版[10.0.18362]','Intel(R) Core(TM) i5-9400 CPU @ 2.90GHz','7.88 GB','192.168.20.100','Intel(R) UHD Graphics 630','WDC WD10EZEX-75WN4A1931.51 GB','00:D8:61:3A:C3:22','','','','2020-09-09 09:06:27.694867'),(117,'WP\\shijing','','DESKTOP-Q8A15C2','Microsoft Windows 10 专业版[10.0.18362]','Intel(R) Core(TM) i5-9400 CPU @ 2.90GHz','7.88 GB','192.168.20.109','Intel(R) UHD Graphics 630','WDC WD10EZEX-75WN4A1931.51 GB','00:D8:61:3A:C6:93','','','','2020-09-09 09:10:59.991676'),(120,'WP\\wangtianyu','wp.com','WP-ZX-3','Microsoft Windows 10 专业版[10.0.18362]','Intel(R) Core(TM) i5-9400F CPU @ 2.90GHz','7.94 GB','192.168.20.133','NVIDIA GeForce GTX 1660','WDC WDS240G2G0A-00JH30223.57 GB','2C:F0:5D:53:AA:90','','','','2020-08-25 08:49:14.231666'),(123,'WP\\sudan','wp.com','SUDAN-YD','Microsoft Windows 7 旗舰版 [6.1.7601]','Intel(R) Core(TM) i5-6500 CPU @ 3.20GHz','7.89 GB','192.168.20.52','Intel(R) HD Graphics 530','Samsung SSD SCSI Disk Device111.79 GBWDC WD10EZEX-08WN4A0 SCSI Disk Device931.51 GB','1C:1B:0D:3E:78:DE','','','','2020-09-09 09:09:43.305302'),(125,'WP\\gaoliaoyuan','wp.com','GAOLIAOYUAN-PC','Microsoft Windows 7 旗舰版 [6.1.7601]','Intel(R) Core(TM) i5-4460  CPU @ 3.20GHz','7.90 GB','192.168.10.78','Intel(R) HD Graphics 4600Oray Display Mirror DriverNVIDIA GeForce GTX 750 Ti','ST1000DM 010-2EP102 SCSI Disk Device931.51 GB','1C:1B:0D:17:B3:A3','','','','2020-09-09 08:37:54.306505'),(132,'WP\\chenchao','wp.com','JINHAIYAN-PC','Microsoft Windows 7 旗舰版 [6.1.7601]','Intel(R) Core(TM) i5-4460  CPU @ 3.20GHz','7.90 GB','192.168.10.79','NVIDIA GeForce GTX 750 TiIntel(R) HD Graphics 4600','ATA WDC WD10EZEX-08W SCSI Disk Device931.51 GB','40:8D:5C:9D:01:A3','','','','2020-09-09 08:43:46.787791'),(134,'WP\\liuquanwei','wp.com','LIUQUANWEI-PC','Microsoft Windows 7 旗舰版 [6.1.7601]','Intel(R) Core(TM) i5-4460  CPU @ 3.20GHz','7.90 GB','192.168.10.81','NVIDIA GeForce GTX 750 TiOray Display Mirror DriverIntel(R) HD Graphics 4600','ST1000DM 010-2EP102 SCSI Disk Device931.51 GB','1C:1B:0D:17:B3:B1','','','','2020-09-09 08:38:18.451678'),(138,'WP\\liumengjie','wp.com','LIUMENGJIE-PC','Microsoft Windows 7 旗舰版 [6.1.7601]','Intel(R) Core(TM) i5-4460  CPU @ 3.20GHz','15.89 GB','192.168.10.82','NVIDIA GeForce GTX 750Intel(R) HD Graphics 4600Oray Display Mirror Driver','WDC WD10EZEX-00WN4A0 SCSI Disk Device931.51 GB','40:8D:5C:B4:AA:DB','','','','2020-09-09 09:18:36.314340'),(140,'WP\\wangsiyang','wp.com','WANGSIYANG','Microsoft Windows 7 旗舰版 [6.1.7601]','Intel(R) Core(TM) i5-7400 CPU @ 3.00GHz','15.96 GB','192.168.10.86','NVIDIA GeForce GTX 980 TiVNC Mirror DriverOray Display Mirror Driver','ST1000DM 010-2EP102 SCSI Disk Device931.51 GBSeagate BUP Slim RD USB Device931.51 GB','E0:D5:5E:92:89:4F','','','','2020-08-27 08:50:20.363727'),(144,'WP\\xujuan','wp.com','XUJUAN-PC','Microsoft Windows 7 旗舰版 [6.1.7601]','Intel(R) Core(TM) i3-2100 CPU @ 3.10GHz','3.91 GB','192.168.30.52','Oray Display Mirror DriverIntel(R) HD Graphics','ST3500414CS ATA Device465.76 GBST500DM002-1BD142 ATA Device465.76 GB','54:04:A6:B3:AD:FB','','','','2020-09-09 08:55:07.867594'),(146,'WP\\songlaiwei','wp.com','SONGLAIWEI-YD','Microsoft Windows 7 旗舰版 [6.1.7601]','Intel(R) Core(TM) i5-6400 CPU @ 2.70GHz','7.91 GB','192.168.20.94','Oray Display Mirror DriverNVIDIA GeForce GTX 960','KINGSTON  SCSI Disk Device111.79 GBST500DM0 02-1BD142 SCSI Disk Device465.76 GB','D0:17:C2:93:E6:8A','','','','2020-08-25 09:01:02.122910'),(148,'WP\\yangjinqian','wp.com','JINQIAN-PC','Microsoft Windows 7 旗舰版 [6.1.7601]','Intel(R) Core(TM) i5-3470 CPU @ 3.20GHz','23.88 GB','192.168.20.115','Intel(R) HD GraphicsOray Display Mirror Driver','KINGSTON SA400S37480G SCSI Disk Device447.13 GBST500DM0 02-1BD142 SCSI Disk Device465.76 GB','2C:44:FD:0D:D1:5E','','','','2020-08-25 09:02:58.998495'),(150,'WP\\yuchengbin','wp.com','YUCHENGBIN-YD','Microsoft Windows 7 旗舰版 [6.1.7601]','Intel(R) Core(TM) i5-3470 CPU @ 3.20GHz','11.70 GB','192.168.20.51','Intel(R) HD Graphics','ST500DM002-1BD142 ATA Device465.76 GBWDC WD5000AAKX-00ERMA0 ATA Device465.76 GB','00:02:0B:0A:1C:2B','','','','2020-08-25 09:03:21.815611'),(153,'WP\\zhangzhenkai','wp.com','ZHANGZHENK-PC','Microsoft Windows 7 旗舰版 [6.1.7601]','Intel(R) Core(TM) i5-6400 CPU @ 2.70GHz','15.95 GB','192.168.10.87','NVIDIA GeForce GTX 750 TiOray Display Mirror Driver','ST1000DM 010-2EP102 SCSI Disk Device931.51 GB','1C:1B:0D:54:B4:78','','','','2020-09-09 09:01:08.376256'),(160,'WP\\shiying','wp.com','SHIYING-PC','Microsoft Windows 7 旗舰版 [6.1.7601]','Intel(R) Core(TM) i5-4460  CPU @ 3.20GHz','7.90 GB','192.168.10.85','NVIDIA GeForce GTX 750 TiOray Display Mirror DriverIntel(R) HD Graphics 4600','WDC WD10EZEX-22MFCA0 SCSI Disk Device931.51 GB','40:8D:5C:9D:01:D5','','','','2020-09-09 09:10:00.749013'),(162,'WP\\libo','wp.com','LIBO-YD','Microsoft Windows 7 旗舰版 [6.1.7601]','Intel(R) Core(TM) i5-3470 CPU @ 3.20GHz','7.88 GB','192.168.20.117','Intel(R) HD Graphics','ST500DM0 ST500DM002-1BD14 SCSI Disk Device465.76 GB','2C:44:FD:0D:D1:67','','','','2020-09-08 09:11:41.314150'),(166,'WP\\liujunbo','wp.com','LJB-YD','Microsoft Windows 10 专业版[10.0.19041]','Intel(R) Core(TM) i5-6400 CPU @ 2.70GHz','15.87 GB','192.168.50.74','Intel(R) HD Graphics 530','WDC WD5000AAKX-08ANVA0465.76 GBSAMSUNG MZ7LF128HCHP-00000119.24 GB','40:8D:5C:DB:21:C7','','','','2020-08-26 09:12:04.325445'),(168,'WP\\wanglei','wp.com','WANGLEI-PC','Microsoft Windows 7 旗舰版 [6.1.7601]','Intel(R) Core(TM) i5-4460  CPU @ 3.20GHz','7.90 GB','192.168.20.114','NVIDIA GeForce GTX 750Intel(R) HD Graphics 4600','ST500DM0 ST500DM002-1BD14 SCSI Disk Device465.76 GBWDC WD10EZEX-00WN4A0 SCSI Disk Device931.51 GB','192.168.20.114','','','','2020-08-25 09:19:15.049049'),(175,'WP\\weiliang','wp.com','WEILIANG2-YD','Microsoft Windows 10 专业版[10.0.18363]','Intel(R) Core(TM) i7-6700HQ CPU @ 2.60GHz','7.94 GB','192.168.20.61','NVIDIA GeForce GTX 1060','TOSHIBA MQ01ABD100931.51 GBHFS256G39TND-N210A238.47 GB','70:4D:7B:47:F9:24','','','','2020-08-25 10:26:50.048938'),(202,'WP\\chenyemei','wp.com','CHENMEIHUI-PC','Microsoft Windows 7 旗舰版 [6.1.7601]','Intel(R) Core(TM) i5-4460  CPU @ 3.20GHz','7.90 GB','192.168.10.117','Intel(R) HD Graphics 4600NVIDIA GeForce GTX 750 Ti','WDC WD10EZEX-60WN4A0 SCSI Disk Device931.51 GB','40:8D:5C:91:71:12','','','','2020-09-09 08:53:53.856768'),(223,'WP\\wanglei','wp.com','WANGLEI-PC','Microsoft Windows 7 旗舰版 [6.1.7601]','Intel(R) Core(TM) i5-4460  CPU @ 3.20GHz','7.90 GB','192.168.20.114','NVIDIA GeForce GTX 750Intel(R) HD Graphics 4600','ST500DM0 ST500DM002-1BD14 SCSI Disk Device465.76 GBWDC WD10EZEX-00WN4A0 SCSI Disk Device931.51 GB','40:8D:5C:97:12:33','','','','2020-09-09 09:14:27.059088'),(225,'WP\\liuzhen','wp.com','LILULU-YD','Microsoft Windows 7 旗舰版 [6.1.7601]','Intel(R) Core(TM) i5-3470 CPU @ 3.20GHz','7.70 GB','192.168.20.95','Oray Display Mirror DriverIntel(R) HD Graphics','WDC WD3200AAJS-00L7A0298.09 GB','08:60:6E:F0:07:77','','','','2020-09-09 09:21:10.387617'),(273,'WP\\denghaiyan','wp.com','PC-20161102SCPV','Microsoft Windows 7 旗舰版 [6.1.7601]','Intel(R) Core(TM) i5-3470 CPU @ 3.20GHz','7.70 GB','192.168.20.153','Intel(R) HD Graphics','WDC WD5000AAKX-08ERMA0465.76 GB','08:60:6E:84:6A:41','','','','2020-09-07 09:14:48.791794'),(286,'WP\\administrator','wp.com','DC01','Microsoft Windows Server 2008 R2 Enterprise [6.1.7600]','Intel(R) Xeon(R) CPU E5-2620 0 @ 2.00GHz','16.00 GB','192.168.0.10','VMware SVGA 3D','VMware Virtual disk SCSI Disk Device120.00 GBVMware Virtual disk SCSI Disk Device100.00 GB','00:0C:29:F5:87:4E','','','','2020-08-28 11:07:26.314565'),(311,'WP\\zhangxiaodie','wp.com','WIN10-XIAODIE','Microsoft Windows 10 专业版[10.0.18362]','Intel(R) Core(TM) i5-3470 CPU @ 3.20GHz','7.70 GB','192.168.20.158','Intel(R) HD Graphics','INTEL SSDSC2CW240A3223.57 GBWDC WD3200AAJS-00L7A0298.09 GB','08:60:6E:F0:7C:10','','','','2020-09-09 09:15:40.373655'),(315,'WP\\zhangzhenghua01','wp.com','DESKTOP-0I1LUKE','Microsoft Windows 10 专业版[10.0.18362]','Intel(R) Core(TM) i5-9400F CPU @ 2.90GHz','7.94 GB','192.168.20.156','NVIDIA GeForce GTX 1660','WDC WDS240G2G0A-00JH30223.57 GB','2C:F0:5D:53:A7:A0','','','','2020-09-07 18:47:53.554256'),(321,'WP\\zhangzhenghua01','wp.com','ZX-SERVER','Microsoft Windows 10 专业版[10.0.18362]','Intel(R) Core(TM) i5-9400F CPU @ 2.90GHz','7.94 GB','192.168.20.156','NVIDIA GeForce GTX 1660','WDC WDS240G2G0A-00JH30223.57 GB','2C:F0:5D:53:A7:A0','','','','2020-09-07 18:47:53.554256'),(323,'WP\\zhangliucheng','wp.com','ZX-SERVER','Microsoft Windows 10 专业版[10.0.18362]','Intel(R) Core(TM) i5-9400F CPU @ 2.90GHz','7.94 GB','192.168.20.156','NVIDIA GeForce GTX 1660','WDC WDS240G2G0A-00JH30223.57 GB','2C:F0:5D:53:A7:A0','','','','2020-08-28 17:55:30.579993'),(364,'WP\\zhuliyan','wp.com','WIN10-ZLY','Microsoft Windows 10 专业版[10.0.18362]','Intel(R) Core(TM) i5-8250U CPU @ 1.60GHz','7.90 GB','192.168.20.63','Intel(R) UHD Graphics 620NVIDIA GeForce MX150','LITEON CV8-8E128-11 SATA 128GB119.24 GBST1000LM035-1RK172931.51 GB','54:BF:64:31:9C:D4','','','','2020-09-01 11:16:35.635009'),(385,'WP\\xuejing','wp.com','PC-XJ2020','Microsoft Windows 7 旗舰版 [6.1.7601]','Intel(R) Core(TM) i5-4460  CPU @ 3.20GHz','7.90 GB','192.168.50.52','NVIDIA GeForce GTX 750Intel(R) HD Graphics 4600','ST350031 2CS SCSI Disk Device465.76 GB','FC:AA:14:E7:D3:23','','','','2020-09-07 09:08:01.529701'),(403,'','wp.com','HANYOUSEN-PC','Microsoft Windows 7 旗舰版 [6.1.7601]','Intel(R) Core(TM) i5-7400 CPU @ 3.00GHz','7.95 GB','192.168.20.71','NVIDIA GeForce GTX 750 Ti','WDC WD10EZEX-21WN4A0 SCSI Disk Device931.51 GB','1C:1B:0D:4F:65:21','','','','2020-09-03 10:07:45.911419'),(410,'WP\\zhangzhenkai','wp.com','ZHANGZHENK-PC','Microsoft Windows 7 旗舰版 [6.1.7601]','Intel(R) Core(TM) i5-6400 CPU @ 2.70GHz','15.95 GB','00:FF:91:1E:4B:95','NVIDIA GeForce GTX 750 TiOray Display Mirror Driver','ST1000DM 010-2EP102 SCSI Disk Device931.51 GB','00:FF:91:1E:4B:95','','','','2020-09-04 08:55:48.736614'),(423,'WP\\qwe','wp.com','PC-20200904WXIF','Microsoft Windows 7 旗舰版 [6.1.7601]','Intel(R) Core(TM) i3-2130 CPU @ 3.40GHz','3.70 GB','192.168.20.108','Intel(R) HD Graphics','Maxtor 6L160M0 ATA Device152.66 GBWDC WD5000AAKX-75U6AA0 ATA Device465.76 GB','08:60:6E:C4:82:28','','','','2020-09-04 16:46:52.167982'),(425,'WP\\luwenwen','wp.com','PC-20200904WXIF','Microsoft Windows 7 旗舰版 [6.1.7601]','Intel(R) Core(TM) i3-2130 CPU @ 3.40GHz','3.70 GB','192.168.20.108','Intel(R) HD Graphics','Maxtor 6L160M0 ATA Device152.66 GBWDC WD5000AAKX-75U6AA0 ATA Device465.76 GB','08:60:6E:C4:82:28','','','','2020-09-09 09:10:38.464539'),(442,'WP\\xuzhaojia','wp.com','XIONGWEIYANG','Microsoft Windows 7 旗舰版 [6.1.7601]','Intel(R) Core(TM) i5-7400 CPU @ 3.00GHz','15.89 GB','192.168.10.91','Oray Display Mirror DriverNVIDIA GeForce GT 1030Intel(R) HD Graphics 630','ATA WDC WD10EZEX-08W SCSI Disk Device931.51 GBATA WDC WDS480G2G0A- SCSI Disk Device447.14 GB','E0:D5:5E:2F:93:4C','','','','2020-09-07 09:15:21.730390'),(448,'WP\\zhangzhenghua01','wp.com','WIN10-ZX-SERVER','Microsoft Windows 10 专业版[10.0.18362]','Intel(R) Core(TM) i5-9400F CPU @ 2.90GHz','7.94 GB','192.168.20.156','NVIDIA GeForce GTX 1660','WDC WDS240G2G0A-00JH30223.57 GB','2C:F0:5D:53:A7:A0','','','','2020-09-07 18:47:53.554256'),(450,'WP\\dubingbing','wp.com','DESKTOP-Q8A15LA','Microsoft Windows 10 专业版[10.0.18362]','Intel(R) Core(TM) i5-9400 CPU @ 2.90GHz','7.88 GB','192.168.20.110','Intel(R) UHD Graphics 630','WDC WD10EZEX-75WN4A1931.51 GB','00:D8:61:3A:C7:63','','','','2020-09-07 18:55:47.391387'),(472,'','wp.com','WIN10-ZX-SERVER','Microsoft Windows 10 专业版[10.0.18362]','Intel(R) Core(TM) i5-9400F CPU @ 2.90GHz','7.94 GB','192.168.20.156','Microsoft Remote Display AdapterNVIDIA GeForce GTX 1660','WDC WDS240G2G0A-00JH30223.57 GB','2C:F0:5D:53:A7:A0','','','','2020-09-08 12:07:39.749561'),(475,'WP\\ccd','wp.com','WRGHO-NRCHTJDAQ','Microsoft Windows 7 旗舰版 [6.1.7601]','Intel(R) Core(TM) i5-6400 CPU @ 2.70GHz','7.91 GB','192.168.20.155','标准 VGA 图形适配器','WDC WD10EZEX-00WN4A0 ATA Device931.51 GBKingston DataTraveler 3.0 USB Device14.45 GB','34:97:F6:99:9D:54','','','','2020-09-08 15:31:28.811259'),(476,'WP\\qwe','wp.com','WRGHO-NRCHTJDAQ','Microsoft Windows 7 旗舰版 [6.1.7601]','Intel(R) Core(TM) i5-6400 CPU @ 2.70GHz','7.91 GB','192.168.20.155','标准 VGA 图形适配器','WDC WD10EZEX-00WN4A0 ATA Device931.51 GBKingston DataTraveler 3.0 USB Device14.45 GB','34:97:F6:99:9D:54','','','','2020-09-08 15:26:23.120281');
/*!40000 ALTER TABLE `sign_computer_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sign_show_address`
--

DROP TABLE IF EXISTS `sign_show_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sign_show_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `protocol` varchar(20) NOT NULL,
  `address` varchar(20) NOT NULL,
  `min` varchar(20) NOT NULL,
  `ip_mac` varchar(20) NOT NULL,
  `ip_type` varchar(20) NOT NULL,
  `interface` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=332 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sign_show_address`
--

LOCK TABLES `sign_show_address` WRITE;
/*!40000 ALTER TABLE `sign_show_address` DISABLE KEYS */;
INSERT INTO `sign_show_address` VALUES (1,'Internet','192.168.0.1','-','7cad.74d8.95c9','ARPA','Vlan88'),(2,'Internet','192.168.0.10','0','000c.29f5.874e','ARPA','Vlan88'),(3,'Internet','192.168.0.11','4','000c.2926.4642','ARPA','Vlan88'),(4,'Internet','192.168.0.12','4','000c.29e3.6509','ARPA','Vlan88'),(5,'Internet','192.168.0.16','0','Incomplete','ARPA',''),(6,'Internet','192.168.0.25','0','000c.2995.1a18','ARPA','Vlan88'),(7,'Internet','192.168.0.40','56','76e3.5d79.9c99','ARPA','Vlan88'),(8,'Internet','192.168.0.45','31','bed9.c56d.7b9d','ARPA','Vlan88'),(9,'Internet','192.168.0.62','228','b660.3363.8b35','ARPA','Vlan88'),(10,'Internet','192.168.0.84','0','Incomplete','ARPA',''),(11,'Internet','192.168.0.90','30','0cc4.7a2a.78de','ARPA','Vlan88'),(12,'Internet','192.168.0.100','0','Incomplete','ARPA',''),(13,'Internet','192.168.0.101','0','Incomplete','ARPA',''),(14,'Internet','192.168.0.105','62','000c.2911.1f4f','ARPA','Vlan88'),(15,'Internet','192.168.0.108','56','0050.569d.2471','ARPA','Vlan88'),(16,'Internet','192.168.0.109','217','001e.679d.3f98','ARPA','Vlan88'),(17,'Internet','192.168.0.110','5','0050.569d.1167','ARPA','Vlan88'),(18,'Internet','192.168.0.111','124','5a8d.4c25.7aed','ARPA','Vlan88'),(19,'Internet','192.168.0.112','11','001e.679d.7184','ARPA','Vlan88'),(20,'Internet','192.168.0.117','0','264a.0fc8.7bab','ARPA','Vlan88'),(21,'Internet','192.168.0.119','200','62bc.b0ed.5236','ARPA','Vlan88'),(22,'Internet','192.168.0.121','63','5699.afc2.bf55','ARPA','Vlan88'),(23,'Internet','192.168.0.123','17','0ad6.8ba5.0d2b','ARPA','Vlan88'),(24,'Internet','192.168.0.124','52','0050.568e.fe64','ARPA','Vlan88'),(25,'Internet','192.168.0.126','199','5aae.84fe.a589','ARPA','Vlan88'),(26,'Internet','192.168.0.130','115','001e.6753.59f9','ARPA','Vlan88'),(27,'Internet','192.168.0.131','3','3ec2.e511.b625','ARPA','Vlan88'),(28,'Internet','192.168.0.132','88','b2f5.b9f4.6c31','ARPA','Vlan88'),(29,'Internet','192.168.0.134','0','Incomplete','ARPA',''),(30,'Internet','192.168.0.135','1','b628.aa39.c9a0','ARPA','Vlan88'),(31,'Internet','192.168.0.137','22','76d9.5ada.4910','ARPA','Vlan88'),(32,'Internet','192.168.0.138','1','624a.b0ae.d6f1','ARPA','Vlan88'),(33,'Internet','192.168.0.140','120','1665.3f61.aa4f','ARPA','Vlan88'),(34,'Internet','192.168.0.150','31','001e.673e.c42e','ARPA','Vlan88'),(35,'Internet','192.168.0.157','0','Incomplete','ARPA',''),(36,'Internet','192.168.0.163','0','Incomplete','ARPA',''),(37,'Internet','192.168.0.168','4','000c.299c.b0c8','ARPA','Vlan88'),(38,'Internet','192.168.0.171','134','ba7b.42b3.f445','ARPA','Vlan88'),(39,'Internet','192.168.0.172','124','9227.dd46.9b76','ARPA','Vlan88'),(40,'Internet','192.168.0.180','13','001e.6765.b3ef','ARPA','Vlan88'),(41,'Internet','192.168.0.182','12','000c.2956.1c1e','ARPA','Vlan88'),(42,'Internet','192.168.0.183','69','000c.294a.90da','ARPA','Vlan88'),(43,'Internet','192.168.0.189','2','000c.2903.d019','ARPA','Vlan88'),(44,'Internet','192.168.0.191','125','d2ea.8143.81c1','ARPA','Vlan88'),(45,'Internet','192.168.0.193','176','f2f3.964f.07f2','ARPA','Vlan88'),(46,'Internet','192.168.0.196','0','Incomplete','ARPA',''),(47,'Internet','192.168.0.211','-','2261.61ee.06a8','ARPA',''),(48,'Internet','192.168.0.219','37','b6e9.e8b6.fdd7','ARPA','Vlan88'),(49,'Internet','192.168.0.224','160','7299.6d17.67a1','ARPA','Vlan88'),(50,'Internet','192.168.0.225','168','0e9e.2ef1.9961','ARPA','Vlan88'),(51,'Internet','192.168.0.232','49','de13.e6ae.7481','ARPA','Vlan88'),(52,'Internet','192.168.0.235','237','ea7a.7735.16ec','ARPA','Vlan88'),(53,'Internet','192.168.0.236','160','6e40.6911.6468','ARPA','Vlan88'),(54,'Internet','192.168.0.239','0','000c.29cf.5055','ARPA','Vlan88'),(55,'Internet','192.168.0.240','0','0050.569d.3033','ARPA','Vlan88'),(56,'Internet','192.168.0.242','43','c81f.66d6.d0c4','ARPA','Vlan88'),(57,'Internet','192.168.0.243','13','c81f.66d6.9990','ARPA','Vlan88'),(58,'Internet','192.168.0.244','2','c81f.66d6.94f9','ARPA','Vlan88'),(59,'Internet','192.168.0.245','3','848f.69e3.dc7e','ARPA','Vlan88'),(60,'Internet','192.168.0.247','4','001e.4f41.0809','ARPA','Vlan88'),(61,'Internet','192.168.0.248','55','0026.b955.062a','ARPA','Vlan88'),(62,'Internet','192.168.0.249','1','d4ae.5267.13ff','ARPA','Vlan88'),(63,'Internet','192.168.0.250','0','50e5.4915.ef6b','ARPA','Vlan88'),(64,'Internet','192.168.10.1','-','7cad.74d8.95c1','ARPA','Vlan10'),(65,'Internet','192.168.10.21','-','0860.6e84.dc9f','ARPA',''),(66,'Internet','192.168.10.22','-','0860.6e84.dd3f','ARPA',''),(67,'Internet','192.168.10.25','-','0860.6ef0.05c6','ARPA',''),(68,'Internet','192.168.10.26','-','10bf.48b8.4d54','ARPA',''),(69,'Internet','192.168.10.27','-','60a4.4c2b.55f7','ARPA',''),(70,'Internet','192.168.10.28','-','5404.a6d8.cac3','ARPA',''),(71,'Internet','192.168.10.29','-','2c44.fd0d.d167','ARPA',''),(72,'Internet','192.168.10.30','-','5046.5da6.2244','ARPA',''),(73,'Internet','192.168.10.31','-','0860.6e56.49bf','ARPA',''),(74,'Internet','192.168.10.33','-','0860.6e84.748b','ARPA',''),(75,'Internet','192.168.10.36','-','10dd.b1d1.39b1','ARPA',''),(76,'Internet','192.168.10.38','-','00e0.4c01.a7a5','ARPA',''),(77,'Internet','192.168.10.39','-','0860.6e84.6a40','ARPA',''),(78,'Internet','192.168.10.41','-','d4c9.efef.ae0d','ARPA',''),(79,'Internet','192.168.10.42','-','0860.6e84.6a41','ARPA',''),(80,'Internet','192.168.10.43','-','00e0.4c1d.ce85','ARPA',''),(81,'Internet','192.168.10.44','-','109a.dd6c.a0c6','ARPA',''),(82,'Internet','192.168.10.45','-','60a4.4c2e.caa4','ARPA',''),(83,'Internet','192.168.10.47','-','2c44.fd0d.d15e','ARPA',''),(84,'Internet','192.168.10.48','-','2c44.fd0d.d207','ARPA',''),(85,'Internet','192.168.10.49','-','5404.a6d4.b259','ARPA',''),(86,'Internet','192.168.10.50','-','0800.27f5.ea98','ARPA',''),(87,'Internet','192.168.10.51','227','dc6d.cd66.2c5a','ARPA','Vlan10'),(88,'Internet','192.168.10.52','-','0800.27e8.f082','ARPA',''),(89,'Internet','192.168.10.53','-','0800.278c.81b1','ARPA',''),(90,'Internet','192.168.10.55','-','10dd.b1b4.3c70','ARPA',''),(91,'Internet','192.168.10.56','22','bc54.36d0.dcc4','ARPA','Vlan10'),(92,'Internet','192.168.10.59','36','60f2.62cb.76a9','ARPA','Vlan10'),(93,'Internet','192.168.10.61','-','3c07.5456.99e9','ARPA',''),(94,'Internet','192.168.10.65','1','7446.a09d.0279','ARPA','Vlan10'),(95,'Internet','192.168.10.67','1','2c44.fd02.d03d','ARPA','Vlan10'),(96,'Internet','192.168.10.72','-','0860.6ef0.79fc','ARPA',''),(97,'Internet','192.168.10.74','-','0860.6e84.739a','ARPA',''),(98,'Internet','192.168.10.75','14','0c9d.9219.ee83','ARPA','Vlan10'),(99,'Internet','192.168.10.76','-','0800.2793.196a','ARPA',''),(100,'Internet','192.168.10.77','0','408d.5c97.e732','ARPA','Vlan10'),(101,'Internet','192.168.10.78','22','1c1b.0d17.b3a3','ARPA','Vlan10'),(102,'Internet','192.168.10.79','0','408d.5c9d.01a3','ARPA','Vlan10'),(103,'Internet','192.168.10.80','1','5404.a6d4.b8b6','ARPA','Vlan10'),(104,'Internet','192.168.10.81','0','1c1b.0d17.b3b1','ARPA','Vlan10'),(105,'Internet','192.168.10.82','0','408d.5cb4.aadb','ARPA','Vlan10'),(106,'Internet','192.168.10.83','1','408d.5c91.6dfd','ARPA','Vlan10'),(107,'Internet','192.168.10.85','0','408d.5c9d.01d5','ARPA','Vlan10'),(108,'Internet','192.168.10.86','1','e0d5.5e92.894f','ARPA','Vlan10'),(109,'Internet','192.168.10.87','1','1c1b.0d54.b478','ARPA','Vlan10'),(110,'Internet','192.168.10.89','1','d45d.6444.a8c2','ARPA','Vlan10'),(111,'Internet','192.168.10.90','0','1c1b.0da7.4c47','ARPA','Vlan10'),(112,'Internet','192.168.10.91','0','e0d5.5e2f.934c','ARPA','Vlan10'),(113,'Internet','192.168.10.95','2','842b.2b06.b792','ARPA','Vlan10'),(114,'Internet','192.168.10.97','150','5e43.8d04.055b','ARPA','Vlan10'),(115,'Internet','192.168.10.99','7','3ca6.160f.8d60','ARPA','Vlan10'),(116,'Internet','192.168.10.100','22','0011.321b.fec8','ARPA','Vlan10'),(117,'Internet','192.168.10.101','18','c4b3.01d1.5cad','ARPA','Vlan10'),(118,'Internet','192.168.10.102','40','0050.569d.55e2','ARPA','Vlan10'),(119,'Internet','192.168.10.104','4','0050.569d.492f','ARPA','Vlan10'),(120,'Internet','192.168.10.105','11','000c.2911.1f59','ARPA','Vlan10'),(121,'Internet','192.168.10.109','0','2816.7f8e.e0ab','ARPA','Vlan10'),(122,'Internet','192.168.10.111','0','b8c9.b53c.3873','ARPA','Vlan10'),(123,'Internet','192.168.10.116','1','fcd8.484d.906d','ARPA','Vlan10'),(124,'Internet','192.168.10.117','8','408d.5c91.7112','ARPA','Vlan10'),(125,'Internet','192.168.10.132','-','0800.27d0.2987','ARPA',''),(126,'Internet','192.168.10.150','-','0800.271a.46b4','ARPA',''),(127,'Internet','192.168.10.174','-','0800.27d1.0e85','ARPA',''),(128,'Internet','192.168.10.179','1','f4ec.381d.e9b2','ARPA','Vlan10'),(129,'Internet','192.168.10.199','0','e0d5.5e62.df1f','ARPA','Vlan10'),(130,'Internet','192.168.10.201','0','408d.5c97.e8e8','ARPA','Vlan10'),(131,'Internet','192.168.10.221','0','5404.a6f0.63cf','ARPA','Vlan10'),(132,'Internet','192.168.11.1','-','7cad.74d8.95c1','ARPA','Vlan10'),(133,'Internet','192.168.20.1','-','7cad.74d8.95c2','ARPA','Vlan20'),(134,'Internet','192.168.20.21','-','2c44.fd0f.c0f8','ARPA',''),(135,'Internet','192.168.20.24','-','f46d.0460.5508','ARPA',''),(136,'Internet','192.168.20.26','-','00e0.4c1b.719d','ARPA',''),(137,'Internet','192.168.20.29','-','c860.00bb.a0dc','ARPA',''),(138,'Internet','192.168.20.32','-','e0db.55bc.5102','ARPA',''),(139,'Internet','192.168.20.33','-','5404.a6b3.a76e','ARPA',''),(140,'Internet','192.168.20.34','-','e0db.5595.f0aa','ARPA',''),(141,'Internet','192.168.20.35','-','e0db.55bc.51a3','ARPA',''),(142,'Internet','192.168.20.36','203','10dd.b1d1.39b1','ARPA','Vlan20'),(143,'Internet','192.168.20.38','-','e811.328e.b912','ARPA',''),(144,'Internet','192.168.20.39','-','5404.a6b3.ae17','ARPA',''),(145,'Internet','192.168.20.41','-','e0db.55b4.d36e','ARPA',''),(146,'Internet','192.168.20.42','-','60a4.4cd8.355b','ARPA',''),(147,'Internet','192.168.20.50','0','3497.f699.90ef','ARPA','Vlan20'),(148,'Internet','192.168.20.51','1','0002.0b0a.1c2b','ARPA','Vlan20'),(149,'Internet','192.168.20.52','2','1c1b.0d3e.78de','ARPA','Vlan20'),(150,'Internet','192.168.20.53','36','10dd.b1b4.3fb2','ARPA','Vlan20'),(151,'Internet','192.168.20.58','3','408d.5c76.2999','ARPA','Vlan20'),(152,'Internet','192.168.20.59','0','408d.5c7e.1d61','ARPA','Vlan20'),(153,'Internet','192.168.20.60','0','1c1b.0d7a.edb1','ARPA','Vlan20'),(154,'Internet','192.168.20.61','21','704d.7b47.f924','ARPA','Vlan20'),(155,'Internet','192.168.20.62','113','00e0.4c36.08f1','ARPA','Vlan20'),(156,'Internet','192.168.20.63','0','54bf.6431.9cd4','ARPA','Vlan20'),(157,'Internet','192.168.20.64','0','f48e.3877.7c53','ARPA','Vlan20'),(158,'Internet','192.168.20.65','74','e0d5.5e8f.be9f','ARPA','Vlan20'),(159,'Internet','192.168.20.66','142','a4d9.3191.ade1','ARPA','Vlan20'),(160,'Internet','192.168.20.67','0','408d.5cc4.6341','ARPA','Vlan20'),(161,'Internet','192.168.20.68','56','00e0.4c36.057e','ARPA','Vlan20'),(162,'Internet','192.168.20.70','0','1c1b.0d1a.3769','ARPA','Vlan20'),(163,'Internet','192.168.20.71','0','1c1b.0d4f.6521','ARPA','Vlan20'),(164,'Internet','192.168.20.72','60','9c5c.8e00.d550','ARPA','Vlan20'),(165,'Internet','192.168.20.73','0','3863.bbd9.265c','ARPA','Vlan20'),(166,'Internet','192.168.20.74','10','9840.bb1c.6d00','ARPA','Vlan20'),(167,'Internet','192.168.20.76','20','ec8e.b525.ceca','ARPA','Vlan20'),(168,'Internet','192.168.20.78','1','9ce8.2b8f.16e5','ARPA','Vlan20'),(169,'Internet','192.168.20.79','0','1c1b.0dc2.f3d7','ARPA','Vlan20'),(170,'Internet','192.168.20.80','11','0025.22c1.32e9','ARPA','Vlan20'),(171,'Internet','192.168.20.86','0','705a.0f1f.3e13','ARPA','Vlan20'),(172,'Internet','192.168.20.87','0','1c1b.0d76.c1a6','ARPA','Vlan20'),(173,'Internet','192.168.20.88','54','309c.231d.6a3c','ARPA','Vlan20'),(174,'Internet','192.168.20.89','0','b083.feb6.e531','ARPA','Vlan20'),(175,'Internet','192.168.20.93','20','309c.231d.6de4','ARPA','Vlan20'),(176,'Internet','192.168.20.94','0','d017.c293.e68a','ARPA','Vlan20'),(177,'Internet','192.168.20.95','0','0860.6ef0.0777','ARPA','Vlan20'),(178,'Internet','192.168.20.96','80','a49b.4f74.837e','ARPA','Vlan20'),(179,'Internet','192.168.20.98','0','0c70.4af5.aaa5','ARPA','Vlan20'),(180,'Internet','192.168.20.99','28','a099.9b13.1a2d','ARPA','Vlan20'),(181,'Internet','192.168.20.100','41','00d8.613a.c322','ARPA','Vlan20'),(182,'Internet','192.168.20.102','20','a4ae.1229.1981','ARPA','Vlan20'),(183,'Internet','192.168.20.103','72','d017.c293.e6c0','ARPA','Vlan20'),(184,'Internet','192.168.20.104','0','d8cb.8ae0.8eff','ARPA','Vlan20'),(185,'Internet','192.168.20.106','0','408d.5cb7.9cf5','ARPA','Vlan20'),(186,'Internet','192.168.20.108','0','0860.6ec4.8228','ARPA','Vlan20'),(187,'Internet','192.168.20.109','0','00d8.613a.c693','ARPA','Vlan20'),(188,'Internet','192.168.20.110','63','00d8.613a.c763','ARPA','Vlan20'),(189,'Internet','192.168.20.112','0','309c.231d.6ab5','ARPA','Vlan20'),(190,'Internet','192.168.20.113','0','1c1b.0d7d.481e','ARPA','Vlan20'),(191,'Internet','192.168.20.114','0','408d.5c97.1233','ARPA','Vlan20'),(192,'Internet','192.168.20.115','0','2c44.fd0d.d15e','ARPA','Vlan20'),(193,'Internet','192.168.20.116','0','408d.5c5b.e5b8','ARPA','Vlan20'),(194,'Internet','192.168.20.117','0','2c44.fd0d.d167','ARPA','Vlan20'),(195,'Internet','192.168.20.119','1','0479.7098.6dbb','ARPA','Vlan20'),(196,'Internet','192.168.20.122','1','e0db.55b2.1264','ARPA','Vlan20'),(197,'Internet','192.168.20.123','125','3c07.5456.99e9','ARPA','Vlan20'),(198,'Internet','192.168.20.124','0','fcf8.ae9f.bf00','ARPA','Vlan20'),(199,'Internet','192.168.20.126','76','0800.2702.a2b4','ARPA','Vlan20'),(200,'Internet','192.168.20.127','0','18c0.4d1c.9b76','ARPA','Vlan20'),(201,'Internet','192.168.20.129','17','000c.290d.8d3f','ARPA','Vlan20'),(202,'Internet','192.168.20.130','0','20a6.0c1a.6026','ARPA','Vlan20'),(203,'Internet','192.168.20.131','14','c0f4.e6b0.35db','ARPA','Vlan20'),(204,'Internet','192.168.20.132','154','2cf0.5d53.a99c','ARPA','Vlan20'),(205,'Internet','192.168.20.133','25','2cf0.5d53.aa90','ARPA','Vlan20'),(206,'Internet','192.168.20.134','0','2c56.dc74.8e0b','ARPA','Vlan20'),(207,'Internet','192.168.20.135','0','0860.6ec4.8234','ARPA','Vlan20'),(208,'Internet','192.168.20.136','61','e4a7.c559.a819','ARPA','Vlan20'),(209,'Internet','192.168.20.137','0','1c1b.0d17.f05b','ARPA','Vlan20'),(210,'Internet','192.168.20.139','89','6c72.e7f3.5654','ARPA','Vlan20'),(211,'Internet','192.168.20.140','42','4cd1.a1a6.a6cf','ARPA','Vlan20'),(212,'Internet','192.168.20.141','26','ac92.3212.9346','ARPA','Vlan20'),(213,'Internet','192.168.20.143','37','b4a9.fcb9.3cf5','ARPA','Vlan20'),(214,'Internet','192.168.20.144','0','0800.27d4.45cc','ARPA','Vlan20'),(215,'Internet','192.168.20.149','3','1802.ae1e.f4f9','ARPA','Vlan20'),(216,'Internet','192.168.20.152','0','da27.ffba.4074','ARPA','Vlan20'),(217,'Internet','192.168.20.153','0','0860.6e84.6a41','ARPA','Vlan20'),(218,'Internet','192.168.20.154','63','0011.322c.a603','ARPA','Vlan20'),(219,'Internet','192.168.20.155','3','3497.f699.9d54','ARPA','Vlan20'),(220,'Internet','192.168.20.156','193','2cf0.5d53.a7a0','ARPA','Vlan20'),(221,'Internet','192.168.20.158','37','0860.6ef0.7c10','ARPA','Vlan20'),(222,'Internet','192.168.20.159','0','Incomplete','ARPA',''),(223,'Internet','192.168.20.160','11','10dd.b1eb.4437','ARPA','Vlan20'),(224,'Internet','192.168.20.161','1','04d3.b5da.31b4','ARPA','Vlan20'),(225,'Internet','192.168.20.162','57','98e7.f58a.e5aa','ARPA','Vlan20'),(226,'Internet','192.168.20.181','0','28d1.27c2.5a9c','ARPA','Vlan20'),(227,'Internet','192.168.20.197','0','9c5c.8e90.4d79','ARPA','Vlan20'),(228,'Internet','192.168.20.201','-','e0db.5595.f0aa','ARPA',''),(229,'Internet','192.168.21.1','-','7cad.74d8.95c2','ARPA','Vlan20'),(230,'Internet','192.168.30.1','-','7cad.74d8.95c3','ARPA','Vlan30'),(231,'Internet','192.168.30.21','-','5046.5d56.a20d','ARPA',''),(232,'Internet','192.168.30.22','-','5404.a6b3.adfb','ARPA',''),(233,'Internet','192.168.30.23','-','00e0.4c29.05a1','ARPA',''),(234,'Internet','192.168.30.26','-','0860.6ef0.0777','ARPA',''),(235,'Internet','192.168.30.51','2','00d8.613a.c617','ARPA','Vlan30'),(236,'Internet','192.168.30.52','2','5404.a6b3.adfb','ARPA','Vlan30'),(237,'Internet','192.168.30.56','0','38c9.8650.fdee','ARPA','Vlan30'),(238,'Internet','192.168.30.57','0','00e0.4c45.9f4e','ARPA','Vlan30'),(239,'Internet','192.168.30.70','0','2c44.fd0f.c10d','ARPA','Vlan30'),(240,'Internet','192.168.30.74','70','e454.e8da.e858','ARPA','Vlan30'),(241,'Internet','192.168.30.75','0','a44c.c819.e4de','ARPA','Vlan30'),(242,'Internet','192.168.30.76','10','705a.0fa8.b2a3','ARPA','Vlan30'),(243,'Internet','192.168.30.77','1','60a4.4c2e.c928','ARPA','Vlan30'),(244,'Internet','192.168.31.1','-','7cad.74d8.95c2','ARPA','Vlan20'),(245,'Internet','192.168.40.1','-','7cad.74d8.95c4','ARPA','Vlan40'),(246,'Internet','192.168.40.21','-','5404.a6d4.b8bf','ARPA',''),(247,'Internet','192.168.40.25','-','f46e.044b.8f8e','ARPA',''),(248,'Internet','192.168.40.27','-','2222.fdfd.dfdf','ARPA',''),(249,'Internet','192.168.40.29','-','000c.296c.26ca','ARPA',''),(250,'Internet','192.168.40.30','-','c860.009d.0e24','ARPA',''),(251,'Internet','192.168.40.31','-','5404.a6b3.ae0e','ARPA',''),(252,'Internet','192.168.40.32','-','705a.b6f1.8c43','ARPA',''),(253,'Internet','192.168.40.34','-','5404.a6f0.63cf','ARPA',''),(254,'Internet','192.168.40.36','-','000c.29b0.0006','ARPA',''),(255,'Internet','192.168.40.37','-','000c.2903.db05','ARPA',''),(256,'Internet','192.168.40.38','-','000c.29cc.6ebe','ARPA',''),(257,'Internet','192.168.40.39','-','000c.2977.61b9','ARPA',''),(258,'Internet','192.168.41.1','-','7cad.74d8.95c4','ARPA','Vlan40'),(259,'Internet','192.168.50.1','-','7cad.74d8.95c5','ARPA','Vlan50'),(260,'Internet','192.168.50.30','-','14da.e99e.f6d2','ARPA',''),(261,'Internet','192.168.50.31','-','90e6.ba00.e90f','ARPA',''),(262,'Internet','192.168.50.33','-','0024.2158.92a3','ARPA',''),(263,'Internet','192.168.50.34','-','00e0.4c24.93b1','ARPA',''),(264,'Internet','192.168.50.35','-','00e0.4c21.8d35','ARPA',''),(265,'Internet','192.168.50.37','-','c89c.dcae.a560','ARPA',''),(266,'Internet','192.168.50.39','-','0021.85c6.4b52','ARPA',''),(267,'Internet','192.168.50.43','-','0860.6ec4.8228','ARPA',''),(268,'Internet','192.168.50.44','-','001f.c6c4.0b59','ARPA',''),(269,'Internet','192.168.50.50','0','408d.5c97.e8f3','ARPA','Vlan50'),(270,'Internet','192.168.50.51','9','1c1b.0dfe.ab51','ARPA','Vlan50'),(271,'Internet','192.168.50.52','1','fcaa.14e7.d323','ARPA','Vlan50'),(272,'Internet','192.168.50.53','0','4cd9.8f5b.1f91','ARPA','Vlan50'),(273,'Internet','192.168.50.54','11','d8cb.8a14.fc57','ARPA','Vlan50'),(274,'Internet','192.168.50.55','0','c89c.dcae.4bbb','ARPA','Vlan50'),(275,'Internet','192.168.50.57','0','d8cb.8a71.58f5','ARPA','Vlan50'),(276,'Internet','192.168.50.58','1','a85e.45a0.559c','ARPA','Vlan50'),(277,'Internet','192.168.50.63','61','2cf0.5d0c.be33','ARPA','Vlan50'),(278,'Internet','192.168.50.66','0','1c1b.0dfe.ac2e','ARPA','Vlan50'),(279,'Internet','192.168.50.68','-','001f.c6c4.0557','ARPA',''),(280,'Internet','192.168.50.73','54','00d8.616f.c48a','ARPA','Vlan50'),(281,'Internet','192.168.50.74','202','408d.5cdb.21c7','ARPA','Vlan50'),(282,'Internet','192.168.50.75','0','Incomplete','ARPA',''),(283,'Internet','192.168.50.76','13','00d8.616f.c4e9','ARPA','Vlan50'),(284,'Internet','192.168.50.78','13','00d8.616f.c4ed','ARPA','Vlan50'),(285,'Internet','192.168.50.83','0','8cdc.d45c.f7fe','ARPA','Vlan50'),(286,'Internet','192.168.50.87','-','1499.e26c.fcb7','ARPA',''),(287,'Internet','192.168.50.103','-','c89c.dcae.4bbb','ARPA',''),(288,'Internet','192.168.50.116','-','00e0.4c21.91b9','ARPA',''),(289,'Internet','192.168.50.126','-','240a.6477.8a75','ARPA',''),(290,'Internet','192.168.50.135','-','00e0.4c0e.4674','ARPA',''),(291,'Internet','192.168.50.136','-','0020.4c0e.4337','ARPA',''),(292,'Internet','192.168.50.149','-','5046.5d56.a1ff','ARPA',''),(293,'Internet','192.168.50.190','73','ac18.2633.65c4','ARPA','Vlan50'),(294,'Internet','192.168.50.200','0','Incomplete','ARPA',''),(295,'Internet','192.168.50.230','0','f46d.0460.5508','ARPA','Vlan50'),(296,'Internet','192.168.50.231','1','408d.5c5b.fbf9','ARPA','Vlan50'),(297,'Internet','192.168.50.232','0','1c1b.0dfe.ab89','ARPA','Vlan50'),(298,'Internet','192.168.50.245','0','6400.6a2b.4616','ARPA','Vlan50'),(299,'Internet','192.168.51.1','-','7cad.74d8.95c5','ARPA','Vlan50'),(300,'Internet','192.168.60.1','-','7cad.74d8.95c6','ARPA','Vlan60'),(301,'Internet','192.168.61.1','-','7cad.74d8.95c6','ARPA','Vlan60'),(302,'Internet','192.168.70.1','-','7cad.74d8.95c7','ARPA','Vlan70'),(303,'Internet','192.168.70.100','0','8c86.1e8b.4ed1','ARPA','Vlan70'),(304,'Internet','192.168.80.1','-','7cad.74d8.95c8','ARPA','Vlan80'),(305,'Internet','192.168.80.2','173','1831.bfe4.3b80','ARPA','Vlan80'),(306,'Internet','192.168.90.1','-','7cad.74d8.95cd','ARPA','Vlan90'),(307,'Internet','192.168.90.3','91','dc2b.2a84.7764','ARPA','Vlan90'),(308,'Internet','192.168.90.4','89','f460.e2a9.2cc6','ARPA','Vlan90'),(309,'Internet','192.168.90.5','86','7442.8b43.a022','ARPA','Vlan90'),(310,'Internet','192.168.90.6','84','80ad.16e0.9523','ARPA','Vlan90'),(311,'Internet','192.168.90.7','85','88bf.e451.e84c','ARPA','Vlan90'),(312,'Internet','192.168.90.8','84','48b8.a32f.3f2e','ARPA','Vlan90'),(313,'Internet','192.168.90.9','92','2c20.0bc6.0cd6','ARPA','Vlan90'),(314,'Internet','192.168.90.10','92','885a.0683.97d5','ARPA','Vlan90'),(315,'Internet','192.168.90.11','84','a08d.16ee.f3f1','ARPA','Vlan90'),(316,'Internet','192.168.90.12','89','2c20.0b13.8f57','ARPA','Vlan90'),(317,'Internet','192.168.90.13','89','6c72.e7f3.5654','ARPA','Vlan90'),(318,'Internet','192.168.90.14','89','1801.f169.4e9a','ARPA','Vlan90'),(319,'Internet','192.168.90.15','88','f45c.89a0.28ff','ARPA','Vlan90'),(320,'Internet','192.168.90.16','85','d81c.7936.698b','ARPA','Vlan90'),(321,'Internet','192.168.90.17','86','2eeb.4cde.09d4','ARPA','Vlan90'),(322,'Internet','192.168.90.18','84','f067.28db.b573','ARPA','Vlan90'),(323,'Internet','192.168.90.19','85','3ebc.f8f3.13cc','ARPA','Vlan90'),(324,'Internet','192.168.90.20','85','acc1.ee33.7c9d','ARPA','Vlan90'),(325,'Internet','192.168.90.21','84','6083.731d.d111','ARPA','Vlan90'),(326,'Internet','192.168.90.22','84','a89c.edb7.89c4','ARPA','Vlan90'),(327,'Internet','192.168.100.1','0','0022.aada.105a','ARPA','Vlan100'),(328,'Internet','192.168.100.2','-','7cad.74d8.95ca','ARPA','Vlan100'),(329,'Internet','192.168.150.1','-','7cad.74d8.95cb','ARPA','Vlan150'),(330,'Internet','192.168.150.139','0','Incomplete','ARPA',''),(331,'Internet','192.168.201.1','-','7cad.74d8.95cc','ARPA','Vlan200');
/*!40000 ALTER TABLE `sign_show_address` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-09  9:38:40
