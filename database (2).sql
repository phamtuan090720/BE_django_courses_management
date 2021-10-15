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
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add user',6,'add_user'),(22,'Can change user',6,'change_user'),(23,'Can delete user',6,'delete_user'),(24,'Can view user',6,'view_user'),(25,'Can add category',7,'add_category'),(26,'Can change category',7,'change_category'),(27,'Can delete category',7,'delete_category'),(28,'Can view category',7,'view_category'),(29,'Can add course',8,'add_course'),(30,'Can change course',8,'change_course'),(31,'Can delete course',8,'delete_course'),(32,'Can view course',8,'view_course'),(33,'Can add job',9,'add_job'),(34,'Can change job',9,'change_job'),(35,'Can delete job',9,'delete_job'),(36,'Can view job',9,'view_job'),(37,'Can add lesson',10,'add_lesson'),(38,'Can change lesson',10,'change_lesson'),(39,'Can delete lesson',10,'delete_lesson'),(40,'Can view lesson',10,'view_lesson'),(41,'Can add skill',11,'add_skill'),(42,'Can change skill',11,'change_skill'),(43,'Can delete skill',11,'delete_skill'),(44,'Can view skill',11,'view_skill'),(45,'Can add tag',12,'add_tag'),(46,'Can change tag',12,'change_tag'),(47,'Can delete tag',12,'delete_tag'),(48,'Can view tag',12,'view_tag'),(49,'Can add group chat',13,'add_groupchat'),(50,'Can change group chat',13,'change_groupchat'),(51,'Can delete group chat',13,'delete_groupchat'),(52,'Can view group chat',13,'view_groupchat'),(53,'Can add video',14,'add_video'),(54,'Can change video',14,'change_video'),(55,'Can delete video',14,'delete_video'),(56,'Can view video',14,'view_video'),(57,'Can add file',15,'add_file'),(58,'Can change file',15,'change_file'),(59,'Can delete file',15,'delete_file'),(60,'Can view file',15,'view_file'),(61,'Can add teacher',16,'add_teacher'),(62,'Can change teacher',16,'change_teacher'),(63,'Can delete teacher',16,'delete_teacher'),(64,'Can view teacher',16,'view_teacher'),(65,'Can add student_ lesson',17,'add_student_lesson'),(66,'Can change student_ lesson',17,'change_student_lesson'),(67,'Can delete student_ lesson',17,'delete_student_lesson'),(68,'Can view student_ lesson',17,'view_student_lesson'),(69,'Can add student_ course',18,'add_student_course'),(70,'Can change student_ course',18,'change_student_course'),(71,'Can delete student_ course',18,'delete_student_course'),(72,'Can view student_ course',18,'view_student_course'),(73,'Can add message',19,'add_message'),(74,'Can change message',19,'change_message'),(75,'Can delete message',19,'delete_message'),(76,'Can view message',19,'view_message'),(77,'Can add home work',20,'add_homework'),(78,'Can change home work',20,'change_homework'),(79,'Can delete home work',20,'delete_homework'),(80,'Can view home work',20,'view_homework'),(81,'Can add follow',21,'add_follow'),(82,'Can change follow',21,'change_follow'),(83,'Can delete follow',21,'delete_follow'),(84,'Can view follow',21,'view_follow'),(85,'Can add application',22,'add_application'),(86,'Can change application',22,'change_application'),(87,'Can delete application',22,'delete_application'),(88,'Can view application',22,'view_application'),(89,'Can add access token',23,'add_accesstoken'),(90,'Can change access token',23,'change_accesstoken'),(91,'Can delete access token',23,'delete_accesstoken'),(92,'Can view access token',23,'view_accesstoken'),(93,'Can add grant',24,'add_grant'),(94,'Can change grant',24,'change_grant'),(95,'Can delete grant',24,'delete_grant'),(96,'Can view grant',24,'view_grant'),(97,'Can add refresh token',25,'add_refreshtoken'),(98,'Can change refresh token',25,'change_refreshtoken'),(99,'Can delete refresh token',25,'delete_refreshtoken'),(100,'Can view refresh token',25,'view_refreshtoken'),(101,'Can add id token',26,'add_idtoken'),(102,'Can change id token',26,'change_idtoken'),(103,'Can delete id token',26,'delete_idtoken'),(104,'Can view id token',26,'view_idtoken'),(105,'Can add association',27,'add_association'),(106,'Can change association',27,'change_association'),(107,'Can delete association',27,'delete_association'),(108,'Can view association',27,'view_association'),(109,'Can add code',28,'add_code'),(110,'Can change code',28,'change_code'),(111,'Can delete code',28,'delete_code'),(112,'Can view code',28,'view_code'),(113,'Can add nonce',29,'add_nonce'),(114,'Can change nonce',29,'change_nonce'),(115,'Can delete nonce',29,'delete_nonce'),(116,'Can view nonce',29,'view_nonce'),(117,'Can add user social auth',30,'add_usersocialauth'),(118,'Can change user social auth',30,'change_usersocialauth'),(119,'Can delete user social auth',30,'delete_usersocialauth'),(120,'Can view user social auth',30,'view_usersocialauth'),(121,'Can add partial',31,'add_partial'),(122,'Can change partial',31,'change_partial'),(123,'Can delete partial',31,'delete_partial'),(124,'Can view partial',31,'view_partial');
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
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
  `name_course` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `fee` decimal(5,2) NOT NULL,
  `is_public` tinyint(1) NOT NULL,
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` bigint DEFAULT NULL,
  `teacher_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_course_teacher_id_846fa526_fk_courses_teacher_user_id` (`teacher_id`),
  KEY `courses_course_category_id_d64b93bf_fk_courses_category_id` (`category_id`),
  CONSTRAINT `courses_course_category_id_d64b93bf_fk_courses_category_id` FOREIGN KEY (`category_id`) REFERENCES `courses_category` (`id`),
  CONSTRAINT `courses_course_teacher_id_846fa526_fk_courses_teacher_user_id` FOREIGN KEY (`teacher_id`) REFERENCES `courses_teacher` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_course`
--

LOCK TABLES `courses_course` WRITE;
/*!40000 ALTER TABLE `courses_course` DISABLE KEYS */;
INSERT INTO `courses_course` VALUES (63,'2021-10-08 16:10:00.534976','2021-10-11 18:10:39.165619',1,'Angular Front-end','You will learn about Angular 9','<h2><strong>What you\'ll learn</strong></h2><ul><li>Build amazing single page applications using Angular 5+</li><li>Master Angular concepts</li><li>Understand the file and folder structure of an Angular application</li><li>Build a client management application with authentication and Firebase\'s Firestore</li><li>Integrate Bootstrap 4 into Angular projects.</li></ul><h2><strong>Who this course is for:</strong></h2><ul><li>Anyone that wants to learn Angular 5+</li></ul>',0.00,1,'static/courses/2021/10/angular_uNHGZSZ.png',3,9),(64,'2021-10-08 16:34:51.122134','2021-10-13 21:13:40.197511',1,'React - The Complete Guide (incl Hooks, React Router, Redux)','Dive in and learn React.js from scratch! Learn Reactjs, Hooks, Redux, React Routing, Animations, Next.js and way more!','<h2><strong>What you\'ll learn</strong></h2><ul><li>Build powerful, fast, user-friendly and reactive web apps</li><li>Provide amazing user experiences by leveraging the power of JavaScript with ease</li><li>Apply for high-paid jobs or work as a freelancer in one the most-demanded sectors you can find in web dev right now</li><li>Learn all about React Hooks and React Components</li></ul><h2><strong>Requirements:</strong></h2><ul><li>JavaScript + HTML + CSS fundamentals are absolutely required</li><li>You DON\'T need to be a JavaScript expert to succeed in this course!</li><li>ES6+ JavaScript knowledge is beneficial but not a must-have</li><li>NO prior React or any other JS framework experience is required!</li></ul><h2><strong>Who this course is for:</strong></h2><ul><li>Students who want to learn how to build reactive and fast web apps</li><li>Anyone who\'s interested in learning an extremely popular technology used by leading tech companies like Netflix</li><li>Students who want to take their web development skills to the next level and learn a future-proof technology</li></ul>',0.00,0,'static/courses/2021/10/react-logo_FbFHebP.png',3,9),(66,'2021-10-11 19:06:51.939734','2021-10-13 21:05:00.340876',1,'Python Django - The Practical Guide','Learn how to build web applications and websites with Python and the Django framework','<h2><strong>What you\'ll learn</strong></h2><ul><li>Learn how to use Python for web development with Django</li><li>Build real projects and apply what you learned in a full blog website created in the course</li><li>Choose between the full course or the included course summary to get you started quickly</li></ul><h2><strong>Requirements</strong></h2><ul><li>Basic Python and web development knowledge (HTML/ CSS) is required</li><li>NO prior Django experience is required at all</li></ul><h2><strong>Who this course is for:</strong></h2><ul><li>Python developers who want to take the next step and dive into web development with Python</li><li>JavaScript developers who want to explore Python for web development</li><li>Everyone interested in learning how to build websites with Python</li></ul>',0.00,0,'static/courses/2021/10/django-logo.png',3,31),(67,'2021-10-11 19:11:54.399085','2021-10-13 21:05:10.721183',1,'C# Intermediate: Classes, Interfaces and OOP','An in-depth, step-by-step guide to classes, interfaces and object-oriented programming (OOP) with C#','<h2><strong>What you\'ll learn</strong></h2><ul><li>Work with classes, constructors, fields, properties, methods and indexers</li><li>Use encapsulation to improve the robustness of the code and reduce the impact of change</li><li>Re-use code using inheritance and composition</li><li>Understand the problems with inheritance and how composition solves these problems</li><li>Change the behaviour of an application by extending its code, rather than changing it</li><li>Develop loosely-coupled, testable and extensible applications using interfaces.</li></ul><h2><strong>Who this course is for:</strong></h2><ul><li>Any C# developer who wants to master classes and interfaces</li><li>Any C# programmer who wants to better understand object-oriented programming</li></ul>',0.00,0,'static/courses/2021/10/fa9d4f7cf28b6f009570751504b5fbe1-1200x675.png',3,31),(68,'2021-10-11 19:19:30.617445','2021-10-11 19:19:30.651950',1,'English Basic','Approaching English at a basic level','<h2><strong>Who this course is for:</strong></h2><ul><li>every one</li></ul>',0.00,1,'static/courses/2021/10/eng.jfif',1,31),(69,'2021-10-14 09:07:44.902076','2021-10-14 10:05:26.461829',1,'Reactjs Căn Bản','Khóa học Reactjs cho người mới bắt đầu','<h2>Khóa học Reactjs gồm có gì :&nbsp;</h2><ul><li>Học và hiểu rõ về Reactjs</li></ul>',10.00,0,'static/courses/2021/10/react-logo_NwiS1iJ.png',3,40);
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
) ENGINE=InnoDB AUTO_INCREMENT=211 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_course_tags`
--

LOCK TABLES `courses_course_tags` WRITE;
/*!40000 ALTER TABLE `courses_course_tags` DISABLE KEYS */;
INSERT INTO `courses_course_tags` VALUES (198,63,57),(199,63,58),(200,63,59),(196,64,57),(201,64,58),(202,64,59),(203,66,60),(204,66,61),(205,67,62),(206,67,63),(210,69,54),(207,69,56),(209,69,64),(208,69,65);
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
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lesson_id` bigint NOT NULL,
  `active` tinyint(1) NOT NULL,
  `author_teacher_id` bigint NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `courses_file_author_teacher_id_subject_lesson_id_ca14a8e9_uniq` (`author_teacher_id`,`subject`,`lesson_id`),
  KEY `courses_file_lesson_id_c59bb4e4_fk_courses_lesson_id` (`lesson_id`),
  KEY `courses_file_author_teacher_id_2e133075_fk_courses_t` (`author_teacher_id`),
  CONSTRAINT `courses_file_author_teacher_id_2e133075_fk_courses_t` FOREIGN KEY (`author_teacher_id`) REFERENCES `courses_teacher` (`user_id`),
  CONSTRAINT `courses_file_lesson_id_c59bb4e4_fk_courses_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `courses_lesson` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_file`
--

LOCK TABLES `courses_file` WRITE;
/*!40000 ALTER TABLE `courses_file` DISABLE KEYS */;
INSERT INTO `courses_file` VALUES (10,'Tài Liệu Bài Học','static/file/2021/10/DeBai_QuanTriMang.pdf',24,1,9,'2021-10-13 21:24:20.980855','2021-10-13 21:24:21.008360'),(11,'Test','static/file/2021/10/Cybersoft-CVTong_hop_cau_hoi_phong_van_FE.pdf',26,1,40,'2021-10-14 10:07:05.585196','2021-10-14 10:07:05.613701');
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
  KEY `courses_follow_teacher_id_21804a2c_fk_courses_teacher_user_id` (`teacher_id`),
  CONSTRAINT `courses_follow_student_id_1fd9583d_fk_courses_user_id` FOREIGN KEY (`student_id`) REFERENCES `courses_user` (`id`),
  CONSTRAINT `courses_follow_teacher_id_21804a2c_fk_courses_teacher_user_id` FOREIGN KEY (`teacher_id`) REFERENCES `courses_teacher` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
  `name_group` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`course_id`),
  CONSTRAINT `courses_groupchat_course_id_50be687b_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lesson_id` bigint NOT NULL,
  `author_teacher_id` bigint NOT NULL,
  `active` tinyint(1) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `courses_homework_author_teacher_id_subjec_a6956569_uniq` (`author_teacher_id`,`subject`,`lesson_id`),
  KEY `courses_homework_lesson_id_146fe1c8_fk_courses_lesson_id` (`lesson_id`),
  KEY `courses_homework_author_teacher_id_a633e76b_fk_courses_t` (`author_teacher_id`),
  CONSTRAINT `courses_homework_author_teacher_id_a633e76b_fk_courses_t` FOREIGN KEY (`author_teacher_id`) REFERENCES `courses_teacher` (`user_id`),
  CONSTRAINT `courses_homework_lesson_id_146fe1c8_fk_courses_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `courses_lesson` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_homework`
--

LOCK TABLES `courses_homework` WRITE;
/*!40000 ALTER TABLE `courses_homework` DISABLE KEYS */;
INSERT INTO `courses_homework` VALUES (8,'Bài tập ','static/homework/2021/10/thiiiiiiiiiii.pdf','Các bạn cố gắng hoàn thành bài tập, đề bài là file đính kèm',24,9,1,'2021-10-13 21:26:27.060898','2021-10-13 21:26:27.090403'),(9,'Bài tập về nhà','static/homework/2021/10/Báo_cáo_đồ_án.docx','Hoan Thanh Bai Tap Ve Nha',26,40,1,'2021-10-14 10:07:33.948002','2021-10-14 10:07:33.986508');
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
  `name_job` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_job`
--

LOCK TABLES `courses_job` WRITE;
/*!40000 ALTER TABLE `courses_job` DISABLE KEYS */;
INSERT INTO `courses_job` VALUES (7,'Front-end Developer'),(8,'Java BE'),(9,'Tester'),(10,'Front-end Dev'),(11,'Backend-Dev');
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
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `course_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `courses_lesson_subject_course_id_f2a8d9de_uniq` (`subject`,`course_id`),
  KEY `courses_lesson_course_id_16bc4882_fk_courses_course_id` (`course_id`),
  CONSTRAINT `courses_lesson_course_id_16bc4882_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_lesson`
--

LOCK TABLES `courses_lesson` WRITE;
/*!40000 ALTER TABLE `courses_lesson` DISABLE KEYS */;
INSERT INTO `courses_lesson` VALUES (24,'2021-10-11 18:45:40.495739','2021-10-13 21:28:22.999247',1,'Angular Tutorial - 1 - Introduction','<p>Angular is a TypeScript-based open-source front-end web application platform led by the Angular Team at Google and by a community of individuals and corporations to address all of the parts of the developer\'s workflow while building complex web applications. Angular is a complete rewrite from the same team that built AngularJS. Angular is a framework for building client applications in HTML and either JavaScript or a language like TypeScript that compiles to JavaScript. Angular combines declarative templates, dependency injection, end to end tooling, and integrated best practices to solve development challenges. Angular empowers developers to build applications that live on the web, mobile, or the desktop.</p>','static/courses/2021/10/angular_xoRL8i5.png',63),(25,'2021-10-13 21:20:21.544801','2021-10-13 21:30:10.585742',1,'Angular Tutorial - 2 - Test','<p>Chưa có gì&nbsp;</p>','static/courses/2021/10/angular_h1k28zJ.png',63),(26,'2021-10-14 09:10:54.788795','2021-10-14 10:10:20.035720',1,'Test','<p>Chưa có gì</p>','static/courses/2021/10/react-logo_rQq5Wcv.png',69),(28,'2021-10-14 10:09:21.766139','2021-10-14 10:09:58.734240',1,'Test2','<p>Test2</p>','static/courses/2021/10/react-logo_6FE5SzO.png',69);
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
  `mess` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_post` datetime(6) NOT NULL,
  `user_id` bigint NOT NULL,
  `group_chat_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_message_user_id_d05207a2_fk_courses_user_id` (`user_id`),
  KEY `courses_message_group_chat_id_15a4745b_fk_courses_g` (`group_chat_id`),
  CONSTRAINT `courses_message_group_chat_id_15a4745b_fk_courses_g` FOREIGN KEY (`group_chat_id`) REFERENCES `courses_groupchat` (`course_id`),
  CONSTRAINT `courses_message_user_id_d05207a2_fk_courses_user_id` FOREIGN KEY (`user_id`) REFERENCES `courses_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
  `name_skill` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_skill`
--

LOCK TABLES `courses_skill` WRITE;
/*!40000 ALTER TABLE `courses_skill` DISABLE KEYS */;
INSERT INTO `courses_skill` VALUES (10,'Front-end'),(11,'Mysql'),(12,'Django'),(13,'test'),(14,'Tuan'),(15,'haha'),(16,'Reactjs'),(17,'Test Auto'),(18,'Angular'),(19,'Back-end'),(20,'HTML'),(21,'Css');
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
  `access` tinyint(1) NOT NULL,
  `rate` int DEFAULT NULL,
  `review` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `course_id` bigint NOT NULL,
  `student_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `courses_student_course_student_id_course_id_14ffe388_uniq` (`student_id`,`course_id`),
  KEY `courses_student_course_course_id_2048cb16_fk_courses_course_id` (`course_id`),
  CONSTRAINT `courses_student_course_course_id_2048cb16_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`),
  CONSTRAINT `courses_student_course_student_id_d6aa4404_fk_courses_user_id` FOREIGN KEY (`student_id`) REFERENCES `courses_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_student_course`
--

LOCK TABLES `courses_student_course` WRITE;
/*!40000 ALTER TABLE `courses_student_course` DISABLE KEYS */;
INSERT INTO `courses_student_course` VALUES (25,'2021-10-08 16:11:43.054728',1,3,'Tạm được',63,31),(26,'2021-10-08 16:34:21.474967',1,5,'Tạm được không quá hay lắm',63,32),(27,'2021-10-08 16:35:18.216017',1,NULL,NULL,64,32),(28,'2021-10-13 20:41:24.924444',1,NULL,NULL,63,34),(29,'2021-10-13 20:42:07.108691',0,NULL,NULL,66,34),(30,'2021-10-13 21:12:19.730348',1,5,'Quá học quá hay cố gắng phát huy nhé thầy.',63,35),(31,'2021-10-14 04:14:42.841050',1,NULL,NULL,64,35),(32,'2021-10-14 16:14:45.032462',1,4,'Qua Hay',69,35),(35,'2021-10-14 17:04:51.554252',1,5,'Qua Hay',69,9);
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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_student_lesson`
--

LOCK TABLES `courses_student_lesson` WRITE;
/*!40000 ALTER TABLE `courses_student_lesson` DISABLE KEYS */;
INSERT INTO `courses_student_lesson` VALUES (38,1,'2021-10-13 21:27:12.337253','2021-10-13 21:27:12.363184',24,35),(39,1,'2021-10-14 10:08:45.709795','2021-10-14 10:08:45.735301',26,9),(40,1,'2021-10-14 10:12:58.827068','2021-10-14 10:12:58.850072',28,35);
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
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_tag`
--

LOCK TABLES `courses_tag` WRITE;
/*!40000 ALTER TABLE `courses_tag` DISABLE KEYS */;
INSERT INTO `courses_tag` VALUES (58,'AngularJs'),(65,'Antd'),(61,'Back-end'),(62,'C#'),(64,'CSS'),(60,'Django'),(59,'Front-end'),(56,'HTML'),(57,'Nodejs'),(63,'OOP'),(54,'Reactjs'),(55,'Web');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_teacher`
--

LOCK TABLES `courses_teacher` WRITE;
/*!40000 ALTER TABLE `courses_teacher` DISABLE KEYS */;
INSERT INTO `courses_teacher` VALUES (1,1,NULL),(2,1,NULL),(9,1,7),(31,1,8),(32,1,7),(40,1,7);
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
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_teacher_skills`
--

LOCK TABLES `courses_teacher_skills` WRITE;
/*!40000 ALTER TABLE `courses_teacher_skills` DISABLE KEYS */;
INSERT INTO `courses_teacher_skills` VALUES (35,9,12),(33,9,16),(34,9,17),(22,31,10),(25,31,11),(26,31,12),(37,32,10),(36,32,16),(38,32,18),(46,40,10),(45,40,16),(47,40,20),(48,40,21);
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
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_user`
--

LOCK TABLES `courses_user` WRITE;
/*!40000 ALTER TABLE `courses_user` DISABLE KEYS */;
INSERT INTO `courses_user` VALUES (1,'pbkdf2_sha256$260000$ZPBccfZpPeNVpYumgwX12M$RfaEhADBL9imE0F7monM+HfHLzCG+9w+qc4tBF8l210=','2021-09-27 07:53:18.092306',1,'admin','','','admin@gmail.com',1,1,'2021-09-06 11:03:12.582479',''),(2,'pbkdf2_sha256$260000$KlK8Wn4fxdg5HzPpZUKFJD$+2/lobDAxLKRqvDTbRSlXpZvBdgTE2iz2dr8e0rjHQ8=','2021-09-24 15:11:04.749081',0,'ThuThuy','','','',0,1,'2021-09-07 09:12:05.000000','static/uploads/2021/09/60618778_2320937534611138_7508554572390989824_n.jpg'),(9,'pbkdf2_sha256$260000$qshugkal3tWfzWVY81NxOL$txCoGpcHxSHVadZVn3ViqwyCwI0bXYZ7SpBp+xmviq4=','2021-10-13 22:50:39.226006',1,'tuan','Tuân','Phạm','1851050167tuan@ou.edu.vn',1,1,'2021-09-13 07:22:16.000000','static/uploads/2021/10/react-logo_wlCoHd7.png'),(31,'pbkdf2_sha256$260000$c0J3Gh1ZlZFw6WdyniG9Dk$cWWh+oV811v2l2015N42jzOfjpRFlmg4X6U53KxETM0=','2021-10-08 16:25:50.417669',0,'tuan1','Phạm','Tuân','mr.tuan1749@gmail.com',0,1,'2021-10-08 15:54:34.871942','static/uploads/2021/10/Screenshot_2021-06-14_Alpaca_Vietnam_Tuyển_dụng_Front-End_Intern__QoTccNB.png'),(32,'pbkdf2_sha256$260000$i01nxv9GRUcvBjMz0nJhy4$ufuK6WKiqwhABbcJVn9E6nReMmNMG5lZlp6WTNrD2ao=',NULL,0,'tuan123','Phạm','Tuân','1851050167tuan@ou.edu.vn',0,1,'2021-10-08 16:33:58.791392','static/uploads/2021/10/angular_knCXHoC.png'),(33,'pbkdf2_sha256$260000$yZ5XNg93h0khuAKQPe2aVF$h6xua25a630LRXrJ0wxE7X0Gm7DwlUvVgzcBhw1MKWE=',NULL,0,'tuan1234','','','mr.tuan1749@gmail.com',0,1,'2021-10-08 17:05:36.933546',''),(34,'pbkdf2_sha256$260000$bPtBiLxFLawSvpsZygDxnM$dxEk56gRty2Qu0WkB2y4c4RE46u+jXgvOhSvMWE1PEQ=',NULL,0,'phamtuan_2021','','','mr.tuan1749@gmail.com',0,1,'2021-10-13 20:40:46.521434',''),(35,'pbkdf2_sha256$260000$Da8JaOxzzubeyprG0j0Tnj$mPv5jNXdk0AQXeWYWQAcXKHfbWdwc7JbQ4zEpdDFCN8=',NULL,0,'hocvien','Tuân','Phạm','mr.tuan1749@gmail.com',0,1,'2021-10-13 21:10:58.562918','static/uploads/2021/10/angular_nmbgEBs.png'),(40,'pbkdf2_sha256$260000$3N12R4767y1Zqichy9iteI$rY8Hp8yxJZf5UWmrOikjApuLri1oKg3pWFIrGIoj6ww=',NULL,0,'giangvien','Phạm','Tuân','mr.tuan1749@gmail.com',0,1,'2021-10-14 08:59:29.305123','static/uploads/2021/10/react-logo_RHl7V4e.png');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url_video` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lesson_id` bigint NOT NULL,
  `active` tinyint(1) NOT NULL,
  `author_teacher_id` bigint NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `courses_video_author_teacher_id_subject_lesson_id_de4e6d66_uniq` (`author_teacher_id`,`subject`,`lesson_id`),
  KEY `courses_video_lesson_id_59f2396e_fk_courses_lesson_id` (`lesson_id`),
  KEY `courses_video_author_teacher_id_02d43c1d_fk_courses_t` (`author_teacher_id`),
  CONSTRAINT `courses_video_author_teacher_id_02d43c1d_fk_courses_t` FOREIGN KEY (`author_teacher_id`) REFERENCES `courses_teacher` (`user_id`),
  CONSTRAINT `courses_video_lesson_id_59f2396e_fk_courses_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `courses_lesson` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_video`
--

LOCK TABLES `courses_video` WRITE;
/*!40000 ALTER TABLE `courses_video` DISABLE KEYS */;
INSERT INTO `courses_video` VALUES (15,'Introduction','https://youtu.be/0eWrpsCLMJQ',24,1,9,'2021-10-11 18:46:53.674421','2021-10-11 18:46:53.699745'),(16,'Test','https://youtu.be/0-_1-kNU-ts',24,1,9,'2021-10-13 21:22:26.121286','2021-10-13 21:23:25.762953'),(17,'Reactjs Căn Bản Bài 1','https://youtu.be/gL5HBA_1bDQ',26,1,40,'2021-10-14 09:12:01.232407','2021-10-14 09:12:01.256412');
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
  `object_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `object_repr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_courses_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_courses_user_id` FOREIGN KEY (`user_id`) REFERENCES `courses_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=387 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2021-09-08 01:45:43.667499','1','tag1',1,'[{\"added\": {}}]',12,1),(2,'2021-09-08 01:45:49.196472','2','tag2',1,'[{\"added\": {}}]',12,1),(3,'2021-09-08 01:46:23.360297','1','cate1',1,'[{\"added\": {}}]',7,1),(4,'2021-09-08 01:46:27.280973','5','test5',2,'[{\"changed\": {\"fields\": [\"Category\", \"Tags\"]}}]',8,1),(5,'2021-09-08 01:46:43.722637','4','test4',2,'[{\"changed\": {\"fields\": [\"Category\", \"Tags\"]}}]',8,1),(6,'2021-09-08 01:46:55.212643','4','test4',2,'[]',8,1),(7,'2021-09-08 02:00:36.273976','5','test5',2,'[{\"changed\": {\"fields\": [\"Active\"]}}]',8,1),(8,'2021-09-08 02:03:18.249558','5','test5',2,'[{\"changed\": {\"fields\": [\"Active\", \"Image\"]}}]',8,1),(9,'2021-09-08 02:03:31.892132','5','test5',2,'[]',8,1),(10,'2021-09-08 02:03:52.741326','5','test5',2,'[{\"changed\": {\"fields\": [\"Active\"]}}]',8,1),(11,'2021-09-08 03:29:19.644349','5','bai 1',1,'[{\"added\": {}}]',13,1),(12,'2021-09-08 03:30:35.150748','1','ThuThuy Said hello mn in group chat bai 1 at time: 2021-09-08 03:30:35.142728+00:00',1,'[{\"added\": {}}]',17,1),(13,'2021-09-09 03:48:31.614984','1','lesson test 1',1,'[{\"added\": {}}]',10,1),(14,'2021-09-09 04:32:31.221237','3','tag3',1,'[{\"added\": {}}]',12,1),(15,'2021-09-09 04:32:48.612804','5','test5',2,'[{\"changed\": {\"fields\": [\"Tags\", \"Students\"]}}]',8,1),(16,'2021-09-09 04:35:01.958839','1','test couse',2,'[{\"changed\": {\"fields\": [\"Category\", \"Tags\", \"Image\", \"Students\"]}}]',8,1),(17,'2021-09-09 07:48:20.449261','5','test5',3,'',8,1),(18,'2021-09-09 07:49:00.838976','6','test5',1,'[{\"added\": {}}]',8,1),(19,'2021-09-09 07:57:40.424075','1','test couse',2,'[{\"changed\": {\"fields\": [\"Is public\"]}}]',8,1),(20,'2021-09-09 08:35:36.405926','1','Student_Course object (1)',1,'[{\"added\": {}}]',25,1),(21,'2021-09-09 08:36:20.168475','2','Student_Course object (2)',1,'[{\"added\": {}}]',25,1),(22,'2021-09-09 09:33:33.131193','3','Student_Course object (3)',1,'[{\"added\": {}}]',25,1),(23,'2021-09-09 11:47:37.762845','1','English',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',7,1),(24,'2021-09-09 11:49:11.643130','1','English for beginer',2,'[{\"changed\": {\"fields\": [\"Name course\", \"Image\"]}}]',8,1),(25,'2021-09-09 11:50:31.656904','2','English for kids',2,'[{\"changed\": {\"fields\": [\"Name course\", \"Category\", \"Is public\", \"Image\"]}}]',8,1),(26,'2021-09-09 11:55:29.376733','1','English Teacher',1,'[{\"added\": {}}]',9,1),(27,'2021-09-09 11:55:53.794133','2','designer',1,'[{\"added\": {}}]',9,1),(28,'2021-09-09 11:56:10.585843','3','helloword',1,'[{\"added\": {}}]',16,1),(29,'2021-09-09 11:56:26.065902','6','test5',2,'[{\"changed\": {\"fields\": [\"Teacher\"]}}]',8,1),(30,'2021-09-09 14:49:57.275860','7','test url',1,'[{\"added\": {}}]',8,1),(31,'2021-09-10 02:09:49.063669','2','design',1,'[{\"added\": {}}]',7,1),(32,'2021-09-10 02:10:05.885739','3','test3',2,'[{\"changed\": {\"fields\": [\"Category\", \"Teacher\", \"Is public\"]}}]',8,1),(33,'2021-09-10 02:54:20.606435','2','ThuThuy',2,'[{\"changed\": {\"fields\": [\"Avatar\"]}}]',6,1),(34,'2021-09-11 02:58:17.172537','4','test4',2,'[{\"changed\": {\"fields\": [\"Tags\"]}}]',8,1),(35,'2021-09-11 02:58:49.207726','14','name',3,'',12,1),(36,'2021-09-11 02:58:49.261323','13','1',3,'',12,1),(37,'2021-09-11 02:58:49.320564','12','g',3,'',12,1),(38,'2021-09-11 02:58:49.370800','11','a',3,'',12,1),(39,'2021-09-11 02:58:49.420360','9','hihi',3,'',12,1),(40,'2021-09-11 02:58:49.470420','7','t',3,'',12,1),(41,'2021-09-11 02:58:49.529701','6','tagg',3,'',12,1),(42,'2021-09-12 02:13:55.395457','7','meo2',2,'[{\"changed\": {\"fields\": [\"Active\"]}}]',6,1),(43,'2021-09-12 02:31:09.554270','7','meo2',2,'[{\"changed\": {\"fields\": [\"Active\"]}}]',6,1),(44,'2021-09-12 02:36:19.695005','8','testUser',1,'[{\"added\": {}}]',6,1),(45,'2021-09-12 03:31:07.532924','7','meo2',2,'[{\"changed\": {\"fields\": [\"Active\"]}}]',6,1),(46,'2021-09-12 08:56:12.799196','1','admin',1,'[{\"added\": {}}]',16,1),(47,'2021-09-12 08:57:38.499375','6','test owner perm',2,'[{\"changed\": {\"fields\": [\"Name course\", \"Subject\", \"Category\", \"Teacher\"]}}]',8,1),(48,'2021-09-13 01:48:48.434121','1','Video 1',1,'[{\"added\": {}}]',14,1),(49,'2021-09-13 01:49:14.316286','2','video 2',1,'[{\"added\": {}}]',14,1),(50,'2021-09-13 07:22:53.619422','3','Web application',1,'[{\"added\": {}}]',7,9),(51,'2021-09-13 07:23:05.978855','18','ReactJs',1,'[{\"added\": {}}]',12,9),(52,'2021-09-13 07:23:32.584065','8','Khóa học Reactjs',1,'[{\"added\": {}}]',8,9),(53,'2021-09-13 07:24:15.406604','4','Student_Course object (4)',1,'[{\"added\": {}}]',25,9),(54,'2021-09-13 07:24:46.523815','2','Cùng Học Trình Nào Các Bạn',1,'[{\"added\": {}}]',10,9),(55,'2021-09-13 14:32:25.551590','5','Student_Course object (5)',1,'[{\"added\": {}}]',25,9),(56,'2021-09-13 14:32:42.093111','6','Student_Course object (6)',1,'[{\"added\": {}}]',25,9),(57,'2021-09-13 14:35:53.544218','9','tuan',2,'[{\"changed\": {\"fields\": [\"Avatar\"]}}]',6,9),(58,'2021-09-13 14:44:04.536675','3','Java Basic',1,'[{\"added\": {}}]',14,9),(59,'2021-09-13 16:47:41.277959','1','Teacher',1,'[{\"added\": {}}]',3,9),(60,'2021-09-13 16:48:01.332913','2','ThuThuy',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',6,9),(61,'2021-09-17 01:06:48.518232','10','tuan1',1,'[{\"added\": {}}]',6,9),(62,'2021-09-17 01:19:36.601367','4','tuan joned Khóa học Reactjs',3,'',25,9),(63,'2021-09-17 01:22:31.904064','8','Khóa học Reactjs',2,'[{\"changed\": {\"fields\": [\"Is public\"]}}]',8,9),(64,'2021-09-17 03:15:14.966942','8','tuan joned Khóa học Reactjs',2,'[{\"changed\": {\"fields\": [\"Rate\", \"Review\"]}}]',25,9),(65,'2021-09-17 04:18:53.804354','8','tuan joned Khóa học Reactjs',2,'[{\"changed\": {\"fields\": [\"Access\"]}}]',25,9),(66,'2021-09-17 05:42:35.545010','9','tuan1 joned Khóa học Reactjs',3,'',25,9),(67,'2021-09-17 05:54:12.316613','14','tuan1 joned test3',3,'',25,9),(68,'2021-09-17 05:54:12.344121','13','tuan1 joned test4',3,'',25,9),(69,'2021-09-17 05:54:12.367380','12','tuan1 joned test owner perm',3,'',25,9),(70,'2021-09-17 05:54:12.393406','11','tuan1 joned test url',3,'',25,9),(71,'2021-09-17 05:54:12.418391','10','tuan1 joned Khóa học Reactjs',3,'',25,9),(72,'2021-09-17 06:01:16.710739','8','tuan joned Khóa học Reactjs',3,'',25,9),(73,'2021-09-17 06:01:16.737748','7','tuan joned test url',3,'',25,9),(74,'2021-09-17 06:22:09.804817','19','AngularJs',1,'[{\"added\": {}}]',12,9),(75,'2021-09-17 06:22:22.266354','9','Angular Basic',1,'[{\"added\": {}}]',8,9),(76,'2021-09-17 06:23:04.397282','17','tuan joned Angular Basic',2,'[{\"changed\": {\"fields\": [\"Rate\", \"Review\"]}}]',25,9),(77,'2021-09-17 06:23:58.008184','18','tuan1 joned Angular Basic',2,'[{\"changed\": {\"fields\": [\"Rate\", \"Review\"]}}]',25,9),(78,'2021-09-17 14:14:54.476076','3','Developer',1,'[{\"added\": {}}]',9,9),(79,'2021-09-17 14:14:57.011848','9','tuan',2,'[{\"changed\": {\"fields\": [\"ActiveTeacher\", \"Job\"]}}]',16,9),(80,'2021-09-17 14:19:40.597014','19','tuan joned Khóa học Reactjs',2,'[{\"changed\": {\"fields\": [\"Access\"]}}]',25,9),(81,'2021-09-17 14:23:00.643609','15','tuan1 joned Khóa học Reactjs',2,'[{\"changed\": {\"fields\": [\"Access\"]}}]',25,9),(82,'2021-09-17 14:23:13.289644','19','tuan joned Khóa học Reactjs',2,'[{\"changed\": {\"fields\": [\"Access\"]}}]',25,9),(83,'2021-09-17 14:23:25.269910','6','helloword joned Khóa học Reactjs',2,'[{\"changed\": {\"fields\": [\"Access\"]}}]',25,9),(84,'2021-09-18 03:52:56.276137','17','tuan joned Angular Basic',2,'[{\"changed\": {\"fields\": [\"Access\"]}}]',25,9),(85,'2021-09-18 20:40:06.603748','9','tuan',2,'[{\"changed\": {\"fields\": [\"ActiveTeacher\"]}}]',16,9),(86,'2021-09-18 20:40:24.589402','9','tuan',2,'[{\"changed\": {\"fields\": [\"ActiveTeacher\"]}}]',16,9),(87,'2021-09-20 01:01:29.466227','19','tuan joned Khóa học Reactjs',2,'[{\"changed\": {\"fields\": [\"Access\"]}}]',25,9),(88,'2021-09-20 02:33:49.887062','3','test3',2,'[{\"changed\": {\"fields\": [\"Subject\", \"Teacher\"]}}]',8,9),(89,'2021-09-22 13:27:50.878411','19','tuan joned Khóa học Reactjs',3,'',25,9),(90,'2021-09-22 14:33:48.391931','1','lesson test 1',2,'[{\"changed\": {\"fields\": [\"Course\"]}}]',10,9),(91,'2021-09-22 14:42:42.648219','1','Cùng',2,'[{\"changed\": {\"fields\": [\"Subject\"]}}]',10,9),(92,'2021-09-22 15:39:33.163378','23','tuan joned Khóa học Reactjs',2,'[{\"changed\": {\"fields\": [\"Course\"]}}]',25,9),(93,'2021-09-22 15:44:17.041804','23','tuan joned Khóa học Reactjs',2,'[]',25,9),(94,'2021-09-22 15:56:40.434240','8','Khóa học Reactjs',2,'[{\"changed\": {\"fields\": [\"Teacher\"]}}]',8,9),(95,'2021-09-22 16:04:13.582491','8','Khóa học Reactjs',2,'[{\"changed\": {\"fields\": [\"Teacher\"]}}]',8,9),(96,'2021-09-22 16:04:27.840722','23','tuan joned Khóa học Reactjs',2,'[{\"changed\": {\"fields\": [\"Access\"]}}]',25,9),(97,'2021-09-22 16:07:51.109159','23','tuan joned Khóa học Reactjs',2,'[{\"changed\": {\"fields\": [\"Access\"]}}]',25,9),(98,'2021-09-23 03:06:28.543832','2','Cùng Học Trình Nào Các Bạn',2,'[{\"changed\": {\"fields\": [\"Active\"]}}]',10,9),(99,'2021-09-23 03:08:16.648845','2','Cùng Học Trình Nào Các Bạn',2,'[{\"changed\": {\"fields\": [\"Active\"]}}]',10,9),(100,'2021-09-23 09:55:46.603362','1','Student_Lesson object (1)',1,'[{\"added\": {}}]',26,9),(101,'2021-09-23 09:57:20.662803','1','tuan complete Cùng',2,'[]',26,9),(102,'2021-09-23 12:17:35.826914','1','tuan complete Cùng Học Trình Nào Các Bạn',2,'[{\"changed\": {\"fields\": [\"Lesson\"]}}]',26,9),(103,'2021-09-23 12:20:24.712988','2','ThuThuy complete Cùng',1,'[{\"added\": {}}]',26,9),(104,'2021-09-23 13:12:03.533839','2','tuan complete Cùng',2,'[{\"changed\": {\"fields\": [\"Student\"]}}]',26,9),(105,'2021-09-23 13:15:07.821901','2','tuan complete Cùng',2,'[{\"changed\": {\"fields\": [\"Complete\"]}}]',26,9),(106,'2021-09-24 14:53:25.949511','1','design',1,'[{\"added\": {}}]',11,1),(107,'2021-09-24 14:53:36.129745','2','eanglish',1,'[{\"added\": {}}]',11,1),(108,'2021-09-24 14:53:49.256731','2','english',2,'[{\"changed\": {\"fields\": [\"Name skill\"]}}]',11,1),(109,'2021-09-24 14:54:15.801720','3','Ai',1,'[{\"added\": {}}]',11,1),(110,'2021-09-24 14:54:25.440859','4','Photoshop',1,'[{\"added\": {}}]',11,1),(111,'2021-09-24 14:54:31.115636','1','admin',2,'[{\"changed\": {\"fields\": [\"Skills\"]}}]',16,1),(112,'2021-09-24 15:08:01.664398','3','helloword',2,'[{\"changed\": {\"fields\": [\"ActiveTeacher\", \"Skills\"]}}]',16,1),(113,'2021-09-24 17:13:04.663063','8','Khóa học Reactjs',2,'[{\"changed\": {\"fields\": [\"Category\", \"Teacher\"]}}]',8,9),(114,'2021-09-25 03:42:22.952742','9','Angular Basic',2,'[{\"changed\": {\"fields\": [\"Category\", \"Teacher\"]}}]',8,9),(115,'2021-09-25 03:42:33.920990','7','test url',2,'[{\"changed\": {\"fields\": [\"Category\", \"Teacher\"]}}]',8,9),(116,'2021-09-25 03:42:41.532830','6','test owner perm',2,'[{\"changed\": {\"fields\": [\"Category\", \"Teacher\"]}}]',8,9),(117,'2021-09-25 03:42:55.260108','3','test3',2,'[{\"changed\": {\"fields\": [\"Description\", \"Category\", \"Teacher\"]}}]',8,9),(118,'2021-09-25 03:43:20.490046','2','English for kids',2,'[{\"changed\": {\"fields\": [\"Category\", \"Teacher\"]}}]',8,9),(119,'2021-09-25 03:43:53.272772','1','English for beginer',2,'[{\"changed\": {\"fields\": [\"Category\", \"Teacher\"]}}]',8,9),(120,'2021-09-25 03:43:53.498809','1','English for beginer',2,'[{\"changed\": {\"fields\": [\"Category\", \"Teacher\"]}}]',8,9),(121,'2021-09-25 03:44:27.107179','9','Angular Basic',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',8,9),(122,'2021-09-25 03:44:40.444891','9','Angular Basic',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',8,9),(123,'2021-09-25 03:45:05.964171','8','Khóa học Reactjs',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',8,9),(124,'2021-09-25 03:45:23.933303','8','Khóa học Reactjs',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',8,9),(125,'2021-09-25 03:47:52.158272','4','test4',2,'[{\"changed\": {\"fields\": [\"Description\", \"Category\", \"Teacher\"]}}]',8,9),(126,'2021-09-27 07:54:23.524323','1','lesson test 1',1,'[{\"added\": {}}]',15,1),(127,'2021-09-27 07:59:01.090819','2','lesson test 1',1,'[{\"added\": {}}]',15,1),(128,'2021-09-27 08:01:54.673277','3','Video 1',1,'[{\"added\": {}}]',15,1),(129,'2021-09-27 08:17:55.368390','2','Cùng Học Trình Nào Các Bạn',2,'[]',10,9),(130,'2021-09-27 08:19:00.658634','8','Khóa học Reactjs',2,'[{\"changed\": {\"fields\": [\"Teacher\"]}}]',8,9),(131,'2021-09-27 08:19:32.644541','18','tuan joned Khóa học Reactjs',1,'[{\"added\": {}}]',18,9),(132,'2021-09-28 11:21:36.515354','8','Khóa học Reactjs',2,'[{\"changed\": {\"fields\": [\"Fee\"]}}]',8,9),(133,'2021-09-29 12:27:11.318528','18','tuan joned Khóa học Reactjs',2,'[{\"changed\": {\"fields\": [\"Access\"]}}]',18,9),(134,'2021-09-29 12:29:21.837208','10','tuan1',2,'[{\"changed\": {\"fields\": [\"Password\"]}}]',6,9),(135,'2021-09-29 12:46:00.624263','19','tuan1 joned Khóa học Reactjs',1,'[{\"added\": {}}]',18,9),(136,'2021-09-29 12:55:04.328153','3','tuan1 complete Cùng',2,'[]',17,9),(137,'2021-09-29 13:00:11.585154','3','tuan1 complete Cùng',3,'',17,9),(138,'2021-09-29 13:05:02.606089','18','tuan joned Khóa học Reactjs',2,'[{\"changed\": {\"fields\": [\"Access\"]}}]',18,9),(139,'2021-09-29 14:42:54.727444','2','tuan complete Cùng',2,'[{\"changed\": {\"fields\": [\"Complete\"]}}]',17,9),(140,'2021-09-29 14:43:42.578849','2','tuan complete Cùng',3,'',17,9),(141,'2021-09-29 14:43:42.605537','1','tuan complete Cùng Học Trình Nào Các Bạn',3,'',17,9),(142,'2021-09-29 14:49:01.658457','9','tuan complete Cùng Học Trình Nào Các Bạn',3,'',17,9),(143,'2021-09-29 14:49:01.684460','8','tuan complete Cùng',3,'',17,9),(144,'2021-09-29 14:49:01.708725','6','tuan1 complete Cùng',3,'',17,9),(145,'2021-09-29 15:03:16.611996','11','tuan complete Cùng',3,'',17,9),(146,'2021-09-29 15:03:16.638500','10','tuan complete Cùng Học Trình Nào Các Bạn',3,'',17,9),(147,'2021-09-29 15:09:48.017982','13','tuan complete Cùng Học Trình Nào Các Bạn',3,'',17,9),(148,'2021-09-29 15:09:48.046307','12','tuan complete Cùng',3,'',17,9),(149,'2021-09-29 15:15:14.417288','15','tuan complete Cùng',3,'',17,9),(150,'2021-09-29 15:15:14.443769','14','tuan complete Cùng Học Trình Nào Các Bạn',3,'',17,9),(151,'2021-09-29 15:17:10.646976','17','tuan complete Cùng Học Trình Nào Các Bạn',3,'',17,9),(152,'2021-09-29 15:17:10.675999','16','tuan complete Cùng',3,'',17,9),(153,'2021-09-29 15:19:39.602179','19','tuan complete Cùng',3,'',17,9),(154,'2021-09-29 15:19:39.631211','18','tuan complete Cùng Học Trình Nào Các Bạn',3,'',17,9),(155,'2021-09-29 15:21:49.085230','21','tuan complete Cùng Học Trình Nào Các Bạn',3,'',17,9),(156,'2021-09-29 15:21:49.111734','20','tuan complete Cùng',3,'',17,9),(157,'2021-09-29 15:24:35.071695','3','Java Basic',1,'[{\"added\": {}}]',10,9),(158,'2021-09-29 15:44:09.450547','25','tuan1 complete Java Basic',3,'',17,9),(159,'2021-09-29 17:42:46.404029','8','Khóa học Reactjs',2,'[{\"changed\": {\"fields\": [\"Teacher\"]}}]',8,9),(160,'2021-09-29 17:43:10.207787','8','Khóa học Reactjs',2,'[{\"changed\": {\"fields\": [\"Teacher\"]}}]',8,9),(161,'2021-09-29 18:15:55.761958','8','Khóa học Reactjs',2,'[{\"changed\": {\"fields\": [\"Teacher\"]}}]',8,9),(162,'2021-09-29 18:16:51.677709','8','Khóa học Reactjs',2,'[{\"changed\": {\"fields\": [\"Teacher\"]}}]',8,9),(163,'2021-09-29 18:18:46.648046','24','tuan complete Java Basic',3,'',17,9),(164,'2021-09-29 18:18:46.683052','23','tuan complete Cùng',3,'',17,9),(165,'2021-09-30 11:43:31.569990','8','Khóa học Reactjs',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',8,9),(166,'2021-10-01 10:01:51.056331','12','admin1',2,'[{\"changed\": {\"fields\": [\"Skills\"]}}]',16,9),(167,'2021-10-01 10:02:00.959459','9','tuan',2,'[{\"changed\": {\"fields\": [\"Skills\"]}}]',16,9),(168,'2021-10-01 14:08:53.714845','18','TestFalse',3,'',8,9),(169,'2021-10-01 14:08:53.757493','17','TestFalse',3,'',8,9),(170,'2021-10-01 14:08:53.782496','16','TestFalse',3,'',8,9),(171,'2021-10-01 14:08:53.808406','15','TestFalse',3,'',8,9),(172,'2021-10-01 14:08:53.834882','14','Test1',3,'',8,9),(173,'2021-10-01 14:08:53.859887','13','Test1',3,'',8,9),(174,'2021-10-01 14:08:53.886099','12','Test1',3,'',8,9),(175,'2021-10-01 14:08:53.912092','11','Test1',3,'',8,9),(176,'2021-10-01 14:08:53.936126','10','Test',3,'',8,9),(177,'2021-10-01 16:55:20.881776','27','1',3,'',8,9),(178,'2021-10-01 16:55:20.908601','26','https://taobao.com/',3,'',8,9),(179,'2021-10-01 16:55:20.932875','25','https://taobao.com/',3,'',8,9),(180,'2021-10-01 16:55:20.957379','24','https://taobao.com/1',3,'',8,9),(181,'2021-10-01 16:55:20.981883','23','https://taobao.com/',3,'',8,9),(182,'2021-10-01 16:55:21.006326','22','1',3,'',8,9),(183,'2021-10-01 16:55:21.030831','21','Tao Test Nha',3,'',8,9),(184,'2021-10-01 16:55:21.054834','20','Tao Test Nha',3,'',8,9),(185,'2021-10-01 16:55:21.078824','19','https://taobao.com/',3,'',8,9),(186,'2021-10-01 17:37:38.787403','38','https://taobao.com/',3,'',8,9),(187,'2021-10-01 17:37:38.815294','37','https://taobao.com/',3,'',8,9),(188,'2021-10-01 17:37:38.839798','36','https://taobao.com/1',3,'',8,9),(189,'2021-10-01 17:37:38.864560','35','https://taobao.com/',3,'',8,9),(190,'2021-10-01 17:37:38.888563','34','https://taobao.com/',3,'',8,9),(191,'2021-10-01 17:37:38.913067','33','https://taobao.com/',3,'',8,9),(192,'2021-10-01 17:37:38.937688','32','https://taobao.com/',3,'',8,9),(193,'2021-10-01 17:37:38.964192','31','https://taobao.com/',3,'',8,9),(194,'2021-10-01 17:37:38.990174','30','https://taobao.com/',3,'',8,9),(195,'2021-10-01 17:37:39.014679','29','https://taobao.com/',3,'',8,9),(196,'2021-10-01 17:37:39.038683','28','https://taobao.com/',3,'',8,9),(197,'2021-10-01 18:41:19.822474','48','Test',1,'[{\"added\": {}}]',8,9),(198,'2021-10-01 19:22:09.141696','47','https://taobao.com/',2,'[{\"changed\": {\"fields\": [\"Subject\"]}}]',8,9),(199,'2021-10-03 01:01:23.172400','49','https://taobao.com/',3,'',8,9),(200,'2021-10-03 01:01:23.206406','47','https://taobao.com/',3,'',8,9),(201,'2021-10-03 01:01:23.230910','46','https://taobao.com/',3,'',8,9),(202,'2021-10-03 01:01:23.256414','45','https://taobao.com/1',3,'',8,9),(203,'2021-10-03 01:01:23.281420','44','https://taobao.com/',3,'',8,9),(204,'2021-10-03 01:01:23.307923','43','https://taobao.com/',3,'',8,9),(205,'2021-10-03 01:01:23.332927','42','https://taobao.com/',3,'',8,9),(206,'2021-10-03 01:01:23.357932','41','https://taobao.com/',3,'',8,9),(207,'2021-10-03 01:01:23.382936','40','https://taobao.com/',3,'',8,9),(208,'2021-10-03 01:01:23.408441','39','https://taobao.com/',3,'',8,9),(209,'2021-10-03 01:02:01.299143','8','Khóa học Reactjs',2,'[{\"changed\": {\"fields\": [\"Teacher\"]}}]',8,9),(210,'2021-10-03 01:35:23.267841','10','tuan1',1,'[{\"added\": {}}]',16,9),(211,'2021-10-03 04:11:49.306780','8','Khóa học Reactjs',2,'[{\"changed\": {\"fields\": [\"Active\"]}}]',8,9),(212,'2021-10-03 04:49:49.349514','18','tuan joned Khóa học Reactjs',3,'',18,9),(213,'2021-10-03 04:51:16.873192','19','tuan1 joned Khóa học Reactjs',2,'[]',18,9),(214,'2021-10-03 04:51:33.232156','17','tuan joned Angular Basic',2,'[{\"changed\": {\"fields\": [\"Rate\", \"Review\"]}}]',18,9),(215,'2021-10-03 07:30:46.714393','8','Khóa học Reactjs',2,'[{\"changed\": {\"fields\": [\"Fee\"]}}]',8,9),(216,'2021-10-03 09:18:10.304210','45','haha',3,'',12,9),(217,'2021-10-03 09:18:10.334715','44','hahah',3,'',12,9),(218,'2021-10-03 09:18:10.366220','43','test',3,'',12,9),(219,'2021-10-03 09:18:10.397226','42','1234,ok nha ',3,'',12,9),(220,'2021-10-03 09:18:10.420730','41','[\"hahah\",\"1vs1 la 2\"]',3,'',12,9),(221,'2021-10-03 09:18:10.445234','40','2',3,'',12,9),(222,'2021-10-03 09:18:10.469160','39','u',3,'',12,9),(223,'2021-10-03 09:18:10.492861','38','q',3,'',12,9),(224,'2021-10-03 09:18:10.517865','37',']',3,'',12,9),(225,'2021-10-03 09:18:10.542871','36','l',3,'',12,9),(226,'2021-10-03 09:18:10.566303','35','v',3,'',12,9),(227,'2021-10-03 09:18:10.592780','34','1',3,'',12,9),(228,'2021-10-03 09:18:10.618572','33','a',3,'',12,9),(229,'2021-10-03 09:18:10.642850','32','h',3,'',12,9),(230,'2021-10-03 09:18:10.666853','31','n',3,'',12,9),(231,'2021-10-03 09:18:10.690867','30',' ',3,'',12,9),(232,'2021-10-03 09:18:10.715363','29','k',3,'',12,9),(233,'2021-10-03 09:18:10.739642','28','o',3,'',12,9),(234,'2021-10-03 09:18:10.763572','27','\"',3,'',12,9),(235,'2021-10-03 09:18:10.787305','26','[',3,'',12,9),(236,'2021-10-03 09:18:10.811308','25','s',3,'',12,9),(237,'2021-10-03 09:18:10.835171','24','t',3,'',12,9),(238,'2021-10-03 09:18:10.859785','23',',',3,'',12,9),(239,'2021-10-03 09:18:10.883805','22','b',3,'',12,9),(240,'2021-10-03 09:18:10.907632','21','e',3,'',12,9),(241,'2021-10-03 09:18:10.931622','20','w',3,'',12,9),(242,'2021-10-03 09:18:10.956666','19','AngularJs',3,'',12,9),(243,'2021-10-03 09:18:10.981199','18','ReactJs',3,'',12,9),(244,'2021-10-03 09:18:11.005834','17','hihi',3,'',12,9),(245,'2021-10-03 09:18:11.029946','16','<QueryDict: {\'name\': [\'hihi\']}>',3,'',12,9),(246,'2021-10-03 09:18:11.053950','15','name',3,'',12,9),(247,'2021-10-03 09:18:11.078679','10','tag',3,'',12,9),(248,'2021-10-03 09:18:11.104180','8','taggg',3,'',12,9),(249,'2021-10-03 09:18:11.128848','5','tag 1',3,'',12,9),(250,'2021-10-03 09:18:11.153854','4','tesstTag',3,'',12,9),(251,'2021-10-03 09:18:11.177857','3','tag3',3,'',12,9),(252,'2021-10-03 09:18:11.202448','2','tag2',3,'',12,9),(253,'2021-10-03 09:18:11.226174','1','tag1',3,'',12,9),(254,'2021-10-03 12:58:46.203631','57','https://taobao.com/1',3,'',8,9),(255,'2021-10-03 12:58:46.238138','54','Test Course Nha',3,'',8,9),(256,'2021-10-03 12:58:46.263142','48','Test',3,'',8,9),(257,'2021-10-03 12:58:46.288146','9','Angular Basic',3,'',8,9),(258,'2021-10-03 12:58:46.313651','8','Khóa học Reactjs',3,'',8,9),(259,'2021-10-03 12:58:46.338904','7','test url',3,'',8,9),(260,'2021-10-03 12:58:46.364408','6','test owner perm',3,'',8,9),(261,'2021-10-03 12:58:46.388912','4','Test Course Nha',3,'',8,9),(262,'2021-10-03 12:58:46.413916','3','test3',3,'',8,9),(263,'2021-10-03 12:58:46.439422','2','English for kids',3,'',8,9),(264,'2021-10-03 12:58:46.464427','1','English for beginer',3,'',8,9),(265,'2021-10-03 16:11:45.413557','4','Cùng Học Lạp Trình Nào Các Bạn',1,'[{\"added\": {}}]',10,9),(266,'2021-10-03 16:45:19.015032','60','Tuân Test Lần 2',2,'[{\"changed\": {\"fields\": [\"Teacher\"]}}]',8,9),(267,'2021-10-03 16:45:34.351698','4','Cùng Học Lạp Trình Nào Các Bạn',2,'[]',10,9),(268,'2021-10-03 16:45:38.277279','4','Cùng Học Lạp Trình Nào Các Bạn',2,'[{\"changed\": {\"fields\": [\"Course\"]}}]',10,9),(269,'2021-10-03 16:46:04.033555','20','tuan1 joned Tuân Test Lần 2',1,'[{\"added\": {}}]',18,9),(270,'2021-10-03 16:46:22.420577','20','tuan joned Tuân Test Lần 2',2,'[{\"changed\": {\"fields\": [\"Student\"]}}]',18,9),(271,'2021-10-03 17:03:51.980081','5','Java Basic',1,'[{\"added\": {}}]',10,9),(272,'2021-10-03 17:04:13.544387','6','Hahah',1,'[{\"added\": {}}]',10,9),(273,'2021-10-03 17:04:39.340024','59','Test Course Pv',2,'[]',8,9),(274,'2021-10-03 17:04:54.406926','4','Cùng Học Lạp Trình Nào Các Bạn',2,'[{\"changed\": {\"fields\": [\"Course\"]}}]',10,9),(275,'2021-10-03 17:05:00.559960','4','Cùng Học Lạp Trình Nào Các Bạn',2,'[{\"changed\": {\"fields\": [\"Course\"]}}]',10,9),(276,'2021-10-03 17:05:45.014058','4','Cùng Học Lạp Trình Nào Các Bạn',2,'[{\"changed\": {\"fields\": [\"Active\"]}}]',10,9),(277,'2021-10-03 17:06:13.698461','5','Java Basic',2,'[{\"changed\": {\"fields\": [\"Active\"]}}]',10,9),(278,'2021-10-03 17:50:41.982932','5','Java Basic',2,'[{\"changed\": {\"fields\": [\"Course\"]}}]',10,9),(279,'2021-10-03 17:50:52.749036','60','Tuân Test Lần 2',2,'[{\"changed\": {\"fields\": [\"Teacher\"]}}]',8,9),(280,'2021-10-03 18:38:03.794711','61','Test Course Pv',2,'[{\"changed\": {\"fields\": [\"Teacher\"]}}]',8,9),(281,'2021-10-03 18:47:44.745118','61','test',2,'[{\"changed\": {\"fields\": [\"Teacher\"]}}]',8,9),(282,'2021-10-03 18:48:04.302347','61','test',2,'[{\"changed\": {\"fields\": [\"Teacher\"]}}]',8,9),(283,'2021-10-03 19:44:21.832229','60','Tuân Test Lần 2',2,'[]',8,9),(284,'2021-10-03 19:44:35.091034','5','Java Basic',2,'[]',10,9),(285,'2021-10-03 19:45:08.100421','21','tuan1 joned Tuân Test Lần 2',2,'[{\"changed\": {\"fields\": [\"Course\"]}}]',18,9),(286,'2021-10-03 19:45:12.765403','21','tuan1 joned Tuân Test Lần 2',2,'[{\"changed\": {\"fields\": [\"Access\"]}}]',18,9),(287,'2021-10-03 19:45:30.840524','60','Tuân Test Lần 2',2,'[]',8,9),(288,'2021-10-03 19:57:22.606217','5','Java Basic',2,'[{\"changed\": {\"fields\": [\"Active\"]}}]',10,9),(289,'2021-10-03 20:03:24.438901','6','Hahah',2,'[{\"changed\": {\"fields\": [\"Active\", \"Course\"]}}]',10,9),(290,'2021-10-03 20:04:30.110414','6','Hahah',2,'[{\"changed\": {\"fields\": [\"Active\"]}}]',10,9),(291,'2021-10-03 20:04:37.812329','4','Cùng Học Lạp Trình Nào Các Bạn',2,'[{\"changed\": {\"fields\": [\"Active\"]}}]',10,9),(292,'2021-10-05 13:27:11.166762','60','Tuân Test Lần 2',2,'[{\"changed\": {\"fields\": [\"Teacher\"]}}]',8,9),(293,'2021-10-05 15:58:15.041218','4','Test',1,'[{\"added\": {}}]',15,9),(294,'2021-10-05 15:58:21.948905','4','Test',2,'[]',15,9),(295,'2021-10-05 15:58:22.135439','4','Test',2,'[]',15,9),(296,'2021-10-05 16:10:42.752083','4','Test',2,'[{\"changed\": {\"fields\": [\"Active\"]}}]',15,9),(297,'2021-10-05 16:15:31.890846','4','Test',2,'[{\"changed\": {\"fields\": [\"Active\"]}}]',15,9),(298,'2021-10-05 16:16:43.251470','4','Bài tập về nhà',1,'[{\"added\": {}}]',14,9),(299,'2021-10-05 16:17:37.714673','1','Cùng Học Lạp Trình Nào Các Bạn',1,'[{\"added\": {}}]',20,9),(300,'2021-10-05 16:22:16.182642','4','Bài tập về nhà',2,'[{\"changed\": {\"fields\": [\"Active\"]}}]',14,9),(301,'2021-10-05 16:41:28.159180','4','Bài tập về nhà',2,'[{\"changed\": {\"fields\": [\"Active\"]}}]',14,9),(302,'2021-10-05 16:47:46.911522','1','Cùng Học Lạp Trình Nào Các Bạn',2,'[{\"changed\": {\"fields\": [\"Content\"]}}]',20,9),(303,'2021-10-05 16:48:31.682983','1','Cùng Học Lạp Trình Nào Các Bạn',2,'[{\"changed\": {\"fields\": [\"Content\"]}}]',20,9),(304,'2021-10-05 18:03:59.153485','60','Tuân Test Lần 2',2,'[{\"changed\": {\"fields\": [\"Teacher\"]}}]',8,9),(305,'2021-10-05 18:05:31.049125','5','Bài tập về nhà 2',1,'[{\"added\": {}}]',14,9),(306,'2021-10-05 18:06:02.789126','5','Bài tập về nhà 2',2,'[{\"changed\": {\"fields\": [\"Url video\"]}}]',14,9),(307,'2021-10-05 18:06:36.316237','5','Bài tập về nhà 2',2,'[{\"changed\": {\"fields\": [\"Url video\"]}}]',14,9),(308,'2021-10-05 18:09:22.821088','60','Tuân Test Lần 2',2,'[{\"changed\": {\"fields\": [\"Teacher\"]}}]',8,9),(309,'2021-10-05 18:11:14.424789','60','Tuân Test Lần 2',2,'[{\"changed\": {\"fields\": [\"Teacher\"]}}]',8,9),(310,'2021-10-05 18:39:52.529763','22','tuan1 joned Reactjs',3,'',18,9),(311,'2021-10-05 18:41:13.348297','23','tuan1 joned Reactjs',2,'[{\"changed\": {\"fields\": [\"Access\"]}}]',18,9),(312,'2021-10-06 13:28:54.982234','10','tuan1',2,'[{\"changed\": {\"fields\": [\"Job\"]}}]',16,9),(313,'2021-10-07 08:10:53.259531','10','tuan1',2,'[{\"changed\": {\"fields\": [\"ActiveTeacher\"]}}]',16,9),(314,'2021-10-07 08:10:53.472068','10','tuan1',2,'[{\"changed\": {\"fields\": [\"ActiveTeacher\"]}}]',16,9),(315,'2021-10-07 08:19:58.883070','21','tuan1 joned Tuân Test Lần 2',2,'[{\"changed\": {\"fields\": [\"Access\"]}}]',18,9),(316,'2021-10-07 09:52:13.302590','21','tuan1 joned Tuân Test Lần 2',2,'[{\"changed\": {\"fields\": [\"Access\"]}}]',18,9),(317,'2021-10-07 09:59:06.557488','11','tuan2',2,'[{\"changed\": {\"fields\": [\"Password\", \"Avatar\"]}}]',6,9),(318,'2021-10-07 09:59:06.777025','11','tuan2',2,'[{\"changed\": {\"fields\": [\"Password\", \"Avatar\"]}}]',6,9),(319,'2021-10-07 12:44:44.371431','17','tuan5',3,'',6,9),(320,'2021-10-07 12:44:44.403946','16','tuan4',3,'',6,9),(321,'2021-10-07 12:44:44.429451','14','tuan3',3,'',6,9),(322,'2021-10-07 13:16:23.620355','21','admin123',3,'',6,9),(323,'2021-10-07 13:16:23.649359','20','tuan6',3,'',6,9),(324,'2021-10-07 13:16:23.675173','19','tuan4',3,'',6,9),(325,'2021-10-07 13:16:23.701678','18','tuan3',3,'',6,9),(326,'2021-10-07 13:46:26.545282','25','taolao',3,'',6,9),(327,'2021-10-07 13:46:26.571786','24','tuan5',3,'',6,9),(328,'2021-10-07 13:46:26.596791','23','tuan4',3,'',6,9),(329,'2021-10-07 13:46:26.621295','22','tuan3',3,'',6,9),(330,'2021-10-07 14:25:27.242856','28','admin12312',3,'',6,9),(331,'2021-10-07 14:25:27.268784','27','tuantaolao',3,'',6,9),(332,'2021-10-07 14:25:27.293159','26','tuan4',3,'',6,9),(333,'2021-10-07 14:25:27.317673','13','phamtuan_2015',3,'',6,9),(334,'2021-10-07 20:43:25.722723','10','tuan1',3,'',16,9),(335,'2021-10-07 20:43:25.842245','10','tuan1',3,'',16,9),(336,'2021-10-07 22:13:34.401573','30','tuan123',3,'',16,9),(337,'2021-10-08 15:51:36.305161','60','Tuân Test Lần 2',3,'',8,9),(338,'2021-10-08 15:51:36.339667','59','Test Course Pv',3,'',8,9),(339,'2021-10-08 15:51:53.988540','6','Tester',3,'',9,9),(340,'2021-10-08 15:51:54.020519','5','Teacher',3,'',9,9),(341,'2021-10-08 15:51:54.047523','4','Test',3,'',9,9),(342,'2021-10-08 15:51:54.074028','3','Developer',3,'',9,9),(343,'2021-10-08 15:51:54.099073','2','designer',3,'',9,9),(344,'2021-10-08 15:51:54.125078','1','English Teacher',3,'',9,9),(345,'2021-10-08 15:52:04.274599','9','Test Coi Được Hok',3,'',11,9),(346,'2021-10-08 15:52:04.301097','8','Front-end',3,'',11,9),(347,'2021-10-08 15:52:04.328602','7','haha',3,'',11,9),(348,'2021-10-08 15:52:04.356107','6','Tuan',3,'',11,9),(349,'2021-10-08 15:52:04.384112','5','test',3,'',11,9),(350,'2021-10-08 15:52:04.416118','4','Photoshop',3,'',11,9),(351,'2021-10-08 15:52:04.447623','3','Ai',3,'',11,9),(352,'2021-10-08 15:52:04.484130','2','english',3,'',11,9),(353,'2021-10-08 15:52:04.528139','1','design',3,'',11,9),(354,'2021-10-08 15:52:15.827763','53','Web',3,'',12,9),(355,'2021-10-08 15:52:15.855268','52','CSS',3,'',12,9),(356,'2021-10-08 15:52:15.880273','51','HTML',3,'',12,9),(357,'2021-10-08 15:52:15.906778','50','AngularJs',3,'',12,9),(358,'2021-10-08 15:52:15.931782','49','ReactJs',3,'',12,9),(359,'2021-10-08 15:52:15.957296','48','test',3,'',12,9),(360,'2021-10-08 15:52:15.982790','47','haha',3,'',12,9),(361,'2021-10-08 15:52:16.007991','46','hihi',3,'',12,9),(362,'2021-10-08 15:52:25.978612','29','',3,'',6,9),(363,'2021-10-08 15:53:00.634519','30','tuan123',3,'',6,9),(364,'2021-10-08 15:53:00.661024','12','admin1',3,'',6,9),(365,'2021-10-08 15:53:00.686029','11','tuan2',3,'',6,9),(366,'2021-10-08 15:53:00.711533','10','tuan1',3,'',6,9),(367,'2021-10-08 15:53:00.736537','8','testUser',3,'',6,9),(368,'2021-10-08 15:53:00.761541','7','meo2',3,'',6,9),(369,'2021-10-08 15:53:00.787545','6','meo',3,'',6,9),(370,'2021-10-08 15:53:00.815051','5','userTest',3,'',6,9),(371,'2021-10-08 15:53:00.840555','4','helloword2',3,'',6,9),(372,'2021-10-08 15:53:00.866562','3','helloword',3,'',6,9),(373,'2021-10-08 16:37:40.694658','31','tuan1',2,'[{\"changed\": {\"fields\": [\"ActiveTeacher\"]}}]',16,9),(374,'2021-10-08 16:38:19.140352','31','tuan1',2,'[{\"changed\": {\"fields\": [\"Skills\"]}}]',16,9),(375,'2021-10-09 07:24:00.937107','9','tuan',2,'[{\"changed\": {\"fields\": [\"Skills\", \"Job\"]}}]',16,9),(376,'2021-10-09 08:12:02.295467','31','tuan1',2,'[{\"changed\": {\"fields\": [\"ActiveTeacher\"]}}]',16,9),(377,'2021-10-09 10:42:33.114083','64','Tuân Test',2,'[{\"changed\": {\"fields\": [\"Fee\"]}}]',8,9),(378,'2021-10-10 03:46:11.580109','31','tuan1',2,'[{\"changed\": {\"fields\": [\"ActiveTeacher\"]}}]',16,9),(379,'2021-10-10 04:14:53.866184','9','tuan',2,'[{\"changed\": {\"fields\": [\"Email address\"]}}]',6,9),(380,'2021-10-11 19:01:08.334982','31','tuan1',2,'[{\"changed\": {\"fields\": [\"ActiveTeacher\"]}}]',16,9),(381,'2021-10-13 22:50:53.730040','36','giangvien',3,'',6,9),(382,'2021-10-13 22:53:31.188850','37','giangvien',3,'',6,9),(383,'2021-10-14 08:53:58.358286','38','giangvien',3,'',6,9),(384,'2021-10-14 08:58:56.355802','39','giangvien',3,'',6,9),(385,'2021-10-14 09:57:53.156083','33','tuan joned Reactjs Căn Bản',3,'',18,9),(386,'2021-10-14 10:02:01.551836','34','tuan joned Reactjs Căn Bản',3,'',18,9);
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
  `app_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(7,'courses','category'),(8,'courses','course'),(15,'courses','file'),(21,'courses','follow'),(13,'courses','groupchat'),(20,'courses','homework'),(9,'courses','job'),(10,'courses','lesson'),(19,'courses','message'),(11,'courses','skill'),(18,'courses','student_course'),(17,'courses','student_lesson'),(12,'courses','tag'),(16,'courses','teacher'),(6,'courses','user'),(14,'courses','video'),(23,'oauth2_provider','accesstoken'),(22,'oauth2_provider','application'),(24,'oauth2_provider','grant'),(26,'oauth2_provider','idtoken'),(25,'oauth2_provider','refreshtoken'),(5,'sessions','session'),(27,'social_django','association'),(28,'social_django','code'),(29,'social_django','nonce'),(31,'social_django','partial'),(30,'social_django','usersocialauth');
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
  `app` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2021-09-24 16:42:41.832683'),(2,'contenttypes','0002_remove_content_type_name','2021-09-24 16:42:41.960560'),(3,'auth','0001_initial','2021-09-24 16:42:42.505382'),(4,'auth','0002_alter_permission_name_max_length','2021-09-24 16:42:42.639380'),(5,'auth','0003_alter_user_email_max_length','2021-09-24 16:42:42.656319'),(6,'auth','0004_alter_user_username_opts','2021-09-24 16:42:42.696431'),(7,'auth','0005_alter_user_last_login_null','2021-09-24 16:42:42.712479'),(8,'auth','0006_require_contenttypes_0002','2021-09-24 16:42:42.712479'),(9,'auth','0007_alter_validators_add_error_messages','2021-09-24 16:42:42.729203'),(10,'auth','0008_alter_user_username_max_length','2021-09-24 16:42:42.737203'),(11,'auth','0009_alter_user_last_name_max_length','2021-09-24 16:42:42.757936'),(12,'auth','0010_alter_group_name_max_length','2021-09-24 16:42:42.840273'),(13,'auth','0011_update_proxy_permissions','2021-09-24 16:42:42.865969'),(14,'auth','0012_alter_user_first_name_max_length','2021-09-24 16:42:42.882469'),(15,'courses','0001_initial','2021-09-24 16:42:48.098178'),(16,'admin','0001_initial','2021-09-24 16:42:48.450842'),(17,'admin','0002_logentry_remove_auto_add','2021-09-24 16:42:48.478361'),(18,'admin','0003_logentry_add_action_flag_choices','2021-09-24 16:42:48.502674'),(19,'oauth2_provider','0001_initial','2021-09-24 16:42:50.369800'),(20,'oauth2_provider','0002_auto_20190406_1805','2021-09-24 16:42:50.593300'),(21,'oauth2_provider','0003_auto_20201211_1314','2021-09-24 16:42:50.727749'),(22,'oauth2_provider','0004_auto_20200902_2022','2021-09-24 16:42:51.724480'),(23,'sessions','0001_initial','2021-09-24 16:42:51.821944'),(24,'courses','0002_auto_20210927_1446','2021-09-27 07:52:19.084326'),(25,'courses','0003_alter_course_fee','2021-09-29 12:02:57.614808'),(26,'courses','0004_alter_course_tags','2021-09-30 09:46:22.940596'),(27,'courses','0005_auto_20211006_2043','2021-10-06 13:43:25.602569'),(28,'default','0001_initial','2021-10-15 14:00:42.851679'),(29,'social_auth','0001_initial','2021-10-15 14:00:42.855179'),(30,'default','0002_add_related_name','2021-10-15 14:00:42.873138'),(31,'social_auth','0002_add_related_name','2021-10-15 14:00:42.876096'),(32,'default','0003_alter_email_max_length','2021-10-15 14:00:42.888099'),(33,'social_auth','0003_alter_email_max_length','2021-10-15 14:00:42.890298'),(34,'default','0004_auto_20160423_0400','2021-10-15 14:00:42.905295'),(35,'social_auth','0004_auto_20160423_0400','2021-10-15 14:00:42.908296'),(36,'social_auth','0005_auto_20160727_2333','2021-10-15 14:00:42.926363'),(37,'social_django','0006_partial','2021-10-15 14:00:42.956413'),(38,'social_django','0007_code_timestamp','2021-10-15 14:00:42.992406'),(39,'social_django','0008_partial_timestamp','2021-10-15 14:00:43.023081'),(40,'social_django','0009_auto_20191118_0520','2021-10-15 14:00:43.094794'),(41,'social_django','0010_uid_db_index','2021-10-15 14:00:43.119663'),(42,'social_django','0002_add_related_name','2021-10-15 14:00:43.124663'),(43,'social_django','0005_auto_20160727_2333','2021-10-15 14:00:43.127457'),(44,'social_django','0003_alter_email_max_length','2021-10-15 14:00:43.129912'),(45,'social_django','0004_auto_20160423_0400','2021-10-15 14:00:43.132921'),(46,'social_django','0001_initial','2021-10-15 14:00:43.135634');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0rfiurqgo74bkgdlxekcvb0f2m8kw1sw','.eJxVjDsOwjAQBe_iGll24i8lPWew1rtrEkC2FCcV4u4QKQW0b2beSyTY1iltnZc0kzgLrcTpd8yAD647oTvUW5PY6rrMWe6KPGiX10b8vBzu38EEffrWgGxCIVQQrFYYBjIQisYwWo4xYrTO59HkwWlVSI3orWevnYdBMzOJ9wcTmTg8:1mVYym:XtCvmRFpQ6BWk7UVZ58KEPFdXrvt0OhXN9ClcUGwVsI','2021-10-13 12:46:32.190023'),('3zoekns3of6mjbz7n67qn619l9x9qnjc','.eJxVjEEOwiAQRe_C2hDLDBRcuvcMBBhGqgaS0q6Md7dNutDtf-_9t_BhXYpfe579ROIinDj9bjGkZ647oEeo9yZTq8s8Rbkr8qBd3hrl1_Vw_w5K6GWrQY8RDCKaOCiF6NKZhxSSJauQwLDKDOBMHjUREwBtMFhlNFrNmcXnC9HzOBU:1mYbdj:yBTW0dKPlINR0xcjlSzaFxvzdz3N5YFvj3Mpqj97GAM','2021-10-21 22:13:23.723058'),('4y66amaqjhzuu56kl09uhhw99beqbwsh','.eJxVjEEOwiAQRe_C2hCYVigu3fcMzTAzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFWn3y0iPaTsgO9YblVTLesyR70r-qBNj5XleT3cv4OMLX_reCbgzjvrvZBIEAiG2IPvwfgEHB3ajjgmMczoBurRhAgpWTJAQ1DvD_tLOLo:1mUlRu:Rp4h8OWhk1_VcTi-oNAF1p6vsj0yvO5KYnS3GYXfrUI','2021-10-11 07:53:18.144944'),('5cdbm6tjy6bd419fgxvwc8e98d4o7dnh','.eJxVjMEOwiAQBf-FsyGwQAGP3v0GsrAgVQNJaU_Gf9cmPej1zcx7sYDbWsM28hJmYmcG7PS7RUyP3HZAd2y3zlNv6zJHviv8oINfO-Xn5XD_DiqO-q0zAoK3UbgygQWpZVGaHJKzJkKRRkAmDTo5JVQkWayXVGwxXkwGrWHvD9HkN0M:1mTmqu:qXLSKuPENHMjUwBgVFBWoLiuj9FMdsGDuJAwzVFkZYk','2021-10-08 15:11:04.855934'),('7d9uhgzfi8i8fn5ivra5ptrjvsea4gr1','.eJxVjEEOwiAQRe_C2hDLDBRcuvcMBBhGqgaS0q6Md7dNutDtf-_9t_BhXYpfe579ROIinDj9bjGkZ647oEeo9yZTq8s8Rbkr8qBd3hrl1_Vw_w5K6GWrQY8RDCKaOCiF6NKZhxSSJauQwLDKDOBMHjUREwBtMFhlNFrNmcXnC9HzOBU:1mX6WL:jcvF2dqiElPzJRa-SvJYDV4Ocp6lABnJDlLG2xdPVIc','2021-10-17 18:47:33.542401'),('9cs5y3bs729ux6i8ezd71ku69ubsruw2','.eJxVjMsOwiAUBf-FtSFSQcCl-34DudyHVA0kpV0Z_12bdKHbMzPnpRKsS0lr5zlNpC4qqsPvlgEfXDdAd6i3prHVZZ6y3hS9067HRvy87u7fQYFevnWQEzk-AmIGETQsHkXo7G22bmAfQjRkrYsYiQIDGMQQJAuTZR6yen8ANuQ6NA:1mZ6hm:2bpKrEmSCtiich7QCWUd35SIZaOpTvRF548aYs94yLE','2021-10-23 07:23:38.109457'),('c9xkchcoq6q0gg0ltj32349ctrr844yl','.eJxVjDsOgzAQRO_iOrJs_CVles5g7XrXMUkEEoYqyt0DEkVSjTTvzbxFgm2taWu8pJHEVfTi8tsh5CdPB6AHTPdZ5nlalxHlociTNjnMxK_b6f4dVGh1Xysq2TJ6S2AyWYPO8p7WOc06cNYBIBqtVNdH42PpKEKJhZE9sgsoPl8HADjG:1mR7Fi:I_Xysn-ksf8OfdhkOcxuoPq54bVRnNELlsOxjafbYyw','2021-10-01 06:21:38.439644'),('dcw4te4ywe79mnoovu1bbxywcibxst6d','.eJxVjEEOwiAQRe_C2hDLDBRcuvcMBBhGqgaS0q6Md7dNutDtf-_9t_BhXYpfe579ROIinDj9bjGkZ647oEeo9yZTq8s8Rbkr8qBd3hrl1_Vw_w5K6GWrQY8RDCKaOCiF6NKZhxSSJauQwLDKDOBMHjUREwBtMFhlNFrNmcXnC9HzOBU:1mWqL5:jqICYkgqDOk9A9bsBnLui-C7rq34h3fDSeEvpC3y11s','2021-10-17 01:30:51.105430'),('e95bjc25y17a94ne3i5uikgiwjiy1vif','.eJxVjDsOgzAQRO_iOrJs_CVles5g7XrXMUkEEoYqyt0DEkVSjTTvzbxFgm2taWu8pJHEVfTi8tsh5CdPB6AHTPdZ5nlalxHlociTNjnMxK_b6f4dVGh1Xysq2TJ6S2AyWYPO8p7WOc06cNYBIBqtVNdH42PpKEKJhZE9sgsoPl8HADjG:1mTOps:IWjhHLTZEe-thZI99jP3wlFa6La6hSLOQyxAl8781qI','2021-10-07 13:32:24.419645'),('fyp1pmw6nugo0zyiu4d9bl8t3qgyty05','.eJxVjEEOwiAQRe_C2hCYVigu3fcMzTAzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFWn3y0iPaTsgO9YblVTLesyR70r-qBNj5XleT3cv4OMLX_reCbgzjvrvZBIEAiG2IPvwfgEHB3ajjgmMczoBurRhAgpWTJAQ1DvD_tLOLo:1mTmWc:v6W4nO4gYl02u-B3xNgqdvryZgPT-fu61TP4Q0n5nUg','2021-10-08 14:50:06.144853'),('gmx6j44gvzwbyhp9lszd2tbx1ocao5vp','.eJxVjEEOwiAQRe_C2hDLDBRcuvcMBBhGqgaS0q6Md7dNutDtf-_9t_BhXYpfe579ROIinDj9bjGkZ647oEeo9yZTq8s8Rbkr8qBd3hrl1_Vw_w5K6GWrQY8RDCKaOCiF6NKZhxSSJauQwLDKDOBMHjUREwBtMFhlNFrNmcXnC9HzOBU:1mY73R:A77AQXbH4qSS7W1FRMHGHQvgodgsQOZMaymlJSoSPW4','2021-10-20 13:33:53.716499'),('gsk8i9c36p63a64ci51vlnw43wymhljx','.eJxVjDsOwjAQBe_iGll24i8lPWew1rtrEkC2FCcV4u4QKQW0b2beSyTY1iltnZc0kzgLrcTpd8yAD647oTvUW5PY6rrMWe6KPGiX10b8vBzu38EEffrWgGxCIVQQrFYYBjIQisYwWo4xYrTO59HkwWlVSI3orWevnYdBMzOJ9wcTmTg8:1mVYo5:PK9ZdFR_flVE52ThRfgjt9aM9oQ2TbNUAOiMaVvXl9Q','2021-10-13 12:35:29.859985'),('hfjj0jgtznjghy2jioasg3o0b4mn8p3z','.eJxVjEEOwiAQRe_C2hCYVigu3fcMzTAzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFWn3y0iPaTsgO9YblVTLesyR70r-qBNj5XleT3cv4OMLX_reCbgzjvrvZBIEAiG2IPvwfgEHB3ajjgmMczoBurRhAgpWTJAQ1DvD_tLOLo:1mPb4g:YzOLN0vBd7dXL9U1c_2lGxShfHpR1TfHZeeD6TKz74I','2021-09-27 01:47:58.844013'),('k8brwwe191jmphgr2zdfeigv4fzyvaq5','.eJxVjMEOwiAQRP-FsyHgBlg8evcbyC5spWpoUtqT8d9tkx50jvPezFslWpea1i5zGou6KKtOvx1TfkrbQXlQu086T22ZR9a7og_a9W0q8roe7t9BpV63tYTi0NgYsw_eWSNA_ryFogHDgFEQ0LAbuAwYMQQGZs4IwbHP0anPF7oHNyk:1mNuZG:5WDAYm1HDEir5nG_vlcMsmYtubsxd69zebinjZ0ZwW0','2021-09-22 10:12:34.321036'),('n4ojsgeuwpo4dozuo3rorsu2t782t3pp','.eJxVjDsOgzAQRO_iOrJs_CVles5g7XrXMUkEEoYqyt0DEkVSjTTvzbxFgm2taWu8pJHEVfTi8tsh5CdPB6AHTPdZ5nlalxHlociTNjnMxK_b6f4dVGh1Xysq2TJ6S2AyWYPO8p7WOc06cNYBIBqtVNdH42PpKEKJhZE9sgsoPl8HADjG:1mPgIL:0dPb08MY7dfsz8u0vnX2KlvMBEYhpcKObODH9AEj4tQ','2021-09-27 07:22:25.096977'),('nw2tk9flje8hozebz9hnv95jhg2mll7a','.eJxVjEEOwiAQRe_C2hCYVigu3fcMzTAzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFWn3y0iPaTsgO9YblVTLesyR70r-qBNj5XleT3cv4OMLX_reCbgzjvrvZBIEAiG2IPvwfgEHB3ajjgmMczoBurRhAgpWTJAQ1DvD_tLOLo:1mTmuG:IJhua-CvqW3ni6K8pQJWTSbfzR2GoxqEKQtuF2pz3A8','2021-10-08 15:14:32.004165'),('qj3o28exzzckfaio15izvm39z4ah4ji0','.eJxVjDsOgzAQRO_iOrJs_CVles5g7XrXMUkEEoYqyt0DEkVSjTTvzbxFgm2taWu8pJHEVfTi8tsh5CdPB6AHTPdZ5nlalxHlociTNjnMxK_b6f4dVGh1Xysq2TJ6S2AyWYPO8p7WOc06cNYBIBqtVNdH42PpKEKJhZE9sgsoPl8HADjG:1mTOkD:gDVM74wb_Xoeqwb0GwcPEyPXfHqIRoq79gCvOx_r9Ls','2021-10-07 13:26:33.424937'),('rp1vjnto302jisimp6a9vw3e6b1kbcpm','.eJxVjDsOwjAQBe_iGllrOesPJT1nsHb9wQFkS3FSIe4OkVJA-2bmvUSgba1hG3kJcxJn4cXpd2OKj9x2kO7Ubl3G3tZlZrkr8qBDXnvKz8vh_h1UGvVbIySaOFI2ODnNyoDRE0QwpCywQ1Lgs9a2MENWyjpEooLeG13AKhLvD9I3Ny0:1malT6:EHCK52ALu-Mpe5419gNLxuxl-oA-ZvlwlvnHFRHzh28','2021-10-27 21:07:20.778225'),('tv1nvj0z2ngvn6kw21yjy638vr9dfh53','.eJxVjEEOwiAQRe_C2hDLDBRcuvcMBBhGqgaS0q6Md7dNutDtf-_9t_BhXYpfe579ROIinDj9bjGkZ647oEeo9yZTq8s8Rbkr8qBd3hrl1_Vw_w5K6GWrQY8RDCKaOCiF6NKZhxSSJauQwLDKDOBMHjUREwBtMFhlNFrNmcXnC9HzOBU:1mXnCX:8nS9tgQsbf0fvnHVkZKm2OflhJ3OqSHl7W9d5pK0zNQ','2021-10-19 16:21:57.855129'),('w8wuux78mz4pcvfe7fdvdlm7yte7jgak','.eJxVjDsOwjAQBe_iGll24i8lPWew1rtrEkC2FCcV4u4QKQW0b2beSyTY1iltnZc0kzgLrcTpd8yAD647oTvUW5PY6rrMWe6KPGiX10b8vBzu38EEffrWgGxCIVQQrFYYBjIQisYwWo4xYrTO59HkwWlVSI3orWevnYdBMzOJ9wcTmTg8:1mYOVR:-7RfKhvSSbr1isaDFB78qgNNpjuNLOR4Ims9jFQh2v4','2021-10-21 08:11:57.254066'),('x6r3balgkdozt1fpriqn1f5na4tet3tw','.eJxVjDsOwjAQBe_iGln-gk1Jzxms9e4aB5AtxUmFuDtESgHtm5n3EgnWpaZ18JwmEmcRxeF3y4APbhugO7Rbl9jbMk9Zborc6ZDXTvy87O7fQYVRv7UFQqMzBq2VCapk6wsXxEBso6doisvBowLSio-xgLN8Ig9aRwfZFfH-AATLOLo:1man55:ohD9qRjgsjQNo_-l0gFeyDMwyoktGhqR_Nu-3VP35sA','2021-10-27 22:50:39.302518'),('y4016exfvevfvfpxethp2xr7gmcu8hol','.eJxVjDsOgzAQRO_iOrJs_CVles5g7XrXMUkEEoYqyt0DEkVSjTTvzbxFgm2taWu8pJHEVfTi8tsh5CdPB6AHTPdZ5nlalxHlociTNjnMxK_b6f4dVGh1Xysq2TJ6S2AyWYPO8p7WOc06cNYBIBqtVNdH42PpKEKJhZE9sgsoPl8HADjG:1mVczN:T8wkvpzsHu2uzuJixRuet6NdpbznkwmBoUrvMKXWax4','2021-10-13 17:03:25.577732');
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
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires` datetime(6) NOT NULL,
  `scope` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=319 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_accesstoken`
--

LOCK TABLES `oauth2_provider_accesstoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_accesstoken` DISABLE KEYS */;
INSERT INTO `oauth2_provider_accesstoken` VALUES (1,'Wd6WUf5x7v9FO6FPkGaAvbO8vFzxqy','2021-09-08 23:17:11.007708','read write',1,1,'2021-09-08 13:17:11.007708','2021-09-08 13:17:11.007708',NULL,NULL),(2,'NM4TxHb0rtYbrvITQUWbtmOjOneG4y','2021-09-08 23:56:37.160630','read write',1,1,'2021-09-08 13:56:37.160630','2021-09-08 13:56:37.160630',NULL,NULL),(5,'hNa3irFIq7WkXh2edLlA9Q258nnW2l','2021-09-11 17:41:12.157758','read write',1,1,'2021-09-11 07:41:12.157758','2021-09-11 07:41:12.157758',NULL,NULL),(11,'7Id9iICVCsyUFV91GwVNwNlCpxD4O7','2021-09-12 18:24:53.707352','read write',1,2,'2021-09-12 08:24:53.707352','2021-09-12 08:24:53.707352',NULL,NULL),(12,'TfNr1lnXqWzRM31hG33hK47ccAO1d4','2021-09-12 18:49:46.737972','read write',1,2,'2021-09-12 08:49:46.738968','2021-09-12 08:49:46.738968',NULL,NULL),(13,'fNgGL3v0M1Jv50D64YbkW8o3velQMW','2021-09-12 19:41:11.101643','read write',1,1,'2021-09-12 09:41:11.102599','2021-09-12 09:41:11.102599',NULL,NULL),(14,'OpwbQDYdugDhTroTvQ6q83HEdMeoLo','2021-09-14 21:41:06.641872','read write',1,9,'2021-09-14 11:41:06.641872','2021-09-14 11:41:06.641872',NULL,NULL),(15,'dbwINGtLKVuIXbCQDwMFdV4kgR0mfL','2021-09-14 22:46:13.206611','read write',1,9,'2021-09-14 12:46:13.206611','2021-09-14 12:46:13.206611',NULL,NULL),(16,'ssOdlrrfmIMa0a0Z9H622pu7rl273h','2021-09-15 11:42:25.111693','read write',1,9,'2021-09-15 01:42:25.112691','2021-09-15 01:42:25.112691',NULL,NULL),(17,'4v6koFx8DpgnNi44CThQiHxDOl2uo8','2021-09-15 13:49:22.765828','read write',1,9,'2021-09-15 03:49:22.766828','2021-09-15 03:49:22.766828',NULL,NULL),(18,'3BjSfZ9tGDoCogYD3vFvLbYqIXPUGI','2021-09-15 13:49:50.037269','read write',1,9,'2021-09-15 03:49:50.037269','2021-09-15 03:49:50.037269',NULL,NULL),(19,'wg9eBaZ8mSxRTXNUFHzPReA9gfOE5q','2021-09-15 13:50:13.898585','read write',1,9,'2021-09-15 03:50:13.899585','2021-09-15 03:50:13.899585',NULL,NULL),(20,'BC4qEOXXpCNpJeyjxQ2zXa0mL8HAZC','2021-09-15 13:50:25.180419','read write',1,9,'2021-09-15 03:50:25.181419','2021-09-15 03:50:25.181419',NULL,NULL),(21,'kUYYQnVuAgHKcIgtltPhIKVYHrD3Bq','2021-09-15 13:50:47.765383','read write',1,9,'2021-09-15 03:50:47.765383','2021-09-15 03:50:47.765383',NULL,NULL),(22,'hyYDnkyN8kn9TDe8YsRI8gacgxBDSC','2021-09-15 13:53:35.900159','read write',1,9,'2021-09-15 03:53:35.901161','2021-09-15 03:53:35.901161',NULL,NULL),(23,'LZCmBbM05iRJmu2vvaQRggWEUog3UX','2021-09-15 14:04:12.586250','read write',1,9,'2021-09-15 04:04:12.586250','2021-09-15 04:04:12.586250',NULL,NULL),(24,'vBVtUtymwSBEEDWaKkB3Nl5hl6SVTM','2021-09-15 14:05:46.172586','read write',1,9,'2021-09-15 04:05:46.172586','2021-09-15 04:05:46.172586',NULL,NULL),(25,'JI4UMftbWc1aWXzaOVkaimrVhVg8sD','2021-09-15 14:06:22.750915','read write',1,9,'2021-09-15 04:06:22.750915','2021-09-15 04:06:22.750915',NULL,NULL),(26,'nMZjaDNOOvaeyeoO3S4UpNyvC1HJ3g','2021-09-15 14:34:31.672982','read write',1,9,'2021-09-15 04:34:31.673982','2021-09-15 04:34:31.673982',NULL,NULL),(27,'uaoydeiORkavNEFDZlmEaUGAKLHNiQ','2021-09-15 16:50:03.853593','read write',1,9,'2021-09-15 06:50:03.854595','2021-09-15 06:50:03.854595',NULL,NULL),(28,'qpQSPXgn9nVLwFoP4ohh9s71hMsve4','2021-09-15 16:56:47.595117','read write',1,9,'2021-09-15 06:56:47.595117','2021-09-15 06:56:47.595117',NULL,NULL),(29,'s2CIpuOpwaqQPBSsXilvW63lvV3Zma','2021-09-15 16:59:27.565114','read write',1,9,'2021-09-15 06:59:27.566114','2021-09-15 06:59:27.566114',NULL,NULL),(30,'K6SDuDbqm1qt2wKUdejzZH7ntuN1Mq','2021-09-15 17:01:53.547317','read write',1,9,'2021-09-15 07:01:53.547317','2021-09-15 07:01:53.547317',NULL,NULL),(31,'6qb0cfd4esKf0DbNZSRSRm2y1CpGop','2021-09-15 18:50:41.805309','read write',1,9,'2021-09-15 08:50:41.805309','2021-09-15 08:50:41.805309',NULL,NULL),(32,'rVZblQI29Cc3DeOHkG0mh3nUaQWAnt','2021-09-15 18:51:14.989560','read write',1,9,'2021-09-15 08:51:14.990561','2021-09-15 08:51:14.990561',NULL,NULL),(33,'KujxIQO5DtfyFowVIxvHo1V1IPjqaO','2021-09-15 18:59:47.959932','read write',1,9,'2021-09-15 08:59:47.960935','2021-09-15 08:59:47.960935',NULL,NULL),(34,'rVDrGPoWgnhoeI8Q0lTmZASqTh7C2l','2021-09-15 19:02:30.498332','read write',1,9,'2021-09-15 09:02:30.499333','2021-09-15 09:02:30.499333',NULL,NULL),(35,'Lz5aPxP2k8oXV6eW1a72dOWNihct66','2021-09-15 19:03:22.227075','read write',1,9,'2021-09-15 09:03:22.227075','2021-09-15 09:03:22.227075',NULL,NULL),(36,'f1MNDfRgrZW1E4NQGuD5o51xlAeWcE','2021-09-15 19:13:59.135862','read write',1,9,'2021-09-15 09:13:59.135862','2021-09-15 09:13:59.135862',NULL,NULL),(37,'8rTuFvJxOeOgr3JMEg6VD6mxqH1e0J','2021-09-15 19:15:08.017352','read write',1,9,'2021-09-15 09:15:08.017352','2021-09-15 09:15:08.017352',NULL,NULL),(38,'1L1ojU4C8yg3LVnZm7q4sSx4j34Mes','2021-09-15 23:36:04.047592','read write',1,9,'2021-09-15 13:36:04.047592','2021-09-15 13:36:04.047592',NULL,NULL),(39,'zwfPdMS1cjdxiTw9y1w0XDRabsK42D','2021-09-16 00:06:53.167705','read write',1,9,'2021-09-15 14:06:53.168706','2021-09-15 14:06:53.168706',NULL,NULL),(40,'yl277GqedxyjDt0gwMlPTB6gO2919T','2021-09-16 00:09:50.504751','read write',1,9,'2021-09-15 14:09:50.505753','2021-09-15 14:09:50.505753',NULL,NULL),(41,'IYKQOon7SGw8eLZkFbRPPEGtKGoITr','2021-09-16 00:17:27.869878','read write',1,9,'2021-09-15 14:17:27.869878','2021-09-15 14:17:27.869878',NULL,NULL),(42,'PmcyCLJEata4UDgpYb83pLdpafCOhO','2021-09-16 00:38:45.889392','read write',1,9,'2021-09-15 14:38:45.890564','2021-09-15 14:38:45.890564',NULL,NULL),(43,'gUw6jodwM7oTfJ2uQQ6DeZdMnknqEP','2021-09-16 13:00:34.226780','read write',1,9,'2021-09-16 03:00:34.226780','2021-09-16 03:00:34.226780',NULL,NULL),(44,'czibyh4jc3ZvRG50FwU5AyJwtGh1si','2021-09-17 13:08:33.581737','read write',1,9,'2021-09-17 03:08:33.582738','2021-09-17 03:08:33.582738',NULL,NULL),(45,'rPZs089EdiYODDkzXSQH6G3BAYi2Iv','2021-09-17 13:39:08.602444','read write',1,9,'2021-09-17 03:39:08.603444','2021-09-17 03:39:08.603444',NULL,NULL),(48,'ZbIJitdstC0GEk372YqbcQDVSsPicR','2021-09-17 14:23:37.090721','read write',1,9,'2021-09-17 04:23:37.091720','2021-09-17 04:23:37.091720',NULL,NULL),(49,'a2oaNEuxvhLQLrAN8ydRpQCIOlAAzq','2021-09-17 14:28:53.326315','read write',1,9,'2021-09-17 04:28:53.326315','2021-09-17 04:28:53.326315',NULL,NULL),(50,'yw9oauzQQIGnx3eRL4RPS0Dg6z29im','2021-09-17 14:32:33.827486','read write',1,9,'2021-09-17 04:32:33.827486','2021-09-17 04:32:33.827486',NULL,NULL),(53,'fRhcs8fjbPB6h9PHe9DKArFdFWFokQ','2021-09-17 16:00:04.699252','read write',1,9,'2021-09-17 06:00:04.699252','2021-09-17 06:00:04.699252',NULL,NULL),(54,'GtnWcUDy2bqqGoNDe5BaHVSQwbIhBj','2021-09-17 16:09:11.380592','read write',1,9,'2021-09-17 06:09:11.380592','2021-09-17 06:09:11.381592',NULL,NULL),(55,'LtH0OU80Ya76nvE0hc5sZFZLuDI4V1','2021-09-17 16:13:10.173066','read write',1,9,'2021-09-17 06:13:10.173066','2021-09-17 06:13:10.173066',NULL,NULL),(56,'TYxZzqdZqCPVDNdcLezgrWaS3518ui','2021-09-17 16:15:18.405788','read write',1,9,'2021-09-17 06:15:18.405788','2021-09-17 06:15:18.405788',NULL,NULL),(57,'lAA6aBUwYsxdVCISV2Tm3sM4pkKuer','2021-09-17 16:15:36.210775','read write',1,9,'2021-09-17 06:15:36.210775','2021-09-17 06:15:36.210775',NULL,NULL),(58,'exK4shn2YGxZpruiBHVnd9zxSVw4z5','2021-09-17 16:16:13.005012','read write',1,9,'2021-09-17 06:16:13.006011','2021-09-17 06:16:13.006011',NULL,NULL),(59,'EVjb3CCgrQndmhMTi1xRezklRJQecI','2021-09-17 16:16:42.532191','read write',1,9,'2021-09-17 06:16:42.533198','2021-09-17 06:16:42.533198',NULL,NULL),(60,'4upZqZiyDB7eR5TWriw8IEJXRDSFWG','2021-09-17 16:19:42.698850','read write',1,9,'2021-09-17 06:19:42.699854','2021-09-17 06:19:42.699854',NULL,NULL),(62,'FES0DikH3RpnXovQhsCAFhh2xdcnm5','2021-09-17 19:35:37.475040','read write',1,9,'2021-09-17 09:35:37.476040','2021-09-17 09:35:37.476040',NULL,NULL),(64,'IHLApJ8fcvbSnLskox14CWqG3UqWSQ','2021-09-17 23:46:55.706576','read write',1,9,'2021-09-17 13:46:55.706576','2021-09-17 13:46:55.706576',NULL,NULL),(66,'49aVRWwmpDOotqKW2t8RkD6uMDGQvF','2021-09-17 23:50:59.730134','read write',1,9,'2021-09-17 13:50:59.730134','2021-09-17 13:50:59.730134',NULL,NULL),(67,'sPXJBPKJDyIc1M1LzsJBKfx6c1i8Yi','2021-09-17 23:51:44.059744','read write',1,9,'2021-09-17 13:51:44.059744','2021-09-17 13:51:44.059744',NULL,NULL),(68,'Hw9G6UoKnkAqrgcdkqS2eYgqS0r33J','2021-09-17 23:51:54.718375','read write',1,9,'2021-09-17 13:51:54.719377','2021-09-17 13:51:54.719377',NULL,NULL),(69,'7D0EyKAFOb0U89EH7nTM8EdpjTNoGl','2021-09-18 17:35:56.190150','read write',1,9,'2021-09-18 07:35:56.190150','2021-09-18 07:35:56.190150',NULL,NULL),(70,'RkEmRgY1SsfuCiyUcQGjermopVBOV1','2021-09-19 06:39:02.644589','read write',1,9,'2021-09-18 20:39:02.645592','2021-09-18 20:39:02.645592',NULL,NULL),(71,'ZcOzzwRSknLqeScHVqqGLjuH7caw3a','2021-09-19 13:31:07.511761','read write',1,9,'2021-09-19 03:31:07.512261','2021-09-19 03:31:07.512261',NULL,NULL),(73,'yLWnvaeJCTq7rjDwQogWwAJHu2Twkj','2021-09-20 11:28:55.187059','read write',1,9,'2021-09-20 01:28:55.187559','2021-09-20 01:28:55.187559',NULL,NULL),(74,'7AMkkY4JI8k3TISgWTN8oCCwnJ4nuN','2021-09-20 12:33:59.425216','read write',1,9,'2021-09-20 02:33:59.425718','2021-09-20 02:33:59.425718',NULL,NULL),(76,'5w4wwZOrLIF7W8BsT6Ej1ZzzuDopCg','2021-09-20 12:55:40.766176','read write',1,9,'2021-09-20 02:55:40.766676','2021-09-20 02:55:40.766676',NULL,NULL),(79,'uyhEltq29dWphLQDOIP4f6HD2GtKlV','2021-09-21 09:51:03.477795','read write',1,9,'2021-09-20 23:51:03.477795','2021-09-20 23:51:03.477795',NULL,NULL),(80,'g3kATHjzYJHtCU66MFhl1djk2rs846','2021-09-21 20:23:42.306131','read write',1,9,'2021-09-21 10:23:42.307134','2021-09-21 10:23:42.307134',NULL,NULL),(81,'JjwBJ14gu4JYM2bt5EUJ85OtTvGgmL','2021-09-21 20:30:48.971032','read write',1,9,'2021-09-21 10:30:48.971524','2021-09-21 10:30:48.971524',NULL,NULL),(82,'9EStCDwnKuxVID1jLo7q7YNqE8ymFl','2021-09-21 21:38:37.328911','read write',1,9,'2021-09-21 11:38:37.329412','2021-09-21 11:38:37.329412',NULL,NULL),(83,'jxNDXV4ONVCWwT3Ys2Yp7lCho6lHbk','2021-09-21 21:46:37.316513','read write',1,9,'2021-09-21 11:46:37.317011','2021-09-21 11:46:37.317011',NULL,NULL),(84,'IIPqpQPYHqAturd4kNOlkHFLRtViBi','2021-09-21 21:47:09.077011','read write',1,9,'2021-09-21 11:47:09.077512','2021-09-21 11:47:09.077512',NULL,NULL),(85,'I7RY3KS4iqx5uMi0XwfF2wLfkm0X35','2021-09-21 21:47:37.190665','read write',1,9,'2021-09-21 11:47:37.191165','2021-09-21 11:47:37.191165',NULL,NULL),(86,'O5fNgkiUo9a3C4IMDA8MOER1PG0NSw','2021-09-21 21:48:55.256021','read write',1,9,'2021-09-21 11:48:55.256522','2021-09-21 11:48:55.256522',NULL,NULL),(87,'nQV7SPcRwrODCN52JhdTmzi8HDITPz','2021-09-21 21:50:01.716555','read write',1,9,'2021-09-21 11:50:01.717054','2021-09-21 11:50:01.717054',NULL,NULL),(88,'Y2Q8sVaXfxvFvrCsiBscUDY3QPMXVY','2021-09-21 21:57:39.531123','read write',1,9,'2021-09-21 11:57:39.531123','2021-09-21 11:57:39.531123',NULL,NULL),(89,'vzr2KV0E4BMdaKzVajLHDJazkVwRD3','2021-09-21 21:58:08.810596','read write',1,9,'2021-09-21 11:58:08.811099','2021-09-21 11:58:08.811099',NULL,NULL),(90,'5DPNABxM0TWzeyk3nAG99JZj4XeeZr','2021-09-21 22:05:41.363196','read write',1,9,'2021-09-21 12:05:41.363696','2021-09-21 12:05:41.363696',NULL,NULL),(91,'m8UXuYMko3MHCBF5SDZuoJlM1cS2MB','2021-09-21 22:05:41.443709','read write',1,9,'2021-09-21 12:05:41.443709','2021-09-21 12:05:41.443709',NULL,NULL),(92,'kmDyuBLqqpIU3CsJUntbcsv7F6TRj9','2021-09-21 22:05:47.386970','read write',1,9,'2021-09-21 12:05:47.387972','2021-09-21 12:05:47.387972',NULL,NULL),(93,'iYDyXykFrdqpRv3U7nxrnh2dvNFWj2','2021-09-21 22:06:27.729137','read write',1,9,'2021-09-21 12:06:27.729637','2021-09-21 12:06:27.729637',NULL,NULL),(94,'XikucYEK4O6NmdPGbPN620ao6lxhCr','2021-09-21 22:06:47.173176','read write',1,9,'2021-09-21 12:06:47.173677','2021-09-21 12:06:47.173677',NULL,NULL),(95,'MtS9XMGFOkULXOvWezGGDLzc8mvHas','2021-09-21 22:09:40.749648','read write',1,9,'2021-09-21 12:09:40.750149','2021-09-21 12:09:40.750149',NULL,NULL),(96,'EzUkg00yFiZ54jXOwjS14bKTu6FgIC','2021-09-21 22:09:48.656567','read write',1,9,'2021-09-21 12:09:48.657069','2021-09-21 12:09:48.657069',NULL,NULL),(97,'wQCogPdtkTuq5vcZuOiRZfgpYEzEeA','2021-09-21 22:09:51.248433','read write',1,9,'2021-09-21 12:09:51.248433','2021-09-21 12:09:51.248433',NULL,NULL),(98,'Df0gbP71oF2fQtTW6M611jYOy2SwxZ','2021-09-21 22:10:21.686846','read write',1,9,'2021-09-21 12:10:21.687346','2021-09-21 12:10:21.687346',NULL,NULL),(99,'sADQZPFgqPaTWfrrtxtWBncKzNMnpK','2021-09-21 22:10:59.125600','read write',1,9,'2021-09-21 12:10:59.126101','2021-09-21 12:10:59.126101',NULL,NULL),(100,'aGisJ3iVw2wzEuwALnWkwm5im3Bt0b','2021-09-21 22:11:41.871640','read write',1,9,'2021-09-21 12:11:41.872140','2021-09-21 12:11:41.872140',NULL,NULL),(102,'IhB2R78jFuowGWZk3TdlMbvhUZ89lJ','2021-09-21 22:12:11.198515','read write',1,9,'2021-09-21 12:12:11.199014','2021-09-21 12:12:11.199014',NULL,NULL),(103,'VGOKgpZShIk6TD3PwCDuuxo6YHW0PH','2021-09-22 03:27:54.371987','read write',1,9,'2021-09-21 17:27:54.372487','2021-09-21 17:27:54.372487',NULL,NULL),(104,'XkOLb1uTFfYNzCBikF7iY1R8MUemcc','2021-09-22 03:28:51.665396','read write',1,9,'2021-09-21 17:28:51.665896','2021-09-21 17:28:51.665896',NULL,NULL),(105,'7nB7YlMZcO053zGWiJWEypLAc9qLoO','2021-09-22 03:29:21.583424','read write',1,9,'2021-09-21 17:29:21.583924','2021-09-21 17:29:21.583924',NULL,NULL),(106,'iDDe1p6A77cOG0z5W2dj1WxtssVy2N','2021-09-22 14:13:59.484705','read write',1,9,'2021-09-22 04:13:59.485223','2021-09-22 04:13:59.485223',NULL,NULL),(107,'6TWhpKo29IWltGIoJHYEmgZPZ4ZQP9','2021-09-22 19:25:59.339212','read write',1,9,'2021-09-22 09:25:59.339714','2021-09-22 09:25:59.339714',NULL,NULL),(109,'Yi8zx4B0TQHCwnvBce24Vc9hkFvRsw','2021-09-22 19:26:58.552257','read write',1,9,'2021-09-22 09:26:58.552257','2021-09-22 09:26:58.552257',NULL,NULL),(110,'0gubhjN0hrh6GdqOVSE7UIgp2G4Tfz','2021-09-23 12:52:19.331715','read write',1,9,'2021-09-23 02:52:19.332215','2021-09-23 02:52:19.332215',NULL,NULL),(111,'5cLjg114qF0BeCGS6rxIfAvBQq8F4A','2021-09-23 12:53:14.968495','read write',1,9,'2021-09-23 02:53:14.968995','2021-09-23 02:53:14.968995',NULL,NULL),(112,'eNOchkjrDuQIqOqn61DOydOgTaYBhg','2021-09-23 12:55:36.790136','read write',1,9,'2021-09-23 02:55:36.790136','2021-09-23 02:55:36.790136',NULL,NULL),(113,'tCT6RMl1HUwUOKG1TynyU5GycFWOBy','2021-09-23 12:55:36.855147','read write',1,9,'2021-09-23 02:55:36.855646','2021-09-23 02:55:36.855646',NULL,NULL),(114,'5Zcc0NvSrwwyc5jrbrTDCZqlZ6qK2C','2021-09-23 12:55:52.071437','read write',1,9,'2021-09-23 02:55:52.071996','2021-09-23 02:55:52.071996',NULL,NULL),(115,'kRdHgMyIn26E5NPAJ3rBwKSG78S6d7','2021-09-25 00:50:58.261299','read write',1,2,'2021-09-24 14:50:58.261299','2021-09-24 14:50:58.261299',NULL,NULL),(116,'8mxyq1N6kmBIBWvoBMUTorJfKlV1yY','2021-09-25 01:05:19.200712','read write',1,1,'2021-09-24 15:05:19.200712','2021-09-24 15:05:19.200712',NULL,NULL),(117,'wvrdTSxAwPyEknYH7XNGT98oIetHVr','2021-09-25 01:05:48.379187','read write',1,1,'2021-09-24 15:05:48.379187','2021-09-24 15:05:48.379187',NULL,NULL),(119,'VNpjdogrrA3dGcGtFunCkejCPbzoz0','2021-09-25 01:11:29.256183','read write',1,2,'2021-09-24 15:11:29.256183','2021-09-24 15:11:29.256183',NULL,NULL),(122,'DoKUgznzQPyE8gyU5pg0iXkcGTKyo7','2021-09-25 02:48:39.049810','read write',1,2,'2021-09-24 16:48:39.050271','2021-09-24 16:48:39.050271',NULL,NULL),(123,'cZ2M48xRWUeSZHrBrHBAxSbRgqXkms','2021-09-25 02:51:12.603002','read write',1,2,'2021-09-24 16:51:12.603002','2021-09-24 16:51:12.603002',NULL,NULL),(124,'BuXC5lJJRqWIn7jPjvmnVZljdVvX9n','2021-09-25 13:23:10.481572','read write',1,9,'2021-09-25 03:23:10.482573','2021-09-25 03:23:10.482573',NULL,NULL),(125,'HhxnPTfQX2Opg6VI52xfYo52Nf9v4p','2021-09-25 13:24:13.358788','read write',1,9,'2021-09-25 03:24:13.359287','2021-09-25 03:24:13.359287',NULL,NULL),(126,'im9x9mPzTNShSeipac3CmIFtjX8kou','2021-09-28 00:19:20.817805','read write',1,9,'2021-09-27 14:19:20.818307','2021-09-27 14:19:20.818307',NULL,NULL),(127,'h0mqxX7cUBeYBc9S7ce7urVDsD4573','2021-09-28 21:03:48.888301','read write',1,9,'2021-09-28 11:03:48.888798','2021-09-28 11:03:48.888798',NULL,NULL),(128,'pBFb9Tuwf0a2NecPC8z8GbkzNiTjRJ','2021-09-29 22:14:15.916257','read write',1,9,'2021-09-29 12:14:15.916758','2021-09-29 12:14:15.916758',NULL,NULL),(129,'rVaEgC04tU8jy88iKpAX7A8h35Jb6N','2021-09-29 23:04:24.202487','read write',1,9,'2021-09-29 13:04:24.202987','2021-09-29 13:04:24.202987',NULL,NULL),(131,'2gtlpyZ7V3gYcVl97FzmN4mcsJ7UKl','2021-09-30 04:04:18.084061','read write',1,9,'2021-09-29 18:04:18.084562','2021-09-29 18:04:18.084562',NULL,NULL),(133,'MgsmYpiepSbSg388ACBx4zCo57uz4q','2021-09-30 16:58:47.243524','read write',1,9,'2021-09-30 06:58:47.244523','2021-09-30 06:58:47.244523',NULL,NULL),(134,'coipZGu54GBzpSXUHY8Du1OgyBXWs6','2021-09-30 16:58:47.268527','read write',1,9,'2021-09-30 06:58:47.269028','2021-09-30 06:58:47.269028',NULL,NULL),(135,'9v7o59EKUg8Wwyve8XLUBi6msQW3wj','2021-09-30 17:07:16.785492','read write',1,9,'2021-09-30 07:07:16.785992','2021-09-30 07:07:16.785992',NULL,NULL),(137,'51HQ1ihFF18mGsmoo3t7PbUPdiHrpe','2021-09-30 17:18:07.905018','read write',1,9,'2021-09-30 07:18:07.905518','2021-09-30 07:18:07.905518',NULL,NULL),(138,'p9MdQgdRCdSAnvlgWS6cB76Ft3i8jN','2021-09-30 17:20:17.287221','read write',1,9,'2021-09-30 07:20:17.287221','2021-09-30 07:20:17.287720',NULL,NULL),(140,'TbARhxYUPdKZEU5lTmeTTVWICwkbdL','2021-09-30 17:39:15.208987','read write',1,9,'2021-09-30 07:39:15.209488','2021-09-30 07:39:15.209488',NULL,NULL),(142,'KttVUVR2yP8j4Kn75o63O9FnmrhpnZ','2021-09-30 17:40:09.040540','read write',1,9,'2021-09-30 07:40:09.041039','2021-09-30 07:40:09.041039',NULL,NULL),(145,'X3jdckK3RWJFnVnnPaxrqntBWlFzw3','2021-09-30 17:58:01.598488','read write',1,9,'2021-09-30 07:58:01.598990','2021-09-30 07:58:01.598990',NULL,NULL),(147,'DUlI8HWbmVJRKsjwIaHQejC3AM8Ff0','2021-09-30 17:59:40.718789','read write',1,9,'2021-09-30 07:59:40.719314','2021-09-30 07:59:40.719314',NULL,NULL),(148,'5y4eCyD0DMpgpB7fg6t5f958X3Fb4f','2021-09-30 18:00:17.810698','read write',1,9,'2021-09-30 08:00:17.811198','2021-09-30 08:00:17.811198',NULL,NULL),(149,'z5SM24GvmqhvGvdchaQZWcuruWzeFi','2021-09-30 18:02:27.813204','read write',1,9,'2021-09-30 08:02:27.813204','2021-09-30 08:02:27.813204',NULL,NULL),(150,'n4sJ8mpxXDq66qvNPsh0IONJZ12w1u','2021-09-30 18:02:44.664430','read write',1,9,'2021-09-30 08:02:44.664430','2021-09-30 08:02:44.664430',NULL,NULL),(152,'JKT2aaOS7DvOUZIwBSfie8Y7UYaba5','2021-09-30 20:05:17.643747','read write',1,9,'2021-09-30 10:05:17.643747','2021-09-30 10:05:17.643747',NULL,NULL),(154,'hCy7gBVQZQHwhqoSJTI8lk3QFjc25r','2021-09-30 20:15:19.485551','read write',1,9,'2021-09-30 10:15:19.486051','2021-09-30 10:15:19.486051',NULL,NULL),(156,'vyuBdz2y3dChBbWlNzz3s9WDXELPqu','2021-10-01 04:05:22.758466','read write',1,9,'2021-09-30 18:05:22.758971','2021-09-30 18:05:22.758971',NULL,NULL),(157,'j5717LNdRGXpoU6ykG39dDGH574zth','2021-10-01 05:04:57.636008','read write',1,9,'2021-09-30 19:04:57.636509','2021-09-30 19:04:57.636509',NULL,NULL),(158,'itpnG5wjJZuG503O3S2M138m3pmNIH','2021-10-01 05:30:54.236698','read write',1,9,'2021-09-30 19:30:54.236698','2021-09-30 19:30:54.236698',NULL,NULL),(159,'iD2Uz8m7n9eNQGrj8wUkoiVsGfzE5v','2021-10-01 19:17:16.272449','read write',1,9,'2021-10-01 09:17:16.272949','2021-10-01 09:17:16.272949',NULL,NULL),(160,'ZYhdqjc9HP66LA396npqaeXzipsmLW','2021-10-01 19:45:39.751149','read write',1,9,'2021-10-01 09:45:39.751650','2021-10-01 09:45:39.751650',NULL,NULL),(161,'l1MG8vVNsHeoKRwlI2djmPphUDTSDS','2021-10-01 19:48:23.309404','read write',1,9,'2021-10-01 09:48:23.309904','2021-10-01 09:48:23.309904',NULL,NULL),(162,'XKqhsfFbQLIOOETtzRSsb4rJ7juReI','2021-10-01 19:48:49.005335','read write',1,9,'2021-10-01 09:48:49.005335','2021-10-01 09:48:49.005335',NULL,NULL),(163,'L2MLu0pFUJMSIRjwiTP2iJ0jwt9BjK','2021-10-01 19:50:59.583124','read write',1,9,'2021-10-01 09:50:59.583625','2021-10-01 09:50:59.583625',NULL,NULL),(165,'c1Um0u1tUZZYzqUzrbSacD2e1QZUvK','2021-10-01 20:04:14.571373','read write',1,9,'2021-10-01 10:04:14.571873','2021-10-01 10:04:14.571873',NULL,NULL),(166,'oYgL1PBARtJfHtrwOuMB5T9VTqPhzY','2021-10-02 00:07:27.091370','read write',1,9,'2021-10-01 14:07:27.091869','2021-10-01 14:07:27.091869',NULL,NULL),(167,'Z4IOOi1l7EG8U8BtMVJlO1GZXlccjj','2021-10-02 00:28:16.424289','read write',1,9,'2021-10-01 14:28:16.424789','2021-10-01 14:28:16.424789',NULL,NULL),(168,'7I6COQSK69rQSgKENueNzr5AYLPlpU','2021-10-03 10:52:22.102345','read write',1,9,'2021-10-03 00:52:22.102845','2021-10-03 00:52:22.102845',NULL,NULL),(170,'NHmu0Kw0XvRX7Q68k46wo0SoVXOpgm','2021-10-03 13:02:30.734416','read write',1,9,'2021-10-03 03:02:30.734416','2021-10-03 03:02:30.734416',NULL,NULL),(171,'3hFvWwdr38px3I5wpGYqRZwT1R1TEM','2021-10-03 13:44:05.957246','read write',1,9,'2021-10-03 03:44:05.957746','2021-10-03 03:44:05.957746',NULL,NULL),(173,'ma1tPJPXXNExvDi0jSshtcisNojCWm','2021-10-03 18:55:58.559449','read write',1,9,'2021-10-03 08:55:58.559449','2021-10-03 08:55:58.559449',NULL,NULL),(174,'DpTVUndz52OpxHqdD6SsCxoRHM6bQL','2021-10-03 22:56:36.902966','read write',1,9,'2021-10-03 12:56:36.903466','2021-10-03 12:56:36.903466',NULL,NULL),(175,'ACMU1LsIyAWIKi4KDoAuygCQ7apw1E','2021-10-03 23:02:46.399490','read write',1,9,'2021-10-03 13:02:46.399990','2021-10-03 13:02:46.399990',NULL,NULL),(177,'8VgEEUmwSXWTjkOprUEfqaNBdJebIf','2021-10-04 02:48:51.191122','read write',1,9,'2021-10-03 16:48:51.191623','2021-10-03 16:48:51.191623',NULL,NULL),(178,'MN0MSnDjFWOK9R9MsGnaaYbjU6uCxD','2021-10-04 02:51:06.419451','read write',1,9,'2021-10-03 16:51:06.419953','2021-10-03 16:51:06.419953',NULL,NULL),(180,'TPrl9mOLz3qs08W37rp6VAEe8UC0eW','2021-10-04 03:51:10.387937','read write',1,9,'2021-10-03 17:51:10.388437','2021-10-03 17:51:10.388437',NULL,NULL),(182,'QN6eSDMkHlc87J0aW7epXEB2WoSgNA','2021-10-04 19:26:16.772181','read write',1,9,'2021-10-04 09:26:16.772683','2021-10-04 09:26:16.772683',NULL,NULL),(183,'UviykJDcoErChJ1P8u5Lou3ya15NzJ','2021-10-05 22:58:14.324994','read write',1,9,'2021-10-05 12:58:14.325494','2021-10-05 12:58:14.325494',NULL,NULL),(184,'0seZcYHylYsyi3UBbmRP4cXeX9aAeK','2021-10-05 22:58:14.347998','read write',1,9,'2021-10-05 12:58:14.348498','2021-10-05 12:58:14.348498',NULL,NULL),(185,'Kc0Oxj7jgQxCXEgCrmeFyQFJJxUzGg','2021-10-05 22:58:24.456628','read write',1,9,'2021-10-05 12:58:24.457130','2021-10-05 12:58:24.457130',NULL,NULL),(187,'hEx9ooPn3HrTEeHw8oqARNyFsCmYYL','2021-10-06 03:06:39.608759','read write',1,9,'2021-10-05 17:06:39.608759','2021-10-05 17:06:39.608759',NULL,NULL),(189,'qX3aR1ldqsLfzvUJDsykbjvKf1PeCF','2021-10-06 04:08:55.050012','read write',1,9,'2021-10-05 18:08:55.050511','2021-10-05 18:08:55.050511',NULL,NULL),(192,'alKaIrA8CaNuoOpoNcOkd0dRwVphJL','2021-10-06 04:11:06.177457','read write',1,9,'2021-10-05 18:11:06.177958','2021-10-05 18:11:06.177958',NULL,NULL),(195,'U884sMzZPQGoSQ35za3tHBX1RLcyjR','2021-10-06 15:57:40.776941','read write',1,9,'2021-10-06 05:57:40.777441','2021-10-06 05:57:40.777441',NULL,NULL),(196,'Q4QIxno60yGL1fWmVb2uZodOCBJhXO','2021-10-06 19:45:50.221904','read write',1,9,'2021-10-06 09:45:50.222406','2021-10-06 09:45:50.222406',NULL,NULL),(199,'nPyumfys7v9rmQPfxBHt9BWl9zJfVh','2021-10-07 18:03:21.219909','read write',1,9,'2021-10-07 08:03:21.219909','2021-10-07 08:03:21.219909',NULL,NULL),(200,'0HbxNOLKGxmQQ7MeggkUQvVNrYMWu1','2021-10-07 18:04:48.581156','read write',1,9,'2021-10-07 08:04:48.581655','2021-10-07 08:04:48.581655',NULL,NULL),(202,'MjalKwLuJ2NcU44xgfCXvTdayJEhvC','2021-10-07 18:13:07.991870','read write',1,9,'2021-10-07 08:13:07.991870','2021-10-07 08:13:07.991870',NULL,NULL),(208,'g6uMAMkYrKHaWUCiMmBEMpSKD3sC9z','2021-10-07 23:04:29.170636','read write',1,9,'2021-10-07 13:04:29.171137','2021-10-07 13:04:29.171137',NULL,NULL),(215,'JFt0A0gYhKD9i2hxgnYdHKf9te55Dl','2021-10-08 00:28:54.434053','read write',1,9,'2021-10-07 14:28:54.434553','2021-10-07 14:28:54.434553',NULL,NULL),(216,'fFcciOUMo5YklTcpHZ4gpZkNWUgWI8','2021-10-08 00:29:40.177753','read write',1,9,'2021-10-07 14:29:40.178253','2021-10-07 14:29:40.178253',NULL,NULL),(218,'RLSZ0jTChW9Eu6t5CVyK4mpfztEx9C','2021-10-08 01:12:28.271553','read write',1,9,'2021-10-07 15:12:28.272053','2021-10-07 15:12:28.272053',NULL,NULL),(219,'ztKGbDWfj5ux9icZfWWR4ow2roWNHQ','2021-10-08 01:12:28.332564','read write',1,9,'2021-10-07 15:12:28.333064','2021-10-07 15:12:28.333064',NULL,NULL),(220,'gsoHiydiCQhRHSSW4iKCCZFUA0yBCc','2021-10-08 01:12:43.996835','read write',1,9,'2021-10-07 15:12:43.997337','2021-10-07 15:12:43.997337',NULL,NULL),(221,'hZWV8KQCYGU725c9yDxE75bNizzZWQ','2021-10-08 01:24:33.880889','read write',1,9,'2021-10-07 15:24:33.881390','2021-10-07 15:24:33.881390',NULL,NULL),(225,'8aXmwU8iRGkSq3ZnqcExMyXQcoYyRN','2021-10-08 06:06:22.569787','read write',1,9,'2021-10-07 20:06:22.570287','2021-10-07 20:06:22.570287',NULL,NULL),(227,'A1ZcubikXIfmcQbUK79ZQ55JVzKK9t','2021-10-08 06:10:57.478836','read write',1,9,'2021-10-07 20:10:57.479336','2021-10-07 20:10:57.479336',NULL,NULL),(237,'V6imVmPA0nbDicyjwSYWMgJtqamS6c','2021-10-08 16:00:19.973654','read write',1,9,'2021-10-08 06:00:19.974153','2021-10-08 06:00:19.974153',NULL,NULL),(238,'sUUVIkAceKmfLbuZRZ3uQNiV6E07Jk','2021-10-08 16:31:16.024259','read write',1,9,'2021-10-08 06:31:16.024759','2021-10-08 06:31:16.024759',NULL,NULL),(239,'uY8bVkWdSYFhxrmFqZQ8CpFMy4D0Rc','2021-10-08 23:02:52.373687','read write',1,9,'2021-10-08 13:02:52.374187','2021-10-08 13:02:52.374187',NULL,NULL),(240,'8XmCGiSP525qAwNC9VV3wXey6RGE5p','2021-10-09 00:31:09.878540','read write',1,9,'2021-10-08 14:31:09.879045','2021-10-08 14:31:09.879045',NULL,NULL),(241,'KNHeohclsLBPbDTpvO3Hf3U5YzD6yv','2021-10-09 00:31:52.164258','read write',1,9,'2021-10-08 14:31:52.164759','2021-10-08 14:31:52.164759',NULL,NULL),(242,'oZbJfi9xuCNqPhHmYaWYvt71FDiBsW','2021-10-09 01:54:36.361228','read write',1,31,'2021-10-08 15:54:36.361729','2021-10-08 15:54:36.361729',NULL,NULL),(243,'5Fx9Ox1QhsCirvc5nMIEvpReTHEAV6','2021-10-09 01:55:06.914010','read write',1,31,'2021-10-08 15:55:06.914511','2021-10-08 15:55:06.914511',NULL,NULL),(244,'k00ckZHbCORH29WtbMe1cG3REgiWra','2021-10-09 01:58:50.245116','read write',1,9,'2021-10-08 15:58:50.245116','2021-10-08 15:58:50.245116',NULL,NULL),(245,'MzFWwIfOe7hj0MYxcdqNcpxGazMqp5','2021-10-09 02:08:45.730818','read write',1,31,'2021-10-08 16:08:45.731317','2021-10-08 16:08:45.731317',NULL,NULL),(246,'4budbDIzGjelV0ESErVOGY2zFzCkCV','2021-10-09 02:34:00.280264','read write',1,32,'2021-10-08 16:34:00.280764','2021-10-08 16:34:00.280764',NULL,NULL),(247,'0TUogIUCGx19GLk7Byf8AyjYlq6dOU','2021-10-09 02:37:03.502454','read write',1,31,'2021-10-08 16:37:03.502955','2021-10-08 16:37:03.502955',NULL,NULL),(248,'zJ2mT6dQL0FexumtagWVLKlYoBXi4p','2021-10-09 02:50:48.204000','read write',1,31,'2021-10-08 16:50:48.205000','2021-10-08 16:50:48.205000',NULL,NULL),(249,'C9MziHowAdiePfCUYY6sGhrsgnDtCF','2021-10-09 02:55:38.568804','read write',1,9,'2021-10-08 16:55:38.569301','2021-10-08 16:55:38.569301',NULL,NULL),(250,'da8OhmwnstqE1ieTdz6YWnQKOs873b','2021-10-09 03:05:38.346514','read write',1,33,'2021-10-08 17:05:38.346514','2021-10-08 17:05:38.346514',NULL,NULL),(251,'rfmfBRERqfidxvlr6meJK4ug1kV3SM','2021-10-09 04:15:17.193568','read write',1,9,'2021-10-08 18:15:17.194069','2021-10-08 18:15:17.194069',NULL,NULL),(252,'fT4zuAJ5gSvnz8pEN6SeMw4hQRYRWe','2021-10-09 04:17:16.233106','read write',1,9,'2021-10-08 18:17:16.233106','2021-10-08 18:17:16.233106',NULL,NULL),(253,'PpPROYfYaGbEqNYi7IHQ8oNr5fU8ZV','2021-10-09 04:17:28.297444','read write',1,9,'2021-10-08 18:17:28.297944','2021-10-08 18:17:28.297944',NULL,NULL),(254,'Szqry7cJbtorEj9TccqwsyXzL3MBTV','2021-10-09 04:18:20.307860','read write',1,9,'2021-10-08 18:18:20.307860','2021-10-08 18:18:20.307860',NULL,NULL),(255,'obaToSDzUKLIsec7oQZiJ74Xz40xMR','2021-10-09 04:18:50.087973','read write',1,9,'2021-10-08 18:18:50.087973','2021-10-08 18:18:50.087973',NULL,NULL),(256,'TWCFOgxU5mC1hPoiwYbXQDLRBc9kgE','2021-10-09 04:48:13.932106','read write',1,9,'2021-10-08 18:48:13.932606','2021-10-08 18:48:13.932606',NULL,NULL),(257,'jgfh7Kb6XYQlPB43ldr707sojvMLFP','2021-10-09 04:49:54.661103','read write',1,9,'2021-10-08 18:49:54.661603','2021-10-08 18:49:54.661603',NULL,NULL),(258,'S4OFJhuVx9XTxx0tRNGQbCfA5lE8v0','2021-10-09 04:53:13.931581','read write',1,9,'2021-10-08 18:53:13.932088','2021-10-08 18:53:13.932589',NULL,NULL),(259,'n10Ya1pxhBmq00W9h62h8kchcYEPJJ','2021-10-09 04:56:46.140398','read write',1,9,'2021-10-08 18:56:46.140898','2021-10-08 18:56:46.140898',NULL,NULL),(260,'RBfHDWfn4dsw2wJPNjSdH22u0jVgWp','2021-10-09 04:57:45.499475','read write',1,9,'2021-10-08 18:57:45.499976','2021-10-08 18:57:45.499976',NULL,NULL),(261,'WKB8wPsGwBvWp3n9FMNRiiHWfoddXl','2021-10-09 16:37:31.108929','read write',1,9,'2021-10-09 06:37:31.108929','2021-10-09 06:37:31.109429',NULL,NULL),(262,'sAAiB50hUY8Ep8wl9AEzyNfGJ95kLl','2021-10-09 16:58:34.594817','read write',1,9,'2021-10-09 06:58:34.595318','2021-10-09 06:58:34.595318',NULL,NULL),(263,'vSESH5dgH7sirGByMtTGoCPpdWfJn0','2021-10-09 17:01:20.034002','read write',1,9,'2021-10-09 07:01:20.034502','2021-10-09 07:01:20.034502',NULL,NULL),(264,'dOzmdcU6H8QEkVyyMHz8g7wV21W2L1','2021-10-09 17:02:20.080764','read write',1,9,'2021-10-09 07:02:20.081265','2021-10-09 07:02:20.081265',NULL,NULL),(265,'1QabFR34p5vL79T4VNqnLwYOgQd1po','2021-10-09 18:03:56.657145','read write',1,9,'2021-10-09 08:03:56.657145','2021-10-09 08:03:56.657145',NULL,NULL),(266,'WHlnVojNoLNKBFApw91uJN1zE5ikQA','2021-10-09 18:11:22.874208','read write',1,31,'2021-10-09 08:11:22.874208','2021-10-09 08:11:22.874208',NULL,NULL),(267,'pUNzisce44iXr6sKCMixoK75B5v0WF','2021-10-09 18:12:29.779599','read write',1,31,'2021-10-09 08:12:29.780098','2021-10-09 08:12:29.780098',NULL,NULL),(268,'bLIOcqG7p0TrWD7hJLkzTShAVtS7a0','2021-10-09 18:30:28.741159','read write',1,9,'2021-10-09 08:30:28.741660','2021-10-09 08:30:28.741660',NULL,NULL),(269,'I31wWSsefrv7oh9OK3ZwMLmE2arlHi','2021-10-10 01:01:59.820929','read write',1,9,'2021-10-09 15:01:59.821430','2021-10-09 15:01:59.821430',NULL,NULL),(270,'Kyi9IdbPxhBtfCL9iN7FxB7FwLtD6v','2021-10-10 14:23:44.629459','read write',1,9,'2021-10-10 04:23:44.629970','2021-10-10 04:23:44.629970',NULL,NULL),(271,'9L1jZgZxbJZp7hedV4E50fPmNgC6MC','2021-10-10 14:24:15.358062','read write',1,9,'2021-10-10 04:24:15.358062','2021-10-10 04:24:15.358062',NULL,NULL),(272,'JS3SjrKuhUWYGfm3WautQkHutmPARJ','2021-10-10 23:50:36.297337','read write',1,32,'2021-10-10 13:50:36.297838','2021-10-10 13:50:36.297838',NULL,NULL),(273,'PYiebrZSyJaCwl2Hr5q4yF8Z48VuU9','2021-10-11 19:58:50.322856','read write',1,32,'2021-10-11 09:58:50.322856','2021-10-11 09:58:50.322856',NULL,NULL),(274,'MxAj4sS1I8OegMR97idTY7mEfUcLE8','2021-10-11 19:59:49.468273','read write',1,32,'2021-10-11 09:59:49.468774','2021-10-11 09:59:49.468774',NULL,NULL),(275,'HenpeOT6qmQVrKo7PPJLioQt2yI91c','2021-10-11 20:00:57.140282','read write',1,9,'2021-10-11 10:00:57.140785','2021-10-11 10:00:57.140785',NULL,NULL),(276,'a5qu5hoQNQV0945RiAeScLK04IsRq7','2021-10-11 20:30:38.258731','read write',1,9,'2021-10-11 10:30:38.259232','2021-10-11 10:30:38.259232',NULL,NULL),(277,'0hWzUJqRwMpgPVJhigUcO0vOd1OYzH','2021-10-11 20:33:48.466099','read write',1,9,'2021-10-11 10:33:48.466099','2021-10-11 10:33:48.466099',NULL,NULL),(278,'LsdtW9vCsjVKGh6aCTDOolWCpdsRIT','2021-10-11 20:35:21.436880','read write',1,32,'2021-10-11 10:35:21.436880','2021-10-11 10:35:21.436880',NULL,NULL),(279,'foLDSmkm4M2MTP6GQbPMNryXjHVk35','2021-10-11 22:28:17.980155','read write',1,9,'2021-10-11 12:28:17.980657','2021-10-11 12:28:17.980657',NULL,NULL),(280,'BeTg0XsC1ztGtF0H1I0qI0LealE246','2021-10-11 22:48:56.204655','read write',1,32,'2021-10-11 12:48:56.205155','2021-10-11 12:48:56.205155',NULL,NULL),(281,'MXrBESMmYFZx8cuVSA2OUCFiAR3Vu8','2021-10-11 23:52:18.415256','read write',1,9,'2021-10-11 13:52:18.416756','2021-10-11 13:52:18.416756',NULL,NULL),(282,'o0XbsYRf2Pf5lxduSDHEIjFR4YKO05','2021-10-11 23:56:24.067507','read write',1,9,'2021-10-11 13:56:24.068508','2021-10-11 13:56:24.068508',NULL,NULL),(283,'rd4ZYagxctZ79SqjslaQqypwMVLsSw','2021-10-11 23:57:32.583796','read write',1,9,'2021-10-11 13:57:32.584296','2021-10-11 13:57:32.584296',NULL,NULL),(284,'cMHMU5D7aJPhrGlLmb4ritWxjb02f5','2021-10-11 23:57:42.929544','read write',1,9,'2021-10-11 13:57:42.929544','2021-10-11 13:57:42.929544',NULL,NULL),(285,'xgjsmkZdFovi0hcb0Ob04YGuyDrOqk','2021-10-12 00:05:53.587687','read write',1,9,'2021-10-11 14:05:53.588187','2021-10-11 14:05:53.588187',NULL,NULL),(286,'KwQkeUQ2UobbQW0Udm44ufm424PzCq','2021-10-12 03:59:31.447216','read write',1,9,'2021-10-11 17:59:31.448213','2021-10-11 17:59:31.448213',NULL,NULL),(287,'dmTW779aR2EsKmYPQcBeuZipXnr8Te','2021-10-12 03:59:53.192083','read write',1,9,'2021-10-11 17:59:53.192587','2021-10-11 17:59:53.192587',NULL,NULL),(288,'fizZWYgrzj6J835sOcNKLelKNTuyU7','2021-10-12 04:47:20.930552','read write',1,32,'2021-10-11 18:47:20.931052','2021-10-11 18:47:20.931052',NULL,NULL),(289,'eMSbmkIwi8F2zzgS2bona89fQoYgqk','2021-10-12 05:01:29.532120','read write',1,31,'2021-10-11 19:01:29.532624','2021-10-11 19:01:29.532624',NULL,NULL),(290,'WWMGbIAgnqHSBnoi304Sw43hqP7vZV','2021-10-14 06:40:58.407972','read write',1,34,'2021-10-13 20:40:58.408474','2021-10-13 20:40:58.408474',NULL,NULL),(291,'9d5I6KRAWOoMF0PO810EIOZ7HIvTg3','2021-10-14 06:58:03.758491','read write',1,31,'2021-10-13 20:58:03.758990','2021-10-13 20:58:03.758990',NULL,NULL),(292,'O6aWI05ICbB9grijheXQfkdBgzJ8gM','2021-10-14 07:09:09.473302','read write',1,9,'2021-10-13 21:09:09.473802','2021-10-13 21:09:09.473802',NULL,NULL),(293,'HbJE8DWEi4kjRJfLrsCtiev8H7CaST','2021-10-14 07:11:06.822486','read write',1,35,'2021-10-13 21:11:06.822988','2021-10-13 21:11:06.822988',NULL,NULL),(294,'U6RPUAlR5oDFds7DkZcvC9KZh4L4wE','2021-10-14 07:13:21.751044','read write',1,9,'2021-10-13 21:13:21.751044','2021-10-13 21:13:21.751044',NULL,NULL),(295,'SKOQw2U322oK9FG9BZKzAnK3zSPaz9','2021-10-14 07:17:27.567157','read write',1,35,'2021-10-13 21:17:27.567655','2021-10-13 21:17:27.567655',NULL,NULL),(296,'O0vK7dfj6TztK6lGB0uFnHPMlRn1xJ','2021-10-14 07:17:42.493395','read write',1,35,'2021-10-13 21:17:42.494394','2021-10-13 21:17:42.494394',NULL,NULL),(297,'myy0aFsNl3izMIkwVAFRzfHk52Unuv','2021-10-14 07:18:03.367936','read write',1,35,'2021-10-13 21:18:03.368436','2021-10-13 21:18:03.368436',NULL,NULL),(298,'xyohZkvN1He0bVR83Z7qua7g19jycb','2021-10-14 07:18:25.792928','read write',1,35,'2021-10-13 21:18:25.793427','2021-10-13 21:18:25.793427',NULL,NULL),(303,'POfNZQMKPTQR4kJGGoAOj1S45PUt34','2021-10-14 18:59:31.510279','read write',1,40,'2021-10-14 08:59:31.511279','2021-10-14 08:59:31.511279',NULL,NULL),(304,'QtTSwCEUo1pfihc2BCkNRnUD6dymBI','2021-10-14 19:13:42.913060','read write',1,35,'2021-10-14 09:13:42.913560','2021-10-14 09:13:42.913560',NULL,NULL),(305,'T0yP3llMQqNKbKIW5ypueXtEOhGd6F','2021-10-14 19:37:20.793330','read write',1,40,'2021-10-14 09:37:20.793831','2021-10-14 09:37:20.793831',NULL,NULL),(306,'b68SArPtxQYWdONVmuZSe3px4y0r8U','2021-10-14 19:38:39.626507','read write',1,40,'2021-10-14 09:38:39.627008','2021-10-14 09:38:39.627008',NULL,NULL),(307,'6zF7zwesSLS6hBez8Echn8p9AEf3Y0','2021-10-14 19:41:25.384583','read write',1,35,'2021-10-14 09:41:25.385084','2021-10-14 09:41:25.385084',NULL,NULL),(308,'hvFmsqEqRfMZgQghhdB0vyppcZZtUo','2021-10-14 19:41:57.696164','read write',1,40,'2021-10-14 09:41:57.696164','2021-10-14 09:41:57.696164',NULL,NULL),(309,'bM59St4g2lcELGR1h4d6oIiuEg9eXv','2021-10-14 19:44:22.247224','read write',1,35,'2021-10-14 09:44:22.247725','2021-10-14 09:44:22.247725',NULL,NULL),(310,'Le7Cx3EQaiCkSjkocvlu0oV8spLz8g','2021-10-14 19:47:55.419307','read write',1,35,'2021-10-14 09:47:55.419808','2021-10-14 09:47:55.419808',NULL,NULL),(311,'3lFusfPhEjiI2KVuFHi9VeDJFGbl7N','2021-10-14 19:49:45.403535','read write',1,9,'2021-10-14 09:49:45.404033','2021-10-14 09:49:45.404033',NULL,NULL),(312,'iPjWiZlawuOiRnk38OXjE9FSAvgN2l','2021-10-14 20:12:25.741640','read write',1,35,'2021-10-14 10:12:25.742139','2021-10-14 10:12:25.742139',NULL,NULL),(313,'jYqAm7oUDkQDHVKgYbmy8ROXf8G2Rp','2021-10-14 20:15:04.798069','read write',1,9,'2021-10-14 10:15:04.798069','2021-10-14 10:15:04.798069',NULL,NULL),(314,'TfRDmUagoTY9weSf7XIsaMvhfC4Khv','2021-10-16 00:06:09.025818','read write',1,9,'2021-10-15 14:06:09.026319','2021-10-15 14:06:09.026319',NULL,NULL),(315,'E4vpqRRYKGIMzWKoslpPeZimuamgxj','2021-10-16 00:17:23.474627','read write',1,9,'2021-10-15 14:17:23.475126','2021-10-15 14:17:23.475126',NULL,NULL),(316,'47j1w6hbgoDtKoT1LWZJcfELXpoErO','2021-10-16 00:17:46.667502','read write',1,9,'2021-10-15 14:17:46.668002','2021-10-15 14:17:46.668002',NULL,NULL),(317,'xp6mIMnuJobcj40Ab3PhUmGenFr01A','2021-10-16 00:18:09.552618','read write',1,9,'2021-10-15 14:18:09.553119','2021-10-15 14:18:09.553119',NULL,NULL),(318,'CKTPKQ9RrBpsAWTsYxvU9er7DbNEE6','2021-10-16 00:31:10.725261','read write',1,9,'2021-10-15 14:31:10.725759','2021-10-15 14:31:10.725759',NULL,NULL);
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
  `client_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect_uris` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `authorization_grant_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `skip_authorization` tinyint(1) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `algorithm` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `client_id` (`client_id`),
  KEY `oauth2_provider_application_user_id_79829054_fk_courses_user_id` (`user_id`),
  KEY `oauth2_provider_application_client_secret_53133678` (`client_secret`),
  CONSTRAINT `oauth2_provider_application_user_id_79829054_fk_courses_user_id` FOREIGN KEY (`user_id`) REFERENCES `courses_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires` datetime(6) NOT NULL,
  `redirect_uri` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `scope` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `application_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `code_challenge` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code_challenge_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nonce` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `claims` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (_utf8mb3''),
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `oauth2_provider_gran_application_id_81923564_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_grant_user_id_e8f62af8_fk_courses_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_gran_application_id_81923564_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_grant_user_id_e8f62af8_fk_courses_user_id` FOREIGN KEY (`user_id`) REFERENCES `courses_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
  `jti` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires` datetime(6) NOT NULL,
  `scope` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=319 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_refreshtoken`
--

LOCK TABLES `oauth2_provider_refreshtoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_refreshtoken` DISABLE KEYS */;
INSERT INTO `oauth2_provider_refreshtoken` VALUES (1,'frzbxvd7jqxxoJwX3YVL0jtITc6cTS',1,1,1,'2021-09-08 13:17:11.007708','2021-09-08 13:17:11.007708',NULL),(2,'UfEIVM0ObidvW6HHf5DkkKPeG5Qf2S',2,1,1,'2021-09-08 13:56:37.160630','2021-09-08 13:56:37.160630',NULL),(5,'8QwCcw1FB31UBFE2jr7p0eJEGJ5Dhf',5,1,1,'2021-09-11 07:41:12.222702','2021-09-11 07:41:12.222702',NULL),(11,'Tz63bbN5wG8Uj9IyhFUAy6oCfA8ICj',11,1,2,'2021-09-12 08:24:53.733132','2021-09-12 08:24:53.733132',NULL),(12,'euO9APztHrlGS4K4OBxL70Jiby2GQ6',12,1,2,'2021-09-12 08:49:46.760943','2021-09-12 08:49:46.760943',NULL),(13,'C1cqPFd98X8rc8hoXe9zM2hgyeDLe0',13,1,1,'2021-09-12 09:41:11.129111','2021-09-12 09:41:11.129111',NULL),(14,'431Jf8XCkQCdKM0CCQFqa4go8ULyZW',14,1,9,'2021-09-14 11:41:06.706009','2021-09-14 11:41:06.706009',NULL),(15,'JaCXsFH4VhsNf26COtUm0DNbMva6qF',15,1,9,'2021-09-14 12:46:13.239460','2021-09-14 12:46:13.239460',NULL),(16,'ReCtkoWpllnngwjte2PQKVE2xFb1V4',16,1,9,'2021-09-15 01:42:25.141702','2021-09-15 01:42:25.141702',NULL),(17,'mxs021W1es5IWtdaZ4O55aqfqAJ6N6',17,1,9,'2021-09-15 03:49:22.797834','2021-09-15 03:49:22.797834',NULL),(18,'PBChqkvoRwIXqoWuf9rB3i7eP44Cj6',18,1,9,'2021-09-15 03:49:50.067282','2021-09-15 03:49:50.067282',NULL),(19,'ibJyu7TaqE0CKApXUxwAzPa441ydz3',19,1,9,'2021-09-15 03:50:13.928590','2021-09-15 03:50:13.928590',NULL),(20,'rS7aEPtkPSf3pMY0N46CfPvlBZLHcD',20,1,9,'2021-09-15 03:50:25.205424','2021-09-15 03:50:25.205424',NULL),(21,'HkenuMGL6Kp8b9w7mzM5oWzfQBTgkh',21,1,9,'2021-09-15 03:50:47.809396','2021-09-15 03:50:47.809396',NULL),(22,'mtFmFXD5eWVgYfw9bYTAPz49PpAq35',22,1,9,'2021-09-15 03:53:35.928167','2021-09-15 03:53:35.928167',NULL),(23,'aOMyIdH3Q5O4jGuPbbJTUuMTGwEPxt',23,1,9,'2021-09-15 04:04:12.614259','2021-09-15 04:04:12.614259',NULL),(24,'yZjvsMN2xkx7CaqwWPeDu1IP26CVRO',24,1,9,'2021-09-15 04:05:46.200590','2021-09-15 04:05:46.200590',NULL),(25,'paJ8C7ChnawShd3KjeXVDBGdibfN5p',25,1,9,'2021-09-15 04:06:22.785923','2021-09-15 04:06:22.785923',NULL),(26,'MHEbRvMwZvX0Dn5D5PhedS9pEuYQuG',26,1,9,'2021-09-15 04:34:31.700990','2021-09-15 04:34:31.700990',NULL),(27,'sFpCU7FsoX8QTOGkm7VdxhbqDl5wsz',27,1,9,'2021-09-15 06:50:03.883600','2021-09-15 06:50:03.883600',NULL),(28,'Kp2jVECv058cXL0yUHk0lrAqpc0esx',28,1,9,'2021-09-15 06:56:47.626126','2021-09-15 06:56:47.626126',NULL),(29,'izGQ40iP6iXAnXhhLM6wmh5BFcQmfG',29,1,9,'2021-09-15 06:59:27.592120','2021-09-15 06:59:27.592120',NULL),(30,'ZiEHscw8iAvoErKpNtTip2L27gJ1UI',30,1,9,'2021-09-15 07:01:53.573323','2021-09-15 07:01:53.573323',NULL),(31,'pgCxgNRdQx82MKva82LLrrhBB7wKrn',31,1,9,'2021-09-15 08:50:41.831314','2021-09-15 08:50:41.832314',NULL),(32,'VV5CuorzuA9ekh7uEUQaHYgMz8q3Bp',32,1,9,'2021-09-15 08:51:15.017566','2021-09-15 08:51:15.017566',NULL),(33,'a04ylVh3HybuvmdLqgEqL0ThTUEhDD',33,1,9,'2021-09-15 08:59:47.985952','2021-09-15 08:59:47.985952',NULL),(34,'2AA6sOMo9gELlK55NP9nFdYTXMJtuw',34,1,9,'2021-09-15 09:02:30.525326','2021-09-15 09:02:30.525326',NULL),(35,'vmrLf7SFayeYeuDME7uMnDuAjioBae',35,1,9,'2021-09-15 09:03:22.253081','2021-09-15 09:03:22.253081',NULL),(36,'acmHEHiAJkjezmXcMbxL277Lgsomg4',36,1,9,'2021-09-15 09:13:59.163813','2021-09-15 09:13:59.163813',NULL),(37,'Pzr9POaAIWB28sUYN6rKiC2MhsHl3l',37,1,9,'2021-09-15 09:15:08.048359','2021-09-15 09:15:08.048359',NULL),(38,'OC2yX2EowKO7spfw9dxlYoC1OJPdLB',38,1,9,'2021-09-15 13:36:04.078597','2021-09-15 13:36:04.078597',NULL),(39,'xjl8F4LjI9wHAoo8gFWJzPV8MHpank',39,1,9,'2021-09-15 14:06:53.198709','2021-09-15 14:06:53.198709',NULL),(40,'wfnSPJzWyA3Irxq4Kb4XYHjzaJq3MY',40,1,9,'2021-09-15 14:09:50.536637','2021-09-15 14:09:50.536637',NULL),(41,'nBGga2vaGy0169G8GYzZThSKYSd18D',41,1,9,'2021-09-15 14:17:27.896883','2021-09-15 14:17:27.896883',NULL),(42,'EpzLo6ffVWlWd5pGNuFOlbHBGGz5wV',42,1,9,'2021-09-15 14:38:45.943393','2021-09-15 14:38:45.943393',NULL),(43,'D2oZnsoenlVeNKs42oB0ktJUpDJw6o',43,1,9,'2021-09-16 03:00:34.253812','2021-09-16 03:00:34.253812',NULL),(44,'9xs0kk1HWOtkP01oPmJGXgrvCsXtOG',44,1,9,'2021-09-17 03:08:33.625743','2021-09-17 03:08:33.625743',NULL),(45,'tFhuJmBB6aaAYSxouzbT5uGXFvQD4X',45,1,9,'2021-09-17 03:39:08.631451','2021-09-17 03:39:08.631451',NULL),(48,'bWsoSYaJHqmqxK160ghId3YAlkYucp',48,1,9,'2021-09-17 04:23:37.117728','2021-09-17 04:23:37.117728',NULL),(49,'cTSTf2GWZ2J79XiXl71wwJAAnVgbqs',49,1,9,'2021-09-17 04:28:53.356322','2021-09-17 04:28:53.356322',NULL),(50,'FBxhHBrYDr10J8PW75RtitaVKSvPTb',50,1,9,'2021-09-17 04:32:33.859066','2021-09-17 04:32:33.859066',NULL),(53,'46E5heUZKaTSOcCgGmBiaKIgmfDxei',53,1,9,'2021-09-17 06:00:04.738262','2021-09-17 06:00:04.738262',NULL),(54,'9b6ON7zUnHM3aRoPfNh8pRe8uNpA8k',54,1,9,'2021-09-17 06:09:11.409600','2021-09-17 06:09:11.409600',NULL),(55,'vLntbcEVfs8H5js8UpiPHHVb0QmJRv',55,1,9,'2021-09-17 06:13:10.202073','2021-09-17 06:13:10.202073',NULL),(56,'5vy6JB0ubIjWPS5ngoqFnsMgzOWznq',56,1,9,'2021-09-17 06:15:18.431794','2021-09-17 06:15:18.431794',NULL),(57,'Wa33gdWMfCjhOipfodnUXoUMPyV38Y',57,1,9,'2021-09-17 06:15:36.237780','2021-09-17 06:15:36.237780',NULL),(58,'93BnZxki7PyW5aZtxSIeHRw3OmepED',58,1,9,'2021-09-17 06:16:13.036018','2021-09-17 06:16:13.036018',NULL),(59,'ux1JktQwAUowA5Y297RCU4v1zxpV8O',59,1,9,'2021-09-17 06:16:42.558484','2021-09-17 06:16:42.558484',NULL),(60,'yP4AruFEyEuFGEJAr4UCqv8R0WpFiN',60,1,9,'2021-09-17 06:19:42.730858','2021-09-17 06:19:42.730858',NULL),(62,'keHeofGDO51HK7rIfdX0Bbo05uYPVF',62,1,9,'2021-09-17 09:35:37.531053','2021-09-17 09:35:37.531053',NULL),(64,'GRIhNWeJ0Bu52z9a0byEuiZCsnyqoU',64,1,9,'2021-09-17 13:46:55.734582','2021-09-17 13:46:55.734582',NULL),(66,'WtNpKN9eGOrsvYpQdPQMAyKqbJK3eO',66,1,9,'2021-09-17 13:50:59.756142','2021-09-17 13:50:59.756142',NULL),(67,'w9nGU2DSRbtTIYWFAF3oaEbkbhxh2q',67,1,9,'2021-09-17 13:51:44.087751','2021-09-17 13:51:44.087751',NULL),(68,'pFTVk6tJRsskMeQ6Hhei7cD0uLgT6S',68,1,9,'2021-09-17 13:51:54.748382','2021-09-17 13:51:54.748382',NULL),(69,'YNx2uQumzfgzTkjfdlAaVToSJPnY6Q',69,1,9,'2021-09-18 07:35:56.231160','2021-09-18 07:35:56.231160',NULL),(70,'ftgrXI2xsSWclj6zdAdUp3S0st35Xh',70,1,9,'2021-09-18 20:39:02.673597','2021-09-18 20:39:02.673597',NULL),(71,'EFCIeI6st8CfYwJsms3MtwLAUJ24Ma',71,1,9,'2021-09-19 03:31:07.567588','2021-09-19 03:31:07.567588',NULL),(73,'ibhmHIbrHGv7pEXHBHr3DeKgfkuD8C',73,1,9,'2021-09-20 01:28:55.217063','2021-09-20 01:28:55.217063',NULL),(74,'Rv0FlqfyyruSFpsW1pXKyP8UtsbMO7',74,1,9,'2021-09-20 02:33:59.453722','2021-09-20 02:33:59.453722',NULL),(76,'CoPfFzljsg85pi5Y3c43XSwy6LzuHS',76,1,9,'2021-09-20 02:55:40.796829','2021-09-20 02:55:40.796829',NULL),(79,'Jl3NBfHvmul2Uw4ZlrRbiIfxCJRU5l',79,1,9,'2021-09-20 23:51:03.507316','2021-09-20 23:51:03.507316',NULL),(80,'ns4LLxJsJeUDvNYXAs8kW9w4quc13Y',80,1,9,'2021-09-21 10:23:42.358450','2021-09-21 10:23:42.358450',NULL),(81,'c6C2Xlk5X3p467uQa3AZGtyFSHhh4r',81,1,9,'2021-09-21 10:30:48.997710','2021-09-21 10:30:48.997710',NULL),(82,'tMNvNhvWr1kfo378qXAZD2o6qHTHX1',82,1,9,'2021-09-21 11:38:37.354920','2021-09-21 11:38:37.354920',NULL),(83,'zwmLNlps7GQ3D4Rm9GowVPQIpybvup',83,1,9,'2021-09-21 11:46:37.351517','2021-09-21 11:46:37.351517',NULL),(84,'MmSRanZt27BrM66XPuqKVh8C8clQkK',84,1,9,'2021-09-21 11:47:09.104017','2021-09-21 11:47:09.104017',NULL),(85,'GbNUqkYkcoNt3VkOsbPVJbZbF5UExA',85,1,9,'2021-09-21 11:47:37.218169','2021-09-21 11:47:37.218169',NULL),(86,'kjQcLT3n5Wq9WWrFSMK87RyS3st8aT',86,1,9,'2021-09-21 11:48:55.283027','2021-09-21 11:48:55.283027',NULL),(87,'uUSlaEJ1gMCDALiHTrmf82PhnA2TN4',87,1,9,'2021-09-21 11:50:01.745368','2021-09-21 11:50:01.745368',NULL),(88,'tiKFCZavEfkQmZif3GDhwBEMWgwXL7',88,1,9,'2021-09-21 11:57:39.560627','2021-09-21 11:57:39.560627',NULL),(89,'DmcKjYUI6Gr5gAWq0Rc69wYW9WFWSN',89,1,9,'2021-09-21 11:58:08.837600','2021-09-21 11:58:08.837600',NULL),(90,'pXM3fMhYMXFwJxpD6BV63ChBZaRE0R',90,1,9,'2021-09-21 12:05:41.392701','2021-09-21 12:05:41.392701',NULL),(91,'Tj21rr1Bhyl56BdRWaeIOUnA64EUt7',91,1,9,'2021-09-21 12:05:41.534225','2021-09-21 12:05:41.534225',NULL),(92,'5KWmGrPTZVfXynnsAOQsNDyAPApyy5',92,1,9,'2021-09-21 12:05:47.413977','2021-09-21 12:05:47.413977',NULL),(93,'jai1BlzYAlZxcg21HBQniXZ92sPXcd',93,1,9,'2021-09-21 12:06:27.755142','2021-09-21 12:06:27.755643',NULL),(94,'f2ZqPb6dEIL4y8QUUVbTvtom4Gfx3p',94,1,9,'2021-09-21 12:06:47.199186','2021-09-21 12:06:47.199186',NULL),(95,'ewtkl4UX92xXZW6PsNibKmQQb8zgWH',95,1,9,'2021-09-21 12:09:40.778653','2021-09-21 12:09:40.778653',NULL),(96,'MXmzG7qLxJK34zL5M2lpunUDyeNzwz',96,1,9,'2021-09-21 12:09:48.683572','2021-09-21 12:09:48.683572',NULL),(97,'fhL14KoGULBmdguRA4vbwxnjjc1R56',97,1,9,'2021-09-21 12:09:51.274386','2021-09-21 12:09:51.274386',NULL),(98,'3rBiA8TpHwLVzsNxmbFWqirLIibvE5',98,1,9,'2021-09-21 12:10:21.712850','2021-09-21 12:10:21.712850',NULL),(99,'P0ZjScWB8c7net5hLqQfDuztcYOMLw',99,1,9,'2021-09-21 12:10:59.152606','2021-09-21 12:10:59.152606',NULL),(100,'5GdGNUhijwOw9i7ABUMw1paJwB19fE',100,1,9,'2021-09-21 12:11:41.899145','2021-09-21 12:11:41.899145',NULL),(102,'VbYlig1oDDHdIypNYhkpOHHslcARRW',102,1,9,'2021-09-21 12:12:11.224518','2021-09-21 12:12:11.224518',NULL),(103,'ZBsrl1WemZfWYmfebsfNt0g7Os0i4t',103,1,9,'2021-09-21 17:27:54.399405','2021-09-21 17:27:54.399405',NULL),(104,'iXXfiqgkiPSmGknzlq5xDLGo4pc5Bb',104,1,9,'2021-09-21 17:28:51.691398','2021-09-21 17:28:51.691398',NULL),(105,'a1eXOeYlgMRdT5TG5R4DVOQiipuohI',105,1,9,'2021-09-21 17:29:21.613409','2021-09-21 17:29:21.613409',NULL),(106,'ZNTOOpFFFnh19PWBZAAoADRd5R3QHj',106,1,9,'2021-09-22 04:13:59.536738','2021-09-22 04:13:59.536738',NULL),(107,'Hm7KPirlXpVVvFzZrhFMgCikw4eFiA',107,1,9,'2021-09-22 09:25:59.371719','2021-09-22 09:25:59.372220',NULL),(109,'GcJDPRDnyEL3W4KFKqZTtlYvLvzLek',109,1,9,'2021-09-22 09:26:58.580764','2021-09-22 09:26:58.580764',NULL),(110,'CjljLNO0eIKKv6oRLt5c7qFEjYCLYw',110,1,9,'2021-09-23 02:52:19.374519','2021-09-23 02:52:19.374519',NULL),(111,'Rh4S4HGM3y6W599L6UE7NaVDcEMVEU',111,1,9,'2021-09-23 02:53:14.997499','2021-09-23 02:53:14.997499',NULL),(112,'whEBIYAhhLaNPRlPhecueB6Qffajph',112,1,9,'2021-09-23 02:55:36.816643','2021-09-23 02:55:36.816643',NULL),(113,'1nGz707xCngCVxR6toPRGJUxd7EqPV',113,1,9,'2021-09-23 02:55:36.948663','2021-09-23 02:55:36.948663',NULL),(114,'CRj3orjZaKc6XX6myjLzbnF2SDB3WN',114,1,9,'2021-09-23 02:55:52.101205','2021-09-23 02:55:52.101205',NULL),(115,'2rNageKaX6ELCSLDF95z0Phv9j6U0B',115,1,2,'2021-09-24 14:50:58.303035','2021-09-24 14:50:58.303035',NULL),(116,'3wm2xVdRmvRFJ542WG08dXBcZxAssB',116,1,1,'2021-09-24 15:05:19.273980','2021-09-24 15:05:19.273980',NULL),(117,'hvicrSAU26TOGy5EN8B1OVk3F7e2jx',117,1,1,'2021-09-24 15:05:48.440310','2021-09-24 15:05:48.440310',NULL),(119,'PespnLQJxviynh05taegpbrTVxEw3N',119,1,2,'2021-09-24 15:11:29.288151','2021-09-24 15:11:29.288151',NULL),(122,'IPUPgTnZOGyEQFqF6shXIRtXD07ca1',122,1,2,'2021-09-24 16:48:39.157305','2021-09-24 16:48:39.157305',NULL),(123,'gX2E035Sc59krfYqmbpXeq5L7sCNIJ',123,1,2,'2021-09-24 16:51:12.663885','2021-09-24 16:51:12.663885',NULL),(124,'YzJuYmAVN2KGcyJ3eWna3RYkHgFAqm',124,1,9,'2021-09-25 03:23:10.530580','2021-09-25 03:23:10.530580',NULL),(125,'zARKh84KgaWmy2XIK8GKxAAvPECoBB',125,1,9,'2021-09-25 03:24:13.384450','2021-09-25 03:24:13.384450',NULL),(126,'2jnvuDRlCTMD0bbjwmNHS0ocBsnRDG',126,1,9,'2021-09-27 14:19:20.869240','2021-09-27 14:19:20.869240',NULL),(127,'TvLs5ZmkJEKymUcQa4JbPpfm5laLdt',127,1,9,'2021-09-28 11:03:48.946743','2021-09-28 11:03:48.946743',NULL),(128,'EPpTzsl2RNUwCXKq7fTSvgjA03cjMp',128,1,9,'2021-09-29 12:14:15.967795','2021-09-29 12:14:15.967795',NULL),(129,'DYrqpovdcQxi8TXMH4Ml7Ukn1Kxsuc',129,1,9,'2021-09-29 13:04:24.235072','2021-09-29 13:04:24.235072',NULL),(131,'yYFOQI1S1JA9HFWONRr1lZUXNYHP95',131,1,9,'2021-09-29 18:04:18.113068','2021-09-29 18:04:18.113068',NULL),(133,'DFv6PZge53VOnnBxNA9V0On0bO68jP',133,1,9,'2021-09-30 06:58:47.300533','2021-09-30 06:58:47.300533',NULL),(134,'0Qw74Mh9iOsLaM8JAM1yJIQYtoWJwg',134,1,9,'2021-09-30 06:58:47.306534','2021-09-30 06:58:47.306534',NULL),(135,'Hon70uxJK1ECsZi7Yf37R2yTWQTvKr',135,1,9,'2021-09-30 07:07:16.812997','2021-09-30 07:07:16.812997',NULL),(137,'vDUEsVjMVr7GLuBFVURmSN9bKHD0nq',137,1,9,'2021-09-30 07:18:07.932194','2021-09-30 07:18:07.932194',NULL),(138,'V0uw9kwPuCCvaJZijQnv4oBJAFgiXv',138,1,9,'2021-09-30 07:20:17.313885','2021-09-30 07:20:17.313885',NULL),(140,'xVnfeDHQ6NoQxM2gkSI9cesWo1irTr',140,1,9,'2021-09-30 07:39:15.236364','2021-09-30 07:39:15.236364',NULL),(142,'LXL28F6ViJo5YUmSsWgkaieDm9QdWC',142,1,9,'2021-09-30 07:40:09.066680','2021-09-30 07:40:09.066680',NULL),(145,'WvwUNnr8lJKtF54YOCaWLsGGtkLGT9',145,1,9,'2021-09-30 07:58:01.627995','2021-09-30 07:58:01.627995',NULL),(147,'lHsBlrVOAhMffe5chj2Y5I4bLuLXl7',147,1,9,'2021-09-30 07:59:40.745800','2021-09-30 07:59:40.745800',NULL),(148,'ZAvEMPLlyc1A9imumCuT1mW9e4l2KT',148,1,9,'2021-09-30 08:00:17.837202','2021-09-30 08:00:17.837202',NULL),(149,'VXulVQVKzjJ8mMmCV5KJYew81A6ReU',149,1,9,'2021-09-30 08:02:27.839711','2021-09-30 08:02:27.839711',NULL),(150,'IlXBl3DD7BXCf5u3BM4HJnT7kN03I0',150,1,9,'2021-09-30 08:02:44.691433','2021-09-30 08:02:44.691433',NULL),(152,'PPCehBH7USJ0KRcwv1IJnwTlcuRw7D',152,1,9,'2021-09-30 10:05:17.673751','2021-09-30 10:05:17.673751',NULL),(154,'TvczNauspShAp59W4zwoaADOIy6FEl',154,1,9,'2021-09-30 10:15:19.570566','2021-09-30 10:15:19.570566',NULL),(156,'5Cuo1fVKmPJ8RZHUKzercIL3xk81gE',156,1,9,'2021-09-30 18:05:22.785383','2021-09-30 18:05:22.785383',NULL),(157,'T4mieYc4VjLZe1fzmpP3jCpWR8YJfW',157,1,9,'2021-09-30 19:04:57.666183','2021-09-30 19:04:57.666183',NULL),(158,'ug2ZcLCIsgV8OLIq34YbQ6fe2J76dW',158,1,9,'2021-09-30 19:30:54.268204','2021-09-30 19:30:54.268204',NULL),(159,'POtkAP0qthGxjqSlImZ1H6rXgKpRen',159,1,9,'2021-10-01 09:17:16.303231','2021-10-01 09:17:16.303231',NULL),(160,'gM5S7uYvYu1vQCSVFyDeSZHDcFghjp',160,1,9,'2021-10-01 09:45:39.779018','2021-10-01 09:45:39.779018',NULL),(161,'58jYrs8szkKjvSjG7RAHDxm3FiFtsM',161,1,9,'2021-10-01 09:48:23.339886','2021-10-01 09:48:23.339886',NULL),(162,'ay3YqPiZ04MwZss5aBKCk4fmuQjNz0',162,1,9,'2021-10-01 09:48:49.032840','2021-10-01 09:48:49.032840',NULL),(163,'A3deKjCN9xSOIEzjDj6MOUavIOvdTG',163,1,9,'2021-10-01 09:50:59.610133','2021-10-01 09:50:59.610133',NULL),(165,'BQ1z0oxQ98Mcw96QBD9SncNpWmItMc',165,1,9,'2021-10-01 10:04:14.613871','2021-10-01 10:04:14.613871',NULL),(166,'1TW52CgpsN7Y89tQuR4AQw1XD9iLLq',166,1,9,'2021-10-01 14:07:27.121806','2021-10-01 14:07:27.121806',NULL),(167,'G8KwXQyzPUJVaIYN2kguWf4aAl1fHI',167,1,9,'2021-10-01 14:28:16.465014','2021-10-01 14:28:16.465014',NULL),(168,'1PqWa1dxKRYbaM67ktLNy6MlLsR5dw',168,1,9,'2021-10-03 00:52:22.157357','2021-10-03 00:52:22.157357',NULL),(170,'yPWNs5QFnUuBsYbA0hK7qwVodb8agt',170,1,9,'2021-10-03 03:02:30.759538','2021-10-03 03:02:30.760038',NULL),(171,'pZg4ZQ9ui4PNYnWxQZ080aioFl7Rhl',171,1,9,'2021-10-03 03:44:05.997753','2021-10-03 03:44:05.997753',NULL),(173,'Bn5b5YYX5IjJzmiBv470tES5SyYgni',173,1,9,'2021-10-03 08:55:58.593455','2021-10-03 08:55:58.593455',NULL),(174,'IEqOi0ijQPZ3nTL3ejm6nt7rWU7YAq',174,1,9,'2021-10-03 12:56:36.958009','2021-10-03 12:56:36.958009',NULL),(175,'svaKR4PjWoB3CD4b4mTpI1BtDmeXDM',175,1,9,'2021-10-03 13:02:46.433495','2021-10-03 13:02:46.433495',NULL),(177,'j5crviR9Ajgw6UGr7taXAuqXpuhGzs',177,1,9,'2021-10-03 16:48:51.218126','2021-10-03 16:48:51.218126',NULL),(178,'wAZWtBDMz0vTDGbymXSNCes9rbMTzc',178,1,9,'2021-10-03 16:51:06.446959','2021-10-03 16:51:06.446959',NULL),(180,'CZ5r5I1PwDcOOjiYhZ5t9OiizL4Dab',180,1,9,'2021-10-03 17:51:10.416443','2021-10-03 17:51:10.416443',NULL),(182,'HpT3AuK4xcj76k0Sqk4OUrMnuGD6xx',182,1,9,'2021-10-04 09:26:16.815186','2021-10-04 09:26:16.815186',NULL),(183,'EIHxD6kiWiDDoNDeTZfEjFNPttT4ae',184,1,9,'2021-10-05 12:58:14.412510','2021-10-05 12:58:14.412510',NULL),(184,'kIDMeQkoeDWRYnAnubWkkK0kAZXmVQ',183,1,9,'2021-10-05 12:58:14.414510','2021-10-05 12:58:14.414510',NULL),(185,'zcqjCyFRbDSX1cIS6KqElGizXMHvv1',185,1,9,'2021-10-05 12:58:24.485634','2021-10-05 12:58:24.485634',NULL),(187,'zafAfOZyQTlZsVwy8PFBOMd73oweYR',187,1,9,'2021-10-05 17:06:39.636246','2021-10-05 17:06:39.636246',NULL),(189,'lxn881sKzkcMPHh6G4AyB58WZga9IH',189,1,9,'2021-10-05 18:08:55.078515','2021-10-05 18:08:55.079015',NULL),(192,'7DqUvwpt9ReVxtMJxSUATQprCGwE7d',192,1,9,'2021-10-05 18:11:06.204962','2021-10-05 18:11:06.204962',NULL),(195,'f2yu09JRanseUmHMTUgUqV7oBcP3fj',195,1,9,'2021-10-06 05:57:40.830468','2021-10-06 05:57:40.830468',NULL),(196,'eOfvaBf0uSn1oqRdv0Q6m1F5dAAru5',196,1,9,'2021-10-06 09:45:50.279917','2021-10-06 09:45:50.280418',NULL),(199,'i9albbnzpMk9ZdxpiQ2XkEiwQfoWK1',199,1,9,'2021-10-07 08:03:21.265914','2021-10-07 08:03:21.265914',NULL),(200,'opIhFTC1OnkrWjnu4SdwxQyxvU5h24',200,1,9,'2021-10-07 08:04:48.609161','2021-10-07 08:04:48.609161',NULL),(202,'tBU7YitfeKDKxu5n42R05KioK3jII6',202,1,9,'2021-10-07 08:13:08.018536','2021-10-07 08:13:08.018536',NULL),(208,'x8C702K0eGiQ6xLPo4jXacTUig3CgM',208,1,9,'2021-10-07 13:04:29.216144','2021-10-07 13:04:29.216144',NULL),(215,'YmuXE2uofxJIOymQKuzXqAiFrLGZ6B',215,1,9,'2021-10-07 14:28:54.462058','2021-10-07 14:28:54.462058',NULL),(216,'YtzYbmeCEUADilBhM5D4NVFs1ikuCV',216,1,9,'2021-10-07 14:29:40.204202','2021-10-07 14:29:40.204202',NULL),(218,'vMoR2v4URFj3uRSZP7O3NGDzzPgtym',218,1,9,'2021-10-07 15:12:28.300558','2021-10-07 15:12:28.300558',NULL),(219,'RESVhtLvQwzm7mRgJZiuUEyRWABAzO',219,1,9,'2021-10-07 15:12:28.377572','2021-10-07 15:12:28.377572',NULL),(220,'7QfLha6ht1c5njbOKlcZbC5X33efIK',220,1,9,'2021-10-07 15:12:44.023862','2021-10-07 15:12:44.023862',NULL),(221,'DwWYva9lziqcVMDM1KCAHel0bQDfZ8',221,1,9,'2021-10-07 15:24:33.912396','2021-10-07 15:24:33.912396',NULL),(225,'WqvxdUCpIE1engFf7kX5SUjNfNwFzK',225,1,9,'2021-10-07 20:06:22.598068','2021-10-07 20:06:22.598068',NULL),(227,'RfB1uc27XlSpJGUpNXr0zUex5xF6h4',227,1,9,'2021-10-07 20:10:57.507842','2021-10-07 20:10:57.507842',NULL),(237,'OYGsqloIM5cRBVK2YlqIVYlONTG3Vc',237,1,9,'2021-10-08 06:00:20.000658','2021-10-08 06:00:20.000658',NULL),(238,'Ci29MOq0mw496n2MlSpnVevbNIH58u',238,1,9,'2021-10-08 06:31:16.054265','2021-10-08 06:31:16.054265',NULL),(239,'NbCA1CCVowjrCDkv6aqteeyOrbh819',239,1,9,'2021-10-08 13:02:52.434197','2021-10-08 13:02:52.434197',NULL),(240,'PKoyiSn2PoYfwEVK45Gnp2lbz1T1Ls',240,1,9,'2021-10-08 14:31:09.907998','2021-10-08 14:31:09.908495',NULL),(241,'dnfoQJoCn1HwCS1UtTeVZwQAIfNHxx',241,1,9,'2021-10-08 14:31:52.194082','2021-10-08 14:31:52.194582',NULL),(242,'w61FM8oTgrtWIl6CFw8GdWEQcbze7q',242,1,31,'2021-10-08 15:54:36.393235','2021-10-08 15:54:36.393235',NULL),(243,'omC8CqLEQtI85et0OpU6BM9RdlN0sW',243,1,31,'2021-10-08 15:55:06.944015','2021-10-08 15:55:06.944515',NULL),(244,'sGQGI3w7GjBQUiHwrDHHLd0eDeQ31t',244,1,9,'2021-10-08 15:58:50.272123','2021-10-08 15:58:50.272123',NULL),(245,'Lchf3S1rYtuhc59HBd8qNQ9aHNzrpq',245,1,31,'2021-10-08 16:08:45.762822','2021-10-08 16:08:45.762822',NULL),(246,'5URHRpY75ylNlSP52EXmsrzCbg4dYu',246,1,32,'2021-10-08 16:34:00.308770','2021-10-08 16:34:00.309269',NULL),(247,'QXunWQ6bjkXBUItnWX0jJsESNiObde',247,1,31,'2021-10-08 16:37:03.534959','2021-10-08 16:37:03.534959',NULL),(248,'L4kS9QooeyZNPFaJSqiUaDNAZij7uH',248,1,31,'2021-10-08 16:50:48.245006','2021-10-08 16:50:48.245006',NULL),(249,'JZIVwfK48cNFP1gCByCfh5qECqL9tl',249,1,9,'2021-10-08 16:55:38.595808','2021-10-08 16:55:38.596307',NULL),(250,'KrfE0DPGVJQbH3dPlhBG0gYCLQqPID',250,1,33,'2021-10-08 17:05:38.375519','2021-10-08 17:05:38.376019',NULL),(251,'DdzdUz9jTzX7vQDygVnPMwjxvuEN0E',251,1,9,'2021-10-08 18:15:17.246932','2021-10-08 18:15:17.246932',NULL),(252,'KkQhUdGdZBQPM1sS6VgCbWw0ukb9QF',252,1,9,'2021-10-08 18:17:16.265017','2021-10-08 18:17:16.265017',NULL),(253,'dxH4TPq35vhe8Jov2PKc9XB2LIJufP',253,1,9,'2021-10-08 18:17:28.328721','2021-10-08 18:17:28.328721',NULL),(254,'I87EPqbnaaqpgNj9yOEfXHiYMoGEuz',254,1,9,'2021-10-08 18:18:20.336370','2021-10-08 18:18:20.336370',NULL),(255,'dOIjANtmClTdgQtb2yrSfeA9d0df5t',255,1,9,'2021-10-08 18:18:50.114977','2021-10-08 18:18:50.114977',NULL),(256,'KAhcAyjJ5kXcUeeK3NQUnjX9vmQfj8',256,1,9,'2021-10-08 18:48:13.960000','2021-10-08 18:48:13.960000',NULL),(257,'teMr0AnPWYwYJcwz36AqjkubP5jW1d',257,1,9,'2021-10-08 18:49:54.688355','2021-10-08 18:49:54.688355',NULL),(258,'hCtckPGR3M3vpyDnJKJjnligZhhhlu',258,1,9,'2021-10-08 18:53:13.959826','2021-10-08 18:53:13.959826',NULL),(259,'ZroCDkctqWdoNy7X4Gk1dZis8jZlSQ',259,1,9,'2021-10-08 18:56:46.169402','2021-10-08 18:56:46.169402',NULL),(260,'QMDuHbYA8Xkljz1NhlOwD1u9Z8ldb9',260,1,9,'2021-10-08 18:57:45.527272','2021-10-08 18:57:45.527272',NULL),(261,'da9TIIOikVTSw6mbbkxlZjEZ5rtYkO',261,1,9,'2021-10-09 06:37:31.150462','2021-10-09 06:37:31.150462',NULL),(262,'SnYdEtbgy8H3hsqFS03hWISmL3Dzvy',262,1,9,'2021-10-09 06:58:34.622573','2021-10-09 06:58:34.622573',NULL),(263,'2xUYGdlwzQ9twwFTXOUKO7McZoupos',263,1,9,'2021-10-09 07:01:20.064010','2021-10-09 07:01:20.064010',NULL),(264,'HrtuvNLXX7ifFY357fbT7nuzUPPvFt',264,1,9,'2021-10-09 07:02:20.109268','2021-10-09 07:02:20.109768',NULL),(265,'lcJmhs3qpZpwKMXmboMLshokGFu8g1',265,1,9,'2021-10-09 08:03:56.689649','2021-10-09 08:03:56.689649',NULL),(266,'Tnf3i7g9wp6102NqecLWWnn43zroI3',266,1,31,'2021-10-09 08:11:22.910209','2021-10-09 08:11:22.910209',NULL),(267,'er08leANa64fzveHF5K3Xm2B4FmRgA',267,1,31,'2021-10-09 08:12:29.809103','2021-10-09 08:12:29.809103',NULL),(268,'X9FqJc8nR99Q7zvjZ8QgzM4fA5HGwH',268,1,9,'2021-10-09 08:30:28.768663','2021-10-09 08:30:28.768663',NULL),(269,'T1ndHPNTMVHBiWknmIMYpkPqo2VSnM',269,1,9,'2021-10-09 15:01:59.871295','2021-10-09 15:01:59.871295',NULL),(270,'rDlxywUtaB3HgZVLfZxdio9bcpng7A',270,1,9,'2021-10-10 04:23:44.675488','2021-10-10 04:23:44.675488',NULL),(271,'NE6ctARvBm1tzQ299wy8PLLqZO0k89',271,1,9,'2021-10-10 04:24:15.386062','2021-10-10 04:24:15.386062',NULL),(272,'WLwH6oH1wclxDxsWMoOAj1yfqAj1tY',272,1,32,'2021-10-10 13:50:36.324342','2021-10-10 13:50:36.324342',NULL),(273,'E3krAhYCYRinAV9UGRSeMtHZI5K1xS',273,1,32,'2021-10-11 09:58:50.376773','2021-10-11 09:58:50.376773',NULL),(274,'cTv8AcI8WCbpijICFAcYHaMS9fxp0z',274,1,32,'2021-10-11 09:59:49.496278','2021-10-11 09:59:49.496278',NULL),(275,'eIhEYEU9Ee5C6GNgoE5OFNZ35gJKJI',275,1,9,'2021-10-11 10:00:57.169073','2021-10-11 10:00:57.169073',NULL),(276,'ioLMQzeDj3bNfjudQojnrjjFXsRT1G',276,1,9,'2021-10-11 10:30:38.286672','2021-10-11 10:30:38.286672',NULL),(277,'CcXLLVKamroj42Lq5PDlT0p1uLayeD',277,1,9,'2021-10-11 10:33:48.493660','2021-10-11 10:33:48.493660',NULL),(278,'cPWg4iA8KZ9vMCOcjXEUrb8e9tO1gN',278,1,32,'2021-10-11 10:35:21.464744','2021-10-11 10:35:21.464744',NULL),(279,'oFH8BecXNTPkLnGikEOD62CJmg33Ku',279,1,9,'2021-10-11 12:28:18.007160','2021-10-11 12:28:18.007160',NULL),(280,'N0GYYupyGYKeo9p3DMJACEFbwNaODG',280,1,32,'2021-10-11 12:48:56.231857','2021-10-11 12:48:56.231857',NULL),(281,'0MSND9WdxDxHWSe0SlKOZ1HNjZ0qDV',281,1,9,'2021-10-11 13:52:18.445365','2021-10-11 13:52:18.445365',NULL),(282,'gL9MEia6M950oHOC6hbjPOKfl1yWlJ',282,1,9,'2021-10-11 13:56:24.097511','2021-10-11 13:56:24.097511',NULL),(283,'Kr1O9LAwG1jQZ3aYfVEAMnstqzTe1C',283,1,9,'2021-10-11 13:57:32.611300','2021-10-11 13:57:32.611300',NULL),(284,'XMP72yT4ZDmCgBhVjHrvRORAuPDUIt',284,1,9,'2021-10-11 13:57:42.957052','2021-10-11 13:57:42.957052',NULL),(285,'pK9P3DxfoZMTmIil7V1YmdOamepuNJ',285,1,9,'2021-10-11 14:05:53.615694','2021-10-11 14:05:53.615694',NULL),(286,'MwjDzFOi0fdCM4iG9MF8aAZv07Deub',286,1,9,'2021-10-11 17:59:31.513077','2021-10-11 17:59:31.513577',NULL),(287,'GynQoo2eMVLEpVUERvpPTrLRq3xfml',287,1,9,'2021-10-11 17:59:53.223739','2021-10-11 17:59:53.223739',NULL),(288,'IgS65rlGtpYUlnPxjN9t6hUTDKlZTj',288,1,32,'2021-10-11 18:47:20.960340','2021-10-11 18:47:20.960841',NULL),(289,'srU5A4vSblTL1N9aaP6G3uvr2Je84C',289,1,31,'2021-10-11 19:01:29.560626','2021-10-11 19:01:29.560626',NULL),(290,'EEA0AbrUzxx7fbtaOLQ5bN64JUMKeH',290,1,34,'2021-10-13 20:40:58.451480','2021-10-13 20:40:58.451480',NULL),(291,'bi4wL92NtaWqvQzOovgE32YcszTWXs',291,1,31,'2021-10-13 20:58:03.788996','2021-10-13 20:58:03.788996',NULL),(292,'ZeTC5S3n9CF9rIGBuUkvq0AAuqX6xU',292,1,9,'2021-10-13 21:09:09.503250','2021-10-13 21:09:09.503250',NULL),(293,'z3OxXOVVUl605fLJ5KNv0UE1xcj2zM',293,1,35,'2021-10-13 21:11:06.853044','2021-10-13 21:11:06.853044',NULL),(294,'cfppmA6f4XAIfLDjHok9jwWjKYBHeq',294,1,9,'2021-10-13 21:13:21.778548','2021-10-13 21:13:21.778548',NULL),(295,'Xi4tuoRF0XiEgwiKjxOJILHKm5Yxej',295,1,35,'2021-10-13 21:17:27.597519','2021-10-13 21:17:27.598019',NULL),(296,'2u3cBtGaaI33gKHBj4hV977q93xKLb',296,1,35,'2021-10-13 21:17:42.532402','2021-10-13 21:17:42.532402',NULL),(297,'lbRmj03sdzOMcRzGAyULjpRxrK963t',297,1,35,'2021-10-13 21:18:03.395941','2021-10-13 21:18:03.395941',NULL),(298,'cZbfbpgC4NINPQxZ4BhRSgx9n9rq0U',298,1,35,'2021-10-13 21:18:25.822236','2021-10-13 21:18:25.822236',NULL),(303,'rBLlsJcQ3ZG8yHHtBAvQlvK2M0f6r6',303,1,40,'2021-10-14 08:59:31.539236','2021-10-14 08:59:31.539236',NULL),(304,'UMqU10Hrnmgh2DHhVCAMjggdLxTPbX',304,1,35,'2021-10-14 09:13:42.941064','2021-10-14 09:13:42.941064',NULL),(305,'FtafzF9ws6zSpb8SCByxvmzJvPcpqb',305,1,40,'2021-10-14 09:37:20.820336','2021-10-14 09:37:20.820336',NULL),(306,'LToGzGamtDHL8JYvPZAjyETSEBIkvc',306,1,40,'2021-10-14 09:38:39.653013','2021-10-14 09:38:39.653013',NULL),(307,'YLCHyRY6aNp5JDnPVglEfsYcxSkqde',307,1,35,'2021-10-14 09:41:25.412587','2021-10-14 09:41:25.412587',NULL),(308,'Xq89hehQdqmFeJKuTFjoxpzV2dhK8N',308,1,40,'2021-10-14 09:41:57.724659','2021-10-14 09:41:57.724659',NULL),(309,'Z5scogXQwUMcaoHFbhxTtUO7Nug2H9',309,1,35,'2021-10-14 09:44:22.279235','2021-10-14 09:44:22.279235',NULL),(310,'z8nwZoOAUtjHxiBZtHe4AhRiDZUmj5',310,1,35,'2021-10-14 09:47:55.447817','2021-10-14 09:47:55.447817',NULL),(311,'0mrV5o9qQgt6OHoeQFY9E0Zo89uMMR',311,1,9,'2021-10-14 09:49:45.434039','2021-10-14 09:49:45.434039',NULL),(312,'lp8z4yhPELWCiUu2RJQIW1qWisgIGb',312,1,35,'2021-10-14 10:12:25.785150','2021-10-14 10:12:25.785150',NULL),(313,'XEruBQMP2Oc3yxcxSbJ1Mqk86P5evi',313,1,9,'2021-10-14 10:15:04.825075','2021-10-14 10:15:04.825075',NULL),(314,'nOvRGWZlBSvyoKbUkzIwzuJ6D9B23s',314,1,9,'2021-10-15 14:06:09.077129','2021-10-15 14:06:09.077129',NULL),(315,'ShnATmF28ffDqay1BahIwnKSqUb5L3',315,1,9,'2021-10-15 14:17:23.502278','2021-10-15 14:17:23.502278',NULL),(316,'5xmfMh72JOuoz2hBsh8SoWdBbz6Dzx',316,1,9,'2021-10-15 14:17:46.695509','2021-10-15 14:17:46.695509',NULL),(317,'ZYtxChzvCSmdJrtWFgv7dCJ9KIeVQv',317,1,9,'2021-10-15 14:18:09.579624','2021-10-15 14:18:09.579624',NULL),(318,'XBufaFXv9tkyNwHC7wNLRDVcGLC5d9',318,1,9,'2021-10-15 14:31:10.752262','2021-10-15 14:31:10.752262',NULL);
/*!40000 ALTER TABLE `oauth2_provider_refreshtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_association`
--

DROP TABLE IF EXISTS `social_auth_association`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_auth_association` (
  `id` int NOT NULL AUTO_INCREMENT,
  `server_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `issued` int NOT NULL,
  `lifetime` int NOT NULL,
  `assoc_type` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_association_server_url_handle_078befa2_uniq` (`server_url`,`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_association`
--

LOCK TABLES `social_auth_association` WRITE;
/*!40000 ALTER TABLE `social_auth_association` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_association` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_code`
--

DROP TABLE IF EXISTS `social_auth_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_auth_code` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_code_email_code_801b2d02_uniq` (`email`,`code`),
  KEY `social_auth_code_code_a2393167` (`code`),
  KEY `social_auth_code_timestamp_176b341f` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_code`
--

LOCK TABLES `social_auth_code` WRITE;
/*!40000 ALTER TABLE `social_auth_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_nonce`
--

DROP TABLE IF EXISTS `social_auth_nonce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_auth_nonce` (
  `id` int NOT NULL AUTO_INCREMENT,
  `server_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `timestamp` int NOT NULL,
  `salt` varchar(65) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_nonce_server_url_timestamp_salt_f6284463_uniq` (`server_url`,`timestamp`,`salt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_nonce`
--

LOCK TABLES `social_auth_nonce` WRITE;
/*!40000 ALTER TABLE `social_auth_nonce` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_nonce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_partial`
--

DROP TABLE IF EXISTS `social_auth_partial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_auth_partial` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `next_step` smallint unsigned NOT NULL,
  `backend` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `social_auth_partial_token_3017fea3` (`token`),
  KEY `social_auth_partial_timestamp_50f2119f` (`timestamp`),
  CONSTRAINT `social_auth_partial_chk_1` CHECK ((`next_step` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_partial`
--

LOCK TABLES `social_auth_partial` WRITE;
/*!40000 ALTER TABLE `social_auth_partial` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_partial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_usersocialauth`
--

DROP TABLE IF EXISTS `social_auth_usersocialauth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_auth_usersocialauth` (
  `id` int NOT NULL AUTO_INCREMENT,
  `provider` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `extra_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_usersocialauth_provider_uid_e6b5e668_uniq` (`provider`,`uid`),
  KEY `social_auth_usersocialauth_user_id_17d28448_fk_courses_user_id` (`user_id`),
  KEY `social_auth_usersocialauth_uid_796e51dc` (`uid`),
  CONSTRAINT `social_auth_usersocialauth_user_id_17d28448_fk_courses_user_id` FOREIGN KEY (`user_id`) REFERENCES `courses_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_usersocialauth`
--

LOCK TABLES `social_auth_usersocialauth` WRITE;
/*!40000 ALTER TABLE `social_auth_usersocialauth` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_usersocialauth` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-15 21:36:24
