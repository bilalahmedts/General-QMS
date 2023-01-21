-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 21, 2023 at 01:41 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.0.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `qms`
--

-- --------------------------------------------------------

--
-- Table structure for table `campaigns`
--

CREATE TABLE `campaigns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `table_name` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `database_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','disabled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `campaigns`
--

INSERT INTO `campaigns` (`id`, `table_name`, `database_name`, `name`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, '', NULL, 'QUALITY ASSURANCE', 'active', NULL, '2022-06-08 06:51:50', '2022-10-14 04:23:35'),
(2, '', NULL, 'EDDY', 'active', NULL, '2022-06-08 06:51:49', '2022-06-08 06:51:49'),
(3, '', NULL, 'GUIDANCE', 'active', NULL, NULL, NULL),
(4, '', NULL, 'DSS\r\n', 'active', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `campaign_datapoint_category`
--

CREATE TABLE `campaign_datapoint_category` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `campaign_id` int(10) UNSIGNED NOT NULL,
  `datapoint_category_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `campaign_datapoint_category`
--

INSERT INTO `campaign_datapoint_category` (`id`, `campaign_id`, `datapoint_category_id`) VALUES
(1, 66, 6);

-- --------------------------------------------------------

--
-- Table structure for table `campaign_voice_custom_field`
--

CREATE TABLE `campaign_voice_custom_field` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `campaign_id` int(10) UNSIGNED NOT NULL,
  `voice_custom_field_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `datapoints`
--

CREATE TABLE `datapoints` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `voice_evaluation_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `datapoint_category_id` int(10) UNSIGNED NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  `campaign_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `question` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `score` int(11) DEFAULT NULL,
  `sort` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `status` enum('active','disabled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `datapoints`
--

INSERT INTO `datapoints` (`id`, `voice_evaluation_id`, `datapoint_category_id`, `project_id`, `campaign_id`, `name`, `question`, `score`, `sort`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 2, 'Intonations', 'Did the agent use voice inflexion?', NULL, 1, 'active', NULL, '2023-01-17 08:10:32', '2023-01-17 08:10:32'),
(2, 1, 1, 1, 2, 'Conciseness', 'Did the agent keep the call short and concise?', NULL, 1, 'active', NULL, '2023-01-17 08:11:07', '2023-01-17 08:11:07'),
(3, 1, 1, 1, 2, 'Clarity', 'Did the agent speak with a neutral accent and pronunciation?', NULL, 1, 'active', NULL, '2023-01-17 08:11:17', '2023-01-17 08:11:17'),
(4, 1, 1, 1, 2, 'Concreteness', 'Did the agent do a good job painting a clear picture about benefits in the customer\'s mind?', NULL, 1, 'active', NULL, '2023-01-17 08:11:31', '2023-01-17 08:11:31'),
(5, 1, 1, 1, 2, 'Correctness', 'Was the agent grammatically accurate?', NULL, 1, 'active', NULL, '2023-01-17 08:11:43', '2023-01-17 08:11:43'),
(6, 1, 2, 1, 2, 'Effort', 'Was the agent persistent and did not quit at the first NO?', NULL, 1, 'active', NULL, '2023-01-18 05:01:19', '2023-01-18 05:01:19'),
(7, 1, 2, 1, 2, 'Cross Sells', 'Did the agent try to cross sell the product?', NULL, 1, 'active', NULL, '2023-01-18 05:01:35', '2023-01-18 05:01:35'),
(8, 1, 2, 1, 2, 'Identify Opportunity', 'Did the agent actively listen and identify customers interest?', NULL, 1, 'active', NULL, '2023-01-18 05:01:51', '2023-01-18 05:01:51'),
(9, 1, 2, 1, 2, 'Effective Questioning', 'Did the agent question effectively to probe the need of the customer?', NULL, 1, 'active', NULL, '2023-01-18 05:02:03', '2023-01-18 05:02:03'),
(10, 1, 2, 1, 2, 'Effective Closing', 'Did the agent handle the sale from begining to the end?', NULL, 1, 'active', NULL, '2023-01-18 05:02:16', '2023-01-18 05:02:16'),
(11, 1, 3, 1, 2, 'TCPA', 'Did the agent deliver the TCPA Disclaimer Verbatim?', NULL, 1, 'active', NULL, '2023-01-18 05:03:04', '2023-01-18 05:03:04'),
(12, 1, 3, 1, 2, 'Appropriate Behaviour', 'Did the agent demonstrate appropriate conduct and appropriate language?', NULL, 1, 'active', NULL, '2023-01-18 05:03:13', '2023-01-18 05:03:13'),
(13, 1, 3, 1, 2, 'Ethics', 'Did the agent submit an ethical / Valid Lead?', NULL, 1, 'active', NULL, '2023-01-18 05:03:20', '2023-01-18 05:03:20'),
(14, 1, 3, 1, 2, 'Trapper Identification / Deflection', 'Did the agent identify if the customer was a potential trapper?', NULL, 1, 'active', NULL, '2023-01-18 05:04:19', '2023-01-18 05:04:19'),
(15, 1, 3, 1, 2, 'Company Policies', 'Did the agent comply with the company policies while on call?', NULL, 1, 'active', NULL, '2023-01-18 05:04:33', '2023-01-18 05:04:33'),
(16, 1, 4, 1, 2, 'Consideration', 'Did the agent match the customer\'s pace?', NULL, 1, 'active', NULL, '2023-01-18 05:05:00', '2023-01-18 05:05:00'),
(17, 1, 4, 1, 2, 'Courtesy', 'Was the agent courteous with the customer?', NULL, 1, 'active', NULL, '2023-01-18 05:05:10', '2023-01-18 05:05:10'),
(18, 1, 4, 1, 2, 'Professional Attitude', 'Was the agent professional during the call?', NULL, 1, 'active', NULL, '2023-01-18 05:05:19', '2023-01-18 05:05:19'),
(19, 1, 4, 1, 2, 'Confidence / Control', 'Did the agent sound confident and in control?', NULL, 1, 'active', NULL, '2023-01-18 05:05:28', '2023-01-18 05:05:28'),
(20, 1, 4, 1, 2, 'Rapport Building', 'Did the agent build Rapport with the customer?', NULL, 1, 'active', NULL, '2023-01-18 05:05:36', '2023-01-18 05:05:36'),
(21, 1, 5, 1, 2, 'Completeness', 'Has the agent followed campaign guidelines?', NULL, 1, 'active', NULL, '2023-01-18 05:06:11', '2023-01-18 05:06:11'),
(22, 1, 5, 1, 2, 'Benefit Statements', 'Did the agent deliver any beneficial statements in the call?', NULL, 1, 'active', NULL, '2023-01-18 05:06:21', '2023-01-18 05:06:21'),
(23, 1, 5, 1, 2, 'Rebuttals', 'Did the agent effectively rebut the prospect?', NULL, 1, 'active', NULL, '2023-01-18 05:06:35', '2023-01-18 05:06:35'),
(24, 1, 5, 1, 2, 'Customer Concerns', 'Did the agent identify and handle the customers concerns?', NULL, 1, 'active', NULL, '2023-01-18 05:06:47', '2023-01-18 05:06:47'),
(25, 1, 5, 1, 2, 'Concept Clarity', 'Is the agent clear about concepts related to the product?', NULL, 1, 'active', NULL, '2023-01-18 05:06:57', '2023-01-18 05:06:57'),
(26, 1, 6, 2, 2, 'Intonations', 'Did the agent use voice inflexion?', NULL, 1, 'active', NULL, NULL, NULL),
(27, 1, 6, 2, 2, 'Conciseness', 'Did the agent keep the call short and concise?', NULL, 1, 'active', NULL, NULL, NULL),
(28, 1, 6, 2, 2, 'Clarity', 'Did the agent speak with a neutral accent and pronunciation?', NULL, 1, 'active', NULL, NULL, NULL),
(29, 1, 6, 2, 2, 'Concreteness', 'Did the agent do a good job painting a clear picture about benefits in the customer\'s mind?', NULL, 1, 'active', NULL, NULL, NULL),
(30, 1, 6, 2, 2, 'Correctness', 'Was the agent grammatically accurate?', NULL, 1, 'active', NULL, NULL, NULL),
(31, 1, 7, 2, 2, 'Effort', 'Was the agent persistent and did not quit at the first NO?', NULL, 1, 'active', NULL, NULL, NULL),
(32, 1, 7, 2, 2, 'Cross Sells', 'Did the agent try to cross sell the product?', NULL, 1, 'active', NULL, NULL, NULL),
(33, 1, 7, 2, 2, 'Identify Opportunity', 'Did the agent actively listen and identify customers interest?', NULL, 1, 'active', NULL, NULL, NULL),
(34, 1, 7, 2, 2, 'Effective Questioning', 'Did the agent question effectively to probe the need of the customer?', NULL, 1, 'active', NULL, NULL, NULL),
(35, 1, 7, 2, 2, 'Effective Closing', 'Did the agent handle the sale from begining to the end?', NULL, 1, 'active', NULL, NULL, NULL),
(36, 1, 8, 2, 2, 'TCPA', 'Did the agent deliver the TCPA Disclaimer Verbatim?', NULL, 1, 'active', NULL, NULL, NULL),
(37, 1, 8, 2, 2, 'Appropriate Behaviour', 'Did the agent demonstrate appropriate conduct and appropriate language?', NULL, 1, 'active', NULL, NULL, NULL),
(38, 1, 8, 2, 2, 'Ethics', 'Did the agent submit an ethical / Valid Lead?', NULL, 1, 'active', NULL, NULL, NULL),
(39, 1, 8, 2, 2, 'Trapper Identification / Deflection', 'Did the agent identify if the customer was a potential trapper?', NULL, 1, 'active', NULL, NULL, NULL),
(40, 1, 8, 2, 2, 'Company Policies', 'Did the agent comply with the company policies while on call?', NULL, 1, 'active', NULL, NULL, NULL),
(41, 1, 9, 2, 2, 'Consideration', 'Did the agent match the customer\'s pace?', NULL, 1, 'active', NULL, NULL, NULL),
(42, 1, 9, 2, 2, 'Courtesy', 'Was the agent courteous with the customer?', NULL, 1, 'active', NULL, NULL, NULL),
(43, 1, 9, 2, 2, 'Professional Attitude', 'Was the agent professional during the call?', NULL, 1, 'active', NULL, NULL, NULL),
(44, 1, 9, 2, 2, 'Confidence / Control', 'Did the agent sound confident and in control?', NULL, 1, 'active', NULL, NULL, NULL),
(45, 1, 9, 2, 2, 'Rapport Building', 'Did the agent build Rapport with the customer?', NULL, 1, 'active', NULL, NULL, NULL),
(46, 1, 10, 2, 2, 'Completeness', 'Has the agent followed campaign guidelines?', NULL, 1, 'active', NULL, NULL, NULL),
(47, 1, 10, 2, 2, 'Benefit Statements', 'Did the agent deliver any beneficial statements in the call?', NULL, 1, 'active', NULL, NULL, NULL),
(48, 1, 10, 2, 2, 'Rebuttals', 'Did the agent effectively rebut the prospect?', NULL, 1, 'active', NULL, NULL, NULL),
(49, 1, 10, 2, 2, 'Customer Concerns', 'Did the agent identify and handle the customers concerns?', NULL, 1, 'active', NULL, NULL, NULL),
(50, 1, 10, 2, 2, 'Concept Clarity', 'Is the agent clear about concepts related to the product?', NULL, 1, 'active', NULL, NULL, NULL),
(51, 1, 11, 3, 2, 'Intonations', 'Did the agent use voice inflexion?', NULL, 1, 'active', NULL, NULL, NULL),
(52, 1, 11, 3, 2, 'Conciseness', 'Did the agent keep the call short and concise?', NULL, 1, 'active', NULL, NULL, NULL),
(53, 1, 11, 3, 2, 'Clarity', 'Did the agent speak with a neutral accent and pronunciation?', NULL, 1, 'active', NULL, NULL, NULL),
(54, 1, 11, 3, 2, 'Concreteness', 'Did the agent do a good job painting a clear picture about benefits in the customer\'s mind?', NULL, 1, 'active', NULL, NULL, NULL),
(55, 1, 11, 3, 2, 'Correctness', 'Was the agent grammatically accurate?', NULL, 1, 'active', NULL, NULL, NULL),
(56, 1, 12, 3, 2, 'Effort', 'Was the agent persistent and did not quit at the first NO?', NULL, 1, 'active', NULL, NULL, NULL),
(57, 1, 12, 3, 2, 'Cross Sells', 'Did the agent try to cross sell the product?', NULL, 1, 'active', NULL, NULL, NULL),
(58, 1, 12, 3, 2, 'Identify Opportunity', 'Did the agent actively listen and identify customers interest?', NULL, 1, 'active', NULL, NULL, NULL),
(59, 1, 12, 3, 2, 'Effective Questioning', 'Did the agent question effectively to probe the need of the customer?', NULL, 1, 'active', NULL, NULL, NULL),
(60, 1, 12, 3, 2, 'Effective Closing', 'Did the agent handle the sale from begining to the end?', NULL, 1, 'active', NULL, NULL, NULL),
(61, 1, 13, 3, 2, 'TCPA', 'Did the agent deliver the TCPA Disclaimer Verbatim?', NULL, 1, 'active', NULL, NULL, NULL),
(62, 1, 13, 3, 2, 'Appropriate Behaviour', 'Did the agent demonstrate appropriate conduct and appropriate language?', NULL, 1, 'active', NULL, NULL, NULL),
(63, 1, 13, 3, 2, 'Ethics', 'Did the agent submit an ethical / Valid Lead?', NULL, 1, 'active', NULL, NULL, NULL),
(64, 1, 13, 3, 2, 'Trapper Identification / Deflection', 'Did the agent identify if the customer was a potential trapper?', NULL, 1, 'active', NULL, NULL, NULL),
(65, 1, 13, 3, 2, 'Company Policies', 'Did the agent comply with the company policies while on call?', NULL, 1, 'active', NULL, NULL, NULL),
(66, 1, 14, 3, 2, 'Consideration', 'Did the agent match the customer\'s pace?', NULL, 1, 'active', NULL, NULL, NULL),
(67, 1, 14, 3, 2, 'Courtesy', 'Was the agent courteous with the customer?', NULL, 1, 'active', NULL, NULL, NULL),
(68, 1, 14, 3, 2, 'Professional Attitude', 'Was the agent professional during the call?', NULL, 1, 'active', NULL, NULL, NULL),
(69, 1, 14, 3, 2, 'Confidence / Control', 'Did the agent sound confident and in control?', NULL, 1, 'active', NULL, NULL, NULL),
(70, 1, 14, 3, 2, 'Rapport Building', 'Did the agent build Rapport with the customer?', NULL, 1, 'active', NULL, NULL, NULL),
(71, 1, 15, 3, 2, 'Completeness', 'Has the agent followed campaign guidelines?', NULL, 1, 'active', NULL, NULL, NULL),
(72, 1, 15, 3, 2, 'Benefit Statements', 'Did the agent deliver any beneficial statements in the call?', NULL, 1, 'active', NULL, NULL, NULL),
(73, 1, 15, 3, 2, 'Rebuttals', 'Did the agent effectively rebut the prospect?', NULL, 1, 'active', NULL, NULL, NULL),
(74, 1, 15, 3, 2, 'Customer Concerns', 'Did the agent identify and handle the customers concerns?', NULL, 1, 'active', NULL, NULL, NULL),
(75, 1, 15, 3, 2, 'Concept Clarity', 'Is the agent clear about concepts related to the product?', NULL, 1, 'active', NULL, NULL, NULL),
(76, 1, 16, 4, 3, 'Intonations', 'Did the agent use voice inflexion?', NULL, 1, 'active', NULL, NULL, NULL),
(77, 1, 16, 4, 3, 'Conciseness', 'Did the agent keep the call short and concise?', NULL, 1, 'active', NULL, NULL, NULL),
(78, 1, 16, 4, 3, 'Clarity', 'Did the agent speak with a neutral accent and pronunciation?', NULL, 1, 'active', NULL, NULL, NULL),
(79, 1, 16, 4, 3, 'Concreteness', 'Did the agent do a good job painting a clear picture about benefits in the customer\'s mind?', NULL, 1, 'active', NULL, NULL, NULL),
(80, 1, 16, 4, 3, 'Correctness', 'Was the agent grammatically accurate?', NULL, 1, 'active', NULL, NULL, NULL),
(81, 1, 17, 4, 3, 'Effort', 'Was the agent persistent and did not quit at the first NO?', NULL, 1, 'active', NULL, NULL, NULL),
(82, 1, 17, 4, 3, 'Cross Sells', 'Did the agent try to cross sell the product?', NULL, 1, 'active', NULL, NULL, NULL),
(83, 1, 17, 4, 3, 'Identify Opportunity', 'Did the agent actively listen and identify customers interest?', NULL, 1, 'active', NULL, NULL, NULL),
(84, 1, 17, 4, 3, 'Effective Questioning', 'Did the agent question effectively to probe the need of the customer?', NULL, 1, 'active', NULL, NULL, NULL),
(85, 1, 17, 4, 3, 'Effective Closing', 'Did the agent handle the sale from begining to the end?', NULL, 1, 'active', NULL, NULL, NULL),
(86, 1, 18, 4, 3, 'TCPA', 'Did the agent deliver the TCPA Disclaimer Verbatim?', NULL, 1, 'active', NULL, NULL, NULL),
(87, 1, 18, 4, 3, 'Appropriate Behaviour', 'Did the agent demonstrate appropriate conduct and appropriate language?', NULL, 1, 'active', NULL, NULL, NULL),
(88, 1, 18, 4, 3, 'Ethics', 'Did the agent submit an ethical / Valid Lead?', NULL, 1, 'active', NULL, NULL, NULL),
(89, 1, 18, 4, 3, 'Trapper Identification / Deflection', 'Did the agent identify if the customer was a potential trapper?', NULL, 1, 'active', NULL, NULL, NULL),
(90, 1, 18, 4, 3, 'Company Policies', 'Did the agent comply with the company policies while on call?', NULL, 1, 'active', NULL, NULL, NULL),
(91, 1, 19, 4, 3, 'Consideration', 'Did the agent match the customer\'s pace?', NULL, 1, 'active', NULL, NULL, NULL),
(92, 1, 19, 4, 3, 'Courtesy', 'Was the agent courteous with the customer?', NULL, 1, 'active', NULL, NULL, NULL),
(93, 1, 19, 4, 3, 'Professional Attitude', 'Was the agent professional during the call?', NULL, 1, 'active', NULL, NULL, NULL),
(94, 1, 19, 4, 3, 'Confidence / Control', 'Did the agent sound confident and in control?', NULL, 1, 'active', NULL, NULL, NULL),
(95, 1, 19, 4, 3, 'Rapport Building', 'Did the agent build Rapport with the customer?', NULL, 1, 'active', NULL, NULL, NULL),
(96, 1, 20, 4, 3, 'Completeness', 'Has the agent followed campaign guidelines?', NULL, 1, 'active', NULL, NULL, NULL),
(97, 1, 20, 4, 3, 'Benefit Statements', 'Did the agent deliver any beneficial statements in the call?', NULL, 1, 'active', NULL, NULL, NULL),
(98, 1, 20, 4, 3, 'Rebuttals', 'Did the agent effectively rebut the prospect?', NULL, 1, 'active', NULL, NULL, NULL),
(99, 1, 20, 4, 3, 'Customer Concerns', 'Did the agent identify and handle the customers concerns?', NULL, 1, 'active', NULL, NULL, NULL),
(100, 1, 20, 3, 3, 'Concept Clarity', 'Is the agent clear about concepts related to the product?', NULL, 1, 'active', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `datapoint_categories`
--

CREATE TABLE `datapoint_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `voice_evaluation_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `campaign_id` int(11) NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `status` enum('active','disabled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `added_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `datapoint_categories`
--

INSERT INTO `datapoint_categories` (`id`, `voice_evaluation_id`, `campaign_id`, `project_id`, `name`, `sort`, `status`, `added_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 1, 'Communication', 1, 'active', 1, NULL, '2023-01-17 04:59:19', '2023-01-17 04:59:19'),
(2, 1, 2, 1, 'Sales', 1, 'active', 1, NULL, '2023-01-17 05:06:53', '2023-01-17 05:06:53'),
(3, 1, 2, 1, 'Compliance', 1, 'active', 1, NULL, '2023-01-17 05:07:10', '2023-01-17 05:07:10'),
(4, 1, 2, 1, 'Customer Service', 1, 'active', 1, NULL, '2023-01-17 05:07:24', '2023-01-17 05:07:24'),
(5, 1, 2, 1, 'Product Presentation', 1, 'active', 1, NULL, '2023-01-17 05:07:38', '2023-01-17 05:07:38'),
(6, 1, 2, 2, 'Communication', 1, 'active', NULL, NULL, NULL, NULL),
(7, 1, 2, 2, 'Sales', 1, 'active', NULL, NULL, NULL, NULL),
(8, 1, 2, 2, 'Compliance', 1, 'active', NULL, NULL, NULL, NULL),
(9, 1, 2, 2, 'Customer Service', 1, 'active', NULL, NULL, NULL, NULL),
(10, 1, 2, 2, 'Product Presentation', 1, 'active', NULL, NULL, NULL, NULL),
(11, 1, 2, 3, 'Communication', 1, 'active', NULL, NULL, NULL, NULL),
(12, 1, 2, 3, 'Sales', 1, 'active', NULL, NULL, NULL, NULL),
(13, 1, 2, 3, 'Compliance', 1, 'active', NULL, NULL, NULL, NULL),
(14, 1, 2, 3, 'Customer Service', 1, 'active', NULL, NULL, NULL, NULL),
(15, 1, 2, 3, 'Product Presentation', 1, 'active', NULL, NULL, NULL, NULL),
(16, 1, 3, 4, 'Communication', 1, 'active', NULL, NULL, NULL, NULL),
(17, 1, 3, 4, 'Sales', 1, 'active', NULL, NULL, NULL, NULL),
(18, 1, 3, 4, 'Compliance', 1, 'active', NULL, NULL, NULL, NULL),
(19, 1, 3, 4, 'Customer Service', 1, 'active', NULL, NULL, NULL, NULL),
(20, 1, 3, 4, 'Product Presentation', 1, 'active', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `designations`
--

CREATE TABLE `designations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `hrms_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','disabled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `added_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `designations`
--

INSERT INTO `designations` (`id`, `hrms_id`, `name`, `status`, `added_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 2, 'ASSISTANT MANAGER', 'active', NULL, NULL, '2022-06-08 06:51:50', '2022-06-08 06:51:50'),
(2, 3, 'AUDITOR', 'active', NULL, NULL, '2022-06-08 06:51:50', '2022-06-08 06:51:50'),
(3, 4, 'BI MANAGER', 'active', NULL, NULL, '2022-06-08 06:51:50', '2022-06-08 06:51:50'),
(4, 5, 'CEO', 'active', NULL, NULL, '2022-06-08 06:51:50', '2022-06-08 06:51:50'),
(5, 6, 'CFO', 'active', NULL, NULL, '2022-06-08 06:51:50', '2022-06-08 06:51:50'),
(6, 7, 'COACH', 'active', NULL, NULL, '2022-06-08 06:51:50', '2022-06-08 06:51:50'),
(7, 8, 'COMPANY DOCTOR', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(8, 9, 'COMPLIANCE EXECUTIVE', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(9, 10, 'COMPLIANCE MANAGER', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(10, 11, 'COORDINATOR', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(11, 12, 'CSA', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(12, 13, 'DATABASE ADMINISTRATOR', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(13, 14, 'DIALER ADMIN', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(14, 15, 'DIRECTOR', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(15, 16, 'DNC EXECUTIVE', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(16, 17, 'DRIVER', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(17, 18, 'ELECTRICIAN', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(18, 19, 'EMPLOYEE RELATION OFFICER', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(19, 20, 'FINANCE EXECUTIVE', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(20, 21, 'GENERATOR OPERATOR', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(21, 22, 'GRAPHIC DESIGNER', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(22, 23, 'GUARD', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(23, 24, 'HARDWARE ENGINEER', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(24, 25, 'HR MANAGER', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(25, 26, 'INTERNEE', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(26, 27, 'JANITOR', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(27, 28, 'JUNIOR SOFTWARE ENGINEER', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(28, 29, 'JUNIOR SYSTEM ENGINEER', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(29, 30, 'JUNIOR WEB DEVELOPER', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(30, 31, 'MANAGER', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(31, 32, 'MIS EXECUTIVE', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(32, 33, 'NETWORK ENGINEER', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(33, 34, 'QA EXECUTIVE', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(34, 35, 'RECRUITMENT EXECUTIVE', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(35, 36, 'RECRUITMENT MANAGER', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(36, 37, 'SECURITY EXECUTIVE', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(37, 38, 'SENIOR BI MANAGER', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(38, 39, 'SENIOR DNC EXECUTIVE', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(39, 40, 'SENIOR MANAGER', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(40, 41, 'SENIOR MIS EXECUTIVE', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(41, 42, 'SENIOR QA EXECUTIVE', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(42, 43, 'SENIOR SOFTWARE ENGINEER', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(43, 44, 'SOFTWARE ENGINEER', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(44, 45, 'SYSTEM ENGINEER', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(45, 46, 'TEA BOY', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(46, 47, 'TEAM LEAD', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(47, 48, 'TECHNICIAN', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(48, 49, 'TRAINER', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(49, 50, 'VERIFIER', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(50, 51, 'VP', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(51, 52, 'WEB DEVELOPER', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(52, 53, 'HE EXECUTIVE', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(53, 1053, 'EXECUTIVE ASSISTANT', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(54, 2053, 'TRAINEE', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(55, 2054, 'TL IN TRAINING', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(56, 2055, 'ASSISTANT DIRECTOR', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(57, 2056, 'CUSTOMER CARE EXECUTIVE', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(58, 2057, 'CUSTOMER SERVICES EXECUTIVE', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(59, 2058, 'SENIOR COMPLIANCE EXECUTIVE', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(60, 2059, 'DIRECTOR BUSINESS DEVELOPMENT', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(61, 2060, 'MANAGER BUSINESS DEVELOPMENT', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(62, 2061, 'DATA ANALYST', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(63, 2062, 'CCO', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(64, 2063, 'COO', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(65, 2064, 'TL TRAINING ', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(66, 2065, 'COMPLIANCE & LEGAL ADVISOR', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(67, 2066, 'TL DA', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(68, 2067, 'CIO', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(69, 2068, 'SR. DIRECTOR', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(70, 2069, 'SR. DNC EXECUTIVE', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(71, 2070, 'SR.DIALER ADMIN', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(72, 2071, 'DIALER & DATA SPECIALIST', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(73, 2072, 'HOME IMPROVEMENTS 1', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(74, 2073, 'HOME IMPROVEMENTS 2', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(75, 2074, 'TRAINING & DEVELOPMENT EXECUTIVE', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(76, 2075, 'TRAINING & DEVELOPMENT EXECUTIVE', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(77, 2076, 'STL-LENDING TREE 2', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(78, 2077, 'NV COMPLIANCE EXECUTIVE', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(79, 2078, 'NV COMPLIANCE EXECUTIVE', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(80, 2079, 'SYSTEM ADMINISTRATOR', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(81, 2080, 'EXECUTIVE', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(82, 2081, 'SR. MANAGER RECRUITEMENT', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(83, 2082, 'GENERAL MANAGER', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(84, 2083, 'CLIENT', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(85, 2084, 'COMPLIANCE ASSOCIATE', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(86, 2085, 'BUSINESS PROCESS ANALYST', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(87, 2086, 'MANAGEMENT TRAINING OFFICER', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(88, 2087, 'ENGLISH LANGUAGE INSTRUCTOR', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(89, 2088, 'SEO SPECIALIST', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(90, 2089, 'RESEARCH ANALYST', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(91, 2090, 'CTO', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(92, 2091, 'SOFTWARE DEVELOPER', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(93, 2092, 'CONTENT STRATEGIST', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(94, 2093, 'OFFICE BOY', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(95, 2094, 'MARKETING ANALYST', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(96, 2095, 'FRONTEND DEVELOPER', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(97, 2096, 'BACKEND DEVELOPER', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(98, 2097, 'SUCCESSOR', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(99, 2098, 'Consultant', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(100, 2099, 'SENIOR MANAGER-DIGITAL MARKETING', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(101, 2100, 'SENIOR FRONTEND DEVELOPER', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(102, 2101, 'DIRECTOR IT & DEVELOPMENT', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(103, 2102, 'SUPERVISOR', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(104, 2103, 'SOCIAL MEDIA STRATEGIST', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(105, 3103, 'SECURITY SUPERVISOR', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(106, 3104, 'SENIOR MANAGER ANALYTICS', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(107, 3105, 'COMMUNICATIONS TRAINER', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(108, 3106, 'NPD SWAT OFFICER', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(109, 3107, 'SR. HE EXECUTIVE', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(110, 3108, 'ACTIVITIES COORDINATOR', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(111, 3109, 'DIGITAL MARKETING STRATEGIST', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(112, 3110, 'HRBP', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(113, 3111, 'SR. DATABASE ADMINISTRATOR', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(114, 3112, 'CMO', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(115, 3113, 'PHOTOGRAPHER', 'active', NULL, NULL, '2022-06-08 06:51:51', '2022-06-08 06:51:51'),
(116, 3114, 'PPC EXPERT', 'active', NULL, NULL, '2022-06-08 06:51:52', '2022-06-08 06:51:52'),
(117, 3115, 'BD EXECUTIVE', 'active', NULL, NULL, '2022-06-08 06:51:52', '2022-06-08 06:51:52'),
(118, 3116, 'BUSINESS DEVELOPMENT EXECUTIVE', 'active', NULL, NULL, '2022-06-08 06:51:52', '2022-06-08 06:51:52'),
(119, 3117, 'MIS ANALYST', 'active', NULL, NULL, '2022-06-08 06:51:52', '2022-06-08 06:51:52'),
(120, 3118, 'JR. DATABASE ADMINISTRATOR', 'active', NULL, NULL, '2022-06-08 06:51:52', '2022-06-08 06:51:52'),
(121, 3119, 'JR. DEVELOPER', 'active', NULL, NULL, '2022-06-08 06:51:52', '2022-06-08 06:51:52'),
(122, 3120, 'DOCUMENT CONTROL ASSOCIATE', 'active', NULL, NULL, '2022-06-08 06:51:52', '2022-06-08 06:51:52'),
(123, 3121, 'AFFILIATE ACCOUNT EXECUTIVE', 'active', NULL, NULL, '2022-06-08 06:51:52', '2022-06-08 06:51:52'),
(124, 3122, 'FULL STACK DEVELOPER', 'active', NULL, NULL, '2022-06-08 06:51:52', '2022-06-08 06:51:52'),
(125, 3123, 'DEVELOPMENT EXECUTIVE', 'active', NULL, NULL, '2022-06-08 06:51:52', '2022-06-08 06:51:52'),
(126, 3124, 'SOCIAL MEDIA CONTENT DEVELOPER', 'active', NULL, NULL, '2022-06-08 06:51:52', '2022-06-08 06:51:52'),
(127, 3125, 'VIDEO EDITOR', 'active', NULL, NULL, '2022-06-08 06:51:52', '2022-06-08 06:51:52'),
(128, 3126, 'ASSOCIATE DIRECTOR', 'active', NULL, NULL, '2022-06-08 06:51:52', '2022-06-08 06:51:52'),
(129, 3127, 'QA ANALYST', 'active', NULL, NULL, '2022-06-08 06:51:52', '2022-06-08 06:51:52'),
(130, 3128, 'CUSTOMER SUPPORT EXECUTIVE', 'active', NULL, NULL, '2022-06-08 06:51:52', '2022-06-08 06:51:52'),
(131, 3129, 'SOCIAL MEDIA CONTENT WRITER', 'active', NULL, NULL, '2022-06-08 06:51:52', '2022-06-08 06:51:52'),
(132, 3130, 'ANALYST', 'active', NULL, NULL, '2022-06-08 06:51:52', '2022-06-08 06:51:52'),
(133, 3131, 'CREATIVE DIRECTOR', 'active', NULL, NULL, '2022-06-08 06:51:52', '2022-06-08 06:51:52'),
(134, 3132, 'TEST DIRECTOR', 'active', NULL, NULL, '2022-06-08 06:51:52', '2022-06-08 06:51:52'),
(135, 3133, 'LEAD TRAINER', 'active', NULL, NULL, '2022-06-08 06:51:52', '2022-06-08 06:51:52'),
(136, 3134, 'VOIP SPECIALIST', 'active', NULL, NULL, '2022-06-08 06:51:52', '2022-06-08 06:51:52');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2021_11_15_220416_create_campaigns_table', 1),
(6, '2021_11_19_020320_create_designations_table', 1),
(7, '2022_01_12_164857_create_permission_tables', 1),
(8, '2022_01_17_184308_create_voice_evaluations_table', 1),
(9, '2022_01_17_184309_create_datapoint_categories_table', 1),
(10, '2022_01_17_185118_create_datapoints_table', 1),
(11, '2022_01_26_170333_create_voice_audits_table', 1),
(12, '2022_01_26_181957_create_voice_audit_points_table', 1),
(13, '2022_01_26_214215_create_voice_custom_fields_table', 1),
(14, '2022_01_26_224459_create_voice_audit_custom_fields_table', 1),
(15, '2022_03_09_180752_campaigns_datapoint_categories', 1),
(16, '2022_03_09_183917_campaigns_voice_custom_fields', 1),
(17, '2022_03_09_215617_create_voice_audit_appeals_table', 1),
(18, '2022_03_14_204145_create_voice_evaluation_actions_table', 1),
(19, '2022_03_14_213101_create_voice_audit_actions_table', 1),
(20, '2022_06_08_022239_create_solar_lt_categories_table', 2),
(21, '2022_06_08_022325_create_solar_lt_datapoints_table', 2),
(22, '2022_06_08_022504_create_solar_lt_evaluation_responses_table', 2),
(23, '2022_06_08_022529_create_solar_lt_evaluations_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 20),
(2, 'App\\Models\\User', 21),
(2, 'App\\Models\\User', 153),
(2, 'App\\Models\\User', 160),
(2, 'App\\Models\\User', 398),
(3, 'App\\Models\\User', 2),
(3, 'App\\Models\\User', 22),
(3, 'App\\Models\\User', 93),
(3, 'App\\Models\\User', 170),
(3, 'App\\Models\\User', 177),
(3, 'App\\Models\\User', 181),
(3, 'App\\Models\\User', 182),
(3, 'App\\Models\\User', 183),
(3, 'App\\Models\\User', 184),
(3, 'App\\Models\\User', 190),
(3, 'App\\Models\\User', 191),
(3, 'App\\Models\\User', 194),
(3, 'App\\Models\\User', 210),
(3, 'App\\Models\\User', 213),
(3, 'App\\Models\\User', 220),
(3, 'App\\Models\\User', 222),
(3, 'App\\Models\\User', 236),
(3, 'App\\Models\\User', 245),
(3, 'App\\Models\\User', 265),
(3, 'App\\Models\\User', 271),
(3, 'App\\Models\\User', 276),
(3, 'App\\Models\\User', 288),
(3, 'App\\Models\\User', 290),
(3, 'App\\Models\\User', 294),
(3, 'App\\Models\\User', 309),
(3, 'App\\Models\\User', 328),
(3, 'App\\Models\\User', 330),
(3, 'App\\Models\\User', 340),
(3, 'App\\Models\\User', 379),
(3, 'App\\Models\\User', 409),
(3, 'App\\Models\\User', 424),
(3, 'App\\Models\\User', 431),
(3, 'App\\Models\\User', 440),
(3, 'App\\Models\\User', 447),
(3, 'App\\Models\\User', 460),
(3, 'App\\Models\\User', 474),
(4, 'App\\Models\\User', 3),
(4, 'App\\Models\\User', 23),
(4, 'App\\Models\\User', 24),
(4, 'App\\Models\\User', 25),
(4, 'App\\Models\\User', 26),
(4, 'App\\Models\\User', 27),
(4, 'App\\Models\\User', 128),
(4, 'App\\Models\\User', 168),
(4, 'App\\Models\\User', 174),
(4, 'App\\Models\\User', 202),
(4, 'App\\Models\\User', 208),
(4, 'App\\Models\\User', 212),
(4, 'App\\Models\\User', 228),
(4, 'App\\Models\\User', 231),
(4, 'App\\Models\\User', 266),
(4, 'App\\Models\\User', 272),
(4, 'App\\Models\\User', 423),
(4, 'App\\Models\\User', 519),
(4, 'App\\Models\\User', 556),
(5, 'App\\Models\\User', 4),
(5, 'App\\Models\\User', 5),
(5, 'App\\Models\\User', 6),
(5, 'App\\Models\\User', 7),
(5, 'App\\Models\\User', 8),
(5, 'App\\Models\\User', 9),
(5, 'App\\Models\\User', 10),
(5, 'App\\Models\\User', 11),
(5, 'App\\Models\\User', 12),
(5, 'App\\Models\\User', 13),
(5, 'App\\Models\\User', 14),
(5, 'App\\Models\\User', 15),
(5, 'App\\Models\\User', 16),
(5, 'App\\Models\\User', 17),
(5, 'App\\Models\\User', 18),
(5, 'App\\Models\\User', 19),
(5, 'App\\Models\\User', 28),
(5, 'App\\Models\\User', 29),
(5, 'App\\Models\\User', 30),
(5, 'App\\Models\\User', 31),
(5, 'App\\Models\\User', 32),
(5, 'App\\Models\\User', 33),
(5, 'App\\Models\\User', 34),
(5, 'App\\Models\\User', 35),
(5, 'App\\Models\\User', 36),
(5, 'App\\Models\\User', 37),
(5, 'App\\Models\\User', 38),
(5, 'App\\Models\\User', 39),
(5, 'App\\Models\\User', 40),
(5, 'App\\Models\\User', 41),
(5, 'App\\Models\\User', 42),
(5, 'App\\Models\\User', 43),
(5, 'App\\Models\\User', 44),
(5, 'App\\Models\\User', 45),
(5, 'App\\Models\\User', 46),
(5, 'App\\Models\\User', 47),
(5, 'App\\Models\\User', 48),
(5, 'App\\Models\\User', 49),
(5, 'App\\Models\\User', 50),
(5, 'App\\Models\\User', 51),
(5, 'App\\Models\\User', 52),
(5, 'App\\Models\\User', 53),
(5, 'App\\Models\\User', 54),
(5, 'App\\Models\\User', 55),
(5, 'App\\Models\\User', 56),
(5, 'App\\Models\\User', 57),
(5, 'App\\Models\\User', 58),
(5, 'App\\Models\\User', 59),
(5, 'App\\Models\\User', 60),
(5, 'App\\Models\\User', 61),
(5, 'App\\Models\\User', 62),
(5, 'App\\Models\\User', 63),
(5, 'App\\Models\\User', 64),
(5, 'App\\Models\\User', 65),
(5, 'App\\Models\\User', 66),
(5, 'App\\Models\\User', 67),
(5, 'App\\Models\\User', 68),
(5, 'App\\Models\\User', 69),
(5, 'App\\Models\\User', 70),
(5, 'App\\Models\\User', 71),
(5, 'App\\Models\\User', 72),
(5, 'App\\Models\\User', 73),
(5, 'App\\Models\\User', 74),
(5, 'App\\Models\\User', 75),
(5, 'App\\Models\\User', 76),
(5, 'App\\Models\\User', 77),
(5, 'App\\Models\\User', 78),
(5, 'App\\Models\\User', 79),
(5, 'App\\Models\\User', 80),
(5, 'App\\Models\\User', 81),
(5, 'App\\Models\\User', 82),
(5, 'App\\Models\\User', 83),
(5, 'App\\Models\\User', 84),
(5, 'App\\Models\\User', 85),
(5, 'App\\Models\\User', 86),
(5, 'App\\Models\\User', 87),
(5, 'App\\Models\\User', 88),
(5, 'App\\Models\\User', 89),
(5, 'App\\Models\\User', 90),
(5, 'App\\Models\\User', 91),
(5, 'App\\Models\\User', 92),
(5, 'App\\Models\\User', 94),
(5, 'App\\Models\\User', 95),
(5, 'App\\Models\\User', 96),
(5, 'App\\Models\\User', 97),
(5, 'App\\Models\\User', 98),
(5, 'App\\Models\\User', 99),
(5, 'App\\Models\\User', 100),
(5, 'App\\Models\\User', 101),
(5, 'App\\Models\\User', 102),
(5, 'App\\Models\\User', 103),
(5, 'App\\Models\\User', 104),
(5, 'App\\Models\\User', 105),
(5, 'App\\Models\\User', 106),
(5, 'App\\Models\\User', 107),
(5, 'App\\Models\\User', 108),
(5, 'App\\Models\\User', 109),
(5, 'App\\Models\\User', 110),
(5, 'App\\Models\\User', 111),
(5, 'App\\Models\\User', 112),
(5, 'App\\Models\\User', 113),
(5, 'App\\Models\\User', 114),
(5, 'App\\Models\\User', 115),
(5, 'App\\Models\\User', 116),
(5, 'App\\Models\\User', 117),
(5, 'App\\Models\\User', 118),
(5, 'App\\Models\\User', 119),
(5, 'App\\Models\\User', 120),
(5, 'App\\Models\\User', 121),
(5, 'App\\Models\\User', 122),
(5, 'App\\Models\\User', 123),
(5, 'App\\Models\\User', 124),
(5, 'App\\Models\\User', 125),
(5, 'App\\Models\\User', 126),
(5, 'App\\Models\\User', 127),
(5, 'App\\Models\\User', 129),
(5, 'App\\Models\\User', 130),
(5, 'App\\Models\\User', 131),
(5, 'App\\Models\\User', 132),
(5, 'App\\Models\\User', 133),
(5, 'App\\Models\\User', 134),
(5, 'App\\Models\\User', 135),
(5, 'App\\Models\\User', 136),
(5, 'App\\Models\\User', 137),
(5, 'App\\Models\\User', 138),
(5, 'App\\Models\\User', 139),
(5, 'App\\Models\\User', 140),
(5, 'App\\Models\\User', 141),
(5, 'App\\Models\\User', 142),
(5, 'App\\Models\\User', 143),
(5, 'App\\Models\\User', 144),
(5, 'App\\Models\\User', 145),
(5, 'App\\Models\\User', 146),
(5, 'App\\Models\\User', 147),
(5, 'App\\Models\\User', 148),
(5, 'App\\Models\\User', 149),
(5, 'App\\Models\\User', 150),
(5, 'App\\Models\\User', 151),
(5, 'App\\Models\\User', 152),
(5, 'App\\Models\\User', 153),
(5, 'App\\Models\\User', 154),
(5, 'App\\Models\\User', 155),
(5, 'App\\Models\\User', 156),
(5, 'App\\Models\\User', 157),
(5, 'App\\Models\\User', 158),
(5, 'App\\Models\\User', 159),
(5, 'App\\Models\\User', 161),
(5, 'App\\Models\\User', 162),
(5, 'App\\Models\\User', 163),
(5, 'App\\Models\\User', 164),
(5, 'App\\Models\\User', 165),
(5, 'App\\Models\\User', 166),
(5, 'App\\Models\\User', 167),
(5, 'App\\Models\\User', 169),
(5, 'App\\Models\\User', 171),
(5, 'App\\Models\\User', 172),
(5, 'App\\Models\\User', 173),
(5, 'App\\Models\\User', 175),
(5, 'App\\Models\\User', 176),
(5, 'App\\Models\\User', 178),
(5, 'App\\Models\\User', 179),
(5, 'App\\Models\\User', 180),
(5, 'App\\Models\\User', 185),
(5, 'App\\Models\\User', 186),
(5, 'App\\Models\\User', 187),
(5, 'App\\Models\\User', 188),
(5, 'App\\Models\\User', 189),
(5, 'App\\Models\\User', 192),
(5, 'App\\Models\\User', 193),
(5, 'App\\Models\\User', 195),
(5, 'App\\Models\\User', 196),
(5, 'App\\Models\\User', 197),
(5, 'App\\Models\\User', 198),
(5, 'App\\Models\\User', 199),
(5, 'App\\Models\\User', 200),
(5, 'App\\Models\\User', 201),
(5, 'App\\Models\\User', 203),
(5, 'App\\Models\\User', 204),
(5, 'App\\Models\\User', 205),
(5, 'App\\Models\\User', 206),
(5, 'App\\Models\\User', 207),
(5, 'App\\Models\\User', 209),
(5, 'App\\Models\\User', 211),
(5, 'App\\Models\\User', 214),
(5, 'App\\Models\\User', 215),
(5, 'App\\Models\\User', 216),
(5, 'App\\Models\\User', 217),
(5, 'App\\Models\\User', 218),
(5, 'App\\Models\\User', 219),
(5, 'App\\Models\\User', 221),
(5, 'App\\Models\\User', 223),
(5, 'App\\Models\\User', 224),
(5, 'App\\Models\\User', 225),
(5, 'App\\Models\\User', 226),
(5, 'App\\Models\\User', 227),
(5, 'App\\Models\\User', 229),
(5, 'App\\Models\\User', 230),
(5, 'App\\Models\\User', 232),
(5, 'App\\Models\\User', 233),
(5, 'App\\Models\\User', 234),
(5, 'App\\Models\\User', 235),
(5, 'App\\Models\\User', 237),
(5, 'App\\Models\\User', 238),
(5, 'App\\Models\\User', 239),
(5, 'App\\Models\\User', 240),
(5, 'App\\Models\\User', 241),
(5, 'App\\Models\\User', 242),
(5, 'App\\Models\\User', 243),
(5, 'App\\Models\\User', 244),
(5, 'App\\Models\\User', 246),
(5, 'App\\Models\\User', 247),
(5, 'App\\Models\\User', 248),
(5, 'App\\Models\\User', 249),
(5, 'App\\Models\\User', 250),
(5, 'App\\Models\\User', 251),
(5, 'App\\Models\\User', 252),
(5, 'App\\Models\\User', 253),
(5, 'App\\Models\\User', 254),
(5, 'App\\Models\\User', 255),
(5, 'App\\Models\\User', 256),
(5, 'App\\Models\\User', 257),
(5, 'App\\Models\\User', 258),
(5, 'App\\Models\\User', 259),
(5, 'App\\Models\\User', 260),
(5, 'App\\Models\\User', 261),
(5, 'App\\Models\\User', 262),
(5, 'App\\Models\\User', 263),
(5, 'App\\Models\\User', 264),
(5, 'App\\Models\\User', 267),
(5, 'App\\Models\\User', 268),
(5, 'App\\Models\\User', 269),
(5, 'App\\Models\\User', 270),
(5, 'App\\Models\\User', 273),
(5, 'App\\Models\\User', 274),
(5, 'App\\Models\\User', 275),
(5, 'App\\Models\\User', 277),
(5, 'App\\Models\\User', 278),
(5, 'App\\Models\\User', 279),
(5, 'App\\Models\\User', 280),
(5, 'App\\Models\\User', 281),
(5, 'App\\Models\\User', 282),
(5, 'App\\Models\\User', 283),
(5, 'App\\Models\\User', 284),
(5, 'App\\Models\\User', 285),
(5, 'App\\Models\\User', 286),
(5, 'App\\Models\\User', 287),
(5, 'App\\Models\\User', 289),
(5, 'App\\Models\\User', 291),
(5, 'App\\Models\\User', 292),
(5, 'App\\Models\\User', 293),
(5, 'App\\Models\\User', 295),
(5, 'App\\Models\\User', 296),
(5, 'App\\Models\\User', 297),
(5, 'App\\Models\\User', 298),
(5, 'App\\Models\\User', 299),
(5, 'App\\Models\\User', 300),
(5, 'App\\Models\\User', 301),
(5, 'App\\Models\\User', 302),
(5, 'App\\Models\\User', 303),
(5, 'App\\Models\\User', 304),
(5, 'App\\Models\\User', 305),
(5, 'App\\Models\\User', 306),
(5, 'App\\Models\\User', 307),
(5, 'App\\Models\\User', 308),
(5, 'App\\Models\\User', 310),
(5, 'App\\Models\\User', 311),
(5, 'App\\Models\\User', 312),
(5, 'App\\Models\\User', 313),
(5, 'App\\Models\\User', 314),
(5, 'App\\Models\\User', 315),
(5, 'App\\Models\\User', 316),
(5, 'App\\Models\\User', 317),
(5, 'App\\Models\\User', 318),
(5, 'App\\Models\\User', 319),
(5, 'App\\Models\\User', 320),
(5, 'App\\Models\\User', 321),
(5, 'App\\Models\\User', 322),
(5, 'App\\Models\\User', 323),
(5, 'App\\Models\\User', 324),
(5, 'App\\Models\\User', 325),
(5, 'App\\Models\\User', 326),
(5, 'App\\Models\\User', 327),
(5, 'App\\Models\\User', 329),
(5, 'App\\Models\\User', 331),
(5, 'App\\Models\\User', 332),
(5, 'App\\Models\\User', 333),
(5, 'App\\Models\\User', 334),
(5, 'App\\Models\\User', 335),
(5, 'App\\Models\\User', 336),
(5, 'App\\Models\\User', 337),
(5, 'App\\Models\\User', 338),
(5, 'App\\Models\\User', 339),
(5, 'App\\Models\\User', 341),
(5, 'App\\Models\\User', 342),
(5, 'App\\Models\\User', 343),
(5, 'App\\Models\\User', 344),
(5, 'App\\Models\\User', 345),
(5, 'App\\Models\\User', 346),
(5, 'App\\Models\\User', 347),
(5, 'App\\Models\\User', 348),
(5, 'App\\Models\\User', 349),
(5, 'App\\Models\\User', 350),
(5, 'App\\Models\\User', 351),
(5, 'App\\Models\\User', 352),
(5, 'App\\Models\\User', 353),
(5, 'App\\Models\\User', 354),
(5, 'App\\Models\\User', 355),
(5, 'App\\Models\\User', 356),
(5, 'App\\Models\\User', 357),
(5, 'App\\Models\\User', 358),
(5, 'App\\Models\\User', 359),
(5, 'App\\Models\\User', 360),
(5, 'App\\Models\\User', 361),
(5, 'App\\Models\\User', 362),
(5, 'App\\Models\\User', 363),
(5, 'App\\Models\\User', 364),
(5, 'App\\Models\\User', 365),
(5, 'App\\Models\\User', 366),
(5, 'App\\Models\\User', 367),
(5, 'App\\Models\\User', 368),
(5, 'App\\Models\\User', 369),
(5, 'App\\Models\\User', 370),
(5, 'App\\Models\\User', 371),
(5, 'App\\Models\\User', 372),
(5, 'App\\Models\\User', 373),
(5, 'App\\Models\\User', 374),
(5, 'App\\Models\\User', 375),
(5, 'App\\Models\\User', 376),
(5, 'App\\Models\\User', 377),
(5, 'App\\Models\\User', 378),
(5, 'App\\Models\\User', 380),
(5, 'App\\Models\\User', 381),
(5, 'App\\Models\\User', 382),
(5, 'App\\Models\\User', 383),
(5, 'App\\Models\\User', 384),
(5, 'App\\Models\\User', 385),
(5, 'App\\Models\\User', 386),
(5, 'App\\Models\\User', 387),
(5, 'App\\Models\\User', 388),
(5, 'App\\Models\\User', 389),
(5, 'App\\Models\\User', 390),
(5, 'App\\Models\\User', 391),
(5, 'App\\Models\\User', 392),
(5, 'App\\Models\\User', 393),
(5, 'App\\Models\\User', 394),
(5, 'App\\Models\\User', 395),
(5, 'App\\Models\\User', 396),
(5, 'App\\Models\\User', 397),
(5, 'App\\Models\\User', 399),
(5, 'App\\Models\\User', 400),
(5, 'App\\Models\\User', 401),
(5, 'App\\Models\\User', 402),
(5, 'App\\Models\\User', 403),
(5, 'App\\Models\\User', 404),
(5, 'App\\Models\\User', 405),
(5, 'App\\Models\\User', 406),
(5, 'App\\Models\\User', 407),
(5, 'App\\Models\\User', 408),
(5, 'App\\Models\\User', 410),
(5, 'App\\Models\\User', 411),
(5, 'App\\Models\\User', 412),
(5, 'App\\Models\\User', 413),
(5, 'App\\Models\\User', 414),
(5, 'App\\Models\\User', 415),
(5, 'App\\Models\\User', 416),
(5, 'App\\Models\\User', 417),
(5, 'App\\Models\\User', 418),
(5, 'App\\Models\\User', 419),
(5, 'App\\Models\\User', 420),
(5, 'App\\Models\\User', 421),
(5, 'App\\Models\\User', 422),
(5, 'App\\Models\\User', 425),
(5, 'App\\Models\\User', 426),
(5, 'App\\Models\\User', 427),
(5, 'App\\Models\\User', 428),
(5, 'App\\Models\\User', 429),
(5, 'App\\Models\\User', 430),
(5, 'App\\Models\\User', 432),
(5, 'App\\Models\\User', 433),
(5, 'App\\Models\\User', 434),
(5, 'App\\Models\\User', 435),
(5, 'App\\Models\\User', 436),
(5, 'App\\Models\\User', 437),
(5, 'App\\Models\\User', 438),
(5, 'App\\Models\\User', 439),
(5, 'App\\Models\\User', 441),
(5, 'App\\Models\\User', 442),
(5, 'App\\Models\\User', 443),
(5, 'App\\Models\\User', 444),
(5, 'App\\Models\\User', 445),
(5, 'App\\Models\\User', 446),
(5, 'App\\Models\\User', 448),
(5, 'App\\Models\\User', 449),
(5, 'App\\Models\\User', 450),
(5, 'App\\Models\\User', 451),
(5, 'App\\Models\\User', 452),
(5, 'App\\Models\\User', 453),
(5, 'App\\Models\\User', 454),
(5, 'App\\Models\\User', 455),
(5, 'App\\Models\\User', 456),
(5, 'App\\Models\\User', 457),
(5, 'App\\Models\\User', 458),
(5, 'App\\Models\\User', 459),
(5, 'App\\Models\\User', 461),
(5, 'App\\Models\\User', 462),
(5, 'App\\Models\\User', 463),
(5, 'App\\Models\\User', 464),
(5, 'App\\Models\\User', 465),
(5, 'App\\Models\\User', 466),
(5, 'App\\Models\\User', 467),
(5, 'App\\Models\\User', 468),
(5, 'App\\Models\\User', 469),
(5, 'App\\Models\\User', 470),
(5, 'App\\Models\\User', 471),
(5, 'App\\Models\\User', 472),
(5, 'App\\Models\\User', 473),
(5, 'App\\Models\\User', 475),
(5, 'App\\Models\\User', 476),
(5, 'App\\Models\\User', 477),
(5, 'App\\Models\\User', 478),
(5, 'App\\Models\\User', 479),
(5, 'App\\Models\\User', 480),
(5, 'App\\Models\\User', 481),
(5, 'App\\Models\\User', 482),
(5, 'App\\Models\\User', 483),
(5, 'App\\Models\\User', 484),
(5, 'App\\Models\\User', 485),
(5, 'App\\Models\\User', 486),
(5, 'App\\Models\\User', 487),
(5, 'App\\Models\\User', 488),
(5, 'App\\Models\\User', 489),
(5, 'App\\Models\\User', 490),
(5, 'App\\Models\\User', 491),
(5, 'App\\Models\\User', 492),
(5, 'App\\Models\\User', 493),
(5, 'App\\Models\\User', 494),
(5, 'App\\Models\\User', 495),
(5, 'App\\Models\\User', 496),
(5, 'App\\Models\\User', 497),
(5, 'App\\Models\\User', 498),
(5, 'App\\Models\\User', 499),
(5, 'App\\Models\\User', 500),
(5, 'App\\Models\\User', 501),
(5, 'App\\Models\\User', 502),
(5, 'App\\Models\\User', 503),
(5, 'App\\Models\\User', 504),
(5, 'App\\Models\\User', 505),
(5, 'App\\Models\\User', 506),
(5, 'App\\Models\\User', 507),
(5, 'App\\Models\\User', 508),
(5, 'App\\Models\\User', 509),
(5, 'App\\Models\\User', 510),
(5, 'App\\Models\\User', 511),
(5, 'App\\Models\\User', 512),
(5, 'App\\Models\\User', 513),
(5, 'App\\Models\\User', 514),
(5, 'App\\Models\\User', 515),
(5, 'App\\Models\\User', 516),
(5, 'App\\Models\\User', 517),
(5, 'App\\Models\\User', 518),
(5, 'App\\Models\\User', 520),
(5, 'App\\Models\\User', 521),
(5, 'App\\Models\\User', 522),
(5, 'App\\Models\\User', 523),
(5, 'App\\Models\\User', 524),
(5, 'App\\Models\\User', 525),
(5, 'App\\Models\\User', 526),
(5, 'App\\Models\\User', 527),
(5, 'App\\Models\\User', 528),
(5, 'App\\Models\\User', 529),
(5, 'App\\Models\\User', 530),
(5, 'App\\Models\\User', 531),
(5, 'App\\Models\\User', 532),
(5, 'App\\Models\\User', 533),
(5, 'App\\Models\\User', 534),
(5, 'App\\Models\\User', 535),
(5, 'App\\Models\\User', 536),
(5, 'App\\Models\\User', 537),
(5, 'App\\Models\\User', 538),
(5, 'App\\Models\\User', 539),
(5, 'App\\Models\\User', 540),
(5, 'App\\Models\\User', 541),
(5, 'App\\Models\\User', 542),
(5, 'App\\Models\\User', 543),
(5, 'App\\Models\\User', 544),
(5, 'App\\Models\\User', 545),
(5, 'App\\Models\\User', 546),
(5, 'App\\Models\\User', 547),
(5, 'App\\Models\\User', 548),
(5, 'App\\Models\\User', 549),
(5, 'App\\Models\\User', 550),
(5, 'App\\Models\\User', 551),
(5, 'App\\Models\\User', 552),
(5, 'App\\Models\\User', 553),
(5, 'App\\Models\\User', 554),
(5, 'App\\Models\\User', 555),
(5, 'App\\Models\\User', 557),
(5, 'App\\Models\\User', 558),
(5, 'App\\Models\\User', 559),
(5, 'App\\Models\\User', 560),
(5, 'App\\Models\\User', 561),
(5, 'App\\Models\\User', 562),
(5, 'App\\Models\\User', 563),
(5, 'App\\Models\\User', 564),
(5, 'App\\Models\\User', 565),
(5, 'App\\Models\\User', 566),
(5, 'App\\Models\\User', 567),
(5, 'App\\Models\\User', 568),
(5, 'App\\Models\\User', 569),
(5, 'App\\Models\\User', 570),
(5, 'App\\Models\\User', 571),
(5, 'App\\Models\\User', 572),
(5, 'App\\Models\\User', 573),
(5, 'App\\Models\\User', 574),
(5, 'App\\Models\\User', 575),
(5, 'App\\Models\\User', 576),
(5, 'App\\Models\\User', 577),
(5, 'App\\Models\\User', 578),
(5, 'App\\Models\\User', 579),
(5, 'App\\Models\\User', 580),
(5, 'App\\Models\\User', 581),
(5, 'App\\Models\\User', 582),
(5, 'App\\Models\\User', 583),
(5, 'App\\Models\\User', 584),
(5, 'App\\Models\\User', 585),
(5, 'App\\Models\\User', 586),
(5, 'App\\Models\\User', 587),
(5, 'App\\Models\\User', 588),
(5, 'App\\Models\\User', 589),
(5, 'App\\Models\\User', 590),
(5, 'App\\Models\\User', 591),
(5, 'App\\Models\\User', 592),
(5, 'App\\Models\\User', 593),
(5, 'App\\Models\\User', 594),
(5, 'App\\Models\\User', 595),
(5, 'App\\Models\\User', 596),
(5, 'App\\Models\\User', 597),
(5, 'App\\Models\\User', 598),
(5, 'App\\Models\\User', 599),
(5, 'App\\Models\\User', 600),
(5, 'App\\Models\\User', 601),
(5, 'App\\Models\\User', 602),
(5, 'App\\Models\\User', 603),
(5, 'App\\Models\\User', 604),
(5, 'App\\Models\\User', 605),
(5, 'App\\Models\\User', 606),
(5, 'App\\Models\\User', 607),
(5, 'App\\Models\\User', 608),
(5, 'App\\Models\\User', 609),
(5, 'App\\Models\\User', 610),
(5, 'App\\Models\\User', 611),
(5, 'App\\Models\\User', 612),
(5, 'App\\Models\\User', 613),
(5, 'App\\Models\\User', 614),
(5, 'App\\Models\\User', 615),
(5, 'App\\Models\\User', 616),
(5, 'App\\Models\\User', 617),
(5, 'App\\Models\\User', 618),
(5, 'App\\Models\\User', 619),
(5, 'App\\Models\\User', 620),
(5, 'App\\Models\\User', 621),
(5, 'App\\Models\\User', 622),
(5, 'App\\Models\\User', 623),
(5, 'App\\Models\\User', 624),
(5, 'App\\Models\\User', 625),
(5, 'App\\Models\\User', 626),
(5, 'App\\Models\\User', 627),
(5, 'App\\Models\\User', 628),
(5, 'App\\Models\\User', 629),
(5, 'App\\Models\\User', 630),
(5, 'App\\Models\\User', 631),
(5, 'App\\Models\\User', 632),
(5, 'App\\Models\\User', 633),
(5, 'App\\Models\\User', 634),
(5, 'App\\Models\\User', 635),
(5, 'App\\Models\\User', 636),
(5, 'App\\Models\\User', 637),
(5, 'App\\Models\\User', 638),
(5, 'App\\Models\\User', 639),
(5, 'App\\Models\\User', 640),
(5, 'App\\Models\\User', 641),
(5, 'App\\Models\\User', 642),
(5, 'App\\Models\\User', 643),
(5, 'App\\Models\\User', 644),
(5, 'App\\Models\\User', 645),
(5, 'App\\Models\\User', 646),
(5, 'App\\Models\\User', 647),
(5, 'App\\Models\\User', 648),
(5, 'App\\Models\\User', 649),
(5, 'App\\Models\\User', 650),
(5, 'App\\Models\\User', 651),
(5, 'App\\Models\\User', 652),
(5, 'App\\Models\\User', 653),
(5, 'App\\Models\\User', 654),
(5, 'App\\Models\\User', 655),
(5, 'App\\Models\\User', 656),
(5, 'App\\Models\\User', 657),
(5, 'App\\Models\\User', 658),
(5, 'App\\Models\\User', 659),
(5, 'App\\Models\\User', 660),
(5, 'App\\Models\\User', 661),
(5, 'App\\Models\\User', 662),
(5, 'App\\Models\\User', 663),
(5, 'App\\Models\\User', 664),
(5, 'App\\Models\\User', 665),
(5, 'App\\Models\\User', 666),
(5, 'App\\Models\\User', 667),
(5, 'App\\Models\\User', 668),
(5, 'App\\Models\\User', 669),
(5, 'App\\Models\\User', 670),
(5, 'App\\Models\\User', 671),
(5, 'App\\Models\\User', 672),
(5, 'App\\Models\\User', 673),
(5, 'App\\Models\\User', 674),
(5, 'App\\Models\\User', 675),
(5, 'App\\Models\\User', 676),
(5, 'App\\Models\\User', 677),
(5, 'App\\Models\\User', 678),
(5, 'App\\Models\\User', 679),
(5, 'App\\Models\\User', 680),
(5, 'App\\Models\\User', 681),
(5, 'App\\Models\\User', 682),
(5, 'App\\Models\\User', 683),
(5, 'App\\Models\\User', 684),
(5, 'App\\Models\\User', 685),
(5, 'App\\Models\\User', 686),
(5, 'App\\Models\\User', 687),
(5, 'App\\Models\\User', 688),
(5, 'App\\Models\\User', 689),
(5, 'App\\Models\\User', 690),
(5, 'App\\Models\\User', 691),
(5, 'App\\Models\\User', 692),
(5, 'App\\Models\\User', 693),
(5, 'App\\Models\\User', 694),
(5, 'App\\Models\\User', 695),
(5, 'App\\Models\\User', 696),
(5, 'App\\Models\\User', 697),
(5, 'App\\Models\\User', 698),
(5, 'App\\Models\\User', 699),
(5, 'App\\Models\\User', 700),
(5, 'App\\Models\\User', 701),
(5, 'App\\Models\\User', 702),
(5, 'App\\Models\\User', 703),
(5, 'App\\Models\\User', 704),
(5, 'App\\Models\\User', 705),
(5, 'App\\Models\\User', 706),
(5, 'App\\Models\\User', 707),
(5, 'App\\Models\\User', 708),
(5, 'App\\Models\\User', 709),
(5, 'App\\Models\\User', 710),
(5, 'App\\Models\\User', 711),
(5, 'App\\Models\\User', 712),
(5, 'App\\Models\\User', 713),
(5, 'App\\Models\\User', 714),
(5, 'App\\Models\\User', 715),
(5, 'App\\Models\\User', 716),
(5, 'App\\Models\\User', 717),
(5, 'App\\Models\\User', 718);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` int(11) NOT NULL,
  `campaign_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `project_code` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `campaign_id`, `name`, `project_code`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 'EDDY-EDU', 'PRO0145', NULL, NULL, NULL),
(2, 2, 'EDDY-IB', 'PRO0146', NULL, NULL, NULL),
(3, 2, 'EDDY-OB', 'PRO0147', NULL, NULL, NULL),
(4, 3, 'GDR', 'PRO0138', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'web', '2022-06-08 06:48:58', '2022-06-08 06:48:58'),
(2, 'Director', 'web', '2022-06-08 06:48:58', '2022-06-08 06:48:58'),
(3, 'Manager', 'web', '2022-06-08 06:48:58', '2022-06-08 06:48:58'),
(4, 'Team Lead', 'web', '2022-06-08 06:48:58', '2022-06-08 06:48:58'),
(5, 'Associate', 'web', '2022-06-08 06:48:58', '2022-06-08 06:48:58');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `solar_lt_categories`
--

CREATE TABLE `solar_lt_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `solar_lt_categories`
--

INSERT INTO `solar_lt_categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Introductions', '2022-06-08 07:43:44', '2022-06-08 07:43:44'),
(2, 'Qualification', '2022-06-08 07:43:44', '2022-06-08 07:43:44'),
(3, 'Sale', '2022-06-08 07:43:44', '2022-06-08 07:43:44'),
(4, 'Compliance', '2022-06-08 07:43:44', '2022-06-08 07:43:44'),
(5, 'Positive Engagement', '2022-06-08 07:43:44', '2022-06-08 07:43:44');

-- --------------------------------------------------------

--
-- Table structure for table `solar_lt_datapoints`
--

CREATE TABLE `solar_lt_datapoints` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `question` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `solar_lt_datapoints`
--

INSERT INTO `solar_lt_datapoints` (`id`, `name`, `question`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 'My Self', NULL, 1, '2022-06-08 07:43:57', '2022-06-08 07:43:57'),
(2, 'My Company', NULL, 1, '2022-06-08 07:43:57', '2022-06-08 07:43:57'),
(3, 'Reason for the call', NULL, 1, '2022-06-08 07:43:57', '2022-06-08 07:43:57'),
(4, 'Home Ownership & Address', NULL, 2, '2022-06-08 07:43:57', '2022-06-08 07:43:57'),
(5, 'Single Family / House Type', NULL, 2, '2022-06-08 07:43:57', '2022-06-08 07:43:57'),
(6, 'Bill', NULL, 2, '2022-06-08 07:43:57', '2022-06-08 07:43:57'),
(7, 'Credit Score', NULL, 2, '2022-06-08 07:43:57', '2022-06-08 07:43:57'),
(8, 'Shades', NULL, 2, '2022-06-08 07:43:57', '2022-06-08 07:43:57'),
(9, 'Age & Income', NULL, 2, '2022-06-08 07:43:57', '2022-06-08 07:43:57'),
(10, 'Company', NULL, 3, '2022-06-08 07:43:57', '2022-06-08 07:43:57'),
(11, 'Product', NULL, 3, '2022-06-08 07:43:57', '2022-06-08 07:43:57'),
(12, 'Appt Set', NULL, 3, '2022-06-08 07:43:57', '2022-06-08 07:43:57'),
(13, 'TCPA', NULL, 4, '2022-06-08 07:43:57', '2022-06-08 07:43:57'),
(14, '3 Way', NULL, 4, '2022-06-08 07:43:57', '2022-06-08 07:43:57'),
(15, '180 sec buffer time', NULL, 5, '2022-06-08 07:43:57', '2022-06-08 07:43:57');

-- --------------------------------------------------------

--
-- Table structure for table `solar_lt_evaluations`
--

CREATE TABLE `solar_lt_evaluations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `outcome` enum('Qualified','Not Qualified') COLLATE utf8mb4_unicode_ci NOT NULL,
  `notes` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `record_id` int(11) NOT NULL,
  `customer_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `recording_link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `recording_duration` time NOT NULL,
  `call_date` date DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `solar_lt_evaluation_responses`
--

CREATE TABLE `solar_lt_evaluation_responses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `answer` int(11) NOT NULL,
  `evaluation_id` int(11) NOT NULL,
  `datapoint_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reporting_to` int(11) DEFAULT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `hrms_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `plain_password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `access_key` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','disabled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `reporting_to`, `campaign_id`, `project_id`, `hrms_id`, `name`, `password`, `plain_password`, `access_key`, `status`, `remember_token`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, 0, 896075, 'Adminstrator', '$2y$10$uGYMd/6mr34cjKxL7QCeyet3nH.OI55UtZwGOsPlboiUBNi2/c8oy', 'Touchstone@786', '7835668d-8e8c-453e-b675-34ae29406b76', 'active', NULL, NULL, '2022-06-08 06:51:52', '2022-06-08 06:51:52'),
(2, NULL, 1, 0, 695957, 'HUMAYUN JAVED', '$2y$10$jJ7tkbhQhKO7Y.Z9/6Hkp.v84UeYmhm7L7b0wmSgW0gBWGRImgy9a', 'HuJaved@786', NULL, 'active', NULL, NULL, NULL, NULL),
(3, 2, 1, 0, 1971, 'QASIM HUSSAIN', '$2y$10$YEfUiSsu4wGUeV4BwBjLueo.bk8m0CrmslvC6rQEn8lPzA5YvJB0W', 'QHussain@786', NULL, 'active', NULL, NULL, NULL, NULL),
(4, 3, 1, 0, 248607, 'ZAFAR IQBAL', '$2y$10$7hGZ5VzXFdkyYzMY3LGBOeWcQWf45EDCIlQ8.F5Z/I6xp4cYwJtv6', NULL, NULL, 'active', NULL, NULL, NULL, '2023-01-21 11:14:08'),
(5, 3, 1, 0, 711432, 'MARYAM EMAN TASHFEEN', '$2y$10$9D5cNcJEtgdtyFEZMyvwYeAgDINeU9En.8.KFY79yDn5nob78czxS', NULL, NULL, 'active', NULL, NULL, NULL, '2023-01-21 11:14:13'),
(6, 3, 1, 0, 166739, 'WALEED AZEEM', '$2y$10$9pa4P9ZCfcq85EYMpp8sNO8JS0qXI0sqRgS4cFQHK3UHXCzfDH8aa', 'test123', NULL, 'active', NULL, NULL, NULL, '2023-01-21 11:30:25'),
(7, 3, 1, 0, 816409, 'HASSAM UL HAQ MIR', '$2y$10$dMeLN/ovupgL.yUwqwkG/OvhEGnvwE0knLox3L7vyd6yCbyJUeeN6', NULL, NULL, 'active', NULL, NULL, NULL, '2023-01-21 11:14:22'),
(8, 2, 1, 0, 446059, 'MUHAMMAD AASHAN BILAWAL', '$2y$10$nIzs2lR1w1sPyRK6G.YgIew/ZhX4eShw5PYzJ5ZLk3AofBBDs7J6a', 'MABilawal@786', NULL, 'active', NULL, NULL, NULL, NULL),
(9, 3, 1, 0, 986201, 'SYED HASSAN RAZA', '$2y$10$R.GQxiHNYCIdZLfsSpoLuO5RO0VpRt1fLQsyzbdlMaFnNAern.8eK', NULL, NULL, 'active', NULL, NULL, NULL, '2023-01-21 11:14:26'),
(10, 3, 1, 0, 821133, 'SHEHERYAR ZAHID', '$2y$10$FQf3MkUCm6hZxnVMPg.bTeEP209rmoOlGNsx3PedDwxvfBA3P7oJG', NULL, NULL, 'active', NULL, NULL, NULL, '2023-01-21 11:14:31'),
(11, 3, 1, 0, 623230, 'SARAH YUSUF', '$2y$10$RK.Z9tMwGmeXwGDFO0ltY.0xd9qEwxXXpX778mMnkEYhGkyGW9INq', NULL, NULL, 'active', NULL, NULL, NULL, '2023-01-21 11:14:35'),
(12, 3, 1, 0, 971088, 'Perscekla Patras', '$2y$10$1KSLkS7x42b0qRcRp0gUEeRgvdFX2JNKAXnASo.30qyCh4YhWi7Am', NULL, NULL, 'active', NULL, NULL, NULL, '2023-01-21 11:14:39'),
(13, 3, 1, 0, 451783, 'SHEHERYAR BABAR', '$2y$10$tAmVQ8KCRFsU9.kc5O.BR.bI2Ht03NC/ZTEIzNEdre06wf7bRFpV6', NULL, NULL, 'active', NULL, NULL, NULL, '2023-01-21 11:14:42'),
(14, 3, 1, 0, 461466, 'Aymen Iftikhar', '$2y$10$Z4K8SYue/mb9.PfHCPHoaupdpK606qwNPvv58G3xWafqhiOHBQVBS', NULL, NULL, 'active', NULL, NULL, NULL, '2023-01-21 11:14:46'),
(15, 3, 1, 0, 4691, 'Muhammad Bin Burhan', '$2y$10$XeaX54QYnIkOUhwJcMkmNuK1xcSddD48j0B0VrdWLD/M3JCfm7hba', 'test123', NULL, 'active', NULL, NULL, NULL, '2023-01-21 13:27:06'),
(16, 3, 1, 0, 465031, 'Haris Nadeem', '$2y$10$x3B0lpNZfYxCfAqjNV8Z3./4cufQkOnA4ulTI7YqUkGHRjb/0DDaG', NULL, NULL, 'active', NULL, NULL, NULL, '2023-01-21 11:15:20'),
(17, 3, 1, 0, 248683, 'Rehan Masood', '$2y$10$vnvFQvZoLBAqSQKD4mhcyuqFXpCkMYqKUFVH3Tq4ZZxfAgKzOzmje', NULL, NULL, 'active', NULL, NULL, NULL, '2023-01-21 11:15:24'),
(18, 3, 1, 0, 504418, 'Eisha Mehboob', '$2y$10$YoCbT35OiyOhxfp.M4oRwuvHtbs//a5s7zjqW9zYGgC0HOCe/ePOi', NULL, NULL, 'active', NULL, NULL, NULL, '2023-01-21 11:15:27'),
(19, 3, 1, 0, 137963, 'Hamza Khan', '$2y$10$b4L4hrjzPwPIbUXlPPWLFOFEusvYtiL7oZe7lJr84ANSGCF7MGnxC', NULL, NULL, 'active', NULL, NULL, NULL, '2023-01-21 11:15:31'),
(20, NULL, 2, 0, 87223, 'Waqas Ahmed', '$2y$10$MqomRHyFFA0qum6XCz56M.S.oXEI9QAjzOjjQudpN9fbojIBHAsHO', NULL, NULL, 'active', NULL, NULL, NULL, '2023-01-21 11:16:05'),
(21, 20, 2, 0, 238430, 'Iram Ahmed', '$2y$10$Y3tk2KJr4d.eFYGDa3vucOtlf2e.gNkF2lxmFDuebISzTnV214pOm', NULL, NULL, 'active', NULL, NULL, NULL, '2023-01-21 11:16:13'),
(22, 21, 2, 0, 330255, 'Syed Shahab Kazmi', '$2y$10$L6J5EmlZewvBuIcAL/kvc.0vY8ngFEeEWjKPZTEnRbdVHhyJw1r9G', NULL, NULL, 'active', NULL, NULL, NULL, '2023-01-21 11:16:25'),
(23, 21, 2, 0, 517942, 'Abeer Aslam', '$2y$10$etpxVnbeYULTooRWdbq2xe/A2u1TfvBQKNpSI0fenkXRLJK6bFRSW', 'test123', NULL, 'active', NULL, NULL, NULL, '2023-01-21 13:41:04'),
(24, 21, 2, 0, 708248, 'Kaynat Akhter', NULL, NULL, NULL, 'active', NULL, NULL, NULL, NULL),
(25, 21, 2, 0, 299837, 'Naeem Hussain', NULL, NULL, NULL, 'active', NULL, NULL, NULL, NULL),
(26, 21, 2, 0, 586755, 'Raza pervaiz', NULL, NULL, NULL, 'active', NULL, NULL, NULL, NULL),
(27, 21, 2, 0, 655325, 'SYED ALI RAZA', NULL, NULL, NULL, 'active', NULL, NULL, NULL, NULL),
(28, 22, 2, 3, 948172, 'Qusham Nazeer', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(29, 22, 2, 2, 890535, 'RAHAB SAMEER KHAWAR', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(30, 22, 2, 3, 689878, 'RIA GILL', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(31, 22, 2, 3, 682496, 'Sabila Iqbal', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(32, 22, 2, 3, 662922, 'SONIA CHARLES', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(33, 22, 2, 3, 906873, 'SYED TALHA HASSAN', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(34, 22, 2, 3, 665427, 'WALEED ABDULLAH', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(35, 24, 2, 1, 230183, 'ALI ADNAN', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(36, 24, 2, 1, 329335, 'ERIC NASIR', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(37, 24, 2, 1, 63797, 'FARJAD KHAN', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(38, 24, 2, 1, 127355, 'HANZLA KHAN', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(39, 24, 2, 1, 729057, 'HASNAIN MAHMOOD', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(40, 24, 2, 1, 942983, 'JAWAD ABDULLAH', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(41, 24, 2, 1, 567467, 'RAMISH MAHER', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(42, 24, 2, 1, 335573, 'SHAHEER MAQSOOD', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(43, 24, 2, 1, 78849, 'UMAIR ANJUM', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(44, 24, 2, 1, 58405, 'USAMA ILYAS', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(45, 24, 2, 1, 88903, 'WAQAS AHMED(Jr)', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(46, 24, 2, 1, 259918, 'ZOBARIA ISHTIAQ', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(47, 24, 2, 1, 703360, 'FIZZA HUMAYUN', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(48, 24, 2, 2, 804874, 'EBIGAIL KELVIN', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(49, 24, 2, 2, 318586, 'SEHRISH ALAM', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(50, 24, 2, 2, 752446, 'TAQADAS ABBAS', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(51, 24, 2, 3, 24389, 'AHAB SULEMAN', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(52, 24, 2, 3, 260798, 'AYYAT HUSSAIN', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(53, 24, 2, 3, 14921, 'BEHRAM KHAN', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(54, 24, 2, 3, 312136, 'DUA SHAH', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(55, 24, 2, 3, 84528, 'FAIZA RAZZAQ', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(56, 24, 2, 3, 475041, 'MUHAMMAD MUDASSAR', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(57, 24, 2, 3, 965908, 'NISHA BABAR', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(58, 24, 2, 3, 180457, 'RANA ARSHMAAN ALI', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(59, 24, 2, 3, 749202, 'SABA AROOJ', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(60, 24, 2, 3, 827579, 'Syed Muhammad Usman Ali', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(61, 24, 2, 3, 396161, 'ZAYAN NOOR', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(62, 23, 2, 2, 253233, 'EHSAN UL HAQ', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(63, 23, 2, 2, 975521, 'HUMAYUN JAVED', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(64, 23, 2, 2, 720001, 'JAMES JACKSON', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(65, 23, 2, 2, 969192, 'LIAH ROSE', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(66, 23, 2, 2, 920825, 'MUHAMMAD MUBEEN MALIK', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(67, 23, 2, 2, 270801, 'MUHAMMAD UMAR TANVEER', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(68, 23, 2, 2, 872001, 'OSAMA IQBAL MALIK', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(69, 23, 2, 2, 118604, 'SYEDA TAFSEER ZEHRA', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(70, 23, 2, 2, 985179, 'TAHIR ZAMAN', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(71, 23, 2, 2, 968745, 'ZOHAIB ASHFAQ QURESHI', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(72, 23, 2, 3, 810093, 'Agha Ayan Ahmed', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(73, 23, 2, 3, 152291, 'AHMAD MAHMOOD KIYANI', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(74, 23, 2, 3, 675029, 'HARIS TAHIR', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(75, 23, 2, 3, 895104, 'JESSICA MORRIS', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(76, 23, 2, 3, 627417, 'MOHSIN RAZA HASHMI', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(77, 23, 2, 3, 748597, 'MUHAMMAD MOIZ', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(78, 23, 2, 3, 763481, 'MUHAMMAD NOUMAN ALI', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(79, 23, 2, 3, 210814, 'QURAT Ul AIN', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(80, 23, 2, 3, 951883, 'RAJA MOIZ UR REHMAN', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(81, 23, 2, 3, 764844, 'RAZIA FAZAL', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(82, 23, 2, 3, 342561, 'SHALOOM SHAFIQ', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(83, 23, 2, 3, 907183, 'UZAIR IFTIKHAR', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(84, 23, 2, 3, 300026, 'WALIYA ZAINAB', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(85, 23, 2, 3, 751543, 'ZAWAR RAZA KHAN', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(86, 23, 2, 3, 928533, 'HAMZA BASHIR', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(87, 25, 2, 2, 544101, 'HAIDER RAZA', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(88, 25, 2, 2, 333247, 'HASEEB AKHTER', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(89, 25, 2, 2, 731345, 'KHALID MIR', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(90, 25, 2, 2, 387901, 'ZAMRAN IMRAN', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(91, 25, 2, 2, 442901, 'Nauman Iqbal', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(92, 25, 2, 3, 387759, 'ABDUL MOEIZ NADEEM', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(93, 25, 2, 3, 226443, 'AHSAN ARSHAD', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(94, 25, 2, 3, 148343, 'Arham Mirza', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(95, 25, 2, 3, 546005, 'MALIK MUHAMMAD AQIB', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(96, 25, 2, 3, 951460, 'MEZAHAB VICTOR', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(97, 25, 2, 3, 184647, 'MUHAMMAD BIN QASIM', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(98, 25, 2, 3, 864265, 'MUHAMMAD NAUMAN', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(99, 25, 2, 3, 857097, 'MUHAMMAD USMAN SARWAR', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(100, 25, 2, 3, 691253, 'MUHAMMAD ZAIN', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(101, 25, 2, 3, 747141, 'OBAID UR REHMAN', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(102, 25, 2, 3, 981205, 'MUHAMMAD USMAN', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(103, 25, 2, 3, 609652, 'RACHEL ZIA', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(104, 25, 2, 3, 54397, 'SAHAR RIAZ', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(105, 25, 2, 3, 672784, 'SAWERA AMIN', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(106, 25, 2, 3, 478242, 'SUNDUS IMRAN SMITH', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(107, 25, 2, 3, 285255, 'SYED DANISH KAZMI', '', NULL, NULL, 'active', NULL, NULL, NULL, '2023-01-21 11:17:57'),
(108, 25, 2, 3, 723517, 'UMAIR ASGHAR', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(109, 25, 2, 3, 352347, 'MUHAMMAD HAYAT ABBASI', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(110, 25, 2, 3, 429681, 'Akheem Sarwer', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(111, 25, 2, 3, 478033, 'ALI ABDULLAH TASHFEEN', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(112, 25, 2, 3, 818356, 'AMARA JABEEN', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(113, 25, 2, 3, 917184, 'ANEELA ASHIQ', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(114, 26, 2, 3, 146494, 'ZAHRA NAYYER', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(115, 26, 2, 3, 384222, 'AREEBA ANSARI', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(116, 26, 2, 3, 609385, 'SAAD REHMAN', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(117, 26, 2, 3, 351081, 'ROY FAIQ ABID', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(119, 26, 2, 3, 60295, 'Bosco Leo', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(120, 26, 2, 2, 922865, 'FARHAN SATTI', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(121, 26, 2, 2, 397051, 'HANZLA ABBASI', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(122, 26, 2, 2, 730767, 'KAMRAN ABBAS', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(123, 26, 2, 3, 312576, 'MERAB VICTOR', '', NULL, NULL, 'active', NULL, NULL, NULL, '2023-01-21 11:18:03'),
(124, 26, 2, 3, 989047, 'MUHAMMAD USAMA IQBAL', '', NULL, NULL, 'active', NULL, NULL, NULL, '2023-01-21 11:18:08'),
(125, 26, 2, 3, 480650, 'MUNAZA JOYIA', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(126, 26, 2, 3, 117034, 'NAGEENA QADIR', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(127, 26, 2, 3, 794249, 'NAUMAN SHAUKAT', '', '', NULL, 'active', NULL, NULL, NULL, NULL),
(128, NULL, 3, NULL, 123456, 'Abdul Manan', '$2y$10$nE9y3ulQ3hZs2M094XSfrO2nBv4GlunCSKemAEPEWIwyHa0AaK0.u', NULL, NULL, 'active', NULL, NULL, NULL, '2023-01-21 11:18:39'),
(129, 128, 3, 4, 11125, 'Ammara Braikhna', NULL, NULL, NULL, 'active', NULL, NULL, NULL, NULL),
(130, 128, 3, 4, 38055, 'Hafsa Aamir', NULL, NULL, NULL, 'active', NULL, NULL, NULL, NULL),
(131, 128, 3, 4, 86327, 'Hamza Bin Zaheer', NULL, NULL, NULL, 'active', NULL, NULL, NULL, NULL),
(132, 128, 3, 4, 206562, 'Hassan Raza Hashmi', NULL, NULL, NULL, 'active', NULL, NULL, NULL, NULL),
(133, 128, 3, 4, 223202, 'Muhammad Tarteel', NULL, NULL, NULL, 'active', NULL, NULL, NULL, NULL),
(134, 128, 3, 4, 314622, 'Nimra Aleem', NULL, NULL, NULL, 'active', NULL, NULL, NULL, NULL),
(135, 128, 3, 4, 317432, 'Rabbia Khan', NULL, NULL, NULL, 'active', NULL, NULL, NULL, NULL),
(136, 128, 3, 4, 374129, 'Rehman Nawaz', NULL, NULL, NULL, 'active', NULL, NULL, NULL, NULL),
(137, 128, 3, 4, 499696, 'Seyed Hassan Razavi', NULL, NULL, NULL, 'active', NULL, NULL, NULL, NULL),
(138, 128, 3, 4, 509637, 'Shehwar Eeman', NULL, NULL, NULL, 'active', NULL, NULL, NULL, NULL),
(139, 128, 3, 4, 518106, 'Sufyan Nazir', NULL, NULL, NULL, 'active', NULL, NULL, NULL, NULL),
(140, 128, 3, 4, 593215, 'Sundas Aslam', NULL, NULL, NULL, 'active', NULL, NULL, NULL, NULL),
(141, 128, 3, 4, 649128, 'Umar Ibrar', NULL, NULL, NULL, 'active', NULL, NULL, NULL, NULL),
(142, 128, 3, 4, 658803, 'Sufyan Nazir', NULL, NULL, NULL, 'active', NULL, NULL, NULL, NULL),
(143, 128, 3, 4, 932211, 'Afza Sarwar', NULL, NULL, NULL, 'active', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `voice_audits`
--

CREATE TABLE `voice_audits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `voice_evaluation_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `associate_id` int(11) NOT NULL,
  `team_lead_id` int(11) DEFAULT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `project_id` int(11) NOT NULL,
  `call_date` date DEFAULT NULL,
  `percentage` double(8,2) NOT NULL DEFAULT 0.00,
  `customer_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recording_duration` time DEFAULT NULL,
  `recording_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `outcome` enum('pending','accepted','rejected') COLLATE utf8mb4_unicode_ci DEFAULT 'accepted',
  `call_type` enum('General','Sales') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `review_priority` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `status` enum('evaluated','appeal requested','appeal accepted','appeal rejected','action taken') COLLATE utf8mb4_unicode_ci DEFAULT 'evaluated',
  `rating` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `evaluation_time` time DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `voice_audits`
--

INSERT INTO `voice_audits` (`id`, `voice_evaluation_id`, `user_id`, `associate_id`, `team_lead_id`, `campaign_id`, `project_id`, `call_date`, `percentage`, `customer_name`, `customer_phone`, `recording_duration`, `recording_link`, `outcome`, `call_type`, `notes`, `review_priority`, `status`, `rating`, `evaluation_time`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 35, 24, 2, 1, '2023-01-20', 95.00, 'TEST', '12345', '00:02:58', 'TEST', 'accepted', 'Sales', 'TEST', 0, 'evaluated', 'above average', '00:00:46', NULL, '2023-01-21 11:29:29', '2023-01-21 11:29:29'),
(2, 1, 6, 35, 24, 2, 1, '2023-01-20', 80.00, 'TEST', '123', '00:02:58', 'test', 'accepted', 'General', 'test', 0, 'evaluated', 'average', '00:00:45', NULL, '2023-01-21 11:47:12', '2023-01-21 11:47:12'),
(3, 1, 6, 37, 24, 2, 1, '2023-01-20', 50.00, 'Preston Barry', '111111588888', '00:02:50', 'Marcia Strong', 'accepted', 'General', 'Hic nulla quis accus', 0, 'evaluated', 'bad', '00:00:30', NULL, '2023-01-21 11:47:44', '2023-01-21 11:47:44'),
(4, 1, 6, 38, 24, 2, 1, '2023-01-16', 0.00, 'Skyler Barrera', '489456798168', '00:02:47', 'Willa Wagner', 'accepted', 'Sales', 'Deleniti vero aliqua', 1, 'evaluated', 'fatal', '00:00:28', NULL, '2023-01-21 11:48:13', '2023-01-21 11:48:13'),
(5, 1, 6, 35, 24, 2, 1, '2023-01-02', 56.00, 'Maite Suarez', '1561564654', '00:02:58', 'Galena Warren', 'accepted', 'General', 'Numquam ex asperiore', 0, 'evaluated', 'other', '00:00:32', NULL, '2023-01-21 11:48:46', '2023-01-21 11:48:46'),
(6, 1, 6, 41, 24, 2, 1, '2023-01-20', 95.00, 'Linda Macdonald', '65468165498', '00:25:55', 'Alexandra Barton', 'accepted', 'Sales', 'Exercitation hic vol', 0, 'evaluated', 'above average', '00:00:28', NULL, '2023-01-21 11:49:27', '2023-01-21 11:49:27'),
(7, 1, 6, 54, 24, 2, 3, '2023-01-20', 50.00, 'fasdsadsad', '3124213421421421', '00:25:44', 'dsadsadsadsadsad', 'accepted', 'Sales', 'sdsadsadsadsadsadsadsad', 0, 'evaluated', 'bad', '00:00:32', NULL, '2023-01-21 11:50:56', '2023-01-21 11:50:56'),
(8, 1, 6, 84, 23, 2, 3, '2023-01-20', 66.00, 'Kylee Pitts', '11265165', '11:22:55', 'Dora Conrad', 'accepted', 'General', 'Consequatur aut simi', 1, 'evaluated', 'other', '00:00:17', NULL, '2023-01-21 11:51:48', '2023-01-21 11:51:48'),
(9, 1, 6, 55, 24, 2, 3, '2023-01-20', 80.00, 'Astra Adams', '1111111111111111', '11:11:11', 'Natalie Deleon', 'accepted', 'Sales', 'Necessitatibus neces', 0, 'evaluated', 'average', '00:00:27', NULL, '2023-01-21 11:52:16', '2023-01-21 11:52:16'),
(10, 1, 6, 116, 26, 2, 3, '2023-01-22', 47.50, 'Alisa Horton', '4646549841984984', '22:22:22', 'Sean Wilson', 'accepted', 'General', 'Quidem in et fugit', 1, 'evaluated', 'above average', '00:05:17', NULL, '2023-01-21 11:57:35', '2023-01-21 11:57:35'),
(11, 1, 6, 123, 26, 2, 3, '2023-01-20', 95.00, 'sfasadfsadsa', '4981498495498', '33:33:33', 'csacsadsadsadsadsa', 'accepted', 'General', 'dsadsadsadsad', 0, 'evaluated', 'above average', '00:00:24', NULL, '2023-01-21 11:58:00', '2023-01-21 11:58:00'),
(12, 1, 6, 130, 128, 3, 4, '2023-01-20', 0.00, 'Hasham Hashim', '090078601', '00:22:58', 'TEST.COM', 'accepted', 'Sales', 'TEST', 0, 'evaluated', 'fatal', '00:01:23', NULL, '2023-01-21 11:59:52', '2023-01-21 11:59:52'),
(13, 1, 6, 141, 128, 3, 4, '2023-01-20', 47.50, 'Wade Sparks', '45698446', '44:44:44', 'Halee Torres', 'accepted', 'General', 'Harum voluptates quo', 1, 'evaluated', 'other', '00:00:36', NULL, '2023-01-21 12:00:29', '2023-01-21 12:00:29'),
(14, 1, 6, 140, 128, 3, 4, '2023-01-20', 80.00, 'Irani Khushra', '11114444777', '00:25:55', 'test.com', 'accepted', 'Sales', 'ksjdklsadjklsakdlsadsadsadsa', 0, 'evaluated', 'average', '00:00:40', NULL, '2023-01-21 12:01:58', '2023-01-21 12:01:58'),
(15, 1, 6, 138, 128, 3, 4, '2023-01-20', 95.00, 'TEST', '789456123', '00:00:25', 'TEST.COM', 'accepted', 'Sales', 'TEST', 0, 'evaluated', 'above average', '00:01:49', NULL, '2023-01-21 12:04:47', '2023-01-21 12:04:47'),
(16, 1, 6, 135, 128, 3, 4, '2023-01-04', 80.00, 'Violet Taylor', '56565465456', '22:22:25', 'Rinah Cameron', 'accepted', 'Sales', 'Non quia mollitia do', 0, 'evaluated', 'average', '00:01:06', NULL, '2023-01-21 12:06:21', '2023-01-21 12:06:21'),
(17, 1, 6, 134, 128, 3, 4, '2023-01-20', 50.00, 'jkdhsadjksajkdjk', '89546579845', '22:34:14', 'hjkdgsjkadhjksajkdh', 'accepted', 'General', 'jdshajkdhjksadjksadsadsadsadsa', 0, 'evaluated', 'bad', '00:00:42', NULL, '2023-01-21 12:07:05', '2023-01-21 12:07:05'),
(18, 1, 6, 143, 128, 3, 4, '2023-01-20', 47.50, 'Zoe Zimmerman', '6546546546546545', '12:12:35', 'Maggy Wall', 'accepted', 'General', 'Soluta ut eiusmod si', 1, 'evaluated', 'above average', '00:01:21', NULL, '2023-01-21 12:08:27', '2023-01-21 12:08:27'),
(19, 1, 15, 65, 23, 2, 2, '2023-01-18', 80.00, 'Sylvester Lynn', '5555555555', '00:00:02', 'Hiroko Franco', 'accepted', 'General', 'Obcaecati amet eaqu', 0, 'evaluated', 'other', '00:01:29', NULL, '2023-01-21 13:29:11', '2023-01-21 13:29:11'),
(20, 1, 15, 120, 26, 2, 2, '2023-01-20', 50.00, 'Rana Chapman', '456498465749865', '00:00:00', 'Maxwell Strickland', 'accepted', 'Sales', 'Deserunt rerum dolor', 0, 'evaluated', 'bad', '00:00:47', NULL, '2023-01-21 13:30:23', '2023-01-21 13:30:23'),
(21, 1, 15, 63, 23, 2, 2, '2023-01-02', 95.00, 'Aidan Patterson', '465465798468', '13:25:45', 'Gail Cummings', 'accepted', 'Sales', 'Nisi rerum numquam d', 0, 'evaluated', 'above average', '00:00:33', NULL, '2023-01-21 13:30:57', '2023-01-21 13:30:57'),
(22, 1, 15, 101, 25, 2, 3, '2023-01-20', 25.00, 'Quinn Vincent', '545646546565', '12:12:33', 'Maggy Kim', 'accepted', 'Sales', 'Ratione dolorum expl', 1, 'evaluated', 'bad', '00:04:47', NULL, '2023-01-21 13:32:36', '2023-01-21 13:32:36'),
(23, 1, 15, 94, 25, 2, 3, '2023-01-04', 95.00, 'Knox Pennington', '5646546546546465', '12:13:25', 'Fallon Valenzuela', 'accepted', 'General', 'Minim nisi recusanda', 0, 'evaluated', 'above average', '00:00:28', NULL, '2023-01-21 13:33:06', '2023-01-21 13:33:06'),
(24, 1, 15, 127, 26, 2, 3, '2023-01-18', 47.50, 'Keegan House', '465446646', '00:02:55', 'Jin Gallegos', 'accepted', 'General', 'Praesentium libero n', 1, 'evaluated', 'other', '00:00:36', NULL, '2023-01-21 13:33:43', '2023-01-21 13:33:43'),
(25, 1, 15, 75, 23, 2, 3, '2023-01-10', 50.00, 'Kuame Stuart', '65654685465465', '22:22:22', 'Doris Horn', 'accepted', 'General', 'Qui qui autem totam', 1, 'evaluated', 'bad', '00:00:30', NULL, '2023-01-21 13:34:14', '2023-01-21 13:34:14'),
(26, 1, 15, 132, 128, 3, 4, '2023-01-20', 100.00, 'Jacob Frost', '546546854656', '11:12:22', 'Andrew Reid', 'accepted', 'Sales', 'Debitis itaque molli', 1, 'evaluated', 'good', '00:06:45', NULL, '2023-01-21 13:34:44', '2023-01-21 13:34:44'),
(27, 1, 15, 140, 128, 3, 4, '2023-01-02', 50.00, 'Matthew Mooney', '56465456465', '00:02:22', 'Alea Lawrence', 'accepted', 'Sales', 'Voluptatem optio v', 1, 'evaluated', 'bad', '00:00:26', NULL, '2023-01-21 13:35:12', '2023-01-21 13:35:12'),
(28, 1, 15, 140, 128, 3, 4, '2023-01-17', 80.00, 'khjgjkjkhjk', '6565456465', '00:02:22', 'jhashdjksadjksah', 'accepted', 'Sales', 'jksdjksadhsjakdhsjkadjksadsads', 0, 'evaluated', 'average', '00:00:36', NULL, '2023-01-21 13:35:49', '2023-01-21 13:35:49');

-- --------------------------------------------------------

--
-- Table structure for table `voice_audit_actions`
--

CREATE TABLE `voice_audit_actions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `voice_audit_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `voice_evaluation_action_id` int(10) UNSIGNED NOT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `voice_audit_appeals`
--

CREATE TABLE `voice_audit_appeals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `voice_audit_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `campaign_id` int(10) UNSIGNED DEFAULT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('pending','accepted','rejected') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `voice_audit_custom_fields`
--

CREATE TABLE `voice_audit_custom_fields` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `voice_custom_field_id` int(11) NOT NULL,
  `voice_audit_id` int(11) NOT NULL,
  `answer` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `voice_audit_points`
--

CREATE TABLE `voice_audit_points` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `voice_audit_id` int(11) NOT NULL,
  `datapoint_category_id` int(10) UNSIGNED DEFAULT NULL,
  `datapoint_id` int(10) UNSIGNED NOT NULL,
  `answer` int(10) UNSIGNED NOT NULL DEFAULT 6,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `voice_audit_points`
--

INSERT INTO `voice_audit_points` (`id`, `voice_audit_id`, `datapoint_category_id`, `datapoint_id`, `answer`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 1, NULL, '2023-01-18 06:38:50', '2023-01-18 06:38:50'),
(2, 1, 1, 2, 1, NULL, '2023-01-18 06:38:50', '2023-01-18 06:38:50'),
(3, 1, 1, 3, 1, NULL, '2023-01-18 06:38:50', '2023-01-18 06:38:50'),
(4, 1, 1, 4, 1, NULL, '2023-01-18 06:38:50', '2023-01-18 09:05:45'),
(5, 1, 1, 5, 1, NULL, '2023-01-18 06:38:50', '2023-01-18 09:05:45'),
(6, 1, 2, 6, 1, NULL, '2023-01-18 06:38:50', '2023-01-18 06:38:50'),
(7, 1, 2, 7, 1, NULL, '2023-01-18 06:38:50', '2023-01-18 06:38:50'),
(8, 1, 2, 8, 1, NULL, '2023-01-18 06:38:50', '2023-01-18 06:38:50'),
(9, 1, 2, 9, 6, NULL, '2023-01-18 06:38:50', '2023-01-18 09:05:45'),
(10, 1, 2, 10, 6, NULL, '2023-01-18 06:38:50', '2023-01-18 09:05:45'),
(11, 1, 3, 11, 0, NULL, '2023-01-18 06:38:50', '2023-01-18 06:38:50'),
(12, 1, 3, 12, 0, NULL, '2023-01-18 06:38:50', '2023-01-18 06:38:50'),
(13, 1, 3, 13, 1, NULL, '2023-01-18 06:38:50', '2023-01-18 06:38:50'),
(14, 1, 3, 14, 1, NULL, '2023-01-18 06:38:51', '2023-01-18 09:05:45'),
(15, 1, 3, 15, 1, NULL, '2023-01-18 06:38:51', '2023-01-18 06:38:51'),
(16, 1, 4, 16, 1, NULL, '2023-01-18 06:38:51', '2023-01-18 09:05:45'),
(17, 1, 4, 17, 1, NULL, '2023-01-18 06:38:51', '2023-01-18 09:05:45'),
(18, 1, 4, 18, 1, NULL, '2023-01-18 06:38:51', '2023-01-18 09:05:45'),
(19, 1, 4, 19, 1, NULL, '2023-01-18 06:38:51', '2023-01-18 09:05:45'),
(20, 1, 4, 20, 0, NULL, '2023-01-18 06:38:51', '2023-01-18 06:38:51'),
(21, 1, 5, 21, 6, NULL, '2023-01-18 06:38:51', '2023-01-18 09:05:45'),
(22, 1, 5, 22, 1, NULL, '2023-01-18 06:38:51', '2023-01-18 09:05:45'),
(23, 1, 5, 23, 1, NULL, '2023-01-18 06:38:51', '2023-01-18 09:05:45'),
(24, 1, 5, 24, 6, NULL, '2023-01-18 06:38:51', '2023-01-18 09:05:45'),
(25, 1, 5, 25, 6, NULL, '2023-01-18 06:38:51', '2023-01-18 09:05:45'),
(26, 2, 1, 1, 6, NULL, '2023-01-20 12:19:46', '2023-01-20 12:19:46'),
(27, 2, 1, 2, 6, NULL, '2023-01-20 12:19:46', '2023-01-20 12:19:46'),
(28, 2, 1, 3, 6, NULL, '2023-01-20 12:19:46', '2023-01-20 12:19:46'),
(29, 2, 1, 4, 6, NULL, '2023-01-20 12:19:46', '2023-01-20 12:19:46'),
(30, 2, 1, 5, 6, NULL, '2023-01-20 12:19:46', '2023-01-20 12:19:46'),
(31, 2, 2, 6, 6, NULL, '2023-01-20 12:19:46', '2023-01-20 12:19:46'),
(32, 2, 2, 7, 6, NULL, '2023-01-20 12:19:46', '2023-01-20 12:19:46'),
(33, 2, 2, 8, 6, NULL, '2023-01-20 12:19:46', '2023-01-20 12:19:46'),
(34, 2, 2, 9, 6, NULL, '2023-01-20 12:19:46', '2023-01-20 12:19:46'),
(35, 2, 2, 10, 6, NULL, '2023-01-20 12:19:46', '2023-01-20 12:19:46'),
(36, 2, 3, 11, 6, NULL, '2023-01-20 12:19:46', '2023-01-20 12:19:46'),
(37, 2, 3, 12, 6, NULL, '2023-01-20 12:19:46', '2023-01-20 12:19:46'),
(38, 2, 3, 13, 6, NULL, '2023-01-20 12:19:46', '2023-01-20 12:19:46'),
(39, 2, 3, 14, 6, NULL, '2023-01-20 12:19:47', '2023-01-20 12:19:47'),
(40, 2, 3, 15, 6, NULL, '2023-01-20 12:19:47', '2023-01-20 12:19:47'),
(41, 2, 4, 16, 6, NULL, '2023-01-20 12:19:47', '2023-01-20 12:19:47'),
(42, 2, 4, 17, 6, NULL, '2023-01-20 12:19:47', '2023-01-20 12:19:47'),
(43, 2, 4, 18, 6, NULL, '2023-01-20 12:19:47', '2023-01-20 12:19:47'),
(44, 2, 4, 19, 6, NULL, '2023-01-20 12:19:47', '2023-01-20 12:19:47'),
(45, 2, 4, 20, 6, NULL, '2023-01-20 12:19:47', '2023-01-20 12:19:47'),
(46, 2, 5, 21, 6, NULL, '2023-01-20 12:19:47', '2023-01-20 12:19:47'),
(47, 2, 5, 22, 6, NULL, '2023-01-20 12:19:47', '2023-01-20 12:19:47'),
(48, 2, 5, 23, 6, NULL, '2023-01-20 12:19:47', '2023-01-20 12:19:47'),
(49, 2, 5, 24, 6, NULL, '2023-01-20 12:19:47', '2023-01-20 12:19:47'),
(50, 2, 5, 25, 6, NULL, '2023-01-20 12:19:47', '2023-01-20 12:19:47'),
(51, 3, 16, 76, 1, NULL, '2023-01-20 12:56:53', '2023-01-20 12:56:53'),
(52, 3, 16, 77, 1, NULL, '2023-01-20 12:56:53', '2023-01-20 12:56:53'),
(53, 3, 16, 78, 0, NULL, '2023-01-20 12:56:53', '2023-01-20 12:56:53'),
(54, 3, 16, 79, 6, NULL, '2023-01-20 12:56:53', '2023-01-20 12:56:53'),
(55, 3, 16, 80, 1, NULL, '2023-01-20 12:56:53', '2023-01-20 12:56:53'),
(56, 3, 17, 81, 6, NULL, '2023-01-20 12:56:53', '2023-01-20 12:56:53'),
(57, 3, 17, 82, 6, NULL, '2023-01-20 12:56:53', '2023-01-20 12:56:53'),
(58, 3, 17, 83, 6, NULL, '2023-01-20 12:56:53', '2023-01-20 12:56:53'),
(59, 3, 17, 84, 6, NULL, '2023-01-20 12:56:53', '2023-01-20 12:56:53'),
(60, 3, 17, 85, 6, NULL, '2023-01-20 12:56:53', '2023-01-20 12:56:53'),
(61, 3, 18, 86, 6, NULL, '2023-01-20 12:56:53', '2023-01-20 12:56:53'),
(62, 3, 18, 87, 6, NULL, '2023-01-20 12:56:53', '2023-01-20 12:56:53'),
(63, 3, 18, 88, 6, NULL, '2023-01-20 12:56:53', '2023-01-20 12:56:53'),
(64, 3, 18, 89, 6, NULL, '2023-01-20 12:56:53', '2023-01-20 12:56:53'),
(65, 3, 18, 90, 6, NULL, '2023-01-20 12:56:53', '2023-01-20 12:56:53'),
(66, 3, 19, 91, 6, NULL, '2023-01-20 12:56:53', '2023-01-20 12:56:53'),
(67, 3, 19, 92, 6, NULL, '2023-01-20 12:56:53', '2023-01-20 12:56:53'),
(68, 3, 19, 93, 6, NULL, '2023-01-20 12:56:53', '2023-01-20 12:56:53'),
(69, 3, 19, 94, 6, NULL, '2023-01-20 12:56:53', '2023-01-20 12:56:53'),
(70, 3, 19, 95, 6, NULL, '2023-01-20 12:56:53', '2023-01-20 12:56:53'),
(71, 3, 20, 96, 1, NULL, '2023-01-20 12:56:53', '2023-01-20 12:56:53'),
(72, 3, 20, 97, 1, NULL, '2023-01-20 12:56:53', '2023-01-20 12:56:53'),
(73, 3, 20, 98, 1, NULL, '2023-01-20 12:56:53', '2023-01-20 12:56:53'),
(74, 3, 20, 99, 1, NULL, '2023-01-20 12:56:53', '2023-01-20 12:56:53'),
(75, 3, 20, 100, 1, NULL, '2023-01-20 12:56:53', '2023-01-20 12:56:53'),
(76, 1, 1, 1, 6, NULL, '2023-01-21 11:29:29', '2023-01-21 11:29:29'),
(77, 1, 1, 2, 1, NULL, '2023-01-21 11:29:29', '2023-01-21 11:29:29'),
(78, 1, 1, 3, 0, NULL, '2023-01-21 11:29:29', '2023-01-21 11:29:29'),
(79, 1, 1, 4, 0, NULL, '2023-01-21 11:29:29', '2023-01-21 11:29:29'),
(80, 1, 1, 5, 6, NULL, '2023-01-21 11:29:29', '2023-01-21 11:29:29'),
(81, 1, 2, 6, 1, NULL, '2023-01-21 11:29:29', '2023-01-21 11:29:29'),
(82, 1, 2, 7, 1, NULL, '2023-01-21 11:29:29', '2023-01-21 11:29:29'),
(83, 1, 2, 8, 1, NULL, '2023-01-21 11:29:29', '2023-01-21 11:29:29'),
(84, 1, 2, 9, 0, NULL, '2023-01-21 11:29:29', '2023-01-21 11:29:29'),
(85, 1, 2, 10, 6, NULL, '2023-01-21 11:29:29', '2023-01-21 11:29:29'),
(86, 1, 3, 11, 1, NULL, '2023-01-21 11:29:29', '2023-01-21 11:29:29'),
(87, 1, 3, 12, 1, NULL, '2023-01-21 11:29:29', '2023-01-21 11:29:29'),
(88, 1, 3, 13, 1, NULL, '2023-01-21 11:29:29', '2023-01-21 11:29:29'),
(89, 1, 3, 14, 6, NULL, '2023-01-21 11:29:29', '2023-01-21 11:29:29'),
(90, 1, 3, 15, 0, NULL, '2023-01-21 11:29:29', '2023-01-21 11:29:29'),
(91, 1, 4, 16, 1, NULL, '2023-01-21 11:29:29', '2023-01-21 11:29:29'),
(92, 1, 4, 17, 1, NULL, '2023-01-21 11:29:29', '2023-01-21 11:29:29'),
(93, 1, 4, 18, 1, NULL, '2023-01-21 11:29:29', '2023-01-21 11:29:29'),
(94, 1, 4, 19, 0, NULL, '2023-01-21 11:29:29', '2023-01-21 11:29:29'),
(95, 1, 4, 20, 6, NULL, '2023-01-21 11:29:29', '2023-01-21 11:29:29'),
(96, 1, 5, 21, 1, NULL, '2023-01-21 11:29:29', '2023-01-21 11:29:29'),
(97, 1, 5, 22, 1, NULL, '2023-01-21 11:29:29', '2023-01-21 11:29:29'),
(98, 1, 5, 23, 1, NULL, '2023-01-21 11:29:29', '2023-01-21 11:29:29'),
(99, 1, 5, 24, 0, NULL, '2023-01-21 11:29:29', '2023-01-21 11:29:29'),
(100, 1, 5, 25, 6, NULL, '2023-01-21 11:29:29', '2023-01-21 11:29:29'),
(101, 2, 1, 1, 0, NULL, '2023-01-21 11:47:12', '2023-01-21 11:47:12'),
(102, 2, 1, 2, 0, NULL, '2023-01-21 11:47:12', '2023-01-21 11:47:12'),
(103, 2, 1, 3, 1, NULL, '2023-01-21 11:47:12', '2023-01-21 11:47:12'),
(104, 2, 1, 4, 1, NULL, '2023-01-21 11:47:12', '2023-01-21 11:47:12'),
(105, 2, 1, 5, 1, NULL, '2023-01-21 11:47:12', '2023-01-21 11:47:12'),
(106, 2, 2, 6, 1, NULL, '2023-01-21 11:47:12', '2023-01-21 11:47:12'),
(107, 2, 2, 7, 1, NULL, '2023-01-21 11:47:12', '2023-01-21 11:47:12'),
(108, 2, 2, 8, 1, NULL, '2023-01-21 11:47:12', '2023-01-21 11:47:12'),
(109, 2, 2, 9, 6, NULL, '2023-01-21 11:47:12', '2023-01-21 11:47:12'),
(110, 2, 2, 10, 6, NULL, '2023-01-21 11:47:12', '2023-01-21 11:47:12'),
(111, 2, 3, 11, 1, NULL, '2023-01-21 11:47:12', '2023-01-21 11:47:12'),
(112, 2, 3, 12, 1, NULL, '2023-01-21 11:47:12', '2023-01-21 11:47:12'),
(113, 2, 3, 13, 1, NULL, '2023-01-21 11:47:12', '2023-01-21 11:47:12'),
(114, 2, 3, 14, 1, NULL, '2023-01-21 11:47:12', '2023-01-21 11:47:12'),
(115, 2, 3, 15, 6, NULL, '2023-01-21 11:47:12', '2023-01-21 11:47:12'),
(116, 2, 4, 16, 6, NULL, '2023-01-21 11:47:12', '2023-01-21 11:47:12'),
(117, 2, 4, 17, 0, NULL, '2023-01-21 11:47:12', '2023-01-21 11:47:12'),
(118, 2, 4, 18, 0, NULL, '2023-01-21 11:47:12', '2023-01-21 11:47:12'),
(119, 2, 4, 19, 1, NULL, '2023-01-21 11:47:12', '2023-01-21 11:47:12'),
(120, 2, 4, 20, 1, NULL, '2023-01-21 11:47:12', '2023-01-21 11:47:12'),
(121, 2, 5, 21, 1, NULL, '2023-01-21 11:47:12', '2023-01-21 11:47:12'),
(122, 2, 5, 22, 1, NULL, '2023-01-21 11:47:12', '2023-01-21 11:47:12'),
(123, 2, 5, 23, 1, NULL, '2023-01-21 11:47:13', '2023-01-21 11:47:13'),
(124, 2, 5, 24, 0, NULL, '2023-01-21 11:47:13', '2023-01-21 11:47:13'),
(125, 2, 5, 25, 0, NULL, '2023-01-21 11:47:13', '2023-01-21 11:47:13'),
(126, 3, 1, 1, 1, NULL, '2023-01-21 11:47:44', '2023-01-21 11:47:44'),
(127, 3, 1, 2, 1, NULL, '2023-01-21 11:47:44', '2023-01-21 11:47:44'),
(128, 3, 1, 3, 6, NULL, '2023-01-21 11:47:44', '2023-01-21 11:47:44'),
(129, 3, 1, 4, 6, NULL, '2023-01-21 11:47:44', '2023-01-21 11:47:44'),
(130, 3, 1, 5, 6, NULL, '2023-01-21 11:47:44', '2023-01-21 11:47:44'),
(131, 3, 2, 6, 0, NULL, '2023-01-21 11:47:44', '2023-01-21 11:47:44'),
(132, 3, 2, 7, 0, NULL, '2023-01-21 11:47:44', '2023-01-21 11:47:44'),
(133, 3, 2, 8, 0, NULL, '2023-01-21 11:47:44', '2023-01-21 11:47:44'),
(134, 3, 2, 9, 6, NULL, '2023-01-21 11:47:44', '2023-01-21 11:47:44'),
(135, 3, 2, 10, 0, NULL, '2023-01-21 11:47:44', '2023-01-21 11:47:44'),
(136, 3, 3, 11, 1, NULL, '2023-01-21 11:47:44', '2023-01-21 11:47:44'),
(137, 3, 3, 12, 1, NULL, '2023-01-21 11:47:44', '2023-01-21 11:47:44'),
(138, 3, 3, 13, 1, NULL, '2023-01-21 11:47:44', '2023-01-21 11:47:44'),
(139, 3, 3, 14, 1, NULL, '2023-01-21 11:47:44', '2023-01-21 11:47:44'),
(140, 3, 3, 15, 1, NULL, '2023-01-21 11:47:44', '2023-01-21 11:47:44'),
(141, 3, 4, 16, 0, NULL, '2023-01-21 11:47:44', '2023-01-21 11:47:44'),
(142, 3, 4, 17, 6, NULL, '2023-01-21 11:47:44', '2023-01-21 11:47:44'),
(143, 3, 4, 18, 6, NULL, '2023-01-21 11:47:44', '2023-01-21 11:47:44'),
(144, 3, 4, 19, 1, NULL, '2023-01-21 11:47:44', '2023-01-21 11:47:44'),
(145, 3, 4, 20, 0, NULL, '2023-01-21 11:47:44', '2023-01-21 11:47:44'),
(146, 3, 5, 21, 6, NULL, '2023-01-21 11:47:44', '2023-01-21 11:47:44'),
(147, 3, 5, 22, 0, NULL, '2023-01-21 11:47:44', '2023-01-21 11:47:44'),
(148, 3, 5, 23, 1, NULL, '2023-01-21 11:47:44', '2023-01-21 11:47:44'),
(149, 3, 5, 24, 1, NULL, '2023-01-21 11:47:44', '2023-01-21 11:47:44'),
(150, 3, 5, 25, 0, NULL, '2023-01-21 11:47:44', '2023-01-21 11:47:44'),
(151, 4, 1, 1, 0, NULL, '2023-01-21 11:48:13', '2023-01-21 11:48:13'),
(152, 4, 1, 2, 1, NULL, '2023-01-21 11:48:13', '2023-01-21 11:48:13'),
(153, 4, 1, 3, 1, NULL, '2023-01-21 11:48:13', '2023-01-21 11:48:13'),
(154, 4, 1, 4, 6, NULL, '2023-01-21 11:48:13', '2023-01-21 11:48:13'),
(155, 4, 1, 5, 0, NULL, '2023-01-21 11:48:13', '2023-01-21 11:48:13'),
(156, 4, 2, 6, 1, NULL, '2023-01-21 11:48:13', '2023-01-21 11:48:13'),
(157, 4, 2, 7, 1, NULL, '2023-01-21 11:48:13', '2023-01-21 11:48:13'),
(158, 4, 2, 8, 6, NULL, '2023-01-21 11:48:13', '2023-01-21 11:48:13'),
(159, 4, 2, 9, 1, NULL, '2023-01-21 11:48:13', '2023-01-21 11:48:13'),
(160, 4, 2, 10, 6, NULL, '2023-01-21 11:48:13', '2023-01-21 11:48:13'),
(161, 4, 3, 11, 6, NULL, '2023-01-21 11:48:13', '2023-01-21 11:48:13'),
(162, 4, 3, 12, 1, NULL, '2023-01-21 11:48:13', '2023-01-21 11:48:13'),
(163, 4, 3, 13, 1, NULL, '2023-01-21 11:48:13', '2023-01-21 11:48:13'),
(164, 4, 3, 14, 0, NULL, '2023-01-21 11:48:13', '2023-01-21 11:48:13'),
(165, 4, 3, 15, 6, NULL, '2023-01-21 11:48:13', '2023-01-21 11:48:13'),
(166, 4, 4, 16, 1, NULL, '2023-01-21 11:48:13', '2023-01-21 11:48:13'),
(167, 4, 4, 17, 6, NULL, '2023-01-21 11:48:13', '2023-01-21 11:48:13'),
(168, 4, 4, 18, 0, NULL, '2023-01-21 11:48:13', '2023-01-21 11:48:13'),
(169, 4, 4, 19, 1, NULL, '2023-01-21 11:48:13', '2023-01-21 11:48:13'),
(170, 4, 4, 20, 1, NULL, '2023-01-21 11:48:13', '2023-01-21 11:48:13'),
(171, 4, 5, 21, 6, NULL, '2023-01-21 11:48:13', '2023-01-21 11:48:13'),
(172, 4, 5, 22, 6, NULL, '2023-01-21 11:48:13', '2023-01-21 11:48:13'),
(173, 4, 5, 23, 0, NULL, '2023-01-21 11:48:13', '2023-01-21 11:48:13'),
(174, 4, 5, 24, 0, NULL, '2023-01-21 11:48:13', '2023-01-21 11:48:13'),
(175, 4, 5, 25, 6, NULL, '2023-01-21 11:48:13', '2023-01-21 11:48:13'),
(176, 5, 1, 1, 6, NULL, '2023-01-21 11:48:46', '2023-01-21 11:48:46'),
(177, 5, 1, 2, 1, NULL, '2023-01-21 11:48:46', '2023-01-21 11:48:46'),
(178, 5, 1, 3, 6, NULL, '2023-01-21 11:48:46', '2023-01-21 11:48:46'),
(179, 5, 1, 4, 6, NULL, '2023-01-21 11:48:46', '2023-01-21 11:48:46'),
(180, 5, 1, 5, 0, NULL, '2023-01-21 11:48:47', '2023-01-21 11:48:47'),
(181, 5, 2, 6, 0, NULL, '2023-01-21 11:48:47', '2023-01-21 11:48:47'),
(182, 5, 2, 7, 1, NULL, '2023-01-21 11:48:47', '2023-01-21 11:48:47'),
(183, 5, 2, 8, 1, NULL, '2023-01-21 11:48:47', '2023-01-21 11:48:47'),
(184, 5, 2, 9, 0, NULL, '2023-01-21 11:48:47', '2023-01-21 11:48:47'),
(185, 5, 2, 10, 6, NULL, '2023-01-21 11:48:47', '2023-01-21 11:48:47'),
(186, 5, 3, 11, 6, NULL, '2023-01-21 11:48:47', '2023-01-21 11:48:47'),
(187, 5, 3, 12, 6, NULL, '2023-01-21 11:48:47', '2023-01-21 11:48:47'),
(188, 5, 3, 13, 0, NULL, '2023-01-21 11:48:47', '2023-01-21 11:48:47'),
(189, 5, 3, 14, 1, NULL, '2023-01-21 11:48:47', '2023-01-21 11:48:47'),
(190, 5, 3, 15, 6, NULL, '2023-01-21 11:48:47', '2023-01-21 11:48:47'),
(191, 5, 4, 16, 1, NULL, '2023-01-21 11:48:47', '2023-01-21 11:48:47'),
(192, 5, 4, 17, 1, NULL, '2023-01-21 11:48:47', '2023-01-21 11:48:47'),
(193, 5, 4, 18, 6, NULL, '2023-01-21 11:48:47', '2023-01-21 11:48:47'),
(194, 5, 4, 19, 0, NULL, '2023-01-21 11:48:47', '2023-01-21 11:48:47'),
(195, 5, 4, 20, 0, NULL, '2023-01-21 11:48:47', '2023-01-21 11:48:47'),
(196, 5, 5, 21, 1, NULL, '2023-01-21 11:48:47', '2023-01-21 11:48:47'),
(197, 5, 5, 22, 0, NULL, '2023-01-21 11:48:47', '2023-01-21 11:48:47'),
(198, 5, 5, 23, 0, NULL, '2023-01-21 11:48:47', '2023-01-21 11:48:47'),
(199, 5, 5, 24, 0, NULL, '2023-01-21 11:48:47', '2023-01-21 11:48:47'),
(200, 5, 5, 25, 0, NULL, '2023-01-21 11:48:47', '2023-01-21 11:48:47'),
(201, 6, 1, 1, 1, NULL, '2023-01-21 11:49:27', '2023-01-21 11:49:27'),
(202, 6, 1, 2, 0, NULL, '2023-01-21 11:49:27', '2023-01-21 11:49:27'),
(203, 6, 1, 3, 0, NULL, '2023-01-21 11:49:27', '2023-01-21 11:49:27'),
(204, 6, 1, 4, 6, NULL, '2023-01-21 11:49:27', '2023-01-21 11:49:27'),
(205, 6, 1, 5, 6, NULL, '2023-01-21 11:49:27', '2023-01-21 11:49:27'),
(206, 6, 2, 6, 6, NULL, '2023-01-21 11:49:27', '2023-01-21 11:49:27'),
(207, 6, 2, 7, 1, NULL, '2023-01-21 11:49:27', '2023-01-21 11:49:27'),
(208, 6, 2, 8, 6, NULL, '2023-01-21 11:49:27', '2023-01-21 11:49:27'),
(209, 6, 2, 9, 1, NULL, '2023-01-21 11:49:27', '2023-01-21 11:49:27'),
(210, 6, 2, 10, 1, NULL, '2023-01-21 11:49:27', '2023-01-21 11:49:27'),
(211, 6, 3, 11, 1, NULL, '2023-01-21 11:49:27', '2023-01-21 11:49:27'),
(212, 6, 3, 12, 0, NULL, '2023-01-21 11:49:27', '2023-01-21 11:49:27'),
(213, 6, 3, 13, 6, NULL, '2023-01-21 11:49:27', '2023-01-21 11:49:27'),
(214, 6, 3, 14, 6, NULL, '2023-01-21 11:49:27', '2023-01-21 11:49:27'),
(215, 6, 3, 15, 0, NULL, '2023-01-21 11:49:27', '2023-01-21 11:49:27'),
(216, 6, 4, 16, 1, NULL, '2023-01-21 11:49:27', '2023-01-21 11:49:27'),
(217, 6, 4, 17, 0, NULL, '2023-01-21 11:49:27', '2023-01-21 11:49:27'),
(218, 6, 4, 18, 0, NULL, '2023-01-21 11:49:27', '2023-01-21 11:49:27'),
(219, 6, 4, 19, 0, NULL, '2023-01-21 11:49:27', '2023-01-21 11:49:27'),
(220, 6, 4, 20, 1, NULL, '2023-01-21 11:49:27', '2023-01-21 11:49:27'),
(221, 6, 5, 21, 6, NULL, '2023-01-21 11:49:27', '2023-01-21 11:49:27'),
(222, 6, 5, 22, 0, NULL, '2023-01-21 11:49:27', '2023-01-21 11:49:27'),
(223, 6, 5, 23, 1, NULL, '2023-01-21 11:49:27', '2023-01-21 11:49:27'),
(224, 6, 5, 24, 6, NULL, '2023-01-21 11:49:27', '2023-01-21 11:49:27'),
(225, 6, 5, 25, 1, NULL, '2023-01-21 11:49:27', '2023-01-21 11:49:27'),
(226, 7, 11, 51, 6, NULL, '2023-01-21 11:50:56', '2023-01-21 11:50:56'),
(227, 7, 11, 52, 6, NULL, '2023-01-21 11:50:56', '2023-01-21 11:50:56'),
(228, 7, 11, 53, 6, NULL, '2023-01-21 11:50:56', '2023-01-21 11:50:56'),
(229, 7, 11, 54, 6, NULL, '2023-01-21 11:50:56', '2023-01-21 11:50:56'),
(230, 7, 11, 55, 1, NULL, '2023-01-21 11:50:56', '2023-01-21 11:50:56'),
(231, 7, 12, 56, 6, NULL, '2023-01-21 11:50:56', '2023-01-21 11:50:56'),
(232, 7, 12, 57, 6, NULL, '2023-01-21 11:50:56', '2023-01-21 11:50:56'),
(233, 7, 12, 58, 6, NULL, '2023-01-21 11:50:56', '2023-01-21 11:50:56'),
(234, 7, 12, 59, 6, NULL, '2023-01-21 11:50:56', '2023-01-21 11:50:56'),
(235, 7, 12, 60, 6, NULL, '2023-01-21 11:50:56', '2023-01-21 11:50:56'),
(236, 7, 13, 61, 6, NULL, '2023-01-21 11:50:56', '2023-01-21 11:50:56'),
(237, 7, 13, 62, 6, NULL, '2023-01-21 11:50:56', '2023-01-21 11:50:56'),
(238, 7, 13, 63, 6, NULL, '2023-01-21 11:50:56', '2023-01-21 11:50:56'),
(239, 7, 13, 64, 6, NULL, '2023-01-21 11:50:56', '2023-01-21 11:50:56'),
(240, 7, 13, 65, 6, NULL, '2023-01-21 11:50:56', '2023-01-21 11:50:56'),
(241, 7, 14, 66, 6, NULL, '2023-01-21 11:50:56', '2023-01-21 11:50:56'),
(242, 7, 14, 67, 6, NULL, '2023-01-21 11:50:56', '2023-01-21 11:50:56'),
(243, 7, 14, 68, 6, NULL, '2023-01-21 11:50:56', '2023-01-21 11:50:56'),
(244, 7, 14, 69, 6, NULL, '2023-01-21 11:50:56', '2023-01-21 11:50:56'),
(245, 7, 14, 70, 6, NULL, '2023-01-21 11:50:56', '2023-01-21 11:50:56'),
(246, 7, 15, 71, 6, NULL, '2023-01-21 11:50:56', '2023-01-21 11:50:56'),
(247, 7, 15, 72, 6, NULL, '2023-01-21 11:50:56', '2023-01-21 11:50:56'),
(248, 7, 15, 73, 6, NULL, '2023-01-21 11:50:56', '2023-01-21 11:50:56'),
(249, 7, 15, 74, 6, NULL, '2023-01-21 11:50:56', '2023-01-21 11:50:56'),
(250, 7, 15, 75, 6, NULL, '2023-01-21 11:50:56', '2023-01-21 11:50:56'),
(251, 8, 11, 51, 6, NULL, '2023-01-21 11:51:48', '2023-01-21 11:51:48'),
(252, 8, 11, 52, 0, NULL, '2023-01-21 11:51:48', '2023-01-21 11:51:48'),
(253, 8, 11, 53, 0, NULL, '2023-01-21 11:51:48', '2023-01-21 11:51:48'),
(254, 8, 11, 54, 1, NULL, '2023-01-21 11:51:48', '2023-01-21 11:51:48'),
(255, 8, 11, 55, 6, NULL, '2023-01-21 11:51:48', '2023-01-21 11:51:48'),
(256, 8, 12, 56, 6, NULL, '2023-01-21 11:51:48', '2023-01-21 11:51:48'),
(257, 8, 12, 57, 0, NULL, '2023-01-21 11:51:48', '2023-01-21 11:51:48'),
(258, 8, 12, 58, 0, NULL, '2023-01-21 11:51:48', '2023-01-21 11:51:48'),
(259, 8, 12, 59, 0, NULL, '2023-01-21 11:51:48', '2023-01-21 11:51:48'),
(260, 8, 12, 60, 1, NULL, '2023-01-21 11:51:48', '2023-01-21 11:51:48'),
(261, 8, 13, 61, 1, NULL, '2023-01-21 11:51:48', '2023-01-21 11:51:48'),
(262, 8, 13, 62, 0, NULL, '2023-01-21 11:51:48', '2023-01-21 11:51:48'),
(263, 8, 13, 63, 0, NULL, '2023-01-21 11:51:48', '2023-01-21 11:51:48'),
(264, 8, 13, 64, 1, NULL, '2023-01-21 11:51:48', '2023-01-21 11:51:48'),
(265, 8, 13, 65, 1, NULL, '2023-01-21 11:51:48', '2023-01-21 11:51:48'),
(266, 8, 14, 66, 0, NULL, '2023-01-21 11:51:48', '2023-01-21 11:51:48'),
(267, 8, 14, 67, 0, NULL, '2023-01-21 11:51:48', '2023-01-21 11:51:48'),
(268, 8, 14, 68, 0, NULL, '2023-01-21 11:51:48', '2023-01-21 11:51:48'),
(269, 8, 14, 69, 1, NULL, '2023-01-21 11:51:48', '2023-01-21 11:51:48'),
(270, 8, 14, 70, 6, NULL, '2023-01-21 11:51:48', '2023-01-21 11:51:48'),
(271, 8, 15, 71, 0, NULL, '2023-01-21 11:51:48', '2023-01-21 11:51:48'),
(272, 8, 15, 72, 1, NULL, '2023-01-21 11:51:48', '2023-01-21 11:51:48'),
(273, 8, 15, 73, 0, NULL, '2023-01-21 11:51:48', '2023-01-21 11:51:48'),
(274, 8, 15, 74, 6, NULL, '2023-01-21 11:51:48', '2023-01-21 11:51:48'),
(275, 8, 15, 75, 1, NULL, '2023-01-21 11:51:48', '2023-01-21 11:51:48'),
(276, 9, 11, 51, 0, NULL, '2023-01-21 11:52:16', '2023-01-21 11:52:16'),
(277, 9, 11, 52, 0, NULL, '2023-01-21 11:52:16', '2023-01-21 11:52:16'),
(278, 9, 11, 53, 0, NULL, '2023-01-21 11:52:16', '2023-01-21 11:52:16'),
(279, 9, 11, 54, 6, NULL, '2023-01-21 11:52:16', '2023-01-21 11:52:16'),
(280, 9, 11, 55, 6, NULL, '2023-01-21 11:52:16', '2023-01-21 11:52:16'),
(281, 9, 12, 56, 1, NULL, '2023-01-21 11:52:16', '2023-01-21 11:52:16'),
(282, 9, 12, 57, 6, NULL, '2023-01-21 11:52:16', '2023-01-21 11:52:16'),
(283, 9, 12, 58, 6, NULL, '2023-01-21 11:52:16', '2023-01-21 11:52:16'),
(284, 9, 12, 59, 0, NULL, '2023-01-21 11:52:16', '2023-01-21 11:52:16'),
(285, 9, 12, 60, 1, NULL, '2023-01-21 11:52:16', '2023-01-21 11:52:16'),
(286, 9, 13, 61, 1, NULL, '2023-01-21 11:52:16', '2023-01-21 11:52:16'),
(287, 9, 13, 62, 6, NULL, '2023-01-21 11:52:16', '2023-01-21 11:52:16'),
(288, 9, 13, 63, 0, NULL, '2023-01-21 11:52:16', '2023-01-21 11:52:16'),
(289, 9, 13, 64, 6, NULL, '2023-01-21 11:52:16', '2023-01-21 11:52:16'),
(290, 9, 13, 65, 6, NULL, '2023-01-21 11:52:16', '2023-01-21 11:52:16'),
(291, 9, 14, 66, 6, NULL, '2023-01-21 11:52:16', '2023-01-21 11:52:16'),
(292, 9, 14, 67, 6, NULL, '2023-01-21 11:52:16', '2023-01-21 11:52:16'),
(293, 9, 14, 68, 6, NULL, '2023-01-21 11:52:16', '2023-01-21 11:52:16'),
(294, 9, 14, 69, 1, NULL, '2023-01-21 11:52:16', '2023-01-21 11:52:16'),
(295, 9, 14, 70, 6, NULL, '2023-01-21 11:52:16', '2023-01-21 11:52:16'),
(296, 9, 15, 71, 0, NULL, '2023-01-21 11:52:16', '2023-01-21 11:52:16'),
(297, 9, 15, 72, 1, NULL, '2023-01-21 11:52:16', '2023-01-21 11:52:16'),
(298, 9, 15, 73, 0, NULL, '2023-01-21 11:52:16', '2023-01-21 11:52:16'),
(299, 9, 15, 74, 0, NULL, '2023-01-21 11:52:16', '2023-01-21 11:52:16'),
(300, 9, 15, 75, 1, NULL, '2023-01-21 11:52:16', '2023-01-21 11:52:16'),
(301, 10, 11, 51, 6, NULL, '2023-01-21 11:57:35', '2023-01-21 11:57:35'),
(302, 10, 11, 52, 1, NULL, '2023-01-21 11:57:35', '2023-01-21 11:57:35'),
(303, 10, 11, 53, 0, NULL, '2023-01-21 11:57:35', '2023-01-21 11:57:35'),
(304, 10, 11, 54, 6, NULL, '2023-01-21 11:57:35', '2023-01-21 11:57:35'),
(305, 10, 11, 55, 6, NULL, '2023-01-21 11:57:35', '2023-01-21 11:57:35'),
(306, 10, 12, 56, 0, NULL, '2023-01-21 11:57:35', '2023-01-21 11:57:35'),
(307, 10, 12, 57, 6, NULL, '2023-01-21 11:57:35', '2023-01-21 11:57:35'),
(308, 10, 12, 58, 1, NULL, '2023-01-21 11:57:35', '2023-01-21 11:57:35'),
(309, 10, 12, 59, 6, NULL, '2023-01-21 11:57:35', '2023-01-21 11:57:35'),
(310, 10, 12, 60, 6, NULL, '2023-01-21 11:57:35', '2023-01-21 11:57:35'),
(311, 10, 13, 61, 0, NULL, '2023-01-21 11:57:35', '2023-01-21 11:57:35'),
(312, 10, 13, 62, 1, NULL, '2023-01-21 11:57:35', '2023-01-21 11:57:35'),
(313, 10, 13, 63, 1, NULL, '2023-01-21 11:57:35', '2023-01-21 11:57:35'),
(314, 10, 13, 64, 1, NULL, '2023-01-21 11:57:35', '2023-01-21 11:57:35'),
(315, 10, 13, 65, 1, NULL, '2023-01-21 11:57:35', '2023-01-21 11:57:35'),
(316, 10, 14, 66, 6, NULL, '2023-01-21 11:57:35', '2023-01-21 11:57:35'),
(317, 10, 14, 67, 1, NULL, '2023-01-21 11:57:35', '2023-01-21 11:57:35'),
(318, 10, 14, 68, 6, NULL, '2023-01-21 11:57:35', '2023-01-21 11:57:35'),
(319, 10, 14, 69, 1, NULL, '2023-01-21 11:57:35', '2023-01-21 11:57:35'),
(320, 10, 14, 70, 6, NULL, '2023-01-21 11:57:35', '2023-01-21 11:57:35'),
(321, 10, 15, 71, 1, NULL, '2023-01-21 11:57:35', '2023-01-21 11:57:35'),
(322, 10, 15, 72, 6, NULL, '2023-01-21 11:57:35', '2023-01-21 11:57:35'),
(323, 10, 15, 73, 0, NULL, '2023-01-21 11:57:35', '2023-01-21 11:57:35'),
(324, 10, 15, 74, 0, NULL, '2023-01-21 11:57:35', '2023-01-21 11:57:35'),
(325, 10, 15, 75, 6, NULL, '2023-01-21 11:57:35', '2023-01-21 11:57:35'),
(326, 11, 11, 51, 6, NULL, '2023-01-21 11:58:00', '2023-01-21 11:58:00'),
(327, 11, 11, 52, 6, NULL, '2023-01-21 11:58:00', '2023-01-21 11:58:00'),
(328, 11, 11, 53, 6, NULL, '2023-01-21 11:58:00', '2023-01-21 11:58:00'),
(329, 11, 11, 54, 6, NULL, '2023-01-21 11:58:00', '2023-01-21 11:58:00'),
(330, 11, 11, 55, 6, NULL, '2023-01-21 11:58:00', '2023-01-21 11:58:00'),
(331, 11, 12, 56, 6, NULL, '2023-01-21 11:58:00', '2023-01-21 11:58:00'),
(332, 11, 12, 57, 6, NULL, '2023-01-21 11:58:00', '2023-01-21 11:58:00'),
(333, 11, 12, 58, 6, NULL, '2023-01-21 11:58:00', '2023-01-21 11:58:00'),
(334, 11, 12, 59, 6, NULL, '2023-01-21 11:58:00', '2023-01-21 11:58:00'),
(335, 11, 12, 60, 6, NULL, '2023-01-21 11:58:00', '2023-01-21 11:58:00'),
(336, 11, 13, 61, 6, NULL, '2023-01-21 11:58:00', '2023-01-21 11:58:00'),
(337, 11, 13, 62, 6, NULL, '2023-01-21 11:58:00', '2023-01-21 11:58:00'),
(338, 11, 13, 63, 6, NULL, '2023-01-21 11:58:00', '2023-01-21 11:58:00'),
(339, 11, 13, 64, 6, NULL, '2023-01-21 11:58:00', '2023-01-21 11:58:00'),
(340, 11, 13, 65, 6, NULL, '2023-01-21 11:58:00', '2023-01-21 11:58:00'),
(341, 11, 14, 66, 6, NULL, '2023-01-21 11:58:00', '2023-01-21 11:58:00'),
(342, 11, 14, 67, 6, NULL, '2023-01-21 11:58:00', '2023-01-21 11:58:00'),
(343, 11, 14, 68, 6, NULL, '2023-01-21 11:58:00', '2023-01-21 11:58:00'),
(344, 11, 14, 69, 6, NULL, '2023-01-21 11:58:00', '2023-01-21 11:58:00'),
(345, 11, 14, 70, 6, NULL, '2023-01-21 11:58:00', '2023-01-21 11:58:00'),
(346, 11, 15, 71, 6, NULL, '2023-01-21 11:58:00', '2023-01-21 11:58:00'),
(347, 11, 15, 72, 6, NULL, '2023-01-21 11:58:00', '2023-01-21 11:58:00'),
(348, 11, 15, 73, 6, NULL, '2023-01-21 11:58:00', '2023-01-21 11:58:00'),
(349, 11, 15, 74, 6, NULL, '2023-01-21 11:58:00', '2023-01-21 11:58:00'),
(350, 11, 15, 75, 6, NULL, '2023-01-21 11:58:00', '2023-01-21 11:58:00'),
(351, 12, 16, 76, 6, NULL, '2023-01-21 11:59:52', '2023-01-21 11:59:52'),
(352, 12, 16, 77, 6, NULL, '2023-01-21 11:59:52', '2023-01-21 11:59:52'),
(353, 12, 16, 78, 6, NULL, '2023-01-21 11:59:52', '2023-01-21 11:59:52'),
(354, 12, 16, 79, 6, NULL, '2023-01-21 11:59:52', '2023-01-21 11:59:52'),
(355, 12, 16, 80, 6, NULL, '2023-01-21 11:59:52', '2023-01-21 11:59:52'),
(356, 12, 17, 81, 6, NULL, '2023-01-21 11:59:52', '2023-01-21 11:59:52'),
(357, 12, 17, 82, 6, NULL, '2023-01-21 11:59:52', '2023-01-21 11:59:52'),
(358, 12, 17, 83, 6, NULL, '2023-01-21 11:59:52', '2023-01-21 11:59:52'),
(359, 12, 17, 84, 6, NULL, '2023-01-21 11:59:52', '2023-01-21 11:59:52'),
(360, 12, 17, 85, 6, NULL, '2023-01-21 11:59:52', '2023-01-21 11:59:52'),
(361, 12, 18, 86, 6, NULL, '2023-01-21 11:59:52', '2023-01-21 11:59:52'),
(362, 12, 18, 87, 6, NULL, '2023-01-21 11:59:52', '2023-01-21 11:59:52'),
(363, 12, 18, 88, 6, NULL, '2023-01-21 11:59:52', '2023-01-21 11:59:52'),
(364, 12, 18, 89, 6, NULL, '2023-01-21 11:59:52', '2023-01-21 11:59:52'),
(365, 12, 18, 90, 6, NULL, '2023-01-21 11:59:52', '2023-01-21 11:59:52'),
(366, 12, 19, 91, 6, NULL, '2023-01-21 11:59:52', '2023-01-21 11:59:52'),
(367, 12, 19, 92, 6, NULL, '2023-01-21 11:59:52', '2023-01-21 11:59:52'),
(368, 12, 19, 93, 6, NULL, '2023-01-21 11:59:52', '2023-01-21 11:59:52'),
(369, 12, 19, 94, 6, NULL, '2023-01-21 11:59:52', '2023-01-21 11:59:52'),
(370, 12, 19, 95, 6, NULL, '2023-01-21 11:59:52', '2023-01-21 11:59:52'),
(371, 12, 20, 96, 6, NULL, '2023-01-21 11:59:52', '2023-01-21 11:59:52'),
(372, 12, 20, 97, 6, NULL, '2023-01-21 11:59:52', '2023-01-21 11:59:52'),
(373, 12, 20, 98, 6, NULL, '2023-01-21 11:59:52', '2023-01-21 11:59:52'),
(374, 12, 20, 99, 6, NULL, '2023-01-21 11:59:52', '2023-01-21 11:59:52'),
(375, 12, 20, 100, 6, NULL, '2023-01-21 11:59:52', '2023-01-21 11:59:52'),
(376, 13, 16, 76, 0, NULL, '2023-01-21 12:00:29', '2023-01-21 12:00:29'),
(377, 13, 16, 77, 1, NULL, '2023-01-21 12:00:29', '2023-01-21 12:00:29'),
(378, 13, 16, 78, 0, NULL, '2023-01-21 12:00:29', '2023-01-21 12:00:29'),
(379, 13, 16, 79, 6, NULL, '2023-01-21 12:00:29', '2023-01-21 12:00:29'),
(380, 13, 16, 80, 0, NULL, '2023-01-21 12:00:29', '2023-01-21 12:00:29'),
(381, 13, 17, 81, 0, NULL, '2023-01-21 12:00:29', '2023-01-21 12:00:29'),
(382, 13, 17, 82, 6, NULL, '2023-01-21 12:00:29', '2023-01-21 12:00:29'),
(383, 13, 17, 83, 1, NULL, '2023-01-21 12:00:29', '2023-01-21 12:00:29'),
(384, 13, 17, 84, 6, NULL, '2023-01-21 12:00:29', '2023-01-21 12:00:29'),
(385, 13, 17, 85, 6, NULL, '2023-01-21 12:00:29', '2023-01-21 12:00:29'),
(386, 13, 18, 86, 6, NULL, '2023-01-21 12:00:29', '2023-01-21 12:00:29'),
(387, 13, 18, 87, 6, NULL, '2023-01-21 12:00:29', '2023-01-21 12:00:29'),
(388, 13, 18, 88, 0, NULL, '2023-01-21 12:00:29', '2023-01-21 12:00:29'),
(389, 13, 18, 89, 1, NULL, '2023-01-21 12:00:29', '2023-01-21 12:00:29'),
(390, 13, 18, 90, 6, NULL, '2023-01-21 12:00:29', '2023-01-21 12:00:29'),
(391, 13, 19, 91, 0, NULL, '2023-01-21 12:00:29', '2023-01-21 12:00:29'),
(392, 13, 19, 92, 6, NULL, '2023-01-21 12:00:29', '2023-01-21 12:00:29'),
(393, 13, 19, 93, 1, NULL, '2023-01-21 12:00:29', '2023-01-21 12:00:29'),
(394, 13, 19, 94, 0, NULL, '2023-01-21 12:00:29', '2023-01-21 12:00:29'),
(395, 13, 19, 95, 6, NULL, '2023-01-21 12:00:29', '2023-01-21 12:00:29'),
(396, 13, 20, 96, 6, NULL, '2023-01-21 12:00:29', '2023-01-21 12:00:29'),
(397, 13, 20, 97, 1, NULL, '2023-01-21 12:00:29', '2023-01-21 12:00:29'),
(398, 13, 20, 98, 6, NULL, '2023-01-21 12:00:29', '2023-01-21 12:00:29'),
(399, 13, 20, 99, 6, NULL, '2023-01-21 12:00:29', '2023-01-21 12:00:29'),
(400, 13, 20, 100, 1, NULL, '2023-01-21 12:00:29', '2023-01-21 12:00:29'),
(401, 14, 16, 76, 0, NULL, '2023-01-21 12:01:58', '2023-01-21 12:01:58'),
(402, 14, 16, 77, 0, NULL, '2023-01-21 12:01:58', '2023-01-21 12:01:58'),
(403, 14, 16, 78, 6, NULL, '2023-01-21 12:01:58', '2023-01-21 12:01:58'),
(404, 14, 16, 79, 6, NULL, '2023-01-21 12:01:58', '2023-01-21 12:01:58'),
(405, 14, 16, 80, 6, NULL, '2023-01-21 12:01:58', '2023-01-21 12:01:58'),
(406, 14, 17, 81, 1, NULL, '2023-01-21 12:01:58', '2023-01-21 12:01:58'),
(407, 14, 17, 82, 1, NULL, '2023-01-21 12:01:58', '2023-01-21 12:01:58'),
(408, 14, 17, 83, 6, NULL, '2023-01-21 12:01:58', '2023-01-21 12:01:58'),
(409, 14, 17, 84, 1, NULL, '2023-01-21 12:01:58', '2023-01-21 12:01:58'),
(410, 14, 17, 85, 6, NULL, '2023-01-21 12:01:58', '2023-01-21 12:01:58'),
(411, 14, 18, 86, 0, NULL, '2023-01-21 12:01:58', '2023-01-21 12:01:58'),
(412, 14, 18, 87, 0, NULL, '2023-01-21 12:01:58', '2023-01-21 12:01:58'),
(413, 14, 18, 88, 1, NULL, '2023-01-21 12:01:58', '2023-01-21 12:01:58'),
(414, 14, 18, 89, 1, NULL, '2023-01-21 12:01:58', '2023-01-21 12:01:58'),
(415, 14, 18, 90, 1, NULL, '2023-01-21 12:01:58', '2023-01-21 12:01:58'),
(416, 14, 19, 91, 1, NULL, '2023-01-21 12:01:58', '2023-01-21 12:01:58'),
(417, 14, 19, 92, 1, NULL, '2023-01-21 12:01:58', '2023-01-21 12:01:58'),
(418, 14, 19, 93, 0, NULL, '2023-01-21 12:01:58', '2023-01-21 12:01:58'),
(419, 14, 19, 94, 0, NULL, '2023-01-21 12:01:58', '2023-01-21 12:01:58'),
(420, 14, 19, 95, 1, NULL, '2023-01-21 12:01:58', '2023-01-21 12:01:58'),
(421, 14, 20, 96, 1, NULL, '2023-01-21 12:01:58', '2023-01-21 12:01:58'),
(422, 14, 20, 97, 1, NULL, '2023-01-21 12:01:58', '2023-01-21 12:01:58'),
(423, 14, 20, 98, 6, NULL, '2023-01-21 12:01:58', '2023-01-21 12:01:58'),
(424, 14, 20, 99, 6, NULL, '2023-01-21 12:01:58', '2023-01-21 12:01:58'),
(425, 14, 20, 100, 6, NULL, '2023-01-21 12:01:58', '2023-01-21 12:01:58'),
(426, 15, 16, 76, 6, NULL, '2023-01-21 12:04:47', '2023-01-21 12:04:47'),
(427, 15, 16, 77, 6, NULL, '2023-01-21 12:04:47', '2023-01-21 12:04:47'),
(428, 15, 16, 78, 6, NULL, '2023-01-21 12:04:47', '2023-01-21 12:04:47'),
(429, 15, 16, 79, 6, NULL, '2023-01-21 12:04:47', '2023-01-21 12:04:47'),
(430, 15, 16, 80, 6, NULL, '2023-01-21 12:04:47', '2023-01-21 12:04:47'),
(431, 15, 17, 81, 6, NULL, '2023-01-21 12:04:47', '2023-01-21 12:04:47'),
(432, 15, 17, 82, 6, NULL, '2023-01-21 12:04:47', '2023-01-21 12:04:47'),
(433, 15, 17, 83, 6, NULL, '2023-01-21 12:04:48', '2023-01-21 12:04:48'),
(434, 15, 17, 84, 6, NULL, '2023-01-21 12:04:48', '2023-01-21 12:04:48'),
(435, 15, 17, 85, 6, NULL, '2023-01-21 12:04:48', '2023-01-21 12:04:48'),
(436, 15, 18, 86, 6, NULL, '2023-01-21 12:04:48', '2023-01-21 12:04:48'),
(437, 15, 18, 87, 6, NULL, '2023-01-21 12:04:48', '2023-01-21 12:04:48'),
(438, 15, 18, 88, 6, NULL, '2023-01-21 12:04:48', '2023-01-21 12:04:48'),
(439, 15, 18, 89, 6, NULL, '2023-01-21 12:04:48', '2023-01-21 12:04:48'),
(440, 15, 18, 90, 6, NULL, '2023-01-21 12:04:48', '2023-01-21 12:04:48'),
(441, 15, 19, 91, 6, NULL, '2023-01-21 12:04:48', '2023-01-21 12:04:48'),
(442, 15, 19, 92, 6, NULL, '2023-01-21 12:04:48', '2023-01-21 12:04:48'),
(443, 15, 19, 93, 6, NULL, '2023-01-21 12:04:48', '2023-01-21 12:04:48'),
(444, 15, 19, 94, 6, NULL, '2023-01-21 12:04:48', '2023-01-21 12:04:48'),
(445, 15, 19, 95, 6, NULL, '2023-01-21 12:04:48', '2023-01-21 12:04:48'),
(446, 15, 20, 96, 6, NULL, '2023-01-21 12:04:48', '2023-01-21 12:04:48'),
(447, 15, 20, 97, 6, NULL, '2023-01-21 12:04:48', '2023-01-21 12:04:48'),
(448, 15, 20, 98, 6, NULL, '2023-01-21 12:04:48', '2023-01-21 12:04:48'),
(449, 15, 20, 99, 6, NULL, '2023-01-21 12:04:48', '2023-01-21 12:04:48'),
(450, 15, 20, 100, 6, NULL, '2023-01-21 12:04:48', '2023-01-21 12:04:48'),
(451, 16, 16, 76, 6, NULL, '2023-01-21 12:06:21', '2023-01-21 12:06:21'),
(452, 16, 16, 77, 6, NULL, '2023-01-21 12:06:21', '2023-01-21 12:06:21'),
(453, 16, 16, 78, 6, NULL, '2023-01-21 12:06:21', '2023-01-21 12:06:21'),
(454, 16, 16, 79, 6, NULL, '2023-01-21 12:06:21', '2023-01-21 12:06:21'),
(455, 16, 16, 80, 6, NULL, '2023-01-21 12:06:21', '2023-01-21 12:06:21'),
(456, 16, 17, 81, 6, NULL, '2023-01-21 12:06:21', '2023-01-21 12:06:21'),
(457, 16, 17, 82, 6, NULL, '2023-01-21 12:06:21', '2023-01-21 12:06:21'),
(458, 16, 17, 83, 6, NULL, '2023-01-21 12:06:21', '2023-01-21 12:06:21'),
(459, 16, 17, 84, 6, NULL, '2023-01-21 12:06:21', '2023-01-21 12:06:21'),
(460, 16, 17, 85, 6, NULL, '2023-01-21 12:06:21', '2023-01-21 12:06:21'),
(461, 16, 18, 86, 6, NULL, '2023-01-21 12:06:21', '2023-01-21 12:06:21'),
(462, 16, 18, 87, 6, NULL, '2023-01-21 12:06:21', '2023-01-21 12:06:21'),
(463, 16, 18, 88, 6, NULL, '2023-01-21 12:06:21', '2023-01-21 12:06:21'),
(464, 16, 18, 89, 6, NULL, '2023-01-21 12:06:21', '2023-01-21 12:06:21'),
(465, 16, 18, 90, 6, NULL, '2023-01-21 12:06:21', '2023-01-21 12:06:21'),
(466, 16, 19, 91, 6, NULL, '2023-01-21 12:06:21', '2023-01-21 12:06:21'),
(467, 16, 19, 92, 6, NULL, '2023-01-21 12:06:21', '2023-01-21 12:06:21'),
(468, 16, 19, 93, 6, NULL, '2023-01-21 12:06:21', '2023-01-21 12:06:21'),
(469, 16, 19, 94, 6, NULL, '2023-01-21 12:06:21', '2023-01-21 12:06:21'),
(470, 16, 19, 95, 6, NULL, '2023-01-21 12:06:21', '2023-01-21 12:06:21'),
(471, 16, 20, 96, 6, NULL, '2023-01-21 12:06:21', '2023-01-21 12:06:21'),
(472, 16, 20, 97, 6, NULL, '2023-01-21 12:06:21', '2023-01-21 12:06:21'),
(473, 16, 20, 98, 6, NULL, '2023-01-21 12:06:21', '2023-01-21 12:06:21'),
(474, 16, 20, 99, 6, NULL, '2023-01-21 12:06:21', '2023-01-21 12:06:21'),
(475, 16, 20, 100, 6, NULL, '2023-01-21 12:06:21', '2023-01-21 12:06:21'),
(476, 17, 16, 76, 1, NULL, '2023-01-21 12:07:05', '2023-01-21 12:07:05'),
(477, 17, 16, 77, 0, NULL, '2023-01-21 12:07:05', '2023-01-21 12:07:05'),
(478, 17, 16, 78, 6, NULL, '2023-01-21 12:07:05', '2023-01-21 12:07:05'),
(479, 17, 16, 79, 1, NULL, '2023-01-21 12:07:05', '2023-01-21 12:07:05'),
(480, 17, 16, 80, 6, NULL, '2023-01-21 12:07:05', '2023-01-21 12:07:05'),
(481, 17, 17, 81, 1, NULL, '2023-01-21 12:07:05', '2023-01-21 12:07:05'),
(482, 17, 17, 82, 1, NULL, '2023-01-21 12:07:05', '2023-01-21 12:07:05'),
(483, 17, 17, 83, 1, NULL, '2023-01-21 12:07:05', '2023-01-21 12:07:05'),
(484, 17, 17, 84, 0, NULL, '2023-01-21 12:07:05', '2023-01-21 12:07:05'),
(485, 17, 17, 85, 6, NULL, '2023-01-21 12:07:05', '2023-01-21 12:07:05'),
(486, 17, 18, 86, 1, NULL, '2023-01-21 12:07:05', '2023-01-21 12:07:05'),
(487, 17, 18, 87, 1, NULL, '2023-01-21 12:07:05', '2023-01-21 12:07:05'),
(488, 17, 18, 88, 6, NULL, '2023-01-21 12:07:05', '2023-01-21 12:07:05'),
(489, 17, 18, 89, 6, NULL, '2023-01-21 12:07:05', '2023-01-21 12:07:05'),
(490, 17, 18, 90, 6, NULL, '2023-01-21 12:07:05', '2023-01-21 12:07:05'),
(491, 17, 19, 91, 1, NULL, '2023-01-21 12:07:05', '2023-01-21 12:07:05'),
(492, 17, 19, 92, 6, NULL, '2023-01-21 12:07:05', '2023-01-21 12:07:05'),
(493, 17, 19, 93, 6, NULL, '2023-01-21 12:07:05', '2023-01-21 12:07:05'),
(494, 17, 19, 94, 6, NULL, '2023-01-21 12:07:05', '2023-01-21 12:07:05'),
(495, 17, 19, 95, 6, NULL, '2023-01-21 12:07:05', '2023-01-21 12:07:05'),
(496, 17, 20, 96, 6, NULL, '2023-01-21 12:07:05', '2023-01-21 12:07:05'),
(497, 17, 20, 97, 6, NULL, '2023-01-21 12:07:05', '2023-01-21 12:07:05'),
(498, 17, 20, 98, 6, NULL, '2023-01-21 12:07:05', '2023-01-21 12:07:05'),
(499, 17, 20, 99, 1, NULL, '2023-01-21 12:07:05', '2023-01-21 12:07:05'),
(500, 17, 20, 100, 1, NULL, '2023-01-21 12:07:05', '2023-01-21 12:07:05'),
(501, 18, 16, 76, 6, NULL, '2023-01-21 12:08:27', '2023-01-21 12:08:27'),
(502, 18, 16, 77, 0, NULL, '2023-01-21 12:08:27', '2023-01-21 12:08:27'),
(503, 18, 16, 78, 1, NULL, '2023-01-21 12:08:27', '2023-01-21 12:08:27'),
(504, 18, 16, 79, 1, NULL, '2023-01-21 12:08:27', '2023-01-21 12:08:27'),
(505, 18, 16, 80, 6, NULL, '2023-01-21 12:08:27', '2023-01-21 12:08:27'),
(506, 18, 17, 81, 1, NULL, '2023-01-21 12:08:27', '2023-01-21 12:08:27'),
(507, 18, 17, 82, 6, NULL, '2023-01-21 12:08:27', '2023-01-21 12:08:27'),
(508, 18, 17, 83, 1, NULL, '2023-01-21 12:08:27', '2023-01-21 12:08:27'),
(509, 18, 17, 84, 0, NULL, '2023-01-21 12:08:27', '2023-01-21 12:08:27'),
(510, 18, 17, 85, 1, NULL, '2023-01-21 12:08:27', '2023-01-21 12:08:27'),
(511, 18, 18, 86, 6, NULL, '2023-01-21 12:08:27', '2023-01-21 12:08:27'),
(512, 18, 18, 87, 6, NULL, '2023-01-21 12:08:27', '2023-01-21 12:08:27'),
(513, 18, 18, 88, 0, NULL, '2023-01-21 12:08:27', '2023-01-21 12:08:27'),
(514, 18, 18, 89, 1, NULL, '2023-01-21 12:08:27', '2023-01-21 12:08:27'),
(515, 18, 18, 90, 6, NULL, '2023-01-21 12:08:27', '2023-01-21 12:08:27'),
(516, 18, 19, 91, 1, NULL, '2023-01-21 12:08:27', '2023-01-21 12:08:27'),
(517, 18, 19, 92, 0, NULL, '2023-01-21 12:08:27', '2023-01-21 12:08:27'),
(518, 18, 19, 93, 1, NULL, '2023-01-21 12:08:27', '2023-01-21 12:08:27'),
(519, 18, 19, 94, 6, NULL, '2023-01-21 12:08:27', '2023-01-21 12:08:27'),
(520, 18, 19, 95, 6, NULL, '2023-01-21 12:08:27', '2023-01-21 12:08:27'),
(521, 18, 20, 96, 0, NULL, '2023-01-21 12:08:27', '2023-01-21 12:08:27'),
(522, 18, 20, 97, 6, NULL, '2023-01-21 12:08:27', '2023-01-21 12:08:27'),
(523, 18, 20, 98, 6, NULL, '2023-01-21 12:08:27', '2023-01-21 12:08:27'),
(524, 18, 20, 99, 1, NULL, '2023-01-21 12:08:27', '2023-01-21 12:08:27'),
(525, 18, 20, 100, 6, NULL, '2023-01-21 12:08:27', '2023-01-21 12:08:27'),
(526, 19, 6, 26, 6, NULL, '2023-01-21 13:29:11', '2023-01-21 13:29:11'),
(527, 19, 6, 27, 0, NULL, '2023-01-21 13:29:11', '2023-01-21 13:29:11'),
(528, 19, 6, 28, 6, NULL, '2023-01-21 13:29:11', '2023-01-21 13:29:11'),
(529, 19, 6, 29, 6, NULL, '2023-01-21 13:29:11', '2023-01-21 13:29:11'),
(530, 19, 6, 30, 6, NULL, '2023-01-21 13:29:11', '2023-01-21 13:29:11'),
(531, 19, 7, 31, 6, NULL, '2023-01-21 13:29:11', '2023-01-21 13:29:11'),
(532, 19, 7, 32, 0, NULL, '2023-01-21 13:29:11', '2023-01-21 13:29:11'),
(533, 19, 7, 33, 1, NULL, '2023-01-21 13:29:11', '2023-01-21 13:29:11'),
(534, 19, 7, 34, 1, NULL, '2023-01-21 13:29:11', '2023-01-21 13:29:11'),
(535, 19, 7, 35, 6, NULL, '2023-01-21 13:29:11', '2023-01-21 13:29:11'),
(536, 19, 8, 36, 0, NULL, '2023-01-21 13:29:11', '2023-01-21 13:29:11'),
(537, 19, 8, 37, 1, NULL, '2023-01-21 13:29:11', '2023-01-21 13:29:11'),
(538, 19, 8, 38, 1, NULL, '2023-01-21 13:29:11', '2023-01-21 13:29:11'),
(539, 19, 8, 39, 6, NULL, '2023-01-21 13:29:11', '2023-01-21 13:29:11'),
(540, 19, 8, 40, 6, NULL, '2023-01-21 13:29:11', '2023-01-21 13:29:11'),
(541, 19, 9, 41, 0, NULL, '2023-01-21 13:29:11', '2023-01-21 13:29:11'),
(542, 19, 9, 42, 6, NULL, '2023-01-21 13:29:11', '2023-01-21 13:29:11'),
(543, 19, 9, 43, 0, NULL, '2023-01-21 13:29:11', '2023-01-21 13:29:11'),
(544, 19, 9, 44, 1, NULL, '2023-01-21 13:29:11', '2023-01-21 13:29:11'),
(545, 19, 9, 45, 1, NULL, '2023-01-21 13:29:11', '2023-01-21 13:29:11'),
(546, 19, 10, 46, 1, NULL, '2023-01-21 13:29:11', '2023-01-21 13:29:11'),
(547, 19, 10, 47, 6, NULL, '2023-01-21 13:29:11', '2023-01-21 13:29:11'),
(548, 19, 10, 48, 0, NULL, '2023-01-21 13:29:11', '2023-01-21 13:29:11'),
(549, 19, 10, 49, 0, NULL, '2023-01-21 13:29:11', '2023-01-21 13:29:11'),
(550, 19, 10, 50, 1, NULL, '2023-01-21 13:29:11', '2023-01-21 13:29:11'),
(551, 20, 6, 26, 0, NULL, '2023-01-21 13:30:23', '2023-01-21 13:30:23'),
(552, 20, 6, 27, 6, NULL, '2023-01-21 13:30:23', '2023-01-21 13:30:23'),
(553, 20, 6, 28, 0, NULL, '2023-01-21 13:30:23', '2023-01-21 13:30:23'),
(554, 20, 6, 29, 1, NULL, '2023-01-21 13:30:23', '2023-01-21 13:30:23'),
(555, 20, 6, 30, 0, NULL, '2023-01-21 13:30:23', '2023-01-21 13:30:23'),
(556, 20, 7, 31, 0, NULL, '2023-01-21 13:30:23', '2023-01-21 13:30:23'),
(557, 20, 7, 32, 6, NULL, '2023-01-21 13:30:23', '2023-01-21 13:30:23'),
(558, 20, 7, 33, 0, NULL, '2023-01-21 13:30:23', '2023-01-21 13:30:23'),
(559, 20, 7, 34, 0, NULL, '2023-01-21 13:30:23', '2023-01-21 13:30:23'),
(560, 20, 7, 35, 0, NULL, '2023-01-21 13:30:23', '2023-01-21 13:30:23'),
(561, 20, 8, 36, 0, NULL, '2023-01-21 13:30:23', '2023-01-21 13:30:23'),
(562, 20, 8, 37, 6, NULL, '2023-01-21 13:30:23', '2023-01-21 13:30:23'),
(563, 20, 8, 38, 1, NULL, '2023-01-21 13:30:23', '2023-01-21 13:30:23'),
(564, 20, 8, 39, 1, NULL, '2023-01-21 13:30:23', '2023-01-21 13:30:23'),
(565, 20, 8, 40, 6, NULL, '2023-01-21 13:30:23', '2023-01-21 13:30:23'),
(566, 20, 9, 41, 6, NULL, '2023-01-21 13:30:23', '2023-01-21 13:30:23'),
(567, 20, 9, 42, 0, NULL, '2023-01-21 13:30:23', '2023-01-21 13:30:23'),
(568, 20, 9, 43, 1, NULL, '2023-01-21 13:30:23', '2023-01-21 13:30:23'),
(569, 20, 9, 44, 6, NULL, '2023-01-21 13:30:23', '2023-01-21 13:30:23'),
(570, 20, 9, 45, 0, NULL, '2023-01-21 13:30:23', '2023-01-21 13:30:23'),
(571, 20, 10, 46, 1, NULL, '2023-01-21 13:30:23', '2023-01-21 13:30:23'),
(572, 20, 10, 47, 0, NULL, '2023-01-21 13:30:23', '2023-01-21 13:30:23'),
(573, 20, 10, 48, 1, NULL, '2023-01-21 13:30:23', '2023-01-21 13:30:23'),
(574, 20, 10, 49, 1, NULL, '2023-01-21 13:30:23', '2023-01-21 13:30:23'),
(575, 20, 10, 50, 1, NULL, '2023-01-21 13:30:23', '2023-01-21 13:30:23'),
(576, 21, 6, 26, 6, NULL, '2023-01-21 13:30:57', '2023-01-21 13:30:57'),
(577, 21, 6, 27, 1, NULL, '2023-01-21 13:30:57', '2023-01-21 13:30:57'),
(578, 21, 6, 28, 6, NULL, '2023-01-21 13:30:57', '2023-01-21 13:30:57'),
(579, 21, 6, 29, 1, NULL, '2023-01-21 13:30:57', '2023-01-21 13:30:57'),
(580, 21, 6, 30, 6, NULL, '2023-01-21 13:30:57', '2023-01-21 13:30:57'),
(581, 21, 7, 31, 0, NULL, '2023-01-21 13:30:57', '2023-01-21 13:30:57'),
(582, 21, 7, 32, 1, NULL, '2023-01-21 13:30:57', '2023-01-21 13:30:57'),
(583, 21, 7, 33, 1, NULL, '2023-01-21 13:30:57', '2023-01-21 13:30:57'),
(584, 21, 7, 34, 6, NULL, '2023-01-21 13:30:57', '2023-01-21 13:30:57'),
(585, 21, 7, 35, 6, NULL, '2023-01-21 13:30:57', '2023-01-21 13:30:57'),
(586, 21, 8, 36, 6, NULL, '2023-01-21 13:30:57', '2023-01-21 13:30:57'),
(587, 21, 8, 37, 1, NULL, '2023-01-21 13:30:57', '2023-01-21 13:30:57'),
(588, 21, 8, 38, 0, NULL, '2023-01-21 13:30:57', '2023-01-21 13:30:57'),
(589, 21, 8, 39, 1, NULL, '2023-01-21 13:30:57', '2023-01-21 13:30:57'),
(590, 21, 8, 40, 1, NULL, '2023-01-21 13:30:57', '2023-01-21 13:30:57'),
(591, 21, 9, 41, 1, NULL, '2023-01-21 13:30:57', '2023-01-21 13:30:57'),
(592, 21, 9, 42, 6, NULL, '2023-01-21 13:30:57', '2023-01-21 13:30:57'),
(593, 21, 9, 43, 0, NULL, '2023-01-21 13:30:57', '2023-01-21 13:30:57'),
(594, 21, 9, 44, 6, NULL, '2023-01-21 13:30:57', '2023-01-21 13:30:57'),
(595, 21, 9, 45, 1, NULL, '2023-01-21 13:30:57', '2023-01-21 13:30:57'),
(596, 21, 10, 46, 0, NULL, '2023-01-21 13:30:57', '2023-01-21 13:30:57'),
(597, 21, 10, 47, 0, NULL, '2023-01-21 13:30:57', '2023-01-21 13:30:57'),
(598, 21, 10, 48, 0, NULL, '2023-01-21 13:30:57', '2023-01-21 13:30:57'),
(599, 21, 10, 49, 1, NULL, '2023-01-21 13:30:57', '2023-01-21 13:30:57'),
(600, 21, 10, 50, 6, NULL, '2023-01-21 13:30:57', '2023-01-21 13:30:57'),
(601, 22, 11, 51, 6, NULL, '2023-01-21 13:32:36', '2023-01-21 13:32:36'),
(602, 22, 11, 52, 1, NULL, '2023-01-21 13:32:36', '2023-01-21 13:32:36'),
(603, 22, 11, 53, 6, NULL, '2023-01-21 13:32:36', '2023-01-21 13:32:36'),
(604, 22, 11, 54, 0, NULL, '2023-01-21 13:32:36', '2023-01-21 13:32:36'),
(605, 22, 11, 55, 6, NULL, '2023-01-21 13:32:36', '2023-01-21 13:32:36'),
(606, 22, 12, 56, 1, NULL, '2023-01-21 13:32:36', '2023-01-21 13:32:36'),
(607, 22, 12, 57, 6, NULL, '2023-01-21 13:32:36', '2023-01-21 13:32:36'),
(608, 22, 12, 58, 0, NULL, '2023-01-21 13:32:36', '2023-01-21 13:32:36'),
(609, 22, 12, 59, 1, NULL, '2023-01-21 13:32:36', '2023-01-21 13:32:36'),
(610, 22, 12, 60, 1, NULL, '2023-01-21 13:32:36', '2023-01-21 13:32:36'),
(611, 22, 13, 61, 6, NULL, '2023-01-21 13:32:36', '2023-01-21 13:32:36'),
(612, 22, 13, 62, 0, NULL, '2023-01-21 13:32:36', '2023-01-21 13:32:36'),
(613, 22, 13, 63, 6, NULL, '2023-01-21 13:32:36', '2023-01-21 13:32:36'),
(614, 22, 13, 64, 6, NULL, '2023-01-21 13:32:36', '2023-01-21 13:32:36'),
(615, 22, 13, 65, 0, NULL, '2023-01-21 13:32:36', '2023-01-21 13:32:36'),
(616, 22, 14, 66, 1, NULL, '2023-01-21 13:32:36', '2023-01-21 13:32:36'),
(617, 22, 14, 67, 1, NULL, '2023-01-21 13:32:36', '2023-01-21 13:32:36'),
(618, 22, 14, 68, 1, NULL, '2023-01-21 13:32:36', '2023-01-21 13:32:36'),
(619, 22, 14, 69, 0, NULL, '2023-01-21 13:32:36', '2023-01-21 13:32:36'),
(620, 22, 14, 70, 6, NULL, '2023-01-21 13:32:36', '2023-01-21 13:32:36'),
(621, 22, 15, 71, 0, NULL, '2023-01-21 13:32:36', '2023-01-21 13:32:36'),
(622, 22, 15, 72, 6, NULL, '2023-01-21 13:32:36', '2023-01-21 13:32:36'),
(623, 22, 15, 73, 1, NULL, '2023-01-21 13:32:36', '2023-01-21 13:32:36'),
(624, 22, 15, 74, 0, NULL, '2023-01-21 13:32:36', '2023-01-21 13:32:36'),
(625, 22, 15, 75, 0, NULL, '2023-01-21 13:32:36', '2023-01-21 13:32:36'),
(626, 23, 11, 51, 1, NULL, '2023-01-21 13:33:06', '2023-01-21 13:33:06'),
(627, 23, 11, 52, 1, NULL, '2023-01-21 13:33:06', '2023-01-21 13:33:06'),
(628, 23, 11, 53, 1, NULL, '2023-01-21 13:33:06', '2023-01-21 13:33:06'),
(629, 23, 11, 54, 6, NULL, '2023-01-21 13:33:06', '2023-01-21 13:33:06'),
(630, 23, 11, 55, 6, NULL, '2023-01-21 13:33:06', '2023-01-21 13:33:06'),
(631, 23, 12, 56, 6, NULL, '2023-01-21 13:33:06', '2023-01-21 13:33:06'),
(632, 23, 12, 57, 0, NULL, '2023-01-21 13:33:06', '2023-01-21 13:33:06'),
(633, 23, 12, 58, 6, NULL, '2023-01-21 13:33:06', '2023-01-21 13:33:06'),
(634, 23, 12, 59, 0, NULL, '2023-01-21 13:33:06', '2023-01-21 13:33:06'),
(635, 23, 12, 60, 6, NULL, '2023-01-21 13:33:06', '2023-01-21 13:33:06'),
(636, 23, 13, 61, 1, NULL, '2023-01-21 13:33:06', '2023-01-21 13:33:06'),
(637, 23, 13, 62, 6, NULL, '2023-01-21 13:33:06', '2023-01-21 13:33:06'),
(638, 23, 13, 63, 6, NULL, '2023-01-21 13:33:06', '2023-01-21 13:33:06'),
(639, 23, 13, 64, 6, NULL, '2023-01-21 13:33:06', '2023-01-21 13:33:06'),
(640, 23, 13, 65, 6, NULL, '2023-01-21 13:33:06', '2023-01-21 13:33:06'),
(641, 23, 14, 66, 6, NULL, '2023-01-21 13:33:06', '2023-01-21 13:33:06'),
(642, 23, 14, 67, 6, NULL, '2023-01-21 13:33:06', '2023-01-21 13:33:06'),
(643, 23, 14, 68, 6, NULL, '2023-01-21 13:33:06', '2023-01-21 13:33:06'),
(644, 23, 14, 69, 0, NULL, '2023-01-21 13:33:06', '2023-01-21 13:33:06'),
(645, 23, 14, 70, 6, NULL, '2023-01-21 13:33:06', '2023-01-21 13:33:06'),
(646, 23, 15, 71, 1, NULL, '2023-01-21 13:33:06', '2023-01-21 13:33:06'),
(647, 23, 15, 72, 6, NULL, '2023-01-21 13:33:06', '2023-01-21 13:33:06'),
(648, 23, 15, 73, 1, NULL, '2023-01-21 13:33:06', '2023-01-21 13:33:06'),
(649, 23, 15, 74, 0, NULL, '2023-01-21 13:33:06', '2023-01-21 13:33:06'),
(650, 23, 15, 75, 6, NULL, '2023-01-21 13:33:06', '2023-01-21 13:33:06'),
(651, 24, 11, 51, 6, NULL, '2023-01-21 13:33:43', '2023-01-21 13:33:43'),
(652, 24, 11, 52, 6, NULL, '2023-01-21 13:33:43', '2023-01-21 13:33:43'),
(653, 24, 11, 53, 1, NULL, '2023-01-21 13:33:43', '2023-01-21 13:33:43'),
(654, 24, 11, 54, 6, NULL, '2023-01-21 13:33:43', '2023-01-21 13:33:43'),
(655, 24, 11, 55, 0, NULL, '2023-01-21 13:33:43', '2023-01-21 13:33:43'),
(656, 24, 12, 56, 6, NULL, '2023-01-21 13:33:43', '2023-01-21 13:33:43'),
(657, 24, 12, 57, 1, NULL, '2023-01-21 13:33:43', '2023-01-21 13:33:43'),
(658, 24, 12, 58, 6, NULL, '2023-01-21 13:33:43', '2023-01-21 13:33:43'),
(659, 24, 12, 59, 0, NULL, '2023-01-21 13:33:43', '2023-01-21 13:33:43'),
(660, 24, 12, 60, 1, NULL, '2023-01-21 13:33:43', '2023-01-21 13:33:43'),
(661, 24, 13, 61, 6, NULL, '2023-01-21 13:33:43', '2023-01-21 13:33:43'),
(662, 24, 13, 62, 1, NULL, '2023-01-21 13:33:43', '2023-01-21 13:33:43'),
(663, 24, 13, 63, 1, NULL, '2023-01-21 13:33:43', '2023-01-21 13:33:43'),
(664, 24, 13, 64, 1, NULL, '2023-01-21 13:33:43', '2023-01-21 13:33:43'),
(665, 24, 13, 65, 0, NULL, '2023-01-21 13:33:43', '2023-01-21 13:33:43'),
(666, 24, 14, 66, 0, NULL, '2023-01-21 13:33:43', '2023-01-21 13:33:43'),
(667, 24, 14, 67, 6, NULL, '2023-01-21 13:33:43', '2023-01-21 13:33:43'),
(668, 24, 14, 68, 1, NULL, '2023-01-21 13:33:43', '2023-01-21 13:33:43'),
(669, 24, 14, 69, 0, NULL, '2023-01-21 13:33:43', '2023-01-21 13:33:43'),
(670, 24, 14, 70, 0, NULL, '2023-01-21 13:33:43', '2023-01-21 13:33:43'),
(671, 24, 15, 71, 6, NULL, '2023-01-21 13:33:43', '2023-01-21 13:33:43'),
(672, 24, 15, 72, 1, NULL, '2023-01-21 13:33:43', '2023-01-21 13:33:43'),
(673, 24, 15, 73, 1, NULL, '2023-01-21 13:33:43', '2023-01-21 13:33:43'),
(674, 24, 15, 74, 6, NULL, '2023-01-21 13:33:43', '2023-01-21 13:33:43'),
(675, 24, 15, 75, 0, NULL, '2023-01-21 13:33:43', '2023-01-21 13:33:43'),
(676, 25, 11, 51, 0, NULL, '2023-01-21 13:34:14', '2023-01-21 13:34:14'),
(677, 25, 11, 52, 6, NULL, '2023-01-21 13:34:14', '2023-01-21 13:34:14'),
(678, 25, 11, 53, 0, NULL, '2023-01-21 13:34:14', '2023-01-21 13:34:14'),
(679, 25, 11, 54, 6, NULL, '2023-01-21 13:34:14', '2023-01-21 13:34:14'),
(680, 25, 11, 55, 0, NULL, '2023-01-21 13:34:14', '2023-01-21 13:34:14'),
(681, 25, 12, 56, 6, NULL, '2023-01-21 13:34:14', '2023-01-21 13:34:14'),
(682, 25, 12, 57, 6, NULL, '2023-01-21 13:34:14', '2023-01-21 13:34:14'),
(683, 25, 12, 58, 0, NULL, '2023-01-21 13:34:14', '2023-01-21 13:34:14'),
(684, 25, 12, 59, 0, NULL, '2023-01-21 13:34:14', '2023-01-21 13:34:14'),
(685, 25, 12, 60, 6, NULL, '2023-01-21 13:34:14', '2023-01-21 13:34:14'),
(686, 25, 13, 61, 6, NULL, '2023-01-21 13:34:14', '2023-01-21 13:34:14'),
(687, 25, 13, 62, 0, NULL, '2023-01-21 13:34:14', '2023-01-21 13:34:14'),
(688, 25, 13, 63, 6, NULL, '2023-01-21 13:34:14', '2023-01-21 13:34:14'),
(689, 25, 13, 64, 6, NULL, '2023-01-21 13:34:14', '2023-01-21 13:34:14'),
(690, 25, 13, 65, 6, NULL, '2023-01-21 13:34:14', '2023-01-21 13:34:14'),
(691, 25, 14, 66, 1, NULL, '2023-01-21 13:34:14', '2023-01-21 13:34:14'),
(692, 25, 14, 67, 6, NULL, '2023-01-21 13:34:14', '2023-01-21 13:34:14'),
(693, 25, 14, 68, 0, NULL, '2023-01-21 13:34:14', '2023-01-21 13:34:14'),
(694, 25, 14, 69, 6, NULL, '2023-01-21 13:34:14', '2023-01-21 13:34:14'),
(695, 25, 14, 70, 6, NULL, '2023-01-21 13:34:14', '2023-01-21 13:34:14'),
(696, 25, 15, 71, 6, NULL, '2023-01-21 13:34:14', '2023-01-21 13:34:14'),
(697, 25, 15, 72, 0, NULL, '2023-01-21 13:34:14', '2023-01-21 13:34:14'),
(698, 25, 15, 73, 1, NULL, '2023-01-21 13:34:14', '2023-01-21 13:34:14'),
(699, 25, 15, 74, 1, NULL, '2023-01-21 13:34:14', '2023-01-21 13:34:14'),
(700, 25, 15, 75, 1, NULL, '2023-01-21 13:34:14', '2023-01-21 13:34:14'),
(701, 26, 16, 76, 0, NULL, '2023-01-21 13:34:44', '2023-01-21 13:34:44'),
(702, 26, 16, 77, 1, NULL, '2023-01-21 13:34:44', '2023-01-21 13:34:44');
INSERT INTO `voice_audit_points` (`id`, `voice_audit_id`, `datapoint_category_id`, `datapoint_id`, `answer`, `deleted_at`, `created_at`, `updated_at`) VALUES
(703, 26, 16, 78, 0, NULL, '2023-01-21 13:34:44', '2023-01-21 13:34:44'),
(704, 26, 16, 79, 6, NULL, '2023-01-21 13:34:44', '2023-01-21 13:34:44'),
(705, 26, 16, 80, 1, NULL, '2023-01-21 13:34:44', '2023-01-21 13:34:44'),
(706, 26, 17, 81, 6, NULL, '2023-01-21 13:34:44', '2023-01-21 13:34:44'),
(707, 26, 17, 82, 0, NULL, '2023-01-21 13:34:44', '2023-01-21 13:34:44'),
(708, 26, 17, 83, 0, NULL, '2023-01-21 13:34:44', '2023-01-21 13:34:44'),
(709, 26, 17, 84, 6, NULL, '2023-01-21 13:34:44', '2023-01-21 13:34:44'),
(710, 26, 17, 85, 0, NULL, '2023-01-21 13:34:44', '2023-01-21 13:34:44'),
(711, 26, 18, 86, 0, NULL, '2023-01-21 13:34:44', '2023-01-21 13:34:44'),
(712, 26, 18, 87, 1, NULL, '2023-01-21 13:34:44', '2023-01-21 13:34:44'),
(713, 26, 18, 88, 6, NULL, '2023-01-21 13:34:44', '2023-01-21 13:34:44'),
(714, 26, 18, 89, 0, NULL, '2023-01-21 13:34:44', '2023-01-21 13:34:44'),
(715, 26, 18, 90, 6, NULL, '2023-01-21 13:34:44', '2023-01-21 13:34:44'),
(716, 26, 19, 91, 0, NULL, '2023-01-21 13:34:44', '2023-01-21 13:34:44'),
(717, 26, 19, 92, 0, NULL, '2023-01-21 13:34:44', '2023-01-21 13:34:44'),
(718, 26, 19, 93, 6, NULL, '2023-01-21 13:34:44', '2023-01-21 13:34:44'),
(719, 26, 19, 94, 6, NULL, '2023-01-21 13:34:44', '2023-01-21 13:34:44'),
(720, 26, 19, 95, 6, NULL, '2023-01-21 13:34:44', '2023-01-21 13:34:44'),
(721, 26, 20, 96, 1, NULL, '2023-01-21 13:34:44', '2023-01-21 13:34:44'),
(722, 26, 20, 97, 0, NULL, '2023-01-21 13:34:44', '2023-01-21 13:34:44'),
(723, 26, 20, 98, 0, NULL, '2023-01-21 13:34:44', '2023-01-21 13:34:44'),
(724, 26, 20, 99, 0, NULL, '2023-01-21 13:34:44', '2023-01-21 13:34:44'),
(725, 26, 20, 100, 1, NULL, '2023-01-21 13:34:44', '2023-01-21 13:34:44'),
(726, 27, 16, 76, 1, NULL, '2023-01-21 13:35:12', '2023-01-21 13:35:12'),
(727, 27, 16, 77, 1, NULL, '2023-01-21 13:35:12', '2023-01-21 13:35:12'),
(728, 27, 16, 78, 0, NULL, '2023-01-21 13:35:12', '2023-01-21 13:35:12'),
(729, 27, 16, 79, 6, NULL, '2023-01-21 13:35:12', '2023-01-21 13:35:12'),
(730, 27, 16, 80, 6, NULL, '2023-01-21 13:35:12', '2023-01-21 13:35:12'),
(731, 27, 17, 81, 0, NULL, '2023-01-21 13:35:12', '2023-01-21 13:35:12'),
(732, 27, 17, 82, 1, NULL, '2023-01-21 13:35:12', '2023-01-21 13:35:12'),
(733, 27, 17, 83, 0, NULL, '2023-01-21 13:35:12', '2023-01-21 13:35:12'),
(734, 27, 17, 84, 0, NULL, '2023-01-21 13:35:12', '2023-01-21 13:35:12'),
(735, 27, 17, 85, 6, NULL, '2023-01-21 13:35:12', '2023-01-21 13:35:12'),
(736, 27, 18, 86, 1, NULL, '2023-01-21 13:35:12', '2023-01-21 13:35:12'),
(737, 27, 18, 87, 1, NULL, '2023-01-21 13:35:12', '2023-01-21 13:35:12'),
(738, 27, 18, 88, 6, NULL, '2023-01-21 13:35:12', '2023-01-21 13:35:12'),
(739, 27, 18, 89, 0, NULL, '2023-01-21 13:35:12', '2023-01-21 13:35:12'),
(740, 27, 18, 90, 0, NULL, '2023-01-21 13:35:12', '2023-01-21 13:35:12'),
(741, 27, 19, 91, 1, NULL, '2023-01-21 13:35:12', '2023-01-21 13:35:12'),
(742, 27, 19, 92, 1, NULL, '2023-01-21 13:35:12', '2023-01-21 13:35:12'),
(743, 27, 19, 93, 1, NULL, '2023-01-21 13:35:12', '2023-01-21 13:35:12'),
(744, 27, 19, 94, 0, NULL, '2023-01-21 13:35:12', '2023-01-21 13:35:12'),
(745, 27, 19, 95, 6, NULL, '2023-01-21 13:35:12', '2023-01-21 13:35:12'),
(746, 27, 20, 96, 1, NULL, '2023-01-21 13:35:12', '2023-01-21 13:35:12'),
(747, 27, 20, 97, 6, NULL, '2023-01-21 13:35:12', '2023-01-21 13:35:12'),
(748, 27, 20, 98, 0, NULL, '2023-01-21 13:35:12', '2023-01-21 13:35:12'),
(749, 27, 20, 99, 1, NULL, '2023-01-21 13:35:12', '2023-01-21 13:35:12'),
(750, 27, 20, 100, 6, NULL, '2023-01-21 13:35:12', '2023-01-21 13:35:12'),
(751, 28, 16, 76, 6, NULL, '2023-01-21 13:35:49', '2023-01-21 13:35:49'),
(752, 28, 16, 77, 6, NULL, '2023-01-21 13:35:49', '2023-01-21 13:35:49'),
(753, 28, 16, 78, 6, NULL, '2023-01-21 13:35:49', '2023-01-21 13:35:49'),
(754, 28, 16, 79, 6, NULL, '2023-01-21 13:35:49', '2023-01-21 13:35:49'),
(755, 28, 16, 80, 6, NULL, '2023-01-21 13:35:49', '2023-01-21 13:35:49'),
(756, 28, 17, 81, 6, NULL, '2023-01-21 13:35:49', '2023-01-21 13:35:49'),
(757, 28, 17, 82, 6, NULL, '2023-01-21 13:35:49', '2023-01-21 13:35:49'),
(758, 28, 17, 83, 6, NULL, '2023-01-21 13:35:49', '2023-01-21 13:35:49'),
(759, 28, 17, 84, 6, NULL, '2023-01-21 13:35:49', '2023-01-21 13:35:49'),
(760, 28, 17, 85, 6, NULL, '2023-01-21 13:35:49', '2023-01-21 13:35:49'),
(761, 28, 18, 86, 6, NULL, '2023-01-21 13:35:49', '2023-01-21 13:35:49'),
(762, 28, 18, 87, 6, NULL, '2023-01-21 13:35:49', '2023-01-21 13:35:49'),
(763, 28, 18, 88, 6, NULL, '2023-01-21 13:35:49', '2023-01-21 13:35:49'),
(764, 28, 18, 89, 6, NULL, '2023-01-21 13:35:49', '2023-01-21 13:35:49'),
(765, 28, 18, 90, 6, NULL, '2023-01-21 13:35:49', '2023-01-21 13:35:49'),
(766, 28, 19, 91, 6, NULL, '2023-01-21 13:35:49', '2023-01-21 13:35:49'),
(767, 28, 19, 92, 6, NULL, '2023-01-21 13:35:49', '2023-01-21 13:35:49'),
(768, 28, 19, 93, 6, NULL, '2023-01-21 13:35:49', '2023-01-21 13:35:49'),
(769, 28, 19, 94, 6, NULL, '2023-01-21 13:35:49', '2023-01-21 13:35:49'),
(770, 28, 19, 95, 6, NULL, '2023-01-21 13:35:49', '2023-01-21 13:35:49'),
(771, 28, 20, 96, 6, NULL, '2023-01-21 13:35:49', '2023-01-21 13:35:49'),
(772, 28, 20, 97, 6, NULL, '2023-01-21 13:35:49', '2023-01-21 13:35:49'),
(773, 28, 20, 98, 6, NULL, '2023-01-21 13:35:49', '2023-01-21 13:35:49'),
(774, 28, 20, 99, 6, NULL, '2023-01-21 13:35:49', '2023-01-21 13:35:49'),
(775, 28, 20, 100, 6, NULL, '2023-01-21 13:35:49', '2023-01-21 13:35:49');

-- --------------------------------------------------------

--
-- Table structure for table `voice_custom_fields`
--

CREATE TABLE `voice_custom_fields` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `voice_evaluation_id` int(11) NOT NULL,
  `campaign_id` int(10) UNSIGNED DEFAULT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `placeholder` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('text','dropdown','textarea') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text',
  `status` enum('active','disabled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `position` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'top',
  `options` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `required` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `voice_evaluations`
--

CREATE TABLE `voice_evaluations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','disabled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `added_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `voice_evaluations`
--

INSERT INTO `voice_evaluations` (`id`, `name`, `status`, `added_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'General Audit', 'active', NULL, NULL, '2022-06-08 06:48:58', '2022-06-08 06:48:58'),
(2, 'PCI Evaluations', 'active', 1, NULL, '2023-01-11 06:40:05', '2023-01-11 06:40:05');

-- --------------------------------------------------------

--
-- Table structure for table `voice_evaluation_actions`
--

CREATE TABLE `voice_evaluation_actions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','disabled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `sort` int(11) NOT NULL DEFAULT 1,
  `added_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `voice_evaluation_actions`
--

INSERT INTO `voice_evaluation_actions` (`id`, `name`, `status`, `sort`, `added_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Written Communication', 'active', 1, NULL, NULL, '2022-06-08 06:49:50', '2022-06-08 06:49:50'),
(2, 'Taken off Calls/ TL Training', 'active', 1, NULL, NULL, '2022-06-08 06:49:50', '2022-06-08 06:49:50'),
(3, 'Warning letter 1', 'active', 1, NULL, NULL, '2022-06-08 06:49:50', '2022-06-08 06:49:50'),
(4, 'Warning letter 2', 'active', 1, NULL, NULL, '2022-06-08 06:49:50', '2022-06-08 06:49:50'),
(5, 'Warning letter 3', 'active', 1, NULL, NULL, '2022-06-08 06:49:50', '2022-06-08 06:49:50'),
(6, 'Sent To Training', 'active', 1, NULL, NULL, '2022-06-08 06:49:50', '2022-06-08 06:49:50');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `campaigns`
--
ALTER TABLE `campaigns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `campaign_datapoint_category`
--
ALTER TABLE `campaign_datapoint_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `campaign_voice_custom_field`
--
ALTER TABLE `campaign_voice_custom_field`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `datapoints`
--
ALTER TABLE `datapoints`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `datapoint_categories`
--
ALTER TABLE `datapoint_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `designations`
--
ALTER TABLE `designations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `solar_lt_categories`
--
ALTER TABLE `solar_lt_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `solar_lt_datapoints`
--
ALTER TABLE `solar_lt_datapoints`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `solar_lt_evaluations`
--
ALTER TABLE `solar_lt_evaluations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `solar_lt_evaluation_responses`
--
ALTER TABLE `solar_lt_evaluation_responses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `hrms_id` (`hrms_id`);

--
-- Indexes for table `voice_audits`
--
ALTER TABLE `voice_audits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `voice_audit_actions`
--
ALTER TABLE `voice_audit_actions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `voice_audit_appeals`
--
ALTER TABLE `voice_audit_appeals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `voice_audit_custom_fields`
--
ALTER TABLE `voice_audit_custom_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `voice_audit_points`
--
ALTER TABLE `voice_audit_points`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `voice_custom_fields`
--
ALTER TABLE `voice_custom_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `voice_evaluations`
--
ALTER TABLE `voice_evaluations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `voice_evaluation_actions`
--
ALTER TABLE `voice_evaluation_actions`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `campaigns`
--
ALTER TABLE `campaigns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `campaign_datapoint_category`
--
ALTER TABLE `campaign_datapoint_category`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `campaign_voice_custom_field`
--
ALTER TABLE `campaign_voice_custom_field`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `datapoints`
--
ALTER TABLE `datapoints`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `datapoint_categories`
--
ALTER TABLE `datapoint_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `designations`
--
ALTER TABLE `designations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `solar_lt_categories`
--
ALTER TABLE `solar_lt_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `solar_lt_datapoints`
--
ALTER TABLE `solar_lt_datapoints`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `solar_lt_evaluations`
--
ALTER TABLE `solar_lt_evaluations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `solar_lt_evaluation_responses`
--
ALTER TABLE `solar_lt_evaluation_responses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=144;

--
-- AUTO_INCREMENT for table `voice_audits`
--
ALTER TABLE `voice_audits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `voice_audit_actions`
--
ALTER TABLE `voice_audit_actions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `voice_audit_appeals`
--
ALTER TABLE `voice_audit_appeals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `voice_audit_custom_fields`
--
ALTER TABLE `voice_audit_custom_fields`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `voice_audit_points`
--
ALTER TABLE `voice_audit_points`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=776;

--
-- AUTO_INCREMENT for table `voice_custom_fields`
--
ALTER TABLE `voice_custom_fields`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `voice_evaluations`
--
ALTER TABLE `voice_evaluations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `voice_evaluation_actions`
--
ALTER TABLE `voice_evaluation_actions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
