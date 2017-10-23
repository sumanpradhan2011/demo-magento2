-- MySQL dump 10.13  Distrib 5.7.19, for Linux (x86_64)
--
-- Host: localhost    Database: csvape_db
-- ------------------------------------------------------
-- Server version	5.7.19-0ubuntu0.16.04.1

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
-- Table structure for table `csvp_admin_passwords`
--

DROP TABLE IF EXISTS `csvp_admin_passwords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_admin_passwords` (
  `password_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Password Id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'User Id',
  `password_hash` varchar(100) DEFAULT NULL COMMENT 'Password Hash',
  `expires` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Deprecated',
  `last_updated` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Last Updated',
  PRIMARY KEY (`password_id`),
  KEY `CSVP_ADMIN_PASSWORDS_USER_ID` (`user_id`),
  CONSTRAINT `CSVP_ADMIN_PASSWORDS_USER_ID_ADMIN_USER_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `csvp_admin_user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Admin Passwords';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_admin_passwords`
--

LOCK TABLES `csvp_admin_passwords` WRITE;
/*!40000 ALTER TABLE `csvp_admin_passwords` DISABLE KEYS */;
INSERT INTO `csvp_admin_passwords` VALUES (1,1,'4bcac21bc7231cac7faa969c9c33beef12c9c9b1dabb0a2c17804b37961d526a:xlrfgHQ2YvFg7kb2b7ZiCsSdajzzWg1o:1',0,1508222098),(2,2,'2df7f412ab085854df201b930786eb327ddf8ba4a5836ebc613dbc36265b622c:IbXT5VZeqyZpBES5kaA3Ut68e7wDIO7d:1',0,1508329709);
/*!40000 ALTER TABLE `csvp_admin_passwords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_admin_system_messages`
--

DROP TABLE IF EXISTS `csvp_admin_system_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_admin_system_messages` (
  `identity` varchar(100) NOT NULL COMMENT 'Message id',
  `severity` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Problem type',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Create date',
  PRIMARY KEY (`identity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Admin System Messages';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_admin_system_messages`
--

LOCK TABLES `csvp_admin_system_messages` WRITE;
/*!40000 ALTER TABLE `csvp_admin_system_messages` DISABLE KEYS */;
INSERT INTO `csvp_admin_system_messages` VALUES ('b5b5de0a0651791ec61cdd9636a7e87b',2,'2017-10-18 05:07:40');
/*!40000 ALTER TABLE `csvp_admin_system_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_admin_user`
--

DROP TABLE IF EXISTS `csvp_admin_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_admin_user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'User ID',
  `firstname` varchar(32) DEFAULT NULL COMMENT 'User First Name',
  `lastname` varchar(32) DEFAULT NULL COMMENT 'User Last Name',
  `email` varchar(128) DEFAULT NULL COMMENT 'User Email',
  `username` varchar(40) DEFAULT NULL COMMENT 'User Login',
  `password` varchar(255) NOT NULL COMMENT 'User Password',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'User Created Time',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'User Modified Time',
  `logdate` timestamp NULL DEFAULT NULL COMMENT 'User Last Login Time',
  `lognum` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'User Login Number',
  `reload_acl_flag` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Reload ACL',
  `is_active` smallint(6) NOT NULL DEFAULT '1' COMMENT 'User Is Active',
  `extra` text COMMENT 'User Extra Data',
  `rp_token` text COMMENT 'Reset Password Link Token',
  `rp_token_created_at` timestamp NULL DEFAULT NULL COMMENT 'Reset Password Link Token Creation Date',
  `interface_locale` varchar(16) NOT NULL DEFAULT 'en_US' COMMENT 'Backend interface locale',
  `failures_num` smallint(6) DEFAULT '0' COMMENT 'Failure Number',
  `first_failure` timestamp NULL DEFAULT NULL COMMENT 'First Failure',
  `lock_expires` timestamp NULL DEFAULT NULL COMMENT 'Expiration Lock Dates',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `CSVP_ADMIN_USER_USERNAME` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Admin User Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_admin_user`
--

LOCK TABLES `csvp_admin_user` WRITE;
/*!40000 ALTER TABLE `csvp_admin_user` DISABLE KEYS */;
INSERT INTO `csvp_admin_user` VALUES (1,'admin','admin','sumanp@digitalaptech.com','admin','4bcac21bc7231cac7faa969c9c33beef12c9c9b1dabb0a2c17804b37961d526a:xlrfgHQ2YvFg7kb2b7ZiCsSdajzzWg1o:1','2017-10-17 06:34:58','2017-10-18 12:17:42','2017-10-18 12:17:42',13,0,1,'{\"configState\":{\"general_single_store_mode\":\"0\",\"general_store_information\":\"0\",\"general_locale\":\"0\",\"general_region\":\"0\",\"general_country\":\"0\",\"cms_wysiwyg\":\"1\"}}',NULL,NULL,'en_US',0,NULL,NULL),(2,'Montasar','Mondal','montasar@techievolve.com','montasar','2df7f412ab085854df201b930786eb327ddf8ba4a5836ebc613dbc36265b622c:IbXT5VZeqyZpBES5kaA3Ut68e7wDIO7d:1','2017-10-18 12:28:29','2017-10-18 12:28:47','2017-10-18 12:28:47',1,0,1,'null',NULL,NULL,'en_US',0,NULL,NULL);
/*!40000 ALTER TABLE `csvp_admin_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_admin_user_session`
--

DROP TABLE IF EXISTS `csvp_admin_user_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_admin_user_session` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `session_id` varchar(128) NOT NULL COMMENT 'Session id value',
  `user_id` int(10) unsigned DEFAULT NULL COMMENT 'Admin User ID',
  `status` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Current Session status',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created Time',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update Time',
  `ip` varchar(15) NOT NULL COMMENT 'Remote user IP',
  PRIMARY KEY (`id`),
  KEY `CSVP_ADMIN_USER_SESSION_SESSION_ID` (`session_id`),
  KEY `CSVP_ADMIN_USER_SESSION_USER_ID` (`user_id`),
  CONSTRAINT `CSVP_ADMIN_USER_SESSION_USER_ID_ADMIN_USER_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `csvp_admin_user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='Admin User sessions table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_admin_user_session`
--

LOCK TABLES `csvp_admin_user_session` WRITE;
/*!40000 ALTER TABLE `csvp_admin_user_session` DISABLE KEYS */;
INSERT INTO `csvp_admin_user_session` VALUES (1,'3o8bdor3k0epvqq8vg4cjv1iv2',1,1,'2017-10-17 06:42:22','2017-10-17 06:43:25','127.0.0.1'),(2,'7ti45rgscvqt2pak5cmdiv63h2',1,1,'2017-10-17 08:39:42','2017-10-17 08:41:10','127.0.0.1'),(3,'hdd3gig9rfts16jpn8rodvjqhn',1,1,'2017-10-17 12:03:16','2017-10-17 12:04:26','127.0.0.1'),(4,'1dl8nrrr692864usci3hp9sgsq',1,1,'2017-10-18 05:07:34','2017-10-18 05:07:43','127.0.0.1'),(5,'hhl2ll55shhnhvpkccivt02tcu',1,1,'2017-10-18 05:55:27','2017-10-18 05:58:32','192.168.0.7'),(6,'qcmpba6dq9nca4uiqee786mngh',1,1,'2017-10-18 06:17:41','2017-10-18 06:24:32','192.168.0.7'),(7,'kt2s9q21b2lj173hii5tnekupt',1,1,'2017-10-18 07:22:59','2017-10-18 07:23:20','192.168.0.7'),(8,'ncanpr7sv8j8dul2n5vf3t835t',1,1,'2017-10-18 09:00:05','2017-10-18 09:08:22','192.168.0.7'),(9,'11l5b6ld7lc180bc920n46htbo',1,1,'2017-10-18 09:51:56','2017-10-18 10:04:03','192.168.0.7'),(10,'d63kj6moiec8dg0isnachshfem',1,1,'2017-10-18 10:24:27','2017-10-18 10:46:07','192.168.0.7'),(11,'e29tk21f1tn0619pe23rp3a6ku',1,2,'2017-10-18 11:45:03','2017-10-18 11:46:06','192.168.0.7'),(12,'fp4j2ni8vgq1icntol5rtu5gdt',1,2,'2017-10-18 11:46:06','2017-10-18 12:17:42','192.168.0.14'),(13,'sl1odhmevi95pn4p8943clff6c',1,1,'2017-10-18 12:17:42','2017-10-18 12:32:34','192.168.0.7'),(14,'28f22uia08adv996jlmgae5dts',2,1,'2017-10-18 12:28:47','2017-10-18 12:29:02','192.168.0.14');
/*!40000 ALTER TABLE `csvp_admin_user_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_adminnotification_inbox`
--

DROP TABLE IF EXISTS `csvp_adminnotification_inbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_adminnotification_inbox` (
  `notification_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Notification id',
  `severity` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Problem type',
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Create date',
  `title` varchar(255) NOT NULL COMMENT 'Title',
  `description` text COMMENT 'Description',
  `url` varchar(255) DEFAULT NULL COMMENT 'Url',
  `is_read` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Flag if notification read',
  `is_remove` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Flag if notification might be removed',
  PRIMARY KEY (`notification_id`),
  KEY `CSVP_ADMINNOTIFICATION_INBOX_SEVERITY` (`severity`),
  KEY `CSVP_ADMINNOTIFICATION_INBOX_IS_READ` (`is_read`),
  KEY `CSVP_ADMINNOTIFICATION_INBOX_IS_REMOVE` (`is_remove`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Adminnotification Inbox';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_adminnotification_inbox`
--

LOCK TABLES `csvp_adminnotification_inbox` WRITE;
/*!40000 ALTER TABLE `csvp_adminnotification_inbox` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_adminnotification_inbox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_authorization_role`
--

DROP TABLE IF EXISTS `csvp_authorization_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_authorization_role` (
  `role_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Role ID',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Parent Role ID',
  `tree_level` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Role Tree Level',
  `sort_order` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Role Sort Order',
  `role_type` varchar(1) NOT NULL DEFAULT '0' COMMENT 'Role Type',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'User ID',
  `user_type` varchar(16) DEFAULT NULL COMMENT 'User Type',
  `role_name` varchar(50) DEFAULT NULL COMMENT 'Role Name',
  PRIMARY KEY (`role_id`),
  KEY `CSVP_AUTHORIZATION_ROLE_PARENT_ID_SORT_ORDER` (`parent_id`,`sort_order`),
  KEY `CSVP_AUTHORIZATION_ROLE_TREE_LEVEL` (`tree_level`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='Admin Role Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_authorization_role`
--

LOCK TABLES `csvp_authorization_role` WRITE;
/*!40000 ALTER TABLE `csvp_authorization_role` DISABLE KEYS */;
INSERT INTO `csvp_authorization_role` VALUES (2,0,1,1,'G',0,'2','Administrators'),(3,2,2,0,'U',1,'2','admin'),(6,0,1,0,'U',4,'1','14'),(7,2,2,0,'U',2,'2','Montasar');
/*!40000 ALTER TABLE `csvp_authorization_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_authorization_rule`
--

DROP TABLE IF EXISTS `csvp_authorization_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_authorization_rule` (
  `rule_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule ID',
  `role_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Role ID',
  `resource_id` varchar(255) DEFAULT NULL COMMENT 'Resource ID',
  `privileges` varchar(20) DEFAULT NULL COMMENT 'Privileges',
  `permission` varchar(10) DEFAULT NULL COMMENT 'Permission',
  PRIMARY KEY (`rule_id`),
  KEY `CSVP_AUTHORIZATION_RULE_RESOURCE_ID_ROLE_ID` (`resource_id`,`role_id`),
  KEY `CSVP_AUTHORIZATION_RULE_ROLE_ID_RESOURCE_ID` (`role_id`,`resource_id`),
  CONSTRAINT `CSVP_AUTHORIZATION_RULE_ROLE_ID_AUTHORIZATION_ROLE_ROLE_ID` FOREIGN KEY (`role_id`) REFERENCES `csvp_authorization_role` (`role_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1517 DEFAULT CHARSET=utf8 COMMENT='Admin Rule Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_authorization_rule`
--

LOCK TABLES `csvp_authorization_rule` WRITE;
/*!40000 ALTER TABLE `csvp_authorization_rule` DISABLE KEYS */;
INSERT INTO `csvp_authorization_rule` VALUES (379,2,'Magento_Backend::all',NULL,'allow');
/*!40000 ALTER TABLE `csvp_authorization_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_cache`
--

DROP TABLE IF EXISTS `csvp_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_cache` (
  `id` varchar(200) NOT NULL COMMENT 'Cache Id',
  `data` mediumblob COMMENT 'Cache Data',
  `create_time` int(11) DEFAULT NULL COMMENT 'Cache Creation Time',
  `update_time` int(11) DEFAULT NULL COMMENT 'Time of Cache Updating',
  `expire_time` int(11) DEFAULT NULL COMMENT 'Cache Expiration Time',
  PRIMARY KEY (`id`),
  KEY `CSVP_CACHE_EXPIRE_TIME` (`expire_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Caches';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_cache`
--

LOCK TABLES `csvp_cache` WRITE;
/*!40000 ALTER TABLE `csvp_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_cache_tag`
--

DROP TABLE IF EXISTS `csvp_cache_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_cache_tag` (
  `tag` varchar(100) NOT NULL COMMENT 'Tag',
  `cache_id` varchar(200) NOT NULL COMMENT 'Cache Id',
  PRIMARY KEY (`tag`,`cache_id`),
  KEY `CSVP_CACHE_TAG_CACHE_ID` (`cache_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tag Caches';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_cache_tag`
--

LOCK TABLES `csvp_cache_tag` WRITE;
/*!40000 ALTER TABLE `csvp_cache_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_cache_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_captcha_log`
--

DROP TABLE IF EXISTS `csvp_captcha_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_captcha_log` (
  `type` varchar(32) NOT NULL COMMENT 'Type',
  `value` varchar(32) NOT NULL COMMENT 'Value',
  `count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Count',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Update Time',
  PRIMARY KEY (`type`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Count Login Attempts';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_captcha_log`
--

LOCK TABLES `csvp_captcha_log` WRITE;
/*!40000 ALTER TABLE `csvp_captcha_log` DISABLE KEYS */;
INSERT INTO `csvp_captcha_log` VALUES ('2','sumanp',1,'2017-10-17 06:42:10');
/*!40000 ALTER TABLE `csvp_captcha_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalog_category_entity`
--

DROP TABLE IF EXISTS `csvp_catalog_category_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalog_category_entity` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attriute Set ID',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Parent Category ID',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation Time',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update Time',
  `path` varchar(255) NOT NULL COMMENT 'Tree Path',
  `position` int(11) NOT NULL COMMENT 'Position',
  `level` int(11) NOT NULL DEFAULT '0' COMMENT 'Tree Level',
  `children_count` int(11) NOT NULL COMMENT 'Child Count',
  PRIMARY KEY (`entity_id`),
  KEY `CSVP_CATALOG_CATEGORY_ENTITY_LEVEL` (`level`),
  KEY `CSVP_CATALOG_CATEGORY_ENTITY_PATH` (`path`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Catalog Category Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalog_category_entity`
--

LOCK TABLES `csvp_catalog_category_entity` WRITE;
/*!40000 ALTER TABLE `csvp_catalog_category_entity` DISABLE KEYS */;
INSERT INTO `csvp_catalog_category_entity` VALUES (1,3,0,'2017-10-17 06:33:06','2017-10-17 06:33:07','1',0,0,1),(2,3,1,'2017-10-17 06:33:07','2017-10-17 06:33:07','1/2',1,1,0);
/*!40000 ALTER TABLE `csvp_catalog_category_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalog_category_entity_datetime`
--

DROP TABLE IF EXISTS `csvp_catalog_category_entity_datetime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalog_category_entity_datetime` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` datetime DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CSVP_CAT_CTGR_ENTT_DTIME_ENTT_ID_ATTR_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CSVP_CATALOG_CATEGORY_ENTITY_DATETIME_ENTITY_ID` (`entity_id`),
  KEY `CSVP_CATALOG_CATEGORY_ENTITY_DATETIME_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CSVP_CATALOG_CATEGORY_ENTITY_DATETIME_STORE_ID` (`store_id`),
  CONSTRAINT `CSVP_CATALOG_CATEGORY_ENTITY_DATETIME_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_CAT_CTGR_ENTT_DTIME_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `csvp_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_CAT_CTGR_ENTT_DTIME_ENTT_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `csvp_catalog_category_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Datetime Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalog_category_entity_datetime`
--

LOCK TABLES `csvp_catalog_category_entity_datetime` WRITE;
/*!40000 ALTER TABLE `csvp_catalog_category_entity_datetime` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_catalog_category_entity_datetime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalog_category_entity_decimal`
--

DROP TABLE IF EXISTS `csvp_catalog_category_entity_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalog_category_entity_decimal` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` decimal(12,4) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CSVP_CAT_CTGR_ENTT_DEC_ENTT_ID_ATTR_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CSVP_CATALOG_CATEGORY_ENTITY_DECIMAL_ENTITY_ID` (`entity_id`),
  KEY `CSVP_CATALOG_CATEGORY_ENTITY_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CSVP_CATALOG_CATEGORY_ENTITY_DECIMAL_STORE_ID` (`store_id`),
  CONSTRAINT `CSVP_CATALOG_CATEGORY_ENTITY_DECIMAL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_CAT_CTGR_ENTT_DEC_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `csvp_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_CAT_CTGR_ENTT_DEC_ENTT_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `csvp_catalog_category_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Decimal Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalog_category_entity_decimal`
--

LOCK TABLES `csvp_catalog_category_entity_decimal` WRITE;
/*!40000 ALTER TABLE `csvp_catalog_category_entity_decimal` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_catalog_category_entity_decimal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalog_category_entity_int`
--

DROP TABLE IF EXISTS `csvp_catalog_category_entity_int`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalog_category_entity_int` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` int(11) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CSVP_CATALOG_CATEGORY_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CSVP_CATALOG_CATEGORY_ENTITY_INT_ENTITY_ID` (`entity_id`),
  KEY `CSVP_CATALOG_CATEGORY_ENTITY_INT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CSVP_CATALOG_CATEGORY_ENTITY_INT_STORE_ID` (`store_id`),
  CONSTRAINT `CSVP_CATALOG_CATEGORY_ENTITY_INT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_CAT_CTGR_ENTT_INT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `csvp_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_CAT_CTGR_ENTT_INT_ENTT_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `csvp_catalog_category_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Catalog Category Integer Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalog_category_entity_int`
--

LOCK TABLES `csvp_catalog_category_entity_int` WRITE;
/*!40000 ALTER TABLE `csvp_catalog_category_entity_int` DISABLE KEYS */;
INSERT INTO `csvp_catalog_category_entity_int` VALUES (1,69,0,1,1),(2,46,0,2,1),(3,69,0,2,1);
/*!40000 ALTER TABLE `csvp_catalog_category_entity_int` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalog_category_entity_text`
--

DROP TABLE IF EXISTS `csvp_catalog_category_entity_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalog_category_entity_text` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` text COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CSVP_CAT_CTGR_ENTT_TEXT_ENTT_ID_ATTR_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CSVP_CATALOG_CATEGORY_ENTITY_TEXT_ENTITY_ID` (`entity_id`),
  KEY `CSVP_CATALOG_CATEGORY_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CSVP_CATALOG_CATEGORY_ENTITY_TEXT_STORE_ID` (`store_id`),
  CONSTRAINT `CSVP_CATALOG_CATEGORY_ENTITY_TEXT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_CAT_CTGR_ENTT_TEXT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `csvp_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_CAT_CTGR_ENTT_TEXT_ENTT_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `csvp_catalog_category_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Text Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalog_category_entity_text`
--

LOCK TABLES `csvp_catalog_category_entity_text` WRITE;
/*!40000 ALTER TABLE `csvp_catalog_category_entity_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_catalog_category_entity_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalog_category_entity_varchar`
--

DROP TABLE IF EXISTS `csvp_catalog_category_entity_varchar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalog_category_entity_varchar` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CSVP_CAT_CTGR_ENTT_VCHR_ENTT_ID_ATTR_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CSVP_CATALOG_CATEGORY_ENTITY_VARCHAR_ENTITY_ID` (`entity_id`),
  KEY `CSVP_CATALOG_CATEGORY_ENTITY_VARCHAR_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CSVP_CATALOG_CATEGORY_ENTITY_VARCHAR_STORE_ID` (`store_id`),
  CONSTRAINT `CSVP_CATALOG_CATEGORY_ENTITY_VARCHAR_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_CAT_CTGR_ENTT_VCHR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `csvp_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_CAT_CTGR_ENTT_VCHR_ENTT_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `csvp_catalog_category_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Catalog Category Varchar Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalog_category_entity_varchar`
--

LOCK TABLES `csvp_catalog_category_entity_varchar` WRITE;
/*!40000 ALTER TABLE `csvp_catalog_category_entity_varchar` DISABLE KEYS */;
INSERT INTO `csvp_catalog_category_entity_varchar` VALUES (1,45,0,1,'Root Catalog'),(2,45,0,2,'Default Category'),(3,52,0,2,'PRODUCTS');
/*!40000 ALTER TABLE `csvp_catalog_category_entity_varchar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalog_category_product`
--

DROP TABLE IF EXISTS `csvp_catalog_category_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalog_category_product` (
  `entity_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Category ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `position` int(11) NOT NULL DEFAULT '0' COMMENT 'Position',
  PRIMARY KEY (`entity_id`,`category_id`,`product_id`),
  UNIQUE KEY `CSVP_CATALOG_CATEGORY_PRODUCT_CATEGORY_ID_PRODUCT_ID` (`category_id`,`product_id`),
  KEY `CSVP_CATALOG_CATEGORY_PRODUCT_PRODUCT_ID` (`product_id`),
  CONSTRAINT `CSVP_CAT_CTGR_PRD_CTGR_ID_CSVP_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`category_id`) REFERENCES `csvp_catalog_category_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_CAT_CTGR_PRD_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `csvp_catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product To Category Linkage Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalog_category_product`
--

LOCK TABLES `csvp_catalog_category_product` WRITE;
/*!40000 ALTER TABLE `csvp_catalog_category_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_catalog_category_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalog_category_product_index`
--

DROP TABLE IF EXISTS `csvp_catalog_category_product_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalog_category_product_index` (
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Category ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `position` int(11) DEFAULT NULL COMMENT 'Position',
  `is_parent` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Parent',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `visibility` smallint(5) unsigned NOT NULL COMMENT 'Visibility',
  PRIMARY KEY (`category_id`,`product_id`,`store_id`),
  KEY `CSVP_CAT_CTGR_PRD_IDX_PRD_ID_STORE_ID_CTGR_ID_VISIBILITY` (`product_id`,`store_id`,`category_id`,`visibility`),
  KEY `IDX_F72F14067CE11F2C42E278BCFF0C6E90` (`store_id`,`category_id`,`visibility`,`is_parent`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Product Index';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalog_category_product_index`
--

LOCK TABLES `csvp_catalog_category_product_index` WRITE;
/*!40000 ALTER TABLE `csvp_catalog_category_product_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_catalog_category_product_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalog_category_product_index_replica`
--

DROP TABLE IF EXISTS `csvp_catalog_category_product_index_replica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalog_category_product_index_replica` (
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Category ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `position` int(11) DEFAULT NULL COMMENT 'Position',
  `is_parent` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Parent',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `visibility` smallint(5) unsigned NOT NULL COMMENT 'Visibility',
  PRIMARY KEY (`category_id`,`product_id`,`store_id`),
  KEY `CSVP_CAT_CTGR_PRD_IDX_PRD_ID_STORE_ID_CTGR_ID_VISIBILITY` (`product_id`,`store_id`,`category_id`,`visibility`),
  KEY `IDX_F72F14067CE11F2C42E278BCFF0C6E90` (`store_id`,`category_id`,`visibility`,`is_parent`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Product Index';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalog_category_product_index_replica`
--

LOCK TABLES `csvp_catalog_category_product_index_replica` WRITE;
/*!40000 ALTER TABLE `csvp_catalog_category_product_index_replica` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_catalog_category_product_index_replica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalog_category_product_index_tmp`
--

DROP TABLE IF EXISTS `csvp_catalog_category_product_index_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalog_category_product_index_tmp` (
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Category ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `position` int(11) NOT NULL DEFAULT '0' COMMENT 'Position',
  `is_parent` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Parent',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `visibility` smallint(5) unsigned NOT NULL COMMENT 'Visibility',
  PRIMARY KEY (`category_id`,`product_id`,`store_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Category Product Indexer temporary table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalog_category_product_index_tmp`
--

LOCK TABLES `csvp_catalog_category_product_index_tmp` WRITE;
/*!40000 ALTER TABLE `csvp_catalog_category_product_index_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_catalog_category_product_index_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalog_compare_item`
--

DROP TABLE IF EXISTS `csvp_catalog_compare_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalog_compare_item` (
  `catalog_compare_item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Compare Item ID',
  `visitor_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Visitor ID',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store ID',
  PRIMARY KEY (`catalog_compare_item_id`),
  KEY `CSVP_CATALOG_COMPARE_ITEM_PRODUCT_ID` (`product_id`),
  KEY `CSVP_CATALOG_COMPARE_ITEM_VISITOR_ID_PRODUCT_ID` (`visitor_id`,`product_id`),
  KEY `CSVP_CATALOG_COMPARE_ITEM_CUSTOMER_ID_PRODUCT_ID` (`customer_id`,`product_id`),
  KEY `CSVP_CATALOG_COMPARE_ITEM_STORE_ID` (`store_id`),
  CONSTRAINT `CSVP_CATALOG_COMPARE_ITEM_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `csvp_customer_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_CATALOG_COMPARE_ITEM_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE SET NULL,
  CONSTRAINT `CSVP_CAT_CMP_ITEM_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `csvp_catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Compare Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalog_compare_item`
--

LOCK TABLES `csvp_catalog_compare_item` WRITE;
/*!40000 ALTER TABLE `csvp_catalog_compare_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_catalog_compare_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalog_eav_attribute`
--

DROP TABLE IF EXISTS `csvp_catalog_eav_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalog_eav_attribute` (
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `frontend_input_renderer` varchar(255) DEFAULT NULL COMMENT 'Frontend Input Renderer',
  `is_global` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Global',
  `is_visible` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Visible',
  `is_searchable` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Searchable',
  `is_filterable` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Filterable',
  `is_comparable` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Comparable',
  `is_visible_on_front` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible On Front',
  `is_html_allowed_on_front` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is HTML Allowed On Front',
  `is_used_for_price_rules` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Used For Price Rules',
  `is_filterable_in_search` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Filterable In Search',
  `used_in_product_listing` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Used In Product Listing',
  `used_for_sort_by` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Used For Sorting',
  `apply_to` varchar(255) DEFAULT NULL COMMENT 'Apply To',
  `is_visible_in_advanced_search` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible In Advanced Search',
  `position` int(11) NOT NULL DEFAULT '0' COMMENT 'Position',
  `is_wysiwyg_enabled` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is WYSIWYG Enabled',
  `is_used_for_promo_rules` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Used For Promo Rules',
  `is_required_in_admin_store` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Required In Admin Store',
  `is_used_in_grid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Used in Grid',
  `is_visible_in_grid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible in Grid',
  `is_filterable_in_grid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Filterable in Grid',
  `search_weight` float NOT NULL DEFAULT '1' COMMENT 'Search Weight',
  `additional_data` text COMMENT 'Additional swatch attributes data',
  PRIMARY KEY (`attribute_id`),
  KEY `CSVP_CATALOG_EAV_ATTRIBUTE_USED_FOR_SORT_BY` (`used_for_sort_by`),
  KEY `CSVP_CATALOG_EAV_ATTRIBUTE_USED_IN_PRODUCT_LISTING` (`used_in_product_listing`),
  CONSTRAINT `CSVP_CAT_EAV_ATTR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `csvp_eav_attribute` (`attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog EAV Attribute Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalog_eav_attribute`
--

LOCK TABLES `csvp_catalog_eav_attribute` WRITE;
/*!40000 ALTER TABLE `csvp_catalog_eav_attribute` DISABLE KEYS */;
INSERT INTO `csvp_catalog_eav_attribute` VALUES (45,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(46,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(47,NULL,0,1,0,0,0,0,1,0,0,0,0,NULL,0,0,1,0,0,0,0,0,1,NULL),(48,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(49,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(50,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(51,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(52,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(53,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(54,NULL,1,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(55,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(56,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(57,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(58,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(59,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(60,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(61,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(62,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(63,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(64,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(65,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(66,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(67,'Magento\\Catalog\\Block\\Adminhtml\\Category\\Helper\\Sortby\\Available',0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(68,'Magento\\Catalog\\Block\\Adminhtml\\Category\\Helper\\Sortby\\DefaultSortby',0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(69,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(70,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(71,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(72,'Magento\\Catalog\\Block\\Adminhtml\\Category\\Helper\\Pricestep',0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(73,NULL,0,1,1,0,0,0,0,0,0,1,1,NULL,1,0,0,0,0,0,0,0,5,NULL),(74,NULL,1,1,1,0,1,0,0,0,0,0,0,NULL,1,0,0,0,0,0,0,0,6,NULL),(75,NULL,0,1,1,0,1,0,1,0,0,0,0,NULL,1,0,1,0,0,0,0,0,1,NULL),(76,NULL,0,1,1,0,1,0,1,0,0,1,0,NULL,1,0,1,0,0,1,0,0,1,NULL),(77,NULL,1,1,1,1,0,0,0,0,0,1,1,'simple,virtual,bundle,downloadable,configurable',1,0,0,0,0,0,0,0,1,NULL),(78,NULL,1,1,0,0,0,0,0,0,0,1,0,'simple,virtual,bundle,downloadable,configurable',0,0,0,0,0,1,0,1,1,NULL),(79,NULL,2,1,0,0,0,0,0,0,0,1,0,'simple,virtual,bundle,downloadable,configurable',0,0,0,0,0,1,0,0,1,NULL),(80,NULL,2,1,0,0,0,0,0,0,0,1,0,'simple,virtual,bundle,downloadable,configurable',0,0,0,0,0,1,0,0,1,NULL),(81,NULL,1,1,0,0,0,0,0,0,0,0,0,'simple,virtual,downloadable',0,0,0,0,0,1,0,1,1,NULL),(82,'Magento\\Catalog\\Block\\Adminhtml\\Product\\Helper\\Form\\Weight',1,1,0,0,0,0,0,0,0,0,0,'simple,virtual,bundle,downloadable,configurable',0,0,0,0,0,1,0,1,1,NULL),(83,NULL,1,1,1,1,1,0,0,0,0,0,0,'simple',1,0,0,0,0,1,0,1,1,NULL),(84,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,1,0,1,1,NULL),(85,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,1,0,1,1,NULL),(86,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,1,0,1,1,NULL),(87,NULL,0,1,0,0,0,0,0,0,0,1,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(88,NULL,0,1,0,0,0,0,0,0,0,1,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(89,NULL,0,1,0,0,0,0,0,0,0,1,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(90,NULL,1,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(91,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(92,NULL,2,1,0,0,0,0,0,0,0,0,0,'simple,virtual,bundle,downloadable',0,0,0,0,0,0,0,0,1,NULL),(93,NULL,1,1,1,1,1,0,0,0,0,0,0,'simple,virtual,configurable',1,0,0,0,0,1,0,1,1,NULL),(94,NULL,2,1,0,0,0,0,0,0,0,1,0,NULL,0,0,0,0,0,1,0,0,1,NULL),(95,NULL,2,1,0,0,0,0,0,0,0,1,0,NULL,0,0,0,0,0,1,0,0,1,NULL),(96,NULL,1,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(97,'Magento\\Framework\\Data\\Form\\Element\\Hidden',2,1,1,0,0,0,0,0,0,1,0,NULL,0,0,0,0,1,0,0,0,1,NULL),(98,NULL,0,0,0,0,0,0,0,0,0,0,0,'simple,virtual,bundle,downloadable,configurable',0,0,0,0,0,0,0,0,1,NULL),(99,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,1,0,0,0,1,NULL),(100,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,1,0,1,1,NULL),(101,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,1,0,0,1,NULL),(102,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,1,0,0,1,NULL),(103,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(104,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,1,0,0,1,NULL),(105,'Magento\\Catalog\\Block\\Adminhtml\\Product\\Helper\\Form\\Category',1,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(106,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(107,NULL,1,0,0,0,0,0,0,0,0,1,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(108,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(109,NULL,0,0,0,0,0,0,0,0,0,1,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(110,NULL,0,0,0,0,0,0,0,0,0,1,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(111,NULL,0,0,0,0,0,0,0,0,0,1,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(112,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(113,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(114,NULL,2,1,0,0,0,0,0,0,0,0,0,'simple,bundle,grouped,configurable',0,0,0,0,0,1,0,1,1,NULL),(115,'Magento\\CatalogInventory\\Block\\Adminhtml\\Form\\Field\\Stock',1,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(116,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,1,0,0,1,NULL),(117,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(118,NULL,0,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(119,NULL,0,1,0,0,0,0,0,0,0,1,0,NULL,0,0,0,0,0,1,0,1,1,NULL),(120,NULL,0,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(121,'Magento\\Msrp\\Block\\Adminhtml\\Product\\Helper\\Form\\Type',1,1,0,0,0,0,0,0,0,1,0,'simple,virtual,downloadable,bundle,configurable',0,0,0,0,0,1,0,1,1,NULL),(122,'Magento\\Msrp\\Block\\Adminhtml\\Product\\Helper\\Form\\Type\\Price',2,1,0,0,0,0,0,0,0,1,0,'simple,virtual,downloadable,bundle,configurable',0,0,0,0,0,0,0,0,1,NULL),(123,NULL,1,1,0,0,0,0,0,0,0,1,0,'bundle',0,0,0,0,0,0,0,0,1,NULL),(124,NULL,1,1,0,0,0,0,0,0,0,0,0,'bundle',0,0,0,0,0,0,0,0,1,NULL),(125,NULL,1,1,0,0,0,0,0,0,0,1,0,'bundle',0,0,0,0,0,0,0,0,1,NULL),(126,NULL,1,1,0,0,0,0,0,0,0,1,0,'bundle',0,0,0,0,0,0,0,0,1,NULL),(127,NULL,1,1,0,0,0,0,0,0,0,1,0,'bundle',0,0,0,0,0,0,0,0,1,NULL),(128,NULL,1,0,0,0,0,0,0,0,0,1,0,'downloadable',0,0,0,0,0,0,0,0,1,NULL),(129,NULL,0,0,0,0,0,0,0,0,0,0,0,'downloadable',0,0,0,0,0,0,0,0,1,NULL),(130,NULL,0,0,0,0,0,0,0,0,0,0,0,'downloadable',0,0,0,0,0,0,0,0,1,NULL),(131,NULL,1,0,0,0,0,0,0,0,0,1,0,'downloadable',0,0,0,0,0,0,0,0,1,NULL),(132,'Magento\\GiftMessage\\Block\\Adminhtml\\Product\\Helper\\Form\\Config',1,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,1,0,0,1,NULL),(133,NULL,0,1,0,0,0,0,0,0,0,1,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(134,NULL,2,1,1,0,0,0,0,0,0,1,0,'simple,virtual,bundle,downloadable,configurable',0,0,0,0,0,1,0,1,1,NULL);
/*!40000 ALTER TABLE `csvp_catalog_eav_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalog_product_bundle_option`
--

DROP TABLE IF EXISTS `csvp_catalog_product_bundle_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalog_product_bundle_option` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `required` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Required',
  `position` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Position',
  `type` varchar(255) DEFAULT NULL COMMENT 'Type',
  PRIMARY KEY (`option_id`),
  KEY `CSVP_CATALOG_PRODUCT_BUNDLE_OPTION_PARENT_ID` (`parent_id`),
  CONSTRAINT `CSVP_CAT_PRD_BNDL_OPT_PARENT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`parent_id`) REFERENCES `csvp_catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Option';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalog_product_bundle_option`
--

LOCK TABLES `csvp_catalog_product_bundle_option` WRITE;
/*!40000 ALTER TABLE `csvp_catalog_product_bundle_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_catalog_product_bundle_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalog_product_bundle_option_value`
--

DROP TABLE IF EXISTS `csvp_catalog_product_bundle_option_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalog_product_bundle_option_value` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `option_id` int(10) unsigned NOT NULL COMMENT 'Option Id',
  `parent_product_id` int(10) unsigned NOT NULL COMMENT 'Parent Product Id',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CSVP_CAT_PRD_BNDL_OPT_VAL_OPT_ID_PARENT_PRD_ID_STORE_ID` (`option_id`,`parent_product_id`,`store_id`),
  CONSTRAINT `CSVP_CAT_PRD_BNDL_OPT_VAL_OPT_ID_CAT_PRD_BNDL_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `csvp_catalog_product_bundle_option` (`option_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Option Value';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalog_product_bundle_option_value`
--

LOCK TABLES `csvp_catalog_product_bundle_option_value` WRITE;
/*!40000 ALTER TABLE `csvp_catalog_product_bundle_option_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_catalog_product_bundle_option_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalog_product_bundle_price_index`
--

DROP TABLE IF EXISTS `csvp_catalog_product_bundle_price_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalog_product_bundle_price_index` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `customer_group_id` int(10) unsigned NOT NULL COMMENT 'Customer Group Id',
  `min_price` decimal(12,4) NOT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) NOT NULL COMMENT 'Max Price',
  PRIMARY KEY (`entity_id`,`website_id`,`customer_group_id`),
  KEY `CSVP_CATALOG_PRODUCT_BUNDLE_PRICE_INDEX_WEBSITE_ID` (`website_id`),
  KEY `CSVP_CATALOG_PRODUCT_BUNDLE_PRICE_INDEX_CUSTOMER_GROUP_ID` (`customer_group_id`),
  CONSTRAINT `CSVP_CAT_PRD_BNDL_PRICE_IDX_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `csvp_catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_CAT_PRD_BNDL_PRICE_IDX_WS_ID_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `csvp_store_website` (`website_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_21FF67BC5D3692A011480211ECC95BEB` FOREIGN KEY (`customer_group_id`) REFERENCES `csvp_customer_group` (`customer_group_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Price Index';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalog_product_bundle_price_index`
--

LOCK TABLES `csvp_catalog_product_bundle_price_index` WRITE;
/*!40000 ALTER TABLE `csvp_catalog_product_bundle_price_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_catalog_product_bundle_price_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalog_product_bundle_selection`
--

DROP TABLE IF EXISTS `csvp_catalog_product_bundle_selection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalog_product_bundle_selection` (
  `selection_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Selection Id',
  `option_id` int(10) unsigned NOT NULL COMMENT 'Option Id',
  `parent_product_id` int(10) unsigned NOT NULL COMMENT 'Parent Product Id',
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `position` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Position',
  `is_default` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Default',
  `selection_price_type` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Selection Price Type',
  `selection_price_value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Selection Price Value',
  `selection_qty` decimal(12,4) DEFAULT NULL COMMENT 'Selection Qty',
  `selection_can_change_qty` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Selection Can Change Qty',
  PRIMARY KEY (`selection_id`),
  KEY `CSVP_CATALOG_PRODUCT_BUNDLE_SELECTION_OPTION_ID` (`option_id`),
  KEY `CSVP_CATALOG_PRODUCT_BUNDLE_SELECTION_PRODUCT_ID` (`product_id`),
  CONSTRAINT `CSVP_CAT_PRD_BNDL_SELECTION_OPT_ID_CAT_PRD_BNDL_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `csvp_catalog_product_bundle_option` (`option_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_CAT_PRD_BNDL_SELECTION_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `csvp_catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Selection';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalog_product_bundle_selection`
--

LOCK TABLES `csvp_catalog_product_bundle_selection` WRITE;
/*!40000 ALTER TABLE `csvp_catalog_product_bundle_selection` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_catalog_product_bundle_selection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalog_product_bundle_selection_price`
--

DROP TABLE IF EXISTS `csvp_catalog_product_bundle_selection_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalog_product_bundle_selection_price` (
  `selection_id` int(10) unsigned NOT NULL COMMENT 'Selection Id',
  `parent_product_id` int(10) unsigned NOT NULL COMMENT 'Parent Product Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `selection_price_type` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Selection Price Type',
  `selection_price_value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Selection Price Value',
  PRIMARY KEY (`selection_id`,`parent_product_id`,`website_id`),
  KEY `CSVP_CATALOG_PRODUCT_BUNDLE_SELECTION_PRICE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `CSVP_CAT_PRD_BNDL_SELECTION_PRICE_WS_ID_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `csvp_store_website` (`website_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_D75F58519996F5AADD0AA8954E77129B` FOREIGN KEY (`selection_id`) REFERENCES `csvp_catalog_product_bundle_selection` (`selection_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Selection Price';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalog_product_bundle_selection_price`
--

LOCK TABLES `csvp_catalog_product_bundle_selection_price` WRITE;
/*!40000 ALTER TABLE `csvp_catalog_product_bundle_selection_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_catalog_product_bundle_selection_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalog_product_bundle_stock_index`
--

DROP TABLE IF EXISTS `csvp_catalog_product_bundle_stock_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalog_product_bundle_stock_index` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `stock_id` smallint(5) unsigned NOT NULL COMMENT 'Stock Id',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option Id',
  `stock_status` smallint(6) DEFAULT '0' COMMENT 'Stock Status',
  PRIMARY KEY (`entity_id`,`website_id`,`stock_id`,`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Stock Index';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalog_product_bundle_stock_index`
--

LOCK TABLES `csvp_catalog_product_bundle_stock_index` WRITE;
/*!40000 ALTER TABLE `csvp_catalog_product_bundle_stock_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_catalog_product_bundle_stock_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalog_product_entity`
--

DROP TABLE IF EXISTS `csvp_catalog_product_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalog_product_entity` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Set ID',
  `type_id` varchar(32) NOT NULL DEFAULT 'simple' COMMENT 'Type ID',
  `sku` varchar(64) DEFAULT NULL COMMENT 'SKU',
  `has_options` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Has Options',
  `required_options` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Required Options',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation Time',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update Time',
  PRIMARY KEY (`entity_id`),
  KEY `CSVP_CATALOG_PRODUCT_ENTITY_ATTRIBUTE_SET_ID` (`attribute_set_id`),
  KEY `CSVP_CATALOG_PRODUCT_ENTITY_SKU` (`sku`),
  CONSTRAINT `CSVP_CAT_PRD_ENTT_ATTR_SET_ID_EAV_ATTR_SET_ATTR_SET_ID` FOREIGN KEY (`attribute_set_id`) REFERENCES `csvp_eav_attribute_set` (`attribute_set_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalog_product_entity`
--

LOCK TABLES `csvp_catalog_product_entity` WRITE;
/*!40000 ALTER TABLE `csvp_catalog_product_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_catalog_product_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalog_product_entity_datetime`
--

DROP TABLE IF EXISTS `csvp_catalog_product_entity_datetime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalog_product_entity_datetime` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` datetime DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CSVP_CAT_PRD_ENTT_DTIME_ENTT_ID_ATTR_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CSVP_CATALOG_PRODUCT_ENTITY_DATETIME_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CSVP_CATALOG_PRODUCT_ENTITY_DATETIME_STORE_ID` (`store_id`),
  CONSTRAINT `CSVP_CATALOG_PRODUCT_ENTITY_DATETIME_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_CAT_PRD_ENTT_DTIME_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `csvp_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_CAT_PRD_ENTT_DTIME_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `csvp_catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Datetime Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalog_product_entity_datetime`
--

LOCK TABLES `csvp_catalog_product_entity_datetime` WRITE;
/*!40000 ALTER TABLE `csvp_catalog_product_entity_datetime` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_catalog_product_entity_datetime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalog_product_entity_decimal`
--

DROP TABLE IF EXISTS `csvp_catalog_product_entity_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalog_product_entity_decimal` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` decimal(12,4) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CSVP_CAT_PRD_ENTT_DEC_ENTT_ID_ATTR_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CSVP_CATALOG_PRODUCT_ENTITY_DECIMAL_STORE_ID` (`store_id`),
  KEY `CSVP_CATALOG_PRODUCT_ENTITY_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `CSVP_CATALOG_PRODUCT_ENTITY_DECIMAL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_CAT_PRD_ENTT_DEC_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `csvp_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_CAT_PRD_ENTT_DEC_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `csvp_catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Decimal Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalog_product_entity_decimal`
--

LOCK TABLES `csvp_catalog_product_entity_decimal` WRITE;
/*!40000 ALTER TABLE `csvp_catalog_product_entity_decimal` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_catalog_product_entity_decimal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalog_product_entity_gallery`
--

DROP TABLE IF EXISTS `csvp_catalog_product_entity_gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalog_product_entity_gallery` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `position` int(11) NOT NULL DEFAULT '0' COMMENT 'Position',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CSVP_CAT_PRD_ENTT_GLR_ENTT_ID_ATTR_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CSVP_CATALOG_PRODUCT_ENTITY_GALLERY_ENTITY_ID` (`entity_id`),
  KEY `CSVP_CATALOG_PRODUCT_ENTITY_GALLERY_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CSVP_CATALOG_PRODUCT_ENTITY_GALLERY_STORE_ID` (`store_id`),
  CONSTRAINT `CSVP_CATALOG_PRODUCT_ENTITY_GALLERY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_CAT_PRD_ENTT_GLR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `csvp_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_CAT_PRD_ENTT_GLR_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `csvp_catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Gallery Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalog_product_entity_gallery`
--

LOCK TABLES `csvp_catalog_product_entity_gallery` WRITE;
/*!40000 ALTER TABLE `csvp_catalog_product_entity_gallery` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_catalog_product_entity_gallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalog_product_entity_int`
--

DROP TABLE IF EXISTS `csvp_catalog_product_entity_int`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalog_product_entity_int` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` int(11) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CSVP_CATALOG_PRODUCT_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CSVP_CATALOG_PRODUCT_ENTITY_INT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CSVP_CATALOG_PRODUCT_ENTITY_INT_STORE_ID` (`store_id`),
  CONSTRAINT `CSVP_CATALOG_PRODUCT_ENTITY_INT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_CAT_PRD_ENTT_INT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `csvp_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_CAT_PRD_ENTT_INT_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `csvp_catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Integer Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalog_product_entity_int`
--

LOCK TABLES `csvp_catalog_product_entity_int` WRITE;
/*!40000 ALTER TABLE `csvp_catalog_product_entity_int` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_catalog_product_entity_int` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalog_product_entity_media_gallery`
--

DROP TABLE IF EXISTS `csvp_catalog_product_entity_media_gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalog_product_entity_media_gallery` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  `media_type` varchar(32) NOT NULL DEFAULT 'image' COMMENT 'Media entry type',
  `disabled` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Visibility status',
  PRIMARY KEY (`value_id`),
  KEY `CSVP_CATALOG_PRODUCT_ENTITY_MEDIA_GALLERY_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `CSVP_CAT_PRD_ENTT_MDA_GLR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `csvp_eav_attribute` (`attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Media Gallery Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalog_product_entity_media_gallery`
--

LOCK TABLES `csvp_catalog_product_entity_media_gallery` WRITE;
/*!40000 ALTER TABLE `csvp_catalog_product_entity_media_gallery` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_catalog_product_entity_media_gallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalog_product_entity_media_gallery_value`
--

DROP TABLE IF EXISTS `csvp_catalog_product_entity_media_gallery_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalog_product_entity_media_gallery_value` (
  `value_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Value ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `label` varchar(255) DEFAULT NULL COMMENT 'Label',
  `position` int(10) unsigned DEFAULT NULL COMMENT 'Position',
  `disabled` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Disabled',
  `record_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Record Id',
  PRIMARY KEY (`record_id`),
  KEY `CSVP_CATALOG_PRODUCT_ENTITY_MEDIA_GALLERY_VALUE_STORE_ID` (`store_id`),
  KEY `CSVP_CATALOG_PRODUCT_ENTITY_MEDIA_GALLERY_VALUE_ENTITY_ID` (`entity_id`),
  KEY `CSVP_CATALOG_PRODUCT_ENTITY_MEDIA_GALLERY_VALUE_VALUE_ID` (`value_id`),
  CONSTRAINT `CSVP_CAT_PRD_ENTT_MDA_GLR_VAL_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `csvp_catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_CAT_PRD_ENTT_MDA_GLR_VAL_STORE_ID_CSVP_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_CAT_PRD_ENTT_MDA_GLR_VAL_VAL_ID_CAT_PRD_ENTT_MDA_GLR_VAL_ID` FOREIGN KEY (`value_id`) REFERENCES `csvp_catalog_product_entity_media_gallery` (`value_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Media Gallery Attribute Value Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalog_product_entity_media_gallery_value`
--

LOCK TABLES `csvp_catalog_product_entity_media_gallery_value` WRITE;
/*!40000 ALTER TABLE `csvp_catalog_product_entity_media_gallery_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_catalog_product_entity_media_gallery_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalog_product_entity_media_gallery_value_to_entity`
--

DROP TABLE IF EXISTS `csvp_catalog_product_entity_media_gallery_value_to_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalog_product_entity_media_gallery_value_to_entity` (
  `value_id` int(10) unsigned NOT NULL COMMENT 'Value media Entry ID',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Product entity ID',
  UNIQUE KEY `CSVP_CAT_PRD_ENTT_MDA_GLR_VAL_TO_ENTT_VAL_ID_ENTT_ID` (`value_id`,`entity_id`),
  KEY `FK_A4886815D14A5101F9C3CEA8D82D1BA6` (`entity_id`),
  CONSTRAINT `FK_80D93F331CB00C93BCA82C6EAED0D353` FOREIGN KEY (`value_id`) REFERENCES `csvp_catalog_product_entity_media_gallery` (`value_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_A4886815D14A5101F9C3CEA8D82D1BA6` FOREIGN KEY (`entity_id`) REFERENCES `csvp_catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Link Media value to Product entity table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalog_product_entity_media_gallery_value_to_entity`
--

LOCK TABLES `csvp_catalog_product_entity_media_gallery_value_to_entity` WRITE;
/*!40000 ALTER TABLE `csvp_catalog_product_entity_media_gallery_value_to_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_catalog_product_entity_media_gallery_value_to_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalog_product_entity_media_gallery_value_video`
--

DROP TABLE IF EXISTS `csvp_catalog_product_entity_media_gallery_value_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalog_product_entity_media_gallery_value_video` (
  `value_id` int(10) unsigned NOT NULL COMMENT 'Media Entity ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `provider` varchar(32) DEFAULT NULL COMMENT 'Video provider ID',
  `url` text COMMENT 'Video URL',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  `description` text COMMENT 'Page Meta Description',
  `metadata` text COMMENT 'Video meta data',
  UNIQUE KEY `CSVP_CAT_PRD_ENTT_MDA_GLR_VAL_VIDEO_VAL_ID_STORE_ID` (`value_id`,`store_id`),
  KEY `CSVP_CAT_PRD_ENTT_MDA_GLR_VAL_VIDEO_STORE_ID_CSVP_STORE_STORE_ID` (`store_id`),
  CONSTRAINT `CSVP_CAT_PRD_ENTT_MDA_GLR_VAL_VIDEO_STORE_ID_CSVP_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_9DDAB7F134A539408F755A9A1761A81D` FOREIGN KEY (`value_id`) REFERENCES `csvp_catalog_product_entity_media_gallery` (`value_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Video Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalog_product_entity_media_gallery_value_video`
--

LOCK TABLES `csvp_catalog_product_entity_media_gallery_value_video` WRITE;
/*!40000 ALTER TABLE `csvp_catalog_product_entity_media_gallery_value_video` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_catalog_product_entity_media_gallery_value_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalog_product_entity_text`
--

DROP TABLE IF EXISTS `csvp_catalog_product_entity_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalog_product_entity_text` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` text COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CSVP_CATALOG_PRODUCT_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CSVP_CATALOG_PRODUCT_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CSVP_CATALOG_PRODUCT_ENTITY_TEXT_STORE_ID` (`store_id`),
  CONSTRAINT `CSVP_CATALOG_PRODUCT_ENTITY_TEXT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_CAT_PRD_ENTT_TEXT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `csvp_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_CAT_PRD_ENTT_TEXT_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `csvp_catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Text Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalog_product_entity_text`
--

LOCK TABLES `csvp_catalog_product_entity_text` WRITE;
/*!40000 ALTER TABLE `csvp_catalog_product_entity_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_catalog_product_entity_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalog_product_entity_tier_price`
--

DROP TABLE IF EXISTS `csvp_catalog_product_entity_tier_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalog_product_entity_tier_price` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `all_groups` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Applicable To All Customer Groups',
  `customer_group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `qty` decimal(12,4) NOT NULL DEFAULT '1.0000' COMMENT 'QTY',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Value',
  `percentage_value` decimal(5,2) DEFAULT NULL COMMENT 'Percentage value',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_C5DE0335B9BFCC85325752ADF2FF70B8` (`entity_id`,`all_groups`,`customer_group_id`,`qty`,`website_id`),
  KEY `CSVP_CATALOG_PRODUCT_ENTITY_TIER_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CSVP_CATALOG_PRODUCT_ENTITY_TIER_PRICE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `CSVP_CAT_PRD_ENTT_TIER_PRICE_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `csvp_catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_CAT_PRD_ENTT_TIER_PRICE_WS_ID_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `csvp_store_website` (`website_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_2E25D5666AB2B6CA5E99D2700630100F` FOREIGN KEY (`customer_group_id`) REFERENCES `csvp_customer_group` (`customer_group_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Tier Price Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalog_product_entity_tier_price`
--

LOCK TABLES `csvp_catalog_product_entity_tier_price` WRITE;
/*!40000 ALTER TABLE `csvp_catalog_product_entity_tier_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_catalog_product_entity_tier_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalog_product_entity_varchar`
--

DROP TABLE IF EXISTS `csvp_catalog_product_entity_varchar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalog_product_entity_varchar` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CSVP_CAT_PRD_ENTT_VCHR_ENTT_ID_ATTR_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CSVP_CATALOG_PRODUCT_ENTITY_VARCHAR_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CSVP_CATALOG_PRODUCT_ENTITY_VARCHAR_STORE_ID` (`store_id`),
  CONSTRAINT `CSVP_CATALOG_PRODUCT_ENTITY_VARCHAR_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_CAT_PRD_ENTT_VCHR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `csvp_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_CAT_PRD_ENTT_VCHR_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `csvp_catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Varchar Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalog_product_entity_varchar`
--

LOCK TABLES `csvp_catalog_product_entity_varchar` WRITE;
/*!40000 ALTER TABLE `csvp_catalog_product_entity_varchar` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_catalog_product_entity_varchar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalog_product_frontend_action`
--

DROP TABLE IF EXISTS `csvp_catalog_product_frontend_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalog_product_frontend_action` (
  `action_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Product Action Id',
  `type_id` varchar(64) NOT NULL COMMENT 'Type of product action',
  `visitor_id` int(10) unsigned DEFAULT NULL COMMENT 'Visitor Id',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `added_at` bigint(20) NOT NULL COMMENT 'Added At',
  PRIMARY KEY (`action_id`),
  UNIQUE KEY `CSVP_CAT_PRD_FRONTEND_ACTION_VISITOR_ID_PRD_ID_TYPE_ID` (`visitor_id`,`product_id`,`type_id`),
  UNIQUE KEY `CSVP_CAT_PRD_FRONTEND_ACTION_CSTR_ID_PRD_ID_TYPE_ID` (`customer_id`,`product_id`,`type_id`),
  CONSTRAINT `CSVP_CAT_PRD_FRONTEND_ACTION_CSTR_ID_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `csvp_customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Frontend Action Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalog_product_frontend_action`
--

LOCK TABLES `csvp_catalog_product_frontend_action` WRITE;
/*!40000 ALTER TABLE `csvp_catalog_product_frontend_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_catalog_product_frontend_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalog_product_index_eav`
--

DROP TABLE IF EXISTS `csvp_catalog_product_index_eav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalog_product_index_eav` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `value` int(10) unsigned NOT NULL COMMENT 'Value',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Original entity Id for attribute value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  KEY `CSVP_CATALOG_PRODUCT_INDEX_EAV_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CSVP_CATALOG_PRODUCT_INDEX_EAV_STORE_ID` (`store_id`),
  KEY `CSVP_CATALOG_PRODUCT_INDEX_EAV_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalog_product_index_eav`
--

LOCK TABLES `csvp_catalog_product_index_eav` WRITE;
/*!40000 ALTER TABLE `csvp_catalog_product_index_eav` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_catalog_product_index_eav` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalog_product_index_eav_decimal`
--

DROP TABLE IF EXISTS `csvp_catalog_product_index_eav_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalog_product_index_eav_decimal` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `value` decimal(12,4) NOT NULL COMMENT 'Value',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Original entity Id for attribute value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  KEY `CSVP_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CSVP_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_STORE_ID` (`store_id`),
  KEY `CSVP_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Decimal Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalog_product_index_eav_decimal`
--

LOCK TABLES `csvp_catalog_product_index_eav_decimal` WRITE;
/*!40000 ALTER TABLE `csvp_catalog_product_index_eav_decimal` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_catalog_product_index_eav_decimal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalog_product_index_eav_decimal_idx`
--

DROP TABLE IF EXISTS `csvp_catalog_product_index_eav_decimal_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalog_product_index_eav_decimal_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `value` decimal(12,4) NOT NULL COMMENT 'Value',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Original entity Id for attribute value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  KEY `CSVP_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_IDX_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CSVP_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_IDX_STORE_ID` (`store_id`),
  KEY `CSVP_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_IDX_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Decimal Indexer Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalog_product_index_eav_decimal_idx`
--

LOCK TABLES `csvp_catalog_product_index_eav_decimal_idx` WRITE;
/*!40000 ALTER TABLE `csvp_catalog_product_index_eav_decimal_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_catalog_product_index_eav_decimal_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalog_product_index_eav_decimal_replica`
--

DROP TABLE IF EXISTS `csvp_catalog_product_index_eav_decimal_replica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalog_product_index_eav_decimal_replica` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `value` decimal(12,4) NOT NULL COMMENT 'Value',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Original entity Id for attribute value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  KEY `CSVP_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CSVP_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_STORE_ID` (`store_id`),
  KEY `CSVP_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Decimal Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalog_product_index_eav_decimal_replica`
--

LOCK TABLES `csvp_catalog_product_index_eav_decimal_replica` WRITE;
/*!40000 ALTER TABLE `csvp_catalog_product_index_eav_decimal_replica` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_catalog_product_index_eav_decimal_replica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalog_product_index_eav_decimal_tmp`
--

DROP TABLE IF EXISTS `csvp_catalog_product_index_eav_decimal_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalog_product_index_eav_decimal_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `value` decimal(12,4) NOT NULL COMMENT 'Value',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Original entity Id for attribute value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  KEY `CSVP_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_TMP_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CSVP_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_TMP_STORE_ID` (`store_id`),
  KEY `CSVP_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_TMP_VALUE` (`value`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Decimal Indexer Temp Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalog_product_index_eav_decimal_tmp`
--

LOCK TABLES `csvp_catalog_product_index_eav_decimal_tmp` WRITE;
/*!40000 ALTER TABLE `csvp_catalog_product_index_eav_decimal_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_catalog_product_index_eav_decimal_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalog_product_index_eav_idx`
--

DROP TABLE IF EXISTS `csvp_catalog_product_index_eav_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalog_product_index_eav_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `value` int(10) unsigned NOT NULL COMMENT 'Value',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Original entity Id for attribute value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  KEY `CSVP_CATALOG_PRODUCT_INDEX_EAV_IDX_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CSVP_CATALOG_PRODUCT_INDEX_EAV_IDX_STORE_ID` (`store_id`),
  KEY `CSVP_CATALOG_PRODUCT_INDEX_EAV_IDX_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Indexer Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalog_product_index_eav_idx`
--

LOCK TABLES `csvp_catalog_product_index_eav_idx` WRITE;
/*!40000 ALTER TABLE `csvp_catalog_product_index_eav_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_catalog_product_index_eav_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalog_product_index_eav_replica`
--

DROP TABLE IF EXISTS `csvp_catalog_product_index_eav_replica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalog_product_index_eav_replica` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `value` int(10) unsigned NOT NULL COMMENT 'Value',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Original entity Id for attribute value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  KEY `CSVP_CATALOG_PRODUCT_INDEX_EAV_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CSVP_CATALOG_PRODUCT_INDEX_EAV_STORE_ID` (`store_id`),
  KEY `CSVP_CATALOG_PRODUCT_INDEX_EAV_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalog_product_index_eav_replica`
--

LOCK TABLES `csvp_catalog_product_index_eav_replica` WRITE;
/*!40000 ALTER TABLE `csvp_catalog_product_index_eav_replica` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_catalog_product_index_eav_replica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalog_product_index_eav_tmp`
--

DROP TABLE IF EXISTS `csvp_catalog_product_index_eav_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalog_product_index_eav_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `value` int(10) unsigned NOT NULL COMMENT 'Value',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Original entity Id for attribute value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  KEY `CSVP_CATALOG_PRODUCT_INDEX_EAV_TMP_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CSVP_CATALOG_PRODUCT_INDEX_EAV_TMP_STORE_ID` (`store_id`),
  KEY `CSVP_CATALOG_PRODUCT_INDEX_EAV_TMP_VALUE` (`value`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Indexer Temp Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalog_product_index_eav_tmp`
--

LOCK TABLES `csvp_catalog_product_index_eav_tmp` WRITE;
/*!40000 ALTER TABLE `csvp_catalog_product_index_eav_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_catalog_product_index_eav_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalog_product_index_price`
--

DROP TABLE IF EXISTS `csvp_catalog_product_index_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalog_product_index_price` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(10) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Tax Class ID',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `final_price` decimal(12,4) DEFAULT NULL COMMENT 'Final Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  KEY `CSVP_CATALOG_PRODUCT_INDEX_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CSVP_CATALOG_PRODUCT_INDEX_PRICE_MIN_PRICE` (`min_price`),
  KEY `CSVP_CAT_PRD_IDX_PRICE_WS_ID_CSTR_GROUP_ID_MIN_PRICE` (`website_id`,`customer_group_id`,`min_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalog_product_index_price`
--

LOCK TABLES `csvp_catalog_product_index_price` WRITE;
/*!40000 ALTER TABLE `csvp_catalog_product_index_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_catalog_product_index_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalog_product_index_price_bundle_idx`
--

DROP TABLE IF EXISTS `csvp_catalog_product_index_price_bundle_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalog_product_index_price_bundle_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `customer_group_id` int(11) NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `tax_class_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Tax Class Id',
  `price_type` smallint(5) unsigned NOT NULL COMMENT 'Price Type',
  `special_price` decimal(12,4) DEFAULT NULL COMMENT 'Special Price',
  `tier_percent` decimal(12,4) DEFAULT NULL COMMENT 'Tier Percent',
  `orig_price` decimal(12,4) DEFAULT NULL COMMENT 'Orig Price',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `base_tier` decimal(12,4) DEFAULT NULL COMMENT 'Base Tier',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Index Price Bundle Idx';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalog_product_index_price_bundle_idx`
--

LOCK TABLES `csvp_catalog_product_index_price_bundle_idx` WRITE;
/*!40000 ALTER TABLE `csvp_catalog_product_index_price_bundle_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_catalog_product_index_price_bundle_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalog_product_index_price_bundle_opt_idx`
--

DROP TABLE IF EXISTS `csvp_catalog_product_index_price_bundle_opt_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalog_product_index_price_bundle_opt_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `customer_group_id` int(11) NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option Id',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `alt_price` decimal(12,4) DEFAULT NULL COMMENT 'Alt Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `alt_tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Alt Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Index Price Bundle Opt Idx';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalog_product_index_price_bundle_opt_idx`
--

LOCK TABLES `csvp_catalog_product_index_price_bundle_opt_idx` WRITE;
/*!40000 ALTER TABLE `csvp_catalog_product_index_price_bundle_opt_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_catalog_product_index_price_bundle_opt_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalog_product_index_price_bundle_opt_tmp`
--

DROP TABLE IF EXISTS `csvp_catalog_product_index_price_bundle_opt_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalog_product_index_price_bundle_opt_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `customer_group_id` int(11) NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option Id',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `alt_price` decimal(12,4) DEFAULT NULL COMMENT 'Alt Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `alt_tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Alt Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Index Price Bundle Opt Tmp';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalog_product_index_price_bundle_opt_tmp`
--

LOCK TABLES `csvp_catalog_product_index_price_bundle_opt_tmp` WRITE;
/*!40000 ALTER TABLE `csvp_catalog_product_index_price_bundle_opt_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_catalog_product_index_price_bundle_opt_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalog_product_index_price_bundle_sel_idx`
--

DROP TABLE IF EXISTS `csvp_catalog_product_index_price_bundle_sel_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalog_product_index_price_bundle_sel_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `customer_group_id` int(11) NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option Id',
  `selection_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Selection Id',
  `group_type` smallint(5) unsigned DEFAULT '0' COMMENT 'Group Type',
  `is_required` smallint(5) unsigned DEFAULT '0' COMMENT 'Is Required',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`,`selection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Index Price Bundle Sel Idx';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalog_product_index_price_bundle_sel_idx`
--

LOCK TABLES `csvp_catalog_product_index_price_bundle_sel_idx` WRITE;
/*!40000 ALTER TABLE `csvp_catalog_product_index_price_bundle_sel_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_catalog_product_index_price_bundle_sel_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalog_product_index_price_bundle_sel_tmp`
--

DROP TABLE IF EXISTS `csvp_catalog_product_index_price_bundle_sel_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalog_product_index_price_bundle_sel_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `customer_group_id` int(11) NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option Id',
  `selection_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Selection Id',
  `group_type` smallint(5) unsigned DEFAULT '0' COMMENT 'Group Type',
  `is_required` smallint(5) unsigned DEFAULT '0' COMMENT 'Is Required',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`,`selection_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Index Price Bundle Sel Tmp';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalog_product_index_price_bundle_sel_tmp`
--

LOCK TABLES `csvp_catalog_product_index_price_bundle_sel_tmp` WRITE;
/*!40000 ALTER TABLE `csvp_catalog_product_index_price_bundle_sel_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_catalog_product_index_price_bundle_sel_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalog_product_index_price_bundle_tmp`
--

DROP TABLE IF EXISTS `csvp_catalog_product_index_price_bundle_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalog_product_index_price_bundle_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `customer_group_id` int(11) NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `tax_class_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Tax Class Id',
  `price_type` smallint(5) unsigned NOT NULL COMMENT 'Price Type',
  `special_price` decimal(12,4) DEFAULT NULL COMMENT 'Special Price',
  `tier_percent` decimal(12,4) DEFAULT NULL COMMENT 'Tier Percent',
  `orig_price` decimal(12,4) DEFAULT NULL COMMENT 'Orig Price',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `base_tier` decimal(12,4) DEFAULT NULL COMMENT 'Base Tier',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Index Price Bundle Tmp';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalog_product_index_price_bundle_tmp`
--

LOCK TABLES `csvp_catalog_product_index_price_bundle_tmp` WRITE;
/*!40000 ALTER TABLE `csvp_catalog_product_index_price_bundle_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_catalog_product_index_price_bundle_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalog_product_index_price_cfg_opt_agr_idx`
--

DROP TABLE IF EXISTS `csvp_catalog_product_index_price_cfg_opt_agr_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalog_product_index_price_cfg_opt_agr_idx` (
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent ID',
  `child_id` int(10) unsigned NOT NULL COMMENT 'Child ID',
  `customer_group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`parent_id`,`child_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Config Option Aggregate Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalog_product_index_price_cfg_opt_agr_idx`
--

LOCK TABLES `csvp_catalog_product_index_price_cfg_opt_agr_idx` WRITE;
/*!40000 ALTER TABLE `csvp_catalog_product_index_price_cfg_opt_agr_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_catalog_product_index_price_cfg_opt_agr_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalog_product_index_price_cfg_opt_agr_tmp`
--

DROP TABLE IF EXISTS `csvp_catalog_product_index_price_cfg_opt_agr_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalog_product_index_price_cfg_opt_agr_tmp` (
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent ID',
  `child_id` int(10) unsigned NOT NULL COMMENT 'Child ID',
  `customer_group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`parent_id`,`child_id`,`customer_group_id`,`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Config Option Aggregate Temp Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalog_product_index_price_cfg_opt_agr_tmp`
--

LOCK TABLES `csvp_catalog_product_index_price_cfg_opt_agr_tmp` WRITE;
/*!40000 ALTER TABLE `csvp_catalog_product_index_price_cfg_opt_agr_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_catalog_product_index_price_cfg_opt_agr_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalog_product_index_price_cfg_opt_idx`
--

DROP TABLE IF EXISTS `csvp_catalog_product_index_price_cfg_opt_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalog_product_index_price_cfg_opt_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Config Option Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalog_product_index_price_cfg_opt_idx`
--

LOCK TABLES `csvp_catalog_product_index_price_cfg_opt_idx` WRITE;
/*!40000 ALTER TABLE `csvp_catalog_product_index_price_cfg_opt_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_catalog_product_index_price_cfg_opt_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalog_product_index_price_cfg_opt_tmp`
--

DROP TABLE IF EXISTS `csvp_catalog_product_index_price_cfg_opt_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalog_product_index_price_cfg_opt_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Config Option Temp Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalog_product_index_price_cfg_opt_tmp`
--

LOCK TABLES `csvp_catalog_product_index_price_cfg_opt_tmp` WRITE;
/*!40000 ALTER TABLE `csvp_catalog_product_index_price_cfg_opt_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_catalog_product_index_price_cfg_opt_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalog_product_index_price_downlod_idx`
--

DROP TABLE IF EXISTS `csvp_catalog_product_index_price_downlod_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalog_product_index_price_downlod_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(11) NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Minimum price',
  `max_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Maximum price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Indexer Table for price of downloadable products';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalog_product_index_price_downlod_idx`
--

LOCK TABLES `csvp_catalog_product_index_price_downlod_idx` WRITE;
/*!40000 ALTER TABLE `csvp_catalog_product_index_price_downlod_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_catalog_product_index_price_downlod_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalog_product_index_price_downlod_tmp`
--

DROP TABLE IF EXISTS `csvp_catalog_product_index_price_downlod_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalog_product_index_price_downlod_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(11) NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Minimum price',
  `max_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Maximum price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Temporary Indexer Table for price of downloadable products';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalog_product_index_price_downlod_tmp`
--

LOCK TABLES `csvp_catalog_product_index_price_downlod_tmp` WRITE;
/*!40000 ALTER TABLE `csvp_catalog_product_index_price_downlod_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_catalog_product_index_price_downlod_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalog_product_index_price_final_idx`
--

DROP TABLE IF EXISTS `csvp_catalog_product_index_price_final_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalog_product_index_price_final_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Tax Class ID',
  `orig_price` decimal(12,4) DEFAULT NULL COMMENT 'Original Price',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `base_tier` decimal(12,4) DEFAULT NULL COMMENT 'Base Tier',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Final Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalog_product_index_price_final_idx`
--

LOCK TABLES `csvp_catalog_product_index_price_final_idx` WRITE;
/*!40000 ALTER TABLE `csvp_catalog_product_index_price_final_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_catalog_product_index_price_final_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalog_product_index_price_final_tmp`
--

DROP TABLE IF EXISTS `csvp_catalog_product_index_price_final_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalog_product_index_price_final_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Tax Class ID',
  `orig_price` decimal(12,4) DEFAULT NULL COMMENT 'Original Price',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `base_tier` decimal(12,4) DEFAULT NULL COMMENT 'Base Tier',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Final Temp Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalog_product_index_price_final_tmp`
--

LOCK TABLES `csvp_catalog_product_index_price_final_tmp` WRITE;
/*!40000 ALTER TABLE `csvp_catalog_product_index_price_final_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_catalog_product_index_price_final_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalog_product_index_price_idx`
--

DROP TABLE IF EXISTS `csvp_catalog_product_index_price_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalog_product_index_price_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Tax Class ID',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `final_price` decimal(12,4) DEFAULT NULL COMMENT 'Final Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  KEY `CSVP_CATALOG_PRODUCT_INDEX_PRICE_IDX_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CSVP_CATALOG_PRODUCT_INDEX_PRICE_IDX_WEBSITE_ID` (`website_id`),
  KEY `CSVP_CATALOG_PRODUCT_INDEX_PRICE_IDX_MIN_PRICE` (`min_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalog_product_index_price_idx`
--

LOCK TABLES `csvp_catalog_product_index_price_idx` WRITE;
/*!40000 ALTER TABLE `csvp_catalog_product_index_price_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_catalog_product_index_price_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalog_product_index_price_opt_agr_idx`
--

DROP TABLE IF EXISTS `csvp_catalog_product_index_price_opt_agr_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalog_product_index_price_opt_agr_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Option Aggregate Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalog_product_index_price_opt_agr_idx`
--

LOCK TABLES `csvp_catalog_product_index_price_opt_agr_idx` WRITE;
/*!40000 ALTER TABLE `csvp_catalog_product_index_price_opt_agr_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_catalog_product_index_price_opt_agr_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalog_product_index_price_opt_agr_tmp`
--

DROP TABLE IF EXISTS `csvp_catalog_product_index_price_opt_agr_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalog_product_index_price_opt_agr_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Option Aggregate Temp Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalog_product_index_price_opt_agr_tmp`
--

LOCK TABLES `csvp_catalog_product_index_price_opt_agr_tmp` WRITE;
/*!40000 ALTER TABLE `csvp_catalog_product_index_price_opt_agr_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_catalog_product_index_price_opt_agr_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalog_product_index_price_opt_idx`
--

DROP TABLE IF EXISTS `csvp_catalog_product_index_price_opt_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalog_product_index_price_opt_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Option Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalog_product_index_price_opt_idx`
--

LOCK TABLES `csvp_catalog_product_index_price_opt_idx` WRITE;
/*!40000 ALTER TABLE `csvp_catalog_product_index_price_opt_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_catalog_product_index_price_opt_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalog_product_index_price_opt_tmp`
--

DROP TABLE IF EXISTS `csvp_catalog_product_index_price_opt_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalog_product_index_price_opt_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Option Temp Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalog_product_index_price_opt_tmp`
--

LOCK TABLES `csvp_catalog_product_index_price_opt_tmp` WRITE;
/*!40000 ALTER TABLE `csvp_catalog_product_index_price_opt_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_catalog_product_index_price_opt_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalog_product_index_price_replica`
--

DROP TABLE IF EXISTS `csvp_catalog_product_index_price_replica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalog_product_index_price_replica` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(10) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Tax Class ID',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `final_price` decimal(12,4) DEFAULT NULL COMMENT 'Final Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  KEY `CSVP_CATALOG_PRODUCT_INDEX_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CSVP_CATALOG_PRODUCT_INDEX_PRICE_MIN_PRICE` (`min_price`),
  KEY `CSVP_CAT_PRD_IDX_PRICE_WS_ID_CSTR_GROUP_ID_MIN_PRICE` (`website_id`,`customer_group_id`,`min_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalog_product_index_price_replica`
--

LOCK TABLES `csvp_catalog_product_index_price_replica` WRITE;
/*!40000 ALTER TABLE `csvp_catalog_product_index_price_replica` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_catalog_product_index_price_replica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalog_product_index_price_tmp`
--

DROP TABLE IF EXISTS `csvp_catalog_product_index_price_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalog_product_index_price_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Tax Class ID',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `final_price` decimal(12,4) DEFAULT NULL COMMENT 'Final Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  KEY `CSVP_CATALOG_PRODUCT_INDEX_PRICE_TMP_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CSVP_CATALOG_PRODUCT_INDEX_PRICE_TMP_WEBSITE_ID` (`website_id`),
  KEY `CSVP_CATALOG_PRODUCT_INDEX_PRICE_TMP_MIN_PRICE` (`min_price`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Temp Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalog_product_index_price_tmp`
--

LOCK TABLES `csvp_catalog_product_index_price_tmp` WRITE;
/*!40000 ALTER TABLE `csvp_catalog_product_index_price_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_catalog_product_index_price_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalog_product_index_tier_price`
--

DROP TABLE IF EXISTS `csvp_catalog_product_index_tier_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalog_product_index_tier_price` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(10) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  KEY `CSVP_CATALOG_PRODUCT_INDEX_TIER_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CSVP_CATALOG_PRODUCT_INDEX_TIER_PRICE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `CSVP_CAT_PRD_IDX_TIER_PRICE_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `csvp_catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_CAT_PRD_IDX_TIER_PRICE_WS_ID_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `csvp_store_website` (`website_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_E1550A96F9B0C8CB115FE401AF6119A9` FOREIGN KEY (`customer_group_id`) REFERENCES `csvp_customer_group` (`customer_group_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Tier Price Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalog_product_index_tier_price`
--

LOCK TABLES `csvp_catalog_product_index_tier_price` WRITE;
/*!40000 ALTER TABLE `csvp_catalog_product_index_tier_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_catalog_product_index_tier_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalog_product_index_website`
--

DROP TABLE IF EXISTS `csvp_catalog_product_index_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalog_product_index_website` (
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `website_date` date DEFAULT NULL COMMENT 'Website Date',
  `rate` float DEFAULT '1' COMMENT 'Rate',
  PRIMARY KEY (`website_id`),
  KEY `CSVP_CATALOG_PRODUCT_INDEX_WEBSITE_WEBSITE_DATE` (`website_date`),
  CONSTRAINT `CSVP_CAT_PRD_IDX_WS_WS_ID_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `csvp_store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Website Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalog_product_index_website`
--

LOCK TABLES `csvp_catalog_product_index_website` WRITE;
/*!40000 ALTER TABLE `csvp_catalog_product_index_website` DISABLE KEYS */;
INSERT INTO `csvp_catalog_product_index_website` VALUES (1,'2017-10-18',1);
/*!40000 ALTER TABLE `csvp_catalog_product_index_website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalog_product_link`
--

DROP TABLE IF EXISTS `csvp_catalog_product_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalog_product_link` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Link ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `linked_product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Linked Product ID',
  `link_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Link Type ID',
  PRIMARY KEY (`link_id`),
  UNIQUE KEY `CSVP_CAT_PRD_LNK_LNK_TYPE_ID_PRD_ID_LNKED_PRD_ID` (`link_type_id`,`product_id`,`linked_product_id`),
  KEY `CSVP_CATALOG_PRODUCT_LINK_PRODUCT_ID` (`product_id`),
  KEY `CSVP_CATALOG_PRODUCT_LINK_LINKED_PRODUCT_ID` (`linked_product_id`),
  CONSTRAINT `CSVP_CAT_PRD_LNK_LNKED_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`linked_product_id`) REFERENCES `csvp_catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_CAT_PRD_LNK_LNK_TYPE_ID_CAT_PRD_LNK_TYPE_LNK_TYPE_ID` FOREIGN KEY (`link_type_id`) REFERENCES `csvp_catalog_product_link_type` (`link_type_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_CAT_PRD_LNK_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `csvp_catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product To Product Linkage Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalog_product_link`
--

LOCK TABLES `csvp_catalog_product_link` WRITE;
/*!40000 ALTER TABLE `csvp_catalog_product_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_catalog_product_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalog_product_link_attribute`
--

DROP TABLE IF EXISTS `csvp_catalog_product_link_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalog_product_link_attribute` (
  `product_link_attribute_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Product Link Attribute ID',
  `link_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Link Type ID',
  `product_link_attribute_code` varchar(32) DEFAULT NULL COMMENT 'Product Link Attribute Code',
  `data_type` varchar(32) DEFAULT NULL COMMENT 'Data Type',
  PRIMARY KEY (`product_link_attribute_id`),
  KEY `CSVP_CATALOG_PRODUCT_LINK_ATTRIBUTE_LINK_TYPE_ID` (`link_type_id`),
  CONSTRAINT `CSVP_CAT_PRD_LNK_ATTR_LNK_TYPE_ID_CAT_PRD_LNK_TYPE_LNK_TYPE_ID` FOREIGN KEY (`link_type_id`) REFERENCES `csvp_catalog_product_link_type` (`link_type_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='Catalog Product Link Attribute Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalog_product_link_attribute`
--

LOCK TABLES `csvp_catalog_product_link_attribute` WRITE;
/*!40000 ALTER TABLE `csvp_catalog_product_link_attribute` DISABLE KEYS */;
INSERT INTO `csvp_catalog_product_link_attribute` VALUES (1,1,'position','int'),(2,4,'position','int'),(3,5,'position','int'),(4,3,'position','int'),(5,3,'qty','decimal');
/*!40000 ALTER TABLE `csvp_catalog_product_link_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalog_product_link_attribute_decimal`
--

DROP TABLE IF EXISTS `csvp_catalog_product_link_attribute_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalog_product_link_attribute_decimal` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `product_link_attribute_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Product Link Attribute ID',
  `link_id` int(10) unsigned NOT NULL COMMENT 'Link ID',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CSVP_CAT_PRD_LNK_ATTR_DEC_PRD_LNK_ATTR_ID_LNK_ID` (`product_link_attribute_id`,`link_id`),
  KEY `CSVP_CATALOG_PRODUCT_LINK_ATTRIBUTE_DECIMAL_LINK_ID` (`link_id`),
  CONSTRAINT `CSVP_CAT_PRD_LNK_ATTR_DEC_LNK_ID_CAT_PRD_LNK_LNK_ID` FOREIGN KEY (`link_id`) REFERENCES `csvp_catalog_product_link` (`link_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_AD37C6950E44045E4ECE939947BD2CA6` FOREIGN KEY (`product_link_attribute_id`) REFERENCES `csvp_catalog_product_link_attribute` (`product_link_attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Link Decimal Attribute Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalog_product_link_attribute_decimal`
--

LOCK TABLES `csvp_catalog_product_link_attribute_decimal` WRITE;
/*!40000 ALTER TABLE `csvp_catalog_product_link_attribute_decimal` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_catalog_product_link_attribute_decimal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalog_product_link_attribute_int`
--

DROP TABLE IF EXISTS `csvp_catalog_product_link_attribute_int`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalog_product_link_attribute_int` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `product_link_attribute_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Product Link Attribute ID',
  `link_id` int(10) unsigned NOT NULL COMMENT 'Link ID',
  `value` int(11) NOT NULL DEFAULT '0' COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CSVP_CAT_PRD_LNK_ATTR_INT_PRD_LNK_ATTR_ID_LNK_ID` (`product_link_attribute_id`,`link_id`),
  KEY `CSVP_CATALOG_PRODUCT_LINK_ATTRIBUTE_INT_LINK_ID` (`link_id`),
  CONSTRAINT `CSVP_CAT_PRD_LNK_ATTR_INT_LNK_ID_CAT_PRD_LNK_LNK_ID` FOREIGN KEY (`link_id`) REFERENCES `csvp_catalog_product_link` (`link_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_829E4FBB0E6CA1E57608BB4F003440A5` FOREIGN KEY (`product_link_attribute_id`) REFERENCES `csvp_catalog_product_link_attribute` (`product_link_attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Link Integer Attribute Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalog_product_link_attribute_int`
--

LOCK TABLES `csvp_catalog_product_link_attribute_int` WRITE;
/*!40000 ALTER TABLE `csvp_catalog_product_link_attribute_int` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_catalog_product_link_attribute_int` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalog_product_link_attribute_varchar`
--

DROP TABLE IF EXISTS `csvp_catalog_product_link_attribute_varchar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalog_product_link_attribute_varchar` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `product_link_attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Product Link Attribute ID',
  `link_id` int(10) unsigned NOT NULL COMMENT 'Link ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CSVP_CAT_PRD_LNK_ATTR_VCHR_PRD_LNK_ATTR_ID_LNK_ID` (`product_link_attribute_id`,`link_id`),
  KEY `CSVP_CATALOG_PRODUCT_LINK_ATTRIBUTE_VARCHAR_LINK_ID` (`link_id`),
  CONSTRAINT `CSVP_CAT_PRD_LNK_ATTR_VCHR_LNK_ID_CAT_PRD_LNK_LNK_ID` FOREIGN KEY (`link_id`) REFERENCES `csvp_catalog_product_link` (`link_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_E1D939947E6AC0A1B76604668CAF210B` FOREIGN KEY (`product_link_attribute_id`) REFERENCES `csvp_catalog_product_link_attribute` (`product_link_attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Link Varchar Attribute Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalog_product_link_attribute_varchar`
--

LOCK TABLES `csvp_catalog_product_link_attribute_varchar` WRITE;
/*!40000 ALTER TABLE `csvp_catalog_product_link_attribute_varchar` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_catalog_product_link_attribute_varchar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalog_product_link_type`
--

DROP TABLE IF EXISTS `csvp_catalog_product_link_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalog_product_link_type` (
  `link_type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Link Type ID',
  `code` varchar(32) DEFAULT NULL COMMENT 'Code',
  PRIMARY KEY (`link_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='Catalog Product Link Type Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalog_product_link_type`
--

LOCK TABLES `csvp_catalog_product_link_type` WRITE;
/*!40000 ALTER TABLE `csvp_catalog_product_link_type` DISABLE KEYS */;
INSERT INTO `csvp_catalog_product_link_type` VALUES (1,'relation'),(3,'super'),(4,'up_sell'),(5,'cross_sell');
/*!40000 ALTER TABLE `csvp_catalog_product_link_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalog_product_option`
--

DROP TABLE IF EXISTS `csvp_catalog_product_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalog_product_option` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `type` varchar(50) DEFAULT NULL COMMENT 'Type',
  `is_require` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Is Required',
  `sku` varchar(64) DEFAULT NULL COMMENT 'SKU',
  `max_characters` int(10) unsigned DEFAULT NULL COMMENT 'Max Characters',
  `file_extension` varchar(50) DEFAULT NULL COMMENT 'File Extension',
  `image_size_x` smallint(5) unsigned DEFAULT NULL COMMENT 'Image Size X',
  `image_size_y` smallint(5) unsigned DEFAULT NULL COMMENT 'Image Size Y',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`option_id`),
  KEY `CSVP_CATALOG_PRODUCT_OPTION_PRODUCT_ID` (`product_id`),
  CONSTRAINT `CSVP_CAT_PRD_OPT_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `csvp_catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Option Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalog_product_option`
--

LOCK TABLES `csvp_catalog_product_option` WRITE;
/*!40000 ALTER TABLE `csvp_catalog_product_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_catalog_product_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalog_product_option_price`
--

DROP TABLE IF EXISTS `csvp_catalog_product_option_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalog_product_option_price` (
  `option_price_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Price ID',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  `price_type` varchar(7) NOT NULL DEFAULT 'fixed' COMMENT 'Price Type',
  PRIMARY KEY (`option_price_id`),
  UNIQUE KEY `CSVP_CATALOG_PRODUCT_OPTION_PRICE_OPTION_ID_STORE_ID` (`option_id`,`store_id`),
  KEY `CSVP_CATALOG_PRODUCT_OPTION_PRICE_STORE_ID` (`store_id`),
  CONSTRAINT `CSVP_CATALOG_PRODUCT_OPTION_PRICE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_CAT_PRD_OPT_PRICE_OPT_ID_CAT_PRD_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `csvp_catalog_product_option` (`option_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Option Price Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalog_product_option_price`
--

LOCK TABLES `csvp_catalog_product_option_price` WRITE;
/*!40000 ALTER TABLE `csvp_catalog_product_option_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_catalog_product_option_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalog_product_option_title`
--

DROP TABLE IF EXISTS `csvp_catalog_product_option_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalog_product_option_title` (
  `option_title_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Title ID',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  PRIMARY KEY (`option_title_id`),
  UNIQUE KEY `CSVP_CATALOG_PRODUCT_OPTION_TITLE_OPTION_ID_STORE_ID` (`option_id`,`store_id`),
  KEY `CSVP_CATALOG_PRODUCT_OPTION_TITLE_STORE_ID` (`store_id`),
  CONSTRAINT `CSVP_CATALOG_PRODUCT_OPTION_TITLE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_CAT_PRD_OPT_TTL_OPT_ID_CAT_PRD_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `csvp_catalog_product_option` (`option_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Option Title Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalog_product_option_title`
--

LOCK TABLES `csvp_catalog_product_option_title` WRITE;
/*!40000 ALTER TABLE `csvp_catalog_product_option_title` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_catalog_product_option_title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalog_product_option_type_price`
--

DROP TABLE IF EXISTS `csvp_catalog_product_option_type_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalog_product_option_type_price` (
  `option_type_price_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Type Price ID',
  `option_type_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option Type ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  `price_type` varchar(7) NOT NULL DEFAULT 'fixed' COMMENT 'Price Type',
  PRIMARY KEY (`option_type_price_id`),
  UNIQUE KEY `CSVP_CATALOG_PRODUCT_OPTION_TYPE_PRICE_OPTION_TYPE_ID_STORE_ID` (`option_type_id`,`store_id`),
  KEY `CSVP_CATALOG_PRODUCT_OPTION_TYPE_PRICE_STORE_ID` (`store_id`),
  CONSTRAINT `CSVP_CATALOG_PRODUCT_OPTION_TYPE_PRICE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_996297877E3B28E808E8A6F89502DBFD` FOREIGN KEY (`option_type_id`) REFERENCES `csvp_catalog_product_option_type_value` (`option_type_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Option Type Price Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalog_product_option_type_price`
--

LOCK TABLES `csvp_catalog_product_option_type_price` WRITE;
/*!40000 ALTER TABLE `csvp_catalog_product_option_type_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_catalog_product_option_type_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalog_product_option_type_title`
--

DROP TABLE IF EXISTS `csvp_catalog_product_option_type_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalog_product_option_type_title` (
  `option_type_title_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Type Title ID',
  `option_type_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option Type ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  PRIMARY KEY (`option_type_title_id`),
  UNIQUE KEY `CSVP_CATALOG_PRODUCT_OPTION_TYPE_TITLE_OPTION_TYPE_ID_STORE_ID` (`option_type_id`,`store_id`),
  KEY `CSVP_CATALOG_PRODUCT_OPTION_TYPE_TITLE_STORE_ID` (`store_id`),
  CONSTRAINT `CSVP_CATALOG_PRODUCT_OPTION_TYPE_TITLE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_F4ADA131D6A709B25F62414A1359B60B` FOREIGN KEY (`option_type_id`) REFERENCES `csvp_catalog_product_option_type_value` (`option_type_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Option Type Title Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalog_product_option_type_title`
--

LOCK TABLES `csvp_catalog_product_option_type_title` WRITE;
/*!40000 ALTER TABLE `csvp_catalog_product_option_type_title` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_catalog_product_option_type_title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalog_product_option_type_value`
--

DROP TABLE IF EXISTS `csvp_catalog_product_option_type_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalog_product_option_type_value` (
  `option_type_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Type ID',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `sku` varchar(64) DEFAULT NULL COMMENT 'SKU',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`option_type_id`),
  KEY `CSVP_CATALOG_PRODUCT_OPTION_TYPE_VALUE_OPTION_ID` (`option_id`),
  CONSTRAINT `CSVP_CAT_PRD_OPT_TYPE_VAL_OPT_ID_CAT_PRD_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `csvp_catalog_product_option` (`option_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Option Type Value Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalog_product_option_type_value`
--

LOCK TABLES `csvp_catalog_product_option_type_value` WRITE;
/*!40000 ALTER TABLE `csvp_catalog_product_option_type_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_catalog_product_option_type_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalog_product_relation`
--

DROP TABLE IF EXISTS `csvp_catalog_product_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalog_product_relation` (
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent ID',
  `child_id` int(10) unsigned NOT NULL COMMENT 'Child ID',
  PRIMARY KEY (`parent_id`,`child_id`),
  KEY `CSVP_CATALOG_PRODUCT_RELATION_CHILD_ID` (`child_id`),
  CONSTRAINT `CSVP_CAT_PRD_RELATION_CHILD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`child_id`) REFERENCES `csvp_catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_CAT_PRD_RELATION_PARENT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`parent_id`) REFERENCES `csvp_catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Relation Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalog_product_relation`
--

LOCK TABLES `csvp_catalog_product_relation` WRITE;
/*!40000 ALTER TABLE `csvp_catalog_product_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_catalog_product_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalog_product_super_attribute`
--

DROP TABLE IF EXISTS `csvp_catalog_product_super_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalog_product_super_attribute` (
  `product_super_attribute_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Product Super Attribute ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `position` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Position',
  PRIMARY KEY (`product_super_attribute_id`),
  UNIQUE KEY `CSVP_CATALOG_PRODUCT_SUPER_ATTRIBUTE_PRODUCT_ID_ATTRIBUTE_ID` (`product_id`,`attribute_id`),
  CONSTRAINT `CSVP_CAT_PRD_SPR_ATTR_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `csvp_catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Super Attribute Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalog_product_super_attribute`
--

LOCK TABLES `csvp_catalog_product_super_attribute` WRITE;
/*!40000 ALTER TABLE `csvp_catalog_product_super_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_catalog_product_super_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalog_product_super_attribute_label`
--

DROP TABLE IF EXISTS `csvp_catalog_product_super_attribute_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalog_product_super_attribute_label` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `product_super_attribute_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product Super Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `use_default` smallint(5) unsigned DEFAULT '0' COMMENT 'Use Default Value',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CSVP_CAT_PRD_SPR_ATTR_LBL_PRD_SPR_ATTR_ID_STORE_ID` (`product_super_attribute_id`,`store_id`),
  KEY `CSVP_CATALOG_PRODUCT_SUPER_ATTRIBUTE_LABEL_STORE_ID` (`store_id`),
  CONSTRAINT `CSVP_CAT_PRD_SPR_ATTR_LBL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_5905DE46760112EF632A8E2808831CE6` FOREIGN KEY (`product_super_attribute_id`) REFERENCES `csvp_catalog_product_super_attribute` (`product_super_attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Super Attribute Label Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalog_product_super_attribute_label`
--

LOCK TABLES `csvp_catalog_product_super_attribute_label` WRITE;
/*!40000 ALTER TABLE `csvp_catalog_product_super_attribute_label` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_catalog_product_super_attribute_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalog_product_super_link`
--

DROP TABLE IF EXISTS `csvp_catalog_product_super_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalog_product_super_link` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Link ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Parent ID',
  PRIMARY KEY (`link_id`),
  UNIQUE KEY `CSVP_CATALOG_PRODUCT_SUPER_LINK_PRODUCT_ID_PARENT_ID` (`product_id`,`parent_id`),
  KEY `CSVP_CATALOG_PRODUCT_SUPER_LINK_PARENT_ID` (`parent_id`),
  CONSTRAINT `CSVP_CAT_PRD_SPR_LNK_PARENT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`parent_id`) REFERENCES `csvp_catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_CAT_PRD_SPR_LNK_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `csvp_catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Super Link Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalog_product_super_link`
--

LOCK TABLES `csvp_catalog_product_super_link` WRITE;
/*!40000 ALTER TABLE `csvp_catalog_product_super_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_catalog_product_super_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalog_product_website`
--

DROP TABLE IF EXISTS `csvp_catalog_product_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalog_product_website` (
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  PRIMARY KEY (`product_id`,`website_id`),
  KEY `CSVP_CATALOG_PRODUCT_WEBSITE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `CSVP_CATALOG_PRODUCT_WEBSITE_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `csvp_store_website` (`website_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_CAT_PRD_WS_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `csvp_catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product To Website Linkage Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalog_product_website`
--

LOCK TABLES `csvp_catalog_product_website` WRITE;
/*!40000 ALTER TABLE `csvp_catalog_product_website` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_catalog_product_website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalog_url_rewrite_product_category`
--

DROP TABLE IF EXISTS `csvp_catalog_url_rewrite_product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalog_url_rewrite_product_category` (
  `url_rewrite_id` int(10) unsigned NOT NULL COMMENT 'url_rewrite_id',
  `category_id` int(10) unsigned NOT NULL COMMENT 'category_id',
  `product_id` int(10) unsigned NOT NULL COMMENT 'product_id',
  KEY `CSVP_CATALOG_URL_REWRITE_PRODUCT_CATEGORY_CATEGORY_ID_PRODUCT_ID` (`category_id`,`product_id`),
  KEY `CSVP_CAT_URL_REWRITE_PRD_CTGR_PRD_ID_CAT_PRD_ENTT_ENTT_ID` (`product_id`),
  KEY `FK_D535B037DD0BC1B617716332E98F28A4` (`url_rewrite_id`),
  CONSTRAINT `CSVP_CAT_URL_REWRITE_PRD_CTGR_CTGR_ID_CSVP_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`category_id`) REFERENCES `csvp_catalog_category_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_CAT_URL_REWRITE_PRD_CTGR_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `csvp_catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_D535B037DD0BC1B617716332E98F28A4` FOREIGN KEY (`url_rewrite_id`) REFERENCES `csvp_url_rewrite` (`url_rewrite_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='url_rewrite_relation';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalog_url_rewrite_product_category`
--

LOCK TABLES `csvp_catalog_url_rewrite_product_category` WRITE;
/*!40000 ALTER TABLE `csvp_catalog_url_rewrite_product_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_catalog_url_rewrite_product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_cataloginventory_stock`
--

DROP TABLE IF EXISTS `csvp_cataloginventory_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_cataloginventory_stock` (
  `stock_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Stock Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `stock_name` varchar(255) DEFAULT NULL COMMENT 'Stock Name',
  PRIMARY KEY (`stock_id`),
  KEY `CSVP_CATALOGINVENTORY_STOCK_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Cataloginventory Stock';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_cataloginventory_stock`
--

LOCK TABLES `csvp_cataloginventory_stock` WRITE;
/*!40000 ALTER TABLE `csvp_cataloginventory_stock` DISABLE KEYS */;
INSERT INTO `csvp_cataloginventory_stock` VALUES (1,0,'Default');
/*!40000 ALTER TABLE `csvp_cataloginventory_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_cataloginventory_stock_item`
--

DROP TABLE IF EXISTS `csvp_cataloginventory_stock_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_cataloginventory_stock_item` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Item Id',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product Id',
  `stock_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Stock Id',
  `qty` decimal(12,4) DEFAULT NULL COMMENT 'Qty',
  `min_qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Min Qty',
  `use_config_min_qty` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Min Qty',
  `is_qty_decimal` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Qty Decimal',
  `backorders` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Backorders',
  `use_config_backorders` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Backorders',
  `min_sale_qty` decimal(12,4) NOT NULL DEFAULT '1.0000' COMMENT 'Min Sale Qty',
  `use_config_min_sale_qty` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Min Sale Qty',
  `max_sale_qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Max Sale Qty',
  `use_config_max_sale_qty` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Max Sale Qty',
  `is_in_stock` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is In Stock',
  `low_stock_date` timestamp NULL DEFAULT NULL COMMENT 'Low Stock Date',
  `notify_stock_qty` decimal(12,4) DEFAULT NULL COMMENT 'Notify Stock Qty',
  `use_config_notify_stock_qty` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Notify Stock Qty',
  `manage_stock` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Manage Stock',
  `use_config_manage_stock` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Manage Stock',
  `stock_status_changed_auto` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Stock Status Changed Automatically',
  `use_config_qty_increments` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Qty Increments',
  `qty_increments` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty Increments',
  `use_config_enable_qty_inc` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Enable Qty Increments',
  `enable_qty_increments` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Enable Qty Increments',
  `is_decimal_divided` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Divided into Multiple Boxes for Shipping',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website ID',
  PRIMARY KEY (`item_id`),
  UNIQUE KEY `CSVP_CATALOGINVENTORY_STOCK_ITEM_PRODUCT_ID_STOCK_ID` (`product_id`,`stock_id`),
  KEY `CSVP_CATALOGINVENTORY_STOCK_ITEM_WEBSITE_ID` (`website_id`),
  KEY `CSVP_CATALOGINVENTORY_STOCK_ITEM_STOCK_ID` (`stock_id`),
  CONSTRAINT `CSVP_CATINV_STOCK_ITEM_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `csvp_catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_CATINV_STOCK_ITEM_STOCK_ID_CATINV_STOCK_STOCK_ID` FOREIGN KEY (`stock_id`) REFERENCES `csvp_cataloginventory_stock` (`stock_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cataloginventory Stock Item';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_cataloginventory_stock_item`
--

LOCK TABLES `csvp_cataloginventory_stock_item` WRITE;
/*!40000 ALTER TABLE `csvp_cataloginventory_stock_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_cataloginventory_stock_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_cataloginventory_stock_status`
--

DROP TABLE IF EXISTS `csvp_cataloginventory_stock_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_cataloginventory_stock_status` (
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `stock_id` smallint(5) unsigned NOT NULL COMMENT 'Stock Id',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `stock_status` smallint(5) unsigned NOT NULL COMMENT 'Stock Status',
  PRIMARY KEY (`product_id`,`website_id`,`stock_id`),
  KEY `CSVP_CATALOGINVENTORY_STOCK_STATUS_STOCK_ID` (`stock_id`),
  KEY `CSVP_CATALOGINVENTORY_STOCK_STATUS_WEBSITE_ID` (`website_id`),
  KEY `CSVP_CATALOGINVENTORY_STOCK_STATUS_STOCK_STATUS` (`stock_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cataloginventory Stock Status';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_cataloginventory_stock_status`
--

LOCK TABLES `csvp_cataloginventory_stock_status` WRITE;
/*!40000 ALTER TABLE `csvp_cataloginventory_stock_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_cataloginventory_stock_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_cataloginventory_stock_status_idx`
--

DROP TABLE IF EXISTS `csvp_cataloginventory_stock_status_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_cataloginventory_stock_status_idx` (
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `stock_id` smallint(5) unsigned NOT NULL COMMENT 'Stock Id',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `stock_status` smallint(5) unsigned NOT NULL COMMENT 'Stock Status',
  PRIMARY KEY (`product_id`,`website_id`,`stock_id`),
  KEY `CSVP_CATALOGINVENTORY_STOCK_STATUS_IDX_STOCK_ID` (`stock_id`),
  KEY `CSVP_CATALOGINVENTORY_STOCK_STATUS_IDX_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cataloginventory Stock Status Indexer Idx';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_cataloginventory_stock_status_idx`
--

LOCK TABLES `csvp_cataloginventory_stock_status_idx` WRITE;
/*!40000 ALTER TABLE `csvp_cataloginventory_stock_status_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_cataloginventory_stock_status_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_cataloginventory_stock_status_replica`
--

DROP TABLE IF EXISTS `csvp_cataloginventory_stock_status_replica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_cataloginventory_stock_status_replica` (
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `stock_id` smallint(5) unsigned NOT NULL COMMENT 'Stock Id',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `stock_status` smallint(5) unsigned NOT NULL COMMENT 'Stock Status',
  PRIMARY KEY (`product_id`,`website_id`,`stock_id`),
  KEY `CSVP_CATALOGINVENTORY_STOCK_STATUS_STOCK_ID` (`stock_id`),
  KEY `CSVP_CATALOGINVENTORY_STOCK_STATUS_WEBSITE_ID` (`website_id`),
  KEY `CSVP_CATALOGINVENTORY_STOCK_STATUS_STOCK_STATUS` (`stock_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cataloginventory Stock Status';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_cataloginventory_stock_status_replica`
--

LOCK TABLES `csvp_cataloginventory_stock_status_replica` WRITE;
/*!40000 ALTER TABLE `csvp_cataloginventory_stock_status_replica` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_cataloginventory_stock_status_replica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_cataloginventory_stock_status_tmp`
--

DROP TABLE IF EXISTS `csvp_cataloginventory_stock_status_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_cataloginventory_stock_status_tmp` (
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `stock_id` smallint(5) unsigned NOT NULL COMMENT 'Stock Id',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `stock_status` smallint(5) unsigned NOT NULL COMMENT 'Stock Status',
  PRIMARY KEY (`product_id`,`website_id`,`stock_id`),
  KEY `CSVP_CATALOGINVENTORY_STOCK_STATUS_TMP_STOCK_ID` (`stock_id`),
  KEY `CSVP_CATALOGINVENTORY_STOCK_STATUS_TMP_WEBSITE_ID` (`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Cataloginventory Stock Status Indexer Tmp';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_cataloginventory_stock_status_tmp`
--

LOCK TABLES `csvp_cataloginventory_stock_status_tmp` WRITE;
/*!40000 ALTER TABLE `csvp_cataloginventory_stock_status_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_cataloginventory_stock_status_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalogrule`
--

DROP TABLE IF EXISTS `csvp_catalogrule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalogrule` (
  `rule_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text COMMENT 'Description',
  `from_date` date DEFAULT NULL COMMENT 'From',
  `to_date` date DEFAULT NULL COMMENT 'To',
  `is_active` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Is Active',
  `conditions_serialized` mediumtext COMMENT 'Conditions Serialized',
  `actions_serialized` mediumtext COMMENT 'Actions Serialized',
  `stop_rules_processing` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Stop Rules Processing',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `simple_action` varchar(32) DEFAULT NULL COMMENT 'Simple Action',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  PRIMARY KEY (`rule_id`),
  KEY `CSVP_CATALOGRULE_IS_ACTIVE_SORT_ORDER_TO_DATE_FROM_DATE` (`is_active`,`sort_order`,`to_date`,`from_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CatalogRule';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalogrule`
--

LOCK TABLES `csvp_catalogrule` WRITE;
/*!40000 ALTER TABLE `csvp_catalogrule` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_catalogrule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalogrule_customer_group`
--

DROP TABLE IF EXISTS `csvp_catalogrule_customer_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalogrule_customer_group` (
  `rule_id` int(10) unsigned NOT NULL COMMENT 'Rule Id',
  `customer_group_id` int(10) unsigned NOT NULL COMMENT 'Customer Group Id',
  PRIMARY KEY (`rule_id`,`customer_group_id`),
  KEY `CSVP_CATALOGRULE_CUSTOMER_GROUP_CUSTOMER_GROUP_ID` (`customer_group_id`),
  CONSTRAINT `CSVP_CATALOGRULE_CUSTOMER_GROUP_RULE_ID_CATALOGRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `csvp_catalogrule` (`rule_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_CATRULE_CSTR_GROUP_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `csvp_customer_group` (`customer_group_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Rules To Customer Groups Relations';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalogrule_customer_group`
--

LOCK TABLES `csvp_catalogrule_customer_group` WRITE;
/*!40000 ALTER TABLE `csvp_catalogrule_customer_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_catalogrule_customer_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalogrule_group_website`
--

DROP TABLE IF EXISTS `csvp_catalogrule_group_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalogrule_group_website` (
  `rule_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Rule Id',
  `customer_group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group Id',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website Id',
  PRIMARY KEY (`rule_id`,`customer_group_id`,`website_id`),
  KEY `CSVP_CATALOGRULE_GROUP_WEBSITE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CSVP_CATALOGRULE_GROUP_WEBSITE_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CatalogRule Group Website';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalogrule_group_website`
--

LOCK TABLES `csvp_catalogrule_group_website` WRITE;
/*!40000 ALTER TABLE `csvp_catalogrule_group_website` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_catalogrule_group_website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalogrule_group_website_replica`
--

DROP TABLE IF EXISTS `csvp_catalogrule_group_website_replica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalogrule_group_website_replica` (
  `rule_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Rule Id',
  `customer_group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group Id',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website Id',
  PRIMARY KEY (`rule_id`,`customer_group_id`,`website_id`),
  KEY `CSVP_CATALOGRULE_GROUP_WEBSITE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CSVP_CATALOGRULE_GROUP_WEBSITE_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CatalogRule Group Website';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalogrule_group_website_replica`
--

LOCK TABLES `csvp_catalogrule_group_website_replica` WRITE;
/*!40000 ALTER TABLE `csvp_catalogrule_group_website_replica` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_catalogrule_group_website_replica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalogrule_product`
--

DROP TABLE IF EXISTS `csvp_catalogrule_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalogrule_product` (
  `rule_product_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule Product Id',
  `rule_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Rule Id',
  `from_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'From Time',
  `to_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'To time',
  `customer_group_id` int(11) DEFAULT NULL,
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product Id',
  `action_operator` varchar(10) DEFAULT 'to_fixed' COMMENT 'Action Operator',
  `action_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Action Amount',
  `action_stop` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Action Stop',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  PRIMARY KEY (`rule_product_id`),
  UNIQUE KEY `IDX_4280B2EB75733BF363880F6296463867` (`rule_id`,`from_time`,`to_time`,`website_id`,`customer_group_id`,`product_id`,`sort_order`),
  KEY `CSVP_CATALOGRULE_PRODUCT_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CSVP_CATALOGRULE_PRODUCT_WEBSITE_ID` (`website_id`),
  KEY `CSVP_CATALOGRULE_PRODUCT_FROM_TIME` (`from_time`),
  KEY `CSVP_CATALOGRULE_PRODUCT_TO_TIME` (`to_time`),
  KEY `CSVP_CATALOGRULE_PRODUCT_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CatalogRule Product';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalogrule_product`
--

LOCK TABLES `csvp_catalogrule_product` WRITE;
/*!40000 ALTER TABLE `csvp_catalogrule_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_catalogrule_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalogrule_product_price`
--

DROP TABLE IF EXISTS `csvp_catalogrule_product_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalogrule_product_price` (
  `rule_product_price_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule Product PriceId',
  `rule_date` date NOT NULL COMMENT 'Rule Date',
  `customer_group_id` int(11) DEFAULT NULL,
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product Id',
  `rule_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Rule Price',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `latest_start_date` date DEFAULT NULL COMMENT 'Latest StartDate',
  `earliest_end_date` date DEFAULT NULL COMMENT 'Earliest EndDate',
  PRIMARY KEY (`rule_product_price_id`),
  UNIQUE KEY `CSVP_CATRULE_PRD_PRICE_RULE_DATE_WS_ID_CSTR_GROUP_ID_PRD_ID` (`rule_date`,`website_id`,`customer_group_id`,`product_id`),
  KEY `CSVP_CATALOGRULE_PRODUCT_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CSVP_CATALOGRULE_PRODUCT_PRICE_WEBSITE_ID` (`website_id`),
  KEY `CSVP_CATALOGRULE_PRODUCT_PRICE_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CatalogRule Product Price';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalogrule_product_price`
--

LOCK TABLES `csvp_catalogrule_product_price` WRITE;
/*!40000 ALTER TABLE `csvp_catalogrule_product_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_catalogrule_product_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalogrule_product_price_replica`
--

DROP TABLE IF EXISTS `csvp_catalogrule_product_price_replica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalogrule_product_price_replica` (
  `rule_product_price_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule Product PriceId',
  `rule_date` date NOT NULL COMMENT 'Rule Date',
  `customer_group_id` int(11) DEFAULT NULL,
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product Id',
  `rule_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Rule Price',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `latest_start_date` date DEFAULT NULL COMMENT 'Latest StartDate',
  `earliest_end_date` date DEFAULT NULL COMMENT 'Earliest EndDate',
  PRIMARY KEY (`rule_product_price_id`),
  UNIQUE KEY `CSVP_CATRULE_PRD_PRICE_RULE_DATE_WS_ID_CSTR_GROUP_ID_PRD_ID` (`rule_date`,`website_id`,`customer_group_id`,`product_id`),
  KEY `CSVP_CATALOGRULE_PRODUCT_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CSVP_CATALOGRULE_PRODUCT_PRICE_WEBSITE_ID` (`website_id`),
  KEY `CSVP_CATALOGRULE_PRODUCT_PRICE_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CatalogRule Product Price';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalogrule_product_price_replica`
--

LOCK TABLES `csvp_catalogrule_product_price_replica` WRITE;
/*!40000 ALTER TABLE `csvp_catalogrule_product_price_replica` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_catalogrule_product_price_replica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalogrule_product_replica`
--

DROP TABLE IF EXISTS `csvp_catalogrule_product_replica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalogrule_product_replica` (
  `rule_product_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule Product Id',
  `rule_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Rule Id',
  `from_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'From Time',
  `to_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'To time',
  `customer_group_id` int(11) DEFAULT NULL,
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product Id',
  `action_operator` varchar(10) DEFAULT 'to_fixed' COMMENT 'Action Operator',
  `action_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Action Amount',
  `action_stop` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Action Stop',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  PRIMARY KEY (`rule_product_id`),
  UNIQUE KEY `IDX_4280B2EB75733BF363880F6296463867` (`rule_id`,`from_time`,`to_time`,`website_id`,`customer_group_id`,`product_id`,`sort_order`),
  KEY `CSVP_CATALOGRULE_PRODUCT_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CSVP_CATALOGRULE_PRODUCT_WEBSITE_ID` (`website_id`),
  KEY `CSVP_CATALOGRULE_PRODUCT_FROM_TIME` (`from_time`),
  KEY `CSVP_CATALOGRULE_PRODUCT_TO_TIME` (`to_time`),
  KEY `CSVP_CATALOGRULE_PRODUCT_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CatalogRule Product';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalogrule_product_replica`
--

LOCK TABLES `csvp_catalogrule_product_replica` WRITE;
/*!40000 ALTER TABLE `csvp_catalogrule_product_replica` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_catalogrule_product_replica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalogrule_website`
--

DROP TABLE IF EXISTS `csvp_catalogrule_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalogrule_website` (
  `rule_id` int(10) unsigned NOT NULL COMMENT 'Rule Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  PRIMARY KEY (`rule_id`,`website_id`),
  KEY `CSVP_CATALOGRULE_WEBSITE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `CSVP_CATALOGRULE_WEBSITE_RULE_ID_CATALOGRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `csvp_catalogrule` (`rule_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_CATALOGRULE_WEBSITE_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `csvp_store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Rules To Websites Relations';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalogrule_website`
--

LOCK TABLES `csvp_catalogrule_website` WRITE;
/*!40000 ALTER TABLE `csvp_catalogrule_website` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_catalogrule_website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_catalogsearch_fulltext_scope1`
--

DROP TABLE IF EXISTS `csvp_catalogsearch_fulltext_scope1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_catalogsearch_fulltext_scope1` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` int(10) unsigned NOT NULL COMMENT 'Attribute_id',
  `data_index` longtext COMMENT 'Data index',
  PRIMARY KEY (`entity_id`,`attribute_id`),
  FULLTEXT KEY `FTI_FULLTEXT_DATA_INDEX` (`data_index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='csvp_catalogsearch_fulltext_scope1_tmp';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_catalogsearch_fulltext_scope1`
--

LOCK TABLES `csvp_catalogsearch_fulltext_scope1` WRITE;
/*!40000 ALTER TABLE `csvp_catalogsearch_fulltext_scope1` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_catalogsearch_fulltext_scope1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_checkout_agreement`
--

DROP TABLE IF EXISTS `csvp_checkout_agreement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_checkout_agreement` (
  `agreement_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Agreement Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `content` text COMMENT 'Content',
  `content_height` varchar(25) DEFAULT NULL COMMENT 'Content Height',
  `checkbox_text` text COMMENT 'Checkbox Text',
  `is_active` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Is Active',
  `is_html` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Is Html',
  `mode` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Applied mode',
  PRIMARY KEY (`agreement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Checkout Agreement';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_checkout_agreement`
--

LOCK TABLES `csvp_checkout_agreement` WRITE;
/*!40000 ALTER TABLE `csvp_checkout_agreement` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_checkout_agreement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_checkout_agreement_store`
--

DROP TABLE IF EXISTS `csvp_checkout_agreement_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_checkout_agreement_store` (
  `agreement_id` int(10) unsigned NOT NULL COMMENT 'Agreement Id',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  PRIMARY KEY (`agreement_id`,`store_id`),
  KEY `CSVP_CHECKOUT_AGREEMENT_STORE_STORE_ID_STORE_STORE_ID` (`store_id`),
  CONSTRAINT `CSVP_CHECKOUT_AGREEMENT_STORE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_CHKT_AGRT_STORE_AGRT_ID_CHKT_AGRT_AGRT_ID` FOREIGN KEY (`agreement_id`) REFERENCES `csvp_checkout_agreement` (`agreement_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Checkout Agreement Store';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_checkout_agreement_store`
--

LOCK TABLES `csvp_checkout_agreement_store` WRITE;
/*!40000 ALTER TABLE `csvp_checkout_agreement_store` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_checkout_agreement_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_cms_block`
--

DROP TABLE IF EXISTS `csvp_cms_block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_cms_block` (
  `block_id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT 'Block ID',
  `title` varchar(255) NOT NULL COMMENT 'Block Title',
  `identifier` varchar(255) NOT NULL COMMENT 'Block String Identifier',
  `content` mediumtext COMMENT 'Block Content',
  `creation_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Block Creation Time',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Block Modification Time',
  `is_active` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Is Block Active',
  PRIMARY KEY (`block_id`),
  FULLTEXT KEY `CSVP_CMS_BLOCK_TITLE_IDENTIFIER_CONTENT` (`title`,`identifier`,`content`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='CMS Block Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_cms_block`
--

LOCK TABLES `csvp_cms_block` WRITE;
/*!40000 ALTER TABLE `csvp_cms_block` DISABLE KEYS */;
INSERT INTO `csvp_cms_block` VALUES (1,'csvape Topbar Help','csvape_topbar_help','<p>FREE PRIORITY SHIPPING ON ORDERS $50 OR MORE!  <a href=\"#\">Need Help? Call 855-775-8273</a></p>','2017-10-18 11:55:16','2017-10-18 11:55:16',1),(2,'Csvape Topbar Socials','csvape_topbar_socials','<ul class=\"top-socialmedia\">\r\n      <li><a href=\"#\"><i class=\"fa fa-facebook\" aria-hidden=\"true\"></i></a></li>\r\n      <li><a href=\"#\"><i class=\"fa fa-twitter\" aria-hidden=\"true\"></i></a></li>\r\n      <li><a href=\"#\"><i class=\"fa fa-instagram\" aria-hidden=\"true\"></i></a></li>\r\n      <li><a href=\"#\"><i class=\"fa fa-envelope\" aria-hidden=\"true\"></i></a></li>\r\n</ul>','2017-10-18 11:56:36','2017-10-18 11:56:36',1),(3,'Shop The CSVAPE Lyfestyle','shop_the_csvape_lyfestyle','<section class=\"csvape-lifestyle\">\r\n   <h2 class=\"section-title\"><span>Shop The CSVAPE </span>Lyfestyle</h2>\r\n  <div class=\"row\">\r\n     <div class=\"col-lg-4 col-md-4 col-sm-4 col-xs-4 col-xss-12\">\r\n         <div class=\"lifestyle-block\">\r\n             <img src=\"http://192.168.0.7/csvape/pub/static/frontend/Techievolve/csvape/en_US/images/csvape-lifestyle-vgod.jpg\" alt=\"\">\r\n                <div class=\"block-caption\">\r\n                 <p>Live the VGOD Lyfe with the exclusive VGOD line of products</p>\r\n                    <p><a href=\"javascript:void(0)\">Live Lyfe Now</a></p>\r\n                </div>\r\n            </div>\r\n        </div>\r\n        <div class=\"col-lg-4 col-md-4 col-sm-4 col-xs-4 col-xss-12\">\r\n         <div class=\"lifestyle-block\">\r\n             <img src=\"http://192.168.0.7/csvape/pub/static/frontend/Techievolve/csvape/en_US/images/csvape-lifestyle-bestsellers.jpg\" alt=\"\">\r\n                <div class=\"block-caption\">\r\n                 <p>Live the VGOD Lyfe with the exclusive VGOD line of products</p>\r\n                    <p><a href=\"javascript:void(0)\">Live Lyfe Now</a></p>\r\n                </div>\r\n            </div>\r\n        </div>\r\n        <div class=\"col-lg-4 col-md-4 col-sm-4 col-xs-4 col-xss-12\">\r\n         <div class=\"lifestyle-block\">\r\n             <img src=\"http://192.168.0.7/csvape/pub/static/frontend/Techievolve/csvape/en_US/images/csvape-lifestyle-brandspotlight.jpg\" alt=\"\">\r\n                <div class=\"block-caption\">\r\n                 <p>Live the VGOD Lyfe with the exclusive VGOD line of products</p>\r\n                    <p><a href=\"javascript:void(0)\">Live Lyfe Now</a></p>\r\n                </div>\r\n            </div>\r\n        </div>\r\n    </div>\r\n </section>','2017-10-18 11:58:06','2017-10-18 11:58:06',1),(4,'Best Kept Secrets','best_kept_secrets','<h3>Best Kept Secrets - Brands You Should Know</h3>\r\n            <div class=\"row best-kept-secret\">\r\n             <div class=\"col-lg-4 col-sm-4 col-md-4\">\r\n                <img src=\"http://192.168.0.7/csvape/pub/static/frontend/Techievolve/csvape/en_US/images/coilhip-logo.jpg\" alt=\"\">\r\n                 <p>Products Description here. Supreme Performance, Premim parts..etc..</p>\r\n                    <a href=\"#\">SHOP NOW</a>\r\n                </div>\r\n                <div class=\"col-lg-4 col-sm-4 col-md-4\">\r\n                    <img src=\"http://192.168.0.7/csvape/pub/static/frontend/Techievolve/csvape/en_US/images/flavor-drip.jpg\" alt=\"\">\r\n                 <p>Experience one of the most premium ejuice brands out there. Check out their famous strawberry shortcake!</p>\r\n                    <a href=\"#\">SHOP NOW</a>\r\n                </div>\r\n                <div class=\"col-lg-4 col-sm-4 col-md-4\">\r\n                 <img src=\"http://192.168.0.7/csvape/pub/static/frontend/Techievolve/csvape/en_US/images/vgod-black.jpg\" alt=\"\">\r\n                 <p>VGOD’s Mods and Atomizers designed for extravagant performance! Experience the world of VGOD and more...</p>\r\n                    <a href=\"#\">SHOP NOW</a>\r\n                </div>\r\n            </div>\r\n            <div class=\"row buy-confidence\">\r\n             <h4>BUY WITH CONFIDENCE</h4>\r\n                <p>If you’re in the market for a new device, csvape.com specializes in making sure our customers are happy with their purchase. Ensuring the devices are authentic and ready to go, along with our incredible pricing, buying from us will make your day and more!</p>\r\n            </div>\r\n            \r\n            <div class=\"row superior-service\">\r\n             <h4>SUPERIOR SERVICE &amp; PREMIUM QUALITY PRODUCTS</h4>\r\n                <div class=\"col-lg-6 col-sm-6 col-md-6 col-xs-6 col-xss-12\">\r\n                 <div class=\"sp-block\">\r\n                     <div class=\"icoBlock\">\r\n                         <i class=\"fa fa-globe\" aria-hidden=\"true\"></i>\r\n                        </div>\r\n                        <div class=\"descBlock\">\r\n                         <h1>30,000+</h1>\r\n                            <p>WorldWide Customers</p>\r\n                        </div>\r\n                    </div>                    \r\n                </div>\r\n                 <div class=\"col-lg-6 col-sm-6 col-md-6 col-xs-6 col-xss-12\">\r\n                 <div class=\"sp-block\">\r\n                     <div class=\"icoBlock\">\r\n                         <i class=\"fa fa-star\" aria-hidden=\"true\"></i>\r\n                        </div>\r\n                        <div class=\"descBlock\">\r\n                         <h1>4,000+</h1>\r\n                            <p>Product Reviews</p>\r\n                        </div>\r\n                    </div>                    \r\n                </div>\r\n                 <div class=\"col-lg-6 col-sm-6 col-md-6 col-xs-6 col-xss-12\">\r\n                 <div class=\"sp-block\">\r\n                     <div class=\"icoBlock\">\r\n                         <i class=\"fa fa-eyedropper\" aria-hidden=\"true\"></i>\r\n                        </div>\r\n                        <div class=\"descBlock\">\r\n                         <h1>300+</h1>\r\n                            <p>E-Liquid Flavors</p>\r\n                        </div>\r\n                    </div>                    \r\n                </div>\r\n                 <div class=\"col-lg-6 col-sm-6 col-md-6 col-xs-6 col-xss-12\">\r\n                 <div class=\"sp-block\">\r\n                     <div class=\"icoBlock\">\r\n                         <img src=\"http://192.168.0.7/csvape/pub/static/frontend/Techievolve/csvape/en_US/images/vape-ico.png\" alt=\"\">\r\n                        </div>\r\n                        <div class=\"descBlock\">\r\n                         <h1>600+</h1>\r\n                            <p>Vape Products</p>\r\n                        </div>\r\n                    </div>                    \r\n                </div>                \r\n            </div>','2017-10-18 11:59:04','2017-10-18 11:59:04',1),(5,'Superior Service & Premium Quality Products','superior_service_premium_quality_products','SUPERIOR SERVICE & PREMIUM QUALITY PRODUCTS','2017-10-18 12:00:47','2017-10-18 12:00:47',1),(6,'Footer Content 1','footer_content_1','<div class=\"cls-footer-1\">\r\n         <h3>Get to Know Us</h3>\r\n            <ul>\r\n             <li><a href=\"#\">About us</a></li>\r\n                <li><a href=\"#\">Contact us</a></li>\r\n                <li><a href=\"#\">Affiliates</a></li>\r\n                <li><a href=\"#\">Blog</a></li>\r\n            </ul>\r\n</div>','2017-10-18 12:01:22','2017-10-18 12:01:22',1),(7,'Footer Content 2','footer_content_2','<div class=\"footer-col-2\">\r\n         <h3>Let Us Help You</h3>\r\n            <ul>\r\n             <li><a href=\"#\">My Account</a></li>\r\n                <li><a href=\"#\">Orders &amp; Returns</a></li>\r\n                <li><a href=\"#\">Terms &amp; Conditions</a></li>\r\n                <li><a href=\"#\">Support</a></li>\r\n            </ul>\r\n</div>','2017-10-18 12:01:46','2017-10-18 12:01:46',1),(8,'Footer Content 3','footer_content_3','<div class=\"footer-col-3\">\r\n         \r\n            <p>Get In Touch</p>\r\n            <p class=\"gtintouch\"><a href=\"javascript:void(0)\"><i class=\"fa fa-facebook\" aria-hidden=\"true\"></i></a>\r\n     <a href=\"javascript:void(0)\"><i class=\"fa fa-twitter\" aria-hidden=\"true\"></i></a>\r\n     <a href=\"javascript:void(0)\"><i class=\"fa fa-instagram\" aria-hidden=\"true\"></i></a>\r\n     <a href=\"javascript:void(0)\"><i class=\"fa fa-envelope\" aria-hidden=\"true\"></i></a>\r\n                    <a href=\"javascript:void(0)\"><i class=\"fa fa-youtube\" aria-hidden=\"true\"></i></a></p>\r\n</div>','2017-10-18 12:02:16','2017-10-18 12:02:16',1),(9,'Footer Content 4','footer_content_4','<div class=\"footer-col-4\">\r\n         <p class=\"phnumber\"> +1 855-775-8273</p>\r\n         <p class=\"addressinfo\">17494 Hawthorne, Blvd, Torrance, CA, 90504</p>\r\n         <p class=\"mailid\"><a href=\"mailto:info@csvape.com\">info@csvape.com</a></p>\r\n</div>','2017-10-18 12:02:41','2017-10-18 12:02:41',1),(10,'Csvape Copyright','csvape_copyright','<div class=\"row copyright-warning\">\r\n     <p class=\"copyright\">© 2013 - 2017 Cloudscape Inc. All Rights Reserved.</p>\r\n        <p class=\"warning-txt\">\r\n         NOT FOR SALE TO MINORS | CALIFORNIA PROPOSITION 65  – Warning:<br> \r\n		 Products on csvape.com contain nicotine, a chemical known to the state of California to cause birth defects or other reproductive harm. Products are not \r\n                 smoking cessation products and have not been evaluated by the Food and Drug Administration, nor are they intended to treat, prevent or cure any disease or \r\n                 condition.\r\n        </p>\r\n</div>','2017-10-18 12:04:45','2017-10-18 12:04:45',1);
/*!40000 ALTER TABLE `csvp_cms_block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_cms_block_store`
--

DROP TABLE IF EXISTS `csvp_cms_block_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_cms_block_store` (
  `block_id` smallint(6) NOT NULL COMMENT 'Block ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  PRIMARY KEY (`block_id`,`store_id`),
  KEY `CSVP_CMS_BLOCK_STORE_STORE_ID` (`store_id`),
  CONSTRAINT `CSVP_CMS_BLOCK_STORE_BLOCK_ID_CMS_BLOCK_BLOCK_ID` FOREIGN KEY (`block_id`) REFERENCES `csvp_cms_block` (`block_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_CMS_BLOCK_STORE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS Block To Store Linkage Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_cms_block_store`
--

LOCK TABLES `csvp_cms_block_store` WRITE;
/*!40000 ALTER TABLE `csvp_cms_block_store` DISABLE KEYS */;
INSERT INTO `csvp_cms_block_store` VALUES (1,0),(2,0),(3,0),(4,0),(5,0),(6,0),(7,0),(8,0),(9,0),(10,0);
/*!40000 ALTER TABLE `csvp_cms_block_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_cms_page`
--

DROP TABLE IF EXISTS `csvp_cms_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_cms_page` (
  `page_id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT 'Page ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Page Title',
  `page_layout` varchar(255) DEFAULT NULL COMMENT 'Page Layout',
  `meta_keywords` text COMMENT 'Page Meta Keywords',
  `meta_description` text COMMENT 'Page Meta Description',
  `identifier` varchar(100) DEFAULT NULL COMMENT 'Page String Identifier',
  `content_heading` varchar(255) DEFAULT NULL COMMENT 'Page Content Heading',
  `content` mediumtext COMMENT 'Page Content',
  `creation_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Page Creation Time',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Page Modification Time',
  `is_active` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Is Page Active',
  `sort_order` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Page Sort Order',
  `layout_update_xml` text COMMENT 'Page Layout Update Content',
  `custom_theme` varchar(100) DEFAULT NULL COMMENT 'Page Custom Theme',
  `custom_root_template` varchar(255) DEFAULT NULL COMMENT 'Page Custom Template',
  `custom_layout_update_xml` text COMMENT 'Page Custom Layout Update Content',
  `custom_theme_from` date DEFAULT NULL COMMENT 'Page Custom Theme Active From Date',
  `custom_theme_to` date DEFAULT NULL COMMENT 'Page Custom Theme Active To Date',
  `meta_title` varchar(255) DEFAULT NULL COMMENT 'Page Meta Title',
  PRIMARY KEY (`page_id`),
  KEY `CSVP_CMS_PAGE_IDENTIFIER` (`identifier`),
  FULLTEXT KEY `FTI_1FFE01103DC9B4FCA8330C9C4B2D66C5` (`title`,`meta_keywords`,`meta_description`,`identifier`,`content`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='CMS Page Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_cms_page`
--

LOCK TABLES `csvp_cms_page` WRITE;
/*!40000 ALTER TABLE `csvp_cms_page` DISABLE KEYS */;
INSERT INTO `csvp_cms_page` VALUES (1,'404 Not Found','2columns-right','Page keywords','Page description','no-route','Whoops, our bad...','<dl>\r\n<dt>The page you requested was not found, and we have a fine guess why.</dt>\r\n<dd>\r\n<ul class=\"disc\">\r\n<li>If you typed the URL directly, please make sure the spelling is correct.</li>\r\n<li>If you clicked on a link to get here, the link is outdated.</li>\r\n</ul></dd>\r\n</dl>\r\n<dl>\r\n<dt>What can you do?</dt>\r\n<dd>Have no fear, help is near! There are many ways you can get back on track with Magento Store.</dd>\r\n<dd>\r\n<ul class=\"disc\">\r\n<li><a href=\"#\" onclick=\"history.go(-1); return false;\">Go back</a> to the previous page.</li>\r\n<li>Use the search bar at the top of the page to search for your products.</li>\r\n<li>Follow these links to get you back on track!<br /><a href=\"{{store url=\"\"}}\">Store Home</a> <span class=\"separator\">|</span> <a href=\"{{store url=\"customer/account\"}}\">My Account</a></li></ul></dd></dl>\r\n','2017-10-17 06:32:48','2017-10-17 06:32:48',1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'Home page','1column','','','home','','{{block class=\"Techievolve\\Csvape\\Block\\Template\" template=\"Techievolve_Csvape::home.phtml\"}}\r\n','2017-10-17 06:32:48','2017-10-17 06:32:48',1,0,'<!--\r\n    <referenceContainer name=\"right\">\r\n        <action method=\"unsetChild\"><argument name=\"alias\" xsi:type=\"string\">right.reports.product.viewed</argument></action>\r\n        <action method=\"unsetChild\"><argument name=\"alias\" xsi:type=\"string\">right.reports.product.compared</argument></action>\r\n    </referenceContainer>-->','','',NULL,NULL,NULL,''),(3,'Enable Cookies','1column',NULL,NULL,'enable-cookies','What are Cookies?','<div class=\"enable-cookies cms-content\">\r\n<p>\"Cookies\" are little pieces of data we send when you visit our store. Cookies help us get to know you better and personalize your experience. Plus they help protect you and other shoppers from fraud.</p>\r\n<p style=\"margin-bottom: 20px;\">Set your browser to accept cookies so you can buy items, save items, and receive customized recommendations. Here’s how:</p>\r\n<ul>\r\n<li><a href=\"https://support.google.com/accounts/answer/61416?hl=en\" target=\"_blank\">Google Chrome</a></li>\r\n<li><a href=\"http://windows.microsoft.com/en-us/internet-explorer/delete-manage-cookies\" target=\"_blank\">Internet Explorer</a></li>\r\n<li><a href=\"http://support.apple.com/kb/PH19214\" target=\"_blank\">Safari</a></li>\r\n<li><a href=\"https://support.mozilla.org/en-US/kb/enable-and-disable-cookies-website-preferences\" target=\"_blank\">Mozilla/Firefox</a></li>\r\n</ul>\r\n</div>','2017-10-17 06:32:48','2017-10-17 06:32:48',1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'Privacy and Cookie Policy','1column',NULL,NULL,'privacy-policy-cookie-restriction-mode','Privacy and Cookie Policy','<div class=\"privacy-policy cms-content\">\n    <div class=\"message info\">\n        <span>\n            Please replace this text with you Privacy Policy.\n            Please add any additional cookies your website uses below (e.g. Google Analytics).\n        </span>\n    </div>\n    <p>\n        This privacy policy sets out how this website (hereafter \"the Store\") uses and protects any information that\n        you give the Store while using this website. The Store is committed to ensuring that your privacy is protected.\n        Should we ask you to provide certain information by which you can be identified when using this website, then\n        you can be assured that it will only be used in accordance with this privacy statement. The Store may change\n        this policy from time to time by updating this page. You should check this page from time to time to ensure\n        that you are happy with any changes.\n    </p>\n    <h2>What we collect</h2>\n    <p>We may collect the following information:</p>\n    <ul>\n        <li>name</li>\n        <li>contact information including email address</li>\n        <li>demographic information such as postcode, preferences and interests</li>\n        <li>other information relevant to customer surveys and/or offers</li>\n    </ul>\n    <p>\n        For the exhaustive list of cookies we collect see the <a href=\"#list\">List of cookies we collect</a> section.\n    </p>\n    <h2>What we do with the information we gather</h2>\n    <p>\n        We require this information to understand your needs and provide you with a better service,\n        and in particular for the following reasons:\n    </p>\n    <ul>\n        <li>Internal record keeping.</li>\n        <li>We may use the information to improve our products and services.</li>\n        <li>\n            We may periodically send promotional emails about new products, special offers or other information which we\n            think you may find interesting using the email address which you have provided.\n        </li>\n        <li>\n            From time to time, we may also use your information to contact you for market research purposes.\n            We may contact you by email, phone, fax or mail. We may use the information to customise the website\n            according to your interests.\n        </li>\n    </ul>\n    <h2>Security</h2>\n    <p>\n        We are committed to ensuring that your information is secure. In order to prevent unauthorised access or\n        disclosure, we have put in place suitable physical, electronic and managerial procedures to safeguard and\n        secure the information we collect online.\n    </p>\n    <h2>How we use cookies</h2>\n    <p>\n        A cookie is a small file which asks permission to be placed on your computer\'s hard drive.\n        Once you agree, the file is added and the cookie helps analyse web traffic or lets you know when you visit\n        a particular site. Cookies allow web applications to respond to you as an individual. The web application\n        can tailor its operations to your needs, likes and dislikes by gathering and remembering information about\n        your preferences.\n    </p>\n    <p>\n        We use traffic log cookies to identify which pages are being used. This helps us analyse data about web page\n        traffic and improve our website in order to tailor it to customer needs. We only use this information for\n        statistical analysis purposes and then the data is removed from the system.\n    </p>\n    <p>\n        Overall, cookies help us provide you with a better website, by enabling us to monitor which pages you find\n        useful and which you do not. A cookie in no way gives us access to your computer or any information about you,\n        other than the data you choose to share with us. You can choose to accept or decline cookies.\n        Most web browsers automatically accept cookies, but you can usually modify your browser setting\n        to decline cookies if you prefer. This may prevent you from taking full advantage of the website.\n    </p>\n    <h2>Links to other websites</h2>\n    <p>\n        Our website may contain links to other websites of interest. However, once you have used these links\n        to leave our site, you should note that we do not have any control over that other website.\n        Therefore, we cannot be responsible for the protection and privacy of any information which you provide whilst\n        visiting such sites and such sites are not governed by this privacy statement.\n        You should exercise caution and look at the privacy statement applicable to the website in question.\n    </p>\n    <h2>Controlling your personal information</h2>\n    <p>You may choose to restrict the collection or use of your personal information in the following ways:</p>\n    <ul>\n        <li>\n            whenever you are asked to fill in a form on the website, look for the box that you can click to indicate\n            that you do not want the information to be used by anybody for direct marketing purposes\n        </li>\n        <li>\n            if you have previously agreed to us using your personal information for direct marketing purposes,\n            you may change your mind at any time by letting us know using our Contact Us information\n        </li>\n    </ul>\n    <p>\n        We will not sell, distribute or lease your personal information to third parties unless we have your permission\n        or are required by law to do so. We may use your personal information to send you promotional information\n        about third parties which we think you may find interesting if you tell us that you wish this to happen.\n    </p>\n    <p>\n        You may request details of personal information which we hold about you under the Data Protection Act 1998.\n        A small fee will be payable. If you would like a copy of the information held on you please email us this\n        request using our Contact Us information.\n    </p>\n    <p>\n        If you believe that any information we are holding on you is incorrect or incomplete,\n        please write to or email us as soon as possible, at the above address.\n        We will promptly correct any information found to be incorrect.\n    </p>\n    <h2><a name=\"list\"></a>List of cookies we collect</h2>\n    <p>The table below lists the cookies we collect and what information they store.</p>\n    <table class=\"data-table data-table-definition-list\">\n        <thead>\n        <tr>\n            <th>Cookie Name</th>\n            <th>Cookie Description</th>\n        </tr>\n        </thead>\n        <tbody>\n            <tr>\n                <th>FORM_KEY</th>\n                <td>Stores randomly generated key used to prevent forged requests.</td>\n            </tr>\n            <tr>\n                <th>PHPSESSID</th>\n                <td>Your session ID on the server.</td>\n            </tr>\n            <tr>\n                <th>GUEST-VIEW</th>\n                <td>Allows guests to view and edit their orders.</td>\n            </tr>\n            <tr>\n                <th>PERSISTENT_SHOPPING_CART</th>\n                <td>A link to information about your cart and viewing history, if you have asked for this.</td>\n            </tr>\n            <tr>\n                <th>STF</th>\n                <td>Information on products you have emailed to friends.</td>\n            </tr>\n            <tr>\n                <th>STORE</th>\n                <td>The store view or language you have selected.</td>\n            </tr>\n            <tr>\n                <th>USER_ALLOWED_SAVE_COOKIE</th>\n                <td>Indicates whether a customer allowed to use cookies.</td>\n            </tr>\n            <tr>\n                <th>MAGE-CACHE-SESSID</th>\n                <td>Facilitates caching of content on the browser to make pages load faster.</td>\n            </tr>\n            <tr>\n                <th>MAGE-CACHE-STORAGE</th>\n                <td>Facilitates caching of content on the browser to make pages load faster.</td>\n            </tr>\n            <tr>\n                <th>MAGE-CACHE-STORAGE-SECTION-INVALIDATION</th>\n                <td>Facilitates caching of content on the browser to make pages load faster.</td>\n            </tr>\n            <tr>\n                <th>MAGE-CACHE-TIMEOUT</th>\n                <td>Facilitates caching of content on the browser to make pages load faster.</td>\n            </tr>\n            <tr>\n                <th>SECTION-DATA-IDS</th>\n                <td>Facilitates caching of content on the browser to make pages load faster.</td>\n            </tr>\n            <tr>\n                <th>PRIVATE_CONTENT_VERSION</th>\n                <td>Facilitates caching of content on the browser to make pages load faster.</td>\n            </tr>\n            <tr>\n                <th>X-MAGENTO-VARY</th>\n                <td>Facilitates caching of content on the server to make pages load faster.</td>\n            </tr>\n            <tr>\n                <th>MAGE-TRANSLATION-FILE-VERSION</th>\n                <td>Facilitates translation of content to other languages.</td>\n            </tr>\n            <tr>\n                <th>MAGE-TRANSLATION-STORAGE</th>\n                <td>Facilitates translation of content to other languages.</td>\n            </tr>\n        </tbody>\n    </table>\n</div>','2017-10-17 06:32:49','2017-10-17 06:32:49',1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `csvp_cms_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_cms_page_store`
--

DROP TABLE IF EXISTS `csvp_cms_page_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_cms_page_store` (
  `page_id` smallint(6) NOT NULL COMMENT 'Page ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  PRIMARY KEY (`page_id`,`store_id`),
  KEY `CSVP_CMS_PAGE_STORE_STORE_ID` (`store_id`),
  CONSTRAINT `CSVP_CMS_PAGE_STORE_PAGE_ID_CMS_PAGE_PAGE_ID` FOREIGN KEY (`page_id`) REFERENCES `csvp_cms_page` (`page_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_CMS_PAGE_STORE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS Page To Store Linkage Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_cms_page_store`
--

LOCK TABLES `csvp_cms_page_store` WRITE;
/*!40000 ALTER TABLE `csvp_cms_page_store` DISABLE KEYS */;
INSERT INTO `csvp_cms_page_store` VALUES (1,0),(2,0),(3,0),(4,0);
/*!40000 ALTER TABLE `csvp_cms_page_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_core_config_data`
--

DROP TABLE IF EXISTS `csvp_core_config_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_core_config_data` (
  `config_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Config Id',
  `scope` varchar(8) NOT NULL DEFAULT 'default' COMMENT 'Config Scope',
  `scope_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Config Scope Id',
  `path` varchar(255) NOT NULL DEFAULT 'general' COMMENT 'Config Path',
  `value` text COMMENT 'Config Value',
  PRIMARY KEY (`config_id`),
  UNIQUE KEY `CSVP_CORE_CONFIG_DATA_SCOPE_SCOPE_ID_PATH` (`scope`,`scope_id`,`path`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COMMENT='Config Data';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_core_config_data`
--

LOCK TABLES `csvp_core_config_data` WRITE;
/*!40000 ALTER TABLE `csvp_core_config_data` DISABLE KEYS */;
INSERT INTO `csvp_core_config_data` VALUES (1,'default',0,'web/seo/use_rewrites','1'),(2,'default',0,'web/unsecure/base_url','http://192.168.0.7/csvape/'),(3,'default',0,'web/secure/base_url','http://192.168.0.7/csvape/'),(4,'default',0,'general/locale/code','en_US'),(5,'default',0,'web/secure/use_in_frontend',NULL),(6,'default',0,'web/secure/use_in_adminhtml',NULL),(7,'default',0,'general/locale/timezone','UTC'),(8,'default',0,'currency/options/base','USD'),(9,'default',0,'currency/options/default','USD'),(10,'default',0,'currency/options/allow','USD'),(11,'default',0,'general/region/display_all','1'),(12,'default',0,'general/region/state_required','AT,BR,CA,CH,EE,ES,FI,HR,LT,LV,RO,US'),(13,'default',0,'catalog/category/root_id','2'),(14,'default',0,'dev/static/sign','0'),(15,'stores',1,'design/theme/theme_id','4'),(16,'stores',1,'design/pagination/pagination_frame_skip',NULL),(17,'stores',1,'design/pagination/anchor_text_for_previous',NULL),(18,'stores',1,'design/pagination/anchor_text_for_next',NULL),(19,'stores',1,'design/head/title_prefix',NULL),(20,'stores',1,'design/head/title_suffix',NULL),(21,'stores',1,'design/head/default_description',NULL),(22,'stores',1,'design/head/default_keywords',NULL),(23,'stores',1,'design/head/includes',NULL),(24,'stores',1,'design/header/logo_width','164'),(25,'stores',1,'design/header/logo_height','58'),(26,'stores',1,'design/header/logo_alt',NULL),(27,'stores',1,'design/footer/absolute_footer',NULL),(28,'stores',1,'design/search_engine_robots/custom_instructions',NULL),(29,'stores',1,'design/watermark/image_size',NULL),(30,'stores',1,'design/watermark/image_imageOpacity',NULL),(31,'stores',1,'design/watermark/small_image_size',NULL),(32,'stores',1,'design/watermark/small_image_imageOpacity',NULL),(33,'stores',1,'design/watermark/thumbnail_size',NULL),(34,'stores',1,'design/watermark/thumbnail_imageOpacity',NULL),(35,'stores',1,'design/email/logo_alt',NULL),(36,'stores',1,'design/email/logo_width',NULL),(37,'stores',1,'design/email/logo_height',NULL),(38,'stores',1,'design/watermark/swatch_image_size',NULL),(39,'stores',1,'design/watermark/swatch_image_imageOpacity',NULL),(40,'default',0,'cms/wysiwyg/enabled','hidden'),(41,'default',0,'cms/wysiwyg/use_static_urls_in_catalog','0'),(42,'stores',1,'design/header/logo_src','stores/1/csvape-logo.png'),(43,'stores',1,'design/header/welcome',NULL);
/*!40000 ALTER TABLE `csvp_core_config_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_cron_schedule`
--

DROP TABLE IF EXISTS `csvp_cron_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_cron_schedule` (
  `schedule_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Schedule Id',
  `job_code` varchar(255) NOT NULL DEFAULT '0' COMMENT 'Job Code',
  `status` varchar(7) NOT NULL DEFAULT 'pending' COMMENT 'Status',
  `messages` text COMMENT 'Messages',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `scheduled_at` timestamp NULL DEFAULT NULL COMMENT 'Scheduled At',
  `executed_at` timestamp NULL DEFAULT NULL COMMENT 'Executed At',
  `finished_at` timestamp NULL DEFAULT NULL COMMENT 'Finished At',
  PRIMARY KEY (`schedule_id`),
  KEY `CSVP_CRON_SCHEDULE_JOB_CODE` (`job_code`),
  KEY `CSVP_CRON_SCHEDULE_SCHEDULED_AT_STATUS` (`scheduled_at`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cron Schedule';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_cron_schedule`
--

LOCK TABLES `csvp_cron_schedule` WRITE;
/*!40000 ALTER TABLE `csvp_cron_schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_cron_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_customer_address_entity`
--

DROP TABLE IF EXISTS `csvp_customer_address_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_customer_address_entity` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `parent_id` int(10) unsigned DEFAULT NULL COMMENT 'Parent Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `is_active` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Active',
  `city` varchar(255) NOT NULL COMMENT 'City',
  `company` varchar(255) DEFAULT NULL COMMENT 'Company',
  `country_id` varchar(255) NOT NULL COMMENT 'Country',
  `fax` varchar(255) DEFAULT NULL COMMENT 'Fax',
  `firstname` varchar(255) NOT NULL COMMENT 'First Name',
  `lastname` varchar(255) NOT NULL COMMENT 'Last Name',
  `middlename` varchar(255) DEFAULT NULL COMMENT 'Middle Name',
  `postcode` varchar(255) DEFAULT NULL COMMENT 'Zip/Postal Code',
  `prefix` varchar(40) DEFAULT NULL COMMENT 'Name Prefix',
  `region` varchar(255) DEFAULT NULL COMMENT 'State/Province',
  `region_id` int(10) unsigned DEFAULT NULL COMMENT 'State/Province',
  `street` text NOT NULL COMMENT 'Street Address',
  `suffix` varchar(40) DEFAULT NULL COMMENT 'Name Suffix',
  `telephone` varchar(255) NOT NULL COMMENT 'Phone Number',
  `vat_id` varchar(255) DEFAULT NULL COMMENT 'VAT number',
  `vat_is_valid` int(10) unsigned DEFAULT NULL COMMENT 'VAT number validity',
  `vat_request_date` varchar(255) DEFAULT NULL COMMENT 'VAT number validation request date',
  `vat_request_id` varchar(255) DEFAULT NULL COMMENT 'VAT number validation request ID',
  `vat_request_success` int(10) unsigned DEFAULT NULL COMMENT 'VAT number validation request success',
  PRIMARY KEY (`entity_id`),
  KEY `CSVP_CUSTOMER_ADDRESS_ENTITY_PARENT_ID` (`parent_id`),
  CONSTRAINT `CSVP_CUSTOMER_ADDRESS_ENTITY_PARENT_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `csvp_customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Address Entity';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_customer_address_entity`
--

LOCK TABLES `csvp_customer_address_entity` WRITE;
/*!40000 ALTER TABLE `csvp_customer_address_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_customer_address_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_customer_address_entity_datetime`
--

DROP TABLE IF EXISTS `csvp_customer_address_entity_datetime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_customer_address_entity_datetime` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` datetime DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CSVP_CUSTOMER_ADDRESS_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CSVP_CUSTOMER_ADDRESS_ENTITY_DATETIME_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CSVP_CSTR_ADDR_ENTT_DTIME_ENTT_ID_ATTR_ID_VAL` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `CSVP_CSTR_ADDR_ENTT_DTIME_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `csvp_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_CSTR_ADDR_ENTT_DTIME_ENTT_ID_CSTR_ADDR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `csvp_customer_address_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Address Entity Datetime';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_customer_address_entity_datetime`
--

LOCK TABLES `csvp_customer_address_entity_datetime` WRITE;
/*!40000 ALTER TABLE `csvp_customer_address_entity_datetime` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_customer_address_entity_datetime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_customer_address_entity_decimal`
--

DROP TABLE IF EXISTS `csvp_customer_address_entity_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_customer_address_entity_decimal` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CSVP_CUSTOMER_ADDRESS_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CSVP_CUSTOMER_ADDRESS_ENTITY_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CSVP_CSTR_ADDR_ENTT_DEC_ENTT_ID_ATTR_ID_VAL` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `CSVP_CSTR_ADDR_ENTT_DEC_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `csvp_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_CSTR_ADDR_ENTT_DEC_ENTT_ID_CSTR_ADDR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `csvp_customer_address_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Address Entity Decimal';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_customer_address_entity_decimal`
--

LOCK TABLES `csvp_customer_address_entity_decimal` WRITE;
/*!40000 ALTER TABLE `csvp_customer_address_entity_decimal` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_customer_address_entity_decimal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_customer_address_entity_int`
--

DROP TABLE IF EXISTS `csvp_customer_address_entity_int`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_customer_address_entity_int` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` int(11) NOT NULL DEFAULT '0' COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CSVP_CUSTOMER_ADDRESS_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CSVP_CUSTOMER_ADDRESS_ENTITY_INT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CSVP_CUSTOMER_ADDRESS_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `CSVP_CSTR_ADDR_ENTT_INT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `csvp_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_CSTR_ADDR_ENTT_INT_ENTT_ID_CSTR_ADDR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `csvp_customer_address_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Address Entity Int';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_customer_address_entity_int`
--

LOCK TABLES `csvp_customer_address_entity_int` WRITE;
/*!40000 ALTER TABLE `csvp_customer_address_entity_int` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_customer_address_entity_int` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_customer_address_entity_text`
--

DROP TABLE IF EXISTS `csvp_customer_address_entity_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_customer_address_entity_text` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` text NOT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CSVP_CUSTOMER_ADDRESS_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CSVP_CUSTOMER_ADDRESS_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `CSVP_CSTR_ADDR_ENTT_TEXT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `csvp_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_CSTR_ADDR_ENTT_TEXT_ENTT_ID_CSTR_ADDR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `csvp_customer_address_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Address Entity Text';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_customer_address_entity_text`
--

LOCK TABLES `csvp_customer_address_entity_text` WRITE;
/*!40000 ALTER TABLE `csvp_customer_address_entity_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_customer_address_entity_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_customer_address_entity_varchar`
--

DROP TABLE IF EXISTS `csvp_customer_address_entity_varchar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_customer_address_entity_varchar` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CSVP_CUSTOMER_ADDRESS_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CSVP_CUSTOMER_ADDRESS_ENTITY_VARCHAR_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CSVP_CSTR_ADDR_ENTT_VCHR_ENTT_ID_ATTR_ID_VAL` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `CSVP_CSTR_ADDR_ENTT_VCHR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `csvp_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_CSTR_ADDR_ENTT_VCHR_ENTT_ID_CSTR_ADDR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `csvp_customer_address_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Address Entity Varchar';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_customer_address_entity_varchar`
--

LOCK TABLES `csvp_customer_address_entity_varchar` WRITE;
/*!40000 ALTER TABLE `csvp_customer_address_entity_varchar` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_customer_address_entity_varchar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_customer_eav_attribute`
--

DROP TABLE IF EXISTS `csvp_customer_eav_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_customer_eav_attribute` (
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute Id',
  `is_visible` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Visible',
  `input_filter` varchar(255) DEFAULT NULL COMMENT 'Input Filter',
  `multiline_count` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Multiline Count',
  `validate_rules` text COMMENT 'Validate Rules',
  `is_system` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is System',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `data_model` varchar(255) DEFAULT NULL COMMENT 'Data Model',
  `is_used_in_grid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Used in Grid',
  `is_visible_in_grid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible in Grid',
  `is_filterable_in_grid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Filterable in Grid',
  `is_searchable_in_grid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Searchable in Grid',
  PRIMARY KEY (`attribute_id`),
  CONSTRAINT `CSVP_CSTR_EAV_ATTR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `csvp_eav_attribute` (`attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Eav Attribute';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_customer_eav_attribute`
--

LOCK TABLES `csvp_customer_eav_attribute` WRITE;
/*!40000 ALTER TABLE `csvp_customer_eav_attribute` DISABLE KEYS */;
INSERT INTO `csvp_customer_eav_attribute` VALUES (1,1,NULL,0,NULL,1,10,NULL,1,1,1,0),(2,0,NULL,0,NULL,1,0,NULL,0,0,0,0),(3,1,NULL,0,NULL,1,20,NULL,1,1,0,1),(4,0,NULL,0,NULL,0,30,NULL,0,0,0,0),(5,1,NULL,0,'{\"max_text_length\":255,\"min_text_length\":1}',1,40,NULL,0,0,0,0),(6,0,NULL,0,NULL,0,50,NULL,0,0,0,0),(7,1,NULL,0,'{\"max_text_length\":255,\"min_text_length\":1}',1,60,NULL,0,0,0,0),(8,0,NULL,0,NULL,0,70,NULL,0,0,0,0),(9,1,NULL,0,'{\"input_validation\":\"email\"}',1,80,NULL,1,1,1,1),(10,1,NULL,0,NULL,1,25,NULL,1,1,1,0),(11,0,'date',0,'{\"input_validation\":\"date\"}',0,90,NULL,1,1,1,0),(12,0,NULL,0,NULL,1,0,NULL,0,0,0,0),(13,0,NULL,0,NULL,1,0,NULL,0,0,0,0),(14,0,NULL,0,'{\"input_validation\":\"date\"}',1,0,NULL,0,0,0,0),(15,0,NULL,0,NULL,1,0,NULL,0,0,0,0),(16,0,NULL,0,NULL,1,0,NULL,0,0,0,0),(17,0,NULL,0,'{\"max_text_length\":255}',0,100,NULL,1,1,0,1),(18,0,NULL,0,NULL,1,0,NULL,1,1,1,0),(19,0,NULL,0,NULL,0,0,NULL,1,1,1,0),(20,0,NULL,0,'[]',0,110,NULL,1,1,1,0),(21,1,NULL,0,NULL,1,28,NULL,0,0,0,0),(22,0,NULL,0,NULL,0,10,NULL,0,0,0,0),(23,1,NULL,0,'{\"max_text_length\":255,\"min_text_length\":1}',1,20,NULL,1,0,0,1),(24,0,NULL,0,NULL,0,30,NULL,0,0,0,0),(25,1,NULL,0,'{\"max_text_length\":255,\"min_text_length\":1}',1,40,NULL,1,0,0,1),(26,0,NULL,0,NULL,0,50,NULL,0,0,0,0),(27,1,NULL,0,'{\"max_text_length\":255,\"min_text_length\":1}',1,60,NULL,1,0,0,1),(28,1,NULL,2,'{\"max_text_length\":255,\"min_text_length\":1}',1,70,NULL,1,0,0,1),(29,1,NULL,0,'{\"max_text_length\":255,\"min_text_length\":1}',1,80,NULL,1,0,0,1),(30,1,NULL,0,NULL,1,90,NULL,1,1,1,0),(31,1,NULL,0,NULL,1,100,NULL,1,1,0,1),(32,1,NULL,0,NULL,1,100,NULL,0,0,0,0),(33,1,NULL,0,'[]',1,110,'Magento\\Customer\\Model\\Attribute\\Data\\Postcode',1,1,1,1),(34,1,NULL,0,'{\"max_text_length\":255,\"min_text_length\":1}',1,120,NULL,1,1,1,1),(35,0,NULL,0,'{\"max_text_length\":255,\"min_text_length\":1}',0,130,NULL,1,0,0,1),(36,1,NULL,0,NULL,1,140,NULL,0,0,0,0),(37,0,NULL,0,NULL,1,0,NULL,0,0,0,0),(38,0,NULL,0,NULL,1,0,NULL,0,0,0,0),(39,0,NULL,0,NULL,1,0,NULL,0,0,0,0),(40,0,NULL,0,NULL,1,0,NULL,0,0,0,0),(41,0,NULL,0,NULL,0,0,NULL,0,0,0,0),(42,0,NULL,0,NULL,1,0,NULL,0,0,0,0),(43,0,NULL,0,NULL,1,0,NULL,0,0,0,0),(44,0,NULL,0,NULL,1,0,NULL,0,0,0,0);
/*!40000 ALTER TABLE `csvp_customer_eav_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_customer_eav_attribute_website`
--

DROP TABLE IF EXISTS `csvp_customer_eav_attribute_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_customer_eav_attribute_website` (
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `is_visible` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Visible',
  `is_required` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Required',
  `default_value` text COMMENT 'Default Value',
  `multiline_count` smallint(5) unsigned DEFAULT NULL COMMENT 'Multiline Count',
  PRIMARY KEY (`attribute_id`,`website_id`),
  KEY `CSVP_CUSTOMER_EAV_ATTRIBUTE_WEBSITE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `CSVP_CSTR_EAV_ATTR_WS_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `csvp_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_CSTR_EAV_ATTR_WS_WS_ID_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `csvp_store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Eav Attribute Website';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_customer_eav_attribute_website`
--

LOCK TABLES `csvp_customer_eav_attribute_website` WRITE;
/*!40000 ALTER TABLE `csvp_customer_eav_attribute_website` DISABLE KEYS */;
INSERT INTO `csvp_customer_eav_attribute_website` VALUES (1,1,NULL,NULL,NULL,NULL),(3,1,NULL,NULL,NULL,NULL),(9,1,NULL,NULL,NULL,NULL),(10,1,NULL,NULL,NULL,NULL),(11,1,NULL,NULL,NULL,NULL),(17,1,NULL,NULL,NULL,NULL),(18,1,NULL,NULL,NULL,NULL),(19,1,NULL,NULL,NULL,NULL),(20,1,NULL,NULL,NULL,NULL),(21,1,NULL,NULL,NULL,NULL),(23,1,NULL,NULL,NULL,NULL),(25,1,NULL,NULL,NULL,NULL),(27,1,NULL,NULL,NULL,NULL),(28,1,NULL,NULL,NULL,NULL),(29,1,NULL,NULL,NULL,NULL),(30,1,NULL,NULL,NULL,NULL),(31,1,NULL,NULL,NULL,NULL),(32,1,NULL,NULL,NULL,NULL),(33,1,NULL,NULL,NULL,NULL),(34,1,NULL,NULL,NULL,NULL),(35,1,NULL,NULL,NULL,NULL),(36,1,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `csvp_customer_eav_attribute_website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_customer_entity`
--

DROP TABLE IF EXISTS `csvp_customer_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_customer_entity` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `website_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Website Id',
  `email` varchar(255) DEFAULT NULL COMMENT 'Email',
  `group_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Group Id',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `store_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Store Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `is_active` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Active',
  `disable_auto_group_change` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Disable automatic group change based on VAT ID',
  `created_in` varchar(255) DEFAULT NULL COMMENT 'Created From',
  `prefix` varchar(40) DEFAULT NULL COMMENT 'Name Prefix',
  `firstname` varchar(255) DEFAULT NULL COMMENT 'First Name',
  `middlename` varchar(255) DEFAULT NULL COMMENT 'Middle Name/Initial',
  `lastname` varchar(255) DEFAULT NULL COMMENT 'Last Name',
  `suffix` varchar(40) DEFAULT NULL COMMENT 'Name Suffix',
  `dob` date DEFAULT NULL COMMENT 'Date of Birth',
  `password_hash` varchar(128) DEFAULT NULL COMMENT 'Password_hash',
  `rp_token` varchar(128) DEFAULT NULL COMMENT 'Reset password token',
  `rp_token_created_at` datetime DEFAULT NULL COMMENT 'Reset password token creation time',
  `default_billing` int(10) unsigned DEFAULT NULL COMMENT 'Default Billing Address',
  `default_shipping` int(10) unsigned DEFAULT NULL COMMENT 'Default Shipping Address',
  `taxvat` varchar(50) DEFAULT NULL COMMENT 'Tax/VAT Number',
  `confirmation` varchar(64) DEFAULT NULL COMMENT 'Is Confirmed',
  `gender` smallint(5) unsigned DEFAULT NULL COMMENT 'Gender',
  `failures_num` smallint(6) DEFAULT '0' COMMENT 'Failure Number',
  `first_failure` timestamp NULL DEFAULT NULL COMMENT 'First Failure',
  `lock_expires` timestamp NULL DEFAULT NULL COMMENT 'Lock Expiration Date',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `CSVP_CUSTOMER_ENTITY_EMAIL_WEBSITE_ID` (`email`,`website_id`),
  KEY `CSVP_CUSTOMER_ENTITY_STORE_ID` (`store_id`),
  KEY `CSVP_CUSTOMER_ENTITY_WEBSITE_ID` (`website_id`),
  KEY `CSVP_CUSTOMER_ENTITY_FIRSTNAME` (`firstname`),
  KEY `CSVP_CUSTOMER_ENTITY_LASTNAME` (`lastname`),
  CONSTRAINT `CSVP_CUSTOMER_ENTITY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE SET NULL,
  CONSTRAINT `CSVP_CUSTOMER_ENTITY_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `csvp_store_website` (`website_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Entity';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_customer_entity`
--

LOCK TABLES `csvp_customer_entity` WRITE;
/*!40000 ALTER TABLE `csvp_customer_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_customer_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_customer_entity_datetime`
--

DROP TABLE IF EXISTS `csvp_customer_entity_datetime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_customer_entity_datetime` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` datetime DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CSVP_CUSTOMER_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CSVP_CUSTOMER_ENTITY_DATETIME_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CSVP_CUSTOMER_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `CSVP_CSTR_ENTT_DTIME_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `csvp_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_CSTR_ENTT_DTIME_ENTT_ID_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `csvp_customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Entity Datetime';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_customer_entity_datetime`
--

LOCK TABLES `csvp_customer_entity_datetime` WRITE;
/*!40000 ALTER TABLE `csvp_customer_entity_datetime` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_customer_entity_datetime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_customer_entity_decimal`
--

DROP TABLE IF EXISTS `csvp_customer_entity_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_customer_entity_decimal` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CSVP_CUSTOMER_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CSVP_CUSTOMER_ENTITY_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CSVP_CUSTOMER_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `CSVP_CSTR_ENTT_DEC_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `csvp_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_CUSTOMER_ENTITY_DECIMAL_ENTITY_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `csvp_customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Entity Decimal';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_customer_entity_decimal`
--

LOCK TABLES `csvp_customer_entity_decimal` WRITE;
/*!40000 ALTER TABLE `csvp_customer_entity_decimal` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_customer_entity_decimal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_customer_entity_int`
--

DROP TABLE IF EXISTS `csvp_customer_entity_int`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_customer_entity_int` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` int(11) NOT NULL DEFAULT '0' COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CSVP_CUSTOMER_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CSVP_CUSTOMER_ENTITY_INT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CSVP_CUSTOMER_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `CSVP_CUSTOMER_ENTITY_INT_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `csvp_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_CUSTOMER_ENTITY_INT_ENTITY_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `csvp_customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Entity Int';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_customer_entity_int`
--

LOCK TABLES `csvp_customer_entity_int` WRITE;
/*!40000 ALTER TABLE `csvp_customer_entity_int` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_customer_entity_int` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_customer_entity_text`
--

DROP TABLE IF EXISTS `csvp_customer_entity_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_customer_entity_text` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` text NOT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CSVP_CUSTOMER_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CSVP_CUSTOMER_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `CSVP_CSTR_ENTT_TEXT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `csvp_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_CUSTOMER_ENTITY_TEXT_ENTITY_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `csvp_customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Entity Text';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_customer_entity_text`
--

LOCK TABLES `csvp_customer_entity_text` WRITE;
/*!40000 ALTER TABLE `csvp_customer_entity_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_customer_entity_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_customer_entity_varchar`
--

DROP TABLE IF EXISTS `csvp_customer_entity_varchar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_customer_entity_varchar` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CSVP_CUSTOMER_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CSVP_CUSTOMER_ENTITY_VARCHAR_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CSVP_CUSTOMER_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `CSVP_CSTR_ENTT_VCHR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `csvp_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_CUSTOMER_ENTITY_VARCHAR_ENTITY_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `csvp_customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Entity Varchar';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_customer_entity_varchar`
--

LOCK TABLES `csvp_customer_entity_varchar` WRITE;
/*!40000 ALTER TABLE `csvp_customer_entity_varchar` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_customer_entity_varchar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_customer_form_attribute`
--

DROP TABLE IF EXISTS `csvp_customer_form_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_customer_form_attribute` (
  `form_code` varchar(32) NOT NULL COMMENT 'Form Code',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute Id',
  PRIMARY KEY (`form_code`,`attribute_id`),
  KEY `CSVP_CUSTOMER_FORM_ATTRIBUTE_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `CSVP_CSTR_FORM_ATTR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `csvp_eav_attribute` (`attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Form Attribute';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_customer_form_attribute`
--

LOCK TABLES `csvp_customer_form_attribute` WRITE;
/*!40000 ALTER TABLE `csvp_customer_form_attribute` DISABLE KEYS */;
INSERT INTO `csvp_customer_form_attribute` VALUES ('adminhtml_customer',1),('adminhtml_customer',3),('adminhtml_customer',4),('customer_account_create',4),('customer_account_edit',4),('adminhtml_customer',5),('customer_account_create',5),('customer_account_edit',5),('adminhtml_customer',6),('customer_account_create',6),('customer_account_edit',6),('adminhtml_customer',7),('customer_account_create',7),('customer_account_edit',7),('adminhtml_customer',8),('customer_account_create',8),('customer_account_edit',8),('adminhtml_checkout',9),('adminhtml_customer',9),('customer_account_create',9),('customer_account_edit',9),('adminhtml_checkout',10),('adminhtml_customer',10),('adminhtml_checkout',11),('adminhtml_customer',11),('customer_account_create',11),('customer_account_edit',11),('adminhtml_checkout',17),('adminhtml_customer',17),('customer_account_create',17),('customer_account_edit',17),('adminhtml_customer',19),('customer_account_create',19),('customer_account_edit',19),('adminhtml_checkout',20),('adminhtml_customer',20),('customer_account_create',20),('customer_account_edit',20),('adminhtml_customer',21),('adminhtml_customer_address',22),('customer_address_edit',22),('customer_register_address',22),('adminhtml_customer_address',23),('customer_address_edit',23),('customer_register_address',23),('adminhtml_customer_address',24),('customer_address_edit',24),('customer_register_address',24),('adminhtml_customer_address',25),('customer_address_edit',25),('customer_register_address',25),('adminhtml_customer_address',26),('customer_address_edit',26),('customer_register_address',26),('adminhtml_customer_address',27),('customer_address_edit',27),('customer_register_address',27),('adminhtml_customer_address',28),('customer_address_edit',28),('customer_register_address',28),('adminhtml_customer_address',29),('customer_address_edit',29),('customer_register_address',29),('adminhtml_customer_address',30),('customer_address_edit',30),('customer_register_address',30),('adminhtml_customer_address',31),('customer_address_edit',31),('customer_register_address',31),('adminhtml_customer_address',32),('customer_address_edit',32),('customer_register_address',32),('adminhtml_customer_address',33),('customer_address_edit',33),('customer_register_address',33),('adminhtml_customer_address',34),('customer_address_edit',34),('customer_register_address',34),('adminhtml_customer_address',35),('customer_address_edit',35),('customer_register_address',35),('adminhtml_customer_address',36),('customer_address_edit',36),('customer_register_address',36);
/*!40000 ALTER TABLE `csvp_customer_form_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_customer_grid_flat`
--

DROP TABLE IF EXISTS `csvp_customer_grid_flat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_customer_grid_flat` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `name` text COMMENT 'Name',
  `email` varchar(255) DEFAULT NULL COMMENT 'Email',
  `group_id` int(11) DEFAULT NULL COMMENT 'Group_id',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created_at',
  `website_id` int(11) DEFAULT NULL COMMENT 'Website_id',
  `confirmation` varchar(255) DEFAULT NULL COMMENT 'Confirmation',
  `created_in` text COMMENT 'Created_in',
  `dob` date DEFAULT NULL COMMENT 'Dob',
  `gender` int(11) DEFAULT NULL COMMENT 'Gender',
  `taxvat` varchar(255) DEFAULT NULL COMMENT 'Taxvat',
  `lock_expires` timestamp NULL DEFAULT NULL COMMENT 'Lock_expires',
  `shipping_full` text COMMENT 'Shipping_full',
  `billing_full` text COMMENT 'Billing_full',
  `billing_firstname` varchar(255) DEFAULT NULL COMMENT 'Billing_firstname',
  `billing_lastname` varchar(255) DEFAULT NULL COMMENT 'Billing_lastname',
  `billing_telephone` varchar(255) DEFAULT NULL COMMENT 'Billing_telephone',
  `billing_postcode` varchar(255) DEFAULT NULL COMMENT 'Billing_postcode',
  `billing_country_id` varchar(255) DEFAULT NULL COMMENT 'Billing_country_id',
  `billing_region` varchar(255) DEFAULT NULL COMMENT 'Billing_region',
  `billing_street` varchar(255) DEFAULT NULL COMMENT 'Billing_street',
  `billing_city` varchar(255) DEFAULT NULL COMMENT 'Billing_city',
  `billing_fax` varchar(255) DEFAULT NULL COMMENT 'Billing_fax',
  `billing_vat_id` varchar(255) DEFAULT NULL COMMENT 'Billing_vat_id',
  `billing_company` varchar(255) DEFAULT NULL COMMENT 'Billing_company',
  PRIMARY KEY (`entity_id`),
  KEY `CSVP_CUSTOMER_GRID_FLAT_GROUP_ID` (`group_id`),
  KEY `CSVP_CUSTOMER_GRID_FLAT_CREATED_AT` (`created_at`),
  KEY `CSVP_CUSTOMER_GRID_FLAT_WEBSITE_ID` (`website_id`),
  KEY `CSVP_CUSTOMER_GRID_FLAT_CONFIRMATION` (`confirmation`),
  KEY `CSVP_CUSTOMER_GRID_FLAT_DOB` (`dob`),
  KEY `CSVP_CUSTOMER_GRID_FLAT_GENDER` (`gender`),
  KEY `CSVP_CUSTOMER_GRID_FLAT_BILLING_COUNTRY_ID` (`billing_country_id`),
  FULLTEXT KEY `FTI_02983080455FB3BCECB6D3EB4ACC4A60` (`name`,`email`,`created_in`,`taxvat`,`shipping_full`,`billing_full`,`billing_firstname`,`billing_lastname`,`billing_telephone`,`billing_postcode`,`billing_region`,`billing_city`,`billing_fax`,`billing_company`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='csvp_customer_grid_flat';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_customer_grid_flat`
--

LOCK TABLES `csvp_customer_grid_flat` WRITE;
/*!40000 ALTER TABLE `csvp_customer_grid_flat` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_customer_grid_flat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_customer_group`
--

DROP TABLE IF EXISTS `csvp_customer_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_customer_group` (
  `customer_group_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_group_code` varchar(32) NOT NULL COMMENT 'Customer Group Code',
  `tax_class_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Tax Class Id',
  PRIMARY KEY (`customer_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Customer Group';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_customer_group`
--

LOCK TABLES `csvp_customer_group` WRITE;
/*!40000 ALTER TABLE `csvp_customer_group` DISABLE KEYS */;
INSERT INTO `csvp_customer_group` VALUES (0,'NOT LOGGED IN',3),(1,'General',3),(2,'Wholesale',3),(3,'Retailer',3);
/*!40000 ALTER TABLE `csvp_customer_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_customer_log`
--

DROP TABLE IF EXISTS `csvp_customer_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_customer_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Log ID',
  `customer_id` int(11) NOT NULL COMMENT 'Customer ID',
  `last_login_at` timestamp NULL DEFAULT NULL COMMENT 'Last Login Time',
  `last_logout_at` timestamp NULL DEFAULT NULL COMMENT 'Last Logout Time',
  PRIMARY KEY (`log_id`),
  UNIQUE KEY `CSVP_CUSTOMER_LOG_CUSTOMER_ID` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Log Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_customer_log`
--

LOCK TABLES `csvp_customer_log` WRITE;
/*!40000 ALTER TABLE `csvp_customer_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_customer_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_customer_visitor`
--

DROP TABLE IF EXISTS `csvp_customer_visitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_customer_visitor` (
  `visitor_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Visitor ID',
  `customer_id` int(11) DEFAULT NULL COMMENT 'Customer Id',
  `session_id` varchar(64) DEFAULT NULL COMMENT 'Session ID',
  `last_visit_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Last Visit Time',
  PRIMARY KEY (`visitor_id`),
  KEY `CSVP_CUSTOMER_VISITOR_CUSTOMER_ID` (`customer_id`),
  KEY `CSVP_CUSTOMER_VISITOR_LAST_VISIT_AT` (`last_visit_at`)
) ENGINE=InnoDB AUTO_INCREMENT=682 DEFAULT CHARSET=utf8 COMMENT='Visitor Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_customer_visitor`
--

LOCK TABLES `csvp_customer_visitor` WRITE;
/*!40000 ALTER TABLE `csvp_customer_visitor` DISABLE KEYS */;
INSERT INTO `csvp_customer_visitor` VALUES (1,NULL,'uhrcvd1nb367moe5adtboml5lb','2017-10-17 06:40:48'),(2,NULL,'g72ejut380gb196p34uvrdaj2u','2017-10-17 07:57:35'),(3,NULL,'hgb1abo02auhvfpfhlgp8p0rjm','2017-10-17 07:57:39'),(4,NULL,'8mkata5k6scpmvt77tsknb12ss','2017-10-17 07:57:39'),(5,NULL,'hhqp874ep2581n0pmuk3pekv3r','2017-10-17 11:57:13'),(6,NULL,'bo3fjka6c9943453n8g3kva9ok','2017-10-17 11:57:13'),(7,NULL,'lm48i1ppq1mg90r62g0osnpmii','2017-10-17 12:04:38'),(8,NULL,'d13dkk94hb1stf7hbkg1kpnmed','2017-10-17 12:29:33'),(9,NULL,'7gj3jgj908r0l2cmste90krqqs','2017-10-17 12:34:20'),(10,NULL,'gm4vak13kmjq7fl4733odthjf1','2017-10-17 14:10:31'),(11,NULL,'8srf2s8kmja14870nf7ki2100c','2017-10-17 14:14:26'),(12,NULL,'vhkst7vshpqf97nek1ssaen4et','2017-10-17 14:14:31'),(13,NULL,'mpmnd22oilq3fddv8oslp71dsp','2017-10-17 14:21:07'),(14,NULL,'f6oja5u2nogosbcsj50u4mu5mk','2017-10-18 05:53:17'),(15,NULL,'rr1t385t9gmcd88n88vqkr4ko7','2017-10-18 06:24:01'),(16,NULL,'f3battjah8a5lq3d29p596m6p3','2017-10-18 06:28:29'),(17,NULL,'crlocpb52m38np5skeke4lbldb','2017-10-18 06:28:30'),(18,NULL,'vmpq2ovqjgu8g7d2rv9c5ek4a5','2017-10-18 06:28:31'),(19,NULL,'afi0tndapra82cmc646avdk347','2017-10-18 06:28:31'),(20,NULL,'e3s27a3qid3n1l5jvvput0jb0u','2017-10-18 06:28:31'),(21,NULL,'sehio2mlr0tfcjpmfd6fq4q14u','2017-10-18 06:28:31'),(22,NULL,'3n5q7s1sv853cej3bmoa31tc2p','2017-10-18 06:28:31'),(23,NULL,'2bmleh7ad6b4vj53trh5lpfgej','2017-10-18 06:28:32'),(24,NULL,'arlug7t88nfb01v4mhbgt09o95','2017-10-18 06:28:32'),(25,NULL,'0s8gqj0rmvuuc0r825rdt01cd4','2017-10-18 06:28:32'),(26,NULL,'vhkge484v2df7i2r69fmtvdsc3','2017-10-18 06:28:32'),(27,NULL,'6df96botnde6ojvuem495di0uf','2017-10-18 06:28:32'),(28,NULL,'7lt57pekmh22ue1l8c6f3djmfi','2017-10-18 06:28:32'),(29,NULL,'vhi4qtj0sgrp9p0mnfrov2bvmp','2017-10-18 06:28:32'),(30,NULL,'h822q1jchnf7ed6bfrijdabs8p','2017-10-18 06:28:32'),(31,NULL,'da2fe8h2p6dtp814s19c2ioark','2017-10-18 06:28:32'),(32,NULL,'3d97dastd918meh0mgt7qac0lp','2017-10-18 06:28:32'),(33,NULL,'9fei2tjar680put1ldetdt6hob','2017-10-18 06:28:33'),(34,NULL,'3ndhrtscrvfqousiq999bfv5n5','2017-10-18 06:28:33'),(35,NULL,'h8sgqc0tkn4lc61t4b9rholv8t','2017-10-18 06:28:33'),(36,NULL,'k5tif9o71oru29lqf8abi03p8t','2017-10-18 06:28:33'),(37,NULL,'49j7djtc6rlh90m6kthhjvftio','2017-10-18 06:28:33'),(38,NULL,'grj9m0l4sioud0330mps3f8688','2017-10-18 06:28:33'),(39,NULL,'fil59dmq4q2qv8aercf9njlbq4','2017-10-18 06:28:33'),(40,NULL,'i4j8kjpkjm4bqt8et3d7mict9e','2017-10-18 06:28:33'),(41,NULL,'h27gko0j4cluecr26u6scku0fu','2017-10-18 06:28:33'),(42,NULL,'5mvedkvqvs4esnnios85298hus','2017-10-18 06:28:33'),(43,NULL,'e55tf6bk1o13742rtfrnvtj3pf','2017-10-18 06:28:33'),(44,NULL,'t05qjk6ue4uco7tm98670iji2q','2017-10-18 06:28:33'),(45,NULL,'402qajjvk273mco853hetifdhg','2017-10-18 06:28:34'),(46,NULL,'osd7bn8326cjsnqakst84o8s7i','2017-10-18 06:28:34'),(47,NULL,'j4ueu4eirfanmqufdvk608499q','2017-10-18 06:28:34'),(48,NULL,'s59bp8frtmbvi4kjptstvr86vq','2017-10-18 06:28:34'),(49,NULL,'q60s7j1aite4ilms2uef6p9a4e','2017-10-18 06:28:34'),(50,NULL,'0diur5g99a53j7s0b7c9ntjrtb','2017-10-18 06:28:34'),(51,NULL,'imekhj3o2ool7oe817nd72k887','2017-10-18 06:28:34'),(52,NULL,'q4rbods701l4n0e2mltsl6s8qp','2017-10-18 06:28:34'),(53,NULL,'hni7bq5u6q2votc40cgf0mjcnm','2017-10-18 06:28:34'),(54,NULL,'0k8fu4eml1fmkaui1vnio73d1l','2017-10-18 06:36:05'),(55,NULL,'cglvlus9mqrak5vubqle8mgnda','2017-10-18 06:36:06'),(56,NULL,'vh9j6v77k00ump0nlu5elnutiq','2017-10-18 06:36:07'),(57,NULL,'frqp4447e71s2eagp6lob04iaj','2017-10-18 06:36:07'),(58,NULL,'57skvaaehpkmt6nu77311kjp9p','2017-10-18 06:36:07'),(59,NULL,'22t0olr04e1bdp1dt83r2nu68e','2017-10-18 06:36:07'),(60,NULL,'amkcg7pda169v7co8biitqs6f5','2017-10-18 06:36:07'),(61,NULL,'5adv00ssfqttl2opd78ecrhtoa','2017-10-18 06:36:07'),(62,NULL,'6bj6neanamq2ogvn1chlj4cp43','2017-10-18 06:36:07'),(63,NULL,'6lf1c7bdr11sto0q5eefvde915','2017-10-18 06:36:07'),(64,NULL,'dkup5bc4mnae4ev0n77o0u0ilo','2017-10-18 06:36:07'),(65,NULL,'qm0eaoa4emq9u11j75jfpcmuiq','2017-10-18 06:36:08'),(66,NULL,'u31v4c28l6uhk8d5tpoqagrih6','2017-10-18 06:36:08'),(67,NULL,'2s3779qurskocul42a316qeqmm','2017-10-18 06:36:08'),(68,NULL,'phe5r1bvgp4bm78vvdalqg8kp3','2017-10-18 06:36:08'),(69,NULL,'gru9vmpmde6m1eno9drj8nr5rt','2017-10-18 06:36:08'),(70,NULL,'7ciete04gm0ampfh83u3joqp9b','2017-10-18 06:36:08'),(71,NULL,'ih4dth0j4leg4h14me98vokisd','2017-10-18 06:36:08'),(72,NULL,'5nuem7i9q2b2r84mo5g6rlgava','2017-10-18 06:36:08'),(73,NULL,'hslc84mqmrrosaeik0vd1c0oqm','2017-10-18 06:36:08'),(74,NULL,'v0si14mdmlf9rp2b6grdiu1ghm','2017-10-18 06:36:08'),(75,NULL,'ul7hbumvh7kldh2j6fjmof0c3g','2017-10-18 06:36:08'),(76,NULL,'9tripu0fj997a8pmifqilsncva','2017-10-18 06:36:09'),(77,NULL,'v6rc2mjjmh8hju8giu6cqg6ivm','2017-10-18 06:36:09'),(78,NULL,'t36i5k2mmn6rip7dpm8an3p95p','2017-10-18 06:36:09'),(79,NULL,'ipld43sc8rn9vbgc7e5jb05p54','2017-10-18 06:36:09'),(80,NULL,'ee50bs2tggd6to7b5hm16kgs8f','2017-10-18 06:36:09'),(81,NULL,'1mdrrjdluu2hrjk5ri7gqotmun','2017-10-18 06:36:09'),(82,NULL,'45p6b7b8vqct2e4i52hamnh7di','2017-10-18 06:36:09'),(83,NULL,'nls8gsgj5ct18mntqb4gkvvrvj','2017-10-18 06:36:09'),(84,NULL,'v5cpi470i7aou8a981sk9a39u7','2017-10-18 06:36:09'),(85,NULL,'lcnekpb76p2p6vvu1qesn5a3iu','2017-10-18 06:36:09'),(86,NULL,'acljt9n905or8k2hn4sbl6sjj8','2017-10-18 06:36:09'),(87,NULL,'5d9786qga3i1e3ho6c1s7qi9ke','2017-10-18 06:36:09'),(88,NULL,'kockbo4qvn6ccu2hlnuk942luf','2017-10-18 06:36:09'),(89,NULL,'141fbdi6k189a3ampj4i5i356i','2017-10-18 06:36:09'),(90,NULL,'m4g5vsn44tjtoe51389q9ld6bi','2017-10-18 06:36:09'),(91,NULL,'6ga4rtn8fckufvqs4a7o4fhrtt','2017-10-18 06:36:09'),(92,NULL,'nuq9n9ab6081079o615prkiq4c','2017-10-18 06:36:10'),(93,NULL,'5esddq0n0n19evoos8894cfg07','2017-10-18 06:36:10'),(94,NULL,'og8g1mvo4bsmmmip1g9v304752','2017-10-18 06:36:10'),(95,NULL,'neai1obo45j51oh7v8bo6aessq','2017-10-18 06:36:10'),(96,NULL,'lh0i6535bsu5o544jh99fh7nuj','2017-10-18 06:36:10'),(97,NULL,'oet0r6pn5eh8obiffguojchtn2','2017-10-18 06:37:35'),(98,NULL,'sn98gi4johe73mpq8g8fqrugt4','2017-10-18 06:37:36'),(99,NULL,'6u18i8il8mtq13gj7ibnb18ivl','2017-10-18 06:37:37'),(100,NULL,'lp2h51c258v5lise0ftqe9njd8','2017-10-18 06:37:37'),(101,NULL,'n8tuttehmic2uc8m1egcelusca','2017-10-18 06:37:37'),(102,NULL,'4799a4je02fffvjh9i10utv21b','2017-10-18 06:37:37'),(103,NULL,'n6bsda8b5ee9h75kh0ljqf0vr0','2017-10-18 06:37:37'),(104,NULL,'61u1gj9jfg425jjq0g5sstqj3o','2017-10-18 06:37:37'),(105,NULL,'lu6vuinps19090po5bt7fagh53','2017-10-18 06:37:38'),(106,NULL,'96dd6hij4shada8bg3lppj5r8p','2017-10-18 06:37:38'),(107,NULL,'pp8vo5qupdj0mrne7jqv197d4a','2017-10-18 06:37:38'),(108,NULL,'o666r3446nspldlrbu5nfkes28','2017-10-18 06:37:38'),(109,NULL,'889dvevlhm91f6ckiqfhsodvhg','2017-10-18 06:37:38'),(110,NULL,'f1mcsnvqt2am4hth1apemqv0lk','2017-10-18 06:37:38'),(111,NULL,'c06ghqvv6pljc3ft5gee06kv8m','2017-10-18 06:37:38'),(112,NULL,'so3arjabk36jsddh6nnc3k876c','2017-10-18 06:37:38'),(113,NULL,'tee4k5du88q5v4gscb36o5bs6n','2017-10-18 06:37:38'),(114,NULL,'8huq3tok7htmk3g4mrem1m1ah1','2017-10-18 06:37:38'),(115,NULL,'n17s13hg4q7hq3a9ba1o8v3e74','2017-10-18 06:37:38'),(116,NULL,'erdn5rf1jbffmc7r2hbqs7lreg','2017-10-18 06:37:38'),(117,NULL,'b7bjsanl5s7duta0s6eq2kvj2g','2017-10-18 06:37:38'),(118,NULL,'dfd502jlgr94uhd9cf4dup87tf','2017-10-18 06:37:38'),(119,NULL,'6ua4o1sqoisq1c684ovh4ieoq8','2017-10-18 06:37:38'),(120,NULL,'emsboupt4i104trspsn80cftq0','2017-10-18 06:37:39'),(121,NULL,'uatjpr2egpvfe3nqebhf0r2gv2','2017-10-18 06:37:39'),(122,NULL,'8ffisujke3g4mp891bbt4ridng','2017-10-18 06:37:39'),(123,NULL,'le7da6j3nb4qdikh4j8vljlq5m','2017-10-18 06:37:39'),(124,NULL,'6oinnahveka3kjq8uil4g468k5','2017-10-18 06:37:39'),(125,NULL,'levs565bqd7c64i4ch6qplggdg','2017-10-18 06:37:39'),(126,NULL,'unpithub9vrhb7nag8dd5mc4q3','2017-10-18 06:37:39'),(127,NULL,'er3kmrhndkdk8tbmm1pocab10m','2017-10-18 06:37:39'),(128,NULL,'mb26rbvvs8gijm90n028demsc2','2017-10-18 06:37:39'),(129,NULL,'186n9533vavvoh2ig285cukn15','2017-10-18 06:37:39'),(130,NULL,'pjdlgcul84kfv25brenh617unc','2017-10-18 06:37:39'),(131,NULL,'o45aifevnb1el7t22sf65qmpkl','2017-10-18 06:37:39'),(132,NULL,'97ubt9392usn6kaf1589ss0p1r','2017-10-18 06:37:39'),(133,NULL,'87spmo2crgin3prg1b67fo9fhg','2017-10-18 06:37:39'),(134,NULL,'76891h88h8t7g8ad1h9nofe4qh','2017-10-18 06:37:39'),(135,NULL,'kbk8bhv8octb4mp8mamcut1ebj','2017-10-18 06:37:39'),(136,NULL,'7484lp2lfcghfgd2ac7v2l42k6','2017-10-18 06:37:39'),(137,NULL,'a46kjp2kdp8ems219j8ps9klt2','2017-10-18 06:37:39'),(138,NULL,'upc1uj99oel7oq1f7vvg194qtn','2017-10-18 06:37:39'),(139,NULL,'88gd10dhk82fi50mfp1t1pvi0s','2017-10-18 06:37:40'),(140,NULL,'kv4of84t87jl724epoo3pnrbuq','2017-10-18 06:41:52'),(141,NULL,'4pv1l431scaptrcvmn7ept777e','2017-10-18 06:41:53'),(142,NULL,'jh1p1a73hkfa49amn5f9kgm077','2017-10-18 06:41:54'),(143,NULL,'0lbcel6gb8tru2gp79ek4p361p','2017-10-18 06:41:54'),(144,NULL,'ubmqgs968po1oqrr2r760t48fl','2017-10-18 06:41:54'),(145,NULL,'55n843jn42atsg1u72kepcg7r0','2017-10-18 06:41:54'),(146,NULL,'be2ng2kt1ijln7r0tupbg4l8c8','2017-10-18 06:41:54'),(147,NULL,'ntitrg1di6habamfhcfncbpkh5','2017-10-18 06:41:54'),(148,NULL,'u1mc73vgqre323jr3lqmm1puqf','2017-10-18 06:41:54'),(149,NULL,'09rrh117376dib66g7h3s8ohg4','2017-10-18 06:41:54'),(150,NULL,'62ejpkpacsubnk8r6ibjqio1tp','2017-10-18 06:41:54'),(151,NULL,'pt93knsurledqsq4d5r9lgjhc5','2017-10-18 06:41:54'),(152,NULL,'fe1fi5dl06538hfcgg9p0qmn77','2017-10-18 06:41:54'),(153,NULL,'p5o0a11c3qv2pe3ue44v2425hp','2017-10-18 06:41:54'),(154,NULL,'1r8h32oae3fdlfma5uvfpt1qv0','2017-10-18 06:41:55'),(155,NULL,'vok072va610og23q7gfm390e2o','2017-10-18 06:41:55'),(156,NULL,'v05d5km45fps3r5fckj8hleaqe','2017-10-18 06:41:55'),(157,NULL,'u8v6cf77uf4ina2rj6goom1c56','2017-10-18 06:41:56'),(158,NULL,'hjpcmu36dfquv12rk2qk4bpi4e','2017-10-18 06:41:56'),(159,NULL,'dbgfjmt12geeesos90auiqktsc','2017-10-18 06:41:56'),(160,NULL,'96sof65dlhpacqs7fg4kvd931p','2017-10-18 06:41:56'),(161,NULL,'7k3qc659iife8m8j5psnucqen5','2017-10-18 06:41:56'),(162,NULL,'nvc8ekgpkgde6402q3k67k3kgu','2017-10-18 06:41:56'),(163,NULL,'f6dvnl9epi7r47vcvobjt44ll6','2017-10-18 06:41:56'),(164,NULL,'4qpud17i24d302i36bj5fps9ne','2017-10-18 06:41:56'),(165,NULL,'b652gbgd1sab4jq39cevjpk2ua','2017-10-18 06:41:56'),(166,NULL,'cqrdj05hob0fabr1uuv0bom7bv','2017-10-18 06:41:56'),(167,NULL,'e1g8ppo9g26og5eaae12k0kshi','2017-10-18 06:41:56'),(168,NULL,'1js7peepmkhlh7sdavmq17u235','2017-10-18 06:41:57'),(169,NULL,'j6mv9tqnt1uf4gs7k34a2suahb','2017-10-18 06:41:57'),(170,NULL,'3ftkcmsn83i1tk89mdns7pi428','2017-10-18 06:41:57'),(171,NULL,'lqasm96s119plgmetuffuujmtf','2017-10-18 06:41:57'),(172,NULL,'0n0pp5dvqig44dcq6806j8kmqp','2017-10-18 06:41:57'),(173,NULL,'pp7a3fo1pikkmqnndriam3rnh1','2017-10-18 06:41:57'),(174,NULL,'pe2meoj7baf351ot1de75033m0','2017-10-18 06:41:57'),(175,NULL,'eclfjqokohep6ojt1spdr24isk','2017-10-18 06:41:57'),(176,NULL,'hm881uc42ujakcea6rgr74dsri','2017-10-18 06:41:57'),(177,NULL,'r896psr6rot6q67kpkqjjj8s00','2017-10-18 06:41:57'),(178,NULL,'a36rmv2t2b0cufh1tjd75vg5c8','2017-10-18 06:41:57'),(179,NULL,'9tiqtasv91a3utu0aect0sfs9o','2017-10-18 06:41:57'),(180,NULL,'elnivj8pre9sm2bsfehnc64ane','2017-10-18 06:41:57'),(181,NULL,'vcb6k1en320rtlvmkql4acktct','2017-10-18 06:41:57'),(182,NULL,'hisvaf5c2nqlbvnr3rop5a54te','2017-10-18 06:41:58'),(183,NULL,'r2hkbl4q9pjjqp845o35q6iv7g','2017-10-18 06:43:09'),(184,NULL,'qa0gmmj89r6ca47abqvnavi77e','2017-10-18 06:43:10'),(185,NULL,'q2ku9th3ho412ph6g5flr9qu80','2017-10-18 06:43:10'),(186,NULL,'0vujbkp09vkp9jebn7d5u7d9en','2017-10-18 06:43:10'),(187,NULL,'ok9tvn9b2sfgs3ojtf22iu6q3r','2017-10-18 06:43:11'),(188,NULL,'qfvustl90voeifc09pn2e1h18d','2017-10-18 06:43:11'),(189,NULL,'0qeclm18ms3fgc5k7ar00d3aq3','2017-10-18 06:43:11'),(190,NULL,'1vmpslhqlmdqmtts5bn8kljrpt','2017-10-18 06:43:11'),(191,NULL,'jjf1n98k4q6ta9q7t3hb4b1ct4','2017-10-18 06:43:11'),(192,NULL,'v9p4gtsbhuu119obvn2mha4e22','2017-10-18 06:43:11'),(193,NULL,'93qnc5hu0jcvta6gsvkk4ob68e','2017-10-18 06:43:11'),(194,NULL,'ak7bljo8s94f6iuouuddf79oj4','2017-10-18 06:43:11'),(195,NULL,'pfbp1t2r5pppmu28s9lc2476gr','2017-10-18 06:43:11'),(196,NULL,'ddiomn20uagbca05lh3bcsob2a','2017-10-18 06:43:11'),(197,NULL,'88gafn9s1u1ir7ldp8oqq8f5jr','2017-10-18 06:43:11'),(198,NULL,'01imervsh4pjahhm6mon145rnk','2017-10-18 06:43:11'),(199,NULL,'s5fahh35bqlt4nk8qg3ckn6sv2','2017-10-18 06:43:11'),(200,NULL,'vvv3sm1lir4pekphecrbc09u3b','2017-10-18 06:43:11'),(201,NULL,'148d6ooe8lrr7pblre7kdsouo2','2017-10-18 06:43:11'),(202,NULL,'59p8lpbr7s2es0j2tkteo5qihl','2017-10-18 06:43:12'),(203,NULL,'g20noe2j333pdqt0q2c8e4ithf','2017-10-18 06:43:12'),(204,NULL,'lgeirk6vrserv5qlf20p2a1j5f','2017-10-18 06:43:12'),(205,NULL,'qtcfus7la4vl8a6no1vrdcbjr0','2017-10-18 06:43:12'),(206,NULL,'27n2qk9j80mv6k49mueaqkr21p','2017-10-18 06:43:12'),(207,NULL,'rrh33tfdubohmi091e0i64spi1','2017-10-18 06:43:12'),(208,NULL,'48kndva61kipk2dc6v7iknol78','2017-10-18 06:43:12'),(209,NULL,'3jcmr33o17u9ksu7hmuf6ssmhm','2017-10-18 06:43:12'),(210,NULL,'b7a7buaq0fb224bf15upa9ma3i','2017-10-18 06:43:12'),(211,NULL,'rtl6i9fugvm3sb2ngeqm86q9mo','2017-10-18 06:43:12'),(212,NULL,'i0hoq4kv64bgqrl7tsa6grtpgi','2017-10-18 06:43:12'),(213,NULL,'0h3qte6cs42jckk3dts5gfd75i','2017-10-18 06:43:12'),(214,NULL,'2kfhq921i699naqc2rdehg30b1','2017-10-18 06:43:13'),(215,NULL,'l8qdi0krqfgl8bbdc61qsilidr','2017-10-18 06:43:13'),(216,NULL,'e2nsm4rvopcu12ssmkd48ok9fp','2017-10-18 06:43:13'),(217,NULL,'e5eq5bqv4cgum0s4lrstbvhmqa','2017-10-18 06:43:13'),(218,NULL,'j5qfafcfqvesj4f591o1mim0ii','2017-10-18 06:43:13'),(219,NULL,'gjrh05bt74d7g8g0gmn7c5pn6j','2017-10-18 06:43:13'),(220,NULL,'vvt1q8bd08h7jgt6hnhhldcaeu','2017-10-18 06:43:13'),(221,NULL,'dli1cng90qn6j7e1op0q7jqe2v','2017-10-18 06:43:13'),(222,NULL,'eqbc3ap959l6tbf03c6gqtnsd0','2017-10-18 06:43:13'),(223,NULL,'ee9u5rfnq6j7er00m28ea2t7fg','2017-10-18 06:43:13'),(224,NULL,'q2jq6mvehb3c0b8t01j1l7iftq','2017-10-18 06:43:13'),(225,NULL,'frq5mnjj9amm6mbb3p3de1u184','2017-10-18 06:43:13'),(226,NULL,'lfssl1kbk46jnsf5sel518q7qv','2017-10-18 06:44:14'),(227,NULL,'llbepqik4mk4n0mc6kqn1meqdf','2017-10-18 06:44:15'),(228,NULL,'0cpbcv4rcoc6hktdstsqvnrgj9','2017-10-18 06:44:15'),(229,NULL,'5h7st3gbitessgnvn8qcm9q7lf','2017-10-18 06:44:15'),(230,NULL,'93daamjkcfqspu17kq1nbk6o4s','2017-10-18 06:44:15'),(231,NULL,'56tctnddfef39e85nc8jhci86i','2017-10-18 06:44:15'),(232,NULL,'7s67eg4cg23iir7psgde95dpsf','2017-10-18 06:44:15'),(233,NULL,'h798gqee0nqk7hhhgu7s3qcj0s','2017-10-18 06:44:15'),(234,NULL,'1ohtlea7nrc3ag5jmt2ort8afi','2017-10-18 06:44:15'),(235,NULL,'7lretjcqo3a2pos31uiu9ns3dv','2017-10-18 06:44:15'),(236,NULL,'pl7n3rkesnh06at61ap07f2m5s','2017-10-18 06:44:15'),(237,NULL,'fgi60dsjtbg76vspiiort5m8lp','2017-10-18 06:44:15'),(238,NULL,'q7u3lghgilg3tkbpa7nprfvhm0','2017-10-18 06:44:16'),(239,NULL,'p0q04vips4vs5cggds8p0eivpg','2017-10-18 06:44:16'),(240,NULL,'auolgrp12n7b6co1duthrn587o','2017-10-18 06:44:16'),(241,NULL,'fogfs3jess25qn5l4d5d5kd4fp','2017-10-18 06:44:16'),(242,NULL,'tepsadgjvqcrb2r52rj37pdkn2','2017-10-18 06:44:16'),(243,NULL,'hhnc3pupecfipcj2om2ofhmhcc','2017-10-18 06:44:16'),(244,NULL,'4st9ipg7ndorvfj0pu2f9pn4c7','2017-10-18 06:44:16'),(245,NULL,'htv1qivd0nfea4mmr9aukullek','2017-10-18 06:44:16'),(246,NULL,'10680aevnkm9af07v2cutm0m7a','2017-10-18 06:44:16'),(247,NULL,'03nnrgtpj5k77uq2si0tr0sc7n','2017-10-18 06:44:17'),(248,NULL,'4kdukh5ieib0gdubddcu5if14p','2017-10-18 06:44:17'),(249,NULL,'6n8jgm945alklle6cdkafd6s55','2017-10-18 06:44:17'),(250,NULL,'276493s7otjshb2g97v45gbsru','2017-10-18 06:44:17'),(251,NULL,'ltmih8988dmbt19lls1slua328','2017-10-18 06:44:17'),(252,NULL,'38fnogniikbv26p0ktn4jpd623','2017-10-18 06:44:17'),(253,NULL,'kn66rbvrpq2i27250fu9vhijco','2017-10-18 06:44:17'),(254,NULL,'ktdhrl2jm9sacpgneguirgqocp','2017-10-18 06:44:17'),(255,NULL,'7d0igpjlv65d5te81pipmib00k','2017-10-18 06:44:17'),(256,NULL,'11q6sv7kd98dtfaf9los880sck','2017-10-18 06:44:17'),(257,NULL,'7puggeq8c305v5b82ioscfdtg3','2017-10-18 06:44:17'),(258,NULL,'hnbauhsjdbqcdfpitrkb22h4oo','2017-10-18 06:44:18'),(259,NULL,'m3n85uqafqj5p8bj8v01e46f6c','2017-10-18 06:44:18'),(260,NULL,'lo1r712sq720k4584r7jd1v9nv','2017-10-18 06:44:18'),(261,NULL,'ukd2desiia0ij1pdhv5luvprbl','2017-10-18 06:44:18'),(262,NULL,'1pgmfc2i196s82ae55o5tkkn6q','2017-10-18 06:44:18'),(263,NULL,'ep6muu747d6qq7g8bsdkbj2qps','2017-10-18 06:44:18'),(264,NULL,'k8t8id2k3gafsbk4jvr2m4args','2017-10-18 06:44:18'),(265,NULL,'hpj2a7cpskiftbjhl160u3a664','2017-10-18 06:44:18'),(266,NULL,'g4oajderb28kmreasua4b9ma1r','2017-10-18 06:44:18'),(267,NULL,'6fsljalisj4v2hvcipnj2und36','2017-10-18 06:44:18'),(268,NULL,'dtjptud18gpi8dgkuk3li1rt43','2017-10-18 06:44:18'),(269,NULL,'59p2gntgiup7oomprmf3ucd01e','2017-10-18 06:47:49'),(270,NULL,'cnch5nlulv0otnjk4av3n1q8v3','2017-10-18 06:47:49'),(271,NULL,'jb29a9iic5efsn59dr3sviougb','2017-10-18 06:47:50'),(272,NULL,'igfa22g8hgk7qhp33mtlb4chdv','2017-10-18 06:47:50'),(273,NULL,'2old2ad4g20re6rmu7dd8hh6c3','2017-10-18 06:47:50'),(274,NULL,'qlk2sdsqq95g75ek27fi9fvn5e','2017-10-18 06:47:50'),(275,NULL,'46kkiiqt4qeu860sdhleffuisg','2017-10-18 06:47:53'),(276,NULL,'7aihbqvks0o3l2ekj7fhm8v95o','2017-10-18 06:47:53'),(277,NULL,'i614c87lp49vd700tl2ukv7185','2017-10-18 06:47:53'),(278,NULL,'b2prvdmsjqe9tnu4reia6hefcq','2017-10-18 06:47:53'),(279,NULL,'euei28o4rfilfi4rrqkmohe0kr','2017-10-18 06:47:53'),(280,NULL,'17cptj4ovbnrf2rks8hs9if7sf','2017-10-18 06:49:18'),(281,NULL,'n4kuu9pt17htv4ugkikdgghgnh','2017-10-18 06:49:19'),(282,NULL,'t1jsfgplk88uod1sot093vq9vp','2017-10-18 06:49:19'),(283,NULL,'bjrr8uecvjpl2106bc2n7l72bv','2017-10-18 06:49:19'),(284,NULL,'kbcid3hh2crbefp7p5fom2he20','2017-10-18 06:49:19'),(285,NULL,'fodh7ku3kr0est4m10mgqi661u','2017-10-18 06:49:19'),(286,NULL,'n3pdclli3u3f8fd5i7hpbtbts7','2017-10-18 06:49:20'),(287,NULL,'g87vc2g971c2gpvjt5ma4vn86s','2017-10-18 06:49:20'),(288,NULL,'p631s1rbi27gncqv5mdai19ukt','2017-10-18 06:49:20'),(289,NULL,'0ic035fkf684ps548n34dvaqsb','2017-10-18 06:49:20'),(290,NULL,'8oc5ik9j0edddbqjcoh2dtt0lm','2017-10-18 06:49:20'),(291,NULL,'3rml2vk1kmgetdt75aemppacvt','2017-10-18 06:51:01'),(292,NULL,'5ak8vo53oo36au8p74srhqssl8','2017-10-18 06:51:01'),(293,NULL,'vvkslvveu4eabqqmvitnrnt91j','2017-10-18 06:51:01'),(294,NULL,'31gq8oksajklg2usea5ecu4vtb','2017-10-18 06:51:02'),(295,NULL,'edmrflfakvm2j2u0pjcbrje1fc','2017-10-18 06:51:02'),(296,NULL,'eamecrra938hrags678bv9kcl8','2017-10-18 06:51:02'),(297,NULL,'3nrrksqh5p2l9hmutromni3ncf','2017-10-18 06:51:02'),(298,NULL,'ihe12m9rjr2piktvip1ej214d0','2017-10-18 06:51:02'),(299,NULL,'hiev0helbq84i5qafhu9lhrecc','2017-10-18 06:51:02'),(300,NULL,'n6utgke5sr4j51fo8p7r534e08','2017-10-18 06:51:03'),(301,NULL,'48h1d5ml8lbosp1gcdaep7jmga','2017-10-18 06:51:03'),(302,NULL,'nfhr7pvd1hgfbkiomoe6btjb37','2017-10-18 06:51:56'),(303,NULL,'5rff2b01lk1il8s3or38p0begs','2017-10-18 06:51:56'),(304,NULL,'tp7re8efnk862olkhkb6sikia4','2017-10-18 06:51:57'),(305,NULL,'ec3mjrft8t24fbhcsbccv806kt','2017-10-18 06:51:57'),(306,NULL,'t7ra80vv9cg62ochtjp7fm75g2','2017-10-18 06:51:57'),(307,NULL,'qh1qmv0v734kkjq6i97i2e2dcq','2017-10-18 06:51:57'),(308,NULL,'ploeem86svjvtciv2jbcrm1d6i','2017-10-18 06:51:57'),(309,NULL,'d783k6ofvli071bbq1jiev3plc','2017-10-18 06:57:13'),(310,NULL,'odk9o08qmsbicsvj8q6vvdob26','2017-10-18 06:57:17'),(311,NULL,'a6fs3mdp5ajj6gie8s63m8bsbb','2017-10-18 06:57:17'),(312,NULL,'p1i9eaddmh7ab7785n233rq48f','2017-10-18 06:57:17'),(313,NULL,'efe55n33mqq0llgi01f2l02jit','2017-10-18 06:57:17'),(314,NULL,'u7c1co99ml8d5aeou50i77pnjg','2017-10-18 06:57:18'),(315,NULL,'gi5emf6835ch28o30tarb50v5k','2017-10-18 06:57:18'),(316,NULL,'mso3isjaiae182noi531inotar','2017-10-18 06:59:25'),(317,NULL,'pe0a724qkce09r3f16ok44tsbl','2017-10-18 06:59:26'),(318,NULL,'to9vabgq3h96ovdib1eq9pgvn9','2017-10-18 06:59:26'),(319,NULL,'bu1kkgfa5atm9nm5inqg160uou','2017-10-18 06:59:26'),(320,NULL,'9v0kg8o15e59ni039m7q0fctqv','2017-10-18 06:59:26'),(321,NULL,'oqa4cfjkr3vr6n4oqugf4iouka','2017-10-18 06:59:26'),(322,NULL,'895f9jl5rrvemma6cqvajeku76','2017-10-18 06:59:27'),(323,NULL,'4jsq7m8pqd846qtdbajglltn0p','2017-10-18 07:02:29'),(324,NULL,'n13t31mmleud24802vdmf1j1ei','2017-10-18 07:02:34'),(325,NULL,'ufga46f77t3g998h95cbmeq09n','2017-10-18 07:02:35'),(326,NULL,'24un4218c71cnr728tuc9e7pvn','2017-10-18 07:02:35'),(327,NULL,'d6cldgoembtq142trcgth07fce','2017-10-18 07:02:35'),(328,NULL,'6rdd9ek55q49neouncjm3v8jl3','2017-10-18 07:02:35'),(329,NULL,'7qao824sp0jg944pr16jlq68oe','2017-10-18 07:02:36'),(330,NULL,'nuqepjpmqq7m7ms00926rdac7k','2017-10-18 08:57:00'),(331,NULL,'4596cairfejrib7cm2dh16011s','2017-10-18 08:57:02'),(332,NULL,'at6t95d7tpp1smqgl5om0nggid','2017-10-18 08:57:02'),(333,NULL,'bt2vdm4k6uibpkt4tkv2rphrpm','2017-10-18 08:57:02'),(334,NULL,'rb175dn9stqhj5v5up97arrt31','2017-10-18 08:57:02'),(335,NULL,'g23fgkavc5p9mn2s8q8n5scepl','2017-10-18 08:57:02'),(336,NULL,'99nsehhkl3k6j679je5it2ueoa','2017-10-18 08:57:02'),(337,NULL,'dlkto8vna65s2cujho7apf3iot','2017-10-18 08:57:55'),(338,NULL,'6oum31p2sk4mnmr82kme1o3k2k','2017-10-18 08:57:55'),(339,NULL,'6it2la9500kpi4nnm1aha800jj','2017-10-18 08:57:55'),(340,NULL,'elie5rtsmpmonr27om15roc7po','2017-10-18 08:57:55'),(341,NULL,'nqb5bok5ok3euuhbmpm8a65se0','2017-10-18 08:57:55'),(342,NULL,'1qvvfhdpk0hhnrglf54aflccae','2017-10-18 08:57:56'),(343,NULL,'f5ffsuf9jvukjte76avnqt30e0','2017-10-18 08:57:56'),(344,NULL,'5d2psvhld85g4q7sfhjmavu1mi','2017-10-18 08:59:32'),(345,NULL,'tsnphcsfff9m0a7fjdrrnd6evd','2017-10-18 08:59:32'),(346,NULL,'4ge9ik94pn4oqoctttu6cfb50r','2017-10-18 08:59:32'),(347,NULL,'ncpie93uirinfqucbtq6ee86l1','2017-10-18 08:59:32'),(348,NULL,'4uvft4h42m9bnb4gvfoese5cak','2017-10-18 08:59:32'),(349,NULL,'uqk2u8jtasebi43mbqe319jm7v','2017-10-18 08:59:32'),(350,NULL,'v3hg7i5rv4lkb5sftvh74dss2s','2017-10-18 08:59:33'),(351,NULL,'qt7kjrjg2rgrlm2b1undjs7ehg','2017-10-18 09:00:57'),(352,NULL,'pe3righ749ivj53ekssenjau2u','2017-10-18 09:00:57'),(353,NULL,'t8icijdcs9bh6l55jkot4rl18b','2017-10-18 09:00:57'),(354,NULL,'a7817co2lubkq7f7939iqo48ok','2017-10-18 09:00:57'),(355,NULL,'qg2m1n4rfd36kicpeoo9gnogai','2017-10-18 09:00:57'),(356,NULL,'8v9idg6i98hvil64u2fosvfak3','2017-10-18 09:00:58'),(357,NULL,'kbq9l8097bdul2gujs80clbnje','2017-10-18 09:00:58'),(358,NULL,'dog41bn2ikdhu7uu4k1u7kmkf4','2017-10-18 09:04:59'),(359,NULL,'rtm07edf5hks1outhc65tlgakt','2017-10-18 09:05:00'),(360,NULL,'qgj56qkjitllub7a6k8vsl66ri','2017-10-18 09:05:00'),(361,NULL,'q05kh7k1beuslrgoe3gqrme2f8','2017-10-18 09:05:00'),(362,NULL,'70iiibfjpde4h6t5e317kh0g6q','2017-10-18 09:05:01'),(363,NULL,'8g0v66p4hkjlrj4taos0qhdad5','2017-10-18 09:05:01'),(364,NULL,'vnhrlm156qgp29098ar06s0806','2017-10-18 09:05:01'),(365,NULL,'q5dkeaa4ehugon6h3im2h3p28c','2017-10-18 09:05:40'),(366,NULL,'s9gsv92imqd9jngt59snuei5lj','2017-10-18 09:05:41'),(367,NULL,'rl1g0gog3steqdm4pvbku5stfo','2017-10-18 09:05:41'),(368,NULL,'gjjgu1hfpcsqic213d4lq9ju3i','2017-10-18 09:05:41'),(369,NULL,'6qjneop4q7a0vaq0sb4jqg1qt1','2017-10-18 09:05:41'),(370,NULL,'hj6vhv2no69a7jh5vufvq2mf8s','2017-10-18 09:05:41'),(371,NULL,'o1gr30l2i7uc83o7c0h48me1l7','2017-10-18 09:05:41'),(372,NULL,'143n1h9djfa22l45mqt5h9i5si','2017-10-18 09:06:13'),(373,NULL,'sgjrej1e6fs28c5mqscnqjstn0','2017-10-18 09:06:13'),(374,NULL,'hjeruumj9h46ceoeov4k6tmet8','2017-10-18 09:06:13'),(375,NULL,'she82so95hpknvt24cdl1t1h92','2017-10-18 09:06:14'),(376,NULL,'sof5nr5167mu8rg4h8k5q37ugd','2017-10-18 09:06:14'),(377,NULL,'unhn9u0hlvtgjkasm7a8h46glu','2017-10-18 09:06:14'),(378,NULL,'kmp36hrs05a40jnvkmai0lcag9','2017-10-18 09:06:14'),(379,NULL,'hlfqo6pghur9fflnrdrmki92kg','2017-10-18 09:08:21'),(380,NULL,'7uc95ippga7rq71dibeu79pdcu','2017-10-18 09:08:21'),(381,NULL,'obatfjapua0t08mh7h9o8dt9b9','2017-10-18 09:08:21'),(382,NULL,'lq0la8su0360k202enn8icvpfj','2017-10-18 09:08:21'),(383,NULL,'76jl2qk99epl5le2jpl01i4042','2017-10-18 09:08:21'),(384,NULL,'apjaveafql0h0dvgoabn9ii2ev','2017-10-18 09:08:21'),(385,NULL,'mugcs9c1oc9oq49pu47mi7m8c0','2017-10-18 09:08:22'),(386,NULL,'g3rt5uo1vt786raii7qolkvgg3','2017-10-18 09:11:49'),(387,NULL,'e69pji3go71t8rph4d658k52r6','2017-10-18 09:11:49'),(388,NULL,'d2kc25v8hdmll5597aicgapko9','2017-10-18 09:11:50'),(389,NULL,'560didua9eju3aq7otc4997flk','2017-10-18 09:11:50'),(390,NULL,'gp7l6fvb5037lq8oh7f18kfit3','2017-10-18 09:11:50'),(391,NULL,'oi7v5mns3ac2gju058lgjvp0k5','2017-10-18 09:11:50'),(392,NULL,'75032irgf30ufuf0pk6ueccm2m','2017-10-18 09:11:50'),(393,NULL,'v5v4b5re8tlike07c1550vr8sr','2017-10-18 09:15:01'),(394,NULL,'5m33tb98turnt0si9ljke0ncpv','2017-10-18 09:15:01'),(395,NULL,'e5uc5602qqojmgemqm0cs9pmus','2017-10-18 09:15:01'),(396,NULL,'knagi55ri6flmnn8habq6holjg','2017-10-18 09:15:01'),(397,NULL,'1cpvj300begr1g3nmojh4kfh4p','2017-10-18 09:15:02'),(398,NULL,'d738m65l2iqhqk2n8cjh8vfqqg','2017-10-18 09:15:02'),(399,NULL,'gdiva7ro34k3mbo3j201ordfe9','2017-10-18 09:16:49'),(400,NULL,'vfa6sdlfqcpl7phmusru7sekt1','2017-10-18 09:16:50'),(401,NULL,'napa36ti7h6qn4t74r41stfe00','2017-10-18 09:16:50'),(402,NULL,'p68l27r7e54briacgv0pclbb2o','2017-10-18 09:16:50'),(403,NULL,'ni21kh0ahq5jkkkuiddvh0l51t','2017-10-18 09:16:50'),(404,NULL,'esri8g0fhlpu62hmcja1dpjc2b','2017-10-18 09:16:51'),(405,NULL,'fcbfti0l9k99fqm7604g4qfg1u','2017-10-18 09:17:08'),(406,NULL,'3salm85fvpopftjlha30uubv15','2017-10-18 09:17:08'),(407,NULL,'9974rru9iv1le1jcoiqdd90cmu','2017-10-18 09:17:09'),(408,NULL,'dbjict9o672iduk6r1edh9s2po','2017-10-18 09:17:09'),(409,NULL,'2g47b4af41phijg92cnk6lht1v','2017-10-18 09:17:09'),(410,NULL,'ojojhpgeaka4lmlabmd2oi27qv','2017-10-18 09:17:09'),(411,NULL,'2vt4luis3pjhnin2skvul7gq68','2017-10-18 09:18:25'),(412,NULL,'s2f4tdggrf31uhrovllv67ef4r','2017-10-18 09:18:26'),(413,NULL,'id41e3saah55u8c81ts1um16cj','2017-10-18 09:18:26'),(414,NULL,'lkev5vojln3ngjh4tk6o63cd6q','2017-10-18 09:18:26'),(415,NULL,'ncm6ajp8udv7o4eqseve5c1ktl','2017-10-18 09:18:26'),(416,NULL,'hkc8b7352ebu6b6s8829krncu6','2017-10-18 09:18:26'),(417,NULL,'bhkhiu0971uru2nnf3nnqd3ots','2017-10-18 09:19:49'),(418,NULL,'64ssd0phgpsch3oqo8delgh04h','2017-10-18 10:31:35'),(419,NULL,'sot70caa1p65llqhjepn1t4eb3','2017-10-18 10:31:36'),(420,NULL,'r0thv2klfhrndgngrc8qm36ejt','2017-10-18 10:31:36'),(421,NULL,'ssufdvf1j2lmabelqgu6sh08lh','2017-10-18 10:31:36'),(422,NULL,'8l5sd45u4vvpo0tqedktu5o6l5','2017-10-18 10:31:36'),(423,NULL,'5enq1ba89n7ok7oc59h5vp893l','2017-10-18 10:31:36'),(424,NULL,'hi9hrh1gn6kh6lvc7db6vc20mt','2017-10-18 10:34:15'),(425,NULL,'ptrk3h8q4esph0iiu7tth1kka5','2017-10-18 10:34:16'),(426,NULL,'omqnvu4no1d44lgkj7acno6p1c','2017-10-18 10:34:16'),(427,NULL,'02540il808i2podsk8a58eg7bj','2017-10-18 10:34:16'),(428,NULL,'e8qeptvtupbbb2d93a01tstrnk','2017-10-18 10:34:16'),(429,NULL,'fsunejdnekg6tgb76nh5gdca5p','2017-10-18 10:34:16'),(430,NULL,'j6egk67dkvogd9m2cm875skp0r','2017-10-18 10:35:27'),(431,NULL,'o0r2dce5p9p9mhrb7dpisof43f','2017-10-18 10:35:27'),(432,NULL,'ksqesnaie85qrr1j3hnav9r02j','2017-10-18 10:35:28'),(433,NULL,'3gklslfscouqoap4molfm6indk','2017-10-18 10:35:28'),(434,NULL,'loq93t625p7u9bfuhlrna5is76','2017-10-18 10:35:28'),(435,NULL,'p4lqa5573bpbm3tg3oojq4n0du','2017-10-18 10:35:28'),(436,NULL,'f7eft20121q9gmui1np0fc5r7h','2017-10-18 10:36:00'),(437,NULL,'abic0p0krntudqddu7ps5urnj6','2017-10-18 10:36:00'),(438,NULL,'5vfvr6mrb126m02ndv1c69rbjg','2017-10-18 10:36:00'),(439,NULL,'rhqs1t36dmop6r3dp649qove62','2017-10-18 10:36:00'),(440,NULL,'jfdstbjq8j6vau8t64nhgvfgvs','2017-10-18 10:36:00'),(441,NULL,'t3p388q93d208l4r74oruii5n0','2017-10-18 10:36:00'),(442,NULL,'sarpjqtmkj7gb5iq1o6p3n595b','2017-10-18 10:36:11'),(443,NULL,'nl21oln3np927uk5098gp56p04','2017-10-18 10:36:12'),(444,NULL,'hfvrsjn2k9c272t15j7menfl88','2017-10-18 10:36:12'),(445,NULL,'s34hskac21qihi7lhtmq5erf2f','2017-10-18 10:36:12'),(446,NULL,'korgus1joop55l5qtoi5bi8ncr','2017-10-18 10:36:12'),(447,NULL,'jda5lsdjlliqo6rbkjer22o0lq','2017-10-18 10:36:12'),(448,NULL,'svioc8bsmpnush5101sbj5agkg','2017-10-18 10:36:24'),(449,NULL,'cqs1lsvg7hgane43017qlbvf8d','2017-10-18 10:36:25'),(450,NULL,'qjusrd8okhgk42l27h31eas5vh','2017-10-18 10:36:25'),(451,NULL,'4pdmrs42ksru0lco2t6nhaofrl','2017-10-18 10:36:25'),(452,NULL,'icp3pc487v9r3mibkgar54lpph','2017-10-18 10:36:25'),(453,NULL,'ajqhib0nencda3teet6nj4lft4','2017-10-18 10:36:25'),(454,NULL,'ckg284mfghmch6n38qt31rfr6h','2017-10-18 10:37:34'),(455,NULL,'njn6sg4icbah65jb8ffqhk6qbb','2017-10-18 10:37:34'),(456,NULL,'sjgld79s9m359n7abk8b0jcpje','2017-10-18 10:37:34'),(457,NULL,'681d944fomc6qirlm15nnurqu6','2017-10-18 10:37:34'),(458,NULL,'c59um03u0u348iv40uk5helb8e','2017-10-18 10:37:34'),(459,NULL,'nnhlg52i1tro9ncflma8o3thea','2017-10-18 10:37:34'),(460,NULL,'t89v0r7njkgfcukoltfa7jtqm4','2017-10-18 10:37:35'),(461,NULL,'oqt495m572nf2a4182qo8391fp','2017-10-18 10:38:51'),(462,NULL,'gk5t42brbkdh90d6nprmfdhpfe','2017-10-18 10:38:51'),(463,NULL,'81g3buorvesgp9i7pbh2psk2eg','2017-10-18 10:38:51'),(464,NULL,'5u87v677h6sn53f5511rifaib1','2017-10-18 10:38:52'),(465,NULL,'pda9rd9e8kn62idij5m8vl1aps','2017-10-18 10:38:52'),(466,NULL,'a86vnbp49vl6sui7sptkjrr1rt','2017-10-18 10:38:52'),(467,NULL,'fs7kpm85lc1es7edia1tm2kdj7','2017-10-18 10:39:16'),(468,NULL,'7ekq8jmeur7jv0djond6q3goqa','2017-10-18 10:39:16'),(469,NULL,'8vrv3ji6sba4gpc1rta5mofs9s','2017-10-18 10:39:16'),(470,NULL,'d8diomdgrdfcqs4j5fil9unihq','2017-10-18 10:39:16'),(471,NULL,'en6dbjq53m0s8rcbhppjrvsf0l','2017-10-18 10:39:17'),(472,NULL,'ik9esjmvst2b78rvtha5iq1aop','2017-10-18 10:39:17'),(473,NULL,'8ncelm6sblalghjhmgm7jtn125','2017-10-18 10:39:17'),(474,NULL,'c1scvk27a3h6sqnf93g7pag8o4','2017-10-18 10:40:27'),(475,NULL,'c1mctj5anqij20iu2s16v03fn7','2017-10-18 10:40:28'),(476,NULL,'pv11akinjfu6ip9fggvetu9flv','2017-10-18 10:40:28'),(477,NULL,'iaj793942rntgfo5u1l0t4nff0','2017-10-18 10:40:28'),(478,NULL,'kp1jff0qntbnm3qfip824fn55t','2017-10-18 10:40:28'),(479,NULL,'iseh7pfj7n94f3pc1ukbogpbhu','2017-10-18 10:40:28'),(480,NULL,'cg9uguept57kpo72gggdav20eh','2017-10-18 10:40:48'),(481,NULL,'8ug7rbq5gpcml63u2bfh13bldr','2017-10-18 10:40:48'),(482,NULL,'alfqmc92da2a7k35nfbkqeuh9k','2017-10-18 10:40:49'),(483,NULL,'sv1uuglsgkt4c6r68h9g88arvk','2017-10-18 10:40:49'),(484,NULL,'hnqvv510r2epmhjr4jthob55v3','2017-10-18 10:40:49'),(485,NULL,'q5gdpjn0o05745acts5e2s0qpu','2017-10-18 10:40:49'),(486,NULL,'fdv7ftdfcehh54i9602qjfk85p','2017-10-18 10:41:30'),(487,NULL,'fcke0k4mt2a4k6k3bb27lr6vjg','2017-10-18 10:41:31'),(488,NULL,'tpgcp22v7pbr0ookp5a8hj80q9','2017-10-18 10:41:31'),(489,NULL,'p4rf51l05jkp3ag9ru17i9jqla','2017-10-18 10:41:31'),(490,NULL,'c9gf8bg9gs9u8d2kh0t87b0dah','2017-10-18 10:41:31'),(491,NULL,'sp177s3tsighnekvbrru4mmnmu','2017-10-18 10:41:31'),(492,NULL,'0jj4l8h1tpisim472omdoppmci','2017-10-18 10:43:06'),(493,NULL,'hrj07gknpan22lah66ain4b6a5','2017-10-18 10:43:07'),(494,NULL,'vvnarvqoe7ik4e6u7dj2cdoj11','2017-10-18 10:43:07'),(495,NULL,'mgaj4c0j6qitn9hjj5d2spp74u','2017-10-18 10:43:07'),(496,NULL,'378k78o8f1i900sksjjqu4gqus','2017-10-18 10:43:07'),(497,NULL,'1oitprb64oet12b803b373pr3o','2017-10-18 10:43:07'),(498,NULL,'ikr5hjptu18flmrvq3f315nrj2','2017-10-18 10:45:04'),(499,NULL,'sbhek7trju0472rb0bc6ftbo5h','2017-10-18 10:45:04'),(500,NULL,'e8odl7535dq4o8c52kk9kt86gc','2017-10-18 10:45:05'),(501,NULL,'bnvrjcfaaojmhpmsj4kj38mklu','2017-10-18 10:45:05'),(502,NULL,'a3oj04q008os6dc0dv8sah3e5g','2017-10-18 10:45:05'),(503,NULL,'265g2csst7c11q91kdk8kt920v','2017-10-18 10:45:05'),(504,NULL,'qjm11ir86mcv0kcfmqksgiifap','2017-10-18 10:45:47'),(505,NULL,'jbd8vmo1s8d998ro1806bqt9i4','2017-10-18 10:45:48'),(506,NULL,'445jtv6v4f3mat9iofgelf0heg','2017-10-18 10:45:48'),(507,NULL,'f14c39p3q1u6kttkt23eq6a13a','2017-10-18 10:45:48'),(508,NULL,'hjpu7hhf2okabei5s0c2ai1eds','2017-10-18 10:45:48'),(509,NULL,'96frj1inf673ujus4n0qnkdvd8','2017-10-18 10:45:48'),(510,NULL,'7nuepr8p4bep6rplujjve3uitn','2017-10-18 10:46:17'),(511,NULL,'4nql67t4quqp8bj2mco1klv588','2017-10-18 10:46:17'),(512,NULL,'84j0ka26eh14h1b7mqsqlvcsnc','2017-10-18 10:46:17'),(513,NULL,'s411ra1215p3ffsu306a5gqg2s','2017-10-18 10:46:17'),(514,NULL,'lu6ob7bg70sb3t8nm5qfrj4upg','2017-10-18 10:46:18'),(515,NULL,'13e85lmvk834qjvihlb2m8ph26','2017-10-18 10:46:18'),(516,NULL,'eds0gfbviv8m3of1bub53fr6rm','2017-10-18 10:48:46'),(517,NULL,'hckmnicnldit26sp801ku13bd2','2017-10-18 10:48:47'),(518,NULL,'7976p8mrtkkaf43h55lpji95en','2017-10-18 10:48:47'),(519,NULL,'d2uj82rireg9fvvm9nrqdol4bl','2017-10-18 10:48:47'),(520,NULL,'vijgmvjprl53ia203vths87mcq','2017-10-18 10:48:47'),(521,NULL,'2j0mrmm1un09ct5lkluicvgqrl','2017-10-18 10:48:47'),(522,NULL,'7s7s3g9r48q596nar8uuealnfg','2017-10-18 10:51:30'),(523,NULL,'rp6cnkc1f34lbremsef6oginbu','2017-10-18 10:51:31'),(524,NULL,'dp7a9t4oh0qnhuvh6cjjkn82gg','2017-10-18 10:51:31'),(525,NULL,'vu7jv9st1tbtf20124ken0ik15','2017-10-18 10:51:31'),(526,NULL,'5ksa888inqme5a7t4h7qffn2en','2017-10-18 10:51:31'),(527,NULL,'trtf4aj5oubt30dvdumupvrvta','2017-10-18 10:51:31'),(528,NULL,'4rqhb8c8us3f4jrikaa5ch651n','2017-10-18 10:52:31'),(529,NULL,'npn34tv5eukosic18d75qndbgg','2017-10-18 10:52:32'),(530,NULL,'amd6su29th64mmtoqf5oi8p6hf','2017-10-18 10:52:32'),(531,NULL,'iq86p2nbd6fc4fjft1dq7smmbr','2017-10-18 10:52:32'),(532,NULL,'akhar3h1ipu8ro5l2lp2gpi8gj','2017-10-18 10:52:32'),(533,NULL,'dgroddca85ovn9nldt6en48sic','2017-10-18 10:52:32'),(534,NULL,'g9hqiqmlmck14v5gkj9hbu2f9t','2017-10-18 10:54:12'),(535,NULL,'1p10q10dr632js48b1v0vu23gl','2017-10-18 10:54:13'),(536,NULL,'7pf6r8muqguh8jjdv2ngapr8um','2017-10-18 10:54:13'),(537,NULL,'2bvpnq4bg9hpco0jekkttupofl','2017-10-18 10:54:13'),(538,NULL,'hj04fg4kv5hhedvl3pcrrjmqjl','2017-10-18 10:54:14'),(539,NULL,'cs2tskbraajlcrg2cpk9g7qp68','2017-10-18 10:54:14'),(540,NULL,'biqba9kdufv5k29eviijef54bu','2017-10-18 10:56:12'),(541,NULL,'5aau3mvq1elauma3o2tr8irhiv','2017-10-18 10:56:12'),(542,NULL,'1g7534v0qegtbufrhf9usmaps9','2017-10-18 10:56:12'),(543,NULL,'56bshpbfa5fv0tfrso48ldi5f9','2017-10-18 10:56:13'),(544,NULL,'3g7c3539psubpu4hilgbhur0lj','2017-10-18 10:56:13'),(545,NULL,'ejfd1ko671b35kcdqkg60pgue3','2017-10-18 10:56:13'),(546,NULL,'odqrc7bqlmvvtcjm4nm3ijg8ar','2017-10-18 10:57:05'),(547,NULL,'tlcm7htadfboobdb28s3f0o68i','2017-10-18 10:57:06'),(548,NULL,'vc0c32jcoo5jqb0vjeoop8pl96','2017-10-18 10:57:06'),(549,NULL,'b3dh9gdvun2neeibed3dgg85vn','2017-10-18 10:57:06'),(550,NULL,'9ntats5auqd1p6luk0bitfr52d','2017-10-18 10:57:06'),(551,NULL,'2m7i3hdqddn8e376t022o1u91l','2017-10-18 10:57:06'),(552,NULL,'ru602ghj2hh5iu67jol179qcr8','2017-10-18 10:57:41'),(553,NULL,'1n0fo1jn6eno7sort9ka21vhnh','2017-10-18 10:57:42'),(554,NULL,'loa9909ugjkmc0sleh9mlf757r','2017-10-18 10:57:42'),(555,NULL,'k6r2o5c4a4hmf8fiuebcapb2e7','2017-10-18 10:57:42'),(556,NULL,'idv6tcadafa3qo6ra8hoe974f8','2017-10-18 10:57:42'),(557,NULL,'htg1dfnrva2la3ipitbidcsnjl','2017-10-18 10:58:36'),(558,NULL,'f4a9dojnd4tppf7rhhtubc6kq2','2017-10-18 10:58:37'),(559,NULL,'u8ulok1qnvma7fjvujrljejnvp','2017-10-18 10:58:37'),(560,NULL,'dj2m9deafqbc386ktimr701qv5','2017-10-18 10:58:37'),(561,NULL,'s17gfdti97q7ac81rpqrfp2lct','2017-10-18 10:58:37'),(562,NULL,'ko30g63o6qv9j4vd20dc5alrne','2017-10-18 10:59:29'),(563,NULL,'89q2s7sv8i08r4q58nhj2dmo6c','2017-10-18 10:59:29'),(564,NULL,'imjvg3gj7rp8ga4e90rsic977d','2017-10-18 10:59:30'),(565,NULL,'88ae9ota7050d4ijugpadbh2jm','2017-10-18 10:59:30'),(566,NULL,'2n02qvsgpepk1l7pjad0vcqlqf','2017-10-18 10:59:30'),(567,NULL,'juql7r5mjhodg4uqe3kljqam81','2017-10-18 10:59:54'),(568,NULL,'7e020ckr6ebo6upc1mjq26dm4h','2017-10-18 10:59:54'),(569,NULL,'mbbr68447h2osgqskj75vfg31c','2017-10-18 10:59:54'),(570,NULL,'n1n322lpudgvudt0pf7cpkr9l1','2017-10-18 10:59:54'),(571,NULL,'09lkgsrm8ijm6buo2ggg46v47f','2017-10-18 10:59:54'),(572,NULL,'lc9out4cb8q8l3qmvcmk8o1qml','2017-10-18 11:01:24'),(573,NULL,'qlctdhs5vlc430s1og0r2ir0q3','2017-10-18 11:01:24'),(574,NULL,'3e6e2l2asjag61ml8au5fh0jrg','2017-10-18 11:01:24'),(575,NULL,'vq7gqun03l0bt8p1ld9ll1vkta','2017-10-18 11:01:25'),(576,NULL,'cev2e1nl4u2ke2f5ug4cj62fcm','2017-10-18 11:01:25'),(577,NULL,'b33nn1bsrip4mv27rvrcsvim7r','2017-10-18 11:02:10'),(578,NULL,'n7o1dr1hkvd1rvi2biksdimiiq','2017-10-18 11:02:11'),(579,NULL,'v4mbj636upg001pe3vlbt2e6dn','2017-10-18 11:02:11'),(580,NULL,'5230692bphl2sfafjqrt3fdj9r','2017-10-18 11:02:11'),(581,NULL,'e5g6p5g8oi40gua36gsidcj4u5','2017-10-18 11:02:11'),(582,NULL,'8vbvulaogj7ce56doi2foq2ojq','2017-10-18 11:03:31'),(583,NULL,'jv39bfg212so70t2rvh3b7m660','2017-10-18 11:03:31'),(584,NULL,'076d6k4n3qlg78rqg6tg5h6di5','2017-10-18 11:03:31'),(585,NULL,'muhjirrujh4eqr53k635j6aei6','2017-10-18 11:03:31'),(586,NULL,'0c0r1l3kohu2346nk36cm6926t','2017-10-18 11:03:32'),(587,NULL,'n3tml2baoe0m3r9dmrg1jov9h7','2017-10-18 11:04:31'),(588,NULL,'hbo6cfjvkmm8snj1klbfmm2juu','2017-10-18 11:04:31'),(589,NULL,'f57qphm7d747lvvq1f00e0r0gf','2017-10-18 11:04:31'),(590,NULL,'s57es8p96jr1l71dgdgap4mjm6','2017-10-18 11:04:32'),(591,NULL,'fh7u4n1fgigvga551s0cau9dmg','2017-10-18 11:04:32'),(592,NULL,'b008lu324lqsqsnkp3d7enrrkv','2017-10-18 11:05:55'),(593,NULL,'488kpbhulqhripev296r60sl9m','2017-10-18 11:05:56'),(594,NULL,'3m0oj8n9h50kuid72llji62goi','2017-10-18 11:05:56'),(595,NULL,'ls7iao57eu1sh8olr5r30tntr7','2017-10-18 11:05:56'),(596,NULL,'ff8fp61ri44pjse7923uv8smus','2017-10-18 11:05:56'),(597,NULL,'t6b3g4jeo82tv0lova414vsap3','2017-10-18 11:06:31'),(598,NULL,'3sbqsrb4scqfhl5ap52pfk3an5','2017-10-18 11:06:31'),(599,NULL,'9gv46qoov8c18urce87t9ssjii','2017-10-18 11:06:31'),(600,NULL,'pf6c1p1urjtagks351tj73h3r0','2017-10-18 11:06:31'),(601,NULL,'4u3ehor9o7n5ot03ivm2is61h0','2017-10-18 11:06:31'),(602,NULL,'21be9c9cvek6vh6c8kv84p4csq','2017-10-18 11:06:49'),(603,NULL,'cedsurrnqjc82c053qjsiv3k9h','2017-10-18 11:06:49'),(604,NULL,'ov9ht8i3oq89hveuq9fuv6ojsg','2017-10-18 11:06:50'),(605,NULL,'9te54r7mefb8lcj32sk6r0slq1','2017-10-18 11:06:50'),(606,NULL,'mvik58dmnfdh9lcbhvi3jhvp52','2017-10-18 11:06:50'),(607,NULL,'3dnp8ll57im6n2ub2ptkj5negc','2017-10-18 11:07:39'),(608,NULL,'n3h3i3tsn0ga2jhtppckjq6n0d','2017-10-18 11:07:39'),(609,NULL,'7tgkl7gslfdrnad18q919iba5a','2017-10-18 11:07:40'),(610,NULL,'2plb6a4bj034pen4e59a6vm9ij','2017-10-18 11:07:40'),(611,NULL,'sordj10q3mkoe9qgk937o7pfg2','2017-10-18 11:07:40'),(612,NULL,'8knuc9rmtuv1fqm6rr226cc1ns','2017-10-18 11:09:57'),(613,NULL,'llm09fti5fpb4bpemp3i8jqlib','2017-10-18 11:10:00'),(614,NULL,'fpvvk0bkhnrb868qblap6sev7c','2017-10-18 11:10:01'),(615,NULL,'p2ah8mfaeesd55qrq8g9kph5p7','2017-10-18 11:10:01'),(616,NULL,'qf95h594spoj3riuq2cln6vjhn','2017-10-18 11:10:01'),(617,NULL,'ne6qgsfcidni3pn4dgjktggj4p','2017-10-18 11:11:48'),(618,NULL,'8c7n5oqlr2s0p38b6spb0v7c5o','2017-10-18 11:11:50'),(619,NULL,'51eneg36d63mb75pb8s7j024gq','2017-10-18 11:11:51'),(620,NULL,'aeca9c87rbqtasjcglpu7f3d02','2017-10-18 11:11:51'),(621,NULL,'8q7hi8a1rtgssojdidqdkbkjrl','2017-10-18 11:11:52'),(622,NULL,'av9hv28j0fsrrkta4nr12durph','2017-10-18 11:15:11'),(623,NULL,'12cm8ar7psd1f9gp3sm0i4ard5','2017-10-18 12:22:38'),(624,NULL,'6ni97p1am7jlnvhd8tq8fcv8bp','2017-10-18 12:22:39'),(625,NULL,'kabrnkr9nfl7nv6sugt94vpj59','2017-10-18 12:22:39'),(626,NULL,'51cikitl1g52p0ndp7s19g7cel','2017-10-18 12:22:39'),(627,NULL,'b9khi6tgkhqbqu14vlem3hofhq','2017-10-18 12:22:40'),(628,NULL,'jmc7jvcur6on115plv4bapj1ef','2017-10-18 12:23:45'),(629,NULL,'ag1ceeu97hk0r90tl4aac64ng3','2017-10-18 12:23:46'),(630,NULL,'24ohl3qjlvgjo7sqvgnpp09oe7','2017-10-18 12:23:46'),(631,NULL,'21dudojeebqmib9jtr67gm73qa','2017-10-18 12:23:46'),(632,NULL,'k4ecrk27fr02us84j9gd7li25i','2017-10-18 12:23:46'),(633,NULL,'t1asd7152dn32aoptio42rsi0k','2017-10-18 12:24:07'),(634,NULL,'o6dbhs2oh7p8g99vgodjuj23sd','2017-10-18 12:24:07'),(635,NULL,'dc3uppc30qgf290130n2l8oqun','2017-10-18 12:24:08'),(636,NULL,'36ndm24i2i41non6ssofaq4jck','2017-10-18 12:24:08'),(637,NULL,'gjr4cs4g2bp9e47q0n95da9jii','2017-10-18 12:24:08'),(638,NULL,'ajhr3815pdfmi4rq6qp1fetdrq','2017-10-18 12:24:35'),(639,NULL,'65c2fcj05stie9k08cqoqm72oi','2017-10-18 12:24:36'),(640,NULL,'8schrsu35sidc0ip9aut3unal1','2017-10-18 12:24:36'),(641,NULL,'ef770sai85v0llfr917kl8rea9','2017-10-18 12:24:36'),(642,NULL,'njocjvhv0l2rmcie6j17dr92d0','2017-10-18 12:24:36'),(643,NULL,'0babs615hkcu7jujrosrfsv5h4','2017-10-18 12:25:14'),(644,NULL,'g73jj03u5n95uj2vvstjl0achq','2017-10-18 12:25:14'),(645,NULL,'81maa0q8p3373d0ps841kkupfh','2017-10-18 12:25:14'),(646,NULL,'4l15eel6e4ast5f1qv0rudaar5','2017-10-18 12:25:14'),(647,NULL,'7et0lbkggoq266anpcngpmo14t','2017-10-18 12:25:14'),(648,NULL,'ghaq6fkb011814tnj887eq1f93','2017-10-18 12:25:34'),(649,NULL,'pg7jagkdde6fklrp0mgtoegbsq','2017-10-18 12:25:34'),(650,NULL,'or3qqrqav0qkgv4sqpam5ju404','2017-10-18 12:25:35'),(651,NULL,'h9mbr2r0uujs9sp442t4v2lug3','2017-10-18 12:25:35'),(652,NULL,'5fkjuji24l2t0r3qo71uvv57ts','2017-10-18 12:25:35'),(653,NULL,'51thp8e0l0ffv4fmj1qfshl75l','2017-10-18 12:25:46'),(654,NULL,'b8vtnmnqioht86q4a0trmi5q0p','2017-10-18 12:25:47'),(655,NULL,'5bp5e9vl3acij7emnj9o5aci1n','2017-10-18 12:25:47'),(656,NULL,'i9d5b44mfijddlvi8cl0p1mvqt','2017-10-18 12:25:47'),(657,NULL,'6b2salo1fb7v2tidb5a5qtqnnv','2017-10-18 12:25:47'),(658,NULL,'f6gf8th721u6vvkmopunr4998c','2017-10-18 12:29:06'),(659,NULL,'au6lehreieknne25abapj8ae1h','2017-10-18 12:29:06'),(660,NULL,'vfeaach9c34uorb0fi6jc6q1o4','2017-10-18 12:29:06'),(661,NULL,'ubam8vnr3glnjpop9sgh9g74vc','2017-10-18 12:29:07'),(662,NULL,'epd1q9avg8jnd392lj2uuul0v5','2017-10-18 12:29:07'),(663,NULL,'f1muo33ipqo6n9osjn679loags','2017-10-18 12:30:32'),(664,NULL,'4e2prsnipqajc5e6kgq4rlk5mj','2017-10-18 12:30:32'),(665,NULL,'f4ovujg20bqt48lufouuj3hv94','2017-10-18 12:30:32'),(666,NULL,'gc3qp3okrqlebg1eu0n17qt7er','2017-10-18 12:30:32'),(667,NULL,'7a2r6omjrukdkik7247gji7qse','2017-10-18 12:30:33'),(668,NULL,'0ufrtcgc0d7r80ue197p9uki5p','2017-10-18 12:30:33'),(669,NULL,'cb03eaa0j9t3jm7pg12t6pcqs0','2017-10-18 12:30:33'),(670,NULL,'9kph9qh652pg9bvqor61ohhr78','2017-10-18 12:30:33'),(671,NULL,'dr9uvso6ppr7m8ducsv7kks047','2017-10-18 12:30:33'),(672,NULL,'u39vt9q6iom4h48tqmo5d82on4','2017-10-18 12:32:05'),(673,NULL,'qfmi0fcdg7r5bfb35qq5kkuhff','2017-10-18 12:32:05'),(674,NULL,'nbhch0opkih3brhv55r92pq6re','2017-10-18 12:32:05'),(675,NULL,'q1c63nkf5mt73u72oqrp6qbu8k','2017-10-18 12:32:06'),(676,NULL,'f24snen0i89nrmi88m5i190ota','2017-10-18 12:32:06'),(677,NULL,'ofairoq5p6vr9sddp993h0bgu1','2017-10-18 12:32:49'),(678,NULL,'gbm0mvgme2j21q459g4nfqd4g0','2017-10-18 12:32:50'),(679,NULL,'pkeckcf8hneic6kp043n9od8r1','2017-10-18 12:32:50'),(680,NULL,'elg6uqhgri6ltr26na5mfd0kpp','2017-10-18 12:32:50'),(681,NULL,'tc49omktm2ja8obc29p2p57gde','2017-10-18 12:32:50');
/*!40000 ALTER TABLE `csvp_customer_visitor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_design_change`
--

DROP TABLE IF EXISTS `csvp_design_change`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_design_change` (
  `design_change_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Design Change Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `design` varchar(255) DEFAULT NULL COMMENT 'Design',
  `date_from` date DEFAULT NULL COMMENT 'First Date of Design Activity',
  `date_to` date DEFAULT NULL COMMENT 'Last Date of Design Activity',
  PRIMARY KEY (`design_change_id`),
  KEY `CSVP_DESIGN_CHANGE_STORE_ID` (`store_id`),
  CONSTRAINT `CSVP_DESIGN_CHANGE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Design Changes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_design_change`
--

LOCK TABLES `csvp_design_change` WRITE;
/*!40000 ALTER TABLE `csvp_design_change` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_design_change` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_design_config_grid_flat`
--

DROP TABLE IF EXISTS `csvp_design_config_grid_flat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_design_config_grid_flat` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `store_website_id` int(11) DEFAULT NULL COMMENT 'Store_website_id',
  `store_group_id` int(11) DEFAULT NULL COMMENT 'Store_group_id',
  `store_id` int(11) DEFAULT NULL COMMENT 'Store_id',
  `theme_theme_id` varchar(255) DEFAULT NULL COMMENT 'Theme_theme_id',
  PRIMARY KEY (`entity_id`),
  KEY `CSVP_DESIGN_CONFIG_GRID_FLAT_STORE_WEBSITE_ID` (`store_website_id`),
  KEY `CSVP_DESIGN_CONFIG_GRID_FLAT_STORE_GROUP_ID` (`store_group_id`),
  KEY `CSVP_DESIGN_CONFIG_GRID_FLAT_STORE_ID` (`store_id`),
  FULLTEXT KEY `CSVP_DESIGN_CONFIG_GRID_FLAT_THEME_THEME_ID` (`theme_theme_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='csvp_design_config_grid_flat';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_design_config_grid_flat`
--

LOCK TABLES `csvp_design_config_grid_flat` WRITE;
/*!40000 ALTER TABLE `csvp_design_config_grid_flat` DISABLE KEYS */;
INSERT INTO `csvp_design_config_grid_flat` VALUES (0,NULL,NULL,NULL,''),(1,1,NULL,NULL,''),(2,1,1,1,'4');
/*!40000 ALTER TABLE `csvp_design_config_grid_flat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_directory_country`
--

DROP TABLE IF EXISTS `csvp_directory_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_directory_country` (
  `country_id` varchar(2) NOT NULL COMMENT 'Country Id in ISO-2',
  `iso2_code` varchar(2) DEFAULT NULL COMMENT 'Country ISO-2 format',
  `iso3_code` varchar(3) DEFAULT NULL COMMENT 'Country ISO-3',
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Directory Country';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_directory_country`
--

LOCK TABLES `csvp_directory_country` WRITE;
/*!40000 ALTER TABLE `csvp_directory_country` DISABLE KEYS */;
INSERT INTO `csvp_directory_country` VALUES ('AD','AD','AND'),('AE','AE','ARE'),('AF','AF','AFG'),('AG','AG','ATG'),('AI','AI','AIA'),('AL','AL','ALB'),('AM','AM','ARM'),('AN','AN','ANT'),('AO','AO','AGO'),('AQ','AQ','ATA'),('AR','AR','ARG'),('AS','AS','ASM'),('AT','AT','AUT'),('AU','AU','AUS'),('AW','AW','ABW'),('AX','AX','ALA'),('AZ','AZ','AZE'),('BA','BA','BIH'),('BB','BB','BRB'),('BD','BD','BGD'),('BE','BE','BEL'),('BF','BF','BFA'),('BG','BG','BGR'),('BH','BH','BHR'),('BI','BI','BDI'),('BJ','BJ','BEN'),('BL','BL','BLM'),('BM','BM','BMU'),('BN','BN','BRN'),('BO','BO','BOL'),('BR','BR','BRA'),('BS','BS','BHS'),('BT','BT','BTN'),('BV','BV','BVT'),('BW','BW','BWA'),('BY','BY','BLR'),('BZ','BZ','BLZ'),('CA','CA','CAN'),('CC','CC','CCK'),('CD','CD','COD'),('CF','CF','CAF'),('CG','CG','COG'),('CH','CH','CHE'),('CI','CI','CIV'),('CK','CK','COK'),('CL','CL','CHL'),('CM','CM','CMR'),('CN','CN','CHN'),('CO','CO','COL'),('CR','CR','CRI'),('CU','CU','CUB'),('CV','CV','CPV'),('CX','CX','CXR'),('CY','CY','CYP'),('CZ','CZ','CZE'),('DE','DE','DEU'),('DJ','DJ','DJI'),('DK','DK','DNK'),('DM','DM','DMA'),('DO','DO','DOM'),('DZ','DZ','DZA'),('EC','EC','ECU'),('EE','EE','EST'),('EG','EG','EGY'),('EH','EH','ESH'),('ER','ER','ERI'),('ES','ES','ESP'),('ET','ET','ETH'),('FI','FI','FIN'),('FJ','FJ','FJI'),('FK','FK','FLK'),('FM','FM','FSM'),('FO','FO','FRO'),('FR','FR','FRA'),('GA','GA','GAB'),('GB','GB','GBR'),('GD','GD','GRD'),('GE','GE','GEO'),('GF','GF','GUF'),('GG','GG','GGY'),('GH','GH','GHA'),('GI','GI','GIB'),('GL','GL','GRL'),('GM','GM','GMB'),('GN','GN','GIN'),('GP','GP','GLP'),('GQ','GQ','GNQ'),('GR','GR','GRC'),('GS','GS','SGS'),('GT','GT','GTM'),('GU','GU','GUM'),('GW','GW','GNB'),('GY','GY','GUY'),('HK','HK','HKG'),('HM','HM','HMD'),('HN','HN','HND'),('HR','HR','HRV'),('HT','HT','HTI'),('HU','HU','HUN'),('ID','ID','IDN'),('IE','IE','IRL'),('IL','IL','ISR'),('IM','IM','IMN'),('IN','IN','IND'),('IO','IO','IOT'),('IQ','IQ','IRQ'),('IR','IR','IRN'),('IS','IS','ISL'),('IT','IT','ITA'),('JE','JE','JEY'),('JM','JM','JAM'),('JO','JO','JOR'),('JP','JP','JPN'),('KE','KE','KEN'),('KG','KG','KGZ'),('KH','KH','KHM'),('KI','KI','KIR'),('KM','KM','COM'),('KN','KN','KNA'),('KP','KP','PRK'),('KR','KR','KOR'),('KW','KW','KWT'),('KY','KY','CYM'),('KZ','KZ','KAZ'),('LA','LA','LAO'),('LB','LB','LBN'),('LC','LC','LCA'),('LI','LI','LIE'),('LK','LK','LKA'),('LR','LR','LBR'),('LS','LS','LSO'),('LT','LT','LTU'),('LU','LU','LUX'),('LV','LV','LVA'),('LY','LY','LBY'),('MA','MA','MAR'),('MC','MC','MCO'),('MD','MD','MDA'),('ME','ME','MNE'),('MF','MF','MAF'),('MG','MG','MDG'),('MH','MH','MHL'),('MK','MK','MKD'),('ML','ML','MLI'),('MM','MM','MMR'),('MN','MN','MNG'),('MO','MO','MAC'),('MP','MP','MNP'),('MQ','MQ','MTQ'),('MR','MR','MRT'),('MS','MS','MSR'),('MT','MT','MLT'),('MU','MU','MUS'),('MV','MV','MDV'),('MW','MW','MWI'),('MX','MX','MEX'),('MY','MY','MYS'),('MZ','MZ','MOZ'),('NA','NA','NAM'),('NC','NC','NCL'),('NE','NE','NER'),('NF','NF','NFK'),('NG','NG','NGA'),('NI','NI','NIC'),('NL','NL','NLD'),('NO','NO','NOR'),('NP','NP','NPL'),('NR','NR','NRU'),('NU','NU','NIU'),('NZ','NZ','NZL'),('OM','OM','OMN'),('PA','PA','PAN'),('PE','PE','PER'),('PF','PF','PYF'),('PG','PG','PNG'),('PH','PH','PHL'),('PK','PK','PAK'),('PL','PL','POL'),('PM','PM','SPM'),('PN','PN','PCN'),('PS','PS','PSE'),('PT','PT','PRT'),('PW','PW','PLW'),('PY','PY','PRY'),('QA','QA','QAT'),('RE','RE','REU'),('RO','RO','ROU'),('RS','RS','SRB'),('RU','RU','RUS'),('RW','RW','RWA'),('SA','SA','SAU'),('SB','SB','SLB'),('SC','SC','SYC'),('SD','SD','SDN'),('SE','SE','SWE'),('SG','SG','SGP'),('SH','SH','SHN'),('SI','SI','SVN'),('SJ','SJ','SJM'),('SK','SK','SVK'),('SL','SL','SLE'),('SM','SM','SMR'),('SN','SN','SEN'),('SO','SO','SOM'),('SR','SR','SUR'),('ST','ST','STP'),('SV','SV','SLV'),('SY','SY','SYR'),('SZ','SZ','SWZ'),('TC','TC','TCA'),('TD','TD','TCD'),('TF','TF','ATF'),('TG','TG','TGO'),('TH','TH','THA'),('TJ','TJ','TJK'),('TK','TK','TKL'),('TL','TL','TLS'),('TM','TM','TKM'),('TN','TN','TUN'),('TO','TO','TON'),('TR','TR','TUR'),('TT','TT','TTO'),('TV','TV','TUV'),('TW','TW','TWN'),('TZ','TZ','TZA'),('UA','UA','UKR'),('UG','UG','UGA'),('UM','UM','UMI'),('US','US','USA'),('UY','UY','URY'),('UZ','UZ','UZB'),('VA','VA','VAT'),('VC','VC','VCT'),('VE','VE','VEN'),('VG','VG','VGB'),('VI','VI','VIR'),('VN','VN','VNM'),('VU','VU','VUT'),('WF','WF','WLF'),('WS','WS','WSM'),('YE','YE','YEM'),('YT','YT','MYT'),('ZA','ZA','ZAF'),('ZM','ZM','ZMB'),('ZW','ZW','ZWE');
/*!40000 ALTER TABLE `csvp_directory_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_directory_country_format`
--

DROP TABLE IF EXISTS `csvp_directory_country_format`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_directory_country_format` (
  `country_format_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Country Format Id',
  `country_id` varchar(2) DEFAULT NULL COMMENT 'Country Id in ISO-2',
  `type` varchar(30) DEFAULT NULL COMMENT 'Country Format Type',
  `format` text NOT NULL COMMENT 'Country Format',
  PRIMARY KEY (`country_format_id`),
  UNIQUE KEY `CSVP_DIRECTORY_COUNTRY_FORMAT_COUNTRY_ID_TYPE` (`country_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Directory Country Format';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_directory_country_format`
--

LOCK TABLES `csvp_directory_country_format` WRITE;
/*!40000 ALTER TABLE `csvp_directory_country_format` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_directory_country_format` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_directory_country_region`
--

DROP TABLE IF EXISTS `csvp_directory_country_region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_directory_country_region` (
  `region_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Region Id',
  `country_id` varchar(4) NOT NULL DEFAULT '0' COMMENT 'Country Id in ISO-2',
  `code` varchar(32) DEFAULT NULL COMMENT 'Region code',
  `default_name` varchar(255) DEFAULT NULL COMMENT 'Region Name',
  PRIMARY KEY (`region_id`),
  KEY `CSVP_DIRECTORY_COUNTRY_REGION_COUNTRY_ID` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=533 DEFAULT CHARSET=utf8 COMMENT='Directory Country Region';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_directory_country_region`
--

LOCK TABLES `csvp_directory_country_region` WRITE;
/*!40000 ALTER TABLE `csvp_directory_country_region` DISABLE KEYS */;
INSERT INTO `csvp_directory_country_region` VALUES (1,'US','AL','Alabama'),(2,'US','AK','Alaska'),(3,'US','AS','American Samoa'),(4,'US','AZ','Arizona'),(5,'US','AR','Arkansas'),(6,'US','AE','Armed Forces Africa'),(7,'US','AA','Armed Forces Americas'),(8,'US','AE','Armed Forces Canada'),(9,'US','AE','Armed Forces Europe'),(10,'US','AE','Armed Forces Middle East'),(11,'US','AP','Armed Forces Pacific'),(12,'US','CA','California'),(13,'US','CO','Colorado'),(14,'US','CT','Connecticut'),(15,'US','DE','Delaware'),(16,'US','DC','District of Columbia'),(17,'US','FM','Federated States Of Micronesia'),(18,'US','FL','Florida'),(19,'US','GA','Georgia'),(20,'US','GU','Guam'),(21,'US','HI','Hawaii'),(22,'US','ID','Idaho'),(23,'US','IL','Illinois'),(24,'US','IN','Indiana'),(25,'US','IA','Iowa'),(26,'US','KS','Kansas'),(27,'US','KY','Kentucky'),(28,'US','LA','Louisiana'),(29,'US','ME','Maine'),(30,'US','MH','Marshall Islands'),(31,'US','MD','Maryland'),(32,'US','MA','Massachusetts'),(33,'US','MI','Michigan'),(34,'US','MN','Minnesota'),(35,'US','MS','Mississippi'),(36,'US','MO','Missouri'),(37,'US','MT','Montana'),(38,'US','NE','Nebraska'),(39,'US','NV','Nevada'),(40,'US','NH','New Hampshire'),(41,'US','NJ','New Jersey'),(42,'US','NM','New Mexico'),(43,'US','NY','New York'),(44,'US','NC','North Carolina'),(45,'US','ND','North Dakota'),(46,'US','MP','Northern Mariana Islands'),(47,'US','OH','Ohio'),(48,'US','OK','Oklahoma'),(49,'US','OR','Oregon'),(50,'US','PW','Palau'),(51,'US','PA','Pennsylvania'),(52,'US','PR','Puerto Rico'),(53,'US','RI','Rhode Island'),(54,'US','SC','South Carolina'),(55,'US','SD','South Dakota'),(56,'US','TN','Tennessee'),(57,'US','TX','Texas'),(58,'US','UT','Utah'),(59,'US','VT','Vermont'),(60,'US','VI','Virgin Islands'),(61,'US','VA','Virginia'),(62,'US','WA','Washington'),(63,'US','WV','West Virginia'),(64,'US','WI','Wisconsin'),(65,'US','WY','Wyoming'),(66,'CA','AB','Alberta'),(67,'CA','BC','British Columbia'),(68,'CA','MB','Manitoba'),(69,'CA','NL','Newfoundland and Labrador'),(70,'CA','NB','New Brunswick'),(71,'CA','NS','Nova Scotia'),(72,'CA','NT','Northwest Territories'),(73,'CA','NU','Nunavut'),(74,'CA','ON','Ontario'),(75,'CA','PE','Prince Edward Island'),(76,'CA','QC','Quebec'),(77,'CA','SK','Saskatchewan'),(78,'CA','YT','Yukon Territory'),(79,'DE','NDS','Niedersachsen'),(80,'DE','BAW','Baden-Württemberg'),(81,'DE','BAY','Bayern'),(82,'DE','BER','Berlin'),(83,'DE','BRG','Brandenburg'),(84,'DE','BRE','Bremen'),(85,'DE','HAM','Hamburg'),(86,'DE','HES','Hessen'),(87,'DE','MEC','Mecklenburg-Vorpommern'),(88,'DE','NRW','Nordrhein-Westfalen'),(89,'DE','RHE','Rheinland-Pfalz'),(90,'DE','SAR','Saarland'),(91,'DE','SAS','Sachsen'),(92,'DE','SAC','Sachsen-Anhalt'),(93,'DE','SCN','Schleswig-Holstein'),(94,'DE','THE','Thüringen'),(95,'AT','WI','Wien'),(96,'AT','NO','Niederösterreich'),(97,'AT','OO','Oberösterreich'),(98,'AT','SB','Salzburg'),(99,'AT','KN','Kärnten'),(100,'AT','ST','Steiermark'),(101,'AT','TI','Tirol'),(102,'AT','BL','Burgenland'),(103,'AT','VB','Vorarlberg'),(104,'CH','AG','Aargau'),(105,'CH','AI','Appenzell Innerrhoden'),(106,'CH','AR','Appenzell Ausserrhoden'),(107,'CH','BE','Bern'),(108,'CH','BL','Basel-Landschaft'),(109,'CH','BS','Basel-Stadt'),(110,'CH','FR','Freiburg'),(111,'CH','GE','Genf'),(112,'CH','GL','Glarus'),(113,'CH','GR','Graubünden'),(114,'CH','JU','Jura'),(115,'CH','LU','Luzern'),(116,'CH','NE','Neuenburg'),(117,'CH','NW','Nidwalden'),(118,'CH','OW','Obwalden'),(119,'CH','SG','St. Gallen'),(120,'CH','SH','Schaffhausen'),(121,'CH','SO','Solothurn'),(122,'CH','SZ','Schwyz'),(123,'CH','TG','Thurgau'),(124,'CH','TI','Tessin'),(125,'CH','UR','Uri'),(126,'CH','VD','Waadt'),(127,'CH','VS','Wallis'),(128,'CH','ZG','Zug'),(129,'CH','ZH','Zürich'),(130,'ES','A Coruсa','A Coruña'),(131,'ES','Alava','Alava'),(132,'ES','Albacete','Albacete'),(133,'ES','Alicante','Alicante'),(134,'ES','Almeria','Almeria'),(135,'ES','Asturias','Asturias'),(136,'ES','Avila','Avila'),(137,'ES','Badajoz','Badajoz'),(138,'ES','Baleares','Baleares'),(139,'ES','Barcelona','Barcelona'),(140,'ES','Burgos','Burgos'),(141,'ES','Caceres','Caceres'),(142,'ES','Cadiz','Cadiz'),(143,'ES','Cantabria','Cantabria'),(144,'ES','Castellon','Castellon'),(145,'ES','Ceuta','Ceuta'),(146,'ES','Ciudad Real','Ciudad Real'),(147,'ES','Cordoba','Cordoba'),(148,'ES','Cuenca','Cuenca'),(149,'ES','Girona','Girona'),(150,'ES','Granada','Granada'),(151,'ES','Guadalajara','Guadalajara'),(152,'ES','Guipuzcoa','Guipuzcoa'),(153,'ES','Huelva','Huelva'),(154,'ES','Huesca','Huesca'),(155,'ES','Jaen','Jaen'),(156,'ES','La Rioja','La Rioja'),(157,'ES','Las Palmas','Las Palmas'),(158,'ES','Leon','Leon'),(159,'ES','Lleida','Lleida'),(160,'ES','Lugo','Lugo'),(161,'ES','Madrid','Madrid'),(162,'ES','Malaga','Malaga'),(163,'ES','Melilla','Melilla'),(164,'ES','Murcia','Murcia'),(165,'ES','Navarra','Navarra'),(166,'ES','Ourense','Ourense'),(167,'ES','Palencia','Palencia'),(168,'ES','Pontevedra','Pontevedra'),(169,'ES','Salamanca','Salamanca'),(170,'ES','Santa Cruz de Tenerife','Santa Cruz de Tenerife'),(171,'ES','Segovia','Segovia'),(172,'ES','Sevilla','Sevilla'),(173,'ES','Soria','Soria'),(174,'ES','Tarragona','Tarragona'),(175,'ES','Teruel','Teruel'),(176,'ES','Toledo','Toledo'),(177,'ES','Valencia','Valencia'),(178,'ES','Valladolid','Valladolid'),(179,'ES','Vizcaya','Vizcaya'),(180,'ES','Zamora','Zamora'),(181,'ES','Zaragoza','Zaragoza'),(182,'FR','1','Ain'),(183,'FR','2','Aisne'),(184,'FR','3','Allier'),(185,'FR','4','Alpes-de-Haute-Provence'),(186,'FR','5','Hautes-Alpes'),(187,'FR','6','Alpes-Maritimes'),(188,'FR','7','Ardèche'),(189,'FR','8','Ardennes'),(190,'FR','9','Ariège'),(191,'FR','10','Aube'),(192,'FR','11','Aude'),(193,'FR','12','Aveyron'),(194,'FR','13','Bouches-du-Rhône'),(195,'FR','14','Calvados'),(196,'FR','15','Cantal'),(197,'FR','16','Charente'),(198,'FR','17','Charente-Maritime'),(199,'FR','18','Cher'),(200,'FR','19','Corrèze'),(201,'FR','2A','Corse-du-Sud'),(202,'FR','2B','Haute-Corse'),(203,'FR','21','Côte-d\'Or'),(204,'FR','22','Côtes-d\'Armor'),(205,'FR','23','Creuse'),(206,'FR','24','Dordogne'),(207,'FR','25','Doubs'),(208,'FR','26','Drôme'),(209,'FR','27','Eure'),(210,'FR','28','Eure-et-Loir'),(211,'FR','29','Finistère'),(212,'FR','30','Gard'),(213,'FR','31','Haute-Garonne'),(214,'FR','32','Gers'),(215,'FR','33','Gironde'),(216,'FR','34','Hérault'),(217,'FR','35','Ille-et-Vilaine'),(218,'FR','36','Indre'),(219,'FR','37','Indre-et-Loire'),(220,'FR','38','Isère'),(221,'FR','39','Jura'),(222,'FR','40','Landes'),(223,'FR','41','Loir-et-Cher'),(224,'FR','42','Loire'),(225,'FR','43','Haute-Loire'),(226,'FR','44','Loire-Atlantique'),(227,'FR','45','Loiret'),(228,'FR','46','Lot'),(229,'FR','47','Lot-et-Garonne'),(230,'FR','48','Lozère'),(231,'FR','49','Maine-et-Loire'),(232,'FR','50','Manche'),(233,'FR','51','Marne'),(234,'FR','52','Haute-Marne'),(235,'FR','53','Mayenne'),(236,'FR','54','Meurthe-et-Moselle'),(237,'FR','55','Meuse'),(238,'FR','56','Morbihan'),(239,'FR','57','Moselle'),(240,'FR','58','Nièvre'),(241,'FR','59','Nord'),(242,'FR','60','Oise'),(243,'FR','61','Orne'),(244,'FR','62','Pas-de-Calais'),(245,'FR','63','Puy-de-Dôme'),(246,'FR','64','Pyrénées-Atlantiques'),(247,'FR','65','Hautes-Pyrénées'),(248,'FR','66','Pyrénées-Orientales'),(249,'FR','67','Bas-Rhin'),(250,'FR','68','Haut-Rhin'),(251,'FR','69','Rhône'),(252,'FR','70','Haute-Saône'),(253,'FR','71','Saône-et-Loire'),(254,'FR','72','Sarthe'),(255,'FR','73','Savoie'),(256,'FR','74','Haute-Savoie'),(257,'FR','75','Paris'),(258,'FR','76','Seine-Maritime'),(259,'FR','77','Seine-et-Marne'),(260,'FR','78','Yvelines'),(261,'FR','79','Deux-Sèvres'),(262,'FR','80','Somme'),(263,'FR','81','Tarn'),(264,'FR','82','Tarn-et-Garonne'),(265,'FR','83','Var'),(266,'FR','84','Vaucluse'),(267,'FR','85','Vendée'),(268,'FR','86','Vienne'),(269,'FR','87','Haute-Vienne'),(270,'FR','88','Vosges'),(271,'FR','89','Yonne'),(272,'FR','90','Territoire-de-Belfort'),(273,'FR','91','Essonne'),(274,'FR','92','Hauts-de-Seine'),(275,'FR','93','Seine-Saint-Denis'),(276,'FR','94','Val-de-Marne'),(277,'FR','95','Val-d\'Oise'),(278,'RO','AB','Alba'),(279,'RO','AR','Arad'),(280,'RO','AG','Argeş'),(281,'RO','BC','Bacău'),(282,'RO','BH','Bihor'),(283,'RO','BN','Bistriţa-Năsăud'),(284,'RO','BT','Botoşani'),(285,'RO','BV','Braşov'),(286,'RO','BR','Brăila'),(287,'RO','B','Bucureşti'),(288,'RO','BZ','Buzău'),(289,'RO','CS','Caraş-Severin'),(290,'RO','CL','Călăraşi'),(291,'RO','CJ','Cluj'),(292,'RO','CT','Constanţa'),(293,'RO','CV','Covasna'),(294,'RO','DB','Dâmboviţa'),(295,'RO','DJ','Dolj'),(296,'RO','GL','Galaţi'),(297,'RO','GR','Giurgiu'),(298,'RO','GJ','Gorj'),(299,'RO','HR','Harghita'),(300,'RO','HD','Hunedoara'),(301,'RO','IL','Ialomiţa'),(302,'RO','IS','Iaşi'),(303,'RO','IF','Ilfov'),(304,'RO','MM','Maramureş'),(305,'RO','MH','Mehedinţi'),(306,'RO','MS','Mureş'),(307,'RO','NT','Neamţ'),(308,'RO','OT','Olt'),(309,'RO','PH','Prahova'),(310,'RO','SM','Satu-Mare'),(311,'RO','SJ','Sălaj'),(312,'RO','SB','Sibiu'),(313,'RO','SV','Suceava'),(314,'RO','TR','Teleorman'),(315,'RO','TM','Timiş'),(316,'RO','TL','Tulcea'),(317,'RO','VS','Vaslui'),(318,'RO','VL','Vâlcea'),(319,'RO','VN','Vrancea'),(320,'FI','Lappi','Lappi'),(321,'FI','Pohjois-Pohjanmaa','Pohjois-Pohjanmaa'),(322,'FI','Kainuu','Kainuu'),(323,'FI','Pohjois-Karjala','Pohjois-Karjala'),(324,'FI','Pohjois-Savo','Pohjois-Savo'),(325,'FI','Etelä-Savo','Etelä-Savo'),(326,'FI','Etelä-Pohjanmaa','Etelä-Pohjanmaa'),(327,'FI','Pohjanmaa','Pohjanmaa'),(328,'FI','Pirkanmaa','Pirkanmaa'),(329,'FI','Satakunta','Satakunta'),(330,'FI','Keski-Pohjanmaa','Keski-Pohjanmaa'),(331,'FI','Keski-Suomi','Keski-Suomi'),(332,'FI','Varsinais-Suomi','Varsinais-Suomi'),(333,'FI','Etelä-Karjala','Etelä-Karjala'),(334,'FI','Päijät-Häme','Päijät-Häme'),(335,'FI','Kanta-Häme','Kanta-Häme'),(336,'FI','Uusimaa','Uusimaa'),(337,'FI','Itä-Uusimaa','Itä-Uusimaa'),(338,'FI','Kymenlaakso','Kymenlaakso'),(339,'FI','Ahvenanmaa','Ahvenanmaa'),(340,'EE','EE-37','Harjumaa'),(341,'EE','EE-39','Hiiumaa'),(342,'EE','EE-44','Ida-Virumaa'),(343,'EE','EE-49','Jõgevamaa'),(344,'EE','EE-51','Järvamaa'),(345,'EE','EE-57','Läänemaa'),(346,'EE','EE-59','Lääne-Virumaa'),(347,'EE','EE-65','Põlvamaa'),(348,'EE','EE-67','Pärnumaa'),(349,'EE','EE-70','Raplamaa'),(350,'EE','EE-74','Saaremaa'),(351,'EE','EE-78','Tartumaa'),(352,'EE','EE-82','Valgamaa'),(353,'EE','EE-84','Viljandimaa'),(354,'EE','EE-86','Võrumaa'),(355,'LV','LV-DGV','Daugavpils'),(356,'LV','LV-JEL','Jelgava'),(357,'LV','Jēkabpils','Jēkabpils'),(358,'LV','LV-JUR','Jūrmala'),(359,'LV','LV-LPX','Liepāja'),(360,'LV','LV-LE','Liepājas novads'),(361,'LV','LV-REZ','Rēzekne'),(362,'LV','LV-RIX','Rīga'),(363,'LV','LV-RI','Rīgas novads'),(364,'LV','Valmiera','Valmiera'),(365,'LV','LV-VEN','Ventspils'),(366,'LV','Aglonas novads','Aglonas novads'),(367,'LV','LV-AI','Aizkraukles novads'),(368,'LV','Aizputes novads','Aizputes novads'),(369,'LV','Aknīstes novads','Aknīstes novads'),(370,'LV','Alojas novads','Alojas novads'),(371,'LV','Alsungas novads','Alsungas novads'),(372,'LV','LV-AL','Alūksnes novads'),(373,'LV','Amatas novads','Amatas novads'),(374,'LV','Apes novads','Apes novads'),(375,'LV','Auces novads','Auces novads'),(376,'LV','Babītes novads','Babītes novads'),(377,'LV','Baldones novads','Baldones novads'),(378,'LV','Baltinavas novads','Baltinavas novads'),(379,'LV','LV-BL','Balvu novads'),(380,'LV','LV-BU','Bauskas novads'),(381,'LV','Beverīnas novads','Beverīnas novads'),(382,'LV','Brocēnu novads','Brocēnu novads'),(383,'LV','Burtnieku novads','Burtnieku novads'),(384,'LV','Carnikavas novads','Carnikavas novads'),(385,'LV','Cesvaines novads','Cesvaines novads'),(386,'LV','Ciblas novads','Ciblas novads'),(387,'LV','LV-CE','Cēsu novads'),(388,'LV','Dagdas novads','Dagdas novads'),(389,'LV','LV-DA','Daugavpils novads'),(390,'LV','LV-DO','Dobeles novads'),(391,'LV','Dundagas novads','Dundagas novads'),(392,'LV','Durbes novads','Durbes novads'),(393,'LV','Engures novads','Engures novads'),(394,'LV','Garkalnes novads','Garkalnes novads'),(395,'LV','Grobiņas novads','Grobiņas novads'),(396,'LV','LV-GU','Gulbenes novads'),(397,'LV','Iecavas novads','Iecavas novads'),(398,'LV','Ikšķiles novads','Ikšķiles novads'),(399,'LV','Ilūkstes novads','Ilūkstes novads'),(400,'LV','Inčukalna novads','Inčukalna novads'),(401,'LV','Jaunjelgavas novads','Jaunjelgavas novads'),(402,'LV','Jaunpiebalgas novads','Jaunpiebalgas novads'),(403,'LV','Jaunpils novads','Jaunpils novads'),(404,'LV','LV-JL','Jelgavas novads'),(405,'LV','LV-JK','Jēkabpils novads'),(406,'LV','Kandavas novads','Kandavas novads'),(407,'LV','Kokneses novads','Kokneses novads'),(408,'LV','Krimuldas novads','Krimuldas novads'),(409,'LV','Krustpils novads','Krustpils novads'),(410,'LV','LV-KR','Krāslavas novads'),(411,'LV','LV-KU','Kuldīgas novads'),(412,'LV','Kārsavas novads','Kārsavas novads'),(413,'LV','Lielvārdes novads','Lielvārdes novads'),(414,'LV','LV-LM','Limbažu novads'),(415,'LV','Lubānas novads','Lubānas novads'),(416,'LV','LV-LU','Ludzas novads'),(417,'LV','Līgatnes novads','Līgatnes novads'),(418,'LV','Līvānu novads','Līvānu novads'),(419,'LV','LV-MA','Madonas novads'),(420,'LV','Mazsalacas novads','Mazsalacas novads'),(421,'LV','Mālpils novads','Mālpils novads'),(422,'LV','Mārupes novads','Mārupes novads'),(423,'LV','Naukšēnu novads','Naukšēnu novads'),(424,'LV','Neretas novads','Neretas novads'),(425,'LV','Nīcas novads','Nīcas novads'),(426,'LV','LV-OG','Ogres novads'),(427,'LV','Olaines novads','Olaines novads'),(428,'LV','Ozolnieku novads','Ozolnieku novads'),(429,'LV','LV-PR','Preiļu novads'),(430,'LV','Priekules novads','Priekules novads'),(431,'LV','Priekuļu novads','Priekuļu novads'),(432,'LV','Pārgaujas novads','Pārgaujas novads'),(433,'LV','Pāvilostas novads','Pāvilostas novads'),(434,'LV','Pļaviņu novads','Pļaviņu novads'),(435,'LV','Raunas novads','Raunas novads'),(436,'LV','Riebiņu novads','Riebiņu novads'),(437,'LV','Rojas novads','Rojas novads'),(438,'LV','Ropažu novads','Ropažu novads'),(439,'LV','Rucavas novads','Rucavas novads'),(440,'LV','Rugāju novads','Rugāju novads'),(441,'LV','Rundāles novads','Rundāles novads'),(442,'LV','LV-RE','Rēzeknes novads'),(443,'LV','Rūjienas novads','Rūjienas novads'),(444,'LV','Salacgrīvas novads','Salacgrīvas novads'),(445,'LV','Salas novads','Salas novads'),(446,'LV','Salaspils novads','Salaspils novads'),(447,'LV','LV-SA','Saldus novads'),(448,'LV','Saulkrastu novads','Saulkrastu novads'),(449,'LV','Siguldas novads','Siguldas novads'),(450,'LV','Skrundas novads','Skrundas novads'),(451,'LV','Skrīveru novads','Skrīveru novads'),(452,'LV','Smiltenes novads','Smiltenes novads'),(453,'LV','Stopiņu novads','Stopiņu novads'),(454,'LV','Strenču novads','Strenču novads'),(455,'LV','Sējas novads','Sējas novads'),(456,'LV','LV-TA','Talsu novads'),(457,'LV','LV-TU','Tukuma novads'),(458,'LV','Tērvetes novads','Tērvetes novads'),(459,'LV','Vaiņodes novads','Vaiņodes novads'),(460,'LV','LV-VK','Valkas novads'),(461,'LV','LV-VM','Valmieras novads'),(462,'LV','Varakļānu novads','Varakļānu novads'),(463,'LV','Vecpiebalgas novads','Vecpiebalgas novads'),(464,'LV','Vecumnieku novads','Vecumnieku novads'),(465,'LV','LV-VE','Ventspils novads'),(466,'LV','Viesītes novads','Viesītes novads'),(467,'LV','Viļakas novads','Viļakas novads'),(468,'LV','Viļānu novads','Viļānu novads'),(469,'LV','Vārkavas novads','Vārkavas novads'),(470,'LV','Zilupes novads','Zilupes novads'),(471,'LV','Ādažu novads','Ādažu novads'),(472,'LV','Ērgļu novads','Ērgļu novads'),(473,'LV','Ķeguma novads','Ķeguma novads'),(474,'LV','Ķekavas novads','Ķekavas novads'),(475,'LT','LT-AL','Alytaus Apskritis'),(476,'LT','LT-KU','Kauno Apskritis'),(477,'LT','LT-KL','Klaipėdos Apskritis'),(478,'LT','LT-MR','Marijampolės Apskritis'),(479,'LT','LT-PN','Panevėžio Apskritis'),(480,'LT','LT-SA','Šiaulių Apskritis'),(481,'LT','LT-TA','Tauragės Apskritis'),(482,'LT','LT-TE','Telšių Apskritis'),(483,'LT','LT-UT','Utenos Apskritis'),(484,'LT','LT-VL','Vilniaus Apskritis'),(485,'BR','AC','Acre'),(486,'BR','AL','Alagoas'),(487,'BR','AP','Amapá'),(488,'BR','AM','Amazonas'),(489,'BR','BA','Bahia'),(490,'BR','CE','Ceará'),(491,'BR','ES','Espírito Santo'),(492,'BR','GO','Goiás'),(493,'BR','MA','Maranhão'),(494,'BR','MT','Mato Grosso'),(495,'BR','MS','Mato Grosso do Sul'),(496,'BR','MG','Minas Gerais'),(497,'BR','PA','Pará'),(498,'BR','PB','Paraíba'),(499,'BR','PR','Paraná'),(500,'BR','PE','Pernambuco'),(501,'BR','PI','Piauí'),(502,'BR','RJ','Rio de Janeiro'),(503,'BR','RN','Rio Grande do Norte'),(504,'BR','RS','Rio Grande do Sul'),(505,'BR','RO','Rondônia'),(506,'BR','RR','Roraima'),(507,'BR','SC','Santa Catarina'),(508,'BR','SP','São Paulo'),(509,'BR','SE','Sergipe'),(510,'BR','TO','Tocantins'),(511,'BR','DF','Distrito Federal'),(512,'HR','HR-01','Zagrebačka županija'),(513,'HR','HR-02','Krapinsko-zagorska županija'),(514,'HR','HR-03','Sisačko-moslavačka županija'),(515,'HR','HR-04','Karlovačka županija'),(516,'HR','HR-05','Varaždinska županija'),(517,'HR','HR-06','Koprivničko-križevačka županija'),(518,'HR','HR-07','Bjelovarsko-bilogorska županija'),(519,'HR','HR-08','Primorsko-goranska županija'),(520,'HR','HR-09','Ličko-senjska županija'),(521,'HR','HR-10','Virovitičko-podravska županija'),(522,'HR','HR-11','Požeško-slavonska županija'),(523,'HR','HR-12','Brodsko-posavska županija'),(524,'HR','HR-13','Zadarska županija'),(525,'HR','HR-14','Osječko-baranjska županija'),(526,'HR','HR-15','Šibensko-kninska županija'),(527,'HR','HR-16','Vukovarsko-srijemska županija'),(528,'HR','HR-17','Splitsko-dalmatinska županija'),(529,'HR','HR-18','Istarska županija'),(530,'HR','HR-19','Dubrovačko-neretvanska županija'),(531,'HR','HR-20','Međimurska županija'),(532,'HR','HR-21','Grad Zagreb');
/*!40000 ALTER TABLE `csvp_directory_country_region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_directory_country_region_name`
--

DROP TABLE IF EXISTS `csvp_directory_country_region_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_directory_country_region_name` (
  `locale` varchar(8) NOT NULL COMMENT 'Locale',
  `region_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Region Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Region Name',
  PRIMARY KEY (`locale`,`region_id`),
  KEY `CSVP_DIRECTORY_COUNTRY_REGION_NAME_REGION_ID` (`region_id`),
  CONSTRAINT `FK_95F67D0C1605A9F7B597747C2B33EE25` FOREIGN KEY (`region_id`) REFERENCES `csvp_directory_country_region` (`region_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Directory Country Region Name';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_directory_country_region_name`
--

LOCK TABLES `csvp_directory_country_region_name` WRITE;
/*!40000 ALTER TABLE `csvp_directory_country_region_name` DISABLE KEYS */;
INSERT INTO `csvp_directory_country_region_name` VALUES ('en_US',1,'Alabama'),('en_US',2,'Alaska'),('en_US',3,'American Samoa'),('en_US',4,'Arizona'),('en_US',5,'Arkansas'),('en_US',6,'Armed Forces Africa'),('en_US',7,'Armed Forces Americas'),('en_US',8,'Armed Forces Canada'),('en_US',9,'Armed Forces Europe'),('en_US',10,'Armed Forces Middle East'),('en_US',11,'Armed Forces Pacific'),('en_US',12,'California'),('en_US',13,'Colorado'),('en_US',14,'Connecticut'),('en_US',15,'Delaware'),('en_US',16,'District of Columbia'),('en_US',17,'Federated States Of Micronesia'),('en_US',18,'Florida'),('en_US',19,'Georgia'),('en_US',20,'Guam'),('en_US',21,'Hawaii'),('en_US',22,'Idaho'),('en_US',23,'Illinois'),('en_US',24,'Indiana'),('en_US',25,'Iowa'),('en_US',26,'Kansas'),('en_US',27,'Kentucky'),('en_US',28,'Louisiana'),('en_US',29,'Maine'),('en_US',30,'Marshall Islands'),('en_US',31,'Maryland'),('en_US',32,'Massachusetts'),('en_US',33,'Michigan'),('en_US',34,'Minnesota'),('en_US',35,'Mississippi'),('en_US',36,'Missouri'),('en_US',37,'Montana'),('en_US',38,'Nebraska'),('en_US',39,'Nevada'),('en_US',40,'New Hampshire'),('en_US',41,'New Jersey'),('en_US',42,'New Mexico'),('en_US',43,'New York'),('en_US',44,'North Carolina'),('en_US',45,'North Dakota'),('en_US',46,'Northern Mariana Islands'),('en_US',47,'Ohio'),('en_US',48,'Oklahoma'),('en_US',49,'Oregon'),('en_US',50,'Palau'),('en_US',51,'Pennsylvania'),('en_US',52,'Puerto Rico'),('en_US',53,'Rhode Island'),('en_US',54,'South Carolina'),('en_US',55,'South Dakota'),('en_US',56,'Tennessee'),('en_US',57,'Texas'),('en_US',58,'Utah'),('en_US',59,'Vermont'),('en_US',60,'Virgin Islands'),('en_US',61,'Virginia'),('en_US',62,'Washington'),('en_US',63,'West Virginia'),('en_US',64,'Wisconsin'),('en_US',65,'Wyoming'),('en_US',66,'Alberta'),('en_US',67,'British Columbia'),('en_US',68,'Manitoba'),('en_US',69,'Newfoundland and Labrador'),('en_US',70,'New Brunswick'),('en_US',71,'Nova Scotia'),('en_US',72,'Northwest Territories'),('en_US',73,'Nunavut'),('en_US',74,'Ontario'),('en_US',75,'Prince Edward Island'),('en_US',76,'Quebec'),('en_US',77,'Saskatchewan'),('en_US',78,'Yukon Territory'),('en_US',79,'Niedersachsen'),('en_US',80,'Baden-Württemberg'),('en_US',81,'Bayern'),('en_US',82,'Berlin'),('en_US',83,'Brandenburg'),('en_US',84,'Bremen'),('en_US',85,'Hamburg'),('en_US',86,'Hessen'),('en_US',87,'Mecklenburg-Vorpommern'),('en_US',88,'Nordrhein-Westfalen'),('en_US',89,'Rheinland-Pfalz'),('en_US',90,'Saarland'),('en_US',91,'Sachsen'),('en_US',92,'Sachsen-Anhalt'),('en_US',93,'Schleswig-Holstein'),('en_US',94,'Thüringen'),('en_US',95,'Wien'),('en_US',96,'Niederösterreich'),('en_US',97,'Oberösterreich'),('en_US',98,'Salzburg'),('en_US',99,'Kärnten'),('en_US',100,'Steiermark'),('en_US',101,'Tirol'),('en_US',102,'Burgenland'),('en_US',103,'Vorarlberg'),('en_US',104,'Aargau'),('en_US',105,'Appenzell Innerrhoden'),('en_US',106,'Appenzell Ausserrhoden'),('en_US',107,'Bern'),('en_US',108,'Basel-Landschaft'),('en_US',109,'Basel-Stadt'),('en_US',110,'Freiburg'),('en_US',111,'Genf'),('en_US',112,'Glarus'),('en_US',113,'Graubünden'),('en_US',114,'Jura'),('en_US',115,'Luzern'),('en_US',116,'Neuenburg'),('en_US',117,'Nidwalden'),('en_US',118,'Obwalden'),('en_US',119,'St. Gallen'),('en_US',120,'Schaffhausen'),('en_US',121,'Solothurn'),('en_US',122,'Schwyz'),('en_US',123,'Thurgau'),('en_US',124,'Tessin'),('en_US',125,'Uri'),('en_US',126,'Waadt'),('en_US',127,'Wallis'),('en_US',128,'Zug'),('en_US',129,'Zürich'),('en_US',130,'A Coruña'),('en_US',131,'Alava'),('en_US',132,'Albacete'),('en_US',133,'Alicante'),('en_US',134,'Almeria'),('en_US',135,'Asturias'),('en_US',136,'Avila'),('en_US',137,'Badajoz'),('en_US',138,'Baleares'),('en_US',139,'Barcelona'),('en_US',140,'Burgos'),('en_US',141,'Caceres'),('en_US',142,'Cadiz'),('en_US',143,'Cantabria'),('en_US',144,'Castellon'),('en_US',145,'Ceuta'),('en_US',146,'Ciudad Real'),('en_US',147,'Cordoba'),('en_US',148,'Cuenca'),('en_US',149,'Girona'),('en_US',150,'Granada'),('en_US',151,'Guadalajara'),('en_US',152,'Guipuzcoa'),('en_US',153,'Huelva'),('en_US',154,'Huesca'),('en_US',155,'Jaen'),('en_US',156,'La Rioja'),('en_US',157,'Las Palmas'),('en_US',158,'Leon'),('en_US',159,'Lleida'),('en_US',160,'Lugo'),('en_US',161,'Madrid'),('en_US',162,'Malaga'),('en_US',163,'Melilla'),('en_US',164,'Murcia'),('en_US',165,'Navarra'),('en_US',166,'Ourense'),('en_US',167,'Palencia'),('en_US',168,'Pontevedra'),('en_US',169,'Salamanca'),('en_US',170,'Santa Cruz de Tenerife'),('en_US',171,'Segovia'),('en_US',172,'Sevilla'),('en_US',173,'Soria'),('en_US',174,'Tarragona'),('en_US',175,'Teruel'),('en_US',176,'Toledo'),('en_US',177,'Valencia'),('en_US',178,'Valladolid'),('en_US',179,'Vizcaya'),('en_US',180,'Zamora'),('en_US',181,'Zaragoza'),('en_US',182,'Ain'),('en_US',183,'Aisne'),('en_US',184,'Allier'),('en_US',185,'Alpes-de-Haute-Provence'),('en_US',186,'Hautes-Alpes'),('en_US',187,'Alpes-Maritimes'),('en_US',188,'Ardèche'),('en_US',189,'Ardennes'),('en_US',190,'Ariège'),('en_US',191,'Aube'),('en_US',192,'Aude'),('en_US',193,'Aveyron'),('en_US',194,'Bouches-du-Rhône'),('en_US',195,'Calvados'),('en_US',196,'Cantal'),('en_US',197,'Charente'),('en_US',198,'Charente-Maritime'),('en_US',199,'Cher'),('en_US',200,'Corrèze'),('en_US',201,'Corse-du-Sud'),('en_US',202,'Haute-Corse'),('en_US',203,'Côte-d\'Or'),('en_US',204,'Côtes-d\'Armor'),('en_US',205,'Creuse'),('en_US',206,'Dordogne'),('en_US',207,'Doubs'),('en_US',208,'Drôme'),('en_US',209,'Eure'),('en_US',210,'Eure-et-Loir'),('en_US',211,'Finistère'),('en_US',212,'Gard'),('en_US',213,'Haute-Garonne'),('en_US',214,'Gers'),('en_US',215,'Gironde'),('en_US',216,'Hérault'),('en_US',217,'Ille-et-Vilaine'),('en_US',218,'Indre'),('en_US',219,'Indre-et-Loire'),('en_US',220,'Isère'),('en_US',221,'Jura'),('en_US',222,'Landes'),('en_US',223,'Loir-et-Cher'),('en_US',224,'Loire'),('en_US',225,'Haute-Loire'),('en_US',226,'Loire-Atlantique'),('en_US',227,'Loiret'),('en_US',228,'Lot'),('en_US',229,'Lot-et-Garonne'),('en_US',230,'Lozère'),('en_US',231,'Maine-et-Loire'),('en_US',232,'Manche'),('en_US',233,'Marne'),('en_US',234,'Haute-Marne'),('en_US',235,'Mayenne'),('en_US',236,'Meurthe-et-Moselle'),('en_US',237,'Meuse'),('en_US',238,'Morbihan'),('en_US',239,'Moselle'),('en_US',240,'Nièvre'),('en_US',241,'Nord'),('en_US',242,'Oise'),('en_US',243,'Orne'),('en_US',244,'Pas-de-Calais'),('en_US',245,'Puy-de-Dôme'),('en_US',246,'Pyrénées-Atlantiques'),('en_US',247,'Hautes-Pyrénées'),('en_US',248,'Pyrénées-Orientales'),('en_US',249,'Bas-Rhin'),('en_US',250,'Haut-Rhin'),('en_US',251,'Rhône'),('en_US',252,'Haute-Saône'),('en_US',253,'Saône-et-Loire'),('en_US',254,'Sarthe'),('en_US',255,'Savoie'),('en_US',256,'Haute-Savoie'),('en_US',257,'Paris'),('en_US',258,'Seine-Maritime'),('en_US',259,'Seine-et-Marne'),('en_US',260,'Yvelines'),('en_US',261,'Deux-Sèvres'),('en_US',262,'Somme'),('en_US',263,'Tarn'),('en_US',264,'Tarn-et-Garonne'),('en_US',265,'Var'),('en_US',266,'Vaucluse'),('en_US',267,'Vendée'),('en_US',268,'Vienne'),('en_US',269,'Haute-Vienne'),('en_US',270,'Vosges'),('en_US',271,'Yonne'),('en_US',272,'Territoire-de-Belfort'),('en_US',273,'Essonne'),('en_US',274,'Hauts-de-Seine'),('en_US',275,'Seine-Saint-Denis'),('en_US',276,'Val-de-Marne'),('en_US',277,'Val-d\'Oise'),('en_US',278,'Alba'),('en_US',279,'Arad'),('en_US',280,'Argeş'),('en_US',281,'Bacău'),('en_US',282,'Bihor'),('en_US',283,'Bistriţa-Năsăud'),('en_US',284,'Botoşani'),('en_US',285,'Braşov'),('en_US',286,'Brăila'),('en_US',287,'Bucureşti'),('en_US',288,'Buzău'),('en_US',289,'Caraş-Severin'),('en_US',290,'Călăraşi'),('en_US',291,'Cluj'),('en_US',292,'Constanţa'),('en_US',293,'Covasna'),('en_US',294,'Dâmboviţa'),('en_US',295,'Dolj'),('en_US',296,'Galaţi'),('en_US',297,'Giurgiu'),('en_US',298,'Gorj'),('en_US',299,'Harghita'),('en_US',300,'Hunedoara'),('en_US',301,'Ialomiţa'),('en_US',302,'Iaşi'),('en_US',303,'Ilfov'),('en_US',304,'Maramureş'),('en_US',305,'Mehedinţi'),('en_US',306,'Mureş'),('en_US',307,'Neamţ'),('en_US',308,'Olt'),('en_US',309,'Prahova'),('en_US',310,'Satu-Mare'),('en_US',311,'Sălaj'),('en_US',312,'Sibiu'),('en_US',313,'Suceava'),('en_US',314,'Teleorman'),('en_US',315,'Timiş'),('en_US',316,'Tulcea'),('en_US',317,'Vaslui'),('en_US',318,'Vâlcea'),('en_US',319,'Vrancea'),('en_US',320,'Lappi'),('en_US',321,'Pohjois-Pohjanmaa'),('en_US',322,'Kainuu'),('en_US',323,'Pohjois-Karjala'),('en_US',324,'Pohjois-Savo'),('en_US',325,'Etelä-Savo'),('en_US',326,'Etelä-Pohjanmaa'),('en_US',327,'Pohjanmaa'),('en_US',328,'Pirkanmaa'),('en_US',329,'Satakunta'),('en_US',330,'Keski-Pohjanmaa'),('en_US',331,'Keski-Suomi'),('en_US',332,'Varsinais-Suomi'),('en_US',333,'Etelä-Karjala'),('en_US',334,'Päijät-Häme'),('en_US',335,'Kanta-Häme'),('en_US',336,'Uusimaa'),('en_US',337,'Itä-Uusimaa'),('en_US',338,'Kymenlaakso'),('en_US',339,'Ahvenanmaa'),('en_US',340,'Harjumaa'),('en_US',341,'Hiiumaa'),('en_US',342,'Ida-Virumaa'),('en_US',343,'Jõgevamaa'),('en_US',344,'Järvamaa'),('en_US',345,'Läänemaa'),('en_US',346,'Lääne-Virumaa'),('en_US',347,'Põlvamaa'),('en_US',348,'Pärnumaa'),('en_US',349,'Raplamaa'),('en_US',350,'Saaremaa'),('en_US',351,'Tartumaa'),('en_US',352,'Valgamaa'),('en_US',353,'Viljandimaa'),('en_US',354,'Võrumaa'),('en_US',355,'Daugavpils'),('en_US',356,'Jelgava'),('en_US',357,'Jēkabpils'),('en_US',358,'Jūrmala'),('en_US',359,'Liepāja'),('en_US',360,'Liepājas novads'),('en_US',361,'Rēzekne'),('en_US',362,'Rīga'),('en_US',363,'Rīgas novads'),('en_US',364,'Valmiera'),('en_US',365,'Ventspils'),('en_US',366,'Aglonas novads'),('en_US',367,'Aizkraukles novads'),('en_US',368,'Aizputes novads'),('en_US',369,'Aknīstes novads'),('en_US',370,'Alojas novads'),('en_US',371,'Alsungas novads'),('en_US',372,'Alūksnes novads'),('en_US',373,'Amatas novads'),('en_US',374,'Apes novads'),('en_US',375,'Auces novads'),('en_US',376,'Babītes novads'),('en_US',377,'Baldones novads'),('en_US',378,'Baltinavas novads'),('en_US',379,'Balvu novads'),('en_US',380,'Bauskas novads'),('en_US',381,'Beverīnas novads'),('en_US',382,'Brocēnu novads'),('en_US',383,'Burtnieku novads'),('en_US',384,'Carnikavas novads'),('en_US',385,'Cesvaines novads'),('en_US',386,'Ciblas novads'),('en_US',387,'Cēsu novads'),('en_US',388,'Dagdas novads'),('en_US',389,'Daugavpils novads'),('en_US',390,'Dobeles novads'),('en_US',391,'Dundagas novads'),('en_US',392,'Durbes novads'),('en_US',393,'Engures novads'),('en_US',394,'Garkalnes novads'),('en_US',395,'Grobiņas novads'),('en_US',396,'Gulbenes novads'),('en_US',397,'Iecavas novads'),('en_US',398,'Ikšķiles novads'),('en_US',399,'Ilūkstes novads'),('en_US',400,'Inčukalna novads'),('en_US',401,'Jaunjelgavas novads'),('en_US',402,'Jaunpiebalgas novads'),('en_US',403,'Jaunpils novads'),('en_US',404,'Jelgavas novads'),('en_US',405,'Jēkabpils novads'),('en_US',406,'Kandavas novads'),('en_US',407,'Kokneses novads'),('en_US',408,'Krimuldas novads'),('en_US',409,'Krustpils novads'),('en_US',410,'Krāslavas novads'),('en_US',411,'Kuldīgas novads'),('en_US',412,'Kārsavas novads'),('en_US',413,'Lielvārdes novads'),('en_US',414,'Limbažu novads'),('en_US',415,'Lubānas novads'),('en_US',416,'Ludzas novads'),('en_US',417,'Līgatnes novads'),('en_US',418,'Līvānu novads'),('en_US',419,'Madonas novads'),('en_US',420,'Mazsalacas novads'),('en_US',421,'Mālpils novads'),('en_US',422,'Mārupes novads'),('en_US',423,'Naukšēnu novads'),('en_US',424,'Neretas novads'),('en_US',425,'Nīcas novads'),('en_US',426,'Ogres novads'),('en_US',427,'Olaines novads'),('en_US',428,'Ozolnieku novads'),('en_US',429,'Preiļu novads'),('en_US',430,'Priekules novads'),('en_US',431,'Priekuļu novads'),('en_US',432,'Pārgaujas novads'),('en_US',433,'Pāvilostas novads'),('en_US',434,'Pļaviņu novads'),('en_US',435,'Raunas novads'),('en_US',436,'Riebiņu novads'),('en_US',437,'Rojas novads'),('en_US',438,'Ropažu novads'),('en_US',439,'Rucavas novads'),('en_US',440,'Rugāju novads'),('en_US',441,'Rundāles novads'),('en_US',442,'Rēzeknes novads'),('en_US',443,'Rūjienas novads'),('en_US',444,'Salacgrīvas novads'),('en_US',445,'Salas novads'),('en_US',446,'Salaspils novads'),('en_US',447,'Saldus novads'),('en_US',448,'Saulkrastu novads'),('en_US',449,'Siguldas novads'),('en_US',450,'Skrundas novads'),('en_US',451,'Skrīveru novads'),('en_US',452,'Smiltenes novads'),('en_US',453,'Stopiņu novads'),('en_US',454,'Strenču novads'),('en_US',455,'Sējas novads'),('en_US',456,'Talsu novads'),('en_US',457,'Tukuma novads'),('en_US',458,'Tērvetes novads'),('en_US',459,'Vaiņodes novads'),('en_US',460,'Valkas novads'),('en_US',461,'Valmieras novads'),('en_US',462,'Varakļānu novads'),('en_US',463,'Vecpiebalgas novads'),('en_US',464,'Vecumnieku novads'),('en_US',465,'Ventspils novads'),('en_US',466,'Viesītes novads'),('en_US',467,'Viļakas novads'),('en_US',468,'Viļānu novads'),('en_US',469,'Vārkavas novads'),('en_US',470,'Zilupes novads'),('en_US',471,'Ādažu novads'),('en_US',472,'Ērgļu novads'),('en_US',473,'Ķeguma novads'),('en_US',474,'Ķekavas novads'),('en_US',475,'Alytaus Apskritis'),('en_US',476,'Kauno Apskritis'),('en_US',477,'Klaipėdos Apskritis'),('en_US',478,'Marijampolės Apskritis'),('en_US',479,'Panevėžio Apskritis'),('en_US',480,'Šiaulių Apskritis'),('en_US',481,'Tauragės Apskritis'),('en_US',482,'Telšių Apskritis'),('en_US',483,'Utenos Apskritis'),('en_US',484,'Vilniaus Apskritis'),('en_US',485,'Acre'),('en_US',486,'Alagoas'),('en_US',487,'Amapá'),('en_US',488,'Amazonas'),('en_US',489,'Bahia'),('en_US',490,'Ceará'),('en_US',491,'Espírito Santo'),('en_US',492,'Goiás'),('en_US',493,'Maranhão'),('en_US',494,'Mato Grosso'),('en_US',495,'Mato Grosso do Sul'),('en_US',496,'Minas Gerais'),('en_US',497,'Pará'),('en_US',498,'Paraíba'),('en_US',499,'Paraná'),('en_US',500,'Pernambuco'),('en_US',501,'Piauí'),('en_US',502,'Rio de Janeiro'),('en_US',503,'Rio Grande do Norte'),('en_US',504,'Rio Grande do Sul'),('en_US',505,'Rondônia'),('en_US',506,'Roraima'),('en_US',507,'Santa Catarina'),('en_US',508,'São Paulo'),('en_US',509,'Sergipe'),('en_US',510,'Tocantins'),('en_US',511,'Distrito Federal'),('en_US',512,'Zagrebačka županija'),('en_US',513,'Krapinsko-zagorska županija'),('en_US',514,'Sisačko-moslavačka županija'),('en_US',515,'Karlovačka županija'),('en_US',516,'Varaždinska županija'),('en_US',517,'Koprivničko-križevačka županija'),('en_US',518,'Bjelovarsko-bilogorska županija'),('en_US',519,'Primorsko-goranska županija'),('en_US',520,'Ličko-senjska županija'),('en_US',521,'Virovitičko-podravska županija'),('en_US',522,'Požeško-slavonska županija'),('en_US',523,'Brodsko-posavska županija'),('en_US',524,'Zadarska županija'),('en_US',525,'Osječko-baranjska županija'),('en_US',526,'Šibensko-kninska županija'),('en_US',527,'Vukovarsko-srijemska županija'),('en_US',528,'Splitsko-dalmatinska županija'),('en_US',529,'Istarska županija'),('en_US',530,'Dubrovačko-neretvanska županija'),('en_US',531,'Međimurska županija'),('en_US',532,'Grad Zagreb');
/*!40000 ALTER TABLE `csvp_directory_country_region_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_directory_currency_rate`
--

DROP TABLE IF EXISTS `csvp_directory_currency_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_directory_currency_rate` (
  `currency_from` varchar(3) NOT NULL COMMENT 'Currency Code Convert From',
  `currency_to` varchar(3) NOT NULL COMMENT 'Currency Code Convert To',
  `rate` decimal(24,12) NOT NULL DEFAULT '0.000000000000' COMMENT 'Currency Conversion Rate',
  PRIMARY KEY (`currency_from`,`currency_to`),
  KEY `CSVP_DIRECTORY_CURRENCY_RATE_CURRENCY_TO` (`currency_to`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Directory Currency Rate';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_directory_currency_rate`
--

LOCK TABLES `csvp_directory_currency_rate` WRITE;
/*!40000 ALTER TABLE `csvp_directory_currency_rate` DISABLE KEYS */;
INSERT INTO `csvp_directory_currency_rate` VALUES ('EUR','EUR',1.000000000000),('EUR','USD',1.415000000000),('USD','EUR',0.706700000000),('USD','USD',1.000000000000);
/*!40000 ALTER TABLE `csvp_directory_currency_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_downloadable_link`
--

DROP TABLE IF EXISTS `csvp_downloadable_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_downloadable_link` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Link ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort order',
  `number_of_downloads` int(11) DEFAULT NULL COMMENT 'Number of downloads',
  `is_shareable` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Shareable flag',
  `link_url` varchar(255) DEFAULT NULL COMMENT 'Link Url',
  `link_file` varchar(255) DEFAULT NULL COMMENT 'Link File',
  `link_type` varchar(20) DEFAULT NULL COMMENT 'Link Type',
  `sample_url` varchar(255) DEFAULT NULL COMMENT 'Sample Url',
  `sample_file` varchar(255) DEFAULT NULL COMMENT 'Sample File',
  `sample_type` varchar(20) DEFAULT NULL COMMENT 'Sample Type',
  PRIMARY KEY (`link_id`),
  KEY `CSVP_DOWNLOADABLE_LINK_PRODUCT_ID_SORT_ORDER` (`product_id`,`sort_order`),
  CONSTRAINT `CSVP_DL_LNK_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `csvp_catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Downloadable Link Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_downloadable_link`
--

LOCK TABLES `csvp_downloadable_link` WRITE;
/*!40000 ALTER TABLE `csvp_downloadable_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_downloadable_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_downloadable_link_price`
--

DROP TABLE IF EXISTS `csvp_downloadable_link_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_downloadable_link_price` (
  `price_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Price ID',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Link ID',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website ID',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  PRIMARY KEY (`price_id`),
  KEY `CSVP_DOWNLOADABLE_LINK_PRICE_LINK_ID` (`link_id`),
  KEY `CSVP_DOWNLOADABLE_LINK_PRICE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `CSVP_DOWNLOADABLE_LINK_PRICE_LINK_ID_DOWNLOADABLE_LINK_LINK_ID` FOREIGN KEY (`link_id`) REFERENCES `csvp_downloadable_link` (`link_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_DOWNLOADABLE_LINK_PRICE_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `csvp_store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Downloadable Link Price Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_downloadable_link_price`
--

LOCK TABLES `csvp_downloadable_link_price` WRITE;
/*!40000 ALTER TABLE `csvp_downloadable_link_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_downloadable_link_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_downloadable_link_purchased`
--

DROP TABLE IF EXISTS `csvp_downloadable_link_purchased`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_downloadable_link_purchased` (
  `purchased_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Purchased ID',
  `order_id` int(10) unsigned DEFAULT '0' COMMENT 'Order ID',
  `order_increment_id` varchar(50) DEFAULT NULL COMMENT 'Order Increment ID',
  `order_item_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Order Item ID',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date of creation',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date of modification',
  `customer_id` int(10) unsigned DEFAULT '0' COMMENT 'Customer ID',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product name',
  `product_sku` varchar(255) DEFAULT NULL COMMENT 'Product sku',
  `link_section_title` varchar(255) DEFAULT NULL COMMENT 'Link_section_title',
  PRIMARY KEY (`purchased_id`),
  KEY `CSVP_DOWNLOADABLE_LINK_PURCHASED_ORDER_ID` (`order_id`),
  KEY `CSVP_DOWNLOADABLE_LINK_PURCHASED_ORDER_ITEM_ID` (`order_item_id`),
  KEY `CSVP_DOWNLOADABLE_LINK_PURCHASED_CUSTOMER_ID` (`customer_id`),
  CONSTRAINT `CSVP_DL_LNK_PURCHASED_CSTR_ID_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `csvp_customer_entity` (`entity_id`) ON DELETE SET NULL,
  CONSTRAINT `CSVP_DOWNLOADABLE_LINK_PURCHASED_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `csvp_sales_order` (`entity_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Downloadable Link Purchased Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_downloadable_link_purchased`
--

LOCK TABLES `csvp_downloadable_link_purchased` WRITE;
/*!40000 ALTER TABLE `csvp_downloadable_link_purchased` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_downloadable_link_purchased` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_downloadable_link_purchased_item`
--

DROP TABLE IF EXISTS `csvp_downloadable_link_purchased_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_downloadable_link_purchased_item` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Item ID',
  `purchased_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Purchased ID',
  `order_item_id` int(10) unsigned DEFAULT '0' COMMENT 'Order Item ID',
  `product_id` int(10) unsigned DEFAULT '0' COMMENT 'Product ID',
  `link_hash` varchar(255) DEFAULT NULL COMMENT 'Link hash',
  `number_of_downloads_bought` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Number of downloads bought',
  `number_of_downloads_used` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Number of downloads used',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Link ID',
  `link_title` varchar(255) DEFAULT NULL COMMENT 'Link Title',
  `is_shareable` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Shareable Flag',
  `link_url` varchar(255) DEFAULT NULL COMMENT 'Link Url',
  `link_file` varchar(255) DEFAULT NULL COMMENT 'Link File',
  `link_type` varchar(255) DEFAULT NULL COMMENT 'Link Type',
  `status` varchar(50) DEFAULT NULL COMMENT 'Status',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation Time',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update Time',
  PRIMARY KEY (`item_id`),
  KEY `CSVP_DOWNLOADABLE_LINK_PURCHASED_ITEM_LINK_HASH` (`link_hash`),
  KEY `CSVP_DOWNLOADABLE_LINK_PURCHASED_ITEM_ORDER_ITEM_ID` (`order_item_id`),
  KEY `CSVP_DOWNLOADABLE_LINK_PURCHASED_ITEM_PURCHASED_ID` (`purchased_id`),
  CONSTRAINT `FK_2C9C750E247CF838F2300B7E48DE750F` FOREIGN KEY (`order_item_id`) REFERENCES `csvp_sales_order_item` (`item_id`) ON DELETE SET NULL,
  CONSTRAINT `FK_CBEC726012CE91CD567452A707FD0715` FOREIGN KEY (`purchased_id`) REFERENCES `csvp_downloadable_link_purchased` (`purchased_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Downloadable Link Purchased Item Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_downloadable_link_purchased_item`
--

LOCK TABLES `csvp_downloadable_link_purchased_item` WRITE;
/*!40000 ALTER TABLE `csvp_downloadable_link_purchased_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_downloadable_link_purchased_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_downloadable_link_title`
--

DROP TABLE IF EXISTS `csvp_downloadable_link_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_downloadable_link_title` (
  `title_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Title ID',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Link ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  PRIMARY KEY (`title_id`),
  UNIQUE KEY `CSVP_DOWNLOADABLE_LINK_TITLE_LINK_ID_STORE_ID` (`link_id`,`store_id`),
  KEY `CSVP_DOWNLOADABLE_LINK_TITLE_STORE_ID` (`store_id`),
  CONSTRAINT `CSVP_DOWNLOADABLE_LINK_TITLE_LINK_ID_DOWNLOADABLE_LINK_LINK_ID` FOREIGN KEY (`link_id`) REFERENCES `csvp_downloadable_link` (`link_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_DOWNLOADABLE_LINK_TITLE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Link Title Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_downloadable_link_title`
--

LOCK TABLES `csvp_downloadable_link_title` WRITE;
/*!40000 ALTER TABLE `csvp_downloadable_link_title` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_downloadable_link_title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_downloadable_sample`
--

DROP TABLE IF EXISTS `csvp_downloadable_sample`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_downloadable_sample` (
  `sample_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Sample ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `sample_url` varchar(255) DEFAULT NULL COMMENT 'Sample URL',
  `sample_file` varchar(255) DEFAULT NULL COMMENT 'Sample file',
  `sample_type` varchar(20) DEFAULT NULL COMMENT 'Sample Type',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`sample_id`),
  KEY `CSVP_DOWNLOADABLE_SAMPLE_PRODUCT_ID` (`product_id`),
  CONSTRAINT `CSVP_DL_SAMPLE_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `csvp_catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Downloadable Sample Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_downloadable_sample`
--

LOCK TABLES `csvp_downloadable_sample` WRITE;
/*!40000 ALTER TABLE `csvp_downloadable_sample` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_downloadable_sample` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_downloadable_sample_title`
--

DROP TABLE IF EXISTS `csvp_downloadable_sample_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_downloadable_sample_title` (
  `title_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Title ID',
  `sample_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sample ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  PRIMARY KEY (`title_id`),
  UNIQUE KEY `CSVP_DOWNLOADABLE_SAMPLE_TITLE_SAMPLE_ID_STORE_ID` (`sample_id`,`store_id`),
  KEY `CSVP_DOWNLOADABLE_SAMPLE_TITLE_STORE_ID` (`store_id`),
  CONSTRAINT `CSVP_DL_SAMPLE_TTL_SAMPLE_ID_DL_SAMPLE_SAMPLE_ID` FOREIGN KEY (`sample_id`) REFERENCES `csvp_downloadable_sample` (`sample_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_DOWNLOADABLE_SAMPLE_TITLE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Downloadable Sample Title Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_downloadable_sample_title`
--

LOCK TABLES `csvp_downloadable_sample_title` WRITE;
/*!40000 ALTER TABLE `csvp_downloadable_sample_title` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_downloadable_sample_title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_eav_attribute`
--

DROP TABLE IF EXISTS `csvp_eav_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_eav_attribute` (
  `attribute_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Attribute Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_code` varchar(255) NOT NULL COMMENT 'Attribute Code',
  `attribute_model` varchar(255) DEFAULT NULL COMMENT 'Attribute Model',
  `backend_model` varchar(255) DEFAULT NULL COMMENT 'Backend Model',
  `backend_type` varchar(8) NOT NULL DEFAULT 'static' COMMENT 'Backend Type',
  `backend_table` varchar(255) DEFAULT NULL COMMENT 'Backend Table',
  `frontend_model` varchar(255) DEFAULT NULL COMMENT 'Frontend Model',
  `frontend_input` varchar(50) DEFAULT NULL COMMENT 'Frontend Input',
  `frontend_label` varchar(255) DEFAULT NULL COMMENT 'Frontend Label',
  `frontend_class` varchar(255) DEFAULT NULL COMMENT 'Frontend Class',
  `source_model` varchar(255) DEFAULT NULL COMMENT 'Source Model',
  `is_required` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Defines Is Required',
  `is_user_defined` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Defines Is User Defined',
  `default_value` text COMMENT 'Default Value',
  `is_unique` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Defines Is Unique',
  `note` varchar(255) DEFAULT NULL COMMENT 'Note',
  PRIMARY KEY (`attribute_id`),
  UNIQUE KEY `CSVP_EAV_ATTRIBUTE_ENTITY_TYPE_ID_ATTRIBUTE_CODE` (`entity_type_id`,`attribute_code`),
  CONSTRAINT `CSVP_EAV_ATTRIBUTE_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `csvp_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8 COMMENT='Eav Attribute';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_eav_attribute`
--

LOCK TABLES `csvp_eav_attribute` WRITE;
/*!40000 ALTER TABLE `csvp_eav_attribute` DISABLE KEYS */;
INSERT INTO `csvp_eav_attribute` VALUES (1,1,'website_id',NULL,'Magento\\Customer\\Model\\Customer\\Attribute\\Backend\\Website','static',NULL,NULL,'select','Associate to Website',NULL,'Magento\\Customer\\Model\\Customer\\Attribute\\Source\\Website',1,0,NULL,0,NULL),(2,1,'store_id',NULL,'Magento\\Customer\\Model\\Customer\\Attribute\\Backend\\Store','static',NULL,NULL,'select','Create In',NULL,'Magento\\Customer\\Model\\Customer\\Attribute\\Source\\Store',1,0,NULL,0,NULL),(3,1,'created_in',NULL,NULL,'static',NULL,NULL,'text','Created From',NULL,NULL,0,0,NULL,0,NULL),(4,1,'prefix',NULL,NULL,'static',NULL,NULL,'text','Name Prefix',NULL,NULL,0,0,NULL,0,NULL),(5,1,'firstname',NULL,NULL,'static',NULL,NULL,'text','First Name',NULL,NULL,1,0,NULL,0,NULL),(6,1,'middlename',NULL,NULL,'static',NULL,NULL,'text','Middle Name/Initial',NULL,NULL,0,0,NULL,0,NULL),(7,1,'lastname',NULL,NULL,'static',NULL,NULL,'text','Last Name',NULL,NULL,1,0,NULL,0,NULL),(8,1,'suffix',NULL,NULL,'static',NULL,NULL,'text','Name Suffix',NULL,NULL,0,0,NULL,0,NULL),(9,1,'email',NULL,NULL,'static',NULL,NULL,'text','Email',NULL,NULL,1,0,NULL,0,NULL),(10,1,'group_id',NULL,NULL,'static',NULL,NULL,'select','Group',NULL,'Magento\\Customer\\Model\\Customer\\Attribute\\Source\\Group',1,0,NULL,0,NULL),(11,1,'dob',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Backend\\Datetime','static',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Frontend\\Datetime','date','Date of Birth',NULL,NULL,0,0,NULL,0,NULL),(12,1,'password_hash',NULL,'Magento\\Customer\\Model\\Customer\\Attribute\\Backend\\Password','static',NULL,NULL,'hidden',NULL,NULL,NULL,0,0,NULL,0,NULL),(13,1,'rp_token',NULL,NULL,'static',NULL,NULL,'hidden',NULL,NULL,NULL,0,0,NULL,0,NULL),(14,1,'rp_token_created_at',NULL,NULL,'static',NULL,NULL,'date',NULL,NULL,NULL,0,0,NULL,0,NULL),(15,1,'default_billing',NULL,'Magento\\Customer\\Model\\Customer\\Attribute\\Backend\\Billing','static',NULL,NULL,'text','Default Billing Address',NULL,NULL,0,0,NULL,0,NULL),(16,1,'default_shipping',NULL,'Magento\\Customer\\Model\\Customer\\Attribute\\Backend\\Shipping','static',NULL,NULL,'text','Default Shipping Address',NULL,NULL,0,0,NULL,0,NULL),(17,1,'taxvat',NULL,NULL,'static',NULL,NULL,'text','Tax/VAT Number',NULL,NULL,0,0,NULL,0,NULL),(18,1,'confirmation',NULL,NULL,'static',NULL,NULL,'text','Is Confirmed',NULL,NULL,0,0,NULL,0,NULL),(19,1,'created_at',NULL,NULL,'static',NULL,NULL,'date','Created At',NULL,NULL,0,0,NULL,0,NULL),(20,1,'gender',NULL,NULL,'static',NULL,NULL,'select','Gender',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Source\\Table',0,0,NULL,0,NULL),(21,1,'disable_auto_group_change',NULL,'Magento\\Customer\\Model\\Attribute\\Backend\\Data\\Boolean','static',NULL,NULL,'boolean','Disable Automatic Group Change Based on VAT ID',NULL,NULL,0,0,NULL,0,NULL),(22,2,'prefix',NULL,NULL,'static',NULL,NULL,'text','Name Prefix',NULL,NULL,0,0,NULL,0,NULL),(23,2,'firstname',NULL,NULL,'static',NULL,NULL,'text','First Name',NULL,NULL,1,0,NULL,0,NULL),(24,2,'middlename',NULL,NULL,'static',NULL,NULL,'text','Middle Name/Initial',NULL,NULL,0,0,NULL,0,NULL),(25,2,'lastname',NULL,NULL,'static',NULL,NULL,'text','Last Name',NULL,NULL,1,0,NULL,0,NULL),(26,2,'suffix',NULL,NULL,'static',NULL,NULL,'text','Name Suffix',NULL,NULL,0,0,NULL,0,NULL),(27,2,'company',NULL,NULL,'static',NULL,NULL,'text','Company',NULL,NULL,0,0,NULL,0,NULL),(28,2,'street',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Backend\\DefaultBackend','static',NULL,NULL,'multiline','Street Address',NULL,NULL,1,0,NULL,0,NULL),(29,2,'city',NULL,NULL,'static',NULL,NULL,'text','City',NULL,NULL,1,0,NULL,0,NULL),(30,2,'country_id',NULL,NULL,'static',NULL,NULL,'select','Country',NULL,'Magento\\Customer\\Model\\ResourceModel\\Address\\Attribute\\Source\\Country',1,0,NULL,0,NULL),(31,2,'region',NULL,'Magento\\Customer\\Model\\ResourceModel\\Address\\Attribute\\Backend\\Region','static',NULL,NULL,'text','State/Province',NULL,NULL,0,0,NULL,0,NULL),(32,2,'region_id',NULL,NULL,'static',NULL,NULL,'hidden','State/Province',NULL,'Magento\\Customer\\Model\\ResourceModel\\Address\\Attribute\\Source\\Region',0,0,NULL,0,NULL),(33,2,'postcode',NULL,NULL,'static',NULL,NULL,'text','Zip/Postal Code',NULL,NULL,0,0,NULL,0,NULL),(34,2,'telephone',NULL,NULL,'static',NULL,NULL,'text','Phone Number',NULL,NULL,1,0,NULL,0,NULL),(35,2,'fax',NULL,NULL,'static',NULL,NULL,'text','Fax',NULL,NULL,0,0,NULL,0,NULL),(36,2,'vat_id',NULL,NULL,'static',NULL,NULL,'text','VAT Number',NULL,NULL,0,0,NULL,0,NULL),(37,2,'vat_is_valid',NULL,NULL,'static',NULL,NULL,'text','VAT number validity',NULL,NULL,0,0,NULL,0,NULL),(38,2,'vat_request_id',NULL,NULL,'static',NULL,NULL,'text','VAT number validation request ID',NULL,NULL,0,0,NULL,0,NULL),(39,2,'vat_request_date',NULL,NULL,'static',NULL,NULL,'text','VAT number validation request date',NULL,NULL,0,0,NULL,0,NULL),(40,2,'vat_request_success',NULL,NULL,'static',NULL,NULL,'text','VAT number validation request success',NULL,NULL,0,0,NULL,0,NULL),(41,1,'updated_at',NULL,NULL,'static',NULL,NULL,'date','Updated At',NULL,NULL,0,0,NULL,0,NULL),(42,1,'failures_num',NULL,NULL,'static',NULL,NULL,'hidden','Failures Number',NULL,NULL,0,0,NULL,0,NULL),(43,1,'first_failure',NULL,NULL,'static',NULL,NULL,'date','First Failure Date',NULL,NULL,0,0,NULL,0,NULL),(44,1,'lock_expires',NULL,NULL,'static',NULL,NULL,'date','Failures Number',NULL,NULL,0,0,NULL,0,NULL),(45,3,'name',NULL,NULL,'varchar',NULL,NULL,'text','Name',NULL,NULL,1,0,NULL,0,NULL),(46,3,'is_active',NULL,NULL,'int',NULL,NULL,'select','Is Active',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Source\\Boolean',1,0,NULL,0,NULL),(47,3,'description',NULL,NULL,'text',NULL,NULL,'textarea','Description',NULL,NULL,0,0,NULL,0,NULL),(48,3,'image',NULL,'Magento\\Catalog\\Model\\Category\\Attribute\\Backend\\Image','varchar',NULL,NULL,'image','Image',NULL,NULL,0,0,NULL,0,NULL),(49,3,'meta_title',NULL,NULL,'varchar',NULL,NULL,'text','Page Title',NULL,NULL,0,0,NULL,0,NULL),(50,3,'meta_keywords',NULL,NULL,'text',NULL,NULL,'textarea','Meta Keywords',NULL,NULL,0,0,NULL,0,NULL),(51,3,'meta_description',NULL,NULL,'text',NULL,NULL,'textarea','Meta Description',NULL,NULL,0,0,NULL,0,NULL),(52,3,'display_mode',NULL,NULL,'varchar',NULL,NULL,'select','Display Mode',NULL,'Magento\\Catalog\\Model\\Category\\Attribute\\Source\\Mode',0,0,NULL,0,NULL),(53,3,'landing_page',NULL,NULL,'int',NULL,NULL,'select','CMS Block',NULL,'Magento\\Catalog\\Model\\Category\\Attribute\\Source\\Page',0,0,NULL,0,NULL),(54,3,'is_anchor',NULL,NULL,'int',NULL,NULL,'select','Is Anchor',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Source\\Boolean',0,0,'1',0,NULL),(55,3,'path',NULL,NULL,'static',NULL,NULL,'text','Path',NULL,NULL,0,0,NULL,0,NULL),(56,3,'position',NULL,NULL,'static',NULL,NULL,'text','Position',NULL,NULL,0,0,NULL,0,NULL),(57,3,'all_children',NULL,NULL,'text',NULL,NULL,'text',NULL,NULL,NULL,0,0,NULL,0,NULL),(58,3,'path_in_store',NULL,NULL,'text',NULL,NULL,'text',NULL,NULL,NULL,0,0,NULL,0,NULL),(59,3,'children',NULL,NULL,'text',NULL,NULL,'text',NULL,NULL,NULL,0,0,NULL,0,NULL),(60,3,'custom_design',NULL,NULL,'varchar',NULL,NULL,'select','Custom Design',NULL,'Magento\\Theme\\Model\\Theme\\Source\\Theme',0,0,NULL,0,NULL),(61,3,'custom_design_from','Magento\\Catalog\\Model\\ResourceModel\\Eav\\Attribute','Magento\\Catalog\\Model\\Attribute\\Backend\\Startdate','datetime',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Frontend\\Datetime','date','Active From',NULL,NULL,0,0,NULL,0,NULL),(62,3,'custom_design_to',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Backend\\Datetime','datetime',NULL,NULL,'date','Active To',NULL,NULL,0,0,NULL,0,NULL),(63,3,'page_layout',NULL,NULL,'varchar',NULL,NULL,'select','Page Layout',NULL,'Magento\\Catalog\\Model\\Category\\Attribute\\Source\\Layout',0,0,NULL,0,NULL),(64,3,'custom_layout_update',NULL,'Magento\\Catalog\\Model\\Attribute\\Backend\\Customlayoutupdate','text',NULL,NULL,'textarea','Custom Layout Update',NULL,NULL,0,0,NULL,0,NULL),(65,3,'level',NULL,NULL,'static',NULL,NULL,'text','Level',NULL,NULL,0,0,NULL,0,NULL),(66,3,'children_count',NULL,NULL,'static',NULL,NULL,'text','Children Count',NULL,NULL,0,0,NULL,0,NULL),(67,3,'available_sort_by',NULL,'Magento\\Catalog\\Model\\Category\\Attribute\\Backend\\Sortby','text',NULL,NULL,'multiselect','Available Product Listing Sort By',NULL,'Magento\\Catalog\\Model\\Category\\Attribute\\Source\\Sortby',1,0,NULL,0,NULL),(68,3,'default_sort_by',NULL,'Magento\\Catalog\\Model\\Category\\Attribute\\Backend\\Sortby','varchar',NULL,NULL,'select','Default Product Listing Sort By',NULL,'Magento\\Catalog\\Model\\Category\\Attribute\\Source\\Sortby',1,0,NULL,0,NULL),(69,3,'include_in_menu',NULL,NULL,'int',NULL,NULL,'select','Include in Navigation Menu',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Source\\Boolean',1,0,'1',0,NULL),(70,3,'custom_use_parent_settings',NULL,NULL,'int',NULL,NULL,'select','Use Parent Category Settings',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Source\\Boolean',0,0,NULL,0,NULL),(71,3,'custom_apply_to_products',NULL,NULL,'int',NULL,NULL,'select','Apply To Products',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Source\\Boolean',0,0,NULL,0,NULL),(72,3,'filter_price_range',NULL,NULL,'decimal',NULL,NULL,'text','Layered Navigation Price Step',NULL,NULL,0,0,NULL,0,NULL),(73,4,'name',NULL,NULL,'varchar',NULL,NULL,'text','Product Name','validate-length maximum-length-255',NULL,1,0,NULL,0,NULL),(74,4,'sku',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Sku','static',NULL,NULL,'text','SKU','validate-length maximum-length-64',NULL,1,0,NULL,1,NULL),(75,4,'description',NULL,NULL,'text',NULL,NULL,'textarea','Description',NULL,NULL,0,0,NULL,0,NULL),(76,4,'short_description',NULL,NULL,'text',NULL,NULL,'textarea','Short Description',NULL,NULL,0,0,NULL,0,NULL),(77,4,'price',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Price','decimal',NULL,NULL,'price','Price',NULL,NULL,1,0,NULL,0,NULL),(78,4,'special_price',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Price','decimal',NULL,NULL,'price','Special Price',NULL,NULL,0,0,NULL,0,NULL),(79,4,'special_from_date',NULL,'Magento\\Catalog\\Model\\Attribute\\Backend\\Startdate','datetime',NULL,NULL,'date','Special Price From Date',NULL,NULL,0,0,NULL,0,NULL),(80,4,'special_to_date',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Backend\\Datetime','datetime',NULL,NULL,'date','Special Price To Date',NULL,NULL,0,0,NULL,0,NULL),(81,4,'cost',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Price','decimal',NULL,NULL,'price','Cost',NULL,NULL,0,1,NULL,0,NULL),(82,4,'weight',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Weight','decimal',NULL,NULL,'weight','Weight',NULL,NULL,0,0,NULL,0,NULL),(83,4,'manufacturer',NULL,NULL,'int',NULL,NULL,'select','Manufacturer',NULL,NULL,0,1,NULL,0,NULL),(84,4,'meta_title',NULL,NULL,'varchar',NULL,NULL,'text','Meta Title',NULL,NULL,0,0,NULL,0,NULL),(85,4,'meta_keyword',NULL,NULL,'text',NULL,NULL,'textarea','Meta Keywords',NULL,NULL,0,0,NULL,0,NULL),(86,4,'meta_description',NULL,NULL,'varchar',NULL,NULL,'textarea','Meta Description',NULL,NULL,0,0,NULL,0,'Maximum 255 chars. Meta Description should optimally be between 150-160 characters'),(87,4,'image',NULL,NULL,'varchar',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Frontend\\Image','media_image','Base',NULL,NULL,0,0,NULL,0,NULL),(88,4,'small_image',NULL,NULL,'varchar',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Frontend\\Image','media_image','Small',NULL,NULL,0,0,NULL,0,NULL),(89,4,'thumbnail',NULL,NULL,'varchar',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Frontend\\Image','media_image','Thumbnail',NULL,NULL,0,0,NULL,0,NULL),(90,4,'media_gallery',NULL,NULL,'static',NULL,NULL,'gallery','Media Gallery',NULL,NULL,0,0,NULL,0,NULL),(91,4,'old_id',NULL,NULL,'int',NULL,NULL,'text',NULL,NULL,NULL,0,0,NULL,0,NULL),(92,4,'tier_price',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Tierprice','decimal',NULL,NULL,'text','Tier Price',NULL,NULL,0,0,NULL,0,NULL),(93,4,'color',NULL,NULL,'int',NULL,NULL,'select','Color',NULL,NULL,0,1,NULL,0,NULL),(94,4,'news_from_date',NULL,'Magento\\Catalog\\Model\\Attribute\\Backend\\Startdate','datetime',NULL,NULL,'date','Set Product as New from Date',NULL,NULL,0,0,NULL,0,NULL),(95,4,'news_to_date',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Backend\\Datetime','datetime',NULL,NULL,'date','Set Product as New to Date',NULL,NULL,0,0,NULL,0,NULL),(96,4,'gallery',NULL,NULL,'varchar',NULL,NULL,'gallery','Image Gallery',NULL,NULL,0,0,NULL,0,NULL),(97,4,'status',NULL,NULL,'int',NULL,NULL,'select','Enable Product',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Source\\Status',0,0,'1',0,NULL),(98,4,'minimal_price',NULL,NULL,'decimal',NULL,NULL,'price','Minimal Price',NULL,NULL,0,0,NULL,0,NULL),(99,4,'visibility',NULL,NULL,'int',NULL,NULL,'select','Visibility',NULL,'Magento\\Catalog\\Model\\Product\\Visibility',0,0,'4',0,NULL),(100,4,'custom_design',NULL,NULL,'varchar',NULL,NULL,'select','New Theme',NULL,'Magento\\Theme\\Model\\Theme\\Source\\Theme',0,0,NULL,0,NULL),(101,4,'custom_design_from',NULL,'Magento\\Catalog\\Model\\Attribute\\Backend\\Startdate','datetime',NULL,NULL,'date','Active From',NULL,NULL,0,0,NULL,0,NULL),(102,4,'custom_design_to',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Backend\\Datetime','datetime',NULL,NULL,'date','Active To',NULL,NULL,0,0,NULL,0,NULL),(103,4,'custom_layout_update',NULL,'Magento\\Catalog\\Model\\Attribute\\Backend\\Customlayoutupdate','text',NULL,NULL,'textarea','Layout Update XML',NULL,NULL,0,0,NULL,0,NULL),(104,4,'page_layout',NULL,NULL,'varchar',NULL,NULL,'select','Layout',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Source\\Layout',0,0,NULL,0,NULL),(105,4,'category_ids',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Category','static',NULL,NULL,'text','Categories',NULL,NULL,0,0,NULL,0,NULL),(106,4,'options_container',NULL,NULL,'varchar',NULL,NULL,'select','Display Product Options In',NULL,'Magento\\Catalog\\Model\\Entity\\Product\\Attribute\\Design\\Options\\Container',0,0,'container2',0,NULL),(107,4,'required_options',NULL,NULL,'static',NULL,NULL,'text',NULL,NULL,NULL,0,0,NULL,0,NULL),(108,4,'has_options',NULL,NULL,'static',NULL,NULL,'text',NULL,NULL,NULL,0,0,NULL,0,NULL),(109,4,'image_label',NULL,NULL,'varchar',NULL,NULL,'text','Image Label',NULL,NULL,0,0,NULL,0,NULL),(110,4,'small_image_label',NULL,NULL,'varchar',NULL,NULL,'text','Small Image Label',NULL,NULL,0,0,NULL,0,NULL),(111,4,'thumbnail_label',NULL,NULL,'varchar',NULL,NULL,'text','Thumbnail Label',NULL,NULL,0,0,NULL,0,NULL),(112,4,'created_at',NULL,NULL,'static',NULL,NULL,'date',NULL,NULL,NULL,1,0,NULL,0,NULL),(113,4,'updated_at',NULL,NULL,'static',NULL,NULL,'date',NULL,NULL,NULL,1,0,NULL,0,NULL),(114,4,'country_of_manufacture',NULL,NULL,'varchar',NULL,NULL,'select','Country of Manufacture',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Source\\Countryofmanufacture',0,0,NULL,0,NULL),(115,4,'quantity_and_stock_status',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Stock','int',NULL,NULL,'select','Quantity',NULL,'Magento\\CatalogInventory\\Model\\Source\\Stock',0,0,'1',0,NULL),(116,4,'custom_layout',NULL,NULL,'varchar',NULL,NULL,'select','New Layout',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Source\\Layout',0,0,NULL,0,NULL),(117,3,'url_key',NULL,NULL,'varchar',NULL,NULL,'text','URL Key',NULL,NULL,0,0,NULL,0,NULL),(118,3,'url_path',NULL,NULL,'varchar',NULL,NULL,'text',NULL,NULL,NULL,0,0,NULL,0,NULL),(119,4,'url_key',NULL,NULL,'varchar',NULL,NULL,'text','URL Key',NULL,NULL,0,0,NULL,0,NULL),(120,4,'url_path',NULL,NULL,'varchar',NULL,NULL,'text',NULL,NULL,NULL,0,0,NULL,0,NULL),(121,4,'msrp',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Price','decimal',NULL,NULL,'price','Manufacturer\'s Suggested Retail Price',NULL,NULL,0,0,NULL,0,NULL),(122,4,'msrp_display_actual_price_type',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Boolean','varchar',NULL,NULL,'select','Display Actual Price',NULL,'Magento\\Msrp\\Model\\Product\\Attribute\\Source\\Type\\Price',0,0,'0',0,NULL),(123,4,'price_type',NULL,NULL,'int',NULL,NULL,'boolean','Dynamic Price',NULL,NULL,1,0,'0',0,NULL),(124,4,'sku_type',NULL,NULL,'int',NULL,NULL,'boolean','Dynamic SKU',NULL,NULL,1,0,'0',0,NULL),(125,4,'weight_type',NULL,NULL,'int',NULL,NULL,'boolean','Dynamic Weight',NULL,NULL,1,0,'0',0,NULL),(126,4,'price_view',NULL,NULL,'int',NULL,NULL,'select','Price View',NULL,'Magento\\Bundle\\Model\\Product\\Attribute\\Source\\Price\\View',1,0,NULL,0,NULL),(127,4,'shipment_type',NULL,NULL,'int',NULL,NULL,'select','Ship Bundle Items',NULL,'Magento\\Bundle\\Model\\Product\\Attribute\\Source\\Shipment\\Type',1,0,'0',0,NULL),(128,4,'links_purchased_separately',NULL,NULL,'int',NULL,NULL,NULL,'Links can be purchased separately',NULL,NULL,1,0,NULL,0,NULL),(129,4,'samples_title',NULL,NULL,'varchar',NULL,NULL,NULL,'Samples title',NULL,NULL,1,0,NULL,0,NULL),(130,4,'links_title',NULL,NULL,'varchar',NULL,NULL,NULL,'Links title',NULL,NULL,1,0,NULL,0,NULL),(131,4,'links_exist',NULL,NULL,'int',NULL,NULL,NULL,NULL,NULL,NULL,0,0,'0',0,NULL),(132,4,'gift_message_available',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Boolean','varchar',NULL,NULL,'select','Allow Gift Message',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Source\\Boolean',0,0,NULL,0,NULL),(133,4,'swatch_image',NULL,NULL,'varchar',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Frontend\\Image','media_image','Swatch',NULL,NULL,0,0,NULL,0,NULL),(134,4,'tax_class_id',NULL,NULL,'int',NULL,NULL,'select','Tax Class',NULL,'Magento\\Tax\\Model\\TaxClass\\Source\\Product',0,0,'2',0,NULL);
/*!40000 ALTER TABLE `csvp_eav_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_eav_attribute_group`
--

DROP TABLE IF EXISTS `csvp_eav_attribute_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_eav_attribute_group` (
  `attribute_group_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Attribute Group Id',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Set Id',
  `attribute_group_name` varchar(255) DEFAULT NULL COMMENT 'Attribute Group Name',
  `sort_order` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `default_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Default Id',
  `attribute_group_code` varchar(255) NOT NULL COMMENT 'Attribute Group Code',
  `tab_group_code` varchar(255) DEFAULT NULL COMMENT 'Tab Group Code',
  PRIMARY KEY (`attribute_group_id`),
  UNIQUE KEY `CSVP_CAT_CTGR_PRD_ATTR_SET_ID_ATTR_GROUP_CODE` (`attribute_set_id`,`attribute_group_code`),
  UNIQUE KEY `CSVP_EAV_ATTRIBUTE_GROUP_ATTRIBUTE_SET_ID_ATTRIBUTE_GROUP_NAME` (`attribute_set_id`,`attribute_group_name`),
  KEY `CSVP_EAV_ATTRIBUTE_GROUP_ATTRIBUTE_SET_ID_SORT_ORDER` (`attribute_set_id`,`sort_order`),
  CONSTRAINT `CSVP_EAV_ATTR_GROUP_ATTR_SET_ID_EAV_ATTR_SET_ATTR_SET_ID` FOREIGN KEY (`attribute_set_id`) REFERENCES `csvp_eav_attribute_set` (`attribute_set_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='Eav Attribute Group';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_eav_attribute_group`
--

LOCK TABLES `csvp_eav_attribute_group` WRITE;
/*!40000 ALTER TABLE `csvp_eav_attribute_group` DISABLE KEYS */;
INSERT INTO `csvp_eav_attribute_group` VALUES (1,1,'General',1,1,'general',NULL),(2,2,'General',1,1,'general',NULL),(3,3,'General',10,1,'general',NULL),(4,3,'General Information',2,0,'general-information',NULL),(5,3,'Display Settings',20,0,'display-settings',NULL),(6,3,'Custom Design',30,0,'custom-design',NULL),(7,4,'Product Details',10,1,'product-details','basic'),(8,4,'Advanced Pricing',40,0,'advanced-pricing','advanced'),(9,4,'Search Engine Optimization',30,0,'search-engine-optimization','basic'),(10,4,'Images',20,0,'image-management','basic'),(11,4,'Design',50,0,'design','advanced'),(12,4,'Autosettings',60,0,'autosettings','advanced'),(13,4,'Content',15,0,'content','basic'),(14,4,'Schedule Design Update',55,0,'schedule-design-update','advanced'),(15,4,'Bundle Items',16,0,'bundle-items',NULL),(16,5,'General',1,1,'general',NULL),(17,6,'General',1,1,'general',NULL),(18,7,'General',1,1,'general',NULL),(19,8,'General',1,1,'general',NULL),(20,4,'Gift Options',61,0,'gift-options',NULL);
/*!40000 ALTER TABLE `csvp_eav_attribute_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_eav_attribute_label`
--

DROP TABLE IF EXISTS `csvp_eav_attribute_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_eav_attribute_label` (
  `attribute_label_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Attribute Label Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`attribute_label_id`),
  KEY `CSVP_EAV_ATTRIBUTE_LABEL_STORE_ID` (`store_id`),
  KEY `CSVP_EAV_ATTRIBUTE_LABEL_ATTRIBUTE_ID_STORE_ID` (`attribute_id`,`store_id`),
  CONSTRAINT `CSVP_EAV_ATTRIBUTE_LABEL_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `csvp_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_EAV_ATTRIBUTE_LABEL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Attribute Label';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_eav_attribute_label`
--

LOCK TABLES `csvp_eav_attribute_label` WRITE;
/*!40000 ALTER TABLE `csvp_eav_attribute_label` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_eav_attribute_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_eav_attribute_option`
--

DROP TABLE IF EXISTS `csvp_eav_attribute_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_eav_attribute_option` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `sort_order` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`option_id`),
  KEY `CSVP_EAV_ATTRIBUTE_OPTION_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `CSVP_EAV_ATTR_OPT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `csvp_eav_attribute` (`attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Eav Attribute Option';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_eav_attribute_option`
--

LOCK TABLES `csvp_eav_attribute_option` WRITE;
/*!40000 ALTER TABLE `csvp_eav_attribute_option` DISABLE KEYS */;
INSERT INTO `csvp_eav_attribute_option` VALUES (1,20,0),(2,20,1),(3,20,3);
/*!40000 ALTER TABLE `csvp_eav_attribute_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_eav_attribute_option_swatch`
--

DROP TABLE IF EXISTS `csvp_eav_attribute_option_swatch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_eav_attribute_option_swatch` (
  `swatch_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Swatch ID',
  `option_id` int(10) unsigned NOT NULL COMMENT 'Option ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `type` smallint(5) unsigned NOT NULL COMMENT 'Swatch type: 0 - text, 1 - visual color, 2 - visual image',
  `value` varchar(255) DEFAULT NULL COMMENT 'Swatch Value',
  PRIMARY KEY (`swatch_id`),
  UNIQUE KEY `CSVP_EAV_ATTRIBUTE_OPTION_SWATCH_STORE_ID_OPTION_ID` (`store_id`,`option_id`),
  KEY `CSVP_EAV_ATTRIBUTE_OPTION_SWATCH_SWATCH_ID` (`swatch_id`),
  KEY `CSVP_EAV_ATTR_OPT_SWATCH_OPT_ID_EAV_ATTR_OPT_OPT_ID` (`option_id`),
  CONSTRAINT `CSVP_EAV_ATTRIBUTE_OPTION_SWATCH_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_EAV_ATTR_OPT_SWATCH_OPT_ID_EAV_ATTR_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `csvp_eav_attribute_option` (`option_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Magento Swatches table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_eav_attribute_option_swatch`
--

LOCK TABLES `csvp_eav_attribute_option_swatch` WRITE;
/*!40000 ALTER TABLE `csvp_eav_attribute_option_swatch` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_eav_attribute_option_swatch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_eav_attribute_option_value`
--

DROP TABLE IF EXISTS `csvp_eav_attribute_option_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_eav_attribute_option_value` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  KEY `CSVP_EAV_ATTRIBUTE_OPTION_VALUE_OPTION_ID` (`option_id`),
  KEY `CSVP_EAV_ATTRIBUTE_OPTION_VALUE_STORE_ID` (`store_id`),
  CONSTRAINT `CSVP_EAV_ATTRIBUTE_OPTION_VALUE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_EAV_ATTR_OPT_VAL_OPT_ID_EAV_ATTR_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `csvp_eav_attribute_option` (`option_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Eav Attribute Option Value';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_eav_attribute_option_value`
--

LOCK TABLES `csvp_eav_attribute_option_value` WRITE;
/*!40000 ALTER TABLE `csvp_eav_attribute_option_value` DISABLE KEYS */;
INSERT INTO `csvp_eav_attribute_option_value` VALUES (1,1,0,'Male'),(2,2,0,'Female'),(3,3,0,'Not Specified');
/*!40000 ALTER TABLE `csvp_eav_attribute_option_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_eav_attribute_set`
--

DROP TABLE IF EXISTS `csvp_eav_attribute_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_eav_attribute_set` (
  `attribute_set_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Attribute Set Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_set_name` varchar(255) DEFAULT NULL COMMENT 'Attribute Set Name',
  `sort_order` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`attribute_set_id`),
  UNIQUE KEY `CSVP_EAV_ATTRIBUTE_SET_ENTITY_TYPE_ID_ATTRIBUTE_SET_NAME` (`entity_type_id`,`attribute_set_name`),
  KEY `CSVP_EAV_ATTRIBUTE_SET_ENTITY_TYPE_ID_SORT_ORDER` (`entity_type_id`,`sort_order`),
  CONSTRAINT `CSVP_EAV_ATTR_SET_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `csvp_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='Eav Attribute Set';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_eav_attribute_set`
--

LOCK TABLES `csvp_eav_attribute_set` WRITE;
/*!40000 ALTER TABLE `csvp_eav_attribute_set` DISABLE KEYS */;
INSERT INTO `csvp_eav_attribute_set` VALUES (1,1,'Default',2),(2,2,'Default',2),(3,3,'Default',1),(4,4,'Default',1),(5,5,'Default',1),(6,6,'Default',1),(7,7,'Default',1),(8,8,'Default',1);
/*!40000 ALTER TABLE `csvp_eav_attribute_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_eav_entity`
--

DROP TABLE IF EXISTS `csvp_eav_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_eav_entity` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Set Id',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Parent Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `is_active` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Defines Is Entity Active',
  PRIMARY KEY (`entity_id`),
  KEY `CSVP_EAV_ENTITY_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `CSVP_EAV_ENTITY_STORE_ID` (`store_id`),
  CONSTRAINT `CSVP_EAV_ENTITY_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `csvp_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_EAV_ENTITY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_eav_entity`
--

LOCK TABLES `csvp_eav_entity` WRITE;
/*!40000 ALTER TABLE `csvp_eav_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_eav_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_eav_entity_attribute`
--

DROP TABLE IF EXISTS `csvp_eav_entity_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_eav_entity_attribute` (
  `entity_attribute_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Attribute Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Set Id',
  `attribute_group_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Group Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `sort_order` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`entity_attribute_id`),
  UNIQUE KEY `CSVP_EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_SET_ID_ATTRIBUTE_ID` (`attribute_set_id`,`attribute_id`),
  UNIQUE KEY `CSVP_EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_GROUP_ID_ATTRIBUTE_ID` (`attribute_group_id`,`attribute_id`),
  KEY `CSVP_EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_SET_ID_SORT_ORDER` (`attribute_set_id`,`sort_order`),
  KEY `CSVP_EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `CSVP_EAV_ENTT_ATTR_ATTR_GROUP_ID_EAV_ATTR_GROUP_ATTR_GROUP_ID` FOREIGN KEY (`attribute_group_id`) REFERENCES `csvp_eav_attribute_group` (`attribute_group_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_EAV_ENTT_ATTR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `csvp_eav_attribute` (`attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8 COMMENT='Eav Entity Attributes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_eav_entity_attribute`
--

LOCK TABLES `csvp_eav_entity_attribute` WRITE;
/*!40000 ALTER TABLE `csvp_eav_entity_attribute` DISABLE KEYS */;
INSERT INTO `csvp_eav_entity_attribute` VALUES (1,1,1,1,1,10),(2,1,1,1,2,20),(3,1,1,1,3,20),(4,1,1,1,4,30),(5,1,1,1,5,40),(6,1,1,1,6,50),(7,1,1,1,7,60),(8,1,1,1,8,70),(9,1,1,1,9,80),(10,1,1,1,10,25),(11,1,1,1,11,90),(12,1,1,1,12,81),(13,1,1,1,13,115),(14,1,1,1,14,120),(15,1,1,1,15,82),(16,1,1,1,16,83),(17,1,1,1,17,100),(18,1,1,1,18,0),(19,1,1,1,19,0),(20,1,1,1,20,110),(21,1,1,1,21,28),(22,2,2,2,22,10),(23,2,2,2,23,20),(24,2,2,2,24,30),(25,2,2,2,25,40),(26,2,2,2,26,50),(27,2,2,2,27,60),(28,2,2,2,28,70),(29,2,2,2,29,80),(30,2,2,2,30,90),(31,2,2,2,31,100),(32,2,2,2,32,100),(33,2,2,2,33,110),(34,2,2,2,34,120),(35,2,2,2,35,130),(36,2,2,2,36,140),(37,2,2,2,37,132),(38,2,2,2,38,133),(39,2,2,2,39,134),(40,2,2,2,40,135),(41,1,1,1,41,87),(42,1,1,1,42,100),(43,1,1,1,43,110),(44,1,1,1,44,120),(45,3,3,4,45,1),(46,3,3,4,46,2),(47,3,3,4,47,4),(48,3,3,4,48,5),(49,3,3,4,49,6),(50,3,3,4,50,7),(51,3,3,4,51,8),(52,3,3,5,52,10),(53,3,3,5,53,20),(54,3,3,5,54,30),(55,3,3,4,55,12),(56,3,3,4,56,13),(57,3,3,4,57,14),(58,3,3,4,58,15),(59,3,3,4,59,16),(60,3,3,6,60,10),(61,3,3,6,61,30),(62,3,3,6,62,40),(63,3,3,6,63,50),(64,3,3,6,64,60),(65,3,3,4,65,24),(66,3,3,4,66,25),(67,3,3,5,67,40),(68,3,3,5,68,50),(69,3,3,4,69,10),(70,3,3,6,70,5),(71,3,3,6,71,6),(72,3,3,5,72,51),(73,4,4,7,73,10),(74,4,4,7,74,20),(75,4,4,13,75,90),(76,4,4,13,76,100),(77,4,4,7,77,30),(78,4,4,8,78,3),(79,4,4,8,79,4),(80,4,4,8,80,5),(81,4,4,8,81,6),(82,4,4,7,82,70),(83,4,4,9,84,20),(84,4,4,9,85,30),(85,4,4,9,86,40),(86,4,4,10,87,1),(87,4,4,10,88,2),(88,4,4,10,89,3),(89,4,4,10,90,4),(90,4,4,7,91,6),(91,4,4,8,92,7),(92,4,4,7,94,90),(93,4,4,7,95,100),(94,4,4,10,96,5),(95,4,4,7,97,5),(96,4,4,8,98,8),(97,4,4,7,99,80),(98,4,4,14,100,40),(99,4,4,14,101,20),(100,4,4,14,102,30),(101,4,4,11,103,10),(102,4,4,11,104,5),(103,4,4,7,105,80),(104,4,4,11,106,6),(105,4,4,7,107,14),(106,4,4,7,108,15),(107,4,4,7,109,16),(108,4,4,7,110,17),(109,4,4,7,111,18),(110,4,4,7,112,19),(111,4,4,7,113,20),(112,4,4,7,114,110),(113,4,4,7,115,60),(114,4,4,14,116,50),(115,3,3,4,117,3),(116,3,3,4,118,17),(117,4,4,9,119,10),(118,4,4,7,120,11),(119,4,4,8,121,9),(120,4,4,8,122,10),(121,4,4,7,123,31),(122,4,4,7,124,21),(123,4,4,7,125,71),(124,4,4,8,126,11),(125,4,4,15,127,1),(126,4,4,7,128,111),(127,4,4,7,129,112),(128,4,4,7,130,113),(129,4,4,7,131,114),(130,4,4,20,132,10),(131,4,4,10,133,3),(132,4,4,7,134,40);
/*!40000 ALTER TABLE `csvp_eav_entity_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_eav_entity_datetime`
--

DROP TABLE IF EXISTS `csvp_eav_entity_datetime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_eav_entity_datetime` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` datetime DEFAULT NULL COMMENT 'Attribute Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CSVP_EAV_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CSVP_EAV_ENTITY_DATETIME_STORE_ID` (`store_id`),
  KEY `CSVP_EAV_ENTITY_DATETIME_ATTRIBUTE_ID_VALUE` (`attribute_id`,`value`),
  KEY `CSVP_EAV_ENTITY_DATETIME_ENTITY_TYPE_ID_VALUE` (`entity_type_id`,`value`),
  CONSTRAINT `CSVP_EAV_ENTITY_DATETIME_ENTITY_ID_EAV_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `csvp_eav_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_EAV_ENTITY_DATETIME_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_EAV_ENTT_DTIME_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `csvp_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Value Prefix';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_eav_entity_datetime`
--

LOCK TABLES `csvp_eav_entity_datetime` WRITE;
/*!40000 ALTER TABLE `csvp_eav_entity_datetime` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_eav_entity_datetime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_eav_entity_decimal`
--

DROP TABLE IF EXISTS `csvp_eav_entity_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_eav_entity_decimal` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Attribute Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CSVP_EAV_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CSVP_EAV_ENTITY_DECIMAL_STORE_ID` (`store_id`),
  KEY `CSVP_EAV_ENTITY_DECIMAL_ATTRIBUTE_ID_VALUE` (`attribute_id`,`value`),
  KEY `CSVP_EAV_ENTITY_DECIMAL_ENTITY_TYPE_ID_VALUE` (`entity_type_id`,`value`),
  CONSTRAINT `CSVP_EAV_ENTITY_DECIMAL_ENTITY_ID_EAV_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `csvp_eav_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_EAV_ENTITY_DECIMAL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_EAV_ENTT_DEC_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `csvp_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Value Prefix';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_eav_entity_decimal`
--

LOCK TABLES `csvp_eav_entity_decimal` WRITE;
/*!40000 ALTER TABLE `csvp_eav_entity_decimal` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_eav_entity_decimal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_eav_entity_int`
--

DROP TABLE IF EXISTS `csvp_eav_entity_int`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_eav_entity_int` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` int(11) NOT NULL DEFAULT '0' COMMENT 'Attribute Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CSVP_EAV_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CSVP_EAV_ENTITY_INT_STORE_ID` (`store_id`),
  KEY `CSVP_EAV_ENTITY_INT_ATTRIBUTE_ID_VALUE` (`attribute_id`,`value`),
  KEY `CSVP_EAV_ENTITY_INT_ENTITY_TYPE_ID_VALUE` (`entity_type_id`,`value`),
  CONSTRAINT `CSVP_EAV_ENTITY_INT_ENTITY_ID_EAV_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `csvp_eav_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_EAV_ENTITY_INT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_EAV_ENTT_INT_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `csvp_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Value Prefix';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_eav_entity_int`
--

LOCK TABLES `csvp_eav_entity_int` WRITE;
/*!40000 ALTER TABLE `csvp_eav_entity_int` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_eav_entity_int` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_eav_entity_store`
--

DROP TABLE IF EXISTS `csvp_eav_entity_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_eav_entity_store` (
  `entity_store_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Store Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `increment_prefix` varchar(20) DEFAULT NULL COMMENT 'Increment Prefix',
  `increment_last_id` varchar(50) DEFAULT NULL COMMENT 'Last Incremented Id',
  PRIMARY KEY (`entity_store_id`),
  KEY `CSVP_EAV_ENTITY_STORE_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `CSVP_EAV_ENTITY_STORE_STORE_ID` (`store_id`),
  CONSTRAINT `CSVP_EAV_ENTITY_STORE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_EAV_ENTT_STORE_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `csvp_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Store';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_eav_entity_store`
--

LOCK TABLES `csvp_eav_entity_store` WRITE;
/*!40000 ALTER TABLE `csvp_eav_entity_store` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_eav_entity_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_eav_entity_text`
--

DROP TABLE IF EXISTS `csvp_eav_entity_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_eav_entity_text` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` text NOT NULL COMMENT 'Attribute Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CSVP_EAV_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CSVP_EAV_ENTITY_TEXT_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `CSVP_EAV_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CSVP_EAV_ENTITY_TEXT_STORE_ID` (`store_id`),
  CONSTRAINT `CSVP_EAV_ENTITY_TEXT_ENTITY_ID_EAV_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `csvp_eav_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_EAV_ENTITY_TEXT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_EAV_ENTT_TEXT_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `csvp_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Value Prefix';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_eav_entity_text`
--

LOCK TABLES `csvp_eav_entity_text` WRITE;
/*!40000 ALTER TABLE `csvp_eav_entity_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_eav_entity_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_eav_entity_type`
--

DROP TABLE IF EXISTS `csvp_eav_entity_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_eav_entity_type` (
  `entity_type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Type Id',
  `entity_type_code` varchar(50) NOT NULL COMMENT 'Entity Type Code',
  `entity_model` varchar(255) NOT NULL COMMENT 'Entity Model',
  `attribute_model` varchar(255) DEFAULT NULL COMMENT 'Attribute Model',
  `entity_table` varchar(255) DEFAULT NULL COMMENT 'Entity Table',
  `value_table_prefix` varchar(255) DEFAULT NULL COMMENT 'Value Table Prefix',
  `entity_id_field` varchar(255) DEFAULT NULL COMMENT 'Entity Id Field',
  `is_data_sharing` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Defines Is Data Sharing',
  `data_sharing_key` varchar(100) DEFAULT 'default' COMMENT 'Data Sharing Key',
  `default_attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Default Attribute Set Id',
  `increment_model` varchar(255) DEFAULT NULL COMMENT 'Increment Model',
  `increment_per_store` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Increment Per Store',
  `increment_pad_length` smallint(5) unsigned NOT NULL DEFAULT '8' COMMENT 'Increment Pad Length',
  `increment_pad_char` varchar(1) NOT NULL DEFAULT '0' COMMENT 'Increment Pad Char',
  `additional_attribute_table` varchar(255) DEFAULT NULL COMMENT 'Additional Attribute Table',
  `entity_attribute_collection` varchar(255) DEFAULT NULL COMMENT 'Entity Attribute Collection',
  PRIMARY KEY (`entity_type_id`),
  KEY `CSVP_EAV_ENTITY_TYPE_ENTITY_TYPE_CODE` (`entity_type_code`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='Eav Entity Type';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_eav_entity_type`
--

LOCK TABLES `csvp_eav_entity_type` WRITE;
/*!40000 ALTER TABLE `csvp_eav_entity_type` DISABLE KEYS */;
INSERT INTO `csvp_eav_entity_type` VALUES (1,'customer','Magento\\Customer\\Model\\ResourceModel\\Customer','Magento\\Customer\\Model\\Attribute','customer_entity',NULL,NULL,1,'default',1,'Magento\\Eav\\Model\\Entity\\Increment\\NumericValue',0,8,'0','customer_eav_attribute','Magento\\Customer\\Model\\ResourceModel\\Attribute\\Collection'),(2,'customer_address','Magento\\Customer\\Model\\ResourceModel\\Address','Magento\\Customer\\Model\\Attribute','customer_address_entity',NULL,NULL,1,'default',2,NULL,0,8,'0','customer_eav_attribute','Magento\\Customer\\Model\\ResourceModel\\Address\\Attribute\\Collection'),(3,'catalog_category','Magento\\Catalog\\Model\\ResourceModel\\Category','Magento\\Catalog\\Model\\ResourceModel\\Eav\\Attribute','catalog_category_entity',NULL,NULL,1,'default',3,NULL,0,8,'0','catalog_eav_attribute','Magento\\Catalog\\Model\\ResourceModel\\Category\\Attribute\\Collection'),(4,'catalog_product','Magento\\Catalog\\Model\\ResourceModel\\Product','Magento\\Catalog\\Model\\ResourceModel\\Eav\\Attribute','catalog_product_entity',NULL,NULL,1,'default',4,NULL,0,8,'0','catalog_eav_attribute','Magento\\Catalog\\Model\\ResourceModel\\Product\\Attribute\\Collection'),(5,'order','Magento\\Sales\\Model\\ResourceModel\\Order',NULL,'sales_order',NULL,NULL,1,'default',5,'Magento\\Eav\\Model\\Entity\\Increment\\NumericValue',1,8,'0',NULL,NULL),(6,'invoice','Magento\\Sales\\Model\\ResourceModel\\Order',NULL,'sales_invoice',NULL,NULL,1,'default',6,'Magento\\Eav\\Model\\Entity\\Increment\\NumericValue',1,8,'0',NULL,NULL),(7,'creditmemo','Magento\\Sales\\Model\\ResourceModel\\Order\\Creditmemo',NULL,'sales_creditmemo',NULL,NULL,1,'default',7,'Magento\\Eav\\Model\\Entity\\Increment\\NumericValue',1,8,'0',NULL,NULL),(8,'shipment','Magento\\Sales\\Model\\ResourceModel\\Order\\Shipment',NULL,'sales_shipment',NULL,NULL,1,'default',8,'Magento\\Eav\\Model\\Entity\\Increment\\NumericValue',1,8,'0',NULL,NULL);
/*!40000 ALTER TABLE `csvp_eav_entity_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_eav_entity_varchar`
--

DROP TABLE IF EXISTS `csvp_eav_entity_varchar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_eav_entity_varchar` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` varchar(255) DEFAULT NULL COMMENT 'Attribute Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CSVP_EAV_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CSVP_EAV_ENTITY_VARCHAR_STORE_ID` (`store_id`),
  KEY `CSVP_EAV_ENTITY_VARCHAR_ATTRIBUTE_ID_VALUE` (`attribute_id`,`value`),
  KEY `CSVP_EAV_ENTITY_VARCHAR_ENTITY_TYPE_ID_VALUE` (`entity_type_id`,`value`),
  CONSTRAINT `CSVP_EAV_ENTITY_VARCHAR_ENTITY_ID_EAV_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `csvp_eav_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_EAV_ENTITY_VARCHAR_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_EAV_ENTT_VCHR_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `csvp_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Value Prefix';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_eav_entity_varchar`
--

LOCK TABLES `csvp_eav_entity_varchar` WRITE;
/*!40000 ALTER TABLE `csvp_eav_entity_varchar` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_eav_entity_varchar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_eav_form_element`
--

DROP TABLE IF EXISTS `csvp_eav_form_element`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_eav_form_element` (
  `element_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Element Id',
  `type_id` smallint(5) unsigned NOT NULL COMMENT 'Type Id',
  `fieldset_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Fieldset Id',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute Id',
  `sort_order` int(11) NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`element_id`),
  UNIQUE KEY `CSVP_EAV_FORM_ELEMENT_TYPE_ID_ATTRIBUTE_ID` (`type_id`,`attribute_id`),
  KEY `CSVP_EAV_FORM_ELEMENT_FIELDSET_ID` (`fieldset_id`),
  KEY `CSVP_EAV_FORM_ELEMENT_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `CSVP_EAV_FORM_ELEMENT_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `csvp_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_EAV_FORM_ELEMENT_FIELDSET_ID_EAV_FORM_FIELDSET_FIELDSET_ID` FOREIGN KEY (`fieldset_id`) REFERENCES `csvp_eav_form_fieldset` (`fieldset_id`) ON DELETE SET NULL,
  CONSTRAINT `CSVP_EAV_FORM_ELEMENT_TYPE_ID_EAV_FORM_TYPE_TYPE_ID` FOREIGN KEY (`type_id`) REFERENCES `csvp_eav_form_type` (`type_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COMMENT='Eav Form Element';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_eav_form_element`
--

LOCK TABLES `csvp_eav_form_element` WRITE;
/*!40000 ALTER TABLE `csvp_eav_form_element` DISABLE KEYS */;
INSERT INTO `csvp_eav_form_element` VALUES (1,1,NULL,23,0),(2,1,NULL,25,1),(3,1,NULL,27,2),(4,1,NULL,9,3),(5,1,NULL,28,4),(6,1,NULL,29,5),(7,1,NULL,31,6),(8,1,NULL,33,7),(9,1,NULL,30,8),(10,1,NULL,34,9),(11,1,NULL,35,10),(12,2,NULL,23,0),(13,2,NULL,25,1),(14,2,NULL,27,2),(15,2,NULL,9,3),(16,2,NULL,28,4),(17,2,NULL,29,5),(18,2,NULL,31,6),(19,2,NULL,33,7),(20,2,NULL,30,8),(21,2,NULL,34,9),(22,2,NULL,35,10),(23,3,NULL,23,0),(24,3,NULL,25,1),(25,3,NULL,27,2),(26,3,NULL,28,3),(27,3,NULL,29,4),(28,3,NULL,31,5),(29,3,NULL,33,6),(30,3,NULL,30,7),(31,3,NULL,34,8),(32,3,NULL,35,9),(33,4,NULL,23,0),(34,4,NULL,25,1),(35,4,NULL,27,2),(36,4,NULL,28,3),(37,4,NULL,29,4),(38,4,NULL,31,5),(39,4,NULL,33,6),(40,4,NULL,30,7),(41,4,NULL,34,8),(42,4,NULL,35,9);
/*!40000 ALTER TABLE `csvp_eav_form_element` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_eav_form_fieldset`
--

DROP TABLE IF EXISTS `csvp_eav_form_fieldset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_eav_form_fieldset` (
  `fieldset_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Fieldset Id',
  `type_id` smallint(5) unsigned NOT NULL COMMENT 'Type Id',
  `code` varchar(64) NOT NULL COMMENT 'Code',
  `sort_order` int(11) NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`fieldset_id`),
  UNIQUE KEY `CSVP_EAV_FORM_FIELDSET_TYPE_ID_CODE` (`type_id`,`code`),
  CONSTRAINT `CSVP_EAV_FORM_FIELDSET_TYPE_ID_EAV_FORM_TYPE_TYPE_ID` FOREIGN KEY (`type_id`) REFERENCES `csvp_eav_form_type` (`type_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Form Fieldset';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_eav_form_fieldset`
--

LOCK TABLES `csvp_eav_form_fieldset` WRITE;
/*!40000 ALTER TABLE `csvp_eav_form_fieldset` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_eav_form_fieldset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_eav_form_fieldset_label`
--

DROP TABLE IF EXISTS `csvp_eav_form_fieldset_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_eav_form_fieldset_label` (
  `fieldset_id` smallint(5) unsigned NOT NULL COMMENT 'Fieldset Id',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  `label` varchar(255) NOT NULL COMMENT 'Label',
  PRIMARY KEY (`fieldset_id`,`store_id`),
  KEY `CSVP_EAV_FORM_FIELDSET_LABEL_STORE_ID` (`store_id`),
  CONSTRAINT `CSVP_EAV_FORM_FIELDSET_LABEL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_EAV_FORM_FSET_LBL_FSET_ID_EAV_FORM_FSET_FSET_ID` FOREIGN KEY (`fieldset_id`) REFERENCES `csvp_eav_form_fieldset` (`fieldset_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Form Fieldset Label';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_eav_form_fieldset_label`
--

LOCK TABLES `csvp_eav_form_fieldset_label` WRITE;
/*!40000 ALTER TABLE `csvp_eav_form_fieldset_label` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_eav_form_fieldset_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_eav_form_type`
--

DROP TABLE IF EXISTS `csvp_eav_form_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_eav_form_type` (
  `type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Type Id',
  `code` varchar(64) NOT NULL COMMENT 'Code',
  `label` varchar(255) NOT NULL COMMENT 'Label',
  `is_system` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is System',
  `theme` varchar(64) DEFAULT NULL COMMENT 'Theme',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  PRIMARY KEY (`type_id`),
  UNIQUE KEY `CSVP_EAV_FORM_TYPE_CODE_THEME_STORE_ID` (`code`,`theme`,`store_id`),
  KEY `CSVP_EAV_FORM_TYPE_STORE_ID` (`store_id`),
  CONSTRAINT `CSVP_EAV_FORM_TYPE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Eav Form Type';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_eav_form_type`
--

LOCK TABLES `csvp_eav_form_type` WRITE;
/*!40000 ALTER TABLE `csvp_eav_form_type` DISABLE KEYS */;
INSERT INTO `csvp_eav_form_type` VALUES (1,'checkout_onepage_register','checkout_onepage_register',1,'',0),(2,'checkout_onepage_register_guest','checkout_onepage_register_guest',1,'',0),(3,'checkout_onepage_billing_address','checkout_onepage_billing_address',1,'',0),(4,'checkout_onepage_shipping_address','checkout_onepage_shipping_address',1,'',0);
/*!40000 ALTER TABLE `csvp_eav_form_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_eav_form_type_entity`
--

DROP TABLE IF EXISTS `csvp_eav_form_type_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_eav_form_type_entity` (
  `type_id` smallint(5) unsigned NOT NULL COMMENT 'Type Id',
  `entity_type_id` smallint(5) unsigned NOT NULL COMMENT 'Entity Type Id',
  PRIMARY KEY (`type_id`,`entity_type_id`),
  KEY `CSVP_EAV_FORM_TYPE_ENTITY_ENTITY_TYPE_ID` (`entity_type_id`),
  CONSTRAINT `CSVP_EAV_FORM_TYPE_ENTITY_TYPE_ID_EAV_FORM_TYPE_TYPE_ID` FOREIGN KEY (`type_id`) REFERENCES `csvp_eav_form_type` (`type_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_EAV_FORM_TYPE_ENTT_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `csvp_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Form Type Entity';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_eav_form_type_entity`
--

LOCK TABLES `csvp_eav_form_type_entity` WRITE;
/*!40000 ALTER TABLE `csvp_eav_form_type_entity` DISABLE KEYS */;
INSERT INTO `csvp_eav_form_type_entity` VALUES (1,1),(2,1),(1,2),(2,2),(3,2),(4,2);
/*!40000 ALTER TABLE `csvp_eav_form_type_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_email_template`
--

DROP TABLE IF EXISTS `csvp_email_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_email_template` (
  `template_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Template ID',
  `template_code` varchar(150) NOT NULL COMMENT 'Template Name',
  `template_text` text NOT NULL COMMENT 'Template Content',
  `template_styles` text COMMENT 'Templste Styles',
  `template_type` int(10) unsigned DEFAULT NULL COMMENT 'Template Type',
  `template_subject` varchar(200) NOT NULL COMMENT 'Template Subject',
  `template_sender_name` varchar(200) DEFAULT NULL COMMENT 'Template Sender Name',
  `template_sender_email` varchar(200) DEFAULT NULL COMMENT 'Template Sender Email',
  `added_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date of Template Creation',
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date of Template Modification',
  `orig_template_code` varchar(200) DEFAULT NULL COMMENT 'Original Template Code',
  `orig_template_variables` text COMMENT 'Original Template Variables',
  PRIMARY KEY (`template_id`),
  UNIQUE KEY `CSVP_EMAIL_TEMPLATE_TEMPLATE_CODE` (`template_code`),
  KEY `CSVP_EMAIL_TEMPLATE_ADDED_AT` (`added_at`),
  KEY `CSVP_EMAIL_TEMPLATE_MODIFIED_AT` (`modified_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Email Templates';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_email_template`
--

LOCK TABLES `csvp_email_template` WRITE;
/*!40000 ALTER TABLE `csvp_email_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_email_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_flag`
--

DROP TABLE IF EXISTS `csvp_flag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_flag` (
  `flag_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Flag Id',
  `flag_code` varchar(255) NOT NULL COMMENT 'Flag Code',
  `state` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Flag State',
  `flag_data` text COMMENT 'Flag Data',
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date of Last Flag Update',
  PRIMARY KEY (`flag_id`),
  KEY `CSVP_FLAG_LAST_UPDATE` (`last_update`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Flag';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_flag`
--

LOCK TABLES `csvp_flag` WRITE;
/*!40000 ALTER TABLE `csvp_flag` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_flag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_gift_message`
--

DROP TABLE IF EXISTS `csvp_gift_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_gift_message` (
  `gift_message_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'GiftMessage Id',
  `customer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer id',
  `sender` varchar(255) DEFAULT NULL COMMENT 'Sender',
  `recipient` varchar(255) DEFAULT NULL COMMENT 'Registrant',
  `message` text COMMENT 'Message',
  PRIMARY KEY (`gift_message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Gift Message';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_gift_message`
--

LOCK TABLES `csvp_gift_message` WRITE;
/*!40000 ALTER TABLE `csvp_gift_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_gift_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_googleoptimizer_code`
--

DROP TABLE IF EXISTS `csvp_googleoptimizer_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_googleoptimizer_code` (
  `code_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Google experiment code id',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Optimized entity id product id or catalog id',
  `entity_type` varchar(50) DEFAULT NULL COMMENT 'Optimized entity type',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store id',
  `experiment_script` text COMMENT 'Google experiment script',
  PRIMARY KEY (`code_id`),
  UNIQUE KEY `CSVP_GOOGLEOPTIMIZER_CODE_STORE_ID_ENTITY_ID_ENTITY_TYPE` (`store_id`,`entity_id`,`entity_type`),
  CONSTRAINT `CSVP_GOOGLEOPTIMIZER_CODE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Google Experiment code';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_googleoptimizer_code`
--

LOCK TABLES `csvp_googleoptimizer_code` WRITE;
/*!40000 ALTER TABLE `csvp_googleoptimizer_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_googleoptimizer_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_import_history`
--

DROP TABLE IF EXISTS `csvp_import_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_import_history` (
  `history_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'History record Id',
  `started_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Started at',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'User ID',
  `imported_file` varchar(255) DEFAULT NULL COMMENT 'Imported file',
  `execution_time` varchar(255) DEFAULT NULL COMMENT 'Execution time',
  `summary` varchar(255) DEFAULT NULL COMMENT 'Summary',
  `error_file` varchar(255) NOT NULL COMMENT 'Imported file with errors',
  PRIMARY KEY (`history_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Import history table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_import_history`
--

LOCK TABLES `csvp_import_history` WRITE;
/*!40000 ALTER TABLE `csvp_import_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_import_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_importexport_importdata`
--

DROP TABLE IF EXISTS `csvp_importexport_importdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_importexport_importdata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `entity` varchar(50) NOT NULL COMMENT 'Entity',
  `behavior` varchar(10) NOT NULL DEFAULT 'append' COMMENT 'Behavior',
  `data` longtext COMMENT 'Data',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Import Data Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_importexport_importdata`
--

LOCK TABLES `csvp_importexport_importdata` WRITE;
/*!40000 ALTER TABLE `csvp_importexport_importdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_importexport_importdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_indexer_state`
--

DROP TABLE IF EXISTS `csvp_indexer_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_indexer_state` (
  `state_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Indexer State Id',
  `indexer_id` varchar(255) DEFAULT NULL COMMENT 'Indexer Id',
  `status` varchar(16) DEFAULT 'invalid' COMMENT 'Indexer Status',
  `updated` datetime DEFAULT NULL COMMENT 'Indexer Status',
  `hash_config` varchar(32) NOT NULL COMMENT 'Hash of indexer config',
  PRIMARY KEY (`state_id`),
  KEY `CSVP_INDEXER_STATE_INDEXER_ID` (`indexer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='Indexer State';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_indexer_state`
--

LOCK TABLES `csvp_indexer_state` WRITE;
/*!40000 ALTER TABLE `csvp_indexer_state` DISABLE KEYS */;
INSERT INTO `csvp_indexer_state` VALUES (1,'design_config_grid','valid','2017-10-18 09:08:13','34ec592bfa6c952bed4d0a1d58c98770'),(2,'customer_grid','valid','2017-10-18 06:18:57','b9632e06cf957d6e8103eb236ca38cc1'),(3,'catalog_category_product','valid','2017-10-18 06:18:58','2124d5bfcd83b609c67eee94a0e4708c'),(4,'catalog_product_category','valid','2017-10-18 05:57:50','77b6356629f3259568a68ea64c773238'),(5,'catalog_product_price','valid','2017-10-18 06:19:00','2c3434338353a47cb4c5783800c0bdbe'),(6,'catalog_product_attribute','valid','2017-10-18 06:19:02','f73cae77ec4dee3b587a60a2f38dd26a'),(7,'cataloginventory_stock','valid','2017-10-18 06:19:03','1bf66e64558a5171e523b32f25cb99ca'),(8,'catalogrule_rule','valid','2017-10-18 06:19:06','c4f8344a2e6a7d8ebc065631454a4724'),(9,'catalogrule_product','valid','2017-10-17 06:42:59','667205576ee3764b1ee81c4a076d10ae'),(10,'catalogsearch_fulltext','valid','2017-10-18 06:19:11','cc2d2701487ee835df4e72b15254852b');
/*!40000 ALTER TABLE `csvp_indexer_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_integration`
--

DROP TABLE IF EXISTS `csvp_integration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_integration` (
  `integration_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Integration ID',
  `name` varchar(255) NOT NULL COMMENT 'Integration name is displayed in the admin interface',
  `email` varchar(255) NOT NULL COMMENT 'Email address of the contact person',
  `endpoint` varchar(255) DEFAULT NULL COMMENT 'Endpoint for posting consumer credentials',
  `status` smallint(5) unsigned NOT NULL COMMENT 'Integration status',
  `consumer_id` int(10) unsigned DEFAULT NULL COMMENT 'Oauth consumer',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation Time',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update Time',
  `setup_type` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Integration type - manual or config file',
  `identity_link_url` varchar(255) DEFAULT NULL COMMENT 'Identity linking Url',
  PRIMARY KEY (`integration_id`),
  UNIQUE KEY `CSVP_INTEGRATION_NAME` (`name`),
  UNIQUE KEY `CSVP_INTEGRATION_CONSUMER_ID` (`consumer_id`),
  CONSTRAINT `CSVP_INTEGRATION_CONSUMER_ID_CSVP_OAUTH_CONSUMER_ENTITY_ID` FOREIGN KEY (`consumer_id`) REFERENCES `csvp_oauth_consumer` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='csvp_integration';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_integration`
--

LOCK TABLES `csvp_integration` WRITE;
/*!40000 ALTER TABLE `csvp_integration` DISABLE KEYS */;
INSERT INTO `csvp_integration` VALUES (4,'Magento Social','otahor@magento.com','https://fbapp.ezsocialshop.com/facebook/index.php/magento_auth',2,4,'2017-10-18 09:51:09','2017-10-18 09:51:09',1,'https://fbapp.ezsocialshop.com/facebook/index.php/magento2/show_magento_success_popup');
/*!40000 ALTER TABLE `csvp_integration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_layout_link`
--

DROP TABLE IF EXISTS `csvp_layout_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_layout_link` (
  `layout_link_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Link Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `theme_id` int(10) unsigned NOT NULL COMMENT 'Theme id',
  `layout_update_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Layout Update Id',
  `is_temporary` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Defines whether Layout Update is Temporary',
  PRIMARY KEY (`layout_link_id`),
  KEY `CSVP_LAYOUT_LINK_LAYOUT_UPDATE_ID` (`layout_update_id`),
  KEY `CSVP_LAYOUT_LINK_STORE_ID_THEME_ID_LAYOUT_UPDATE_ID_IS_TEMPORARY` (`store_id`,`theme_id`,`layout_update_id`,`is_temporary`),
  KEY `CSVP_LAYOUT_LINK_THEME_ID_THEME_THEME_ID` (`theme_id`),
  CONSTRAINT `CSVP_LAYOUT_LINK_LAYOUT_UPDATE_ID_LAYOUT_UPDATE_LAYOUT_UPDATE_ID` FOREIGN KEY (`layout_update_id`) REFERENCES `csvp_layout_update` (`layout_update_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_LAYOUT_LINK_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_LAYOUT_LINK_THEME_ID_THEME_THEME_ID` FOREIGN KEY (`theme_id`) REFERENCES `csvp_theme` (`theme_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Layout Link';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_layout_link`
--

LOCK TABLES `csvp_layout_link` WRITE;
/*!40000 ALTER TABLE `csvp_layout_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_layout_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_layout_update`
--

DROP TABLE IF EXISTS `csvp_layout_update`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_layout_update` (
  `layout_update_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Layout Update Id',
  `handle` varchar(255) DEFAULT NULL COMMENT 'Handle',
  `xml` text COMMENT 'Xml',
  `sort_order` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `updated_at` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT 'Last Update Timestamp',
  PRIMARY KEY (`layout_update_id`),
  KEY `CSVP_LAYOUT_UPDATE_HANDLE` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Layout Updates';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_layout_update`
--

LOCK TABLES `csvp_layout_update` WRITE;
/*!40000 ALTER TABLE `csvp_layout_update` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_layout_update` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_mview_state`
--

DROP TABLE IF EXISTS `csvp_mview_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_mview_state` (
  `state_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'View State Id',
  `view_id` varchar(255) DEFAULT NULL COMMENT 'View Id',
  `mode` varchar(16) DEFAULT 'disabled' COMMENT 'View Mode',
  `status` varchar(16) DEFAULT 'idle' COMMENT 'View Status',
  `updated` datetime DEFAULT NULL COMMENT 'View updated time',
  `version_id` int(10) unsigned DEFAULT NULL COMMENT 'View Version Id',
  PRIMARY KEY (`state_id`),
  KEY `CSVP_MVIEW_STATE_VIEW_ID` (`view_id`),
  KEY `CSVP_MVIEW_STATE_MODE` (`mode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='View State';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_mview_state`
--

LOCK TABLES `csvp_mview_state` WRITE;
/*!40000 ALTER TABLE `csvp_mview_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_mview_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_newsletter_problem`
--

DROP TABLE IF EXISTS `csvp_newsletter_problem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_newsletter_problem` (
  `problem_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Problem Id',
  `subscriber_id` int(10) unsigned DEFAULT NULL COMMENT 'Subscriber Id',
  `queue_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Queue Id',
  `problem_error_code` int(10) unsigned DEFAULT '0' COMMENT 'Problem Error Code',
  `problem_error_text` varchar(200) DEFAULT NULL COMMENT 'Problem Error Text',
  PRIMARY KEY (`problem_id`),
  KEY `CSVP_NEWSLETTER_PROBLEM_SUBSCRIBER_ID` (`subscriber_id`),
  KEY `CSVP_NEWSLETTER_PROBLEM_QUEUE_ID` (`queue_id`),
  CONSTRAINT `CSVP_NEWSLETTER_PROBLEM_QUEUE_ID_NEWSLETTER_QUEUE_QUEUE_ID` FOREIGN KEY (`queue_id`) REFERENCES `csvp_newsletter_queue` (`queue_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_NLTTR_PROBLEM_SUBSCRIBER_ID_NLTTR_SUBSCRIBER_SUBSCRIBER_ID` FOREIGN KEY (`subscriber_id`) REFERENCES `csvp_newsletter_subscriber` (`subscriber_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter Problems';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_newsletter_problem`
--

LOCK TABLES `csvp_newsletter_problem` WRITE;
/*!40000 ALTER TABLE `csvp_newsletter_problem` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_newsletter_problem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_newsletter_queue`
--

DROP TABLE IF EXISTS `csvp_newsletter_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_newsletter_queue` (
  `queue_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Queue Id',
  `template_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Template ID',
  `newsletter_type` int(11) DEFAULT NULL COMMENT 'Newsletter Type',
  `newsletter_text` text COMMENT 'Newsletter Text',
  `newsletter_styles` text COMMENT 'Newsletter Styles',
  `newsletter_subject` varchar(200) DEFAULT NULL COMMENT 'Newsletter Subject',
  `newsletter_sender_name` varchar(200) DEFAULT NULL COMMENT 'Newsletter Sender Name',
  `newsletter_sender_email` varchar(200) DEFAULT NULL COMMENT 'Newsletter Sender Email',
  `queue_status` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Queue Status',
  `queue_start_at` timestamp NULL DEFAULT NULL COMMENT 'Queue Start At',
  `queue_finish_at` timestamp NULL DEFAULT NULL COMMENT 'Queue Finish At',
  PRIMARY KEY (`queue_id`),
  KEY `CSVP_NEWSLETTER_QUEUE_TEMPLATE_ID` (`template_id`),
  CONSTRAINT `CSVP_NLTTR_QUEUE_TEMPLATE_ID_NLTTR_TEMPLATE_TEMPLATE_ID` FOREIGN KEY (`template_id`) REFERENCES `csvp_newsletter_template` (`template_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter Queue';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_newsletter_queue`
--

LOCK TABLES `csvp_newsletter_queue` WRITE;
/*!40000 ALTER TABLE `csvp_newsletter_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_newsletter_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_newsletter_queue_link`
--

DROP TABLE IF EXISTS `csvp_newsletter_queue_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_newsletter_queue_link` (
  `queue_link_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Queue Link Id',
  `queue_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Queue Id',
  `subscriber_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Subscriber Id',
  `letter_sent_at` timestamp NULL DEFAULT NULL COMMENT 'Letter Sent At',
  PRIMARY KEY (`queue_link_id`),
  KEY `CSVP_NEWSLETTER_QUEUE_LINK_SUBSCRIBER_ID` (`subscriber_id`),
  KEY `CSVP_NEWSLETTER_QUEUE_LINK_QUEUE_ID_LETTER_SENT_AT` (`queue_id`,`letter_sent_at`),
  CONSTRAINT `CSVP_NEWSLETTER_QUEUE_LINK_QUEUE_ID_NEWSLETTER_QUEUE_QUEUE_ID` FOREIGN KEY (`queue_id`) REFERENCES `csvp_newsletter_queue` (`queue_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_E4ADAC13BC5F36496977D00E5FE7D7A3` FOREIGN KEY (`subscriber_id`) REFERENCES `csvp_newsletter_subscriber` (`subscriber_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter Queue Link';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_newsletter_queue_link`
--

LOCK TABLES `csvp_newsletter_queue_link` WRITE;
/*!40000 ALTER TABLE `csvp_newsletter_queue_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_newsletter_queue_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_newsletter_queue_store_link`
--

DROP TABLE IF EXISTS `csvp_newsletter_queue_store_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_newsletter_queue_store_link` (
  `queue_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Queue Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  PRIMARY KEY (`queue_id`,`store_id`),
  KEY `CSVP_NEWSLETTER_QUEUE_STORE_LINK_STORE_ID` (`store_id`),
  CONSTRAINT `CSVP_NEWSLETTER_QUEUE_STORE_LINK_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_NLTTR_QUEUE_STORE_LNK_QUEUE_ID_NLTTR_QUEUE_QUEUE_ID` FOREIGN KEY (`queue_id`) REFERENCES `csvp_newsletter_queue` (`queue_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter Queue Store Link';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_newsletter_queue_store_link`
--

LOCK TABLES `csvp_newsletter_queue_store_link` WRITE;
/*!40000 ALTER TABLE `csvp_newsletter_queue_store_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_newsletter_queue_store_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_newsletter_subscriber`
--

DROP TABLE IF EXISTS `csvp_newsletter_subscriber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_newsletter_subscriber` (
  `subscriber_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Subscriber Id',
  `store_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Store Id',
  `change_status_at` timestamp NULL DEFAULT NULL COMMENT 'Change Status At',
  `customer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Id',
  `subscriber_email` varchar(150) DEFAULT NULL COMMENT 'Subscriber Email',
  `subscriber_status` int(11) NOT NULL DEFAULT '0' COMMENT 'Subscriber Status',
  `subscriber_confirm_code` varchar(32) DEFAULT 'NULL' COMMENT 'Subscriber Confirm Code',
  PRIMARY KEY (`subscriber_id`),
  KEY `CSVP_NEWSLETTER_SUBSCRIBER_CUSTOMER_ID` (`customer_id`),
  KEY `CSVP_NEWSLETTER_SUBSCRIBER_STORE_ID` (`store_id`),
  CONSTRAINT `CSVP_NEWSLETTER_SUBSCRIBER_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter Subscriber';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_newsletter_subscriber`
--

LOCK TABLES `csvp_newsletter_subscriber` WRITE;
/*!40000 ALTER TABLE `csvp_newsletter_subscriber` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_newsletter_subscriber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_newsletter_template`
--

DROP TABLE IF EXISTS `csvp_newsletter_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_newsletter_template` (
  `template_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Template ID',
  `template_code` varchar(150) DEFAULT NULL COMMENT 'Template Code',
  `template_text` text COMMENT 'Template Text',
  `template_styles` text COMMENT 'Template Styles',
  `template_type` int(10) unsigned DEFAULT NULL COMMENT 'Template Type',
  `template_subject` varchar(200) DEFAULT NULL COMMENT 'Template Subject',
  `template_sender_name` varchar(200) DEFAULT NULL COMMENT 'Template Sender Name',
  `template_sender_email` varchar(200) DEFAULT NULL COMMENT 'Template Sender Email',
  `template_actual` smallint(5) unsigned DEFAULT '1' COMMENT 'Template Actual',
  `added_at` timestamp NULL DEFAULT NULL COMMENT 'Added At',
  `modified_at` timestamp NULL DEFAULT NULL COMMENT 'Modified At',
  PRIMARY KEY (`template_id`),
  KEY `CSVP_NEWSLETTER_TEMPLATE_TEMPLATE_ACTUAL` (`template_actual`),
  KEY `CSVP_NEWSLETTER_TEMPLATE_ADDED_AT` (`added_at`),
  KEY `CSVP_NEWSLETTER_TEMPLATE_MODIFIED_AT` (`modified_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter Template';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_newsletter_template`
--

LOCK TABLES `csvp_newsletter_template` WRITE;
/*!40000 ALTER TABLE `csvp_newsletter_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_newsletter_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_oauth_consumer`
--

DROP TABLE IF EXISTS `csvp_oauth_consumer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_oauth_consumer` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `name` varchar(255) NOT NULL COMMENT 'Name of consumer',
  `key` varchar(32) NOT NULL COMMENT 'Key code',
  `secret` varchar(32) NOT NULL COMMENT 'Secret code',
  `callback_url` text COMMENT 'Callback URL',
  `rejected_callback_url` text NOT NULL COMMENT 'Rejected callback URL',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `CSVP_OAUTH_CONSUMER_KEY` (`key`),
  UNIQUE KEY `CSVP_OAUTH_CONSUMER_SECRET` (`secret`),
  KEY `CSVP_OAUTH_CONSUMER_CREATED_AT` (`created_at`),
  KEY `CSVP_OAUTH_CONSUMER_UPDATED_AT` (`updated_at`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='OAuth Consumers';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_oauth_consumer`
--

LOCK TABLES `csvp_oauth_consumer` WRITE;
/*!40000 ALTER TABLE `csvp_oauth_consumer` DISABLE KEYS */;
INSERT INTO `csvp_oauth_consumer` VALUES (1,'2017-10-17 06:31:13','0000-00-00 00:00:00','Integration1','f6n3r47e9cgbvainwihtnld5bom07lmo','w9ynd5qtkij56ud70p7w80vsatpjvdsf',NULL,''),(2,'2017-10-17 12:49:11','0000-00-00 00:00:00','Integration2','r1vbihi4edf2kp1196ump4y0ck40kld0','3ltg0t4n37h2l4brrfyrvk8evxefu2xf',NULL,''),(3,'2017-10-18 09:43:58','0000-00-00 00:00:00','Integration3','rktumhqjjqdo6wxo2a6wglvwu2p6neki','gq4ih6ndyxphlqe7ivm1q19pu6b8qgpq',NULL,''),(4,'2017-10-18 09:51:09','0000-00-00 00:00:00','Integration4','79xl9s7elpe883nuiq5xcu67k0n5b58k','xcu35va4pgddj3oxfywd7mavcf4e5pc7',NULL,'');
/*!40000 ALTER TABLE `csvp_oauth_consumer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_oauth_nonce`
--

DROP TABLE IF EXISTS `csvp_oauth_nonce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_oauth_nonce` (
  `nonce` varchar(32) NOT NULL COMMENT 'Nonce String',
  `timestamp` int(10) unsigned NOT NULL COMMENT 'Nonce Timestamp',
  `consumer_id` int(10) unsigned NOT NULL COMMENT 'Consumer ID',
  UNIQUE KEY `CSVP_OAUTH_NONCE_NONCE_CONSUMER_ID` (`nonce`,`consumer_id`),
  KEY `CSVP_OAUTH_NONCE_CONSUMER_ID_OAUTH_CONSUMER_ENTITY_ID` (`consumer_id`),
  CONSTRAINT `CSVP_OAUTH_NONCE_CONSUMER_ID_OAUTH_CONSUMER_ENTITY_ID` FOREIGN KEY (`consumer_id`) REFERENCES `csvp_oauth_consumer` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='OAuth Nonce';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_oauth_nonce`
--

LOCK TABLES `csvp_oauth_nonce` WRITE;
/*!40000 ALTER TABLE `csvp_oauth_nonce` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_oauth_nonce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_oauth_token`
--

DROP TABLE IF EXISTS `csvp_oauth_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_oauth_token` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `consumer_id` int(10) unsigned DEFAULT NULL COMMENT 'Oauth Consumer ID',
  `admin_id` int(10) unsigned DEFAULT NULL COMMENT 'Admin user ID',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer user ID',
  `type` varchar(16) NOT NULL COMMENT 'Token Type',
  `token` varchar(32) NOT NULL COMMENT 'Token',
  `secret` varchar(32) NOT NULL COMMENT 'Token Secret',
  `verifier` varchar(32) DEFAULT NULL COMMENT 'Token Verifier',
  `callback_url` text NOT NULL COMMENT 'Token Callback URL',
  `revoked` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Token revoked',
  `authorized` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Token authorized',
  `user_type` int(11) DEFAULT NULL COMMENT 'User type',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Token creation timestamp',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `CSVP_OAUTH_TOKEN_TOKEN` (`token`),
  KEY `CSVP_OAUTH_TOKEN_CONSUMER_ID` (`consumer_id`),
  KEY `CSVP_OAUTH_TOKEN_ADMIN_ID_ADMIN_USER_USER_ID` (`admin_id`),
  KEY `CSVP_OAUTH_TOKEN_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` (`customer_id`),
  CONSTRAINT `CSVP_OAUTH_TOKEN_ADMIN_ID_ADMIN_USER_USER_ID` FOREIGN KEY (`admin_id`) REFERENCES `csvp_admin_user` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_OAUTH_TOKEN_CONSUMER_ID_OAUTH_CONSUMER_ENTITY_ID` FOREIGN KEY (`consumer_id`) REFERENCES `csvp_oauth_consumer` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_OAUTH_TOKEN_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `csvp_customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='OAuth Tokens';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_oauth_token`
--

LOCK TABLES `csvp_oauth_token` WRITE;
/*!40000 ALTER TABLE `csvp_oauth_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_oauth_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_oauth_token_request_log`
--

DROP TABLE IF EXISTS `csvp_oauth_token_request_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_oauth_token_request_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Log Id',
  `user_name` varchar(255) NOT NULL COMMENT 'Customer email or admin login',
  `user_type` smallint(5) unsigned NOT NULL COMMENT 'User type (admin or customer)',
  `failures_count` smallint(5) unsigned DEFAULT '0' COMMENT 'Number of failed authentication attempts in a row',
  `lock_expires_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Lock expiration time',
  PRIMARY KEY (`log_id`),
  UNIQUE KEY `CSVP_OAUTH_TOKEN_REQUEST_LOG_USER_NAME_USER_TYPE` (`user_name`,`user_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Log of token request authentication failures.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_oauth_token_request_log`
--

LOCK TABLES `csvp_oauth_token_request_log` WRITE;
/*!40000 ALTER TABLE `csvp_oauth_token_request_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_oauth_token_request_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_password_reset_request_event`
--

DROP TABLE IF EXISTS `csvp_password_reset_request_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_password_reset_request_event` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `request_type` smallint(5) unsigned NOT NULL COMMENT 'Type of the event under a security control',
  `account_reference` varchar(255) DEFAULT NULL COMMENT 'An identifier for existing account or another target',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Timestamp when the event occurs',
  `ip` varchar(15) NOT NULL COMMENT 'Remote user IP',
  PRIMARY KEY (`id`),
  KEY `CSVP_PASSWORD_RESET_REQUEST_EVENT_ACCOUNT_REFERENCE` (`account_reference`),
  KEY `CSVP_PASSWORD_RESET_REQUEST_EVENT_CREATED_AT` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Password Reset Request Event under a security control';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_password_reset_request_event`
--

LOCK TABLES `csvp_password_reset_request_event` WRITE;
/*!40000 ALTER TABLE `csvp_password_reset_request_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_password_reset_request_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_paypal_billing_agreement`
--

DROP TABLE IF EXISTS `csvp_paypal_billing_agreement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_paypal_billing_agreement` (
  `agreement_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Agreement Id',
  `customer_id` int(10) unsigned NOT NULL COMMENT 'Customer Id',
  `method_code` varchar(32) NOT NULL COMMENT 'Method Code',
  `reference_id` varchar(32) NOT NULL COMMENT 'Reference Id',
  `status` varchar(20) NOT NULL COMMENT 'Status',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `agreement_label` varchar(255) DEFAULT NULL COMMENT 'Agreement Label',
  PRIMARY KEY (`agreement_id`),
  KEY `CSVP_PAYPAL_BILLING_AGREEMENT_CUSTOMER_ID` (`customer_id`),
  KEY `CSVP_PAYPAL_BILLING_AGREEMENT_STORE_ID` (`store_id`),
  CONSTRAINT `CSVP_PAYPAL_BILLING_AGREEMENT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE SET NULL,
  CONSTRAINT `CSVP_PAYPAL_BILLING_AGRT_CSTR_ID_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `csvp_customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Billing Agreement';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_paypal_billing_agreement`
--

LOCK TABLES `csvp_paypal_billing_agreement` WRITE;
/*!40000 ALTER TABLE `csvp_paypal_billing_agreement` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_paypal_billing_agreement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_paypal_billing_agreement_order`
--

DROP TABLE IF EXISTS `csvp_paypal_billing_agreement_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_paypal_billing_agreement_order` (
  `agreement_id` int(10) unsigned NOT NULL COMMENT 'Agreement Id',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  PRIMARY KEY (`agreement_id`,`order_id`),
  KEY `CSVP_PAYPAL_BILLING_AGREEMENT_ORDER_ORDER_ID` (`order_id`),
  CONSTRAINT `CSVP_PAYPAL_BILLING_AGRT_ORDER_ORDER_ID_SALES_ORDER_ENTT_ID` FOREIGN KEY (`order_id`) REFERENCES `csvp_sales_order` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_3B5A682B289A13DA88A9B8754920CADB` FOREIGN KEY (`agreement_id`) REFERENCES `csvp_paypal_billing_agreement` (`agreement_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Billing Agreement Order';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_paypal_billing_agreement_order`
--

LOCK TABLES `csvp_paypal_billing_agreement_order` WRITE;
/*!40000 ALTER TABLE `csvp_paypal_billing_agreement_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_paypal_billing_agreement_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_paypal_cert`
--

DROP TABLE IF EXISTS `csvp_paypal_cert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_paypal_cert` (
  `cert_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Cert Id',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website Id',
  `content` text COMMENT 'Content',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  PRIMARY KEY (`cert_id`),
  KEY `CSVP_PAYPAL_CERT_WEBSITE_ID` (`website_id`),
  CONSTRAINT `CSVP_PAYPAL_CERT_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `csvp_store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Paypal Certificate Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_paypal_cert`
--

LOCK TABLES `csvp_paypal_cert` WRITE;
/*!40000 ALTER TABLE `csvp_paypal_cert` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_paypal_cert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_paypal_payment_transaction`
--

DROP TABLE IF EXISTS `csvp_paypal_payment_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_paypal_payment_transaction` (
  `transaction_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `txn_id` varchar(100) DEFAULT NULL COMMENT 'Txn Id',
  `additional_information` blob COMMENT 'Additional Information',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  PRIMARY KEY (`transaction_id`),
  UNIQUE KEY `CSVP_PAYPAL_PAYMENT_TRANSACTION_TXN_ID` (`txn_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='PayPal Payflow Link Payment Transaction';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_paypal_payment_transaction`
--

LOCK TABLES `csvp_paypal_payment_transaction` WRITE;
/*!40000 ALTER TABLE `csvp_paypal_payment_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_paypal_payment_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_paypal_settlement_report`
--

DROP TABLE IF EXISTS `csvp_paypal_settlement_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_paypal_settlement_report` (
  `report_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Report Id',
  `report_date` date DEFAULT NULL COMMENT 'Report Date',
  `account_id` varchar(64) DEFAULT NULL COMMENT 'Account Id',
  `filename` varchar(24) DEFAULT NULL COMMENT 'Filename',
  `last_modified` timestamp NULL DEFAULT NULL COMMENT 'Last Modified',
  PRIMARY KEY (`report_id`),
  UNIQUE KEY `CSVP_PAYPAL_SETTLEMENT_REPORT_REPORT_DATE_ACCOUNT_ID` (`report_date`,`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Paypal Settlement Report Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_paypal_settlement_report`
--

LOCK TABLES `csvp_paypal_settlement_report` WRITE;
/*!40000 ALTER TABLE `csvp_paypal_settlement_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_paypal_settlement_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_paypal_settlement_report_row`
--

DROP TABLE IF EXISTS `csvp_paypal_settlement_report_row`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_paypal_settlement_report_row` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Row Id',
  `report_id` int(10) unsigned NOT NULL COMMENT 'Report Id',
  `transaction_id` varchar(19) DEFAULT NULL COMMENT 'Transaction Id',
  `invoice_id` varchar(127) DEFAULT NULL COMMENT 'Invoice Id',
  `paypal_reference_id` varchar(19) DEFAULT NULL COMMENT 'Paypal Reference Id',
  `paypal_reference_id_type` varchar(3) DEFAULT NULL COMMENT 'Paypal Reference Id Type',
  `transaction_event_code` varchar(5) DEFAULT NULL COMMENT 'Transaction Event Code',
  `transaction_initiation_date` timestamp NULL DEFAULT NULL COMMENT 'Transaction Initiation Date',
  `transaction_completion_date` timestamp NULL DEFAULT NULL COMMENT 'Transaction Completion Date',
  `transaction_debit_or_credit` varchar(2) NOT NULL DEFAULT 'CR' COMMENT 'Transaction Debit Or Credit',
  `gross_transaction_amount` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT 'Gross Transaction Amount',
  `gross_transaction_currency` varchar(3) DEFAULT NULL COMMENT 'Gross Transaction Currency',
  `fee_debit_or_credit` varchar(2) DEFAULT NULL COMMENT 'Fee Debit Or Credit',
  `fee_amount` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT 'Fee Amount',
  `fee_currency` varchar(3) DEFAULT NULL COMMENT 'Fee Currency',
  `custom_field` varchar(255) DEFAULT NULL COMMENT 'Custom Field',
  `consumer_id` varchar(127) DEFAULT NULL COMMENT 'Consumer Id',
  `payment_tracking_id` varchar(255) DEFAULT NULL COMMENT 'Payment Tracking ID',
  `store_id` varchar(50) DEFAULT NULL COMMENT 'Store ID',
  PRIMARY KEY (`row_id`),
  KEY `CSVP_PAYPAL_SETTLEMENT_REPORT_ROW_REPORT_ID` (`report_id`),
  CONSTRAINT `FK_1D7D2C4894D43D738B0B218F542B1A6E` FOREIGN KEY (`report_id`) REFERENCES `csvp_paypal_settlement_report` (`report_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Paypal Settlement Report Row Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_paypal_settlement_report_row`
--

LOCK TABLES `csvp_paypal_settlement_report_row` WRITE;
/*!40000 ALTER TABLE `csvp_paypal_settlement_report_row` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_paypal_settlement_report_row` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_persistent_session`
--

DROP TABLE IF EXISTS `csvp_persistent_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_persistent_session` (
  `persistent_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Session id',
  `key` varchar(50) NOT NULL COMMENT 'Unique cookie key',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer id',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website ID',
  `info` text COMMENT 'Session Data',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  PRIMARY KEY (`persistent_id`),
  UNIQUE KEY `CSVP_PERSISTENT_SESSION_KEY` (`key`),
  UNIQUE KEY `CSVP_PERSISTENT_SESSION_CUSTOMER_ID` (`customer_id`),
  KEY `CSVP_PERSISTENT_SESSION_UPDATED_AT` (`updated_at`),
  KEY `CSVP_PERSISTENT_SESSION_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `CSVP_PERSISTENT_SESSION_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `csvp_customer_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_PERSISTENT_SESSION_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `csvp_store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Persistent Session';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_persistent_session`
--

LOCK TABLES `csvp_persistent_session` WRITE;
/*!40000 ALTER TABLE `csvp_persistent_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_persistent_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_product_alert_price`
--

DROP TABLE IF EXISTS `csvp_product_alert_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_product_alert_price` (
  `alert_price_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Product alert price id',
  `customer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer id',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product id',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price amount',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website id',
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Product alert add date',
  `last_send_date` timestamp NULL DEFAULT NULL COMMENT 'Product alert last send date',
  `send_count` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Product alert send count',
  `status` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Product alert status',
  PRIMARY KEY (`alert_price_id`),
  KEY `CSVP_PRODUCT_ALERT_PRICE_CUSTOMER_ID` (`customer_id`),
  KEY `CSVP_PRODUCT_ALERT_PRICE_PRODUCT_ID` (`product_id`),
  KEY `CSVP_PRODUCT_ALERT_PRICE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `CSVP_PRD_ALERT_PRICE_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `csvp_catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_PRODUCT_ALERT_PRICE_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `csvp_customer_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_PRODUCT_ALERT_PRICE_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `csvp_store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Product Alert Price';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_product_alert_price`
--

LOCK TABLES `csvp_product_alert_price` WRITE;
/*!40000 ALTER TABLE `csvp_product_alert_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_product_alert_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_product_alert_stock`
--

DROP TABLE IF EXISTS `csvp_product_alert_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_product_alert_stock` (
  `alert_stock_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Product alert stock id',
  `customer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer id',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product id',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website id',
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Product alert add date',
  `send_date` timestamp NULL DEFAULT NULL COMMENT 'Product alert send date',
  `send_count` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Send Count',
  `status` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Product alert status',
  PRIMARY KEY (`alert_stock_id`),
  KEY `CSVP_PRODUCT_ALERT_STOCK_CUSTOMER_ID` (`customer_id`),
  KEY `CSVP_PRODUCT_ALERT_STOCK_PRODUCT_ID` (`product_id`),
  KEY `CSVP_PRODUCT_ALERT_STOCK_WEBSITE_ID` (`website_id`),
  CONSTRAINT `CSVP_PRD_ALERT_STOCK_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `csvp_catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_PRODUCT_ALERT_STOCK_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `csvp_customer_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_PRODUCT_ALERT_STOCK_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `csvp_store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Product Alert Stock';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_product_alert_stock`
--

LOCK TABLES `csvp_product_alert_stock` WRITE;
/*!40000 ALTER TABLE `csvp_product_alert_stock` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_product_alert_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_quote`
--

DROP TABLE IF EXISTS `csvp_quote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_quote` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `converted_at` timestamp NULL DEFAULT NULL COMMENT 'Converted At',
  `is_active` smallint(5) unsigned DEFAULT '1' COMMENT 'Is Active',
  `is_virtual` smallint(5) unsigned DEFAULT '0' COMMENT 'Is Virtual',
  `is_multi_shipping` smallint(5) unsigned DEFAULT '0' COMMENT 'Is Multi Shipping',
  `items_count` int(10) unsigned DEFAULT '0' COMMENT 'Items Count',
  `items_qty` decimal(12,4) DEFAULT '0.0000' COMMENT 'Items Qty',
  `orig_order_id` int(10) unsigned DEFAULT '0' COMMENT 'Orig Order Id',
  `store_to_base_rate` decimal(12,4) DEFAULT '0.0000' COMMENT 'Store To Base Rate',
  `store_to_quote_rate` decimal(12,4) DEFAULT '0.0000' COMMENT 'Store To Quote Rate',
  `base_currency_code` varchar(255) DEFAULT NULL COMMENT 'Base Currency Code',
  `store_currency_code` varchar(255) DEFAULT NULL COMMENT 'Store Currency Code',
  `quote_currency_code` varchar(255) DEFAULT NULL COMMENT 'Quote Currency Code',
  `grand_total` decimal(12,4) DEFAULT '0.0000' COMMENT 'Grand Total',
  `base_grand_total` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Grand Total',
  `checkout_method` varchar(255) DEFAULT NULL COMMENT 'Checkout Method',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  `customer_tax_class_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Tax Class Id',
  `customer_group_id` int(10) unsigned DEFAULT '0' COMMENT 'Customer Group Id',
  `customer_email` varchar(255) DEFAULT NULL COMMENT 'Customer Email',
  `customer_prefix` varchar(40) DEFAULT NULL COMMENT 'Customer Prefix',
  `customer_firstname` varchar(255) DEFAULT NULL COMMENT 'Customer Firstname',
  `customer_middlename` varchar(40) DEFAULT NULL COMMENT 'Customer Middlename',
  `customer_lastname` varchar(255) DEFAULT NULL COMMENT 'Customer Lastname',
  `customer_suffix` varchar(40) DEFAULT NULL COMMENT 'Customer Suffix',
  `customer_dob` datetime DEFAULT NULL COMMENT 'Customer Dob',
  `customer_note` varchar(255) DEFAULT NULL COMMENT 'Customer Note',
  `customer_note_notify` smallint(5) unsigned DEFAULT '1' COMMENT 'Customer Note Notify',
  `customer_is_guest` smallint(5) unsigned DEFAULT '0' COMMENT 'Customer Is Guest',
  `remote_ip` varchar(32) DEFAULT NULL COMMENT 'Remote Ip',
  `applied_rule_ids` varchar(255) DEFAULT NULL COMMENT 'Applied Rule Ids',
  `reserved_order_id` varchar(64) DEFAULT NULL COMMENT 'Reserved Order Id',
  `password_hash` varchar(255) DEFAULT NULL COMMENT 'Password Hash',
  `coupon_code` varchar(255) DEFAULT NULL COMMENT 'Coupon Code',
  `global_currency_code` varchar(255) DEFAULT NULL COMMENT 'Global Currency Code',
  `base_to_global_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Global Rate',
  `base_to_quote_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Quote Rate',
  `customer_taxvat` varchar(255) DEFAULT NULL COMMENT 'Customer Taxvat',
  `customer_gender` varchar(255) DEFAULT NULL COMMENT 'Customer Gender',
  `subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal',
  `base_subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal',
  `subtotal_with_discount` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal With Discount',
  `base_subtotal_with_discount` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal With Discount',
  `is_changed` int(10) unsigned DEFAULT NULL COMMENT 'Is Changed',
  `trigger_recollect` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Trigger Recollect',
  `ext_shipping_info` text COMMENT 'Ext Shipping Info',
  `is_persistent` smallint(5) unsigned DEFAULT '0' COMMENT 'Is Quote Persistent',
  `gift_message_id` int(11) DEFAULT NULL COMMENT 'Gift Message Id',
  PRIMARY KEY (`entity_id`),
  KEY `CSVP_QUOTE_CUSTOMER_ID_STORE_ID_IS_ACTIVE` (`customer_id`,`store_id`,`is_active`),
  KEY `CSVP_QUOTE_STORE_ID` (`store_id`),
  CONSTRAINT `CSVP_QUOTE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_quote`
--

LOCK TABLES `csvp_quote` WRITE;
/*!40000 ALTER TABLE `csvp_quote` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_quote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_quote_address`
--

DROP TABLE IF EXISTS `csvp_quote_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_quote_address` (
  `address_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Address Id',
  `quote_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Quote Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  `save_in_address_book` smallint(6) DEFAULT '0' COMMENT 'Save In Address Book',
  `customer_address_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Address Id',
  `address_type` varchar(10) DEFAULT NULL COMMENT 'Address Type',
  `email` varchar(255) DEFAULT NULL COMMENT 'Email',
  `prefix` varchar(40) DEFAULT NULL COMMENT 'Prefix',
  `firstname` varchar(255) DEFAULT NULL,
  `middlename` varchar(40) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `suffix` varchar(40) DEFAULT NULL COMMENT 'Suffix',
  `company` varchar(255) DEFAULT NULL COMMENT 'Company',
  `street` varchar(255) DEFAULT NULL COMMENT 'Street',
  `city` varchar(40) DEFAULT NULL COMMENT 'City',
  `region` varchar(40) DEFAULT NULL COMMENT 'Region',
  `region_id` int(10) unsigned DEFAULT NULL COMMENT 'Region Id',
  `postcode` varchar(20) DEFAULT NULL COMMENT 'Postcode',
  `country_id` varchar(30) DEFAULT NULL COMMENT 'Country Id',
  `telephone` varchar(20) DEFAULT NULL COMMENT 'Phone Number',
  `fax` varchar(20) DEFAULT NULL COMMENT 'Fax',
  `same_as_billing` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Same As Billing',
  `collect_shipping_rates` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Collect Shipping Rates',
  `shipping_method` varchar(120) DEFAULT NULL,
  `shipping_description` varchar(255) DEFAULT NULL COMMENT 'Shipping Description',
  `weight` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Weight',
  `subtotal` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal',
  `base_subtotal` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Subtotal',
  `subtotal_with_discount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal With Discount',
  `base_subtotal_with_discount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Subtotal With Discount',
  `tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Tax Amount',
  `base_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Tax Amount',
  `shipping_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Shipping Amount',
  `base_shipping_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Shipping Amount',
  `shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Tax Amount',
  `base_shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Tax Amount',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  `base_discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Discount Amount',
  `grand_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Grand Total',
  `base_grand_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Grand Total',
  `customer_notes` text COMMENT 'Customer Notes',
  `applied_taxes` text COMMENT 'Applied Taxes',
  `discount_description` varchar(255) DEFAULT NULL COMMENT 'Discount Description',
  `shipping_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Discount Amount',
  `base_shipping_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Discount Amount',
  `subtotal_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal Incl Tax',
  `base_subtotal_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal Total Incl Tax',
  `discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `shipping_discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Discount Tax Compensation Amount',
  `base_shipping_discount_tax_compensation_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Discount Tax Compensation Amount',
  `shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Incl Tax',
  `base_shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Incl Tax',
  `free_shipping` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Free Shipping',
  `vat_id` text COMMENT 'Vat Id',
  `vat_is_valid` smallint(6) DEFAULT NULL COMMENT 'Vat Is Valid',
  `vat_request_id` text COMMENT 'Vat Request Id',
  `vat_request_date` text COMMENT 'Vat Request Date',
  `vat_request_success` smallint(6) DEFAULT NULL COMMENT 'Vat Request Success',
  `gift_message_id` int(11) DEFAULT NULL COMMENT 'Gift Message Id',
  PRIMARY KEY (`address_id`),
  KEY `CSVP_QUOTE_ADDRESS_QUOTE_ID` (`quote_id`),
  CONSTRAINT `CSVP_QUOTE_ADDRESS_QUOTE_ID_QUOTE_ENTITY_ID` FOREIGN KEY (`quote_id`) REFERENCES `csvp_quote` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote Address';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_quote_address`
--

LOCK TABLES `csvp_quote_address` WRITE;
/*!40000 ALTER TABLE `csvp_quote_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_quote_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_quote_address_item`
--

DROP TABLE IF EXISTS `csvp_quote_address_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_quote_address_item` (
  `address_item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Address Item Id',
  `parent_item_id` int(10) unsigned DEFAULT NULL COMMENT 'Parent Item Id',
  `quote_address_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Quote Address Id',
  `quote_item_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Quote Item Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `applied_rule_ids` text COMMENT 'Applied Rule Ids',
  `additional_data` text COMMENT 'Additional Data',
  `weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Weight',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `discount_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Discount Amount',
  `tax_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Tax Amount',
  `row_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Row Total',
  `base_row_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Row Total',
  `row_total_with_discount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Row Total With Discount',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Discount Amount',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Tax Amount',
  `row_weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Row Weight',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `super_product_id` int(10) unsigned DEFAULT NULL COMMENT 'Super Product Id',
  `parent_product_id` int(10) unsigned DEFAULT NULL COMMENT 'Parent Product Id',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  `image` varchar(255) DEFAULT NULL COMMENT 'Image',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text COMMENT 'Description',
  `is_qty_decimal` int(10) unsigned DEFAULT NULL COMMENT 'Is Qty Decimal',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `discount_percent` decimal(12,4) DEFAULT NULL COMMENT 'Discount Percent',
  `no_discount` int(10) unsigned DEFAULT NULL COMMENT 'No Discount',
  `tax_percent` decimal(12,4) DEFAULT NULL COMMENT 'Tax Percent',
  `base_price` decimal(12,4) DEFAULT NULL COMMENT 'Base Price',
  `base_cost` decimal(12,4) DEFAULT NULL COMMENT 'Base Cost',
  `price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Price Incl Tax',
  `base_price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Price Incl Tax',
  `row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Row Total Incl Tax',
  `base_row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total Incl Tax',
  `discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `free_shipping` int(10) unsigned DEFAULT NULL COMMENT 'Free Shipping',
  `gift_message_id` int(11) DEFAULT NULL COMMENT 'Gift Message Id',
  PRIMARY KEY (`address_item_id`),
  KEY `CSVP_QUOTE_ADDRESS_ITEM_QUOTE_ADDRESS_ID` (`quote_address_id`),
  KEY `CSVP_QUOTE_ADDRESS_ITEM_PARENT_ITEM_ID` (`parent_item_id`),
  KEY `CSVP_QUOTE_ADDRESS_ITEM_QUOTE_ITEM_ID` (`quote_item_id`),
  CONSTRAINT `CSVP_QUOTE_ADDRESS_ITEM_QUOTE_ITEM_ID_QUOTE_ITEM_ITEM_ID` FOREIGN KEY (`quote_item_id`) REFERENCES `csvp_quote_item` (`item_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_QUOTE_ADDR_ITEM_PARENT_ITEM_ID_QUOTE_ADDR_ITEM_ADDR_ITEM_ID` FOREIGN KEY (`parent_item_id`) REFERENCES `csvp_quote_address_item` (`address_item_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_QUOTE_ADDR_ITEM_QUOTE_ADDR_ID_QUOTE_ADDR_ADDR_ID` FOREIGN KEY (`quote_address_id`) REFERENCES `csvp_quote_address` (`address_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote Address Item';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_quote_address_item`
--

LOCK TABLES `csvp_quote_address_item` WRITE;
/*!40000 ALTER TABLE `csvp_quote_address_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_quote_address_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_quote_id_mask`
--

DROP TABLE IF EXISTS `csvp_quote_id_mask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_quote_id_mask` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `quote_id` int(10) unsigned NOT NULL COMMENT 'Quote ID',
  `masked_id` varchar(32) DEFAULT NULL COMMENT 'Masked ID',
  PRIMARY KEY (`entity_id`,`quote_id`),
  KEY `CSVP_QUOTE_ID_MASK_QUOTE_ID` (`quote_id`),
  KEY `CSVP_QUOTE_ID_MASK_MASKED_ID` (`masked_id`),
  CONSTRAINT `CSVP_QUOTE_ID_MASK_QUOTE_ID_QUOTE_ENTITY_ID` FOREIGN KEY (`quote_id`) REFERENCES `csvp_quote` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Quote ID and masked ID mapping';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_quote_id_mask`
--

LOCK TABLES `csvp_quote_id_mask` WRITE;
/*!40000 ALTER TABLE `csvp_quote_id_mask` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_quote_id_mask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_quote_item`
--

DROP TABLE IF EXISTS `csvp_quote_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_quote_item` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Item Id',
  `quote_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Quote Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `parent_item_id` int(10) unsigned DEFAULT NULL COMMENT 'Parent Item Id',
  `is_virtual` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Virtual',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text COMMENT 'Description',
  `applied_rule_ids` text COMMENT 'Applied Rule Ids',
  `additional_data` text COMMENT 'Additional Data',
  `is_qty_decimal` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Qty Decimal',
  `no_discount` smallint(5) unsigned DEFAULT '0' COMMENT 'No Discount',
  `weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Weight',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Price',
  `custom_price` decimal(12,4) DEFAULT NULL COMMENT 'Custom Price',
  `discount_percent` decimal(12,4) DEFAULT '0.0000' COMMENT 'Discount Percent',
  `discount_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Discount Amount',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Discount Amount',
  `tax_percent` decimal(12,4) DEFAULT '0.0000' COMMENT 'Tax Percent',
  `tax_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Tax Amount',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Tax Amount',
  `row_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Row Total',
  `base_row_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Row Total',
  `row_total_with_discount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Row Total With Discount',
  `row_weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Row Weight',
  `product_type` varchar(255) DEFAULT NULL COMMENT 'Product Type',
  `base_tax_before_discount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Before Discount',
  `tax_before_discount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Before Discount',
  `original_custom_price` decimal(12,4) DEFAULT NULL COMMENT 'Original Custom Price',
  `redirect_url` varchar(255) DEFAULT NULL COMMENT 'Redirect Url',
  `base_cost` decimal(12,4) DEFAULT NULL COMMENT 'Base Cost',
  `price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Price Incl Tax',
  `base_price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Price Incl Tax',
  `row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Row Total Incl Tax',
  `base_row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total Incl Tax',
  `discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `free_shipping` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Free Shipping',
  `gift_message_id` int(11) DEFAULT NULL COMMENT 'Gift Message Id',
  `weee_tax_applied` text COMMENT 'Weee Tax Applied',
  `weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Amount',
  `weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Row Amount',
  `weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Disposition',
  `weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Row Disposition',
  `base_weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Amount',
  `base_weee_tax_applied_row_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Row Amnt',
  `base_weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Disposition',
  `base_weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Row Disposition',
  PRIMARY KEY (`item_id`),
  KEY `CSVP_QUOTE_ITEM_PARENT_ITEM_ID` (`parent_item_id`),
  KEY `CSVP_QUOTE_ITEM_PRODUCT_ID` (`product_id`),
  KEY `CSVP_QUOTE_ITEM_QUOTE_ID` (`quote_id`),
  KEY `CSVP_QUOTE_ITEM_STORE_ID` (`store_id`),
  CONSTRAINT `CSVP_QUOTE_ITEM_PARENT_ITEM_ID_QUOTE_ITEM_ITEM_ID` FOREIGN KEY (`parent_item_id`) REFERENCES `csvp_quote_item` (`item_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_QUOTE_ITEM_QUOTE_ID_QUOTE_ENTITY_ID` FOREIGN KEY (`quote_id`) REFERENCES `csvp_quote` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_QUOTE_ITEM_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote Item';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_quote_item`
--

LOCK TABLES `csvp_quote_item` WRITE;
/*!40000 ALTER TABLE `csvp_quote_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_quote_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_quote_item_option`
--

DROP TABLE IF EXISTS `csvp_quote_item_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_quote_item_option` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Id',
  `item_id` int(10) unsigned NOT NULL COMMENT 'Item Id',
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `value` text COMMENT 'Value',
  PRIMARY KEY (`option_id`),
  KEY `CSVP_QUOTE_ITEM_OPTION_ITEM_ID` (`item_id`),
  CONSTRAINT `CSVP_QUOTE_ITEM_OPTION_ITEM_ID_QUOTE_ITEM_ITEM_ID` FOREIGN KEY (`item_id`) REFERENCES `csvp_quote_item` (`item_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote Item Option';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_quote_item_option`
--

LOCK TABLES `csvp_quote_item_option` WRITE;
/*!40000 ALTER TABLE `csvp_quote_item_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_quote_item_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_quote_payment`
--

DROP TABLE IF EXISTS `csvp_quote_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_quote_payment` (
  `payment_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Payment Id',
  `quote_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Quote Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `method` varchar(255) DEFAULT NULL COMMENT 'Method',
  `cc_type` varchar(255) DEFAULT NULL COMMENT 'Cc Type',
  `cc_number_enc` varchar(255) DEFAULT NULL COMMENT 'Cc Number Enc',
  `cc_last_4` varchar(255) DEFAULT NULL COMMENT 'Cc Last 4',
  `cc_cid_enc` varchar(255) DEFAULT NULL COMMENT 'Cc Cid Enc',
  `cc_owner` varchar(255) DEFAULT NULL COMMENT 'Cc Owner',
  `cc_exp_month` varchar(255) DEFAULT NULL COMMENT 'Cc Exp Month',
  `cc_exp_year` smallint(5) unsigned DEFAULT '0' COMMENT 'Cc Exp Year',
  `cc_ss_owner` varchar(255) DEFAULT NULL COMMENT 'Cc Ss Owner',
  `cc_ss_start_month` smallint(5) unsigned DEFAULT '0' COMMENT 'Cc Ss Start Month',
  `cc_ss_start_year` smallint(5) unsigned DEFAULT '0' COMMENT 'Cc Ss Start Year',
  `po_number` varchar(255) DEFAULT NULL COMMENT 'Po Number',
  `additional_data` text COMMENT 'Additional Data',
  `cc_ss_issue` varchar(255) DEFAULT NULL COMMENT 'Cc Ss Issue',
  `additional_information` text COMMENT 'Additional Information',
  `paypal_payer_id` varchar(255) DEFAULT NULL COMMENT 'Paypal Payer Id',
  `paypal_payer_status` varchar(255) DEFAULT NULL COMMENT 'Paypal Payer Status',
  `paypal_correlation_id` varchar(255) DEFAULT NULL COMMENT 'Paypal Correlation Id',
  PRIMARY KEY (`payment_id`),
  KEY `CSVP_QUOTE_PAYMENT_QUOTE_ID` (`quote_id`),
  CONSTRAINT `CSVP_QUOTE_PAYMENT_QUOTE_ID_QUOTE_ENTITY_ID` FOREIGN KEY (`quote_id`) REFERENCES `csvp_quote` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote Payment';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_quote_payment`
--

LOCK TABLES `csvp_quote_payment` WRITE;
/*!40000 ALTER TABLE `csvp_quote_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_quote_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_quote_shipping_rate`
--

DROP TABLE IF EXISTS `csvp_quote_shipping_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_quote_shipping_rate` (
  `rate_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rate Id',
  `address_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Address Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `carrier` varchar(255) DEFAULT NULL COMMENT 'Carrier',
  `carrier_title` varchar(255) DEFAULT NULL COMMENT 'Carrier Title',
  `code` varchar(255) DEFAULT NULL COMMENT 'Code',
  `method` varchar(255) DEFAULT NULL COMMENT 'Method',
  `method_description` text COMMENT 'Method Description',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  `error_message` text COMMENT 'Error Message',
  `method_title` text COMMENT 'Method Title',
  PRIMARY KEY (`rate_id`),
  KEY `CSVP_QUOTE_SHIPPING_RATE_ADDRESS_ID` (`address_id`),
  CONSTRAINT `CSVP_QUOTE_SHIPPING_RATE_ADDRESS_ID_QUOTE_ADDRESS_ADDRESS_ID` FOREIGN KEY (`address_id`) REFERENCES `csvp_quote_address` (`address_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote Shipping Rate';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_quote_shipping_rate`
--

LOCK TABLES `csvp_quote_shipping_rate` WRITE;
/*!40000 ALTER TABLE `csvp_quote_shipping_rate` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_quote_shipping_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_rating`
--

DROP TABLE IF EXISTS `csvp_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_rating` (
  `rating_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rating Id',
  `entity_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `rating_code` varchar(64) NOT NULL COMMENT 'Rating Code',
  `position` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Position On Storefront',
  `is_active` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Rating is active.',
  PRIMARY KEY (`rating_id`),
  UNIQUE KEY `CSVP_RATING_RATING_CODE` (`rating_code`),
  KEY `CSVP_RATING_ENTITY_ID` (`entity_id`),
  CONSTRAINT `CSVP_RATING_ENTITY_ID_RATING_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `csvp_rating_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Ratings';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_rating`
--

LOCK TABLES `csvp_rating` WRITE;
/*!40000 ALTER TABLE `csvp_rating` DISABLE KEYS */;
INSERT INTO `csvp_rating` VALUES (1,1,'Quality',0,1),(2,1,'Value',0,1),(3,1,'Price',0,1);
/*!40000 ALTER TABLE `csvp_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_rating_entity`
--

DROP TABLE IF EXISTS `csvp_rating_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_rating_entity` (
  `entity_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `entity_code` varchar(64) NOT NULL COMMENT 'Entity Code',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `CSVP_RATING_ENTITY_ENTITY_CODE` (`entity_code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Rating entities';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_rating_entity`
--

LOCK TABLES `csvp_rating_entity` WRITE;
/*!40000 ALTER TABLE `csvp_rating_entity` DISABLE KEYS */;
INSERT INTO `csvp_rating_entity` VALUES (1,'product'),(2,'product_review'),(3,'review');
/*!40000 ALTER TABLE `csvp_rating_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_rating_option`
--

DROP TABLE IF EXISTS `csvp_rating_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_rating_option` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rating Option Id',
  `rating_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Id',
  `code` varchar(32) NOT NULL COMMENT 'Rating Option Code',
  `value` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Option Value',
  `position` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Ration option position on Storefront',
  PRIMARY KEY (`option_id`),
  KEY `CSVP_RATING_OPTION_RATING_ID` (`rating_id`),
  CONSTRAINT `CSVP_RATING_OPTION_RATING_ID_RATING_RATING_ID` FOREIGN KEY (`rating_id`) REFERENCES `csvp_rating` (`rating_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='Rating options';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_rating_option`
--

LOCK TABLES `csvp_rating_option` WRITE;
/*!40000 ALTER TABLE `csvp_rating_option` DISABLE KEYS */;
INSERT INTO `csvp_rating_option` VALUES (1,1,'1',1,1),(2,1,'2',2,2),(3,1,'3',3,3),(4,1,'4',4,4),(5,1,'5',5,5),(6,2,'1',1,1),(7,2,'2',2,2),(8,2,'3',3,3),(9,2,'4',4,4),(10,2,'5',5,5),(11,3,'1',1,1),(12,3,'2',2,2),(13,3,'3',3,3),(14,3,'4',4,4),(15,3,'5',5,5);
/*!40000 ALTER TABLE `csvp_rating_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_rating_option_vote`
--

DROP TABLE IF EXISTS `csvp_rating_option_vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_rating_option_vote` (
  `vote_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Vote id',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Vote option id',
  `remote_ip` varchar(16) NOT NULL COMMENT 'Customer IP',
  `remote_ip_long` bigint(20) NOT NULL DEFAULT '0' COMMENT 'Customer IP converted to long integer format',
  `customer_id` int(10) unsigned DEFAULT '0' COMMENT 'Customer Id',
  `entity_pk_value` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'Product id',
  `rating_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating id',
  `review_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Review id',
  `percent` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Percent amount',
  `value` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Vote option value',
  PRIMARY KEY (`vote_id`),
  KEY `CSVP_RATING_OPTION_VOTE_OPTION_ID` (`option_id`),
  KEY `CSVP_RATING_OPTION_VOTE_REVIEW_ID_REVIEW_REVIEW_ID` (`review_id`),
  CONSTRAINT `CSVP_RATING_OPTION_VOTE_OPTION_ID_RATING_OPTION_OPTION_ID` FOREIGN KEY (`option_id`) REFERENCES `csvp_rating_option` (`option_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_RATING_OPTION_VOTE_REVIEW_ID_REVIEW_REVIEW_ID` FOREIGN KEY (`review_id`) REFERENCES `csvp_review` (`review_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Rating option values';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_rating_option_vote`
--

LOCK TABLES `csvp_rating_option_vote` WRITE;
/*!40000 ALTER TABLE `csvp_rating_option_vote` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_rating_option_vote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_rating_option_vote_aggregated`
--

DROP TABLE IF EXISTS `csvp_rating_option_vote_aggregated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_rating_option_vote_aggregated` (
  `primary_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Vote aggregation id',
  `rating_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating id',
  `entity_pk_value` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'Product id',
  `vote_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Vote dty',
  `vote_value_sum` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'General vote sum',
  `percent` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Vote percent',
  `percent_approved` smallint(6) DEFAULT '0' COMMENT 'Vote percent approved by admin',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  PRIMARY KEY (`primary_id`),
  KEY `CSVP_RATING_OPTION_VOTE_AGGREGATED_RATING_ID` (`rating_id`),
  KEY `CSVP_RATING_OPTION_VOTE_AGGREGATED_STORE_ID` (`store_id`),
  CONSTRAINT `CSVP_RATING_OPTION_VOTE_AGGREGATED_RATING_ID_RATING_RATING_ID` FOREIGN KEY (`rating_id`) REFERENCES `csvp_rating` (`rating_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_RATING_OPTION_VOTE_AGGREGATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Rating vote aggregated';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_rating_option_vote_aggregated`
--

LOCK TABLES `csvp_rating_option_vote_aggregated` WRITE;
/*!40000 ALTER TABLE `csvp_rating_option_vote_aggregated` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_rating_option_vote_aggregated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_rating_store`
--

DROP TABLE IF EXISTS `csvp_rating_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_rating_store` (
  `rating_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store id',
  PRIMARY KEY (`rating_id`,`store_id`),
  KEY `CSVP_RATING_STORE_STORE_ID` (`store_id`),
  CONSTRAINT `CSVP_RATING_STORE_RATING_ID_RATING_RATING_ID` FOREIGN KEY (`rating_id`) REFERENCES `csvp_rating` (`rating_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_RATING_STORE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Rating Store';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_rating_store`
--

LOCK TABLES `csvp_rating_store` WRITE;
/*!40000 ALTER TABLE `csvp_rating_store` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_rating_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_rating_title`
--

DROP TABLE IF EXISTS `csvp_rating_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_rating_title` (
  `rating_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `value` varchar(255) NOT NULL COMMENT 'Rating Label',
  PRIMARY KEY (`rating_id`,`store_id`),
  KEY `CSVP_RATING_TITLE_STORE_ID` (`store_id`),
  CONSTRAINT `CSVP_RATING_TITLE_RATING_ID_RATING_RATING_ID` FOREIGN KEY (`rating_id`) REFERENCES `csvp_rating` (`rating_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_RATING_TITLE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Rating Title';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_rating_title`
--

LOCK TABLES `csvp_rating_title` WRITE;
/*!40000 ALTER TABLE `csvp_rating_title` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_rating_title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_report_compared_product_index`
--

DROP TABLE IF EXISTS `csvp_report_compared_product_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_report_compared_product_index` (
  `index_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Index Id',
  `visitor_id` int(10) unsigned DEFAULT NULL COMMENT 'Visitor Id',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `added_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Added At',
  PRIMARY KEY (`index_id`),
  UNIQUE KEY `CSVP_REPORT_COMPARED_PRODUCT_INDEX_VISITOR_ID_PRODUCT_ID` (`visitor_id`,`product_id`),
  UNIQUE KEY `CSVP_REPORT_COMPARED_PRODUCT_INDEX_CUSTOMER_ID_PRODUCT_ID` (`customer_id`,`product_id`),
  KEY `CSVP_REPORT_COMPARED_PRODUCT_INDEX_STORE_ID` (`store_id`),
  KEY `CSVP_REPORT_COMPARED_PRODUCT_INDEX_ADDED_AT` (`added_at`),
  KEY `CSVP_REPORT_COMPARED_PRODUCT_INDEX_PRODUCT_ID` (`product_id`),
  CONSTRAINT `CSVP_REPORT_CMPD_PRD_IDX_CSTR_ID_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `csvp_customer_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_REPORT_CMPD_PRD_IDX_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `csvp_catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_REPORT_COMPARED_PRODUCT_INDEX_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Reports Compared Product Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_report_compared_product_index`
--

LOCK TABLES `csvp_report_compared_product_index` WRITE;
/*!40000 ALTER TABLE `csvp_report_compared_product_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_report_compared_product_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_report_event`
--

DROP TABLE IF EXISTS `csvp_report_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_report_event` (
  `event_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Event Id',
  `logged_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Logged At',
  `event_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Event Type Id',
  `object_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Object Id',
  `subject_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Subject Id',
  `subtype` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Subtype',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  PRIMARY KEY (`event_id`),
  KEY `CSVP_REPORT_EVENT_EVENT_TYPE_ID` (`event_type_id`),
  KEY `CSVP_REPORT_EVENT_SUBJECT_ID` (`subject_id`),
  KEY `CSVP_REPORT_EVENT_OBJECT_ID` (`object_id`),
  KEY `CSVP_REPORT_EVENT_SUBTYPE` (`subtype`),
  KEY `CSVP_REPORT_EVENT_STORE_ID` (`store_id`),
  CONSTRAINT `CSVP_REPORT_EVENT_EVENT_TYPE_ID_REPORT_EVENT_TYPES_EVENT_TYPE_ID` FOREIGN KEY (`event_type_id`) REFERENCES `csvp_report_event_types` (`event_type_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_REPORT_EVENT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Reports Event Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_report_event`
--

LOCK TABLES `csvp_report_event` WRITE;
/*!40000 ALTER TABLE `csvp_report_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_report_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_report_event_types`
--

DROP TABLE IF EXISTS `csvp_report_event_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_report_event_types` (
  `event_type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Event Type Id',
  `event_name` varchar(64) NOT NULL COMMENT 'Event Name',
  `customer_login` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Login',
  PRIMARY KEY (`event_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='Reports Event Type Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_report_event_types`
--

LOCK TABLES `csvp_report_event_types` WRITE;
/*!40000 ALTER TABLE `csvp_report_event_types` DISABLE KEYS */;
INSERT INTO `csvp_report_event_types` VALUES (1,'catalog_product_view',0),(2,'sendfriend_product',0),(3,'catalog_product_compare_add_product',0),(4,'checkout_cart_add_product',0),(5,'wishlist_add_product',0),(6,'wishlist_share',0);
/*!40000 ALTER TABLE `csvp_report_event_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_report_viewed_product_aggregated_daily`
--

DROP TABLE IF EXISTS `csvp_report_viewed_product_aggregated_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_report_viewed_product_aggregated_daily` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `views_num` int(11) NOT NULL DEFAULT '0' COMMENT 'Number of Views',
  `rating_pos` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Pos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `CSVP_REPORT_VIEWED_PRD_AGGRED_DAILY_PERIOD_STORE_ID_PRD_ID` (`period`,`store_id`,`product_id`),
  KEY `CSVP_REPORT_VIEWED_PRODUCT_AGGREGATED_DAILY_STORE_ID` (`store_id`),
  KEY `CSVP_REPORT_VIEWED_PRODUCT_AGGREGATED_DAILY_PRODUCT_ID` (`product_id`),
  CONSTRAINT `CSVP_REPORT_VIEWED_PRD_AGGRED_DAILY_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `csvp_catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_REPORT_VIEWED_PRD_AGGRED_DAILY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Most Viewed Products Aggregated Daily';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_report_viewed_product_aggregated_daily`
--

LOCK TABLES `csvp_report_viewed_product_aggregated_daily` WRITE;
/*!40000 ALTER TABLE `csvp_report_viewed_product_aggregated_daily` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_report_viewed_product_aggregated_daily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_report_viewed_product_aggregated_monthly`
--

DROP TABLE IF EXISTS `csvp_report_viewed_product_aggregated_monthly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_report_viewed_product_aggregated_monthly` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `views_num` int(11) NOT NULL DEFAULT '0' COMMENT 'Number of Views',
  `rating_pos` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Pos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `CSVP_REPORT_VIEWED_PRD_AGGRED_MONTHLY_PERIOD_STORE_ID_PRD_ID` (`period`,`store_id`,`product_id`),
  KEY `CSVP_REPORT_VIEWED_PRODUCT_AGGREGATED_MONTHLY_STORE_ID` (`store_id`),
  KEY `CSVP_REPORT_VIEWED_PRODUCT_AGGREGATED_MONTHLY_PRODUCT_ID` (`product_id`),
  CONSTRAINT `CSVP_REPORT_VIEWED_PRD_AGGRED_MONTHLY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_D56AAAC52FBA639F1E1E6F790648E369` FOREIGN KEY (`product_id`) REFERENCES `csvp_catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Most Viewed Products Aggregated Monthly';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_report_viewed_product_aggregated_monthly`
--

LOCK TABLES `csvp_report_viewed_product_aggregated_monthly` WRITE;
/*!40000 ALTER TABLE `csvp_report_viewed_product_aggregated_monthly` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_report_viewed_product_aggregated_monthly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_report_viewed_product_aggregated_yearly`
--

DROP TABLE IF EXISTS `csvp_report_viewed_product_aggregated_yearly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_report_viewed_product_aggregated_yearly` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `views_num` int(11) NOT NULL DEFAULT '0' COMMENT 'Number of Views',
  `rating_pos` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Pos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `CSVP_REPORT_VIEWED_PRD_AGGRED_YEARLY_PERIOD_STORE_ID_PRD_ID` (`period`,`store_id`,`product_id`),
  KEY `CSVP_REPORT_VIEWED_PRODUCT_AGGREGATED_YEARLY_STORE_ID` (`store_id`),
  KEY `CSVP_REPORT_VIEWED_PRODUCT_AGGREGATED_YEARLY_PRODUCT_ID` (`product_id`),
  CONSTRAINT `CSVP_REPORT_VIEWED_PRD_AGGRED_YEARLY_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `csvp_catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_REPORT_VIEWED_PRD_AGGRED_YEARLY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Most Viewed Products Aggregated Yearly';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_report_viewed_product_aggregated_yearly`
--

LOCK TABLES `csvp_report_viewed_product_aggregated_yearly` WRITE;
/*!40000 ALTER TABLE `csvp_report_viewed_product_aggregated_yearly` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_report_viewed_product_aggregated_yearly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_report_viewed_product_index`
--

DROP TABLE IF EXISTS `csvp_report_viewed_product_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_report_viewed_product_index` (
  `index_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Index Id',
  `visitor_id` int(10) unsigned DEFAULT NULL COMMENT 'Visitor Id',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `added_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Added At',
  PRIMARY KEY (`index_id`),
  UNIQUE KEY `CSVP_REPORT_VIEWED_PRODUCT_INDEX_VISITOR_ID_PRODUCT_ID` (`visitor_id`,`product_id`),
  UNIQUE KEY `CSVP_REPORT_VIEWED_PRODUCT_INDEX_CUSTOMER_ID_PRODUCT_ID` (`customer_id`,`product_id`),
  KEY `CSVP_REPORT_VIEWED_PRODUCT_INDEX_STORE_ID` (`store_id`),
  KEY `CSVP_REPORT_VIEWED_PRODUCT_INDEX_ADDED_AT` (`added_at`),
  KEY `CSVP_REPORT_VIEWED_PRODUCT_INDEX_PRODUCT_ID` (`product_id`),
  CONSTRAINT `CSVP_REPORT_VIEWED_PRD_IDX_CSTR_ID_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `csvp_customer_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_REPORT_VIEWED_PRD_IDX_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `csvp_catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_REPORT_VIEWED_PRODUCT_INDEX_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Reports Viewed Product Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_report_viewed_product_index`
--

LOCK TABLES `csvp_report_viewed_product_index` WRITE;
/*!40000 ALTER TABLE `csvp_report_viewed_product_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_report_viewed_product_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_reporting_counts`
--

DROP TABLE IF EXISTS `csvp_reporting_counts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_reporting_counts` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `type` varchar(255) DEFAULT NULL COMMENT 'Item Reported',
  `count` int(10) unsigned DEFAULT NULL COMMENT 'Count Value',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  PRIMARY KEY (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Reporting for all count related events generated via the cron job';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_reporting_counts`
--

LOCK TABLES `csvp_reporting_counts` WRITE;
/*!40000 ALTER TABLE `csvp_reporting_counts` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_reporting_counts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_reporting_module_status`
--

DROP TABLE IF EXISTS `csvp_reporting_module_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_reporting_module_status` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Module Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Module Name',
  `active` varchar(255) DEFAULT NULL COMMENT 'Module Active Status',
  `setup_version` varchar(255) DEFAULT NULL COMMENT 'Module Version',
  `state` varchar(255) DEFAULT NULL COMMENT 'Module State',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  PRIMARY KEY (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Module Status Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_reporting_module_status`
--

LOCK TABLES `csvp_reporting_module_status` WRITE;
/*!40000 ALTER TABLE `csvp_reporting_module_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_reporting_module_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_reporting_orders`
--

DROP TABLE IF EXISTS `csvp_reporting_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_reporting_orders` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  `total` decimal(10,0) unsigned DEFAULT NULL,
  `total_base` decimal(10,0) unsigned DEFAULT NULL,
  `item_count` int(10) unsigned NOT NULL COMMENT 'Line Item Count',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Updated At',
  PRIMARY KEY (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Reporting for all orders';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_reporting_orders`
--

LOCK TABLES `csvp_reporting_orders` WRITE;
/*!40000 ALTER TABLE `csvp_reporting_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_reporting_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_reporting_system_updates`
--

DROP TABLE IF EXISTS `csvp_reporting_system_updates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_reporting_system_updates` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `type` varchar(255) DEFAULT NULL COMMENT 'Update Type',
  `action` varchar(255) DEFAULT NULL COMMENT 'Action Performed',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Updated At',
  PRIMARY KEY (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Reporting for system updates';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_reporting_system_updates`
--

LOCK TABLES `csvp_reporting_system_updates` WRITE;
/*!40000 ALTER TABLE `csvp_reporting_system_updates` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_reporting_system_updates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_reporting_users`
--

DROP TABLE IF EXISTS `csvp_reporting_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_reporting_users` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `type` varchar(255) DEFAULT NULL COMMENT 'User Type',
  `action` varchar(255) DEFAULT NULL COMMENT 'Action Performed',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Updated At',
  PRIMARY KEY (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Reporting for user actions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_reporting_users`
--

LOCK TABLES `csvp_reporting_users` WRITE;
/*!40000 ALTER TABLE `csvp_reporting_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_reporting_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_review`
--

DROP TABLE IF EXISTS `csvp_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_review` (
  `review_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Review id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Review create date',
  `entity_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity id',
  `entity_pk_value` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product id',
  `status_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Status code',
  PRIMARY KEY (`review_id`),
  KEY `CSVP_REVIEW_ENTITY_ID` (`entity_id`),
  KEY `CSVP_REVIEW_STATUS_ID` (`status_id`),
  KEY `CSVP_REVIEW_ENTITY_PK_VALUE` (`entity_pk_value`),
  CONSTRAINT `CSVP_REVIEW_ENTITY_ID_REVIEW_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `csvp_review_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_REVIEW_STATUS_ID_REVIEW_STATUS_STATUS_ID` FOREIGN KEY (`status_id`) REFERENCES `csvp_review_status` (`status_id`) ON DELETE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Review base information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_review`
--

LOCK TABLES `csvp_review` WRITE;
/*!40000 ALTER TABLE `csvp_review` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_review_detail`
--

DROP TABLE IF EXISTS `csvp_review_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_review_detail` (
  `detail_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Review detail id',
  `review_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'Review id',
  `store_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Store id',
  `title` varchar(255) NOT NULL COMMENT 'Title',
  `detail` text NOT NULL COMMENT 'Detail description',
  `nickname` varchar(128) NOT NULL COMMENT 'User nickname',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  PRIMARY KEY (`detail_id`),
  KEY `CSVP_REVIEW_DETAIL_REVIEW_ID` (`review_id`),
  KEY `CSVP_REVIEW_DETAIL_STORE_ID` (`store_id`),
  KEY `CSVP_REVIEW_DETAIL_CUSTOMER_ID` (`customer_id`),
  CONSTRAINT `CSVP_REVIEW_DETAIL_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `csvp_customer_entity` (`entity_id`) ON DELETE SET NULL,
  CONSTRAINT `CSVP_REVIEW_DETAIL_REVIEW_ID_REVIEW_REVIEW_ID` FOREIGN KEY (`review_id`) REFERENCES `csvp_review` (`review_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_REVIEW_DETAIL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Review detail information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_review_detail`
--

LOCK TABLES `csvp_review_detail` WRITE;
/*!40000 ALTER TABLE `csvp_review_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_review_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_review_entity`
--

DROP TABLE IF EXISTS `csvp_review_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_review_entity` (
  `entity_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Review entity id',
  `entity_code` varchar(32) NOT NULL COMMENT 'Review entity code',
  PRIMARY KEY (`entity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Review entities';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_review_entity`
--

LOCK TABLES `csvp_review_entity` WRITE;
/*!40000 ALTER TABLE `csvp_review_entity` DISABLE KEYS */;
INSERT INTO `csvp_review_entity` VALUES (1,'product'),(2,'customer'),(3,'category');
/*!40000 ALTER TABLE `csvp_review_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_review_entity_summary`
--

DROP TABLE IF EXISTS `csvp_review_entity_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_review_entity_summary` (
  `primary_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Summary review entity id',
  `entity_pk_value` bigint(20) NOT NULL DEFAULT '0' COMMENT 'Product id',
  `entity_type` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Entity type id',
  `reviews_count` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Qty of reviews',
  `rating_summary` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Summarized rating',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store id',
  PRIMARY KEY (`primary_id`),
  KEY `CSVP_REVIEW_ENTITY_SUMMARY_STORE_ID` (`store_id`),
  CONSTRAINT `CSVP_REVIEW_ENTITY_SUMMARY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Review aggregates';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_review_entity_summary`
--

LOCK TABLES `csvp_review_entity_summary` WRITE;
/*!40000 ALTER TABLE `csvp_review_entity_summary` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_review_entity_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_review_status`
--

DROP TABLE IF EXISTS `csvp_review_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_review_status` (
  `status_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Status id',
  `status_code` varchar(32) NOT NULL COMMENT 'Status code',
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Review statuses';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_review_status`
--

LOCK TABLES `csvp_review_status` WRITE;
/*!40000 ALTER TABLE `csvp_review_status` DISABLE KEYS */;
INSERT INTO `csvp_review_status` VALUES (1,'Approved'),(2,'Pending'),(3,'Not Approved');
/*!40000 ALTER TABLE `csvp_review_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_review_store`
--

DROP TABLE IF EXISTS `csvp_review_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_review_store` (
  `review_id` bigint(20) unsigned NOT NULL COMMENT 'Review Id',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  PRIMARY KEY (`review_id`,`store_id`),
  KEY `CSVP_REVIEW_STORE_STORE_ID` (`store_id`),
  CONSTRAINT `CSVP_REVIEW_STORE_REVIEW_ID_REVIEW_REVIEW_ID` FOREIGN KEY (`review_id`) REFERENCES `csvp_review` (`review_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_REVIEW_STORE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Review Store';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_review_store`
--

LOCK TABLES `csvp_review_store` WRITE;
/*!40000 ALTER TABLE `csvp_review_store` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_review_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_sales_bestsellers_aggregated_daily`
--

DROP TABLE IF EXISTS `csvp_sales_bestsellers_aggregated_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_sales_bestsellers_aggregated_daily` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `qty_ordered` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty Ordered',
  `rating_pos` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Pos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `CSVP_SALES_BESTSELLERS_AGGRED_DAILY_PERIOD_STORE_ID_PRD_ID` (`period`,`store_id`,`product_id`),
  KEY `CSVP_SALES_BESTSELLERS_AGGREGATED_DAILY_STORE_ID` (`store_id`),
  KEY `CSVP_SALES_BESTSELLERS_AGGREGATED_DAILY_PRODUCT_ID` (`product_id`),
  CONSTRAINT `CSVP_SALES_BESTSELLERS_AGGREGATED_DAILY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Bestsellers Aggregated Daily';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_sales_bestsellers_aggregated_daily`
--

LOCK TABLES `csvp_sales_bestsellers_aggregated_daily` WRITE;
/*!40000 ALTER TABLE `csvp_sales_bestsellers_aggregated_daily` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_sales_bestsellers_aggregated_daily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_sales_bestsellers_aggregated_monthly`
--

DROP TABLE IF EXISTS `csvp_sales_bestsellers_aggregated_monthly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_sales_bestsellers_aggregated_monthly` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `qty_ordered` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty Ordered',
  `rating_pos` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Pos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `CSVP_SALES_BESTSELLERS_AGGRED_MONTHLY_PERIOD_STORE_ID_PRD_ID` (`period`,`store_id`,`product_id`),
  KEY `CSVP_SALES_BESTSELLERS_AGGREGATED_MONTHLY_STORE_ID` (`store_id`),
  KEY `CSVP_SALES_BESTSELLERS_AGGREGATED_MONTHLY_PRODUCT_ID` (`product_id`),
  CONSTRAINT `CSVP_SALES_BESTSELLERS_AGGRED_MONTHLY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Bestsellers Aggregated Monthly';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_sales_bestsellers_aggregated_monthly`
--

LOCK TABLES `csvp_sales_bestsellers_aggregated_monthly` WRITE;
/*!40000 ALTER TABLE `csvp_sales_bestsellers_aggregated_monthly` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_sales_bestsellers_aggregated_monthly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_sales_bestsellers_aggregated_yearly`
--

DROP TABLE IF EXISTS `csvp_sales_bestsellers_aggregated_yearly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_sales_bestsellers_aggregated_yearly` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `qty_ordered` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty Ordered',
  `rating_pos` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Pos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `CSVP_SALES_BESTSELLERS_AGGRED_YEARLY_PERIOD_STORE_ID_PRD_ID` (`period`,`store_id`,`product_id`),
  KEY `CSVP_SALES_BESTSELLERS_AGGREGATED_YEARLY_STORE_ID` (`store_id`),
  KEY `CSVP_SALES_BESTSELLERS_AGGREGATED_YEARLY_PRODUCT_ID` (`product_id`),
  CONSTRAINT `CSVP_SALES_BESTSELLERS_AGGREGATED_YEARLY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Bestsellers Aggregated Yearly';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_sales_bestsellers_aggregated_yearly`
--

LOCK TABLES `csvp_sales_bestsellers_aggregated_yearly` WRITE;
/*!40000 ALTER TABLE `csvp_sales_bestsellers_aggregated_yearly` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_sales_bestsellers_aggregated_yearly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_sales_creditmemo`
--

DROP TABLE IF EXISTS `csvp_sales_creditmemo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_sales_creditmemo` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `adjustment_positive` decimal(12,4) DEFAULT NULL COMMENT 'Adjustment Positive',
  `base_shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Tax Amount',
  `store_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Order Rate',
  `base_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Amount',
  `base_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Order Rate',
  `grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Grand Total',
  `base_adjustment_negative` decimal(12,4) DEFAULT NULL COMMENT 'Base Adjustment Negative',
  `base_subtotal_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal Incl Tax',
  `shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Amount',
  `subtotal_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal Incl Tax',
  `adjustment_negative` decimal(12,4) DEFAULT NULL COMMENT 'Adjustment Negative',
  `base_shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Amount',
  `store_to_base_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Base Rate',
  `base_to_global_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Global Rate',
  `base_adjustment` decimal(12,4) DEFAULT NULL COMMENT 'Base Adjustment',
  `base_subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal',
  `discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Amount',
  `subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal',
  `adjustment` decimal(12,4) DEFAULT NULL COMMENT 'Adjustment',
  `base_grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `base_adjustment_positive` decimal(12,4) DEFAULT NULL COMMENT 'Base Adjustment Positive',
  `base_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Amount',
  `shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Tax Amount',
  `tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Amount',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  `email_sent` smallint(5) unsigned DEFAULT NULL COMMENT 'Email Sent',
  `send_email` smallint(5) unsigned DEFAULT NULL COMMENT 'Send Email',
  `creditmemo_status` int(11) DEFAULT NULL COMMENT 'Creditmemo Status',
  `state` int(11) DEFAULT NULL COMMENT 'State',
  `shipping_address_id` int(11) DEFAULT NULL COMMENT 'Shipping Address Id',
  `billing_address_id` int(11) DEFAULT NULL COMMENT 'Billing Address Id',
  `invoice_id` int(11) DEFAULT NULL COMMENT 'Invoice Id',
  `store_currency_code` varchar(3) DEFAULT NULL COMMENT 'Store Currency Code',
  `order_currency_code` varchar(3) DEFAULT NULL COMMENT 'Order Currency Code',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `global_currency_code` varchar(3) DEFAULT NULL COMMENT 'Global Currency Code',
  `transaction_id` varchar(255) DEFAULT NULL COMMENT 'Transaction Id',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `shipping_discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Discount Tax Compensation Amount',
  `base_shipping_discount_tax_compensation_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Discount Tax Compensation Amount',
  `shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Incl Tax',
  `base_shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Incl Tax',
  `discount_description` varchar(255) DEFAULT NULL COMMENT 'Discount Description',
  `customer_note` text COMMENT 'Customer Note',
  `customer_note_notify` smallint(5) unsigned DEFAULT NULL COMMENT 'Customer Note Notify',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `CSVP_SALES_CREDITMEMO_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  KEY `CSVP_SALES_CREDITMEMO_STORE_ID` (`store_id`),
  KEY `CSVP_SALES_CREDITMEMO_ORDER_ID` (`order_id`),
  KEY `CSVP_SALES_CREDITMEMO_CREDITMEMO_STATUS` (`creditmemo_status`),
  KEY `CSVP_SALES_CREDITMEMO_STATE` (`state`),
  KEY `CSVP_SALES_CREDITMEMO_CREATED_AT` (`created_at`),
  KEY `CSVP_SALES_CREDITMEMO_UPDATED_AT` (`updated_at`),
  KEY `CSVP_SALES_CREDITMEMO_SEND_EMAIL` (`send_email`),
  KEY `CSVP_SALES_CREDITMEMO_EMAIL_SENT` (`email_sent`),
  CONSTRAINT `CSVP_SALES_CREDITMEMO_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `csvp_sales_order` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_SALES_CREDITMEMO_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Creditmemo';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_sales_creditmemo`
--

LOCK TABLES `csvp_sales_creditmemo` WRITE;
/*!40000 ALTER TABLE `csvp_sales_creditmemo` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_sales_creditmemo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_sales_creditmemo_comment`
--

DROP TABLE IF EXISTS `csvp_sales_creditmemo_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_sales_creditmemo_comment` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `is_customer_notified` int(11) DEFAULT NULL COMMENT 'Is Customer Notified',
  `is_visible_on_front` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible On Front',
  `comment` text COMMENT 'Comment',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  PRIMARY KEY (`entity_id`),
  KEY `CSVP_SALES_CREDITMEMO_COMMENT_CREATED_AT` (`created_at`),
  KEY `CSVP_SALES_CREDITMEMO_COMMENT_PARENT_ID` (`parent_id`),
  CONSTRAINT `CSVP_SALES_CREDITMEMO_COMMENT_PARENT_ID_SALES_CREDITMEMO_ENTT_ID` FOREIGN KEY (`parent_id`) REFERENCES `csvp_sales_creditmemo` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Creditmemo Comment';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_sales_creditmemo_comment`
--

LOCK TABLES `csvp_sales_creditmemo_comment` WRITE;
/*!40000 ALTER TABLE `csvp_sales_creditmemo_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_sales_creditmemo_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_sales_creditmemo_grid`
--

DROP TABLE IF EXISTS `csvp_sales_creditmemo_grid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_sales_creditmemo_grid` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  `order_increment_id` varchar(50) DEFAULT NULL COMMENT 'Order Increment Id',
  `order_created_at` timestamp NULL DEFAULT NULL COMMENT 'Order Created At',
  `billing_name` varchar(255) DEFAULT NULL COMMENT 'Billing Name',
  `state` int(11) DEFAULT NULL COMMENT 'Status',
  `base_grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `order_status` varchar(32) DEFAULT NULL COMMENT 'Order Status',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `billing_address` varchar(255) DEFAULT NULL COMMENT 'Billing Address',
  `shipping_address` varchar(255) DEFAULT NULL COMMENT 'Shipping Address',
  `customer_name` varchar(128) NOT NULL COMMENT 'Customer Name',
  `customer_email` varchar(128) DEFAULT NULL COMMENT 'Customer Email',
  `customer_group_id` smallint(6) DEFAULT NULL COMMENT 'Customer Group Id',
  `payment_method` varchar(32) DEFAULT NULL COMMENT 'Payment Method',
  `shipping_information` varchar(255) DEFAULT NULL COMMENT 'Shipping Method Name',
  `subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal',
  `shipping_and_handling` decimal(12,4) DEFAULT NULL COMMENT 'Shipping and handling amount',
  `adjustment_positive` decimal(12,4) DEFAULT NULL COMMENT 'Adjustment Positive',
  `adjustment_negative` decimal(12,4) DEFAULT NULL COMMENT 'Adjustment Negative',
  `order_base_grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Order Grand Total',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `CSVP_SALES_CREDITMEMO_GRID_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  KEY `CSVP_SALES_CREDITMEMO_GRID_ORDER_INCREMENT_ID` (`order_increment_id`),
  KEY `CSVP_SALES_CREDITMEMO_GRID_CREATED_AT` (`created_at`),
  KEY `CSVP_SALES_CREDITMEMO_GRID_UPDATED_AT` (`updated_at`),
  KEY `CSVP_SALES_CREDITMEMO_GRID_ORDER_CREATED_AT` (`order_created_at`),
  KEY `CSVP_SALES_CREDITMEMO_GRID_STATE` (`state`),
  KEY `CSVP_SALES_CREDITMEMO_GRID_BILLING_NAME` (`billing_name`),
  KEY `CSVP_SALES_CREDITMEMO_GRID_ORDER_STATUS` (`order_status`),
  KEY `CSVP_SALES_CREDITMEMO_GRID_BASE_GRAND_TOTAL` (`base_grand_total`),
  KEY `CSVP_SALES_CREDITMEMO_GRID_STORE_ID` (`store_id`),
  KEY `CSVP_SALES_CREDITMEMO_GRID_ORDER_BASE_GRAND_TOTAL` (`order_base_grand_total`),
  KEY `CSVP_SALES_CREDITMEMO_GRID_ORDER_ID` (`order_id`),
  FULLTEXT KEY `FTI_0750FD0FDE42C4B4901821D402171BB8` (`increment_id`,`order_increment_id`,`billing_name`,`billing_address`,`shipping_address`,`customer_name`,`customer_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Creditmemo Grid';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_sales_creditmemo_grid`
--

LOCK TABLES `csvp_sales_creditmemo_grid` WRITE;
/*!40000 ALTER TABLE `csvp_sales_creditmemo_grid` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_sales_creditmemo_grid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_sales_creditmemo_item`
--

DROP TABLE IF EXISTS `csvp_sales_creditmemo_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_sales_creditmemo_item` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `base_price` decimal(12,4) DEFAULT NULL COMMENT 'Base Price',
  `tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Amount',
  `base_row_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total',
  `discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Amount',
  `row_total` decimal(12,4) DEFAULT NULL COMMENT 'Row Total',
  `base_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Amount',
  `price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Price Incl Tax',
  `base_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Amount',
  `base_price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Price Incl Tax',
  `qty` decimal(12,4) DEFAULT NULL COMMENT 'Qty',
  `base_cost` decimal(12,4) DEFAULT NULL COMMENT 'Base Cost',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `base_row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total Incl Tax',
  `row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Row Total Incl Tax',
  `product_id` int(11) DEFAULT NULL COMMENT 'Product Id',
  `order_item_id` int(11) DEFAULT NULL COMMENT 'Order Item Id',
  `additional_data` text COMMENT 'Additional Data',
  `description` text COMMENT 'Description',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `tax_ratio` text COMMENT 'Ratio of tax in the creditmemo item over tax of the order item',
  `weee_tax_applied` text COMMENT 'Weee Tax Applied',
  `weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Amount',
  `weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Row Amount',
  `weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Disposition',
  `weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Row Disposition',
  `base_weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Amount',
  `base_weee_tax_applied_row_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Row Amnt',
  `base_weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Disposition',
  `base_weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Row Disposition',
  PRIMARY KEY (`entity_id`),
  KEY `CSVP_SALES_CREDITMEMO_ITEM_PARENT_ID` (`parent_id`),
  CONSTRAINT `CSVP_SALES_CREDITMEMO_ITEM_PARENT_ID_SALES_CREDITMEMO_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `csvp_sales_creditmemo` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Creditmemo Item';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_sales_creditmemo_item`
--

LOCK TABLES `csvp_sales_creditmemo_item` WRITE;
/*!40000 ALTER TABLE `csvp_sales_creditmemo_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_sales_creditmemo_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_sales_invoice`
--

DROP TABLE IF EXISTS `csvp_sales_invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_sales_invoice` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `base_grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Tax Amount',
  `tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Amount',
  `base_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Amount',
  `store_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Order Rate',
  `base_shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Tax Amount',
  `base_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Amount',
  `base_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Order Rate',
  `grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Grand Total',
  `shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Amount',
  `subtotal_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal Incl Tax',
  `base_subtotal_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal Incl Tax',
  `store_to_base_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Base Rate',
  `base_shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Amount',
  `total_qty` decimal(12,4) DEFAULT NULL COMMENT 'Total Qty',
  `base_to_global_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Global Rate',
  `subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal',
  `base_subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal',
  `discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Amount',
  `billing_address_id` int(11) DEFAULT NULL COMMENT 'Billing Address Id',
  `is_used_for_refund` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Used For Refund',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  `email_sent` smallint(5) unsigned DEFAULT NULL COMMENT 'Email Sent',
  `send_email` smallint(5) unsigned DEFAULT NULL COMMENT 'Send Email',
  `can_void_flag` smallint(5) unsigned DEFAULT NULL COMMENT 'Can Void Flag',
  `state` int(11) DEFAULT NULL COMMENT 'State',
  `shipping_address_id` int(11) DEFAULT NULL COMMENT 'Shipping Address Id',
  `store_currency_code` varchar(3) DEFAULT NULL COMMENT 'Store Currency Code',
  `transaction_id` varchar(255) DEFAULT NULL COMMENT 'Transaction Id',
  `order_currency_code` varchar(3) DEFAULT NULL COMMENT 'Order Currency Code',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `global_currency_code` varchar(3) DEFAULT NULL COMMENT 'Global Currency Code',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `shipping_discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Discount Tax Compensation Amount',
  `base_shipping_discount_tax_compensation_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Discount Tax Compensation Amount',
  `shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Incl Tax',
  `base_shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Incl Tax',
  `base_total_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Refunded',
  `discount_description` varchar(255) DEFAULT NULL COMMENT 'Discount Description',
  `customer_note` text COMMENT 'Customer Note',
  `customer_note_notify` smallint(5) unsigned DEFAULT NULL COMMENT 'Customer Note Notify',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `CSVP_SALES_INVOICE_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  KEY `CSVP_SALES_INVOICE_STORE_ID` (`store_id`),
  KEY `CSVP_SALES_INVOICE_GRAND_TOTAL` (`grand_total`),
  KEY `CSVP_SALES_INVOICE_ORDER_ID` (`order_id`),
  KEY `CSVP_SALES_INVOICE_STATE` (`state`),
  KEY `CSVP_SALES_INVOICE_CREATED_AT` (`created_at`),
  KEY `CSVP_SALES_INVOICE_UPDATED_AT` (`updated_at`),
  KEY `CSVP_SALES_INVOICE_SEND_EMAIL` (`send_email`),
  KEY `CSVP_SALES_INVOICE_EMAIL_SENT` (`email_sent`),
  CONSTRAINT `CSVP_SALES_INVOICE_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `csvp_sales_order` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_SALES_INVOICE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Invoice';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_sales_invoice`
--

LOCK TABLES `csvp_sales_invoice` WRITE;
/*!40000 ALTER TABLE `csvp_sales_invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_sales_invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_sales_invoice_comment`
--

DROP TABLE IF EXISTS `csvp_sales_invoice_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_sales_invoice_comment` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `is_customer_notified` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Customer Notified',
  `is_visible_on_front` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible On Front',
  `comment` text COMMENT 'Comment',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  PRIMARY KEY (`entity_id`),
  KEY `CSVP_SALES_INVOICE_COMMENT_CREATED_AT` (`created_at`),
  KEY `CSVP_SALES_INVOICE_COMMENT_PARENT_ID` (`parent_id`),
  CONSTRAINT `CSVP_SALES_INVOICE_COMMENT_PARENT_ID_SALES_INVOICE_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `csvp_sales_invoice` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Invoice Comment';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_sales_invoice_comment`
--

LOCK TABLES `csvp_sales_invoice_comment` WRITE;
/*!40000 ALTER TABLE `csvp_sales_invoice_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_sales_invoice_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_sales_invoice_grid`
--

DROP TABLE IF EXISTS `csvp_sales_invoice_grid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_sales_invoice_grid` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `state` int(11) DEFAULT NULL COMMENT 'State',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `store_name` varchar(255) DEFAULT NULL COMMENT 'Store Name',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  `order_increment_id` varchar(50) DEFAULT NULL COMMENT 'Order Increment Id',
  `order_created_at` timestamp NULL DEFAULT NULL COMMENT 'Order Created At',
  `customer_name` varchar(255) DEFAULT NULL COMMENT 'Customer Name',
  `customer_email` varchar(255) DEFAULT NULL COMMENT 'Customer Email',
  `customer_group_id` int(11) DEFAULT NULL,
  `payment_method` varchar(128) DEFAULT NULL COMMENT 'Payment Method',
  `store_currency_code` varchar(3) DEFAULT NULL COMMENT 'Store Currency Code',
  `order_currency_code` varchar(3) DEFAULT NULL COMMENT 'Order Currency Code',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `global_currency_code` varchar(3) DEFAULT NULL COMMENT 'Global Currency Code',
  `billing_name` varchar(255) DEFAULT NULL COMMENT 'Billing Name',
  `billing_address` varchar(255) DEFAULT NULL COMMENT 'Billing Address',
  `shipping_address` varchar(255) DEFAULT NULL COMMENT 'Shipping Address',
  `shipping_information` varchar(255) DEFAULT NULL COMMENT 'Shipping Method Name',
  `subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal',
  `shipping_and_handling` decimal(12,4) DEFAULT NULL COMMENT 'Shipping and handling amount',
  `grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Grand Total',
  `base_grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `CSVP_SALES_INVOICE_GRID_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  KEY `CSVP_SALES_INVOICE_GRID_STORE_ID` (`store_id`),
  KEY `CSVP_SALES_INVOICE_GRID_GRAND_TOTAL` (`grand_total`),
  KEY `CSVP_SALES_INVOICE_GRID_ORDER_ID` (`order_id`),
  KEY `CSVP_SALES_INVOICE_GRID_STATE` (`state`),
  KEY `CSVP_SALES_INVOICE_GRID_ORDER_INCREMENT_ID` (`order_increment_id`),
  KEY `CSVP_SALES_INVOICE_GRID_CREATED_AT` (`created_at`),
  KEY `CSVP_SALES_INVOICE_GRID_UPDATED_AT` (`updated_at`),
  KEY `CSVP_SALES_INVOICE_GRID_ORDER_CREATED_AT` (`order_created_at`),
  KEY `CSVP_SALES_INVOICE_GRID_BILLING_NAME` (`billing_name`),
  KEY `CSVP_SALES_INVOICE_GRID_BASE_GRAND_TOTAL` (`base_grand_total`),
  FULLTEXT KEY `FTI_076616194A3A191800644D7BC78A9E04` (`increment_id`,`order_increment_id`,`billing_name`,`billing_address`,`shipping_address`,`customer_name`,`customer_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Invoice Grid';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_sales_invoice_grid`
--

LOCK TABLES `csvp_sales_invoice_grid` WRITE;
/*!40000 ALTER TABLE `csvp_sales_invoice_grid` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_sales_invoice_grid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_sales_invoice_item`
--

DROP TABLE IF EXISTS `csvp_sales_invoice_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_sales_invoice_item` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `base_price` decimal(12,4) DEFAULT NULL COMMENT 'Base Price',
  `tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Amount',
  `base_row_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total',
  `discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Amount',
  `row_total` decimal(12,4) DEFAULT NULL COMMENT 'Row Total',
  `base_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Amount',
  `price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Price Incl Tax',
  `base_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Amount',
  `base_price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Price Incl Tax',
  `qty` decimal(12,4) DEFAULT NULL COMMENT 'Qty',
  `base_cost` decimal(12,4) DEFAULT NULL COMMENT 'Base Cost',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `base_row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total Incl Tax',
  `row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Row Total Incl Tax',
  `product_id` int(11) DEFAULT NULL COMMENT 'Product Id',
  `order_item_id` int(11) DEFAULT NULL COMMENT 'Order Item Id',
  `additional_data` text COMMENT 'Additional Data',
  `description` text COMMENT 'Description',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `tax_ratio` text COMMENT 'Ratio of tax invoiced over tax of the order item',
  `weee_tax_applied` text COMMENT 'Weee Tax Applied',
  `weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Amount',
  `weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Row Amount',
  `weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Disposition',
  `weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Row Disposition',
  `base_weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Amount',
  `base_weee_tax_applied_row_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Row Amnt',
  `base_weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Disposition',
  `base_weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Row Disposition',
  PRIMARY KEY (`entity_id`),
  KEY `CSVP_SALES_INVOICE_ITEM_PARENT_ID` (`parent_id`),
  CONSTRAINT `CSVP_SALES_INVOICE_ITEM_PARENT_ID_SALES_INVOICE_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `csvp_sales_invoice` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Invoice Item';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_sales_invoice_item`
--

LOCK TABLES `csvp_sales_invoice_item` WRITE;
/*!40000 ALTER TABLE `csvp_sales_invoice_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_sales_invoice_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_sales_invoiced_aggregated`
--

DROP TABLE IF EXISTS `csvp_sales_invoiced_aggregated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_sales_invoiced_aggregated` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `orders_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Orders Invoiced',
  `invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced',
  `invoiced_captured` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced Captured',
  `invoiced_not_captured` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced Not Captured',
  PRIMARY KEY (`id`),
  UNIQUE KEY `CSVP_SALES_INVOICED_AGGREGATED_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `CSVP_SALES_INVOICED_AGGREGATED_STORE_ID` (`store_id`),
  CONSTRAINT `CSVP_SALES_INVOICED_AGGREGATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Invoiced Aggregated';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_sales_invoiced_aggregated`
--

LOCK TABLES `csvp_sales_invoiced_aggregated` WRITE;
/*!40000 ALTER TABLE `csvp_sales_invoiced_aggregated` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_sales_invoiced_aggregated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_sales_invoiced_aggregated_order`
--

DROP TABLE IF EXISTS `csvp_sales_invoiced_aggregated_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_sales_invoiced_aggregated_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `orders_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Orders Invoiced',
  `invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced',
  `invoiced_captured` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced Captured',
  `invoiced_not_captured` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced Not Captured',
  PRIMARY KEY (`id`),
  UNIQUE KEY `CSVP_SALES_INVOICED_AGGRED_ORDER_PERIOD_STORE_ID_ORDER_STS` (`period`,`store_id`,`order_status`),
  KEY `CSVP_SALES_INVOICED_AGGREGATED_ORDER_STORE_ID` (`store_id`),
  CONSTRAINT `CSVP_SALES_INVOICED_AGGREGATED_ORDER_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Invoiced Aggregated Order';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_sales_invoiced_aggregated_order`
--

LOCK TABLES `csvp_sales_invoiced_aggregated_order` WRITE;
/*!40000 ALTER TABLE `csvp_sales_invoiced_aggregated_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_sales_invoiced_aggregated_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_sales_order`
--

DROP TABLE IF EXISTS `csvp_sales_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_sales_order` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `state` varchar(32) DEFAULT NULL COMMENT 'State',
  `status` varchar(32) DEFAULT NULL COMMENT 'Status',
  `coupon_code` varchar(255) DEFAULT NULL COMMENT 'Coupon Code',
  `protect_code` varchar(255) DEFAULT NULL COMMENT 'Protect Code',
  `shipping_description` varchar(255) DEFAULT NULL COMMENT 'Shipping Description',
  `is_virtual` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Virtual',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  `base_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Amount',
  `base_discount_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Canceled',
  `base_discount_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Invoiced',
  `base_discount_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Refunded',
  `base_grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `base_shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Amount',
  `base_shipping_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Canceled',
  `base_shipping_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Invoiced',
  `base_shipping_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Refunded',
  `base_shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Tax Amount',
  `base_shipping_tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Tax Refunded',
  `base_subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal',
  `base_subtotal_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal Canceled',
  `base_subtotal_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal Invoiced',
  `base_subtotal_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal Refunded',
  `base_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Amount',
  `base_tax_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Canceled',
  `base_tax_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Invoiced',
  `base_tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Refunded',
  `base_to_global_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Global Rate',
  `base_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Order Rate',
  `base_total_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Canceled',
  `base_total_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Invoiced',
  `base_total_invoiced_cost` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Invoiced Cost',
  `base_total_offline_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Offline Refunded',
  `base_total_online_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Online Refunded',
  `base_total_paid` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Paid',
  `base_total_qty_ordered` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Qty Ordered',
  `base_total_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Refunded',
  `discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Amount',
  `discount_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Discount Canceled',
  `discount_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Discount Invoiced',
  `discount_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Discount Refunded',
  `grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Grand Total',
  `shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Amount',
  `shipping_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Canceled',
  `shipping_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Invoiced',
  `shipping_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Refunded',
  `shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Tax Amount',
  `shipping_tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Tax Refunded',
  `store_to_base_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Base Rate',
  `store_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Order Rate',
  `subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal',
  `subtotal_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal Canceled',
  `subtotal_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal Invoiced',
  `subtotal_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal Refunded',
  `tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Amount',
  `tax_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Tax Canceled',
  `tax_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Tax Invoiced',
  `tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Tax Refunded',
  `total_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Total Canceled',
  `total_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Total Invoiced',
  `total_offline_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Total Offline Refunded',
  `total_online_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Total Online Refunded',
  `total_paid` decimal(12,4) DEFAULT NULL COMMENT 'Total Paid',
  `total_qty_ordered` decimal(12,4) DEFAULT NULL COMMENT 'Total Qty Ordered',
  `total_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Total Refunded',
  `can_ship_partially` smallint(5) unsigned DEFAULT NULL COMMENT 'Can Ship Partially',
  `can_ship_partially_item` smallint(5) unsigned DEFAULT NULL COMMENT 'Can Ship Partially Item',
  `customer_is_guest` smallint(5) unsigned DEFAULT NULL COMMENT 'Customer Is Guest',
  `customer_note_notify` smallint(5) unsigned DEFAULT NULL COMMENT 'Customer Note Notify',
  `billing_address_id` int(11) DEFAULT NULL COMMENT 'Billing Address Id',
  `customer_group_id` int(11) DEFAULT NULL,
  `edit_increment` int(11) DEFAULT NULL COMMENT 'Edit Increment',
  `email_sent` smallint(5) unsigned DEFAULT NULL COMMENT 'Email Sent',
  `send_email` smallint(5) unsigned DEFAULT NULL COMMENT 'Send Email',
  `forced_shipment_with_invoice` smallint(5) unsigned DEFAULT NULL COMMENT 'Forced Do Shipment With Invoice',
  `payment_auth_expiration` int(11) DEFAULT NULL COMMENT 'Payment Authorization Expiration',
  `quote_address_id` int(11) DEFAULT NULL COMMENT 'Quote Address Id',
  `quote_id` int(11) DEFAULT NULL COMMENT 'Quote Id',
  `shipping_address_id` int(11) DEFAULT NULL COMMENT 'Shipping Address Id',
  `adjustment_negative` decimal(12,4) DEFAULT NULL COMMENT 'Adjustment Negative',
  `adjustment_positive` decimal(12,4) DEFAULT NULL COMMENT 'Adjustment Positive',
  `base_adjustment_negative` decimal(12,4) DEFAULT NULL COMMENT 'Base Adjustment Negative',
  `base_adjustment_positive` decimal(12,4) DEFAULT NULL COMMENT 'Base Adjustment Positive',
  `base_shipping_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Discount Amount',
  `base_subtotal_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal Incl Tax',
  `base_total_due` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Due',
  `payment_authorization_amount` decimal(12,4) DEFAULT NULL COMMENT 'Payment Authorization Amount',
  `shipping_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Discount Amount',
  `subtotal_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal Incl Tax',
  `total_due` decimal(12,4) DEFAULT NULL COMMENT 'Total Due',
  `weight` decimal(12,4) DEFAULT NULL COMMENT 'Weight',
  `customer_dob` datetime DEFAULT NULL COMMENT 'Customer Dob',
  `increment_id` varchar(32) DEFAULT NULL COMMENT 'Increment Id',
  `applied_rule_ids` varchar(128) DEFAULT NULL COMMENT 'Applied Rule Ids',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `customer_email` varchar(128) DEFAULT NULL COMMENT 'Customer Email',
  `customer_firstname` varchar(128) DEFAULT NULL COMMENT 'Customer Firstname',
  `customer_lastname` varchar(128) DEFAULT NULL COMMENT 'Customer Lastname',
  `customer_middlename` varchar(128) DEFAULT NULL COMMENT 'Customer Middlename',
  `customer_prefix` varchar(32) DEFAULT NULL COMMENT 'Customer Prefix',
  `customer_suffix` varchar(32) DEFAULT NULL COMMENT 'Customer Suffix',
  `customer_taxvat` varchar(32) DEFAULT NULL COMMENT 'Customer Taxvat',
  `discount_description` varchar(255) DEFAULT NULL COMMENT 'Discount Description',
  `ext_customer_id` varchar(32) DEFAULT NULL COMMENT 'Ext Customer Id',
  `ext_order_id` varchar(32) DEFAULT NULL COMMENT 'Ext Order Id',
  `global_currency_code` varchar(3) DEFAULT NULL COMMENT 'Global Currency Code',
  `hold_before_state` varchar(32) DEFAULT NULL COMMENT 'Hold Before State',
  `hold_before_status` varchar(32) DEFAULT NULL COMMENT 'Hold Before Status',
  `order_currency_code` varchar(3) DEFAULT NULL COMMENT 'Order Currency Code',
  `original_increment_id` varchar(32) DEFAULT NULL COMMENT 'Original Increment Id',
  `relation_child_id` varchar(32) DEFAULT NULL COMMENT 'Relation Child Id',
  `relation_child_real_id` varchar(32) DEFAULT NULL COMMENT 'Relation Child Real Id',
  `relation_parent_id` varchar(32) DEFAULT NULL COMMENT 'Relation Parent Id',
  `relation_parent_real_id` varchar(32) DEFAULT NULL COMMENT 'Relation Parent Real Id',
  `remote_ip` varchar(32) DEFAULT NULL COMMENT 'Remote Ip',
  `shipping_method` varchar(120) DEFAULT NULL,
  `store_currency_code` varchar(3) DEFAULT NULL COMMENT 'Store Currency Code',
  `store_name` varchar(32) DEFAULT NULL COMMENT 'Store Name',
  `x_forwarded_for` varchar(32) DEFAULT NULL COMMENT 'X Forwarded For',
  `customer_note` text COMMENT 'Customer Note',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `total_item_count` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Total Item Count',
  `customer_gender` int(11) DEFAULT NULL COMMENT 'Customer Gender',
  `discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `shipping_discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Discount Tax Compensation Amount',
  `base_shipping_discount_tax_compensation_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Discount Tax Compensation Amount',
  `discount_tax_compensation_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Invoiced',
  `base_discount_tax_compensation_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Invoiced',
  `discount_tax_compensation_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Refunded',
  `base_discount_tax_compensation_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Refunded',
  `shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Incl Tax',
  `base_shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Incl Tax',
  `coupon_rule_name` varchar(255) DEFAULT NULL COMMENT 'Coupon Sales Rule Name',
  `gift_message_id` int(11) DEFAULT NULL COMMENT 'Gift Message Id',
  `paypal_ipn_customer_notified` int(11) DEFAULT '0' COMMENT 'Paypal Ipn Customer Notified',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `CSVP_SALES_ORDER_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  KEY `CSVP_SALES_ORDER_STATUS` (`status`),
  KEY `CSVP_SALES_ORDER_STATE` (`state`),
  KEY `CSVP_SALES_ORDER_STORE_ID` (`store_id`),
  KEY `CSVP_SALES_ORDER_CREATED_AT` (`created_at`),
  KEY `CSVP_SALES_ORDER_CUSTOMER_ID` (`customer_id`),
  KEY `CSVP_SALES_ORDER_EXT_ORDER_ID` (`ext_order_id`),
  KEY `CSVP_SALES_ORDER_QUOTE_ID` (`quote_id`),
  KEY `CSVP_SALES_ORDER_UPDATED_AT` (`updated_at`),
  KEY `CSVP_SALES_ORDER_SEND_EMAIL` (`send_email`),
  KEY `CSVP_SALES_ORDER_EMAIL_SENT` (`email_sent`),
  CONSTRAINT `CSVP_SALES_ORDER_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `csvp_customer_entity` (`entity_id`) ON DELETE SET NULL,
  CONSTRAINT `CSVP_SALES_ORDER_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Order';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_sales_order`
--

LOCK TABLES `csvp_sales_order` WRITE;
/*!40000 ALTER TABLE `csvp_sales_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_sales_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_sales_order_address`
--

DROP TABLE IF EXISTS `csvp_sales_order_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_sales_order_address` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned DEFAULT NULL COMMENT 'Parent Id',
  `customer_address_id` int(11) DEFAULT NULL COMMENT 'Customer Address Id',
  `quote_address_id` int(11) DEFAULT NULL COMMENT 'Quote Address Id',
  `region_id` int(11) DEFAULT NULL COMMENT 'Region Id',
  `customer_id` int(11) DEFAULT NULL COMMENT 'Customer Id',
  `fax` varchar(255) DEFAULT NULL COMMENT 'Fax',
  `region` varchar(255) DEFAULT NULL COMMENT 'Region',
  `postcode` varchar(255) DEFAULT NULL COMMENT 'Postcode',
  `lastname` varchar(255) DEFAULT NULL COMMENT 'Lastname',
  `street` varchar(255) DEFAULT NULL COMMENT 'Street',
  `city` varchar(255) DEFAULT NULL COMMENT 'City',
  `email` varchar(255) DEFAULT NULL COMMENT 'Email',
  `telephone` varchar(255) DEFAULT NULL COMMENT 'Phone Number',
  `country_id` varchar(2) DEFAULT NULL COMMENT 'Country Id',
  `firstname` varchar(255) DEFAULT NULL COMMENT 'Firstname',
  `address_type` varchar(255) DEFAULT NULL COMMENT 'Address Type',
  `prefix` varchar(255) DEFAULT NULL COMMENT 'Prefix',
  `middlename` varchar(255) DEFAULT NULL COMMENT 'Middlename',
  `suffix` varchar(255) DEFAULT NULL COMMENT 'Suffix',
  `company` varchar(255) DEFAULT NULL COMMENT 'Company',
  `vat_id` text COMMENT 'Vat Id',
  `vat_is_valid` smallint(6) DEFAULT NULL COMMENT 'Vat Is Valid',
  `vat_request_id` text COMMENT 'Vat Request Id',
  `vat_request_date` text COMMENT 'Vat Request Date',
  `vat_request_success` smallint(6) DEFAULT NULL COMMENT 'Vat Request Success',
  PRIMARY KEY (`entity_id`),
  KEY `CSVP_SALES_ORDER_ADDRESS_PARENT_ID` (`parent_id`),
  CONSTRAINT `CSVP_SALES_ORDER_ADDRESS_PARENT_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `csvp_sales_order` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Order Address';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_sales_order_address`
--

LOCK TABLES `csvp_sales_order_address` WRITE;
/*!40000 ALTER TABLE `csvp_sales_order_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_sales_order_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_sales_order_aggregated_created`
--

DROP TABLE IF EXISTS `csvp_sales_order_aggregated_created`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_sales_order_aggregated_created` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `total_qty_ordered` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Qty Ordered',
  `total_qty_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Qty Invoiced',
  `total_income_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Income Amount',
  `total_revenue_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Revenue Amount',
  `total_profit_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Profit Amount',
  `total_invoiced_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Invoiced Amount',
  `total_canceled_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Canceled Amount',
  `total_paid_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Paid Amount',
  `total_refunded_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Refunded Amount',
  `total_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Tax Amount',
  `total_tax_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Tax Amount Actual',
  `total_shipping_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Shipping Amount',
  `total_shipping_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Shipping Amount Actual',
  `total_discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Discount Amount',
  `total_discount_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Discount Amount Actual',
  PRIMARY KEY (`id`),
  UNIQUE KEY `CSVP_SALES_ORDER_AGGREGATED_CREATED_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `CSVP_SALES_ORDER_AGGREGATED_CREATED_STORE_ID` (`store_id`),
  CONSTRAINT `CSVP_SALES_ORDER_AGGREGATED_CREATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Aggregated Created';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_sales_order_aggregated_created`
--

LOCK TABLES `csvp_sales_order_aggregated_created` WRITE;
/*!40000 ALTER TABLE `csvp_sales_order_aggregated_created` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_sales_order_aggregated_created` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_sales_order_aggregated_updated`
--

DROP TABLE IF EXISTS `csvp_sales_order_aggregated_updated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_sales_order_aggregated_updated` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `total_qty_ordered` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Qty Ordered',
  `total_qty_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Qty Invoiced',
  `total_income_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Income Amount',
  `total_revenue_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Revenue Amount',
  `total_profit_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Profit Amount',
  `total_invoiced_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Invoiced Amount',
  `total_canceled_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Canceled Amount',
  `total_paid_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Paid Amount',
  `total_refunded_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Refunded Amount',
  `total_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Tax Amount',
  `total_tax_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Tax Amount Actual',
  `total_shipping_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Shipping Amount',
  `total_shipping_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Shipping Amount Actual',
  `total_discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Discount Amount',
  `total_discount_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Discount Amount Actual',
  PRIMARY KEY (`id`),
  UNIQUE KEY `CSVP_SALES_ORDER_AGGREGATED_UPDATED_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `CSVP_SALES_ORDER_AGGREGATED_UPDATED_STORE_ID` (`store_id`),
  CONSTRAINT `CSVP_SALES_ORDER_AGGREGATED_UPDATED_STORE_ID_CSVP_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Csvp Sales Order Aggregated Updated';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_sales_order_aggregated_updated`
--

LOCK TABLES `csvp_sales_order_aggregated_updated` WRITE;
/*!40000 ALTER TABLE `csvp_sales_order_aggregated_updated` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_sales_order_aggregated_updated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_sales_order_grid`
--

DROP TABLE IF EXISTS `csvp_sales_order_grid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_sales_order_grid` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `status` varchar(32) DEFAULT NULL COMMENT 'Status',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `store_name` varchar(255) DEFAULT NULL COMMENT 'Store Name',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  `base_grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `base_total_paid` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Paid',
  `grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Grand Total',
  `total_paid` decimal(12,4) DEFAULT NULL COMMENT 'Total Paid',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `order_currency_code` varchar(255) DEFAULT NULL COMMENT 'Order Currency Code',
  `shipping_name` varchar(255) DEFAULT NULL COMMENT 'Shipping Name',
  `billing_name` varchar(255) DEFAULT NULL COMMENT 'Billing Name',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `billing_address` varchar(255) DEFAULT NULL COMMENT 'Billing Address',
  `shipping_address` varchar(255) DEFAULT NULL COMMENT 'Shipping Address',
  `shipping_information` varchar(255) DEFAULT NULL COMMENT 'Shipping Method Name',
  `customer_email` varchar(255) DEFAULT NULL COMMENT 'Customer Email',
  `customer_group` varchar(255) DEFAULT NULL COMMENT 'Customer Group',
  `subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal',
  `shipping_and_handling` decimal(12,4) DEFAULT NULL COMMENT 'Shipping and handling amount',
  `customer_name` varchar(255) DEFAULT NULL COMMENT 'Customer Name',
  `payment_method` varchar(255) DEFAULT NULL COMMENT 'Payment Method',
  `total_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Total Refunded',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `CSVP_SALES_ORDER_GRID_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  KEY `CSVP_SALES_ORDER_GRID_STATUS` (`status`),
  KEY `CSVP_SALES_ORDER_GRID_STORE_ID` (`store_id`),
  KEY `CSVP_SALES_ORDER_GRID_BASE_GRAND_TOTAL` (`base_grand_total`),
  KEY `CSVP_SALES_ORDER_GRID_BASE_TOTAL_PAID` (`base_total_paid`),
  KEY `CSVP_SALES_ORDER_GRID_GRAND_TOTAL` (`grand_total`),
  KEY `CSVP_SALES_ORDER_GRID_TOTAL_PAID` (`total_paid`),
  KEY `CSVP_SALES_ORDER_GRID_SHIPPING_NAME` (`shipping_name`),
  KEY `CSVP_SALES_ORDER_GRID_BILLING_NAME` (`billing_name`),
  KEY `CSVP_SALES_ORDER_GRID_CREATED_AT` (`created_at`),
  KEY `CSVP_SALES_ORDER_GRID_CUSTOMER_ID` (`customer_id`),
  KEY `CSVP_SALES_ORDER_GRID_UPDATED_AT` (`updated_at`),
  FULLTEXT KEY `FTI_0742179DCF08A7ABBF6C2767DAE79C24` (`increment_id`,`billing_name`,`shipping_name`,`shipping_address`,`billing_address`,`customer_name`,`customer_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Order Grid';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_sales_order_grid`
--

LOCK TABLES `csvp_sales_order_grid` WRITE;
/*!40000 ALTER TABLE `csvp_sales_order_grid` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_sales_order_grid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_sales_order_item`
--

DROP TABLE IF EXISTS `csvp_sales_order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_sales_order_item` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Item Id',
  `order_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Order Id',
  `parent_item_id` int(10) unsigned DEFAULT NULL COMMENT 'Parent Item Id',
  `quote_item_id` int(10) unsigned DEFAULT NULL COMMENT 'Quote Item Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `product_type` varchar(255) DEFAULT NULL COMMENT 'Product Type',
  `product_options` text COMMENT 'Product Options',
  `weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Weight',
  `is_virtual` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Virtual',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text COMMENT 'Description',
  `applied_rule_ids` text COMMENT 'Applied Rule Ids',
  `additional_data` text COMMENT 'Additional Data',
  `is_qty_decimal` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Qty Decimal',
  `no_discount` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'No Discount',
  `qty_backordered` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Backordered',
  `qty_canceled` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Canceled',
  `qty_invoiced` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Invoiced',
  `qty_ordered` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Ordered',
  `qty_refunded` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Refunded',
  `qty_shipped` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Shipped',
  `base_cost` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Cost',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Price',
  `original_price` decimal(12,4) DEFAULT NULL COMMENT 'Original Price',
  `base_original_price` decimal(12,4) DEFAULT NULL COMMENT 'Base Original Price',
  `tax_percent` decimal(12,4) DEFAULT '0.0000' COMMENT 'Tax Percent',
  `tax_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Tax Amount',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Tax Amount',
  `tax_invoiced` decimal(12,4) DEFAULT '0.0000' COMMENT 'Tax Invoiced',
  `base_tax_invoiced` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Tax Invoiced',
  `discount_percent` decimal(12,4) DEFAULT '0.0000' COMMENT 'Discount Percent',
  `discount_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Discount Amount',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Discount Amount',
  `discount_invoiced` decimal(12,4) DEFAULT '0.0000' COMMENT 'Discount Invoiced',
  `base_discount_invoiced` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Discount Invoiced',
  `amount_refunded` decimal(12,4) DEFAULT '0.0000' COMMENT 'Amount Refunded',
  `base_amount_refunded` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Amount Refunded',
  `row_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Row Total',
  `base_row_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Row Total',
  `row_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Row Invoiced',
  `base_row_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Row Invoiced',
  `row_weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Row Weight',
  `base_tax_before_discount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Before Discount',
  `tax_before_discount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Before Discount',
  `ext_order_item_id` varchar(255) DEFAULT NULL COMMENT 'Ext Order Item Id',
  `locked_do_invoice` smallint(5) unsigned DEFAULT NULL COMMENT 'Locked Do Invoice',
  `locked_do_ship` smallint(5) unsigned DEFAULT NULL COMMENT 'Locked Do Ship',
  `price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Price Incl Tax',
  `base_price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Price Incl Tax',
  `row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Row Total Incl Tax',
  `base_row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total Incl Tax',
  `discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `discount_tax_compensation_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Invoiced',
  `base_discount_tax_compensation_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Invoiced',
  `discount_tax_compensation_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Refunded',
  `base_discount_tax_compensation_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Refunded',
  `tax_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Tax Canceled',
  `discount_tax_compensation_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Canceled',
  `tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Tax Refunded',
  `base_tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Refunded',
  `discount_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Discount Refunded',
  `base_discount_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Refunded',
  `free_shipping` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Free Shipping',
  `gift_message_id` int(11) DEFAULT NULL COMMENT 'Gift Message Id',
  `gift_message_available` int(11) DEFAULT NULL COMMENT 'Gift Message Available',
  `weee_tax_applied` text COMMENT 'Weee Tax Applied',
  `weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Amount',
  `weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Row Amount',
  `weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Disposition',
  `weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Row Disposition',
  `base_weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Amount',
  `base_weee_tax_applied_row_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Row Amnt',
  `base_weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Disposition',
  `base_weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Row Disposition',
  PRIMARY KEY (`item_id`),
  KEY `CSVP_SALES_ORDER_ITEM_ORDER_ID` (`order_id`),
  KEY `CSVP_SALES_ORDER_ITEM_STORE_ID` (`store_id`),
  CONSTRAINT `CSVP_SALES_ORDER_ITEM_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `csvp_sales_order` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_SALES_ORDER_ITEM_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Order Item';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_sales_order_item`
--

LOCK TABLES `csvp_sales_order_item` WRITE;
/*!40000 ALTER TABLE `csvp_sales_order_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_sales_order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_sales_order_payment`
--

DROP TABLE IF EXISTS `csvp_sales_order_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_sales_order_payment` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `base_shipping_captured` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Captured',
  `shipping_captured` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Captured',
  `amount_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Amount Refunded',
  `base_amount_paid` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount Paid',
  `amount_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Amount Canceled',
  `base_amount_authorized` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount Authorized',
  `base_amount_paid_online` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount Paid Online',
  `base_amount_refunded_online` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount Refunded Online',
  `base_shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Amount',
  `shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Amount',
  `amount_paid` decimal(12,4) DEFAULT NULL COMMENT 'Amount Paid',
  `amount_authorized` decimal(12,4) DEFAULT NULL COMMENT 'Amount Authorized',
  `base_amount_ordered` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount Ordered',
  `base_shipping_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Refunded',
  `shipping_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Refunded',
  `base_amount_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount Refunded',
  `amount_ordered` decimal(12,4) DEFAULT NULL COMMENT 'Amount Ordered',
  `base_amount_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount Canceled',
  `quote_payment_id` int(11) DEFAULT NULL COMMENT 'Quote Payment Id',
  `additional_data` text COMMENT 'Additional Data',
  `cc_exp_month` varchar(12) DEFAULT NULL COMMENT 'Cc Exp Month',
  `cc_ss_start_year` varchar(12) DEFAULT NULL COMMENT 'Cc Ss Start Year',
  `echeck_bank_name` varchar(128) DEFAULT NULL COMMENT 'Echeck Bank Name',
  `method` varchar(128) DEFAULT NULL COMMENT 'Method',
  `cc_debug_request_body` varchar(32) DEFAULT NULL COMMENT 'Cc Debug Request Body',
  `cc_secure_verify` varchar(32) DEFAULT NULL COMMENT 'Cc Secure Verify',
  `protection_eligibility` varchar(32) DEFAULT NULL COMMENT 'Protection Eligibility',
  `cc_approval` varchar(32) DEFAULT NULL COMMENT 'Cc Approval',
  `cc_last_4` varchar(100) DEFAULT NULL COMMENT 'Cc Last 4',
  `cc_status_description` varchar(32) DEFAULT NULL COMMENT 'Cc Status Description',
  `echeck_type` varchar(32) DEFAULT NULL COMMENT 'Echeck Type',
  `cc_debug_response_serialized` varchar(32) DEFAULT NULL COMMENT 'Cc Debug Response Serialized',
  `cc_ss_start_month` varchar(128) DEFAULT NULL COMMENT 'Cc Ss Start Month',
  `echeck_account_type` varchar(255) DEFAULT NULL COMMENT 'Echeck Account Type',
  `last_trans_id` varchar(32) DEFAULT NULL COMMENT 'Last Trans Id',
  `cc_cid_status` varchar(32) DEFAULT NULL COMMENT 'Cc Cid Status',
  `cc_owner` varchar(128) DEFAULT NULL COMMENT 'Cc Owner',
  `cc_type` varchar(32) DEFAULT NULL COMMENT 'Cc Type',
  `po_number` varchar(32) DEFAULT NULL COMMENT 'Po Number',
  `cc_exp_year` varchar(4) DEFAULT NULL COMMENT 'Cc Exp Year',
  `cc_status` varchar(4) DEFAULT NULL COMMENT 'Cc Status',
  `echeck_routing_number` varchar(32) DEFAULT NULL COMMENT 'Echeck Routing Number',
  `account_status` varchar(32) DEFAULT NULL COMMENT 'Account Status',
  `anet_trans_method` varchar(32) DEFAULT NULL COMMENT 'Anet Trans Method',
  `cc_debug_response_body` varchar(32) DEFAULT NULL COMMENT 'Cc Debug Response Body',
  `cc_ss_issue` varchar(32) DEFAULT NULL COMMENT 'Cc Ss Issue',
  `echeck_account_name` varchar(32) DEFAULT NULL COMMENT 'Echeck Account Name',
  `cc_avs_status` varchar(32) DEFAULT NULL COMMENT 'Cc Avs Status',
  `cc_number_enc` varchar(128) DEFAULT NULL,
  `cc_trans_id` varchar(32) DEFAULT NULL COMMENT 'Cc Trans Id',
  `address_status` varchar(32) DEFAULT NULL COMMENT 'Address Status',
  `additional_information` text COMMENT 'Additional Information',
  PRIMARY KEY (`entity_id`),
  KEY `CSVP_SALES_ORDER_PAYMENT_PARENT_ID` (`parent_id`),
  CONSTRAINT `CSVP_SALES_ORDER_PAYMENT_PARENT_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `csvp_sales_order` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Order Payment';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_sales_order_payment`
--

LOCK TABLES `csvp_sales_order_payment` WRITE;
/*!40000 ALTER TABLE `csvp_sales_order_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_sales_order_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_sales_order_status`
--

DROP TABLE IF EXISTS `csvp_sales_order_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_sales_order_status` (
  `status` varchar(32) NOT NULL COMMENT 'Status',
  `label` varchar(128) NOT NULL COMMENT 'Label',
  PRIMARY KEY (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Status Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_sales_order_status`
--

LOCK TABLES `csvp_sales_order_status` WRITE;
/*!40000 ALTER TABLE `csvp_sales_order_status` DISABLE KEYS */;
INSERT INTO `csvp_sales_order_status` VALUES ('canceled','Canceled'),('closed','Closed'),('complete','Complete'),('fraud','Suspected Fraud'),('holded','On Hold'),('payment_review','Payment Review'),('paypal_canceled_reversal','PayPal Canceled Reversal'),('paypal_reversed','PayPal Reversed'),('pending','Pending'),('pending_payment','Pending Payment'),('pending_paypal','Pending PayPal'),('processing','Processing');
/*!40000 ALTER TABLE `csvp_sales_order_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_sales_order_status_history`
--

DROP TABLE IF EXISTS `csvp_sales_order_status_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_sales_order_status_history` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `is_customer_notified` int(11) DEFAULT NULL COMMENT 'Is Customer Notified',
  `is_visible_on_front` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible On Front',
  `comment` text COMMENT 'Comment',
  `status` varchar(32) DEFAULT NULL COMMENT 'Status',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `entity_name` varchar(32) DEFAULT NULL COMMENT 'Shows what entity history is bind to.',
  PRIMARY KEY (`entity_id`),
  KEY `CSVP_SALES_ORDER_STATUS_HISTORY_PARENT_ID` (`parent_id`),
  KEY `CSVP_SALES_ORDER_STATUS_HISTORY_CREATED_AT` (`created_at`),
  CONSTRAINT `CSVP_SALES_ORDER_STATUS_HISTORY_PARENT_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `csvp_sales_order` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Order Status History';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_sales_order_status_history`
--

LOCK TABLES `csvp_sales_order_status_history` WRITE;
/*!40000 ALTER TABLE `csvp_sales_order_status_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_sales_order_status_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_sales_order_status_label`
--

DROP TABLE IF EXISTS `csvp_sales_order_status_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_sales_order_status_label` (
  `status` varchar(32) NOT NULL COMMENT 'Status',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  `label` varchar(128) NOT NULL COMMENT 'Label',
  PRIMARY KEY (`status`,`store_id`),
  KEY `CSVP_SALES_ORDER_STATUS_LABEL_STORE_ID` (`store_id`),
  CONSTRAINT `CSVP_SALES_ORDER_STATUS_LABEL_STATUS_SALES_ORDER_STATUS_STATUS` FOREIGN KEY (`status`) REFERENCES `csvp_sales_order_status` (`status`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_SALES_ORDER_STATUS_LABEL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Status Label Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_sales_order_status_label`
--

LOCK TABLES `csvp_sales_order_status_label` WRITE;
/*!40000 ALTER TABLE `csvp_sales_order_status_label` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_sales_order_status_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_sales_order_status_state`
--

DROP TABLE IF EXISTS `csvp_sales_order_status_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_sales_order_status_state` (
  `status` varchar(32) NOT NULL COMMENT 'Status',
  `state` varchar(32) NOT NULL COMMENT 'Label',
  `is_default` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Default',
  `visible_on_front` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Visible on front',
  PRIMARY KEY (`status`,`state`),
  CONSTRAINT `CSVP_SALES_ORDER_STATUS_STATE_STATUS_SALES_ORDER_STATUS_STATUS` FOREIGN KEY (`status`) REFERENCES `csvp_sales_order_status` (`status`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Status Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_sales_order_status_state`
--

LOCK TABLES `csvp_sales_order_status_state` WRITE;
/*!40000 ALTER TABLE `csvp_sales_order_status_state` DISABLE KEYS */;
INSERT INTO `csvp_sales_order_status_state` VALUES ('canceled','canceled',1,1),('closed','closed',1,1),('complete','complete',1,1),('fraud','payment_review',0,1),('fraud','processing',0,1),('holded','holded',1,1),('payment_review','payment_review',1,1),('pending','new',1,1),('pending_payment','pending_payment',1,0),('processing','processing',1,1);
/*!40000 ALTER TABLE `csvp_sales_order_status_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_sales_order_tax`
--

DROP TABLE IF EXISTS `csvp_sales_order_tax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_sales_order_tax` (
  `tax_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Tax Id',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  `code` varchar(255) DEFAULT NULL COMMENT 'Code',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  `percent` decimal(12,4) DEFAULT NULL COMMENT 'Percent',
  `amount` decimal(12,4) DEFAULT NULL COMMENT 'Amount',
  `priority` int(11) NOT NULL COMMENT 'Priority',
  `position` int(11) NOT NULL COMMENT 'Position',
  `base_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount',
  `process` smallint(6) NOT NULL COMMENT 'Process',
  `base_real_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Real Amount',
  PRIMARY KEY (`tax_id`),
  KEY `CSVP_SALES_ORDER_TAX_ORDER_ID_PRIORITY_POSITION` (`order_id`,`priority`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Tax Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_sales_order_tax`
--

LOCK TABLES `csvp_sales_order_tax` WRITE;
/*!40000 ALTER TABLE `csvp_sales_order_tax` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_sales_order_tax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_sales_order_tax_item`
--

DROP TABLE IF EXISTS `csvp_sales_order_tax_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_sales_order_tax_item` (
  `tax_item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Tax Item Id',
  `tax_id` int(10) unsigned NOT NULL COMMENT 'Tax Id',
  `item_id` int(10) unsigned DEFAULT NULL COMMENT 'Item Id',
  `tax_percent` decimal(12,4) NOT NULL COMMENT 'Real Tax Percent For Item',
  `amount` decimal(12,4) NOT NULL COMMENT 'Tax amount for the item and tax rate',
  `base_amount` decimal(12,4) NOT NULL COMMENT 'Base tax amount for the item and tax rate',
  `real_amount` decimal(12,4) NOT NULL COMMENT 'Real tax amount for the item and tax rate',
  `real_base_amount` decimal(12,4) NOT NULL COMMENT 'Real base tax amount for the item and tax rate',
  `associated_item_id` int(10) unsigned DEFAULT NULL COMMENT 'Id of the associated item',
  `taxable_item_type` varchar(32) NOT NULL COMMENT 'Type of the taxable item',
  PRIMARY KEY (`tax_item_id`),
  UNIQUE KEY `CSVP_SALES_ORDER_TAX_ITEM_TAX_ID_ITEM_ID` (`tax_id`,`item_id`),
  KEY `CSVP_SALES_ORDER_TAX_ITEM_ITEM_ID` (`item_id`),
  KEY `FK_8610357C042E9C9AEA8B34B2BE4B5C2E` (`associated_item_id`),
  CONSTRAINT `CSVP_SALES_ORDER_TAX_ITEM_ITEM_ID_SALES_ORDER_ITEM_ITEM_ID` FOREIGN KEY (`item_id`) REFERENCES `csvp_sales_order_item` (`item_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_SALES_ORDER_TAX_ITEM_TAX_ID_SALES_ORDER_TAX_TAX_ID` FOREIGN KEY (`tax_id`) REFERENCES `csvp_sales_order_tax` (`tax_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_8610357C042E9C9AEA8B34B2BE4B5C2E` FOREIGN KEY (`associated_item_id`) REFERENCES `csvp_sales_order_item` (`item_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Tax Item';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_sales_order_tax_item`
--

LOCK TABLES `csvp_sales_order_tax_item` WRITE;
/*!40000 ALTER TABLE `csvp_sales_order_tax_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_sales_order_tax_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_sales_payment_transaction`
--

DROP TABLE IF EXISTS `csvp_sales_payment_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_sales_payment_transaction` (
  `transaction_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Transaction Id',
  `parent_id` int(10) unsigned DEFAULT NULL COMMENT 'Parent Id',
  `order_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Order Id',
  `payment_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Payment Id',
  `txn_id` varchar(100) DEFAULT NULL COMMENT 'Txn Id',
  `parent_txn_id` varchar(100) DEFAULT NULL COMMENT 'Parent Txn Id',
  `txn_type` varchar(15) DEFAULT NULL COMMENT 'Txn Type',
  `is_closed` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Closed',
  `additional_information` blob COMMENT 'Additional Information',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  PRIMARY KEY (`transaction_id`),
  UNIQUE KEY `CSVP_SALES_PAYMENT_TRANSACTION_ORDER_ID_PAYMENT_ID_TXN_ID` (`order_id`,`payment_id`,`txn_id`),
  KEY `CSVP_SALES_PAYMENT_TRANSACTION_PARENT_ID` (`parent_id`),
  KEY `CSVP_SALES_PAYMENT_TRANSACTION_PAYMENT_ID` (`payment_id`),
  CONSTRAINT `CSVP_SALES_PAYMENT_TRANSACTION_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `csvp_sales_order` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_87E884344683D2884C3ABF4CC707A801` FOREIGN KEY (`parent_id`) REFERENCES `csvp_sales_payment_transaction` (`transaction_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_E85C8EE6C0AC8DAC7CB320722CCE4041` FOREIGN KEY (`payment_id`) REFERENCES `csvp_sales_order_payment` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Payment Transaction';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_sales_payment_transaction`
--

LOCK TABLES `csvp_sales_payment_transaction` WRITE;
/*!40000 ALTER TABLE `csvp_sales_payment_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_sales_payment_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_sales_refunded_aggregated`
--

DROP TABLE IF EXISTS `csvp_sales_refunded_aggregated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_sales_refunded_aggregated` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `refunded` decimal(12,4) DEFAULT NULL COMMENT 'Refunded',
  `online_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Online Refunded',
  `offline_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Offline Refunded',
  PRIMARY KEY (`id`),
  UNIQUE KEY `CSVP_SALES_REFUNDED_AGGREGATED_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `CSVP_SALES_REFUNDED_AGGREGATED_STORE_ID` (`store_id`),
  CONSTRAINT `CSVP_SALES_REFUNDED_AGGREGATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Refunded Aggregated';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_sales_refunded_aggregated`
--

LOCK TABLES `csvp_sales_refunded_aggregated` WRITE;
/*!40000 ALTER TABLE `csvp_sales_refunded_aggregated` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_sales_refunded_aggregated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_sales_refunded_aggregated_order`
--

DROP TABLE IF EXISTS `csvp_sales_refunded_aggregated_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_sales_refunded_aggregated_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `refunded` decimal(12,4) DEFAULT NULL COMMENT 'Refunded',
  `online_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Online Refunded',
  `offline_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Offline Refunded',
  PRIMARY KEY (`id`),
  UNIQUE KEY `CSVP_SALES_REFUNDED_AGGRED_ORDER_PERIOD_STORE_ID_ORDER_STS` (`period`,`store_id`,`order_status`),
  KEY `CSVP_SALES_REFUNDED_AGGREGATED_ORDER_STORE_ID` (`store_id`),
  CONSTRAINT `CSVP_SALES_REFUNDED_AGGREGATED_ORDER_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Refunded Aggregated Order';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_sales_refunded_aggregated_order`
--

LOCK TABLES `csvp_sales_refunded_aggregated_order` WRITE;
/*!40000 ALTER TABLE `csvp_sales_refunded_aggregated_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_sales_refunded_aggregated_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_sales_sequence_meta`
--

DROP TABLE IF EXISTS `csvp_sales_sequence_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_sales_sequence_meta` (
  `meta_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `entity_type` varchar(32) NOT NULL COMMENT 'Prefix',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  `sequence_table` varchar(32) NOT NULL COMMENT 'table for sequence',
  PRIMARY KEY (`meta_id`),
  UNIQUE KEY `CSVP_SALES_SEQUENCE_META_ENTITY_TYPE_STORE_ID` (`entity_type`,`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='csvp_sales_sequence_meta';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_sales_sequence_meta`
--

LOCK TABLES `csvp_sales_sequence_meta` WRITE;
/*!40000 ALTER TABLE `csvp_sales_sequence_meta` DISABLE KEYS */;
INSERT INTO `csvp_sales_sequence_meta` VALUES (1,'order',0,'csvp_sequence_order_0'),(2,'invoice',0,'csvp_sequence_invoice_0'),(3,'creditmemo',0,'csvp_sequence_creditmemo_0'),(4,'shipment',0,'csvp_sequence_shipment_0'),(5,'order',1,'csvp_sequence_order_1'),(6,'invoice',1,'csvp_sequence_invoice_1'),(7,'creditmemo',1,'csvp_sequence_creditmemo_1'),(8,'shipment',1,'csvp_sequence_shipment_1');
/*!40000 ALTER TABLE `csvp_sales_sequence_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_sales_sequence_profile`
--

DROP TABLE IF EXISTS `csvp_sales_sequence_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_sales_sequence_profile` (
  `profile_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `meta_id` int(10) unsigned NOT NULL COMMENT 'Meta_id',
  `prefix` varchar(32) DEFAULT NULL COMMENT 'Prefix',
  `suffix` varchar(32) DEFAULT NULL COMMENT 'Suffix',
  `start_value` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'Start value for sequence',
  `step` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'Step for sequence',
  `max_value` int(10) unsigned NOT NULL COMMENT 'MaxValue for sequence',
  `warning_value` int(10) unsigned NOT NULL COMMENT 'WarningValue for sequence',
  `is_active` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'isActive flag',
  PRIMARY KEY (`profile_id`),
  UNIQUE KEY `CSVP_SALES_SEQUENCE_PROFILE_META_ID_PREFIX_SUFFIX` (`meta_id`,`prefix`,`suffix`),
  CONSTRAINT `CSVP_SALES_SEQUENCE_PROFILE_META_ID_SALES_SEQUENCE_META_META_ID` FOREIGN KEY (`meta_id`) REFERENCES `csvp_sales_sequence_meta` (`meta_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='csvp_sales_sequence_profile';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_sales_sequence_profile`
--

LOCK TABLES `csvp_sales_sequence_profile` WRITE;
/*!40000 ALTER TABLE `csvp_sales_sequence_profile` DISABLE KEYS */;
INSERT INTO `csvp_sales_sequence_profile` VALUES (1,1,NULL,NULL,1,1,4294967295,4294966295,1),(2,2,NULL,NULL,1,1,4294967295,4294966295,1),(3,3,NULL,NULL,1,1,4294967295,4294966295,1),(4,4,NULL,NULL,1,1,4294967295,4294966295,1),(5,5,NULL,NULL,1,1,4294967295,4294966295,1),(6,6,NULL,NULL,1,1,4294967295,4294966295,1),(7,7,NULL,NULL,1,1,4294967295,4294966295,1),(8,8,NULL,NULL,1,1,4294967295,4294966295,1);
/*!40000 ALTER TABLE `csvp_sales_sequence_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_sales_shipment`
--

DROP TABLE IF EXISTS `csvp_sales_shipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_sales_shipment` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `total_weight` decimal(12,4) DEFAULT NULL COMMENT 'Total Weight',
  `total_qty` decimal(12,4) DEFAULT NULL COMMENT 'Total Qty',
  `email_sent` smallint(5) unsigned DEFAULT NULL COMMENT 'Email Sent',
  `send_email` smallint(5) unsigned DEFAULT NULL COMMENT 'Send Email',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  `customer_id` int(11) DEFAULT NULL COMMENT 'Customer Id',
  `shipping_address_id` int(11) DEFAULT NULL COMMENT 'Shipping Address Id',
  `billing_address_id` int(11) DEFAULT NULL COMMENT 'Billing Address Id',
  `shipment_status` int(11) DEFAULT NULL COMMENT 'Shipment Status',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `packages` text COMMENT 'Packed Products in Packages',
  `shipping_label` mediumblob COMMENT 'Shipping Label Content',
  `customer_note` text COMMENT 'Customer Note',
  `customer_note_notify` smallint(5) unsigned DEFAULT NULL COMMENT 'Customer Note Notify',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `CSVP_SALES_SHIPMENT_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  KEY `CSVP_SALES_SHIPMENT_STORE_ID` (`store_id`),
  KEY `CSVP_SALES_SHIPMENT_TOTAL_QTY` (`total_qty`),
  KEY `CSVP_SALES_SHIPMENT_ORDER_ID` (`order_id`),
  KEY `CSVP_SALES_SHIPMENT_CREATED_AT` (`created_at`),
  KEY `CSVP_SALES_SHIPMENT_UPDATED_AT` (`updated_at`),
  KEY `CSVP_SALES_SHIPMENT_SEND_EMAIL` (`send_email`),
  KEY `CSVP_SALES_SHIPMENT_EMAIL_SENT` (`email_sent`),
  CONSTRAINT `CSVP_SALES_SHIPMENT_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `csvp_sales_order` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_SALES_SHIPMENT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Shipment';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_sales_shipment`
--

LOCK TABLES `csvp_sales_shipment` WRITE;
/*!40000 ALTER TABLE `csvp_sales_shipment` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_sales_shipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_sales_shipment_comment`
--

DROP TABLE IF EXISTS `csvp_sales_shipment_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_sales_shipment_comment` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `is_customer_notified` int(11) DEFAULT NULL COMMENT 'Is Customer Notified',
  `is_visible_on_front` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible On Front',
  `comment` text COMMENT 'Comment',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  PRIMARY KEY (`entity_id`),
  KEY `CSVP_SALES_SHIPMENT_COMMENT_CREATED_AT` (`created_at`),
  KEY `CSVP_SALES_SHIPMENT_COMMENT_PARENT_ID` (`parent_id`),
  CONSTRAINT `CSVP_SALES_SHIPMENT_COMMENT_PARENT_ID_SALES_SHIPMENT_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `csvp_sales_shipment` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Shipment Comment';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_sales_shipment_comment`
--

LOCK TABLES `csvp_sales_shipment_comment` WRITE;
/*!40000 ALTER TABLE `csvp_sales_shipment_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_sales_shipment_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_sales_shipment_grid`
--

DROP TABLE IF EXISTS `csvp_sales_shipment_grid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_sales_shipment_grid` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_increment_id` varchar(32) NOT NULL COMMENT 'Order Increment Id',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  `order_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Order Increment Id',
  `customer_name` varchar(128) NOT NULL COMMENT 'Customer Name',
  `total_qty` decimal(12,4) DEFAULT NULL COMMENT 'Total Qty',
  `shipment_status` int(11) DEFAULT NULL COMMENT 'Shipment Status',
  `order_status` varchar(32) DEFAULT NULL COMMENT 'Order',
  `billing_address` varchar(255) DEFAULT NULL COMMENT 'Billing Address',
  `shipping_address` varchar(255) DEFAULT NULL COMMENT 'Shipping Address',
  `billing_name` varchar(128) DEFAULT NULL COMMENT 'Billing Name',
  `shipping_name` varchar(128) DEFAULT NULL COMMENT 'Shipping Name',
  `customer_email` varchar(128) DEFAULT NULL COMMENT 'Customer Email',
  `customer_group_id` int(11) DEFAULT NULL,
  `payment_method` varchar(32) DEFAULT NULL COMMENT 'Payment Method',
  `shipping_information` varchar(255) DEFAULT NULL COMMENT 'Shipping Method Name',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `CSVP_SALES_SHIPMENT_GRID_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  KEY `CSVP_SALES_SHIPMENT_GRID_STORE_ID` (`store_id`),
  KEY `CSVP_SALES_SHIPMENT_GRID_TOTAL_QTY` (`total_qty`),
  KEY `CSVP_SALES_SHIPMENT_GRID_ORDER_INCREMENT_ID` (`order_increment_id`),
  KEY `CSVP_SALES_SHIPMENT_GRID_SHIPMENT_STATUS` (`shipment_status`),
  KEY `CSVP_SALES_SHIPMENT_GRID_ORDER_STATUS` (`order_status`),
  KEY `CSVP_SALES_SHIPMENT_GRID_CREATED_AT` (`created_at`),
  KEY `CSVP_SALES_SHIPMENT_GRID_UPDATED_AT` (`updated_at`),
  KEY `CSVP_SALES_SHIPMENT_GRID_ORDER_CREATED_AT` (`order_created_at`),
  KEY `CSVP_SALES_SHIPMENT_GRID_SHIPPING_NAME` (`shipping_name`),
  KEY `CSVP_SALES_SHIPMENT_GRID_BILLING_NAME` (`billing_name`),
  FULLTEXT KEY `FTI_7EB7A9F70F5021148CC52792F88860B0` (`increment_id`,`order_increment_id`,`shipping_name`,`customer_name`,`customer_email`,`billing_address`,`shipping_address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Shipment Grid';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_sales_shipment_grid`
--

LOCK TABLES `csvp_sales_shipment_grid` WRITE;
/*!40000 ALTER TABLE `csvp_sales_shipment_grid` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_sales_shipment_grid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_sales_shipment_item`
--

DROP TABLE IF EXISTS `csvp_sales_shipment_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_sales_shipment_item` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `row_total` decimal(12,4) DEFAULT NULL COMMENT 'Row Total',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `weight` decimal(12,4) DEFAULT NULL COMMENT 'Weight',
  `qty` decimal(12,4) DEFAULT NULL COMMENT 'Qty',
  `product_id` int(11) DEFAULT NULL COMMENT 'Product Id',
  `order_item_id` int(11) DEFAULT NULL COMMENT 'Order Item Id',
  `additional_data` text COMMENT 'Additional Data',
  `description` text COMMENT 'Description',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  PRIMARY KEY (`entity_id`),
  KEY `CSVP_SALES_SHIPMENT_ITEM_PARENT_ID` (`parent_id`),
  CONSTRAINT `CSVP_SALES_SHIPMENT_ITEM_PARENT_ID_SALES_SHIPMENT_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `csvp_sales_shipment` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Shipment Item';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_sales_shipment_item`
--

LOCK TABLES `csvp_sales_shipment_item` WRITE;
/*!40000 ALTER TABLE `csvp_sales_shipment_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_sales_shipment_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_sales_shipment_track`
--

DROP TABLE IF EXISTS `csvp_sales_shipment_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_sales_shipment_track` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `weight` decimal(12,4) DEFAULT NULL COMMENT 'Weight',
  `qty` decimal(12,4) DEFAULT NULL COMMENT 'Qty',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  `track_number` text COMMENT 'Number',
  `description` text COMMENT 'Description',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  `carrier_code` varchar(32) DEFAULT NULL COMMENT 'Carrier Code',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  PRIMARY KEY (`entity_id`),
  KEY `CSVP_SALES_SHIPMENT_TRACK_PARENT_ID` (`parent_id`),
  KEY `CSVP_SALES_SHIPMENT_TRACK_ORDER_ID` (`order_id`),
  KEY `CSVP_SALES_SHIPMENT_TRACK_CREATED_AT` (`created_at`),
  CONSTRAINT `CSVP_SALES_SHIPMENT_TRACK_PARENT_ID_SALES_SHIPMENT_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `csvp_sales_shipment` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Shipment Track';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_sales_shipment_track`
--

LOCK TABLES `csvp_sales_shipment_track` WRITE;
/*!40000 ALTER TABLE `csvp_sales_shipment_track` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_sales_shipment_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_sales_shipping_aggregated`
--

DROP TABLE IF EXISTS `csvp_sales_shipping_aggregated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_sales_shipping_aggregated` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `shipping_description` varchar(255) DEFAULT NULL COMMENT 'Shipping Description',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `total_shipping` decimal(12,4) DEFAULT NULL COMMENT 'Total Shipping',
  `total_shipping_actual` decimal(12,4) DEFAULT NULL COMMENT 'Total Shipping Actual',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_BA8C6A42E8CEE2FADF7FF57E4F5AF046` (`period`,`store_id`,`order_status`,`shipping_description`),
  KEY `CSVP_SALES_SHIPPING_AGGREGATED_STORE_ID` (`store_id`),
  CONSTRAINT `CSVP_SALES_SHIPPING_AGGREGATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Shipping Aggregated';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_sales_shipping_aggregated`
--

LOCK TABLES `csvp_sales_shipping_aggregated` WRITE;
/*!40000 ALTER TABLE `csvp_sales_shipping_aggregated` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_sales_shipping_aggregated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_sales_shipping_aggregated_order`
--

DROP TABLE IF EXISTS `csvp_sales_shipping_aggregated_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_sales_shipping_aggregated_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `shipping_description` varchar(255) DEFAULT NULL COMMENT 'Shipping Description',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `total_shipping` decimal(12,4) DEFAULT NULL COMMENT 'Total Shipping',
  `total_shipping_actual` decimal(12,4) DEFAULT NULL COMMENT 'Total Shipping Actual',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_A63D2FE6656C011FCB9FDF4BFF8A8E2B` (`period`,`store_id`,`order_status`,`shipping_description`),
  KEY `CSVP_SALES_SHIPPING_AGGREGATED_ORDER_STORE_ID` (`store_id`),
  CONSTRAINT `CSVP_SALES_SHIPPING_AGGREGATED_ORDER_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Shipping Aggregated Order';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_sales_shipping_aggregated_order`
--

LOCK TABLES `csvp_sales_shipping_aggregated_order` WRITE;
/*!40000 ALTER TABLE `csvp_sales_shipping_aggregated_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_sales_shipping_aggregated_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_salesrule`
--

DROP TABLE IF EXISTS `csvp_salesrule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_salesrule` (
  `rule_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text COMMENT 'Description',
  `from_date` date DEFAULT NULL COMMENT 'From',
  `to_date` date DEFAULT NULL COMMENT 'To',
  `uses_per_customer` int(11) NOT NULL DEFAULT '0' COMMENT 'Uses Per Customer',
  `is_active` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Is Active',
  `conditions_serialized` mediumtext COMMENT 'Conditions Serialized',
  `actions_serialized` mediumtext COMMENT 'Actions Serialized',
  `stop_rules_processing` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Stop Rules Processing',
  `is_advanced` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Advanced',
  `product_ids` text COMMENT 'Product Ids',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `simple_action` varchar(32) DEFAULT NULL COMMENT 'Simple Action',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  `discount_qty` decimal(12,4) DEFAULT NULL COMMENT 'Discount Qty',
  `discount_step` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Discount Step',
  `apply_to_shipping` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Apply To Shipping',
  `times_used` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Times Used',
  `is_rss` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Is Rss',
  `coupon_type` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Coupon Type',
  `use_auto_generation` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Use Auto Generation',
  `uses_per_coupon` int(11) NOT NULL DEFAULT '0' COMMENT 'User Per Coupon',
  `simple_free_shipping` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Simple Free Shipping',
  PRIMARY KEY (`rule_id`),
  KEY `CSVP_SALESRULE_IS_ACTIVE_SORT_ORDER_TO_DATE_FROM_DATE` (`is_active`,`sort_order`,`to_date`,`from_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_salesrule`
--

LOCK TABLES `csvp_salesrule` WRITE;
/*!40000 ALTER TABLE `csvp_salesrule` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_salesrule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_salesrule_coupon`
--

DROP TABLE IF EXISTS `csvp_salesrule_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_salesrule_coupon` (
  `coupon_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Coupon Id',
  `rule_id` int(10) unsigned NOT NULL COMMENT 'Rule Id',
  `code` varchar(255) DEFAULT NULL COMMENT 'Code',
  `usage_limit` int(10) unsigned DEFAULT NULL COMMENT 'Usage Limit',
  `usage_per_customer` int(10) unsigned DEFAULT NULL COMMENT 'Usage Per Customer',
  `times_used` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Times Used',
  `expiration_date` timestamp NULL DEFAULT NULL COMMENT 'Expiration Date',
  `is_primary` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Primary',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Coupon Code Creation Date',
  `type` smallint(6) DEFAULT '0' COMMENT 'Coupon Code Type',
  PRIMARY KEY (`coupon_id`),
  UNIQUE KEY `CSVP_SALESRULE_COUPON_CODE` (`code`),
  UNIQUE KEY `CSVP_SALESRULE_COUPON_RULE_ID_IS_PRIMARY` (`rule_id`,`is_primary`),
  KEY `CSVP_SALESRULE_COUPON_RULE_ID` (`rule_id`),
  CONSTRAINT `CSVP_SALESRULE_COUPON_RULE_ID_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `csvp_salesrule` (`rule_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule Coupon';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_salesrule_coupon`
--

LOCK TABLES `csvp_salesrule_coupon` WRITE;
/*!40000 ALTER TABLE `csvp_salesrule_coupon` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_salesrule_coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_salesrule_coupon_aggregated`
--

DROP TABLE IF EXISTS `csvp_salesrule_coupon_aggregated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_salesrule_coupon_aggregated` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date NOT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `coupon_code` varchar(50) DEFAULT NULL COMMENT 'Coupon Code',
  `coupon_uses` int(11) NOT NULL DEFAULT '0' COMMENT 'Coupon Uses',
  `subtotal_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal Amount',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  `total_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Amount',
  `subtotal_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal Amount Actual',
  `discount_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount Actual',
  `total_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Amount Actual',
  `rule_name` varchar(255) DEFAULT NULL COMMENT 'Rule Name',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_8325CBBA3E303DA8E06AE93987E51DD1` (`period`,`store_id`,`order_status`,`coupon_code`),
  KEY `CSVP_SALESRULE_COUPON_AGGREGATED_STORE_ID` (`store_id`),
  KEY `CSVP_SALESRULE_COUPON_AGGREGATED_RULE_NAME` (`rule_name`),
  CONSTRAINT `CSVP_SALESRULE_COUPON_AGGREGATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Coupon Aggregated';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_salesrule_coupon_aggregated`
--

LOCK TABLES `csvp_salesrule_coupon_aggregated` WRITE;
/*!40000 ALTER TABLE `csvp_salesrule_coupon_aggregated` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_salesrule_coupon_aggregated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_salesrule_coupon_aggregated_order`
--

DROP TABLE IF EXISTS `csvp_salesrule_coupon_aggregated_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_salesrule_coupon_aggregated_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date NOT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `coupon_code` varchar(50) DEFAULT NULL COMMENT 'Coupon Code',
  `coupon_uses` int(11) NOT NULL DEFAULT '0' COMMENT 'Coupon Uses',
  `subtotal_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal Amount',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  `total_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Amount',
  `rule_name` varchar(255) DEFAULT NULL COMMENT 'Rule Name',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_63F7FBA4C873A0AC60A244D23F9A0AD3` (`period`,`store_id`,`order_status`,`coupon_code`),
  KEY `CSVP_SALESRULE_COUPON_AGGREGATED_ORDER_STORE_ID` (`store_id`),
  KEY `CSVP_SALESRULE_COUPON_AGGREGATED_ORDER_RULE_NAME` (`rule_name`),
  CONSTRAINT `CSVP_SALESRULE_COUPON_AGGREGATED_ORDER_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Coupon Aggregated Order';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_salesrule_coupon_aggregated_order`
--

LOCK TABLES `csvp_salesrule_coupon_aggregated_order` WRITE;
/*!40000 ALTER TABLE `csvp_salesrule_coupon_aggregated_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_salesrule_coupon_aggregated_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_salesrule_coupon_aggregated_updated`
--

DROP TABLE IF EXISTS `csvp_salesrule_coupon_aggregated_updated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_salesrule_coupon_aggregated_updated` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date NOT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `coupon_code` varchar(50) DEFAULT NULL COMMENT 'Coupon Code',
  `coupon_uses` int(11) NOT NULL DEFAULT '0' COMMENT 'Coupon Uses',
  `subtotal_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal Amount',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  `total_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Amount',
  `subtotal_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal Amount Actual',
  `discount_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount Actual',
  `total_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Amount Actual',
  `rule_name` varchar(255) DEFAULT NULL COMMENT 'Rule Name',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_19319A2826E04643BABEA2560E7B6793` (`period`,`store_id`,`order_status`,`coupon_code`),
  KEY `CSVP_SALESRULE_COUPON_AGGREGATED_UPDATED_STORE_ID` (`store_id`),
  KEY `CSVP_SALESRULE_COUPON_AGGREGATED_UPDATED_RULE_NAME` (`rule_name`),
  CONSTRAINT `FK_B474E49BFD92A8C4F7E48BBDAFDDD464` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Csvp Salesrule Coupon Aggregated Updated';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_salesrule_coupon_aggregated_updated`
--

LOCK TABLES `csvp_salesrule_coupon_aggregated_updated` WRITE;
/*!40000 ALTER TABLE `csvp_salesrule_coupon_aggregated_updated` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_salesrule_coupon_aggregated_updated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_salesrule_coupon_usage`
--

DROP TABLE IF EXISTS `csvp_salesrule_coupon_usage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_salesrule_coupon_usage` (
  `coupon_id` int(10) unsigned NOT NULL COMMENT 'Coupon Id',
  `customer_id` int(10) unsigned NOT NULL COMMENT 'Customer Id',
  `times_used` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Times Used',
  PRIMARY KEY (`coupon_id`,`customer_id`),
  KEY `CSVP_SALESRULE_COUPON_USAGE_CUSTOMER_ID` (`customer_id`),
  CONSTRAINT `CSVP_SALESRULE_COUPON_USAGE_COUPON_ID_SALESRULE_COUPON_COUPON_ID` FOREIGN KEY (`coupon_id`) REFERENCES `csvp_salesrule_coupon` (`coupon_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_SALESRULE_COUPON_USAGE_CSTR_ID_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `csvp_customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule Coupon Usage';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_salesrule_coupon_usage`
--

LOCK TABLES `csvp_salesrule_coupon_usage` WRITE;
/*!40000 ALTER TABLE `csvp_salesrule_coupon_usage` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_salesrule_coupon_usage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_salesrule_customer`
--

DROP TABLE IF EXISTS `csvp_salesrule_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_salesrule_customer` (
  `rule_customer_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule Customer Id',
  `rule_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Rule Id',
  `customer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Id',
  `times_used` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Times Used',
  PRIMARY KEY (`rule_customer_id`),
  KEY `CSVP_SALESRULE_CUSTOMER_RULE_ID_CUSTOMER_ID` (`rule_id`,`customer_id`),
  KEY `CSVP_SALESRULE_CUSTOMER_CUSTOMER_ID_RULE_ID` (`customer_id`,`rule_id`),
  CONSTRAINT `CSVP_SALESRULE_CUSTOMER_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `csvp_customer_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_SALESRULE_CUSTOMER_RULE_ID_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `csvp_salesrule` (`rule_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule Customer';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_salesrule_customer`
--

LOCK TABLES `csvp_salesrule_customer` WRITE;
/*!40000 ALTER TABLE `csvp_salesrule_customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_salesrule_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_salesrule_customer_group`
--

DROP TABLE IF EXISTS `csvp_salesrule_customer_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_salesrule_customer_group` (
  `rule_id` int(10) unsigned NOT NULL COMMENT 'Rule Id',
  `customer_group_id` int(10) unsigned NOT NULL COMMENT 'Customer Group Id',
  PRIMARY KEY (`rule_id`,`customer_group_id`),
  KEY `CSVP_SALESRULE_CUSTOMER_GROUP_CUSTOMER_GROUP_ID` (`customer_group_id`),
  CONSTRAINT `CSVP_SALESRULE_CSTR_GROUP_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `csvp_customer_group` (`customer_group_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_SALESRULE_CUSTOMER_GROUP_RULE_ID_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `csvp_salesrule` (`rule_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Rules To Customer Groups Relations';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_salesrule_customer_group`
--

LOCK TABLES `csvp_salesrule_customer_group` WRITE;
/*!40000 ALTER TABLE `csvp_salesrule_customer_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_salesrule_customer_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_salesrule_label`
--

DROP TABLE IF EXISTS `csvp_salesrule_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_salesrule_label` (
  `label_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Label Id',
  `rule_id` int(10) unsigned NOT NULL COMMENT 'Rule Id',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  `label` varchar(255) DEFAULT NULL COMMENT 'Label',
  PRIMARY KEY (`label_id`),
  UNIQUE KEY `CSVP_SALESRULE_LABEL_RULE_ID_STORE_ID` (`rule_id`,`store_id`),
  KEY `CSVP_SALESRULE_LABEL_STORE_ID` (`store_id`),
  CONSTRAINT `CSVP_SALESRULE_LABEL_RULE_ID_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `csvp_salesrule` (`rule_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_SALESRULE_LABEL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule Label';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_salesrule_label`
--

LOCK TABLES `csvp_salesrule_label` WRITE;
/*!40000 ALTER TABLE `csvp_salesrule_label` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_salesrule_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_salesrule_product_attribute`
--

DROP TABLE IF EXISTS `csvp_salesrule_product_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_salesrule_product_attribute` (
  `rule_id` int(10) unsigned NOT NULL COMMENT 'Rule Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `customer_group_id` int(10) unsigned NOT NULL COMMENT 'Customer Group Id',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute Id',
  PRIMARY KEY (`rule_id`,`website_id`,`customer_group_id`,`attribute_id`),
  KEY `CSVP_SALESRULE_PRODUCT_ATTRIBUTE_WEBSITE_ID` (`website_id`),
  KEY `CSVP_SALESRULE_PRODUCT_ATTRIBUTE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CSVP_SALESRULE_PRODUCT_ATTRIBUTE_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `CSVP_SALESRULE_PRD_ATTR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `csvp_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_SALESRULE_PRD_ATTR_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `csvp_customer_group` (`customer_group_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_SALESRULE_PRD_ATTR_WS_ID_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `csvp_store_website` (`website_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_SALESRULE_PRODUCT_ATTRIBUTE_RULE_ID_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `csvp_salesrule` (`rule_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule Product Attribute';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_salesrule_product_attribute`
--

LOCK TABLES `csvp_salesrule_product_attribute` WRITE;
/*!40000 ALTER TABLE `csvp_salesrule_product_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_salesrule_product_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_salesrule_website`
--

DROP TABLE IF EXISTS `csvp_salesrule_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_salesrule_website` (
  `rule_id` int(10) unsigned NOT NULL COMMENT 'Rule Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  PRIMARY KEY (`rule_id`,`website_id`),
  KEY `CSVP_SALESRULE_WEBSITE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `CSVP_SALESRULE_WEBSITE_RULE_ID_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `csvp_salesrule` (`rule_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_SALESRULE_WEBSITE_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `csvp_store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Rules To Websites Relations';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_salesrule_website`
--

LOCK TABLES `csvp_salesrule_website` WRITE;
/*!40000 ALTER TABLE `csvp_salesrule_website` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_salesrule_website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_search_query`
--

DROP TABLE IF EXISTS `csvp_search_query`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_search_query` (
  `query_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Query ID',
  `query_text` varchar(255) DEFAULT NULL COMMENT 'Query text',
  `num_results` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Num results',
  `popularity` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Popularity',
  `redirect` varchar(255) DEFAULT NULL COMMENT 'Redirect',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `display_in_terms` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Display in terms',
  `is_active` smallint(6) DEFAULT '1' COMMENT 'Active status',
  `is_processed` smallint(6) DEFAULT '0' COMMENT 'Processed status',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated at',
  PRIMARY KEY (`query_id`),
  UNIQUE KEY `CSVP_SEARCH_QUERY_QUERY_TEXT_STORE_ID` (`query_text`,`store_id`),
  KEY `CSVP_SEARCH_QUERY_QUERY_TEXT_STORE_ID_POPULARITY` (`query_text`,`store_id`,`popularity`),
  KEY `CSVP_SEARCH_QUERY_STORE_ID` (`store_id`),
  KEY `CSVP_SEARCH_QUERY_IS_PROCESSED` (`is_processed`),
  CONSTRAINT `CSVP_SEARCH_QUERY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Search query table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_search_query`
--

LOCK TABLES `csvp_search_query` WRITE;
/*!40000 ALTER TABLE `csvp_search_query` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_search_query` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_search_synonyms`
--

DROP TABLE IF EXISTS `csvp_search_synonyms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_search_synonyms` (
  `group_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Synonyms Group Id',
  `synonyms` text NOT NULL COMMENT 'list of synonyms making up this group',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id - identifies the store view these synonyms belong to',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website Id - identifies the website id these synonyms belong to',
  PRIMARY KEY (`group_id`),
  KEY `CSVP_SEARCH_SYNONYMS_STORE_ID` (`store_id`),
  KEY `CSVP_SEARCH_SYNONYMS_WEBSITE_ID` (`website_id`),
  FULLTEXT KEY `CSVP_SEARCH_SYNONYMS_SYNONYMS` (`synonyms`),
  CONSTRAINT `CSVP_SEARCH_SYNONYMS_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_SEARCH_SYNONYMS_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `csvp_store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='table storing various synonyms groups';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_search_synonyms`
--

LOCK TABLES `csvp_search_synonyms` WRITE;
/*!40000 ALTER TABLE `csvp_search_synonyms` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_search_synonyms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_sendfriend_log`
--

DROP TABLE IF EXISTS `csvp_sendfriend_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_sendfriend_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Log ID',
  `ip` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer IP address',
  `time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Log time',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website ID',
  PRIMARY KEY (`log_id`),
  KEY `CSVP_SENDFRIEND_LOG_IP` (`ip`),
  KEY `CSVP_SENDFRIEND_LOG_TIME` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Send to friend function log storage table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_sendfriend_log`
--

LOCK TABLES `csvp_sendfriend_log` WRITE;
/*!40000 ALTER TABLE `csvp_sendfriend_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_sendfriend_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_sequence_creditmemo_0`
--

DROP TABLE IF EXISTS `csvp_sequence_creditmemo_0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_sequence_creditmemo_0` (
  `sequence_value` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_sequence_creditmemo_0`
--

LOCK TABLES `csvp_sequence_creditmemo_0` WRITE;
/*!40000 ALTER TABLE `csvp_sequence_creditmemo_0` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_sequence_creditmemo_0` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_sequence_creditmemo_1`
--

DROP TABLE IF EXISTS `csvp_sequence_creditmemo_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_sequence_creditmemo_1` (
  `sequence_value` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_sequence_creditmemo_1`
--

LOCK TABLES `csvp_sequence_creditmemo_1` WRITE;
/*!40000 ALTER TABLE `csvp_sequence_creditmemo_1` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_sequence_creditmemo_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_sequence_invoice_0`
--

DROP TABLE IF EXISTS `csvp_sequence_invoice_0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_sequence_invoice_0` (
  `sequence_value` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_sequence_invoice_0`
--

LOCK TABLES `csvp_sequence_invoice_0` WRITE;
/*!40000 ALTER TABLE `csvp_sequence_invoice_0` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_sequence_invoice_0` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_sequence_invoice_1`
--

DROP TABLE IF EXISTS `csvp_sequence_invoice_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_sequence_invoice_1` (
  `sequence_value` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_sequence_invoice_1`
--

LOCK TABLES `csvp_sequence_invoice_1` WRITE;
/*!40000 ALTER TABLE `csvp_sequence_invoice_1` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_sequence_invoice_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_sequence_order_0`
--

DROP TABLE IF EXISTS `csvp_sequence_order_0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_sequence_order_0` (
  `sequence_value` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_sequence_order_0`
--

LOCK TABLES `csvp_sequence_order_0` WRITE;
/*!40000 ALTER TABLE `csvp_sequence_order_0` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_sequence_order_0` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_sequence_order_1`
--

DROP TABLE IF EXISTS `csvp_sequence_order_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_sequence_order_1` (
  `sequence_value` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_sequence_order_1`
--

LOCK TABLES `csvp_sequence_order_1` WRITE;
/*!40000 ALTER TABLE `csvp_sequence_order_1` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_sequence_order_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_sequence_shipment_0`
--

DROP TABLE IF EXISTS `csvp_sequence_shipment_0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_sequence_shipment_0` (
  `sequence_value` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_sequence_shipment_0`
--

LOCK TABLES `csvp_sequence_shipment_0` WRITE;
/*!40000 ALTER TABLE `csvp_sequence_shipment_0` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_sequence_shipment_0` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_sequence_shipment_1`
--

DROP TABLE IF EXISTS `csvp_sequence_shipment_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_sequence_shipment_1` (
  `sequence_value` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_sequence_shipment_1`
--

LOCK TABLES `csvp_sequence_shipment_1` WRITE;
/*!40000 ALTER TABLE `csvp_sequence_shipment_1` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_sequence_shipment_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_session`
--

DROP TABLE IF EXISTS `csvp_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_session` (
  `session_id` varchar(255) NOT NULL COMMENT 'Session Id',
  `session_expires` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Date of Session Expiration',
  `session_data` mediumblob NOT NULL COMMENT 'Session Data',
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Database Sessions Storage';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_session`
--

LOCK TABLES `csvp_session` WRITE;
/*!40000 ALTER TABLE `csvp_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_setup_module`
--

DROP TABLE IF EXISTS `csvp_setup_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_setup_module` (
  `module` varchar(50) NOT NULL COMMENT 'Module',
  `schema_version` varchar(50) DEFAULT NULL COMMENT 'Schema Version',
  `data_version` varchar(50) DEFAULT NULL COMMENT 'Data Version',
  PRIMARY KEY (`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Module versions registry';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_setup_module`
--

LOCK TABLES `csvp_setup_module` WRITE;
/*!40000 ALTER TABLE `csvp_setup_module` DISABLE KEYS */;
INSERT INTO `csvp_setup_module` VALUES ('Magento_AdminNotification','2.0.0','2.0.0'),('Magento_AdvancedPricingImportExport','2.0.0','2.0.0'),('Magento_Authorization','2.0.0','2.0.0'),('Magento_Authorizenet','2.0.0','2.0.0'),('Magento_Backend','2.0.0','2.0.0'),('Magento_Backup','2.0.0','2.0.0'),('Magento_Braintree','2.0.1','2.0.1'),('Magento_Bundle','2.0.4','2.0.4'),('Magento_BundleImportExport','2.0.0','2.0.0'),('Magento_CacheInvalidate','2.0.0','2.0.0'),('Magento_Captcha','2.0.0','2.0.0'),('Magento_Catalog','2.2.3','2.2.3'),('Magento_CatalogImportExport','2.0.0','2.0.0'),('Magento_CatalogInventory','2.3.0','2.3.0'),('Magento_CatalogRule','2.1.0','2.1.0'),('Magento_CatalogRuleConfigurable','2.0.0','2.0.0'),('Magento_CatalogSearch','2.0.0','2.0.0'),('Magento_CatalogUrlRewrite','2.0.0','2.0.0'),('Magento_CatalogWidget','2.0.0','2.0.0'),('Magento_Checkout','2.0.0','2.0.0'),('Magento_CheckoutAgreements','2.2.0','2.2.0'),('Magento_Cms','2.0.2','2.0.2'),('Magento_CmsUrlRewrite','2.0.0','2.0.0'),('Magento_Config','2.0.0','2.0.0'),('Magento_ConfigurableImportExport','2.0.0','2.0.0'),('Magento_ConfigurableProduct','2.2.0','2.2.0'),('Magento_ConfigurableProductSales','2.2.0','2.2.0'),('Magento_Contact','2.0.0','2.0.0'),('Magento_Cookie','2.0.0','2.0.0'),('Magento_Cron','2.0.0','2.0.0'),('Magento_CurrencySymbol','2.0.1','2.0.1'),('Magento_Customer','2.0.12','2.0.12'),('Magento_CustomerImportExport','2.0.0','2.0.0'),('Magento_Deploy','2.0.0','2.0.0'),('Magento_Developer','2.0.0','2.0.0'),('Magento_Dhl','2.0.0','2.0.0'),('Magento_Directory','2.0.1','2.0.1'),('Magento_Downloadable','2.0.2','2.0.2'),('Magento_DownloadableImportExport','2.0.0','2.0.0'),('Magento_Eav','2.1.1','2.1.1'),('Magento_Email','2.0.0','2.0.0'),('Magento_EncryptionKey','2.0.0','2.0.0'),('Magento_Fedex','2.0.0','2.0.0'),('Magento_GiftMessage','2.0.1','2.0.1'),('Magento_GoogleAdwords','2.0.0','2.0.0'),('Magento_GoogleAnalytics','2.0.0','2.0.0'),('Magento_GoogleOptimizer','2.0.0','2.0.0'),('Magento_GroupedImportExport','2.0.0','2.0.0'),('Magento_GroupedProduct','2.0.1','2.0.1'),('Magento_ImportExport','2.0.1','2.0.1'),('Magento_Indexer','2.1.0','2.1.0'),('Magento_Integration','2.2.0','2.2.0'),('Magento_LayeredNavigation','2.0.0','2.0.0'),('Magento_Marketplace','1.0.0','1.0.0'),('Magento_MediaStorage','2.0.0','2.0.0'),('Magento_Msrp','2.1.3','2.1.3'),('Magento_Multishipping','2.0.0','2.0.0'),('Magento_NewRelicReporting','2.0.1','2.0.1'),('Magento_Newsletter','2.0.0','2.0.0'),('Magento_OfflinePayments','2.0.0','2.0.0'),('Magento_OfflineShipping','2.0.1','2.0.1'),('Magento_PageCache','2.0.0','2.0.0'),('Magento_Payment','2.0.0','2.0.0'),('Magento_Paypal','2.0.1','2.0.1'),('Magento_Persistent','2.0.0','2.0.0'),('Magento_ProductAlert','2.0.0','2.0.0'),('Magento_ProductVideo','2.0.0.2','2.0.0.2'),('Magento_Quote','2.0.6','2.0.6'),('Magento_Reports','2.0.0','2.0.0'),('Magento_RequireJs','2.0.0','2.0.0'),('Magento_Review','2.0.0','2.0.0'),('Magento_Robots','2.0.0','2.0.0'),('Magento_Rss','2.0.0','2.0.0'),('Magento_Rule','2.0.0','2.0.0'),('Magento_Sales','2.0.7','2.0.7'),('Magento_SalesInventory','1.0.0','1.0.0'),('Magento_SalesRule','2.0.3','2.0.3'),('Magento_SalesSequence','2.0.0','2.0.0'),('Magento_SampleData','2.0.0','2.0.0'),('Magento_Search','2.0.4','2.0.4'),('Magento_Security','2.0.1','2.0.1'),('Magento_SendFriend','2.0.0','2.0.0'),('Magento_Shipping','2.0.0','2.0.0'),('Magento_Sitemap','2.0.0','2.0.0'),('Magento_Store','2.1.0','2.1.0'),('Magento_Swagger','2.0.0','2.0.0'),('Magento_Swatches','2.0.3','2.0.3'),('Magento_SwatchesLayeredNavigation','2.0.0','2.0.0'),('Magento_Tax','2.0.2','2.0.2'),('Magento_TaxImportExport','2.0.0','2.0.0'),('Magento_Theme','2.0.2','2.0.2'),('Magento_Translation','2.0.0','2.0.0'),('Magento_Ui','2.0.0','2.0.0'),('Magento_Ups','2.0.0','2.0.0'),('Magento_UrlRewrite','2.0.1','2.0.1'),('Magento_User','2.0.3','2.0.3'),('Magento_Usps','2.0.1','2.0.1'),('Magento_Variable','2.0.0','2.0.0'),('Magento_Vault','2.0.2','2.0.2'),('Magento_Version','2.0.0','2.0.0'),('Magento_Webapi','2.0.0','2.0.0'),('Magento_WebapiSecurity','2.0.0','2.0.0'),('Magento_Weee','2.0.0','2.0.0'),('Magento_Widget','2.0.1','2.0.1'),('Magento_Wishlist','2.0.1','2.0.1'),('Shopial_Facebook','1.0.0','1.0.0'),('Techievolve_Banners','1.0.0','1.0.0'),('Techievolve_Core','1.0.0','1.0.0'),('Techievolve_Csvape','1.0.0','1.0.0');
/*!40000 ALTER TABLE `csvp_setup_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_shipping_tablerate`
--

DROP TABLE IF EXISTS `csvp_shipping_tablerate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_shipping_tablerate` (
  `pk` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary key',
  `website_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Website Id',
  `dest_country_id` varchar(4) NOT NULL DEFAULT '0' COMMENT 'Destination coutry ISO/2 or ISO/3 code',
  `dest_region_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Destination Region Id',
  `dest_zip` varchar(10) NOT NULL DEFAULT '*' COMMENT 'Destination Post Code (Zip)',
  `condition_name` varchar(20) NOT NULL COMMENT 'Rate Condition name',
  `condition_value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Rate condition value',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  `cost` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Cost',
  PRIMARY KEY (`pk`),
  UNIQUE KEY `UNQ_7B2500D04FB814429BAF3BE88FCCBF1D` (`website_id`,`dest_country_id`,`dest_region_id`,`dest_zip`,`condition_name`,`condition_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Shipping Tablerate';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_shipping_tablerate`
--

LOCK TABLES `csvp_shipping_tablerate` WRITE;
/*!40000 ALTER TABLE `csvp_shipping_tablerate` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_shipping_tablerate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_sitemap`
--

DROP TABLE IF EXISTS `csvp_sitemap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_sitemap` (
  `sitemap_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Sitemap Id',
  `sitemap_type` varchar(32) DEFAULT NULL COMMENT 'Sitemap Type',
  `sitemap_filename` varchar(32) DEFAULT NULL COMMENT 'Sitemap Filename',
  `sitemap_path` varchar(255) DEFAULT NULL COMMENT 'Sitemap Path',
  `sitemap_time` timestamp NULL DEFAULT NULL COMMENT 'Sitemap Time',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store id',
  PRIMARY KEY (`sitemap_id`),
  KEY `CSVP_SITEMAP_STORE_ID` (`store_id`),
  CONSTRAINT `CSVP_SITEMAP_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='XML Sitemap';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_sitemap`
--

LOCK TABLES `csvp_sitemap` WRITE;
/*!40000 ALTER TABLE `csvp_sitemap` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_sitemap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_store`
--

DROP TABLE IF EXISTS `csvp_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_store` (
  `store_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Store Id',
  `code` varchar(32) DEFAULT NULL COMMENT 'Code',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website Id',
  `group_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Group Id',
  `name` varchar(255) NOT NULL COMMENT 'Store Name',
  `sort_order` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Sort Order',
  `is_active` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Activity',
  PRIMARY KEY (`store_id`),
  UNIQUE KEY `CSVP_STORE_CODE` (`code`),
  KEY `CSVP_STORE_WEBSITE_ID` (`website_id`),
  KEY `CSVP_STORE_IS_ACTIVE_SORT_ORDER` (`is_active`,`sort_order`),
  KEY `CSVP_STORE_GROUP_ID` (`group_id`),
  CONSTRAINT `CSVP_STORE_GROUP_ID_STORE_GROUP_GROUP_ID` FOREIGN KEY (`group_id`) REFERENCES `csvp_store_group` (`group_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_STORE_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `csvp_store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Stores';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_store`
--

LOCK TABLES `csvp_store` WRITE;
/*!40000 ALTER TABLE `csvp_store` DISABLE KEYS */;
INSERT INTO `csvp_store` VALUES (0,'admin',0,0,'Admin',0,1),(1,'default',1,1,'Default Store View',0,1);
/*!40000 ALTER TABLE `csvp_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_store_group`
--

DROP TABLE IF EXISTS `csvp_store_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_store_group` (
  `group_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Group Id',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website Id',
  `code` varchar(32) DEFAULT NULL COMMENT 'Store group unique code',
  `name` varchar(255) NOT NULL COMMENT 'Store Group Name',
  `root_category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Root Category Id',
  `default_store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Default Store Id',
  PRIMARY KEY (`group_id`),
  UNIQUE KEY `CSVP_STORE_GROUP_CODE` (`code`),
  KEY `CSVP_STORE_GROUP_WEBSITE_ID` (`website_id`),
  KEY `CSVP_STORE_GROUP_DEFAULT_STORE_ID` (`default_store_id`),
  CONSTRAINT `CSVP_STORE_GROUP_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `csvp_store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Store Groups';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_store_group`
--

LOCK TABLES `csvp_store_group` WRITE;
/*!40000 ALTER TABLE `csvp_store_group` DISABLE KEYS */;
INSERT INTO `csvp_store_group` VALUES (0,0,'default','Default',0,0),(1,1,'main_website_store','Main Website Store',2,1);
/*!40000 ALTER TABLE `csvp_store_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_store_website`
--

DROP TABLE IF EXISTS `csvp_store_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_store_website` (
  `website_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Website Id',
  `code` varchar(32) DEFAULT NULL COMMENT 'Code',
  `name` varchar(64) DEFAULT NULL COMMENT 'Website Name',
  `sort_order` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `default_group_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Default Group Id',
  `is_default` smallint(5) unsigned DEFAULT '0' COMMENT 'Defines Is Website Default',
  PRIMARY KEY (`website_id`),
  UNIQUE KEY `CSVP_STORE_WEBSITE_CODE` (`code`),
  KEY `CSVP_STORE_WEBSITE_SORT_ORDER` (`sort_order`),
  KEY `CSVP_STORE_WEBSITE_DEFAULT_GROUP_ID` (`default_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Websites';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_store_website`
--

LOCK TABLES `csvp_store_website` WRITE;
/*!40000 ALTER TABLE `csvp_store_website` DISABLE KEYS */;
INSERT INTO `csvp_store_website` VALUES (0,'admin','Admin',0,0,0),(1,'base','Main Website',0,1,1);
/*!40000 ALTER TABLE `csvp_store_website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_tax_calculation`
--

DROP TABLE IF EXISTS `csvp_tax_calculation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_tax_calculation` (
  `tax_calculation_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Tax Calculation Id',
  `tax_calculation_rate_id` int(11) NOT NULL COMMENT 'Tax Calculation Rate Id',
  `tax_calculation_rule_id` int(11) NOT NULL COMMENT 'Tax Calculation Rule Id',
  `customer_tax_class_id` smallint(6) NOT NULL COMMENT 'Customer Tax Class Id',
  `product_tax_class_id` smallint(6) NOT NULL COMMENT 'Product Tax Class Id',
  PRIMARY KEY (`tax_calculation_id`),
  KEY `CSVP_TAX_CALCULATION_TAX_CALCULATION_RULE_ID` (`tax_calculation_rule_id`),
  KEY `CSVP_TAX_CALCULATION_CUSTOMER_TAX_CLASS_ID` (`customer_tax_class_id`),
  KEY `CSVP_TAX_CALCULATION_PRODUCT_TAX_CLASS_ID` (`product_tax_class_id`),
  KEY `IDX_73E22555F07F7A52A41193ED5752B961` (`tax_calculation_rate_id`,`customer_tax_class_id`,`product_tax_class_id`),
  CONSTRAINT `CSVP_TAX_CALCULATION_CUSTOMER_TAX_CLASS_ID_TAX_CLASS_CLASS_ID` FOREIGN KEY (`customer_tax_class_id`) REFERENCES `csvp_tax_class` (`class_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_TAX_CALCULATION_PRODUCT_TAX_CLASS_ID_TAX_CLASS_CLASS_ID` FOREIGN KEY (`product_tax_class_id`) REFERENCES `csvp_tax_class` (`class_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_TAX_CALC_TAX_CALC_RATE_ID_TAX_CALC_RATE_TAX_CALC_RATE_ID` FOREIGN KEY (`tax_calculation_rate_id`) REFERENCES `csvp_tax_calculation_rate` (`tax_calculation_rate_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_TAX_CALC_TAX_CALC_RULE_ID_TAX_CALC_RULE_TAX_CALC_RULE_ID` FOREIGN KEY (`tax_calculation_rule_id`) REFERENCES `csvp_tax_calculation_rule` (`tax_calculation_rule_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tax Calculation';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_tax_calculation`
--

LOCK TABLES `csvp_tax_calculation` WRITE;
/*!40000 ALTER TABLE `csvp_tax_calculation` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_tax_calculation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_tax_calculation_rate`
--

DROP TABLE IF EXISTS `csvp_tax_calculation_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_tax_calculation_rate` (
  `tax_calculation_rate_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Tax Calculation Rate Id',
  `tax_country_id` varchar(2) NOT NULL COMMENT 'Tax Country Id',
  `tax_region_id` int(11) NOT NULL COMMENT 'Tax Region Id',
  `tax_postcode` varchar(21) DEFAULT NULL COMMENT 'Tax Postcode',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `rate` decimal(12,4) NOT NULL COMMENT 'Rate',
  `zip_is_range` smallint(6) DEFAULT NULL COMMENT 'Zip Is Range',
  `zip_from` int(10) unsigned DEFAULT NULL COMMENT 'Zip From',
  `zip_to` int(10) unsigned DEFAULT NULL COMMENT 'Zip To',
  PRIMARY KEY (`tax_calculation_rate_id`),
  KEY `CSVP_TAX_CALC_RATE_TAX_COUNTRY_ID_TAX_REGION_ID_TAX_POSTCODE` (`tax_country_id`,`tax_region_id`,`tax_postcode`),
  KEY `CSVP_TAX_CALCULATION_RATE_CODE` (`code`),
  KEY `IDX_D6E8F4219159EA41C9DD9C551839ECDC` (`tax_calculation_rate_id`,`tax_country_id`,`tax_region_id`,`zip_is_range`,`tax_postcode`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Tax Calculation Rate';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_tax_calculation_rate`
--

LOCK TABLES `csvp_tax_calculation_rate` WRITE;
/*!40000 ALTER TABLE `csvp_tax_calculation_rate` DISABLE KEYS */;
INSERT INTO `csvp_tax_calculation_rate` VALUES (1,'US',12,'*','US-CA-*-Rate 1',8.2500,NULL,NULL,NULL),(2,'US',43,'*','US-NY-*-Rate 1',8.3750,NULL,NULL,NULL);
/*!40000 ALTER TABLE `csvp_tax_calculation_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_tax_calculation_rate_title`
--

DROP TABLE IF EXISTS `csvp_tax_calculation_rate_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_tax_calculation_rate_title` (
  `tax_calculation_rate_title_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Tax Calculation Rate Title Id',
  `tax_calculation_rate_id` int(11) NOT NULL COMMENT 'Tax Calculation Rate Id',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  `value` varchar(255) NOT NULL COMMENT 'Value',
  PRIMARY KEY (`tax_calculation_rate_title_id`),
  KEY `CSVP_TAX_CALCULATION_RATE_TITLE_TAX_CALCULATION_RATE_ID_STORE_ID` (`tax_calculation_rate_id`,`store_id`),
  KEY `CSVP_TAX_CALCULATION_RATE_TITLE_STORE_ID` (`store_id`),
  CONSTRAINT `CSVP_TAX_CALCULATION_RATE_TITLE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_5AC6CE20A65ECF13CA220CE5FA036428` FOREIGN KEY (`tax_calculation_rate_id`) REFERENCES `csvp_tax_calculation_rate` (`tax_calculation_rate_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tax Calculation Rate Title';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_tax_calculation_rate_title`
--

LOCK TABLES `csvp_tax_calculation_rate_title` WRITE;
/*!40000 ALTER TABLE `csvp_tax_calculation_rate_title` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_tax_calculation_rate_title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_tax_calculation_rule`
--

DROP TABLE IF EXISTS `csvp_tax_calculation_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_tax_calculation_rule` (
  `tax_calculation_rule_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Tax Calculation Rule Id',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `priority` int(11) NOT NULL COMMENT 'Priority',
  `position` int(11) NOT NULL COMMENT 'Position',
  `calculate_subtotal` int(11) NOT NULL COMMENT 'Calculate off subtotal option',
  PRIMARY KEY (`tax_calculation_rule_id`),
  KEY `CSVP_TAX_CALCULATION_RULE_PRIORITY_POSITION` (`priority`,`position`),
  KEY `CSVP_TAX_CALCULATION_RULE_CODE` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tax Calculation Rule';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_tax_calculation_rule`
--

LOCK TABLES `csvp_tax_calculation_rule` WRITE;
/*!40000 ALTER TABLE `csvp_tax_calculation_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_tax_calculation_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_tax_class`
--

DROP TABLE IF EXISTS `csvp_tax_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_tax_class` (
  `class_id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT 'Class Id',
  `class_name` varchar(255) NOT NULL COMMENT 'Class Name',
  `class_type` varchar(8) NOT NULL DEFAULT 'CUSTOMER' COMMENT 'Class Type',
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Tax Class';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_tax_class`
--

LOCK TABLES `csvp_tax_class` WRITE;
/*!40000 ALTER TABLE `csvp_tax_class` DISABLE KEYS */;
INSERT INTO `csvp_tax_class` VALUES (2,'Taxable Goods','PRODUCT'),(3,'Retail Customer','CUSTOMER');
/*!40000 ALTER TABLE `csvp_tax_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_tax_order_aggregated_created`
--

DROP TABLE IF EXISTS `csvp_tax_order_aggregated_created`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_tax_order_aggregated_created` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `percent` float DEFAULT NULL COMMENT 'Percent',
  `orders_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `tax_base_amount_sum` float DEFAULT NULL COMMENT 'Tax Base Amount Sum',
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_6A1F5A22BBEC390D3EB9D8136CCE9E91` (`period`,`store_id`,`code`,`percent`,`order_status`),
  KEY `CSVP_TAX_ORDER_AGGREGATED_CREATED_STORE_ID` (`store_id`),
  CONSTRAINT `CSVP_TAX_ORDER_AGGREGATED_CREATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tax Order Aggregation';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_tax_order_aggregated_created`
--

LOCK TABLES `csvp_tax_order_aggregated_created` WRITE;
/*!40000 ALTER TABLE `csvp_tax_order_aggregated_created` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_tax_order_aggregated_created` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_tax_order_aggregated_updated`
--

DROP TABLE IF EXISTS `csvp_tax_order_aggregated_updated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_tax_order_aggregated_updated` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `percent` float DEFAULT NULL COMMENT 'Percent',
  `orders_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `tax_base_amount_sum` float DEFAULT NULL COMMENT 'Tax Base Amount Sum',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_F57730C379A1D39D20F9FD8AD3F1F37B` (`period`,`store_id`,`code`,`percent`,`order_status`),
  KEY `CSVP_TAX_ORDER_AGGREGATED_UPDATED_STORE_ID` (`store_id`),
  CONSTRAINT `CSVP_TAX_ORDER_AGGREGATED_UPDATED_STORE_ID_CSVP_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Csvp Tax Order Aggregated Updated';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_tax_order_aggregated_updated`
--

LOCK TABLES `csvp_tax_order_aggregated_updated` WRITE;
/*!40000 ALTER TABLE `csvp_tax_order_aggregated_updated` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_tax_order_aggregated_updated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_te_banners`
--

DROP TABLE IF EXISTS `csvp_te_banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_te_banners` (
  `banners_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `title` varchar(255) DEFAULT NULL COMMENT 'News Title',
  `status` smallint(6) DEFAULT '1' COMMENT 'Status',
  `content` mediumtext COMMENT 'Content',
  `url` mediumtext COMMENT 'URL',
  `image` text COMMENT 'Banner media path',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Created At',
  PRIMARY KEY (`banners_id`),
  KEY `CSVP_TE_BANNERS_CREATED_AT` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Banner Item';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_te_banners`
--

LOCK TABLES `csvp_te_banners` WRITE;
/*!40000 ALTER TABLE `csvp_te_banners` DISABLE KEYS */;
INSERT INTO `csvp_te_banners` VALUES (1,'Banner 1',1,NULL,NULL,'banner-1.jpg','2017-10-18 10:36:16'),(2,'Banner 2',1,NULL,NULL,'banner-2.jpg','2017-10-18 10:41:08'),(3,'Banner 3',1,NULL,NULL,'banner-3.jpg','2017-10-18 10:41:22'),(4,'Banner 4',1,NULL,NULL,'banner-2_1.jpg','2017-10-18 10:46:05');
/*!40000 ALTER TABLE `csvp_te_banners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_theme`
--

DROP TABLE IF EXISTS `csvp_theme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_theme` (
  `theme_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Theme identifier',
  `parent_id` int(11) DEFAULT NULL COMMENT 'Parent Id',
  `theme_path` varchar(255) DEFAULT NULL COMMENT 'Theme Path',
  `theme_title` varchar(255) NOT NULL COMMENT 'Theme Title',
  `preview_image` varchar(255) DEFAULT NULL COMMENT 'Preview Image',
  `is_featured` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Is Theme Featured',
  `area` varchar(255) NOT NULL COMMENT 'Theme Area',
  `type` smallint(6) NOT NULL COMMENT 'Theme type: 0:physical, 1:virtual, 2:staging',
  `code` text COMMENT 'Full theme code, including package',
  PRIMARY KEY (`theme_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Core theme';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_theme`
--

LOCK TABLES `csvp_theme` WRITE;
/*!40000 ALTER TABLE `csvp_theme` DISABLE KEYS */;
INSERT INTO `csvp_theme` VALUES (1,NULL,'Magento/blank','Magento Blank','preview_image_59e5a3f5a14e2.jpeg',0,'frontend',0,'Magento/blank'),(2,1,'Magento/luma','Magento Luma','preview_image_59e5a3f5d4f64.jpeg',0,'frontend',0,'Magento/luma'),(3,NULL,'Magento/backend','Magento 2 backend',NULL,0,'adminhtml',0,'Magento/backend'),(4,1,'Techievolve/csvape','Csvape',NULL,0,'frontend',0,'Techievolve/csvape');
/*!40000 ALTER TABLE `csvp_theme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_theme_file`
--

DROP TABLE IF EXISTS `csvp_theme_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_theme_file` (
  `theme_files_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Theme files identifier',
  `theme_id` int(10) unsigned NOT NULL COMMENT 'Theme Id',
  `file_path` varchar(255) DEFAULT NULL COMMENT 'Relative path to file',
  `file_type` varchar(32) NOT NULL COMMENT 'File Type',
  `content` longtext NOT NULL COMMENT 'File Content',
  `sort_order` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `is_temporary` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Is Temporary File',
  PRIMARY KEY (`theme_files_id`),
  KEY `CSVP_THEME_FILE_THEME_ID_THEME_THEME_ID` (`theme_id`),
  CONSTRAINT `CSVP_THEME_FILE_THEME_ID_THEME_THEME_ID` FOREIGN KEY (`theme_id`) REFERENCES `csvp_theme` (`theme_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Core theme files';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_theme_file`
--

LOCK TABLES `csvp_theme_file` WRITE;
/*!40000 ALTER TABLE `csvp_theme_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_theme_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_translation`
--

DROP TABLE IF EXISTS `csvp_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_translation` (
  `key_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Key Id of Translation',
  `string` varchar(255) NOT NULL DEFAULT 'Translate String' COMMENT 'Translation String',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `translate` varchar(255) DEFAULT NULL COMMENT 'Translate',
  `locale` varchar(20) NOT NULL DEFAULT 'en_US' COMMENT 'Locale',
  `crc_string` bigint(20) NOT NULL DEFAULT '1591228201' COMMENT 'Translation String CRC32 Hash',
  PRIMARY KEY (`key_id`),
  UNIQUE KEY `CSVP_TRANSLATION_STORE_ID_LOCALE_CRC_STRING_STRING` (`store_id`,`locale`,`crc_string`,`string`),
  CONSTRAINT `CSVP_TRANSLATION_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Translations';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_translation`
--

LOCK TABLES `csvp_translation` WRITE;
/*!40000 ALTER TABLE `csvp_translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_ui_bookmark`
--

DROP TABLE IF EXISTS `csvp_ui_bookmark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_ui_bookmark` (
  `bookmark_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Bookmark identifier',
  `user_id` int(10) unsigned NOT NULL COMMENT 'User Id',
  `namespace` varchar(255) NOT NULL COMMENT 'Bookmark namespace',
  `identifier` varchar(255) NOT NULL COMMENT 'Bookmark Identifier',
  `current` smallint(6) NOT NULL COMMENT 'Mark current bookmark per user and identifier',
  `title` varchar(255) DEFAULT NULL COMMENT 'Bookmark title',
  `config` longtext COMMENT 'Bookmark config',
  `created_at` datetime NOT NULL COMMENT 'Bookmark created at',
  `updated_at` datetime NOT NULL COMMENT 'Bookmark updated at',
  PRIMARY KEY (`bookmark_id`),
  KEY `CSVP_UI_BOOKMARK_USER_ID_NAMESPACE_IDENTIFIER` (`user_id`,`namespace`,`identifier`),
  CONSTRAINT `CSVP_UI_BOOKMARK_USER_ID_ADMIN_USER_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `csvp_admin_user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='Bookmark';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_ui_bookmark`
--

LOCK TABLES `csvp_ui_bookmark` WRITE;
/*!40000 ALTER TABLE `csvp_ui_bookmark` DISABLE KEYS */;
INSERT INTO `csvp_ui_bookmark` VALUES (1,1,'design_config_listing','default',1,'Default View','{\"views\":{\"default\":{\"label\":\"Default View\",\"index\":\"default\",\"editable\":false,\"data\":{\"columns\":{\"default\":{\"visible\":true,\"sorting\":false},\"store_website_id\":{\"visible\":true,\"sorting\":false},\"store_group_id\":{\"visible\":true,\"sorting\":false},\"store_id\":{\"visible\":true,\"sorting\":false},\"theme_theme_id\":{\"visible\":true,\"sorting\":false},\"actions\":{\"visible\":true,\"sorting\":false}},\"filters\":{\"applied\":{\"placeholder\":true}},\"displayMode\":\"grid\",\"paging\":{\"options\":{\"20\":{\"value\":20,\"label\":20},\"30\":{\"value\":30,\"label\":30},\"50\":{\"value\":50,\"label\":50},\"100\":{\"value\":100,\"label\":100},\"200\":{\"value\":200,\"label\":200}},\"value\":20},\"positions\":{\"default\":0,\"store_website_id\":1,\"store_group_id\":2,\"store_id\":3,\"actions\":4,\"theme_theme_id\":5}},\"value\":\"Default View\"}}}','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2,1,'design_config_listing','current',0,NULL,'{\"current\":{\"columns\":{\"default\":{\"visible\":true,\"sorting\":false},\"store_website_id\":{\"visible\":true,\"sorting\":false},\"store_group_id\":{\"visible\":true,\"sorting\":false},\"store_id\":{\"visible\":true,\"sorting\":false},\"theme_theme_id\":{\"visible\":true,\"sorting\":false},\"actions\":{\"visible\":true,\"sorting\":false}},\"filters\":{\"applied\":{\"placeholder\":true}},\"displayMode\":\"grid\",\"paging\":{\"options\":{\"20\":{\"value\":20,\"label\":20},\"30\":{\"value\":30,\"label\":30},\"50\":{\"value\":50,\"label\":50},\"100\":{\"value\":100,\"label\":100},\"200\":{\"value\":200,\"label\":200}},\"value\":20},\"positions\":{\"default\":0,\"store_website_id\":1,\"store_group_id\":2,\"store_id\":3,\"actions\":4,\"theme_theme_id\":5}}}','0000-00-00 00:00:00','0000-00-00 00:00:00'),(3,1,'cms_page_listing','default',1,'Default View','{\"views\":{\"default\":{\"label\":\"Default View\",\"index\":\"default\",\"editable\":false,\"data\":{\"columns\":{\"page_id\":{\"visible\":true,\"sorting\":\"asc\"},\"title\":{\"visible\":true,\"sorting\":false},\"identifier\":{\"visible\":true,\"sorting\":false},\"store_id\":{\"visible\":true,\"sorting\":false},\"meta_title\":{\"visible\":false,\"sorting\":false},\"meta_keywords\":{\"visible\":false,\"sorting\":false},\"meta_description\":{\"visible\":false,\"sorting\":false},\"page_layout\":{\"visible\":true,\"sorting\":false},\"is_active\":{\"visible\":true,\"sorting\":false},\"custom_theme\":{\"visible\":false,\"sorting\":false},\"custom_root_template\":{\"visible\":false,\"sorting\":false},\"ids\":{\"visible\":true,\"sorting\":false},\"actions\":{\"visible\":true,\"sorting\":false},\"creation_time\":{\"visible\":true,\"sorting\":false},\"update_time\":{\"visible\":true,\"sorting\":false},\"custom_theme_from\":{\"visible\":false,\"sorting\":false},\"custom_theme_to\":{\"visible\":false,\"sorting\":false}},\"displayMode\":\"grid\",\"positions\":{\"ids\":0,\"page_id\":1,\"title\":2,\"identifier\":3,\"page_layout\":4,\"store_id\":5,\"is_active\":6,\"creation_time\":7,\"update_time\":8,\"custom_theme_from\":9,\"custom_theme_to\":10,\"custom_theme\":11,\"custom_root_template\":12,\"meta_title\":13,\"meta_keywords\":14,\"meta_description\":15,\"actions\":16},\"filters\":{\"applied\":{\"placeholder\":true}},\"search\":{\"value\":\"\"},\"paging\":{\"options\":{\"20\":{\"value\":20,\"label\":20},\"30\":{\"value\":30,\"label\":30},\"50\":{\"value\":50,\"label\":50},\"100\":{\"value\":100,\"label\":100},\"200\":{\"value\":200,\"label\":200}},\"value\":20}},\"value\":\"Default View\"}}}','0000-00-00 00:00:00','0000-00-00 00:00:00'),(4,1,'cms_page_listing','current',0,NULL,'{\"current\":{\"columns\":{\"page_id\":{\"visible\":true,\"sorting\":\"asc\"},\"title\":{\"visible\":true,\"sorting\":false},\"identifier\":{\"visible\":true,\"sorting\":false},\"store_id\":{\"visible\":true,\"sorting\":false},\"meta_title\":{\"visible\":false,\"sorting\":false},\"meta_keywords\":{\"visible\":false,\"sorting\":false},\"meta_description\":{\"visible\":false,\"sorting\":false},\"page_layout\":{\"visible\":true,\"sorting\":false},\"is_active\":{\"visible\":true,\"sorting\":false},\"custom_theme\":{\"visible\":false,\"sorting\":false},\"custom_root_template\":{\"visible\":false,\"sorting\":false},\"ids\":{\"visible\":true,\"sorting\":false},\"actions\":{\"visible\":true,\"sorting\":false},\"creation_time\":{\"visible\":true,\"sorting\":false},\"update_time\":{\"visible\":true,\"sorting\":false},\"custom_theme_from\":{\"visible\":false,\"sorting\":false},\"custom_theme_to\":{\"visible\":false,\"sorting\":false}},\"displayMode\":\"grid\",\"positions\":{\"ids\":0,\"page_id\":1,\"title\":2,\"identifier\":3,\"page_layout\":4,\"store_id\":5,\"is_active\":6,\"creation_time\":7,\"update_time\":8,\"custom_theme_from\":9,\"custom_theme_to\":10,\"custom_theme\":11,\"custom_root_template\":12,\"meta_title\":13,\"meta_keywords\":14,\"meta_description\":15,\"actions\":16},\"filters\":{\"applied\":{\"placeholder\":true}},\"search\":{\"value\":\"\"},\"paging\":{\"options\":{\"20\":{\"value\":20,\"label\":20},\"30\":{\"value\":30,\"label\":30},\"50\":{\"value\":50,\"label\":50},\"100\":{\"value\":100,\"label\":100},\"200\":{\"value\":200,\"label\":200}},\"value\":20}}}','0000-00-00 00:00:00','0000-00-00 00:00:00'),(5,1,'cms_block_listing','default',1,'Default View','{\"views\":{\"default\":{\"label\":\"Default View\",\"index\":\"default\",\"editable\":false,\"data\":{\"search\":{\"value\":\"\"},\"columns\":{\"block_id\":{\"visible\":true,\"sorting\":\"asc\"},\"title\":{\"visible\":true,\"sorting\":false},\"identifier\":{\"visible\":true,\"sorting\":false},\"store_id\":{\"visible\":true,\"sorting\":false},\"ids\":{\"visible\":true,\"sorting\":false},\"is_active\":{\"visible\":true,\"sorting\":false},\"creation_time\":{\"visible\":true,\"sorting\":false},\"update_time\":{\"visible\":true,\"sorting\":false},\"actions\":{\"visible\":true,\"sorting\":false}},\"filters\":{\"applied\":{\"placeholder\":true}},\"displayMode\":\"grid\",\"paging\":{\"options\":{\"20\":{\"value\":20,\"label\":20},\"30\":{\"value\":30,\"label\":30},\"50\":{\"value\":50,\"label\":50},\"100\":{\"value\":100,\"label\":100},\"200\":{\"value\":200,\"label\":200}},\"value\":20},\"positions\":{\"ids\":0,\"block_id\":1,\"title\":2,\"identifier\":3,\"store_id\":4,\"is_active\":5,\"creation_time\":6,\"update_time\":7,\"actions\":8}},\"value\":\"Default View\"}}}','0000-00-00 00:00:00','0000-00-00 00:00:00'),(6,1,'cms_block_listing','current',0,NULL,'{\"current\":{\"search\":{\"value\":\"\"},\"columns\":{\"block_id\":{\"visible\":true,\"sorting\":\"asc\"},\"title\":{\"visible\":true,\"sorting\":false},\"identifier\":{\"visible\":true,\"sorting\":false},\"store_id\":{\"visible\":true,\"sorting\":false},\"ids\":{\"visible\":true,\"sorting\":false},\"is_active\":{\"visible\":true,\"sorting\":false},\"creation_time\":{\"visible\":true,\"sorting\":false},\"update_time\":{\"visible\":true,\"sorting\":false},\"actions\":{\"visible\":true,\"sorting\":false}},\"filters\":{\"applied\":{\"placeholder\":true}},\"displayMode\":\"grid\",\"paging\":{\"options\":{\"20\":{\"value\":20,\"label\":20},\"30\":{\"value\":30,\"label\":30},\"50\":{\"value\":50,\"label\":50},\"100\":{\"value\":100,\"label\":100},\"200\":{\"value\":200,\"label\":200}},\"value\":20},\"positions\":{\"ids\":0,\"block_id\":1,\"title\":2,\"identifier\":3,\"store_id\":4,\"is_active\":5,\"creation_time\":6,\"update_time\":7,\"actions\":8}}}','0000-00-00 00:00:00','0000-00-00 00:00:00'),(7,2,'cms_block_listing','default',1,'Default View','{\"views\":{\"default\":{\"label\":\"Default View\",\"index\":\"default\",\"editable\":false,\"data\":{\"search\":{\"value\":\"\"},\"filters\":{\"applied\":{\"placeholder\":true}},\"columns\":{\"block_id\":{\"visible\":true,\"sorting\":\"asc\"},\"title\":{\"visible\":true,\"sorting\":false},\"identifier\":{\"visible\":true,\"sorting\":false},\"store_id\":{\"visible\":true,\"sorting\":false},\"is_active\":{\"visible\":true,\"sorting\":false},\"ids\":{\"visible\":true,\"sorting\":false},\"creation_time\":{\"visible\":true,\"sorting\":false},\"update_time\":{\"visible\":true,\"sorting\":false},\"actions\":{\"visible\":true,\"sorting\":false}},\"displayMode\":\"grid\",\"paging\":{\"options\":{\"20\":{\"value\":20,\"label\":20},\"30\":{\"value\":30,\"label\":30},\"50\":{\"value\":50,\"label\":50},\"100\":{\"value\":100,\"label\":100},\"200\":{\"value\":200,\"label\":200}},\"value\":20},\"positions\":{\"ids\":0,\"block_id\":1,\"title\":2,\"identifier\":3,\"store_id\":4,\"is_active\":5,\"creation_time\":6,\"update_time\":7,\"actions\":8}},\"value\":\"Default View\"}}}','0000-00-00 00:00:00','0000-00-00 00:00:00'),(8,2,'cms_block_listing','current',0,NULL,'{\"current\":{\"search\":{\"value\":\"\"},\"filters\":{\"applied\":{\"placeholder\":true}},\"columns\":{\"block_id\":{\"visible\":true,\"sorting\":\"asc\"},\"title\":{\"visible\":true,\"sorting\":false},\"identifier\":{\"visible\":true,\"sorting\":false},\"store_id\":{\"visible\":true,\"sorting\":false},\"is_active\":{\"visible\":true,\"sorting\":false},\"ids\":{\"visible\":true,\"sorting\":false},\"creation_time\":{\"visible\":true,\"sorting\":false},\"update_time\":{\"visible\":true,\"sorting\":false},\"actions\":{\"visible\":true,\"sorting\":false}},\"displayMode\":\"grid\",\"paging\":{\"options\":{\"20\":{\"value\":20,\"label\":20},\"30\":{\"value\":30,\"label\":30},\"50\":{\"value\":50,\"label\":50},\"100\":{\"value\":100,\"label\":100},\"200\":{\"value\":200,\"label\":200}},\"value\":20},\"positions\":{\"ids\":0,\"block_id\":1,\"title\":2,\"identifier\":3,\"store_id\":4,\"is_active\":5,\"creation_time\":6,\"update_time\":7,\"actions\":8}}}','0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `csvp_ui_bookmark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_url_rewrite`
--

DROP TABLE IF EXISTS `csvp_url_rewrite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_url_rewrite` (
  `url_rewrite_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rewrite Id',
  `entity_type` varchar(32) NOT NULL COMMENT 'Entity type code',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `request_path` varchar(255) DEFAULT NULL COMMENT 'Request Path',
  `target_path` varchar(255) DEFAULT NULL COMMENT 'Target Path',
  `redirect_type` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Redirect Type',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  `description` varchar(255) DEFAULT NULL COMMENT 'Description',
  `is_autogenerated` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is rewrite generated automatically flag',
  `metadata` varchar(255) DEFAULT NULL COMMENT 'Meta data for url rewrite',
  PRIMARY KEY (`url_rewrite_id`),
  UNIQUE KEY `CSVP_URL_REWRITE_REQUEST_PATH_STORE_ID` (`request_path`,`store_id`),
  KEY `CSVP_URL_REWRITE_TARGET_PATH` (`target_path`),
  KEY `CSVP_URL_REWRITE_STORE_ID_ENTITY_ID` (`store_id`,`entity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Url Rewrites';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_url_rewrite`
--

LOCK TABLES `csvp_url_rewrite` WRITE;
/*!40000 ALTER TABLE `csvp_url_rewrite` DISABLE KEYS */;
INSERT INTO `csvp_url_rewrite` VALUES (1,'cms-page',1,'no-route','cms/page/view/page_id/1',0,1,NULL,1,NULL),(2,'cms-page',2,'home','cms/page/view/page_id/2',0,1,NULL,1,NULL),(3,'cms-page',3,'enable-cookies','cms/page/view/page_id/3',0,1,NULL,1,NULL),(4,'cms-page',4,'privacy-policy-cookie-restriction-mode','cms/page/view/page_id/4',0,1,NULL,1,NULL);
/*!40000 ALTER TABLE `csvp_url_rewrite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_variable`
--

DROP TABLE IF EXISTS `csvp_variable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_variable` (
  `variable_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Variable Id',
  `code` varchar(255) DEFAULT NULL COMMENT 'Variable Code',
  `name` varchar(255) DEFAULT NULL COMMENT 'Variable Name',
  PRIMARY KEY (`variable_id`),
  UNIQUE KEY `CSVP_VARIABLE_CODE` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Variables';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_variable`
--

LOCK TABLES `csvp_variable` WRITE;
/*!40000 ALTER TABLE `csvp_variable` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_variable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_variable_value`
--

DROP TABLE IF EXISTS `csvp_variable_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_variable_value` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Variable Value Id',
  `variable_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Variable Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `plain_value` text COMMENT 'Plain Text Value',
  `html_value` text COMMENT 'Html Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CSVP_VARIABLE_VALUE_VARIABLE_ID_STORE_ID` (`variable_id`,`store_id`),
  KEY `CSVP_VARIABLE_VALUE_STORE_ID` (`store_id`),
  CONSTRAINT `CSVP_VARIABLE_VALUE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_VARIABLE_VALUE_VARIABLE_ID_VARIABLE_VARIABLE_ID` FOREIGN KEY (`variable_id`) REFERENCES `csvp_variable` (`variable_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Variable Value';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_variable_value`
--

LOCK TABLES `csvp_variable_value` WRITE;
/*!40000 ALTER TABLE `csvp_variable_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_variable_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_vault_payment_token`
--

DROP TABLE IF EXISTS `csvp_vault_payment_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_vault_payment_token` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  `public_hash` varchar(128) NOT NULL COMMENT 'Hash code for using on frontend',
  `payment_method_code` varchar(128) NOT NULL COMMENT 'Payment method code',
  `type` varchar(128) NOT NULL COMMENT 'Type',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `expires_at` timestamp NULL DEFAULT NULL COMMENT 'Expires At',
  `gateway_token` varchar(255) NOT NULL COMMENT 'Gateway Token',
  `details` text COMMENT 'Details',
  `is_active` tinyint(1) NOT NULL COMMENT 'Is active flag',
  `is_visible` tinyint(1) NOT NULL COMMENT 'Is visible flag',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `CSVP_VAULT_PAYMENT_TOKEN_HASH_UNIQUE_INDEX_PUBLIC_HASH` (`public_hash`),
  UNIQUE KEY `UNQ_A1536FA18569A3E23058976BF51D07AF` (`payment_method_code`,`customer_id`,`gateway_token`),
  KEY `CSVP_VAULT_PAYMENT_TOKEN_CSTR_ID_CSVP_CSTR_ENTT_ENTT_ID` (`customer_id`),
  CONSTRAINT `CSVP_VAULT_PAYMENT_TOKEN_CSTR_ID_CSVP_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `csvp_customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Vault tokens of payment';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_vault_payment_token`
--

LOCK TABLES `csvp_vault_payment_token` WRITE;
/*!40000 ALTER TABLE `csvp_vault_payment_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_vault_payment_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_vault_payment_token_order_payment_link`
--

DROP TABLE IF EXISTS `csvp_vault_payment_token_order_payment_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_vault_payment_token_order_payment_link` (
  `order_payment_id` int(10) unsigned NOT NULL COMMENT 'Order payment Id',
  `payment_token_id` int(10) unsigned NOT NULL COMMENT 'Payment token Id',
  PRIMARY KEY (`order_payment_id`,`payment_token_id`),
  KEY `FK_4142621455FD323E1A9DF2274217BBB5` (`payment_token_id`),
  CONSTRAINT `FK_4142621455FD323E1A9DF2274217BBB5` FOREIGN KEY (`payment_token_id`) REFERENCES `csvp_vault_payment_token` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_563C172FF4918B59469D23F5DFA4D3A9` FOREIGN KEY (`order_payment_id`) REFERENCES `csvp_sales_order_payment` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Order payments to vault token';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_vault_payment_token_order_payment_link`
--

LOCK TABLES `csvp_vault_payment_token_order_payment_link` WRITE;
/*!40000 ALTER TABLE `csvp_vault_payment_token_order_payment_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_vault_payment_token_order_payment_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_weee_tax`
--

DROP TABLE IF EXISTS `csvp_weee_tax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_weee_tax` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `country` varchar(2) DEFAULT NULL COMMENT 'Country',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Value',
  `state` int(11) NOT NULL DEFAULT '0' COMMENT 'State',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute Id',
  PRIMARY KEY (`value_id`),
  KEY `CSVP_WEEE_TAX_WEBSITE_ID` (`website_id`),
  KEY `CSVP_WEEE_TAX_ENTITY_ID` (`entity_id`),
  KEY `CSVP_WEEE_TAX_COUNTRY` (`country`),
  KEY `CSVP_WEEE_TAX_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `CSVP_WEEE_TAX_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `csvp_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_WEEE_TAX_COUNTRY_DIRECTORY_COUNTRY_COUNTRY_ID` FOREIGN KEY (`country`) REFERENCES `csvp_directory_country` (`country_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_WEEE_TAX_ENTITY_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `csvp_catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_WEEE_TAX_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `csvp_store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Weee Tax';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_weee_tax`
--

LOCK TABLES `csvp_weee_tax` WRITE;
/*!40000 ALTER TABLE `csvp_weee_tax` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_weee_tax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_widget`
--

DROP TABLE IF EXISTS `csvp_widget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_widget` (
  `widget_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Widget Id',
  `widget_code` varchar(255) DEFAULT NULL COMMENT 'Widget code for template directive',
  `widget_type` varchar(255) DEFAULT NULL COMMENT 'Widget Type',
  `parameters` text COMMENT 'Parameters',
  PRIMARY KEY (`widget_id`),
  KEY `CSVP_WIDGET_WIDGET_CODE` (`widget_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Preconfigured Widgets';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_widget`
--

LOCK TABLES `csvp_widget` WRITE;
/*!40000 ALTER TABLE `csvp_widget` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_widget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_widget_instance`
--

DROP TABLE IF EXISTS `csvp_widget_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_widget_instance` (
  `instance_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Instance Id',
  `instance_type` varchar(255) DEFAULT NULL COMMENT 'Instance Type',
  `theme_id` int(10) unsigned NOT NULL COMMENT 'Theme id',
  `title` varchar(255) DEFAULT NULL COMMENT 'Widget Title',
  `store_ids` varchar(255) NOT NULL DEFAULT '0' COMMENT 'Store ids',
  `widget_parameters` text COMMENT 'Widget parameters',
  `sort_order` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort order',
  PRIMARY KEY (`instance_id`),
  KEY `CSVP_WIDGET_INSTANCE_THEME_ID_THEME_THEME_ID` (`theme_id`),
  CONSTRAINT `CSVP_WIDGET_INSTANCE_THEME_ID_THEME_THEME_ID` FOREIGN KEY (`theme_id`) REFERENCES `csvp_theme` (`theme_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Instances of Widget for Package Theme';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_widget_instance`
--

LOCK TABLES `csvp_widget_instance` WRITE;
/*!40000 ALTER TABLE `csvp_widget_instance` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_widget_instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_widget_instance_page`
--

DROP TABLE IF EXISTS `csvp_widget_instance_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_widget_instance_page` (
  `page_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Page Id',
  `instance_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Instance Id',
  `page_group` varchar(25) DEFAULT NULL COMMENT 'Block Group Type',
  `layout_handle` varchar(255) DEFAULT NULL COMMENT 'Layout Handle',
  `block_reference` varchar(255) DEFAULT NULL COMMENT 'Container',
  `page_for` varchar(25) DEFAULT NULL COMMENT 'For instance entities',
  `entities` text COMMENT 'Catalog entities (comma separated)',
  `page_template` varchar(255) DEFAULT NULL COMMENT 'Path to widget template',
  PRIMARY KEY (`page_id`),
  KEY `CSVP_WIDGET_INSTANCE_PAGE_INSTANCE_ID` (`instance_id`),
  CONSTRAINT `FK_92085B91CD292DFBEF56A170143E3209` FOREIGN KEY (`instance_id`) REFERENCES `csvp_widget_instance` (`instance_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Instance of Widget on Page';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_widget_instance_page`
--

LOCK TABLES `csvp_widget_instance_page` WRITE;
/*!40000 ALTER TABLE `csvp_widget_instance_page` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_widget_instance_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_widget_instance_page_layout`
--

DROP TABLE IF EXISTS `csvp_widget_instance_page_layout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_widget_instance_page_layout` (
  `page_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Page Id',
  `layout_update_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Layout Update Id',
  UNIQUE KEY `CSVP_WIDGET_INSTANCE_PAGE_LAYOUT_LAYOUT_UPDATE_ID_PAGE_ID` (`layout_update_id`,`page_id`),
  KEY `CSVP_WIDGET_INSTANCE_PAGE_LAYOUT_PAGE_ID` (`page_id`),
  CONSTRAINT `FK_6FBB79B7E19967D840DEF2FC14E88C90` FOREIGN KEY (`page_id`) REFERENCES `csvp_widget_instance_page` (`page_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_AC0B808D46286EFEF4D2EA389133E1E2` FOREIGN KEY (`layout_update_id`) REFERENCES `csvp_layout_update` (`layout_update_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Layout updates';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_widget_instance_page_layout`
--

LOCK TABLES `csvp_widget_instance_page_layout` WRITE;
/*!40000 ALTER TABLE `csvp_widget_instance_page_layout` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_widget_instance_page_layout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_wishlist`
--

DROP TABLE IF EXISTS `csvp_wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_wishlist` (
  `wishlist_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Wishlist ID',
  `customer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer ID',
  `shared` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Sharing flag (0 or 1)',
  `sharing_code` varchar(32) DEFAULT NULL COMMENT 'Sharing encrypted code',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Last updated date',
  PRIMARY KEY (`wishlist_id`),
  UNIQUE KEY `CSVP_WISHLIST_CUSTOMER_ID` (`customer_id`),
  KEY `CSVP_WISHLIST_SHARED` (`shared`),
  CONSTRAINT `CSVP_WISHLIST_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `csvp_customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Wishlist main Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_wishlist`
--

LOCK TABLES `csvp_wishlist` WRITE;
/*!40000 ALTER TABLE `csvp_wishlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_wishlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_wishlist_item`
--

DROP TABLE IF EXISTS `csvp_wishlist_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_wishlist_item` (
  `wishlist_item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Wishlist item ID',
  `wishlist_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Wishlist ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store ID',
  `added_at` timestamp NULL DEFAULT NULL COMMENT 'Add date and time',
  `description` text COMMENT 'Short description of wish list item',
  `qty` decimal(12,4) NOT NULL COMMENT 'Qty',
  PRIMARY KEY (`wishlist_item_id`),
  KEY `CSVP_WISHLIST_ITEM_WISHLIST_ID` (`wishlist_id`),
  KEY `CSVP_WISHLIST_ITEM_PRODUCT_ID` (`product_id`),
  KEY `CSVP_WISHLIST_ITEM_STORE_ID` (`store_id`),
  CONSTRAINT `CSVP_WISHLIST_ITEM_PRODUCT_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID` FOREIGN KEY (`product_id`) REFERENCES `csvp_catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CSVP_WISHLIST_ITEM_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `csvp_store` (`store_id`) ON DELETE SET NULL,
  CONSTRAINT `CSVP_WISHLIST_ITEM_WISHLIST_ID_WISHLIST_WISHLIST_ID` FOREIGN KEY (`wishlist_id`) REFERENCES `csvp_wishlist` (`wishlist_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Wishlist items';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_wishlist_item`
--

LOCK TABLES `csvp_wishlist_item` WRITE;
/*!40000 ALTER TABLE `csvp_wishlist_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_wishlist_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvp_wishlist_item_option`
--

DROP TABLE IF EXISTS `csvp_wishlist_item_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvp_wishlist_item_option` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Id',
  `wishlist_item_id` int(10) unsigned NOT NULL COMMENT 'Wishlist Item Id',
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `value` text COMMENT 'Value',
  PRIMARY KEY (`option_id`),
  KEY `FK_CC7AD2275C464C377FD43D7A24575BD2` (`wishlist_item_id`),
  CONSTRAINT `FK_CC7AD2275C464C377FD43D7A24575BD2` FOREIGN KEY (`wishlist_item_id`) REFERENCES `csvp_wishlist_item` (`wishlist_item_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Wishlist Item Option Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvp_wishlist_item_option`
--

LOCK TABLES `csvp_wishlist_item_option` WRITE;
/*!40000 ALTER TABLE `csvp_wishlist_item_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvp_wishlist_item_option` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-18 18:09:46
