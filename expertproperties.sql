-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 08, 2020 at 05:59 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `expertproperties`
--

-- --------------------------------------------------------

--
-- Table structure for table `imgsub`
--

CREATE TABLE `imgsub` (
  `img_id` int(10) UNSIGNED NOT NULL,
  `sub_id` int(10) UNSIGNED NOT NULL,
  `img_path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `residential`
--

CREATE TABLE `residential` (
  `id_residential` int(11) UNSIGNED NOT NULL,
  `class_name` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `subclass`
--

CREATE TABLE `subclass` (
  `sub_id` int(10) UNSIGNED NOT NULL,
  `no_of_rooms` int(15) NOT NULL,
  `no_of_garage` int(10) DEFAULT NULL,
  `no_of_kitchens` int(10) NOT NULL,
  `no_of_bathrooms` int(10) NOT NULL,
  `description` varchar(255) NOT NULL,
  `size` varchar(100) NOT NULL,
  `id_residential` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `idusers` int(10) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `gmail_id` varchar(45) NOT NULL,
  `mobile_no` int(12) NOT NULL,
  `passwords` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `imgsub`
--
ALTER TABLE `imgsub`
  ADD PRIMARY KEY (`img_id`);

--
-- Indexes for table `residential`
--
ALTER TABLE `residential`
  ADD PRIMARY KEY (`id_residential`);

--
-- Indexes for table `subclass`
--
ALTER TABLE `subclass`
  ADD PRIMARY KEY (`sub_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`idusers`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `residential`
--
ALTER TABLE `residential`
  MODIFY `id_residential` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subclass`
--
ALTER TABLE `subclass`
  MODIFY `sub_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
