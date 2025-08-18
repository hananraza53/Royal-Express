-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 15, 2023 at 06:48 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `royal_express_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `area`
--

CREATE TABLE `area` (
  `area_id` int(11) NOT NULL,
  `area_name` varchar(255) NOT NULL,
  `is_deleted` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `area`
--

INSERT INTO `area` (`area_id`, `area_name`, `is_deleted`) VALUES
(7, 'Karachi', 0),
(22, 'Lahore', 0),
(23, 'Islamabad', 0),
(24, 'Multan', 0),
(25, 'Peshawar', 0),
(26, 'Kashmir', 0),
(27, 'Gilgit', 0),
(28, 'Quetta', 0),
(29, 'Sukkur', 0);

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `branch_id` int(11) NOT NULL,
  `branch_name` varchar(255) NOT NULL,
  `is_deleted` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`branch_id`, `branch_name`, `is_deleted`) VALUES
(6, 'Karachi', 0),
(7, 'Lahore', 0),
(8, 'Islamabad', 0),
(9, 'Quetta', 0),
(10, 'Gilgit', 0),
(11, 'Kashmir', 0);

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `contact_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` varchar(255) NOT NULL,
  `date_updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`contact_id`, `name`, `email`, `subject`, `message`, `date_updated`) VALUES
(16, 'Muhammad Hanan Raza', 'hannanraza53@gmail.com', 'E-project', 'Hi There!', '2022-11-28 10:54:08');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `nic` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `gender` int(2) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_deleted` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `name`, `email`, `phone`, `nic`, `address`, `gender`, `password`, `is_deleted`) VALUES
(1, 'hanan Raza', 'hananraza123@gmail.com', '0123456789', '420001234567', 'Karachi,Pakistan',1,'hanan123',0);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `emp_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `nic` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `gender` int(2) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_deleted` int(2) NOT NULL,
  `branch_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`emp_id`, `name`, `email`, `phone`, `nic`, `address`, `gender`, `password`, `is_deleted`, `branch_id`) VALUES
(1, '', 'admin', '', '', '', 0, '12345', 0, 0),

(12, 'EMP1', 'emp1@gmail.com', '0120000000', '09800abcde', 'No 123, University Road, Sindh, Pakistan', 1, 'emp1', 0, 6),

(13, 'EMP2', 'emp2@gmail.com', '0340000000', '34567abcde', 'No 456, Memon Hospital Road, Sindh, Pakistan', 1, 'emp2', 0, 9);

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE `gallery` (
  `gallery_id` int(11) NOT NULL,
  `gallery_image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gallery`
--

INSERT INTO `gallery` (`gallery_id`, `gallery_image`) VALUES
(28, 'Gallery_01.jpg'),
(29, 'courier-2.jpg'),
(30, 'Gallery_03.jpg'),
(32, 'Gallery_05.jpg'),
(33, 'courier-3.webp'),
(34, 'Gallery_04.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `price_table`
--

CREATE TABLE `price_table` (
  `price_id` int(11) NOT NULL,
  `start_area` varchar(255) NOT NULL,
  `end_area` varchar(255) NOT NULL,
  `price` int(255) NOT NULL,
  `is_deleted` int(255) NOT NULL,
  `date_updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `price_table`
--

INSERT INTO `price_table` (`price_id`, `start_area`, `end_area`, `price`, `is_deleted`, `date_updated`) VALUES
(1, '7', '22', 250, 0, '2025-07-30 12:00:00'),
(2, '22', '7', 250, 0, '2025-07-30 12:00:00'),

(3, '7', '23', 350, 0, '2025-07-30 12:00:00'),
(4, '23', '7', 350, 0, '2025-07-30 12:00:00'),

(5, '7', '24', 300, 0, '2025-07-30 12:00:00'),
(6, '24', '7', 300, 0, '2025-07-30 12:00:00'),

(7, '7', '25', 300, 0, '2025-07-30 12:00:00'),
(8, '25', '7', 300, 0, '2025-07-30 12:00:00'),

(9, '7', '26', 320, 0, '2025-07-30 12:00:00'),
(10, '26', '7', 320, 0, '2025-07-30 12:00:00'),

(11, '7', '27', 400, 0, '2025-07-30 12:00:00'),
(12, '27', '7', 400, 0, '2025-07-30 12:00:00'),

(13, '7', '28', 250, 0, '2025-07-30 12:00:00'),
(14, '28', '7', 250, 0, '2025-07-30 12:00:00'),

(15, '7', '29', 260, 0, '2025-07-30 12:00:00'),
(16, '29', '7', 260, 0, '2025-07-30 12:00:00'),

(17, '22', '23', 270, 0, '2025-07-30 12:00:00'),
(18, '23', '22', 270, 0, '2025-07-30 12:00:00'),

(19, '22', '24', 280, 0, '2025-07-30 12:00:00'),
(20, '24', '22', 280, 0, '2025-07-30 12:00:00'),

(21, '22', '25', 300, 0, '2025-07-30 12:00:00'),
(22, '25', '22', 300, 0, '2025-07-30 12:00:00'),

(23, '22', '26', 320, 0, '2025-07-30 12:00:00'),
(24, '26', '22', 320, 0, '2025-07-30 12:00:00'),

(25, '22', '27', 350, 0, '2025-07-30 12:00:00'),
(26, '27', '22', 350, 0, '2025-07-30 12:00:00'),

(27, '22', '28', 330, 0, '2025-07-30 12:00:00'),
(28, '28', '22', 330, 0, '2025-07-30 12:00:00'),

(29, '22', '29', 340, 0, '2025-07-30 12:00:00'),
(30, '29', '22', 340, 0, '2025-07-30 12:00:00'),

(31, '23', '24', 260, 0, '2025-07-30 12:00:00'),
(32, '24', '23', 260, 0, '2025-07-30 12:00:00'),

(33, '23', '25', 270, 0, '2025-07-30 12:00:00'),
(34, '25', '23', 270, 0, '2025-07-30 12:00:00'),

(35, '23', '26', 300, 0, '2025-07-30 12:00:00'),
(36, '26', '23', 300, 0, '2025-07-30 12:00:00'),

(37, '23', '27', 350, 0, '2025-07-30 12:00:00'),
(38, '27', '23', 350, 0, '2025-07-30 12:00:00'),

(39, '23', '28', 330, 0, '2025-07-30 12:00:00'),
(40, '28', '23', 330, 0, '2025-07-30 12:00:00'),

(41, '23', '29', 320, 0, '2025-07-30 12:00:00'),
(42, '29', '23', 320, 0, '2025-07-30 12:00:00'),

(43, '24', '25', 280, 0, '2025-07-30 12:00:00'),
(44, '25', '24', 280, 0, '2025-07-30 12:00:00'),

(45, '24', '26', 300, 0, '2025-07-30 12:00:00'),
(46, '26', '24', 300, 0, '2025-07-30 12:00:00'),

(47, '24', '27', 340, 0, '2025-07-30 12:00:00'),
(48, '27', '24', 340, 0, '2025-07-30 12:00:00'),

(49, '24', '28', 320, 0, '2025-07-30 12:00:00'),
(50, '28', '24', 320, 0, '2025-07-30 12:00:00'),

(51, '24', '29', 310, 0, '2025-07-30 12:00:00'),
(52, '29', '24', 310, 0, '2025-07-30 12:00:00'),

(53, '25', '26', 310, 0, '2025-07-30 12:00:00'),
(54, '26', '25', 310, 0, '2025-07-30 12:00:00'),

(55, '25', '27', 360, 0, '2025-07-30 12:00:00'),
(56, '27', '25', 360, 0, '2025-07-30 12:00:00'),

(57, '25', '28', 330, 0, '2025-07-30 12:00:00'),
(58, '28', '25', 330, 0, '2025-07-30 12:00:00'),

(59, '25', '29', 340, 0, '2025-07-30 12:00:00'),
(60, '29', '25', 340, 0, '2025-07-30 12:00:00'),

(61, '26', '27', 370, 0, '2025-07-30 12:00:00'),
(62, '27', '26', 370, 0, '2025-07-30 12:00:00'),

(63, '26', '28', 340, 0, '2025-07-30 12:00:00'),
(64, '28', '26', 340, 0, '2025-07-30 12:00:00'),

(65, '26', '29', 350, 0, '2025-07-30 12:00:00'),
(66, '29', '26', 350, 0, '2025-07-30 12:00:00'),

(67, '27', '28', 360, 0, '2025-07-30 12:00:00'),
(68, '28', '27', 360, 0, '2025-07-30 12:00:00'),

(69, '27', '29', 370, 0, '2025-07-30 12:00:00'),
(70, '29', '27', 370, 0, '2025-07-30 12:00:00'),

(71, '28', '29', 200, 0, '2025-07-30 12:00:00'),
(72, '29', '28', 200, 0, '2025-07-30 12:00:00');


-- --------------------------------------------------------

--
-- Table structure for table `request`
--

CREATE TABLE `request` (
  `request_id` int(11) NOT NULL,
  `customer_id` int(255) NOT NULL,
  `sender_phone` int(255) NOT NULL,
  `weight` int(255) NOT NULL,
  `send_location` int(255) NOT NULL,
  `end_location` int(255) NOT NULL,
  `total_fee` int(255) NOT NULL,
  `res_phone` int(255) NOT NULL,
  `red_address` varchar(255) NOT NULL,
  `is_deleted` int(2) NOT NULL,
  `date_updated` datetime NOT NULL,
  `tracking_status` int(10) NOT NULL,
  `res_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `request`
--

INSERT INTO `request` (`request_id`, `customer_id`, `sender_phone`, `weight`, `send_location`, `end_location`, `total_fee`, `res_phone`, `red_address`, `is_deleted`, `date_updated`, `tracking_status`, `res_name`) VALUES
(20, 14, 312345678, 1, 7, 23, 100, 120000000, 'No 123, University Road, Sindh, Pakistan', 0, '2023-01-15 11:14:09', 1, 'Receiver 1'),

(25, 17, 512345678, 5, 7, 22, 1250, 120000000, 'No 123, University Road, Sindh, Pakistan', 0, '2023-01-15 11:14:09', 1, 'Receiver 1');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `header_image` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `header_title` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `header_desc` varchar(1000) CHARACTER SET utf8mb4 NOT NULL,
  `about_title` varchar(255) CHARACTER SET utf8 NOT NULL,
  `about_desc` varchar(1000) CHARACTER SET utf8mb4 NOT NULL,
  `company_phone` varchar(255) CHARACTER SET utf8 NOT NULL,
  `company_email` varchar(255) NOT NULL,
  `company_address` varchar(255) NOT NULL,
  `sub_image` varchar(255) NOT NULL,
  `about_image` varchar(255) NOT NULL,
  `link_facebook` varchar(255) NOT NULL,
  `link_twiiter` varchar(255) NOT NULL,
  `link_instragram` varchar(255) NOT NULL,
  `background_image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`header_image`, `header_title`, `header_desc`, `about_title`, `about_desc`, `company_phone`, `company_email`, `company_address`, `sub_image`, `about_image`, `link_facebook`, `link_twiiter`, `link_instragram`, `background_image`) VALUES
('container.jpg', 'Welcome to Royal Express', 'Your Premier Domestic Courier Service Provider', 'About Us', 'Royal Express is a Pakistani premier domestic courier service provider. With the strength of an experienced and talented team, Royal Express functions with the utmost confidence in the broadest coverage, security, and timely delivery of your important documents and packages. Royal Express also has a strong background in logistics management. As a result of the trust we have built with our corporate clients, Royal Express is now the official courier for a number of entities in Pakistan. Royal Express upholds high service standards and quality levels to ensure that your packages and documents are handled by professionals.', '+92 3192506226', 'hannanraza53@gmail.com', 'No 123, University Road, Karachi, Sindh, Pakistan', 'Sub_Header.jpg', 'courier-6.png.jpg', 'https://www.facebook.com/', 'https://www.twitter.com/', 'https://www.instagram.com/', 'Background.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`area_id`);

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`branch_id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`contact_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`emp_id`);

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`gallery_id`);

--
-- Indexes for table `price_table`
--
ALTER TABLE `price_table`
  ADD PRIMARY KEY (`price_id`);

--
-- Indexes for table `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`request_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `area`
--
ALTER TABLE `area`
  MODIFY `area_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `branch`
--
ALTER TABLE `branch`
  MODIFY `branch_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `contact_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `emp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `gallery`
--
ALTER TABLE `gallery`
  MODIFY `gallery_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `price_table`
--
ALTER TABLE `price_table`
  MODIFY `price_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `request`
--
ALTER TABLE `request`
  MODIFY `request_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
