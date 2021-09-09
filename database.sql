-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: testdb
-- ------------------------------------------------------
-- Server version	8.0.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add user',6,'add_user'),(22,'Can change user',6,'change_user'),(23,'Can delete user',6,'delete_user'),(24,'Can view user',6,'view_user'),(25,'Can add category',7,'add_category'),(26,'Can change category',7,'change_category'),(27,'Can delete category',7,'delete_category'),(28,'Can view category',7,'view_category'),(29,'Can add course',8,'add_course'),(30,'Can change course',8,'change_course'),(31,'Can delete course',8,'delete_course'),(32,'Can view course',8,'view_course'),(33,'Can add job',9,'add_job'),(34,'Can change job',9,'change_job'),(35,'Can delete job',9,'delete_job'),(36,'Can view job',9,'view_job'),(37,'Can add lesson',10,'add_lesson'),(38,'Can change lesson',10,'change_lesson'),(39,'Can delete lesson',10,'delete_lesson'),(40,'Can view lesson',10,'view_lesson'),(41,'Can add skill',11,'add_skill'),(42,'Can change skill',11,'change_skill'),(43,'Can delete skill',11,'delete_skill'),(44,'Can view skill',11,'view_skill'),(45,'Can add tag',12,'add_tag'),(46,'Can change tag',12,'change_tag'),(47,'Can delete tag',12,'delete_tag'),(48,'Can view tag',12,'view_tag'),(49,'Can add group chat',13,'add_groupchat'),(50,'Can change group chat',13,'change_groupchat'),(51,'Can delete group chat',13,'delete_groupchat'),(52,'Can view group chat',13,'view_groupchat'),(53,'Can add video',14,'add_video'),(54,'Can change video',14,'change_video'),(55,'Can delete video',14,'delete_video'),(56,'Can view video',14,'view_video'),(57,'Can add file',15,'add_file'),(58,'Can change file',15,'change_file'),(59,'Can delete file',15,'delete_file'),(60,'Can view file',15,'view_file'),(61,'Can add teacher',16,'add_teacher'),(62,'Can change teacher',16,'change_teacher'),(63,'Can delete teacher',16,'delete_teacher'),(64,'Can view teacher',16,'view_teacher'),(65,'Can add message',17,'add_message'),(66,'Can change message',17,'change_message'),(67,'Can delete message',17,'delete_message'),(68,'Can view message',17,'view_message'),(69,'Can add home work',18,'add_homework'),(70,'Can change home work',18,'change_homework'),(71,'Can delete home work',18,'delete_homework'),(72,'Can view home work',18,'view_homework'),(73,'Can add follow',19,'add_follow'),(74,'Can change follow',19,'change_follow'),(75,'Can delete follow',19,'delete_follow'),(76,'Can view follow',19,'view_follow'),(77,'Can add application',20,'add_application'),(78,'Can change application',20,'change_application'),(79,'Can delete application',20,'delete_application'),(80,'Can view application',20,'view_application'),(81,'Can add access token',21,'add_accesstoken'),(82,'Can change access token',21,'change_accesstoken'),(83,'Can delete access token',21,'delete_accesstoken'),(84,'Can view access token',21,'view_accesstoken'),(85,'Can add grant',22,'add_grant'),(86,'Can change grant',22,'change_grant'),(87,'Can delete grant',22,'delete_grant'),(88,'Can view grant',22,'view_grant'),(89,'Can add refresh token',23,'add_refreshtoken'),(90,'Can change refresh token',23,'change_refreshtoken'),(91,'Can delete refresh token',23,'delete_refreshtoken'),(92,'Can view refresh token',23,'view_refreshtoken'),(93,'Can add id token',24,'add_idtoken'),(94,'Can change id token',24,'change_idtoken'),(95,'Can delete id token',24,'delete_idtoken'),(96,'Can view id token',24,'view_idtoken'),(97,'Can add student_ course',25,'add_student_course'),(98,'Can change student_ course',25,'change_student_course'),(99,'Can delete student_ course',25,'delete_student_course'),(100,'Can view student_ course',25,'view_student_course');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_category`
--

DROP TABLE IF EXISTS `courses_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_category`
--

LOCK TABLES `courses_category` WRITE;
/*!40000 ALTER TABLE `courses_category` DISABLE KEYS */;
INSERT INTO `courses_category` VALUES (1,'English');
/*!40000 ALTER TABLE `courses_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_course`
--

DROP TABLE IF EXISTS `courses_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses_course` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `name_course` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `image` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_id` bigint DEFAULT NULL,
  `teacher_id` bigint NOT NULL,
  `is_public` tinyint(1) NOT NULL,
  `fee` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_course_category_id_d64b93bf_fk_courses_category_id` (`category_id`),
  KEY `courses_course_teacher_id_846fa526_fk_courses_teacher_user_id_id` (`teacher_id`),
  CONSTRAINT `courses_course_category_id_d64b93bf_fk_courses_category_id` FOREIGN KEY (`category_id`) REFERENCES `courses_category` (`id`),
  CONSTRAINT `courses_course_teacher_id_846fa526_fk_courses_teacher_user_id_id` FOREIGN KEY (`teacher_id`) REFERENCES `courses_teacher` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_course`
--

LOCK TABLES `courses_course` WRITE;
/*!40000 ALTER TABLE `courses_course` DISABLE KEYS */;
INSERT INTO `courses_course` VALUES (1,'2021-09-07 09:19:57.080951','2021-09-09 11:49:11.609454',1,'English for beginer','Chưa có mô tả Khóa Học','courses/2021/09/download.jfif',1,2,1,'0'),(2,'2021-09-07 10:01:34.842213','2021-09-09 11:50:31.628263',1,'English for kids','Chưa có mô tả Khóa Học','courses/2021/09/download_1.jfif',1,2,1,'0'),(3,'2021-09-07 10:04:20.837923','2021-09-07 10:04:20.837923',1,'test3','Chưa có mô tả Khóa Học','',NULL,2,0,'0'),(4,'2021-09-07 10:04:27.478858','2021-09-08 01:46:55.204611',1,'test4','Chưa có mô tả Khóa Học','',1,2,0,'0'),(6,'2021-09-09 07:49:00.767129','2021-09-09 11:56:26.026403',1,'test5','Chưa có mô tả Khóa Học','courses/2021/09/10.u5762.d20171018.t104146.65072.jpg',1,3,1,'0');
/*!40000 ALTER TABLE `courses_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_course_tags`
--

DROP TABLE IF EXISTS `courses_course_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses_course_tags` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `course_id` bigint NOT NULL,
  `tag_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `courses_course_tags_course_id_tag_id_52b73814_uniq` (`course_id`,`tag_id`),
  KEY `courses_course_tags_tag_id_20fb041b_fk_courses_tag_id` (`tag_id`),
  CONSTRAINT `courses_course_tags_course_id_f326f2c6_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`),
  CONSTRAINT `courses_course_tags_tag_id_20fb041b_fk_courses_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `courses_tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_course_tags`
--

LOCK TABLES `courses_course_tags` WRITE;
/*!40000 ALTER TABLE `courses_course_tags` DISABLE KEYS */;
INSERT INTO `courses_course_tags` VALUES (5,1,2),(6,1,3),(3,4,2),(7,6,2);
/*!40000 ALTER TABLE `courses_course_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_file`
--

DROP TABLE IF EXISTS `courses_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses_file` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `file` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `lession_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_file_lession_id_d6b81570_fk_courses_lesson_id` (`lession_id`),
  CONSTRAINT `courses_file_lession_id_d6b81570_fk_courses_lesson_id` FOREIGN KEY (`lession_id`) REFERENCES `courses_lesson` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_file`
--

LOCK TABLES `courses_file` WRITE;
/*!40000 ALTER TABLE `courses_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `courses_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_follow`
--

DROP TABLE IF EXISTS `courses_follow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses_follow` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `student_id` bigint NOT NULL,
  `teacher_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `courses_follow_student_id_teacher_id_d3baccb1_uniq` (`student_id`,`teacher_id`),
  KEY `courses_follow_teacher_id_21804a2c_fk_courses_teacher_user_id_id` (`teacher_id`),
  CONSTRAINT `courses_follow_student_id_1fd9583d_fk_courses_user_id` FOREIGN KEY (`student_id`) REFERENCES `courses_user` (`id`),
  CONSTRAINT `courses_follow_teacher_id_21804a2c_fk_courses_teacher_user_id_id` FOREIGN KEY (`teacher_id`) REFERENCES `courses_teacher` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_follow`
--

LOCK TABLES `courses_follow` WRITE;
/*!40000 ALTER TABLE `courses_follow` DISABLE KEYS */;
/*!40000 ALTER TABLE `courses_follow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_groupchat`
--

DROP TABLE IF EXISTS `courses_groupchat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses_groupchat` (
  `course_id` bigint NOT NULL,
  `name_group` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`course_id`),
  CONSTRAINT `courses_groupchat_course_id_50be687b_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_groupchat`
--

LOCK TABLES `courses_groupchat` WRITE;
/*!40000 ALTER TABLE `courses_groupchat` DISABLE KEYS */;
/*!40000 ALTER TABLE `courses_groupchat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_homework`
--

DROP TABLE IF EXISTS `courses_homework`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses_homework` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `file` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `lesson_id` bigint NOT NULL,
  `author_teacher_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_homework_lesson_id_146fe1c8_fk_courses_lesson_id` (`lesson_id`),
  KEY `courses_homework_author_teacher_id_a633e76b_fk_courses_t` (`author_teacher_id`),
  CONSTRAINT `courses_homework_author_teacher_id_a633e76b_fk_courses_t` FOREIGN KEY (`author_teacher_id`) REFERENCES `courses_teacher` (`user_id`),
  CONSTRAINT `courses_homework_lesson_id_146fe1c8_fk_courses_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `courses_lesson` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_homework`
--

LOCK TABLES `courses_homework` WRITE;
/*!40000 ALTER TABLE `courses_homework` DISABLE KEYS */;
/*!40000 ALTER TABLE `courses_homework` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_job`
--

DROP TABLE IF EXISTS `courses_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses_job` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name_job` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_job`
--

LOCK TABLES `courses_job` WRITE;
/*!40000 ALTER TABLE `courses_job` DISABLE KEYS */;
INSERT INTO `courses_job` VALUES (1,'English Teacher'),(2,'designer');
/*!40000 ALTER TABLE `courses_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_lesson`
--

DROP TABLE IF EXISTS `courses_lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses_lesson` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `course_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `courses_lesson_subject_course_id_f2a8d9de_uniq` (`subject`,`course_id`),
  KEY `courses_lesson_course_id_16bc4882_fk_courses_course_id` (`course_id`),
  CONSTRAINT `courses_lesson_course_id_16bc4882_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_lesson`
--

LOCK TABLES `courses_lesson` WRITE;
/*!40000 ALTER TABLE `courses_lesson` DISABLE KEYS */;
INSERT INTO `courses_lesson` VALUES (1,'2021-09-09 03:48:31.488669','2021-09-09 03:48:31.488669',1,'lesson test 1','this is a content......','courses/2021/09/81yAo5ElQlL.jpg',1);
/*!40000 ALTER TABLE `courses_lesson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_message`
--

DROP TABLE IF EXISTS `courses_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses_message` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `mess` longtext COLLATE utf8_unicode_ci NOT NULL,
  `date_post` datetime(6) NOT NULL,
  `user_id` bigint NOT NULL,
  `group_chat_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_message_group_chat_id_15a4745b_fk_courses_g` (`group_chat_id`),
  KEY `courses_message_user_id_d05207a2_fk_courses_user_id` (`user_id`),
  CONSTRAINT `courses_message_group_chat_id_15a4745b_fk_courses_g` FOREIGN KEY (`group_chat_id`) REFERENCES `courses_groupchat` (`course_id`),
  CONSTRAINT `courses_message_user_id_d05207a2_fk_courses_user_id` FOREIGN KEY (`user_id`) REFERENCES `courses_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_message`
--

LOCK TABLES `courses_message` WRITE;
/*!40000 ALTER TABLE `courses_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `courses_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_skill`
--

DROP TABLE IF EXISTS `courses_skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses_skill` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name_skill` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_skill`
--

LOCK TABLES `courses_skill` WRITE;
/*!40000 ALTER TABLE `courses_skill` DISABLE KEYS */;
/*!40000 ALTER TABLE `courses_skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_student_course`
--

DROP TABLE IF EXISTS `courses_student_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses_student_course` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `join_date` datetime(6) NOT NULL,
  `rate` int DEFAULT NULL,
  `review` longtext COLLATE utf8_unicode_ci,
  `course_id` bigint NOT NULL,
  `student_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `courses_student_course_student_id_course_id_14ffe388_uniq` (`student_id`,`course_id`),
  KEY `courses_student_course_course_id_2048cb16_fk_courses_course_id` (`course_id`),
  CONSTRAINT `courses_student_course_course_id_2048cb16_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`),
  CONSTRAINT `courses_student_course_student_id_d6aa4404_fk_courses_user_id` FOREIGN KEY (`student_id`) REFERENCES `courses_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_student_course`
--

LOCK TABLES `courses_student_course` WRITE;
/*!40000 ALTER TABLE `courses_student_course` DISABLE KEYS */;
INSERT INTO `courses_student_course` VALUES (1,'2021-09-09 08:35:36.393661',5,'amazing good job!',1,2),(2,'2021-09-09 08:36:20.152724',0,'boring',1,4),(3,'2021-09-09 09:33:33.099044',5,'test',1,3);
/*!40000 ALTER TABLE `courses_student_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_tag`
--

DROP TABLE IF EXISTS `courses_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses_tag` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_tag`
--

LOCK TABLES `courses_tag` WRITE;
/*!40000 ALTER TABLE `courses_tag` DISABLE KEYS */;
INSERT INTO `courses_tag` VALUES (1,'tag1'),(2,'tag2'),(3,'tag3');
/*!40000 ALTER TABLE `courses_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_teacher`
--

DROP TABLE IF EXISTS `courses_teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses_teacher` (
  `user_id` bigint NOT NULL,
  `activeTeacher` tinyint(1) NOT NULL,
  `job_id` bigint DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `courses_teacher_job_id_4e2d0999_fk_courses_job_id` (`job_id`),
  CONSTRAINT `courses_teacher_job_id_4e2d0999_fk_courses_job_id` FOREIGN KEY (`job_id`) REFERENCES `courses_job` (`id`),
  CONSTRAINT `courses_teacher_user_id_4ec3fca8_fk_courses_user_id` FOREIGN KEY (`user_id`) REFERENCES `courses_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_teacher`
--

LOCK TABLES `courses_teacher` WRITE;
/*!40000 ALTER TABLE `courses_teacher` DISABLE KEYS */;
INSERT INTO `courses_teacher` VALUES (2,1,NULL),(3,0,2);
/*!40000 ALTER TABLE `courses_teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_teacher_skills`
--

DROP TABLE IF EXISTS `courses_teacher_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses_teacher_skills` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `teacher_id` bigint NOT NULL,
  `skill_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `courses_teacher_skills_teacher_id_skill_id_79a5d42b_uniq` (`teacher_id`,`skill_id`),
  KEY `courses_teacher_skills_skill_id_15188164_fk_courses_skill_id` (`skill_id`),
  CONSTRAINT `courses_teacher_skil_teacher_id_fc5d9593_fk_courses_t` FOREIGN KEY (`teacher_id`) REFERENCES `courses_teacher` (`user_id`),
  CONSTRAINT `courses_teacher_skills_skill_id_15188164_fk_courses_skill_id` FOREIGN KEY (`skill_id`) REFERENCES `courses_skill` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_teacher_skills`
--

LOCK TABLES `courses_teacher_skills` WRITE;
/*!40000 ALTER TABLE `courses_teacher_skills` DISABLE KEYS */;
/*!40000 ALTER TABLE `courses_teacher_skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_user`
--

DROP TABLE IF EXISTS `courses_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `avatar` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_user`
--

LOCK TABLES `courses_user` WRITE;
/*!40000 ALTER TABLE `courses_user` DISABLE KEYS */;
INSERT INTO `courses_user` VALUES (1,'pbkdf2_sha256$260000$8oaLQECi9IkyamsEwcXoLT$CWXdfSOlcYVf9AplJwH6wAlV8hMPHvrY6EyAiryy+b0=','2021-09-08 11:03:41.237480',1,'admin','','','admin@gmail.com',1,1,'2021-09-06 11:03:12.582479',''),(2,'pbkdf2_sha256$260000$KlK8Wn4fxdg5HzPpZUKFJD$+2/lobDAxLKRqvDTbRSlXpZvBdgTE2iz2dr8e0rjHQ8=',NULL,0,'ThuThuy','','','',0,1,'2021-09-07 09:12:05.641903',''),(3,'1',NULL,0,'helloword','','','helloword@gmail.com',0,1,'2021-09-08 13:36:23.926069','static/uploads/2021/09/c.jpg'),(4,'pbkdf2_sha256$260000$PKHQk09s2WcJpgYeLJQ2yl$X791m7/tmQhy/6FUrPcQ6HeTXsZ+ZqOCafbGnVb5c1U=',NULL,0,'helloword2','hello','word 2','helloword2@gmail.com',0,1,'2021-09-08 14:00:11.604471','static/uploads/2021/09/001.png');
/*!40000 ALTER TABLE `courses_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_user_groups`
--

DROP TABLE IF EXISTS `courses_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `courses_user_groups_user_id_group_id_b5cd82da_uniq` (`user_id`,`group_id`),
  KEY `courses_user_groups_group_id_f1b5c084_fk_auth_group_id` (`group_id`),
  CONSTRAINT `courses_user_groups_group_id_f1b5c084_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `courses_user_groups_user_id_c63786e3_fk_courses_user_id` FOREIGN KEY (`user_id`) REFERENCES `courses_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_user_groups`
--

LOCK TABLES `courses_user_groups` WRITE;
/*!40000 ALTER TABLE `courses_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `courses_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_user_user_permissions`
--

DROP TABLE IF EXISTS `courses_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `courses_user_user_permis_user_id_permission_id_e0e9296d_uniq` (`user_id`,`permission_id`),
  KEY `courses_user_user_pe_permission_id_5803efd0_fk_auth_perm` (`permission_id`),
  CONSTRAINT `courses_user_user_pe_permission_id_5803efd0_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `courses_user_user_pe_user_id_699dc51a_fk_courses_u` FOREIGN KEY (`user_id`) REFERENCES `courses_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_user_user_permissions`
--

LOCK TABLES `courses_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `courses_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `courses_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_video`
--

DROP TABLE IF EXISTS `courses_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses_video` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url_video` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lession_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_video_lession_id_76a7e0fc_fk_courses_lesson_id` (`lession_id`),
  CONSTRAINT `courses_video_lession_id_76a7e0fc_fk_courses_lesson_id` FOREIGN KEY (`lession_id`) REFERENCES `courses_lesson` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_video`
--

LOCK TABLES `courses_video` WRITE;
/*!40000 ALTER TABLE `courses_video` DISABLE KEYS */;
/*!40000 ALTER TABLE `courses_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_courses_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_courses_user_id` FOREIGN KEY (`user_id`) REFERENCES `courses_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2021-09-08 01:45:43.667499','1','tag1',1,'[{\"added\": {}}]',12,1),(2,'2021-09-08 01:45:49.196472','2','tag2',1,'[{\"added\": {}}]',12,1),(3,'2021-09-08 01:46:23.360297','1','cate1',1,'[{\"added\": {}}]',7,1),(4,'2021-09-08 01:46:27.280973','5','test5',2,'[{\"changed\": {\"fields\": [\"Category\", \"Tags\"]}}]',8,1),(5,'2021-09-08 01:46:43.722637','4','test4',2,'[{\"changed\": {\"fields\": [\"Category\", \"Tags\"]}}]',8,1),(6,'2021-09-08 01:46:55.212643','4','test4',2,'[]',8,1),(7,'2021-09-08 02:00:36.273976','5','test5',2,'[{\"changed\": {\"fields\": [\"Active\"]}}]',8,1),(8,'2021-09-08 02:03:18.249558','5','test5',2,'[{\"changed\": {\"fields\": [\"Active\", \"Image\"]}}]',8,1),(9,'2021-09-08 02:03:31.892132','5','test5',2,'[]',8,1),(10,'2021-09-08 02:03:52.741326','5','test5',2,'[{\"changed\": {\"fields\": [\"Active\"]}}]',8,1),(11,'2021-09-08 03:29:19.644349','5','bai 1',1,'[{\"added\": {}}]',13,1),(12,'2021-09-08 03:30:35.150748','1','ThuThuy Said hello mn in group chat bai 1 at time: 2021-09-08 03:30:35.142728+00:00',1,'[{\"added\": {}}]',17,1),(13,'2021-09-09 03:48:31.614984','1','lesson test 1',1,'[{\"added\": {}}]',10,1),(14,'2021-09-09 04:32:31.221237','3','tag3',1,'[{\"added\": {}}]',12,1),(15,'2021-09-09 04:32:48.612804','5','test5',2,'[{\"changed\": {\"fields\": [\"Tags\", \"Students\"]}}]',8,1),(16,'2021-09-09 04:35:01.958839','1','test couse',2,'[{\"changed\": {\"fields\": [\"Category\", \"Tags\", \"Image\", \"Students\"]}}]',8,1),(17,'2021-09-09 07:48:20.449261','5','test5',3,'',8,1),(18,'2021-09-09 07:49:00.838976','6','test5',1,'[{\"added\": {}}]',8,1),(19,'2021-09-09 07:57:40.424075','1','test couse',2,'[{\"changed\": {\"fields\": [\"Is public\"]}}]',8,1),(20,'2021-09-09 08:35:36.405926','1','Student_Course object (1)',1,'[{\"added\": {}}]',25,1),(21,'2021-09-09 08:36:20.168475','2','Student_Course object (2)',1,'[{\"added\": {}}]',25,1),(22,'2021-09-09 09:33:33.131193','3','Student_Course object (3)',1,'[{\"added\": {}}]',25,1),(23,'2021-09-09 11:47:37.762845','1','English',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',7,1),(24,'2021-09-09 11:49:11.643130','1','English for beginer',2,'[{\"changed\": {\"fields\": [\"Name course\", \"Image\"]}}]',8,1),(25,'2021-09-09 11:50:31.656904','2','English for kids',2,'[{\"changed\": {\"fields\": [\"Name course\", \"Category\", \"Is public\", \"Image\"]}}]',8,1),(26,'2021-09-09 11:55:29.376733','1','English Teacher',1,'[{\"added\": {}}]',9,1),(27,'2021-09-09 11:55:53.794133','2','designer',1,'[{\"added\": {}}]',9,1),(28,'2021-09-09 11:56:10.585843','3','helloword',1,'[{\"added\": {}}]',16,1),(29,'2021-09-09 11:56:26.065902','6','test5',2,'[{\"changed\": {\"fields\": [\"Teacher\"]}}]',8,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(7,'courses','category'),(8,'courses','course'),(15,'courses','file'),(19,'courses','follow'),(13,'courses','groupchat'),(18,'courses','homework'),(9,'courses','job'),(10,'courses','lesson'),(17,'courses','message'),(11,'courses','skill'),(25,'courses','student_course'),(12,'courses','tag'),(16,'courses','teacher'),(6,'courses','user'),(14,'courses','video'),(21,'oauth2_provider','accesstoken'),(20,'oauth2_provider','application'),(22,'oauth2_provider','grant'),(24,'oauth2_provider','idtoken'),(23,'oauth2_provider','refreshtoken'),(5,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2021-09-06 10:58:47.322833'),(2,'contenttypes','0002_remove_content_type_name','2021-09-06 10:58:47.407319'),(3,'auth','0001_initial','2021-09-06 10:58:47.734802'),(4,'auth','0002_alter_permission_name_max_length','2021-09-06 10:58:47.790351'),(5,'auth','0003_alter_user_email_max_length','2021-09-06 10:58:47.806859'),(6,'auth','0004_alter_user_username_opts','2021-09-06 10:58:47.808399'),(7,'auth','0005_alter_user_last_login_null','2021-09-06 10:58:47.808399'),(8,'auth','0006_require_contenttypes_0002','2021-09-06 10:58:47.824109'),(9,'auth','0007_alter_validators_add_error_messages','2021-09-06 10:58:47.824109'),(10,'auth','0008_alter_user_username_max_length','2021-09-06 10:58:47.839764'),(11,'auth','0009_alter_user_last_name_max_length','2021-09-06 10:58:47.844627'),(12,'auth','0010_alter_group_name_max_length','2021-09-06 10:58:47.902400'),(13,'auth','0011_update_proxy_permissions','2021-09-06 10:58:47.910456'),(14,'auth','0012_alter_user_first_name_max_length','2021-09-06 10:58:47.910456'),(15,'courses','0001_initial','2021-09-06 10:58:50.548815'),(16,'admin','0001_initial','2021-09-06 10:58:50.887744'),(17,'admin','0002_logentry_remove_auto_add','2021-09-06 10:58:50.903408'),(18,'admin','0003_logentry_add_action_flag_choices','2021-09-06 10:58:50.903408'),(19,'sessions','0001_initial','2021-09-06 10:58:50.955126'),(20,'courses','0002_auto_20210908_0944','2021-09-08 02:44:57.849370'),(21,'oauth2_provider','0001_initial','2021-09-08 12:56:49.661709'),(22,'oauth2_provider','0002_auto_20190406_1805','2021-09-08 12:56:49.899908'),(23,'oauth2_provider','0003_auto_20201211_1314','2021-09-08 12:56:50.007700'),(24,'oauth2_provider','0004_auto_20200902_2022','2021-09-08 12:56:50.463636'),(25,'courses','0003_auto_20210909_1044','2021-09-09 03:45:03.071665'),(26,'courses','0004_alter_course_teacher','2021-09-09 07:14:43.524777'),(27,'courses','0005_auto_20210909_1447','2021-09-09 07:47:18.740986'),(28,'courses','0006_auto_20210909_1528','2021-09-09 08:28:46.464011'),(29,'courses','0007_rename_rare_student_course_rate','2021-09-09 08:37:24.441023'),(30,'courses','0008_auto_20210909_1703','2021-09-09 10:03:35.721900');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('k8brwwe191jmphgr2zdfeigv4fzyvaq5','.eJxVjMEOwiAQRP-FsyHgBlg8evcbyC5spWpoUtqT8d9tkx50jvPezFslWpea1i5zGou6KKtOvx1TfkrbQXlQu086T22ZR9a7og_a9W0q8roe7t9BpV63tYTi0NgYsw_eWSNA_ryFogHDgFEQ0LAbuAwYMQQGZs4IwbHP0anPF7oHNyk:1mNuZG:5WDAYm1HDEir5nG_vlcMsmYtubsxd69zebinjZ0ZwW0','2021-09-22 10:12:34.321036'),('ld1ny81vhhjmz1ahe3350o5445que4zt','.eJxVjMEOwiAQRP-FsyHgBlg8evcbyC5spWpoUtqT8d9tkx50jvPezFslWpea1i5zGou6KKtOvx1TfkrbQXlQu086T22ZR9a7og_a9W0q8roe7t9BpV63tYTi0NgYsw_eWSNA_ryFogHDgFEQ0LAbuAwYMQQGZs4IwbHP0anPF7oHNyk:1mNvMj:iTw-KJVzfctrtlIB90jD_jNFlpi3yA93YP3IsI0ObmI','2021-09-22 11:03:41.246394');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_accesstoken`
--

DROP TABLE IF EXISTS `oauth2_provider_accesstoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_accesstoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expires` datetime(6) NOT NULL,
  `scope` longtext COLLATE utf8_unicode_ci NOT NULL,
  `application_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `source_refresh_token_id` bigint DEFAULT NULL,
  `id_token_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`),
  UNIQUE KEY `source_refresh_token_id` (`source_refresh_token_id`),
  UNIQUE KEY `id_token_id` (`id_token_id`),
  KEY `oauth2_provider_acce_application_id_b22886e1_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_accesstoken_user_id_6e4c9a65_fk_courses_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_acce_application_id_b22886e1_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_acce_id_token_id_85db651b_fk_oauth2_pr` FOREIGN KEY (`id_token_id`) REFERENCES `oauth2_provider_idtoken` (`id`),
  CONSTRAINT `oauth2_provider_acce_source_refresh_token_e66fbc72_fk_oauth2_pr` FOREIGN KEY (`source_refresh_token_id`) REFERENCES `oauth2_provider_refreshtoken` (`id`),
  CONSTRAINT `oauth2_provider_accesstoken_user_id_6e4c9a65_fk_courses_user_id` FOREIGN KEY (`user_id`) REFERENCES `courses_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_accesstoken`
--

LOCK TABLES `oauth2_provider_accesstoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_accesstoken` DISABLE KEYS */;
INSERT INTO `oauth2_provider_accesstoken` VALUES (1,'Wd6WUf5x7v9FO6FPkGaAvbO8vFzxqy','2021-09-08 23:17:11.007708','read write',1,1,'2021-09-08 13:17:11.007708','2021-09-08 13:17:11.007708',NULL,NULL),(2,'NM4TxHb0rtYbrvITQUWbtmOjOneG4y','2021-09-08 23:56:37.160630','read write',1,1,'2021-09-08 13:56:37.160630','2021-09-08 13:56:37.160630',NULL,NULL),(3,'fgT4cMWHZ2ao5QoFSf86KUszdqxAKq','2021-09-09 00:00:20.066905','read write',1,4,'2021-09-08 14:00:20.066905','2021-09-08 14:00:20.066905',NULL,NULL),(4,'KOPIIHTqWAPjB25ZuQAHstcEtGvjMK','2021-09-09 01:51:00.468311','read write',1,4,'2021-09-08 15:51:00.469307','2021-09-08 15:51:00.469307',NULL,NULL);
/*!40000 ALTER TABLE `oauth2_provider_accesstoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_application`
--

DROP TABLE IF EXISTS `oauth2_provider_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_application` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `client_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `redirect_uris` longtext COLLATE utf8_unicode_ci NOT NULL,
  `client_type` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `authorization_grant_type` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `client_secret` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `skip_authorization` tinyint(1) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `algorithm` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `client_id` (`client_id`),
  KEY `oauth2_provider_application_user_id_79829054_fk_courses_user_id` (`user_id`),
  KEY `oauth2_provider_application_client_secret_53133678` (`client_secret`),
  CONSTRAINT `oauth2_provider_application_user_id_79829054_fk_courses_user_id` FOREIGN KEY (`user_id`) REFERENCES `courses_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_application`
--

LOCK TABLES `oauth2_provider_application` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_application` DISABLE KEYS */;
INSERT INTO `oauth2_provider_application` VALUES (1,'01UlK0cdqiqdq46sXOdXcfWPGcSXgNzZtMAYnUVf','','confidential','password','4xW4BIeBa5899j9L58UUCYsNIFrJ3QLC0euywLHJRlufHSqLy1yWBwRbZlKcBUJ1rBRwnnBRoLzAQLWFbHCdBNwhceHtVy3slnVfwDrbIZK9vagnnQCt4YS9gIGNcfsn','ECourseApp',1,0,'2021-09-08 12:59:22.427823','2021-09-08 12:59:22.427823','');
/*!40000 ALTER TABLE `oauth2_provider_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_grant`
--

DROP TABLE IF EXISTS `oauth2_provider_grant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_grant` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expires` datetime(6) NOT NULL,
  `redirect_uri` longtext COLLATE utf8_unicode_ci NOT NULL,
  `scope` longtext COLLATE utf8_unicode_ci NOT NULL,
  `application_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `code_challenge` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `code_challenge_method` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `nonce` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `claims` longtext COLLATE utf8_unicode_ci NOT NULL DEFAULT (_utf8mb3''),
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `oauth2_provider_gran_application_id_81923564_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_grant_user_id_e8f62af8_fk_courses_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_gran_application_id_81923564_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_grant_user_id_e8f62af8_fk_courses_user_id` FOREIGN KEY (`user_id`) REFERENCES `courses_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_grant`
--

LOCK TABLES `oauth2_provider_grant` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_grant` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_provider_grant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_idtoken`
--

DROP TABLE IF EXISTS `oauth2_provider_idtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_idtoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `jti` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `expires` datetime(6) NOT NULL,
  `scope` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `application_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `jti` (`jti`),
  KEY `oauth2_provider_idto_application_id_08c5ff4f_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_idtoken_user_id_dd512b59_fk_courses_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_idto_application_id_08c5ff4f_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_idtoken_user_id_dd512b59_fk_courses_user_id` FOREIGN KEY (`user_id`) REFERENCES `courses_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_idtoken`
--

LOCK TABLES `oauth2_provider_idtoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_idtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_provider_idtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_refreshtoken`
--

DROP TABLE IF EXISTS `oauth2_provider_refreshtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_refreshtoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `access_token_id` bigint DEFAULT NULL,
  `application_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `revoked` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `access_token_id` (`access_token_id`),
  UNIQUE KEY `oauth2_provider_refreshtoken_token_revoked_af8a5134_uniq` (`token`,`revoked`),
  KEY `oauth2_provider_refr_application_id_2d1c311b_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_refreshtoken_user_id_da837fce_fk_courses_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_refr_access_token_id_775e84e8_fk_oauth2_pr` FOREIGN KEY (`access_token_id`) REFERENCES `oauth2_provider_accesstoken` (`id`),
  CONSTRAINT `oauth2_provider_refr_application_id_2d1c311b_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_refreshtoken_user_id_da837fce_fk_courses_user_id` FOREIGN KEY (`user_id`) REFERENCES `courses_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_refreshtoken`
--

LOCK TABLES `oauth2_provider_refreshtoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_refreshtoken` DISABLE KEYS */;
INSERT INTO `oauth2_provider_refreshtoken` VALUES (1,'frzbxvd7jqxxoJwX3YVL0jtITc6cTS',1,1,1,'2021-09-08 13:17:11.007708','2021-09-08 13:17:11.007708',NULL),(2,'UfEIVM0ObidvW6HHf5DkkKPeG5Qf2S',2,1,1,'2021-09-08 13:56:37.160630','2021-09-08 13:56:37.160630',NULL),(3,'XmZNw2lk6aUinGSOPeJIVtnROfh8cn',3,1,4,'2021-09-08 14:00:20.074956','2021-09-08 14:00:20.074956',NULL),(4,'LQpEUxFa8LELvwzgTRUrfnUJxtRrrM',4,1,4,'2021-09-08 15:51:00.493679','2021-09-08 15:51:00.493679',NULL);
/*!40000 ALTER TABLE `oauth2_provider_refreshtoken` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-09 19:01:23
