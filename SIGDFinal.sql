CREATE DATABASE  IF NOT EXISTS `sigdfinal` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `sigdfinal`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: sigdfinal
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.24-MariaDB

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
-- Table structure for table `actuacion`
--

DROP TABLE IF EXISTS `actuacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actuacion` (
  `id_actuacion` int(11) NOT NULL AUTO_INCREMENT,
  `tiros` int(3) DEFAULT NULL,
  `anotaciones` int(3) DEFAULT NULL,
  `pases` int(4) DEFAULT NULL,
  `posesion` int(3) DEFAULT NULL,
  `rebotes` int(3) DEFAULT NULL,
  `gano` int(1) DEFAULT NULL,
  `perdio` int(1) DEFAULT NULL,
  `empato` int(1) DEFAULT NULL,
  `nombre_equipo` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_actuacion`),
  KEY `nombre_equipo` (`nombre_equipo`),
  CONSTRAINT `actuacion_ibfk_1` FOREIGN KEY (`nombre_equipo`) REFERENCES `equipo` (`nombre_equipo`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actuacion`
--

LOCK TABLES `actuacion` WRITE;
/*!40000 ALTER TABLE `actuacion` DISABLE KEYS */;
INSERT INTO `actuacion` VALUES (1,30,6,500,80,NULL,3,NULL,NULL,'Chimichangas'),(3,30,0,500,80,NULL,NULL,0,NULL,'Terminators'),(4,60,80,500,NULL,50,NULL,NULL,1,'Toronto Bulls'),(5,60,80,500,NULL,50,NULL,NULL,1,'Chicago Raptors'),(6,30,6,500,80,NULL,3,NULL,NULL,NULL),(7,3,4,5,NULL,NULL,1,NULL,NULL,NULL),(8,3,4,5,NULL,NULL,1,NULL,NULL,NULL),(9,3,4,5,NULL,NULL,1,NULL,NULL,NULL),(10,5,6,7,NULL,NULL,1,NULL,NULL,NULL),(11,5,6,7,NULL,NULL,1,NULL,NULL,NULL),(12,6,8,10,NULL,NULL,1,NULL,NULL,NULL),(13,8,11,14,NULL,NULL,1,NULL,NULL,NULL),(14,9,12,15,NULL,NULL,1,NULL,NULL,NULL),(15,8,11,14,NULL,NULL,1,NULL,NULL,NULL),(16,1,3,1,NULL,NULL,1,NULL,NULL,NULL),(17,3,5,4,NULL,NULL,1,NULL,NULL,NULL),(18,3,5,4,NULL,NULL,1,NULL,NULL,NULL),(19,5,7,7,NULL,NULL,1,NULL,NULL,NULL),(20,5,7,7,NULL,NULL,1,NULL,NULL,NULL),(21,6,10,8,NULL,NULL,1,NULL,NULL,NULL),(22,7,11,9,NULL,NULL,1,NULL,NULL,NULL),(23,9,15,12,NULL,NULL,1,NULL,NULL,NULL),(24,9,15,12,NULL,NULL,1,NULL,NULL,NULL),(25,3,2,31,NULL,NULL,1,NULL,NULL,NULL),(26,5,4,33,NULL,NULL,1,NULL,NULL,NULL),(27,5,4,33,NULL,NULL,1,NULL,NULL,NULL),(28,550,3,8,NULL,NULL,1,NULL,NULL,NULL),(29,550,3,8,NULL,NULL,1,NULL,NULL,NULL),(30,550,3,8,NULL,NULL,1,NULL,NULL,NULL),(31,2,2,12,NULL,NULL,1,NULL,NULL,NULL),(32,2,2,12,NULL,NULL,1,NULL,NULL,NULL),(33,3,3,13,NULL,NULL,1,NULL,NULL,NULL),(34,1,1,1,NULL,1,1,NULL,NULL,NULL),(35,1,1,1,NULL,1,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `actuacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrador`
--

DROP TABLE IF EXISTS `administrador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administrador` (
  `ci_administrador` int(8) NOT NULL,
  `horas_trabajo_semanales` int(4) DEFAULT NULL,
  `experiencia` int(4) DEFAULT NULL,
  PRIMARY KEY (`ci_administrador`),
  CONSTRAINT `administrador_ibfk_1` FOREIGN KEY (`ci_administrador`) REFERENCES `usuario` (`ci_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador`
--

LOCK TABLES `administrador` WRITE;
/*!40000 ALTER TABLE `administrador` DISABLE KEYS */;
INSERT INTO `administrador` VALUES (51384405,40,4);
/*!40000 ALTER TABLE `administrador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrativo`
--

DROP TABLE IF EXISTS `administrativo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administrativo` (
  `ci_administrativo` int(8) NOT NULL,
  `nro_funcionario` int(5) DEFAULT NULL,
  `horas_trabajo_semanales` int(4) DEFAULT NULL,
  PRIMARY KEY (`ci_administrativo`),
  UNIQUE KEY `nro_funcionario` (`nro_funcionario`),
  CONSTRAINT `administrativo_ibfk_1` FOREIGN KEY (`ci_administrativo`) REFERENCES `usuario` (`ci_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrativo`
--

LOCK TABLES `administrativo` WRITE;
/*!40000 ALTER TABLE `administrativo` DISABLE KEYS */;
INSERT INTO `administrativo` VALUES (13333112,90,45),(41333312,14,30),(51574763,2,30);
/*!40000 ALTER TABLE `administrativo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `analista`
--

DROP TABLE IF EXISTS `analista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `analista` (
  `ci_analista` int(8) NOT NULL,
  `nro_funcionario` int(5) DEFAULT NULL,
  `horas_trabajo_semanales` int(4) DEFAULT NULL,
  PRIMARY KEY (`ci_analista`),
  CONSTRAINT `analista_ibfk_1` FOREIGN KEY (`ci_analista`) REFERENCES `usuario` (`ci_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analista`
--

LOCK TABLES `analista` WRITE;
/*!40000 ALTER TABLE `analista` DISABLE KEYS */;
INSERT INTO `analista` VALUES (49297000,3,45);
/*!40000 ALTER TABLE `analista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deporte`
--

DROP TABLE IF EXISTS `deporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deporte` (
  `nombre_dep` varchar(40) NOT NULL,
  `tipo` varchar(30) DEFAULT NULL,
  `materiales_utilizados` varchar(200) DEFAULT NULL,
  `duracion` int(4) DEFAULT NULL,
  `cant_jueces` int(2) DEFAULT NULL,
  `cantidad_deportistas` int(3) DEFAULT NULL,
  `cantidad_deportistas_tituales` int(3) DEFAULT NULL,
  `cantidad_deportistas_suplentes` int(3) DEFAULT NULL,
  `superficie` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`nombre_dep`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deporte`
--

LOCK TABLES `deporte` WRITE;
/*!40000 ALTER TABLE `deporte` DISABLE KEYS */;
INSERT INTO `deporte` VALUES ('Basquetbol','Balonmano','Pelota, Aros, Silbato, Camisetas/Chalecos, Reloj de 24',40,3,12,5,7,'Piso Flotante'),('Futbol','Balonpie','Arco, Pelota, Banderines, Redes, Silbato, Camisetas/Chalecos',90,1,22,11,11,'Cesped'),('Handbol','Balonmano','Pelota, Arcos, Silbato, Camisetas/Chalecos, Reloj de 24',60,2,14,7,7,'Superficie dura');
/*!40000 ALTER TABLE `deporte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deportista`
--

DROP TABLE IF EXISTS `deportista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deportista` (
  `ci_deportista` int(8) NOT NULL,
  `nro_camiseta` int(2) DEFAULT NULL,
  `carne_salud` enum('SI','NO') DEFAULT NULL,
  `nombre_equipo` varchar(30) DEFAULT NULL,
  `suspendido` int(2) DEFAULT NULL,
  `posicion` enum('Delantero','Mediocampista','Defensa','Golero','Alero','Pivot','Base/Escolta') DEFAULT NULL,
  PRIMARY KEY (`ci_deportista`),
  KEY `nombre_equipo` (`nombre_equipo`),
  CONSTRAINT `deportista_ibfk_1` FOREIGN KEY (`ci_deportista`) REFERENCES `usuario` (`ci_usuario`),
  CONSTRAINT `deportista_ibfk_2` FOREIGN KEY (`nombre_equipo`) REFERENCES `equipo` (`nombre_equipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deportista`
--

LOCK TABLES `deportista` WRITE;
/*!40000 ALTER TABLE `deportista` DISABLE KEYS */;
INSERT INTO `deportista` VALUES (12342314,9,'SI','Chimichangas',NULL,'Delantero'),(12345671,1,'SI','Chimichangas',NULL,'Golero'),(32132112,NULL,'SI',NULL,NULL,NULL),(41231234,6,'SI','Toronto Bulls',NULL,'Alero'),(45346587,1,'SI','Chimichangas',4,'Golero'),(51334657,10,'SI','Chimichangas',NULL,'Delantero'),(51368687,4,'SI','Terminators',NULL,'Defensa'),(51524564,12,'SI','Terminators',NULL,'Delantero');
/*!40000 ALTER TABLE `deportista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrenador`
--

DROP TABLE IF EXISTS `entrenador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrenador` (
  `ci_entrenador` int(8) NOT NULL,
  `nro_funcionario` int(5) DEFAULT NULL,
  `horas_trabajo_semanales` int(4) DEFAULT NULL,
  PRIMARY KEY (`ci_entrenador`),
  CONSTRAINT `entrenador_ibfk_1` FOREIGN KEY (`ci_entrenador`) REFERENCES `usuario` (`ci_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrenador`
--

LOCK TABLES `entrenador` WRITE;
/*!40000 ALTER TABLE `entrenador` DISABLE KEYS */;
INSERT INTO `entrenador` VALUES (12122121,12,12),(13131313,13131313,30),(45687465,4,40),(51348738,6,50);
/*!40000 ALTER TABLE `entrenador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipo`
--

DROP TABLE IF EXISTS `equipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipo` (
  `nombre_equipo` varchar(30) NOT NULL,
  `ci_entrenador` int(8) NOT NULL,
  `apodo` varchar(10) DEFAULT NULL,
  `color_camiseta` varchar(10) DEFAULT NULL,
  `nombre_dep` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`nombre_equipo`,`ci_entrenador`),
  KEY `ci_entrenador` (`ci_entrenador`),
  KEY `nombre_dep` (`nombre_dep`),
  CONSTRAINT `equipo_ibfk_1` FOREIGN KEY (`ci_entrenador`) REFERENCES `entrenador` (`ci_entrenador`),
  CONSTRAINT `equipo_ibfk_2` FOREIGN KEY (`nombre_dep`) REFERENCES `deporte` (`nombre_dep`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipo`
--

LOCK TABLES `equipo` WRITE;
/*!40000 ALTER TABLE `equipo` DISABLE KEYS */;
INSERT INTO `equipo` VALUES ('Chicago Raptors',51348738,'Raptors','Azul','Basquetbol'),('Chimichangas',45687465,'Chimis','Azul','Futbol'),('Terminators',51348738,'Los T-2000','Rojo','Futbol'),('Toronto Bulls',45687465,'Bulls','Rojo','Basquetbol');
/*!40000 ALTER TABLE `equipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estadistica`
--

DROP TABLE IF EXISTS `estadistica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estadistica` (
  `id_estadistica` int(11) NOT NULL AUTO_INCREMENT,
  `rebotes` int(4) DEFAULT NULL,
  `pases` int(4) DEFAULT NULL,
  `asistencias` int(4) DEFAULT NULL,
  `anotaciones` int(3) DEFAULT NULL,
  `faltas` int(4) DEFAULT NULL,
  `quites` int(4) DEFAULT NULL,
  `sancion_partidos` int(2) DEFAULT NULL,
  `tiros` int(4) DEFAULT NULL,
  `ci_deportista` int(8) DEFAULT NULL,
  `nombre_equipo` varchar(30) DEFAULT NULL,
  `id_partido` int(4) DEFAULT NULL,
  `ci_entrenador` int(8) DEFAULT NULL,
  PRIMARY KEY (`id_estadistica`),
  KEY `ci_deportista` (`ci_deportista`),
  KEY `nombre_equipo` (`nombre_equipo`),
  KEY `id_partido` (`id_partido`),
  KEY `ci_entrenador` (`ci_entrenador`),
  CONSTRAINT `estadistica_ibfk_1` FOREIGN KEY (`ci_deportista`) REFERENCES `deportista` (`ci_deportista`),
  CONSTRAINT `estadistica_ibfk_2` FOREIGN KEY (`nombre_equipo`) REFERENCES `fixture` (`nombre_equipo`),
  CONSTRAINT `estadistica_ibfk_3` FOREIGN KEY (`id_partido`) REFERENCES `fixture` (`id_partido`),
  CONSTRAINT `estadistica_ibfk_4` FOREIGN KEY (`ci_entrenador`) REFERENCES `fixture` (`ci_entrenador`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadistica`
--

LOCK TABLES `estadistica` WRITE;
/*!40000 ALTER TABLE `estadistica` DISABLE KEYS */;
INSERT INTO `estadistica` VALUES (1,NULL,20,4,2,3,6,0,3,45346587,'Chimichangas',1,45687465),(2,NULL,15,0,0,4,6,0,3,51524564,'Terminators',1,51348738),(3,NULL,1,1,1,1,1,NULL,1,12342314,'Chimichangas',1,45687465),(4,NULL,1,1,1,1,1,NULL,1,12342314,'Chimichangas',1,45687465),(5,NULL,1,1,1,1,1,NULL,1,12342314,'Chimichangas',1,45687465),(6,NULL,1,1,1,1,1,NULL,1,12342314,'Chimichangas',1,45687465),(7,NULL,1,1,1,1,1,NULL,1,12342314,'Chimichangas',1,45687465),(8,NULL,1,1,1,1,1,NULL,1,12342314,'Chimichangas',1,45687465),(9,NULL,1,1,1,1,1,NULL,1,12342314,'Chimichangas',1,45687465),(10,NULL,1,1,1,1,1,NULL,1,12342314,'Chimichangas',1,45687465),(11,NULL,1,1,1,1,1,NULL,1,12342314,'Chimichangas',1,45687465),(12,NULL,1,1,1,1,1,NULL,1,12342314,'Chimichangas',1,45687465),(13,NULL,1,1,1,1,1,NULL,1,12342314,'Chimichangas',1,45687465),(14,NULL,1,1,1,1,1,NULL,1,12342314,'Chimichangas',1,45687465),(15,NULL,1,1,1,1,1,NULL,1,12342314,'Chimichangas',1,45687465),(16,NULL,1,1,1,1,1,NULL,1,12342314,'Chimichangas',1,45687465),(17,NULL,1,1,1,1,1,NULL,1,12342314,'Chimichangas',1,45687465),(18,NULL,1,1,1,1,1,NULL,1,12342314,'Chimichangas',1,45687465),(19,NULL,1,1,1,1,1,NULL,1,12342314,'Chimichangas',1,45687465),(20,NULL,1,1,1,1,1,NULL,1,12342314,'Chimichangas',1,45687465),(21,NULL,1,1,1,1,1,NULL,1,12342314,'Chimichangas',1,45687465),(22,NULL,1,1,1,1,1,NULL,1,12342314,'Chimichangas',1,45687465),(23,NULL,1,1,1,1,1,NULL,1,12342314,'Chimichangas',1,45687465),(24,NULL,1,1,1,1,1,NULL,1,12342314,'Chimichangas',1,45687465),(25,NULL,1,1,1,1,1,NULL,1,12342314,'Chimichangas',1,45687465),(26,NULL,1,1,1,1,1,NULL,1,12342314,'Chimichangas',1,45687465),(27,NULL,1,1,1,1,1,NULL,1,12342314,'Chimichangas',11,45687465),(28,NULL,3,3,2,1,2,NULL,1,12342314,'Chimichangas',11,45687465),(29,NULL,1,1,1,1,1,NULL,1,12342314,'Chimichangas',11,45687465),(30,NULL,1,1,1,1,1,NULL,1,12342314,'Chimichangas',11,45687465),(31,NULL,1,1,1,1,1,NULL,1,12342314,'Chimichangas',11,45687465),(32,NULL,3,3,2,1,2,NULL,1,12342314,'Chimichangas',11,45687465),(33,NULL,1,1,1,1,1,NULL,1,12342314,'Chimichangas',11,45687465),(34,NULL,3,3,2,1,2,NULL,1,12342314,'Chimichangas',11,45687465),(35,NULL,1,1,1,1,1,NULL,1,12342314,'Chimichangas',11,45687465),(36,NULL,1,2,3,2,3,NULL,1,12342314,'Chimichangas',12,45687465),(37,NULL,2,3,1,3,13,NULL,1,12342314,'Chimichangas',12,45687465),(38,NULL,1,1,1,1,1,NULL,1,12342314,'Chimichangas',12,45687465),(39,NULL,2,3,1,3,13,NULL,1,12342314,'Chimichangas',12,45687465),(40,NULL,1,1,1,1,1,NULL,1,12342314,'Chimichangas',12,45687465),(41,NULL,1,2,3,2,3,NULL,1,12342314,'Chimichangas',12,45687465),(42,NULL,1,1,1,1,1,NULL,1,12342314,'Chimichangas',12,45687465),(43,NULL,1,2,3,2,3,NULL,1,12342314,'Chimichangas',12,45687465),(44,NULL,2,3,1,3,13,NULL,1,12342314,'Chimichangas',12,45687465),(45,NULL,31,32,2,1,1,NULL,3,12342314,'Chimichangas',14,45687465),(46,NULL,1,1,1,1,1,NULL,1,12342314,'Chimichangas',14,45687465),(47,NULL,1,1,1,1,1,NULL,1,12342314,'Chimichangas',14,45687465),(48,NULL,1,1,1,5,3,NULL,2,12342314,'Chimichangas',15,45687465),(49,NULL,3,4,2,54,6,NULL,5,12342314,'Chimichangas',15,45687465),(50,NULL,5,4,3,8,5,NULL,6,12342314,'Chimichangas',15,45687465),(51,NULL,2,3,1,1,1,NULL,2,12342314,'Chimichangas',16,45687465),(52,NULL,3,2,1,5,1,NULL,544,12342314,'Chimichangas',16,45687465),(53,NULL,3,3,1,6,5,NULL,4,12342314,'Chimichangas',16,45687465),(54,NULL,11,1,1,1,1,NULL,1,12342314,'Chimichangas',17,45687465),(55,NULL,1,1,1,1,11,NULL,1,12342314,'Chimichangas',17,45687465),(56,NULL,1,1,1,1,1,NULL,1,12342314,'Chimichangas',17,45687465),(57,1,1,1,1,1,1,NULL,1,41231234,'Toronto Bulls',53,45687465),(58,1,1,1,1,1,1,NULL,1,41231234,'Toronto Bulls',54,45687465);
/*!40000 ALTER TABLE `estadistica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fixture`
--

DROP TABLE IF EXISTS `fixture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fixture` (
  `id_partido` int(6) NOT NULL,
  `nombre_equipo` varchar(30) NOT NULL,
  `id_actuacion` int(6) DEFAULT NULL,
  `id_torneo` int(6) DEFAULT NULL,
  `ci_juez` int(8) DEFAULT NULL,
  `ci_analista` int(8) DEFAULT NULL,
  `ci_entrenador` int(8) DEFAULT NULL,
  PRIMARY KEY (`id_partido`,`nombre_equipo`),
  KEY `nombre_equipo` (`nombre_equipo`),
  KEY `id_actuacion` (`id_actuacion`),
  KEY `id_torneo` (`id_torneo`),
  KEY `ci_juez` (`ci_juez`),
  KEY `ci_analista` (`ci_analista`),
  KEY `ci_entrenador` (`ci_entrenador`),
  CONSTRAINT `fixture_ibfk_1` FOREIGN KEY (`id_partido`) REFERENCES `partido` (`id_partido`),
  CONSTRAINT `fixture_ibfk_2` FOREIGN KEY (`nombre_equipo`) REFERENCES `equipo` (`nombre_equipo`),
  CONSTRAINT `fixture_ibfk_3` FOREIGN KEY (`id_actuacion`) REFERENCES `actuacion` (`id_actuacion`),
  CONSTRAINT `fixture_ibfk_4` FOREIGN KEY (`id_torneo`) REFERENCES `torneo` (`id_torneo`),
  CONSTRAINT `fixture_ibfk_5` FOREIGN KEY (`ci_juez`) REFERENCES `juez` (`ci_juez`),
  CONSTRAINT `fixture_ibfk_6` FOREIGN KEY (`ci_analista`) REFERENCES `analista` (`ci_analista`),
  CONSTRAINT `fixture_ibfk_7` FOREIGN KEY (`ci_entrenador`) REFERENCES `equipo` (`ci_entrenador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fixture`
--

LOCK TABLES `fixture` WRITE;
/*!40000 ALTER TABLE `fixture` DISABLE KEYS */;
INSERT INTO `fixture` VALUES (1,'Chimichangas',6,1,43214876,49297000,45687465),(1,'Terminators',NULL,1,43214876,49297000,51348738),(2,'Chicago Raptors',4,1,43214876,49297000,51348738),(2,'Toronto Bulls',5,1,43214876,49297000,45687465),(4,'Chimichangas',1,1,43214876,49297000,45687465),(4,'Terminators',1,1,43214876,49297000,45687465),(5,'Chimichangas',1,1,43214876,49297000,45687465),(5,'Terminators',3,1,43214876,49297000,45687465),(11,'Chimichangas',12,36,43214876,49297000,45687465),(11,'Terminators',NULL,36,43214876,49297000,51348738),(12,'Chimichangas',22,36,43214876,49297000,45687465),(12,'Terminators',NULL,36,43214876,49297000,51348738),(14,'Chimichangas',25,40,43214876,49297000,45687465),(14,'Terminators',NULL,40,43214876,49297000,51348738),(15,'Chimichangas',27,40,43214876,49297000,45687465),(15,'Terminators',NULL,40,43214876,49297000,51348738),(16,'Chimichangas',27,40,43214876,49297000,45687465),(16,'Terminators',NULL,40,43214876,49297000,51348738),(17,'Chimichangas',32,40,43214876,49297000,45687465),(17,'Terminators',NULL,40,43214876,49297000,51348738),(52,'Chimichangas',NULL,67,43214876,49297000,45687465),(52,'Terminators',NULL,67,43214876,49297000,51348738),(53,'Chicago Raptors',NULL,69,43214876,49297000,51348738),(53,'Toronto Bulls',33,69,43214876,49297000,45687465),(54,'Chicago Raptors',NULL,69,43214876,49297000,51348738),(54,'Toronto Bulls',34,69,43214876,49297000,45687465),(56,'Chicago Raptors',NULL,69,43214876,49297000,51348738),(56,'Toronto Bulls',NULL,69,43214876,49297000,45687465),(57,'Chimichangas',NULL,71,43214876,49297000,45687465),(57,'Terminators',NULL,71,43214876,49297000,51348738),(58,'Chimichangas',NULL,72,43214876,49297000,45687465),(58,'Terminators',NULL,72,43214876,49297000,51348738),(59,'Chimichangas',NULL,73,43214876,49297000,45687465),(59,'Terminators',NULL,73,43214876,49297000,51348738),(60,'Chimichangas',NULL,73,43214876,49297000,45687465),(60,'Terminators',NULL,73,43214876,49297000,51348738),(61,'Chimichangas',NULL,73,43214876,49297000,45687465),(61,'Terminators',NULL,73,43214876,49297000,51348738),(63,'Chimichangas',NULL,77,43214876,49297000,45687465),(63,'Terminators',NULL,77,43214876,49297000,51348738),(64,'Chimichangas',NULL,77,43214876,49297000,45687465),(64,'Terminators',NULL,77,43214876,49297000,51348738),(65,'Chimichangas',NULL,77,43214876,49297000,45687465),(65,'Terminators',NULL,77,43214876,49297000,51348738),(66,'Chimichangas',NULL,77,43214876,49297000,45687465),(66,'Terminators',NULL,77,43214876,49297000,51348738),(74,'Chimichangas',NULL,NULL,43214876,49297000,45687465),(74,'Terminators',NULL,NULL,43214876,49297000,51348738),(75,'Chimichangas',NULL,NULL,43214876,49297000,45687465),(75,'Terminators',NULL,NULL,43214876,49297000,51348738),(76,'Chimichangas',NULL,NULL,43214876,49297000,45687465),(76,'Terminators',NULL,NULL,43214876,49297000,51348738),(77,'Chimichangas',NULL,NULL,43214876,49297000,45687465),(77,'Terminators',NULL,NULL,43214876,49297000,51348738),(78,'Chimichangas',NULL,84,43214876,49297000,45687465),(78,'Terminators',NULL,84,43214876,49297000,51348738),(79,'Chimichangas',NULL,NULL,43214876,49297000,45687465),(79,'Terminators',NULL,NULL,43214876,49297000,51348738);
/*!40000 ALTER TABLE `fixture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupo_deportista`
--

DROP TABLE IF EXISTS `grupo_deportista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grupo_deportista` (
  `ci_deportista` int(8) NOT NULL,
  `grupo` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`ci_deportista`),
  CONSTRAINT `grupo_deportista_ibfk_1` FOREIGN KEY (`ci_deportista`) REFERENCES `deportista` (`ci_deportista`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo_deportista`
--

LOCK TABLES `grupo_deportista` WRITE;
/*!40000 ALTER TABLE `grupo_deportista` DISABLE KEYS */;
INSERT INTO `grupo_deportista` VALUES (32132112,'3BA'),(45346587,'3BA'),(51524564,'3BB');
/*!40000 ALTER TABLE `grupo_deportista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupo_entrenador`
--

DROP TABLE IF EXISTS `grupo_entrenador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grupo_entrenador` (
  `ci_entrenador` int(8) NOT NULL,
  `grupo` varchar(6) NOT NULL,
  PRIMARY KEY (`ci_entrenador`,`grupo`),
  CONSTRAINT `grupo_entrenador_ibfk_1` FOREIGN KEY (`ci_entrenador`) REFERENCES `entrenador` (`ci_entrenador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo_entrenador`
--

LOCK TABLES `grupo_entrenador` WRITE;
/*!40000 ALTER TABLE `grupo_entrenador` DISABLE KEYS */;
INSERT INTO `grupo_entrenador` VALUES (12122121,'3ba'),(13131313,'3BA'),(45687465,'3BA'),(51348738,'3BB');
/*!40000 ALTER TABLE `grupo_entrenador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `juez`
--

DROP TABLE IF EXISTS `juez`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `juez` (
  `ci_juez` int(8) NOT NULL,
  `carne_salud` enum('SI','NO') DEFAULT NULL,
  `horas_trabajo_semanales` int(4) DEFAULT NULL,
  `experiencia` int(2) DEFAULT NULL,
  PRIMARY KEY (`ci_juez`),
  CONSTRAINT `juez_ibfk_1` FOREIGN KEY (`ci_juez`) REFERENCES `usuario` (`ci_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `juez`
--

LOCK TABLES `juez` WRITE;
/*!40000 ALTER TABLE `juez` DISABLE KEYS */;
INSERT INTO `juez` VALUES (12123131,'SI',12,0),(43214876,'SI',30,2),(54594594,'SI',12,0);
/*!40000 ALTER TABLE `juez` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_usuario`
--

DROP TABLE IF EXISTS `log_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_usuario` (
  `ci_usuario` int(8) DEFAULT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `apellido` varchar(30) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `telefono` int(9) DEFAULT NULL,
  `contrasena` varchar(15) DEFAULT NULL,
  `nacionalidad` varchar(40) DEFAULT NULL,
  `fecha_nac` date DEFAULT NULL,
  `calle` varchar(50) DEFAULT NULL,
  `numero` int(6) DEFAULT NULL,
  `ciudad` varchar(50) DEFAULT NULL,
  `ci_administrador` int(8) DEFAULT NULL,
  `ci_administrativo` int(8) DEFAULT NULL,
  `tipo_de_accion` enum('Alta','Modif.nueva','Modif.vieja','Baja') DEFAULT NULL,
  `fecha` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_usuario`
--

LOCK TABLES `log_usuario` WRITE;
/*!40000 ALTER TABLE `log_usuario` DISABLE KEYS */;
INSERT INTO `log_usuario` VALUES (51384405,'Ezequiel','Fredes','ezequielfredes@hotmail.com',99834324,'12345678','Uruguayo','1996-07-10','Felipe Caballero',4010,'Montevideo',NULL,NULL,'Alta','2022-10-02'),(51574763,'Andrea','Moreira','andreamoreira1314@gmail.com',99478868,'12345678','Uruguaya','1998-04-23','Felipe Caballero',4010,'Montevideo',NULL,NULL,'Alta','2022-10-02'),(49297000,'Leandro','Rodriguez','lea.rod.san@gmail.com',98123123,'12345678','Uruguayo','1994-03-23','Doctorino',1234,'Montevideo',NULL,NULL,'Alta','2022-10-02'),(49297000,'Leandro','Rodriguez','lea.rod.san@gmail.com',98123123,'12345678','Uruguayo','1994-03-23','Doctorino',1234,'Montevideo',NULL,NULL,'Modif.vieja','2022-10-02'),(49297000,'Leandro','Rodriguez','lea.rod.san@gmail.com',98123123,'12345678','Uruguayo','1994-07-05','Doctorino',1234,'Montevideo',NULL,NULL,'Modif.nueva','2022-10-02'),(43214876,'Roberto','Candelabro','datascience@gmail.com',98432123,'12345678','Paraguayo','1928-03-21','Chimichurri',3214,'Montevideo',NULL,NULL,'Alta','2022-10-02'),(45353486,'Martina','Sanchez','maniqui@gmail.com',98432123,'12345678','Boliviana','1928-03-21','Chimichurri',3214,'Montevideo',NULL,NULL,'Alta','2022-10-02'),(51348738,'Ramon','Gimenez','ginter@gmail.com',98433323,'12345678','Uruguayo','1928-03-21','Chimichurri',3214,'Montevideo',NULL,NULL,'Alta','2022-10-02'),(51524564,'Jorge','Pitufo','mayonesa@gmail.com',93546874,'12345678','Uruguayo','1928-03-21','Chimichurri',3214,'Montevideo',NULL,NULL,'Alta','2022-10-02'),(51368687,'Matilde','Dieguez','chipote@gmail.com',93546874,NULL,'Uruguayo','1989-04-22','Alcanz',3464,'Montevideo',NULL,NULL,'Alta','2022-10-02'),(45687465,'Roberto','Suazo','gagaga@gmail.com',91458754,'12345678','Uruguayo','1988-03-21','Av.Libertador',4214,'Montevideo',NULL,NULL,'Alta','2022-10-02'),(51334657,'Rodrigo','Gomez','rgomez@gmail.com',94123321,NULL,'Uruguayo','1999-04-22','Alcanzara',3464,'Montevideo',NULL,NULL,'Alta','2022-10-02'),(45346587,'Guillermo','Rodriguez','manchester@gmail.com',91654878,NULL,'Uruguayo','1996-05-12','Riño',2464,'Montevideo',NULL,NULL,'Alta','2022-10-02'),(12345671,'Diego','Alfonsi','dalfonsi@gmail.com',94321456,NULL,'Uruguayo','1992-03-10','Felipe Caballero',2464,'Canelones',NULL,NULL,'Alta','2022-10-29'),(41231234,'Rodrigo','Sanchez','rsanchez@gmail.com',91678546,NULL,'Argentino','1922-01-10','Av. Castro',2464,'Montevideo',NULL,NULL,'Alta','2022-10-29'),(12342314,'Rodrigo','Sanchez','rsanchez@gmail.com',91678546,NULL,'Argentino','1922-01-10','Av. Castro',2464,'Montevideo',NULL,NULL,'Alta','2022-10-29'),(32132132,'Ramon','Gonzalez','rgonzalez@gmail.com',99999999,'32132132','Peruano','1995-10-07','Av. Libertador',2020,'Montevideo',51384405,NULL,'Alta','2022-11-05'),(41333312,'Ramon','Gonzalez','rgonzalez@gmail.com',99123131,'41333312','Peruano','1995-10-07','Av. Libertador',2020,'Montevideo',51384405,NULL,'Alta','2022-11-05'),(11331332,'asdasd','Gonzalez','agonzalez@gmail.com',123123123,'11331332','Uruguayo','2022-11-09','lkjasdkld',1212,'asdasd',51384405,NULL,'Alta','2022-11-06'),(13333112,'Diego','Gonzalez','dgonzalez@gmail.com',94321321,'13333112','Uruguayo','1221-12-12','Domingo',1212,'Alexandria',51384405,NULL,'Alta','2022-11-06'),(13344334,'Robinho','Savedra','robinhos@hotmail.com',91654654,'13344334','Uruguayo','0000-00-00','Calculadora',2,'Montevideo',51384405,NULL,'Alta','2022-11-06'),(32132112,'Maximiliano','Rodolfonsini','mrodolfonsini@hotmail.com',91091091,'32132112','Uruguayo','1994-07-10','Av. Libertador',1313,'Canelones',51384405,NULL,'Alta','2022-11-06'),(13131313,'Messi','Ronaldo','mronaldo@hotmail.com',91911919,'13131313','ArgentinoPortugues','1958-03-10','Roñizo',1231,'Colonia',51384405,NULL,'Alta','2022-11-06'),(54594594,'Martin','Lopez','mlopez@gmail.com',99321123,'54594594','Uruguayo','2001-01-10','Nicaragua',1233,'Montevideo',51384405,NULL,'Alta','2022-11-06'),(9049042,'Manchester','United','city@gmail.com',92292292,'9049042','Argentino','2010-10-10','Manchester',1010,'Manchester',51384405,NULL,'Alta','2022-11-06'),(59432390,'Magia','Potagia','mpotagia@hotmail.com',93412321,'59432390','Uruguayo','1964-08-09','Magic',1919,'MagiaPotagia',51384405,NULL,'Alta','2022-11-06'),(12312323,'adsasdasasd','asdasd','ezequielfredes@hotmail.com',123123123,'12312323','asdasdasd','1995-06-10','asdasdas',1313,'asdasdasd',51384405,NULL,'Alta','2022-11-06'),(51331334,'Rigo','Rigober','rigober@hotmail.com',91091091,'51331334','Argentino','0000-00-00','Agraciada',1212,'Montevideo',51384405,NULL,'Alta','2022-11-06'),(51331333,'Rigos','Rigobere','rigober@hotmail.com',91091091,'51331333','Argentino','2022-11-26','Agraciada',1212,'Montevideo',51384405,NULL,'Alta','2022-11-06'),(51331331,'Rigos','Rigobere','rigober@hotmail.com',91091091,'51331331','Argentino','2022-11-26','Agraciada',1212,'Montevideo',51384405,NULL,'Alta','2022-11-06'),(51331338,'Rigos','Rigobere','rigober@hotmail.com',91091091,'51331338','Argentino','2022-11-26','Agraciada',1212,'Montevideo',51384405,NULL,'Alta','2022-11-06'),(51331338,'Rigos','Rigobere','rigober@hotmail.com',91091091,'51331338','Argentino','2022-11-26','Agraciada',1212,'Montevideo',51384405,NULL,'Modif.vieja','2022-11-06'),(51331338,'Rigos','Rigoberto','rigoberto@hotmail.com',91091091,'51331338','Uruguayo','2022-11-26','Castro',1210,'Montevideo',51384405,NULL,'Modif.nueva','2022-11-06'),(51331338,'Rigos','Rigoberto','rigoberto@hotmail.com',91091091,'51331338','Uruguayo','2022-11-26','Castro',1210,'Montevideo',51384405,NULL,'Modif.vieja','2022-11-06'),(51331338,'Rigoste','Rigoberto','rigoberto@hotmail.com',91091091,'51331338','Uruguayo','2022-11-26','Castro',1210,'Montevideo',51384405,NULL,'Modif.nueva','2022-11-06'),(51331338,'Rigoste','Rigoberto','rigoberto@hotmail.com',91091091,'51331338','Uruguayo','2022-11-26','Castro',1210,'Montevideo',51384405,NULL,'Modif.vieja','2022-11-06'),(51331338,'Rigoster','Rigoberto','rigoberto@hotmail.com',91091091,'51331338','Uruguayo','2022-11-26','Castro',1210,'Montevideo',51384405,NULL,'Modif.nueva','2022-11-06'),(51331338,'Rigoster','Rigoberto','rigoberto@hotmail.com',91091091,'51331338','Uruguayo','2022-11-26','Castro',1210,'Montevideo',51384405,NULL,'Modif.vieja','2022-11-06'),(51331338,'Rigoster','Rigoberto','rigoberto@hotmail.com',91091091,'51331338','Uruguayo','2022-11-26','Castro',1210,'Montevideo',51384405,NULL,'Modif.nueva','2022-11-06'),(51331338,'Rigoster','Rigoberto','rigoberto@hotmail.com',91091091,'51331338','Uruguayo','2022-11-26','Castro',1210,'Montevideo',51384405,NULL,'Modif.vieja','2022-11-06'),(51331338,'Rigostere','Rigoberto','rigoberto@hotmail.com',91091091,'51331338','Uruguayo','2022-11-26','Castro',1210,'Montevideo',51384405,NULL,'Modif.nueva','2022-11-06'),(51331338,'Rigostere','Rigoberto','rigoberto@hotmail.com',91091091,'51331338','Uruguayo','2022-11-26','Castro',1210,'Montevideo',51384405,NULL,'Modif.vieja','2022-11-06'),(51331338,'Rigosteree','Rigoberto','rigoberto@hotmail.com',91091091,'51331338','Uruguayo','2022-11-26','Castro',1210,'Montevideo',51384405,NULL,'Modif.nueva','2022-11-06'),(51331338,'Rigosteree','Rigoberto','rigoberto@hotmail.com',91091091,'51331338','Uruguayo','2022-11-26','Castro',1210,'Montevideo',51384405,NULL,'Modif.vieja','2022-11-06'),(51331338,'Rigoster','Rigoberto','rigoberto@hotmail.com',91091091,'51331338','Uruguayo','2022-11-26','Castro',1210,'Montevideo',51384405,NULL,'Modif.nueva','2022-11-06'),(51331338,'Rigoster','Rigoberto','rigoberto@hotmail.com',91091091,'51331338','Uruguayo','2022-11-26','Castro',1210,'Montevideo',51384405,NULL,'Modif.vieja','2022-11-06'),(51331338,'Rigoste','Rigoberto','rigoberto@hotmail.com',91091091,'51331338','Uruguayo','2022-11-26','Castro',1210,'Montevideo',51384405,NULL,'Modif.nueva','2022-11-06'),(51574763,'Andrea','Moreira','andreamoreira1314@gmail.com',99478868,'12345678','Uruguaya','1998-04-23','Felipe Caballero',4010,'Montevideo',NULL,NULL,'Modif.vieja','2022-11-06'),(51574763,'Carolina','Moreira','andreamoreira1314@gmail.com',99478868,'12345678','Uruguaya','1998-04-23','Felipe Caballero',4010,'Montevideo',NULL,NULL,'Modif.nueva','2022-11-06'),(51574763,'Carolina','Moreira','andreamoreira1314@gmail.com',99478868,'12345678','Uruguaya','1998-04-23','Felipe Caballero',4010,'Montevideo',NULL,NULL,'Modif.vieja','2022-11-06'),(51574763,'Andrea','Moreira','andreamoreira1314@gmail.com',99478868,'12345678','Uruguaya','1998-04-23','Felipe Caballero',4010,'Montevideo',NULL,NULL,'Modif.nueva','2022-11-06'),(13344334,'Robinho','Savedra','robinhos@hotmail.com',91654654,'13344334','Uruguayo','0000-00-00','Calculadora',2,'Montevideo',51384405,NULL,'Modif.vieja','2022-11-06'),(13344334,'Ronaldinho','Savedra','robinhos@hotmail.com',91654654,'13344334','Uruguayo','0000-00-00','Calculadora',2,'Montevideo',51384405,NULL,'Modif.nueva','2022-11-06'),(32132112,'Maximiliano','Rodolfonsini','mrodolfonsini@hotmail.com',91091091,'32132112','Uruguayo','1994-07-10','Av. Libertador',1313,'Canelones',51384405,NULL,'Modif.vieja','2022-11-06'),(32132112,'Rodrigo','Rodolfonsini','mrodolfonsini@hotmail.com',91091091,'32132112','Uruguayo','1994-07-10','Av. Libertador',1313,'Canelones',51384405,NULL,'Modif.nueva','2022-11-06'),(13131313,'Messi','Ronaldo','mronaldo@hotmail.com',91911919,'13131313','ArgentinoPortugues','1958-03-10','Roñizo',1231,'Colonia',51384405,NULL,'Modif.vieja','2022-11-06'),(13131313,'Leonel','Messi','lmessi@hotmail.com',91911919,'13131313','Argentino','1958-03-10','Barcelona',5050,'Colonia',51384405,NULL,'Modif.nueva','2022-11-06'),(9049042,'Manchester','United','city@gmail.com',92292292,'9049042','Argentino','2010-10-10','Manchester',1010,'Manchester',51384405,NULL,'Modif.vieja','2022-11-06'),(9049042,'Manchester','City','city@gmail.com',92292292,'9049042','Argentino','2010-10-10','Manchester',1010,'Manchester',51384405,NULL,'Modif.nueva','2022-11-06'),(43214876,'Roberto','Candelabro','datascience@gmail.com',98432123,'12345678','Paraguayo','1928-03-21','Chimichurri',3214,'Montevideo',NULL,NULL,'Modif.vieja','2022-11-06'),(43214876,'Roberto','Candelabro','rcandelabro@gmail.com',98432123,'12345678','Paraguayo','1968-03-21','Chimichurri',3214,'Montevideo',NULL,NULL,'Modif.nueva','2022-11-06'),(51331333,'Rigos','Rigobere','rigober@hotmail.com',91091091,'51331333','Argentino','2022-11-26','Agraciada',1212,'Montevideo',51384405,NULL,'Baja','2022-11-07'),(51331338,'Rigoste','Rigoberto','rigoberto@hotmail.com',91091091,'51331338','Uruguayo','2022-11-26','Castro',1210,'Montevideo',51384405,NULL,'Baja','2022-11-07'),(14335236,'Rigoberto','Firulais','grigo@hotmail.com',91165465,'14335236','Uruguayo','1994-10-10','Dio',1313,'Montevideo',51384405,NULL,'Alta','2022-11-07'),(14335236,'Rigoberto','Firulais','grigo@hotmail.com',91165465,'14335236','Uruguayo','1994-10-10','Dio',1313,'Montevideo',51384405,NULL,'Baja','2022-11-07'),(13332131,'asdasdas','asdasd','asdasdasd@gmail.com',123123123,'13332131','Uruguayo','1996-10-10','asdasd',1212,'asdasd',51384405,NULL,'Alta','2022-11-07'),(13332131,'asdasdas','asdasd','asdasdasd@gmail.com',123123123,'13332131','Uruguayo','1996-10-10','asdasd',1212,'asdasd',51384405,NULL,'Baja','2022-11-07'),(12312333,'asdasd','asdasd','ezequielfredes@hotmail.com',12312313,'12312333','asdasd','1212-12-12','asdasd',1212,'asdasd',51384405,NULL,'Alta','2022-11-07'),(12312333,'asdasd','asdasd','ezequielfredes@hotmail.com',12312313,'12312333','asdasd','1212-12-12','asdasd',1212,'asdasd',51384405,NULL,'Baja','2022-11-07'),(12121212,'asdasd','asdasd','asdasdasd@gmail.com',12121212,'12121212','asd','0000-00-00','asdasd',1212,'asdasd',51384405,NULL,'Alta','2022-11-07'),(12121212,'asdasd','asdasd','asdasdasd@gmail.com',12121212,'12121212','asd','0000-00-00','asdasd',1212,'asdasd',51384405,NULL,'Baja','2022-11-07'),(12121215,'asdasd','asdasd','asdasd@gmail.com',123123123,'12121215','asdasd','1212-12-12','asdasd',1212,'asdasd',51384405,NULL,'Alta','2022-11-07'),(12121215,'asdasd','asdasd','asdasd@gmail.com',123123123,'12121215','asdasd','1212-12-12','asdasd',1212,'asdasd',51384405,NULL,'Baja','2022-11-07'),(12121212,'asdasd','asdasd','esdas@hotmail.com',12121221,'12121212','asd','1212-12-12','asdasd',1212,'asdasd',51384405,NULL,'Alta','2022-11-07'),(12121212,'asdasd','asdasd','esdas@hotmail.com',12121221,'12121212','asd','1212-12-12','asdasd',1212,'asdasd',51384405,NULL,'Baja','2022-11-07'),(12121212,'asd','asd','ezequielfredes@hotmail.com',12,'12121212','asd','0000-00-00','asdasd',1212,'asd',51384405,NULL,'Alta','2022-11-07'),(12121212,'asd','asd','ezequielfredes@hotmail.com',12,'12121212','asd','0000-00-00','asdasd',1212,'asd',51384405,NULL,'Baja','2022-11-07'),(12121212,'asdasd','asdasd','ezequielfredes@hotmail.com',12121221,'12121212','asd','1111-11-11','asd',1212,'asd',51384405,NULL,'Alta','2022-11-07'),(12121212,'asdasd','asdasd','ezequielfredes@hotmail.com',12121221,'12121212','asd','1111-11-11','asd',1212,'asd',51384405,NULL,'Baja','2022-11-07'),(12121221,'asas','asdasd','asdasdasd@gmail.com',12122121,'12121221','asdasd','1212-12-12','asdasd',1212,'asdasd',51384405,NULL,'Alta','2022-11-07'),(12121221,'asas','asdasd','asdasdasd@gmail.com',12122121,'12121221','asdasd','1212-12-12','asdasd',1212,'asdasd',51384405,NULL,'Baja','2022-11-07'),(12121212,'asdasd','asdasd','asdasdasd@gmail.com',1212121212,'12121212','asdasd','0000-00-00','asdasd',1212,'asdasd',51384405,NULL,'Alta','2022-11-07'),(12121212,'asdasd','asdasd','asdasdasd@gmail.com',1212121212,'12121212','asdasd','0000-00-00','asdasd',1212,'asdasd',51384405,NULL,'Baja','2022-11-07'),(12121212,'asdasd','asdasd','asdasdasd@gmail.com',12121212,'12121212','asdasd','0000-00-00','asdasd',1212,'asdasd',51384405,NULL,'Alta','2022-11-07'),(12121212,'asdasd','asdasd','asdasdasd@gmail.com',12121212,'12121212','asdasd','0000-00-00','asdasd',1212,'asdasd',51384405,NULL,'Baja','2022-11-07'),(12121212,'asdasd','asdasd','ezequielfredes@hotmail.com',12121212,'12121212','asdasd','0000-00-00','asdasd',12121212,'asdasd',51384405,NULL,'Alta','2022-11-07'),(12121212,'asdasd','asdasd','ezequielfredes@hotmail.com',12121212,'12121212','asdasd','0000-00-00','asdasd',12121212,'asdasd',51384405,NULL,'Baja','2022-11-07'),(12121212,'asdasd','asdasd','ezequielfredes@hotmail.com',12121212,'12121212','asdasd','1212-12-12','asdasd',1212,'asdasd',51384405,NULL,'Alta','2022-11-07'),(12121212,'asdasd','asdasd','ezequielfredes@hotmail.com',12121212,'12121212','asdasd','1212-12-12','asdasd',1212,'asdasd',51384405,NULL,'Baja','2022-11-07'),(11331332,'asdasd','Gonzalez','agonzalez@gmail.com',123123123,'11331332','Uruguayo','2022-11-09','lkjasdkld',1212,'asdasd',51384405,NULL,'Baja','2022-11-07'),(13344334,'Ronaldinho','Savedra','robinhos@hotmail.com',91654654,'13344334','Uruguayo','0000-00-00','Calculadora',2,'Montevideo',51384405,NULL,'Baja','2022-11-07'),(12122121,'asdasd','asdasd','asd@gmail.com',12121221,'12122121','asdasdasd','1212-12-12','asdasd',1212,'asdasd',NULL,51574763,'Alta','2022-11-07'),(12123131,'asdasd','asdasd','ezequielfredes@hotmail.com',121221,'12123131','asdasd','2022-11-02','asdasd',1212,'asdasd',51384405,NULL,'Alta','2022-11-08'),(12123131,'asdasd','asdasd','ezequielfredes@hotmail.com',121221,'12123131','asdasd','2022-11-02','asdasd',1212,'asdasd',51384405,NULL,'Modif.vieja','2022-11-08'),(12123131,'asdasd','asdasd','ezequielfredes@hotmail.com',121221,'12123131','asdasd','2022-11-02','asdasd',1212,'asdasd',51384405,NULL,'Modif.nueva','2022-11-08');
/*!40000 ALTER TABLE `log_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partido`
--

DROP TABLE IF EXISTS `partido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partido` (
  `id_partido` int(11) NOT NULL AUTO_INCREMENT,
  `lugar` varchar(30) DEFAULT NULL,
  `hora_inicio` time DEFAULT NULL,
  `hora_fin` time DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `ci_analista` int(8) DEFAULT NULL,
  `ci_juez` int(8) DEFAULT NULL,
  PRIMARY KEY (`id_partido`),
  KEY `ci_analista` (`ci_analista`),
  KEY `ci_juez` (`ci_juez`),
  CONSTRAINT `partido_ibfk_1` FOREIGN KEY (`ci_analista`) REFERENCES `analista` (`ci_analista`),
  CONSTRAINT `partido_ibfk_2` FOREIGN KEY (`ci_juez`) REFERENCES `juez` (`ci_juez`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partido`
--

LOCK TABLES `partido` WRITE;
/*!40000 ALTER TABLE `partido` DISABLE KEYS */;
INSERT INTO `partido` VALUES (1,'UTU Brazo Oriental','16:00:00','16:30:00','2022-11-05',49297000,43214876),(2,'UTU Brazo Oriental','15:00:00','19:30:00','2022-11-08',49297000,43214876),(3,'UTU Brazo Oriental','15:00:00','16:30:00','2022-11-15',49297000,43214876),(4,'UTU Brazo Oriental','15:00:00','16:30:00','2022-11-22',49297000,43214876),(5,'UTU Brazo Oriental','15:00:00','16:30:00','2022-11-28',49297000,43214876),(6,'asdasd','12:12:00','12:12:00','1212-12-12',49297000,43214876),(7,'asdasd','12:12:00','12:12:00','1212-12-12',49297000,43214876),(8,'asdasd','12:12:00','12:12:00','1212-12-12',49297000,43214876),(9,'asdasd','12:12:00','12:12:00','1212-12-12',49297000,43214876),(10,'Montevideo','12:12:00','12:12:00','2022-10-10',49297000,43214876),(11,'asdasd','12:12:00','12:12:00','1212-12-12',49297000,43214876),(12,'asdasd','12:12:00','12:12:00','1212-12-12',49297000,43214876),(13,'Monteivoeo','12:12:00','12:12:00','1212-12-12',49297000,43214876),(14,'Monteivoeo','12:12:00','12:12:00','1212-12-12',49297000,43214876),(15,'Monteivoeo','12:12:00','12:12:00','1212-12-12',49297000,43214876),(16,'Monteivoeo','12:12:00','12:12:00','1212-12-12',49297000,43214876),(17,'Monteivoeo','12:12:00','12:12:00','1212-12-12',49297000,43214876),(18,'Utu Brazo','12:10:00','12:40:00','2010-04-10',49297000,54594594),(19,'Utu Brazo','12:12:00','12:12:00','1212-12-12',49297000,54594594),(20,'Utu Brazo','12:12:00','12:12:00','1212-12-12',49297000,54594594),(21,'Utu Brazo','12:12:00','12:12:00','1212-12-12',49297000,54594594),(22,'Utu Brazo','12:12:00','12:12:00','1212-12-12',49297000,54594594),(23,'Utu Brazo','12:12:00','12:12:00','1212-12-12',49297000,54594594),(24,'Utu Brazo','12:12:00','12:12:00','1212-12-12',49297000,54594594),(25,'Utu Brazo','12:12:00','12:12:00','1212-12-12',49297000,54594594),(26,'Utu Brazo','12:12:00','12:12:00','1212-12-12',49297000,54594594),(27,'Utu Brazo','12:12:00','12:12:00','1212-12-12',49297000,54594594),(28,'Utu Brazo','12:12:00','12:12:00','1212-12-12',49297000,54594594),(29,'Utu Brazo','12:12:00','12:12:00','1212-12-12',49297000,54594594),(30,'Utu Brazo','12:12:00','12:12:00','1212-12-12',49297000,54594594),(31,'Utu Brazo','12:12:00','12:12:00','1212-12-12',49297000,43214876),(32,'Utu Brazo','12:12:00','12:12:00','1212-12-12',49297000,43214876),(33,'Utu Brazo','12:12:00','12:12:00','1212-12-12',49297000,43214876),(34,'Utu Brazo','12:12:00','12:12:00','1212-12-12',49297000,43214876),(35,'Utu Brazo','12:12:00','12:12:00','1212-12-12',49297000,43214876),(36,'Utu Brazo','12:12:00','12:12:00','1212-12-12',49297000,43214876),(37,'Utu Brazo','12:12:00','12:12:00','1212-12-12',49297000,43214876),(38,'Utu Brazo','12:12:00','12:12:00','1212-12-12',49297000,43214876),(39,'Utu Brazo','12:12:00','12:12:00','1212-12-12',49297000,43214876),(40,'Utu Brazo','12:12:00','12:12:00','1212-12-12',49297000,43214876),(41,'Utu Brazo','12:12:00','12:12:00','1212-12-12',49297000,43214876),(42,'Utu Brazo','12:12:00','12:12:00','1212-12-12',49297000,43214876),(43,'Utu Brazo','12:12:00','12:12:00','1212-12-12',49297000,43214876),(44,'Utu Brazo','12:12:00','12:12:00','1212-12-12',49297000,43214876),(45,'Utu Brazo','12:12:00','12:12:00','1212-12-12',49297000,43214876),(46,'Utu Brazo','12:12:00','12:12:00','1212-12-12',49297000,43214876),(47,'Utu Brazo','12:12:00','12:12:00','1212-12-12',49297000,43214876),(48,'Utu Brazo','12:12:00','12:12:00','1212-12-12',49297000,43214876),(49,'Utu Brazo','12:12:00','12:12:00','1212-12-12',49297000,43214876),(50,'Utu Brazo','12:12:00','12:12:00','1212-12-12',49297000,43214876),(51,'Utu Brazo','12:12:00','12:12:00','1212-12-12',49297000,43214876),(52,'Utu Brazo','12:12:00','12:12:00','1212-12-12',49297000,43214876),(53,'Utu Brazo','12:12:00','12:12:00','2022-12-12',49297000,43214876),(54,'Utu Brazo','12:12:00','12:12:00','2022-12-12',49297000,43214876),(55,'Utu Brazo','12:12:00','12:12:00','2022-12-12',49297000,43214876),(56,'Utu Brazo','12:12:00','12:12:00','2022-12-12',49297000,43214876),(57,'Montevideo','12:12:00','12:12:00','2022-10-12',49297000,43214876),(58,'Montevideo','12:12:00','12:12:00','2022-10-12',49297000,43214876),(59,'Prueba','12:12:00','12:12:00','1212-12-12',49297000,43214876),(60,'Prueba','12:12:00','12:12:00','1212-12-12',49297000,43214876),(61,'Prueba','12:12:00','12:12:00','1212-12-12',49297000,43214876),(62,'asdasd','12:12:00','12:12:00','2022-10-12',49297000,43214876),(63,'asdasd','12:12:00','12:12:00','2022-10-12',49297000,43214876),(64,'asdasd','12:12:00','12:12:00','2022-10-12',49297000,43214876),(65,'asdasd','12:12:00','12:12:00','2022-10-12',49297000,43214876),(66,'asdasd','12:12:00','12:12:00','2022-10-12',49297000,43214876),(67,'asdasd','12:12:00','12:12:00','1212-12-12',49297000,43214876),(68,'Montevideo','12:12:00','13:13:00','2022-11-17',49297000,43214876),(69,'Montevideo','12:12:00','13:13:00','2022-11-17',49297000,43214876),(70,'Montevideo','12:12:00','13:13:00','2022-11-17',49297000,43214876),(71,'Montevideo','12:12:00','13:13:00','2022-11-17',49297000,43214876),(72,'Montevideo','12:12:00','13:13:00','2022-11-17',49297000,43214876),(73,'Montevideo','12:12:00','13:13:00','2022-11-17',49297000,43214876),(74,'Montevideo','12:12:00','13:13:00','2022-11-17',49297000,43214876),(75,'Montevideo','12:12:00','13:13:00','2022-11-17',49297000,43214876),(76,'Montevideo','12:12:00','13:13:00','2022-11-17',49297000,43214876),(77,'Madrid','12:30:00','12:40:00','2022-11-10',49297000,43214876),(78,'Rondó','12:00:00','13:30:00','2022-12-12',49297000,43214876),(79,'Utu Brazo','12:30:00','13:30:00','2022-11-16',49297000,43214876);
/*!40000 ALTER TABLE `partido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sancion`
--

DROP TABLE IF EXISTS `sancion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sancion` (
  `id_sancion` int(11) NOT NULL AUTO_INCREMENT,
  `suspendido` enum('SI','NO') DEFAULT NULL,
  `cantidad` int(5) DEFAULT NULL,
  `tipo` enum('Tarjeta Amarilla','Tarjeta Roja','Exclusion','Falta Personal','Falta Antideportiva','Falta Descalificante','Falta Tecnica') DEFAULT NULL,
  `habilitado_el_partido` int(2) DEFAULT NULL,
  `id_partido` int(6) DEFAULT NULL,
  `nombre_equipo` varchar(30) DEFAULT NULL,
  `ci_deportista` int(8) DEFAULT NULL,
  `ci_entrenador` int(8) DEFAULT NULL,
  PRIMARY KEY (`id_sancion`),
  KEY `id_partido` (`id_partido`),
  KEY `nombre_equipo` (`nombre_equipo`),
  KEY `ci_deportista` (`ci_deportista`),
  KEY `ci_entrenador` (`ci_entrenador`),
  CONSTRAINT `sancion_ibfk_1` FOREIGN KEY (`id_partido`) REFERENCES `fixture` (`id_partido`),
  CONSTRAINT `sancion_ibfk_2` FOREIGN KEY (`nombre_equipo`) REFERENCES `fixture` (`nombre_equipo`),
  CONSTRAINT `sancion_ibfk_3` FOREIGN KEY (`ci_deportista`) REFERENCES `deportista` (`ci_deportista`),
  CONSTRAINT `sancion_ibfk_4` FOREIGN KEY (`ci_entrenador`) REFERENCES `equipo` (`ci_entrenador`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sancion`
--

LOCK TABLES `sancion` WRITE;
/*!40000 ALTER TABLE `sancion` DISABLE KEYS */;
INSERT INTO `sancion` VALUES (3,'NO',1,'Tarjeta Amarilla',0,1,'Terminators',51524564,51348738),(4,'SI',1,'Tarjeta Roja',4,1,'Chimichangas',45346587,45687465),(5,'NO',2,'Tarjeta Amarilla',0,1,'Chimichangas',45346587,45687465),(6,'NO',2,'Tarjeta Amarilla',0,1,'Chimichangas',45346587,45687465),(7,'NO',2,'Tarjeta Amarilla',0,1,'Chimichangas',12345671,45687465),(8,'SI',1,'Tarjeta Roja',NULL,12,NULL,12342314,45687465),(9,'SI',1,'Tarjeta Roja',NULL,12,NULL,12342314,45687465),(10,'SI',1,'Tarjeta Roja',NULL,12,NULL,12342314,45687465),(11,'SI',1,'Tarjeta Roja',NULL,12,NULL,12342314,45687465),(12,'SI',1,'Tarjeta Roja',NULL,12,NULL,12342314,45687465),(13,'SI',1,'Tarjeta Roja',NULL,12,NULL,12342314,45687465),(14,'SI',1,'Tarjeta Roja',NULL,12,NULL,12342314,45687465),(15,'SI',1,'Tarjeta Roja',NULL,12,NULL,12342314,45687465),(16,'SI',1,'Tarjeta Roja',NULL,12,NULL,12342314,45687465),(17,'SI',1,'Tarjeta Roja',NULL,14,NULL,12342314,45687465),(18,'SI',1,'Tarjeta Roja',NULL,14,NULL,12342314,45687465),(19,'SI',2,'Tarjeta Amarilla',NULL,14,NULL,12342314,45687465),(20,'SI',3,'Tarjeta Amarilla',NULL,16,NULL,12342314,45687465),(21,'SI',1,'Tarjeta Roja',NULL,17,NULL,12342314,45687465),(22,'SI',1,'Tarjeta Roja',NULL,17,NULL,12342314,45687465),(23,'SI',1,'Tarjeta Roja',NULL,17,NULL,12342314,45687465),(24,'NO',1,'Falta Tecnica',NULL,53,NULL,41231234,45687465),(25,'NO',1,'Falta Descalificante',NULL,53,NULL,41231234,45687465),(26,'NO',1,'Falta Personal',NULL,53,NULL,41231234,45687465),(27,'NO',1,'Falta Tecnica',NULL,54,NULL,41231234,45687465),(28,'NO',1,'Falta Antideportiva',NULL,54,NULL,41231234,45687465),(29,'NO',1,'Falta Descalificante',NULL,54,NULL,41231234,45687465),(30,'NO',1,'Falta Personal',NULL,54,NULL,41231234,45687465);
/*!40000 ALTER TABLE `sancion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scout`
--

DROP TABLE IF EXISTS `scout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scout` (
  `ci_scout` int(8) NOT NULL,
  `experiencia` int(2) DEFAULT NULL,
  PRIMARY KEY (`ci_scout`),
  CONSTRAINT `scout_ibfk_1` FOREIGN KEY (`ci_scout`) REFERENCES `usuario` (`ci_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scout`
--

LOCK TABLES `scout` WRITE;
/*!40000 ALTER TABLE `scout` DISABLE KEYS */;
INSERT INTO `scout` VALUES (9049042,5),(45353486,4);
/*!40000 ALTER TABLE `scout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `torneo`
--

DROP TABLE IF EXISTS `torneo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `torneo` (
  `id_torneo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(90) DEFAULT NULL,
  `cantidad_equipos` int(2) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_final` date DEFAULT NULL,
  `lugar` varchar(30) DEFAULT NULL,
  `ci_analista` int(8) DEFAULT NULL,
  `nombre_dep` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id_torneo`),
  KEY `ci_analista` (`ci_analista`),
  KEY `nombre_dep` (`nombre_dep`),
  CONSTRAINT `torneo_ibfk_1` FOREIGN KEY (`ci_analista`) REFERENCES `analista` (`ci_analista`),
  CONSTRAINT `torneo_ibfk_2` FOREIGN KEY (`nombre_dep`) REFERENCES `deporte` (`nombre_dep`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `torneo`
--

LOCK TABLES `torneo` WRITE;
/*!40000 ALTER TABLE `torneo` DISABLE KEYS */;
INSERT INTO `torneo` VALUES (1,'Liga Amateur UTU',10,'2022-11-05','2023-02-05','UTU Brazo Oriental',49297000,'Futbol'),(2,'Liga de Basket Amateur',5,'2022-06-02','2022-06-30','UTU Brazo Oriental',49297000,'Basquetbol'),(3,'Liga de Handball Amateur',8,'2022-08-30','2022-10-10','ITS',49297000,'Handbol'),(4,'Liga de Futbol 2',3,'2022-08-30','2022-10-10','ITS',49297000,'Futbol'),(5,'Liga de Futbol Uruguay',NULL,'2022-02-05','2022-02-05','UTU Brazo Oriental',49297000,'Futbol'),(11,'',NULL,'0000-00-00','0000-00-00','',49297000,'Futbol'),(12,'Prueba',NULL,'2021-10-10','2022-11-11','UTU',49297000,'Basquetbol'),(14,'Liga de Futbol Uruguayana Amat',NULL,'2022-11-12','2022-12-12','Montevideo',49297000,'Futbol'),(17,'Liga de Futbol Uruguayana Amat',NULL,'2022-11-12','2022-12-12','Montevideo',49297000,'Futbol'),(20,'Liga de Basket Uruguay Amateur',NULL,'1212-12-12','1212-12-12','Montevideo',49297000,'Basquetbol'),(24,'asdasdasd',NULL,'1212-12-12','1212-12-12','asdasd',49297000,'Futbol'),(25,'asdasdasd',NULL,'1212-12-12','1212-12-12','asdasd',49297000,'Futbol'),(27,'asdasdasd',NULL,'1212-12-12','1212-12-12','asdasd',49297000,'Futbol'),(29,'asdasd',NULL,'1212-12-12','1212-12-12','asdasd',49297000,'Futbol'),(36,'ADSASDASDASD',NULL,'1212-12-12','1212-12-12','asdasd',49297000,'Futbol'),(37,'ADSASDASDASD',NULL,'1212-12-12','1212-12-12','asdasd',49297000,'Futbol'),(38,'ADSASDASDASD',NULL,'1212-12-12','1212-12-12','asdasd',49297000,'Futbol'),(40,'asddsdsds',NULL,'1212-12-12','1212-12-12','Monteivoeo',49297000,'Basquetbol'),(41,'asddsdsds',NULL,'1212-12-12','1212-12-12','Monteivoeo',49297000,'Basquetbol'),(42,'asddsdsds',NULL,'1212-12-12','1212-12-12','Monteivoeo',49297000,'Basquetbol'),(43,'asddsdsds',NULL,'1212-12-12','1212-12-12','Monteivoeo',49297000,'Basquetbol'),(44,'asddsdsds',NULL,'1212-12-12','1212-12-12','Monteivoeo',49297000,'Basquetbol'),(45,'Liga Uruguaya de Futbol Profes',NULL,'1212-12-12','1212-12-12','Utu Brazo',49297000,'Futbol'),(46,'Liga Uruguaya de Futbol Profes',NULL,'1212-12-12','1212-12-12','Utu Brazo',49297000,'Futbol'),(47,'Liga Uruguaya de Futbol Profes',NULL,'1212-12-12','1212-12-12','Utu Brazo',49297000,'Futbol'),(48,'Liga Uruguaya de Futbol Profes',NULL,'1212-12-12','1212-12-12','Utu Brazo',49297000,'Futbol'),(49,'Liga Uruguaya de Futbol Profes',NULL,'1212-12-12','1212-12-12','Utu Brazo',49297000,'Futbol'),(50,'Liga Uruguaya de Futbol Profes',NULL,'1212-12-12','1212-12-12','Utu Brazo',49297000,'Futbol'),(51,'Liga Uruguaya de Futbol Profes',NULL,'1212-12-12','1212-12-12','Utu Brazo',49297000,'Futbol'),(52,'Liga Uruguaya de Futbol Profes',NULL,'1212-12-12','1212-12-12','Utu Brazo',49297000,'Futbol'),(53,'Liga Uruguaya de Futbol Profes',NULL,'1212-12-12','1212-12-12','Utu Brazo',49297000,'Futbol'),(54,'Liga Uruguaya de Futbol Profes',NULL,'1212-12-12','1212-12-12','Utu Brazo',49297000,'Futbol'),(55,'Liga Uruguaya de Futbol Profes',NULL,'1212-12-12','1212-12-12','Utu Brazo',49297000,'Futbol'),(56,'Liga Uruguaya de Futbol Profes',NULL,'1212-12-12','1212-12-12','Utu Brazo',49297000,'Futbol'),(57,'Liga Uruguaya de Futbol Profes',NULL,'1212-12-12','1212-12-12','Utu Brazo',49297000,'Futbol'),(58,'Liga Uruguaya de Futbol Profes',NULL,'1212-12-12','1212-12-12','Utu Brazo',49297000,'Futbol'),(59,'Liga Uruguaya de Futbol Profes',NULL,'1212-12-12','1212-12-12','Utu Brazo',49297000,'Futbol'),(60,'Liga Uruguaya de Futbol Profes',NULL,'1212-12-12','1212-12-12','Utu Brazo',49297000,'Futbol'),(61,'Liga Uruguaya de Futbol Profes',NULL,'1212-12-12','1212-12-12','Utu Brazo',49297000,'Futbol'),(62,'Liga Uruguaya de Futbol Profes',NULL,'1212-12-12','1212-12-12','Utu Brazo',49297000,'Futbol'),(63,'Liga Uruguaya de Futbol Profes',NULL,'1212-12-12','1212-12-12','Utu Brazo',49297000,'Futbol'),(64,'Liga Uruguaya de Futbol Profes',NULL,'1212-12-12','1212-12-12','Utu Brazo',49297000,'Futbol'),(65,'Liga Uruguaya de Futbol Profes',NULL,'1212-12-12','1212-12-12','Utu Brazo',49297000,'Futbol'),(66,'Liga Uruguaya de Futbol Profes',NULL,'1212-12-12','1212-12-12','Utu Brazo',49297000,'Futbol'),(67,'Liga Uruguaya de Futbol Profesiona',NULL,'1212-12-12','1212-12-12','Utu Brazo',49297000,'Futbol'),(68,'Liga Uruguaya de Futbol Profesiona',NULL,'1212-12-12','1212-12-12','Utu Brazo',49297000,'Futbol'),(69,'Liga de Basket Ama',NULL,'1212-12-12','1212-12-12','Utu Brazo',49297000,'Basquetbol'),(70,'Liga de Basket Ama',NULL,'1212-12-12','1212-12-12','Utu Brazo',49297000,'Basquetbol'),(71,'NombrePrueba',NULL,'2022-12-12','2022-12-12','Montevideo',49297000,'Futbol'),(72,'Nombre',NULL,'2022-12-12','2022-12-12','Montevideo',49297000,'Futbol'),(73,'Prueba2',NULL,'2022-12-12','2022-12-12','Prueba',49297000,'Futbol'),(74,'Prueba2',NULL,'2022-12-12','2022-12-12','Prueba',49297000,'Futbol'),(75,'Prueba2',NULL,'2022-12-12','2022-12-12','Prueba',49297000,'Futbol'),(77,'asdasdsdssd',NULL,'1212-12-12','1212-12-12','asdasd',49297000,'Futbol'),(78,'asdasdsdssd',NULL,'1212-12-12','1212-12-12','asdasd',49297000,'Futbol'),(79,'asdasdsdssd',NULL,'1212-12-12','1212-12-12','asdasd',49297000,'Futbol'),(80,'asdasdsdssd',NULL,'1212-12-12','1212-12-12','asdasd',49297000,'Futbol'),(81,'asdasdsdssd',NULL,'1212-12-12','1212-12-12','asdasd',49297000,'Futbol'),(83,'Name',NULL,'1212-12-12','1212-12-12','asdasd',49297000,'Futbol'),(84,'Liga de handball',NULL,'2022-12-12','2023-02-12','Rondó',49297000,'Basquetbol');
/*!40000 ALTER TABLE `torneo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `ci_usuario` int(8) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `apellido` varchar(30) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `telefono` int(9) DEFAULT NULL,
  `contrasena` varchar(15) DEFAULT NULL,
  `nacionalidad` varchar(40) DEFAULT NULL,
  `fecha_nac` date DEFAULT NULL,
  `calle` varchar(50) DEFAULT NULL,
  `numero` int(6) DEFAULT NULL,
  `ciudad` varchar(50) DEFAULT NULL,
  `ci_administrador` int(8) DEFAULT NULL,
  `ci_administrativo` int(8) DEFAULT NULL,
  PRIMARY KEY (`ci_usuario`),
  KEY `ci_administrativo` (`ci_administrativo`),
  KEY `ci_administrador` (`ci_administrador`),
  CONSTRAINT `ci_administrador` FOREIGN KEY (`ci_administrador`) REFERENCES `administrador` (`ci_administrador`),
  CONSTRAINT `ci_administrativo` FOREIGN KEY (`ci_administrativo`) REFERENCES `administrativo` (`ci_administrativo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (9049042,'Manchester','City','city@gmail.com',92292292,'9049042','Argentino','2010-10-10','Manchester',1010,'Manchester',51384405,NULL),(12122121,'asdasd','asdasd','asd@gmail.com',12121221,'12122121','asdasdasd','1212-12-12','asdasd',1212,'asdasd',NULL,51574763),(12123131,'asdasd','asdasd','ezequielfredes@hotmail.com',121221,'12123131','asdasd','2022-11-02','asdasd',1212,'asdasd',51384405,NULL),(12312323,'adsasdasasd','asdasd','ezequielfredes@hotmail.com',123123123,'12312323','asdasdasd','1995-06-10','asdasdas',1313,'asdasdasd',51384405,NULL),(12342314,'Rodrigo','Sanchez','rsanchez@gmail.com',91678546,NULL,'Argentino','1922-01-10','Av. Castro',2464,'Montevideo',NULL,NULL),(12345671,'Diego','Alfonsi','dalfonsi@gmail.com',94321456,NULL,'Uruguayo','1992-03-10','Felipe Caballero',2464,'Canelones',NULL,NULL),(13131313,'Leonel','Messi','lmessi@hotmail.com',91911919,'13131313','Argentino','1958-03-10','Barcelona',5050,'Colonia',51384405,NULL),(13333112,'Diego','Gonzalez','dgonzalez@gmail.com',94321321,'13333112','Uruguayo','1221-12-12','Domingo',1212,'Alexandria',51384405,NULL),(32132112,'Rodrigo','Rodolfonsini','mrodolfonsini@hotmail.com',91091091,'32132112','Uruguayo','1994-07-10','Av. Libertador',1313,'Canelones',51384405,NULL),(32132132,'Ramon','Gonzalez','rgonzalez@gmail.com',99999999,'32132132','Peruano','1995-10-07','Av. Libertador',2020,'Montevideo',51384405,NULL),(41231234,'Rodrigo','Sanchez','rsanchez@gmail.com',91678546,NULL,'Argentino','1922-01-10','Av. Castro',2464,'Montevideo',NULL,NULL),(41333312,'Ramon','Gonzalez','rgonzalez@gmail.com',99123131,'41333312','Peruano','1995-10-07','Av. Libertador',2020,'Montevideo',51384405,NULL),(43214876,'Roberto','Candelabro','rcandelabro@gmail.com',98432123,'12345678','Paraguayo','1968-03-21','Chimichurri',3214,'Montevideo',NULL,NULL),(45346587,'Guillermo','Rodriguez','manchester@gmail.com',91654878,NULL,'Uruguayo','1996-05-12','Riño',2464,'Montevideo',NULL,NULL),(45353486,'Martina','Sanchez','maniqui@gmail.com',98432123,'12345678','Boliviana','1928-03-21','Chimichurri',3214,'Montevideo',NULL,NULL),(45687465,'Roberto','Suazo','gagaga@gmail.com',91458754,'12345678','Uruguayo','1988-03-21','Av.Libertador',4214,'Montevideo',NULL,NULL),(49297000,'Leandro','Rodriguez','lea.rod.san@gmail.com',98123123,'12345678','Uruguayo','1994-07-05','Doctorino',1234,'Montevideo',NULL,NULL),(51331331,'Rigos','Rigobere','rigober@hotmail.com',91091091,'51331331','Argentino','2022-11-26','Agraciada',1212,'Montevideo',51384405,NULL),(51331334,'Rigo','Rigober','rigober@hotmail.com',91091091,'51331334','Argentino','0000-00-00','Agraciada',1212,'Montevideo',51384405,NULL),(51334657,'Rodrigo','Gomez','rgomez@gmail.com',94123321,NULL,'Uruguayo','1999-04-22','Alcanzara',3464,'Montevideo',NULL,NULL),(51348738,'Ramon','Gimenez','ginter@gmail.com',98433323,'12345678','Uruguayo','1928-03-21','Chimichurri',3214,'Montevideo',NULL,NULL),(51368687,'Matilde','Dieguez','chipote@gmail.com',93546874,NULL,'Uruguayo','1989-04-22','Alcanz',3464,'Montevideo',NULL,NULL),(51384405,'Ezequiel','Fredes','ezequielfredes@hotmail.com',99834324,'12345678','Uruguayo','1996-07-10','Felipe Caballero',4010,'Montevideo',NULL,NULL),(51524564,'Jorge','Pitufo','mayonesa@gmail.com',93546874,'12345678','Uruguayo','1928-03-21','Chimichurri',3214,'Montevideo',NULL,NULL),(51574763,'Andrea','Moreira','andreamoreira1314@gmail.com',99478868,'12345678','Uruguaya','1998-04-23','Felipe Caballero',4010,'Montevideo',NULL,NULL),(54594594,'Martin','Lopez','mlopez@gmail.com',99321123,'54594594','Uruguayo','2001-01-10','Nicaragua',1233,'Montevideo',51384405,NULL),(59432390,'Magia','Potagia','mpotagia@hotmail.com',93412321,'59432390','Uruguayo','1964-08-09','Magic',1919,'MagiaPotagia',51384405,NULL);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger log_usuario_ai after insert on usuario 
for each row
insert into log_usuario(ci_usuario,nombre,apellido,email,telefono,contrasena,nacionalidad,fecha_nac,calle,numero,ciudad,ci_administrador,ci_administrativo,tipo_de_accion,fecha)
values (new.ci_usuario,new.nombre,new.apellido,new.email,new.telefono,new.contrasena,new.nacionalidad,new.fecha_nac,new.calle,new.numero,new.ciudad,new.ci_administrador,new.ci_administrativo,'Alta',now()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger log_usuario_bu before update on usuario 
for each row
insert into log_usuario(ci_usuario,nombre,apellido,email,telefono,contrasena,nacionalidad,fecha_nac,calle,numero,ciudad,ci_administrador,ci_administrativo,tipo_de_accion,fecha)
values (old.ci_usuario,old.nombre,old.apellido,old.email,old.telefono,old.contrasena,old.nacionalidad,old.fecha_nac,old.calle,old.numero,old.ciudad,old.ci_administrador,old.ci_administrativo,'Modif.vieja',now()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger log_usuario_au after update on usuario 
for each row
insert into log_usuario(ci_usuario,nombre,apellido,email,telefono,contrasena,nacionalidad,fecha_nac,calle,numero,ciudad,ci_administrador,ci_administrativo,tipo_de_accion,fecha)
values (new.ci_usuario,new.nombre,new.apellido,new.email,new.telefono,new.contrasena,new.nacionalidad,new.fecha_nac,new.calle,new.numero,new.ciudad,new.ci_administrador,new.ci_administrativo,'Modif.nueva',now()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger log_usuario_ad after delete on usuario 
for each row
insert into log_usuario(ci_usuario,nombre,apellido,email,telefono,contrasena,nacionalidad,fecha_nac,calle,numero,ciudad,ci_administrador,tipo_de_accion,fecha)
values (old.ci_usuario,old.nombre,old.apellido,old.email,old.telefono,old.contrasena,old.nacionalidad,old.fecha_nac,old.calle,old.numero,old.ciudad,old.ci_administrador,'Baja',now()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'sigdfinal'
--

--
-- Dumping routines for database 'sigdfinal'
--
/*!50003 DROP PROCEDURE IF EXISTS `administrativo_cargar_administrador` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `administrativo_cargar_administrador`(in ci int(8), in nombre varchar(30), in apellido varchar(30), in email varchar(50), in telefono int(9), in nacionalidad varchar(40), in fecha date, in calle varchar(50), in numero int(6), in ciudad varchar(50), in administrativo int(8),in horas_trabajo int(4),in exp int(2))
begin 
insert into usuario(ci_usuario,nombre,apellido,email,telefono,contrasena,nacionalidad,fecha_nac,calle,numero,ciudad,ci_administrativo)
values(ci,nombre,apellido,email,telefono,ci,nacionalidad,fecha,calle,numero,ciudad,administrativo);

insert into administrador(ci_administrador,horas_trabajo_semanales,experiencia)
values(ci,horas_trabajo,exp);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `administrativo_cargar_administrativo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `administrativo_cargar_administrativo`(in ci int(8), in nombre varchar(30), in apellido varchar(30), in email varchar(50), in telefono int(9), in nacionalidad varchar(40), in fecha date, in calle varchar(50), in numero int(6), in ciudad varchar(50), in administrativo int(8), in nro_fun int(5), in horas_trabajo int(4))
begin 
insert into usuario(ci_usuario,nombre,apellido,email,telefono,contrasena,nacionalidad,fecha_nac,calle,numero,ciudad,ci_administrativo)
values(ci,nombre,apellido,email,telefono,ci,nacionalidad,fecha,calle,numero,ciudad,administrativo);

insert into administrativo(ci_administrativo,nro_funcionario,horas_trabajo_semanales)
values(ci,nro_fun,horas_trabajo);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `administrativo_cargar_analista` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `administrativo_cargar_analista`(in ci int(8), in nombre varchar(30), in apellido varchar(30), in email varchar(50), in telefono int(9), in nacionalidad varchar(40), in fecha date, in calle varchar(50), in numero int(6), in ciudad varchar(50), in administrativo int(8), in nro_fun int(5), in horas_trabajo int(4))
begin 
insert into usuario(ci_usuario,nombre,apellido,email,telefono,contrasena,nacionalidad,fecha_nac,calle,numero,ciudad,ci_administrativo)
values(ci,nombre,apellido,email,telefono,ci,nacionalidad,fecha,calle,numero,ciudad,administrativo);

insert into analista(ci_analista,nro_funcionario,horas_trabajo_semanales)
values(ci,nro_fun,horas_trabajo);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `administrativo_cargar_deportista` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `administrativo_cargar_deportista`(in ci int(8), in nombre varchar(30), in apellido varchar(30), in email varchar(50), in telefono int(9), in nacionalidad varchar(40), in fecha date, in calle varchar(50), in numero int(6), in ciudad varchar(50), in administrativo int(8),in carne_salu enum("SI","NO"),in grp varchar(6))
begin 
insert into usuario(ci_usuario,nombre,apellido,email,telefono,contrasena,nacionalidad,fecha_nac,calle,numero,ciudad,ci_administrativo)
values(ci,nombre,apellido,email,telefono,ci,nacionalidad,fecha,calle,numero,ciudad,administrativo);

insert into deportista(ci_deportista,carne_salud)
values(ci,carne_salu);

insert into grupo_deportista(ci_deportista,grupo)
values (ci,grp);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `administrativo_cargar_entrenador` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `administrativo_cargar_entrenador`(in ci int(8), in nombre varchar(30), in apellido varchar(30), in email varchar(50), in telefono int(9), in nacionalidad varchar(40), in fecha date, in calle varchar(50), in numero int(6), in ciudad varchar(50), in administrativo int(8), in nro_fun int(5), in horas_trabajo int(4),in grp varchar(6))
begin 
insert into usuario(ci_usuario,nombre,apellido,email,telefono,contrasena,nacionalidad,fecha_nac,calle,numero,ciudad,ci_administrativo)
values(ci,nombre,apellido,email,telefono,ci,nacionalidad,fecha,calle,numero,ciudad,administrativo);

insert into entrenador(ci_entrenador,nro_funcionario,horas_trabajo_semanales)
values(ci,nro_fun,horas_trabajo);

insert into grupo_entrenador(ci_entrenador,grupo)
values (ci,grp);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `administrativo_cargar_juez` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `administrativo_cargar_juez`(in ci int(8), in nombre varchar(30), in apellido varchar(30), in email varchar(50), in telefono int(9), in nacionalidad varchar(40), in fecha date, in calle varchar(50), in numero int(6), in ciudad varchar(50), in administrativo int(8),in horas_trabajo int(4),in carne_salu enum("SI","NO"), in exp int(2))
begin 
insert into usuario(ci_usuario,nombre,apellido,email,telefono,contrasena,nacionalidad,fecha_nac,calle,numero,ciudad,ci_administrativo)
values(ci,nombre,apellido,email,telefono,ci,nacionalidad,fecha,calle,numero,ciudad,administrativo);

insert into juez(ci_juez,carne_salud,horas_trabajo_semanales,experiencia)
values(ci,carne_salu,horas_trabajo,exp);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `administrativo_cargar_scout` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `administrativo_cargar_scout`(in ci int(8), in nombre varchar(30), in apellido varchar(30), in email varchar(50), in telefono int(9), in nacionalidad varchar(40), in fecha date, in calle varchar(50), in numero int(6), in ciudad varchar(50), in administrativo int(8),in exp int(2))
begin 
insert into usuario(ci_usuario,nombre,apellido,email,telefono,contrasena,nacionalidad,fecha_nac,calle,numero,ciudad,ci_administrativo)
values(ci,nombre,apellido,email,telefono,ci,nacionalidad,fecha,calle,numero,ciudad,administrativo);

insert into scout(ci_scout,experiencia)
values(ci,exp);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin_cargar_administrador` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin_cargar_administrador`(in ci int(8), in nombre varchar(30), in apellido varchar(30), in email varchar(50), in telefono int(9), in nacionalidad varchar(40), in fecha date, in calle varchar(50), in numero int(6), in ciudad varchar(50), in administrator int(8),in horas_trabajo int(4),in exp int(2))
begin 
insert into usuario(ci_usuario,nombre,apellido,email,telefono,contrasena,nacionalidad,fecha_nac,calle,numero,ciudad,ci_administrador)
values(ci,nombre,apellido,email,telefono,ci,nacionalidad,fecha,calle,numero,ciudad,administrator);

insert into administrador(ci_administrador,horas_trabajo_semanales,experiencia)
values(ci,horas_trabajo,exp);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin_cargar_administrativo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin_cargar_administrativo`(in ci int(8), in nombre varchar(30), in apellido varchar(30), in email varchar(50), in telefono int(9), in nacionalidad varchar(40), in fecha date, in calle varchar(50), in numero int(6), in ciudad varchar(50), in administrator int(8), in nro_fun int(5), in horas_trabajo int(4))
begin 
insert into usuario(ci_usuario,nombre,apellido,email,telefono,contrasena,nacionalidad,fecha_nac,calle,numero,ciudad,ci_administrador)
values(ci,nombre,apellido,email,telefono,ci,nacionalidad,fecha,calle,numero,ciudad,administrator);

insert into administrativo(ci_administrativo,nro_funcionario,horas_trabajo_semanales)
values(ci,nro_fun,horas_trabajo);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin_cargar_analista` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin_cargar_analista`(in ci int(8), in nombre varchar(30), in apellido varchar(30), in email varchar(50), in telefono int(9), in nacionalidad varchar(40), in fecha date, in calle varchar(50), in numero int(6), in ciudad varchar(50), in administrator int(8), in nro_fun int(5), in horas_trabajo int(4))
begin 
insert into usuario(ci_usuario,nombre,apellido,email,telefono,contrasena,nacionalidad,fecha_nac,calle,numero,ciudad,ci_administrador)
values(ci,nombre,apellido,email,telefono,ci,nacionalidad,fecha,calle,numero,ciudad,administrator);

insert into analista(ci_analista,nro_funcionario,horas_trabajo_semanales)
values(ci,nro_fun,horas_trabajo);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin_cargar_deportista` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin_cargar_deportista`(in ci int(8), in nombre varchar(30), in apellido varchar(30), in email varchar(50), in telefono int(9), in nacionalidad varchar(40), in fecha date, in calle varchar(50), in numero int(6), in ciudad varchar(50), in administrator int(8),in carne_salu enum("SI","NO"),in grp varchar(6))
begin 
insert into usuario(ci_usuario,nombre,apellido,email,telefono,contrasena,nacionalidad,fecha_nac,calle,numero,ciudad,ci_administrador)
values(ci,nombre,apellido,email,telefono,ci,nacionalidad,fecha,calle,numero,ciudad,administrator);

insert into deportista(ci_deportista,carne_salud)
values(ci,carne_salu);

insert into grupo_deportista(ci_deportista,grupo)
values (ci,grp);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin_cargar_entrenador` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin_cargar_entrenador`(in ci int(8), in nombre varchar(30), in apellido varchar(30), in email varchar(50), in telefono int(9), in nacionalidad varchar(40), in fecha date, in calle varchar(50), in numero int(6), in ciudad varchar(50), in administrator int(8), in nro_fun int(5), in horas_trabajo int(4),in grp varchar(6))
begin 
insert into usuario(ci_usuario,nombre,apellido,email,telefono,contrasena,nacionalidad,fecha_nac,calle,numero,ciudad,ci_administrador)
values(ci,nombre,apellido,email,telefono,ci,nacionalidad,fecha,calle,numero,ciudad,administrator);

insert into entrenador(ci_entrenador,nro_funcionario,horas_trabajo_semanales)
values(ci,nro_fun,horas_trabajo);

insert into grupo_entrenador(ci_entrenador,grupo)
values (ci,grp);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin_cargar_juez` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin_cargar_juez`(in ci int(8), in nombre varchar(30), in apellido varchar(30), in email varchar(50), in telefono int(9), in nacionalidad varchar(40), in fecha date, in calle varchar(50), in numero int(6), in ciudad varchar(50), in administrator int(8),in horas_trabajo int(4),in carne_salu enum("SI","NO"), in exp int(2))
begin 
insert into usuario(ci_usuario,nombre,apellido,email,telefono,contrasena,nacionalidad,fecha_nac,calle,numero,ciudad,ci_administrador)
values(ci,nombre,apellido,email,telefono,ci,nacionalidad,fecha,calle,numero,ciudad,administrator);

insert into juez(ci_juez,carne_salud,horas_trabajo_semanales,experiencia)
values(ci,carne_salu,horas_trabajo,exp);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin_cargar_scout` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin_cargar_scout`(in ci int(8), in nombre varchar(30), in apellido varchar(30), in email varchar(50), in telefono int(9), in nacionalidad varchar(40), in fecha date, in calle varchar(50), in numero int(6), in ciudad varchar(50), in administrator int(8),in exp int(2))
begin 
insert into usuario(ci_usuario,nombre,apellido,email,telefono,contrasena,nacionalidad,fecha_nac,calle,numero,ciudad,ci_administrador)
values(ci,nombre,apellido,email,telefono,ci,nacionalidad,fecha,calle,numero,ciudad,administrator);

insert into scout(ci_scout,experiencia)
values(ci,exp);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin_eliminar_admin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin_eliminar_admin`(in ci int(8))
begin 
DELETE FROM administrador
where ci_administrador=ci;

DELETE FROM usuario
where ci_usuario=ci;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin_eliminar_administrativo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin_eliminar_administrativo`(in ci int(8))
begin 
DELETE FROM administrativo
where ci_administrativo=ci;

DELETE FROM usuario
where ci_usuario=ci;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin_eliminar_analista` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin_eliminar_analista`(in ci int(8))
begin 
DELETE FROM analista
where ci_analista=ci;

DELETE FROM usuario
where ci_usuario=ci;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin_eliminar_deportista` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin_eliminar_deportista`(in ci int(8))
begin 
DELETE FROM deportista
where ci_deportista=ci;

DELETE FROM usuario
where ci_usuario=ci;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin_eliminar_entrenador` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin_eliminar_entrenador`(in ci int(8))
begin 
DELETE FROM entrenador
where ci_entrenador=ci;

DELETE FROM usuario
where ci_usuario=ci;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin_eliminar_juez` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin_eliminar_juez`(in ci int(8))
begin 
DELETE FROM juez
where ci_juez=ci;

DELETE FROM usuario
where ci_usuario=ci;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin_eliminar_scout` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin_eliminar_scout`(in ci int(8))
begin 
DELETE FROM scout
where ci_scout=ci;

DELETE FROM usuario
where ci_usuario=ci;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin_modificar_administrador` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin_modificar_administrador`(in cedula int(8),in nombr varchar(30), in ap varchar(30), in emai varchar(50), in tel int(9), in nacion varchar(50), in fecha date, in street varchar(50), in num int(5), in city varchar(50), in horas_trabajo int(3), in exp int(2))
begin 
UPDATE usuario 
SET ci_usuario=cedula, nombre=nombr, apellido=ap,email=emai,
	telefono=tel,nacionalidad=nacion,fecha_nac=fecha,calle=street,
    numero=num,ciudad=city
WHERE ci_usuario=cedula;

UPDATE administrador
SET experiencia=exp, horas_trabajo_semanales=horas_trabajo
WHERE ci_administrador=cedula;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin_modificar_administrativo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin_modificar_administrativo`(in cedula int(8),in nombr varchar(30), in ap varchar(30), in emai varchar(50), in tel int(9), in nacion varchar(50), in fecha date, in street varchar(50), in num int(5), in city varchar(50), in horas_trabajo int(3), in nro_fun int(4))
begin 
UPDATE usuario 
SET ci_usuario=cedula, nombre=nombr, apellido=ap,email=emai,
	telefono=tel,nacionalidad=nacion,fecha_nac=fecha,calle=street,
    numero=num,ciudad=city
WHERE ci_usuario=cedula;

UPDATE administrativo
SET nro_funcionario=nro_fun, horas_trabajo_semanales=horas_trabajo
WHERE ci_administrativo=cedula;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin_modificar_analista` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin_modificar_analista`(in cedula int(8),in nombr varchar(30), in ap varchar(30), in emai varchar(50), in tel int(9), in nacion varchar(50), in fecha date, in street varchar(50), in num int(5), in city varchar(50), in horas_trabajo int(3), in nro_fun int(5))
begin 
UPDATE usuario 
SET ci_usuario=cedula, nombre=nombr, apellido=ap,email=emai,
	telefono=tel,nacionalidad=nacion,fecha_nac=fecha,calle=street,
    numero=num,ciudad=city
WHERE ci_usuario=cedula;

UPDATE analista
SET nro_funcionario=nro_fun, horas_trabajo_semanales=horas_trabajo
WHERE ci_analista=cedula;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin_modificar_deportista` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin_modificar_deportista`(in cedula int(8),in nombr varchar(30), in ap varchar(30), in emai varchar(50), in tel int(9), in nacion varchar(50), in fecha date, in street varchar(50), in num int(5), in city varchar(50), in carne enum("SI","NO"), in grpo varchar(6))
begin 
UPDATE usuario 
SET ci_usuario=cedula, nombre=nombr, apellido=ap,email=emai,
	telefono=tel,nacionalidad=nacion,fecha_nac=fecha,calle=street,
    numero=num,ciudad=city
WHERE ci_usuario=cedula;

UPDATE deportista
SET carne_salud=carne
WHERE ci_deportista=cedula;

UPDATE grupo_deportista
SET grupo=grpo
WHERE ci_deportista=cedula;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin_modificar_entrenador` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin_modificar_entrenador`(in cedula int(8),in nombr varchar(30), in ap varchar(30), in emai varchar(50), in tel int(9), in nacion varchar(50), in fecha date, in street varchar(50), in num int(5), in city varchar(50),in grpo varchar(6), in nro_fun int(5), in horas_trabajo int(3))
begin 
UPDATE usuario 
SET ci_usuario=cedula, nombre=nombr, apellido=ap,email=emai,
	telefono=tel,nacionalidad=nacion,fecha_nac=fecha,calle=street,
    numero=num,ciudad=city
WHERE ci_usuario=cedula;

UPDATE entrenador
SET nro_funcionario=nro_fun, horas_trabajo_semanales=horas_trabajo
WHERE ci_entrenador=cedula;

UPDATE grupo_entrenador
SET grupo=grpo
WHERE ci_entrenador=cedula;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin_modificar_juez` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin_modificar_juez`(in cedula int(8),in nombr varchar(30), in ap varchar(30), in emai varchar(50), in tel int(9), in nacion varchar(50), in fecha date, in street varchar(50), in num int(5), in city varchar(50),in exp int(3), in carne enum("SI","NO"), in horas_trabajo int(3))
begin 
UPDATE usuario 
SET ci_usuario=cedula, nombre=nombr, apellido=ap,email=emai,
	telefono=tel,nacionalidad=nacion,fecha_nac=fecha,calle=street,
    numero=num,ciudad=city
WHERE ci_usuario=cedula;

UPDATE juez
SET carne_salud=carne, horas_trabajo_semanales=horas_trabajo, 
	experiencia=exp 
WHERE ci_juez=cedula;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin_modificar_scout` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin_modificar_scout`(in cedula int(8),in nombr varchar(30), in ap varchar(30), in emai varchar(50), in tel int(9), in nacion varchar(50), in fecha date, in street varchar(50), in num int(5), in city varchar(50),in exp int(3))
begin 
UPDATE usuario 
SET ci_usuario=cedula, nombre=nombr, apellido=ap,email=emai,
	telefono=tel,nacionalidad=nacion,fecha_nac=fecha,calle=street,
    numero=num,ciudad=city
WHERE ci_usuario=cedula;

UPDATE scout
SET experiencia=exp 
WHERE ci_scout=cedula;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `estadistica_futbolista_cargar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `estadistica_futbolista_cargar`(in anot int(3),in pase int(4), in asist int(4), in falta int(4),in tiro int(4),in ci_depor int(8),in nombre_eq varchar(30),in id_part int(4), in ci_entre int(8))
begin 
insert into estadistica(anotaciones,pases,asistencias,faltas,quites,tiros,ci_deportista,nombre_equipo,id_partido,ci_entrenador)
values(anot,pase,asist,falta,tiro,ci_depor,nombre_eq,id_part,ci_entre);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-08 17:04:27
