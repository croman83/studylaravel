-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 23, 2017 at 10:40 PM
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
  `parent_category` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name_ru`, `name_ro`, `name_en`, `slug`, `image`, `status`, `parent_category`, `created_at`, `updated_at`) VALUES
(1, 'Декор', 'Decor', 'Decor', 'decor', 'decor.jpg', 1, 0, '2017-10-15 18:27:57', NULL),
(3, 'Оформление', 'Decorarea', 'Decor', 'oformlenie', 'oformlenie.jpg', 1, 0, '2017-10-15 19:27:57', NULL),
(5, 'Элементы декора', 'Elemente de decor', 'Elements of decor', 'elemets', 'elem.jpg', 1, 0, '2017-10-15 19:27:57', NULL),
(14, 'Свадьбы', 'Nunti', 'Weddings', 'weddings', 'category_wedding.jpg', 1, 1, '2017-10-20 21:00:00', '2017-10-26 21:00:00'),
(15, 'Дни рождения', 'Zi de nastere', 'Birthday', 'birthday', 'category_birthday.jpg', 1, 1, '2017-10-20 21:00:00', '2017-10-26 21:00:00'),
(16, 'Оформление2', 'Decorarea', 'Decor', 'oformlenie2', 'oformlenie.jpg', 1, 0, '2017-10-15 19:27:57', NULL),
(17, 'Декор2', 'Decor', 'Decor', 'decor2', 'decor.jpg', 1, 0, '2017-10-15 18:27:57', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `filters`
--

CREATE TABLE `filters` (
  `id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name_ru` text,
  `name_ro` text,
  `name_en` text,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `filters`
--

INSERT INTO `filters` (`id`, `created_at`, `updated_at`, `name_ru`, `name_ro`, `name_en`, `category_id`) VALUES
(1, '2017-10-21 21:00:00', '2017-10-21 21:00:00', 'Свадьба', 'Nunta', 'Wedding', 1),
(2, '2017-10-21 21:00:00', '2017-10-21 21:00:00', 'Куматрия', 'Cumatria', 'Cumatring', 1),
(3, '2017-10-21 21:00:00', '2017-10-21 21:00:00', 'День рождения', 'Zi de nastere', 'Birthday', 1),
(4, '2017-10-21 21:00:00', '2017-10-21 21:00:00', 'Корпоратив', 'Corporativ', 'Corporate event', 3);

-- --------------------------------------------------------

--
-- Table structure for table `filter_product`
--

CREATE TABLE `filter_product` (
  `id` int(10) UNSIGNED NOT NULL,
  `filter_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `filter_product`
--

INSERT INTO `filter_product` (`id`, `filter_id`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 1, 2, '2017-10-21 21:00:00', '2017-10-21 21:00:00'),
(2, 2, 2, '2017-10-21 21:00:00', '2017-10-21 21:00:00'),
(3, 2, 4, '2017-10-21 21:00:00', '2017-10-21 21:00:00'),
(4, 3, 4, '2017-10-21 21:00:00', '2017-10-21 21:00:00'),
(5, 1, 3, '2017-10-21 21:00:00', '2017-10-21 21:00:00'),
(6, 4, 5, '2017-10-21 21:00:00', '2017-10-21 21:00:00'),
(7, 4, 6, '2017-10-21 21:00:00', '2017-10-21 21:00:00');

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
  `updated_at` timestamp NOT NULL,
  `image_thumb` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `productimages`
--

INSERT INTO `productimages` (`id`, `image`, `product_id`, `created_at`, `updated_at`, `image_thumb`) VALUES
(1, '2.jpg', 4, '2017-10-17 17:55:45', '2017-10-17 17:55:48', NULL),
(2, '2.jpg', 4, '2017-10-17 17:55:45', '2017-10-17 17:55:48', NULL),
(3, '3.jpg', 4, '2017-10-17 17:55:45', '2017-10-17 17:55:48', NULL),
(4, '4.jpg', 4, '2017-10-17 17:55:45', '2017-10-17 17:55:48', NULL),
(5, '1.jpg', 2, '2017-10-17 17:55:45', '2017-10-17 17:55:48', NULL),
(6, '3.jpg', 2, '2017-10-17 17:55:45', '2017-10-17 17:55:48', NULL),
(7, '2.jpg', 3, '2017-10-17 17:55:45', '2017-10-17 17:55:48', NULL),
(8, '1.jpg', 3, '2017-10-17 17:55:45', '2017-10-17 17:55:48', NULL),
(9, '4.jpg', 2, '2017-10-17 17:55:45', '2017-10-17 17:55:48', NULL),
(10, '2.jpg', 5, '2017-10-17 17:55:45', '2017-10-17 17:55:48', NULL),
(11, '3.jpg', 6, '2017-10-17 17:55:45', '2017-10-17 17:55:48', NULL),
(12, '4.jpg', 7, '2017-10-17 17:55:45', '2017-10-17 17:55:48', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name_ru` text COLLATE utf8mb4_unicode_ci,
  `name_ro` text COLLATE utf8mb4_unicode_ci,
  `name_en` text COLLATE utf8mb4_unicode_ci,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description_ru` text COLLATE utf8mb4_unicode_ci,
  `description_ro` text COLLATE utf8mb4_unicode_ci,
  `description_en` text COLLATE utf8mb4_unicode_ci,
  `price` double(8,2) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `extra_description_en` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `extra_description_ro` text COLLATE utf8mb4_unicode_ci,
  `extra_description_ru` text COLLATE utf8mb4_unicode_ci,
  `category_id` int(11) DEFAULT NULL,
  `favorit` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name_ru`, `name_ro`, `name_en`, `slug`, `description_ru`, `description_ro`, `description_en`, `price`, `status`, `extra_description_en`, `created_at`, `updated_at`, `extra_description_ro`, `extra_description_ru`, `category_id`, `favorit`) VALUES
(2, 'Бомбоньерки из красивой ткани', 'product1_ro', 'Balloon for decor', 'product2_slug', 'Многие думают, что Lorem Ipsum - взятый с потолка псевдо-латинский набор слов, но это не совсем так. Его корни уходят в один фрагмент классической латыни 45 года н.э., то есть более двух тысячелетий назад. Ричард МакКлинток, профессор латыни из колледжа Hampden-Sydney, штат Вирджиния, взял одно из самых странных слов в Lorem Ipsum, \"consectetur\", и занялся его поисками в классической латинской литературе. В результате он нашёл неоспоримый первоисточник Lorem Ipsum в разделах 1.10.32 и 1.10.33 книги \"de Finibus Bonorum et Malorum\" (\"О пределах добра и зла\"), написанной Цицероном в 45 году н.э. Этот трактат по теории этики был очень популярен в эпоху Возрождения. Первая строка Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", происходит от одной из строк в разделе 1.10.32', 'desc1_ro', 'desc1_ev', 10.00, 1, NULL, '2017-10-15 21:53:50', '2017-10-15 21:53:51', NULL, NULL, 1, NULL),
(3, 'product2_ru', 'product1_ro', 'product1_en', 'product3_slug', 'desc1_ru', 'desc1_ro', 'desc1_ev', 10.00, 1, NULL, '2017-10-15 21:53:50', '2017-10-15 21:53:51', NULL, NULL, 3, NULL),
(4, 'Букет невесты', 'product1_ro', 'product1_en', 'product4_slug', 'Многие думают, что Lorem Ipsum - взятый с потолка псевдо-латинский набор слов, но это не совсем так. Его корни уходят в один фрагмент классической латыни 45 года н.э., то есть более двух тысячелетий назад. Ричард МакКлинток, профессор латыни из колледжа Hampden-Sydney, штат Вирджиния, взял одно из самых странных слов в Lorem Ipsum, \"consectetur\", и занялся его поисками в классической латинской литературе. В результате он нашёл неоспоримый первоисточник Lorem Ipsum в разделах 1.10.32 и 1.10.33 книги \"de Finibus Bonorum et Malorum\" (\"О пределах добра и зла\"), написанной Цицероном в 45 году н.э. Этот трактат по теории этики был очень популярен в эпоху Возрождения. Первая строка Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", происходит от одной из строк в разделе 1.10.32', 'desc1_ro', 'Многие думают, что Lorem Ipsum - взятый с потолка псевдо-латинский набор слов, но это не совсем так. Его корни уходят в один фрагмент классической латыни 45 года н.э., то есть более двух тысячелетий назад. Ричард МакКлинток, профессор латыни из колледжа Hampden-Sydney, штат Вирджиния, взял одно из самых странных слов в Lorem Ipsum, \"consectetur\", и занялся его поисками в классической латинской литературе. В результате он нашёл неоспоримый первоисточник Lorem Ipsum в разделах 1.10.32 и 1.10.33 книги \"de Finibus Bonorum et Malorum\" (\"О пределах добра и зла\"), написанной Цицероном в 45 году н.э. Этот трактат по теории этики был очень популярен в эпоху Возрождения. Первая строка Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", происходит от одной из строк в разделе 1.10.32', 10.00, 1, '<div>\r\n        <h2>Абзац 1.10.33 \"de Finibus Bonorum et Malorum\", написанный Цицероном в 45 году н.э.</h2>\r\n        <p>\"<b>At vero eos et accusamus</b> et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"</p>\r\n    </div>', '2017-10-15 21:53:50', '2017-10-15 21:53:51', '<div>\r\n        <h2>Абзац 1.10.33 \"de Finibus Bonorum et Malorum\", написанный Цицероном в 45 году н.э.</h2>\r\n        <p>\"<b>At vero eos et accusamus</b> et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"</p>\r\n    </div>', '<div>\r\n        <h2>Абзац 1.10.33 \"de Finibus Bonorum et Malorum\", написанный Цицероном в 45 году н.э.</h2>\r\n        <p>\"<b>At vero eos et accusamus</b> et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"</p>\r\n    </div>', 1, 1),
(5, 'product3_ru', 'product1_ro', 'product1_en', 'product4_slug', 'desc1_ru', 'desc1_ro', 'desc1_ev', 10.00, 1, NULL, '2017-10-15 21:53:50', '2017-10-15 21:53:51', NULL, NULL, 1, NULL),
(6, 'product3_ru', 'product1_ro', 'product1_en', 'product4_slug', 'desc1_ru', 'desc1_ro', 'desc1_ev', 10.00, 1, NULL, '2017-10-15 21:53:50', '2017-10-15 21:53:51', NULL, NULL, 1, NULL),
(7, 'product3_ru', 'product1_ro', 'product1_en', 'product4_slug', 'desc1_ru', 'desc1_ro', 'desc1_ev', 10.00, 1, NULL, '2017-10-15 21:53:50', '2017-10-15 21:53:51', NULL, NULL, 1, NULL),
(8, 'product3_ru', 'product1_ro', 'product1_en', 'product4_slug', 'desc1_ru', 'desc1_ro', 'desc1_ev', 10.00, 1, NULL, '2017-10-15 21:53:50', '2017-10-15 21:53:51', NULL, NULL, 1, NULL),
(9, 'product3_ru', 'product1_ro', 'product1_en', 'product4_slug', 'desc1_ru', 'desc1_ro', 'desc1_ev', 10.00, 1, NULL, '2017-10-15 21:53:50', '2017-10-15 21:53:51', NULL, NULL, 1, NULL),
(10, 'product3_ru', 'product1_ro', 'product1_en', 'product4_slug', 'desc1_ru', 'desc1_ro', 'desc1_ev', 10.00, 1, NULL, '2017-10-15 21:53:50', '2017-10-15 21:53:51', NULL, NULL, 1, NULL),
(11, 'product3_ru', 'product1_ro', 'product1_en', 'product4_slug', 'desc1_ru', 'desc1_ro', 'desc1_ev', 10.00, 1, NULL, '2017-10-15 21:53:50', '2017-10-15 21:53:51', NULL, NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(10) UNSIGNED NOT NULL,
  `name_ru` varchar(255) NOT NULL,
  `name_en` varchar(255) NOT NULL,
  `name_ro` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `short_description_ru` text NOT NULL,
  `short_description_en` text NOT NULL,
  `short_description_ro` text NOT NULL,
  `description_ru` longtext NOT NULL,
  `description_en` longtext NOT NULL,
  `description_ro` longtext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `image` varchar(50) DEFAULT NULL,
  `status` tinyint(1) UNSIGNED ZEROFILL NOT NULL DEFAULT '0',
  `sort` int(1) UNSIGNED ZEROFILL NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `name_ru`, `name_en`, `name_ro`, `slug`, `short_description_ru`, `short_description_en`, `short_description_ro`, `description_ru`, `description_en`, `description_ro`, `created_at`, `updated_at`, `image`, `status`, `sort`) VALUES
(1, 'Свадьбы', 'Weddings', 'Nunti', 'weddings', 'short description1', '', '', 'Есть много вариантов Lorem Ipsum, но большинство из них имеет не всегда приемлемые модификации, например, юмористические вставки или слова, которые даже отдалённо не напоминают латынь. Если вам нужен Lorem Ipsum для серьёзного проекта, вы наверняка не хотите какой-нибудь шутки, скрытой в середине абзаца. Также все другие известные генераторы Lorem Ipsum используют один и тот же текст, который они просто повторяют, пока не достигнут нужный объём. Это делает предлагаемый здесь генератор единственным настоящим Lorem Ipsum генератором. Он использует словарь из более чем 200 латинских слов, а также набор моделей предложений. В результате сгенерированный Lorem Ipsum выглядит правдоподобно, не имеет повторяющихся абзацей или \"невозможных\" слов.', '', '', '2017-10-23 18:21:40', '2017-10-23 18:21:41', '1.jpg', 1, 0),
(3, 'Дни рождения', 'Birdthdays', 'Zi de nastere', 'birdthday', 'short description3', '', '', 'Есть много вариантов Lorem Ipsum, но большинство из них имеет не всегда приемлемые модификации, например, юмористические вставки или слова, которые даже отдалённо не напоминают латынь. Если вам нужен Lorem Ipsum для серьёзного проекта, вы наверняка не хотите какой-нибудь шутки, скрытой в середине абзаца. Также все другие известные генераторы Lorem Ipsum используют один и тот же текст, который они просто повторяют, пока не достигнут нужный объём. Это делает предлагаемый здесь генератор единственным настоящим Lorem Ipsum генератором. Он использует словарь из более чем 200 латинских слов, а также набор моделей предложений. В результате сгенерированный Lorem Ipsum выглядит правдоподобно, не имеет повторяющихся абзацей или \"невозможных\" слов.', '', '', '2017-10-23 18:22:32', '2017-10-23 18:22:33', '2.jpg', 1, 10),
(5, 'Корпоративы', 'Corporate events', 'Corporative', 'corporate', 'short description5', '', '', 'Есть много вариантов Lorem Ipsum, но большинство из них имеет не всегда приемлемые модификации, например, юмористические вставки или слова, которые даже отдалённо не напоминают латынь. Если вам нужен Lorem Ipsum для серьёзного проекта, вы наверняка не хотите какой-нибудь шутки, скрытой в середине абзаца. Также все другие известные генераторы Lorem Ipsum используют один и тот же текст, который они просто повторяют, пока не достигнут нужный объём. Это делает предлагаемый здесь генератор единственным настоящим Lorem Ipsum генератором. Он использует словарь из более чем 200 латинских слов, а также набор моделей предложений. В результате сгенерированный Lorem Ipsum выглядит правдоподобно, не имеет повторяющихся абзацей или \"невозможных\" слов.', '', '', '2017-10-23 18:22:32', '2017-10-23 18:22:33', '3.jpg', 1, 0);

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
  `remember_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
-- Indexes for table `filters`
--
ALTER TABLE `filters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `filter_product`
--
ALTER TABLE `filter_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `filter_id` (`filter_id`),
  ADD KEY `product_id` (`product_id`) USING BTREE;

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
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `filters`
--
ALTER TABLE `filters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `filter_product`
--
ALTER TABLE `filter_product`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
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
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
