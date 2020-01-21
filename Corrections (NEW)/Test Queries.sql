-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 21, 2020 at 08:02 PM
-- Server version: 8.0.19
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr05_edwin_hofer_carrental`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `booking_id` int NOT NULL,
  `rentstatus` int NOT NULL,
  `pickup_location` varchar(30) NOT NULL,
  `return_location` varchar(30) NOT NULL,
  `rental_start` datetime(6) NOT NULL,
  `rental_end` datetime(6) DEFAULT NULL,
  `FK_customer_id` int NOT NULL,
  `FK_car_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`booking_id`, `rentstatus`, `pickup_location`, `return_location`, `rental_start`, `rental_end`, `FK_customer_id`, `FK_car_id`, `bill_id`, `FK_booking_id`, `euro`) VALUES
(2, 1, 'Oper', 'Karlsplatz', '2020-01-01 00:00:00.000000', '2020-01-02 00:00:00.000000', 3, 2, 1, 2, 100.0000000),
(3, 2, 'Oper', 'Oper', '2020-01-08 00:00:00.000000', NULL, 3, 2, 1, 2, 100.0000000),
(2, 1, 'Oper', 'Karlsplatz', '2020-01-01 00:00:00.000000', '2020-01-02 00:00:00.000000', 3, 2, 3, 3, 234.0000000),
(3, 2, 'Oper', 'Oper', '2020-01-08 00:00:00.000000', NULL, 3, 2, 3, 3, 234.0000000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `FK_customer_id` (`FK_customer_id`),
  ADD KEY `FK_car_id` (`FK_car_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `booking_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `FK_car_id` FOREIGN KEY (`FK_car_id`) REFERENCES `cars` (`car_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_customer_id` FOREIGN KEY (`FK_customer_id`) REFERENCES `customers` (`customer_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
