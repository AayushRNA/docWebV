-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 06, 2022 at 12:36 PM
-- Server version: 5.7.33
-- PHP Version: 8.1.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `doctors`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `doctor_id` bigint(20) UNSIGNED NOT NULL,
  `patient_id` bigint(20) UNSIGNED NOT NULL,
  `date` datetime NOT NULL,
  `status` tinyint(1) NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`id`, `doctor_id`, `patient_id`, `date`, `status`, `subject`, `desc`, `created_at`, `updated_at`) VALUES
(1, 4, 2, '2022-05-10 00:00:00', 0, 'dddddddd', 'eeeeeeeeeee', '2022-05-06 04:21:49', '2022-05-06 04:21:49'),
(2, 4, 2, '2022-05-10 00:00:00', 0, 'natok', 'natok me', '2022-05-06 04:21:55', '2022-05-06 04:21:55'),
(3, 4, 2, '2022-05-10 00:00:00', 0, 'dddddddd', 'eeeeeeeeeee', '2022-05-06 04:37:53', '2022-05-06 04:37:53'),
(4, 4, 2, '2022-05-10 00:00:00', 0, 'dddddddd', 'eeeeeeeeeee', '2022-05-06 04:37:54', '2022-05-06 04:37:54'),
(5, 4, 2, '2022-05-10 00:00:00', 0, 'dddddddd', 'eeeeeeeeeee', '2022-05-06 04:37:54', '2022-05-06 04:37:54'),
(6, 4, 2, '2022-05-10 00:00:00', 0, 'dddddddd', 'eeeeeeeeeee', '2022-05-06 04:37:55', '2022-05-06 04:37:55'),
(7, 4, 2, '2022-05-10 00:00:00', 0, 'dddddddd', 'eeeeeeeeeee', '2022-05-06 04:37:55', '2022-05-06 04:37:55'),
(8, 4, 2, '2022-05-10 00:00:00', 0, 'dddddddd', 'eeeeeeeeeee', '2022-05-06 04:37:56', '2022-05-06 04:37:56');

-- --------------------------------------------------------

--
-- Table structure for table `doctor_profiles`
--

CREATE TABLE `doctor_profiles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `speciality` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qualification` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `experience` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2019_08_19_000000_create_failed_jobs_table', 1),
(9, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(10, '2022_04_22_005845_create_doctor_profiles_table', 1),
(11, '2022_04_22_010932_create_appointments_table', 1),
(12, '2022_04_22_011204_create_prescriptions_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('0dea0b2a2b0f18b333662d69e4400c596ad47cfb4bf838e47bed319d909c0689bd1ed76d387a9a82', 1, 1, 'MerijaanMeriJaanMerijaan', '[]', 0, '2022-05-05 12:41:56', '2022-05-05 12:41:56', '2023-05-05 18:41:56'),
('24e1eccd09ae8786550e4c886ed3e1cc9180e191825748eda860f06ae4030da0f7ca898fb50497ca', 1, 1, 'MerijaanMeriJaanMerijaan', '[]', 0, '2022-05-05 12:44:36', '2022-05-05 12:44:36', '2023-05-05 18:44:36'),
('2fcfb3c8145c6083d2e23e15c7066dd8e942156ddc834e753aaa27bfcd875ac9ba093f97f7203356', 1, 1, 'MerijaanMeriJaanMerijaan', '[]', 0, '2022-05-05 05:51:32', '2022-05-05 05:51:32', '2023-05-05 11:51:32'),
('3fb8ebe559fc33493ccb9405797dc0d0c3e2a120ca9ddd5a79ac1a5c54d211b40f85a839b756fb6c', 4, 1, 'MerijaanMeriJaanMerijaan', '[]', 0, '2022-05-06 05:42:37', '2022-05-06 05:42:37', '2023-05-06 11:42:37'),
('4ed7cdd3d3043e617b5a836986e85ccb42955098c9cb22f7a16281388d1f0329c2223b777526eabe', 1, 1, 'MerijaanMeriJaanMerijaan', '[]', 0, '2022-05-05 13:00:55', '2022-05-05 13:00:55', '2023-05-05 19:00:55'),
('4f7001e40bef40f3b477cec557e8e5caece7f061a6c3bf844900849b49b66a75e0971b21bd462a0a', 1, 1, 'MerijaanMeriJaanMerijaan', '[]', 0, '2022-05-05 12:38:08', '2022-05-05 12:38:08', '2023-05-05 18:38:08'),
('569a6c8682bf8d5ef8aeb79b42eb341a0e7bc4b97177ffef58ff9d2e27da34d1c89bfb1ba96723c5', 1, 1, 'MerijaanMeriJaanMerijaan', '[]', 0, '2022-05-05 12:49:06', '2022-05-05 12:49:06', '2023-05-05 18:49:06'),
('590fb603291c33a56147904c434153d4640e33c5e7cd98c001624072fc26dc4b57fc39941e69d50c', 1, 1, 'MerijaanMeriJaanMerijaan', '[]', 0, '2022-05-05 13:00:42', '2022-05-05 13:00:42', '2023-05-05 19:00:42'),
('5dc271b337014ad8de3bef7307cfcbce1bbd29aa28ccc3b57f8374aa61909fbe3d542208c202f30b', 1, 1, 'MerijaanMeriJaanMerijaan', '[]', 0, '2022-05-05 13:29:34', '2022-05-05 13:29:34', '2023-05-05 19:29:34'),
('61f1969ed8c135776f7f2b4fc80a2db96d33182d4f51ffa04288f33ac87b528287bb1b5d13a3aeb5', 9, 1, 'MerijaanMeriJaanMerijaan', '[]', 0, '2022-05-06 05:31:46', '2022-05-06 05:31:46', '2023-05-06 11:31:46'),
('64526a855e0f16dec6f7531008369e61453efafad85c8affe8dd19cfb4a04bd854645d58e87bf786', 1, 1, 'MerijaanMeriJaanMerijaan', '[]', 0, '2022-05-05 12:52:34', '2022-05-05 12:52:34', '2023-05-05 18:52:34'),
('65c0700daac758ecb18f86c2517167a33c08163d32b1c69ac77cb2b7749725503c8953a3ff6bf202', 1, 1, 'MerijaanMeriJaanMerijaan', '[]', 0, '2022-05-05 12:44:56', '2022-05-05 12:44:56', '2023-05-05 18:44:56'),
('6bf5e656cbf290cfccb9a34793b6845703861daf7c0e3b8ed2a050b56d1c1a1a1c8f7a8029776b63', 1, 1, 'MerijaanMeriJaanMerijaan', '[]', 0, '2022-05-05 12:58:10', '2022-05-05 12:58:10', '2023-05-05 18:58:10'),
('a4055dd5463048f3ca77ec8eceebd5d9f1224fe70557de686883e3bb2cf7763bb27e41417dc73ca5', 9, 1, 'MerijaanMeriJaanMerijaan', '[]', 0, '2022-05-06 05:32:31', '2022-05-06 05:32:31', '2023-05-06 11:32:31'),
('afb000b0af0074d357567ec19d0a5fed5242b96c57c765bdab513819b6a92ecb7eaf0efa863076d1', 1, 1, 'MerijaanMeriJaanMerijaan', '[]', 0, '2022-05-05 12:41:40', '2022-05-05 12:41:40', '2023-05-05 18:41:40'),
('afb8fa2b677552f820fb428e2aff2dcaee4141a4979aeb3a58be8858768c5c12c68ef331f22bf996', 9, 1, 'MerijaanMeriJaanMerijaan', '[]', 0, '2022-05-06 05:17:23', '2022-05-06 05:17:23', '2023-05-06 11:17:23'),
('b77fb4fb8d75b02b2611b679de1534571097d73c2c65caa7d359664fe999c1a55ec6bc25d5e13f55', 1, 1, 'MerijaanMeriJaanMerijaan', '[]', 0, '2022-05-05 13:40:09', '2022-05-05 13:40:09', '2023-05-05 19:40:09'),
('bc215f2136455ba80db0cabc9b59c47f7d385b0585c9f9945bd9c586e6cb00af82ed54a31491b9df', 1, 1, 'MerijaanMeriJaanMerijaan', '[]', 0, '2022-05-05 12:39:37', '2022-05-05 12:39:37', '2023-05-05 18:39:37'),
('c09c91cf4e377126b7e5178b32c95eefa4233a1ca6c9544ae59271c43e15e784e6a9c97b9691690c', 1, 1, 'MerijaanMeriJaanMerijaan', '[]', 0, '2022-05-05 12:39:52', '2022-05-05 12:39:52', '2023-05-05 18:39:52'),
('c4c9ea8b235d4676b889d8f655cc5d26d04335c6e6f7fd67d19c827e32d207c07b95d99517e70a9e', 1, 1, 'MerijaanMeriJaanMerijaan', '[]', 0, '2022-05-05 12:37:43', '2022-05-05 12:37:43', '2023-05-05 18:37:43'),
('ce7e04cb3603b0416da554e7b72e488f2b3aca56641dfd1dbb2b27d22628ce7d636a0deefb1465e7', 1, 1, 'MerijaanMeriJaanMerijaan', '[]', 0, '2022-05-05 12:48:36', '2022-05-05 12:48:36', '2023-05-05 18:48:36'),
('d2602bcfbc0e8ed3bd334dfd8c5b881555c3ebbabf6b939b01a35a90305adb2843bb3a2c7b5267db', 1, 1, 'MerijaanMeriJaanMerijaan', '[]', 0, '2022-05-05 12:38:32', '2022-05-05 12:38:32', '2023-05-05 18:38:32'),
('d85d11b6b6ceb728f9abe351d20dea06aa4ec6c6294e8f1ef71efaeee48578c504a2a5ee6d7bd0a7', 7, 1, 'MerijaanMeriJaanMerijaan', '[]', 0, '2022-05-06 05:03:15', '2022-05-06 05:03:15', '2023-05-06 11:03:15'),
('dd6b86e7f10b7cd0b1918baab14050709fdce51a031e389b034aac15ac931c0b72ec1f7c5fad7626', 1, 1, 'MerijaanMeriJaanMerijaan', '[]', 0, '2022-05-05 12:37:31', '2022-05-05 12:37:31', '2023-05-05 18:37:31'),
('df9a53f88eba17967655f18ff617bf5668d10fd8123b8c63587a8c715fc07c3e0397fe1f9b0f0d6c', 1, 1, 'MerijaanMeriJaanMerijaan', '[]', 0, '2022-05-05 12:48:22', '2022-05-05 12:48:22', '2023-05-05 18:48:22'),
('e2ec3e275a431dc61d658e23aa7b8d568575c57025c0a0c29b4cf6a3607d5a011f678bc78cb26eca', 1, 1, 'MerijaanMeriJaanMerijaan', '[]', 0, '2022-05-05 12:40:10', '2022-05-05 12:40:10', '2023-05-05 18:40:10'),
('ebc3bbcd9e0acb63e823b1f2b26d3dc98a175293cbb96e62685425b8a82aba2eb6107cbee56f7070', 1, 1, 'MerijaanMeriJaanMerijaan', '[]', 0, '2022-05-05 12:36:21', '2022-05-05 12:36:21', '2023-05-05 18:36:21'),
('ecf5d124186e56f60a5477f7e4c77f7e9da52b9a419cf2e470608f55db25e4de01a0baa3c01f0ff5', 1, 1, 'MerijaanMeriJaanMerijaan', '[]', 0, '2022-05-05 12:50:21', '2022-05-05 12:50:21', '2023-05-05 18:50:21'),
('ef4537697b1a9d3dbd9c3970cbaf1fb8c3f8c0dfbd9ff1ae26444649226418e3dffd8334e8533c10', 2, 1, 'MerijaanMeriJaanMerijaan', '[]', 0, '2022-05-06 03:24:18', '2022-05-06 03:24:18', '2023-05-06 09:24:18'),
('f0156752feffa9c37f08e2114193c56d98c9cc355ec5a38952a80a11223ba278eb09f3887663fcf6', 1, 1, 'MerijaanMeriJaanMerijaan', '[]', 0, '2022-05-06 03:15:44', '2022-05-06 03:15:44', '2023-05-06 09:15:44'),
('f1f7f290ef3da9a9fe3b5a7c374490cf2e958090fb6d4e21e49ddd2ed9839296babd4c8bf50d4f25', 1, 1, 'MerijaanMeriJaanMerijaan', '[]', 0, '2022-05-05 12:44:16', '2022-05-05 12:44:16', '2023-05-05 18:44:16');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'lmxilFLzfw5voFaDBLmwEj2z2YPjXYNFHwTKFHwk', NULL, 'http://localhost', 1, 0, 0, '2022-05-05 05:51:25', '2022-05-05 05:51:25'),
(2, NULL, 'Laravel Password Grant Client', 'lbPSvnNEDAQH97W8tBuXUVfGn9GsjbHXDltK7PYe', 'users', 'http://localhost', 0, 1, 0, '2022-05-05 05:51:25', '2022-05-05 05:51:25');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2022-05-05 05:51:25', '2022-05-05 05:51:25');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `prescriptions`
--

CREATE TABLE `prescriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `doctor_id` bigint(20) UNSIGNED NOT NULL,
  `patient_id` bigint(20) UNSIGNED NOT NULL,
  `appointment_id` bigint(20) UNSIGNED NOT NULL,
  `date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `medicine` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dosage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `instruction` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `prescriptions`
--

INSERT INTO `prescriptions` (`id`, `doctor_id`, `patient_id`, `appointment_id`, `date`, `medicine`, `dosage`, `instruction`, `created_at`, `updated_at`) VALUES
(1, 4, 2, 3, '2022-05-06 12:16:51', 'wwwww', 'www', 'wwwwwwwwww', '2022-05-06 06:16:51', '2022-05-06 06:16:51'),
(2, 4, 2, 3, '2022-05-06 12:16:52', 'wwwww', 'www', 'wwwwwwwwww', '2022-05-06 06:16:52', '2022-05-06 06:16:52'),
(3, 4, 2, 3, '2022-05-06 12:16:57', 'ssssss', 'ssssssssssss', 'sssssssssssssssss', '2022-05-06 06:16:57', '2022-05-06 06:16:57'),
(4, 4, 2, 3, '2022-05-06 12:17:27', 'ssssss', 'ssssssssssss', 'sssssssssssssssss', '2022-05-06 06:17:27', '2022-05-06 06:17:27'),
(5, 4, 2, 3, '2022-05-06 12:17:37', 'ssssss', 'ssssssssssss', 'sssssssssssssssss', '2022-05-06 06:17:37', '2022-05-06 06:17:37');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `speciality` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qualification` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `experience` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`, `speciality`, `qualification`, `experience`, `address`, `phone`) VALUES
(1, 'admin@mail.com', 'admin@mail.com', NULL, '$2y$10$L1qdi/i49/BqrzHG6WPxCOFnW3mpsGQMh4Uibl4AM1JwfJsBHyaCa', 'patient', NULL, '2022-05-05 05:50:30', '2022-05-05 05:50:30', 'Dermatologists', 'qualification', 'experience', 'address', 'number'),
(2, 'rumon', 'rumon@mail.com', NULL, '$2y$10$L1qdi/i49/BqrzHG6WPxCOFnW3mpsGQMh4Uibl4AM1JwfJsBHyaCa', 'doctor', NULL, NULL, NULL, 'Ophthalmologists', 'qualification', 'experience', 'address', 'number'),
(4, 'prince', 'prince@mail.com', NULL, '$2y$10$L1qdi/i49/BqrzHG6WPxCOFnW3mpsGQMh4Uibl4AM1JwfJsBHyaCa', 'doctor', NULL, NULL, NULL, 'Cardiologists', 'qualification', 'experience', 'address', 'number'),
(5, 'sakil', 'sakil@mail.com', NULL, '$2y$10$L1qdi/i49/BqrzHG6WPxCOFnW3mpsGQMh4Uibl4AM1JwfJsBHyaCa', 'doctor', NULL, NULL, NULL, 'Endocrinologists', 'qualification', 'experience', 'address', 'number'),
(6, 'zara', 'zara@mail.com', NULL, '$2y$10$L1qdi/i49/BqrzHG6WPxCOFnW3mpsGQMh4Uibl4AM1JwfJsBHyaCa', 'doctor', NULL, NULL, NULL, 'Gastroenterologists', 'qualification', 'experience', 'address', 'number'),
(7, 'natok', 'natok@mail.com', NULL, '$2y$10$YMJ6ZVTrno0IPA300xFy8uMkunt7pe1AWy2aywYheJBE9.LZgT3vW', 'patient', NULL, '2022-05-06 05:02:59', '2022-05-06 05:02:59', NULL, NULL, NULL, NULL, NULL),
(8, '4444444', 'fdgsdf@mdfl.com', NULL, '$2y$10$nV/RozSI7.zbPAd/zGlcDeFDmQtye7G3vZbxJK9aG/Kbad82Aho/q', 'doctor', NULL, '2022-05-06 05:16:42', '2022-05-06 05:16:42', 'ert', 'rter', 'dfgert', 'gfdfgdf', NULL),
(9, 'me doctor 2', 'doctor2@mail.com', NULL, '$2y$10$Gv3HVmDRZVRxZynelY4anuDG6tFt7X1hKnKvE.WPcZL9rSNmqwCr2', 'doctor', NULL, '2022-05-06 05:16:46', '2022-05-06 05:16:46', '3333333333333', 'fffffffffffffffff', 'ffffffffffff', 'fffffffffffffffff', 'ffffffffffffwe');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctor_profiles`
--
ALTER TABLE `doctor_profiles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `prescriptions`
--
ALTER TABLE `prescriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `doctor_profiles`
--
ALTER TABLE `doctor_profiles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `prescriptions`
--
ALTER TABLE `prescriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
