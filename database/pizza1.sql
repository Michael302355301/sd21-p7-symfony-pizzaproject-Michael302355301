-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 27 mrt 2023 om 15:49
-- Serverversie: 10.4.24-MariaDB
-- PHP-versie: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pizza`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `category`
--

INSERT INTO `category` (`id`, `name`, `image`) VALUES
(1, 'Vegetarische pizza\'s', 'https://cache.dominos.com/olo/6.103.5/assets/build/market/DO/_es/images/img/products/thumbnails/S_PIZPV.jpg'),
(2, 'Vlees pizza\'s', 'https://cache.dominos.com/olo/6.103.5/assets/build/market/DO/_es/images/img/products/thumbnails/S_PIZZZ.jpg'),
(3, 'Vis pizza\'s ', 'https://cache.dominos.com/olo/6.103.5/assets/build/market/DO/_es/images/img/products/thumbnails/S_PIZIT.jpg');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20230308082553', '2023-03-08 09:26:04', 101),
('DoctrineMigrations\\Version20230309112616', '2023-03-09 12:26:38', 565),
('DoctrineMigrations\\Version20230316120001', '2023-03-16 13:00:07', 604),
('DoctrineMigrations\\Version20230321115121', '2023-03-21 12:51:26', 68),
('DoctrineMigrations\\Version20230322102332', '2023-03-22 11:23:41', 582),
('DoctrineMigrations\\Version20230323132115', '2023-03-23 14:21:20', 162);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adress` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phonenumber` int(11) NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `order`
--

INSERT INTO `order` (`id`, `email`, `adress`, `postcode`, `phonenumber`, `lastname`, `name`, `product_id`) VALUES
(2, 'hhh', 'hh', 'hhh', 555555, 'hhh', 'hghh', 9),
(3, 'rrr', 'rr', 'frfrr', 99988877, 'rrr', 'rrrr', 1),
(4, 'ss', 'sss', 'sss', 2147483647, 'sss', 'sss', 11),
(16, 'snf3434343', 'erererer222222222222', 'erer', 0, 'sss222222', '-000000000', 13),
(17, 'snf3434343', 'erererer222222222222', 'erer', 0, 'sss222222', '-000000000', 13);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(5,2) NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `product`
--

INSERT INTO `product` (`id`, `category_id`, `name`, `price`, `img`, `description`) VALUES
(1, 1, 'Pizza Margarita\r\n', '11.99', 'https://images.newyorkpizza.nl/Products/Original/Margherita-8046.png', ''),
(2, 1, 'Caprese pizza\r\n', '16.49', 'https://images.newyorkpizza.nl/Products/Original/Caprese-8048.png', ''),
(3, 2, 'Saté pizza', '12.99', 'https://images.newyorkpizza.nl/Products/Original/Sate_pizza-9112.png', ''),
(4, 1, 'Vegan Shoarma pizza', '15.99', 'https://images.newyorkpizza.nl/Products/Original/Vegan_Shoarma-8070.png', ''),
(5, 2, 'Double Pepperoni pizza', '13.99', 'https://images.newyorkpizza.nl/Products/Original/double_Pepperoni-8056.png', ''),
(6, 2, 'Hawaii pizza', '15.49', 'https://images.newyorkpizza.nl/Products/Original/Hawaii-8059.png', ''),
(7, 2, 'Shoarma Pizza', '15.49', 'https://images.newyorkpizza.nl/Products/Original/East_Side-8055.png', ''),
(8, 1, 'Veggie Deluxe', '15.49', 'https://images.newyorkpizza.nl/Products/Original/Veggie_deluxe-8067.png', ''),
(9, 1, '4 Cheese pizza', '15.49', 'https://images.newyorkpizza.nl/Products/Original/4_cheese-8058.png', ''),
(10, 1, 'Californian Veggie pizza', '13.99', 'https://images.newyorkpizza.nl/Products/Original/Californian-8043.png', ''),
(11, 2, 'BBQ Bacon & Chicken', '15.49', 'https://images.newyorkpizza.nl/Products/Original/BBQ_Bacon-8045.png', ''),
(13, 2, 'Pulled Chicken', '13.99', 'https://images.newyorkpizza.nl/Products/Original/Pulled-8040.png', ''),
(15, 2, 'Brooklyn Style pizza', '13.99', 'https://images.newyorkpizza.nl/Products/Original/Brooklyn-8047.png', ''),
(16, 3, 'Tuna Treat Pizza', '13.49', 'https://images.newyorkpizza.nl/Products/Original/Tuna-8073.png', ''),
(17, 3, 'Shrimps Pizza', '15.49', 'https://images.newyorkpizza.nl/Products/Original/Teriyaki-8044.png', ''),
(18, 3, 'Buffalo Salmon pizza', '16.99', 'https://images.newyorkpizza.nl/Products/Original/buffalo-8061.png', '');

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexen voor tabel `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Indexen voor tabel `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_F52993984584665A` (`product_id`);

--
-- Indexen voor tabel `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_D34A04AD12469DE2` (`category_id`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT voor een tabel `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT voor een tabel `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `FK_F52993984584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Beperkingen voor tabel `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_D34A04AD12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
