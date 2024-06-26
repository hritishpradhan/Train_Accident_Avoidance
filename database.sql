-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: project
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `downline`
--

DROP TABLE IF EXISTS `downline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `downline` (
  `Train_no` int DEFAULT NULL,
  `Train_name` varchar(20) DEFAULT NULL,
  `Arrival` time DEFAULT NULL,
  `Departure` time DEFAULT NULL,
  `Meet` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `downline`
--

LOCK TABLES `downline` WRITE;
/*!40000 ALTER TABLE `downline` DISABLE KEYS */;
INSERT INTO `downline` VALUES (12802,'Purusottam SF Exp','00:09:00','05:09:00','03:30:00'),(18022,'CHENNAI MAIL','02:57:00','06:30:00','03:50:00'),(12837,'HWH PURI SF EXP','01:40:00','05:20:00','03:50:00'),(22851,'MAQ VIVEK SF EXP','18:05:00','21:45:00','19:06:00');
/*!40000 ALTER TABLE `downline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_status`
--

DROP TABLE IF EXISTS `track_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `track_status` (
  `track_id` int NOT NULL AUTO_INCREMENT,
  `status` varchar(255) NOT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`track_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_status`
--

LOCK TABLES `track_status` WRITE;
/*!40000 ALTER TABLE `track_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `track_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upline`
--

DROP TABLE IF EXISTS `upline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `upline` (
  `Train_no` int DEFAULT NULL,
  `Train_name` varchar(20) DEFAULT NULL,
  `Arrival` time DEFAULT NULL,
  `Departure` time DEFAULT NULL,
  `Meet` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upline`
--

LOCK TABLES `upline` WRITE;
/*!40000 ALTER TABLE `upline` DISABLE KEYS */;
INSERT INTO `upline` VALUES (12842,'Coromandel Exp','01:30:00','06:30:00','03:30:00'),(22826,'MAS SHM SF EXP','15:25:00','19:52:00','19:00:00'),(18022,'KUR KGP EXP','16:30:00','21:15:00','19:00:00'),(12892,'PURI BGY SF','17:05:00','20:26:00','19:06:00');
/*!40000 ALTER TABLE `upline` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-01 12:35:43
