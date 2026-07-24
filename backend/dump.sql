-- MySQL dump 10.13  Distrib 9.7.1, for Linux (x86_64)
--
-- Host: localhost    Database: gallery
-- ------------------------------------------------------
-- Server version	9.7.1

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ 'e62b7e2e-8738-11f1-8a5f-8b9858f2b6b6:1-13';

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `artist` varchar(50) DEFAULT NULL,
  `description` text,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Milky Way','Elena Rostova','A mesmerizing oil painting that captures the vast, enchanting expanse of the nocturnal cosmos through layered blending and luminous highlights.',100.00,'img/1.jpeg',10),(2,'The Butterfly','Marcus Vance','An exquisite watercolor illustration that celebrates the delicate grace and breathtaking geometry of nature in motion.',150.00,'img/2.jpeg',10),(3,'Visage','Aria Chen','A striking modern portrait that strips away excess detail to focus on raw emotion and geometric harmony.',120.00,'img/3.jpeg',10),(4,'The Ink','Hiroshi Tanaka','A powerful monochrome ink wash painting that seamlessly bridges traditional Sumi-e calligraphy with aggressive, modern abstraction.',130.00,'img/4.jpeg',10),(5,'Magnificat','Sofia Thorne','A dramatic canvas heavily inspired by classical Baroque painting techniques, defined by its masterly use of extreme light and dark contrasts.',170.00,'img/5.jpeg',10),(6,'A Juicy World','Leo Sterling','A exuberant pop-art piece bursting with saturated neon hues, playful surrealism, and vibrant energy.',120.00,'img/6.jpeg',10),(7,'Galaxies','Nadia Al-Mansoor','An atmospheric mixed-media artwork that explores the rugged, tactile textures of deep space using heavy acrylic build-ups and metallic pigments.',100.00,'img/7.jpg',10),(8,'Nature','Julian Hayes','A breathtaking hyper-realistic digital painting that captures the minute details of the natural world with astonishing precision and warmth.',150.00,'img/8.jpg',10),(9,'Man in the mirror','Amara Okafor','An deeply expressive impasto portrait crafted using heavy palette knife application, giving the canvas a sculpted, three-dimensional physical presence.',120.00,'img/9.jpg',10),(10,'River','Soren Lindqvist','A bold and uncompromising avant-garde abstract work that uses sprawling black ink splatters intersected by sharp, clean architectural lines to mimic the relentless force of flowing water.',130.00,'img/10.jpg',10);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'fanoela','test@test.org','$2b$12$megx.Q5r0AUweWVEPjY8julYjwWfgNFazopN/Nc0xoy8YM7spZcYm'),(3,'fano','fano@test.com','$2b$12$nXZx.3EeJ8lW3FMpvYGvvebNVsio0rGILvB5xqVikeUxv19g01i2y');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-07-24 23:29:18
