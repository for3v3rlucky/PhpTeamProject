-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 13, 2019 at 07:40 PM
-- Server version: 5.7.23
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `my_guitar_shop2`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
CREATE TABLE IF NOT EXISTS `addresses` (
  `addressID` int(11) NOT NULL AUTO_INCREMENT,
  `customerID` int(11) NOT NULL,
  `line1` varchar(60) NOT NULL,
  `line2` varchar(60) DEFAULT NULL,
  `city` varchar(40) NOT NULL,
  `state` varchar(2) NOT NULL,
  `zipCode` varchar(10) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `disabled` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`addressID`),
  KEY `customerID` (`customerID`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`addressID`, `customerID`, `line1`, `line2`, `city`, `state`, `zipCode`, `phone`, `disabled`) VALUES
(1, 1, '100 East Ridgewood Ave.', '', 'Paramus', 'NJ', '07652', '201-653-4472', 0),
(2, 1, '21 Rosewood Rd.', '', 'Woodcliff Lake', 'NJ', '07677', '201-653-4472', 0),
(3, 2, '16285 Wendell St.', '', 'Omaha', 'NE', '68135', '402-896-2576', 0),
(4, 2, '16285 Wendell St.', '', 'Omaha', 'NE', '68135', '402-896-2576', 0),
(5, 3, '19270 NW Cornell Rd.', '', 'Beaverton', 'OR', '97006', '503-654-1291', 0),
(6, 3, '19270 NW Cornell Rd.', '', 'Beaverton', 'OR', '97006', '503-654-1291', 0),
(7, 4, '260 Telfair St', 'Apt. A', 'Augusta', 'GA', '30901', '7064218917', 0),
(8, 4, '260 Telfair St', 'Apt. A', 'Augusta', 'GA', '30901', '7064218917', 0);

-- --------------------------------------------------------

--
-- Table structure for table `administrators`
--

DROP TABLE IF EXISTS `administrators`;
CREATE TABLE IF NOT EXISTS `administrators` (
  `adminID` int(11) NOT NULL AUTO_INCREMENT,
  `emailAddress` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  PRIMARY KEY (`adminID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `administrators`
--

INSERT INTO `administrators` (`adminID`, `emailAddress`, `password`, `firstName`, `lastName`) VALUES
(1, 'admin@myguitarshop.com', '6a718fbd768c2378b511f8249b54897f940e9022', 'Admin', 'User'),
(2, 'joel@murach.com', '971e95957d3b74d70d79c20c94e9cd91b85f7aae', 'Joel', 'Murach'),
(3, 'mike@murach.com', '3f2975c819cefc686282456aeae3a137bf896ee8', 'Mike', 'Murach');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `categoryID` int(11) NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(255) NOT NULL,
  PRIMARY KEY (`categoryID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`categoryID`, `categoryName`) VALUES
(1, 'Guitars'),
(2, 'Basses'),
(3, 'Drums');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `customerID` int(11) NOT NULL AUTO_INCREMENT,
  `emailAddress` varchar(255) NOT NULL,
  `password` varchar(60) NOT NULL,
  `firstName` varchar(60) NOT NULL,
  `lastName` varchar(60) NOT NULL,
  `shipAddressID` int(11) DEFAULT NULL,
  `billingAddressID` int(11) DEFAULT NULL,
  PRIMARY KEY (`customerID`),
  UNIQUE KEY `emailAddress` (`emailAddress`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customerID`, `emailAddress`, `password`, `firstName`, `lastName`, `shipAddressID`, `billingAddressID`) VALUES
(1, 'allan.sherwood@yahoo.com', '650215acec746f0e32bdfff387439eefc1358737', 'Allan', 'Sherwood', 1, 2),
(2, 'barryz@gmail.com', '3f563468d42a448cb1e56924529f6e7bbe529cc7', 'Barry', 'Zimmer', 3, 4),
(3, 'christineb@solarone.com', 'ed19f5c0833094026a2f1e9e6f08a35d26037066', 'Christine', 'Brown', 5, 6),
(4, 'esmith64@smartweb.augustatech.edu', 'db5ae2ce8b8e7213af0a43beaeca34ab6a170edd', 'Lucky', 'Smith', 7, 8);

-- --------------------------------------------------------

--
-- Table structure for table `orderitems`
--

DROP TABLE IF EXISTS `orderitems`;
CREATE TABLE IF NOT EXISTS `orderitems` (
  `itemID` int(11) NOT NULL AUTO_INCREMENT,
  `orderID` int(11) NOT NULL,
  `productID` int(11) NOT NULL,
  `itemPrice` decimal(10,2) NOT NULL,
  `discountAmount` decimal(10,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`itemID`),
  KEY `orderID` (`orderID`),
  KEY `productID` (`productID`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orderitems`
--

INSERT INTO `orderitems` (`itemID`, `orderID`, `productID`, `itemPrice`, `discountAmount`, `quantity`) VALUES
(1, 1, 2, '399.00', '39.90', 1),
(2, 2, 4, '699.00', '69.90', 1),
(3, 3, 3, '499.00', '49.90', 1),
(4, 3, 6, '549.99', '0.00', 1),
(5, 4, 1, '699.00', '209.70', 1),
(6, 5, 1, '699.00', '209.70', 1),
(7, 6, 1, '699.00', '209.70', 1),
(8, 7, 1, '699.00', '209.70', 1),
(9, 8, 1, '699.00', '209.70', 1),
(10, 9, 1, '699.00', '209.70', 1),
(11, 10, 1, '699.00', '209.70', 1),
(12, 11, 1, '699.00', '209.70', 1),
(13, 12, 1, '699.00', '209.70', 1),
(14, 13, 1, '699.00', '209.70', 1),
(15, 14, 1, '699.00', '209.70', 1),
(16, 15, 1, '699.00', '209.70', 1),
(17, 16, 1, '699.00', '209.70', 1),
(18, 17, 1, '699.00', '209.70', 1),
(19, 18, 1, '699.00', '209.70', 1),
(20, 19, 1, '699.00', '209.70', 1),
(21, 20, 1, '699.00', '209.70', 1),
(22, 21, 1, '699.00', '209.70', 1),
(23, 22, 1, '699.00', '209.70', 1),
(24, 23, 1, '699.00', '209.70', 1),
(25, 24, 1, '699.00', '209.70', 1),
(26, 25, 1, '699.00', '209.70', 1),
(27, 26, 1, '699.00', '209.70', 1),
(28, 27, 1, '699.00', '209.70', 1),
(29, 28, 1, '699.00', '209.70', 1),
(30, 29, 1, '699.00', '209.70', 1),
(31, 30, 1, '699.00', '209.70', 1),
(32, 31, 1, '699.00', '209.70', 1),
(33, 32, 1, '699.00', '209.70', 1),
(34, 33, 1, '699.00', '209.70', 1),
(35, 34, 1, '699.00', '209.70', 1),
(36, 35, 1, '699.00', '209.70', 1),
(37, 36, 1, '699.00', '209.70', 1),
(38, 37, 7, '799.99', '240.00', 1),
(39, 38, 1, '699.00', '209.70', 1),
(40, 39, 1, '699.00', '209.70', 1),
(41, 40, 1, '699.00', '209.70', 1),
(42, 41, 1, '699.00', '209.70', 1),
(43, 42, 1, '699.00', '209.70', 1),
(44, 43, 1, '699.00', '209.70', 1),
(45, 44, 1, '699.00', '209.70', 1),
(46, 45, 1, '699.00', '209.70', 1),
(47, 46, 1, '699.00', '209.70', 1),
(48, 47, 1, '699.00', '209.70', 1),
(49, 48, 1, '699.00', '209.70', 1),
(50, 49, 1, '699.00', '209.70', 1),
(51, 50, 1, '699.00', '209.70', 1),
(52, 50, 6, '415.00', '161.85', 3);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `orderID` int(11) NOT NULL AUTO_INCREMENT,
  `customerID` int(11) NOT NULL,
  `orderDate` datetime NOT NULL,
  `shipAmount` decimal(10,2) NOT NULL,
  `taxAmount` decimal(10,2) NOT NULL,
  `shipDate` datetime DEFAULT NULL,
  `shipAddressID` int(11) NOT NULL,
  `cardType` int(11) NOT NULL,
  `cardNumber` char(16) NOT NULL,
  `cardExpires` char(7) NOT NULL,
  `billingAddressID` int(11) NOT NULL,
  PRIMARY KEY (`orderID`),
  KEY `customerID` (`customerID`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orderID`, `customerID`, `orderDate`, `shipAmount`, `taxAmount`, `shipDate`, `shipAddressID`, `cardType`, `cardNumber`, `cardExpires`, `billingAddressID`) VALUES
(1, 1, '2017-05-30 09:40:28', '5.00', '32.32', '2017-06-01 09:43:13', 1, 2, '4111111111111111', '04/2022', 2),
(2, 2, '2017-06-01 11:23:20', '5.00', '0.00', NULL, 3, 2, '4111111111111111', '08/2021', 4),
(3, 1, '2017-06-03 09:44:58', '10.00', '89.92', NULL, 1, 2, '4111111111111111', '04/2022', 2),
(4, 4, '2019-05-18 00:52:00', '5.00', '0.00', NULL, 7, 1, '0000000000000000', '01/2020', 8),
(5, 4, '2019-05-18 18:58:27', '5.00', '0.00', NULL, 7, 1, '0000000000000000', '01/2020', 8),
(6, 4, '2019-05-18 19:03:54', '5.00', '0.00', NULL, 7, 1, '00000', '00000', 8),
(7, 4, '2019-05-28 17:40:30', '5.00', '0.00', NULL, 7, 1, 'ftfhgf', 'dfdg', 8),
(8, 4, '2019-05-28 17:47:28', '5.00', '0.00', NULL, 7, 1, '', '', 8),
(9, 4, '2019-05-28 17:49:23', '5.00', '0.00', NULL, 7, 1, '', '', 8),
(10, 4, '2019-05-28 17:57:54', '5.00', '0.00', NULL, 7, 1, '', '', 8),
(11, 4, '2019-05-28 18:03:48', '5.00', '0.00', NULL, 7, 1, '', '', 8),
(12, 4, '2019-05-28 18:12:07', '5.00', '0.00', NULL, 7, 1, '', '', 8),
(13, 4, '2019-05-28 18:23:06', '5.00', '0.00', NULL, 7, 1, '', '', 8),
(14, 4, '2019-05-28 18:26:56', '5.00', '0.00', NULL, 7, 1, '', '', 8),
(15, 4, '2019-05-28 18:28:36', '5.00', '0.00', NULL, 7, 1, '', '', 8),
(16, 4, '2019-05-28 18:29:04', '5.00', '0.00', NULL, 7, 1, '', '', 8),
(17, 4, '2019-05-28 18:37:26', '5.00', '0.00', NULL, 7, 1, '', '', 8),
(18, 4, '2019-05-28 18:38:06', '5.00', '0.00', NULL, 7, 1, '', '', 8),
(19, 4, '2019-05-28 18:38:35', '5.00', '0.00', NULL, 7, 1, '', '', 8),
(20, 4, '2019-05-28 18:43:47', '5.00', '0.00', NULL, 7, 1, '', '', 8),
(21, 4, '2019-05-28 18:46:37', '5.00', '0.00', NULL, 7, 1, '', '', 8),
(22, 4, '2019-05-28 18:47:20', '5.00', '0.00', NULL, 7, 1, '', '', 8),
(23, 4, '2019-05-28 18:57:43', '5.00', '0.00', NULL, 7, 1, '', '', 8),
(24, 4, '2019-05-28 19:23:52', '5.00', '0.00', NULL, 7, 1, '', '', 8),
(25, 4, '2019-05-28 19:29:34', '5.00', '0.00', NULL, 7, 1, '', '', 8),
(26, 4, '2019-05-28 19:36:18', '5.00', '0.00', NULL, 7, 1, '', '', 8),
(27, 4, '2019-05-30 19:52:04', '5.00', '0.00', NULL, 7, 1, '', '', 8),
(28, 4, '2019-05-30 19:53:39', '5.00', '0.00', NULL, 7, 1, '', '', 8),
(29, 4, '2019-06-05 19:36:45', '5.00', '0.00', NULL, 7, 1, '', '', 8),
(30, 4, '2019-06-06 19:21:04', '5.00', '0.00', NULL, 7, 1, '', '', 8),
(31, 4, '2019-06-06 19:49:16', '5.00', '0.00', NULL, 7, 1, '', '', 8),
(32, 4, '2019-06-06 19:50:48', '5.00', '0.00', NULL, 7, 1, '', '', 8),
(33, 4, '2019-06-06 19:53:22', '5.00', '0.00', NULL, 7, 1, '', '', 8),
(34, 4, '2019-06-06 19:57:35', '5.00', '0.00', NULL, 7, 1, '', '', 8),
(35, 4, '2019-06-06 20:06:47', '5.00', '0.00', NULL, 7, 1, '', '', 8),
(36, 4, '2019-06-06 20:07:28', '5.00', '0.00', NULL, 7, 1, '', '', 8),
(37, 4, '2019-06-06 20:08:03', '5.00', '0.00', NULL, 7, 1, '', '', 8),
(38, 4, '2019-06-06 20:10:15', '5.00', '0.00', NULL, 7, 1, '', '', 8),
(39, 4, '2019-06-09 00:53:19', '5.00', '0.00', NULL, 7, 1, '', '', 8),
(40, 4, '2019-06-09 00:54:24', '5.00', '0.00', NULL, 7, 1, '', '', 8),
(41, 4, '2019-06-09 01:04:26', '5.00', '0.00', NULL, 7, 1, '', '', 8),
(42, 4, '2019-06-09 02:28:20', '5.00', '0.00', NULL, 7, 1, '', '', 8),
(43, 4, '2019-06-09 02:37:05', '5.00', '0.00', NULL, 7, 1, '', '', 8),
(44, 4, '2019-06-09 02:37:55', '5.00', '0.00', NULL, 7, 1, '', '', 8),
(45, 4, '2019-06-09 02:49:00', '5.00', '0.00', NULL, 7, 1, '', '', 8),
(46, 4, '2019-06-09 03:12:40', '5.00', '0.00', NULL, 7, 1, '', '', 8),
(47, 4, '2019-06-13 19:28:23', '5.00', '0.00', NULL, 7, 1, '', '', 8),
(48, 4, '2019-06-13 19:31:03', '5.00', '0.00', NULL, 7, 1, '', '', 8),
(49, 4, '2019-06-13 19:34:06', '5.00', '0.00', NULL, 7, 1, '', '', 8),
(50, 4, '2019-06-13 19:36:07', '20.00', '0.00', NULL, 7, 1, '', '', 8);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `productID` int(11) NOT NULL AUTO_INCREMENT,
  `categoryID` int(11) NOT NULL,
  `productCode` varchar(10) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `listPrice` decimal(10,2) NOT NULL,
  `discountPercent` decimal(10,2) NOT NULL DEFAULT '0.00',
  `dateAdded` datetime NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`productID`),
  UNIQUE KEY `productCode` (`productCode`),
  KEY `categoryID` (`categoryID`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`productID`, `categoryID`, `productCode`, `productName`, `description`, `listPrice`, `discountPercent`, `dateAdded`, `quantity`) VALUES
(1, 1, 'strat', 'Fender Stratocaster', 'The Fender Stratocaster is the electric guitar design that changed the world. New features include a tinted neck, parchment pickguard and control knobs, and a \'70s-style logo. Includes select alder body, 21-fret maple neck with your choice of a rosewood or maple fretboard, 3 single-coil pickups, vintage-style tremolo, and die-cast tuning keys. This guitar features a thicker bridge block for increased sustain and a more stable point of contact with the strings. At this low price, why play anything but the real thing?\r\n\r\nFeatures:\r\n\r\n* New features:\r\n* Thicker bridge block\r\n* 3-ply parchment pick guard\r\n* Tinted neck', '699.00', '30.00', '2016-10-30 09:32:40', 98),
(2, 1, 'les_paul', 'Gibson Les Paul', 'This Les Paul guitar offers a carved top and humbucking pickups. It has a simple yet elegant design. Cutting-yet-rich tone—the hallmark of the Les Paul—pours out of the 490R and 498T Alnico II magnet humbucker pickups, which are mounted on a carved maple top with a mahogany back. The faded finish models are equipped with BurstBucker Pro pickups and a mahogany top. This guitar includes a Gibson hardshell case (Faded and satin finish models come with a gig bag) and a limited lifetime warranty.\r\n\r\nFeatures:\r\n\r\n* Carved maple top and mahogany back (Mahogany top on faded finish models)\r\n* Mahogany neck, \'59 Rounded Les Paul\r\n* Rosewood fingerboard (Ebony on Alpine white)\r\n* Tune-O-Matic bridge with stopbar\r\n* Chrome or gold hardware\r\n* 490R and 498T Alnico 2 magnet humbucker pickups (BurstBucker Pro on faded finish models)\r\n* 2 volume and 2 tone knobs, 3-way switch', '1199.00', '30.00', '2016-12-05 16:33:13', 100),
(3, 1, 'sg', 'Gibson SG', 'This Gibson SG electric guitar takes the best of the \'62 original and adds the longer and sturdier neck joint of the late \'60s models. All the classic features you\'d expect from a historic guitar. Hot humbuckers go from rich, sweet lightning to warm, tingling waves of sustain. A silky-fast rosewood fretboard plays like a dream. The original-style beveled mahogany body looks like a million bucks. Plus, Tune-O-Matic bridge and chrome hardware. Limited lifetime warranty. Includes hardshell case.\r\n\r\nFeatures:\r\n\r\n* Double-cutaway beveled mahogany body\r\n* Set mahogany neck with rounded \'50s profile\r\n* Bound rosewood fingerboard with trapezoid inlays\r\n* Tune-O-Matic bridge with stopbar tailpiece\r\n* Chrome hardware\r\n* 490R humbucker in the neck position\r\n* 498T humbucker in the bridge position\r\n* 2 volume knobs, 2 tone knobs, 3-way switch\r\n* 24-3/4\" scale', '2517.00', '52.00', '2017-02-04 11:04:31', 100),
(4, 1, 'fg700s', 'Yamaha FG700S', 'The Yamaha FG700S solid top acoustic guitar has the ultimate combo for projection and pure tone. The expertly braced spruce top speaks clearly atop the rosewood body. It has a rosewood fingerboard, rosewood bridge, die-cast tuners, body and neck binding, and a tortoise pickguard.\r\n\r\nFeatures:\r\n\r\n* Solid Sitka spruce top\r\n* Rosewood back and sides\r\n* Rosewood fingerboard\r\n* Rosewood bridge\r\n* White/black body and neck binding\r\n* Die-cast tuners\r\n* Tortoise pickguard\r\n* Limited lifetime warranty', '489.99', '38.00', '2017-06-01 11:12:59', 100),
(5, 1, 'washburn', 'Washburn D10S', 'The Washburn D10S acoustic guitar is superbly crafted with a solid spruce top and mahogany back and sides for exceptional tone. A mahogany neck and rosewood fingerboard make fretwork a breeze, while chrome Grover-style machines keep you perfectly tuned. The Washburn D10S comes with a limited lifetime warranty.\r\n\r\nFeatures:\r\n\r\n    * Spruce top\r\n    * Mahogany back, sides\r\n    * Mahogany neck Rosewood fingerboard\r\n    * Chrome Grover-style machines', '299.00', '0.00', '2017-07-30 13:58:35', 100),
(6, 1, 'rodriguez', 'Rodriguez Caballero 11', 'Featuring a carefully chosen, solid Canadian cedar top and laminated bubinga back and sides, the Caballero 11 classical guitar is a beauty to behold and play. The headstock and fretboard are of Indian rosewood. Nickel-plated tuners and Silver-plated frets are installed to last a lifetime. The body binding and wood rosette are exquisite.\r\n\r\nThe Rodriguez Guitar is hand crafted and glued to create precise balances. From the invisible careful sanding, even inside the body, that ensures the finished instrument\'s purity of tone, to the beautifully unique rosette inlays around the soundhole and on the back of the neck, each guitar is a credit to its luthier and worthy of being handed down from one generation to another.\r\n\r\nThe tone, resonance and beauty of fine guitars are all dependent upon the wood from which they are made. The wood used in the construction of Rodriguez guitars is carefully chosen and aged to guarantee the highest quality. No wood is purchased before the tree has been cut down, and at least 2 years must elapse before the tree is turned into lumber. The wood has to be well cut from the log. The grain must be close and absolutely vertical. The shop is totally free from humidity.', '415.00', '39.00', '2017-07-30 14:12:41', 97),
(7, 2, 'precision', 'Fender Precision', 'The Fender Precision bass guitar delivers the sound, look, and feel today\'s bass players demand. This bass features that classic P-Bass old-school design. Each Precision bass boasts contemporary features and refinements that make it an excellent value. Featuring an alder body and a split single-coil pickup, this classic electric bass guitar lives up to its Fender legacy.\r\n\r\nFeatures:\r\n\r\n* Body: Alder\r\n* Neck: Maple, modern C shape, tinted satin urethane finish\r\n* Fingerboard: Rosewood or maple (depending on color)\r\n* 9-1/2\" Radius (241 mm)\r\n* Frets: 20 Medium-jumbo frets\r\n* Pickups: 1 Standard Precision Bass split single-coil pickup (Mid)\r\n* Controls: Volume, Tone\r\n* Bridge: Standard vintage style with single groove saddles\r\n* Machine heads: Standard\r\n* Hardware: Chrome\r\n* Pickguard: 3-Ply Parchment\r\n* Scale Length: 34\" (864 mm)\r\n* Width at Nut: 1-5/8\" (41.3 mm)\r\n* Unique features: Knurled chrome P Bass knobs, Fender transition logo', '799.99', '30.00', '2017-06-01 11:29:35', 100),
(8, 2, 'hofner', 'Hofner Icon', 'With authentic details inspired by the original, the Hofner Icon makes the legendary violin bass available to the rest of us. Don\'t get the idea that this a just a \"nowhere man\" look-alike. This quality instrument features a real spruce top and beautiful flamed maple back and sides. The semi-hollow body and set neck will give you the warm, round tone you expect from the violin bass.\r\n\r\nFeatures:\r\n\r\n* Authentic details inspired by the original\r\n* Spruce top\r\n* Flamed maple back and sides\r\n* Set neck\r\n* Rosewood fretboard\r\n* 30\" scale\r\n* 22 frets\r\n* Dot inlay', '499.99', '25.00', '2017-07-30 14:18:33', 100),
(9, 3, 'ludwig', 'Ludwig 5-piece Drum Set with Cymbals', 'This product includes a Ludwig 5-piece drum set and a Zildjian starter cymbal pack.\r\n\r\nWith the Ludwig drum set, you get famous Ludwig quality. This set features a bass drum, two toms, a floor tom, and a snare—each with a wrapped finish. Drum hardware includes LA214FP bass pedal, snare stand, cymbal stand, hi-hat stand, and a throne.\r\n\r\nWith the Zildjian cymbal pack, you get a 14\" crash, 18\" crash/ride, and a pair of 13\" hi-hats. Sound grooves and round hammer strikes in a simple circular pattern on the top surface of these cymbals magnify the basic sound of the distinctive alloy.\r\n\r\nFeatures:\r\n\r\n* Famous Ludwig quality\r\n* Wrapped finishes\r\n* 22\" x 16\" kick drum\r\n* 12\" x 10\" and 13\" x 11\" toms\r\n* 16\" x 16\" floor tom\r\n* 14\" x 6-1/2\" snare drum kick pedal\r\n* Snare stand\r\n* Straight cymbal stand hi-hat stand\r\n* FREE throne', '699.99', '30.00', '2017-07-30 12:46:40', 100),
(10, 3, 'tama', 'Tama 5-Piece Drum Set with Cymbals', 'The Tama 5-piece Drum Set is the most affordable Tama drum kit ever to incorporate so many high-end features.\r\n\r\nWith over 40 years of experience, Tama knows what drummers really want. Which is why, no matter how long you\'ve been playing the drums, no matter what budget you have to work with, Tama has the set you need, want, and can afford. Every aspect of the modern drum kit was exhaustively examined and reexamined and then improved before it was accepted as part of the Tama design. Which is why, if you start playing Tama now as a beginner, you\'ll still enjoy playing it when you\'ve achieved pro-status. That\'s how good these groundbreaking new drums are.\r\n\r\nOnly Tama comes with a complete set of genuine Meinl HCS cymbals. These high-quality brass cymbals are made in Germany and are sonically matched so they sound great together. They are even lathed for a more refined tonal character. The set includes 14\" hi-hats, 16\" crash cymbal, and a 20\" ride cymbal.\r\n\r\nFeatures:\r\n\r\n* 100% poplar 6-ply/7.5mm shells\r\n* Precise bearing edges\r\n* 100% glued finishes\r\n* Original small lugs\r\n* Drum heads\r\n* Accu-tune bass drum hoops\r\n* Spur brackets\r\n* Tom holder\r\n* Tom brackets', '799.99', '15.00', '2017-07-30 13:14:15', 100);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
