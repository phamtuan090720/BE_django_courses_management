-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: localhost    Database: ecoursedb
-- ------------------------------------------------------
-- Server version	8.0.24

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
  `name` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'Teacher');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
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
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add user',6,'add_user'),(22,'Can change user',6,'change_user'),(23,'Can delete user',6,'delete_user'),(24,'Can view user',6,'view_user'),(25,'Can add category',7,'add_category'),(26,'Can change category',7,'change_category'),(27,'Can delete category',7,'delete_category'),(28,'Can view category',7,'view_category'),(29,'Can add course',8,'add_course'),(30,'Can change course',8,'change_course'),(31,'Can delete course',8,'delete_course'),(32,'Can view course',8,'view_course'),(33,'Can add job',9,'add_job'),(34,'Can change job',9,'change_job'),(35,'Can delete job',9,'delete_job'),(36,'Can view job',9,'view_job'),(37,'Can add lesson',10,'add_lesson'),(38,'Can change lesson',10,'change_lesson'),(39,'Can delete lesson',10,'delete_lesson'),(40,'Can view lesson',10,'view_lesson'),(41,'Can add skill',11,'add_skill'),(42,'Can change skill',11,'change_skill'),(43,'Can delete skill',11,'delete_skill'),(44,'Can view skill',11,'view_skill'),(45,'Can add tag',12,'add_tag'),(46,'Can change tag',12,'change_tag'),(47,'Can delete tag',12,'delete_tag'),(48,'Can view tag',12,'view_tag'),(49,'Can add group chat',13,'add_groupchat'),(50,'Can change group chat',13,'change_groupchat'),(51,'Can delete group chat',13,'delete_groupchat'),(52,'Can view group chat',13,'view_groupchat'),(53,'Can add video',14,'add_video'),(54,'Can change video',14,'change_video'),(55,'Can delete video',14,'delete_video'),(56,'Can view video',14,'view_video'),(57,'Can add file',15,'add_file'),(58,'Can change file',15,'change_file'),(59,'Can delete file',15,'delete_file'),(60,'Can view file',15,'view_file'),(61,'Can add teacher',16,'add_teacher'),(62,'Can change teacher',16,'change_teacher'),(63,'Can delete teacher',16,'delete_teacher'),(64,'Can view teacher',16,'view_teacher'),(65,'Can add message',17,'add_message'),(66,'Can change message',17,'change_message'),(67,'Can delete message',17,'delete_message'),(68,'Can view message',17,'view_message'),(69,'Can add home work',18,'add_homework'),(70,'Can change home work',18,'change_homework'),(71,'Can delete home work',18,'delete_homework'),(72,'Can view home work',18,'view_homework'),(73,'Can add follow',19,'add_follow'),(74,'Can change follow',19,'change_follow'),(75,'Can delete follow',19,'delete_follow'),(76,'Can view follow',19,'view_follow'),(77,'Can add application',20,'add_application'),(78,'Can change application',20,'change_application'),(79,'Can delete application',20,'delete_application'),(80,'Can view application',20,'view_application'),(81,'Can add access token',21,'add_accesstoken'),(82,'Can change access token',21,'change_accesstoken'),(83,'Can delete access token',21,'delete_accesstoken'),(84,'Can view access token',21,'view_accesstoken'),(85,'Can add grant',22,'add_grant'),(86,'Can change grant',22,'change_grant'),(87,'Can delete grant',22,'delete_grant'),(88,'Can view grant',22,'view_grant'),(89,'Can add refresh token',23,'add_refreshtoken'),(90,'Can change refresh token',23,'change_refreshtoken'),(91,'Can delete refresh token',23,'delete_refreshtoken'),(92,'Can view refresh token',23,'view_refreshtoken'),(93,'Can add id token',24,'add_idtoken'),(94,'Can change id token',24,'change_idtoken'),(95,'Can delete id token',24,'delete_idtoken'),(96,'Can view id token',24,'view_idtoken'),(97,'Can add student_ course',25,'add_student_course'),(98,'Can change student_ course',25,'change_student_course'),(99,'Can delete student_ course',25,'delete_student_course'),(100,'Can view student_ course',25,'view_student_course'),(101,'Can add student_ lesson',26,'add_student_lesson'),(102,'Can change student_ lesson',26,'change_student_lesson'),(103,'Can delete student_ lesson',26,'delete_student_lesson'),(104,'Can view student_ lesson',26,'view_student_lesson');
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
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_category`
--

LOCK TABLES `courses_category` WRITE;
/*!40000 ALTER TABLE `courses_category` DISABLE KEYS */;
INSERT INTO `courses_category` VALUES (2,'design'),(1,'English'),(3,'Web application');
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
  `name_course` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_id` bigint DEFAULT NULL,
  `teacher_id` bigint NOT NULL,
  `is_public` tinyint(1) NOT NULL,
  `fee` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `subject` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `courses_course_category_id_d64b93bf_fk_courses_category_id` (`category_id`),
  KEY `courses_course_teacher_id_846fa526_fk_courses_teacher_user_id_id` (`teacher_id`),
  CONSTRAINT `courses_course_category_id_d64b93bf_fk_courses_category_id` FOREIGN KEY (`category_id`) REFERENCES `courses_category` (`id`),
  CONSTRAINT `courses_course_teacher_id_846fa526_fk_courses_teacher_user_id_id` FOREIGN KEY (`teacher_id`) REFERENCES `courses_teacher` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_course`
--

LOCK TABLES `courses_course` WRITE;
/*!40000 ALTER TABLE `courses_course` DISABLE KEYS */;
INSERT INTO `courses_course` VALUES (1,'2021-09-07 09:19:57.080951','2021-09-12 08:01:34.897747',1,'English for beginer','Chưa có mô tả Khóa Học','courses/2021/09/download.jfif',1,2,1,'0',NULL),(2,'2021-09-07 10:01:34.842213','2021-09-12 11:15:44.872515',1,'English for kids','Chưa có mô tả Khóa Học','courses/2021/09/download_1.jfif',1,2,1,'0',NULL),(3,'2021-09-07 10:04:20.837923','2021-09-20 02:33:49.832553',1,'test3','Chưa có mô tả Khóa Học','',2,9,1,'0','Hahha'),(4,'2021-09-07 10:04:27.478858','2021-09-11 03:08:51.590208',1,'test4','Chưa có mô tả Khóa Học','',1,2,0,'0',NULL),(6,'2021-09-09 07:49:00.767129','2021-09-12 11:21:36.638101',0,'test owner perm','Chưa có mô tả Khóa Học','courses/2021/09/10.u5762.d20171018.t104146.65072.jpg',2,1,0,'0','this is a subject'),(7,'2021-09-09 14:49:57.125698','2021-09-09 14:49:57.125698',1,'test url','Chưa có mô tả Khóa Học','static/courses/2021/09/logo-test.png',1,3,1,'Free',NULL),(8,'2021-09-13 07:23:32.460040','2021-09-22 16:04:13.509476',1,'Khóa học Reactjs','Chưa có mô tả Khóa Học','static/courses/2021/09/react-logo.png',3,2,0,'Free','Chưa có gì cả mấy bạn à'),(9,'2021-09-17 06:22:22.189337','2021-09-17 06:22:22.189337',1,'Angular Basic','Chưa có mô tả Khóa Học','static/courses/2021/09/angular.png',3,2,1,'Free','Mô tả ngắn');
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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_course_tags`
--

LOCK TABLES `courses_course_tags` WRITE;
/*!40000 ALTER TABLE `courses_course_tags` DISABLE KEYS */;
INSERT INTO `courses_course_tags` VALUES (5,1,2),(6,1,3),(9,3,4),(39,4,5),(40,4,15),(41,4,16),(42,4,17),(7,6,2),(28,6,10),(8,7,1),(43,8,18),(44,9,19);
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
  `subject` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `file` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `lesson_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_file_lession_id_d6b81570_fk_courses_lesson_id` (`lesson_id`),
  CONSTRAINT `courses_file_lesson_id_c59bb4e4_fk_courses_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `courses_lesson` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
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
  `name_group` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`course_id`),
  CONSTRAINT `courses_groupchat_course_id_50be687b_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
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
  `subject` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `file` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `lesson_id` bigint NOT NULL,
  `author_teacher_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_homework_lesson_id_146fe1c8_fk_courses_lesson_id` (`lesson_id`),
  KEY `courses_homework_author_teacher_id_a633e76b_fk_courses_t` (`author_teacher_id`),
  CONSTRAINT `courses_homework_author_teacher_id_a633e76b_fk_courses_t` FOREIGN KEY (`author_teacher_id`) REFERENCES `courses_teacher` (`user_id`),
  CONSTRAINT `courses_homework_lesson_id_146fe1c8_fk_courses_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `courses_lesson` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
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
  `name_job` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_job`
--

LOCK TABLES `courses_job` WRITE;
/*!40000 ALTER TABLE `courses_job` DISABLE KEYS */;
INSERT INTO `courses_job` VALUES (1,'English Teacher'),(2,'designer'),(3,'Developer');
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
  `subject` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `course_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `courses_lesson_subject_course_id_f2a8d9de_uniq` (`subject`,`course_id`),
  KEY `courses_lesson_course_id_16bc4882_fk_courses_course_id` (`course_id`),
  CONSTRAINT `courses_lesson_course_id_16bc4882_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_lesson`
--

LOCK TABLES `courses_lesson` WRITE;
/*!40000 ALTER TABLE `courses_lesson` DISABLE KEYS */;
INSERT INTO `courses_lesson` VALUES (1,'2021-09-09 03:48:31.488669','2021-09-22 14:42:42.624398',1,'Cùng','this is a content......','courses/2021/09/81yAo5ElQlL.jpg',8),(2,'2021-09-13 07:24:46.495809','2021-09-23 03:08:16.625341',1,'Cùng Học Trình Nào Các Bạn','test','static/courses/2021/09/react-logo_CzcarR7.png',8);
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
  `mess` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `date_post` datetime(6) NOT NULL,
  `user_id` bigint NOT NULL,
  `group_chat_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_message_group_chat_id_15a4745b_fk_courses_g` (`group_chat_id`),
  KEY `courses_message_user_id_d05207a2_fk_courses_user_id` (`user_id`),
  CONSTRAINT `courses_message_group_chat_id_15a4745b_fk_courses_g` FOREIGN KEY (`group_chat_id`) REFERENCES `courses_groupchat` (`course_id`),
  CONSTRAINT `courses_message_user_id_d05207a2_fk_courses_user_id` FOREIGN KEY (`user_id`) REFERENCES `courses_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
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
  `name_skill` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
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
  `review` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `course_id` bigint NOT NULL,
  `student_id` bigint NOT NULL,
  `access` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `courses_student_course_student_id_course_id_14ffe388_uniq` (`student_id`,`course_id`),
  KEY `courses_student_course_course_id_2048cb16_fk_courses_course_id` (`course_id`),
  CONSTRAINT `courses_student_course_course_id_2048cb16_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`),
  CONSTRAINT `courses_student_course_student_id_d6aa4404_fk_courses_user_id` FOREIGN KEY (`student_id`) REFERENCES `courses_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_student_course`
--

LOCK TABLES `courses_student_course` WRITE;
/*!40000 ALTER TABLE `courses_student_course` DISABLE KEYS */;
INSERT INTO `courses_student_course` VALUES (1,'2021-09-09 08:35:36.393661',5,'amazing good job!',1,2,1),(2,'2021-09-09 08:36:20.152724',0,'boring',1,4,1),(3,'2021-09-09 09:33:33.099044',5,'test',1,3,1),(5,'2021-09-13 14:32:25.520583',4,'Tạm được chưa hay lắm',8,1,1),(6,'2021-09-13 14:32:42.063104',1,'thích thì cho 1 sao thôi',8,3,0),(15,'2021-09-17 05:54:26.240249',NULL,'',8,10,1),(16,'2021-09-17 05:54:50.003917',NULL,NULL,7,10,1),(17,'2021-09-17 06:22:46.289323',4,'khá là ok',9,9,0),(18,'2021-09-17 06:23:33.828203',5,'tạm được nhưng cho 5 sao',9,10,1),(20,'2021-09-18 20:39:20.733152',NULL,NULL,1,9,1),(21,'2021-09-20 02:31:00.211429',NULL,NULL,2,9,1),(22,'2021-09-20 02:31:17.160261',NULL,NULL,6,9,0),(23,'2021-09-20 10:35:08.633462',NULL,'',8,9,1);
/*!40000 ALTER TABLE `courses_student_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_student_lesson`
--

DROP TABLE IF EXISTS `courses_student_lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses_student_lesson` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `complete` tinyint(1) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `lesson_id` bigint NOT NULL,
  `student_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `courses_student_lesson_student_id_lesson_id_311cf021_uniq` (`student_id`,`lesson_id`),
  KEY `courses_student_lesson_lesson_id_10ab3dae_fk_courses_lesson_id` (`lesson_id`),
  CONSTRAINT `courses_student_lesson_lesson_id_10ab3dae_fk_courses_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `courses_lesson` (`id`),
  CONSTRAINT `courses_student_lesson_student_id_7228ed76_fk_courses_user_id` FOREIGN KEY (`student_id`) REFERENCES `courses_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_student_lesson`
--

LOCK TABLES `courses_student_lesson` WRITE;
/*!40000 ALTER TABLE `courses_student_lesson` DISABLE KEYS */;
INSERT INTO `courses_student_lesson` VALUES (1,1,'2021-09-23 09:55:46.581154','2021-09-23 12:17:35.799146',2,9),(2,0,'2021-09-23 12:20:24.689983','2021-09-23 13:15:07.797436',1,9);
/*!40000 ALTER TABLE `courses_student_lesson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_tag`
--

DROP TABLE IF EXISTS `courses_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses_tag` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_tag`
--

LOCK TABLES `courses_tag` WRITE;
/*!40000 ALTER TABLE `courses_tag` DISABLE KEYS */;
INSERT INTO `courses_tag` VALUES (16,'<QueryDict: {\'name\': [\'hihi\']}>'),(19,'AngularJs'),(17,'hihi'),(15,'name'),(18,'ReactJs'),(10,'tag'),(5,'tag 1'),(1,'tag1'),(2,'tag2'),(3,'tag3'),(8,'taggg'),(4,'tesstTag');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_teacher`
--

LOCK TABLES `courses_teacher` WRITE;
/*!40000 ALTER TABLE `courses_teacher` DISABLE KEYS */;
INSERT INTO `courses_teacher` VALUES (1,1,2),(2,1,NULL),(3,0,2),(9,1,3);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
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
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_user`
--

LOCK TABLES `courses_user` WRITE;
/*!40000 ALTER TABLE `courses_user` DISABLE KEYS */;
INSERT INTO `courses_user` VALUES (1,'pbkdf2_sha256$260000$ZPBccfZpPeNVpYumgwX12M$RfaEhADBL9imE0F7monM+HfHLzCG+9w+qc4tBF8l210=','2021-09-13 01:47:58.511803',1,'admin','','','admin@gmail.com',1,1,'2021-09-06 11:03:12.582479',''),(2,'pbkdf2_sha256$260000$KlK8Wn4fxdg5HzPpZUKFJD$+2/lobDAxLKRqvDTbRSlXpZvBdgTE2iz2dr8e0rjHQ8=','2021-09-12 11:13:56.000000',0,'ThuThuy','','','',0,1,'2021-09-07 09:12:05.000000','static/uploads/2021/09/60618778_2320937534611138_7508554572390989824_n.jpg'),(3,'1',NULL,0,'helloword','','','helloword@gmail.com',0,1,'2021-09-08 13:36:23.926069','static/uploads/2021/09/c.jpg'),(4,'pbkdf2_sha256$260000$PKHQk09s2WcJpgYeLJQ2yl$X791m7/tmQhy/6FUrPcQ6HeTXsZ+ZqOCafbGnVb5c1U=',NULL,0,'helloword2','hello','word 2','helloword2@gmail.com',0,1,'2021-09-08 14:00:11.604471','static/uploads/2021/09/001.png'),(5,'pbkdf2_sha256$260000$U3AWzwpZwzgCUUWCQoTSJp$1/V5CSXC1cuw8fiDLySnZfbR3cnKslG/o90Sr2BN+V0=',NULL,0,'userTest','thu','thuy','',0,1,'2021-09-09 15:05:25.643116','static/uploads/2021/09/anh-bia-me-before-you-e1580920303980.jpg'),(6,'pbkdf2_sha256$260000$wJUyuZVq6av1Y2xpEkFfX6$WjvGrFUPqwYGEFMYj6p5Ye3GfOnqSqm6xMv5TH6/F0k=',NULL,0,'meo','test','register','',0,1,'2021-09-10 08:06:29.023497','static/uploads/2021/09/81yAo5ElQlL.jpg'),(7,'pbkdf2_sha256$260000$q9gIuAo3psQRQ1zqvY7nSs$Vzy9W/oJD2jRoENQ/ukWmwGa1O1ZgRRdiwhm4tvI6mE=','2021-09-12 09:54:13.113068',0,'meo2','test2','register2','',0,1,'2021-09-10 08:33:39.000000','static/uploads/2021/09/81yAo5ElQlL_16MbCBf.jpg'),(8,'12345',NULL,0,'testUser','thu','thuy','lan@gmail.com',0,1,'2021-09-12 02:34:55.000000','static/uploads/2021/09/mat-biec.png'),(9,'pbkdf2_sha256$260000$MieJIoLhoGtSXNgAMVtaDM$aVBuveM6ObZgdbnbmqeVrVDTH/++fzHL79jAAlZRmQo=','2021-09-23 13:32:24.351318',1,'tuan','','','',1,1,'2021-09-13 07:22:16.000000','static/uploads/2021/09/Image.JPG'),(10,'pbkdf2_sha256$260000$GDsJZMGxTdtBaVANPTUxFU$sKf1p9p2pTcJW5ATF12GnAja6Gxl5wPxiEmqERdSrt4=','2021-09-17 13:38:15.140521',0,'tuan1','','','',0,1,'2021-09-17 01:06:30.000000','static/uploads/2021/09/Capture.PNG');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_user_groups`
--

LOCK TABLES `courses_user_groups` WRITE;
/*!40000 ALTER TABLE `courses_user_groups` DISABLE KEYS */;
INSERT INTO `courses_user_groups` VALUES (1,2,1);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
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
  `subject` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `url_video` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `lesson_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_video_lession_id_76a7e0fc_fk_courses_lesson_id` (`lesson_id`),
  CONSTRAINT `courses_video_lesson_id_59f2396e_fk_courses_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `courses_lesson` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_video`
--

LOCK TABLES `courses_video` WRITE;
/*!40000 ALTER TABLE `courses_video` DISABLE KEYS */;
INSERT INTO `courses_video` VALUES (1,'Video 1','https://www.youtube.com/watch?v=DCRNavrlS8s',1),(2,'video 2','https://www.youtube.com/watch?v=Ee8-KPWUEfM',1),(3,'Java Basic','https://www.youtube.com/embed/-HuTlmEVOgU',2);
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
  `object_id` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_courses_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_courses_user_id` FOREIGN KEY (`user_id`) REFERENCES `courses_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2021-09-08 01:45:43.667499','1','tag1',1,'[{\"added\": {}}]',12,1),(2,'2021-09-08 01:45:49.196472','2','tag2',1,'[{\"added\": {}}]',12,1),(3,'2021-09-08 01:46:23.360297','1','cate1',1,'[{\"added\": {}}]',7,1),(4,'2021-09-08 01:46:27.280973','5','test5',2,'[{\"changed\": {\"fields\": [\"Category\", \"Tags\"]}}]',8,1),(5,'2021-09-08 01:46:43.722637','4','test4',2,'[{\"changed\": {\"fields\": [\"Category\", \"Tags\"]}}]',8,1),(6,'2021-09-08 01:46:55.212643','4','test4',2,'[]',8,1),(7,'2021-09-08 02:00:36.273976','5','test5',2,'[{\"changed\": {\"fields\": [\"Active\"]}}]',8,1),(8,'2021-09-08 02:03:18.249558','5','test5',2,'[{\"changed\": {\"fields\": [\"Active\", \"Image\"]}}]',8,1),(9,'2021-09-08 02:03:31.892132','5','test5',2,'[]',8,1),(10,'2021-09-08 02:03:52.741326','5','test5',2,'[{\"changed\": {\"fields\": [\"Active\"]}}]',8,1),(11,'2021-09-08 03:29:19.644349','5','bai 1',1,'[{\"added\": {}}]',13,1),(12,'2021-09-08 03:30:35.150748','1','ThuThuy Said hello mn in group chat bai 1 at time: 2021-09-08 03:30:35.142728+00:00',1,'[{\"added\": {}}]',17,1),(13,'2021-09-09 03:48:31.614984','1','lesson test 1',1,'[{\"added\": {}}]',10,1),(14,'2021-09-09 04:32:31.221237','3','tag3',1,'[{\"added\": {}}]',12,1),(15,'2021-09-09 04:32:48.612804','5','test5',2,'[{\"changed\": {\"fields\": [\"Tags\", \"Students\"]}}]',8,1),(16,'2021-09-09 04:35:01.958839','1','test couse',2,'[{\"changed\": {\"fields\": [\"Category\", \"Tags\", \"Image\", \"Students\"]}}]',8,1),(17,'2021-09-09 07:48:20.449261','5','test5',3,'',8,1),(18,'2021-09-09 07:49:00.838976','6','test5',1,'[{\"added\": {}}]',8,1),(19,'2021-09-09 07:57:40.424075','1','test couse',2,'[{\"changed\": {\"fields\": [\"Is public\"]}}]',8,1),(20,'2021-09-09 08:35:36.405926','1','Student_Course object (1)',1,'[{\"added\": {}}]',25,1),(21,'2021-09-09 08:36:20.168475','2','Student_Course object (2)',1,'[{\"added\": {}}]',25,1),(22,'2021-09-09 09:33:33.131193','3','Student_Course object (3)',1,'[{\"added\": {}}]',25,1),(23,'2021-09-09 11:47:37.762845','1','English',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',7,1),(24,'2021-09-09 11:49:11.643130','1','English for beginer',2,'[{\"changed\": {\"fields\": [\"Name course\", \"Image\"]}}]',8,1),(25,'2021-09-09 11:50:31.656904','2','English for kids',2,'[{\"changed\": {\"fields\": [\"Name course\", \"Category\", \"Is public\", \"Image\"]}}]',8,1),(26,'2021-09-09 11:55:29.376733','1','English Teacher',1,'[{\"added\": {}}]',9,1),(27,'2021-09-09 11:55:53.794133','2','designer',1,'[{\"added\": {}}]',9,1),(28,'2021-09-09 11:56:10.585843','3','helloword',1,'[{\"added\": {}}]',16,1),(29,'2021-09-09 11:56:26.065902','6','test5',2,'[{\"changed\": {\"fields\": [\"Teacher\"]}}]',8,1),(30,'2021-09-09 14:49:57.275860','7','test url',1,'[{\"added\": {}}]',8,1),(31,'2021-09-10 02:09:49.063669','2','design',1,'[{\"added\": {}}]',7,1),(32,'2021-09-10 02:10:05.885739','3','test3',2,'[{\"changed\": {\"fields\": [\"Category\", \"Teacher\", \"Is public\"]}}]',8,1),(33,'2021-09-10 02:54:20.606435','2','ThuThuy',2,'[{\"changed\": {\"fields\": [\"Avatar\"]}}]',6,1),(34,'2021-09-11 02:58:17.172537','4','test4',2,'[{\"changed\": {\"fields\": [\"Tags\"]}}]',8,1),(35,'2021-09-11 02:58:49.207726','14','name',3,'',12,1),(36,'2021-09-11 02:58:49.261323','13','1',3,'',12,1),(37,'2021-09-11 02:58:49.320564','12','g',3,'',12,1),(38,'2021-09-11 02:58:49.370800','11','a',3,'',12,1),(39,'2021-09-11 02:58:49.420360','9','hihi',3,'',12,1),(40,'2021-09-11 02:58:49.470420','7','t',3,'',12,1),(41,'2021-09-11 02:58:49.529701','6','tagg',3,'',12,1),(42,'2021-09-12 02:13:55.395457','7','meo2',2,'[{\"changed\": {\"fields\": [\"Active\"]}}]',6,1),(43,'2021-09-12 02:31:09.554270','7','meo2',2,'[{\"changed\": {\"fields\": [\"Active\"]}}]',6,1),(44,'2021-09-12 02:36:19.695005','8','testUser',1,'[{\"added\": {}}]',6,1),(45,'2021-09-12 03:31:07.532924','7','meo2',2,'[{\"changed\": {\"fields\": [\"Active\"]}}]',6,1),(46,'2021-09-12 08:56:12.799196','1','admin',1,'[{\"added\": {}}]',16,1),(47,'2021-09-12 08:57:38.499375','6','test owner perm',2,'[{\"changed\": {\"fields\": [\"Name course\", \"Subject\", \"Category\", \"Teacher\"]}}]',8,1),(48,'2021-09-13 01:48:48.434121','1','Video 1',1,'[{\"added\": {}}]',14,1),(49,'2021-09-13 01:49:14.316286','2','video 2',1,'[{\"added\": {}}]',14,1),(50,'2021-09-13 07:22:53.619422','3','Web application',1,'[{\"added\": {}}]',7,9),(51,'2021-09-13 07:23:05.978855','18','ReactJs',1,'[{\"added\": {}}]',12,9),(52,'2021-09-13 07:23:32.584065','8','Khóa học Reactjs',1,'[{\"added\": {}}]',8,9),(53,'2021-09-13 07:24:15.406604','4','Student_Course object (4)',1,'[{\"added\": {}}]',25,9),(54,'2021-09-13 07:24:46.523815','2','Cùng Học Trình Nào Các Bạn',1,'[{\"added\": {}}]',10,9),(55,'2021-09-13 14:32:25.551590','5','Student_Course object (5)',1,'[{\"added\": {}}]',25,9),(56,'2021-09-13 14:32:42.093111','6','Student_Course object (6)',1,'[{\"added\": {}}]',25,9),(57,'2021-09-13 14:35:53.544218','9','tuan',2,'[{\"changed\": {\"fields\": [\"Avatar\"]}}]',6,9),(58,'2021-09-13 14:44:04.536675','3','Java Basic',1,'[{\"added\": {}}]',14,9),(59,'2021-09-13 16:47:41.277959','1','Teacher',1,'[{\"added\": {}}]',3,9),(60,'2021-09-13 16:48:01.332913','2','ThuThuy',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',6,9),(61,'2021-09-17 01:06:48.518232','10','tuan1',1,'[{\"added\": {}}]',6,9),(62,'2021-09-17 01:19:36.601367','4','tuan joned Khóa học Reactjs',3,'',25,9),(63,'2021-09-17 01:22:31.904064','8','Khóa học Reactjs',2,'[{\"changed\": {\"fields\": [\"Is public\"]}}]',8,9),(64,'2021-09-17 03:15:14.966942','8','tuan joned Khóa học Reactjs',2,'[{\"changed\": {\"fields\": [\"Rate\", \"Review\"]}}]',25,9),(65,'2021-09-17 04:18:53.804354','8','tuan joned Khóa học Reactjs',2,'[{\"changed\": {\"fields\": [\"Access\"]}}]',25,9),(66,'2021-09-17 05:42:35.545010','9','tuan1 joned Khóa học Reactjs',3,'',25,9),(67,'2021-09-17 05:54:12.316613','14','tuan1 joned test3',3,'',25,9),(68,'2021-09-17 05:54:12.344121','13','tuan1 joned test4',3,'',25,9),(69,'2021-09-17 05:54:12.367380','12','tuan1 joned test owner perm',3,'',25,9),(70,'2021-09-17 05:54:12.393406','11','tuan1 joned test url',3,'',25,9),(71,'2021-09-17 05:54:12.418391','10','tuan1 joned Khóa học Reactjs',3,'',25,9),(72,'2021-09-17 06:01:16.710739','8','tuan joned Khóa học Reactjs',3,'',25,9),(73,'2021-09-17 06:01:16.737748','7','tuan joned test url',3,'',25,9),(74,'2021-09-17 06:22:09.804817','19','AngularJs',1,'[{\"added\": {}}]',12,9),(75,'2021-09-17 06:22:22.266354','9','Angular Basic',1,'[{\"added\": {}}]',8,9),(76,'2021-09-17 06:23:04.397282','17','tuan joned Angular Basic',2,'[{\"changed\": {\"fields\": [\"Rate\", \"Review\"]}}]',25,9),(77,'2021-09-17 06:23:58.008184','18','tuan1 joned Angular Basic',2,'[{\"changed\": {\"fields\": [\"Rate\", \"Review\"]}}]',25,9),(78,'2021-09-17 14:14:54.476076','3','Developer',1,'[{\"added\": {}}]',9,9),(79,'2021-09-17 14:14:57.011848','9','tuan',2,'[{\"changed\": {\"fields\": [\"ActiveTeacher\", \"Job\"]}}]',16,9),(80,'2021-09-17 14:19:40.597014','19','tuan joned Khóa học Reactjs',2,'[{\"changed\": {\"fields\": [\"Access\"]}}]',25,9),(81,'2021-09-17 14:23:00.643609','15','tuan1 joned Khóa học Reactjs',2,'[{\"changed\": {\"fields\": [\"Access\"]}}]',25,9),(82,'2021-09-17 14:23:13.289644','19','tuan joned Khóa học Reactjs',2,'[{\"changed\": {\"fields\": [\"Access\"]}}]',25,9),(83,'2021-09-17 14:23:25.269910','6','helloword joned Khóa học Reactjs',2,'[{\"changed\": {\"fields\": [\"Access\"]}}]',25,9),(84,'2021-09-18 03:52:56.276137','17','tuan joned Angular Basic',2,'[{\"changed\": {\"fields\": [\"Access\"]}}]',25,9),(85,'2021-09-18 20:40:06.603748','9','tuan',2,'[{\"changed\": {\"fields\": [\"ActiveTeacher\"]}}]',16,9),(86,'2021-09-18 20:40:24.589402','9','tuan',2,'[{\"changed\": {\"fields\": [\"ActiveTeacher\"]}}]',16,9),(87,'2021-09-20 01:01:29.466227','19','tuan joned Khóa học Reactjs',2,'[{\"changed\": {\"fields\": [\"Access\"]}}]',25,9),(88,'2021-09-20 02:33:49.887062','3','test3',2,'[{\"changed\": {\"fields\": [\"Subject\", \"Teacher\"]}}]',8,9),(89,'2021-09-22 13:27:50.878411','19','tuan joned Khóa học Reactjs',3,'',25,9),(90,'2021-09-22 14:33:48.391931','1','lesson test 1',2,'[{\"changed\": {\"fields\": [\"Course\"]}}]',10,9),(91,'2021-09-22 14:42:42.648219','1','Cùng',2,'[{\"changed\": {\"fields\": [\"Subject\"]}}]',10,9),(92,'2021-09-22 15:39:33.163378','23','tuan joned Khóa học Reactjs',2,'[{\"changed\": {\"fields\": [\"Course\"]}}]',25,9),(93,'2021-09-22 15:44:17.041804','23','tuan joned Khóa học Reactjs',2,'[]',25,9),(94,'2021-09-22 15:56:40.434240','8','Khóa học Reactjs',2,'[{\"changed\": {\"fields\": [\"Teacher\"]}}]',8,9),(95,'2021-09-22 16:04:13.582491','8','Khóa học Reactjs',2,'[{\"changed\": {\"fields\": [\"Teacher\"]}}]',8,9),(96,'2021-09-22 16:04:27.840722','23','tuan joned Khóa học Reactjs',2,'[{\"changed\": {\"fields\": [\"Access\"]}}]',25,9),(97,'2021-09-22 16:07:51.109159','23','tuan joned Khóa học Reactjs',2,'[{\"changed\": {\"fields\": [\"Access\"]}}]',25,9),(98,'2021-09-23 03:06:28.543832','2','Cùng Học Trình Nào Các Bạn',2,'[{\"changed\": {\"fields\": [\"Active\"]}}]',10,9),(99,'2021-09-23 03:08:16.648845','2','Cùng Học Trình Nào Các Bạn',2,'[{\"changed\": {\"fields\": [\"Active\"]}}]',10,9),(100,'2021-09-23 09:55:46.603362','1','Student_Lesson object (1)',1,'[{\"added\": {}}]',26,9),(101,'2021-09-23 09:57:20.662803','1','tuan complete Cùng',2,'[]',26,9),(102,'2021-09-23 12:17:35.826914','1','tuan complete Cùng Học Trình Nào Các Bạn',2,'[{\"changed\": {\"fields\": [\"Lesson\"]}}]',26,9),(103,'2021-09-23 12:20:24.712988','2','ThuThuy complete Cùng',1,'[{\"added\": {}}]',26,9),(104,'2021-09-23 13:12:03.533839','2','tuan complete Cùng',2,'[{\"changed\": {\"fields\": [\"Student\"]}}]',26,9),(105,'2021-09-23 13:15:07.821901','2','tuan complete Cùng',2,'[{\"changed\": {\"fields\": [\"Complete\"]}}]',26,9);
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
  `app_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(7,'courses','category'),(8,'courses','course'),(15,'courses','file'),(19,'courses','follow'),(13,'courses','groupchat'),(18,'courses','homework'),(9,'courses','job'),(10,'courses','lesson'),(17,'courses','message'),(11,'courses','skill'),(25,'courses','student_course'),(26,'courses','student_lesson'),(12,'courses','tag'),(16,'courses','teacher'),(6,'courses','user'),(14,'courses','video'),(21,'oauth2_provider','accesstoken'),(20,'oauth2_provider','application'),(22,'oauth2_provider','grant'),(24,'oauth2_provider','idtoken'),(23,'oauth2_provider','refreshtoken'),(5,'sessions','session');
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
  `app` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2021-09-06 10:58:47.322833'),(2,'contenttypes','0002_remove_content_type_name','2021-09-06 10:58:47.407319'),(3,'auth','0001_initial','2021-09-06 10:58:47.734802'),(4,'auth','0002_alter_permission_name_max_length','2021-09-06 10:58:47.790351'),(5,'auth','0003_alter_user_email_max_length','2021-09-06 10:58:47.806859'),(6,'auth','0004_alter_user_username_opts','2021-09-06 10:58:47.808399'),(7,'auth','0005_alter_user_last_login_null','2021-09-06 10:58:47.808399'),(8,'auth','0006_require_contenttypes_0002','2021-09-06 10:58:47.824109'),(9,'auth','0007_alter_validators_add_error_messages','2021-09-06 10:58:47.824109'),(10,'auth','0008_alter_user_username_max_length','2021-09-06 10:58:47.839764'),(11,'auth','0009_alter_user_last_name_max_length','2021-09-06 10:58:47.844627'),(12,'auth','0010_alter_group_name_max_length','2021-09-06 10:58:47.902400'),(13,'auth','0011_update_proxy_permissions','2021-09-06 10:58:47.910456'),(14,'auth','0012_alter_user_first_name_max_length','2021-09-06 10:58:47.910456'),(15,'courses','0001_initial','2021-09-06 10:58:50.548815'),(16,'admin','0001_initial','2021-09-06 10:58:50.887744'),(17,'admin','0002_logentry_remove_auto_add','2021-09-06 10:58:50.903408'),(18,'admin','0003_logentry_add_action_flag_choices','2021-09-06 10:58:50.903408'),(19,'sessions','0001_initial','2021-09-06 10:58:50.955126'),(20,'courses','0002_auto_20210908_0944','2021-09-08 02:44:57.849370'),(21,'oauth2_provider','0001_initial','2021-09-08 12:56:49.661709'),(22,'oauth2_provider','0002_auto_20190406_1805','2021-09-08 12:56:49.899908'),(23,'oauth2_provider','0003_auto_20201211_1314','2021-09-08 12:56:50.007700'),(24,'oauth2_provider','0004_auto_20200902_2022','2021-09-08 12:56:50.463636'),(25,'courses','0003_auto_20210909_1044','2021-09-09 03:45:03.071665'),(26,'courses','0004_alter_course_teacher','2021-09-09 07:14:43.524777'),(27,'courses','0005_auto_20210909_1447','2021-09-09 07:47:18.740986'),(28,'courses','0006_auto_20210909_1528','2021-09-09 08:28:46.464011'),(29,'courses','0007_rename_rare_student_course_rate','2021-09-09 08:37:24.441023'),(30,'courses','0008_auto_20210909_1703','2021-09-09 10:03:35.721900'),(31,'courses','0009_auto_20210909_2148','2021-09-09 14:48:47.501704'),(32,'courses','0010_alter_student_course_rate','2021-09-12 01:45:44.331787'),(33,'courses','0011_course_subject','2021-09-12 07:20:12.123081'),(34,'courses','0012_auto_20210913_0855','2021-09-13 01:55:55.843585'),(35,'courses','0013_rename_lession_file_lesson','2021-09-13 01:56:32.063923'),(36,'courses','0014_student_course_access','2021-09-15 14:22:32.402261'),(37,'courses','0015_auto_20210923_1653','2021-09-23 09:54:30.555914'),(38,'courses','0016_alter_student_lesson_lesson','2021-09-23 12:19:48.105403'),(39,'courses','0017_alter_student_lesson_lesson','2021-09-23 13:40:47.786621');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('c9xkchcoq6q0gg0ltj32349ctrr844yl','.eJxVjDsOgzAQRO_iOrJs_CVles5g7XrXMUkEEoYqyt0DEkVSjTTvzbxFgm2taWu8pJHEVfTi8tsh5CdPB6AHTPdZ5nlalxHlociTNjnMxK_b6f4dVGh1Xysq2TJ6S2AyWYPO8p7WOc06cNYBIBqtVNdH42PpKEKJhZE9sgsoPl8HADjG:1mR7Fi:I_Xysn-ksf8OfdhkOcxuoPq54bVRnNELlsOxjafbYyw','2021-10-01 06:21:38.439644'),('e95bjc25y17a94ne3i5uikgiwjiy1vif','.eJxVjDsOgzAQRO_iOrJs_CVles5g7XrXMUkEEoYqyt0DEkVSjTTvzbxFgm2taWu8pJHEVfTi8tsh5CdPB6AHTPdZ5nlalxHlociTNjnMxK_b6f4dVGh1Xysq2TJ6S2AyWYPO8p7WOc06cNYBIBqtVNdH42PpKEKJhZE9sgsoPl8HADjG:1mTOps:IWjhHLTZEe-thZI99jP3wlFa6La6hSLOQyxAl8781qI','2021-10-07 13:32:24.419645'),('hfjj0jgtznjghy2jioasg3o0b4mn8p3z','.eJxVjEEOwiAQRe_C2hCYVigu3fcMzTAzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFWn3y0iPaTsgO9YblVTLesyR70r-qBNj5XleT3cv4OMLX_reCbgzjvrvZBIEAiG2IPvwfgEHB3ajjgmMczoBurRhAgpWTJAQ1DvD_tLOLo:1mPb4g:YzOLN0vBd7dXL9U1c_2lGxShfHpR1TfHZeeD6TKz74I','2021-09-27 01:47:58.844013'),('k8brwwe191jmphgr2zdfeigv4fzyvaq5','.eJxVjMEOwiAQRP-FsyHgBlg8evcbyC5spWpoUtqT8d9tkx50jvPezFslWpea1i5zGou6KKtOvx1TfkrbQXlQu086T22ZR9a7og_a9W0q8roe7t9BpV63tYTi0NgYsw_eWSNA_ryFogHDgFEQ0LAbuAwYMQQGZs4IwbHP0anPF7oHNyk:1mNuZG:5WDAYm1HDEir5nG_vlcMsmYtubsxd69zebinjZ0ZwW0','2021-09-22 10:12:34.321036'),('n4ojsgeuwpo4dozuo3rorsu2t782t3pp','.eJxVjDsOgzAQRO_iOrJs_CVles5g7XrXMUkEEoYqyt0DEkVSjTTvzbxFgm2taWu8pJHEVfTi8tsh5CdPB6AHTPdZ5nlalxHlociTNjnMxK_b6f4dVGh1Xysq2TJ6S2AyWYPO8p7WOc06cNYBIBqtVNdH42PpKEKJhZE9sgsoPl8HADjG:1mPgIL:0dPb08MY7dfsz8u0vnX2KlvMBEYhpcKObODH9AEj4tQ','2021-09-27 07:22:25.096977'),('qj3o28exzzckfaio15izvm39z4ah4ji0','.eJxVjDsOgzAQRO_iOrJs_CVles5g7XrXMUkEEoYqyt0DEkVSjTTvzbxFgm2taWu8pJHEVfTi8tsh5CdPB6AHTPdZ5nlalxHlociTNjnMxK_b6f4dVGh1Xysq2TJ6S2AyWYPO8p7WOc06cNYBIBqtVNdH42PpKEKJhZE9sgsoPl8HADjG:1mTOkD:gDVM74wb_Xoeqwb0GwcPEyPXfHqIRoq79gCvOx_r9Ls','2021-10-07 13:26:33.424937');
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
  `token` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `expires` datetime(6) NOT NULL,
  `scope` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_accesstoken`
--

LOCK TABLES `oauth2_provider_accesstoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_accesstoken` DISABLE KEYS */;
INSERT INTO `oauth2_provider_accesstoken` VALUES (1,'Wd6WUf5x7v9FO6FPkGaAvbO8vFzxqy','2021-09-08 23:17:11.007708','read write',1,1,'2021-09-08 13:17:11.007708','2021-09-08 13:17:11.007708',NULL,NULL),(2,'NM4TxHb0rtYbrvITQUWbtmOjOneG4y','2021-09-08 23:56:37.160630','read write',1,1,'2021-09-08 13:56:37.160630','2021-09-08 13:56:37.160630',NULL,NULL),(3,'fgT4cMWHZ2ao5QoFSf86KUszdqxAKq','2021-09-09 00:00:20.066905','read write',1,4,'2021-09-08 14:00:20.066905','2021-09-08 14:00:20.066905',NULL,NULL),(4,'KOPIIHTqWAPjB25ZuQAHstcEtGvjMK','2021-09-09 01:51:00.468311','read write',1,4,'2021-09-08 15:51:00.469307','2021-09-08 15:51:00.469307',NULL,NULL),(5,'hNa3irFIq7WkXh2edLlA9Q258nnW2l','2021-09-11 17:41:12.157758','read write',1,1,'2021-09-11 07:41:12.157758','2021-09-11 07:41:12.157758',NULL,NULL),(6,'4Phkx2k6jHtNpF8l7uFAMsf5vRXLog','2021-09-12 12:10:28.076268','read write',1,7,'2021-09-12 02:10:28.076268','2021-09-12 02:10:28.076268',NULL,NULL),(7,'Rd75u6kUw9NT4hRxaHrsZyNawavl6X','2021-09-12 13:31:11.273496','read write',1,7,'2021-09-12 03:31:11.274494','2021-09-12 03:31:11.274494',NULL,NULL),(8,'lcH6tIYqSceq67BLhhT9NdMIUfbRdS','2021-09-12 13:35:23.082464','read write',1,7,'2021-09-12 03:35:23.082464','2021-09-12 03:35:23.082464',NULL,NULL),(9,'Tb6w5gVvoUf8gC9xwKsChn3SZuqmCZ','2021-09-12 13:42:54.021238','read write',1,7,'2021-09-12 03:42:54.022233','2021-09-12 03:42:54.022233',NULL,NULL),(10,'HiuLOWb9RrWpTsTv8myENIhRhjVOLG','2021-09-12 13:43:08.846692','read write',1,7,'2021-09-12 03:43:08.847687','2021-09-12 03:43:08.847687',NULL,NULL),(11,'7Id9iICVCsyUFV91GwVNwNlCpxD4O7','2021-09-12 18:24:53.707352','read write',1,2,'2021-09-12 08:24:53.707352','2021-09-12 08:24:53.707352',NULL,NULL),(12,'TfNr1lnXqWzRM31hG33hK47ccAO1d4','2021-09-12 18:49:46.737972','read write',1,2,'2021-09-12 08:49:46.738968','2021-09-12 08:49:46.738968',NULL,NULL),(13,'fNgGL3v0M1Jv50D64YbkW8o3velQMW','2021-09-12 19:41:11.101643','read write',1,1,'2021-09-12 09:41:11.102599','2021-09-12 09:41:11.102599',NULL,NULL),(14,'OpwbQDYdugDhTroTvQ6q83HEdMeoLo','2021-09-14 21:41:06.641872','read write',1,9,'2021-09-14 11:41:06.641872','2021-09-14 11:41:06.641872',NULL,NULL),(15,'dbwINGtLKVuIXbCQDwMFdV4kgR0mfL','2021-09-14 22:46:13.206611','read write',1,9,'2021-09-14 12:46:13.206611','2021-09-14 12:46:13.206611',NULL,NULL),(16,'ssOdlrrfmIMa0a0Z9H622pu7rl273h','2021-09-15 11:42:25.111693','read write',1,9,'2021-09-15 01:42:25.112691','2021-09-15 01:42:25.112691',NULL,NULL),(17,'4v6koFx8DpgnNi44CThQiHxDOl2uo8','2021-09-15 13:49:22.765828','read write',1,9,'2021-09-15 03:49:22.766828','2021-09-15 03:49:22.766828',NULL,NULL),(18,'3BjSfZ9tGDoCogYD3vFvLbYqIXPUGI','2021-09-15 13:49:50.037269','read write',1,9,'2021-09-15 03:49:50.037269','2021-09-15 03:49:50.037269',NULL,NULL),(19,'wg9eBaZ8mSxRTXNUFHzPReA9gfOE5q','2021-09-15 13:50:13.898585','read write',1,9,'2021-09-15 03:50:13.899585','2021-09-15 03:50:13.899585',NULL,NULL),(20,'BC4qEOXXpCNpJeyjxQ2zXa0mL8HAZC','2021-09-15 13:50:25.180419','read write',1,9,'2021-09-15 03:50:25.181419','2021-09-15 03:50:25.181419',NULL,NULL),(21,'kUYYQnVuAgHKcIgtltPhIKVYHrD3Bq','2021-09-15 13:50:47.765383','read write',1,9,'2021-09-15 03:50:47.765383','2021-09-15 03:50:47.765383',NULL,NULL),(22,'hyYDnkyN8kn9TDe8YsRI8gacgxBDSC','2021-09-15 13:53:35.900159','read write',1,9,'2021-09-15 03:53:35.901161','2021-09-15 03:53:35.901161',NULL,NULL),(23,'LZCmBbM05iRJmu2vvaQRggWEUog3UX','2021-09-15 14:04:12.586250','read write',1,9,'2021-09-15 04:04:12.586250','2021-09-15 04:04:12.586250',NULL,NULL),(24,'vBVtUtymwSBEEDWaKkB3Nl5hl6SVTM','2021-09-15 14:05:46.172586','read write',1,9,'2021-09-15 04:05:46.172586','2021-09-15 04:05:46.172586',NULL,NULL),(25,'JI4UMftbWc1aWXzaOVkaimrVhVg8sD','2021-09-15 14:06:22.750915','read write',1,9,'2021-09-15 04:06:22.750915','2021-09-15 04:06:22.750915',NULL,NULL),(26,'nMZjaDNOOvaeyeoO3S4UpNyvC1HJ3g','2021-09-15 14:34:31.672982','read write',1,9,'2021-09-15 04:34:31.673982','2021-09-15 04:34:31.673982',NULL,NULL),(27,'uaoydeiORkavNEFDZlmEaUGAKLHNiQ','2021-09-15 16:50:03.853593','read write',1,9,'2021-09-15 06:50:03.854595','2021-09-15 06:50:03.854595',NULL,NULL),(28,'qpQSPXgn9nVLwFoP4ohh9s71hMsve4','2021-09-15 16:56:47.595117','read write',1,9,'2021-09-15 06:56:47.595117','2021-09-15 06:56:47.595117',NULL,NULL),(29,'s2CIpuOpwaqQPBSsXilvW63lvV3Zma','2021-09-15 16:59:27.565114','read write',1,9,'2021-09-15 06:59:27.566114','2021-09-15 06:59:27.566114',NULL,NULL),(30,'K6SDuDbqm1qt2wKUdejzZH7ntuN1Mq','2021-09-15 17:01:53.547317','read write',1,9,'2021-09-15 07:01:53.547317','2021-09-15 07:01:53.547317',NULL,NULL),(31,'6qb0cfd4esKf0DbNZSRSRm2y1CpGop','2021-09-15 18:50:41.805309','read write',1,9,'2021-09-15 08:50:41.805309','2021-09-15 08:50:41.805309',NULL,NULL),(32,'rVZblQI29Cc3DeOHkG0mh3nUaQWAnt','2021-09-15 18:51:14.989560','read write',1,9,'2021-09-15 08:51:14.990561','2021-09-15 08:51:14.990561',NULL,NULL),(33,'KujxIQO5DtfyFowVIxvHo1V1IPjqaO','2021-09-15 18:59:47.959932','read write',1,9,'2021-09-15 08:59:47.960935','2021-09-15 08:59:47.960935',NULL,NULL),(34,'rVDrGPoWgnhoeI8Q0lTmZASqTh7C2l','2021-09-15 19:02:30.498332','read write',1,9,'2021-09-15 09:02:30.499333','2021-09-15 09:02:30.499333',NULL,NULL),(35,'Lz5aPxP2k8oXV6eW1a72dOWNihct66','2021-09-15 19:03:22.227075','read write',1,9,'2021-09-15 09:03:22.227075','2021-09-15 09:03:22.227075',NULL,NULL),(36,'f1MNDfRgrZW1E4NQGuD5o51xlAeWcE','2021-09-15 19:13:59.135862','read write',1,9,'2021-09-15 09:13:59.135862','2021-09-15 09:13:59.135862',NULL,NULL),(37,'8rTuFvJxOeOgr3JMEg6VD6mxqH1e0J','2021-09-15 19:15:08.017352','read write',1,9,'2021-09-15 09:15:08.017352','2021-09-15 09:15:08.017352',NULL,NULL),(38,'1L1ojU4C8yg3LVnZm7q4sSx4j34Mes','2021-09-15 23:36:04.047592','read write',1,9,'2021-09-15 13:36:04.047592','2021-09-15 13:36:04.047592',NULL,NULL),(39,'zwfPdMS1cjdxiTw9y1w0XDRabsK42D','2021-09-16 00:06:53.167705','read write',1,9,'2021-09-15 14:06:53.168706','2021-09-15 14:06:53.168706',NULL,NULL),(40,'yl277GqedxyjDt0gwMlPTB6gO2919T','2021-09-16 00:09:50.504751','read write',1,9,'2021-09-15 14:09:50.505753','2021-09-15 14:09:50.505753',NULL,NULL),(41,'IYKQOon7SGw8eLZkFbRPPEGtKGoITr','2021-09-16 00:17:27.869878','read write',1,9,'2021-09-15 14:17:27.869878','2021-09-15 14:17:27.869878',NULL,NULL),(42,'PmcyCLJEata4UDgpYb83pLdpafCOhO','2021-09-16 00:38:45.889392','read write',1,9,'2021-09-15 14:38:45.890564','2021-09-15 14:38:45.890564',NULL,NULL),(43,'gUw6jodwM7oTfJ2uQQ6DeZdMnknqEP','2021-09-16 13:00:34.226780','read write',1,9,'2021-09-16 03:00:34.226780','2021-09-16 03:00:34.226780',NULL,NULL),(44,'czibyh4jc3ZvRG50FwU5AyJwtGh1si','2021-09-17 13:08:33.581737','read write',1,9,'2021-09-17 03:08:33.582738','2021-09-17 03:08:33.582738',NULL,NULL),(45,'rPZs089EdiYODDkzXSQH6G3BAYi2Iv','2021-09-17 13:39:08.602444','read write',1,9,'2021-09-17 03:39:08.603444','2021-09-17 03:39:08.603444',NULL,NULL),(46,'v8mr9ADzK9oeJgQhay9h25DzxXe7Dz','2021-09-17 14:20:28.207948','read write',1,10,'2021-09-17 04:20:28.208950','2021-09-17 04:20:28.208950',NULL,NULL),(47,'XviApYNPMi0is0hIK5V00VAyycxIQn','2021-09-17 14:23:21.026611','read write',1,10,'2021-09-17 04:23:21.027611','2021-09-17 04:23:21.027611',NULL,NULL),(48,'ZbIJitdstC0GEk372YqbcQDVSsPicR','2021-09-17 14:23:37.090721','read write',1,9,'2021-09-17 04:23:37.091720','2021-09-17 04:23:37.091720',NULL,NULL),(49,'a2oaNEuxvhLQLrAN8ydRpQCIOlAAzq','2021-09-17 14:28:53.326315','read write',1,9,'2021-09-17 04:28:53.326315','2021-09-17 04:28:53.326315',NULL,NULL),(50,'yw9oauzQQIGnx3eRL4RPS0Dg6z29im','2021-09-17 14:32:33.827486','read write',1,9,'2021-09-17 04:32:33.827486','2021-09-17 04:32:33.827486',NULL,NULL),(51,'Nk7QuGdy5SviKMiJQA3WKUcsPlbfrw','2021-09-17 14:32:52.074700','read write',1,10,'2021-09-17 04:32:52.075701','2021-09-17 04:32:52.075701',NULL,NULL),(52,'8oFgJTyC7BfLnYq8D0fdJ2vfIJnvyg','2021-09-17 14:34:59.079821','read write',1,10,'2021-09-17 04:34:59.079821','2021-09-17 04:34:59.079821',NULL,NULL),(53,'fRhcs8fjbPB6h9PHe9DKArFdFWFokQ','2021-09-17 16:00:04.699252','read write',1,9,'2021-09-17 06:00:04.699252','2021-09-17 06:00:04.699252',NULL,NULL),(54,'GtnWcUDy2bqqGoNDe5BaHVSQwbIhBj','2021-09-17 16:09:11.380592','read write',1,9,'2021-09-17 06:09:11.380592','2021-09-17 06:09:11.381592',NULL,NULL),(55,'LtH0OU80Ya76nvE0hc5sZFZLuDI4V1','2021-09-17 16:13:10.173066','read write',1,9,'2021-09-17 06:13:10.173066','2021-09-17 06:13:10.173066',NULL,NULL),(56,'TYxZzqdZqCPVDNdcLezgrWaS3518ui','2021-09-17 16:15:18.405788','read write',1,9,'2021-09-17 06:15:18.405788','2021-09-17 06:15:18.405788',NULL,NULL),(57,'lAA6aBUwYsxdVCISV2Tm3sM4pkKuer','2021-09-17 16:15:36.210775','read write',1,9,'2021-09-17 06:15:36.210775','2021-09-17 06:15:36.210775',NULL,NULL),(58,'exK4shn2YGxZpruiBHVnd9zxSVw4z5','2021-09-17 16:16:13.005012','read write',1,9,'2021-09-17 06:16:13.006011','2021-09-17 06:16:13.006011',NULL,NULL),(59,'EVjb3CCgrQndmhMTi1xRezklRJQecI','2021-09-17 16:16:42.532191','read write',1,9,'2021-09-17 06:16:42.533198','2021-09-17 06:16:42.533198',NULL,NULL),(60,'4upZqZiyDB7eR5TWriw8IEJXRDSFWG','2021-09-17 16:19:42.698850','read write',1,9,'2021-09-17 06:19:42.699854','2021-09-17 06:19:42.699854',NULL,NULL),(61,'CgtKNSq9PleChiEiRprslV7CN8SWW5','2021-09-17 16:23:24.445600','read write',1,10,'2021-09-17 06:23:24.445600','2021-09-17 06:23:24.445600',NULL,NULL),(62,'FES0DikH3RpnXovQhsCAFhh2xdcnm5','2021-09-17 19:35:37.475040','read write',1,9,'2021-09-17 09:35:37.476040','2021-09-17 09:35:37.476040',NULL,NULL),(63,'glLprVc1y9nUz7CeVfZ14vyuXFyYgr','2021-09-17 23:45:29.189191','read write',1,10,'2021-09-17 13:45:29.190192','2021-09-17 13:45:29.190192',NULL,NULL),(64,'IHLApJ8fcvbSnLskox14CWqG3UqWSQ','2021-09-17 23:46:55.706576','read write',1,9,'2021-09-17 13:46:55.706576','2021-09-17 13:46:55.706576',NULL,NULL),(65,'zVPFHhU1dFUq95q15zLtpwUX3uuU38','2021-09-17 23:47:06.274943','read write',1,10,'2021-09-17 13:47:06.275944','2021-09-17 13:47:06.275944',NULL,NULL),(66,'49aVRWwmpDOotqKW2t8RkD6uMDGQvF','2021-09-17 23:50:59.730134','read write',1,9,'2021-09-17 13:50:59.730134','2021-09-17 13:50:59.730134',NULL,NULL),(67,'sPXJBPKJDyIc1M1LzsJBKfx6c1i8Yi','2021-09-17 23:51:44.059744','read write',1,9,'2021-09-17 13:51:44.059744','2021-09-17 13:51:44.059744',NULL,NULL),(68,'Hw9G6UoKnkAqrgcdkqS2eYgqS0r33J','2021-09-17 23:51:54.718375','read write',1,9,'2021-09-17 13:51:54.719377','2021-09-17 13:51:54.719377',NULL,NULL),(69,'7D0EyKAFOb0U89EH7nTM8EdpjTNoGl','2021-09-18 17:35:56.190150','read write',1,9,'2021-09-18 07:35:56.190150','2021-09-18 07:35:56.190150',NULL,NULL),(70,'RkEmRgY1SsfuCiyUcQGjermopVBOV1','2021-09-19 06:39:02.644589','read write',1,9,'2021-09-18 20:39:02.645592','2021-09-18 20:39:02.645592',NULL,NULL),(71,'ZcOzzwRSknLqeScHVqqGLjuH7caw3a','2021-09-19 13:31:07.511761','read write',1,9,'2021-09-19 03:31:07.512261','2021-09-19 03:31:07.512261',NULL,NULL),(72,'p763mQ3uIUToGxEjvL2ZXIketTKc9l','2021-09-20 11:08:57.746656','read write',1,10,'2021-09-20 01:08:57.747156','2021-09-20 01:08:57.747156',NULL,NULL),(73,'yLWnvaeJCTq7rjDwQogWwAJHu2Twkj','2021-09-20 11:28:55.187059','read write',1,9,'2021-09-20 01:28:55.187559','2021-09-20 01:28:55.187559',NULL,NULL),(74,'7AMkkY4JI8k3TISgWTN8oCCwnJ4nuN','2021-09-20 12:33:59.425216','read write',1,9,'2021-09-20 02:33:59.425718','2021-09-20 02:33:59.425718',NULL,NULL),(75,'pmt9obyr8ckCi0YaGdmEa7figweyG5','2021-09-20 12:53:47.773299','read write',1,10,'2021-09-20 02:53:47.773800','2021-09-20 02:53:47.773800',NULL,NULL),(76,'5w4wwZOrLIF7W8BsT6Ej1ZzzuDopCg','2021-09-20 12:55:40.766176','read write',1,9,'2021-09-20 02:55:40.766676','2021-09-20 02:55:40.766676',NULL,NULL),(77,'1kZo2SY05Pg3wxKXSZ8J3QZUPOmCEv','2021-09-20 20:39:01.578739','read write',1,10,'2021-09-20 10:39:01.579239','2021-09-20 10:39:01.579239',NULL,NULL),(78,'xKnlsIFBpWvRFkM2uhGUc8CSQ5OoEs','2021-09-20 20:40:18.902521','read write',1,10,'2021-09-20 10:40:18.903022','2021-09-20 10:40:18.903022',NULL,NULL),(79,'uyhEltq29dWphLQDOIP4f6HD2GtKlV','2021-09-21 09:51:03.477795','read write',1,9,'2021-09-20 23:51:03.477795','2021-09-20 23:51:03.477795',NULL,NULL),(80,'g3kATHjzYJHtCU66MFhl1djk2rs846','2021-09-21 20:23:42.306131','read write',1,9,'2021-09-21 10:23:42.307134','2021-09-21 10:23:42.307134',NULL,NULL),(81,'JjwBJ14gu4JYM2bt5EUJ85OtTvGgmL','2021-09-21 20:30:48.971032','read write',1,9,'2021-09-21 10:30:48.971524','2021-09-21 10:30:48.971524',NULL,NULL),(82,'9EStCDwnKuxVID1jLo7q7YNqE8ymFl','2021-09-21 21:38:37.328911','read write',1,9,'2021-09-21 11:38:37.329412','2021-09-21 11:38:37.329412',NULL,NULL),(83,'jxNDXV4ONVCWwT3Ys2Yp7lCho6lHbk','2021-09-21 21:46:37.316513','read write',1,9,'2021-09-21 11:46:37.317011','2021-09-21 11:46:37.317011',NULL,NULL),(84,'IIPqpQPYHqAturd4kNOlkHFLRtViBi','2021-09-21 21:47:09.077011','read write',1,9,'2021-09-21 11:47:09.077512','2021-09-21 11:47:09.077512',NULL,NULL),(85,'I7RY3KS4iqx5uMi0XwfF2wLfkm0X35','2021-09-21 21:47:37.190665','read write',1,9,'2021-09-21 11:47:37.191165','2021-09-21 11:47:37.191165',NULL,NULL),(86,'O5fNgkiUo9a3C4IMDA8MOER1PG0NSw','2021-09-21 21:48:55.256021','read write',1,9,'2021-09-21 11:48:55.256522','2021-09-21 11:48:55.256522',NULL,NULL),(87,'nQV7SPcRwrODCN52JhdTmzi8HDITPz','2021-09-21 21:50:01.716555','read write',1,9,'2021-09-21 11:50:01.717054','2021-09-21 11:50:01.717054',NULL,NULL),(88,'Y2Q8sVaXfxvFvrCsiBscUDY3QPMXVY','2021-09-21 21:57:39.531123','read write',1,9,'2021-09-21 11:57:39.531123','2021-09-21 11:57:39.531123',NULL,NULL),(89,'vzr2KV0E4BMdaKzVajLHDJazkVwRD3','2021-09-21 21:58:08.810596','read write',1,9,'2021-09-21 11:58:08.811099','2021-09-21 11:58:08.811099',NULL,NULL),(90,'5DPNABxM0TWzeyk3nAG99JZj4XeeZr','2021-09-21 22:05:41.363196','read write',1,9,'2021-09-21 12:05:41.363696','2021-09-21 12:05:41.363696',NULL,NULL),(91,'m8UXuYMko3MHCBF5SDZuoJlM1cS2MB','2021-09-21 22:05:41.443709','read write',1,9,'2021-09-21 12:05:41.443709','2021-09-21 12:05:41.443709',NULL,NULL),(92,'kmDyuBLqqpIU3CsJUntbcsv7F6TRj9','2021-09-21 22:05:47.386970','read write',1,9,'2021-09-21 12:05:47.387972','2021-09-21 12:05:47.387972',NULL,NULL),(93,'iYDyXykFrdqpRv3U7nxrnh2dvNFWj2','2021-09-21 22:06:27.729137','read write',1,9,'2021-09-21 12:06:27.729637','2021-09-21 12:06:27.729637',NULL,NULL),(94,'XikucYEK4O6NmdPGbPN620ao6lxhCr','2021-09-21 22:06:47.173176','read write',1,9,'2021-09-21 12:06:47.173677','2021-09-21 12:06:47.173677',NULL,NULL),(95,'MtS9XMGFOkULXOvWezGGDLzc8mvHas','2021-09-21 22:09:40.749648','read write',1,9,'2021-09-21 12:09:40.750149','2021-09-21 12:09:40.750149',NULL,NULL),(96,'EzUkg00yFiZ54jXOwjS14bKTu6FgIC','2021-09-21 22:09:48.656567','read write',1,9,'2021-09-21 12:09:48.657069','2021-09-21 12:09:48.657069',NULL,NULL),(97,'wQCogPdtkTuq5vcZuOiRZfgpYEzEeA','2021-09-21 22:09:51.248433','read write',1,9,'2021-09-21 12:09:51.248433','2021-09-21 12:09:51.248433',NULL,NULL),(98,'Df0gbP71oF2fQtTW6M611jYOy2SwxZ','2021-09-21 22:10:21.686846','read write',1,9,'2021-09-21 12:10:21.687346','2021-09-21 12:10:21.687346',NULL,NULL),(99,'sADQZPFgqPaTWfrrtxtWBncKzNMnpK','2021-09-21 22:10:59.125600','read write',1,9,'2021-09-21 12:10:59.126101','2021-09-21 12:10:59.126101',NULL,NULL),(100,'aGisJ3iVw2wzEuwALnWkwm5im3Bt0b','2021-09-21 22:11:41.871640','read write',1,9,'2021-09-21 12:11:41.872140','2021-09-21 12:11:41.872140',NULL,NULL),(101,'XZgWRpyejoB20sFcN2dsZMORVm5xd3','2021-09-21 22:11:52.958243','read write',1,10,'2021-09-21 12:11:52.958744','2021-09-21 12:11:52.958744',NULL,NULL),(102,'IhB2R78jFuowGWZk3TdlMbvhUZ89lJ','2021-09-21 22:12:11.198515','read write',1,9,'2021-09-21 12:12:11.199014','2021-09-21 12:12:11.199014',NULL,NULL),(103,'VGOKgpZShIk6TD3PwCDuuxo6YHW0PH','2021-09-22 03:27:54.371987','read write',1,9,'2021-09-21 17:27:54.372487','2021-09-21 17:27:54.372487',NULL,NULL),(104,'XkOLb1uTFfYNzCBikF7iY1R8MUemcc','2021-09-22 03:28:51.665396','read write',1,9,'2021-09-21 17:28:51.665896','2021-09-21 17:28:51.665896',NULL,NULL),(105,'7nB7YlMZcO053zGWiJWEypLAc9qLoO','2021-09-22 03:29:21.583424','read write',1,9,'2021-09-21 17:29:21.583924','2021-09-21 17:29:21.583924',NULL,NULL),(106,'iDDe1p6A77cOG0z5W2dj1WxtssVy2N','2021-09-22 14:13:59.484705','read write',1,9,'2021-09-22 04:13:59.485223','2021-09-22 04:13:59.485223',NULL,NULL),(107,'6TWhpKo29IWltGIoJHYEmgZPZ4ZQP9','2021-09-22 19:25:59.339212','read write',1,9,'2021-09-22 09:25:59.339714','2021-09-22 09:25:59.339714',NULL,NULL),(108,'uSW9ptRudu7i7yWUO2DN2A7bHZjq73','2021-09-22 19:26:38.777881','read write',1,10,'2021-09-22 09:26:38.778381','2021-09-22 09:26:38.778381',NULL,NULL),(109,'Yi8zx4B0TQHCwnvBce24Vc9hkFvRsw','2021-09-22 19:26:58.552257','read write',1,9,'2021-09-22 09:26:58.552257','2021-09-22 09:26:58.552257',NULL,NULL),(110,'0gubhjN0hrh6GdqOVSE7UIgp2G4Tfz','2021-09-23 12:52:19.331715','read write',1,9,'2021-09-23 02:52:19.332215','2021-09-23 02:52:19.332215',NULL,NULL),(111,'5cLjg114qF0BeCGS6rxIfAvBQq8F4A','2021-09-23 12:53:14.968495','read write',1,9,'2021-09-23 02:53:14.968995','2021-09-23 02:53:14.968995',NULL,NULL),(112,'eNOchkjrDuQIqOqn61DOydOgTaYBhg','2021-09-23 12:55:36.790136','read write',1,9,'2021-09-23 02:55:36.790136','2021-09-23 02:55:36.790136',NULL,NULL),(113,'tCT6RMl1HUwUOKG1TynyU5GycFWOBy','2021-09-23 12:55:36.855147','read write',1,9,'2021-09-23 02:55:36.855646','2021-09-23 02:55:36.855646',NULL,NULL),(114,'5Zcc0NvSrwwyc5jrbrTDCZqlZ6qK2C','2021-09-23 12:55:52.071437','read write',1,9,'2021-09-23 02:55:52.071996','2021-09-23 02:55:52.071996',NULL,NULL);
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
  `client_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `redirect_uris` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `client_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `authorization_grant_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `client_secret` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `skip_authorization` tinyint(1) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `algorithm` varchar(5) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `client_id` (`client_id`),
  KEY `oauth2_provider_application_user_id_79829054_fk_courses_user_id` (`user_id`),
  KEY `oauth2_provider_application_client_secret_53133678` (`client_secret`),
  CONSTRAINT `oauth2_provider_application_user_id_79829054_fk_courses_user_id` FOREIGN KEY (`user_id`) REFERENCES `courses_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
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
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `expires` datetime(6) NOT NULL,
  `redirect_uri` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `scope` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `application_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `code_challenge` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `code_challenge_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `nonce` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `claims` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT (_utf8mb3''),
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `oauth2_provider_gran_application_id_81923564_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_grant_user_id_e8f62af8_fk_courses_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_gran_application_id_81923564_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_grant_user_id_e8f62af8_fk_courses_user_id` FOREIGN KEY (`user_id`) REFERENCES `courses_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
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
  `jti` char(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `expires` datetime(6) NOT NULL,
  `scope` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
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
  `token` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_refreshtoken`
--

LOCK TABLES `oauth2_provider_refreshtoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_refreshtoken` DISABLE KEYS */;
INSERT INTO `oauth2_provider_refreshtoken` VALUES (1,'frzbxvd7jqxxoJwX3YVL0jtITc6cTS',1,1,1,'2021-09-08 13:17:11.007708','2021-09-08 13:17:11.007708',NULL),(2,'UfEIVM0ObidvW6HHf5DkkKPeG5Qf2S',2,1,1,'2021-09-08 13:56:37.160630','2021-09-08 13:56:37.160630',NULL),(3,'XmZNw2lk6aUinGSOPeJIVtnROfh8cn',3,1,4,'2021-09-08 14:00:20.074956','2021-09-08 14:00:20.074956',NULL),(4,'LQpEUxFa8LELvwzgTRUrfnUJxtRrrM',4,1,4,'2021-09-08 15:51:00.493679','2021-09-08 15:51:00.493679',NULL),(5,'8QwCcw1FB31UBFE2jr7p0eJEGJ5Dhf',5,1,1,'2021-09-11 07:41:12.222702','2021-09-11 07:41:12.222702',NULL),(6,'nwdEKFbKOqeBacPB45vqolIOHxYFne',6,1,7,'2021-09-12 02:10:28.101516','2021-09-12 02:10:28.101516',NULL),(7,'0GQvFycRAG7fBzU8Mm4j7WH8gtEM1O',7,1,7,'2021-09-12 03:31:11.295010','2021-09-12 03:31:11.295010',NULL),(8,'kJAl3d9jZ8KvcDDJOlT5bivfiKAwJ5',8,1,7,'2021-09-12 03:35:23.102412','2021-09-12 03:35:23.102412',NULL),(9,'vQl5WxImjfI0YrJwf4NABYZA9dg6ih',9,1,7,'2021-09-12 03:42:54.038801','2021-09-12 03:42:54.038801',NULL),(10,'gDXO2XdGdA6Bb94xU11WsHI9XBpJm3',10,1,7,'2021-09-12 03:43:08.862834','2021-09-12 03:43:08.862834',NULL),(11,'Tz63bbN5wG8Uj9IyhFUAy6oCfA8ICj',11,1,2,'2021-09-12 08:24:53.733132','2021-09-12 08:24:53.733132',NULL),(12,'euO9APztHrlGS4K4OBxL70Jiby2GQ6',12,1,2,'2021-09-12 08:49:46.760943','2021-09-12 08:49:46.760943',NULL),(13,'C1cqPFd98X8rc8hoXe9zM2hgyeDLe0',13,1,1,'2021-09-12 09:41:11.129111','2021-09-12 09:41:11.129111',NULL),(14,'431Jf8XCkQCdKM0CCQFqa4go8ULyZW',14,1,9,'2021-09-14 11:41:06.706009','2021-09-14 11:41:06.706009',NULL),(15,'JaCXsFH4VhsNf26COtUm0DNbMva6qF',15,1,9,'2021-09-14 12:46:13.239460','2021-09-14 12:46:13.239460',NULL),(16,'ReCtkoWpllnngwjte2PQKVE2xFb1V4',16,1,9,'2021-09-15 01:42:25.141702','2021-09-15 01:42:25.141702',NULL),(17,'mxs021W1es5IWtdaZ4O55aqfqAJ6N6',17,1,9,'2021-09-15 03:49:22.797834','2021-09-15 03:49:22.797834',NULL),(18,'PBChqkvoRwIXqoWuf9rB3i7eP44Cj6',18,1,9,'2021-09-15 03:49:50.067282','2021-09-15 03:49:50.067282',NULL),(19,'ibJyu7TaqE0CKApXUxwAzPa441ydz3',19,1,9,'2021-09-15 03:50:13.928590','2021-09-15 03:50:13.928590',NULL),(20,'rS7aEPtkPSf3pMY0N46CfPvlBZLHcD',20,1,9,'2021-09-15 03:50:25.205424','2021-09-15 03:50:25.205424',NULL),(21,'HkenuMGL6Kp8b9w7mzM5oWzfQBTgkh',21,1,9,'2021-09-15 03:50:47.809396','2021-09-15 03:50:47.809396',NULL),(22,'mtFmFXD5eWVgYfw9bYTAPz49PpAq35',22,1,9,'2021-09-15 03:53:35.928167','2021-09-15 03:53:35.928167',NULL),(23,'aOMyIdH3Q5O4jGuPbbJTUuMTGwEPxt',23,1,9,'2021-09-15 04:04:12.614259','2021-09-15 04:04:12.614259',NULL),(24,'yZjvsMN2xkx7CaqwWPeDu1IP26CVRO',24,1,9,'2021-09-15 04:05:46.200590','2021-09-15 04:05:46.200590',NULL),(25,'paJ8C7ChnawShd3KjeXVDBGdibfN5p',25,1,9,'2021-09-15 04:06:22.785923','2021-09-15 04:06:22.785923',NULL),(26,'MHEbRvMwZvX0Dn5D5PhedS9pEuYQuG',26,1,9,'2021-09-15 04:34:31.700990','2021-09-15 04:34:31.700990',NULL),(27,'sFpCU7FsoX8QTOGkm7VdxhbqDl5wsz',27,1,9,'2021-09-15 06:50:03.883600','2021-09-15 06:50:03.883600',NULL),(28,'Kp2jVECv058cXL0yUHk0lrAqpc0esx',28,1,9,'2021-09-15 06:56:47.626126','2021-09-15 06:56:47.626126',NULL),(29,'izGQ40iP6iXAnXhhLM6wmh5BFcQmfG',29,1,9,'2021-09-15 06:59:27.592120','2021-09-15 06:59:27.592120',NULL),(30,'ZiEHscw8iAvoErKpNtTip2L27gJ1UI',30,1,9,'2021-09-15 07:01:53.573323','2021-09-15 07:01:53.573323',NULL),(31,'pgCxgNRdQx82MKva82LLrrhBB7wKrn',31,1,9,'2021-09-15 08:50:41.831314','2021-09-15 08:50:41.832314',NULL),(32,'VV5CuorzuA9ekh7uEUQaHYgMz8q3Bp',32,1,9,'2021-09-15 08:51:15.017566','2021-09-15 08:51:15.017566',NULL),(33,'a04ylVh3HybuvmdLqgEqL0ThTUEhDD',33,1,9,'2021-09-15 08:59:47.985952','2021-09-15 08:59:47.985952',NULL),(34,'2AA6sOMo9gELlK55NP9nFdYTXMJtuw',34,1,9,'2021-09-15 09:02:30.525326','2021-09-15 09:02:30.525326',NULL),(35,'vmrLf7SFayeYeuDME7uMnDuAjioBae',35,1,9,'2021-09-15 09:03:22.253081','2021-09-15 09:03:22.253081',NULL),(36,'acmHEHiAJkjezmXcMbxL277Lgsomg4',36,1,9,'2021-09-15 09:13:59.163813','2021-09-15 09:13:59.163813',NULL),(37,'Pzr9POaAIWB28sUYN6rKiC2MhsHl3l',37,1,9,'2021-09-15 09:15:08.048359','2021-09-15 09:15:08.048359',NULL),(38,'OC2yX2EowKO7spfw9dxlYoC1OJPdLB',38,1,9,'2021-09-15 13:36:04.078597','2021-09-15 13:36:04.078597',NULL),(39,'xjl8F4LjI9wHAoo8gFWJzPV8MHpank',39,1,9,'2021-09-15 14:06:53.198709','2021-09-15 14:06:53.198709',NULL),(40,'wfnSPJzWyA3Irxq4Kb4XYHjzaJq3MY',40,1,9,'2021-09-15 14:09:50.536637','2021-09-15 14:09:50.536637',NULL),(41,'nBGga2vaGy0169G8GYzZThSKYSd18D',41,1,9,'2021-09-15 14:17:27.896883','2021-09-15 14:17:27.896883',NULL),(42,'EpzLo6ffVWlWd5pGNuFOlbHBGGz5wV',42,1,9,'2021-09-15 14:38:45.943393','2021-09-15 14:38:45.943393',NULL),(43,'D2oZnsoenlVeNKs42oB0ktJUpDJw6o',43,1,9,'2021-09-16 03:00:34.253812','2021-09-16 03:00:34.253812',NULL),(44,'9xs0kk1HWOtkP01oPmJGXgrvCsXtOG',44,1,9,'2021-09-17 03:08:33.625743','2021-09-17 03:08:33.625743',NULL),(45,'tFhuJmBB6aaAYSxouzbT5uGXFvQD4X',45,1,9,'2021-09-17 03:39:08.631451','2021-09-17 03:39:08.631451',NULL),(46,'gIuniCpnQfwO8kCKe7SQwohgWTMfdC',46,1,10,'2021-09-17 04:20:28.251274','2021-09-17 04:20:28.251274',NULL),(47,'Z4RAfgQIiKUDBdoWluLU20V53CxbD8',47,1,10,'2021-09-17 04:23:21.058611','2021-09-17 04:23:21.058611',NULL),(48,'bWsoSYaJHqmqxK160ghId3YAlkYucp',48,1,9,'2021-09-17 04:23:37.117728','2021-09-17 04:23:37.117728',NULL),(49,'cTSTf2GWZ2J79XiXl71wwJAAnVgbqs',49,1,9,'2021-09-17 04:28:53.356322','2021-09-17 04:28:53.356322',NULL),(50,'FBxhHBrYDr10J8PW75RtitaVKSvPTb',50,1,9,'2021-09-17 04:32:33.859066','2021-09-17 04:32:33.859066',NULL),(51,'jdYXJ81rSGkWfrQjPjXsGGF8ogh6nf',51,1,10,'2021-09-17 04:32:52.104686','2021-09-17 04:32:52.104686',NULL),(52,'z9iprrppLkJHJLVpBNraXe6ZVqlqzL',52,1,10,'2021-09-17 04:34:59.107395','2021-09-17 04:34:59.107395',NULL),(53,'46E5heUZKaTSOcCgGmBiaKIgmfDxei',53,1,9,'2021-09-17 06:00:04.738262','2021-09-17 06:00:04.738262',NULL),(54,'9b6ON7zUnHM3aRoPfNh8pRe8uNpA8k',54,1,9,'2021-09-17 06:09:11.409600','2021-09-17 06:09:11.409600',NULL),(55,'vLntbcEVfs8H5js8UpiPHHVb0QmJRv',55,1,9,'2021-09-17 06:13:10.202073','2021-09-17 06:13:10.202073',NULL),(56,'5vy6JB0ubIjWPS5ngoqFnsMgzOWznq',56,1,9,'2021-09-17 06:15:18.431794','2021-09-17 06:15:18.431794',NULL),(57,'Wa33gdWMfCjhOipfodnUXoUMPyV38Y',57,1,9,'2021-09-17 06:15:36.237780','2021-09-17 06:15:36.237780',NULL),(58,'93BnZxki7PyW5aZtxSIeHRw3OmepED',58,1,9,'2021-09-17 06:16:13.036018','2021-09-17 06:16:13.036018',NULL),(59,'ux1JktQwAUowA5Y297RCU4v1zxpV8O',59,1,9,'2021-09-17 06:16:42.558484','2021-09-17 06:16:42.558484',NULL),(60,'yP4AruFEyEuFGEJAr4UCqv8R0WpFiN',60,1,9,'2021-09-17 06:19:42.730858','2021-09-17 06:19:42.730858',NULL),(61,'C44n7t6nZKI7FNs66jyXN92Ox4GKtW',61,1,10,'2021-09-17 06:23:24.474604','2021-09-17 06:23:24.474604',NULL),(62,'keHeofGDO51HK7rIfdX0Bbo05uYPVF',62,1,9,'2021-09-17 09:35:37.531053','2021-09-17 09:35:37.531053',NULL),(63,'ofLrnH4A4I8MwdY52ln6hm4j0iQjnq',63,1,10,'2021-09-17 13:45:29.220199','2021-09-17 13:45:29.220199',NULL),(64,'GRIhNWeJ0Bu52z9a0byEuiZCsnyqoU',64,1,9,'2021-09-17 13:46:55.734582','2021-09-17 13:46:55.734582',NULL),(65,'FzpUXFv9s2cmaJRb2Z8iGX6NE1ziiE',65,1,10,'2021-09-17 13:47:06.302964','2021-09-17 13:47:06.302964',NULL),(66,'WtNpKN9eGOrsvYpQdPQMAyKqbJK3eO',66,1,9,'2021-09-17 13:50:59.756142','2021-09-17 13:50:59.756142',NULL),(67,'w9nGU2DSRbtTIYWFAF3oaEbkbhxh2q',67,1,9,'2021-09-17 13:51:44.087751','2021-09-17 13:51:44.087751',NULL),(68,'pFTVk6tJRsskMeQ6Hhei7cD0uLgT6S',68,1,9,'2021-09-17 13:51:54.748382','2021-09-17 13:51:54.748382',NULL),(69,'YNx2uQumzfgzTkjfdlAaVToSJPnY6Q',69,1,9,'2021-09-18 07:35:56.231160','2021-09-18 07:35:56.231160',NULL),(70,'ftgrXI2xsSWclj6zdAdUp3S0st35Xh',70,1,9,'2021-09-18 20:39:02.673597','2021-09-18 20:39:02.673597',NULL),(71,'EFCIeI6st8CfYwJsms3MtwLAUJ24Ma',71,1,9,'2021-09-19 03:31:07.567588','2021-09-19 03:31:07.567588',NULL),(72,'YRImyczsy9i2725fQY38Ng1fdqHtko',72,1,10,'2021-09-20 01:08:57.794691','2021-09-20 01:08:57.794691',NULL),(73,'ibhmHIbrHGv7pEXHBHr3DeKgfkuD8C',73,1,9,'2021-09-20 01:28:55.217063','2021-09-20 01:28:55.217063',NULL),(74,'Rv0FlqfyyruSFpsW1pXKyP8UtsbMO7',74,1,9,'2021-09-20 02:33:59.453722','2021-09-20 02:33:59.453722',NULL),(75,'6VfnZdH0VA7WkEwSiiAe6WDM1fB7Yt',75,1,10,'2021-09-20 02:53:47.801294','2021-09-20 02:53:47.801294',NULL),(76,'CoPfFzljsg85pi5Y3c43XSwy6LzuHS',76,1,9,'2021-09-20 02:55:40.796829','2021-09-20 02:55:40.796829',NULL),(77,'IDJgdjYXmbCCeJ0CfQe8FFEcMLSCOG',77,1,10,'2021-09-20 10:39:01.620841','2021-09-20 10:39:01.620841',NULL),(78,'tIyUUXd3LBC1d1qZvWHN1By201TlIS',78,1,10,'2021-09-20 10:40:18.931034','2021-09-20 10:40:18.931034',NULL),(79,'Jl3NBfHvmul2Uw4ZlrRbiIfxCJRU5l',79,1,9,'2021-09-20 23:51:03.507316','2021-09-20 23:51:03.507316',NULL),(80,'ns4LLxJsJeUDvNYXAs8kW9w4quc13Y',80,1,9,'2021-09-21 10:23:42.358450','2021-09-21 10:23:42.358450',NULL),(81,'c6C2Xlk5X3p467uQa3AZGtyFSHhh4r',81,1,9,'2021-09-21 10:30:48.997710','2021-09-21 10:30:48.997710',NULL),(82,'tMNvNhvWr1kfo378qXAZD2o6qHTHX1',82,1,9,'2021-09-21 11:38:37.354920','2021-09-21 11:38:37.354920',NULL),(83,'zwmLNlps7GQ3D4Rm9GowVPQIpybvup',83,1,9,'2021-09-21 11:46:37.351517','2021-09-21 11:46:37.351517',NULL),(84,'MmSRanZt27BrM66XPuqKVh8C8clQkK',84,1,9,'2021-09-21 11:47:09.104017','2021-09-21 11:47:09.104017',NULL),(85,'GbNUqkYkcoNt3VkOsbPVJbZbF5UExA',85,1,9,'2021-09-21 11:47:37.218169','2021-09-21 11:47:37.218169',NULL),(86,'kjQcLT3n5Wq9WWrFSMK87RyS3st8aT',86,1,9,'2021-09-21 11:48:55.283027','2021-09-21 11:48:55.283027',NULL),(87,'uUSlaEJ1gMCDALiHTrmf82PhnA2TN4',87,1,9,'2021-09-21 11:50:01.745368','2021-09-21 11:50:01.745368',NULL),(88,'tiKFCZavEfkQmZif3GDhwBEMWgwXL7',88,1,9,'2021-09-21 11:57:39.560627','2021-09-21 11:57:39.560627',NULL),(89,'DmcKjYUI6Gr5gAWq0Rc69wYW9WFWSN',89,1,9,'2021-09-21 11:58:08.837600','2021-09-21 11:58:08.837600',NULL),(90,'pXM3fMhYMXFwJxpD6BV63ChBZaRE0R',90,1,9,'2021-09-21 12:05:41.392701','2021-09-21 12:05:41.392701',NULL),(91,'Tj21rr1Bhyl56BdRWaeIOUnA64EUt7',91,1,9,'2021-09-21 12:05:41.534225','2021-09-21 12:05:41.534225',NULL),(92,'5KWmGrPTZVfXynnsAOQsNDyAPApyy5',92,1,9,'2021-09-21 12:05:47.413977','2021-09-21 12:05:47.413977',NULL),(93,'jai1BlzYAlZxcg21HBQniXZ92sPXcd',93,1,9,'2021-09-21 12:06:27.755142','2021-09-21 12:06:27.755643',NULL),(94,'f2ZqPb6dEIL4y8QUUVbTvtom4Gfx3p',94,1,9,'2021-09-21 12:06:47.199186','2021-09-21 12:06:47.199186',NULL),(95,'ewtkl4UX92xXZW6PsNibKmQQb8zgWH',95,1,9,'2021-09-21 12:09:40.778653','2021-09-21 12:09:40.778653',NULL),(96,'MXmzG7qLxJK34zL5M2lpunUDyeNzwz',96,1,9,'2021-09-21 12:09:48.683572','2021-09-21 12:09:48.683572',NULL),(97,'fhL14KoGULBmdguRA4vbwxnjjc1R56',97,1,9,'2021-09-21 12:09:51.274386','2021-09-21 12:09:51.274386',NULL),(98,'3rBiA8TpHwLVzsNxmbFWqirLIibvE5',98,1,9,'2021-09-21 12:10:21.712850','2021-09-21 12:10:21.712850',NULL),(99,'P0ZjScWB8c7net5hLqQfDuztcYOMLw',99,1,9,'2021-09-21 12:10:59.152606','2021-09-21 12:10:59.152606',NULL),(100,'5GdGNUhijwOw9i7ABUMw1paJwB19fE',100,1,9,'2021-09-21 12:11:41.899145','2021-09-21 12:11:41.899145',NULL),(101,'0dkP7r8nvXcwVuf30ACCufu03rTKYd',101,1,10,'2021-09-21 12:11:52.985749','2021-09-21 12:11:52.985749',NULL),(102,'VbYlig1oDDHdIypNYhkpOHHslcARRW',102,1,9,'2021-09-21 12:12:11.224518','2021-09-21 12:12:11.224518',NULL),(103,'ZBsrl1WemZfWYmfebsfNt0g7Os0i4t',103,1,9,'2021-09-21 17:27:54.399405','2021-09-21 17:27:54.399405',NULL),(104,'iXXfiqgkiPSmGknzlq5xDLGo4pc5Bb',104,1,9,'2021-09-21 17:28:51.691398','2021-09-21 17:28:51.691398',NULL),(105,'a1eXOeYlgMRdT5TG5R4DVOQiipuohI',105,1,9,'2021-09-21 17:29:21.613409','2021-09-21 17:29:21.613409',NULL),(106,'ZNTOOpFFFnh19PWBZAAoADRd5R3QHj',106,1,9,'2021-09-22 04:13:59.536738','2021-09-22 04:13:59.536738',NULL),(107,'Hm7KPirlXpVVvFzZrhFMgCikw4eFiA',107,1,9,'2021-09-22 09:25:59.371719','2021-09-22 09:25:59.372220',NULL),(108,'rgW1feMkaMBj2O7gW40znUVHGruMEh',108,1,10,'2021-09-22 09:26:38.813390','2021-09-22 09:26:38.813390',NULL),(109,'GcJDPRDnyEL3W4KFKqZTtlYvLvzLek',109,1,9,'2021-09-22 09:26:58.580764','2021-09-22 09:26:58.580764',NULL),(110,'CjljLNO0eIKKv6oRLt5c7qFEjYCLYw',110,1,9,'2021-09-23 02:52:19.374519','2021-09-23 02:52:19.374519',NULL),(111,'Rh4S4HGM3y6W599L6UE7NaVDcEMVEU',111,1,9,'2021-09-23 02:53:14.997499','2021-09-23 02:53:14.997499',NULL),(112,'whEBIYAhhLaNPRlPhecueB6Qffajph',112,1,9,'2021-09-23 02:55:36.816643','2021-09-23 02:55:36.816643',NULL),(113,'1nGz707xCngCVxR6toPRGJUxd7EqPV',113,1,9,'2021-09-23 02:55:36.948663','2021-09-23 02:55:36.948663',NULL),(114,'CRj3orjZaKc6XX6myjLzbnF2SDB3WN',114,1,9,'2021-09-23 02:55:52.101205','2021-09-23 02:55:52.101205',NULL);
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

-- Dump completed on 2021-09-23 20:41:50