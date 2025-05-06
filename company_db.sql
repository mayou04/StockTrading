-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: company_db
-- ------------------------------------------------------
-- Server version	8.0.42

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `CustomerID` int DEFAULT NULL,
  `AccountID` int NOT NULL AUTO_INCREMENT,
  `AccountCreated` date DEFAULT NULL,
  PRIMARY KEY (`AccountID`),
  UNIQUE KEY `CustomerID` (`CustomerID`),
  CONSTRAINT `account_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (333333333,1,'2025-05-04'),(3,2,'2025-05-05'),(4,3,'2025-05-05');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `CustomerID` int NOT NULL,
  `Rating` int DEFAULT NULL,
  `CardNumber` char(16) DEFAULT NULL,
  PRIMARY KEY (`CustomerID`),
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `person` (`SSN`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (3,5,'3'),(4,5,'4'),(333333333,5,'1234');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `EmployeeID` int NOT NULL,
  `StartDate` date DEFAULT NULL,
  `HourlyRate` decimal(11,2) DEFAULT NULL,
  `Level` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `person` (`SSN`) ON UPDATE CASCADE,
  CONSTRAINT `employee_chk_1` CHECK ((`HourlyRate` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'2025-05-05',15.00,NULL),(2,'2025-05-05',20.00,NULL),(111111111,'2020-10-10',25.00,'manager'),(222222222,'2020-10-10',25.00,'customerRepresentative');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login` (
  `Username` varchar(50) NOT NULL,
  `Password` varchar(25) DEFAULT NULL,
  `Role` enum('Customer','Manager','customerRepresentative') NOT NULL,
  PRIMARY KEY (`Username`),
  CONSTRAINT `login_ibfk_1` FOREIGN KEY (`Username`) REFERENCES `person` (`Email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES ('1@gmail.com','1','customerRepresentative'),('2@gmail.com','2','customerRepresentative'),('3@gmail.com','3','Customer'),('4@gmail.com','4','Customer'),('cus@gmail.com','cus','Customer'),('man@gmail.com','man','Manager'),('rep@gmail.com','rep','customerRepresentative');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderhistory`
--

DROP TABLE IF EXISTS `orderhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderhistory` (
  `OrderID` int NOT NULL,
  `PricePerShare` decimal(10,2) DEFAULT NULL,
  `Stop` decimal(10,2) DEFAULT NULL,
  `DateTime` timestamp NOT NULL,
  PRIMARY KEY (`OrderID`,`DateTime`),
  CONSTRAINT `orderhistory_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderhistory`
--

LOCK TABLES `orderhistory` WRITE;
/*!40000 ALTER TABLE `orderhistory` DISABLE KEYS */;
INSERT INTO `orderhistory` VALUES (9,205.35,184.82,'2025-05-05 23:48:16'),(9,210.00,189.00,'2025-05-05 23:57:12'),(9,180.00,189.00,'2025-05-05 23:57:35');
/*!40000 ALTER TABLE `orderhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `OrderID` int NOT NULL AUTO_INCREMENT,
  `OrderType` enum('Buy','Sell') NOT NULL,
  `NumShares` int DEFAULT NULL,
  `Stop` decimal(10,2) DEFAULT NULL,
  `Percentage` decimal(4,2) DEFAULT NULL,
  `DatePlaced` timestamp NULL DEFAULT NULL,
  `PriceType` enum('Market','MarketOnClose','TrailingStop','HiddenStop') NOT NULL,
  PRIMARY KEY (`OrderID`),
  CONSTRAINT `check_perecent` CHECK (((`PriceType` <> 3) or (`Percentage` is not null))),
  CONSTRAINT `check_stop` CHECK ((((`PriceType` <> 3) and (`PriceType` <> 4)) or (`Stop` is not null)))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'Buy',50,NULL,NULL,'2025-05-05 23:45:25','Market'),(2,'Buy',50,NULL,NULL,'2025-05-05 23:45:30','Market'),(3,'Buy',50,NULL,NULL,'2025-05-05 23:45:35','Market'),(4,'Buy',50,NULL,NULL,'2025-05-05 23:45:41','Market'),(5,'Buy',100,NULL,NULL,'2025-05-05 23:46:32','Market'),(6,'Buy',100,NULL,NULL,'2025-05-05 23:46:39','Market'),(7,'Buy',100,NULL,NULL,'2025-05-05 23:46:47','Market'),(8,'Buy',15,NULL,NULL,'2025-05-05 23:47:29','Market'),(9,'Sell',30,189.00,10.00,'2025-05-05 23:48:16','TrailingStop'),(10,'Sell',50,NULL,NULL,'2025-05-06 00:24:14','Market');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person` (
  `SSN` int NOT NULL,
  `FirstName` varchar(25) NOT NULL,
  `LastName` varchar(25) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Address` varchar(25) DEFAULT NULL,
  `City` varchar(25) DEFAULT NULL,
  `State` char(2) DEFAULT NULL,
  `ZipCode` int DEFAULT NULL,
  `Telephone` char(10) DEFAULT NULL,
  PRIMARY KEY (`SSN`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (1,'1','1','1@gmail.com','1','1','12',1,'1'),(2,'2','2','2@gmail.com','2','2','23',2,'2'),(3,'3','3','3@gmail.com','3','3','34',3,'3'),(4,'4','4','4@gmail.com','4','4','45',4,'4'),(111111111,'man','man','man@gmail.com','man','man','ma',1,'911'),(222222222,'rep','rep','rep@gmail.com','rep','rep','re',2,'222'),(333333333,'cus','cus','cus@gmail.com','cus','cus','cu',3,'321');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock` (
  `StockSymbol` varchar(5) NOT NULL,
  `StockName` varchar(25) DEFAULT NULL,
  `StockType` varchar(25) DEFAULT NULL,
  `SharePrice` decimal(10,2) DEFAULT NULL,
  `NumShares` int DEFAULT NULL,
  `PriceDate` timestamp NOT NULL,
  PRIMARY KEY (`StockSymbol`,`PriceDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES ('AAPL','Apple Inc','Technology',205.35,50,'2025-05-05 23:41:12'),('AAPL','Apple Inc','Technology',190.00,50,'2025-05-05 23:57:06'),('AAPL','Apple Inc','Technology',210.00,50,'2025-05-05 23:57:12'),('AAPL','Apple Inc','Technology',180.00,80,'2025-05-05 23:57:35'),('GOOG','Alphabet Inc Class C','Communication',165.81,150,'2025-05-05 23:41:12'),('LCID','Lucid Group Inc','Automobiles',2.53,150,'2025-05-05 23:41:12'),('MSFT','Microsoft Corp','Technology',435.28,185,'2025-05-05 23:41:12'),('NFLX','Netflix Inc','Communication',1156.49,150,'2025-05-05 23:41:12'),('NVDA','NVIDIA Corp','Technology',114.50,200,'2025-05-05 23:41:12'),('RDDT','Reddit Inc','Communication',113.83,200,'2025-05-05 23:41:12'),('RIVN','Rivian Automotive Inc','Automobiles',13.83,150,'2025-05-05 23:41:12'),('TSLA','Tesla Inc','Automobiles',287.21,100,'2025-05-05 23:41:12');
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stockporfolio`
--

DROP TABLE IF EXISTS `stockporfolio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stockporfolio` (
  `AccountID` int NOT NULL,
  `StockSymbol` varchar(5) NOT NULL,
  `NumShares` int DEFAULT NULL,
  PRIMARY KEY (`AccountID`,`StockSymbol`),
  KEY `StockSymbol` (`StockSymbol`),
  CONSTRAINT `stockporfolio_ibfk_1` FOREIGN KEY (`StockSymbol`) REFERENCES `stock` (`StockSymbol`) ON UPDATE CASCADE,
  CONSTRAINT `stockporfolio_ibfk_2` FOREIGN KEY (`AccountID`) REFERENCES `account` (`AccountID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stockporfolio_chk_1` CHECK ((`NumShares` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stockporfolio`
--

LOCK TABLES `stockporfolio` WRITE;
/*!40000 ALTER TABLE `stockporfolio` DISABLE KEYS */;
INSERT INTO `stockporfolio` VALUES (1,'AAPL',50),(1,'GOOG',50),(1,'LCID',50),(1,'RIVN',50),(2,'AAPL',70),(2,'NFLX',50),(2,'TSLA',100),(3,'MSFT',15);
/*!40000 ALTER TABLE `stockporfolio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trade`
--

DROP TABLE IF EXISTS `trade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trade` (
  `OrderID` int NOT NULL,
  `AccountID` int DEFAULT NULL,
  `BrokerID` int DEFAULT NULL,
  `StockSymbol` varchar(5) DEFAULT NULL,
  `TransactionID` int DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `AccountID` (`AccountID`),
  KEY `BrokerID` (`BrokerID`),
  KEY `StockSymbol` (`StockSymbol`),
  KEY `TransactionID` (`TransactionID`),
  CONSTRAINT `trade_ibfk_1` FOREIGN KEY (`AccountID`) REFERENCES `account` (`AccountID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `trade_ibfk_2` FOREIGN KEY (`BrokerID`) REFERENCES `employee` (`EmployeeID`) ON UPDATE CASCADE,
  CONSTRAINT `trade_ibfk_3` FOREIGN KEY (`StockSymbol`) REFERENCES `stock` (`StockSymbol`) ON UPDATE CASCADE,
  CONSTRAINT `trade_ibfk_4` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`) ON UPDATE CASCADE,
  CONSTRAINT `trade_ibfk_5` FOREIGN KEY (`TransactionID`) REFERENCES `transaction` (`TransactionID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trade`
--

LOCK TABLES `trade` WRITE;
/*!40000 ALTER TABLE `trade` DISABLE KEYS */;
INSERT INTO `trade` VALUES (1,1,1,'AAPL',1),(2,1,1,'GOOG',2),(3,1,1,'LCID',3),(4,1,1,'RIVN',4),(5,2,1,'AAPL',5),(6,2,1,'NFLX',6),(7,2,1,'TSLA',7),(8,3,1,'MSFT',8),(9,2,1,'AAPL',9),(10,2,1,'NFLX',10);
/*!40000 ALTER TABLE `trade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction` (
  `TransactionID` int NOT NULL AUTO_INCREMENT,
  `Fee` decimal(10,2) DEFAULT NULL,
  `DateTime` date DEFAULT NULL,
  `PricePerShare` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`TransactionID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES (1,513.38,'2025-05-05',205.35),(2,414.53,'2025-05-05',165.81),(3,6.32,'2025-05-05',2.53),(4,34.58,'2025-05-05',13.83),(5,1026.75,'2025-05-05',205.35),(6,5782.45,'2025-05-05',1156.49),(7,1436.05,'2025-05-05',287.21),(8,326.46,'2025-05-05',435.28),(9,270.00,'2025-05-05',180.00),(10,2891.23,'2025-05-05',1156.49);
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-05 20:37:34
