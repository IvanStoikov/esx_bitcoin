-- phpMyAdmin SQL Dump
-- version 5.0.4deb1~bpo10+1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 18, 2021 at 05:41 PM
-- Server version: 10.3.27-MariaDB-0+deb10u1
-- PHP Version: 7.3.19-1~deb10u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";



INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `price`) VALUES
('bitcoin', 'Bitcoin', 1, 0, 0, 0),
('computer', 'Счупен компютър', 1, 0, 0, 0),
('coolermasterliquid', 'Водно охлаждане cooler master', 5, 0, 1, 10),
('coolernoctua', 'Вентилатор Noctua', 5, 0, 1, 10),
('cpui56400', 'Процесор Intel i5-6400', 5, 0, 1, 5000),
('cpui56500', 'Процесор Intel i5-6500', 5, 0, 1, 5250),
('cpui56600', 'Процесор Intel i5-6600', 5, 0, 1, 5500),
('cpui56600k', 'Процесор Intel i5-6600К', 5, 0, 1, 5),
('cpui57400', 'Процесор Intel i5-7400', 5, 0, 1, 10),
('cpui57500', 'Процесор Intel i5-7500', 5, 0, 1, 10),
('cpui57600', 'Процесор Intel i5-7600', 5, 0, 1, 10),
('cpui57600k', 'Процесор Intel i5-7600К', 5, 0, 1, 10),
('cpui58500', 'Процесор Intel i5-8500', 5, 0, 1, 10),
('cpui58600', 'Процесор Intel i5-8600', 5, 0, 1, 10),
('cpui58600k', 'Процесор Intel i5-8600К', 5, 0, 1, 10),
('cpui59600', 'Процесор Intel i5-9600', 5, 0, 1, 10),
('cpui77700', 'Процесор Intel i7-7700', 5, 0, 1, 10),
('cpui77700k', 'Процесор Intel i7-7700K', 5, 0, 1, 10),
('cpui78700', 'Процесор Intel i7-8700', 5, 0, 1, 10),
('cpui78700k', 'Процесор Intel i7-8700K', 5, 0, 1, 10),
('cpui79700', 'Процесор Intel i7-9700', 5, 0, 1, 10),
('cpui79700k', 'Процесор Intel i7-9700K', 5, 0, 1, 10),
('cpui97900x', 'Процесор Intel i9-7900X', 5, 0, 1, 10),
('cpui97920x', 'Процесор Intel i9-7920X', 5, 0, 1, 10),
('cpui97940x', 'Процесор Intel i9-7940X', 5, 0, 1, 10),
('cpui97960x', 'Процесор Intel i9-7960X', 5, 0, 1, 10),
('cpui97980xe', 'Процесор Intel i9-7980XE', 5, 0, 1, 10),
('cpui99900', 'Процесор Intel i9-9900', 5, 0, 1, 10),
('cpui99900k', 'Процесор Intel i9-9900K', 5, 0, 1, 10),
('hdd100', 'Хард диск 100 GB', 5, 0, 1, 10),
('hdd1000', 'Хард диск 1 TB', 5, 0, 1, 10),
('hdd50', 'Хард диск 50 GB', 5, 0, 1, 10),
('hdd500', 'Хард диск 500 GB', 5, 0, 1, 10),
('mobob250m', 'Чипсет B250M', 5, 0, 1, 10),
('mobob360m', 'Чипсет B360M', 5, 0, 1, 10),
('mobob365m', 'Чипсет B365M', 5, 0, 1, 10),
('moboh110', 'Чипсет H110', 5, 0, 1, 10),
('moboh310m', 'Чипсет H310M', 5, 0, 1, 10),
('mobox299', 'Чипсет X299', 5, 0, 1, 10),
('moboz390', 'Чипсет Z390', 5, 0, 1, 10),
('psu1000', 'Захранване 1000W', 5, 0, 1, 10),
('psu1100', 'Захранване 1100W', 5, 0, 1, 10),
('psu1200', 'Захранване 1200W', 5, 0, 1, 10),
('psu500', 'Захранване 500W', 5, 0, 1, 10),
('psu550', 'Захранване 550W', 5, 0, 1, 10),
('psu600', 'Захранване 600W', 5, 0, 1, 10),
('psu650', 'Захранване 650W', 5, 0, 1, 10),
('psu700', 'Захранване 700W', 5, 0, 1, 10),
('psu750', 'Захранване 750W', 5, 0, 1, 10),
('psu800', 'Захранване 800W', 5, 0, 1, 10),
('psu850', 'Захранване 850W', 5, 0, 1, 10),
('psu900', 'Захранване 900W', 5, 0, 1, 10),
('psu950', 'Захранване 950W', 5, 0, 1, 10),
('ram4gbddr3', 'Плочка RAM 4GB DDR3', 5, 0, 1, 10),
('ram4gbddr4', 'Плочка RAM 4GB DDR4', 5, 0, 1, 10),
('ram8gbddr3', 'Плочка RAM 8GB DDR3', 5, 0, 1, 10),
('ram8gbddr4', 'Плочка RAM 8GB DDR4', 5, 0, 1, 10),
('videocard1050', 'Видео карта GTX 1050', 5, 0, 1, 10),
('videocard1050ti', 'Видео карта GTX 1050 Ti', 5, 0, 1, 10),
('videocard10603gb', 'Видео карта GTX 1060 3GB', 5, 0, 1, 10),
('videocard10606gb', 'Видео карта GTX 1060 6GB', 5, 0, 1, 10),
('videocard1070', 'Видео карта GTX 1070', 5, 0, 1, 10),
('videocard1070ti', 'Видео карта GTX 1070 Ti', 5, 0, 1, 10),
('videocard1080', 'Видео карта GTX 1080', 5, 0, 1, 10),
('videocard1080ti', 'Видео карта GTX 1080 Ti', 5, 0, 1, 10),
('videocard1660ti', 'Видео карта GTX 1660 Ti', 5, 0, 1, 10),
('videocard2060', 'Видео карта GTX 2060', 5, 0, 1, 10),
('videocard2060super', 'Видео карта GTX 2060 Super', 5, 0, 1, 10),
('videocard2070', 'Видео карта GTX 2070', 5, 0, 1, 10),
('videocard2070super', 'Видео карта GTX 2070 Super', 5, 0, 1, 10),
('videocard2080', 'Видео карта GTX 2080', 5, 0, 1, 10),
('videocard2080super', 'Видео карта GTX 2080 Super', 5, 0, 1, 10),
('videocard2080ti', 'Видео карта GTX 2080 Ti', 5, 0, 1, 10),
('videocard960', 'Видео карта GTX 960', 5, 0, 1, 10),
('videocard970', 'Видео карта GTX 970', 5, 0, 1, 10),
('videocard980', 'Видео карта GTX 980', 5, 0, 1, 10),
('videocard980ti', 'Видео карта GTX 980 Ti', 5, 0, 1, 10)

--
-- Indexes for dumped tables
--

--
-- Indexes for table `items`
--

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
