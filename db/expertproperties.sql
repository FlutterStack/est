-- phpMyAdmin SQL Dump
-- version 4.9.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Nov 10, 2020 at 03:36 PM
-- Server version: 5.7.26
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
-- Table structure for table `estate`
--

CREATE TABLE `estate` (
  `estate_id` int(10) UNSIGNED NOT NULL,
  `id_residential` int(11) UNSIGNED NOT NULL,
  `estate_name` varchar(255) NOT NULL,
  `estate_location` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lu_estate_img`
--

CREATE TABLE `lu_estate_img` (
  `img_id` int(10) UNSIGNED NOT NULL,
  `estate_id` int(10) UNSIGNED NOT NULL,
  `img_path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `lu_estate_info`
--

CREATE TABLE `lu_estate_info` (
  `sub_id` int(10) UNSIGNED NOT NULL,
  `estate_id` int(10) UNSIGNED NOT NULL,
  `no_of_rooms` int(15) NOT NULL,
  `no_of_garage` int(10) DEFAULT NULL,
  `no_of_kitchens` int(10) NOT NULL,
  `no_of_bathrooms` int(10) NOT NULL,
  `description` varchar(255) NOT NULL,
  `size` varchar(100) NOT NULL
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

--
-- Dumping data for table `residential`
--

INSERT INTO `residential` (`id_residential`, `class_name`, `description`) VALUES
(1, 'Residential', 'Residential is simply dummy text of the printing and typesetting industry.'),
(2, 'Commercial', 'Commercial is simply dummy text of the printing and typesetting industry.'),
(3, 'Industrial', 'Industrial is simply dummy text of the printing and typesetting industry.'),
(4, 'Agricultural', 'Agricultural is simply dummy text of the printing and typesetting industry.');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `idusers` int(10) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `mobile_no` int(12) DEFAULT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`idusers`, `first_name`, `last_name`, `email`, `mobile_no`, `password`) VALUES
(1, 'John', 'Doe', 'johndoe@gmail.com', NULL, 'test123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `estate`
--
ALTER TABLE `estate`
  ADD PRIMARY KEY (`estate_id`),
  ADD KEY `estate_fk_01_idx` (`id_residential`);

--
-- Indexes for table `lu_estate_img`
--
ALTER TABLE `lu_estate_img`
  ADD PRIMARY KEY (`img_id`),
  ADD KEY `lu_estate_img_fk_01_idx` (`estate_id`);

--
-- Indexes for table `lu_estate_info`
--
ALTER TABLE `lu_estate_info`
  ADD PRIMARY KEY (`sub_id`),
  ADD KEY `lu_estate_info_fk_01_idx` (`estate_id`);

--
-- Indexes for table `residential`
--
ALTER TABLE `residential`
  ADD PRIMARY KEY (`id_residential`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`idusers`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `estate`
--
ALTER TABLE `estate`
  MODIFY `estate_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lu_estate_info`
--
ALTER TABLE `lu_estate_info`
  MODIFY `sub_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `residential`
--
ALTER TABLE `residential`
  MODIFY `id_residential` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `idusers` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `estate`
--
ALTER TABLE `estate`
  ADD CONSTRAINT `estate_fk_01` FOREIGN KEY (`id_residential`) REFERENCES `residential` (`id_residential`);

--
-- Constraints for table `lu_estate_img`
--
ALTER TABLE `lu_estate_img`
  ADD CONSTRAINT `lu_estate_img_fk_01` FOREIGN KEY (`estate_id`) REFERENCES `estate` (`estate_id`);

--
-- Constraints for table `lu_estate_info`
--
ALTER TABLE `lu_estate_info`
  ADD CONSTRAINT `lu_estate_info_fk_01` FOREIGN KEY (`estate_id`) REFERENCES `estate` (`estate_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
