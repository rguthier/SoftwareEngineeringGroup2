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
-- Table structure for table `arrivals`
--

DROP TABLE IF EXISTS `arrivals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `arrivals` (
  `arrivalID` int NOT NULL AUTO_INCREMENT,
  `pathID` int DEFAULT NULL,
  `firstArrival` time DEFAULT NULL,
  `lastArrival` time DEFAULT NULL,
  PRIMARY KEY (`arrivalID`),
  KEY `pathID` (`pathID`),
  CONSTRAINT `arrivals_ibfk_1` FOREIGN KEY (`pathID`) REFERENCES `paths` (`pathID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arrivals`
--

LOCK TABLES `arrivals` WRITE;
/*!40000 ALTER TABLE `arrivals` DISABLE KEYS */;
INSERT INTO `arrivals` VALUES (1,1,'15:05:00','01:35:00'),(2,2,'15:06:00','01:36:00'),(3,3,'15:09:00','01:39:00'),(4,4,'15:10:00','01:40:00'),(5,5,'15:11:00','01:41:00'),(6,6,'15:15:00','01:45:00'),(7,7,'15:17:00','01:47:00'),(8,8,'15:20:00','01:20:00'),(9,9,'15:23:00','01:53:00'),(10,10,'15:26:00','01:56:00'),(11,11,'15:27:00','01:57:00'),(12,12,'15:28:00','01:58:00'),(13,13,'17:05:00','01:35:00'),(14,14,'15:08:00','01:38:00'),(15,15,'15:09:00','01:39:00'),(16,16,'15:10:00','01:40:00'),(17,17,'15:11:00','01:41:00'),(18,18,'15:15:00','01:45:00'),(19,19,'15:17:00','01:47:00'),(20,20,'15:20:00','01:50:00'),(21,21,'15:23:00','01:53:00'),(22,22,'15:24:00','01:54:00'),(23,23,'15:26:00','01:56:00'),(24,24,'15:27:00','01:57:00');
/*!40000 ALTER TABLE `arrivals` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-01 18:01:24
