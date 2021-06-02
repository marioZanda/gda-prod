-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : mer. 02 juin 2021 à 11:32
-- Version du serveur :  10.4.19-MariaDB
-- Version de PHP : 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `db_rouen`
--

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

DROP TABLE IF EXISTS `clients`;
CREATE TABLE `clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `superviser_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `clients`
--

INSERT INTO `clients` (`id`, `name`, `address`, `contact`, `superviser_id`, `created_at`, `updated_at`) VALUES
(1, 'Habitat 76', '3 avenue Pasteur', '06 01 45 62 09', 1, '2021-05-31 05:54:15', '2021-05-31 05:54:15');

-- --------------------------------------------------------

--
-- Structure de la table `client_products`
--

DROP TABLE IF EXISTS `client_products`;
CREATE TABLE `client_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `client_products`
--

INSERT INTO `client_products` (`id`, `client_id`, `product_id`, `created_at`, `updated_at`) VALUES
(4, 1, 2, '2021-05-31 06:07:25', '2021-05-31 06:07:25'),
(5, 1, 3, '2021-05-31 06:07:25', '2021-05-31 06:07:25'),
(6, 1, 4, '2021-05-31 06:07:25', '2021-05-31 06:07:25'),
(7, 1, 5, '2021-05-31 06:07:25', '2021-05-31 06:07:25'),
(8, 1, 6, '2021-05-31 06:07:25', '2021-05-31 06:07:25'),
(9, 1, 7, '2021-05-31 06:07:25', '2021-05-31 06:07:25');

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `connection` text COLLATE utf8_unicode_ci NOT NULL,
  `queue` text COLLATE utf8_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2021_04_22_102455_create_suppliers_table', 1),
(5, '2021_04_22_134510_create_supervisers_table', 1),
(6, '2021_04_22_140725_create_teams_table', 1),
(7, '2021_04_22_152323_create_team_members_table', 1),
(8, '2021_04_28_100240_create_products_table', 1),
(9, '2021_04_29_080248_create_stocks_table', 1),
(10, '2021_04_29_102842_create_mouvments_table', 1),
(11, '2021_05_16_124935_create_clients_table', 1),
(12, '2021_05_16_151218_create_client_products_table', 1);

-- --------------------------------------------------------

--
-- Structure de la table `mouvments`
--

DROP TABLE IF EXISTS `mouvments`;
CREATE TABLE `mouvments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `action` enum('IN','OUT') COLLATE utf8_unicode_ci NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `note` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `team_member_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `mouvments`
--

INSERT INTO `mouvments` (`id`, `action`, `product_id`, `quantity`, `note`, `team_member_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'IN', 4, 2, NULL, NULL, 1, '2021-05-27 09:10:07', '2021-05-27 09:10:07'),
(2, 'OUT', 4, 2, '', 2, 1, '2021-05-27 09:27:24', '2021-05-27 09:27:24'),
(3, 'IN', 3, 10, NULL, NULL, 1, '2021-05-27 09:47:32', '2021-05-27 09:47:32'),
(4, 'IN', 3, 20, NULL, NULL, 1, '2021-05-27 09:48:08', '2021-05-27 09:48:08'),
(5, 'IN', 4, 15, NULL, NULL, 1, '2021-05-27 09:48:09', '2021-05-27 09:48:09'),
(6, 'OUT', 3, 2, '', 2, 1, '2021-05-27 09:48:53', '2021-05-27 09:48:53'),
(7, 'OUT', 4, 1, '', 2, 1, '2021-05-27 09:48:53', '2021-05-27 09:48:53'),
(8, 'OUT', 3, 1, '', 2, 1, '2021-05-27 11:26:16', '2021-05-27 11:26:16'),
(9, 'OUT', 4, 0, '', 2, 1, '2021-05-27 11:26:16', '2021-05-27 11:26:16'),
(10, 'OUT', 3, 1, '', 2, 1, '2021-05-28 08:51:15', '2021-05-28 08:51:15'),
(11, 'IN', 2, 1, NULL, NULL, 1, '2021-05-31 05:53:23', '2021-05-31 05:53:23'),
(12, 'OUT', 2, 1, '', 2, 1, '2021-05-31 05:53:42', '2021-05-31 05:53:42'),
(13, 'OUT', 2, 0, '', 2, 1, '2021-05-31 06:09:38', '2021-05-31 06:09:38');

-- --------------------------------------------------------

--
-- Structure de la table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reference` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `brand` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alert` int(11) NOT NULL,
  `supplier_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` double NOT NULL,
  `service` enum('Aucune','Outillages / consommables','Outils / ménager','Menuiserie','Peinture','Sol','MultiService') COLLATE utf8_unicode_ci NOT NULL,
  `nature` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `unit` enum('L','mL','kg','rlx','pcs','m2','tine','rouleau') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `products`
--

INSERT INTO `products` (`id`, `reference`, `name`, `brand`, `alert`, `supplier_id`, `price`, `service`, `nature`, `unit`, `created_at`, `updated_at`) VALUES
(2, 'MS-ME-Liberty', 'Meuble ├®vier Liberty', NULL, 1, 1, 48.77, 'MultiService', 'Plomberie', 'pcs', '2021-05-27 08:46:45', '2021-06-01 05:09:40'),
(3, 'PE-AQUA-SATIN16', 'Aquaryl Satin 16l', 'AQUARYL', 8, 1, 4, 'Peinture', 'Peinture', 'L', '2021-05-27 08:47:29', '2021-06-01 06:48:43'),
(4, 'PE-AQUA-MAT16', 'Aquaryl Mat 16l', 'AQUARYL', 1, 1, 3.8, 'Peinture', 'Peinture', 'L', '2021-05-27 08:48:15', '2021-06-01 06:48:01'),
(5, 'SL-TAR-Habitat', 'TARKETT Habitat', 'Osca', 8, 4, 7.09, 'Sol', 'Bobine', 'm2', '2021-05-27 11:36:27', '2021-06-01 06:49:50'),
(6, 'SL-TAR-HABTGENIUS', 'TARKETT Habitat Genius', 'Osca', 8, 4, 10.18, 'Sol', 'Bobine', 'm2', '2021-05-27 14:11:26', '2021-06-01 06:50:31'),
(7, 'SL-TAR-HABTGENIUSSS4', 'TARKETT Habitat Genius SS4', 'Osca', 8, 4, 10.18, 'Sol', 'Bobine', 'm2', '2021-05-27 14:13:52', '2021-06-01 06:51:16'),
(8, 'SL-TAR-LAME', 'TARKETT Lame', 'Seigneurie', 8, 5, 10, 'Sol', 'Bobine', 'm2', '2021-05-28 05:08:55', '2021-06-01 06:52:33'),
(9, 'SL-TXHABT-TRENDOAK', 'TX Habitat Trend OAK', 'Seigneurie', 8, 5, 7.2, 'Sol', 'Bobine', 'm2', '2021-05-28 05:16:12', '2021-06-01 06:53:15'),
(10, 'SL-TXHABT-KIRUMA', 'TX Habitat Kiruma', 'Seigneurie', 8, 5, 7.2, 'Sol', 'Bobine', 'm2', '2021-05-28 05:18:30', '2021-06-01 06:53:52'),
(11, 'SL-ALL-DECIBEL035', 'ALLURA DECIBEL 0.35', 'Osca', 8, 4, 13.75, 'Sol', 'Bobine', 'm2', '2021-05-28 05:21:48', '2021-06-01 06:54:48'),
(12, 'SL-ARDASOL', 'ARDASOL', 'Osca', 8, 4, 7.95, 'Sol', 'Bobine', 'm2', '2021-05-28 05:22:28', '2021-06-01 12:03:28'),
(13, 'SL-ARDASOL-FIBRE', 'ARDASOL Fibr├®', 'Osca', 8, 4, 23, 'Sol', 'Bobine', 'm2', '2021-05-28 05:24:00', '2021-06-01 12:03:57'),
(14, 'SL-ACCENT-EXCELLENCE', 'ACCENT EXCELLENCE', 'Osca', 8, 4, 18.59, 'Sol', 'Bobine', 'm2', '2021-05-28 05:24:55', '2021-06-01 12:44:19'),
(15, 'SL-TXEXCELLENCE', 'TX EXCELLENCE', 'Osca', 8, 4, 18.59, 'Sol', 'Bobine', 'm2', '2021-05-28 05:25:36', '2021-06-01 12:04:28'),
(16, 'ME-TASSEAU', 'TASSEAU', NULL, 8, 6, 1.48, 'Menuiserie', 'Bois', 'pcs', '2021-05-28 05:26:47', '2021-06-01 13:21:52'),
(17, 'ME-PLINTHE-SAPIN70', 'PLINTHE 70 Sapin', NULL, 8, 6, 0.6, 'Menuiserie', 'Bois', 'mL', '2021-05-28 05:28:32', '2021-06-01 13:22:13'),
(18, 'ME-PLINTHE-SAPIN110', 'PLINTHE 110 Sapin', NULL, 8, 6, 1.29, 'Menuiserie', 'Bois', 'mL', '2021-05-28 05:29:21', '2021-06-01 13:21:33'),
(19, 'ME-CHAMPLAT-6*35', 'CHAMPLAT 6X35', NULL, 8, 6, 0.56, 'Menuiserie', 'Bois', 'mL', '2021-05-28 05:30:21', '2021-06-01 13:22:43'),
(20, 'ME-BAGUETTE-ANGLE20*20', 'BAGUETTE Angle 20X20', NULL, 8, 6, 1.33, 'Menuiserie', 'Bois', 'pcs', '2021-05-28 05:31:57', '2021-06-01 13:23:35'),
(21, 'ME-BAGUETTE-ANGLE35*35', 'BAGUETTE Angle 35X35', NULL, 8, 6, 2.26, 'Menuiserie', 'Bois', 'pcs', '2021-05-28 05:32:52', '2021-06-01 13:24:01'),
(22, 'ME-BAGUETTE-STD13', 'BA 13 Standard', NULL, 8, 6, 2.12, 'Menuiserie', 'Bois', 'm2', '2021-05-28 05:34:04', '2021-06-01 13:24:31'),
(23, 'ME-PANNEAU-OSB12mm', 'PANNEAU OSB 12mm 3.25*1.25', NULL, 8, 6, 4.42, 'Menuiserie', 'Panneaux', 'm2', '2021-05-28 05:36:25', '2021-06-01 13:25:14'),
(24, 'ME-PANNEAU-CTPLQ10mm', 'PANNEAU Contreplaque 10mm 2.5*1.22', NULL, 8, 6, 11.41, 'Menuiserie', 'Panneaux', 'm2', '2021-05-28 05:45:50', '2021-06-01 13:25:44'),
(25, 'ME-PANNEAU-CP15', 'PANNEAU CP15', NULL, 8, 6, 15.16, 'Menuiserie', 'Panneaux', 'm2', '2021-05-28 05:46:49', '2021-06-01 13:26:15'),
(26, 'ME-PANNEAU-MED10mm', 'PANNEAU M├®dium 10mm', NULL, 8, 6, 6.04, 'Menuiserie', 'Panneaux', 'm2', '2021-05-28 06:19:02', '2021-06-01 13:27:44'),
(27, 'ME-PANNEAU-MDF16mm', 'PANNEAU MDF 16mm Blanc 2.44*1.22', NULL, 8, 6, 7.84, 'Menuiserie', 'Panneaux', 'm2', '2021-05-28 06:20:06', '2021-06-01 13:28:11'),
(28, 'ME-PANNEAU-MED18mm', 'PANNEAU M├®dium 18 mm', NULL, 8, 6, 8.78, 'Menuiserie', 'Panneaux', 'm2', '2021-05-28 06:20:58', '2021-06-01 13:28:42'),
(29, 'ME-HUISSERIE80', 'HUISSERIE 80', NULL, 8, 6, 110.44, 'Menuiserie', 'Dalles', 'pcs', '2021-05-28 06:22:51', '2021-06-01 13:29:04'),
(30, 'ME-DALLE-PLAFOND600', 'DALLE Plafond 600*600', NULL, 8, 7, 17.86, 'Menuiserie', 'Dalles', 'm2', '2021-05-28 06:23:40', '2021-06-01 13:29:33'),
(31, 'ME-DALLEPLAFOND-600gorteya', 'DALLE Plafond 600*600', NULL, 8, 7, 7.57, 'Menuiserie', 'Dalles', 'm2', '2021-05-28 06:24:14', '2021-06-01 13:30:11'),
(32, 'ME-DALLEPLAFOND-600Gypton50', 'DALLE Plafond 600*600', NULL, 8, 7, 22.54, 'Menuiserie', 'Dalles', 'm2', '2021-05-28 06:24:50', '2021-06-01 13:30:46'),
(33, 'ME-DALLEPLAFOND-600eklor', 'DALLE Plafond 600*600', NULL, 8, 7, 7.08, 'Menuiserie', 'Dalles', 'm2', '2021-05-28 06:25:41', '2021-06-01 13:31:33'),
(34, 'ME-BEQ-HOPE-CLE', 'BEQUILLE', NULL, 8, 8, 9.7, 'Menuiserie', 'Serrures', 'pcs', '2021-05-28 10:40:15', '2021-06-01 13:33:13'),
(35, 'ME-CLE-AXE50', 'Serrure axe 50', NULL, 8, 1, 6.87, 'Menuiserie', 'Serrures', 'pcs', '2021-05-28 10:43:50', '2021-06-01 13:33:32'),
(36, 'ME-CLE-AXE40', 'Serrure axe 40', NULL, 8, 1, 6.87, 'Menuiserie', 'Serrures', 'pcs', '2021-05-28 10:44:28', '2021-06-01 13:33:53'),
(37, 'ME-S├®rie-113.184', 'Ferme porte', NULL, 8, 8, 39.78, 'Menuiserie', 'Serrures', 'pcs', '2021-05-28 10:45:13', '2021-06-01 13:34:20'),
(38, '98211.2', 'Brosse Rechampir n┬░2', 'Osca', 8, 4, 2.29, 'Peinture', 'Brosses', 'pcs', '2021-05-28 10:48:35', '2021-05-28 10:48:35'),
(39, '98211.4', 'Brosse Rechampir n┬░4', 'Osca', 8, 4, 2.78, 'Peinture', 'Brosses', 'pcs', '2021-05-28 10:50:45', '2021-05-28 10:50:45'),
(40, '98211.6', 'Brosse Rechampir n┬░6', 'Osca', 8, 4, 3.59, 'Peinture', 'Brosses', 'pcs', '2021-05-28 10:51:30', '2021-05-28 10:51:30'),
(41, '98211.8', 'Brosse Rechampir n┬░8', 'Osca', 8, 4, 4.44, 'Peinture', 'Brosses', 'pcs', '2021-05-28 10:52:12', '2021-05-28 10:52:12'),
(42, '98311.25', 'Brosse Radiateur 25', 'Osca', 8, 4, 1.43, 'Peinture', 'Brosses', 'pcs', '2021-05-28 10:53:43', '2021-05-28 10:53:43'),
(43, '98311.35', 'Brosse Radiateur 35', 'Osca', 8, 4, 1.68, 'Peinture', 'Brosses', 'pcs', '2021-05-28 11:01:16', '2021-05-28 11:01:16'),
(44, '98311.45', 'Brosse Radiateur 45', 'Osca', 8, 4, 2.24, 'Peinture', 'Brosses', 'pcs', '2021-05-28 11:02:57', '2021-05-28 11:02:57'),
(45, 'MS-MEUBLEEVIER-LIBERTY', 'Meuble Evier Liberty', NULL, 8, 1, 48.77, 'MultiService', 'Plomberie', 'pcs', '2021-05-28 12:15:12', '2021-06-01 13:35:03'),
(46, 'MS-EVIER-INOX', 'Evier Inox', NULL, 8, 1, 46.87, 'MultiService', 'Plomberie', 'pcs', '2021-05-28 12:16:32', '2021-06-01 13:35:29'),
(47, 'MS-EVIER-RESINE', 'Evier R├®sine', NULL, 8, 1, 167, 'MultiService', 'Plomberie', 'pcs', '2021-05-28 12:18:09', '2021-06-01 13:35:59'),
(48, 'MS-ROB-MITIGEUR', 'Mitigeur', 'Porcher', 8, 1, 60.22, 'MultiService', 'Plomberie', 'pcs', '2021-05-28 12:19:58', '2021-06-01 13:36:26'),
(49, 'MS-ROB-MITIGEURLAVABO', 'Mitigeur Lavabo', NULL, 8, 1, 51.98, 'MultiService', 'Plomberie', 'pcs', '2021-05-28 12:21:10', '2021-06-01 13:36:55'),
(50, 'MS-ROB-MITIGEURBAIGNOIRE', 'Mitigeur Baignoire', NULL, 8, 1, 18.93, 'MultiService', 'Plomberie', 'pcs', '2021-05-28 12:21:58', '2021-06-01 13:38:04'),
(51, 'ME-SERRURE-NORMALE', 'Serrure Normale', NULL, 8, 2, 5.52, 'Menuiserie', 'Serrures', 'pcs', '2021-05-28 12:22:33', '2021-06-01 13:38:40'),
(52, 'ME-SERRURE-CONDAMNATION', 'Serrure ├á Condamnation', NULL, 8, 2, 5.67, 'Menuiserie', 'Serrures', 'pcs', '2021-05-28 12:23:11', '2021-06-01 13:39:08'),
(53, 'MS-BARREDOUCHE', 'Barre de douche avec douchette', NULL, 8, 1, 13.74, 'MultiService', 'Plomberie', 'pcs', '2021-05-28 12:26:25', '2021-06-01 13:39:45'),
(54, 'ME-BEQ-NORMALE', 'B├®quille Normale', NULL, 8, 2, 6.99, 'Menuiserie', 'Serrures', 'pcs', '2021-05-28 12:27:11', '2021-06-01 13:40:12'),
(55, 'ME-BEQ-CONDAMNATION', 'B├®quille ├á Condamnation', NULL, 8, 2, 8.16, 'Menuiserie', 'Serrures', 'pcs', '2021-05-28 12:28:00', '2021-06-01 13:40:37'),
(56, 'MS-DOUCHETTE', 'Douchette', NULL, 8, 1, 10.62, 'MultiService', 'Plomberie', 'pcs', '2021-05-28 12:28:49', '2021-06-01 13:41:05'),
(57, 'MS-COLONNELAVABO', 'Colonne Lavabo', NULL, 8, 1, 3.26, 'MultiService', 'Plomberie', 'pcs', '2021-05-28 12:30:11', '2021-06-01 13:41:23'),
(58, 'MS-SIPHON', 'Siphon', NULL, 8, 1, 3.27, 'MultiService', 'Plomberie', 'pcs', '2021-05-28 12:30:45', '2021-06-01 13:41:47'),
(59, '98RO92560', 'Lame Scrapeur', NULL, 8, 4, 6.9, 'Peinture', 'Lames', 'pcs', '2021-05-28 12:32:59', '2021-05-28 12:32:59'),
(60, '98OPLAMCOC4494', 'Lame Croche', NULL, 8, 4, 3.59, 'Peinture', 'Lames', 'pcs', '2021-05-28 12:33:52', '2021-05-28 12:33:52'),
(61, '989567.0199', 'Lame Cutter 18mm', NULL, 8, 4, 0.66, 'Peinture', 'Lames', 'pcs', '2021-05-28 12:34:46', '2021-05-28 12:34:46'),
(62, '989567.0299', 'Lame Cutter 9mm', NULL, 8, 4, 2.75, 'Peinture', 'Lames', 'pcs', '2021-05-28 12:35:33', '2021-05-28 12:35:33'),
(63, '98OPLAMTRAP4492', 'Lame Droite', NULL, 8, 4, 2.99, 'Peinture', 'Lames', 'pcs', '2021-05-28 12:36:29', '2021-05-28 12:36:29'),
(64, '98RO94315', 'Scrapeur', NULL, 8, 4, 16.71, 'Peinture', 'Lames', 'pcs', '2021-05-28 12:58:21', '2021-05-28 12:58:21'),
(65, '98JFLMPOL30', 'Polyane en 30 microns 25*2', NULL, 8, 4, 5.17, 'Peinture', 'Trucs au sol', 'm2', '2021-05-28 13:07:05', '2021-05-28 13:07:05'),
(66, '989426.1010', 'B├óche Feutre Absorbant', NULL, 8, 4, 5.99, 'Peinture', 'Trucs au sol', 'm2', '2021-05-28 13:08:07', '2021-05-28 13:08:07'),
(67, '984600', 'Masquage Lisse en 50mm', NULL, 8, 4, 1.36, 'Peinture', 'Lissages', 'pcs', '2021-05-28 13:09:17', '2021-05-28 13:09:17'),
(68, '98TEBO050', 'Masquage Orange 50mm', NULL, 8, 4, 1.82, 'Peinture', 'Lissages', 'pcs', '2021-05-28 13:10:14', '2021-05-28 13:10:14'),
(69, '92SEA3111344', 'Abrasif Cale Grain 100', NULL, 8, 4, 3.65, 'Peinture', 'Lissages', 'pcs', '2021-05-28 13:11:08', '2021-05-28 13:11:08'),
(70, '92SEA311343', 'Abrasif Cale grain 120', NULL, 8, 4, 3.65, 'Peinture', 'Lissages', 'pcs', '2021-05-28 13:12:13', '2021-05-28 13:12:13'),
(71, '92SEA311345', 'Abrasif Cale Grain 80/60/40', NULL, 8, 4, 3.65, 'Peinture', 'Lissages', 'pcs', '2021-05-28 13:12:57', '2021-05-28 13:12:57'),
(72, '98RO91400', 'Araseur', NULL, 8, 4, 12.84, 'Peinture', 'Lissages', 'pcs', '2021-05-28 13:13:59', '2021-05-28 13:13:59'),
(73, '98W103', 'Spatule ├á Maroufler', NULL, 8, 4, 1.47, 'Peinture', 'Lissages', 'pcs', '2021-05-28 13:14:53', '2021-05-28 13:14:53'),
(74, 'PE-CARTOUCHE-NEOPRENE', 'Cartouche N├®opr├¿ne', NULL, 8, 4, 3.45, 'Peinture', 'Enduits / Fixateurs', 'pcs', '2021-05-28 13:18:04', '2021-06-01 13:43:00'),
(75, 'PE-CARTOUCHE-ACRYLIQUEBLANC', 'Cartouche Acrylique Blanc', NULL, 8, 4, 1.01, 'Peinture', 'Enduits / Fixateurs', 'pcs', '2021-05-28 13:19:10', '2021-06-01 13:43:26'),
(76, 'PE-CARTOUCHE-SILICONEBLANC', 'Cartouche Silicone Blanc', NULL, 8, 4, 4.12, 'Peinture', 'Enduits / Fixateurs', 'pcs', '2021-05-28 13:20:23', '2021-06-01 13:43:48'),
(77, '9827.790', 'MICROTEX 250mm', NULL, 8, 4, 5.18, 'Peinture', 'Rouleaux', 'pcs', '2021-05-28 13:23:43', '2021-05-28 13:23:43'),
(78, '9825.790', 'MICROTEX 180mm', NULL, 8, 4, 3.75, 'Peinture', 'Rouleaux', 'pcs', '2021-05-28 13:24:26', '2021-05-28 13:24:26'),
(79, '9850.790', 'MICROTEX 100mm', NULL, 8, 4, 0.83, 'Peinture', 'Rouleaux', 'pcs', '2021-05-28 13:25:16', '2021-05-28 13:25:16'),
(80, '9827.695', 'MICROSTAR 250mm', NULL, 8, 4, 4.27, 'Peinture', 'Rouleaux', 'pcs', '2021-05-28 13:26:07', '2021-05-28 13:26:07'),
(81, '9825.680', 'MICROSTAR 180mm', NULL, 8, 4, 4.42, 'Peinture', 'Rouleaux', 'pcs', '2021-05-28 13:26:52', '2021-05-28 13:26:52'),
(82, '9850.680', 'MICROSTAR 100mm', NULL, 8, 4, 0.77, 'Peinture', 'Rouleaux', 'pcs', '2021-05-28 13:27:41', '2021-05-28 13:27:41'),
(83, '9827.170', 'AQUASTAR 250mm', NULL, 8, 4, 3.91, 'Peinture', 'Rouleaux', 'pcs', '2021-05-28 13:29:24', '2021-05-28 13:29:24'),
(84, '9825.070', 'ROTRACRYL 180mm', NULL, 8, 4, 2.64, 'Peinture', 'Rouleaux', 'pcs', '2021-05-28 13:30:23', '2021-05-28 13:30:23'),
(85, '9850.780', 'ROTRACRYL 100mm', NULL, 8, 4, 0.4, 'Peinture', 'Rouleaux', 'pcs', '2021-05-28 13:31:28', '2021-05-28 13:31:28'),
(86, '9827.320', 'RAYE Jaune 250mm', NULL, 8, 4, 2.86, 'Peinture', 'Rouleaux', 'pcs', '2021-05-28 13:32:15', '2021-05-28 13:32:15'),
(87, '9825.320', 'RAYE Jaune 180mm', NULL, 8, 4, 2.17, 'Peinture', 'Rouleaux', 'pcs', '2021-05-28 13:32:58', '2021-05-28 13:32:58'),
(88, '9850.320', 'RAYE Jaune 100mm', NULL, 8, 4, 0.47, 'Peinture', 'Rouleaux', 'pcs', '2021-05-28 13:33:43', '2021-05-28 13:33:43'),
(89, '27910', 'ROTAFLOR 250mm', NULL, 8, 4, 4.98, 'Peinture', 'Rouleaux', 'pcs', '2021-05-28 13:34:28', '2021-05-28 13:34:28'),
(90, '25900', 'ROTAFLOR 180mm', NULL, 8, 4, 3.97, 'Peinture', 'Rouleaux', 'pcs', '2021-05-28 13:35:13', '2021-05-28 13:35:13'),
(91, '40901', 'ROTAFLOR 100mm', NULL, 8, 4, 2.12, 'Peinture', 'Rouleaux', 'pcs', '2021-05-28 13:35:54', '2021-05-28 13:35:54'),
(92, 'K803.61.00', 'Monture 250mm', NULL, 8, 4, 1.49, 'Peinture', 'Rouleaux', 'pcs', '2021-05-28 13:36:56', '2021-05-28 13:36:56'),
(93, 'K803.63.00', 'Monture 180mm', NULL, 8, 4, 1.02, 'Peinture', 'Rouleaux', 'pcs', '2021-05-28 13:38:04', '2021-05-28 13:38:04'),
(94, 'K833.00', 'Monture Pate de Lapin', NULL, 8, 4, 0.68, 'Peinture', 'Rouleaux', 'pcs', '2021-05-28 13:38:42', '2021-05-28 13:38:42'),
(95, 'PE-COLLETDV-TDV146', 'Colle Toile de Verre TDV 146', NULL, 8, 4, 0.66, 'Peinture', 'Colle', 'kg', '2021-05-28 13:40:20', '2021-06-01 13:20:22'),
(96, 'PE-COLLESOLPVC-MIPLAFIX300', 'Colle Sol PVC Moquette MIPLAFIX 300', NULL, 8, 4, 3.52, 'Peinture', 'Colle', 'kg', '2021-05-28 13:41:23', '2021-06-01 13:19:53'),
(97, 'PE-NEOGLISS-COLLEPOIS', 'Colle Poissante N├®ogliss', NULL, 8, 4, 6.6, 'Peinture', 'Colle', 'kg', '2021-05-28 13:42:09', '2021-06-01 13:04:32'),
(98, 'PE-HEVAQUAPRIM3', 'HEVAQUAPRIM 3L', NULL, 8, 4, 10.8, 'Peinture', 'Peinture', 'L', '2021-05-28 13:43:14', '2021-06-01 12:53:48'),
(99, 'PE-HEVAQUAPRIM15', 'HEVAQUAPRIM 15L', NULL, 8, 4, 5.73, 'Peinture', 'Peinture', 'L', '2021-05-28 13:44:45', '2021-06-01 12:54:30'),
(100, 'PE-Rebouch5', '3H Reboucheur 5kg', NULL, 8, 4, 2.7, 'Peinture', 'Enduits / Fixateurs', 'kg', '2021-05-28 13:45:40', '2021-06-01 12:55:18'),
(101, 'PE-TOUPERETRELBO15', 'Enduit Reboucheur TOUPERET 15kg', 'TOUPERET', 8, 4, 2.55, 'Peinture', 'Enduits / Fixateurs', 'kg', '2021-05-28 13:46:56', '2021-06-01 12:55:48'),
(102, 'PE-DECOLPA5', 'DECOL Papiers Peint 5l', NULL, 8, 4, 4.42, 'Peinture', 'Enduits / Fixateurs', 'L', '2021-05-28 13:47:49', '2021-06-01 12:56:26'),
(103, 'PE-TDV-TRESSE', 'Toile de Verre Tresse', NULL, 8, 4, 1.27, 'Peinture', 'Toile de verre', 'mL', '2021-05-28 13:49:29', '2021-06-01 12:38:28'),
(104, 'PE-TDV-STADPREPEINTE', 'Toile de Verre Standard Pr├®peinte', NULL, 8, 4, 50.6, 'Peinture', 'Toile de verre', 'rlx', '2021-05-28 13:52:14', '2021-06-01 12:39:15'),
(105, 'PE-TDV-STADPREPEINTE-PREENCOL', 'Toile de Verre Standard Pr├®peinte pr├® encoll├®e', NULL, 8, 4, 1.69, 'Peinture', 'Toile de verre', 'mL', '2021-05-28 13:54:46', '2021-06-01 12:39:59'),
(106, 'PE-TDV-TRESSEPREENCOL-PREENTE', 'Toile Tresse Pr├®encoll├® Pre├½nte', NULL, 8, 4, 1.89, 'Peinture', 'Toile de verre', 'mL', '2021-05-28 13:55:46', '2021-06-01 12:57:10'),
(107, 'PE-TAPETEN-WALLCOV-GRIS', 'Tapeten Wallcoverings Gris *2rlx', NULL, 8, 5, 40, 'Peinture', 'Papiers Peints', 'rlx', '2021-05-28 13:57:26', '2021-06-01 12:58:09'),
(108, 'PE-TAPETEN-WALLCOV-BLANC', 'Tapeten Wallcoverings Blanc *2rlx', NULL, 8, 5, 40, 'Peinture', 'Papiers Peints', 'rlx', '2021-05-28 13:58:26', '2021-06-01 12:58:40'),
(109, 'PE-TAPETEN-WALLCOV-MARRON', 'Tapeten Wallcoverings Marron *2rlx', NULL, 8, 5, 40, 'Peinture', 'Papiers Peints', 'rlx', '2021-05-28 13:59:24', '2021-06-01 12:59:11'),
(110, 'PE-BATIRENO-FIBREPOLY', 'Batir├®no Fibre de cellulose et polyest├¿re', NULL, 8, 5, 40, 'Peinture', 'Papiers Peints', 'rlx', '2021-05-28 14:00:24', '2021-06-01 12:59:48'),
(111, 'PE-MONTECOLINO64', 'MONTECOLINO', NULL, 8, 5, 40, 'Peinture', 'Papiers Peints', 'rlx', '2021-05-28 14:03:04', '2021-06-01 13:02:22'),
(112, 'PE-MONTECOLINO65', 'MONTECOLINO', NULL, 8, 5, 40, 'Peinture', 'Papiers Peints', 'rlx', '2021-05-28 14:03:50', '2021-06-01 13:02:05'),
(113, 'PE-MONTECOLINO66', 'MONTECOLINO', NULL, 8, 5, 40, 'Peinture', 'Papiers Peints', 'rlx', '2021-05-28 14:04:33', '2021-06-01 13:01:45'),
(114, 'PE-MONTECOLINO-GRS', 'MONTECOLINO Gris', NULL, 8, 5, 39.95, 'Peinture', 'Papiers Peints', 'rlx', '2021-05-28 14:05:16', '2021-06-01 13:02:45'),
(115, 'PE-MONTECOLINO-BEIGE', 'MONTECOLINO Beige clair', NULL, 8, 5, 39.95, 'Peinture', 'Papiers Peints', 'rlx', '2021-05-28 14:07:03', '2021-06-01 13:03:12'),
(116, 'PE-MONTECOLINO-MARRON', 'MONTECOLINO Marron', NULL, 8, 5, 39.95, 'Peinture', 'Papiers Peints', 'rlx', '2021-05-28 14:07:38', '2021-06-01 13:03:38'),
(117, 'PE-AQUARYL-SATIN16', 'Aquaryl Satin 16l', NULL, 8, 3, 4, 'Peinture', 'Peinture', 'L', '2021-05-28 14:10:20', '2021-06-01 13:04:02'),
(118, 'PE-AQUARYL-MAT', 'Aquaryl Mat 16l', NULL, 8, 3, 3.8, 'Peinture', 'Peinture', 'L', '2021-05-28 14:11:03', '2021-06-01 12:40:42'),
(119, 'PE-AQUARYL-VELOUR', 'Aquaryl Velour 16l', NULL, 8, 3, 3.54, 'Peinture', 'Peinture', 'L', '2021-05-28 14:11:54', '2021-06-01 12:41:12'),
(120, 'PE-UNISTOP-BOISEAU3', 'Unistop Bois Eau 3l', NULL, 8, 3, 12.96, 'Peinture', 'Peinture', 'L', '2021-05-28 14:12:34', '2021-06-01 12:44:04'),
(121, 'PE-UNISTOP-BOISEVO3', 'Unistop Bois Evolution 3l', NULL, 8, 3, 12.96, 'Peinture', 'Peinture', 'L', '2021-05-28 14:13:19', '2021-06-01 12:44:58'),
(122, 'PE-UNIGLISS-SATIN16', 'Uniglis Satin 16l', NULL, 8, 3, 6.97, 'Peinture', 'Peinture', 'L', '2021-05-28 14:14:05', '2021-06-01 12:45:30'),
(123, 'PE-NEVADA20', 'Nevada 20kg', NULL, 8, 3, 6.1, 'Peinture', 'Enduits / Fixateurs', 'kg', '2021-05-28 14:14:41', '2021-06-01 12:46:03'),
(124, 'PE-HEVAQUAN-SATINTVbLNc15', 'Hevaquan Satin TV Blanc 15l', NULL, 8, 4, 3.93, 'Peinture', 'Peinture', 'L', '2021-05-28 14:15:32', '2021-06-01 12:46:38'),
(125, 'PE-OSCAFIXE-ISO15', 'Oscafixe ISO 15l', NULL, 8, 4, 5.43, 'Peinture', 'Peinture', 'L', '2021-05-28 14:17:42', '2021-06-01 12:50:55'),
(126, 'PE-OSCABOIS-SATIN3', 'Osca Bois Satin 3l', NULL, 8, 4, 9.37, 'Peinture', 'Peinture', 'L', '2021-05-28 14:18:22', '2021-06-01 12:51:29'),
(127, 'PE-CIDPRIM-ACP3', 'CIDPRIM ACP 3l', NULL, 8, 4, 9.16, 'Peinture', 'Peinture', 'L', '2021-05-28 14:19:04', '2021-06-01 12:51:57'),
(128, 'PE-HEVAQUA-VELOURS15', 'HEVAQUA Velours 15l', NULL, 8, 4, 3.65, 'Peinture', 'Peinture', 'L', '2021-05-28 14:19:42', '2021-06-01 12:52:25'),
(129, 'PE-OSCACRYL-MAT15', 'OSCACRYL Mat 15l', NULL, 8, 4, 3.72, 'Peinture', 'Peinture', 'L', '2021-05-28 14:20:16', '2021-06-01 12:52:49'),
(130, 'PE-FREITACCROCHE3', 'Freitaccroche 3l', NULL, 8, 5, 11.12, 'Peinture', 'Peinture', 'L', '2021-05-28 14:20:50', '2021-06-01 12:53:20');

-- --------------------------------------------------------

--
-- Structure de la table `stocks`
--

DROP TABLE IF EXISTS `stocks`;
CREATE TABLE `stocks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `value` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `stocks`
--

INSERT INTO `stocks` (`id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES
(2, 2, 0, '2021-05-27 08:46:45', '2021-05-31 05:53:42'),
(3, 3, 26, '2021-05-27 08:47:29', '2021-05-28 08:51:15'),
(4, 4, 14, '2021-05-27 08:48:15', '2021-05-27 09:48:53'),
(5, 5, 0, '2021-05-27 11:36:27', '2021-05-27 11:36:27'),
(6, 6, 0, '2021-05-27 14:11:26', '2021-05-27 14:11:26'),
(7, 7, 0, '2021-05-27 14:13:52', '2021-05-27 14:13:52'),
(8, 8, 0, '2021-05-28 05:08:55', '2021-05-28 05:08:55'),
(9, 9, 0, '2021-05-28 05:16:12', '2021-05-28 05:16:12'),
(10, 10, 0, '2021-05-28 05:18:30', '2021-05-28 05:18:30'),
(11, 11, 0, '2021-05-28 05:21:48', '2021-05-28 05:21:48'),
(12, 12, 0, '2021-05-28 05:22:28', '2021-05-28 05:22:28'),
(13, 13, 0, '2021-05-28 05:24:00', '2021-05-28 05:24:00'),
(14, 14, 0, '2021-05-28 05:24:55', '2021-05-28 05:24:55'),
(15, 15, 0, '2021-05-28 05:25:36', '2021-05-28 05:25:36'),
(16, 16, 0, '2021-05-28 05:26:47', '2021-05-28 05:26:47'),
(17, 17, 0, '2021-05-28 05:28:32', '2021-05-28 05:28:32'),
(18, 18, 0, '2021-05-28 05:29:21', '2021-05-28 05:29:21'),
(19, 19, 0, '2021-05-28 05:30:21', '2021-05-28 05:30:21'),
(20, 20, 0, '2021-05-28 05:31:57', '2021-05-28 05:31:57'),
(21, 21, 0, '2021-05-28 05:32:52', '2021-05-28 05:32:52'),
(22, 22, 0, '2021-05-28 05:34:04', '2021-05-28 05:34:04'),
(23, 23, 0, '2021-05-28 05:36:25', '2021-05-28 05:36:25'),
(24, 24, 0, '2021-05-28 05:45:50', '2021-05-28 05:45:50'),
(25, 25, 0, '2021-05-28 05:46:49', '2021-05-28 05:46:49'),
(26, 26, 0, '2021-05-28 06:19:02', '2021-05-28 06:19:02'),
(27, 27, 0, '2021-05-28 06:20:06', '2021-05-28 06:20:06'),
(28, 28, 0, '2021-05-28 06:20:58', '2021-05-28 06:20:58'),
(29, 29, 0, '2021-05-28 06:22:51', '2021-05-28 06:22:51'),
(30, 30, 0, '2021-05-28 06:23:40', '2021-05-28 06:23:40'),
(31, 31, 0, '2021-05-28 06:24:14', '2021-05-28 06:24:14'),
(32, 32, 0, '2021-05-28 06:24:50', '2021-05-28 06:24:50'),
(33, 33, 0, '2021-05-28 06:25:41', '2021-05-28 06:25:41'),
(34, 34, 0, '2021-05-28 10:40:15', '2021-05-28 10:40:15'),
(35, 35, 0, '2021-05-28 10:43:50', '2021-05-28 10:43:50'),
(36, 36, 0, '2021-05-28 10:44:28', '2021-05-28 10:44:28'),
(37, 37, 0, '2021-05-28 10:45:13', '2021-05-28 10:45:13'),
(38, 38, 0, '2021-05-28 10:48:35', '2021-05-28 10:48:35'),
(39, 39, 0, '2021-05-28 10:50:45', '2021-05-28 10:50:45'),
(40, 40, 0, '2021-05-28 10:51:30', '2021-05-28 10:51:30'),
(41, 41, 0, '2021-05-28 10:52:12', '2021-05-28 10:52:12'),
(42, 42, 0, '2021-05-28 10:53:43', '2021-05-28 10:53:43'),
(43, 43, 0, '2021-05-28 11:01:16', '2021-05-28 11:01:16'),
(44, 44, 0, '2021-05-28 11:02:57', '2021-05-28 11:02:57'),
(45, 45, 0, '2021-05-28 12:15:12', '2021-05-28 12:15:12'),
(46, 46, 0, '2021-05-28 12:16:32', '2021-05-28 12:16:32'),
(47, 47, 0, '2021-05-28 12:18:09', '2021-05-28 12:18:09'),
(48, 48, 0, '2021-05-28 12:19:58', '2021-05-28 12:19:58'),
(49, 49, 0, '2021-05-28 12:21:10', '2021-05-28 12:21:10'),
(50, 50, 0, '2021-05-28 12:21:58', '2021-05-28 12:21:58'),
(51, 51, 0, '2021-05-28 12:22:33', '2021-05-28 12:22:33'),
(52, 52, 0, '2021-05-28 12:23:11', '2021-05-28 12:23:11'),
(53, 53, 0, '2021-05-28 12:26:25', '2021-05-28 12:26:25'),
(54, 54, 0, '2021-05-28 12:27:11', '2021-05-28 12:27:11'),
(55, 55, 0, '2021-05-28 12:28:00', '2021-05-28 12:28:00'),
(56, 56, 0, '2021-05-28 12:28:49', '2021-05-28 12:28:49'),
(57, 57, 0, '2021-05-28 12:30:11', '2021-05-28 12:30:11'),
(58, 58, 0, '2021-05-28 12:30:45', '2021-05-28 12:30:45'),
(59, 59, 0, '2021-05-28 12:32:59', '2021-05-28 12:32:59'),
(60, 60, 0, '2021-05-28 12:33:52', '2021-05-28 12:33:52'),
(61, 61, 0, '2021-05-28 12:34:46', '2021-05-28 12:34:46'),
(62, 62, 0, '2021-05-28 12:35:33', '2021-05-28 12:35:33'),
(63, 63, 0, '2021-05-28 12:36:29', '2021-05-28 12:36:29'),
(64, 64, 0, '2021-05-28 12:58:21', '2021-05-28 12:58:21'),
(65, 65, 0, '2021-05-28 13:07:05', '2021-05-28 13:07:05'),
(66, 66, 0, '2021-05-28 13:08:07', '2021-05-28 13:08:07'),
(67, 67, 0, '2021-05-28 13:09:17', '2021-05-28 13:09:17'),
(68, 68, 0, '2021-05-28 13:10:14', '2021-05-28 13:10:14'),
(69, 69, 0, '2021-05-28 13:11:08', '2021-05-28 13:11:08'),
(70, 70, 0, '2021-05-28 13:12:13', '2021-05-28 13:12:13'),
(71, 71, 0, '2021-05-28 13:12:57', '2021-05-28 13:12:57'),
(72, 72, 0, '2021-05-28 13:13:59', '2021-05-28 13:13:59'),
(73, 73, 0, '2021-05-28 13:14:53', '2021-05-28 13:14:53'),
(74, 74, 0, '2021-05-28 13:18:04', '2021-05-28 13:18:04'),
(75, 75, 0, '2021-05-28 13:19:10', '2021-05-28 13:19:10'),
(76, 76, 0, '2021-05-28 13:20:23', '2021-05-28 13:20:23'),
(77, 77, 0, '2021-05-28 13:23:43', '2021-05-28 13:23:43'),
(78, 78, 0, '2021-05-28 13:24:26', '2021-05-28 13:24:26'),
(79, 79, 0, '2021-05-28 13:25:16', '2021-05-28 13:25:16'),
(80, 80, 0, '2021-05-28 13:26:07', '2021-05-28 13:26:07'),
(81, 81, 0, '2021-05-28 13:26:52', '2021-05-28 13:26:52'),
(82, 82, 0, '2021-05-28 13:27:41', '2021-05-28 13:27:41'),
(83, 83, 0, '2021-05-28 13:29:24', '2021-05-28 13:29:24'),
(84, 84, 0, '2021-05-28 13:30:23', '2021-05-28 13:30:23'),
(85, 85, 0, '2021-05-28 13:31:28', '2021-05-28 13:31:28'),
(86, 86, 0, '2021-05-28 13:32:15', '2021-05-28 13:32:15'),
(87, 87, 0, '2021-05-28 13:32:58', '2021-05-28 13:32:58'),
(88, 88, 0, '2021-05-28 13:33:43', '2021-05-28 13:33:43'),
(89, 89, 0, '2021-05-28 13:34:28', '2021-05-28 13:34:28'),
(90, 90, 0, '2021-05-28 13:35:13', '2021-05-28 13:35:13'),
(91, 91, 0, '2021-05-28 13:35:54', '2021-05-28 13:35:54'),
(92, 92, 0, '2021-05-28 13:36:56', '2021-05-28 13:36:56'),
(93, 93, 0, '2021-05-28 13:38:04', '2021-05-28 13:38:04'),
(94, 94, 0, '2021-05-28 13:38:42', '2021-05-28 13:38:42'),
(95, 95, 0, '2021-05-28 13:40:20', '2021-05-28 13:40:20'),
(96, 96, 0, '2021-05-28 13:41:23', '2021-05-28 13:41:23'),
(97, 97, 0, '2021-05-28 13:42:09', '2021-05-28 13:42:09'),
(98, 98, 0, '2021-05-28 13:43:14', '2021-05-28 13:43:14'),
(99, 99, 0, '2021-05-28 13:44:45', '2021-05-28 13:44:45'),
(100, 100, 0, '2021-05-28 13:45:40', '2021-05-28 13:45:40'),
(101, 101, 0, '2021-05-28 13:46:56', '2021-05-28 13:46:56'),
(102, 102, 0, '2021-05-28 13:47:50', '2021-05-28 13:47:50'),
(103, 103, 0, '2021-05-28 13:49:29', '2021-05-28 13:49:29'),
(104, 104, 0, '2021-05-28 13:52:14', '2021-05-28 13:52:14'),
(105, 105, 0, '2021-05-28 13:54:46', '2021-05-28 13:54:46'),
(106, 106, 0, '2021-05-28 13:55:46', '2021-05-28 13:55:46'),
(107, 107, 0, '2021-05-28 13:57:26', '2021-05-28 13:57:26'),
(108, 108, 0, '2021-05-28 13:58:26', '2021-05-28 13:58:26'),
(109, 109, 0, '2021-05-28 13:59:24', '2021-05-28 13:59:24'),
(110, 110, 0, '2021-05-28 14:00:24', '2021-05-28 14:00:24'),
(111, 111, 0, '2021-05-28 14:03:04', '2021-05-28 14:03:04'),
(112, 112, 0, '2021-05-28 14:03:50', '2021-05-28 14:03:50'),
(113, 113, 0, '2021-05-28 14:04:33', '2021-05-28 14:04:33'),
(114, 114, 0, '2021-05-28 14:05:16', '2021-05-28 14:05:16'),
(115, 115, 0, '2021-05-28 14:07:03', '2021-05-28 14:07:03'),
(116, 116, 0, '2021-05-28 14:07:38', '2021-05-28 14:07:38'),
(117, 117, 0, '2021-05-28 14:10:20', '2021-05-28 14:10:20'),
(118, 118, 0, '2021-05-28 14:11:03', '2021-05-28 14:11:03'),
(119, 119, 0, '2021-05-28 14:11:54', '2021-05-28 14:11:54'),
(120, 120, 0, '2021-05-28 14:12:34', '2021-05-28 14:12:34'),
(121, 121, 0, '2021-05-28 14:13:19', '2021-05-28 14:13:19'),
(122, 122, 0, '2021-05-28 14:14:05', '2021-05-28 14:14:05'),
(123, 123, 0, '2021-05-28 14:14:41', '2021-05-28 14:14:41'),
(124, 124, 0, '2021-05-28 14:15:32', '2021-05-28 14:15:32'),
(125, 125, 0, '2021-05-28 14:17:42', '2021-05-28 14:17:42'),
(126, 126, 0, '2021-05-28 14:18:22', '2021-05-28 14:18:22'),
(127, 127, 0, '2021-05-28 14:19:04', '2021-05-28 14:19:04'),
(128, 128, 0, '2021-05-28 14:19:42', '2021-05-28 14:19:42'),
(129, 129, 0, '2021-05-28 14:20:16', '2021-05-28 14:20:16'),
(130, 130, 0, '2021-05-28 14:20:50', '2021-05-28 14:20:50');

-- --------------------------------------------------------

--
-- Structure de la table `supervisers`
--

DROP TABLE IF EXISTS `supervisers`;
CREATE TABLE `supervisers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `firstname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `contact` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `domain` enum('Menuiserie','Peinture','Sol','MultiService') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `supervisers`
--

INSERT INTO `supervisers` (`id`, `firstname`, `lastname`, `contact`, `domain`, `created_at`, `updated_at`) VALUES
(1, 'C├®dric', 'LEROUX', '06 79 45 25 47', 'MultiService', '2021-05-27 08:44:56', '2021-05-27 11:23:27'),
(2, 'Patrick', 'LENOIR', '1234', 'Menuiserie', '2021-05-27 11:23:47', '2021-05-27 11:28:30'),
(3, 'Monika', 'FALEK', '06 01 45 62 09', 'Peinture', '2021-05-27 11:33:14', '2021-05-27 11:33:14'),
(4, 'Abdenacer', 'BENYAHIA', '06 52 49 55 93', 'Peinture', '2021-05-27 11:35:04', '2021-05-27 11:35:04'),
(5, 'Mhamed', 'AKCHA', '02 32 91 70 92', 'MultiService', '2021-06-01 05:03:56', '2021-06-01 05:03:56');

-- --------------------------------------------------------

--
-- Structure de la table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
CREATE TABLE `suppliers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `contact` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `address`, `contact`, `created_at`, `updated_at`) VALUES
(1, 'Mabille Tereva', 'Z.I Rue du Foss├® Roger\r\n76800 Saint Etienne du Rouvray', '02 35 65 95 95', '2021-05-27 09:38:31', '2021-05-27 09:38:31'),
(2, 'Setin', '33 Boulevard L├®nine, 76800 Saint-├ëtienne-du-Rouvray', '02 32 80 35 35', '2021-05-27 09:39:20', '2021-05-27 09:39:20'),
(3, 'LDI couleurs diffusion', '33 Route de Darn├®tal, 76000 Rouen', '02 32 10 11 14', '2021-05-27 09:40:02', '2021-05-27 09:40:02'),
(4, 'Osca', '110, rue des Fr├¿res Delattre 76140 PETIT QUEVILLY / 177, rue de la vall├®e 76600 LE HAVRE', '02 35 72 68 04', '2021-05-27 09:41:20', '2021-05-27 09:41:20'),
(5, 'Seigneurie', '30 Rue du Pr├® de la Bataille, 76000 Rouen', '02 32 10 22 00', '2021-05-27 09:42:13', '2021-05-27 09:42:13'),
(6, 'Somedec', '141 Rue des Martyrs de la R├®sistance, 76150 Maromme', '02 35 75 61 02', '2021-05-27 09:42:55', '2021-05-27 09:42:55'),
(7, 'Litt', '5 Avenue Emile Basly, 76120 Le Grand-Quevilly', '02 35 36 00 21', '2021-05-27 09:43:38', '2021-05-27 09:43:38'),
(8, 'Legallais', 'Z.I. Est, Rue de la Grande ├ëpine Entree n┬░3, 76800 Saint-├ëtienne-du-Rouvray', '02 31 23 42 34', '2021-05-27 09:44:27', '2021-05-27 09:44:27');

-- --------------------------------------------------------

--
-- Structure de la table `teams`
--

DROP TABLE IF EXISTS `teams`;
CREATE TABLE `teams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `superviser_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `teams`
--

INSERT INTO `teams` (`id`, `name`, `superviser_id`, `created_at`, `updated_at`) VALUES
(1, 'LEROUX - CESBRON', 1, '2021-05-27 08:45:06', '2021-05-27 08:45:06');

-- --------------------------------------------------------

--
-- Structure de la table `team_members`
--

DROP TABLE IF EXISTS `team_members`;
CREATE TABLE `team_members` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `firstname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `reference` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title` enum('CHIEF','OF') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `team_members`
--

INSERT INTO `team_members` (`id`, `firstname`, `lastname`, `reference`, `contact`, `team_id`, `title`, `created_at`, `updated_at`) VALUES
(2, 'Noel', 'CESBRON', 'TM-CESB2', '1234', 1, 'CHIEF', '2021-05-27 08:43:09', '2021-05-27 08:45:06'),
(3, 'Christphe', 'PETIT', 'TM-PETI3', '1234', 1, 'OF', '2021-05-27 08:44:13', '2021-05-27 08:45:17'),
(4, 'Keith', 'HAMMOUDI', 'TM-HAMM4', '1234', NULL, 'OF', '2021-05-31 13:48:42', '2021-05-31 14:00:43'),
(5, 'Jean-Charles', 'COUTURE', 'TM-COUT5', '1234', NULL, 'CHIEF', '2021-05-31 13:51:29', '2021-05-31 14:06:14'),
(6, 'Fr├®d├®ric', 'HEBERT', 'TM-HEBE6', '1234', NULL, 'OF', '2021-05-31 13:52:56', '2021-05-31 14:07:06'),
(7, 'Jean-Michel', 'MASSE', 'TM-MASS7', '1234', NULL, 'CHIEF', '2021-05-31 13:53:26', '2021-05-31 14:07:30'),
(8, 'Yacine', 'DJELTI', 'TM-DJEL8', '1234', NULL, 'OF', '2021-05-31 13:53:46', '2021-05-31 14:07:47'),
(9, 'Boucha├»d', 'CHATIB', 'TM-CHAT9', '1234', NULL, 'CHIEF', '2021-05-31 13:54:07', '2021-05-31 14:08:06'),
(10, 'Mickael', 'SYDOW', 'TM-SYDO10', '1234', NULL, 'OF', '2021-05-31 13:57:00', '2021-05-31 14:08:22'),
(11, 'Nassir', 'HASSANI', 'TM-HASS11', '1234', NULL, 'OF', '2021-05-31 13:57:16', '2021-05-31 14:08:39'),
(12, 'Anissa', 'TOUMI', 'TM-TOUM12', '1234', NULL, 'OF', '2021-05-31 13:57:35', '2021-05-31 14:08:55'),
(13, 'Michel', 'VILLE', 'TM-VILL13', '1234', NULL, 'CHIEF', '2021-05-31 13:57:53', '2021-05-31 14:09:12'),
(14, 'Thomas', 'DUTHIL', 'TM-DUTH14', '1234', NULL, 'OF', '2021-05-31 13:58:22', '2021-05-31 14:09:29'),
(15, 'Alexandra', 'LE MEZO', 'TM-LE M15', '1234', NULL, 'CHIEF', '2021-05-31 13:58:45', '2021-05-31 14:09:45'),
(16, 'Nicolas', 'NIEL', 'TM-NIEL16', '1234', NULL, 'CHIEF', '2021-05-31 13:59:05', '2021-05-31 14:10:02'),
(17, 'Ibrahima', 'KEITA', 'TM-KEIT17', '1234', NULL, 'OF', '2021-05-31 13:59:25', '2021-05-31 14:10:19'),
(18, 'Abou', 'KAMARA', 'TM-KAMA18', '1234', NULL, 'OF', '2021-05-31 13:59:43', '2021-05-31 14:10:36'),
(20, 'Oph├®lie', 'LEVASSEUR', 'TM-LEVA20', '1234', NULL, 'OF', '2021-05-31 14:01:03', '2021-05-31 14:01:03'),
(21, 'Salim', 'BOUGHACHICHE', 'TM-BOUG21', '1234', NULL, 'CHIEF', '2021-05-31 14:01:32', '2021-05-31 14:01:32'),
(22, 'Hocine', 'BOUMEKOUEZ', 'TM-BOUM22', '1234', NULL, 'OF', '2021-05-31 14:01:53', '2021-05-31 14:01:53'),
(23, 'Dominique', 'FOLIOT', 'TM-FOLI23', '1234', NULL, 'CHIEF', '2021-05-31 14:02:09', '2021-05-31 14:02:42'),
(24, 'Abdelkader', 'MECELLEM', 'TM-MECE24', '1234', NULL, 'OF', '2021-05-31 14:03:10', '2021-05-31 14:03:10'),
(25, 'Moussa', 'DUQUESNE', 'TM-DUQU25', '1234', NULL, 'OF', '2021-05-31 14:03:29', '2021-05-31 14:03:29'),
(26, 'John', 'AGBONLAHOR', 'TM-AGBO26', '1234', NULL, 'OF', '2021-05-31 14:03:57', '2021-05-31 14:03:57'),
(27, 'Sandrine', 'BERZIN', 'TM-BERZ27', '1234', NULL, 'CHIEF', '2021-05-31 14:11:03', '2021-05-31 14:11:03'),
(28, 'Jennyfer', 'MERILHOU', 'TM-MERI28', '1234', NULL, 'OF', '2021-05-31 14:11:23', '2021-05-31 14:11:23'),
(29, 'Toufik', 'BENYAHIA', 'TM-BENY29', '1234', NULL, 'CHIEF', '2021-05-31 14:11:42', '2021-05-31 14:11:42'),
(30, 'Jonathan', 'VAN DE VELDE', 'TM-VAN 30', '1234', NULL, 'OF', '2021-05-31 14:12:03', '2021-05-31 14:12:03'),
(31, 'Ibrahima', 'DIAKHITE', 'TM-DIAK31', '1234', NULL, 'CHIEF', '2021-05-31 14:12:25', '2021-05-31 14:12:25'),
(32, 'Jason', 'COMMARIEU', 'TM-COMM32', '1234', NULL, 'OF', '2021-05-31 14:12:42', '2021-05-31 14:12:42'),
(33, 'Diego', 'TORRES', 'TM-TORR33', '1234', NULL, 'CHIEF', '2021-05-31 14:12:59', '2021-05-31 14:12:59'),
(34, 'Wilfried', 'NEVEU', 'TM-NEVE34', '1234', NULL, 'OF', '2021-05-31 14:13:21', '2021-05-31 14:13:21'),
(35, 'Hacene', 'AMMAR', 'TM-AMMA35', '1234', NULL, 'OF', '2021-05-31 14:13:35', '2021-05-31 14:13:35'),
(36, 'Manuel', 'LANCHON', 'TM-LANC36', '1234', NULL, 'CHIEF', '2021-05-31 14:13:57', '2021-05-31 14:13:57'),
(37, 'Tital', 'HASOYAN', 'TM-HASO37', '1234', NULL, 'CHIEF', '2021-05-31 14:14:17', '2021-05-31 14:14:17'),
(38, 'Mohamad', 'SAID', 'TM-SAID38', '1234', NULL, 'OF', '2021-05-31 14:14:35', '2021-05-31 14:14:35'),
(39, 'Laurent', 'COUETTE', 'TM-COUE39', '1234', NULL, 'CHIEF', '2021-05-31 14:18:44', '2021-05-31 14:18:44'),
(40, 'Samba', 'BA', 'TM-BA40', '1234', NULL, 'OF', '2021-05-31 14:18:59', '2021-05-31 14:18:59'),
(41, 'Abderezak', 'KAIS', 'TM-KAIS41', '1234', NULL, 'CHIEF', '2021-05-31 14:19:20', '2021-05-31 14:19:20'),
(42, 'Abderazac', 'DRIS', 'TM-DRIS42', '1234', NULL, 'OF', '2021-05-31 14:19:45', '2021-05-31 14:19:45'),
(43, 'Laura', 'DUCROQ', 'TM-DUCR43', '1234', NULL, 'CHIEF', '2021-05-31 14:20:08', '2021-05-31 14:20:08'),
(44, 'Abdelouaid', 'SADIK', 'TM-SADI44', '1234', NULL, 'OF', '2021-05-31 14:20:37', '2021-05-31 14:20:37'),
(45, 'David', 'PICORY', 'TM-PICO45', '1234', NULL, 'CHIEF', '2021-05-31 14:20:58', '2021-05-31 14:20:58'),
(46, 'Elodie', 'KEBATI', 'TM-KEBA46', '1234', NULL, 'OF', '2021-05-31 14:21:15', '2021-05-31 14:21:15'),
(47, 'Thierry', 'PIERRE', 'TM-PIER47', '1234', NULL, 'CHIEF', '2021-05-31 14:21:35', '2021-05-31 14:21:35'),
(48, 'St├®phane', 'DELAPORTE', 'TM-DELA48', '1234', NULL, 'OF', '2021-05-31 14:21:56', '2021-05-31 14:21:56'),
(49, 'Guy', 'BLED', 'TM-BLED49', '1234', NULL, 'CHIEF', '2021-05-31 14:22:12', '2021-05-31 14:22:12'),
(50, 'Gilles', 'QUAITON', 'TM-QUAI50', '1234', NULL, 'CHIEF', '2021-05-31 14:22:36', '2021-05-31 14:22:36'),
(51, 'Victor', 'DELRUE', 'TM-DELR51', '1234', NULL, 'OF', '2021-05-31 14:22:52', '2021-05-31 14:22:52'),
(52, 'Dino Julio', 'BOLOGNA', 'TM-BOLO52', '1234', NULL, 'CHIEF', '2021-05-31 14:23:10', '2021-05-31 14:23:10'),
(53, 'Nicolas', 'GRENECHE', 'TM-GREN53', '1234', NULL, 'CHIEF', '2021-05-31 14:23:34', '2021-05-31 14:23:34'),
(54, 'Franck', 'DELAUNAY', 'TM-DELA54', '1234', NULL, 'OF', '2021-05-31 14:23:53', '2021-05-31 14:23:53'),
(55, 'Renaud', 'LEROUX', 'TM-LERO55', '1234', NULL, 'CHIEF', '2021-05-31 14:24:07', '2021-05-31 14:24:07'),
(56, 'Kenny', 'PREVOST', 'TM-PREV56', '1234', NULL, 'OF', '2021-05-31 14:24:24', '2021-05-31 14:24:24'),
(57, 'Sylvie', 'PIERRAT OURSEL', 'TM-PIER57', '1234', NULL, 'CHIEF', '2021-05-31 14:24:48', '2021-05-31 14:24:48'),
(58, 'Jean-Claude', 'GROSJEAN', 'TM-GROS58', '1234', NULL, 'CHIEF', '2021-05-31 14:25:06', '2021-05-31 14:25:06'),
(59, 'Mostapha', 'JOUABRI', 'TM-JOUA59', '1234', NULL, 'OF', '2021-06-01 04:35:55', '2021-06-01 04:35:55'),
(60, 'Sofiane', 'BENCHIKI', 'TM-BENC60', '1234', NULL, 'OF', '2021-06-01 04:36:16', '2021-06-01 04:36:16'),
(61, 'Kevin', 'RATON', 'TM-RATO61', '1234', NULL, 'OF', '2021-06-01 04:36:34', '2021-06-01 04:36:34'),
(62, 'Dominique', 'CORREA', 'TM-CORR62', '1234', NULL, 'OF', '2021-06-01 04:36:53', '2021-06-01 04:36:53'),
(63, 'Dylan', 'DUPONT', 'TM-DUPO63', '1234', NULL, 'OF', '2021-06-01 04:37:17', '2021-06-01 04:37:17'),
(64, 'Sophie', 'DELRUE', 'TM-DELR64', '1234', NULL, 'CHIEF', '2021-06-01 04:37:39', '2021-06-01 04:37:39'),
(65, 'Malkhaz', 'KALOYAN', 'TM-KALO65', '1234', NULL, 'CHIEF', '2021-06-01 04:48:39', '2021-06-01 04:48:39'),
(66, 'Masoud', 'SULTANI', 'TM-SULT66', '1234', NULL, 'OF', '2021-06-01 04:49:20', '2021-06-01 04:49:20'),
(67, 'Sylvain', 'DAVID MAS', 'TM-DAVI67', '1234', NULL, 'CHIEF', '2021-06-01 04:52:45', '2021-06-01 04:52:45'),
(68, 'Mickael', 'CRETOT', 'TM-CRET68', '1234', NULL, 'CHIEF', '2021-06-01 04:58:13', '2021-06-01 04:58:13'),
(69, 'Sean', 'QUILCAILLE BAUER', 'TM-QUIL69', '1234', NULL, 'OF', '2021-06-01 04:58:40', '2021-06-01 04:58:40'),
(70, 'Eric', 'ROZE', 'TM-ROZE70', '1234', NULL, 'CHIEF', '2021-06-01 04:59:05', '2021-06-01 04:59:05'),
(71, 'Anthony', 'LEBECHEC', 'TM-LEBE71', '1234', NULL, 'CHIEF', '2021-06-01 04:59:28', '2021-06-01 04:59:28'),
(72, 'Bouhil', 'ABDELLATIF', 'TM-ABDE72', '1234', NULL, 'OF', '2021-06-01 04:59:50', '2021-06-01 04:59:50'),
(73, 'Johan', 'BENARD', 'TM-BENA73', '1234', NULL, 'OF', '2021-06-01 05:00:20', '2021-06-01 05:00:20'),
(74, 'James', 'ROZE', 'TM-ROZE74', '1234', NULL, 'CHIEF', '2021-06-01 05:00:37', '2021-06-01 05:00:37'),
(75, 'Julien', 'BARD', 'TM-BARD75', '1234', NULL, 'OF', '2021-06-01 05:01:02', '2021-06-01 05:01:02'),
(76, 'Arab', 'KAIS', 'TM-KAIS76', '1234', NULL, 'OF', '2021-06-01 05:01:17', '2021-06-01 05:01:17'),
(77, 'Fabien', 'LOUVEL', 'TM-LOUV77', '07 82 92 38 33', NULL, 'CHIEF', '2021-06-01 05:02:21', '2021-06-01 05:02:21');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Maurel', 'zandamaurel@abbei.org', '2021-05-27 06:38:14', '$2y$10$kFLaBDN1J8vPRyTh1jRlW.CLqaXR8vtg570612S.Kv6NGNS6qVSj2', '9Zbd3bxHEsIgm1o2VUgqcUqlssXAPVIEtr5soHaj0FCJbgqkUUpB22vYaAhq', '2021-05-27 06:38:14', '2021-05-27 06:38:14');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clients_superviser_id_foreign` (`superviser_id`);

--
-- Index pour la table `client_products`
--
ALTER TABLE `client_products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `client_product-unique` (`client_id`,`product_id`),
  ADD KEY `client_products_product_id_foreign` (`product_id`);

--
-- Index pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `mouvments`
--
ALTER TABLE `mouvments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mouvments_product_id_foreign` (`product_id`),
  ADD KEY `mouvments_team_member_id_foreign` (`team_member_id`),
  ADD KEY `mouvments_user_id_foreign` (`user_id`);

--
-- Index pour la table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Index pour la table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_reference_unique` (`reference`),
  ADD KEY `products_supplier_id_foreign` (`supplier_id`);

--
-- Index pour la table `stocks`
--
ALTER TABLE `stocks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `stocks_product_id_unique` (`product_id`);

--
-- Index pour la table `supervisers`
--
ALTER TABLE `supervisers`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teams_superviser_id_foreign` (`superviser_id`);

--
-- Index pour la table `team_members`
--
ALTER TABLE `team_members`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `team_members_reference_unique` (`reference`),
  ADD KEY `team_members_team_id_foreign` (`team_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `client_products`
--
ALTER TABLE `client_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `mouvments`
--
ALTER TABLE `mouvments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;

--
-- AUTO_INCREMENT pour la table `stocks`
--
ALTER TABLE `stocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;

--
-- AUTO_INCREMENT pour la table `supervisers`
--
ALTER TABLE `supervisers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `team_members`
--
ALTER TABLE `team_members`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `clients_superviser_id_foreign` FOREIGN KEY (`superviser_id`) REFERENCES `suppliers` (`id`);

--
-- Contraintes pour la table `client_products`
--
ALTER TABLE `client_products`
  ADD CONSTRAINT `client_products_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  ADD CONSTRAINT `client_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Contraintes pour la table `mouvments`
--
ALTER TABLE `mouvments`
  ADD CONSTRAINT `mouvments_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `mouvments_team_member_id_foreign` FOREIGN KEY (`team_member_id`) REFERENCES `team_members` (`id`),
  ADD CONSTRAINT `mouvments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`);

--
-- Contraintes pour la table `stocks`
--
ALTER TABLE `stocks`
  ADD CONSTRAINT `stocks_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Contraintes pour la table `teams`
--
ALTER TABLE `teams`
  ADD CONSTRAINT `teams_superviser_id_foreign` FOREIGN KEY (`superviser_id`) REFERENCES `supervisers` (`id`);

--
-- Contraintes pour la table `team_members`
--
ALTER TABLE `team_members`
  ADD CONSTRAINT `team_members_team_id_foreign` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
