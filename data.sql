-- MySQL dump 10.13  Distrib 5.5.45, for Win64 (x86)
--
-- Host: localhost    Database: db_rouen
-- ------------------------------------------------------
-- Server version	5.5.45

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `client_products`
--

DROP TABLE IF EXISTS `client_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `client_product-unique` (`client_id`,`product_id`),
  KEY `client_products_product_id_foreign` (`product_id`),
  CONSTRAINT `client_products_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  CONSTRAINT `client_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_products`
--

LOCK TABLES `client_products` WRITE;
/*!40000 ALTER TABLE `client_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `superviser_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `clients_superviser_id_foreign` (`superviser_id`),
  CONSTRAINT `clients_superviser_id_foreign` FOREIGN KEY (`superviser_id`) REFERENCES `suppliers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `connection` text COLLATE utf8_unicode_ci NOT NULL,
  `queue` text COLLATE utf8_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2021_04_22_102455_create_suppliers_table',1),(5,'2021_04_22_134510_create_supervisers_table',1),(6,'2021_04_22_140725_create_teams_table',1),(7,'2021_04_22_152323_create_team_members_table',1),(8,'2021_04_28_100240_create_products_table',1),(9,'2021_04_29_080248_create_stocks_table',1),(10,'2021_04_29_102842_create_mouvments_table',1),(11,'2021_05_16_124935_create_clients_table',1),(12,'2021_05_16_151218_create_client_products_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mouvments`
--

DROP TABLE IF EXISTS `mouvments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mouvments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `action` enum('IN','OUT') COLLATE utf8_unicode_ci NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `quantity` int(11) NOT NULL,
  `note` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `team_member_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mouvments_product_id_foreign` (`product_id`),
  KEY `mouvments_team_member_id_foreign` (`team_member_id`),
  KEY `mouvments_user_id_foreign` (`user_id`),
  CONSTRAINT `mouvments_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `mouvments_team_member_id_foreign` FOREIGN KEY (`team_member_id`) REFERENCES `team_members` (`id`),
  CONSTRAINT `mouvments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mouvments`
--

LOCK TABLES `mouvments` WRITE;
/*!40000 ALTER TABLE `mouvments` DISABLE KEYS */;
INSERT INTO `mouvments` VALUES (1,'IN',4,2,NULL,NULL,1,'2021-05-27 09:10:07','2021-05-27 09:10:07'),(2,'OUT',4,2,'',2,1,'2021-05-27 09:27:24','2021-05-27 09:27:24'),(3,'IN',3,10,NULL,NULL,1,'2021-05-27 09:47:32','2021-05-27 09:47:32'),(4,'IN',3,20,NULL,NULL,1,'2021-05-27 09:48:08','2021-05-27 09:48:08'),(5,'IN',4,15,NULL,NULL,1,'2021-05-27 09:48:09','2021-05-27 09:48:09'),(6,'OUT',3,2,'',2,1,'2021-05-27 09:48:53','2021-05-27 09:48:53'),(7,'OUT',4,1,'',2,1,'2021-05-27 09:48:53','2021-05-27 09:48:53'),(8,'OUT',3,1,'',2,1,'2021-05-27 11:26:16','2021-05-27 11:26:16'),(9,'OUT',4,0,'',2,1,'2021-05-27 11:26:16','2021-05-27 11:26:16');
/*!40000 ALTER TABLE `mouvments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `reference` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `brand` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alert` int(11) NOT NULL,
  `supplier_id` bigint(20) unsigned DEFAULT NULL,
  `price` double NOT NULL,
  `service` enum('Menuiserie','Peinture','Sol','MultiService') COLLATE utf8_unicode_ci NOT NULL,
  `nature` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `unit` enum('L','mL','kg','rlx','pcs','m2','tine','rouleau') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_reference_unique` (`reference`),
  KEY `products_supplier_id_foreign` (`supplier_id`),
  CONSTRAINT `products_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (2,'A-0030-Z','Meuble évier Liberty',NULL,1,NULL,48.77,'MultiService','Meubles','pcs','2021-05-27 08:46:45','2021-05-27 08:46:45'),(3,'A-0040-Z','Aquaryl Satin 16l','AQUARYL',8,1,4,'Peinture','Meubles','tine','2021-05-27 08:47:29','2021-05-27 11:29:46'),(4,'A-0050-Z','Aquaryl Mat 16l','AQUARYL',1,NULL,3.8,'Peinture','Peinture','tine','2021-05-27 08:48:15','2021-05-27 08:48:15'),(5,'25206013','TARKETT Habitat','Osca',8,4,7.09,'Sol','Linos','m2','2021-05-27 11:36:27','2021-05-27 11:36:27'),(6,'25213008','TARKETT Habitat Genius','Osca',8,4,10.18,'Sol','Linos','m2','2021-05-27 14:11:26','2021-05-27 14:11:26'),(7,'25212005','TARKETT Habitat Genius SS4','Osca',8,4,10.18,'Sol','Linos','m2','2021-05-27 14:13:52','2021-05-27 14:13:52'),(8,'123','TARKETT Lame','Seigneurie',8,5,10,'Sol','Linos','m2','2021-05-28 05:08:55','2021-05-28 05:08:55'),(9,'1234','TX Habitat Trend OAK','Seigneurie',8,5,7.2,'Sol','Linos','m2','2021-05-28 05:16:12','2021-05-28 05:16:12'),(10,'12345','TX Habitat Kiruma','Seigneurie',8,5,7.2,'Sol','Linos','m2','2021-05-28 05:18:30','2021-05-28 05:20:47'),(11,'3wsm12','ALLURA DECIBEL 0.35','Osca',8,4,13.75,'Sol','Linos','m2','2021-05-28 05:21:48','2021-05-28 05:21:48'),(12,'123456','ARDASOL','Osca',8,4,7.95,'Sol','Linos','m2','2021-05-28 05:22:28','2021-05-28 05:22:28'),(13,'1234567','ARDASOL Fibré','Osca',8,4,23,'Sol','Linos','m2','2021-05-28 05:24:00','2021-05-28 05:24:00'),(14,'25128501','ACCENT EXCELLENCE','Osca',8,4,18.59,'Sol','Linos','m2','2021-05-28 05:24:55','2021-05-28 05:24:55'),(15,'25133501','TX EXCELLENCE','Osca',8,4,18.59,'Sol','Linos','m2','2021-05-28 05:25:36','2021-05-28 05:25:36'),(16,'01','TASSEAU',NULL,8,6,1.48,'Menuiserie','Bois','pcs','2021-05-28 05:26:47','2021-05-28 05:26:47'),(17,'012','PLINTHE 70 Sapin',NULL,8,6,0.6,'Menuiserie','Bois','mL','2021-05-28 05:28:32','2021-05-28 05:28:32'),(18,'0123','PLINTHE 110 Sapin',NULL,8,6,1.29,'Menuiserie','Bois','mL','2021-05-28 05:29:21','2021-05-28 05:29:21'),(19,'01234','CHAMPLAT 6X35',NULL,8,6,0.56,'Menuiserie','Bois','mL','2021-05-28 05:30:21','2021-05-28 05:30:21'),(20,'012345','BAGUETTE Angle 20X20',NULL,8,6,1.33,'Menuiserie','Bois','pcs','2021-05-28 05:31:57','2021-05-28 05:31:57'),(21,'0123456','BAGUETTE Angle 35X35',NULL,8,6,2.26,'Menuiserie','Bois','pcs','2021-05-28 05:32:52','2021-05-28 05:32:52'),(22,'01234567','BA 13 Standard',NULL,8,6,2.12,'Menuiserie','Bois','m2','2021-05-28 05:34:04','2021-05-28 05:34:04'),(23,'012345678','PANNEAU OSB 12mm 3.25*1.25',NULL,8,6,4.42,'Menuiserie','Panneaux','m2','2021-05-28 05:36:25','2021-05-28 05:36:25'),(24,'0123456789','PANNEAU Contreplaque 10mm 2.5*1.22',NULL,8,6,11.41,'Menuiserie','Panneaux','m2','2021-05-28 05:45:50','2021-05-28 05:45:50'),(25,'23','PANNEAU CP15',NULL,8,6,15.16,'Menuiserie','Panneaux','m2','2021-05-28 05:46:49','2021-05-28 05:46:49'),(26,'234','PANNEAU Médium 10mm',NULL,8,6,6.04,'Menuiserie','Panneaux','m2','2021-05-28 06:19:02','2021-05-28 06:19:02'),(27,'2345','PANNEAU MDF 16mm Blanc 2.44*1.22',NULL,8,6,7.84,'Menuiserie','Panneaux','m2','2021-05-28 06:20:06','2021-05-28 06:20:06'),(28,'23456','PANNEAU Médium 18 mm',NULL,8,6,8.78,'Menuiserie','Panneaux','m2','2021-05-28 06:20:58','2021-05-28 06:20:58'),(29,'930','HUISSERIE 80',NULL,8,6,110.44,'Menuiserie','Dalles','pcs','2021-05-28 06:22:51','2021-05-28 06:22:51'),(30,'Gypton Quatro 20','DALLE Plafond 600*600',NULL,8,7,17.86,'Menuiserie','Dalles','m2','2021-05-28 06:23:40','2021-05-28 06:23:40'),(31,'gorteya','DALLE Plafond 600*600',NULL,8,7,7.57,'Menuiserie','Dalles','m2','2021-05-28 06:24:14','2021-05-28 06:24:14'),(32,'Gypton Quatro 50','DALLE Plafond 600*600',NULL,8,7,22.54,'Menuiserie','Dalles','m2','2021-05-28 06:24:50','2021-05-28 06:24:50'),(33,'eklor','DALLE Plafond 600*600',NULL,8,7,7.08,'Menuiserie','Dalles','m2','2021-05-28 06:25:41','2021-05-28 06:25:41');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stocks`
--

DROP TABLE IF EXISTS `stocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stocks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned NOT NULL,
  `value` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `stocks_product_id_unique` (`product_id`),
  CONSTRAINT `stocks_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stocks`
--

LOCK TABLES `stocks` WRITE;
/*!40000 ALTER TABLE `stocks` DISABLE KEYS */;
INSERT INTO `stocks` VALUES (2,2,0,'2021-05-27 08:46:45','2021-05-27 08:46:45'),(3,3,27,'2021-05-27 08:47:29','2021-05-27 11:26:16'),(4,4,14,'2021-05-27 08:48:15','2021-05-27 09:48:53'),(5,5,0,'2021-05-27 11:36:27','2021-05-27 11:36:27'),(6,6,0,'2021-05-27 14:11:26','2021-05-27 14:11:26'),(7,7,0,'2021-05-27 14:13:52','2021-05-27 14:13:52'),(8,8,0,'2021-05-28 05:08:55','2021-05-28 05:08:55'),(9,9,0,'2021-05-28 05:16:12','2021-05-28 05:16:12'),(10,10,0,'2021-05-28 05:18:30','2021-05-28 05:18:30'),(11,11,0,'2021-05-28 05:21:48','2021-05-28 05:21:48'),(12,12,0,'2021-05-28 05:22:28','2021-05-28 05:22:28'),(13,13,0,'2021-05-28 05:24:00','2021-05-28 05:24:00'),(14,14,0,'2021-05-28 05:24:55','2021-05-28 05:24:55'),(15,15,0,'2021-05-28 05:25:36','2021-05-28 05:25:36'),(16,16,0,'2021-05-28 05:26:47','2021-05-28 05:26:47'),(17,17,0,'2021-05-28 05:28:32','2021-05-28 05:28:32'),(18,18,0,'2021-05-28 05:29:21','2021-05-28 05:29:21'),(19,19,0,'2021-05-28 05:30:21','2021-05-28 05:30:21'),(20,20,0,'2021-05-28 05:31:57','2021-05-28 05:31:57'),(21,21,0,'2021-05-28 05:32:52','2021-05-28 05:32:52'),(22,22,0,'2021-05-28 05:34:04','2021-05-28 05:34:04'),(23,23,0,'2021-05-28 05:36:25','2021-05-28 05:36:25'),(24,24,0,'2021-05-28 05:45:50','2021-05-28 05:45:50'),(25,25,0,'2021-05-28 05:46:49','2021-05-28 05:46:49'),(26,26,0,'2021-05-28 06:19:02','2021-05-28 06:19:02'),(27,27,0,'2021-05-28 06:20:06','2021-05-28 06:20:06'),(28,28,0,'2021-05-28 06:20:58','2021-05-28 06:20:58'),(29,29,0,'2021-05-28 06:22:51','2021-05-28 06:22:51'),(30,30,0,'2021-05-28 06:23:40','2021-05-28 06:23:40'),(31,31,0,'2021-05-28 06:24:14','2021-05-28 06:24:14'),(32,32,0,'2021-05-28 06:24:50','2021-05-28 06:24:50'),(33,33,0,'2021-05-28 06:25:41','2021-05-28 06:25:41');
/*!40000 ALTER TABLE `stocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supervisers`
--

DROP TABLE IF EXISTS `supervisers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supervisers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `contact` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `domain` enum('Menuiserie','Peinture','Sol','MultiService') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supervisers`
--

LOCK TABLES `supervisers` WRITE;
/*!40000 ALTER TABLE `supervisers` DISABLE KEYS */;
INSERT INTO `supervisers` VALUES (1,'Cédric','LEROUX','06 79 45 25 47','MultiService','2021-05-27 08:44:56','2021-05-27 11:23:27'),(2,'Patrick','LENOIR','1234','Menuiserie','2021-05-27 11:23:47','2021-05-27 11:28:30'),(3,'Monika','FALEK','06 01 45 62 09','Peinture','2021-05-27 11:33:14','2021-05-27 11:33:14'),(4,'Abdenacer','BENYAHIA','06 52 49 55 93','Peinture','2021-05-27 11:35:04','2021-05-27 11:35:04');
/*!40000 ALTER TABLE `supervisers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suppliers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `contact` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (1,'Mabille Tereva','Z.I Rue du Fossé Roger\r\n76800 Saint Etienne du Rouvray','02 35 65 95 95','2021-05-27 09:38:31','2021-05-27 09:38:31'),(2,'Setin','33 Boulevard Lénine, 76800 Saint-Étienne-du-Rouvray','02 32 80 35 35','2021-05-27 09:39:20','2021-05-27 09:39:20'),(3,'LDI couleurs diffusion','33 Route de Darnétal, 76000 Rouen','02 32 10 11 14','2021-05-27 09:40:02','2021-05-27 09:40:02'),(4,'Osca','110, rue des Frères Delattre 76140 PETIT QUEVILLY / 177, rue de la vallée 76600 LE HAVRE','02 35 72 68 04','2021-05-27 09:41:20','2021-05-27 09:41:20'),(5,'Seigneurie','30 Rue du Pré de la Bataille, 76000 Rouen','02 32 10 22 00','2021-05-27 09:42:13','2021-05-27 09:42:13'),(6,'Somedec','141 Rue des Martyrs de la Résistance, 76150 Maromme','02 35 75 61 02','2021-05-27 09:42:55','2021-05-27 09:42:55'),(7,'Litt','5 Avenue Emile Basly, 76120 Le Grand-Quevilly','02 35 36 00 21','2021-05-27 09:43:38','2021-05-27 09:43:38'),(8,'Legallais','Z.I. Est, Rue de la Grande Épine Entree n°3, 76800 Saint-Étienne-du-Rouvray','02 31 23 42 34','2021-05-27 09:44:27','2021-05-27 09:44:27');
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_members`
--

DROP TABLE IF EXISTS `team_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team_members` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `reference` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `team_id` bigint(20) unsigned DEFAULT NULL,
  `title` enum('CHIEF','OF') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `team_members_reference_unique` (`reference`),
  KEY `team_members_team_id_foreign` (`team_id`),
  CONSTRAINT `team_members_team_id_foreign` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_members`
--

LOCK TABLES `team_members` WRITE;
/*!40000 ALTER TABLE `team_members` DISABLE KEYS */;
INSERT INTO `team_members` VALUES (2,'Noel','CESBRON','TM-CESB2','1234',1,'CHIEF','2021-05-27 08:43:09','2021-05-27 08:45:06'),(3,'Christphe','PETIT','TM-PETI3','1234',1,'OF','2021-05-27 08:44:13','2021-05-27 08:45:17');
/*!40000 ALTER TABLE `team_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teams` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `superviser_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `teams_superviser_id_foreign` (`superviser_id`),
  CONSTRAINT `teams_superviser_id_foreign` FOREIGN KEY (`superviser_id`) REFERENCES `supervisers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES (1,'LEROUX - CESBRON',1,'2021-05-27 08:45:06','2021-05-27 08:45:06');
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Maurel','zandamaurel@abbei.org','2021-05-27 06:38:14','$2y$10$kFLaBDN1J8vPRyTh1jRlW.CLqaXR8vtg570612S.Kv6NGNS6qVSj2','YcyM8IiAHG','2021-05-27 06:38:14','2021-05-27 06:38:14');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-28 12:18:59
