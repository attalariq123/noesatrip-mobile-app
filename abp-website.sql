-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 02, 2022 at 11:13 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `abp-website`
--

-- --------------------------------------------------------

--
-- Table structure for table `destinations`
--

CREATE TABLE `destinations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_path` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `overall_rating` decimal(8,1) DEFAULT 0.0,
  `total_review` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `destinations`
--

INSERT INTO `destinations` (`id`, `kode`, `name`, `description`, `price`, `city`, `image_path`, `overall_rating`, `total_review`, `created_at`, `updated_at`) VALUES
(13, 'KPN', 'Kampung Naga', 'Berada di lembah bukit yang asri, Kampung Naga adalah sebuah desa adat di Tasikmalaya, Jawa Barat yang tak cuma menawarkan keindahan masyarakat yang masih memegang teguh adat istiadat leluhur namun juga keindahan alamnya yang masih sangat asri. Masyarakat di Kampung Naga juga terkenal akan keramahannya sehingga menjadikannya sebagai salah satu destinasi desa wisata favorit di Jawa Barat.', '650000', 'Tasikmalaya, Jawa Barat', 'http://localhost:8000/storage/destination_img/5Fm8fnYZ5mW5ddh6Q2zOwz8lIWctL8d2fzBgZ52Y.jpg', '0.0', 0, '2022-04-10 05:57:41', '2022-06-27 10:16:24'),
(14, 'DTR', 'Desa Trunyan', 'Desa adat yang masih sangat kental akan tradisi dan adat budayanya ini berada di dekat Danau Batur sehingga pemandangan di desa adat Indonesia satu ini sangat menawan. Namun, yang menjadi daya tarik utama dari desa adat di Indonesia ini adalah tradisi masyarakatnya yakni tata cara pemakaman yang berbeda dengan cara pemakaman konvensional dimana jenazah tidaklah dikubur melainkan diletakkan di bawah pohon Teru Menyan hingga terurai dan menyatu dengan tanah.', '1400000', 'Dewata, Bali', 'http://localhost:8000/storage/destination_img/iFXqCoYdLkZ34DlUqqAYS5Qhx7llx5Lfci2A4yEg.jpg', '0.0', 0, '2022-04-10 05:59:29', '2022-06-27 10:16:40'),
(15, 'DAP', 'Desa Adat Praijing', 'Desa adat di Indonesia selanjutnya masih berada di Nusa Tenggara Timur, tepatnya pulau Sumba dimana Toppers bisa mengunjungi Desa Adat Praijing.', '780000', 'Sumba, Nusa Tenggara Timur', 'http://localhost:8000/storage/destination_img/I39eV2mGVT6Jzl1aKj3VCGquPo4p3c5rDqKrmEgM.jpg', '0.0', 0, '2022-04-10 06:01:11', '2022-06-27 10:17:55'),
(16, 'DKK', 'Desa Kete Kesu', 'Telah berusia ratusan tahun, Desa adat Kete Kesu merupakan salah satu desa adat kebanggaan masyarakt Tana Toraja. Desa Kete Kesu yang berada di Sulawesi Selatan ini sangat populer akan keberadaan rumah adat tongkonan khas Toraja yang berdiri megah di desa adat ini.\r\n\r\nDaya tarik lainnya dari desa adat Indonesia satu ini adalah ragam tradisi dan adat istiadat warisan leluhur yang masih dipegang teguh hingga saat ini seperti proses penguburan jenazah di dinging batu yang masih sering dilakukan oleh masyarakat yang tinggal di desa adat ini.', '850000', 'Toraja, Sulawesi Selatan', 'http://localhost:8000/storage/destination_img/HXC5vBntvtUG0tjwFkAk5YAZhvEIHG5bmOJG6lQ3.jpg', '0.0', 0, '2022-04-10 06:04:36', '2022-06-27 10:18:17'),
(17, 'DTS', 'Desa Torosiaje', 'Masih berada di pulau Sulawesi, lebih tepatnya Gorontalo, Toppers bisa mengunjungi Desa adat Torosiaje yang menjadi rumah bagi masyarakat Suku Bajo yang terkenal sebagai nelayan yang handal. Karena mayoritas penduduk yang berprofesi sebagai Nelayan, tak heran jika perkampungan adat ini berdiri terapung di atas permukaan air pinggiran pantai. Unik sekali, bukan?', '1200000', 'Pohuwato, Gorontalo', 'http://localhost:8000/storage/destination_img/R92exakrkl8oniAoo1JPncqZ3SvZyQGRu5iQpt83.jpg', '0.0', 0, '2022-04-10 06:06:21', '2022-06-27 10:18:43'),
(18, 'DDP', 'Desa Dayak Pampang', 'Suku Dayak merupakan salah satu kelompok etnik di Nusantara yang mendiami daratan Kalimantan. Suku Dayak sendiri memiliki nilai-nilai kearifan budaya yang sangat kaya dan cukup menarik untuk dijelajahi. Salah satu cara untuk bisa mempelajari lebih dekat mengenai kebudayaan suku Dayak adalah dengan mengunjungi Desa Adat Dayak Pampang yang sejak 1991 telah diresmikan sebagai salah satu Desa Wisata di Indonesia.', '1100000', 'Samarinda, Kalimantan Timur', 'http://localhost:8000/storage/destination_img/4pOFsJW6Dqtyklu0P8hoTjLntOwlukJyu64RxXLo.jpg', '0.0', 0, '2022-04-10 06:21:26', '2022-06-27 10:19:14'),
(19, 'DAG', 'Desa Adat Gumantar', 'Lombok memang terkenal akan keindahan bentang alam dan wisata bahari yang dimilikinya. Namun, siapa sangka jika Lombok juga memiliki kekayaan budaya yang tak kalah menarik untuk di-eksplorasi. Salah satunya dengan cara mengunjungi Desa Adat Gumantar yang masih mempertahankan tradisi-tradisi warisan leluhur, termasuk rumah-rumah tradisional berkontruksi bambu yang mendominasi perkampungan adat ini.', '950000', 'Lombok Utara, Nusa Tenggara Barat', 'http://localhost:8000/storage/destination_img/vnZK7vzUu7OYiJVHPvSifU7Mkpb5WKnRLm0enGvr.jpg', '0.0', 0, '2022-04-10 06:24:51', '2022-06-27 10:19:28'),
(20, 'KAS', 'Kampung Adat Sijunjing', 'Berlokasi di Kabupaten Sijunjung, Sumatera Barat, Kampung Adat Sinjunjung merupakan desa wisata selanjutnya yang bisa kamu kunjungi untuk melihat, lebih dekat kebudayaan masyarakat-masyarakat adat yang ada di Sumatera Barat. Di sepanjang jalan menyusuri desa adat Indonesia satu ini, kamu akan disuguhkan rumah-rumah Gadang yang berdiri rapi berhadap-hadapan. Di kampung adat ini sendiri dihuni oleh suku-suku Chaniago, Melayu, Pana, Tono, dan Melayu Tak Timbago.', '600000', 'Sijunjung, Sumatera Barat', 'http://localhost:8000/storage/destination_img/ef9IMP5elOw5xKOl6t6PLMbisQ7sPRvXwk8JyWCt.jpg', '0.0', 0, '2022-04-10 06:26:11', '2022-06-27 10:19:41'),
(21, 'KAT', 'Kampung Adat Todo', 'Selain Kampung Adat Wae Rebo, di Manggarai juga bisa singgah ke Desa Adat Tobo yang terkenal akan arsitektur Rumah Adat Todo yang disebut-sebut sebagai salah satu rumah adat tertua yang ada di Manggarai. Arsitektur dari Rumah Adat Todo sendiri hampir menyerupai rumah-rumah adat di kawasan Nusa Tenggara Timur lainnya, yakni mengerucut dan menjulang tinggi ke atas.', '1350000', 'Flores, Nusa Tenggara Timur', 'http://localhost:8000/storage/destination_img/opvGkEDrotk25FXtb1ndT1JzLY2c7Tr4ODsHNvCD.jpg', '0.0', 0, '2022-04-10 06:31:46', '2022-06-27 10:19:53'),
(25, 'DWS', 'Desa Wisata Setulang', 'Destinasi desa wisata di Indonesia yang sarat akan nilai-nilai kebudayaan dan adat istiadat selanjutnya adalah Desa Wisata Setulang. Berada di Kabupaten Malinau, Kalimantan Utara, di desa adat Indonesia satu ini kamu bisa melihat kekentalan dari budaya adat masyarakat Dayak Kenyah Oma Lung. Selain beragam tradisi adat khas masyarakat Dayak Kenyah Oma Lung, kampung adat ini juga dikelilingi bentang alam yang sangat memukau. Salah satu destinasi wisata alam yang bisa dijelajahi saat berkunjung ke desa adat Indonesia satu ini adalah Hutan Desa Tana’ Ulen dan sebuah air terjun disekitarnya.', '999000', 'Malinau, Kalimantan Utara', 'http://localhost:8000/storage/destination_img/MPh5sggUvTV7uoa53L5JqMTxmkT4mOnq0mjSsomr.jpg', '0.0', 0, '2022-04-10 06:44:16', '2022-06-27 10:20:06'),
(26, 'DWR', 'Desa Wae Rebo', 'Desa adat di Indonesia satu ini kini tengah populer baik di dalam maupun luar negeri dan dikenal akan arsitektur rumah adat-nya yang sangat unik yang berbentuk kerucut dan menjulang tinggi. Rumah adat yang disebut Mbaru Niang ini menjadi salah satu daya tarik dari Wae Rebo, sebuah kampung adat di Manggarai, Nusa Tenggara Timur yang telah terdaftar sebagai salah satu situs kekayaan dunia oleh UNESCO. Selain itu, kebudayaan, adat istiadat yang kental, serta keindahan alam yang masih sangat asri menjadi alasan lain mengapa banyak traveler yang tertarik mengeksplorasi kampung adat di Indonesia satu ini.', '1400000', 'Manggarai, Nusa Tenggara Timur', 'http://localhost:8000/storage/destination_img/yomPaWY94YWof7y9CIaXVfdTQb2oLg0YN3anUiPL.jpg', '0.0', 0, '2022-04-10 06:45:33', '2022-06-27 10:20:19'),
(27, 'ASB', 'Desa Adat Suku Baduy', 'Desa Adat Suku Baduy yang berada di Banten merupakan salah satu destinasi wisata kampung adat yang cukup populer. Desa adat yang dihuni oleh Urang Kaneker (sebutan untuk orang Baduy) ini sangat unik karena masyarakat di desa adat ini terisolasi dari dunia luar yang artinya Toppers takkan bisa menemukan peralatan elektronik dan teknologi modern di desa adat ini. Salah satu ciri khas dari masyarakat di kampung adat ini adalah pakaiannya yang berwarna putih alami dan biru tua (warna tarum) serta memakai ikat kepala putih.', '560000', 'Lebak, Banten', 'http://localhost:8000/storage/destination_img/J8H3YOSODihcrwLIDtBbgn7mN0zesk4Rq5xlBYks.jpg', '0.0', 0, '2022-04-10 06:46:47', '2022-06-27 10:21:53'),
(44, 'TST', 'Desa Test', 'ini test', '900000', 'test, test city', 'http://localhost:8000/storage/destination_img/NOKOGSkPCNciPvmJCJY4E2HSP5Ke9NJKVuEzchDx.jpg', '0.0', 0, '2022-07-02 02:08:29', '2022-07-02 02:08:29');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `destination_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `destination_id`, `name`, `description`, `duration`, `created_at`, `updated_at`) VALUES
(1, 21, 'Upacara Adat', 'Suatu rangkaian penghormatan kepada leluhur.', 60, '2022-04-12 06:19:21', '2022-04-15 06:02:58'),
(2, 14, 'Ziarah Makan', 'Penghormatan kepada para leluhur.', 60, '2022-04-12 23:11:39', '2022-04-15 02:08:20'),
(3, 13, 'Kesenian Tari', 'Sebuah pertunjukan pentas seni tari.', 90, '2022-04-15 05:45:42', '2022-04-15 05:45:42');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `destination_id` bigint(20) UNSIGNED NOT NULL,
  `start_date` date NOT NULL,
  `duration` int(8) NOT NULL,
  `ticket_quantity` int(11) NOT NULL,
  `total_amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_status` enum('pending','success') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `destination_id`, `start_date`, `duration`, `ticket_quantity`, `total_amount`, `payment_status`, `created_at`, `updated_at`) VALUES
(22, 41, 13, '2022-06-28', 1, 1, '650000', 'success', '2022-06-27 10:41:22', '2022-06-27 10:41:29'),
(23, 41, 26, '2022-06-30', 1, 5, '7000000', 'pending', '2022-06-30 04:54:58', '2022-06-30 04:54:58'),
(24, 41, 17, '2022-07-08', 3, 2, '7200000', 'pending', '2022-07-01 00:23:16', '2022-07-01 00:23:16'),
(25, 41, 13, '2022-07-30', 2, 1, '1300000', 'success', '2022-07-01 04:52:11', '2022-07-01 10:12:00'),
(26, 44, 19, '2022-07-30', 3, 1, '2850000', 'success', '2022-07-01 10:01:03', '2022-07-01 10:11:54'),
(27, 44, 16, '2022-07-15', 2, 1, '1700000', 'pending', '2022-07-01 10:11:04', '2022-07-01 10:11:04'),
(28, 44, 16, '2022-07-15', 2, 1, '1700000', 'success', '2022-07-01 10:11:05', '2022-07-01 10:11:49'),
(29, 41, 16, '2022-07-23', 2, 2, '3400000', 'pending', '2022-07-01 10:55:56', '2022-07-01 10:55:56'),
(30, 45, 13, '2022-07-06', 5, 3, '9750000', 'success', '2022-07-02 02:09:39', '2022-07-02 02:10:00');

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
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(6, 'App\\Models\\User', 10, 'myapptoken', '800315370b998fbbebef6c9ec5e9723ff588c077e6d8f2d1a69529c85131e4cb', '[\"*\"]', NULL, '2022-06-12 02:03:50', '2022-06-12 02:03:50'),
(7, 'App\\Models\\User', 11, 'myapptoken', '90d3107867e8b1ebfdfe20c16cfefd7eafcbd4d82fa8b456b4f5f1c77c80e4d9', '[\"*\"]', NULL, '2022-06-13 00:28:10', '2022-06-13 00:28:10'),
(8, 'App\\Models\\User', 12, 'myapptoken', 'cfbd0fcab8c822759138291e14bc6143c2d4204599b90ff88e0177f8c8bef6fa', '[\"*\"]', NULL, '2022-06-13 00:58:52', '2022-06-13 00:58:52'),
(9, 'App\\Models\\User', 13, 'myapptoken', '08f2c4e7233508c062a377d6f11ff7aa78ea01e4c574f8949ff01027bbcc1f0a', '[\"*\"]', NULL, '2022-06-13 01:08:28', '2022-06-13 01:08:28'),
(10, 'App\\Models\\User', 14, 'myapptoken', '0c74f908a25f81b37cb9f500bc2a598d22271f796bb1132fb32f4d106842da16', '[\"*\"]', NULL, '2022-06-13 01:10:06', '2022-06-13 01:10:06'),
(11, 'App\\Models\\User', 15, 'myapptoken', '7ab4b4a63a60476326a37d9b3352d98790d7455dd5ea25175b8f0684843753e6', '[\"*\"]', NULL, '2022-06-13 02:07:52', '2022-06-13 02:07:52'),
(12, 'App\\Models\\User', 16, 'myapptoken', '03d4658b60bd2d1d91033001d8645224cd2ec139f8df80ba31b16225a38abb8b', '[\"*\"]', NULL, '2022-06-13 02:12:33', '2022-06-13 02:12:33'),
(13, 'App\\Models\\User', 17, 'myapptoken', 'bd1662f8da368c92ccb44ef03a50973d62a2714765253ee58d3c715b6e838d5a', '[\"*\"]', NULL, '2022-06-13 02:26:47', '2022-06-13 02:26:47'),
(14, 'App\\Models\\User', 18, 'myapptoken', '545e23136ecc174792eaf8de40a56f62c314e023ec3f1c9dafde555f060bce71', '[\"*\"]', NULL, '2022-06-13 02:28:58', '2022-06-13 02:28:58'),
(15, 'App\\Models\\User', 19, 'myapptoken', 'bc624f05143d730dab1d94002dca93af2c5cf68cbd99a0d151cdbf7acbd3ce75', '[\"*\"]', NULL, '2022-06-13 02:30:24', '2022-06-13 02:30:24'),
(16, 'App\\Models\\User', 20, 'myapptoken', 'c1fdd385058ea6d8dbec1fd90972e4daf56e4c621be8ce75e218345b7f342fba', '[\"*\"]', NULL, '2022-06-13 02:31:30', '2022-06-13 02:31:30'),
(17, 'App\\Models\\User', 21, 'myapptoken', 'eba04fc3baac45330a448366386d984656c6f7215433c0e32c68a3bf25440bca', '[\"*\"]', NULL, '2022-06-13 02:33:48', '2022-06-13 02:33:48'),
(18, 'App\\Models\\User', 22, 'myapptoken', '3dc26688b056875772161c5cdcb3d395ed1dc90cc2271a5712e2fb5c30afec76', '[\"*\"]', NULL, '2022-06-13 02:37:06', '2022-06-13 02:37:06'),
(19, 'App\\Models\\User', 23, 'myapptoken', '144ab2661af00670f0fa57cd4ae020926969ab1a8a41361b39d752265d925202', '[\"*\"]', NULL, '2022-06-13 02:38:26', '2022-06-13 02:38:26'),
(20, 'App\\Models\\User', 24, 'myapptoken', '875ac5d5c95cd70869fb0afd5d6aef300b6e046921dfeade15caa5fbfb2d69bc', '[\"*\"]', NULL, '2022-06-13 02:41:06', '2022-06-13 02:41:06'),
(21, 'App\\Models\\User', 25, 'myapptoken', '5944fa25cbce69bbce18f0a6a814d3b2f3c812b1bf094cabb9464b4dc02abf9a', '[\"*\"]', NULL, '2022-06-13 02:42:59', '2022-06-13 02:42:59'),
(22, 'App\\Models\\User', 26, 'myapptoken', 'c45fe07e361c315715eae3c43dcf522d7ef06928bcb4dc801fc9d10355b78c2b', '[\"*\"]', NULL, '2022-06-13 02:43:54', '2022-06-13 02:43:54'),
(23, 'App\\Models\\User', 27, 'myapptoken', 'f028b1a8f9f8f122dd6f235d170f5765d328abb160816b6fe40957191565de3e', '[\"*\"]', NULL, '2022-06-13 02:45:29', '2022-06-13 02:45:29'),
(24, 'App\\Models\\User', 28, 'myapptoken', '5f2a5176b1dd29cd2bc28d68cf9ead15ced150e8ba0a338e15a1faf68adf61d7', '[\"*\"]', NULL, '2022-06-13 02:46:47', '2022-06-13 02:46:47'),
(25, 'App\\Models\\User', 29, 'myapptoken', '47086f75c3d39870e02a01c3f8406bcdc3e5000c8724fcbf262b50bd2b87c5ea', '[\"*\"]', NULL, '2022-06-13 02:58:00', '2022-06-13 02:58:00'),
(26, 'App\\Models\\User', 30, 'myapptoken', 'db4ab5c0cca7f4fb2c77a9874259d2337c8e6eb62abc0710bf53ebf96d87b719', '[\"*\"]', NULL, '2022-06-13 03:01:38', '2022-06-13 03:01:38'),
(27, 'App\\Models\\User', 31, 'myapptoken', 'e207c8e13bd60f0eea8a3acfca35cf813041c1b8eef0ca436d705cdd64a2c13e', '[\"*\"]', NULL, '2022-06-13 03:04:28', '2022-06-13 03:04:28'),
(28, 'App\\Models\\User', 32, 'myapptoken', '2408e09757f22b8f3e29e30ac08ff114fb68715e79910de280d3a9cb3f15f949', '[\"*\"]', NULL, '2022-06-13 03:07:52', '2022-06-13 03:07:52'),
(29, 'App\\Models\\User', 33, 'myapptoken', '2ececce16d3296bd65a7e8806d3bd65341e773c08ce12dabf979f3f4f40e0781', '[\"*\"]', NULL, '2022-06-13 03:08:57', '2022-06-13 03:08:57'),
(30, 'App\\Models\\User', 34, 'myapptoken', '04d1459aec6fb96ec15a5648ed61fcd654eab86e42a44cc7dba56dcbfd0f48b8', '[\"*\"]', NULL, '2022-06-13 03:12:13', '2022-06-13 03:12:13'),
(31, 'App\\Models\\User', 35, 'myapptoken', '70df9cf65472afc7ad56b95fa03a89cf05f4f94ecc12e23312ca7c2d98d8b94d', '[\"*\"]', NULL, '2022-06-13 03:21:52', '2022-06-13 03:21:52'),
(32, 'App\\Models\\User', 36, 'myapptoken', 'd1221c625559bcd8a81a8d22478c07234668e906f3cafa6c7f120b2f06549fbc', '[\"*\"]', NULL, '2022-06-13 06:37:05', '2022-06-13 06:37:05'),
(33, 'App\\Models\\User', 37, 'myapptoken', 'b8902a66c46c5a8fd1bc518a4cf936e227ed97b420891b67db4a77efb1a3e207', '[\"*\"]', NULL, '2022-06-13 06:57:07', '2022-06-13 06:57:07'),
(34, 'App\\Models\\User', 37, 'myapptoken', '6d991309b96bb57d965841af2549f86b45d664538f51962b8d050fbf3316ad09', '[\"*\"]', NULL, '2022-06-13 06:59:58', '2022-06-13 06:59:58'),
(35, 'App\\Models\\User', 38, 'myapptoken', '20ee421660b0eb5186b2a8a47f1c7577fc67b565ae59eec5a5998448ad907686', '[\"*\"]', NULL, '2022-06-13 07:26:18', '2022-06-13 07:26:18'),
(36, 'App\\Models\\User', 39, 'myapptoken', '99c48f534ef7c251a5eb7f37a4e360e58bb77b51a451dbfdfea36f02358b5064', '[\"*\"]', NULL, '2022-06-13 07:46:33', '2022-06-13 07:46:33'),
(37, 'App\\Models\\User', 40, 'myapptoken', '8bc35fd046329ac0481cfeddc1b87dee8b77b5e9cdea715f70b4cc245c35ee54', '[\"*\"]', NULL, '2022-06-13 07:48:24', '2022-06-13 07:48:24'),
(38, 'App\\Models\\User', 40, 'myapptoken', 'f2ea8d458b9c7f190ec8d410ec944f034e64eba7ef142c0e6e911de117af29bc', '[\"*\"]', NULL, '2022-06-13 07:49:26', '2022-06-13 07:49:26'),
(39, 'App\\Models\\User', 39, 'myapptoken', '56546ae9847f292a6ec4f3ef4cd57d1521ceaeb5d3e40b5b95e463b07f5463b4', '[\"*\"]', NULL, '2022-06-13 07:50:21', '2022-06-13 07:50:21'),
(40, 'App\\Models\\User', 39, 'myapptoken', '865718c2bc4118b5944d504dc325785c6fbe1f3f339b5f8cb18db92744250088', '[\"*\"]', NULL, '2022-06-13 07:53:14', '2022-06-13 07:53:14'),
(41, 'App\\Models\\User', 39, 'myapptoken', 'bef901c65073e18a9a27c8c15f7e6e8f27da1b0cd8237663df387ec11d87127d', '[\"*\"]', NULL, '2022-06-13 07:56:12', '2022-06-13 07:56:12'),
(42, 'App\\Models\\User', 39, 'myapptoken', 'd208971f1ba666d7b8f1b6b561c423efb9e55708ac6d3a4caa3e24de5a77f369', '[\"*\"]', NULL, '2022-06-13 07:58:46', '2022-06-13 07:58:46'),
(43, 'App\\Models\\User', 39, 'myapptoken', 'e748c9d28ea072047d0adcf8fa1f276fef86b63b6089157ede1974223757070f', '[\"*\"]', NULL, '2022-06-13 08:13:24', '2022-06-13 08:13:24'),
(44, 'App\\Models\\User', 39, 'myapptoken', 'f1ac4a422bb9a30d16c0fe6e603a17483ec31b7753b08e4fb41e31e9a57fe9d4', '[\"*\"]', NULL, '2022-06-13 08:20:53', '2022-06-13 08:20:53'),
(45, 'App\\Models\\User', 39, 'myapptoken', '80c46abbdfdf2d68a3ffa42fe04eb5fc95932cbba15490d280050cbfbbfea7c8', '[\"*\"]', NULL, '2022-06-13 08:27:11', '2022-06-13 08:27:11'),
(46, 'App\\Models\\User', 39, 'myapptoken', 'add64732e70b5f82e58df1d69d2dc73b219afa03fb685f2aa1945e5585e94b66', '[\"*\"]', NULL, '2022-06-13 08:29:50', '2022-06-13 08:29:50'),
(65, 'App\\Models\\User', 4, 'myapptoken', '3122821b42413fcf36a0153796d8150d40845ad7259ce91273eee6302cb3f820', '[\"*\"]', '2022-06-14 04:25:36', '2022-06-14 03:22:09', '2022-06-14 04:25:36'),
(66, 'App\\Models\\User', 5, 'myapptoken', 'c958a56ece3ff6741e6fd33e3ff95af4679ccf72c92884edb1ebb659a3489dd7', '[\"*\"]', '2022-06-14 05:18:51', '2022-06-14 04:27:27', '2022-06-14 05:18:51'),
(78, 'App\\Models\\User', 43, 'myapptoken', 'c32b70bad6ec516f1e2e3b174c97b0f259ceb3dd3ffc126a36454a08c311eb0d', '[\"*\"]', '2022-06-15 10:04:39', '2022-06-15 10:02:47', '2022-06-15 10:04:39'),
(80, 'App\\Models\\User', 43, 'myapptoken', '8e067fd17c42fee5571c650626a39970fdd6ed5d25dfaee43fde06d4cecf6174', '[\"*\"]', '2022-06-15 20:52:15', '2022-06-15 20:46:29', '2022-06-15 20:52:15'),
(82, 'App\\Models\\User', 43, 'myapptoken', '694eddf408adf71cfec69c61149083bf007fe6a5c21b3093da74f7dfd1ed284b', '[\"*\"]', '2022-06-15 21:29:39', '2022-06-15 21:28:13', '2022-06-15 21:29:39'),
(83, 'App\\Models\\User', 43, 'myapptoken', '740477114381ee833e5e6e2bcb3afd7684143fefae527edffd578e6c1c371e26', '[\"*\"]', '2022-06-15 22:24:00', '2022-06-15 22:06:17', '2022-06-15 22:24:00'),
(84, 'App\\Models\\User', 43, 'myapptoken', '5b39e09a2cc298ce18d02cd59b9fdfb8307f768dccb7c9f8b35d209fc6502ffb', '[\"*\"]', '2022-06-15 23:26:39', '2022-06-15 23:25:08', '2022-06-15 23:26:39'),
(85, 'App\\Models\\User', 43, 'myapptoken', '36906db99fdd72d82225c659f6f3e8cf827dbf25d863dd21ac722e70daf83fba', '[\"*\"]', '2022-06-15 23:43:03', '2022-06-15 23:36:25', '2022-06-15 23:43:03'),
(86, 'App\\Models\\User', 43, 'myapptoken', 'd3b0db685e73a5a6fd6182e70b4d56534816f02649934a81d3ee461c9a8a87b6', '[\"*\"]', '2022-06-16 01:12:10', '2022-06-15 23:45:14', '2022-06-16 01:12:10'),
(104, 'App\\Models\\User', 44, 'myapptoken', '77eab1a59db89ccd6a7d9452349a23c521400b63c932d27dc713fc382d688d42', '[\"*\"]', '2022-07-01 10:45:58', '2022-07-01 10:42:10', '2022-07-01 10:45:58'),
(110, 'App\\Models\\User', 45, 'myapptoken', 'ed25000458e47ea8239ceb57a6b36dce49e97c45eccbd6218e1d8739aa84118d', '[\"*\"]', '2022-07-02 02:11:22', '2022-07-02 02:10:38', '2022-07-02 02:11:22');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `confirmation_date` date NOT NULL,
  `total` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `confirmation_date`, `total`, `created_at`, `updated_at`) VALUES
(2, 6, '2022-04-13', '2400000', '2022-04-12 23:10:29', '2022-04-12 23:10:29'),
(3, 5, '2022-04-13', '2550000', '2022-04-12 23:10:35', '2022-04-12 23:10:35'),
(4, 2, '2022-04-13', '999000', '2022-04-13 05:41:55', '2022-04-13 05:41:55'),
(5, 4, '2022-04-13', '1700000', '2022-04-13 07:07:15', '2022-04-13 07:07:15'),
(6, 7, '2022-04-14', '3996000', '2022-04-14 02:55:04', '2022-04-14 02:55:04'),
(7, 5, '2022-04-15', '2400000', '2022-04-15 00:06:13', '2022-04-15 00:06:13'),
(8, 7, '2022-04-17', '850000', '2022-04-17 06:06:52', '2022-04-17 06:06:52'),
(9, 4, '2022-04-20', '3400000', '2022-04-19 18:10:35', '2022-04-19 18:10:35'),
(10, 41, '2022-06-27', '5200000', '2022-06-27 10:36:34', '2022-06-27 10:36:34'),
(11, 41, '2022-06-27', '5200000', '2022-06-27 10:40:43', '2022-06-27 10:40:43'),
(12, 41, '2022-06-27', '7000000', '2022-06-27 10:40:54', '2022-06-27 10:40:54'),
(13, 41, '2022-06-27', '650000', '2022-06-27 10:41:29', '2022-06-27 10:41:29'),
(14, 44, '2022-07-01', '1700000', '2022-07-01 10:11:49', '2022-07-01 10:11:49'),
(15, 44, '2022-07-01', '2850000', '2022-07-01 10:11:54', '2022-07-01 10:11:54'),
(16, 41, '2022-07-01', '1300000', '2022-07-01 10:12:00', '2022-07-01 10:12:00'),
(17, 45, '2022-07-02', '9750000', '2022-07-02 02:10:00', '2022-07-02 02:10:00');

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
  `role` enum('admin','user') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@admin.com', NULL, '$2y$10$AjfizFJ.P1IV8A1lZa9.qefuMRvxb3bQHYwM63XlYq3Dr95T9m/L.', 'admin', NULL, '2022-04-11 23:24:21', '2022-04-11 23:24:21'),
(2, 'Attalariq', 'attalariq@gmail.com', NULL, '$2y$10$T14CcKe8lcRnZcQP7I38OOHh1WlGTzJgFCvEOoZO9XRqaa6ImKPCm', 'user', NULL, NULL, NULL),
(3, 'Fauji', 'fauji@gmail.com', NULL, '$2y$10$X0dzZ4VuADIdIJUEKm8Nu.oyJ.HYP933KZggFdJlEvbWL6ujmhoOq', 'user', NULL, NULL, NULL),
(4, 'Irgi Aditya', 'irgi@gmail.com', NULL, '$2y$10$PF9MYHoVM8DdL5PSaL7HAudJcbHF1FUL8vEWd36wkwaic6i5hli8.', 'user', NULL, NULL, NULL),
(5, 'Bilal', 'bilal@gmail.com', NULL, '$2y$10$EpSrMNCMU0S1gR8icrg5Q.1FMBwY952snZrgr.zY9zv6r2W.LJ8bS', 'user', NULL, NULL, NULL),
(6, 'Naufal', 'naufal@gmail.com', NULL, '$2y$10$oVWU4O6xR3jFvbYRRYX4j.iyie/fSUI4RuRVGIwMcKjhyU99hi3rW', 'user', NULL, NULL, NULL),
(7, 'Widi Fadil', 'widil@gmail.com', NULL, '$2y$10$t.SfFdLPv49WKdtKwzJoeezjYuUqJXttxyQclC4c47h5v5pTuc4um', 'user', NULL, NULL, NULL),
(41, 'Muhammad Attalariq', 'atta@gmail.com', NULL, '$2y$10$TFdXfYRDI4WXMMROAIHF3eVbUAjYY5L3ZHYoGkrrAaRrGi/oJAizu', 'user', NULL, '2022-06-13 08:35:02', '2022-06-13 08:35:02'),
(43, 'Hafid Ahmad', 'hafid@gmail.com', NULL, '$2y$10$6/1mzycUQitWaPGb6Vml9uNEQAdX/MA.PZk0EzhFGkYBbq/29322e', 'user', NULL, '2022-06-13 09:29:53', '2022-06-13 09:29:53'),
(44, 'Fauzi Hazim', 'fauzi@gmail.com', NULL, '$2y$10$.hoX7aGgnRAuHeClgkSG7e.kdayD4HYAqho7rIMkFZERH.eIa1ciW', 'user', NULL, '2022-07-01 09:59:31', '2022-07-01 09:59:31'),
(45, 'Akun Test', 'akuntest@gmail.com', NULL, '$2y$10$G8iaLPHyIlWc5qZlFaTQjem0f/hwoFK8zZRAgyf8/GeQrSw3fgVi2', 'user', NULL, '2022-07-02 02:07:42', '2022-07-02 02:07:42');

-- --------------------------------------------------------

--
-- Table structure for table `user_favorites`
--

CREATE TABLE `user_favorites` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `destination_id` bigint(20) UNSIGNED NOT NULL,
  `isFavorite` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_favorites`
--

INSERT INTO `user_favorites` (`id`, `user_id`, `destination_id`, `isFavorite`, `created_at`, `updated_at`) VALUES
(1, 41, 13, 0, NULL, '2022-07-01 10:54:53'),
(2, 41, 14, 0, NULL, '2022-07-01 10:54:54'),
(3, 41, 15, 0, NULL, '2022-07-02 02:04:13'),
(4, 41, 20, 0, '2022-06-14 08:23:07', '2022-06-16 01:14:55'),
(5, 41, 16, 0, '2022-06-15 08:25:29', '2022-07-01 10:54:55'),
(6, 43, 13, 0, NULL, '2022-06-16 01:11:49'),
(7, 43, 14, 1, '2022-06-15 09:57:10', '2022-06-15 22:23:51'),
(8, 43, 18, 0, '2022-06-15 09:58:57', '2022-06-16 01:05:21'),
(9, 43, 15, 1, '2022-06-16 01:09:38', '2022-06-16 01:09:38'),
(10, 43, 17, 1, '2022-06-16 01:09:56', '2022-06-16 01:09:56'),
(11, 41, 21, 0, '2022-06-16 01:15:17', '2022-06-30 05:33:13'),
(12, 41, 26, 0, '2022-06-30 04:54:39', '2022-07-02 02:04:09'),
(13, 41, 17, 1, '2022-07-01 00:16:38', '2022-07-01 00:23:55'),
(14, 44, 15, 1, '2022-07-01 10:00:06', '2022-07-01 10:00:43'),
(15, 44, 19, 1, '2022-07-01 10:00:11', '2022-07-01 10:00:11'),
(16, 44, 26, 1, '2022-07-01 10:00:14', '2022-07-01 10:00:14'),
(17, 44, 13, 0, '2022-07-01 10:12:33', '2022-07-01 10:43:34'),
(18, 44, 14, 0, '2022-07-01 10:16:00', '2022-07-01 10:16:01'),
(21, 41, 19, 0, '2022-07-01 10:54:31', '2022-07-02 02:04:11'),
(22, 41, 18, 0, '2022-07-01 10:54:44', '2022-07-01 10:54:56'),
(23, 41, 27, 0, '2022-07-01 10:54:47', '2022-07-01 10:55:01'),
(24, 41, 25, 0, '2022-07-01 10:54:48', '2022-07-02 02:04:10'),
(25, 45, 14, 0, '2022-07-02 02:09:05', '2022-07-02 02:09:16'),
(26, 45, 13, 1, '2022-07-02 02:09:13', '2022-07-02 02:11:09');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `destinations`
--
ALTER TABLE `destinations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `destinations_kode_unique` (`kode`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `events_destination_id_foreign` (`destination_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_destination_id_foreign` (`destination_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_favorites`
--
ALTER TABLE `user_favorites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_favorites_user_id_foreign` (`user_id`),
  ADD KEY `user_favorites_destination_id_foreign` (`destination_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `destinations`
--
ALTER TABLE `destinations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `user_favorites`
--
ALTER TABLE `user_favorites`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_destination_id_foreign` FOREIGN KEY (`destination_id`) REFERENCES `destinations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_destination_id_foreign` FOREIGN KEY (`destination_id`) REFERENCES `destinations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_favorites`
--
ALTER TABLE `user_favorites`
  ADD CONSTRAINT `user_favorites_destination_id_foreign` FOREIGN KEY (`destination_id`) REFERENCES `destinations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_favorites_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
