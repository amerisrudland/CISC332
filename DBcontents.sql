-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 03, 2017 at 04:05 AM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Market2`
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
(3, 5),
(4, 6),
(6, 6),
(8, 4);

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
(1, 5, 10, '2017-02-28', 5, 1, '2017-03-03'),
(2, 5, 10, '2017-02-28', 5, 1, '2017-03-03'),
(3, 9, 15, '2017-02-28', 4, 3, '2017-03-03'),
(4, 3, 2, '2017-03-02', 4, 1, '2017-03-05'),
(5, 7, 20, '2017-03-01', 5, 3, '2017-03-04'),
(6, 6, 15, '2017-02-28', 4, 1, '2017-03-03'),
(7, 2, 20, '2017-03-01', 5, 3, '2017-03-04'),
(8, 8, 20, '2017-02-27', 6, 2, '2017-03-02'),
(9, 4, 25, '2017-02-27', 6, 2, '2017-03-02'),
(10, 1, 8, '2017-03-01', 4, 2, '2017-03-04'),
(11, 3, 2, '2017-03-02', 4, 1, '2017-03-05'),
(12, 6, 15, '2017-02-28', 4, 1, '2017-03-03');

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
(1, 'Pork Loin ', 2, '2017-01-24', 3, '200g', '2.09', 3),
(2, 'Skim Milk', 3, '2017-04-02', 50, '1L', '3.50', 3),
(3, 'Carrots ', 1, '2017-03-01', 40, '0.5kg ', '4.00', 3),
(4, 'Chicken Breast ', 2, '2017-01-25', 20, '300g ', '2.00', 3),
(5, 'Tomatoes ', 1, '2017-02-04', 200, '1kg ', '5.00', 3),
(6, 'Apples ', 1, '2017-02-03', 200, '1kg ', '7.00', 3),
(7, '2% Milk ', 3, '2017-02-25', 50, '1L ', '3.50', 3),
(8, 'Sirloin Steak ', 2, '2017-01-24', 20, '300g ', '3.10', 3),
(9, 'Chocolate Milk ', 3, '2017-02-23', 50, '1L ', '3.50', 3);

-- --------------------------------------------------------

--
-- Table structure for table `purchaser`
--

CREATE TABLE `purchaser` (
  `ID` int(6) NOT NULL,
  `UserName` varchar(15) NOT NULL,
  `Address` varchar(40) NOT NULL,
  `Credit_Card` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchaser`
--

INSERT INTO `purchaser` (`ID`, `UserName`, `Address`, `Credit_Card`) VALUES
(4, 'MuchoPizzeria', '43 Morris Ave', 900090009),
(5, 'Scoops ', '34 Jones Street', 100010001),
(6, 'PitaExperience', '10 Victoria Way', 345634563);

-- --------------------------------------------------------

--
-- Table structure for table `seller`
--

CREATE TABLE `seller` (
  `ID` int(6) NOT NULL,
  `UserName` varchar(15) NOT NULL,
  `Address` varchar(40) NOT NULL,
  `Delivery_Method` varchar(20) NOT NULL,
  `Checking_Number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `seller`
--

INSERT INTO `seller` (`ID`, `UserName`, `Address`, `Delivery_Method`, `Checking_Number`) VALUES
(1, 'SmithFarms', '24 Apple Way', 'Truck', 42),
(2, 'BlairButchers', '5 Cow Street ', 'Pickup ', 34),
(3, 'RudlandDairy', '223 Highway 5', 'Truck ', 90);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `ID` int(6) NOT NULL,
  `UserName` varchar(15) NOT NULL,
  `Password` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`ID`, `UserName`, `Password`) VALUES
(1, 'SmithFarms', 'SmithFarms'),
(2, 'BlairButchers', 'BlairButchers'),
(3, 'RudlandDairy', 'RudlandDairy'),
(4, 'MuchoPizzeria', 'MuchoPizzeria'),
(5, 'Scoops', 'Scoops'),
(6, 'PitaExperience', 'PitaExperience');

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
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UserName` (`UserName`);

--
-- Indexes for table `seller`
--
ALTER TABLE `seller`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UserName` (`UserName`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UserName` (`UserName`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `foodorder`
--
ALTER TABLE `foodorder`
  MODIFY `OrderNo` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `ProdNo` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `ID` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `fav_products`
--
ALTER TABLE `fav_products`
  ADD CONSTRAINT `fav_products_ibfk_1` FOREIGN KEY (`PurchaserID`) REFERENCES `purchaser` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fav_products_ibfk_2` FOREIGN KEY (`ProdNo`) REFERENCES `products` (`ProdNo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `foodorder`
--
ALTER TABLE `foodorder`
  ADD CONSTRAINT `foodorder_ibfk_1` FOREIGN KEY (`PurchaserID`) REFERENCES `purchaser` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `foodorder_ibfk_2` FOREIGN KEY (`SellerID`) REFERENCES `seller` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`SellerID`) REFERENCES `seller` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `purchaser`
--
ALTER TABLE `purchaser`
  ADD CONSTRAINT `purchaser_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `user` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `seller`
--
ALTER TABLE `seller`
  ADD CONSTRAINT `seller_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `user` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
