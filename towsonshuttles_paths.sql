-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: towsonshuttles
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `paths`
--

CREATE DATABASE IF NOT EXISTS towsonshuttles;
USE towsonshuttles;

DROP TABLE IF EXISTS `paths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paths` (
  `pathID` int NOT NULL AUTO_INCREMENT,
  `stopID` int DEFAULT NULL,
  `routeID` int DEFAULT NULL,
  `stopOrder` int DEFAULT NULL,
  `firstTime` time DEFAULT NULL,
  `lastTime` time DEFAULT NULL,
  PRIMARY KEY (`pathID`),
  KEY `stopID` (`stopID`),
  KEY `routeID` (`routeID`),
  CONSTRAINT `paths_ibfk_1` FOREIGN KEY (`stopID`) REFERENCES `shuttlestops` (`stopID`),
  CONSTRAINT `paths_ibfk_2` FOREIGN KEY (`routeID`) REFERENCES `shuttleroutes` (`routeID`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paths`
--

LOCK TABLES `paths` WRITE;
/*!40000 ALTER TABLE `paths` DISABLE KEYS */;
INSERT INTO `paths` VALUES (1,1,1,1,'15:05:00','01:35:00'),(2,3,1,2,'15:06:00','01:36:00'),(3,4,1,3,'15:09:00','01:39:00'),(4,5,1,4,'15:10:00','01:40:00'),(5,26,1,5,'15:11:00','01:41:00'),(6,57,1,6,'15:15:00','01:45:00'),(7,7,1,7,'15:17:00','01:47:00'),(8,37,1,8,'15:20:00','01:50:00'),(9,58,1,9,'15:23:00','01:53:00'),(10,12,1,10,'15:26:00','01:56:00'),(11,13,1,11,'15:27:00','01:57:00'),(12,14,1,12,'15:28:00','01:58:00'),(13,1,2,1,'15:05:00','01:35:00'),(14,3,2,2,'15:08:00','01:38:00'),(15,4,2,3,'15:09:00','01:39:00'),(16,5,2,4,'15:10:00','01:40:00'),(17,26,2,5,'15:11:00','01:41:00'),(18,57,2,6,'15:15:00','01:45:00'),(19,7,2,7,'15:17:00','01:47:00'),(20,37,2,8,'15:20:00','01:50:00'),(21,58,2,9,'15:23:00','01:53:00'),(22,12,2,10,'15:24:00','01:54:00'),(23,13,2,11,'15:26:00','01:56:00'),(24,14,2,12,'15:27:00','01:57:00'),(25,1,3,1,'07:05:00','14:35:00'),(26,3,3,2,'07:08:00','14:38:00'),(27,4,3,3,'07:09:00','14:39:00'),(28,5,3,4,'07:10:00','14:40:00'),(29,26,3,5,'07:11:00','14:41:00'),(30,27,3,6,'07:14:00','14:44:00'),(31,37,3,7,'07:17:00','14:47:00'),(32,58,3,8,'07:19:00','14:49:00'),(33,11,3,9,'07:21:00','14:51:00'),(34,12,3,10,'07:22:00','14:52:00'),(35,13,3,11,'07:23:00','14:53:00'),(36,14,3,12,'07:25:00','14:55:00'),(37,57,4,1,'07:00:00','16:30:00'),(38,7,4,2,'07:02:00','16:32:00'),(39,37,4,3,'07:04:00','16:34:00'),(40,36,4,4,'07:06:00','16:36:00'),(41,19,4,5,'07:08:00','16:38:00'),(42,92,4,6,'07:11:00','16:41:00'),(43,75,4,7,'07:12:00','16:42:00'),(44,16,4,8,'07:15:00','16:45:00'),(45,17,4,9,'07:16:00','16:46:00'),(46,12,4,10,'07:18:00','16:48:00'),(47,13,4,11,'07:19:00','16:49:00'),(48,14,4,12,'07:21:00','16:51:00'),(49,1,4,13,'07:22:00','16:52:00');
/*!40000 ALTER TABLE `paths` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-04 18:40:08
