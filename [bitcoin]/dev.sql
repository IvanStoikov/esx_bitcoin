-- phpMyAdmin SQL Dump
-- version 5.0.4deb1~bpo10+1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 18, 2021 at 05:36 PM
-- Server version: 10.3.27-MariaDB-0+deb10u1
-- PHP Version: 7.3.19-1~deb10u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dev`
--

-- --------------------------------------------------------

--
-- Table structure for table `computers`
--

CREATE TABLE `computers` (
  `pc` varchar(255) COLLATE utf8_bin NOT NULL,
  `itemname` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `computers`
--


-- --------------------------------------------------------

--
-- Table structure for table `computers_data`
--

CREATE TABLE `computers_data` (
  `password` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `locked` tinyint(1) NOT NULL DEFAULT 0,
  `bitcoin` varchar(50) COLLATE utf8_bin DEFAULT '0',
  `pc` varchar(50) COLLATE utf8_bin NOT NULL,
  `customname` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT 'PC'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `computers_data`
--

INSERT INTO `computers_data` (`password`, `phone`, `locked`, `bitcoin`, `pc`, `customname`) VALUES
(NULL, NULL, 0, '0', 'Bitcoin_7', 'PC'),
(NULL, NULL, 0, '0', 'Bitcoin_1', 'PC'),
(NULL, NULL, 0, '0', 'Bitcoin_2', 'PC'),
(NULL, NULL, 0, '0', 'Bitcoin_3', 'PC'),
(NULL, NULL, 0, '0', 'Bitcoin_4', 'PC'),
(NULL, NULL, 0, '0', 'Bitcoin_5', 'PC'),
(NULL, NULL, 0, '0', 'Bitcoin_6', 'PC'),
(NULL, NULL, 0, '0', 'Bitcoin_8', 'PC'),
(NULL, NULL, 0, '0', 'Bitcoin_9', 'PC'),
(NULL, NULL, 0, '0', 'Bitcoin_10', 'PC'),
(NULL, NULL, 0, '0', 'Bitcoin_11', 'PC'),
(NULL, NULL, 0, '0', 'Bitcoin_12', 'PC'),
(NULL, NULL, 0, '0', 'Bitcoin_13', 'PC'),
(NULL, NULL, 0, '0', 'Bitcoin_14', 'PC'),
(NULL, NULL, 0, '0', 'Bitcoin_15', 'PC'),
(NULL, NULL, 0, '0', 'Bitcoin_16', 'PC'),
(NULL, NULL, 0, '0', 'Bitcoin_17', 'PC'),
(NULL, NULL, 0, '0', 'Bitcoin_18', 'PC'),
(NULL, NULL, 0, '0', 'Bitcoin_19', 'PC'),
(NULL, NULL, 0, '0', 'Bitcoin_20', 'PC');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
