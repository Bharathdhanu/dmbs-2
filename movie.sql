-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 23, 2024 at 08:47 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `movie`
--

-- --------------------------------------------------------

--
-- Table structure for table `actor`
--

CREATE TABLE `actor` (
  `Act_id` int(11) NOT NULL,
  `Act_Name` varchar(25) NOT NULL,
  `Act_Gender` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `actor`
--

INSERT INTO `actor` (`Act_id`, `Act_Name`, `Act_Gender`) VALUES
(510, 'yash', 'm'),
(511, 'ramu', 'm'),
(512, 'ranju', 'm');

-- --------------------------------------------------------

--
-- Table structure for table `director`
--

CREATE TABLE `director` (
  `Dir_id` int(11) NOT NULL,
  `Dir_Name` varchar(25) NOT NULL,
  `Dir_Phone` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `director`
--

INSERT INTO `director` (`Dir_id`, `Dir_Name`, `Dir_Phone`) VALUES
(103, 'neel', '9000001'),
(104, 'neel', '90078001'),
(105, 'giri', '90678001');

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `mov_id` int(11) NOT NULL,
  `mov_title` varchar(50) NOT NULL,
  `mov_year` year(4) NOT NULL,
  `mov_lang` varchar(15) NOT NULL,
  `dir_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`mov_id`, `mov_title`, `mov_year`, `mov_lang`, `dir_id`) VALUES
(1008, 'kgf', 2018, 'kannada', 103),
(1009, 'rrr', 2020, 'telugu', 104),
(1010, 'geetha govindam', 2019, 'tamil', 105);

-- --------------------------------------------------------

--
-- Table structure for table `movie_cast`
--

CREATE TABLE `movie_cast` (
  `Act_id` int(11) NOT NULL,
  `Mov_id` int(11) NOT NULL,
  `Role` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `movie_cast`
--

INSERT INTO `movie_cast` (`Act_id`, `Mov_id`, `Role`) VALUES
(510, 1008, 'hero'),
(511, 1009, 'hero'),
(512, 1010, 'hero');

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `Mov_id` int(11) DEFAULT NULL,
  `Rev_Stars` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rating`
--

INSERT INTO `rating` (`Mov_id`, `Rev_Stars`) VALUES
(1008, 5),
(1009, 5),
(1010, 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `actor`
--
ALTER TABLE `actor`
  ADD PRIMARY KEY (`Act_id`);

--
-- Indexes for table `director`
--
ALTER TABLE `director`
  ADD PRIMARY KEY (`Dir_id`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`mov_id`),
  ADD KEY `dir_id` (`dir_id`);

--
-- Indexes for table `movie_cast`
--
ALTER TABLE `movie_cast`
  ADD PRIMARY KEY (`Act_id`,`Mov_id`),
  ADD KEY `Mov_id` (`Mov_id`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD KEY `Mov_id` (`Mov_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `movies`
--
ALTER TABLE `movies`
  ADD CONSTRAINT `movies_ibfk_1` FOREIGN KEY (`dir_id`) REFERENCES `director` (`Dir_id`);

--
-- Constraints for table `movie_cast`
--
ALTER TABLE `movie_cast`
  ADD CONSTRAINT `movie_cast_ibfk_1` FOREIGN KEY (`Act_id`) REFERENCES `actor` (`Act_id`),
  ADD CONSTRAINT `movie_cast_ibfk_2` FOREIGN KEY (`Mov_id`) REFERENCES `movies` (`mov_id`);

--
-- Constraints for table `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `rating_ibfk_1` FOREIGN KEY (`Mov_id`) REFERENCES `movies` (`mov_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
