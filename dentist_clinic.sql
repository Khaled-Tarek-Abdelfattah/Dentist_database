-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 29, 2021 at 04:00 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dentist_clinic`
--

-- --------------------------------------------------------

--
-- Table structure for table `deal`
--

CREATE TABLE `deal` (
  `DOC_SSN` char(9) NOT NULL,
  `D_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `deal`
--

INSERT INTO `deal` (`DOC_SSN`, `D_ID`) VALUES
('901475698', 2),
('931450976', 1),
('931450976', 3),
('934025677', 1),
('934025677', 2),
('936971499', 1),
('998522047', 2),
('998522047', 3);

-- --------------------------------------------------------

--
-- Table structure for table `dental_lab`
--

CREATE TABLE `dental_lab` (
  `DEN_ID` int(11) NOT NULL,
  `NAME` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dental_lab`
--

INSERT INTO `dental_lab` (`DEN_ID`, `NAME`) VALUES
(1, 'Beam Dental'),
(2, 'Centro Dental'),
(3, 'Capital Dental');

-- --------------------------------------------------------

--
-- Table structure for table `dental_xray`
--

CREATE TABLE `dental_xray` (
  `X_ID` int(11) NOT NULL,
  `X_TYPE` varchar(30) DEFAULT NULL,
  `PRICE` int(11) NOT NULL,
  `DOC_SSN` char(9) NOT NULL,
  `PAT_SSN` char(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dental_xray`
--

INSERT INTO `dental_xray` (`X_ID`, `X_TYPE`, `PRICE`, `DOC_SSN`, `PAT_SSN`) VALUES
(1, 'Bitewing X-rays', 400, '934025677', '997845621'),
(2, 'Periapical X-rays', 300, '923546479', '911123648'),
(3, 'Full Mouth Survey X-rays', 450, '936971499', '978784544'),
(4, 'Bitewing X-rays', 400, '998522047', '900088899'),
(5, 'Full Mouth Survey X-rays', 450, '977068927', '900311548'),
(6, 'Panoramic X-rays', 250, '901475698', '939861045');

-- --------------------------------------------------------

--
-- Table structure for table `dentist`
--

CREATE TABLE `dentist` (
  `D_SSN` char(9) NOT NULL,
  `D_NAME` varchar(20) NOT NULL,
  `SALARY` int(11) NOT NULL,
  `APPOINTMENTS` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dentist`
--

INSERT INTO `dentist` (`D_SSN`, `D_NAME`, `SALARY`, `APPOINTMENTS`) VALUES
('901475698', 'K.Mostafa', 5000, '9-5'),
('923546479', 'J.Smith', 12000, '13-18'),
('931450976', 'A.Wallace', 7000, '1-6'),
('934025677', 'M.JHONE', 9000, '2-7'),
('936971499', 'M.Ahmed', 6000, '8-4'),
('977068927', 'A.James', 10000, '16-22'),
('998522047', 'K.Franklin', 14000, '15-21');

-- --------------------------------------------------------

--
-- Table structure for table `emergency_contact`
--

CREATE TABLE `emergency_contact` (
  `PAT_SSN` char(9) NOT NULL,
  `NAME` varchar(20) NOT NULL,
  `PHONE` varchar(14) NOT NULL,
  `ADDRESS` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `emergency_contact`
--

INSERT INTO `emergency_contact` (`PAT_SSN`, `NAME`, `PHONE`, `ADDRESS`) VALUES
('900311548', 'H.Shrief', '01558429895529', '10,karmoz,Alexandria'),
('911054158', 'M.Fahmy', '01526529265495', '45,masrElGdeda,Cairo'),
('939861045', 'H.Hassan', '01255989528925', '15,GamalAbdelNasr,Alexandria'),
('974108522', 'T,Mostafa', '01225455956898', '10,NasrCity,Cairo'),
('977704120', 'M.Ahmed', '01114595952655', '302,ElTagmo3,Cairo'),
('984599975', 'A.Walled', '01178926318002', '30,NasrCity,Cairo'),
('999791610', 'A.Mohamed', '01000145958925', '11,Abassya,Cairo');

-- --------------------------------------------------------

--
-- Table structure for table `insurance`
--

CREATE TABLE `insurance` (
  `P_SSN` char(9) NOT NULL,
  `Medical_Insurance_No` char(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `insurance`
--

INSERT INTO `insurance` (`P_SSN`, `Medical_Insurance_No`) VALUES
('997845621', '186952004862'),
('900088899', '296289562305'),
('999989998', '708452178451'),
('901425250', '708520965238'),
('904770588', '798896277721'),
('932568889', '845012784521'),
('978945654', '896310016861'),
('908410845', '896541205202'),
('978784544', '945105324821'),
('911123648', '964512002956'),
('999889556', '986532100265');

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `DENTAL_ID` int(11) NOT NULL,
  `D_LOCATION` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`DENTAL_ID`, `D_LOCATION`) VALUES
(1, 'Eltagamoa,cairo'),
(1, 'NasrCity,cairo'),
(1, 'sedybeshr,Alexandria'),
(2, 'Aswan'),
(2, 'fayoum'),
(2, 'NasrCity,cairo'),
(3, 'NasrCity,cairo');

-- --------------------------------------------------------

--
-- Table structure for table `nurse`
--

CREATE TABLE `nurse` (
  `N_SSN` char(9) NOT NULL,
  `DOC_SSN` char(9) DEFAULT NULL,
  `N_NAME` varchar(20) NOT NULL,
  `SALARY` int(11) NOT NULL,
  `PHONE` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `nurse`
--

INSERT INTO `nurse` (`N_SSN`, `DOC_SSN`, `N_NAME`, `SALARY`, `PHONE`) VALUES
('900318456', '977068927', 'A.James', 6000, '01198770025469'),
('901105546', '931450976', 'O.Wallace', 7000, '01004896482523'),
('911475935', '934025677', 'E.Oliver', 7000, '01178524631987'),
('921054892', '923546479', 'M.Smith', 4000, '01258962723630'),
('931311525', '901475698', 'K.Hossam', 4000, '01000100112356'),
('977862220', '998522047', 'I.Franklin', 4000, '01222014564897'),
('984515980', '901475698', 'K.Mostafa', 5000, '01002339789500'),
('985207406', '998522047', 'M.Ahmed', 6000, '01122456899710'),
('989791610', '923546479', 'Y.Noah', 5000, '01199755621300'),
('992560235', '931450976', 'A.Lucas', 7000, '01114522638779'),
('998562341', '998522047', 'O.William', 6000, '01145892267772'),
('999121002', '936971499', 'M.Tarek', 6000, '01114478962778');

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `P_SSN` char(9) NOT NULL,
  `P_NAME` varchar(20) NOT NULL,
  `Birthdate` date DEFAULT NULL,
  `DOC_SSN` char(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`P_SSN`, `P_NAME`, `Birthdate`, `DOC_SSN`) VALUES
('900088899', 'C.Thomas', '2001-07-18', '998522047'),
('900311548', 'E.Andrew', '1990-12-10', '977068927'),
('901104564', 'C.Adrian', '1980-06-12', '931450976'),
('901425250', 'I.David', '1997-05-15', '901475698'),
('904770588', 'H.Dylan', '2003-12-05', '998522047'),
('908410845', 'E.Matthew', '1999-03-31', '923546479'),
('911054158', 'G.Joshua', '1990-10-10', '934025677'),
('911123648', 'J.Mason', '2000-02-22', '923546479'),
('932568889', 'H.Logan', '1969-08-08', '931450976'),
('939861045', 'C.Greyson', '1972-07-07', '901475698'),
('974108522', 'A.Cameron', '1992-05-02', '936971499'),
('977704120', 'J.Colton', '1997-08-11', '998522047'),
('978784544', 'M.Samuel', '1988-10-08', '936971499'),
('978945654', 'R.Isaac', '1994-02-10', '931450976'),
('984599975', 'A.Charles', '2000-04-20', '901475698'),
('997845621', 'M.Elijah', '1982-01-27', '934025677'),
('999791610', 'A.Ryan', '1999-11-12', '923546479'),
('999889556', 'E.Henry', '2002-08-01', '977068927'),
('999989998', 'W.Owen', '1989-10-29', '998522047');

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `P_SSN` char(9) NOT NULL,
  `Credit_Card_No` char(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`P_SSN`, `Credit_Card_No`) VALUES
('900311548', '782489749264'),
('901104564', '746796450152'),
('911054158', '964512396541'),
('939861045', '189650111056'),
('974108522', '178457845120'),
('977704120', '708405124107'),
('984599975', '894561285612'),
('999791610', '965418521651');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `deal`
--
ALTER TABLE `deal`
  ADD PRIMARY KEY (`DOC_SSN`,`D_ID`),
  ADD KEY `D_ID` (`D_ID`);

--
-- Indexes for table `dental_lab`
--
ALTER TABLE `dental_lab`
  ADD PRIMARY KEY (`DEN_ID`);

--
-- Indexes for table `dental_xray`
--
ALTER TABLE `dental_xray`
  ADD PRIMARY KEY (`X_ID`),
  ADD KEY `DOC_SSN` (`DOC_SSN`);

--
-- Indexes for table `dentist`
--
ALTER TABLE `dentist`
  ADD PRIMARY KEY (`D_SSN`);

--
-- Indexes for table `emergency_contact`
--
ALTER TABLE `emergency_contact`
  ADD PRIMARY KEY (`PAT_SSN`,`NAME`);

--
-- Indexes for table `insurance`
--
ALTER TABLE `insurance`
  ADD PRIMARY KEY (`P_SSN`),
  ADD UNIQUE KEY `Medical_Insurance_No` (`Medical_Insurance_No`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`DENTAL_ID`,`D_LOCATION`);

--
-- Indexes for table `nurse`
--
ALTER TABLE `nurse`
  ADD PRIMARY KEY (`N_SSN`),
  ADD KEY `DOC_SSN` (`DOC_SSN`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`P_SSN`),
  ADD KEY `DOC_SSN` (`DOC_SSN`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`P_SSN`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `deal`
--
ALTER TABLE `deal`
  ADD CONSTRAINT `deal_ibfk_1` FOREIGN KEY (`DOC_SSN`) REFERENCES `dentist` (`D_SSN`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `deal_ibfk_2` FOREIGN KEY (`D_ID`) REFERENCES `dental_lab` (`DEN_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `dental_xray`
--
ALTER TABLE `dental_xray`
  ADD CONSTRAINT `dental_xray_ibfk_1` FOREIGN KEY (`DOC_SSN`) REFERENCES `dentist` (`D_SSN`) ON UPDATE CASCADE;

--
-- Constraints for table `emergency_contact`
--
ALTER TABLE `emergency_contact`
  ADD CONSTRAINT `emergency_contact_ibfk_1` FOREIGN KEY (`PAT_SSN`) REFERENCES `patient` (`P_SSN`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `insurance`
--
ALTER TABLE `insurance`
  ADD CONSTRAINT `insurance_ibfk_1` FOREIGN KEY (`P_SSN`) REFERENCES `patient` (`P_SSN`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `location`
--
ALTER TABLE `location`
  ADD CONSTRAINT `location_ibfk_1` FOREIGN KEY (`DENTAL_ID`) REFERENCES `dental_lab` (`DEN_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `nurse`
--
ALTER TABLE `nurse`
  ADD CONSTRAINT `nurse_ibfk_1` FOREIGN KEY (`DOC_SSN`) REFERENCES `dentist` (`D_SSN`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `patient`
--
ALTER TABLE `patient`
  ADD CONSTRAINT `patient_ibfk_1` FOREIGN KEY (`DOC_SSN`) REFERENCES `dentist` (`D_SSN`) ON UPDATE CASCADE;

--
-- Constraints for table `person`
--
ALTER TABLE `person`
  ADD CONSTRAINT `person_ibfk_1` FOREIGN KEY (`P_SSN`) REFERENCES `patient` (`P_SSN`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
