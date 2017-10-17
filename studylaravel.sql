-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 18, 2017 at 12:23 AM
-- Server version: 5.7.19
-- PHP Version: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `studylaravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name_ru` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_ro` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name_ru`, `name_ro`, `name_en`, `slug`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Декор', 'Decor', 'Decor', 'decor', 'decor.jpg', 1, '2017-10-15 18:27:57', NULL),
(3, 'Оформление', 'Decorarea', 'Decor', 'oformlenie', 'oformlenie.jpg', 1, '2017-10-15 19:27:57', NULL),
(5, 'Элементы декора', 'Elemente de decor', 'Elements of decor', 'elemets', 'elem.jpg', 1, '2017-10-15 19:27:57', NULL);

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
(7, '2014_10_12_000000_create_users_table', 1),
(8, '2014_10_12_100000_create_password_resets_table', 1),
(9, '2017_10_15_153959_create_categories_table', 1);

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
-- Table structure for table `productimages`
--

CREATE TABLE `productimages` (
  `id` int(11) NOT NULL,
  `image` text,
  `product_id` int(255) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `productimages`
--

INSERT INTO `productimages` (`id`, `image`, `product_id`, `created_at`, `updated_at`) VALUES
(1, '2.jpg', 4, '2017-10-17 17:55:45', '2017-10-17 17:55:48'),
(2, '2.jpg', 4, '2017-10-17 17:55:45', '2017-10-17 17:55:48'),
(3, '3.jpg', 4, '2017-10-17 17:55:45', '2017-10-17 17:55:48'),
(4, '4.jpg', 4, '2017-10-17 17:55:45', '2017-10-17 17:55:48'),
(5, '1.jpg', 2, '2017-10-17 17:55:45', '2017-10-17 17:55:48'),
(6, '3.jpg', 2, '2017-10-17 17:55:45', '2017-10-17 17:55:48'),
(7, '2.jpg', 3, '2017-10-17 17:55:45', '2017-10-17 17:55:48'),
(8, '1.jpg', 3, '2017-10-17 17:55:45', '2017-10-17 17:55:48'),
(9, '4.jpg', 4, '2017-10-17 17:55:45', '2017-10-17 17:55:48'),
(10, '2.jpg', 5, '2017-10-17 17:55:45', '2017-10-17 17:55:48'),
(11, '3.jpg', 6, '2017-10-17 17:55:45', '2017-10-17 17:55:48'),
(12, '4.jpg', 7, '2017-10-17 17:55:45', '2017-10-17 17:55:48');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name_ru` mediumtext COLLATE utf8mb4_unicode_ci,
  `name_ro` mediumtext COLLATE utf8mb4_unicode_ci,
  `name_en` mediumtext COLLATE utf8mb4_unicode_ci,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description_ru` text COLLATE utf8mb4_unicode_ci,
  `description_ro` text COLLATE utf8mb4_unicode_ci,
  `description_en` text COLLATE utf8mb4_unicode_ci,
  `images` text COLLATE utf8mb4_unicode_ci,
  `price` double(8,2) DEFAULT NULL,
  `similar_products` json DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name_ru`, `name_ro`, `name_en`, `slug`, `description_ru`, `description_ro`, `description_en`, `images`, `price`, `similar_products`, `status`, `created_at`, `updated_at`, `category_id`) VALUES
(2, 'product1_ru', 'product1_ro', 'Balloon for decor', 'product2_slug', 'desc1_ru', 'desc1_ro', 'desc1_ev', '\"[\"1.jpg\",\"2.jpg\",\"3.jpg\",\"4.jpg\",\"5.jpg\"]\"', 10.00, NULL, 1, '2017-10-15 21:53:50', '2017-10-15 21:53:51', 1),
(3, 'product2_ru', 'product1_ro', 'product1_en', 'product3_slug', 'desc1_ru', 'desc1_ro', 'desc1_ev', '\"[\"1.jpg\",\"2.jpg\",\"3.jpg\",\"4.jpg\",\"5.jpg\"]\"', 10.00, NULL, 1, '2017-10-15 21:53:50', '2017-10-15 21:53:51', 3),
(4, 'product3_ru', 'product1_ro', 'product1_en', 'product4_slug', 'desc1_ru', 'desc1_ro', 'desc1_ev', '\"[\"1.jpg\",\"2.jpg\",\"3.jpg\",\"4.jpg\",\"5.jpg\"]\"', 10.00, NULL, 1, '2017-10-15 21:53:50', '2017-10-15 21:53:51', 1),
(5, 'product3_ru', 'product1_ro', 'product1_en', 'product4_slug', 'desc1_ru', 'desc1_ro', 'desc1_ev', '\"[\"1.jpg\",\"2.jpg\",\"3.jpg\",\"4.jpg\",\"5.jpg\"]\"', 10.00, NULL, 1, '2017-10-15 21:53:50', '2017-10-15 21:53:51', 1),
(6, 'product3_ru', 'product1_ro', 'product1_en', 'product4_slug', 'desc1_ru', 'desc1_ro', 'desc1_ev', '\"[\"1.jpg\",\"2.jpg\",\"3.jpg\",\"4.jpg\",\"5.jpg\"]\"', 10.00, NULL, 1, '2017-10-15 21:53:50', '2017-10-15 21:53:51', 1),
(7, 'product3_ru', 'product1_ro', 'product1_en', 'product4_slug', 'desc1_ru', 'desc1_ro', 'desc1_ev', '\"[\"1.jpg\",\"2.jpg\",\"3.jpg\",\"4.jpg\",\"5.jpg\"]\"', 10.00, NULL, 1, '2017-10-15 21:53:50', '2017-10-15 21:53:51', 1),
(8, 'product3_ru', 'product1_ro', 'product1_en', 'product4_slug', 'desc1_ru', 'desc1_ro', 'desc1_ev', '\"[\"1.jpg\",\"2.jpg\",\"3.jpg\",\"4.jpg\",\"5.jpg\"]\"', 10.00, NULL, 1, '2017-10-15 21:53:50', '2017-10-15 21:53:51', 1),
(9, 'product3_ru', 'product1_ro', 'product1_en', 'product4_slug', 'desc1_ru', 'desc1_ro', 'desc1_ev', '\"[\"1.jpg\",\"2.jpg\",\"3.jpg\",\"4.jpg\",\"5.jpg\"]\"', 10.00, NULL, 1, '2017-10-15 21:53:50', '2017-10-15 21:53:51', 1),
(10, 'product3_ru', 'product1_ro', 'product1_en', 'product4_slug', 'desc1_ru', 'desc1_ro', 'desc1_ev', '\"[\"1.jpg\",\"2.jpg\",\"3.jpg\",\"4.jpg\",\"5.jpg\"]\"', 10.00, NULL, 1, '2017-10-15 21:53:50', '2017-10-15 21:53:51', 1),
(11, 'product3_ru', 'product1_ro', 'product1_en', 'product4_slug', 'desc1_ru', 'desc1_ro', 'desc1_ev', '\"[\"1.jpg\",\"2.jpg\",\"3.jpg\",\"4.jpg\",\"5.jpg\"]\"', 10.00, NULL, 1, '2017-10-15 21:53:50', '2017-10-15 21:53:51', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `locale`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Roman', 'en', 'casian.roma@gmail.com', '$2y$10$oxPqLTp2OjUDU372rA7.1ehguUKK.2U3fHbMcpAi/DmuJBt6PNnXi', NULL, '2017-10-15 13:09:23', '2017-10-15 20:03:57');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_slug_index` (`slug`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `productimages`
--
ALTER TABLE `productimages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

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
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `productimages`
--
ALTER TABLE `productimages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
