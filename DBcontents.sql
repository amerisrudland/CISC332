-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 02, 2017 at 11:34 PM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `farmers market`
--

-- --------------------------------------------------------

--
-- Table structure for table `fav_products`
--

CREATE TABLE `fav_products` (
  `ProdNo` int(8) NOT NULL,
  `PurchaserID` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fav_products`
--

INSERT INTO `fav_products` (`ProdNo`, `PurchaserID`) VALUES
(12310666, 109030),
(44567888, 123451),
(66666888, 123451),
(88228822, 100023);

-- --------------------------------------------------------

--
-- Table structure for table `foodorder`
--

CREATE TABLE `foodorder` (
  `OrderNo` int(10) NOT NULL,
  `ProdNo` int(8) NOT NULL,
  `Quantity_Bought` int(11) NOT NULL,
  `Date_Sold` date NOT NULL,
  `PurchaserID` int(6) NOT NULL,
  `SellerID` int(6) NOT NULL,
  `Delivery_Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `foodorder`
--

INSERT INTO `foodorder` (`OrderNo`, `ProdNo`, `Quantity_Bought`, `Date_Sold`, `PurchaserID`, `SellerID`, `Delivery_Date`) VALUES
(7895677, 40000400, 10, '2017-02-28', 109030, 100001, '2017-03-03'),
(78956778, 40000400, 10, '2017-02-28', 109030, 100001, '2017-03-03'),
(100005555, 98767787, 15, '2017-02-28', 100023, 425252, '2017-03-03'),
(101010101, 12334111, 2, '2017-03-02', 100023, 100001, '2017-03-05'),
(123411111, 66666888, 20, '2017-03-01', 109030, 425252, '2017-03-04'),
(444444444, 44567888, 15, '2017-02-28', 100023, 100001, '2017-03-03'),
(555555555, 12310666, 20, '2017-03-01', 109030, 425252, '2017-03-04'),
(787663267, 88228822, 20, '2017-02-27', 123451, 209202, '2017-03-02'),
(987652342, 15151515, 25, '2017-02-27', 123451, 209202, '2017-03-02'),
(999999999, 11234767, 8, '2017-03-01', 100023, 209202, '2017-03-04'),
(1010101010, 12334111, 2, '2017-03-02', 100023, 100001, '2017-03-05'),
(2147483647, 44567888, 15, '2017-02-28', 100023, 100001, '2017-03-03');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `ProdNo` int(8) NOT NULL,
  `Name` varchar(25) NOT NULL,
  `SellerID` int(6) NOT NULL,
  `Date_Listed` date NOT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `Unit` varchar(8) NOT NULL,
  `Price_Per_Unit` decimal(5,2) NOT NULL,
  `Days_To_Delivery` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`ProdNo`, `Name`, `SellerID`, `Date_Listed`, `Quantity`, `Unit`, `Price_Per_Unit`, `Days_To_Delivery`) VALUES
(11234767, 'Pork Loin ', 209202, '2017-01-24', 3, '200g', '2.09', 3),
(12310666, '1% Milk ', 425252, '2017-02-26', 50, '1L ', '3.50', 3),
(12334111, 'Carrots ', 100001, '2017-03-01', 40, '0.5kg ', '4.00', 3),
(15151515, 'Chicken Breast ', 209202, '2017-01-25', 20, '300g ', '2.00', 3),
(40000400, 'Tomatoes ', 100001, '2017-02-04', 200, '1kg ', '5.00', 3),
(44567888, 'Apples ', 100001, '2017-02-03', 200, '1kg ', '7.00', 3),
(66666888, '2% Milk ', 425252, '2017-02-25', 50, '1L ', '3.50', 3),
(88228822, 'Sirloin Steak ', 209202, '2017-01-24', 20, '300g ', '3.10', 3),
(98767787, 'Chocolate Milk ', 425252, '2017-02-23', 50, '1L ', '3.50', 3);

-- --------------------------------------------------------

--
-- Table structure for table `purchaser`
--

CREATE TABLE `purchaser` (
  `PurchaserID` int(6) NOT NULL,
  `UserName` varchar(15) NOT NULL,
  `Address` varchar(40) NOT NULL,
  `Credit_Card` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchaser`
--

INSERT INTO `purchaser` (`PurchaserID`, `UserName`, `Address`, `Credit_Card`) VALUES
(100023, 'MuchoPizzeria', '43 Morris Ave', 900090009),
(109030, 'Scoops ', '34 Jones Street', 100010001),
(123451, 'PitaExperience', '10 Victoria Way', 345634563);

-- --------------------------------------------------------

--
-- Table structure for table `seller`
--

CREATE TABLE `seller` (
  `SellerID` int(6) NOT NULL,
  `UserName` varchar(15) NOT NULL,
  `Address` varchar(40) NOT NULL,
  `Delivery_Method` varchar(20) NOT NULL,
  `Checking_Number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `seller`
--

INSERT INTO `seller` (`SellerID`, `UserName`, `Address`, `Delivery_Method`, `Checking_Number`) VALUES
(100001, 'SmithFarms', '24 Apple Way', 'Truck', 42),
(209202, 'BlairButchers', '5 Cow Street ', 'Pickup ', 34),
(425252, 'RudlandDairy', '223 Highway 5', 'Truck ', 90);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `fav_products`
--
ALTER TABLE `fav_products`
  ADD PRIMARY KEY (`ProdNo`,`PurchaserID`),
  ADD KEY `PurchaserID` (`PurchaserID`);

--
-- Indexes for table `foodorder`
--
ALTER TABLE `foodorder`
  ADD PRIMARY KEY (`OrderNo`),
  ADD KEY `PurchaserID` (`PurchaserID`),
  ADD KEY `SellerID` (`SellerID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`ProdNo`),
  ADD KEY `SellerID` (`SellerID`);

--
-- Indexes for table `purchaser`
--
ALTER TABLE `purchaser`
  ADD PRIMARY KEY (`PurchaserID`),
  ADD UNIQUE KEY `UserName` (`UserName`);

--
-- Indexes for table `seller`
--
ALTER TABLE `seller`
  ADD PRIMARY KEY (`SellerID`),
  ADD UNIQUE KEY `UserName` (`UserName`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `fav_products`
--
ALTER TABLE `fav_products`
  ADD CONSTRAINT `fav_products_ibfk_1` FOREIGN KEY (`PurchaserID`) REFERENCES `purchaser` (`PurchaserID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fav_products_ibfk_2` FOREIGN KEY (`ProdNo`) REFERENCES `products` (`ProdNo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `foodorder`
--
ALTER TABLE `foodorder`
  ADD CONSTRAINT `foodorder_ibfk_1` FOREIGN KEY (`PurchaserID`) REFERENCES `purchaser` (`PurchaserID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `foodorder_ibfk_2` FOREIGN KEY (`SellerID`) REFERENCES `seller` (`SellerID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`SellerID`) REFERENCES `seller` (`SellerID`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
