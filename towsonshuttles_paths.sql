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

DROP TABLE IF EXISTS `paths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paths` (
  `pathID` int NOT NULL AUTO_INCREMENT,
  `stopID` int DEFAULT NULL,
  `routeID` int DEFAULT NULL,
  `stopOrder` int DEFAULT NULL,
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
INSERT INTO `paths` VALUES (1,1,1,1),(2,2,1,2),(3,3,1,3),(4,4,1,4),(5,5,1,5),(6,6,1,6),(7,7,1,7),(8,8,1,8),(9,9,1,9),(10,10,1,10),(11,11,1,11),(12,12,1,12),(13,1,2,1),(14,2,2,2),(15,3,2,3),(16,4,2,4),(17,5,2,5),(18,6,2,6),(19,7,2,7),(20,8,2,8),(21,9,2,9),(22,10,2,10),(23,11,2,11),(24,12,2,12),(25,1,3,1),(26,2,3,2),(27,3,3,3),(28,4,3,4),(29,5,3,5),(30,13,3,6),(31,8,3,7),(32,9,3,8),(33,14,3,9),(34,10,3,10),(35,11,3,11),(36,12,3,12),(37,6,4,1),(38,7,4,2),(39,8,4,3),(40,15,4,4),(41,16,4,5),(42,17,4,6),(43,18,4,7),(44,19,4,8),(45,20,4,9),(46,10,4,10),(47,11,4,11),(48,12,4,12),(49,1,4,13);
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

-- Dump completed on 2024-05-01 18:01:25
