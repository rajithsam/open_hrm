-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 14, 2017 at 04:35 PM
-- Server version: 5.7.18-0ubuntu0.16.04.1
-- PHP Version: 7.0.18-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `open_hrm`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendances`
--

CREATE TABLE `attendances` (
  `id` int(11) NOT NULL,
  `employee_id` int(10) UNSIGNED NOT NULL,
  `work_shift_id` int(10) UNSIGNED NOT NULL,
  `in_time` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `out_time` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_time` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `end_time` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `start_after` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `end_before` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `working_time` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` date NOT NULL,
  `leave_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `attendances`
--

INSERT INTO `attendances` (`id`, `employee_id`, `work_shift_id`, `in_time`, `out_time`, `start_time`, `end_time`, `start_after`, `end_before`, `working_time`, `date`, `leave_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '12600000', '45000000', '10:00', '06:00', '03:30:00', '12:30:00', '09:00', '2017-07-11', 0, '2017-07-14 10:22:06', '2017-07-14 05:01:01');

-- --------------------------------------------------------

--
-- Table structure for table `candidates`
--

CREATE TABLE `candidates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `keyword` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `application_source` enum('NEWS','ONLINE','PERSON','OTHERS') COLLATE utf8_unicode_ci NOT NULL,
  `referer_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vacancy_id` int(10) UNSIGNED NOT NULL,
  `application_dt` date NOT NULL,
  `status` enum('Applied','Shortlist','Schedule Interview','Mark Passed','Mark Failed','Hired','Rejected') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `candidate_vacancies`
--

CREATE TABLE `candidate_vacancies` (
  `candidate_id` int(10) UNSIGNED NOT NULL,
  `vacancy_id` int(10) UNSIGNED NOT NULL,
  `status` enum('Applied','Shortlist','Schedule Interview','Mark Passed','Mark Failed','Hired','Rejected') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `parent_department` int(10) UNSIGNED NOT NULL,
  `department_order` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `parent_department`, `department_order`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Development', 0, 0, '2017-07-14 03:49:45', '2017-07-14 03:49:45', NULL),
(2, 'Design', 0, 0, '2017-07-14 03:49:50', '2017-07-14 03:49:50', NULL),
(3, 'Marketing', 0, 0, '2017-07-14 03:49:57', '2017-07-14 03:49:57', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `designations`
--

CREATE TABLE `designations` (
  `id` int(10) UNSIGNED NOT NULL,
  `department_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `order` int(10) UNSIGNED NOT NULL,
  `quota` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `designations`
--

INSERT INTO `designations` (`id`, `department_id`, `title`, `description`, `order`, `quota`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Manager', 'manager', 0, 2, '2017-07-14 03:50:23', '2017-07-14 03:51:27', NULL),
(2, 1, 'Junior Programmer', 'Junior', 0, 0, '2017-07-14 03:50:43', '2017-07-14 03:50:43', NULL),
(3, 1, 'Senior Progrmmer', 'senior programmer', 0, 0, '2017-07-14 03:51:15', '2017-07-14 03:51:15', NULL),
(4, 2, 'Senior Designer', 'Senior Designer', 0, 3, '2017-07-14 03:52:51', '2017-07-14 03:52:51', NULL),
(5, 2, 'Junior Designer', 'Junior Designer', 0, 0, '2017-07-14 03:53:11', '2017-07-14 03:53:11', NULL),
(6, 3, 'lead', 'lead', 0, 0, '2017-07-14 03:53:23', '2017-07-14 03:53:23', NULL),
(7, 3, 'Executive', 'Executive', 0, 0, '2017-07-14 03:53:34', '2017-07-14 03:53:34', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(10) UNSIGNED NOT NULL,
  `employee_id` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `present_address` text COLLATE utf8_unicode_ci,
  `permanent_address` text COLLATE utf8_unicode_ci,
  `phone` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `photo` text COLLATE utf8_unicode_ci,
  `source` enum('NEWS','ONLINE','PERSON','OTHERS') COLLATE utf8_unicode_ci NOT NULL,
  `source_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `is_employee_working` tinyint(1) NOT NULL DEFAULT '0',
  `probationary` tinyint(1) NOT NULL DEFAULT '0',
  `current_work_shift_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `employee_id`, `name`, `present_address`, `permanent_address`, `phone`, `email`, `photo`, `source`, `source_name`, `is_employee_working`, `probationary`, `current_work_shift_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'UU101', 'Manny', 'Main Road', 'Main Road', '231231', 'rms@mms.com', '1500027348_water_splash_windshield-1366x768.jpg', 'NEWS', 'SunTV', 1, 0, NULL, '2017-07-14 02:03:41', '2017-07-14 04:45:48', NULL),
(2, 'E102', 'Rohit', 'Main Road', 'Shnoy Nagar', '13123', 'rohit@rms.com', NULL, 'PERSON', 'Friend', 1, 0, NULL, '2017-07-14 04:04:33', '2017-07-14 04:46:32', NULL),
(3, 'UI03', 'Godzilla', 'Forest', 'Deep Forest', '123123', 'goddy@rms.com', NULL, 'ONLINE', 'FB', 1, 0, NULL, '2017-07-14 04:05:48', '2017-07-14 04:39:50', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employee_educations`
--

CREATE TABLE `employee_educations` (
  `employee_id` int(10) UNSIGNED NOT NULL,
  `degree_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `institution_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `pass_year` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `grade` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `certificate_copy` text COLLATE utf8_unicode_ci,
  `id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `employee_educations`
--

INSERT INTO `employee_educations` (`employee_id`, `degree_name`, `institution_name`, `pass_year`, `grade`, `certificate_copy`, `id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3, 'MBA', 'Oxford University', '2012', 'I', NULL, 1, '2017-07-14 10:33:24', '2017-07-14 10:33:24', NULL),
(3, 'BBA', 'Stanford University', '2010', 'I', NULL, 2, '2017-07-14 10:33:24', '2017-07-14 10:33:24', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employee_performance`
--

CREATE TABLE `employee_performance` (
  `id` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `feedback_by` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `employee_skills`
--

CREATE TABLE `employee_skills` (
  `id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `employee_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `institution_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `duration` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `certificate_copy` text COLLATE utf8_unicode_ci,
  `remarks` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_workshifts`
--

CREATE TABLE `employee_workshifts` (
  `employee_id` int(10) UNSIGNED NOT NULL,
  `work_shift_id` int(10) UNSIGNED NOT NULL,
  `shift_date` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `employee_workshifts`
--

INSERT INTO `employee_workshifts` (`employee_id`, `work_shift_id`, `shift_date`, `id`, `created_at`, `update_at`) VALUES
(3, 1, '2017-07-12', 1, '2017-07-14 10:34:20', '2017-07-14 10:34:20'),
(1, 1, '2017-07-14', 2, '2017-07-14 10:34:20', '2017-07-14 10:34:20'),
(3, 1, '2017-07-15', 3, '2017-07-14 10:34:20', '2017-07-14 10:34:20'),
(3, 2, '2017-07-15', 4, '2017-07-14 10:34:20', '2017-07-14 10:34:20'),
(3, 2, '2017-07-15', 5, '2017-07-14 10:34:20', '2017-07-14 10:34:20'),
(1, 1, '2017-07-15', 6, '2017-07-14 10:34:20', '2017-07-14 10:34:20');

-- --------------------------------------------------------

--
-- Table structure for table `holidays`
--

CREATE TABLE `holidays` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `holiday_date` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `recurring` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `holidays`
--

INSERT INTO `holidays` (`id`, `name`, `holiday_date`, `recurring`, `created_at`, `updated_at`) VALUES
(1, 'Gandhi Jayanthi', '2017-10-02', 0, '2017-07-14 03:54:01', '2017-07-14 03:54:01'),
(2, 'New Year', '2017-01-01', 0, '2017-07-14 03:54:13', '2017-07-14 03:54:13'),
(3, 'Christmas Eve', '2017-12-25', 0, '2017-07-14 03:54:27', '2017-07-14 03:54:27');

-- --------------------------------------------------------

--
-- Table structure for table `hrm_org`
--

CREATE TABLE `hrm_org` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `fax` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `country` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `state` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `postcode` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hrm_org`
--

INSERT INTO `hrm_org` (`id`, `title`, `phone`, `fax`, `email`, `address`, `country`, `city`, `state`, `postcode`, `created_at`, `updated_at`) VALUES
(1, 'RMS', '12312312', '12123123', 'rms@rms.com', 'No1:Nungambakkam', 'India', 'Chennai', 'TamilNadu', '600064', '2017-07-14 01:30:47', '2017-07-14 01:30:47');

-- --------------------------------------------------------

--
-- Table structure for table `hrm_work_week`
--

CREATE TABLE `hrm_work_week` (
  `id` int(10) UNSIGNED NOT NULL,
  `day_name` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('Working Day','Not Working Day') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hrm_work_week`
--

INSERT INTO `hrm_work_week` (`id`, `day_name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Sunday', 'Not Working Day', '2017-07-14 03:55:07', '2017-07-14 03:55:07'),
(2, 'Monday', 'Working Day', '2017-07-14 03:55:07', '2017-07-14 03:55:07'),
(3, 'Tuesday', 'Working Day', '2017-07-14 03:55:07', '2017-07-14 03:55:07'),
(4, 'Wednessday', 'Working Day', '2017-07-14 03:55:07', '2017-07-14 03:55:07'),
(5, 'Thursday', 'Working Day', '2017-07-14 03:55:07', '2017-07-14 03:55:07'),
(6, 'Friday', 'Working Day', '2017-07-14 03:55:07', '2017-07-14 03:55:07'),
(7, 'Saturday', 'Working Day', '2017-07-14 03:55:07', '2017-07-14 03:55:07');

-- --------------------------------------------------------

--
-- Table structure for table `job_details`
--

CREATE TABLE `job_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `employee_id` int(10) UNSIGNED NOT NULL,
  `department_id` int(10) UNSIGNED NOT NULL,
  `designation_id` int(10) UNSIGNED NOT NULL,
  `job_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `payment_group` int(10) UNSIGNED NOT NULL,
  `basic_salary` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `job_start` date NOT NULL,
  `job_end` date NOT NULL,
  `verifier` tinyint(1) NOT NULL,
  `active_job` tinyint(1) NOT NULL DEFAULT '1',
  `leave_count` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `job_details`
--

INSERT INTO `job_details` (`id`, `employee_id`, `department_id`, `designation_id`, `job_type`, `payment_group`, `basic_salary`, `job_start`, `job_end`, `verifier`, `active_job`, `leave_count`, `created_at`, `updated_at`) VALUES
(1, 3, 1, 1, 'Full Time', 1, '25000', '2017-07-05', '0000-00-00', 1, 1, '10', '2017-07-14 04:39:50', '2017-07-14 04:39:50'),
(2, 1, 2, 4, 'Full Time', 1, '20000', '2017-07-12', '0000-00-00', 1, 1, '10', '2017-07-14 04:45:25', '2017-07-14 04:45:25'),
(3, 2, 3, 6, 'Full Time', 2, '23000', '2017-07-13', '0000-00-00', 0, 1, '5', '2017-07-14 04:46:32', '2017-07-14 04:46:32');

-- --------------------------------------------------------

--
-- Table structure for table `kpis`
--

CREATE TABLE `kpis` (
  `id` int(10) UNSIGNED NOT NULL,
  `question` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kpi_templates`
--

CREATE TABLE `kpi_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `kpi_template` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leaves`
--

CREATE TABLE `leaves` (
  `id` int(10) UNSIGNED NOT NULL,
  `department_id` int(10) UNSIGNED NOT NULL,
  `employee_id` int(10) UNSIGNED NOT NULL,
  `leave_verifier_id` int(10) UNSIGNED NOT NULL,
  `leave_type` enum('General','Sick') COLLATE utf8_unicode_ci NOT NULL,
  `leave_reason` text COLLATE utf8_unicode_ci NOT NULL,
  `start_dt` date NOT NULL,
  `end_dt` date NOT NULL,
  `leave_status` enum('Pending','Approved','Rejected') COLLATE utf8_unicode_ci NOT NULL,
  `leave_count` int(10) UNSIGNED NOT NULL,
  `extra_leave` tinyint(1) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `leaves`
--

INSERT INTO `leaves` (`id`, `department_id`, `employee_id`, `leave_verifier_id`, `leave_type`, `leave_reason`, `start_dt`, `end_dt`, `leave_status`, `leave_count`, `extra_leave`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 3, 'General', 'Fever', '2017-07-14', '2017-07-17', 'Pending', 3, 0, 1, '2017-07-14 04:54:24', '2017-07-14 04:54:24'),
(2, 2, 1, 1, 'General', 'Cold', '2017-07-10', '2017-07-15', 'Approved', 5, 0, 1, '2017-07-14 04:55:29', '2017-07-14 04:58:31');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_10_12_000000_create_users_table', 1),
('2014_10_12_100000_create_password_resets_table', 1),
('2015_05_19_104139_entrust_setup_tables', 1),
('2015_05_24_053032_employee_tables', 1),
('2015_05_24_064005_system_tables', 1),
('2015_06_10_072849_create_holidays_table', 1),
('2015_06_15_112347_create_vacancies_table', 1),
('2015_06_15_112355_create_candidates_table', 1),
('2015_06_16_092054_create_candidate_vacancies_table', 1),
('2015_06_18_105844_create_heads_table', 1),
('2015_06_18_105850_create_groups_table', 1),
('2015_06_24_093430_create_attendances_table', 1),
('2015_06_28_060100_create_leaves_table', 1),
('2015_07_05_042542_create_kpis_table', 1),
('2015_07_05_042548_create_kpi_templates_table', 1),
('2015_07_13_045259_create_options_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE `options` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`id`, `key`, `value`, `type`, `created_at`, `updated_at`) VALUES
(1, 'absent', '3', 'attendance', '2017-07-14 04:03:00', '2017-07-14 04:03:00'),
(2, 'late_in', '30', 'attendance', '2017-07-14 04:03:00', '2017-07-14 04:03:00'),
(3, 'deduct_sal', '1', 'leave', '2017-07-14 04:03:04', '2017-07-14 04:03:04');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_groups`
--

CREATE TABLE `payment_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `job_type` enum('Full Time','Part Time','Intern','Contactual') COLLATE utf8_unicode_ci NOT NULL,
  `template` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `payment_groups`
--

INSERT INTO `payment_groups` (`id`, `title`, `job_type`, `template`, `created_at`, `updated_at`) VALUES
(1, 'Basic Salary', 'Full Time', 'Basic Salary', '2017-07-12 18:30:00', '2017-07-18 18:30:00'),
(2, 'Probationary Period', 'Full Time', 'Probationary Period', '2017-07-17 18:30:00', '2017-07-04 18:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `payment_heads`
--

CREATE TABLE `payment_heads` (
  `id` int(10) UNSIGNED NOT NULL,
  `head_name` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `parent_head` int(10) UNSIGNED NOT NULL,
  `job_type` enum('Full Time','Part Time','Intern','Contactual') COLLATE utf8_unicode_ci NOT NULL,
  `head_type` enum('Income','Expense') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', 'Administrator', '2017-07-11 18:30:00', '2017-07-12 18:30:00'),
(2, 'ESS', 'ESS', 'Employee', '2017-07-11 18:30:00', '2017-07-12 18:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`user_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 2),
(5, 2);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `role_id` int(10) UNSIGNED NOT NULL,
  `employee_id` int(10) UNSIGNED DEFAULT NULL,
  `employement_status` tinyint(1) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `is_active`, `role_id`, `employee_id`, `employement_status`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Rajith Sam', 'rajithsam@rms.com', '$2y$10$DYVACvgC66awuxKIvRGo1Oqu7goXLzXIntrvNusTnD22ofHHgpagW', 1, 1, 1, 0, NULL, '2017-07-20 18:30:00', '2017-07-06 18:30:00', NULL),
(2, 'Sam', 'admin@rms.com', '$2y$10$DYVACvgC66awuxKIvRGo1Oqu7goXLzXIntrvNusTnD22ofHHgpagW', 1, 2, 1, 0, 'wKQPvCwxsY8XKTTjH9kN41sW4h6VDuAd4NXEK1pNkuLcYrMw4mRbLJ7dh2sQ', '2017-07-20 18:30:00', '2017-07-14 02:02:36', NULL),
(3, 'Manny', 'rms@mms.com', '$2y$10$MnjiF3mgJiawlgWqygcx.eDEEYG6u2zYLpvs/0E2Ufuo2C6KYbqKq', 1, 2, 1, 0, NULL, '2017-07-14 02:03:41', '2017-07-14 02:03:41', NULL),
(4, 'Rohit', 'rohit@rms.com', '$2y$10$NMwPEZE4waTaqN2KEDLRn.zQqQNzIF9f.oC4XxU4W/7nZZUOKdbC2', 1, 2, 2, 0, NULL, '2017-07-14 04:04:33', '2017-07-14 04:04:33', NULL),
(5, 'Godzilla', 'goddy@rms.com', '$2y$10$aQveRwtExZA.B2t6uGgfyegMrp1ToKKcpr3FHYoMx2t2SsHXnlhia', 1, 2, 3, 0, NULL, '2017-07-14 04:05:48', '2017-07-14 04:05:48', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vacancies`
--

CREATE TABLE `vacancies` (
  `id` int(10) UNSIGNED NOT NULL,
  `department_id` int(10) UNSIGNED NOT NULL,
  `designation_id` int(10) UNSIGNED NOT NULL,
  `vacancy_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `hiring_manager_id` int(10) UNSIGNED NOT NULL,
  `number_of_post` int(10) UNSIGNED NOT NULL,
  `publish_feed_web` tinyint(1) NOT NULL DEFAULT '0',
  `vacancy_description` text COLLATE utf8_unicode_ci NOT NULL,
  `vacancy_status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vacancies`
--

INSERT INTO `vacancies` (`id`, `department_id`, `designation_id`, `vacancy_name`, `hiring_manager_id`, `number_of_post`, `publish_feed_web`, `vacancy_description`, `vacancy_status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 2, 'Progemmaer', 3, 1, 1, 'Hello', 1, '2017-07-14 05:31:04', '2017-07-14 05:31:04', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `work_experiences`
--

CREATE TABLE `work_experiences` (
  `employee_id` int(10) UNSIGNED NOT NULL,
  `work_title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `org_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `year_exp` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `id` int(11) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `work_experiences`
--

INSERT INTO `work_experiences` (`employee_id`, `work_title`, `org_name`, `year_exp`, `deleted_at`, `id`, `updated_at`, `created_at`) VALUES
(3, 'HR Executive', 'Google', '1', NULL, 1, '2017-07-14 10:36:16', '2017-07-14 10:36:16'),
(1, 'Manager', 'Microsoft', '3', NULL, 2, '2017-07-14 05:06:36', '2017-07-14 05:06:36');

-- --------------------------------------------------------

--
-- Table structure for table `work_shifts`
--

CREATE TABLE `work_shifts` (
  `id` int(10) UNSIGNED NOT NULL,
  `shift_name` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `work_shifts`
--

INSERT INTO `work_shifts` (`id`, `shift_name`, `start_time`, `end_time`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'General Shift', '00:00:00', '00:00:00', '2017-07-14 03:55:30', '2017-07-14 03:56:13', NULL),
(2, 'Night Shift', '00:00:00', '00:00:00', '2017-07-14 03:56:02', '2017-07-14 03:56:02', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendances`
--
ALTER TABLE `attendances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attendances_employee_id_foreign` (`employee_id`),
  ADD KEY `attendances_work_shift_id_foreign` (`work_shift_id`);

--
-- Indexes for table `candidates`
--
ALTER TABLE `candidates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `candidates_email_unique` (`email`),
  ADD KEY `candidates_vacancy_id_index` (`vacancy_id`);

--
-- Indexes for table `candidate_vacancies`
--
ALTER TABLE `candidate_vacancies`
  ADD KEY `candidate_vacancies_vacancy_id_foreign` (`vacancy_id`),
  ADD KEY `candidate_vacancies_candidate_id_vacancy_id_index` (`candidate_id`,`vacancy_id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `departments_name_unique` (`name`);

--
-- Indexes for table `designations`
--
ALTER TABLE `designations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `designations_department_id_index` (`department_id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `employees_email_unique` (`email`);

--
-- Indexes for table `employee_educations`
--
ALTER TABLE `employee_educations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_educations_employee_id_index` (`employee_id`);

--
-- Indexes for table `employee_skills`
--
ALTER TABLE `employee_skills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_skills_employee_id_index` (`employee_id`);

--
-- Indexes for table `employee_workshifts`
--
ALTER TABLE `employee_workshifts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_workshifts_work_shift_id_foreign` (`work_shift_id`),
  ADD KEY `work_shift_id` (`employee_id`);

--
-- Indexes for table `holidays`
--
ALTER TABLE `holidays`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hrm_org`
--
ALTER TABLE `hrm_org`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hrm_work_week`
--
ALTER TABLE `hrm_work_week`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_details`
--
ALTER TABLE `job_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_details_employee_id_foreign` (`employee_id`),
  ADD KEY `job_details_department_id_foreign` (`department_id`),
  ADD KEY `job_details_designation_id_foreign` (`designation_id`);

--
-- Indexes for table `kpis`
--
ALTER TABLE `kpis`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kpi_templates`
--
ALTER TABLE `kpi_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leaves`
--
ALTER TABLE `leaves`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `payment_groups`
--
ALTER TABLE `payment_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_heads`
--
ALTER TABLE `payment_heads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_unique` (`name`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_role_id_foreign` (`role_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `role_user_role_id_foreign` (`role_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `vacancies`
--
ALTER TABLE `vacancies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vacancies_designation_id_foreign` (`designation_id`),
  ADD KEY `vacancies_hiring_manager_id_foreign` (`hiring_manager_id`),
  ADD KEY `vacancies_department_id_designation_id_hiring_manager_id_index` (`department_id`,`designation_id`,`hiring_manager_id`);

--
-- Indexes for table `work_experiences`
--
ALTER TABLE `work_experiences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `work_experiences_employee_id_index` (`employee_id`);

--
-- Indexes for table `work_shifts`
--
ALTER TABLE `work_shifts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `work_shifts_shift_name_unique` (`shift_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendances`
--
ALTER TABLE `attendances`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `candidates`
--
ALTER TABLE `candidates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `designations`
--
ALTER TABLE `designations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `employee_educations`
--
ALTER TABLE `employee_educations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `employee_skills`
--
ALTER TABLE `employee_skills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `employee_workshifts`
--
ALTER TABLE `employee_workshifts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `holidays`
--
ALTER TABLE `holidays`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `hrm_org`
--
ALTER TABLE `hrm_org`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `hrm_work_week`
--
ALTER TABLE `hrm_work_week`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `job_details`
--
ALTER TABLE `job_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `kpis`
--
ALTER TABLE `kpis`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `kpi_templates`
--
ALTER TABLE `kpi_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `leaves`
--
ALTER TABLE `leaves`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `payment_groups`
--
ALTER TABLE `payment_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `payment_heads`
--
ALTER TABLE `payment_heads`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `vacancies`
--
ALTER TABLE `vacancies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `work_experiences`
--
ALTER TABLE `work_experiences`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `work_shifts`
--
ALTER TABLE `work_shifts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendances`
--
ALTER TABLE `attendances`
  ADD CONSTRAINT `attendances_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `attendances_work_shift_id_foreign` FOREIGN KEY (`work_shift_id`) REFERENCES `work_shifts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `candidates`
--
ALTER TABLE `candidates`
  ADD CONSTRAINT `candidates_vacancy_id_foreign` FOREIGN KEY (`vacancy_id`) REFERENCES `vacancies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `candidate_vacancies`
--
ALTER TABLE `candidate_vacancies`
  ADD CONSTRAINT `candidate_vacancies_candidate_id_foreign` FOREIGN KEY (`candidate_id`) REFERENCES `candidates` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `candidate_vacancies_vacancy_id_foreign` FOREIGN KEY (`vacancy_id`) REFERENCES `vacancies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `designations`
--
ALTER TABLE `designations`
  ADD CONSTRAINT `designations_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employee_educations`
--
ALTER TABLE `employee_educations`
  ADD CONSTRAINT `employee_educations_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employee_skills`
--
ALTER TABLE `employee_skills`
  ADD CONSTRAINT `employee_skills_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employee_workshifts`
--
ALTER TABLE `employee_workshifts`
  ADD CONSTRAINT `employee_workshifts_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `employee_workshifts_work_shift_id_foreign` FOREIGN KEY (`work_shift_id`) REFERENCES `work_shifts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `job_details`
--
ALTER TABLE `job_details`
  ADD CONSTRAINT `job_details_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `job_details_designation_id_foreign` FOREIGN KEY (`designation_id`) REFERENCES `designations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `job_details_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `vacancies`
--
ALTER TABLE `vacancies`
  ADD CONSTRAINT `vacancies_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vacancies_designation_id_foreign` FOREIGN KEY (`designation_id`) REFERENCES `designations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vacancies_hiring_manager_id_foreign` FOREIGN KEY (`hiring_manager_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `work_experiences`
--
ALTER TABLE `work_experiences`
  ADD CONSTRAINT `work_experiences_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
