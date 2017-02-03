-- MySQL dump 10.13  Distrib 5.7.13, for linux-glibc2.5 (x86_64)
--
-- Host: localhost    Database: blog
-- ------------------------------------------------------
-- Server version	5.7.17-0ubuntu0.16.04.1

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
-- Table structure for table `actions`
--

DROP TABLE IF EXISTS `actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `actionable_id` int(11) DEFAULT NULL,
  `actionable_type` varchar(255) DEFAULT NULL,
  `type_act` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actions`
--

LOCK TABLES `actions` WRITE;
/*!40000 ALTER TABLE `actions` DISABLE KEYS */;
INSERT INTO `actions` VALUES (11,11,5,'Comment',1),(12,11,4,'Comment',1),(13,11,7,'Comment',1),(14,11,2,'Topic',4);
/*!40000 ALTER TABLE `actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `answers`
--

DROP TABLE IF EXISTS `answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `reply_to` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `up_vote` int(11) DEFAULT NULL,
  `down_vote` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answers`
--

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
INSERT INTO `answers` VALUES (1,'<p>asdasd</p>\r\n<p>wefregth</p>asdsdsdasd',1,11,NULL,NULL,'2017-02-02 01:42:17','2017-02-02 09:32:10'),(2,'<p>asdgtrhr</p>',1,11,NULL,NULL,'2017-02-02 01:50:19','2017-02-02 01:50:19'),(3,'<p>dsefgerhrtjhyt</p>',1,11,NULL,NULL,'2017-02-02 06:37:23','2017-02-02 06:37:23'),(4,'<p>because it very fun</p>',4,11,NULL,NULL,'2017-02-03 03:50:47','2017-02-03 03:50:47');
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ar_internal_metadata`
--

DROP TABLE IF EXISTS `ar_internal_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ar_internal_metadata`
--

LOCK TABLES `ar_internal_metadata` WRITE;
/*!40000 ALTER TABLE `ar_internal_metadata` DISABLE KEYS */;
INSERT INTO `ar_internal_metadata` VALUES ('environment','development','2017-02-02 01:24:28','2017-02-02 01:24:28');
/*!40000 ALTER TABLE `ar_internal_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ckeditor_assets`
--

DROP TABLE IF EXISTS `ckeditor_assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ckeditor_assets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_file_name` varchar(255) NOT NULL,
  `data_content_type` varchar(255) DEFAULT NULL,
  `data_file_size` int(11) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_ckeditor_assets_on_type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ckeditor_assets`
--

LOCK TABLES `ckeditor_assets` WRITE;
/*!40000 ALTER TABLE `ckeditor_assets` DISABLE KEYS */;
/*!40000 ALTER TABLE `ckeditor_assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `commentable_id` int(11) DEFAULT NULL,
  `commentable_type` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `up_vote` int(11) DEFAULT NULL,
  `down_vote` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,'sdasdasfrh',2,'Answer',11,0,0,'2017-02-02 01:50:39','2017-02-02 01:50:39'),(2,'sdfgtrhysdfsdfsd',2,'Answer',11,2,0,'2017-02-02 01:50:40','2017-02-02 08:50:40'),(3,'ghjnfasdad',2,'Answer',11,0,0,'2017-02-02 01:50:42','2017-02-02 06:37:04'),(4,'ewfwef',2,'Answer',11,1,0,'2017-02-02 02:38:28','2017-02-02 06:37:11'),(5,'sdfrgrg',2,'Answer',11,1,0,'2017-02-02 06:37:07','2017-02-02 06:37:11'),(6,'dsfrgtr',1,'Answer',11,0,0,'2017-02-02 06:38:25','2017-02-02 06:38:25'),(7,'asdasdasdfr',1,'Question',11,1,0,'2017-02-02 08:06:24','2017-02-02 08:06:39');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `follows`
--

DROP TABLE IF EXISTS `follows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `follows` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `followable_id` int(11) DEFAULT NULL,
  `followable_type` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follows`
--

LOCK TABLES `follows` WRITE;
/*!40000 ALTER TABLE `follows` DISABLE KEYS */;
/*!40000 ALTER TABLE `follows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friendly_id_slugs`
--

DROP TABLE IF EXISTS `friendly_id_slugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friendly_id_slugs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) NOT NULL,
  `sluggable_id` int(11) NOT NULL,
  `sluggable_type` varchar(50) DEFAULT NULL,
  `scope` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope` (`slug`,`sluggable_type`,`scope`),
  KEY `index_friendly_id_slugs_on_sluggable_id` (`sluggable_id`),
  KEY `index_friendly_id_slugs_on_slug_and_sluggable_type` (`slug`,`sluggable_type`),
  KEY `index_friendly_id_slugs_on_sluggable_type` (`sluggable_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friendly_id_slugs`
--

LOCK TABLES `friendly_id_slugs` WRITE;
/*!40000 ALTER TABLE `friendly_id_slugs` DISABLE KEYS */;
/*!40000 ALTER TABLE `friendly_id_slugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_topics`
--

DROP TABLE IF EXISTS `question_topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_topics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) DEFAULT NULL,
  `topic_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_topics`
--

LOCK TABLES `question_topics` WRITE;
/*!40000 ALTER TABLE `question_topics` DISABLE KEYS */;
INSERT INTO `question_topics` VALUES (1,1,2,'2017-02-02 01:32:59','2017-02-02 01:32:59'),(2,1,3,'2017-02-02 01:32:59','2017-02-02 01:32:59'),(3,1,1,'2017-02-02 07:52:30','2017-02-02 07:52:30'),(4,2,1,'2017-02-02 09:33:21','2017-02-02 09:33:21'),(5,2,3,'2017-02-02 09:33:21','2017-02-02 09:33:21'),(6,3,1,'2017-02-02 09:33:48','2017-02-02 09:33:48'),(7,3,2,'2017-02-02 09:33:48','2017-02-02 09:33:48'),(8,4,2,'2017-02-03 03:49:18','2017-02-03 03:49:18'),(9,4,4,'2017-02-03 03:49:18','2017-02-03 03:49:18');
/*!40000 ALTER TABLE `question_topics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_users`
--

DROP TABLE IF EXISTS `question_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_users`
--

LOCK TABLES `question_users` WRITE;
/*!40000 ALTER TABLE `question_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `question_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `up_vote` int(11) DEFAULT NULL,
  `down_vote` int(11) DEFAULT NULL,
  `views` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,'title cua mot questiondfdrgefrg','<p>fdhyjgyjkuyjfr564646</p>\r\n',11,NULL,NULL,NULL,'2017-02-02 01:32:59','2017-02-02 07:54:46','title-cua-mot-question'),(2,'day la question thu 2','<p>qwrwergrthrth</p>\r\n',11,NULL,NULL,NULL,'2017-02-02 09:33:21','2017-02-02 09:33:21','day-la-question-thu-2'),(3,'day la question thu n','<p>day la content thu n</p>\r\n',11,NULL,NULL,NULL,'2017-02-02 09:33:48','2017-02-02 09:33:48','day-la-question-thu-n'),(4,'How does Quincy Larson make money?','<p>Specifically I am interested to know, if Free Code Camp is free, and Quincy Larson works 100% on Free Code Camp, then how does he support himself and his family?</p>\r\n',11,NULL,NULL,NULL,'2017-02-03 03:49:18','2017-02-03 03:49:18','how-does-quincy-larson-make-money');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20170118091248'),('20170118092010'),('20170118092845'),('20170118093551'),('20170118093638'),('20170118093655'),('20170118093707'),('20170118093811'),('20170118093952'),('20170119023346'),('20170119030646'),('20170123032152'),('20170123062510'),('20170125041026'),('20170126021457'),('20170126104945'),('20170128030252'),('20170128031556'),('20170130014501');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topics`
--

DROP TABLE IF EXISTS `topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topics`
--

LOCK TABLES `topics` WRITE;
/*!40000 ALTER TABLE `topics` DISABLE KEYS */;
INSERT INTO `topics` VALUES (1,'Scientic','Day la chuyen muc scientic','no-image-icon-13.png','scientic','2017-02-02 01:25:39','2017-02-02 01:25:39'),(2,'E commerce','Day la chuyen muc e commerce','no-image-icon-13.png','e-commerce','2017-02-02 01:25:39','2017-02-02 01:25:39'),(3,'Trending','Day la chuyen muc trending','no-image-icon-13.png','trending','2017-02-02 01:25:39','2017-02-02 01:25:39'),(4,'Architect','Day la chuyen muc architect','no-image-icon-13.png','architect','2017-02-02 01:25:39','2017-02-02 01:25:39');
/*!40000 ALTER TABLE `topics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_topics`
--

DROP TABLE IF EXISTS `user_topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_topics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `topic_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_topics`
--

LOCK TABLES `user_topics` WRITE;
/*!40000 ALTER TABLE `user_topics` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_topics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `email` varchar(255) NOT NULL DEFAULT '',
  `story` text,
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) DEFAULT NULL,
  `last_sign_in_ip` varchar(255) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `uid` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Jolie Stokes',NULL,'2017-02-02 01:25:38','2017-02-02 01:25:38','trevor@stoltenberg.biz',NULL,'$2a$11$qIO3jAhFo6KLrvg7GIwq3OIla7hy/8bqAalTrSbp/sgt5rHo4dGhS',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'jolie-stokes',1),(2,'Shannon Bergnaum',NULL,'2017-02-02 01:25:38','2017-02-02 01:25:38','emmett@toy.biz',NULL,'$2a$11$bwH0DP25Txao15ZiXW9/JOIrNXVLLrGIypnenXQ6tIggC3JUrqi5.',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'shannon-bergnaum',1),(3,'Karolann Legros',NULL,'2017-02-02 01:25:38','2017-02-02 01:25:38','marguerite_emmerich@prohaska.biz',NULL,'$2a$11$1qrOlGsbt81dg2abP0Xh8OaCA5t9s94ZkOnsvPhxDSF7QUnHQPf9C',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'karolann-legros',1),(4,'Mathias Hettinger V',NULL,'2017-02-02 01:25:38','2017-02-02 01:25:38','loren@sauerwunsch.co',NULL,'$2a$11$3HSzME5bbSigipcMOQ9w.ukDD5swne.4Fjg.QEG9i.HOXJw.lF2By',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'mathias-hettinger-v',1),(5,'Natalia Farrell',NULL,'2017-02-02 01:25:38','2017-02-02 01:25:38','giles.schamberger@johnstonfarrell.org',NULL,'$2a$11$mos55pU16.pXx2a6MIu6/.QJv02/3Fmx4gyvtWESvPpQf9JhP2jie',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'natalia-farrell',1),(6,'Carissa Reichert',NULL,'2017-02-02 01:25:39','2017-02-02 01:25:39','daphnee.oreilly@medhurstoconner.org',NULL,'$2a$11$LASmy51dhZ8ZvhvI3/IKOu/6Yg4I6TMRScPG0Df5UExUn1ahi6pWW',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'carissa-reichert',1),(7,'Athena Ruecker',NULL,'2017-02-02 01:25:39','2017-02-02 01:25:39','shanny@ritchie.info',NULL,'$2a$11$fTRqnB3lYGFwp128/kPrCu4/sFRQ/cno/6cKCjaxdVuqXdqj2yOCG',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'athena-ruecker',1),(8,'Giovanna Kulas',NULL,'2017-02-02 01:25:39','2017-02-02 01:25:39','manuela@thiel.name',NULL,'$2a$11$0Glf3V.feJz7G29bdHXi9OPeNj4alNrdStJYIE9Mc/Fn4OrOOV41S',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'giovanna-kulas',1),(9,'Miss Gerson Barrows',NULL,'2017-02-02 01:25:39','2017-02-02 01:25:39','bette_mcglynn@pollich.name',NULL,'$2a$11$94yt4QQvjfVve/YCrZ8ca.W3XyrqyezDXJ6fPD/Nk140CaeHlB/9q',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'miss-gerson-barrows',1),(10,'Charlotte Rogahn',NULL,'2017-02-02 01:25:39','2017-02-02 01:25:39','glenda.reinger@dach.biz',NULL,'$2a$11$g9VvXcHCHxTQulFm3bRIE.IGoXlK3WQewKAyVqSGyd7.yp.vyimPW',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'charlotte-rogahn',1),(11,'Phan Ngoc','images.jpg','2017-02-02 01:29:49','2017-02-03 07:02:52','phann123@yahoo.com','day la story cua Ngoc','$2a$11$MqOGQTF3ssTnf8KlJfaMN.L6a9RJBDQcy.htpyrpGhnwGNKLZybKO',NULL,NULL,'2017-02-03 03:43:30',2,'2017-02-03 03:43:30','2017-02-02 01:29:49','127.0.0.1','127.0.0.1',NULL,NULL,'phan-ngoc',1),(12,NULL,NULL,'2017-02-03 02:49:12','2017-02-03 02:49:12','tusss@gmail.com',NULL,'$2a$11$qfiHOalwaAWWyS0t1NfKuO65pqryTCTnaD6kv0uCs37pHi.DftFPm',NULL,NULL,NULL,1,'2017-02-03 02:49:12','2017-02-03 02:49:12','127.0.0.1','127.0.0.1',NULL,NULL,NULL,1),(13,'nhasdwe','spring-04.jpg','2017-02-03 02:54:49','2017-02-03 02:54:49','asdrg@dsf.asdf',NULL,'$2a$11$wmuq4S5Q5xJu674RqO7.Xe5DfFa6i4R0q295SX1XjOxs5XXpSGztq',NULL,NULL,NULL,1,'2017-02-03 02:54:49','2017-02-03 02:54:49','127.0.0.1','127.0.0.1',NULL,NULL,'nhasdwe',1),(14,'bombay','spring.jpg','2017-02-03 03:03:11','2017-02-03 03:21:09','leqsd@gmail.comsd','day la tieu su cua toi ne aeee','$2a$11$gHWhyOjpXvNJWzqKnwbdTesD87G0MSZV8UH0FRKeByvEz5xjIwSfC',NULL,NULL,NULL,1,'2017-02-03 03:03:11','2017-02-03 03:03:11','127.0.0.1','127.0.0.1',NULL,NULL,'bombay',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `version_answers`
--

DROP TABLE IF EXISTS `version_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `version_answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `answer_target` int(11) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `version_answers`
--

LOCK TABLES `version_answers` WRITE;
/*!40000 ALTER TABLE `version_answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `version_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `version_questions`
--

DROP TABLE IF EXISTS `version_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `version_questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `question_target` int(11) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `version_questions`
--

LOCK TABLES `version_questions` WRITE;
/*!40000 ALTER TABLE `version_questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `version_questions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-03 17:08:00
