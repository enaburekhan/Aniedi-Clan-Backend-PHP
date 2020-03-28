-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 20, 2020 at 11:37 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aniedi`
--

-- --------------------------------------------------------

--
-- Table structure for table `admission`
--

CREATE TABLE `admission` (
  `HospitalId` int(6) NOT NULL,
  `DeprtmentId` int(6) NOT NULL,
  `UnitId` int(6) NOT NULL,
  `StaffId` int(6) NOT NULL,
  `PatientId` int(6) NOT NULL,
  `Temperature` int(3) NOT NULL,
  `Allergies` varchar(35) NOT NULL,
  `Height` int(3) NOT NULL,
  `Weight` int(3) NOT NULL,
  `State` varchar(50) NOT NULL,
  `AdmissionId` int(6) NOT NULL,
  `Date` date NOT NULL,
  `Patient_Condition` varchar(200) NOT NULL,
  `SymptomsId` int(6) NOT NULL,
  `AdmissionDate` date NOT NULL,
  `DischargedDate` date NOT NULL,
  `ReasonsForAdmission` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `chemical`
--

CREATE TABLE `chemical` (
  `ChemicalId` int(9) NOT NULL,
  `ChemicalName` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `CompanyId` int(6) NOT NULL,
  `CompanyName` varchar(25) NOT NULL,
  `Address` varchar(40) NOT NULL,
  `Lga` varchar(32) NOT NULL,
  `State` varchar(32) NOT NULL,
  `Country` varchar(32) NOT NULL DEFAULT 'Nigeria'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `drugcontent`
--

CREATE TABLE `drugcontent` (
  `DrugContentId` int(6) NOT NULL,
  `DrugInventoryId` int(6) NOT NULL,
  `ChemicalId` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `druginventory`
--

CREATE TABLE `druginventory` (
  `DrugInventoryId` int(6) NOT NULL,
  `DrugName` varchar(50) NOT NULL,
  `StockDate` date NOT NULL,
  `StockQuantity` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `hmo`
--

CREATE TABLE `hmo` (
  `CompanyId` int(6) NOT NULL,
  `PatientId` int(6) NOT NULL,
  `HospitalId` int(6) NOT NULL,
  `HmoId` int(6) NOT NULL,
  `Hmo` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `hospital`
--

CREATE TABLE `hospital` (
  `HospitalId` int(6) NOT NULL,
  `Name` varchar(32) NOT NULL,
  `Address` varchar(32) NOT NULL,
  `Lga` varchar(32) NOT NULL,
  `State` varchar(20) NOT NULL,
  `Country` varchar(32) NOT NULL DEFAULT 'Nigeria'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `hospitaldepartment`
--

CREATE TABLE `hospitaldepartment` (
  `HospitalId` int(6) NOT NULL,
  `DepartmentId` int(6) NOT NULL,
  `Name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `hospitaldepartmentunit`
--

CREATE TABLE `hospitaldepartmentunit` (
  `HospitalId` int(6) NOT NULL,
  `DeprtmentId` int(6) NOT NULL,
  `UnitId` int(6) NOT NULL,
  `UnitName` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `hospitaldepartmentunitward`
--

CREATE TABLE `hospitaldepartmentunitward` (
  `HospitalId` int(6) NOT NULL,
  `DeprtmentId` int(6) NOT NULL,
  `UnitId` int(6) NOT NULL,
  `WardId` int(6) NOT NULL,
  `TypeOfWard` varchar(30) NOT NULL,
  `WardGender` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `PatientId` int(6) NOT NULL,
  `Title` varchar(6) NOT NULL DEFAULT 'Mr.',
  `Firstname` varchar(25) NOT NULL,
  `Lastname` varchar(25) NOT NULL,
  `Othername` varchar(25) NOT NULL,
  `Email` varchar(32) NOT NULL,
  `Password` varchar(25) NOT NULL,
  `Gender` varchar(8) NOT NULL DEFAULT 'Male',
  `Address` varchar(32) NOT NULL,
  `L.G.A` varchar(32) NOT NULL,
  `State` varchar(10) NOT NULL,
  `Country` varchar(20) NOT NULL DEFAULT 'Nigeria',
  `Zipcode` int(8) NOT NULL,
  `Phone` int(13) NOT NULL,
  `Picture` varchar(40) NOT NULL,
  `Genotype` varchar(2) NOT NULL,
  `Marital Status` varchar(10) NOT NULL DEFAULT 'Single',
  `DateOfBirth` date NOT NULL,
  `DateRegistered` date NOT NULL DEFAULT current_timestamp(),
  `CompanyId` int(6) NOT NULL,
  `HmoID` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `patientdrugadministered`
--

CREATE TABLE `patientdrugadministered` (
  `AdministerId` int(6) NOT NULL,
  `HospitalId` int(6) NOT NULL,
  `DeprtmentId` int(6) NOT NULL,
  `UnitId` int(6) NOT NULL,
  `StaffId` int(6) NOT NULL,
  `DrugInventoryId` int(6) NOT NULL,
  `PatientId` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `StaffId` int(6) NOT NULL,
  `HospitalId` int(6) NOT NULL,
  `DepartmentId` int(6) NOT NULL,
  `Role` varchar(15) NOT NULL DEFAULT 'Doctor',
  `Firstname` varchar(32) NOT NULL,
  `Lastname` varchar(32) NOT NULL,
  `Othername` varchar(32) NOT NULL,
  `Email` varchar(32) NOT NULL,
  `Password` int(11) NOT NULL,
  `UnitId` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `symptoms`
--

CREATE TABLE `symptoms` (
  `SymptomsId` int(6) NOT NULL,
  `SymptomName` text NOT NULL,
  `Diagnosis` varchar(50) NOT NULL,
  `DiagnosisInfo` int(11) NOT NULL,
  `Recommendations` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `unitidjoin`
--

CREATE TABLE `unitidjoin` (
  `HospitalId` int(6) NOT NULL,
  `DeprtmentId` int(6) NOT NULL,
  `UnitId_1` int(6) NOT NULL,
  `UnitId` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admission`
--
ALTER TABLE `admission`
  ADD PRIMARY KEY (`AdmissionId`),
  ADD KEY `DeprtmentId` (`DeprtmentId`),
  ADD KEY `HospitalId` (`HospitalId`),
  ADD KEY `PatientId` (`PatientId`),
  ADD KEY `StaffId` (`StaffId`),
  ADD KEY `UnitId` (`UnitId`);

--
-- Indexes for table `chemical`
--
ALTER TABLE `chemical`
  ADD PRIMARY KEY (`ChemicalId`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`CompanyId`);

--
-- Indexes for table `drugcontent`
--
ALTER TABLE `drugcontent`
  ADD PRIMARY KEY (`DrugContentId`),
  ADD KEY `ChemicalId` (`ChemicalId`),
  ADD KEY `DrugInventoryId` (`DrugInventoryId`);

--
-- Indexes for table `druginventory`
--
ALTER TABLE `druginventory`
  ADD PRIMARY KEY (`DrugInventoryId`);

--
-- Indexes for table `hmo`
--
ALTER TABLE `hmo`
  ADD PRIMARY KEY (`HmoId`),
  ADD KEY `CompanyId` (`CompanyId`),
  ADD KEY `HospitalId` (`HospitalId`);

--
-- Indexes for table `hospital`
--
ALTER TABLE `hospital`
  ADD PRIMARY KEY (`HospitalId`);

--
-- Indexes for table `hospitaldepartment`
--
ALTER TABLE `hospitaldepartment`
  ADD PRIMARY KEY (`DepartmentId`),
  ADD KEY `hospitaldepartment_ibfk_1` (`HospitalId`);

--
-- Indexes for table `hospitaldepartmentunit`
--
ALTER TABLE `hospitaldepartmentunit`
  ADD PRIMARY KEY (`UnitId`),
  ADD KEY `DeprtmentId` (`DeprtmentId`),
  ADD KEY `HospitalId` (`HospitalId`);

--
-- Indexes for table `hospitaldepartmentunitward`
--
ALTER TABLE `hospitaldepartmentunitward`
  ADD PRIMARY KEY (`UnitId`),
  ADD KEY `DeprtmentId` (`DeprtmentId`),
  ADD KEY `HospitalId` (`HospitalId`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`PatientId`),
  ADD KEY `CompanyId` (`CompanyId`),
  ADD KEY `patient_ibfk_2` (`HmoID`);

--
-- Indexes for table `patientdrugadministered`
--
ALTER TABLE `patientdrugadministered`
  ADD PRIMARY KEY (`AdministerId`),
  ADD KEY `DeprtmentId` (`DeprtmentId`),
  ADD KEY `DrugInventoryId` (`DrugInventoryId`),
  ADD KEY `HospitalId` (`HospitalId`),
  ADD KEY `PatientId` (`PatientId`),
  ADD KEY `StaffId` (`StaffId`),
  ADD KEY `UnitId` (`UnitId`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`StaffId`),
  ADD KEY `staff_ibfk_1` (`DepartmentId`),
  ADD KEY `staff_ibfk_3` (`UnitId`),
  ADD KEY `staff_ibfk_2` (`HospitalId`);

--
-- Indexes for table `unitidjoin`
--
ALTER TABLE `unitidjoin`
  ADD KEY `UnitId` (`UnitId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admission`
--
ALTER TABLE `admission`
  MODIFY `AdmissionId` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `CompanyId` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `drugcontent`
--
ALTER TABLE `drugcontent`
  MODIFY `DrugContentId` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hospitaldepartment`
--
ALTER TABLE `hospitaldepartment`
  MODIFY `DepartmentId` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `StaffId` int(6) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admission`
--
ALTER TABLE `admission`
  ADD CONSTRAINT `admission_ibfk_1` FOREIGN KEY (`DeprtmentId`) REFERENCES `hospitaldepartment` (`DepartmentId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `admission_ibfk_2` FOREIGN KEY (`HospitalId`) REFERENCES `hospital` (`HospitalId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `admission_ibfk_3` FOREIGN KEY (`PatientId`) REFERENCES `patient` (`PatientId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `admission_ibfk_4` FOREIGN KEY (`StaffId`) REFERENCES `staff` (`StaffId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `admission_ibfk_5` FOREIGN KEY (`UnitId`) REFERENCES `hospitaldepartmentunit` (`UnitId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `drugcontent`
--
ALTER TABLE `drugcontent`
  ADD CONSTRAINT `drugcontent_ibfk_1` FOREIGN KEY (`ChemicalId`) REFERENCES `chemical` (`ChemicalId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `drugcontent_ibfk_2` FOREIGN KEY (`DrugInventoryId`) REFERENCES `druginventory` (`DrugInventoryId`);

--
-- Constraints for table `hmo`
--
ALTER TABLE `hmo`
  ADD CONSTRAINT `hmo_ibfk_1` FOREIGN KEY (`CompanyId`) REFERENCES `company` (`CompanyId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hmo_ibfk_2` FOREIGN KEY (`HospitalId`) REFERENCES `hospital` (`HospitalId`);

--
-- Constraints for table `hospitaldepartment`
--
ALTER TABLE `hospitaldepartment`
  ADD CONSTRAINT `hospitaldepartment_ibfk_1` FOREIGN KEY (`HospitalId`) REFERENCES `hospital` (`HospitalId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hospitaldepartmentunit`
--
ALTER TABLE `hospitaldepartmentunit`
  ADD CONSTRAINT `hospitaldepartmentunit_ibfk_1` FOREIGN KEY (`DeprtmentId`) REFERENCES `hospitaldepartment` (`DepartmentId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hospitaldepartmentunit_ibfk_2` FOREIGN KEY (`HospitalId`) REFERENCES `hospital` (`HospitalId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hospitaldepartmentunitward`
--
ALTER TABLE `hospitaldepartmentunitward`
  ADD CONSTRAINT `hospitaldepartmentunitward_ibfk_1` FOREIGN KEY (`DeprtmentId`) REFERENCES `hospitaldepartment` (`DepartmentId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hospitaldepartmentunitward_ibfk_2` FOREIGN KEY (`HospitalId`) REFERENCES `hospital` (`HospitalId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hospitaldepartmentunitward_ibfk_3` FOREIGN KEY (`UnitId`) REFERENCES `hospitaldepartmentunit` (`UnitId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `patient`
--
ALTER TABLE `patient`
  ADD CONSTRAINT `patient_ibfk_1` FOREIGN KEY (`CompanyId`) REFERENCES `company` (`CompanyId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `patient_ibfk_2` FOREIGN KEY (`HmoID`) REFERENCES `hmo` (`HmoId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `patientdrugadministered`
--
ALTER TABLE `patientdrugadministered`
  ADD CONSTRAINT `patientdrugadministered_ibfk_1` FOREIGN KEY (`DeprtmentId`) REFERENCES `hospitaldepartment` (`DepartmentId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `patientdrugadministered_ibfk_2` FOREIGN KEY (`DrugInventoryId`) REFERENCES `druginventory` (`DrugInventoryId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `patientdrugadministered_ibfk_3` FOREIGN KEY (`HospitalId`) REFERENCES `hospital` (`HospitalId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `patientdrugadministered_ibfk_4` FOREIGN KEY (`PatientId`) REFERENCES `patient` (`PatientId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `patientdrugadministered_ibfk_5` FOREIGN KEY (`StaffId`) REFERENCES `staff` (`StaffId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `patientdrugadministered_ibfk_6` FOREIGN KEY (`UnitId`) REFERENCES `hospitaldepartmentunit` (`UnitId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`DepartmentId`) REFERENCES `hospitaldepartment` (`DepartmentId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `staff_ibfk_2` FOREIGN KEY (`HospitalId`) REFERENCES `hospital` (`HospitalId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `staff_ibfk_3` FOREIGN KEY (`UnitId`) REFERENCES `hospitaldepartmentunit` (`UnitId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `unitidjoin`
--
ALTER TABLE `unitidjoin`
  ADD CONSTRAINT `unitidjoin_ibfk_1` FOREIGN KEY (`UnitId`) REFERENCES `hospitaldepartmentunit` (`UnitId`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
