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
-- Table structure for table `shuttleroutes`
--

DROP TABLE IF EXISTS `shuttleroutes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shuttleroutes` (
  `routeID` int NOT NULL AUTO_INCREMENT,
  `routeName` varchar(255) DEFAULT NULL,
  `daysRunning` varchar(255) DEFAULT NULL,
  `timeRange` varchar(255) DEFAULT NULL,
  `frequency` int DEFAULT NULL,
  PRIMARY KEY (`routeID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shuttleroutes`
--

LOCK TABLES `shuttleroutes` WRITE;
/*!40000 ALTER TABLE `shuttleroutes` DISABLE KEYS */;
INSERT INTO `shuttleroutes` VALUES (1,'Gold Route','Monday-Friday','3PM - 2AM',30),(2,'Gold Route Weekend','Saturday-Sunday','5PM - 2AM',30),(3,'Stadium - Core Campus','Monday-Friday','7:05AM - 2:35PM',30),(4,'West Village - Core Campus','Monday-Friday','7AM - 4:30PM',30),(5,'Goucher - Loch Raven','Monday-Friday','6:50AM - 10:10PM',40),(6,'Kenilworth - Armory','Monday-Friday','7:20AM - 10PM',40),(7,'Lake - Walker','Monday-Friday','7:10AM - 10:10PM',30);
/*!40000 ALTER TABLE `shuttleroutes` ENABLE KEYS */;
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
