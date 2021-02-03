-- MySQL dump 10.13  Distrib 8.0.23, for Linux (x86_64)
--
-- Host: localhost    Database: agribray
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `idadmin` int NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL,
  `password` varchar(128) NOT NULL,
  PRIMARY KEY (`idadmin`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'l.leguay@wanadoo.fr','123456');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `idclients` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(64) NOT NULL,
  `prenom` varchar(45) NOT NULL,
  `mail` varchar(64) DEFAULT NULL,
  `tel` varchar(12) NOT NULL,
  `societe` varchar(128) DEFAULT NULL,
  `cp` varchar(12) NOT NULL,
  `ville` varchar(64) DEFAULT NULL,
  `photos` varchar(128) DEFAULT NULL,
  `temoignages_idtemoignages` int NOT NULL,
  `admin_idusers` int NOT NULL,
  PRIMARY KEY (`idclients`,`temoignages_idtemoignages`,`admin_idusers`),
  KEY `fk_clients_temoignages1_idx` (`temoignages_idtemoignages`),
  KEY `fk_clients_admin1_idx` (`admin_idusers`),
  CONSTRAINT `fk_clients_admin1` FOREIGN KEY (`admin_idusers`) REFERENCES `admin` (`idadmin`),
  CONSTRAINT `fk_clients_temoignages1` FOREIGN KEY (`temoignages_idtemoignages`) REFERENCES `temoignages` (`idtemoignages`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (3,'Philippin','Jean-Michel','jm-philippin','0630151478','philippin céréales','60112','Vrocourt',NULL,1,1);
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients_has_travaux`
--

DROP TABLE IF EXISTS `clients_has_travaux`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients_has_travaux` (
  `clients_idclients` int NOT NULL,
  `clients_temoignages_idtemoignages` int NOT NULL,
  `travaux_idtravaux` int NOT NULL,
  PRIMARY KEY (`clients_idclients`,`clients_temoignages_idtemoignages`,`travaux_idtravaux`),
  KEY `fk_clients_has_travaux_travaux1_idx` (`travaux_idtravaux`),
  KEY `fk_clients_has_travaux_clients1_idx` (`clients_idclients`,`clients_temoignages_idtemoignages`),
  CONSTRAINT `fk_clients_has_travaux_clients1` FOREIGN KEY (`clients_idclients`, `clients_temoignages_idtemoignages`) REFERENCES `clients` (`idclients`, `temoignages_idtemoignages`),
  CONSTRAINT `fk_clients_has_travaux_travaux1` FOREIGN KEY (`travaux_idtravaux`) REFERENCES `travaux` (`idtravaux`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients_has_travaux`
--

LOCK TABLES `clients_has_travaux` WRITE;
/*!40000 ALTER TABLE `clients_has_travaux` DISABLE KEYS */;
/*!40000 ALTER TABLE `clients_has_travaux` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materiels`
--

DROP TABLE IF EXISTS `materiels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materiels` (
  `idmateriels` int NOT NULL AUTO_INCREMENT,
  `type` varchar(128) NOT NULL,
  `marque` varchar(64) DEFAULT NULL,
  `caracteristiques` varchar(128) DEFAULT NULL,
  `nombre` int DEFAULT NULL,
  `image1` varchar(128) DEFAULT NULL,
  `image2` varchar(128) DEFAULT NULL,
  `image3` varchar(128) DEFAULT NULL,
  `image4` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`idmateriels`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materiels`
--

LOCK TABLES `materiels` WRITE;
/*!40000 ALTER TABLE `materiels` DISABLE KEYS */;
INSERT INTO `materiels` VALUES (21,'Tracteur',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,'Charrue',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23,'Camion',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(24,'Arracheuses à betteraves',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(25,'Arracheuse à pomme de terre',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(26,'Moissonneuse-batteuse',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(27,'Batteuse',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(28,'Chariot élévateur',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(29,'Chariot téléscopique',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(30,'Tracto-benne',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(31,'Ampliroll',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(32,'Remorque benne',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(33,'Remorque tapis',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(34,'Remorque auto-chargeuse',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(35,'Ensileuse',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(36,'Dechaumeuse',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(37,'Herses',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(38,'Bineuse',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(39,'Becheuse',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(40,'Décompacteur',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(41,'Draineuse-trancheuse',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(42,'Cueillir à maïs',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(43,'Semoirs',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(44,'Andaineur',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(45,'Enrubanneuse',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(46,'Faucheuse',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(47,'Faneuse',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(48,'Pulvérisateurs',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(49,'Presse',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(50,'Epandeur',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(51,'Transporteur à vis',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(52,'Transbordeur',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(53,'Pailleuse',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(54,'Drone',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(55,'Citerne',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `materiels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temoignages`
--

DROP TABLE IF EXISTS `temoignages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `temoignages` (
  `idtemoignages` int NOT NULL AUTO_INCREMENT,
  `text` varchar(512) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`idtemoignages`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temoignages`
--

LOCK TABLES `temoignages` WRITE;
/*!40000 ALTER TABLE `temoignages` DISABLE KEYS */;
INSERT INTO `temoignages` VALUES (1,'J\'ai fait appel à Agribray et j\'ai été très satisfait de la prestations de semis réalisée','2019-09-30'),(2,'La saison et le rendement ont été fantastiques grâce à la qualité des machines et au professionnalisme de l\'aquipe d\'Agribray','2018-08-15');
/*!40000 ALTER TABLE `temoignages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `travaux`
--

DROP TABLE IF EXISTS `travaux`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `travaux` (
  `idtravaux` int NOT NULL AUTO_INCREMENT,
  `type` varchar(64) NOT NULL,
  `image1` varchar(128) DEFAULT NULL,
  `image2` varchar(128) DEFAULT NULL,
  `image3` varchar(128) DEFAULT NULL,
  `image4` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`idtravaux`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travaux`
--

LOCK TABLES `travaux` WRITE;
/*!40000 ALTER TABLE `travaux` DISABLE KEYS */;
INSERT INTO `travaux` VALUES (17,'Traction',NULL,NULL,NULL,NULL),(18,'Levage de charge',NULL,NULL,NULL,NULL),(19,'Travail du sol',NULL,NULL,NULL,NULL),(20,'Semis',NULL,NULL,NULL,NULL),(21,'Fertilisation, amendement et protection des cultures',NULL,NULL,NULL,NULL),(22,'Récolte des fourrages',NULL,NULL,NULL,NULL),(23,'Récolte des céréales',NULL,NULL,NULL,NULL),(24,'Récolte des betteraves',NULL,NULL,NULL,NULL),(25,'Récolte des pommes de terre',NULL,NULL,NULL,NULL),(26,'Entretien des parcelles',NULL,NULL,NULL,NULL),(27,'Elevage',NULL,NULL,NULL,NULL),(28,'Atelier',NULL,NULL,NULL,NULL),(29,'Traitements',NULL,NULL,NULL,NULL),(30,'Manutentions',NULL,NULL,NULL,NULL),(31,'Transports',NULL,NULL,NULL,NULL),(32,'Autres travaux',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `travaux` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `travaux_has_materiels`
--

DROP TABLE IF EXISTS `travaux_has_materiels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `travaux_has_materiels` (
  `travaux_idtravaux` int NOT NULL,
  `materiels_idmateriels` int NOT NULL,
  PRIMARY KEY (`travaux_idtravaux`,`materiels_idmateriels`),
  KEY `fk_travaux_has_materiels_materiels1_idx` (`materiels_idmateriels`),
  KEY `fk_travaux_has_materiels_travaux_idx` (`travaux_idtravaux`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travaux_has_materiels`
--

LOCK TABLES `travaux_has_materiels` WRITE;
/*!40000 ALTER TABLE `travaux_has_materiels` DISABLE KEYS */;
/*!40000 ALTER TABLE `travaux_has_materiels` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-03 14:55:17
