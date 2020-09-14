-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.19 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for shoppingappdatabase
CREATE DATABASE IF NOT EXISTS `shoppingappdatabase` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `shoppingappdatabase`;

-- Dumping structure for table shoppingappdatabase.carts
CREATE TABLE IF NOT EXISTS `carts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL DEFAULT '1',
  `name` varchar(255) NOT NULL,
  `price` int NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `productId` int DEFAULT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `productId` (`productId`),
  KEY `userId` (`userId`),
  CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `carts_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table shoppingappdatabase.carts: ~2 rows (approximately)
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
INSERT INTO `carts` (`id`, `quantity`, `name`, `price`, `createdAt`, `updatedAt`, `productId`, `userId`) VALUES
	(1, 1, 'Gucci Floral All Print Shirt', 230000, '2020-09-14 10:37:58', '2020-09-14 10:37:58', 1, 1),
	(2, 2, 'Grey-Black Men\'s Blazer', 35000, '2020-09-14 10:38:01', '2020-09-14 10:52:45', 2, 1);
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;

-- Dumping structure for table shoppingappdatabase.products
CREATE TABLE IF NOT EXISTS `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `price` int NOT NULL DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `manufacturerId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `manufacturerId` (`manufacturerId`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`manufacturerId`) REFERENCES `vendors` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table shoppingappdatabase.products: ~11 rows (approximately)
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` (`id`, `name`, `price`, `createdAt`, `updatedAt`, `manufacturerId`) VALUES
	(1, 'Gucci Floral All Print Shirt', 230000, '2020-09-13 06:35:59', '2020-09-13 06:35:59', 3),
	(2, 'Grey-Black Men\'s Blazer', 35000, '2020-09-14 10:05:59', '2020-09-14 10:05:59', 3),
	(3, 'Solid Color Shirts(Pack of 4)', 35000, '2020-09-14 10:06:39', '2020-09-14 10:06:39', 3),
	(4, 'Winter Combo', 35000, '2020-09-14 10:07:01', '2020-09-14 10:07:01', 3),
	(5, 'Flare Frock Black(Age 4-9 yrs)', 2500, '2020-09-14 10:49:34', '2020-09-14 10:49:34', 2),
	(6, 'Flare Frock Blue(Age 6-9 yrs)', 2500, '2020-09-14 10:49:47', '2020-09-14 10:49:47', 2),
	(7, 'Casual Blue Printed Dress', 6000, '2020-09-14 10:50:29', '2020-09-14 10:50:29', 4),
	(8, 'Casual Summer Party Dress', 6500, '2020-09-14 10:50:51', '2020-09-14 10:50:51', 4),
	(9, 'Casual Beige Dress', 5500, '2020-09-14 10:51:20', '2020-09-14 10:51:20', 4),
	(10, 'Winter Combo (Age 2-4 Years)', 7000, '2020-09-14 10:51:50', '2020-09-14 10:51:50', 1),
	(11, 'Blue Adventure T', 2000, '2020-09-14 10:52:12', '2020-09-14 10:52:12', 1);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;

-- Dumping structure for table shoppingappdatabase.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table shoppingappdatabase.users: ~1 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `username`, `password`, `createdAt`, `updatedAt`) VALUES
	(1, 'agam', 'hello', '2020-09-13 06:35:16', '2020-09-13 06:35:16');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table shoppingappdatabase.vendors
CREATE TABLE IF NOT EXISTS `vendors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table shoppingappdatabase.vendors: ~4 rows (approximately)
/*!40000 ALTER TABLE `vendors` DISABLE KEYS */;
INSERT INTO `vendors` (`id`, `name`, `createdAt`, `updatedAt`) VALUES
	(1, 'Boys', '2019-09-13 12:02:23', '2020-09-13 12:02:24'),
	(2, 'Girls', '2019-09-13 12:02:23', '2020-09-13 12:02:24'),
	(3, 'Men', '2019-09-13 12:02:23', '2020-09-13 12:02:24'),
	(4, 'Women', '2019-09-13 12:02:23', '2020-09-13 12:02:24');
/*!40000 ALTER TABLE `vendors` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
