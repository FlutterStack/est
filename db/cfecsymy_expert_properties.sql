
-- Database: ` cfecsymy_expert_properties`
--

-- --------------------------------------------------------

--
-- Table structure for table `estate`
--

CREATE TABLE `estate` (
  `estate_id` int(10) UNSIGNED NOT NULL,
  `property_id` int(11) UNSIGNED NOT NULL,
  `estate_name` varchar(255) NOT NULL,
  `estate_location` varchar(255) NOT NULL,
  `description` text,
  `amount` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `estate`
--

INSERT INTO `estate` (`estate_id`, `property_id`, `estate_name`, `estate_location`, `description`, `amount`) VALUES
(1, 1, 'Luxury villa purple Valley with swimming pool', 'Herman St.', 'Flawless 2 story on a family friendly cul-de-sac in the heart of Blue Valley! Walk in to an open floor plan flooded w daylightm, formal dining private office, screened-in lanai w fireplace, TV hookup & custom heaters that overlooks the lit basketball court.', 126000000),
(2, 1, 'Penthouse  at stratagic with  Clubhouse/ Gym/ Swimming Pool', 'Herman St.', 'Flawless 2 story on a family friendly cul-de-sac in the heart of Blue Valley! Walk in to an open floor plan flooded w daylightm, formal dining private office, screened-in lanai w fireplace, TV hookup & custom heaters that overlooks the lit basketball court.', 2000000),
(3, 1, 'Heritage Portuguese Villa with swimming pool and servant room in Assagao', 'Herman St.', 'Flawless 2 story on a family friendly cul-de-sac in the heart of Blue Valley! Walk in to an open floor plan flooded w daylightm, formal dining private office, screened-in lanai w fireplace, TV hookup & custom heaters that overlooks the lit basketball court.', 120000000),
(4, 1, 'VISTA DO RIO Heritage, writers village of Aldona in North Goa', 'Herman St.', 'Flawless 2 story on a family friendly cul-de-sac in the heart of Blue Valley! Walk in to an open floor plan flooded w daylightm, formal dining private office, screened-in lanai w fireplace, TV hookup & custom heaters that overlooks the lit basketball court.', 100000000),
(5, 1, 'Rajkot, MI 49428, SF', 'Herman St.', 'Flawless 2 story on a family friendly cul-de-sac in the heart of Blue Valley! Walk in to an open floor plan flooded w daylightm, formal dining private office, screened-in lanai w fireplace, TV hookup & custom heaters that overlooks the lit basketball court.', 5000000),
(6, 1, 'Bhuj, MI 55555, SF', 'Herman St.', 'Flawless 2 story on a family friendly cul-de-sac in the heart of Blue Valley! Walk in to an open floor plan flooded w daylightm, formal dining private office, screened-in lanai w fireplace, TV hookup & custom heaters that overlooks the lit basketball court.', 6000000);

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
  `description` varchar(255) DEFAULT NULL,
  `size` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lu_estate_info`
--

INSERT INTO `lu_estate_info` (`sub_id`, `estate_id`, `no_of_rooms`, `no_of_garage`, `no_of_kitchens`, `no_of_bathrooms`, `description`, `size`) VALUES
(1, 1, 4, 2, 1, 2, NULL, 800),
(2, 2, 4, 3, 2, 4, NULL, 500),
(3, 3, 4, 1, 1, 2, NULL, 750),
(4, 4, 4, 3, 2, 3, NULL, 789),
(5, 5, 4, 2, 1, 2, NULL, 5.416),
(6, 6, 5, 3, 2, 4, NULL, 6.416);

-- --------------------------------------------------------

--
-- Table structure for table `property`
--

CREATE TABLE `property` (
  `property_id` int(11) UNSIGNED NOT NULL,
  `class_name` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `property`
--

INSERT INTO `property` (`property_id`, `class_name`, `description`) VALUES
(1, 'Residential', 'Residential is simply dummy text of the printing and typesetting industry.'),
(2, 'Commercial', 'Commercial is simply dummy text of the printing and typesetting industry.'),
(3, 'Industrial', 'Industrial is simply dummy text of the printing and typesetting industry.'),
(4, 'Agricultural', 'Agricultural is simply dummy text of the printing and typesetting industry.');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `idusers` int(10) UNSIGNED NOT NULL,
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
(1, 'Johon', 'Doe', 'johndoe@gmail.com', NULL, 'test123');

-- --------------------------------------------------------

--
-- Table structure for table `user_favorites`
--

CREATE TABLE `user_favorites` (
  `fav_id` int(10) UNSIGNED NOT NULL,
  `estate_id` int(10) UNSIGNED NOT NULL,
  `idusers` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `estate`
--
ALTER TABLE `estate`
  ADD PRIMARY KEY (`estate_id`),
  ADD KEY `estate_fk_01_idx` (`property_id`);

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
-- Indexes for table `property`
--
ALTER TABLE `property`
  ADD PRIMARY KEY (`property_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`idusers`);

--
-- Indexes for table `user_favorites`
--
ALTER TABLE `user_favorites`
  ADD PRIMARY KEY (`fav_id`),
  ADD KEY `user_favorites_fk_01_idx` (`idusers`),
  ADD KEY `user_favorites_fk_02_idx` (`estate_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `estate`
--
ALTER TABLE `estate`
  MODIFY `estate_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `lu_estate_info`
--
ALTER TABLE `lu_estate_info`
  MODIFY `sub_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `property`
--
ALTER TABLE `property`
  MODIFY `property_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `idusers` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_favorites`
--
ALTER TABLE `user_favorites`
  MODIFY `fav_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `estate`
--
ALTER TABLE `estate`
  ADD CONSTRAINT `estate_fk_01` FOREIGN KEY (`property_id`) REFERENCES `property` (`property_id`);

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

--
-- Constraints for table `user_favorites`
--
ALTER TABLE `user_favorites`
  ADD CONSTRAINT `user_favorites_fk_01` FOREIGN KEY (`idusers`) REFERENCES `users` (`idusers`),
  ADD CONSTRAINT `user_favorites_fk_02` FOREIGN KEY (`estate_id`) REFERENCES `estate` (`estate_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
