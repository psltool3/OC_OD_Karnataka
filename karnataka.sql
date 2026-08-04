-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 04, 2026 at 12:31 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `karnataka`
--

-- --------------------------------------------------------

--
-- Table structure for table `dcp`
--

CREATE TABLE `dcp` (
  `district` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `id` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `latitude` varchar(100) NOT NULL,
  `longitude` varchar(100) NOT NULL,
  `demand` varchar(100) NOT NULL,
  `uniqueid` varchar(100) NOT NULL,
  `active` varchar(11) NOT NULL,
  `demand_rice` varchar(100) NOT NULL,
  `taluka` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dcp`
--

INSERT INTO `dcp` (`district`, `name`, `id`, `type`, `latitude`, `longitude`, `demand`, `uniqueid`, `active`, `demand_rice`, `taluka`) VALUES
('Bagalkote', 'Kfcsc T Narasipura', '335', 'FCI', '16.15499028', '75.67274778', '327800', 'DCP_6a6cad295f4', '1', '6001', 'Akki'),
('Ballari', 'KFCSC HUNSUR', '336', 'FCI', '16.149352', '75.672288', '122320', 'DCP_6a6cad29602', '1', '0', 'Akki'),
('Bagalkote', 'Maharstra Project', '4589', 'sw', '24', '76', '500', 'DCP_6a6cad2960f', '1', '1000', 'Akki'),
('Bagalkote', 'Maharstra Project11', '12221', 'ds', '24', '76', '500', 'DCP_6a6cad2961a', '1', '1000', 'Akki'),
('Bagalkote', 'abcd', 'fci', 'afds', '24.010211', '91.994214', '100', 'DCP_6a6cad29624', '1', '100', 'Akki'),
('Bagalkote', 'Maharstra Project', '8978', 'abc', '24', '76', '766', 'DCP_6a71bf1edcf', '1', '677', 'Akki');

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

CREATE TABLE `districts` (
  `id` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `districts`
--

INSERT INTO `districts` (`id`, `name`) VALUES
('664053be14572', 'Ballari'),
('664053d530357', 'Bangalore'),
('664053e25f1c6', 'Belagavi'),
('664053f52e54a', 'Bengaluru Rural'),
('6640540663386', 'Bidar'),
('66405415ae8cc', 'Chamarajanagara'),
('6640542805e8c', 'Chikkaballapura'),
('664054384d4a7', 'Chikkamagaluru'),
('6640546790b06', 'Chitradurga'),
('66405478d14b5', 'Dakshina Kannada'),
('6640548a58752', 'Davanagere'),
('664054992f3e0', 'Dharwad'),
('664054b10f9f8', 'Gadag'),
('664054d5d3941', 'Hassan'),
('664054e4a2c92', 'Haveri'),
('664054f919178', 'Kalaburagi'),
('6640550781015', 'Kodagu'),
('6640551704408', 'Kolar'),
('66405527be1b7', 'Koppal'),
('6640553965deb', 'Mandya'),
('6640554b023f0', 'Mysuru'),
('66405560cec72', 'Raichur'),
('664055720f6f9', 'Ramanagara'),
('664055835cb3f', 'Shivamogga'),
('6640559291b1c', 'Tumakuru'),
('664055a2073f9', 'Udupi'),
('664055b16789c', 'Uttara Kannada'),
('664055bfa41d4', 'Vijayanagar'),
('664055ce5cd45', 'Vijayapura'),
('664055dcc7f77', 'Yadgir'),
('695f5a6ccd265', 'Bagalkote');

-- --------------------------------------------------------

--
-- Table structure for table `fci_leg1_5np4gohmyhmok0`
--

CREATE TABLE `fci_leg1_5np4gohmyhmok0` (
  `district` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `id` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `latitude` varchar(100) NOT NULL,
  `longitude` varchar(100) NOT NULL,
  `demand` varchar(100) NOT NULL,
  `uniqueid` varchar(100) NOT NULL,
  `active` varchar(10) NOT NULL DEFAULT '1',
  `demand_rice` varchar(100) NOT NULL,
  `block` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fci_leg1_5np4gohmyhmok0`
--

INSERT INTO `fci_leg1_5np4gohmyhmok0` (`district`, `name`, `id`, `type`, `latitude`, `longitude`, `demand`, `uniqueid`, `active`, `demand_rice`, `block`) VALUES
('Bagalkote', 'Kfcsc T Narasipura', '335', 'FCI', '16.15499028', '75.67274778', '327800', 'DCP_699559c496e', '1', '6001', ''),
('Ballari', 'KFCSC HUNSUR', '336', 'FCI', '16.149352', '75.672288', '122320', 'DCP_699559c4976', '1', '0', ''),
('Bagalkote', 'Maharstra Project', '4589', 'sw', '24', '76', '500', 'DCP_699559c497e', '1', '1000', ''),
('Bagalkote', 'Maharstra Project11', '12221', 'ds', '24', '76', '500', 'DCP_699559c498f', '1', '1000', '');

-- --------------------------------------------------------

--
-- Table structure for table `fps`
--

CREATE TABLE `fps` (
  `district` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `id` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `latitude` varchar(100) NOT NULL,
  `longitude` varchar(100) NOT NULL,
  `demand` varchar(100) NOT NULL,
  `uniqueid` varchar(100) NOT NULL,
  `active` varchar(10) NOT NULL DEFAULT '1',
  `demand_rice` varchar(250) NOT NULL,
  `taluka` varchar(255) DEFAULT NULL,
  `inventory_ragi` int(11) DEFAULT NULL,
  `inventory_jowar` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fps`
--

INSERT INTO `fps` (`district`, `name`, `id`, `type`, `latitude`, `longitude`, `demand`, `uniqueid`, `active`, `demand_rice`, `taluka`, `inventory_ragi`, `inventory_jowar`) VALUES
('Bagalkote', 'Yavatmal Yass', '4', 'Model FPS', '16.0238', '75.6052', '677', 'FPS_69ab83f4bdf', '1', '90', 'Akki', 90, 500),
('Bagalkote', 'Gram Mandal Maninagar', 'FPS1', 'Normal FPS', '16.0238', '75.6052', '46.46', 'FPS_69ab83f4c71', '1', '0', 'Akki', 1111, 500),
('Bagalkote', 'MAHAKUTESHWAR YUVAKA MANDAL YANKANCHI', 'FPS2', 'Normal FPS', '16.0227', '75.6052', '75.34', 'FPS_69ab83f4d13', '1', '0', 'Akki', 1111, 500),
('Bagalkote', 'L.B. NAIKAR. KHANAPUR.S.K. 68 (C)(RADDERTIMMAPUR)', 'FPS4', 'Normal FPS', '15.9938', '75.452', '110.89', 'FPS_69ab83f4da7', '1', '0', 'Akki', 1111, 500),
('Bagalkote', 'YUVAKA MANDAL HAVALAKOD', 'FPS5', 'Normal FPS', '16.0257', '75.4523', '55.51', 'FPS_69ab83f4e38', '1', '0', 'Akki', 1111, 500),
('Bagalkote', 'MARUTI YUVAKA MANDAL FAKIRBUDIHAL', 'FPS6', 'Normal FPS', '16.0502', '75.4754', '37.54', 'FPS_69ab83f4eec', '1', '0', 'Akki', 1111, 500),
('Bagalkote', 'YUVAKA MANDAL SAGANUR', 'FPS7', 'Normal FPS', '16.0437', '75.474', '27.24', 'FPS_69ab83f502b', '1', '0', 'Akki', 1111, 500),
('Bagalkote', 'YUVAKA MANDAL CHINCHALAKATTI', 'FPS8', 'Normal FPS', '16.023', '75.4657', '58.13', 'FPS_69ab83f50ae', '1', '0', 'Akki', 1111, 500),
('Bagalkote', 'K.K.LAMANI CHINCHALAKATTI L.T.', 'FPS9', 'Normal FPS', '16.0242', '75.4815', '38.08', 'FPS_69ab83f5130', '1', '0', 'Akki', 1111, 500);

-- --------------------------------------------------------

--
-- Table structure for table `fps_epjk7mviqvof9z`
--

CREATE TABLE `fps_epjk7mviqvof9z` (
  `district` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `id` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `latitude` varchar(100) NOT NULL,
  `longitude` varchar(100) NOT NULL,
  `demand` varchar(100) NOT NULL,
  `uniqueid` varchar(100) NOT NULL,
  `active` varchar(10) NOT NULL DEFAULT '1',
  `demand_rice` varchar(100) NOT NULL,
  `taluka` varchar(100) NOT NULL,
  `inventory_ragi` varchar(100) NOT NULL,
  `inventory_jowar` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fps_epjk7mviqvof9z`
--

INSERT INTO `fps_epjk7mviqvof9z` (`district`, `name`, `id`, `type`, `latitude`, `longitude`, `demand`, `uniqueid`, `active`, `demand_rice`, `taluka`, `inventory_ragi`, `inventory_jowar`) VALUES
('Bagalkote', 'Yavatmal Yass', '4', 'Model FPS', '16.0238', '75.6052', '677', 'FPS_69ab83f4bdf', '1', '90', 'Akki', '90', '500'),
('Bagalkote', 'Gram Mandal Maninagar', 'FPS1', 'Normal FPS', '16.0238', '75.6052', '46.46', 'FPS_69ab83f4c71', '1', '0', 'Akki', '1111', '500'),
('Bagalkote', 'MAHAKUTESHWAR YUVAKA MANDAL YANKANCHI', 'FPS2', 'Normal FPS', '16.0227', '75.6052', '75.34', 'FPS_69ab83f4d13', '1', '0', 'Akki', '1111', '500'),
('Bagalkote', 'L.B. NAIKAR. KHANAPUR.S.K. 68 (C)(RADDERTIMMAPUR)', 'FPS4', 'Normal FPS', '15.9938', '75.452', '110.89', 'FPS_69ab83f4da7', '1', '0', 'Akki', '1111', '500'),
('Bagalkote', 'YUVAKA MANDAL HAVALAKOD', 'FPS5', 'Normal FPS', '16.0257', '75.4523', '55.51', 'FPS_69ab83f4e38', '1', '0', 'Akki', '1111', '500'),
('Bagalkote', 'MARUTI YUVAKA MANDAL FAKIRBUDIHAL', 'FPS6', 'Normal FPS', '16.0502', '75.4754', '37.54', 'FPS_69ab83f4eec', '1', '0', 'Akki', '1111', '500'),
('Bagalkote', 'YUVAKA MANDAL SAGANUR', 'FPS7', 'Normal FPS', '16.0437', '75.474', '27.24', 'FPS_69ab83f502b', '1', '0', 'Akki', '1111', '500'),
('Bagalkote', 'YUVAKA MANDAL CHINCHALAKATTI', 'FPS8', 'Normal FPS', '16.023', '75.4657', '58.13', 'FPS_69ab83f50ae', '1', '0', 'Akki', '1111', '500'),
('Bagalkote', 'K.K.LAMANI CHINCHALAKATTI L.T.', 'FPS9', 'Normal FPS', '16.0242', '75.4815', '38.08', 'FPS_69ab83f5130', '1', '0', 'Akki', '1111', '500');

-- --------------------------------------------------------

--
-- Table structure for table `fps_fmnn8paovarufq`
--

CREATE TABLE `fps_fmnn8paovarufq` (
  `district` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `id` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `latitude` varchar(100) NOT NULL,
  `longitude` varchar(100) NOT NULL,
  `demand` varchar(100) NOT NULL,
  `uniqueid` varchar(100) NOT NULL,
  `active` varchar(10) NOT NULL DEFAULT '1',
  `demand_rice` varchar(100) NOT NULL,
  `taluka` varchar(100) NOT NULL,
  `inventory_ragi` varchar(100) NOT NULL,
  `inventory_jowar` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fps_fmnn8paovarufq`
--

INSERT INTO `fps_fmnn8paovarufq` (`district`, `name`, `id`, `type`, `latitude`, `longitude`, `demand`, `uniqueid`, `active`, `demand_rice`, `taluka`, `inventory_ragi`, `inventory_jowar`) VALUES
('Bagalkote', 'Yavatmal Yass', '4', 'Model FPS', '16.0238', '75.6052', '677', 'FPS_69ab83f4bdf', '1', '90', 'Akki', '90', '500'),
('Bagalkote', 'Gram Mandal Maninagar', 'FPS1', 'Normal FPS', '16.0238', '75.6052', '46.46', 'FPS_69ab83f4c71', '1', '0', 'Akki', '1111', '500'),
('Bagalkote', 'MAHAKUTESHWAR YUVAKA MANDAL YANKANCHI', 'FPS2', 'Normal FPS', '16.0227', '75.6052', '75.34', 'FPS_69ab83f4d13', '1', '0', 'Akki', '1111', '500'),
('Bagalkote', 'L.B. NAIKAR. KHANAPUR.S.K. 68 (C)(RADDERTIMMAPUR)', 'FPS4', 'Normal FPS', '15.9938', '75.452', '110.89', 'FPS_69ab83f4da7', '1', '0', 'Akki', '1111', '500'),
('Bagalkote', 'YUVAKA MANDAL HAVALAKOD', 'FPS5', 'Normal FPS', '16.0257', '75.4523', '55.51', 'FPS_69ab83f4e38', '1', '0', 'Akki', '1111', '500'),
('Bagalkote', 'MARUTI YUVAKA MANDAL FAKIRBUDIHAL', 'FPS6', 'Normal FPS', '16.0502', '75.4754', '37.54', 'FPS_69ab83f4eec', '1', '0', 'Akki', '1111', '500'),
('Bagalkote', 'YUVAKA MANDAL SAGANUR', 'FPS7', 'Normal FPS', '16.0437', '75.474', '27.24', 'FPS_69ab83f502b', '1', '0', 'Akki', '1111', '500'),
('Bagalkote', 'YUVAKA MANDAL CHINCHALAKATTI', 'FPS8', 'Normal FPS', '16.023', '75.4657', '58.13', 'FPS_69ab83f50ae', '1', '0', 'Akki', '1111', '500'),
('Bagalkote', 'K.K.LAMANI CHINCHALAKATTI L.T.', 'FPS9', 'Normal FPS', '16.0242', '75.4815', '38.08', 'FPS_69ab83f5130', '1', '0', 'Akki', '1111', '500');

-- --------------------------------------------------------

--
-- Table structure for table `fps_o26hx1j6rmwu2u`
--

CREATE TABLE `fps_o26hx1j6rmwu2u` (
  `district` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `id` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `latitude` varchar(100) NOT NULL,
  `longitude` varchar(100) NOT NULL,
  `demand` varchar(100) NOT NULL,
  `uniqueid` varchar(100) NOT NULL,
  `active` varchar(10) NOT NULL DEFAULT '1',
  `demand_rice` varchar(100) NOT NULL,
  `taluka` varchar(100) NOT NULL,
  `inventory_ragi` varchar(100) NOT NULL,
  `inventory_jowar` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fps_o26hx1j6rmwu2u`
--

INSERT INTO `fps_o26hx1j6rmwu2u` (`district`, `name`, `id`, `type`, `latitude`, `longitude`, `demand`, `uniqueid`, `active`, `demand_rice`, `taluka`, `inventory_ragi`, `inventory_jowar`) VALUES
('Bagalkote', 'Yavatmal Yass', '4', 'Model FPS', '16.0238', '75.6052', '677', 'FPS_69ab83f4bdf', '1', '90', 'Akki', '90', '500'),
('Bagalkote', 'Gram Mandal Maninagar', 'FPS1', 'Normal FPS', '16.0238', '75.6052', '46.46', 'FPS_69ab83f4c71', '1', '0', 'Akki', '1111', '500'),
('Bagalkote', 'MAHAKUTESHWAR YUVAKA MANDAL YANKANCHI', 'FPS2', 'Normal FPS', '16.0227', '75.6052', '75.34', 'FPS_69ab83f4d13', '1', '0', 'Akki', '1111', '500'),
('Bagalkote', 'L.B. NAIKAR. KHANAPUR.S.K. 68 (C)(RADDERTIMMAPUR)', 'FPS4', 'Normal FPS', '15.9938', '75.452', '110.89', 'FPS_69ab83f4da7', '1', '0', 'Akki', '1111', '500'),
('Bagalkote', 'YUVAKA MANDAL HAVALAKOD', 'FPS5', 'Normal FPS', '16.0257', '75.4523', '55.51', 'FPS_69ab83f4e38', '1', '0', 'Akki', '1111', '500'),
('Bagalkote', 'MARUTI YUVAKA MANDAL FAKIRBUDIHAL', 'FPS6', 'Normal FPS', '16.0502', '75.4754', '37.54', 'FPS_69ab83f4eec', '1', '0', 'Akki', '1111', '500'),
('Bagalkote', 'YUVAKA MANDAL SAGANUR', 'FPS7', 'Normal FPS', '16.0437', '75.474', '27.24', 'FPS_69ab83f502b', '1', '0', 'Akki', '1111', '500'),
('Bagalkote', 'YUVAKA MANDAL CHINCHALAKATTI', 'FPS8', 'Normal FPS', '16.023', '75.4657', '58.13', 'FPS_69ab83f50ae', '1', '0', 'Akki', '1111', '500'),
('Bagalkote', 'K.K.LAMANI CHINCHALAKATTI L.T.', 'FPS9', 'Normal FPS', '16.0242', '75.4815', '38.08', 'FPS_69ab83f5130', '1', '0', 'Akki', '1111', '500');

-- --------------------------------------------------------

--
-- Table structure for table `fps_s3suwcezjyheju`
--

CREATE TABLE `fps_s3suwcezjyheju` (
  `district` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `id` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `latitude` varchar(100) NOT NULL,
  `longitude` varchar(100) NOT NULL,
  `demand` varchar(100) NOT NULL,
  `uniqueid` varchar(100) NOT NULL,
  `active` varchar(10) NOT NULL DEFAULT '1',
  `demand_rice` varchar(100) NOT NULL,
  `taluka` varchar(100) NOT NULL,
  `inventory_millets` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fps_s3suwcezjyheju`
--

INSERT INTO `fps_s3suwcezjyheju` (`district`, `name`, `id`, `type`, `latitude`, `longitude`, `demand`, `uniqueid`, `active`, `demand_rice`, `taluka`, `inventory_millets`) VALUES
('Bagalkote', 'Gram Mandal Maninagar', 'FPS1', 'Normal FPS', '16.0238', '75.6052', '46.46', 'FPS_6992c1aa2e6', '1', '700', 'Badami', '6'),
('Bagalkote', 'MAHAKUTESHWAR YUVAKA MANDAL YANKANCHI', 'FPS2', 'Normal FPS', '16.0227', '75.6052', '75.34', 'FPS_6992c1aa5a6', '1', '0', 'Badami', '6'),
('Bagalkote', 'MAHAKUTESHWAR Y.M. GUBBERAKOPPA', 'FPS3', 'Normal FPS', '16.0267', '75.6126', '24.25', 'FPS_6992c1aa796', '1', '0', 'Badami', '6'),
('Bagalkote', 'L.B. NAIKAR. KHANAPUR.S.K. 68 (C)(RADDERTIMMAPUR)', 'FPS4', 'Normal FPS', '15.9938', '75.452', '110.89', 'FPS_6992c1aa91c', '1', '0', 'Badami', '6'),
('Bagalkote', 'YUVAKA MANDAL HAVALAKOD', 'FPS5', 'Normal FPS', '16.0257', '75.4523', '55.51', 'FPS_6992c1aa9c0', '1', '0', 'Badami', '6'),
('Bagalkote', 'MARUTI YUVAKA MANDAL FAKIRBUDIHAL', 'FPS6', 'Normal FPS', '16.0502', '75.4754', '37.54', 'FPS_6992c1aaa62', '1', '0', 'Badami', '6'),
('Bagalkote', 'YUVAKA MANDAL SAGANUR', 'FPS7', 'Normal FPS', '16.0437', '75.474', '27.24', 'FPS_6992c1aab06', '1', '0', 'Badami', '6'),
('Bagalkote', 'YUVAKA MANDAL CHINCHALAKATTI', 'FPS8', 'Normal FPS', '16.023', '75.4657', '58.13', 'FPS_6992c1aab8e', '1', '0', 'Badami', '6'),
('Bagalkote', 'K.K.LAMANI CHINCHALAKATTI L.T.', 'FPS9', 'Normal FPS', '16.0242', '75.4815', '38.08', 'FPS_6992c1aac2a', '1', '0', 'Badami', '6'),
('Bagalkote', 'RAIT SANGHA HANAMANERI (S)', 'FPS10', 'Normal FPS', '16.0122', '75.4965', '11.73', 'FPS_6992c1aacab', '1', '0', 'Badami', '6'),
('Bagalkote', 'V.S.S. NEERBUDIHAL', 'FPS11', 'Normal FPS', '16.1278', '75.5244', '139.24', 'FPS_6992c1aad91', '1', '0', 'Badami', '6'),
('Bagalkote', 'GRAMA MANDAL GANGANABUDIHAL', 'FPS12', 'Normal FPS', '16.1185', '75.5616', '115.6', 'FPS_6992c1aae29', '1', '0', 'Badami', '6'),
('Bagalkote', 'S.M.GONNAGAR JANGAWAD', 'FPS13', 'Normal FPS', '16.0518', '75.4277', '30.01', 'FPS_6992c1aaeac', '1', '0', 'Badami', '6'),
('Bagalkote', 'YUVAKA MANDALA HOSAKOTI-37 (C)(KAINAKATTI)', 'FPS14', 'Normal FPS', '16.0764', '75.4496', '48.23', 'FPS_6992c1aaf36', '1', '0', 'Badami', '6'),
('Bagalkote', 'Y.S.NARASANVAR SHIPARMATTI', 'FPS15', 'Normal FPS', '16.074', '75.4333', '37.27', 'FPS_6992c1ab077', '1', '0', 'Badami', '6'),
('Bagalkote', 'YUVAKA MANDAL HOSAKOTI', 'FPS16', 'Normal FPS', '16.0641', '75.4592', '49.79', 'FPS_6992c1ab119', '1', '0', 'Badami', '6'),
('Bagalkote', 'GRAMA MANDAL MATTIKATTI', 'FPS17', 'Normal FPS', '16.0211', '75.5675', '73.18', 'FPS_6992c1ab1bd', '1', '0', 'Badami', '6'),
('Bagalkote', 'SHIVANAND YUVAKA MANDAL MALAGI', 'FPS18', 'Normal FPS', '16.0524', '75.539', '64.39', 'FPS_6992c1ab280', '1', '0', 'Badami', '6'),
('Bagalkote', 'SHRADDANAND YUVAKA MANDAL NARENUR', 'FPS19', 'Normal FPS', '16.0399', '75.5084', '83.6', 'FPS_6992c1ab4f7', '1', '0', 'Badami', '6'),
('Bagalkote', 'KRISHNA YUVAKA MANDAL NARENUR L.T.2', 'FPS20', 'Normal FPS', '16.061', '75.5132', '46.85', 'FPS_6992c1ab692', '1', '0', 'Badami', '6'),
('Bagalkote', 'Ranganath Hanamappa Sunagad (PH) Inam Hanamaneri', 'FPS21', 'Normal FPS', '16.1332', '75.4141', '34.7', 'FPS_6992c1ab713', '1', '0', 'Badami', '6'),
('Bagalkote', 'PKPS Anawal', 'FPS22', 'Normal FPS', '16.0983', '75.4703', '170.24', 'FPS_6992c1ab7b6', '1', '0', 'Badami', '6'),
('Bagalkote', 'GRAMA MANDAL KALABANDKERI', 'FPS23', 'Normal FPS', '16.0848', '75.5122', '70.07', 'FPS_6992c1ab839', '1', '0', 'Badami', '6'),
('Bagalkote', 'YUVAKA MANDAL YANDIGERI', 'FPS24', 'Normal FPS', '16.1311', '75.494', '101.15', 'FPS_6992c1ab8bb', '1', '0', 'Badami', '6'),
('Bagalkote', 'V.S.S.KAGALGOMBA', 'FPS25', 'Normal FPS', '16.1115', '75.6221', '120.98', 'FPS_6992c1ab95c', '1', '0', 'Badami', '6'),
('Bagalkote', 'V.S.S.KERAKALMATTI', 'FPS26', 'Normal FPS', '16.1302', '75.5783', '135.91', 'FPS_6992c1ababa', '1', '0', 'Badami', '6'),
('Bagalkote', 'PKPS Halakurki', 'FPS27', 'Normal FPS', '16.0047', '75.644', '188.14', 'FPS_6992c1abbc8', '1', '0', 'Badami', '6'),
('Bagalkote', 'V.S.S.HULAGERI', 'FPS28', 'Normal FPS', '16.0864', '75.5823', '96.27', 'FPS_6992c1abc6a', '1', '0', 'Badami', '6'),
('Bagalkote', 'BASAVESHWARA YUVAKA MANDAL JALAGERI', 'FPS29', 'Normal FPS', '16.1058', '75.5448', '108.05', 'FPS_6992c1abd04', '1', '0', 'Badami', '6'),
('Bagalkote', 'Manjunatha Shivappa Rathod (PH)', 'FPS30', 'Normal FPS', '16.0932', '75.5269', '100.09', 'FPS_6992c1abed4', '1', '0', 'Badami', '6'),
('Bagalkote', 'Secretory Neeralkeri Milk producers Co-Op Society Ltd.', 'FPS31', 'Normal FPS', '15.9757', '75.4575', '153.9', 'FPS_6992c1ac015', '1', '0', 'Badami', '6'),
('Bagalkote', 'P.K.P.S.MUSTIGERI.', 'FPS32', 'Normal FPS', '15.9606', '75.57', '167.94', 'FPS_6992c1ac0ae', '1', '0', 'Akki', '6'),
('Bagalkote', 'MARUTI YUVAKA MANDALA HULLIKERI INAM', 'FPS33', 'Normal FPS', '15.9956', '75.6029', '126.78', 'FPS_6992c1ac15a', '1', '0', 'Akki', '6'),
('Bagalkote', 'YOUTH ASSOCIATION MUMARADDIKOPPA', 'FPS34', 'Normal FPS', '15.8392', '75.63', '22.95', 'FPS_6992c1ac1fc', '1', '0', 'Akki', '6'),
('Bagalkote', 'P.K.P.S. UGLVAT', 'FPS35', 'Normal FPS', '15.9708', '75.5406', '225.63', 'FPS_6992c1ac2a0', '1', '0', 'Akki', '6'),
('Bagalkote', 'PURNANANDA YUVAKA MANDAL KALLAPUR.S.K.', 'FPS36', 'Normal FPS', '15.9401', '75.504', '68.95', 'FPS_6992c1ac342', '1', '0', 'Akki', '6'),
('Bagalkote', 'KALIKADEVI YUVAK MANDALA TAPPASAKATTI', 'FPS37', 'Normal FPS', '15.9447', '75.4901', '59.89', 'FPS_6992c1ac3e7', '1', '0', 'Akki', '6'),
('Bagalkote', 'MARUTI YUVAKA MANDAL HANAMASAGAR', 'FPS38', 'Normal FPS', '15.9344', '75.5267', '49.27', 'FPS_6992c1ac488', '1', '0', 'Akki', '6'),
('Bagalkote', 'PURNANAND YUVAKA MANDAL SOMANAKOPPA', 'FPS39', 'Normal FPS', '15.9167', '75.5236', '73.9', 'FPS_6992c1ac52b', '1', '0', 'Akki', '6'),
('Bagalkote', 'L.B. NAYAKAR KHANAPUR S,K.', 'FPS40', 'Normal FPS', '15.9087', '75.5007', '225.69', 'FPS_6992c1ac5cd', '1', '0', 'Akki', '6'),
('Bagalkote', 'V.S.S. KAKANUR', 'FPS41', 'Normal FPS', '15.9398', '75.4307', '130.68', 'FPS_6992c1ac671', '1', '0', 'Akki', '6'),
('Bagalkote', 'GRAMA MANDALA CHIMMANAKATTI', 'FPS42', 'Normal FPS', '15.9174', '75.4708', '122.78', 'FPS_6992c1ac776', '1', '0', 'Akki', '6'),
('Bagalkote', 'NEERU BALAKEDARAR SAHAKARI SANGHA HAGANUR', 'FPS43', 'Normal FPS', '15.8973', '75.4433', '86.3', 'FPS_6992c1ac817', '1', '0', 'Akki', '6'),
('Bagalkote', 'V.S.S. TALAKAWAD', 'FPS44', 'Normal FPS', '15.8853', '75.4733', '35.25', 'FPS_6992c1acd75', '1', '0', 'Akki', '6'),
('Bagalkote', 'GRAM MANDAL NEELGUND', 'FPS45', 'Normal FPS', '15.9242', '75.5473', '201.29', 'FPS_6992c1ad5bd', '1', '0', 'Akki', '6'),
('Bagalkote', 'GRAM MANDAL LAKHAMAPUR', 'FPS46', 'Normal FPS', '15.8642', '75.6216', '76.56', 'FPS_6992c1ade6c', '1', '0', 'Akki', '6'),
('Bagalkote', 'IRAPP. K.BIRANUR BIRANUR', 'FPS47', 'Normal FPS', '15.8789', '75.4792', '46.47', 'FPS_6992c1ae78e', '1', '0', 'Akki', '6'),
('Bagalkote', 'MARUTESHWAR YUVAKA MANDAL ALUR S.K.', 'FPS48', 'Normal FPS', '15.8901', '75.471', '68.87', 'FPS_6992c1af237', '1', '0', 'Akki', '6'),
('Bagalkote', 'BASAVESHWAR YUVAK MANDAL TIMMAPUR S.N.', 'FPS49', 'Normal FPS', '15.9013', '75.5511', '51.33', 'FPS_6992c1af7ea', '1', '0', 'Akki', '6'),
('Bagalkote', 'VEERABHADHRESHWARA Y M MALLAPUR S.L.', 'FPS50', 'Normal FPS', '15.8641', '75.6394', '51.53', 'FPS_6992c1b011a', '1', '0', 'Akki', '6'),
('Bagalkote', 'Kalasa (Govonakopp) Milk producers Co op Society', 'FPS51', 'Normal FPS', '15.8723', '75.4985', '121.04', 'FPS_6992c1b0a5a', '1', '0', 'Akki', '6'),
('Bagalkote', 'YUVAKA MANDAL ALADAKATTI', 'FPS52', 'Normal FPS', '15.904', '75.5788', '48.69', 'FPS_6992c1b12f9', '1', '0', 'Akki', '6'),
('Bagalkote', 'PKPS Hebballi', 'FPS53', 'Normal FPS', '15.8388', '75.6129', '163.67', 'FPS_6992c1b1b68', '1', '0', 'Akki', '6'),
('Bagalkote', 'V.S.S. MUTTALAGERI', 'FPS54', 'Normal FPS', '15.893', '75.6166', '251.17', 'FPS_6992c1b1c01', '1', '0', 'Banglo', '6'),
('Bagalkote', 'MARUTESHWAR TARUN SANGHA NAVILAHOLE.', 'FPS55', 'Normal FPS', '15.8917', '75.7414', '36.73', 'FPS_6992c1b1ca3', '1', '0', 'Banglo', '6'),
('Bagalkote', 'BASAVALINGESHWAR Y M BACHINAGUDDA.', 'FPS56', 'Normal FPS', '15.9478', '75.7947', '87.05', 'FPS_6992c1b1d4f', '1', '0', 'Banglo', '6'),
('Bagalkote', 'GRAM MANDAL GONAL', 'FPS57', 'Normal FPS', '15.9355', '75.7887', '48.58', 'FPS_6992c1b1df2', '1', '0', 'Banglo', '6'),
('Bagalkote', 'V.S.S.CHOLACHAGUDDA', 'FPS58', 'Normal FPS', '15.8725', '75.719', '217.57', 'FPS_6992c1b1e74', '1', '0', 'Banglo', '6'),
('Bagalkote', 'BANASHANKARI DEVASTHANA SEVA SAMITI BANASHANKARI.', 'FPS59', 'Normal FPS', '15.8876', '75.7049', '51.38', 'FPS_6992c1b1f16', '1', '0', 'Banglo', '6'),
('Bagalkote', 'REVANASHIDDESHWAR YUVAKA SANGHA HIRENASIBI', 'FPS60', 'Normal FPS', '15.8748', '75.7291', '86.69', 'FPS_6992c1b2078', '1', '0', 'Banglo', '6'),
('Bagalkote', 'AMBEDAKAR VIDYA VARDHAKA SANGHA BELUR', 'FPS61', 'Normal FPS', '15.8472', '75.7548', '94.69', 'FPS_6992c1b21f6', '1', '0', 'Banglo', '6'),
('Bagalkote', 'V.S.S.JALIHAL', 'FPS62', 'Normal FPS', '15.8423', '75.7596', '254.64', 'FPS_6992c1b22ab', '1', '0', 'Banglo', '6'),
('Bagalkote', 'Halu Utpadakara sahakari sangha,Pattadakal', 'FPS63', 'Normal FPS', '15.9489', '75.8136', '135.76', 'FPS_6992c1b2341', '1', '0', 'Banglo', '6'),
('Bagalkote', 'GRAM MANDAL ADAGAL.', 'FPS64', 'Normal FPS', '15.9537', '75.6736', '213.36', 'FPS_6992c1b23e5', '1', '0', 'Banglo', '6'),
('Bagalkote', 'V.S.S.KUTAKANAKERI', 'FPS65', 'Normal FPS', '15.9827', '75.6979', '167.34', 'FPS_6992c1b2487', '1', '0', 'Banglo', '6');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `uid` varchar(100) NOT NULL,
  `verified` varchar(10) NOT NULL DEFAULT '0',
  `role` varchar(255) NOT NULL DEFAULT 'admin',
  `token` varchar(255) NOT NULL,
  `lastlogin` varchar(255) NOT NULL,
  `count` int(11) NOT NULL DEFAULT 0,
  `permission` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`username`, `password`, `uid`, `verified`, `role`, `token`, `lastlogin`, `count`, `permission`) VALUES
('admin@pds', '$2y$10$xu1T44dFbk3kI./bXIVVuO.SfFpzlxwJc0JoVdfmjAronT5.WNyUy', '662ca1eccc195', '1', 'admin', '2f295752ab0b55dcf654066552fcf1ee', '2026-08-04 15:57:06', 126, ''),
('Bagalkote@pds', '$2y$10$9pRWb5cpZYDgFMiRuPR7kOMXqp1mi.Uag/7dgEIMXzVTRakcP/7E.', '67b617a1a9aa7', '1', 'bagalkote', '75bf09ed1fd7cc6f3e99b89a21906dce', '2026-07-31 19:04:13', 10, ''),
('Ballari@pds', '$2y$10$3obNkJ2tJf7Q4mDBQ9iNye7LQCsqwNgnOLw2qs91k6EGbrRIFRgAm', '67b617e3273c2', '1', 'ballari', 'a959bd6a21394ef538484a59a5d352b5', '2025-02-25 12:08:22', 1, ''),
('Bangalore@pds', '$2y$10$HbbIhFXxNdSKUInZOnes3O3dE0BVG4dJDrXc9URdKROScJgKIfOsi', '67b6187148c75', '1', 'bangalore', '', '', 0, ''),
('Belagavi@pds', '$2y$10$SLVWPlrjo6RP0Fft4SrMoupFl7VW2tzIVIAdKpEgvtv8rUWlaVQsW', '67b6189392fee', '1', 'belagavi', '7f72c2419dd89fd507f058b8d6041f4f', '2025-02-20 00:29:43', 1, ''),
('Bengaluru Rural@pds', '$2y$10$3rvTGb0Qfw2k9VLHFeTC6ufD8s3V2TQJEt7CNwk8WXFraVKsLuOIW', '67b61a807bc43', '1', 'bengaluru rural', '', '', 0, ''),
('Bidar@pds', '$2y$10$2yKQ2MIkgF/gr2uCaEfwgeiQJ9DXmQIPkufd9sfQyDy.ei.uOrrPy', '67b61cea0de7c', '1', 'bidar', '', '', 0, ''),
('Chamarajanagara@pds', '$2y$10$lhjxx0hknjEM3dlO56Jn6.ij.q8sfBsWVShtbCte5Kwe4qEi84Cbq', '67b61d01d1637', '1', 'chamarajanagara', '', '', 0, ''),
('Chikkaballapura@pds', '$2y$10$9v.Y.guxMlEl3GVzhFFjmO6EEJyoLyMQoUH2jvmCHCB0saEX3x0AG', '67b61d1aa1a7b', '1', 'chamarajanagara', '', '', 0, ''),
('Chikkamagaluru@pds', '$2y$10$JVXXdWaJc/C.5JtVpSAHF.MpNgc0QbgHiF/aNaVa3FHF8WeM0DbXG', '67b61f02eef3a', '1', 'chikkamagaluru', '', '', 0, ''),
('Chitradurga@pds', '$2y$10$WCHcW4IvXCQZk/iqKZd5MO/8AeTh2UPACpVzs5wEKb7t3bG30R4CG', '67b624e85aac8', '1', 'chitradurga', '', '', 0, ''),
('Dakshina Kannada@pds', '$2y$10$V/0me54ugIAZwlviplJHL.l7jNUl6nNfI/eM/r5OINfeF7RBx77Ba', '67b62511b2627', '1', 'dakshina kannada', '', '', 0, ''),
('Davanagere@pds', '$2y$10$mti.bOoJ2meevidZ7Lm68.wj4bgb/F53F8S5D3MEG/rT6mpi13HVe', '67b625d4e1ae2', '1', 'davanagere', '', '', 0, ''),
('Dharwad@pds', '$2y$10$7FaHsUDhkrA.G9cYW5lwO.SXkCPrmQvS8yDdvVeoZu4oWJM47gY3O', '67b6267b95d24', '1', 'dharwad', '', '', 0, ''),
('Gadag@pds', '$2y$10$UdInawZYEmIOkpxMahF9M.Xp7.WMpD6tos2zLgKq0tlJ2J3V5FcUO', '67b62778b028d', '1', 'gadag', '', '', 0, ''),
('Hassan@pds', '$2y$10$fRhneaORauUvlQUJLEYrxOPbmKEbZIXeII8BKmQcsakZBSGQI9FyO', '67b6278f5ef4e', '1', 'hassan', '', '', 0, ''),
('Haveri@pds', '$2y$10$uoKhxchvMojdmKcmNbApuuzFvVEURVBuBPjBNR7GtdiBH0wXuBp5i', '67b627ae2286d', '1', 'haveri', '', '', 0, ''),
('Kalaburagi@pds', '$2y$10$ekSBPodZggY.SyD9ShsQYeR2YSQNzdgZO5kGla/IY527RMvE8zqTW', '67b627cfb7538', '1', 'kalaburagi', '', '', 0, ''),
('Kodagu@pds', '$2y$10$tweM8ETVk6HV3HB1zq3VoekFta0TuXsRZ5tUs9lHoxUsgd0GyDqqC', '67b6280deec03', '1', 'kodagu', '', '', 0, ''),
('Kolar@pds', '$2y$10$VYzzDKkKNadxHFaFmKI42u8PydzGJ9Oh6FtlYYLjCj8Fc.9Pt1Y1S', '67b6282a31fef', '1', 'kolar', '', '', 0, ''),
('Koppal@pds', '$2y$10$ClG0xopkJyzAuiczoxVKV.GiEJ/y3/qDXmHH4LfCehZMxgu6l03XK', '67b62841ab950', '1', 'koppal', '', '', 0, ''),
('Mandya@pds', '$2y$10$..HcZXSGXCOHk/fx/ba.X.ihjwfWiHx5d4tLW6qKyWrz75.hCcc2m', '67b6285914c0c', '1', 'mandya', '', '', 0, ''),
('Mysuru@pds', '$2y$10$U0TiU.QKdsa7ZRGiPfOtxOtMpZSxz6/5BXzYEUj4nYmvJRjWC4bdm', '67b62871b0216', '1', 'mysuru', '', '', 0, ''),
('Raichur@pds', '$2y$10$aSsz1hG360RfkK3wh0ipTeGp/GNpUe6asxMhwn./15kvC6/ffEdIS', '67b628965c0f1', '1', 'raichur', '', '', 0, ''),
('Ramanagara@pds', '$2y$10$A5f/UZKDJKFgNjT/TlVVMuQwwGsBRI70MQUILldL8DbNS28JGxo/O', '67b628b0287f2', '1', 'ramanagara', '', '', 0, ''),
('Shivamogga@pds', '$2y$10$ks4Q8wYWNdMuDzcMMuHnJ.zKI94yrbp1xdwZMMO851/NGV1IvJ8I2', '67b62934ea0fd', '1', 'shivamogga', '', '', 0, ''),
('Tumakuru@pds', '$2y$10$YxUKnioUkMYCfVbKxVDaIe1sJzZL6CITEhmXw0sfVXYBqDUy9CjQO', '67b629526ccb9', '1', 'tumakuru', '', '', 0, ''),
('Udupi@pds', '$2y$10$rgimOsh8vvaGlFkX0Ob0/On4xHPIG6ctxf1xjh5X1YYs0MyZSxBla', '67b6296a9fb2b', '1', 'udupi', '', '', 0, ''),
('Uttara Kannada@pds', '$2y$10$Cm76wQB8NgOZr0hbw6q25.IjKyNI.f5biD1x7wDcVD0pSIRYswly2', '67b629890163a', '1', 'uttara kannada', '', '', 0, ''),
('Vijayanagar@pds', '$2y$10$vQoYXsR8xxJBBkeTSOvyhuPa1.CHIwyXVFPOaITBAK9ZS2g5M4aUC', '67b629b45114f', '1', 'vijayanagar', '', '', 0, ''),
('Vijayapura@pds', '$2y$10$kF09.D3dxb.EBBR2n/Qsveni/cwFBKV6WjG.Np1o4CTIzFjtUHjWi', '67b629cbdfee7', '1', 'vijayapura', '', '', 0, ''),
('Yadgir@pds', '$2y$10$rQYEjqcWOflrYeNPIggDMedOLX80CE/Z.s1EmGGfVQzOudK6REQJq', '67b629e39b1ca', '1', 'yadgir', '', '', 0, ''),
('fci@pds', '$2y$10$/Av8O/2A9PUzoZdgQUODXeqXCbtI2gVkQSIqM/XfBq9QvI95rmamS', '693bb8a77449c', '1', 'fci', 'bf999250cfefc5b1e8748bbe97c43481', '2026-02-18 14:14:53', 24, ''),
('admin', '$2y$10$dMTvWtX0.Q47fK3RQqsLkeF9SpKVYFzZE955Fxj4X6rRHk9Er2Ta6', '6a6caca7608d4', '1', 'fci', 'f3756dead49e3c255eed69653d7139b6', '2026-07-31 19:43:13', 1, ''),
('dfpd@pds2', '$2y$10$uq7FSRYEGfbjdfqCXJTjCuAWoq02yyUxFPIGp3XiX1Nci7PebCV6a', '6a7185afa2e82', '1', 'dfpd', '2d1b9889b313ed07cb5f75932875f36c', '2026-08-04 15:57:35', 2, ''),
('fci@pds2', '$2y$10$.UP5ncFzwkadFvm3X7aXBuQ7XL1zfGnBc02o0JhTWU0craNCcOqw6', '6a718b8ee1a64', '1', 'fci', '13732620f5afb076a85b3559513b155c', '2026-08-04 15:59:51', 2, '');

-- --------------------------------------------------------

--
-- Table structure for table `optimiseddata_epjk7mviqvof9z`
--

CREATE TABLE `optimiseddata_epjk7mviqvof9z` (
  `scenario` varchar(150) NOT NULL,
  `from` varchar(150) NOT NULL,
  `from_state` varchar(150) NOT NULL,
  `from_id` varchar(150) NOT NULL,
  `from_name` varchar(150) NOT NULL,
  `from_district` varchar(150) NOT NULL,
  `from_block` varchar(150) NOT NULL,
  `from_lat` varchar(150) NOT NULL,
  `from_long` varchar(150) NOT NULL,
  `to` varchar(150) NOT NULL,
  `to_state` varchar(150) NOT NULL,
  `to_id` varchar(150) NOT NULL,
  `to_name` varchar(150) NOT NULL,
  `to_district` varchar(150) NOT NULL,
  `to_block` varchar(150) NOT NULL,
  `to_lat` varchar(150) NOT NULL,
  `to_long` varchar(150) NOT NULL,
  `commodity` varchar(150) NOT NULL,
  `quantity` varchar(150) NOT NULL,
  `distance` varchar(150) NOT NULL,
  `approve_admin` varchar(100) DEFAULT NULL,
  `approve_district` varchar(100) DEFAULT NULL,
  `new_id_admin` varchar(100) DEFAULT NULL,
  `new_id_district` varchar(100) DEFAULT NULL,
  `new_name_admin` varchar(100) DEFAULT NULL,
  `new_name_district` varchar(10) DEFAULT NULL,
  `reason_admin` varchar(255) DEFAULT NULL,
  `reason_district` varchar(255) DEFAULT NULL,
  `new_distance_admin` varchar(100) DEFAULT NULL,
  `new_distance_district` varchar(100) DEFAULT NULL,
  `district_change_approve` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `optimiseddata_epjk7mviqvof9z`
--

INSERT INTO `optimiseddata_epjk7mviqvof9z` (`scenario`, `from`, `from_state`, `from_id`, `from_name`, `from_district`, `from_block`, `from_lat`, `from_long`, `to`, `to_state`, `to_id`, `to_name`, `to_district`, `to_block`, `to_lat`, `to_long`, `commodity`, `quantity`, `distance`, `approve_admin`, `approve_district`, `new_id_admin`, `new_id_district`, `new_name_admin`, `new_name_district`, `reason_admin`, `reason_district`, `new_distance_admin`, `new_distance_district`, `district_change_approve`, `status`) VALUES
('Optimized', 'Depot', 'Karnataka', '123', 'Array', 'Bagalkote', 'Akki', '27.89', '78.4', 'FPS', 'Karnataka', 'FPS2', 'MAHAKUTESHWAR YUVAKA MANDAL YANKANCHI', 'Bagalkote', 'Akki', '16.0227', '75.6052', 'FRice', '75.34', '1691.1721', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Optimized', 'Depot', 'Karnataka', '123', 'Array', 'Bagalkote', 'Akki', '27.89', '78.4', 'FPS', 'Karnataka', 'FPS4', 'L.B. NAIKAR. KHANAPUR.S.K. 68 (C)(RADDERTIMMAPUR)', 'Bagalkote', 'Akki', '15.9938', '75.452', 'FRice', '110.89', '1697.5976', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Optimized', 'Depot', 'Karnataka', '123', 'Array', 'Bagalkote', 'Akki', '27.89', '78.4', 'FPS', 'Karnataka', 'FPS8', 'YUVAKA MANDAL CHINCHALAKATTI', 'Bagalkote', 'Akki', '16.023', '75.4657', 'FRice', '58.13', '1694.0386', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Optimized', 'Depot', 'Karnataka', '260017370006', 'Kk', 'Bagalkote', 'Badami', '27.89', '78.4', 'FPS', 'Karnataka', 'FPS5', 'YUVAKA MANDAL HAVALAKOD', 'Bagalkote', 'Akki', '16.0257', '75.4523', 'FRice', '55.51', '1697.0919', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Optimized', 'Depot', 'Karnataka', '260017370006', 'Kk', 'Bagalkote', 'Badami', '27.89', '78.4', 'FPS', 'Karnataka', 'FPS9', 'K.K.LAMANI CHINCHALAKATTI L.T.', 'Bagalkote', 'Akki', '16.0242', '75.4815', 'FRice', '38.08', '1692.1932', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Optimized', 'Depot', 'Karnataka', '26001737000', 'Kk', 'Bagalkote', 'Akki', '27.89', '78.4', 'FPS', 'Karnataka', '4', 'Yavatmal Yass', 'Bagalkote', 'Akki', '16.0238', '75.6052', 'FRice', '677.0', '1691.2111', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Optimized', 'Depot', 'Karnataka', '26001737000', 'Kk', 'Bagalkote', 'Akki', '27.89', '78.4', 'FPS', 'Karnataka', 'FPS1', 'Gram Mandal Maninagar', 'Bagalkote', 'Akki', '16.0238', '75.6052', 'FRice', '46.46', '1691.2111', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Optimized', 'Depot', 'Karnataka', '26001737000', 'Kk', 'Bagalkote', 'Akki', '27.89', '78.4', 'FPS', 'Karnataka', 'FPS6', 'MARUTI YUVAKA MANDAL FAKIRBUDIHAL', 'Bagalkote', 'Akki', '16.0502', '75.4754', 'FRice', '37.54', '1697.2908', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Optimized', 'Depot', 'Karnataka', '26001737000', 'Kk', 'Bagalkote', 'Akki', '27.89', '78.4', 'FPS', 'Karnataka', 'FPS7', 'YUVAKA MANDAL SAGANUR', 'Bagalkote', 'Akki', '16.0437', '75.474', 'FRice', '27.24', '1696.592', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Optimized', 'Depot', 'Karnataka', '26001737000', 'Kk', 'Bagalkote', 'Akki', '27.89', '78.4', 'FPS', 'Karnataka', '4', 'Yavatmal Yass', 'Bagalkote', 'Akki', '16.0238', '75.6052', 'Rice', '90.0', '1691.2111', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Optimized', 'Depot', 'Karnataka', '123', 'Array', 'Bagalkote', 'Akki', '27.89', '78.4', 'FPS', 'Karnataka', '4', 'Yavatmal Yass', 'Bagalkote', 'Akki', '16.0238', '75.6052', 'Millets', '90.0', '1691.2111', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Optimized', 'Depot', 'Karnataka', '123', 'Array', 'Bagalkote', 'Akki', '27.89', '78.4', 'FPS', 'Karnataka', 'FPS1', 'Gram Mandal Maninagar', 'Bagalkote', 'Akki', '16.0238', '75.6052', 'Millets', '1111.0', '1691.2111', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Optimized', 'Depot', 'Karnataka', '123', 'Array', 'Bagalkote', 'Akki', '27.89', '78.4', 'FPS', 'Karnataka', 'FPS2', 'MAHAKUTESHWAR YUVAKA MANDAL YANKANCHI', 'Bagalkote', 'Akki', '16.0227', '75.6052', 'Millets', '1111.0', '1691.1721', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Optimized', 'Depot', 'Karnataka', '123', 'Array', 'Bagalkote', 'Akki', '27.89', '78.4', 'FPS', 'Karnataka', 'FPS4', 'L.B. NAIKAR. KHANAPUR.S.K. 68 (C)(RADDERTIMMAPUR)', 'Bagalkote', 'Akki', '15.9938', '75.452', 'Millets', '1111.0', '1697.5976', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Optimized', 'Depot', 'Karnataka', '123', 'Array', 'Bagalkote', 'Akki', '27.89', '78.4', 'FPS', 'Karnataka', 'FPS5', 'YUVAKA MANDAL HAVALAKOD', 'Bagalkote', 'Akki', '16.0257', '75.4523', 'Millets', '1111.0', '1697.0919', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Optimized', 'Depot', 'Karnataka', '123', 'Array', 'Bagalkote', 'Akki', '27.89', '78.4', 'FPS', 'Karnataka', 'FPS6', 'MARUTI YUVAKA MANDAL FAKIRBUDIHAL', 'Bagalkote', 'Akki', '16.0502', '75.4754', 'Millets', '1111.0', '1697.2908', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Optimized', 'Depot', 'Karnataka', '123', 'Array', 'Bagalkote', 'Akki', '27.89', '78.4', 'FPS', 'Karnataka', 'FPS7', 'YUVAKA MANDAL SAGANUR', 'Bagalkote', 'Akki', '16.0437', '75.474', 'Millets', '1111.0', '1696.592', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Optimized', 'Depot', 'Karnataka', '123', 'Array', 'Bagalkote', 'Akki', '27.89', '78.4', 'FPS', 'Karnataka', 'FPS8', 'YUVAKA MANDAL CHINCHALAKATTI', 'Bagalkote', 'Akki', '16.023', '75.4657', 'Millets', '1111.0', '1694.0386', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Optimized', 'Depot', 'Karnataka', '123', 'Array', 'Bagalkote', 'Akki', '27.89', '78.4', 'FPS', 'Karnataka', 'FPS9', 'K.K.LAMANI CHINCHALAKATTI L.T.', 'Bagalkote', 'Akki', '16.0242', '75.4815', 'Millets', '1111.0', '1692.1932', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Optimized', 'Depot', 'Karnataka', '123', 'Array', 'Bagalkote', 'Akki', '27.89', '78.4', 'FPS', 'Karnataka', '4', 'Yavatmal Yass', 'Bagalkote', 'Akki', '16.0238', '75.6052', 'Jowar', '500.0', '1691.2111', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Optimized', 'Depot', 'Karnataka', '123', 'Array', 'Bagalkote', 'Akki', '27.89', '78.4', 'FPS', 'Karnataka', 'FPS1', 'Gram Mandal Maninagar', 'Bagalkote', 'Akki', '16.0238', '75.6052', 'Jowar', '500.0', '1691.2111', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Optimized', 'Depot', 'Karnataka', '123', 'Array', 'Bagalkote', 'Akki', '27.89', '78.4', 'FPS', 'Karnataka', 'FPS2', 'MAHAKUTESHWAR YUVAKA MANDAL YANKANCHI', 'Bagalkote', 'Akki', '16.0227', '75.6052', 'Jowar', '500.0', '1691.1721', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Optimized', 'Depot', 'Karnataka', '123', 'Array', 'Bagalkote', 'Akki', '27.89', '78.4', 'FPS', 'Karnataka', 'FPS4', 'L.B. NAIKAR. KHANAPUR.S.K. 68 (C)(RADDERTIMMAPUR)', 'Bagalkote', 'Akki', '15.9938', '75.452', 'Jowar', '500.0', '1697.5976', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Optimized', 'Depot', 'Karnataka', '123', 'Array', 'Bagalkote', 'Akki', '27.89', '78.4', 'FPS', 'Karnataka', 'FPS5', 'YUVAKA MANDAL HAVALAKOD', 'Bagalkote', 'Akki', '16.0257', '75.4523', 'Jowar', '500.0', '1697.0919', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Optimized', 'Depot', 'Karnataka', '123', 'Array', 'Bagalkote', 'Akki', '27.89', '78.4', 'FPS', 'Karnataka', 'FPS6', 'MARUTI YUVAKA MANDAL FAKIRBUDIHAL', 'Bagalkote', 'Akki', '16.0502', '75.4754', 'Jowar', '500.0', '1697.2908', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Optimized', 'Depot', 'Karnataka', '123', 'Array', 'Bagalkote', 'Akki', '27.89', '78.4', 'FPS', 'Karnataka', 'FPS7', 'YUVAKA MANDAL SAGANUR', 'Bagalkote', 'Akki', '16.0437', '75.474', 'Jowar', '500.0', '1696.592', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Optimized', 'Depot', 'Karnataka', '123', 'Array', 'Bagalkote', 'Akki', '27.89', '78.4', 'FPS', 'Karnataka', 'FPS8', 'YUVAKA MANDAL CHINCHALAKATTI', 'Bagalkote', 'Akki', '16.023', '75.4657', 'Jowar', '500.0', '1694.0386', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Optimized', 'Depot', 'Karnataka', '123', 'Array', 'Bagalkote', 'Akki', '27.89', '78.4', 'FPS', 'Karnataka', 'FPS9', 'K.K.LAMANI CHINCHALAKATTI L.T.', 'Bagalkote', 'Akki', '16.0242', '75.4815', 'Jowar', '500.0', '1692.1932', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `optimiseddata_fmnn8paovarufq`
--

CREATE TABLE `optimiseddata_fmnn8paovarufq` (
  `scenario` varchar(150) NOT NULL,
  `from` varchar(150) NOT NULL,
  `from_state` varchar(150) NOT NULL,
  `from_id` varchar(150) NOT NULL,
  `from_name` varchar(150) NOT NULL,
  `from_district` varchar(150) NOT NULL,
  `from_block` varchar(150) NOT NULL,
  `from_lat` varchar(150) NOT NULL,
  `from_long` varchar(150) NOT NULL,
  `to` varchar(150) NOT NULL,
  `to_state` varchar(150) NOT NULL,
  `to_id` varchar(150) NOT NULL,
  `to_name` varchar(150) NOT NULL,
  `to_district` varchar(150) NOT NULL,
  `to_block` varchar(150) NOT NULL,
  `to_lat` varchar(150) NOT NULL,
  `to_long` varchar(150) NOT NULL,
  `commodity` varchar(150) NOT NULL,
  `quantity` varchar(150) NOT NULL,
  `distance` varchar(150) NOT NULL,
  `approve_admin` varchar(100) DEFAULT NULL,
  `approve_district` varchar(100) DEFAULT NULL,
  `new_id_admin` varchar(100) DEFAULT NULL,
  `new_id_district` varchar(100) DEFAULT NULL,
  `new_name_admin` varchar(100) DEFAULT NULL,
  `new_name_district` varchar(10) DEFAULT NULL,
  `reason_admin` varchar(255) DEFAULT NULL,
  `reason_district` varchar(255) DEFAULT NULL,
  `new_distance_admin` varchar(100) DEFAULT NULL,
  `new_distance_district` varchar(100) DEFAULT NULL,
  `district_change_approve` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `optimiseddata_fmnn8paovarufq`
--

INSERT INTO `optimiseddata_fmnn8paovarufq` (`scenario`, `from`, `from_state`, `from_id`, `from_name`, `from_district`, `from_block`, `from_lat`, `from_long`, `to`, `to_state`, `to_id`, `to_name`, `to_district`, `to_block`, `to_lat`, `to_long`, `commodity`, `quantity`, `distance`, `approve_admin`, `approve_district`, `new_id_admin`, `new_id_district`, `new_name_admin`, `new_name_district`, `reason_admin`, `reason_district`, `new_distance_admin`, `new_distance_district`, `district_change_approve`, `status`) VALUES
('Optimized', 'Depot', 'Karnataka', '123', 'Array', 'Bagalkote', 'Akki', '27.89', '78.4', 'FPS', 'Karnataka', 'FPS2', 'MAHAKUTESHWAR YUVAKA MANDAL YANKANCHI', 'Bagalkote', 'Akki', '16.0227', '75.6052', 'FRice', '75.34', '1691.1721', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Optimized', 'Depot', 'Karnataka', '123', 'Array', 'Bagalkote', 'Akki', '27.89', '78.4', 'FPS', 'Karnataka', 'FPS4', 'L.B. NAIKAR. KHANAPUR.S.K. 68 (C)(RADDERTIMMAPUR)', 'Bagalkote', 'Akki', '15.9938', '75.452', 'FRice', '110.89', '1697.5976', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Optimized', 'Depot', 'Karnataka', '123', 'Array', 'Bagalkote', 'Akki', '27.89', '78.4', 'FPS', 'Karnataka', 'FPS8', 'YUVAKA MANDAL CHINCHALAKATTI', 'Bagalkote', 'Akki', '16.023', '75.4657', 'FRice', '58.13', '1694.0386', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Optimized', 'Depot', 'Karnataka', '260017370006', 'Kk', 'Bagalkote', 'Badami', '27.89', '78.4', 'FPS', 'Karnataka', 'FPS5', 'YUVAKA MANDAL HAVALAKOD', 'Bagalkote', 'Akki', '16.0257', '75.4523', 'FRice', '55.51', '1697.0919', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Optimized', 'Depot', 'Karnataka', '260017370006', 'Kk', 'Bagalkote', 'Badami', '27.89', '78.4', 'FPS', 'Karnataka', 'FPS9', 'K.K.LAMANI CHINCHALAKATTI L.T.', 'Bagalkote', 'Akki', '16.0242', '75.4815', 'FRice', '38.08', '1692.1932', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Optimized', 'Depot', 'Karnataka', '26001737000', 'Kk', 'Bagalkote', 'Akki', '27.89', '78.4', 'FPS', 'Karnataka', '4', 'Yavatmal Yass', 'Bagalkote', 'Akki', '16.0238', '75.6052', 'FRice', '677.0', '1691.2111', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Optimized', 'Depot', 'Karnataka', '26001737000', 'Kk', 'Bagalkote', 'Akki', '27.89', '78.4', 'FPS', 'Karnataka', 'FPS1', 'Gram Mandal Maninagar', 'Bagalkote', 'Akki', '16.0238', '75.6052', 'FRice', '46.46', '1691.2111', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Optimized', 'Depot', 'Karnataka', '26001737000', 'Kk', 'Bagalkote', 'Akki', '27.89', '78.4', 'FPS', 'Karnataka', 'FPS6', 'MARUTI YUVAKA MANDAL FAKIRBUDIHAL', 'Bagalkote', 'Akki', '16.0502', '75.4754', 'FRice', '37.54', '1697.2908', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Optimized', 'Depot', 'Karnataka', '26001737000', 'Kk', 'Bagalkote', 'Akki', '27.89', '78.4', 'FPS', 'Karnataka', 'FPS7', 'YUVAKA MANDAL SAGANUR', 'Bagalkote', 'Akki', '16.0437', '75.474', 'FRice', '27.24', '1696.592', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Optimized', 'Depot', 'Karnataka', '26001737000', 'Kk', 'Bagalkote', 'Akki', '27.89', '78.4', 'FPS', 'Karnataka', '4', 'Yavatmal Yass', 'Bagalkote', 'Akki', '16.0238', '75.6052', 'Rice', '90.0', '1691.2111', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Optimized', 'Depot', 'Karnataka', '123', 'Array', 'Bagalkote', 'Akki', '27.89', '78.4', 'FPS', 'Karnataka', '4', 'Yavatmal Yass', 'Bagalkote', 'Akki', '16.0238', '75.6052', 'Millets', '90.0', '1691.2111', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Optimized', 'Depot', 'Karnataka', '123', 'Array', 'Bagalkote', 'Akki', '27.89', '78.4', 'FPS', 'Karnataka', 'FPS1', 'Gram Mandal Maninagar', 'Bagalkote', 'Akki', '16.0238', '75.6052', 'Millets', '1111.0', '1691.2111', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Optimized', 'Depot', 'Karnataka', '123', 'Array', 'Bagalkote', 'Akki', '27.89', '78.4', 'FPS', 'Karnataka', 'FPS2', 'MAHAKUTESHWAR YUVAKA MANDAL YANKANCHI', 'Bagalkote', 'Akki', '16.0227', '75.6052', 'Millets', '1111.0', '1691.1721', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Optimized', 'Depot', 'Karnataka', '123', 'Array', 'Bagalkote', 'Akki', '27.89', '78.4', 'FPS', 'Karnataka', 'FPS4', 'L.B. NAIKAR. KHANAPUR.S.K. 68 (C)(RADDERTIMMAPUR)', 'Bagalkote', 'Akki', '15.9938', '75.452', 'Millets', '1111.0', '1697.5976', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Optimized', 'Depot', 'Karnataka', '123', 'Array', 'Bagalkote', 'Akki', '27.89', '78.4', 'FPS', 'Karnataka', 'FPS5', 'YUVAKA MANDAL HAVALAKOD', 'Bagalkote', 'Akki', '16.0257', '75.4523', 'Millets', '1111.0', '1697.0919', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Optimized', 'Depot', 'Karnataka', '123', 'Array', 'Bagalkote', 'Akki', '27.89', '78.4', 'FPS', 'Karnataka', 'FPS6', 'MARUTI YUVAKA MANDAL FAKIRBUDIHAL', 'Bagalkote', 'Akki', '16.0502', '75.4754', 'Millets', '1111.0', '1697.2908', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Optimized', 'Depot', 'Karnataka', '123', 'Array', 'Bagalkote', 'Akki', '27.89', '78.4', 'FPS', 'Karnataka', 'FPS7', 'YUVAKA MANDAL SAGANUR', 'Bagalkote', 'Akki', '16.0437', '75.474', 'Millets', '1111.0', '1696.592', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Optimized', 'Depot', 'Karnataka', '123', 'Array', 'Bagalkote', 'Akki', '27.89', '78.4', 'FPS', 'Karnataka', 'FPS8', 'YUVAKA MANDAL CHINCHALAKATTI', 'Bagalkote', 'Akki', '16.023', '75.4657', 'Millets', '1111.0', '1694.0386', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Optimized', 'Depot', 'Karnataka', '123', 'Array', 'Bagalkote', 'Akki', '27.89', '78.4', 'FPS', 'Karnataka', 'FPS9', 'K.K.LAMANI CHINCHALAKATTI L.T.', 'Bagalkote', 'Akki', '16.0242', '75.4815', 'Millets', '1111.0', '1692.1932', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Optimized', 'Depot', 'Karnataka', '123', 'Array', 'Bagalkote', 'Akki', '27.89', '78.4', 'FPS', 'Karnataka', '4', 'Yavatmal Yass', 'Bagalkote', 'Akki', '16.0238', '75.6052', 'Jowar', '500.0', '1691.2111', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Optimized', 'Depot', 'Karnataka', '123', 'Array', 'Bagalkote', 'Akki', '27.89', '78.4', 'FPS', 'Karnataka', 'FPS1', 'Gram Mandal Maninagar', 'Bagalkote', 'Akki', '16.0238', '75.6052', 'Jowar', '500.0', '1691.2111', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Optimized', 'Depot', 'Karnataka', '123', 'Array', 'Bagalkote', 'Akki', '27.89', '78.4', 'FPS', 'Karnataka', 'FPS2', 'MAHAKUTESHWAR YUVAKA MANDAL YANKANCHI', 'Bagalkote', 'Akki', '16.0227', '75.6052', 'Jowar', '500.0', '1691.1721', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Optimized', 'Depot', 'Karnataka', '123', 'Array', 'Bagalkote', 'Akki', '27.89', '78.4', 'FPS', 'Karnataka', 'FPS4', 'L.B. NAIKAR. KHANAPUR.S.K. 68 (C)(RADDERTIMMAPUR)', 'Bagalkote', 'Akki', '15.9938', '75.452', 'Jowar', '500.0', '1697.5976', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Optimized', 'Depot', 'Karnataka', '123', 'Array', 'Bagalkote', 'Akki', '27.89', '78.4', 'FPS', 'Karnataka', 'FPS5', 'YUVAKA MANDAL HAVALAKOD', 'Bagalkote', 'Akki', '16.0257', '75.4523', 'Jowar', '500.0', '1697.0919', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Optimized', 'Depot', 'Karnataka', '123', 'Array', 'Bagalkote', 'Akki', '27.89', '78.4', 'FPS', 'Karnataka', 'FPS6', 'MARUTI YUVAKA MANDAL FAKIRBUDIHAL', 'Bagalkote', 'Akki', '16.0502', '75.4754', 'Jowar', '500.0', '1697.2908', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Optimized', 'Depot', 'Karnataka', '123', 'Array', 'Bagalkote', 'Akki', '27.89', '78.4', 'FPS', 'Karnataka', 'FPS7', 'YUVAKA MANDAL SAGANUR', 'Bagalkote', 'Akki', '16.0437', '75.474', 'Jowar', '500.0', '1696.592', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Optimized', 'Depot', 'Karnataka', '123', 'Array', 'Bagalkote', 'Akki', '27.89', '78.4', 'FPS', 'Karnataka', 'FPS8', 'YUVAKA MANDAL CHINCHALAKATTI', 'Bagalkote', 'Akki', '16.023', '75.4657', 'Jowar', '500.0', '1694.0386', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Optimized', 'Depot', 'Karnataka', '123', 'Array', 'Bagalkote', 'Akki', '27.89', '78.4', 'FPS', 'Karnataka', 'FPS9', 'K.K.LAMANI CHINCHALAKATTI L.T.', 'Bagalkote', 'Akki', '16.0242', '75.4815', 'Jowar', '500.0', '1692.1932', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `optimiseddata_leg1_5np4gohmyhmok0`
--

CREATE TABLE `optimiseddata_leg1_5np4gohmyhmok0` (
  `scenario` varchar(150) NOT NULL,
  `from` varchar(150) NOT NULL,
  `from_state` varchar(150) NOT NULL,
  `from_id` varchar(150) NOT NULL,
  `from_name` varchar(150) NOT NULL,
  `from_district` varchar(150) NOT NULL,
  `from_block` varchar(150) NOT NULL,
  `from_lat` varchar(150) NOT NULL,
  `from_long` varchar(150) NOT NULL,
  `to` varchar(150) NOT NULL,
  `to_state` varchar(150) NOT NULL,
  `to_id` varchar(150) NOT NULL,
  `to_name` varchar(150) NOT NULL,
  `to_district` varchar(150) NOT NULL,
  `to_block` varchar(150) NOT NULL,
  `to_lat` varchar(150) NOT NULL,
  `to_long` varchar(150) NOT NULL,
  `commodity` varchar(150) NOT NULL,
  `quantity` varchar(150) NOT NULL,
  `distance` varchar(150) NOT NULL,
  `approve_admin` varchar(100) DEFAULT NULL,
  `approve_district` varchar(100) DEFAULT NULL,
  `new_id_admin` varchar(100) DEFAULT NULL,
  `new_id_district` varchar(100) DEFAULT NULL,
  `new_name_admin` varchar(100) DEFAULT NULL,
  `new_name_district` varchar(10) DEFAULT NULL,
  `reason_admin` varchar(255) DEFAULT NULL,
  `reason_district` varchar(255) DEFAULT NULL,
  `new_distance_admin` varchar(100) DEFAULT NULL,
  `new_distance_district` varchar(100) DEFAULT NULL,
  `district_change_approve` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `optimiseddata_leg1_5np4gohmyhmok0`
--

INSERT INTO `optimiseddata_leg1_5np4gohmyhmok0` (`scenario`, `from`, `from_state`, `from_id`, `from_name`, `from_district`, `from_block`, `from_lat`, `from_long`, `to`, `to_state`, `to_id`, `to_name`, `to_district`, `to_block`, `to_lat`, `to_long`, `commodity`, `quantity`, `distance`, `approve_admin`, `approve_district`, `new_id_admin`, `new_id_district`, `new_name_admin`, `new_name_district`, `reason_admin`, `reason_district`, `new_distance_admin`, `new_distance_district`, `district_change_approve`, `status`) VALUES
('Optimized', 'FCI', 'Karnataka', '336', 'KFCSC HUNSUR', 'Ballari', 'shallu', '16.149352', '75.672288', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'Rice', '700.0', '34.0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Optimized', 'FCI', 'Karnataka', '335', 'Kfcsc T Narasipura', 'Bagalkote', 'shallu', '16.15499028', '75.67274778', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FRice', '4266.76', '33.489', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Optimized', 'FCI', 'Karnataka', '335', 'Kfcsc T Narasipura', 'Bagalkote', 'shallu', '16.15499028', '75.67274778', 'Depot', 'Karnataka', '2', 'KFCSC BAGALKOT', 'Bagalkote', 'Akki', '16.15419', '75.673548', 'FRice', '1734.24', '0.15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Optimized', 'FCI', 'Karnataka', '12221', 'Maharstra Project11', 'Bagalkote', 'shallu', '24.0', '76.0', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FRice', '287.5500000000002', '1075.0329', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Optimized', 'FCI', 'Karnataka', '12221', 'Maharstra Project11', 'Bagalkote', 'shallu', '24.0', '76.0', 'Depot', 'Karnataka', '8', 'TAPCMS MUDHOL', 'Bagalkote', 'Akki', '16.33083', '75.28581', 'FRice', '34.7', '1012.1788', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `optimiseddata_o26hx1j6rmwu2u`
--

CREATE TABLE `optimiseddata_o26hx1j6rmwu2u` (
  `scenario` varchar(150) NOT NULL,
  `from` varchar(150) NOT NULL,
  `from_state` varchar(150) NOT NULL,
  `from_id` varchar(150) NOT NULL,
  `from_name` varchar(150) NOT NULL,
  `from_district` varchar(150) NOT NULL,
  `from_block` varchar(150) NOT NULL,
  `from_lat` varchar(150) NOT NULL,
  `from_long` varchar(150) NOT NULL,
  `to` varchar(150) NOT NULL,
  `to_state` varchar(150) NOT NULL,
  `to_id` varchar(150) NOT NULL,
  `to_name` varchar(150) NOT NULL,
  `to_district` varchar(150) NOT NULL,
  `to_block` varchar(150) NOT NULL,
  `to_lat` varchar(150) NOT NULL,
  `to_long` varchar(150) NOT NULL,
  `commodity` varchar(150) NOT NULL,
  `quantity` varchar(150) NOT NULL,
  `distance` varchar(150) NOT NULL,
  `approve_admin` varchar(100) DEFAULT NULL,
  `approve_district` varchar(100) DEFAULT NULL,
  `new_id_admin` varchar(100) DEFAULT NULL,
  `new_id_district` varchar(100) DEFAULT NULL,
  `new_name_admin` varchar(100) DEFAULT NULL,
  `new_name_district` varchar(10) DEFAULT NULL,
  `reason_admin` varchar(255) DEFAULT NULL,
  `reason_district` varchar(255) DEFAULT NULL,
  `new_distance_admin` varchar(100) DEFAULT NULL,
  `new_distance_district` varchar(100) DEFAULT NULL,
  `district_change_approve` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `optimiseddata_o26hx1j6rmwu2u`
--

INSERT INTO `optimiseddata_o26hx1j6rmwu2u` (`scenario`, `from`, `from_state`, `from_id`, `from_name`, `from_district`, `from_block`, `from_lat`, `from_long`, `to`, `to_state`, `to_id`, `to_name`, `to_district`, `to_block`, `to_lat`, `to_long`, `commodity`, `quantity`, `distance`, `approve_admin`, `approve_district`, `new_id_admin`, `new_id_district`, `new_name_admin`, `new_name_district`, `reason_admin`, `reason_district`, `new_distance_admin`, `new_distance_district`, `district_change_approve`, `status`) VALUES
('Optimized', 'Depot', 'Karnataka', '123', 'Array', 'Bagalkote', 'Akki', '27.89', '78.4', 'FPS', 'Karnataka', 'FPS2', 'MAHAKUTESHWAR YUVAKA MANDAL YANKANCHI', 'Bagalkote', 'Akki', '16.0227', '75.6052', 'FRice', '75.34', '1691.1721', 'yes', 'yes', '26001737000.00', '260017370006.00', 'Kk', 'Kk', 'Road repair going on', 'Road not accessible', '55', 'ugtfhf', NULL, 'implemented'),
('Optimized', 'Depot', 'Karnataka', '123', 'Array', 'Bagalkote', 'Akki', '27.89', '78.4', 'FPS', 'Karnataka', 'FPS4', 'L.B. NAIKAR. KHANAPUR.S.K. 68 (C)(RADDERTIMMAPUR)', 'Bagalkote', 'Akki', '15.9938', '75.452', 'FRice', '110.89', '1697.5976', 'yes', 'yes', NULL, '123.00', NULL, 'Array', NULL, 'Road not accessible', NULL, '55', NULL, 'implemented'),
('Optimized', 'Depot', 'Karnataka', '123', 'Array', 'Bagalkote', 'Akki', '27.89', '78.4', 'FPS', 'Karnataka', 'FPS8', 'YUVAKA MANDAL CHINCHALAKATTI', 'Bagalkote', 'Akki', '16.023', '75.4657', 'FRice', '58.13', '1694.0386', 'yes', 'yes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'implemented'),
('Optimized', 'Depot', 'Karnataka', '260017370006', 'Kk', 'Bagalkote', 'Badami', '27.89', '78.4', 'FPS', 'Karnataka', 'FPS5', 'YUVAKA MANDAL HAVALAKOD', 'Bagalkote', 'Akki', '16.0257', '75.4523', 'FRice', '55.51', '1697.0919', 'yes', 'yes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'implemented'),
('Optimized', 'Depot', 'Karnataka', '260017370006', 'Kk', 'Bagalkote', 'Badami', '27.89', '78.4', 'FPS', 'Karnataka', 'FPS9', 'K.K.LAMANI CHINCHALAKATTI L.T.', 'Bagalkote', 'Akki', '16.0242', '75.4815', 'FRice', '38.08', '1692.1932', 'yes', 'yes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'implemented'),
('Optimized', 'Depot', 'Karnataka', '26001737000', 'Kk', 'Bagalkote', 'Akki', '27.89', '78.4', 'FPS', 'Karnataka', '4', 'Yavatmal Yass', 'Bagalkote', 'Akki', '16.0238', '75.6052', 'FRice', '677.0', '1691.2111', 'yes', 'yes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'implemented'),
('Optimized', 'Depot', 'Karnataka', '26001737000', 'Kk', 'Bagalkote', 'Akki', '27.89', '78.4', 'FPS', 'Karnataka', 'FPS1', 'Gram Mandal Maninagar', 'Bagalkote', 'Akki', '16.0238', '75.6052', 'FRice', '46.46', '1691.2111', 'yes', 'yes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'implemented'),
('Optimized', 'Depot', 'Karnataka', '26001737000', 'Kk', 'Bagalkote', 'Akki', '27.89', '78.4', 'FPS', 'Karnataka', 'FPS6', 'MARUTI YUVAKA MANDAL FAKIRBUDIHAL', 'Bagalkote', 'Akki', '16.0502', '75.4754', 'FRice', '37.54', '1697.2908', 'yes', 'yes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'implemented'),
('Optimized', 'Depot', 'Karnataka', '26001737000', 'Kk', 'Bagalkote', 'Akki', '27.89', '78.4', 'FPS', 'Karnataka', 'FPS7', 'YUVAKA MANDAL SAGANUR', 'Bagalkote', 'Akki', '16.0437', '75.474', 'FRice', '27.24', '1696.592', 'yes', 'yes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'implemented'),
('Optimized', 'Depot', 'Karnataka', '26001737000', 'Kk', 'Bagalkote', 'Akki', '27.89', '78.4', 'FPS', 'Karnataka', '4', 'Yavatmal Yass', 'Bagalkote', 'Akki', '16.0238', '75.6052', 'Rice', '90.0', '1691.2111', 'yes', 'yes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'implemented'),
('Optimized', 'Depot', 'Karnataka', '123', 'Array', 'Bagalkote', 'Akki', '27.89', '78.4', 'FPS', 'Karnataka', '4', 'Yavatmal Yass', 'Bagalkote', 'Akki', '16.0238', '75.6052', 'Millets', '90.0', '1691.2111', 'yes', 'yes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'implemented'),
('Optimized', 'Depot', 'Karnataka', '123', 'Array', 'Bagalkote', 'Akki', '27.89', '78.4', 'FPS', 'Karnataka', 'FPS1', 'Gram Mandal Maninagar', 'Bagalkote', 'Akki', '16.0238', '75.6052', 'Millets', '1111.0', '1691.2111', 'yes', 'yes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'implemented'),
('Optimized', 'Depot', 'Karnataka', '123', 'Array', 'Bagalkote', 'Akki', '27.89', '78.4', 'FPS', 'Karnataka', 'FPS2', 'MAHAKUTESHWAR YUVAKA MANDAL YANKANCHI', 'Bagalkote', 'Akki', '16.0227', '75.6052', 'Millets', '1111.0', '1691.1721', 'yes', 'yes', '26001737000.00', '260017370006.00', 'Kk', 'Kk', 'Road repair going on', 'Road not accessible', '55', 'ugtfhf', NULL, 'implemented'),
('Optimized', 'Depot', 'Karnataka', '123', 'Array', 'Bagalkote', 'Akki', '27.89', '78.4', 'FPS', 'Karnataka', 'FPS4', 'L.B. NAIKAR. KHANAPUR.S.K. 68 (C)(RADDERTIMMAPUR)', 'Bagalkote', 'Akki', '15.9938', '75.452', 'Millets', '1111.0', '1697.5976', 'yes', 'yes', NULL, '123.00', NULL, 'Array', NULL, 'Road not accessible', NULL, '55', NULL, 'implemented'),
('Optimized', 'Depot', 'Karnataka', '123', 'Array', 'Bagalkote', 'Akki', '27.89', '78.4', 'FPS', 'Karnataka', 'FPS5', 'YUVAKA MANDAL HAVALAKOD', 'Bagalkote', 'Akki', '16.0257', '75.4523', 'Millets', '1111.0', '1697.0919', 'yes', 'yes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'implemented'),
('Optimized', 'Depot', 'Karnataka', '123', 'Array', 'Bagalkote', 'Akki', '27.89', '78.4', 'FPS', 'Karnataka', 'FPS6', 'MARUTI YUVAKA MANDAL FAKIRBUDIHAL', 'Bagalkote', 'Akki', '16.0502', '75.4754', 'Millets', '1111.0', '1697.2908', 'yes', 'yes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'implemented'),
('Optimized', 'Depot', 'Karnataka', '123', 'Array', 'Bagalkote', 'Akki', '27.89', '78.4', 'FPS', 'Karnataka', 'FPS7', 'YUVAKA MANDAL SAGANUR', 'Bagalkote', 'Akki', '16.0437', '75.474', 'Millets', '1111.0', '1696.592', 'yes', 'yes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'implemented'),
('Optimized', 'Depot', 'Karnataka', '123', 'Array', 'Bagalkote', 'Akki', '27.89', '78.4', 'FPS', 'Karnataka', 'FPS8', 'YUVAKA MANDAL CHINCHALAKATTI', 'Bagalkote', 'Akki', '16.023', '75.4657', 'Millets', '1111.0', '1694.0386', 'yes', 'yes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'implemented'),
('Optimized', 'Depot', 'Karnataka', '123', 'Array', 'Bagalkote', 'Akki', '27.89', '78.4', 'FPS', 'Karnataka', 'FPS9', 'K.K.LAMANI CHINCHALAKATTI L.T.', 'Bagalkote', 'Akki', '16.0242', '75.4815', 'Millets', '1111.0', '1692.1932', 'yes', 'yes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'implemented'),
('Optimized', 'Depot', 'Karnataka', '123', 'Array', 'Bagalkote', 'Akki', '27.89', '78.4', 'FPS', 'Karnataka', '4', 'Yavatmal Yass', 'Bagalkote', 'Akki', '16.0238', '75.6052', 'Jowar', '500.0', '1691.2111', 'yes', 'yes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'implemented'),
('Optimized', 'Depot', 'Karnataka', '123', 'Array', 'Bagalkote', 'Akki', '27.89', '78.4', 'FPS', 'Karnataka', 'FPS1', 'Gram Mandal Maninagar', 'Bagalkote', 'Akki', '16.0238', '75.6052', 'Jowar', '500.0', '1691.2111', 'yes', 'yes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'implemented'),
('Optimized', 'Depot', 'Karnataka', '123', 'Array', 'Bagalkote', 'Akki', '27.89', '78.4', 'FPS', 'Karnataka', 'FPS2', 'MAHAKUTESHWAR YUVAKA MANDAL YANKANCHI', 'Bagalkote', 'Akki', '16.0227', '75.6052', 'Jowar', '500.0', '1691.1721', 'yes', 'yes', '26001737000.00', '260017370006.00', 'Kk', 'Kk', 'Road repair going on', 'Road not accessible', '55', 'ugtfhf', NULL, 'implemented'),
('Optimized', 'Depot', 'Karnataka', '123', 'Array', 'Bagalkote', 'Akki', '27.89', '78.4', 'FPS', 'Karnataka', 'FPS4', 'L.B. NAIKAR. KHANAPUR.S.K. 68 (C)(RADDERTIMMAPUR)', 'Bagalkote', 'Akki', '15.9938', '75.452', 'Jowar', '500.0', '1697.5976', 'yes', 'yes', NULL, '123.00', NULL, 'Array', NULL, 'Road not accessible', NULL, '55', NULL, 'implemented'),
('Optimized', 'Depot', 'Karnataka', '123', 'Array', 'Bagalkote', 'Akki', '27.89', '78.4', 'FPS', 'Karnataka', 'FPS5', 'YUVAKA MANDAL HAVALAKOD', 'Bagalkote', 'Akki', '16.0257', '75.4523', 'Jowar', '500.0', '1697.0919', 'yes', 'yes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'implemented'),
('Optimized', 'Depot', 'Karnataka', '123', 'Array', 'Bagalkote', 'Akki', '27.89', '78.4', 'FPS', 'Karnataka', 'FPS6', 'MARUTI YUVAKA MANDAL FAKIRBUDIHAL', 'Bagalkote', 'Akki', '16.0502', '75.4754', 'Jowar', '500.0', '1697.2908', 'yes', 'yes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'implemented'),
('Optimized', 'Depot', 'Karnataka', '123', 'Array', 'Bagalkote', 'Akki', '27.89', '78.4', 'FPS', 'Karnataka', 'FPS7', 'YUVAKA MANDAL SAGANUR', 'Bagalkote', 'Akki', '16.0437', '75.474', 'Jowar', '500.0', '1696.592', 'yes', 'yes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'implemented'),
('Optimized', 'Depot', 'Karnataka', '123', 'Array', 'Bagalkote', 'Akki', '27.89', '78.4', 'FPS', 'Karnataka', 'FPS8', 'YUVAKA MANDAL CHINCHALAKATTI', 'Bagalkote', 'Akki', '16.023', '75.4657', 'Jowar', '500.0', '1694.0386', 'yes', 'yes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'implemented'),
('Optimized', 'Depot', 'Karnataka', '123', 'Array', 'Bagalkote', 'Akki', '27.89', '78.4', 'FPS', 'Karnataka', 'FPS9', 'K.K.LAMANI CHINCHALAKATTI L.T.', 'Bagalkote', 'Akki', '16.0242', '75.4815', 'Jowar', '500.0', '1692.1932', 'yes', 'yes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'implemented');

-- --------------------------------------------------------

--
-- Table structure for table `optimiseddata_s3suwcezjyheju`
--

CREATE TABLE `optimiseddata_s3suwcezjyheju` (
  `scenario` varchar(150) NOT NULL,
  `from` varchar(150) NOT NULL,
  `from_state` varchar(150) NOT NULL,
  `from_id` varchar(150) NOT NULL,
  `from_name` varchar(150) NOT NULL,
  `from_district` varchar(150) NOT NULL,
  `from_block` varchar(150) NOT NULL,
  `from_lat` varchar(150) NOT NULL,
  `from_long` varchar(150) NOT NULL,
  `to` varchar(150) NOT NULL,
  `to_state` varchar(150) NOT NULL,
  `to_id` varchar(150) NOT NULL,
  `to_name` varchar(150) NOT NULL,
  `to_district` varchar(150) NOT NULL,
  `to_block` varchar(150) NOT NULL,
  `to_lat` varchar(150) NOT NULL,
  `to_long` varchar(150) NOT NULL,
  `commodity` varchar(150) NOT NULL,
  `quantity` varchar(150) NOT NULL,
  `distance` varchar(150) NOT NULL,
  `approve_admin` varchar(100) DEFAULT NULL,
  `approve_district` varchar(100) DEFAULT NULL,
  `new_id_admin` varchar(100) DEFAULT NULL,
  `new_id_district` varchar(100) DEFAULT NULL,
  `new_name_admin` varchar(100) DEFAULT NULL,
  `new_name_district` varchar(10) DEFAULT NULL,
  `reason_admin` varchar(255) DEFAULT NULL,
  `reason_district` varchar(255) DEFAULT NULL,
  `new_distance_admin` varchar(100) DEFAULT NULL,
  `new_distance_district` varchar(100) DEFAULT NULL,
  `district_change_approve` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `optimiseddata_s3suwcezjyheju`
--

INSERT INTO `optimiseddata_s3suwcezjyheju` (`scenario`, `from`, `from_state`, `from_id`, `from_name`, `from_district`, `from_block`, `from_lat`, `from_long`, `to`, `to_state`, `to_id`, `to_name`, `to_district`, `to_block`, `to_lat`, `to_long`, `commodity`, `quantity`, `distance`, `approve_admin`, `approve_district`, `new_id_admin`, `new_id_district`, `new_name_admin`, `new_name_district`, `reason_admin`, `reason_district`, `new_distance_admin`, `new_distance_district`, `district_change_approve`, `status`) VALUES
('Optimized', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FPS', 'Karnataka', 'FPS10', 'RAIT SANGHA HANAMANERI (S)', 'Bagalkote', 'Badami', '16.0122', '75.4965', 'FRice', '11.73', '29.094', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FPS', 'Karnataka', 'FPS17', 'GRAMA MANDAL MATTIKATTI', 'Bagalkote', 'Badami', '16.0211', '75.5675', 'FRice', '73.18', '21.7544', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FPS', 'Karnataka', 'FPS1', 'Gram Mandal Maninagar', 'Bagalkote', 'Badami', '16.0238', '75.6052', 'FRice', '46.46', '17.5083', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FPS', 'Karnataka', 'FPS27', 'PKPS Halakurki', 'Bagalkote', 'Badami', '16.0047', '75.644', 'FRice', '188.14', '12.6546', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FPS', 'Karnataka', 'FPS2', 'MAHAKUTESHWAR YUVAKA MANDAL YANKANCHI', 'Bagalkote', 'Badami', '16.0227', '75.6052', 'FRice', '75.34', '17.4692', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FPS', 'Karnataka', 'FPS31', 'Secretory Neeralkeri Milk producers Co-Op Society Ltd.', 'Bagalkote', 'Badami', '15.9757', '75.4575', 'FRice', '153.9', '33.2325', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FPS', 'Karnataka', 'FPS32', 'P.K.P.S.MUSTIGERI.', 'Bagalkote', 'Akki', '15.9606', '75.57', 'FRice', '167.94', '15.4762', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FPS', 'Karnataka', 'FPS33', 'MARUTI YUVAKA MANDALA HULLIKERI INAM', 'Bagalkote', 'Akki', '15.9956', '75.6029', 'FRice', '126.78', '19.9962', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FPS', 'Karnataka', 'FPS34', 'YOUTH ASSOCIATION MUMARADDIKOPPA', 'Bagalkote', 'Akki', '15.8392', '75.63', 'FRice', '22.95', '17.934', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FPS', 'Karnataka', 'FPS35', 'P.K.P.S. UGLVAT', 'Bagalkote', 'Akki', '15.9708', '75.5406', 'FRice', '225.63', '19.1425', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FPS', 'Karnataka', 'FPS36', 'PURNANANDA YUVAKA MANDAL KALLAPUR.S.K.', 'Bagalkote', 'Akki', '15.9401', '75.504', 'FRice', '68.95', '27.0162', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FPS', 'Karnataka', 'FPS37', 'KALIKADEVI YUVAK MANDALA TAPPASAKATTI', 'Bagalkote', 'Akki', '15.9447', '75.4901', 'FRice', '59.89', '28.5578', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FPS', 'Karnataka', 'FPS38', 'MARUTI YUVAKA MANDAL HANAMASAGAR', 'Bagalkote', 'Akki', '15.9344', '75.5267', 'FRice', '49.27', '21.8193', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FPS', 'Karnataka', 'FPS39', 'PURNANAND YUVAKA MANDAL SOMANAKOPPA', 'Bagalkote', 'Akki', '15.9167', '75.5236', 'FRice', '73.9', '20.3272', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FPS', 'Karnataka', 'FPS3', 'MAHAKUTESHWAR Y.M. GUBBERAKOPPA', 'Bagalkote', 'Badami', '16.0267', '75.6126', 'FRice', '24.25', '17.641', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FPS', 'Karnataka', 'FPS40', 'L.B. NAYAKAR KHANAPUR S,K.', 'Bagalkote', 'Akki', '15.9087', '75.5007', 'FRice', '225.69', '21.7662', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FPS', 'Karnataka', 'FPS41', 'V.S.S. KAKANUR', 'Bagalkote', 'Akki', '15.9398', '75.4307', 'FRice', '130.68', '30.0824', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FPS', 'Karnataka', 'FPS42', 'GRAMA MANDALA CHIMMANAKATTI', 'Bagalkote', 'Akki', '15.9174', '75.4708', 'FRice', '122.78', '25.1245', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FPS', 'Karnataka', 'FPS43', 'NEERU BALAKEDARAR SAHAKARI SANGHA HAGANUR', 'Bagalkote', 'Akki', '15.8973', '75.4433', 'FRice', '86.3', '29.4318', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FPS', 'Karnataka', 'FPS44', 'V.S.S. TALAKAWAD', 'Bagalkote', 'Akki', '15.8853', '75.4733', 'FRice', '35.25', '25.9337', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FPS', 'Karnataka', 'FPS45', 'GRAM MANDAL NEELGUND', 'Bagalkote', 'Akki', '15.9242', '75.5473', 'FRice', '201.29', '19.2408', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FPS', 'Karnataka', 'FPS46', 'GRAM MANDAL LAKHAMAPUR', 'Bagalkote', 'Akki', '15.8642', '75.6216', 'FRice', '76.56', '11.9298', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FPS', 'Karnataka', 'FPS47', 'IRAPP. K.BIRANUR BIRANUR', 'Bagalkote', 'Akki', '15.8789', '75.4792', 'FRice', '46.47', '27.8246', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FPS', 'Karnataka', 'FPS48', 'MARUTESHWAR YUVAKA MANDAL ALUR S.K.', 'Bagalkote', 'Akki', '15.8901', '75.471', 'FRice', '68.87', '26.3396', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FPS', 'Karnataka', 'FPS49', 'BASAVESHWAR YUVAK MANDAL TIMMAPUR S.N.', 'Bagalkote', 'Akki', '15.9013', '75.5511', 'FRice', '51.33', '16.186', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FPS', 'Karnataka', 'FPS4', 'L.B. NAIKAR. KHANAPUR.S.K. 68 (C)(RADDERTIMMAPUR)', 'Bagalkote', 'Badami', '15.9938', '75.452', 'FRice', '110.89', '36.3382', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FPS', 'Karnataka', 'FPS50', 'VEERABHADHRESHWARA Y M MALLAPUR S.L.', 'Bagalkote', 'Akki', '15.8641', '75.6394', 'FRice', '51.53', '11.2153', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FPS', 'Karnataka', 'FPS51', 'Kalasa (Govonakopp) Milk producers Co op Society', 'Bagalkote', 'Akki', '15.8723', '75.4985', 'FRice', '121.04', '25.9395', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FPS', 'Karnataka', 'FPS52', 'YUVAKA MANDAL ALADAKATTI', 'Bagalkote', 'Akki', '15.904', '75.5788', 'FRice', '48.69', '13.9932', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FPS', 'Karnataka', 'FPS53', 'PKPS Hebballi', 'Bagalkote', 'Akki', '15.8388', '75.6129', 'FRice', '163.67', '15.0748', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FPS', 'Karnataka', 'FPS54', 'V.S.S. MUTTALAGERI', 'Bagalkote', 'Banglo', '15.893', '75.6166', 'FRice', '251.17', '8.718', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FPS', 'Karnataka', 'FPS55', 'MARUTESHWAR TARUN SANGHA NAVILAHOLE.', 'Bagalkote', 'Banglo', '15.8917', '75.7414', 'FRice', '36.73', '9.9904', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FPS', 'Karnataka', 'FPS56', 'BASAVALINGESHWAR Y M BACHINAGUDDA.', 'Bagalkote', 'Banglo', '15.9478', '75.7947', 'FRice', '87.05', '20.303', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FPS', 'Karnataka', 'FPS57', 'GRAM MANDAL GONAL', 'Bagalkote', 'Banglo', '15.9355', '75.7887', 'FRice', '48.58', '17.1105', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FPS', 'Karnataka', 'FPS58', 'V.S.S.CHOLACHAGUDDA', 'Bagalkote', 'Banglo', '15.8725', '75.719', 'FRice', '217.57', '6.5347', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FPS', 'Karnataka', 'FPS59', 'BANASHANKARI DEVASTHANA SEVA SAMITI BANASHANKARI.', 'Bagalkote', 'Banglo', '15.8876', '75.7049', 'FRice', '51.38', '3.0825', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FPS', 'Karnataka', 'FPS60', 'REVANASHIDDESHWAR YUVAKA SANGHA HIRENASIBI', 'Bagalkote', 'Banglo', '15.8748', '75.7291', 'FRice', '86.69', '7.3459', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FPS', 'Karnataka', 'FPS61', 'AMBEDAKAR VIDYA VARDHAKA SANGHA BELUR', 'Bagalkote', 'Banglo', '15.8472', '75.7548', 'FRice', '94.69', '12.3268', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FPS', 'Karnataka', 'FPS62', 'V.S.S.JALIHAL', 'Bagalkote', 'Banglo', '15.8423', '75.7596', 'FRice', '254.64', '12.6387', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FPS', 'Karnataka', 'FPS63', 'Halu Utpadakara sahakari sangha,Pattadakal', 'Bagalkote', 'Banglo', '15.9489', '75.8136', 'FRice', '135.76', '22.1932', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FPS', 'Karnataka', 'FPS64', 'GRAM MANDAL ADAGAL.', 'Bagalkote', 'Banglo', '15.9537', '75.6736', 'FRice', '213.36', '5.9783', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FPS', 'Karnataka', 'FPS65', 'V.S.S.KUTAKANAKERI', 'Bagalkote', 'Banglo', '15.9827', '75.6979', 'FRice', '167.34', '9.2947', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '2', 'KFCSC BAGALKOT', 'Bagalkote', 'Akki', '16.15419', '75.673548', 'FPS', 'Karnataka', 'FPS11', 'V.S.S. NEERBUDIHAL', 'Bagalkote', 'Badami', '16.1278', '75.5244', 'FRice', '139.24', '23.2391', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '2', 'KFCSC BAGALKOT', 'Bagalkote', 'Akki', '16.15419', '75.673548', 'FPS', 'Karnataka', 'FPS12', 'GRAMA MANDAL GANGANABUDIHAL', 'Bagalkote', 'Badami', '16.1185', '75.5616', 'FRice', '115.6', '19.1749', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '2', 'KFCSC BAGALKOT', 'Bagalkote', 'Akki', '16.15419', '75.673548', 'FPS', 'Karnataka', 'FPS13', 'S.M.GONNAGAR JANGAWAD', 'Bagalkote', 'Badami', '16.0518', '75.4277', 'FRice', '30.01', '41.587', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '2', 'KFCSC BAGALKOT', 'Bagalkote', 'Akki', '16.15419', '75.673548', 'FPS', 'Karnataka', 'FPS14', 'YUVAKA MANDALA HOSAKOTI-37 (C)(KAINAKATTI)', 'Bagalkote', 'Badami', '16.0764', '75.4496', 'FRice', '48.23', '36.7004', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '2', 'KFCSC BAGALKOT', 'Bagalkote', 'Akki', '16.15419', '75.673548', 'FPS', 'Karnataka', 'FPS15', 'Y.S.NARASANVAR SHIPARMATTI', 'Bagalkote', 'Badami', '16.074', '75.4333', 'FRice', '37.27', '42.9384', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '2', 'KFCSC BAGALKOT', 'Bagalkote', 'Akki', '16.15419', '75.673548', 'FPS', 'Karnataka', 'FPS16', 'YUVAKA MANDAL HOSAKOTI', 'Bagalkote', 'Badami', '16.0641', '75.4592', 'FRice', '49.79', '40.0406', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '2', 'KFCSC BAGALKOT', 'Bagalkote', 'Akki', '16.15419', '75.673548', 'FPS', 'Karnataka', 'FPS18', 'SHIVANAND YUVAKA MANDAL MALAGI', 'Bagalkote', 'Badami', '16.0524', '75.539', 'FRice', '64.39', '25.2873', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '2', 'KFCSC BAGALKOT', 'Bagalkote', 'Akki', '16.15419', '75.673548', 'FPS', 'Karnataka', 'FPS19', 'SHRADDANAND YUVAKA MANDAL NARENUR', 'Bagalkote', 'Badami', '16.0399', '75.5084', 'FRice', '83.6', '31.4553', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '2', 'KFCSC BAGALKOT', 'Bagalkote', 'Akki', '16.15419', '75.673548', 'FPS', 'Karnataka', 'FPS20', 'KRISHNA YUVAKA MANDAL NARENUR L.T.2', 'Bagalkote', 'Badami', '16.061', '75.5132', 'FRice', '46.85', '29.8774', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '2', 'KFCSC BAGALKOT', 'Bagalkote', 'Akki', '16.15419', '75.673548', 'FPS', 'Karnataka', 'FPS22', 'PKPS Anawal', 'Bagalkote', 'Badami', '16.0983', '75.4703', 'FRice', '170.24', '32.0938', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '2', 'KFCSC BAGALKOT', 'Bagalkote', 'Akki', '16.15419', '75.673548', 'FPS', 'Karnataka', 'FPS23', 'GRAMA MANDAL KALABANDKERI', 'Bagalkote', 'Badami', '16.0848', '75.5122', 'FRice', '70.07', '26.7437', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '2', 'KFCSC BAGALKOT', 'Bagalkote', 'Akki', '16.15419', '75.673548', 'FPS', 'Karnataka', 'FPS24', 'YUVAKA MANDAL YANDIGERI', 'Bagalkote', 'Badami', '16.1311', '75.494', 'FRice', '101.15', '26.4132', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '2', 'KFCSC BAGALKOT', 'Bagalkote', 'Akki', '16.15419', '75.673548', 'FPS', 'Karnataka', 'FPS25', 'V.S.S.KAGALGOMBA', 'Bagalkote', 'Badami', '16.1115', '75.6221', 'FRice', '120.98', '13.0919', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '2', 'KFCSC BAGALKOT', 'Bagalkote', 'Akki', '16.15419', '75.673548', 'FPS', 'Karnataka', 'FPS26', 'V.S.S.KERAKALMATTI', 'Bagalkote', 'Badami', '16.1302', '75.5783', 'FRice', '135.91', '16.891', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '2', 'KFCSC BAGALKOT', 'Bagalkote', 'Akki', '16.15419', '75.673548', 'FPS', 'Karnataka', 'FPS28', 'V.S.S.HULAGERI', 'Bagalkote', 'Badami', '16.0864', '75.5823', 'FRice', '96.27', '18.4422', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '2', 'KFCSC BAGALKOT', 'Bagalkote', 'Akki', '16.15419', '75.673548', 'FPS', 'Karnataka', 'FPS29', 'BASAVESHWARA YUVAKA MANDAL JALAGERI', 'Bagalkote', 'Badami', '16.1058', '75.5448', 'FRice', '108.05', '21.5481', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '2', 'KFCSC BAGALKOT', 'Bagalkote', 'Akki', '16.15419', '75.673548', 'FPS', 'Karnataka', 'FPS30', 'Manjunatha Shivappa Rathod (PH)', 'Bagalkote', 'Badami', '16.0932', '75.5269', 'FRice', '100.09', '24.7305', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '2', 'KFCSC BAGALKOT', 'Bagalkote', 'Akki', '16.15419', '75.673548', 'FPS', 'Karnataka', 'FPS5', 'YUVAKA MANDAL HAVALAKOD', 'Bagalkote', 'Badami', '16.0257', '75.4523', 'FRice', '55.51', '39.056', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '2', 'KFCSC BAGALKOT', 'Bagalkote', 'Akki', '16.15419', '75.673548', 'FPS', 'Karnataka', 'FPS6', 'MARUTI YUVAKA MANDAL FAKIRBUDIHAL', 'Bagalkote', 'Badami', '16.0502', '75.4754', 'FRice', '37.54', '39.2549', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '2', 'KFCSC BAGALKOT', 'Bagalkote', 'Akki', '16.15419', '75.673548', 'FPS', 'Karnataka', 'FPS7', 'YUVAKA MANDAL SAGANUR', 'Bagalkote', 'Badami', '16.0437', '75.474', 'FRice', '27.24', '38.5561', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '2', 'KFCSC BAGALKOT', 'Bagalkote', 'Akki', '16.15419', '75.673548', 'FPS', 'Karnataka', 'FPS8', 'YUVAKA MANDAL CHINCHALAKATTI', 'Bagalkote', 'Badami', '16.023', '75.4657', 'FRice', '58.13', '36.0027', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '2', 'KFCSC BAGALKOT', 'Bagalkote', 'Akki', '16.15419', '75.673548', 'FPS', 'Karnataka', 'FPS9', 'K.K.LAMANI CHINCHALAKATTI L.T.', 'Bagalkote', 'Badami', '16.0242', '75.4815', 'FRice', '38.08', '34.1574', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '8', 'TAPCMS MUDHOL', 'Bagalkote', 'Akki', '16.33083', '75.28581', 'FPS', 'Karnataka', 'FPS21', 'Ranganath Hanamappa Sunagad (PH) Inam Hanamaneri', 'Bagalkote', 'Badami', '16.1332', '75.4141', 'FRice', '34.7', '27.86', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FPS', 'Karnataka', 'FPS1', 'Gram Mandal Maninagar', 'Bagalkote', 'Badami', '16.0238', '75.6052', 'Rice', '700.0', '17.5083', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FPS', 'Karnataka', 'FPS10', 'RAIT SANGHA HANAMANERI (S)', 'Bagalkote', 'Badami', '16.0122', '75.4965', 'Millets', '6.0', '29.094', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FPS', 'Karnataka', 'FPS17', 'GRAMA MANDAL MATTIKATTI', 'Bagalkote', 'Badami', '16.0211', '75.5675', 'Millets', '6.0', '21.7544', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FPS', 'Karnataka', 'FPS1', 'Gram Mandal Maninagar', 'Bagalkote', 'Badami', '16.0238', '75.6052', 'Millets', '6.0', '17.5083', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FPS', 'Karnataka', 'FPS27', 'PKPS Halakurki', 'Bagalkote', 'Badami', '16.0047', '75.644', 'Millets', '6.0', '12.6546', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FPS', 'Karnataka', 'FPS2', 'MAHAKUTESHWAR YUVAKA MANDAL YANKANCHI', 'Bagalkote', 'Badami', '16.0227', '75.6052', 'Millets', '6.0', '17.4692', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FPS', 'Karnataka', 'FPS31', 'Secretory Neeralkeri Milk producers Co-Op Society Ltd.', 'Bagalkote', 'Badami', '15.9757', '75.4575', 'Millets', '6.0', '33.2325', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FPS', 'Karnataka', 'FPS32', 'P.K.P.S.MUSTIGERI.', 'Bagalkote', 'Akki', '15.9606', '75.57', 'Millets', '6.0', '15.4762', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FPS', 'Karnataka', 'FPS33', 'MARUTI YUVAKA MANDALA HULLIKERI INAM', 'Bagalkote', 'Akki', '15.9956', '75.6029', 'Millets', '6.0', '19.9962', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FPS', 'Karnataka', 'FPS34', 'YOUTH ASSOCIATION MUMARADDIKOPPA', 'Bagalkote', 'Akki', '15.8392', '75.63', 'Millets', '6.0', '17.934', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FPS', 'Karnataka', 'FPS35', 'P.K.P.S. UGLVAT', 'Bagalkote', 'Akki', '15.9708', '75.5406', 'Millets', '6.0', '19.1425', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FPS', 'Karnataka', 'FPS36', 'PURNANANDA YUVAKA MANDAL KALLAPUR.S.K.', 'Bagalkote', 'Akki', '15.9401', '75.504', 'Millets', '6.0', '27.0162', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FPS', 'Karnataka', 'FPS37', 'KALIKADEVI YUVAK MANDALA TAPPASAKATTI', 'Bagalkote', 'Akki', '15.9447', '75.4901', 'Millets', '6.0', '28.5578', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FPS', 'Karnataka', 'FPS38', 'MARUTI YUVAKA MANDAL HANAMASAGAR', 'Bagalkote', 'Akki', '15.9344', '75.5267', 'Millets', '6.0', '21.8193', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FPS', 'Karnataka', 'FPS39', 'PURNANAND YUVAKA MANDAL SOMANAKOPPA', 'Bagalkote', 'Akki', '15.9167', '75.5236', 'Millets', '6.0', '20.3272', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FPS', 'Karnataka', 'FPS3', 'MAHAKUTESHWAR Y.M. GUBBERAKOPPA', 'Bagalkote', 'Badami', '16.0267', '75.6126', 'Millets', '6.0', '17.641', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FPS', 'Karnataka', 'FPS40', 'L.B. NAYAKAR KHANAPUR S,K.', 'Bagalkote', 'Akki', '15.9087', '75.5007', 'Millets', '6.0', '21.7662', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FPS', 'Karnataka', 'FPS41', 'V.S.S. KAKANUR', 'Bagalkote', 'Akki', '15.9398', '75.4307', 'Millets', '6.0', '30.0824', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FPS', 'Karnataka', 'FPS42', 'GRAMA MANDALA CHIMMANAKATTI', 'Bagalkote', 'Akki', '15.9174', '75.4708', 'Millets', '6.0', '25.1245', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FPS', 'Karnataka', 'FPS43', 'NEERU BALAKEDARAR SAHAKARI SANGHA HAGANUR', 'Bagalkote', 'Akki', '15.8973', '75.4433', 'Millets', '6.0', '29.4318', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FPS', 'Karnataka', 'FPS44', 'V.S.S. TALAKAWAD', 'Bagalkote', 'Akki', '15.8853', '75.4733', 'Millets', '6.0', '25.9337', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FPS', 'Karnataka', 'FPS45', 'GRAM MANDAL NEELGUND', 'Bagalkote', 'Akki', '15.9242', '75.5473', 'Millets', '6.0', '19.2408', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FPS', 'Karnataka', 'FPS46', 'GRAM MANDAL LAKHAMAPUR', 'Bagalkote', 'Akki', '15.8642', '75.6216', 'Millets', '6.0', '11.9298', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FPS', 'Karnataka', 'FPS47', 'IRAPP. K.BIRANUR BIRANUR', 'Bagalkote', 'Akki', '15.8789', '75.4792', 'Millets', '6.0', '27.8246', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FPS', 'Karnataka', 'FPS48', 'MARUTESHWAR YUVAKA MANDAL ALUR S.K.', 'Bagalkote', 'Akki', '15.8901', '75.471', 'Millets', '6.0', '26.3396', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FPS', 'Karnataka', 'FPS49', 'BASAVESHWAR YUVAK MANDAL TIMMAPUR S.N.', 'Bagalkote', 'Akki', '15.9013', '75.5511', 'Millets', '6.0', '16.186', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FPS', 'Karnataka', 'FPS4', 'L.B. NAIKAR. KHANAPUR.S.K. 68 (C)(RADDERTIMMAPUR)', 'Bagalkote', 'Badami', '15.9938', '75.452', 'Millets', '6.0', '36.3382', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FPS', 'Karnataka', 'FPS50', 'VEERABHADHRESHWARA Y M MALLAPUR S.L.', 'Bagalkote', 'Akki', '15.8641', '75.6394', 'Millets', '6.0', '11.2153', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FPS', 'Karnataka', 'FPS51', 'Kalasa (Govonakopp) Milk producers Co op Society', 'Bagalkote', 'Akki', '15.8723', '75.4985', 'Millets', '6.0', '25.9395', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FPS', 'Karnataka', 'FPS52', 'YUVAKA MANDAL ALADAKATTI', 'Bagalkote', 'Akki', '15.904', '75.5788', 'Millets', '6.0', '13.9932', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FPS', 'Karnataka', 'FPS53', 'PKPS Hebballi', 'Bagalkote', 'Akki', '15.8388', '75.6129', 'Millets', '6.0', '15.0748', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FPS', 'Karnataka', 'FPS54', 'V.S.S. MUTTALAGERI', 'Bagalkote', 'Banglo', '15.893', '75.6166', 'Millets', '6.0', '8.718', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FPS', 'Karnataka', 'FPS55', 'MARUTESHWAR TARUN SANGHA NAVILAHOLE.', 'Bagalkote', 'Banglo', '15.8917', '75.7414', 'Millets', '6.0', '9.9904', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FPS', 'Karnataka', 'FPS56', 'BASAVALINGESHWAR Y M BACHINAGUDDA.', 'Bagalkote', 'Banglo', '15.9478', '75.7947', 'Millets', '6.0', '20.303', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FPS', 'Karnataka', 'FPS57', 'GRAM MANDAL GONAL', 'Bagalkote', 'Banglo', '15.9355', '75.7887', 'Millets', '6.0', '17.1105', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FPS', 'Karnataka', 'FPS58', 'V.S.S.CHOLACHAGUDDA', 'Bagalkote', 'Banglo', '15.8725', '75.719', 'Millets', '6.0', '6.5347', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FPS', 'Karnataka', 'FPS59', 'BANASHANKARI DEVASTHANA SEVA SAMITI BANASHANKARI.', 'Bagalkote', 'Banglo', '15.8876', '75.7049', 'Millets', '6.0', '3.0825', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FPS', 'Karnataka', 'FPS60', 'REVANASHIDDESHWAR YUVAKA SANGHA HIRENASIBI', 'Bagalkote', 'Banglo', '15.8748', '75.7291', 'Millets', '6.0', '7.3459', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FPS', 'Karnataka', 'FPS61', 'AMBEDAKAR VIDYA VARDHAKA SANGHA BELUR', 'Bagalkote', 'Banglo', '15.8472', '75.7548', 'Millets', '6.0', '12.3268', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FPS', 'Karnataka', 'FPS62', 'V.S.S.JALIHAL', 'Bagalkote', 'Banglo', '15.8423', '75.7596', 'Millets', '6.0', '12.6387', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FPS', 'Karnataka', 'FPS63', 'Halu Utpadakara sahakari sangha,Pattadakal', 'Bagalkote', 'Banglo', '15.9489', '75.8136', 'Millets', '6.0', '22.1932', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FPS', 'Karnataka', 'FPS64', 'GRAM MANDAL ADAGAL.', 'Bagalkote', 'Banglo', '15.9537', '75.6736', 'Millets', '6.0', '5.9783', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '1', 'KFCSC BADAMI', 'Bagalkote', 'Akki', '15.908997', '75.686845', 'FPS', 'Karnataka', 'FPS65', 'V.S.S.KUTAKANAKERI', 'Bagalkote', 'Banglo', '15.9827', '75.6979', 'Millets', '6.0', '9.2947', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '2', 'KFCSC BAGALKOT', 'Bagalkote', 'Akki', '16.15419', '75.673548', 'FPS', 'Karnataka', 'FPS11', 'V.S.S. NEERBUDIHAL', 'Bagalkote', 'Badami', '16.1278', '75.5244', 'Millets', '6.0', '23.2391', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '2', 'KFCSC BAGALKOT', 'Bagalkote', 'Akki', '16.15419', '75.673548', 'FPS', 'Karnataka', 'FPS12', 'GRAMA MANDAL GANGANABUDIHAL', 'Bagalkote', 'Badami', '16.1185', '75.5616', 'Millets', '6.0', '19.1749', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '2', 'KFCSC BAGALKOT', 'Bagalkote', 'Akki', '16.15419', '75.673548', 'FPS', 'Karnataka', 'FPS13', 'S.M.GONNAGAR JANGAWAD', 'Bagalkote', 'Badami', '16.0518', '75.4277', 'Millets', '6.0', '41.587', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '2', 'KFCSC BAGALKOT', 'Bagalkote', 'Akki', '16.15419', '75.673548', 'FPS', 'Karnataka', 'FPS14', 'YUVAKA MANDALA HOSAKOTI-37 (C)(KAINAKATTI)', 'Bagalkote', 'Badami', '16.0764', '75.4496', 'Millets', '6.0', '36.7004', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '2', 'KFCSC BAGALKOT', 'Bagalkote', 'Akki', '16.15419', '75.673548', 'FPS', 'Karnataka', 'FPS15', 'Y.S.NARASANVAR SHIPARMATTI', 'Bagalkote', 'Badami', '16.074', '75.4333', 'Millets', '6.0', '42.9384', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '2', 'KFCSC BAGALKOT', 'Bagalkote', 'Akki', '16.15419', '75.673548', 'FPS', 'Karnataka', 'FPS16', 'YUVAKA MANDAL HOSAKOTI', 'Bagalkote', 'Badami', '16.0641', '75.4592', 'Millets', '6.0', '40.0406', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '2', 'KFCSC BAGALKOT', 'Bagalkote', 'Akki', '16.15419', '75.673548', 'FPS', 'Karnataka', 'FPS18', 'SHIVANAND YUVAKA MANDAL MALAGI', 'Bagalkote', 'Badami', '16.0524', '75.539', 'Millets', '6.0', '25.2873', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '2', 'KFCSC BAGALKOT', 'Bagalkote', 'Akki', '16.15419', '75.673548', 'FPS', 'Karnataka', 'FPS19', 'SHRADDANAND YUVAKA MANDAL NARENUR', 'Bagalkote', 'Badami', '16.0399', '75.5084', 'Millets', '6.0', '31.4553', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '2', 'KFCSC BAGALKOT', 'Bagalkote', 'Akki', '16.15419', '75.673548', 'FPS', 'Karnataka', 'FPS20', 'KRISHNA YUVAKA MANDAL NARENUR L.T.2', 'Bagalkote', 'Badami', '16.061', '75.5132', 'Millets', '6.0', '29.8774', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '2', 'KFCSC BAGALKOT', 'Bagalkote', 'Akki', '16.15419', '75.673548', 'FPS', 'Karnataka', 'FPS22', 'PKPS Anawal', 'Bagalkote', 'Badami', '16.0983', '75.4703', 'Millets', '6.0', '32.0938', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '2', 'KFCSC BAGALKOT', 'Bagalkote', 'Akki', '16.15419', '75.673548', 'FPS', 'Karnataka', 'FPS23', 'GRAMA MANDAL KALABANDKERI', 'Bagalkote', 'Badami', '16.0848', '75.5122', 'Millets', '6.0', '26.7437', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '2', 'KFCSC BAGALKOT', 'Bagalkote', 'Akki', '16.15419', '75.673548', 'FPS', 'Karnataka', 'FPS24', 'YUVAKA MANDAL YANDIGERI', 'Bagalkote', 'Badami', '16.1311', '75.494', 'Millets', '6.0', '26.4132', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '2', 'KFCSC BAGALKOT', 'Bagalkote', 'Akki', '16.15419', '75.673548', 'FPS', 'Karnataka', 'FPS25', 'V.S.S.KAGALGOMBA', 'Bagalkote', 'Badami', '16.1115', '75.6221', 'Millets', '6.0', '13.0919', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '2', 'KFCSC BAGALKOT', 'Bagalkote', 'Akki', '16.15419', '75.673548', 'FPS', 'Karnataka', 'FPS26', 'V.S.S.KERAKALMATTI', 'Bagalkote', 'Badami', '16.1302', '75.5783', 'Millets', '6.0', '16.891', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '2', 'KFCSC BAGALKOT', 'Bagalkote', 'Akki', '16.15419', '75.673548', 'FPS', 'Karnataka', 'FPS28', 'V.S.S.HULAGERI', 'Bagalkote', 'Badami', '16.0864', '75.5823', 'Millets', '6.0', '18.4422', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '2', 'KFCSC BAGALKOT', 'Bagalkote', 'Akki', '16.15419', '75.673548', 'FPS', 'Karnataka', 'FPS29', 'BASAVESHWARA YUVAKA MANDAL JALAGERI', 'Bagalkote', 'Badami', '16.1058', '75.5448', 'Millets', '6.0', '21.5481', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '2', 'KFCSC BAGALKOT', 'Bagalkote', 'Akki', '16.15419', '75.673548', 'FPS', 'Karnataka', 'FPS30', 'Manjunatha Shivappa Rathod (PH)', 'Bagalkote', 'Badami', '16.0932', '75.5269', 'Millets', '6.0', '24.7305', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '2', 'KFCSC BAGALKOT', 'Bagalkote', 'Akki', '16.15419', '75.673548', 'FPS', 'Karnataka', 'FPS5', 'YUVAKA MANDAL HAVALAKOD', 'Bagalkote', 'Badami', '16.0257', '75.4523', 'Millets', '6.0', '39.056', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '2', 'KFCSC BAGALKOT', 'Bagalkote', 'Akki', '16.15419', '75.673548', 'FPS', 'Karnataka', 'FPS6', 'MARUTI YUVAKA MANDAL FAKIRBUDIHAL', 'Bagalkote', 'Badami', '16.0502', '75.4754', 'Millets', '6.0', '39.2549', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '2', 'KFCSC BAGALKOT', 'Bagalkote', 'Akki', '16.15419', '75.673548', 'FPS', 'Karnataka', 'FPS7', 'YUVAKA MANDAL SAGANUR', 'Bagalkote', 'Badami', '16.0437', '75.474', 'Millets', '6.0', '38.5561', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '2', 'KFCSC BAGALKOT', 'Bagalkote', 'Akki', '16.15419', '75.673548', 'FPS', 'Karnataka', 'FPS8', 'YUVAKA MANDAL CHINCHALAKATTI', 'Bagalkote', 'Badami', '16.023', '75.4657', 'Millets', '6.0', '36.0027', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '2', 'KFCSC BAGALKOT', 'Bagalkote', 'Akki', '16.15419', '75.673548', 'FPS', 'Karnataka', 'FPS9', 'K.K.LAMANI CHINCHALAKATTI L.T.', 'Bagalkote', 'Badami', '16.0242', '75.4815', 'Millets', '6.0', '34.1574', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented'),
('Optimized', 'Depot', 'Karnataka', '8', 'TAPCMS MUDHOL', 'Bagalkote', 'Akki', '16.33083', '75.28581', 'FPS', 'Karnataka', 'FPS21', 'Ranganath Hanamappa Sunagad (PH) Inam Hanamaneri', 'Bagalkote', 'Badami', '16.1332', '75.4141', 'Millets', '6.0', '27.86', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Implemented');

-- --------------------------------------------------------

--
-- Table structure for table `optimised_table`
--

CREATE TABLE `optimised_table` (
  `id` varchar(255) NOT NULL,
  `month` varchar(255) NOT NULL,
  `year` varchar(255) NOT NULL,
  `applicable` varchar(255) NOT NULL,
  `data` varchar(255) NOT NULL,
  `last_updated` varchar(255) NOT NULL,
  `rolled_out` varchar(255) NOT NULL DEFAULT '0',
  `cost` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `optimised_table`
--

INSERT INTO `optimised_table` (`id`, `month`, `year`, `applicable`, `data`, `last_updated`, `rolled_out`, `cost`) VALUES
('hHfqZK5t5HQMCd', 'Dec', '2025', 'Jan', '37366057.32301996', '2024-09-20 12:39:50', '1', ''),
('dkruCm1X3P1Tlj', 'jan', '2026', 'feb', '', '2026-01-07 17:02:52', '0', ''),
('s3SUWCezjYhEJu', 'feb', '2026', 'feb', '8860.2144', '2026-02-18 12:02:44', '0', ''),
('Epjk7mViqVOf9z', 'march', '2026', 'feb', '7624199.2', '2026-03-07 07:57:52', '0', ''),
('fMNN8pAovARUFQ', 'june', '2026', 'feb', '7624199.2', '2026-06-25 14:47:57', '0', ''),
('o26HX1j6RMwu2u', 'july', '2026', 'feb', '7624199.2', '2026-07-31 18:54:31', '0', '');

-- --------------------------------------------------------

--
-- Table structure for table `optimised_table_leg1`
--

CREATE TABLE `optimised_table_leg1` (
  `id` varchar(255) NOT NULL,
  `month` varchar(255) NOT NULL,
  `year` varchar(255) NOT NULL,
  `applicable` varchar(255) NOT NULL,
  `data` varchar(255) NOT NULL,
  `last_updated` varchar(255) NOT NULL,
  `rolled_out` varchar(255) NOT NULL DEFAULT '0',
  `cost` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `optimised_table_leg1`
--

INSERT INTO `optimised_table_leg1` (`id`, `month`, `year`, `applicable`, `data`, `last_updated`, `rolled_out`, `cost`) VALUES
('gfyIp22F19cvwh', 'sept', '2024', 'sept', '103605101.82933998', '2024-09-20 15:44:56', '0', ''),
('5nP4gOHmYHmoK0', 'feb', '2026', 'feb', '511197.9763950002', '2026-02-18 13:51:47', '0', '');

-- --------------------------------------------------------

--
-- Table structure for table `taluka`
--

CREATE TABLE `taluka` (
  `id` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `taluka`
--

INSERT INTO `taluka` (`id`, `name`) VALUES
('69491d74d29d1', 'Badami'),
('695e33a21ec54', 'akki'),
('695e33af9372b', 'banglo');

-- --------------------------------------------------------

--
-- Table structure for table `timer`
--

CREATE TABLE `timer` (
  `deadline_date` varchar(255) NOT NULL,
  `deadline_time` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `timer`
--

INSERT INTO `timer` (`deadline_date`, `deadline_time`) VALUES
('2026-01-31', '00:30');

-- --------------------------------------------------------

--
-- Table structure for table `user_message`
--

CREATE TABLE `user_message` (
  `id` varchar(100) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `message` varchar(2000) NOT NULL,
  `date` varchar(100) NOT NULL,
  `acknowledged` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `warehouse`
--

CREATE TABLE `warehouse` (
  `district` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `id` varchar(100) NOT NULL,
  `warehousetype` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `latitude` varchar(100) NOT NULL,
  `longitude` varchar(100) NOT NULL,
  `storage` varchar(100) NOT NULL,
  `uniqueid` varchar(100) NOT NULL,
  `active` varchar(10) NOT NULL DEFAULT '1',
  `taluka` varchar(255) DEFAULT NULL,
  `ragi` int(11) DEFAULT NULL,
  `jowar` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `warehouse`
--

INSERT INTO `warehouse` (`district`, `name`, `id`, `warehousetype`, `type`, `latitude`, `longitude`, `storage`, `uniqueid`, `active`, `taluka`, `ragi`, `jowar`) VALUES
('Bagalkote', 'Array', '123.00', 'swc', 'motorable', '27.89', '78.4', '1000', 'WH_69ab83b911e5', '1', 'Akki', 50000, 500000),
('Bagalkote', 'Kk', '260017370006.00', 'swc', 'motorable', '27.89', '78.4', '1000', 'WH_69ab83b91c0a', '1', 'Badami', 5000000, 1098),
('Bagalkote', 'Kk', '26001737000.00', 'swc', 'motorable', '27.89', '78.4', '1000', 'WH_69ab83b932e7', '1', 'Akki', 500, 1000);

-- --------------------------------------------------------

--
-- Table structure for table `warehouse_epjk7mviqvof9z`
--

CREATE TABLE `warehouse_epjk7mviqvof9z` (
  `district` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `id` varchar(100) NOT NULL,
  `warehousetype` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `latitude` varchar(100) NOT NULL,
  `longitude` varchar(100) NOT NULL,
  `storage` varchar(100) NOT NULL,
  `uniqueid` varchar(100) NOT NULL,
  `active` varchar(10) NOT NULL DEFAULT '1',
  `taluka` varchar(100) NOT NULL,
  `ragi` varchar(100) NOT NULL,
  `jowar` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `warehouse_epjk7mviqvof9z`
--

INSERT INTO `warehouse_epjk7mviqvof9z` (`district`, `name`, `id`, `warehousetype`, `type`, `latitude`, `longitude`, `storage`, `uniqueid`, `active`, `taluka`, `ragi`, `jowar`) VALUES
('Bagalkote', 'Array', '123.00', 'swc', 'motorable', '27.89', '78.4', '1000', 'WH_69ab83b911e5', '1', 'Akki', '50000', '500000'),
('Bagalkote', 'Kk', '260017370006.00', 'swc', 'motorable', '27.89', '78.4', '1000', 'WH_69ab83b91c0a', '1', 'Badami', '5000000', '1098'),
('Bagalkote', 'Kk', '26001737000.00', 'swc', 'motorable', '27.89', '78.4', '1000', 'WH_69ab83b932e7', '1', 'Akki', '500', '1000');

-- --------------------------------------------------------

--
-- Table structure for table `warehouse_fmnn8paovarufq`
--

CREATE TABLE `warehouse_fmnn8paovarufq` (
  `district` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `id` varchar(100) NOT NULL,
  `warehousetype` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `latitude` varchar(100) NOT NULL,
  `longitude` varchar(100) NOT NULL,
  `storage` varchar(100) NOT NULL,
  `uniqueid` varchar(100) NOT NULL,
  `active` varchar(10) NOT NULL DEFAULT '1',
  `taluka` varchar(100) NOT NULL,
  `ragi` varchar(100) NOT NULL,
  `jowar` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `warehouse_fmnn8paovarufq`
--

INSERT INTO `warehouse_fmnn8paovarufq` (`district`, `name`, `id`, `warehousetype`, `type`, `latitude`, `longitude`, `storage`, `uniqueid`, `active`, `taluka`, `ragi`, `jowar`) VALUES
('Bagalkote', 'Array', '123.00', 'swc', 'motorable', '27.89', '78.4', '1000', 'WH_69ab83b911e5', '1', 'Akki', '50000', '500000'),
('Bagalkote', 'Kk', '260017370006.00', 'swc', 'motorable', '27.89', '78.4', '1000', 'WH_69ab83b91c0a', '1', 'Badami', '5000000', '1098'),
('Bagalkote', 'Kk', '26001737000.00', 'swc', 'motorable', '27.89', '78.4', '1000', 'WH_69ab83b932e7', '1', 'Akki', '500', '1000');

-- --------------------------------------------------------

--
-- Table structure for table `warehouse_leg1_5np4gohmyhmok0`
--

CREATE TABLE `warehouse_leg1_5np4gohmyhmok0` (
  `district` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `id` varchar(100) NOT NULL,
  `warehousetype` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `latitude` varchar(100) NOT NULL,
  `longitude` varchar(100) NOT NULL,
  `storage` varchar(100) NOT NULL,
  `block` varchar(100) NOT NULL,
  `uniqueid` varchar(100) NOT NULL,
  `active` varchar(10) NOT NULL DEFAULT '1',
  `millets` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `warehouse_leg1_5np4gohmyhmok0`
--

INSERT INTO `warehouse_leg1_5np4gohmyhmok0` (`district`, `name`, `id`, `warehousetype`, `type`, `latitude`, `longitude`, `storage`, `block`, `uniqueid`, `active`, `millets`) VALUES
('Bagalkote', 'KFCSC BADAMI', '1', 'KFCSC', 'Motorable', '15.908997', '75.686845', '19000', 'WH_69932f8c074a', '1', 'Akki', '300'),
('Bagalkote', 'KFCSC BAGALKOT', '2', 'KFCSC', 'Motorable', '16.15419', '75.673548', '20000', 'WH_69932f8c4c30', '1', 'Akki', '300'),
('Bagalkote', 'KFCSC BILAGI', '3', 'KFCSC', 'Motorable', '16.344156', '75.622281', '4000', 'WH_69932f8c6470', '1', 'Akki', '300'),
('Bagalkote', 'TAPCMS BILAGI', '4', 'TAPCMS', 'Motorable', '16.344298', '75.622206', '5000', 'WH_69932f8c7ef0', '1', 'Akki', '300'),
('Bagalkote', 'KFCSC HUNGUND', '5', 'KFCSC', 'Motorable', '16.053845', '76.067948', '11000', 'WH_69932f8c8b21', '1', 'Akki', '300'),
('Bagalkote', 'TAPCMS JAMKHANDI', '6', 'TAPCMS', 'Motorable', '16.511484', '75.27787', '25000', 'WH_69932f8c975d', '1', 'Akki', '300'),
('Bagalkote', 'KFCSC MUDHOL', '7', 'KFCSC', 'Motorable', '16.355306', '75.276441', '20000', 'WH_69932f8ca182', '1', 'Akki', '300'),
('Bagalkote', 'TAPCMS MUDHOL', '8', 'TAPCMS', 'Motorable', '16.33083', '75.28581', '7500', 'WH_69932f8cadc6', '1', 'Akki', '300');

-- --------------------------------------------------------

--
-- Table structure for table `warehouse_o26hx1j6rmwu2u`
--

CREATE TABLE `warehouse_o26hx1j6rmwu2u` (
  `district` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `id` varchar(100) NOT NULL,
  `warehousetype` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `latitude` varchar(100) NOT NULL,
  `longitude` varchar(100) NOT NULL,
  `storage` varchar(100) NOT NULL,
  `uniqueid` varchar(100) NOT NULL,
  `active` varchar(10) NOT NULL DEFAULT '1',
  `taluka` varchar(100) NOT NULL,
  `ragi` varchar(100) NOT NULL,
  `jowar` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `warehouse_o26hx1j6rmwu2u`
--

INSERT INTO `warehouse_o26hx1j6rmwu2u` (`district`, `name`, `id`, `warehousetype`, `type`, `latitude`, `longitude`, `storage`, `uniqueid`, `active`, `taluka`, `ragi`, `jowar`) VALUES
('Bagalkote', 'Array', '123.00', 'swc', 'motorable', '27.89', '78.4', '1000', 'WH_69ab83b911e5', '1', 'Akki', '50000', '500000'),
('Bagalkote', 'Kk', '260017370006.00', 'swc', 'motorable', '27.89', '78.4', '1000', 'WH_69ab83b91c0a', '1', 'Badami', '5000000', '1098'),
('Bagalkote', 'Kk', '26001737000.00', 'swc', 'motorable', '27.89', '78.4', '1000', 'WH_69ab83b932e7', '1', 'Akki', '500', '1000');

-- --------------------------------------------------------

--
-- Table structure for table `warehouse_s3suwcezjyheju`
--

CREATE TABLE `warehouse_s3suwcezjyheju` (
  `district` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `id` varchar(100) NOT NULL,
  `warehousetype` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `latitude` varchar(100) NOT NULL,
  `longitude` varchar(100) NOT NULL,
  `storage` varchar(100) NOT NULL,
  `uniqueid` varchar(100) NOT NULL,
  `active` varchar(10) NOT NULL DEFAULT '1',
  `taluka` varchar(100) NOT NULL,
  `millets` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `warehouse_s3suwcezjyheju`
--

INSERT INTO `warehouse_s3suwcezjyheju` (`district`, `name`, `id`, `warehousetype`, `type`, `latitude`, `longitude`, `storage`, `uniqueid`, `active`, `taluka`, `millets`) VALUES
('Bagalkote', 'KFCSC BADAMI', '1', 'KFCSC', 'Motorable', '15.908997', '75.686845', '19000', 'WH_69932f8c074a', '1', 'Akki', '300'),
('Bagalkote', 'KFCSC BAGALKOT', '2', 'KFCSC', 'Motorable', '16.15419', '75.673548', '20000', 'WH_69932f8c4c30', '1', 'Akki', '300'),
('Bagalkote', 'KFCSC BILAGI', '3', 'KFCSC', 'Motorable', '16.344156', '75.622281', '4000', 'WH_69932f8c6470', '1', 'Akki', '300'),
('Bagalkote', 'TAPCMS BILAGI', '4', 'TAPCMS', 'Motorable', '16.344298', '75.622206', '5000', 'WH_69932f8c7ef0', '1', 'Akki', '300'),
('Bagalkote', 'KFCSC HUNGUND', '5', 'KFCSC', 'Motorable', '16.053845', '76.067948', '11000', 'WH_69932f8c8b21', '1', 'Akki', '300'),
('Bagalkote', 'TAPCMS JAMKHANDI', '6', 'TAPCMS', 'Motorable', '16.511484', '75.27787', '25000', 'WH_69932f8c975d', '1', 'Akki', '300'),
('Bagalkote', 'KFCSC MUDHOL', '7', 'KFCSC', 'Motorable', '16.355306', '75.276441', '20000', 'WH_69932f8ca182', '1', 'Akki', '300'),
('Bagalkote', 'TAPCMS MUDHOL', '8', 'TAPCMS', 'Motorable', '16.33083', '75.28581', '7500', 'WH_69932f8cadc6', '1', 'Akki', '300');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
