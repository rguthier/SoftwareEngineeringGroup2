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
-- Table structure for table `shuttlestops`
--

DROP TABLE IF EXISTS `shuttlestops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shuttlestops` (
  `stopID` int NOT NULL AUTO_INCREMENT,
  `stopName` varchar(255) DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  PRIMARY KEY (`stopID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shuttlestops`
--

LOCK TABLES `shuttlestops` WRITE;
/*!40000 ALTER TABLE `shuttlestops` DISABLE KEYS */;
INSERT INTO `shuttlestops` VALUES (1,'Cross Campus Drive @ Union Garage',39.3917,-76.6097),(2,'Lot 5',39.387,-76.6149),(3,'Lot 6',39.3889,-76.6178),(4,'Towsoncenter Lot 8',39.387,-76.6149),(5,'Child Care Center',39.3871,-76.6149),(6,'Commons Building',39.3937,-76.6178),(7,'Marshall Hall',39.3948,-76.62),(8,'Burdick Hall',39.396,-76.6118),(9,'Liberal Arts Building',39.3954,-76.6093),(10,'Scarborough Hall',39.3945,-76.605),(11,'Stephens Hall',39.3929,-76.6057),(12,'Cross Campus Drive @ Glen Garage',39.3904,-76.6068),(13,'Union Garage Loop',39.3904,-76.6134),(14,'Lot 14',39.3955,-76.6068),(15,'Ward and West/Linthicum',39.3956,-76.6079),(16,'Towsontown Garage',39.3956,-76.6085),(17,'West Village Garage',39.3948,-76.6202),(18,'Millennium Hall',39.3935,-76.6168),(19,'Center for the Arts',39.3924,-76.6116),(20,'Administration Building',39.39,-76.6061);
/*!40000 ALTER TABLE `shuttlestops` ENABLE KEYS */;
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
