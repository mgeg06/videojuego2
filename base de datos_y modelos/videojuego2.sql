CREATE DATABASE  IF NOT EXISTS `videojuegos2` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `videojuegos2`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: videojuegos2
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `juego`
--

DROP TABLE IF EXISTS `juego`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `juego` (
  `idjuego` int NOT NULL,
  `inicio` datetime NOT NULL,
  `area` varchar(90) NOT NULL,
  `correctas` int NOT NULL,
  `incorrectas` int NOT NULL,
  `total_puntos` int NOT NULL,
  `fin` datetime NOT NULL,
  `usuario` int NOT NULL,
  PRIMARY KEY (`idjuego`),
  KEY `usuario_idx` (`usuario`),
  CONSTRAINT `usuario` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`idusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `juego`
--

LOCK TABLES `juego` WRITE;
/*!40000 ALTER TABLE `juego` DISABLE KEYS */;
INSERT INTO `juego` VALUES (20,'2022-08-06 03:30:00','tic',5,5,5,'2022-08-06 05:00:00',1),(21,'2022-08-07 04:30:00','mantenimiento',8,2,8,'2022-08-07 04:30:00',2),(22,'2022-10-07 06:30:00','entornos',2,0,2,'2022-10-07 06:30:00',3),(23,'2022-10-05 04:50:00','fisioterapia',6,2,6,'2022-10-05 04:50:00',4),(24,'2022-10-10 04:50:00','tic',9,1,9,'2022-10-10 04:50:00',5);
/*!40000 ALTER TABLE `juego` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pregunta`
--

DROP TABLE IF EXISTS `pregunta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pregunta` (
  `idpregunta` int NOT NULL,
  `tema` varchar(45) NOT NULL,
  `dificultad` varchar(90) NOT NULL,
  `pregunta` varchar(150) NOT NULL,
  PRIMARY KEY (`idpregunta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pregunta`
--

LOCK TABLES `pregunta` WRITE;
/*!40000 ALTER TABLE `pregunta` DISABLE KEYS */;
INSERT INTO `pregunta` VALUES (30,'sotware','facil','se define como el conjunto de los componentes o dispositivos fisicos que intervienen en un sistema computacional'),(31,'mantenimiento','medio','usando este puerto las PCs se conectan por medio de cables CAT-5 de 8 hilos'),(32,'entornos','facil','definicion de un entorno vitual '),(33,'salud','facil','¿Què es un desgarro muscular?'),(34,'desarrollo web','dificil','¿Què es un frontend?');
/*!40000 ALTER TABLE `pregunta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pregunta_has_res`
--

DROP TABLE IF EXISTS `pregunta_has_res`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pregunta_has_res` (
  `idpregunta` int NOT NULL,
  `respuesta` int NOT NULL,
  KEY `pregun_idx` (`respuesta`),
  KEY `res_idx` (`idpregunta`),
  CONSTRAINT `pregun` FOREIGN KEY (`respuesta`) REFERENCES `respuesta` (`idrespuesta`),
  CONSTRAINT `res` FOREIGN KEY (`idpregunta`) REFERENCES `pregunta` (`idpregunta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pregunta_has_res`
--

LOCK TABLES `pregunta_has_res` WRITE;
/*!40000 ALTER TABLE `pregunta_has_res` DISABLE KEYS */;
/*!40000 ALTER TABLE `pregunta_has_res` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `respuesta`
--

DROP TABLE IF EXISTS `respuesta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `respuesta` (
  `idrespuesta` int NOT NULL,
  `acertada` varchar(90) NOT NULL,
  PRIMARY KEY (`idrespuesta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `respuesta`
--

LOCK TABLES `respuesta` WRITE;
/*!40000 ALTER TABLE `respuesta` DISABLE KEYS */;
INSERT INTO `respuesta` VALUES (40,'hardware'),(41,'Ethernet'),(42,'es un espacio restringido, concebido y diseñado'),(43,'Es una ruptura de las fibras musculares'),(44,'desarrollo para la renderizacion de contenido del lado del cliente');
/*!40000 ALTER TABLE `respuesta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usua_has_pregunta`
--

DROP TABLE IF EXISTS `usua_has_pregunta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usua_has_pregunta` (
  `idusuario` int NOT NULL,
  `pregunta` int NOT NULL,
  KEY `usuario_idusuario_idx` (`pregunta`),
  KEY `pregunta_idx` (`idusuario`),
  CONSTRAINT `pregunta` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`),
  CONSTRAINT `usuario_idusuario` FOREIGN KEY (`pregunta`) REFERENCES `pregunta` (`idpregunta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usua_has_pregunta`
--

LOCK TABLES `usua_has_pregunta` WRITE;
/*!40000 ALTER TABLE `usua_has_pregunta` DISABLE KEYS */;
/*!40000 ALTER TABLE `usua_has_pregunta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `idusuario` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `contra` varchar(100) NOT NULL,
  `fecha` datetime NOT NULL,
  PRIMARY KEY (`idusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'victor','victor456@gmail.com','1234.vic','2022-10-31 03:00:00'),(2,'brianda','brianda12@gmail.com','bri123.','2022-10-30 07:00:00'),(3,'ariadna','ari678@gmail.com','ariO123.','2022-11-01 08:00:00'),(4,'guadalupe','mg987@gmail.com','mg3456.','2022-10-31 06:00:00'),(5,'carlos','car5678@gmail.com','carlos23.','2022-09-08 10:00:00');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-09 16:35:06
