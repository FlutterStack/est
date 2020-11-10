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
-- Table structure for table `lu_estate_img`
--

CREATE TABLE `lu_estate_img` (
  `img_id` int(10) unsigned NOT NULL,
  `sub_id` int(10) unsigned NOT NULL,
  `img_path` varchar(255) NOT NULL,
  PRIMARY KEY (`img_id`),
  KEY `imgsub_fk_01_idx` (`sub_id`),
  CONSTRAINT `imgsub_fk_01` FOREIGN KEY (`sub_id`) REFERENCES `lu_estate_info` (`sub_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4

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
-- Table structure for table `lu_estate_info`
--
CREATE TABLE `lu_estate_info` (
  `sub_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `estate_id` int(10) unsigned NOT NULL,
  `no_of_rooms` int(15) NOT NULL,
  `no_of_garage` int(10) DEFAULT NULL,
  `no_of_kitchens` int(10) NOT NULL,
  `no_of_bathrooms` int(10) NOT NULL,
  `description` varchar(255) NOT NULL,
  `size` varchar(100) NOT NULL,
  PRIMARY KEY (`sub_id`),
  KEY `lu_estate_info_fk_01_idx` (`estate_id`),
  CONSTRAINT `lu_estate_info_fk_01` FOREIGN KEY (`estate_id`) REFERENCES `estate` (`estate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4
-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `idusers` int(10) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `mobile_no` int(12) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`idusers`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `estate`
--

CREATE TABLE `estate` (
  `estate_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_residential` int(11) unsigned NOT NULL,
  `estate_name` varchar(255) NOT NULL,
  `estate_location` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`estate_id`),
  KEY `estate_fk_01_idx` (`id_residential`),
  CONSTRAINT `estate_fk_01` FOREIGN KEY (`id_residential`) REFERENCES `residential` (`id_residential`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8

--
-- Indexes for dumped tables
--

--
-- Indexes for table `lu_estate_img`
--
ALTER TABLE `lu_estate_img`
  ADD PRIMARY KEY (`img_id`);

--
-- Indexes for table `residential`
--
ALTER TABLE `residential`
  ADD PRIMARY KEY (`id_residential`);

--
-- Indexes for table `lu_estate_info`
--
ALTER TABLE `lu_estate_info`
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


ALTER TABLE `expertproperties`.`subclass` 
ADD INDEX `subclass_fk_01_idx` (`id_residential` ASC);
;
ALTER TABLE `expertproperties`.`subclass` 
ADD CONSTRAINT `subclass_fk_01`
  FOREIGN KEY (`id_residential`)
  REFERENCES `expertproperties`.`residential` (`id_residential`)
  ON DELETE RESTRICT
  ON UPDATE RESTRICT;


ALTER TABLE `expertproperties`.`imgsub` 
ADD INDEX `imgsub_fk_01_idx` (`sub_id` ASC);
;
ALTER TABLE `expertproperties`.`imgsub` 
ADD CONSTRAINT `imgsub_fk_01`
  FOREIGN KEY (`sub_id`)
  REFERENCES `expertproperties`.`subclass` (`sub_id`)
  ON DELETE RESTRICT
  ON UPDATE RESTRICT;
