-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 21, 2020 at 08:04 PM
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
-- Table structure for table `bills`
--

CREATE TABLE `bills` (
  `bill_id` int NOT NULL,
  `FK_booking_id` int NOT NULL,
  `euro` float(10,7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `bills`
--

INSERT INTO `bills` (`bill_id`, `FK_booking_id`, `euro`) VALUES
(1, 2, 100.0000000),
(3, 3, 234.0000000);

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

INSERT INTO `bookings` (`booking_id`, `rentstatus`, `pickup_location`, `return_location`, `rental_start`, `rental_end`, `FK_customer_id`, `FK_car_id`) VALUES
(2, 1, 'Oper', 'Karlsplatz', '2020-01-01 00:00:00.000000', '2020-01-02 00:00:00.000000', 3, 2),
(3, 2, 'Oper', 'Oper', '2020-01-08 00:00:00.000000', NULL, 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

CREATE TABLE `cars` (
  `car_id` int NOT NULL,
  `manufacturer` varchar(30) NOT NULL,
  `model` varchar(30) NOT NULL,
  `rentstatus` varchar(30) NOT NULL,
  `location` varchar(30) NOT NULL,
  `fuel` int NOT NULL,
  `km` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`car_id`, `manufacturer`, `model`, `rentstatus`, `location`, `fuel`, `km`) VALUES
(2, 'Audi', 'A4', 'VERMIETET', 'Oper', 100, 200),
(3, 'Tesla', 'T9000', 'FREI', 'Oper', 4, 200),
(4, 'VW', 'Passat', '', 'Oper', 232, 232);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `adress` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `pwd` varchar(30) NOT NULL,
  `cardnumber` varchar(30) NOT NULL,
  `active_rent` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `first_name`, `last_name`, `adress`, `email`, `pwd`, `cardnumber`, `active_rent`) VALUES
(3, 'Leonardo', 'Van Heisingen', 'Amsterdamstrasse 1', 'Leo@gumbamail.com', 'gehheast', '123456', ''),
(4, 'Leopoldine', 'Van Helsing', 'Amsterdam 2', 'poldi@dracula.org', 'gunk', '1234567', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`bill_id`),
  ADD KEY `FK_booking_id` (`FK_booking_id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `FK_customer_id` (`FK_customer_id`),
  ADD KEY `FK_car_id` (`FK_car_id`);

--
-- Indexes for table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`car_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bills`
--
ALTER TABLE `bills`
  MODIFY `bill_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `booking_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cars`
--
ALTER TABLE `cars`
  MODIFY `car_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bills`
--
ALTER TABLE `bills`
  ADD CONSTRAINT `FK_booking_id` FOREIGN KEY (`FK_booking_id`) REFERENCES `bookings` (`booking_id`) ON UPDATE CASCADE;

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
