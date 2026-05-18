-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 03, 2026 at 09:56 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `product_id`, `quantity`) VALUES
(34, 11, 3, 1),
(35, 2, 10, 2);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `total_price` double DEFAULT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `payment_method` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `product_id`, `quantity`, `total_price`, `order_date`, `payment_method`) VALUES
(1, 1, 1, 1, 80000, '2026-03-21 18:39:00', NULL),
(2, 1, 2, 1, 65000, '2026-03-21 18:39:00', NULL),
(3, 1, 1, 1, 80000, '2026-03-21 18:39:00', NULL),
(4, 1, 1, 1, 80000, '2026-03-21 18:39:00', NULL),
(5, 1, 1, 1, 80000, '2026-03-21 18:39:00', NULL),
(6, 1, 1, 1, 80000, '2026-03-21 18:39:00', NULL),
(7, 1, 1, 1, 80000, '2026-03-21 18:39:00', NULL),
(8, 1, 1, 1, 80000, '2026-03-21 18:39:00', NULL),
(9, 1, 1, 1, 80000, '2026-03-21 18:52:09', NULL),
(10, 1, 1, 2, 160000, '2026-03-21 19:14:44', NULL),
(11, 1, 1, 1, 80000, '2026-03-21 19:14:44', NULL),
(12, 1, 1, 1, 80000, '2026-03-21 19:38:29', NULL),
(13, 1, 1, 1, 80000, '2026-03-21 19:38:29', NULL),
(14, 1, 2, 5, 325000, '2026-03-21 19:38:29', NULL),
(15, 1, 1, 3, 240000, '2026-03-21 19:59:46', NULL),
(16, 1, 1, 3, 240000, '2026-03-21 19:59:46', NULL),
(17, 1, 1, 4, 320000, '2026-03-21 20:02:29', NULL),
(18, 1, 1, 1, 80000, '2026-03-22 05:54:58', NULL),
(19, 1, 1, 2, 160000, '2026-03-22 08:02:32', NULL),
(20, 1, 2, 3, 195000, '2026-03-22 08:02:32', NULL),
(21, 1, 1, 3, 240000, '2026-03-22 08:02:32', NULL),
(22, 1, 1, 3, 240000, '2026-03-22 08:02:32', NULL),
(23, 1, 1, 3, 240000, '2026-03-22 08:02:32', NULL),
(24, 1, 1, 1, 80000, '2026-03-22 08:02:32', NULL),
(25, 2, 1, 2, 160000, '2026-03-22 12:01:17', NULL),
(26, 2, 1, 2, 160000, '2026-03-22 14:45:18', NULL),
(27, 2, 2, 1, 65000, '2026-04-09 15:46:09', NULL),
(28, 11, 2, 1, 65000, '2026-04-18 12:31:59', 'TELEBIRR'),
(29, 2, 3, 1, 1500, '2026-04-18 12:41:21', 'TELEBIRR'),
(30, 2, 8, 2, 6000, '2026-04-18 12:41:21', 'TELEBIRR');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `category`, `price`, `description`, `image`) VALUES
(1, 'iPhone 13', 'Phone', 80000, 'Apple smartphone', 'images/iphone.jpg'),
(2, 'Dell Laptop', 'Laptop', 65000, 'Core i7 laptop', 'images/laptop.jpg'),
(3, 'Headphones', 'Accessory', 1500, 'Wireless headphones', 'images/earpod.jpg'),
(4, 'Laptops', NULL, 100000, NULL, 'images/laptops.jpg'),
(5, 'Apple PC', 'Laptop', 200000, 'Smart Apple Laptop', 'images/apple pc.jpg'),
(6, 'Watch', 'Watch', 2000, 'Brand Watch', 'images/watch.jpg'),
(7, 'HeadPhone', 'headphone', 2000, 'Comfortable Headphone', 'images/headphone.jpg'),
(8, 'Techno Spark', 'Smartphone', 3000, 'Digital Smartphones', 'images/techno.jpg'),
(9, 'Charger', 'charger', 1000, 'Smart charger with High quality', 'images/charger.jpg'),
(10, 'Electric Food Choper', 'Home appliance', 4500, 'Smart Electric Food Chopper', 'images/food choper.jpg'),
(11, 'Smart Camera', 'Accessories', 30000, 'Modern digital camera', 'images/camera.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `role` varchar(20) DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`) VALUES
(1, 'sosna', 'sosadu3@gmail.com', NULL, 'user'),
(2, 'sosna', 'sosadu3@gmail.com', '1234', 'user'),
(3, 'sosna', 'sosadu3@gmail.com', NULL, 'user'),
(4, 'fikir', 'fikir@gmail.com', NULL, 'user'),
(5, 'fikir', 'fikir@gmail.com', NULL, 'user'),
(6, 'fikir', 'fikir@gmail.com', NULL, 'user'),
(7, 'sosna', 'sosadu3@gmail.com', '1234', 'user'),
(8, 'she', 'she@gmail.com', '1234', 'user'),
(9, 'she', 'sosadu3@gmail.com', '1234', 'user'),
(10, 'admin', 'admin@gmail.com', '1234', 'user'),
(11, 'sosna', 'sosnaadugna@gmail.com', '12345', 'admin'),
(12, 'Bezawit Adugna', 'bezawitadugna@gmail.com', '1234', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
