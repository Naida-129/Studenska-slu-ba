-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: studenska_sluzba
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `dugovanje`
--

DROP TABLE IF EXISTS `dugovanje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dugovanje` (
  `id_dugovanje` int NOT NULL AUTO_INCREMENT,
  `ukupno` varchar(45) NOT NULL,
  `placeno(da/ne)` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_dugovanje`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dugovanje`
--

LOCK TABLES `dugovanje` WRITE;
/*!40000 ALTER TABLE `dugovanje` DISABLE KEYS */;
/*!40000 ALTER TABLE `dugovanje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `godina_studiranja`
--

DROP TABLE IF EXISTS `godina_studiranja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `godina_studiranja` (
  `id_godine` int NOT NULL AUTO_INCREMENT,
  `Broj` int DEFAULT NULL,
  PRIMARY KEY (`id_godine`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `godina_studiranja`
--

LOCK TABLES `godina_studiranja` WRITE;
/*!40000 ALTER TABLE `godina_studiranja` DISABLE KEYS */;
/*!40000 ALTER TABLE `godina_studiranja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupe`
--

DROP TABLE IF EXISTS `grupe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grupe` (
  `id_grupe` int NOT NULL AUTO_INCREMENT,
  `id_studenta` int NOT NULL,
  `id_godine` int NOT NULL,
  PRIMARY KEY (`id_grupe`),
  KEY `id_grupastudenata` (`id_studenta`),
  KEY `id_grupafk` (`id_godine`),
  CONSTRAINT `id_grupafk` FOREIGN KEY (`id_godine`) REFERENCES `godina_studiranja` (`id_godine`),
  CONSTRAINT `id_grupastudenata` FOREIGN KEY (`id_studenta`) REFERENCES `registar_studenata` (`id_studenta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupe`
--

LOCK TABLES `grupe` WRITE;
/*!40000 ALTER TABLE `grupe` DISABLE KEYS */;
/*!40000 ALTER TABLE `grupe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ispit`
--

DROP TABLE IF EXISTS `ispit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ispit` (
  `id_ispit` int NOT NULL AUTO_INCREMENT,
  `id_predmet` int NOT NULL,
  `id_student` int NOT NULL,
  `id_prijavljenih` int NOT NULL,
  `termin` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_ispit`),
  KEY `id_ispitfk` (`id_predmet`),
  KEY `id_ispitfk2` (`id_student`),
  KEY `id_ispitfk3` (`id_prijavljenih`),
  CONSTRAINT `id_ispitfk` FOREIGN KEY (`id_predmet`) REFERENCES `predmet` (`id_predmet`),
  CONSTRAINT `id_ispitfk2` FOREIGN KEY (`id_student`) REFERENCES `registar_studenata` (`id_studenta`),
  CONSTRAINT `id_ispitfk3` FOREIGN KEY (`id_prijavljenih`) REFERENCES `prijavljeni_ispit` (`id_prijavljeni_ispit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ispit`
--

LOCK TABLES `ispit` WRITE;
/*!40000 ALTER TABLE `ispit` DISABLE KEYS */;
/*!40000 ALTER TABLE `ispit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `komentar`
--

DROP TABLE IF EXISTS `komentar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `komentar` (
  `id_komentar` int NOT NULL,
  `komentar` longtext,
  `komentarcol` varchar(45) DEFAULT NULL,
  `id_student` int NOT NULL,
  `id_profesor` int NOT NULL,
  `id_predmeta` int NOT NULL,
  PRIMARY KEY (`id_komentar`),
  KEY `komentar` (`id_student`),
  KEY `komentarfl2` (`id_profesor`),
  KEY `komentarfk3` (`id_predmeta`),
  CONSTRAINT `komentar` FOREIGN KEY (`id_student`) REFERENCES `registar_studenata` (`id_studenta`),
  CONSTRAINT `komentarfk3` FOREIGN KEY (`id_predmeta`) REFERENCES `predmet` (`id_predmet`),
  CONSTRAINT `komentarfl2` FOREIGN KEY (`id_profesor`) REFERENCES `registar_uposlenika` (`id_uposlenika`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `komentar`
--

LOCK TABLES `komentar` WRITE;
/*!40000 ALTER TABLE `komentar` DISABLE KEYS */;
/*!40000 ALTER TABLE `komentar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `konacna_ocjena`
--

DROP TABLE IF EXISTS `konacna_ocjena`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `konacna_ocjena` (
  `idkonacna_ocjena` int NOT NULL AUTO_INCREMENT,
  `ukupno_bodova` int DEFAULT NULL,
  `ocjena` int DEFAULT NULL,
  `id_predmeta` int NOT NULL,
  `student` int NOT NULL,
  PRIMARY KEY (`idkonacna_ocjena`),
  KEY `konacna_ocjenafk` (`id_predmeta`),
  KEY `konacna_studentfk` (`student`),
  CONSTRAINT `konacna_ocjenafk` FOREIGN KEY (`id_predmeta`) REFERENCES `predmet` (`id_predmet`),
  CONSTRAINT `konacna_studentfk` FOREIGN KEY (`student`) REFERENCES `registar_studenata` (`id_studenta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `konacna_ocjena`
--

LOCK TABLES `konacna_ocjena` WRITE;
/*!40000 ALTER TABLE `konacna_ocjena` DISABLE KEYS */;
/*!40000 ALTER TABLE `konacna_ocjena` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nivo_pristupa`
--

DROP TABLE IF EXISTS `nivo_pristupa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nivo_pristupa` (
  `idnivo_pristupa` int NOT NULL AUTO_INCREMENT,
  `Naziv_pristupa` varchar(45) DEFAULT NULL,
  `id_studenta` int DEFAULT NULL,
  `id_uposlenika` int DEFAULT NULL,
  PRIMARY KEY (`idnivo_pristupa`),
  KEY `id_nivo_student` (`id_studenta`),
  KEY `id_nivo_uposlenik` (`id_uposlenika`),
  CONSTRAINT `id_nivo_student` FOREIGN KEY (`id_studenta`) REFERENCES `registar_studenata` (`id_studenta`),
  CONSTRAINT `id_nivo_uposlenik` FOREIGN KEY (`id_uposlenika`) REFERENCES `registar_uposlenika` (`id_uposlenika`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nivo_pristupa`
--

LOCK TABLES `nivo_pristupa` WRITE;
/*!40000 ALTER TABLE `nivo_pristupa` DISABLE KEYS */;
/*!40000 ALTER TABLE `nivo_pristupa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `predavanja`
--

DROP TABLE IF EXISTS `predavanja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `predavanja` (
  `id_predavanja` int NOT NULL AUTO_INCREMENT,
  `termin` varchar(45) DEFAULT NULL,
  `predavanjacol` varchar(45) DEFAULT NULL,
  `id_uposlenika` int NOT NULL,
  `id_sale` int NOT NULL,
  PRIMARY KEY (`id_predavanja`),
  KEY `id_predavanjefk` (`id_uposlenika`),
  KEY `id_predavanjefk2` (`id_sale`),
  CONSTRAINT `id_predavanjefk` FOREIGN KEY (`id_uposlenika`) REFERENCES `registar_uposlenika` (`id_uposlenika`),
  CONSTRAINT `id_predavanjefk2` FOREIGN KEY (`id_sale`) REFERENCES `sale` (`id_sale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `predavanja`
--

LOCK TABLES `predavanja` WRITE;
/*!40000 ALTER TABLE `predavanja` DISABLE KEYS */;
/*!40000 ALTER TABLE `predavanja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `predmet`
--

DROP TABLE IF EXISTS `predmet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `predmet` (
  `id_predmet` int NOT NULL AUTO_INCREMENT,
  `naziv` varchar(20) DEFAULT NULL,
  `id_profesora` int NOT NULL,
  PRIMARY KEY (`id_predmet`),
  KEY `id_predmetafk` (`id_profesora`),
  CONSTRAINT `id_predmetafk` FOREIGN KEY (`id_profesora`) REFERENCES `registar_uposlenika` (`id_uposlenika`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `predmet`
--

LOCK TABLES `predmet` WRITE;
/*!40000 ALTER TABLE `predmet` DISABLE KEYS */;
/*!40000 ALTER TABLE `predmet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prijavljeni_ispit`
--

DROP TABLE IF EXISTS `prijavljeni_ispit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prijavljeni_ispit` (
  `id_prijavljeni_ispit` int NOT NULL AUTO_INCREMENT,
  `ukupan_broj` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_prijavljeni_ispit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prijavljeni_ispit`
--

LOCK TABLES `prijavljeni_ispit` WRITE;
/*!40000 ALTER TABLE `prijavljeni_ispit` DISABLE KEYS */;
/*!40000 ALTER TABLE `prijavljeni_ispit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registar_studenata`
--

DROP TABLE IF EXISTS `registar_studenata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registar_studenata` (
  `id_studenta` int NOT NULL AUTO_INCREMENT,
  `ime` varchar(25) NOT NULL,
  `prezime` varchar(30) NOT NULL,
  `broj` char(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `adresa` varchar(50) NOT NULL,
  `korisnicko_ime` varchar(25) NOT NULL,
  `datum_rodenja` date NOT NULL,
  `id_smjera` int NOT NULL,
  PRIMARY KEY (`id_studenta`),
  KEY `id_smjerstudentafk` (`id_smjera`),
  CONSTRAINT `id_smjerstudentafk` FOREIGN KEY (`id_smjera`) REFERENCES `smjer` (`id_smjer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registar_studenata`
--

LOCK TABLES `registar_studenata` WRITE;
/*!40000 ALTER TABLE `registar_studenata` DISABLE KEYS */;
/*!40000 ALTER TABLE `registar_studenata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registar_uposlenika`
--

DROP TABLE IF EXISTS `registar_uposlenika`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registar_uposlenika` (
  `id_uposlenika` int NOT NULL AUTO_INCREMENT,
  `ime` tinytext,
  `prezime` tinytext,
  `email` varchar(45) DEFAULT NULL,
  `broj_telefona` varchar(45) DEFAULT NULL,
  `adresa` varchar(45) DEFAULT NULL,
  `datum_zaposlenja` date DEFAULT NULL,
  PRIMARY KEY (`id_uposlenika`),
  UNIQUE KEY `id_uposlenika_UNIQUE` (`id_uposlenika`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registar_uposlenika`
--

LOCK TABLES `registar_uposlenika` WRITE;
/*!40000 ALTER TABLE `registar_uposlenika` DISABLE KEYS */;
/*!40000 ALTER TABLE `registar_uposlenika` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rezultati_ispita`
--

DROP TABLE IF EXISTS `rezultati_ispita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rezultati_ispita` (
  `idrezultati_ispita` int NOT NULL AUTO_INCREMENT,
  `Broj_bodova` int DEFAULT NULL,
  `Ukupan_broj_bodova` int DEFAULT NULL,
  `id_studenta` int NOT NULL,
  `id_predmeta` int NOT NULL,
  `id_profesora` int NOT NULL,
  `id_ispita` int NOT NULL,
  PRIMARY KEY (`idrezultati_ispita`),
  KEY `id_rezultat` (`id_studenta`),
  KEY `id_rezultatfk2` (`id_predmeta`),
  KEY `id_rezultatfk3` (`id_profesora`),
  KEY `id_rezultatfk4` (`id_ispita`),
  CONSTRAINT `id_rezultat` FOREIGN KEY (`id_studenta`) REFERENCES `registar_studenata` (`id_studenta`),
  CONSTRAINT `id_rezultatfk2` FOREIGN KEY (`id_predmeta`) REFERENCES `predmet` (`id_predmet`),
  CONSTRAINT `id_rezultatfk3` FOREIGN KEY (`id_profesora`) REFERENCES `registar_uposlenika` (`id_uposlenika`),
  CONSTRAINT `id_rezultatfk4` FOREIGN KEY (`id_ispita`) REFERENCES `ispit` (`id_ispit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rezultati_ispita`
--

LOCK TABLES `rezultati_ispita` WRITE;
/*!40000 ALTER TABLE `rezultati_ispita` DISABLE KEYS */;
/*!40000 ALTER TABLE `rezultati_ispita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale`
--

DROP TABLE IF EXISTS `sale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sale` (
  `id_sale` int NOT NULL AUTO_INCREMENT,
  `broj_sale` int DEFAULT NULL,
  PRIMARY KEY (`id_sale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale`
--

LOCK TABLES `sale` WRITE;
/*!40000 ALTER TABLE `sale` DISABLE KEYS */;
/*!40000 ALTER TABLE `sale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smjer`
--

DROP TABLE IF EXISTS `smjer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `smjer` (
  `id_smjer` int NOT NULL AUTO_INCREMENT,
  `naziv_smjera` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_smjer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smjer`
--

LOCK TABLES `smjer` WRITE;
/*!40000 ALTER TABLE `smjer` DISABLE KEYS */;
/*!40000 ALTER TABLE `smjer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ugovor`
--

DROP TABLE IF EXISTS `ugovor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ugovor` (
  `id_ugovora` int NOT NULL AUTO_INCREMENT,
  `datum_potpisivanja` date DEFAULT NULL,
  `datum_isteka` date DEFAULT NULL,
  `id_dugovanje` int NOT NULL,
  `student` int NOT NULL,
  PRIMARY KEY (`id_ugovora`),
  KEY `id_ugovorfk` (`id_dugovanje`),
  KEY `ugovor_student` (`student`),
  CONSTRAINT `id_ugovorfk` FOREIGN KEY (`id_dugovanje`) REFERENCES `dugovanje` (`id_dugovanje`),
  CONSTRAINT `ugovor_student` FOREIGN KEY (`student`) REFERENCES `registar_studenata` (`id_studenta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ugovor`
--

LOCK TABLES `ugovor` WRITE;
/*!40000 ALTER TABLE `ugovor` DISABLE KEYS */;
/*!40000 ALTER TABLE `ugovor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zadaca`
--

DROP TABLE IF EXISTS `zadaca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zadaca` (
  `id_zadaca` int NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  `broj_bodova` int DEFAULT NULL,
  `id_komentara` int NOT NULL,
  `student` int NOT NULL,
  `predmet` int NOT NULL,
  PRIMARY KEY (`id_zadaca`),
  KEY `komentar_zadaca` (`id_komentara`),
  KEY `komentar_student` (`student`),
  KEY `komentar_predmet` (`predmet`),
  CONSTRAINT `komentar_predmet` FOREIGN KEY (`predmet`) REFERENCES `predmet` (`id_predmet`),
  CONSTRAINT `komentar_student` FOREIGN KEY (`student`) REFERENCES `registar_studenata` (`id_studenta`),
  CONSTRAINT `komentar_zadaca` FOREIGN KEY (`id_komentara`) REFERENCES `komentar` (`id_komentar`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zadaca`
--

LOCK TABLES `zadaca` WRITE;
/*!40000 ALTER TABLE `zadaca` DISABLE KEYS */;
/*!40000 ALTER TABLE `zadaca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zahtjevi`
--

DROP TABLE IF EXISTS `zahtjevi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zahtjevi` (
  `id_zahtjeva` int NOT NULL AUTO_INCREMENT,
  `svrha` varchar(30) NOT NULL,
  `datum_predaje` date NOT NULL,
  `id_studenta` int NOT NULL,
  PRIMARY KEY (`id_zahtjeva`),
  KEY `student_idfk` (`id_studenta`),
  CONSTRAINT `student_idfk` FOREIGN KEY (`id_studenta`) REFERENCES `registar_studenata` (`id_studenta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zahtjevi`
--

LOCK TABLES `zahtjevi` WRITE;
/*!40000 ALTER TABLE `zahtjevi` DISABLE KEYS */;
/*!40000 ALTER TABLE `zahtjevi` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-29 13:36:43
