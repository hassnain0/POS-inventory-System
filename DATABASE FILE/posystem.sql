-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 13, 2022 at 04:43 AM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";



CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `Category` text COLLATE utf8_spanish_ci NOT NULL,
  `Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `Category`, `Date`) VALUES
(1, 'Category One', '2022-12-07 18:04:16'),

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `name` text COLLATE utf8_spanish_ci NOT NULL,
  `idDocument` int(11) NOT NULL,
  `email` text COLLATE utf8_spanish_ci NOT NULL,
  `phone` text COLLATE utf8_spanish_ci NOT NULL,
  `address` text COLLATE utf8_spanish_ci NOT NULL,
  `birthdate` date NOT NULL,
  `purchases` int(11) NOT NULL,
  `lastPurchase` datetime NOT NULL,
  `registerDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `idDocument`, `email`, `phone`, `address`, `birthdate`, `purchases`, `lastPurchase`, `registerDate`) VALUES
(1, 'Tester', 123456, 'test@gmail.com', '(555)567-9999', 'Hyderabad Sindh', '1986-01-05', 15, '2018-12-03 00:01:21', '2022-12-10 13:41:42'),
-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `idCategory` int(11) NOT NULL,
  `code` text COLLATE utf8_spanish_ci NOT NULL,
  `description` text COLLATE utf8_spanish_ci NOT NULL,
  `image` text COLLATE utf8_spanish_ci NOT NULL,
  `stock` int(11) NOT NULL,
  `buyingPrice` float NOT NULL,
  `sellingPrice` float NOT NULL,
  `sales` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `idCategory`, `code`, `description`, `image`, `stock`, `buyingPrice`, `sellingPrice`, `sales`, `date`) VALUES
(18, 2, '201', 'Product Sample One', 'views/img/products/default/anonymous.png', 10, 56, 78, 20, '2022-12-08 17:23:41'),

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(11) NOT NULL,
  `code` int(11) NOT NULL,
  `idCustomer` int(11) NOT NULL,
  `idSeller` int(11) NOT NULL,
  `products` text COLLATE utf8_spanish_ci NOT NULL,
  `tax` int(11) NOT NULL,
  `netPrice` float NOT NULL,
  `totalPrice` float NOT NULL,
  `paymentMethod` text COLLATE utf8_spanish_ci NOT NULL,
  `saledate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `code`, `idCustomer`, `idSeller`, `products`, `tax`, `netPrice`, `totalPrice`, `paymentMethod`, `saledate`) VALUES
(9, 10001, 2, 2, '[{\"id\":\"25\",\"description\":\"Product Sample Two\",\"quantity\":\"3\",\"stock\":\"29\",\"price\":\"185\",\"totalPrice\":\"555\"}]', 17, 555, 572, 'cash', '2018-12-04 00:53:28'),
(11, 10002, 3, 1, '[{\"id\":\"44\",\"description\":\"Product Sample Four\",\"quantity\":\"4\",\"stock\":\"16\",\"price\":\"490\",\"totalPrice\":\"1960\"},{\"id\":\"36\",\"description\":\"Product Sample Three\",\"quantity\":\"6\",\"stock\":\"14\",\"price\":\"125\",\"totalPrice\":\"750\"}]', 0, 2710, 2710, 'cash', '2018-12-05 06:30:28'),
(12, 10003, 3, 1, '[{\"id\":\"44\",\"description\":\"Product Sample Four\",\"quantity\":\"1\",\"stock\":\"2\",\"price\":\"490\",\"totalPrice\":\"490\"},{\"id\":\"36\",\"description\":\"Product Sample Three\",\"quantity\":\"1\",\"stock\":\"8\",\"price\":\"125\",\"totalPrice\":\"125\"},{\"id\":\"25\",\"description\":\"Product Sample Two\",\"quantity\":\"1\",\"stock\":\"23\",\"price\":\"185\",\"totalPrice\":\"185\"},{\"id\":\"18\",\"description\":\"Product Sample One\",\"quantity\":\"2\",\"stock\":\"114\",\"price\":\"78\",\"totalPrice\":\"156\"}]', 48, 956, 1004, 'cash', '2019-04-09 22:59:10'),
(14, 10005, 6, 1, '[{\"id\":\"61\",\"description\":\"Test Product\",\"quantity\":\"9\",\"stock\":\"31\",\"price\":\"28\",\"totalPrice\":\"252\"},{\"id\":\"44\",\"description\":\"Product Sample Four\",\"quantity\":\"3\",\"stock\":\"3\",\"price\":\"490\",\"totalPrice\":\"1470\"},{\"id\":\"36\",\"description\":\"Product Sample Three\",\"quantity\":\"5\",\"stock\":\"3\",\"price\":\"125\",\"totalPrice\":\"625\"}]', 117, 2347, 2464, 'cash', '2020-02-26 05:34:45'),
(15, 10006, 6, 1, '[{\"id\":\"61\",\"description\":\"Test Product\",\"quantity\":\"17\",\"stock\":\"19\",\"price\":\"28\",\"totalPrice\":\"476\"},{\"id\":\"25\",\"description\":\"Product Sample Two\",\"quantity\":\"2\",\"stock\":\"1\",\"price\":\"185\",\"totalPrice\":\"370\"}]', 25, 846, 871, 'cash', '2021-01-05 15:36:20'),
(17, 10008, 4, 1, '[{\"id\":\"67\",\"description\":\"Product Sample Ten\",\"quantity\":\"2\",\"stock\":\"69\",\"price\":\"91\",\"totalPrice\":\"182\"}]', 0, 182, 182, 'cash', '2021-09-28 05:18:53'),
(18, 10009, 7, 1, '[{\"id\":\"66\",\"description\":\"Product Sample Nine\",\"quantity\":\"3\",\"stock\":\"57\",\"price\":\"35\",\"totalPrice\":\"105\"},{\"id\":\"65\",\"description\":\"Product Sample Eight\",\"quantity\":\"1\",\"stock\":\"40\",\"price\":\"140\",\"totalPrice\":\"140\"}]', 5, 245, 250, 'cash', '2022-02-13 23:58:09'),
(19, 10010, 4, 1, '[{\"id\":\"36\",\"description\":\"Product Sample Three\",\"quantity\":\"3\",\"stock\":\"55\",\"price\":\"125\",\"totalPrice\":\"375\"}]', 4, 375, 379, 'cash', '2022-06-29 03:42:37'),
(20, 10011, 9, 1, '[{\"id\":\"67\",\"description\":\"Product Sample Ten\",\"quantity\":\"4\",\"stock\":\"65\",\"price\":\"91\",\"totalPrice\":\"364\"},{\"id\":\"66\",\"description\":\"Product Sample Nine\",\"quantity\":\"10\",\"stock\":\"47\",\"price\":\"35\",\"totalPrice\":\"350\"},{\"id\":\"65\",\"description\":\"Product Sample Eight\",\"quantity\":\"4\",\"stock\":\"36\",\"price\":\"140\",\"totalPrice\":\"560\"}]', 64, 1274, 1338, 'CC-110101458966', '2022-09-20 13:43:42'),
(21, 10012, 11, 1, '[{\"id\":\"68\",\"description\":\"Product Sample Eleven\",\"quantity\":\"3\",\"stock\":\"23\",\"price\":\"168\",\"totalPrice\":\"504\"},{\"id\":\"66\",\"description\":\"Product Sample Nine\",\"quantity\":\"10\",\"stock\":\"37\",\"price\":\"35\",\"totalPrice\":\"350\"}]', 68, 854, 922, 'CC-100000147850', '2022-12-10 17:35:52'),
(22, 10013, 8, 2, '[{\"id\":\"68\",\"description\":\"Product Sample Eleven\",\"quantity\":\"7\",\"stock\":\"16\",\"price\":\"168\",\"totalPrice\":\"1176\"}]', 0, 1176, 1176, 'cash', '2022-12-10 17:40:02');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` text COLLATE utf8_spanish_ci NOT NULL,
  `user` text COLLATE utf8_spanish_ci NOT NULL,
  `password` text COLLATE utf8_spanish_ci NOT NULL,
  `profile` text COLLATE utf8_spanish_ci NOT NULL,
  `photo` text COLLATE utf8_spanish_ci NOT NULL,
  `status` int(1) NOT NULL,
  `lastLogin` datetime NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `user`, `password`, `profile`, `photo`, `status`, `lastLogin`, `date`) VALUES
(1, 'Administrator', 'admin', '$2a$07$asxx54ahjppf45sd87a5auJvme8CFSgJ.CVouof6guZgq6uhIs55K', 'Administrator', 'views/img/users/admin/admin-icn.png', 1, '2022-12-12 22:42:22', '2022-12-13 03:42:22'),

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
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
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;
--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
