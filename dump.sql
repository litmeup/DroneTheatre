-- MySQL dump 10.13  Distrib 8.0.40, for Linux (x86_64)
--
-- Host: yfedyakina.mysql.pythonanywhere-services.com    Database: yfedyakina$DroneShow
-- ------------------------------------------------------
-- Server version	8.0.42

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `id` int NOT NULL AUTO_INCREMENT,
  `organization` varchar(255) DEFAULT NULL,
  `contact_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `event_date` datetime DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'EventLab','Карина Коваль','karina@eventlab.ru','+7-900-700-70-70',NULL,NULL,NULL),(2,'SkyPromo Agency','Павел Мирный','pavel@skypromo.ru','+7-900-800-80-80',NULL,NULL,NULL),(3,'TechSchool №42','Елена Васильева','vasilieva@school42.ru','+7-900-900-90-90',NULL,NULL,NULL);
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drones`
--

DROP TABLE IF EXISTS `drones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `firmware_version` varchar(255) DEFAULT NULL,
  `last_service_date` date DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drones`
--

LOCK TABLES `drones` WRITE;
/*!40000 ALTER TABLE `drones` DISABLE KEYS */;
INSERT INTO `drones` VALUES (1,'Альтаир','DJI Inspire 3','v1.2.0','2025-08-01','/static/actors/altair.png'),(2,'Люциус','Parrot Anafi','v3.4.1','2025-07-12',NULL),(3,'Селена','Custom LightDrone X','v2.1.5','2025-06-25',NULL);
/*!40000 ALTER TABLE `drones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `department` enum('creative','technical','admin') DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'Мария Лебедева','Режиссёр','creative','m.lebedeva@droneart.ru','+7-900-100-10-10','/static/actors/m_lebedeva.png'),(2,'Игорь Соловьёв','Оператор дронов','technical','i.solovyev@droneart.ru','+7-900-200-20-20',NULL),(3,'Анна Мельникова','Актриса','creative','a.melnikova@droneart.ru','+7-900-300-30-30',NULL),(4,'Дмитрий Котов','Инженер по свету','technical','d.kotov@droneart.ru','+7-900-400-40-40',NULL),(5,'Софья Грин','Менеджер по заказам','admin','s.green@droneart.ru','+7-900-500-50-50',NULL),(6,'Алексей Романов','Технический директор','technical','a.romanov@droneart.ru','+7-900-600-60-60','/static/actors/a_romanov.png');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `halls`
--

DROP TABLE IF EXISTS `halls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `halls` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `new_field` int NOT NULL,
  `capacity` int NOT NULL,
  `rows` int NOT NULL,
  `seats_per_row` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `halls`
--

LOCK TABLES `halls` WRITE;
/*!40000 ALTER TABLE `halls` DISABLE KEYS */;
INSERT INTO `halls` VALUES (1,'Большой зал',1,300,15,20),(2,'Малый зал',1,120,10,12),(3,'Экспериментальная сцена',1,60,6,10);
/*!40000 ALTER TABLE `halls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `client_id` int DEFAULT NULL,
  `show_id` int DEFAULT NULL,
  `event_date` datetime NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `status` enum('pending','confirmed','completed') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client_id` (`client_id`),
  KEY `show_id` (`show_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`show_id`) REFERENCES `shows` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,2,'2025-11-15 20:00:00',120000.00,'confirmed'),(2,2,1,'2025-12-01 19:30:00',180000.00,'pending'),(3,3,3,'2025-09-10 12:00:00',50000.00,'completed');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `performances`
--

DROP TABLE IF EXISTS `performances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `performances` (
  `id` int NOT NULL AUTO_INCREMENT,
  `show_id` int NOT NULL,
  `hall_id` int NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `status` varchar(10) NOT NULL,
  `tickets_total` int NOT NULL,
  `tickets_sold` int NOT NULL,
  `show_type` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `performances`
--

LOCK TABLES `performances` WRITE;
/*!40000 ALTER TABLE `performances` DISABLE KEYS */;
INSERT INTO `performances` VALUES (1,1,1,'2025-01-10 19:00:00','2025-01-10 20:30:00','scheduled',300,120,1),(2,2,1,'2025-01-12 19:00:00','2025-01-12 21:00:00','scheduled',300,260,1),(3,3,2,'2025-01-15 18:00:00','2025-01-15 19:30:00','scheduled',120,75,2),(4,1,3,'2025-01-20 20:00:00','2025-01-20 21:30:00','scheduled',60,40,3);
/*!40000 ALTER TABLE `performances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scripts`
--

DROP TABLE IF EXISTS `scripts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scripts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `show_id` int DEFAULT NULL,
  `author` int DEFAULT NULL,
  `content` text,
  `last_update` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `show_id` (`show_id`),
  KEY `author` (`author`),
  CONSTRAINT `scripts_ibfk_1` FOREIGN KEY (`show_id`) REFERENCES `shows` (`id`),
  CONSTRAINT `scripts_ibfk_2` FOREIGN KEY (`author`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scripts`
--

LOCK TABLES `scripts` WRITE;
/*!40000 ALTER TABLE `scripts` DISABLE KEYS */;
INSERT INTO `scripts` VALUES (1,1,1,'Дроны создают световой купол, актриса взаимодействует с ним как с живым существом.','2025-11-13 12:00:53'),(2,2,3,'История о неоновых огнях и любви человека и машины.','2025-11-13 12:00:53'),(3,3,2,'Индустриальный перформанс с хореографией роботов.','2025-11-13 12:00:53');
/*!40000 ALTER TABLE `scripts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seats`
--

DROP TABLE IF EXISTS `seats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seats` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hall_id` int NOT NULL,
  `row_number` int NOT NULL,
  `seat_number` int NOT NULL,
  `is_vip` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=405 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seats`
--

LOCK TABLES `seats` WRITE;
/*!40000 ALTER TABLE `seats` DISABLE KEYS */;
INSERT INTO `seats` VALUES (1,1,1,1,1),(2,1,1,2,1),(3,1,1,3,1),(4,1,1,4,1),(5,1,1,5,1),(301,2,1,1,1),(302,2,1,2,1),(303,2,2,1,0),(304,2,2,2,0),(401,3,1,1,0),(402,3,1,2,0),(403,3,2,1,0),(404,3,2,2,0);
/*!40000 ALTER TABLE `seats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shows`
--

DROP TABLE IF EXISTS `shows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shows` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `premiere_date` date DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `duration_minutes` int DEFAULT NULL,
  `image` blob,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `drone` int DEFAULT NULL,
  `employee` int DEFAULT NULL,
  `script` int NOT NULL,
  `director` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `drone` (`drone`),
  KEY `employee` (`employee`),
  CONSTRAINT `shows_ibfk_1` FOREIGN KEY (`drone`) REFERENCES `drones` (`id`),
  CONSTRAINT `shows_ibfk_2` FOREIGN KEY (`employee`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shows`
--

LOCK TABLES `shows` WRITE;
/*!40000 ALTER TABLE `shows` DISABLE KEYS */;
INSERT INTO `shows` VALUES (1,'Сон о небе','2025-09-01','active',45,NULL,'2025-11-13 12:00:53',1,1,0,0),(2,'Неоновый дождь','2025-07-20','active',35,NULL,'2025-11-13 12:00:53',2,3,0,0),(3,'Танец машин','2025-05-15','archived',40,NULL,'2025-11-13 12:00:53',3,2,0,0);
/*!40000 ALTER TABLE `shows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `performance_id` int NOT NULL,
  `seat_id` int NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `sold_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `buyer_email` varchar(100) NOT NULL,
  `status` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1053 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
INSERT INTO `tickets` VALUES (1,1,1,1500,'2024-12-20 10:15:00','anna@example.com','sold'),(2,1,2,1500,'2024-12-22 14:40:00','mark@example.com','sold'),(3,1,3,1500,'2025-11-20 11:34:16','test@example.com','sold'),(4,1,4,1500,'0000-00-00 00:00:00','','available'),(5,1,5,1500,'2024-12-28 09:00:00','kate@example.com','sold'),(20,3,301,900,'2024-12-25 15:00:00','sergey@example.com','sold'),(21,3,302,900,'2025-11-20 11:35:00','test@example.com','sold'),(22,3,303,700,'0000-00-00 00:00:00','','available'),(40,4,401,600,'2024-12-23 21:00:00','olga@example.com','sold'),(41,4,402,600,'0000-00-00 00:00:00','','available'),(1001,1,1,1500,'0000-00-00 00:00:00','','available'),(1002,1,2,1500,'0000-00-00 00:00:00','','available'),(1003,1,3,1500,'0000-00-00 00:00:00','','available'),(1004,1,4,1500,'0000-00-00 00:00:00','','available'),(1005,1,5,1500,'0000-00-00 00:00:00','','available'),(1006,1,301,900,'0000-00-00 00:00:00','','available'),(1007,1,302,900,'0000-00-00 00:00:00','','available'),(1008,1,303,900,'0000-00-00 00:00:00','','available'),(1009,1,304,900,'0000-00-00 00:00:00','','available'),(1010,1,401,600,'0000-00-00 00:00:00','','available'),(1011,1,402,600,'0000-00-00 00:00:00','','available'),(1012,1,403,600,'0000-00-00 00:00:00','','available'),(1013,1,404,600,'0000-00-00 00:00:00','','available'),(1014,2,1,1500,'0000-00-00 00:00:00','','available'),(1015,2,2,1500,'0000-00-00 00:00:00','','available'),(1016,2,3,1500,'0000-00-00 00:00:00','','available'),(1017,2,4,1500,'0000-00-00 00:00:00','','available'),(1018,2,5,1500,'0000-00-00 00:00:00','','available'),(1019,2,301,900,'0000-00-00 00:00:00','','available'),(1020,2,302,900,'0000-00-00 00:00:00','','available'),(1021,2,303,900,'0000-00-00 00:00:00','','available'),(1022,2,304,900,'0000-00-00 00:00:00','','available'),(1023,2,401,600,'0000-00-00 00:00:00','','available'),(1024,2,402,600,'0000-00-00 00:00:00','','available'),(1025,2,403,600,'0000-00-00 00:00:00','','available'),(1026,2,404,600,'0000-00-00 00:00:00','','available'),(1027,3,1,1500,'0000-00-00 00:00:00','','available'),(1028,3,2,1500,'0000-00-00 00:00:00','','available'),(1029,3,3,1500,'0000-00-00 00:00:00','','available'),(1030,3,4,1500,'0000-00-00 00:00:00','','available'),(1031,3,5,1500,'0000-00-00 00:00:00','','available'),(1032,3,301,900,'0000-00-00 00:00:00','','available'),(1033,3,302,900,'0000-00-00 00:00:00','','available'),(1034,3,303,900,'0000-00-00 00:00:00','','available'),(1035,3,304,900,'0000-00-00 00:00:00','','available'),(1036,3,401,600,'0000-00-00 00:00:00','','available'),(1037,3,402,600,'0000-00-00 00:00:00','','available'),(1038,3,403,600,'0000-00-00 00:00:00','','available'),(1039,3,404,600,'0000-00-00 00:00:00','','available'),(1040,4,1,1500,'0000-00-00 00:00:00','','available'),(1041,4,2,1500,'0000-00-00 00:00:00','','available'),(1042,4,3,1500,'0000-00-00 00:00:00','','available'),(1043,4,4,1500,'0000-00-00 00:00:00','','available'),(1044,4,5,1500,'0000-00-00 00:00:00','','available'),(1045,4,301,900,'0000-00-00 00:00:00','','available'),(1046,4,302,900,'0000-00-00 00:00:00','','available'),(1047,4,303,900,'0000-00-00 00:00:00','','available'),(1048,4,304,900,'0000-00-00 00:00:00','','available'),(1049,4,401,600,'0000-00-00 00:00:00','','available'),(1050,4,402,600,'0000-00-00 00:00:00','','available'),(1051,4,403,600,'0000-00-00 00:00:00','','available'),(1052,4,404,600,'0000-00-00 00:00:00','','available');
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-06  7:57:41
