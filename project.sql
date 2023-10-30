-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 30, 2023 at 08:18 AM
-- Server version: 5.7.40
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project`
--

-- --------------------------------------------------------

--
-- Table structure for table `adm_announcements`
--

DROP TABLE IF EXISTS `adm_announcements`;
CREATE TABLE IF NOT EXISTS `adm_announcements` (
  `ann_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ann_cat_id` int(10) UNSIGNED NOT NULL,
  `ann_uuid` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `ann_headline` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ann_description` text COLLATE utf8_unicode_ci,
  `ann_usr_id_create` int(10) UNSIGNED DEFAULT NULL,
  `ann_timestamp_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ann_usr_id_change` int(10) UNSIGNED DEFAULT NULL,
  `ann_timestamp_change` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ann_id`),
  UNIQUE KEY `adm_idx_ann_uuid` (`ann_uuid`),
  KEY `adm_fk_ann_cat` (`ann_cat_id`),
  KEY `adm_fk_ann_usr_create` (`ann_usr_id_create`),
  KEY `adm_fk_ann_usr_change` (`ann_usr_id_change`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `adm_auto_login`
--

DROP TABLE IF EXISTS `adm_auto_login`;
CREATE TABLE IF NOT EXISTS `adm_auto_login` (
  `atl_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `atl_auto_login_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `atl_session_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `atl_org_id` int(10) UNSIGNED NOT NULL,
  `atl_usr_id` int(10) UNSIGNED NOT NULL,
  `atl_last_login` timestamp NULL DEFAULT NULL,
  `atl_number_invalid` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`atl_id`),
  KEY `adm_fk_atl_usr` (`atl_usr_id`),
  KEY `adm_fk_atl_org` (`atl_org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `adm_categories`
--

DROP TABLE IF EXISTS `adm_categories`;
CREATE TABLE IF NOT EXISTS `adm_categories` (
  `cat_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cat_org_id` int(10) UNSIGNED DEFAULT NULL,
  `cat_uuid` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `cat_type` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `cat_name_intern` varchar(110) COLLATE utf8_unicode_ci NOT NULL,
  `cat_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `cat_system` tinyint(1) NOT NULL DEFAULT '0',
  `cat_default` tinyint(1) NOT NULL DEFAULT '0',
  `cat_sequence` smallint(6) NOT NULL,
  `cat_usr_id_create` int(10) UNSIGNED DEFAULT NULL,
  `cat_timestamp_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cat_usr_id_change` int(10) UNSIGNED DEFAULT NULL,
  `cat_timestamp_change` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`cat_id`),
  UNIQUE KEY `adm_idx_cat_uuid` (`cat_uuid`),
  KEY `adm_fk_cat_org` (`cat_org_id`),
  KEY `adm_fk_cat_usr_create` (`cat_usr_id_create`),
  KEY `adm_fk_cat_usr_change` (`cat_usr_id_change`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `adm_categories`
--

INSERT INTO `adm_categories` (`cat_id`, `cat_org_id`, `cat_uuid`, `cat_type`, `cat_name_intern`, `cat_name`, `cat_system`, `cat_default`, `cat_sequence`, `cat_usr_id_create`, `cat_timestamp_create`, `cat_usr_id_change`, `cat_timestamp_change`) VALUES
(1, NULL, '3cacd7b4-ed70-4e10-b97f-14d84eb9323d', 'USF', 'BASIC_DATA', 'SYS_BASIC_DATA', 1, 0, 1, 1, '2023-10-11 10:56:06', NULL, NULL),
(2, NULL, 'aa5a8981-36d3-46df-a9b1-7810414c0c08', 'USF', 'SOCIAL_NETWORKS', 'SYS_SOCIAL_NETWORKS', 0, 0, 2, 1, '2023-10-11 10:56:06', NULL, NULL),
(3, NULL, 'b1e0dda7-b56b-4f69-ae71-f4f491a2c8cd', 'USF', 'ADDIDIONAL_DATA', 'INS_ADDIDIONAL_DATA', 0, 0, 3, 1, '2023-10-11 10:56:06', NULL, NULL),
(4, 1, 'a1e5e362-f279-4be0-8151-1ef61ee32d19', 'ROL', 'COMMON', 'SYS_COMMON', 0, 1, 1, 1, '2023-10-11 10:56:06', NULL, NULL),
(5, 1, 'c078afaf-c68d-441d-9042-d4268e315790', 'ROL', 'GROUPS', 'INS_GROUPS', 0, 0, 2, 1, '2023-10-11 10:56:06', NULL, NULL),
(6, 1, '42fee29e-3770-4d87-8c51-bf7c0f566d91', 'ROL', 'COURSES', 'INS_COURSES', 0, 0, 3, 1, '2023-10-11 10:56:06', NULL, NULL),
(7, 1, '4d33c5df-8b6d-4258-a91d-60799017c81f', 'ROL', 'TEAMS', 'INS_TEAMS', 0, 0, 4, 1, '2023-10-11 10:56:06', NULL, NULL),
(8, 1, 'c21f9235-5286-4f7f-b029-1f063cd903c3', 'ROL', 'EVENTS', 'SYS_EVENTS_CONFIRMATION_OF_PARTICIPATION', 1, 0, 5, 1, '2023-10-11 10:56:06', NULL, NULL),
(9, 1, 'bb3d851d-92f0-455e-b0ff-8015b0a4aba6', 'LNK', 'COMMON', 'SYS_COMMON', 0, 1, 1, 1, '2023-10-11 10:56:06', NULL, NULL),
(10, 1, '092a347a-878f-4ad5-bf19-6dd32b74858e', 'LNK', 'INTERN', 'INS_INTERN', 0, 0, 2, 1, '2023-10-11 10:56:06', NULL, NULL),
(11, 1, 'ee12a9a3-ba41-4477-88bf-a9fca69ffc06', 'ANN', 'COMMON', 'SYS_COMMON', 0, 1, 1, 1, '2023-10-11 10:56:06', NULL, NULL),
(12, 1, 'f829157f-0d10-40c5-a7c0-8704bfe55672', 'ANN', 'IMPORTANT', 'SYS_IMPORTANT', 0, 0, 2, 1, '2023-10-11 10:56:06', NULL, NULL),
(13, 1, '57345c5a-95ce-4f5d-8d47-f5444b099c1a', 'DAT', 'COMMON', 'SYS_COMMON', 0, 1, 1, 1, '2023-10-11 10:56:06', NULL, NULL),
(14, 1, 'f7720d3b-3b87-40f5-ba5e-2f327149377e', 'DAT', 'TRAINING', 'INS_TRAINING', 0, 0, 2, 1, '2023-10-11 10:56:06', NULL, NULL),
(15, 1, 'bab24175-7083-4b5c-8ce4-df40c136864e', 'DAT', 'COURSES', 'INS_COURSES', 0, 0, 3, 1, '2023-10-11 10:56:06', NULL, NULL),
(16, 1, '2ad7f8b6-17ac-414f-a1f3-acb01055e6e7', 'USF', 'MEMBERSHIP1', 'PMB_MEMBERSHIP', 0, 0, 4, 2, '2023-10-17 12:22:40', NULL, NULL),
(17, 1, '60d14824-5a39-4714-9959-883cd28423db', 'USF', 'MEMBERSHIP_FEE1', 'PMB_MEMBERSHIP_FEE', 0, 0, 5, 2, '2023-10-17 12:22:40', NULL, NULL),
(18, 1, '3bd02a8e-8f56-42f9-a1a3-668a1a72d685', 'USF', 'MANDATE1', 'PMB_MANDATE', 0, 0, 6, 2, '2023-10-17 12:22:40', NULL, NULL),
(19, NULL, '0f4579ca-4624-4416-b5d5-024749a76c83', 'USF', 'ACCOUNT_DATA', 'PMB_ACCOUNT_DATA', 0, 0, 7, 2, '2023-10-17 12:22:40', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `adm_category_report`
--

DROP TABLE IF EXISTS `adm_category_report`;
CREATE TABLE IF NOT EXISTS `adm_category_report` (
  `crt_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `crt_org_id` int(10) UNSIGNED DEFAULT NULL,
  `crt_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `crt_col_fields` text COLLATE utf8_unicode_ci,
  `crt_selection_role` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `crt_selection_cat` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `crt_number_col` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`crt_id`),
  KEY `adm_fk_crt_org` (`crt_org_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `adm_category_report`
--

INSERT INTO `adm_category_report` (`crt_id`, `crt_org_id`, `crt_name`, `crt_col_fields`, `crt_selection_role`, `crt_selection_cat`, `crt_number_col`) VALUES
(1, 1, 'General role assignment', 'p2,p1,p3,p5,r1,r3,r2', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `adm_components`
--

DROP TABLE IF EXISTS `adm_components`;
CREATE TABLE IF NOT EXISTS `adm_components` (
  `com_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `com_type` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `com_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `com_name_intern` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `com_version` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `com_beta` smallint(6) NOT NULL DEFAULT '0',
  `com_update_step` int(11) NOT NULL DEFAULT '0',
  `com_update_completed` tinyint(1) NOT NULL DEFAULT '1',
  `com_timestamp_installed` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`com_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `adm_components`
--

INSERT INTO `adm_components` (`com_id`, `com_type`, `com_name`, `com_name_intern`, `com_version`, `com_beta`, `com_update_step`, `com_update_completed`, `com_timestamp_installed`) VALUES
(1, 'SYSTEM', 'Admidio Core', 'CORE', '4.2.12', 0, 330, 1, '2023-10-11 10:56:50'),
(2, 'MODULE', 'SYS_ANNOUNCEMENTS', 'ANNOUNCEMENTS', '4.2.12', 0, 0, 1, '2023-10-11 10:56:50'),
(3, 'MODULE', 'SYS_DATABASE_BACKUP', 'BACKUP', '4.2.12', 0, 0, 1, '2023-10-11 10:56:50'),
(4, 'MODULE', 'SYS_CATEGORIES', 'CATEGORIES', '4.2.12', 0, 0, 1, '2023-10-11 10:56:50'),
(5, 'MODULE', 'SYS_CATEGORY_REPORT', 'CATEGORY-REPORT', '4.2.12', 0, 0, 1, '2023-10-11 10:56:50'),
(6, 'MODULE', 'DAT_DATES', 'DATES', '4.2.12', 0, 0, 1, '2023-10-11 10:56:50'),
(7, 'MODULE', 'SYS_DOCUMENTS_FILES', 'DOCUMENTS-FILES', '4.2.12', 0, 0, 1, '2023-10-11 10:56:50'),
(8, 'MODULE', 'GBO_GUESTBOOK', 'GUESTBOOK', '4.2.12', 0, 0, 1, '2023-10-11 10:56:50'),
(9, 'MODULE', 'SYS_WEBLINKS', 'LINKS', '4.2.12', 0, 0, 1, '2023-10-11 10:56:50'),
(10, 'MODULE', 'SYS_GROUPS_ROLES', 'GROUPS-ROLES', '4.2.12', 0, 0, 1, '2023-10-11 10:56:50'),
(11, 'MODULE', 'SYS_MEMBERS', 'MEMBERS', '4.2.12', 0, 0, 1, '2023-10-11 10:56:50'),
(12, 'MODULE', 'SYS_MESSAGES', 'MESSAGES', '4.2.12', 0, 0, 1, '2023-10-11 10:56:50'),
(13, 'MODULE', 'SYS_MENU', 'MENU', '4.2.12', 0, 0, 1, '2023-10-11 10:56:50'),
(14, 'MODULE', 'SYS_PHOTOS', 'PHOTOS', '4.2.12', 0, 0, 1, '2023-10-11 10:56:50'),
(15, 'MODULE', 'SYS_SETTINGS', 'PREFERENCES', '4.2.12', 0, 0, 1, '2023-10-11 10:56:50'),
(16, 'MODULE', 'PRO_PROFILE', 'PROFILE', '4.2.12', 0, 0, 1, '2023-10-11 10:56:50'),
(17, 'MODULE', 'SYS_REGISTRATION', 'REGISTRATION', '4.2.12', 0, 0, 1, '2023-10-11 10:56:50'),
(18, 'MODULE', 'SYS_ROOM_MANAGEMENT', 'ROOMS', '4.2.12', 0, 0, 1, '2023-10-11 10:56:50');

-- --------------------------------------------------------

--
-- Table structure for table `adm_dates`
--

DROP TABLE IF EXISTS `adm_dates`;
CREATE TABLE IF NOT EXISTS `adm_dates` (
  `dat_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `dat_cat_id` int(10) UNSIGNED NOT NULL,
  `dat_rol_id` int(10) UNSIGNED DEFAULT NULL,
  `dat_room_id` int(10) UNSIGNED DEFAULT NULL,
  `dat_uuid` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `dat_begin` timestamp NULL DEFAULT NULL,
  `dat_end` timestamp NULL DEFAULT NULL,
  `dat_all_day` tinyint(1) NOT NULL DEFAULT '0',
  `dat_headline` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `dat_description` text COLLATE utf8_unicode_ci,
  `dat_highlight` tinyint(1) NOT NULL DEFAULT '0',
  `dat_location` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dat_country` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dat_deadline` timestamp NULL DEFAULT NULL,
  `dat_max_members` int(11) NOT NULL DEFAULT '0',
  `dat_usr_id_create` int(10) UNSIGNED DEFAULT NULL,
  `dat_timestamp_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dat_usr_id_change` int(10) UNSIGNED DEFAULT NULL,
  `dat_timestamp_change` timestamp NULL DEFAULT NULL,
  `dat_allow_comments` tinyint(1) NOT NULL DEFAULT '0',
  `dat_additional_guests` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`dat_id`),
  UNIQUE KEY `adm_idx_dat_uuid` (`dat_uuid`),
  KEY `adm_fk_dat_cat` (`dat_cat_id`),
  KEY `adm_fk_dat_rol` (`dat_rol_id`),
  KEY `adm_fk_dat_room` (`dat_room_id`),
  KEY `adm_fk_dat_usr_create` (`dat_usr_id_create`),
  KEY `adm_fk_dat_usr_change` (`dat_usr_id_change`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `adm_files`
--

DROP TABLE IF EXISTS `adm_files`;
CREATE TABLE IF NOT EXISTS `adm_files` (
  `fil_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `fil_fol_id` int(10) UNSIGNED NOT NULL,
  `fil_uuid` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `fil_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fil_description` text COLLATE utf8_unicode_ci,
  `fil_locked` tinyint(1) NOT NULL DEFAULT '0',
  `fil_counter` int(11) DEFAULT NULL,
  `fil_usr_id` int(10) UNSIGNED DEFAULT NULL,
  `fil_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`fil_id`),
  UNIQUE KEY `adm_idx_fil_uuid` (`fil_uuid`),
  KEY `adm_fk_fil_fol` (`fil_fol_id`),
  KEY `adm_fk_fil_usr` (`fil_usr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `adm_folders`
--

DROP TABLE IF EXISTS `adm_folders`;
CREATE TABLE IF NOT EXISTS `adm_folders` (
  `fol_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `fol_org_id` int(10) UNSIGNED NOT NULL,
  `fol_fol_id_parent` int(10) UNSIGNED DEFAULT NULL,
  `fol_uuid` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `fol_type` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `fol_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fol_description` text COLLATE utf8_unicode_ci,
  `fol_path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fol_locked` tinyint(1) NOT NULL DEFAULT '0',
  `fol_public` tinyint(1) NOT NULL DEFAULT '0',
  `fol_usr_id` int(10) UNSIGNED DEFAULT NULL,
  `fol_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`fol_id`),
  UNIQUE KEY `adm_idx_fol_uuid` (`fol_uuid`),
  KEY `adm_fk_fol_org` (`fol_org_id`),
  KEY `adm_fk_fol_fol_parent` (`fol_fol_id_parent`),
  KEY `adm_fk_fol_usr` (`fol_usr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `adm_folders`
--

INSERT INTO `adm_folders` (`fol_id`, `fol_org_id`, `fol_fol_id_parent`, `fol_uuid`, `fol_type`, `fol_name`, `fol_description`, `fol_path`, `fol_locked`, `fol_public`, `fol_usr_id`, `fol_timestamp`) VALUES
(1, 1, NULL, '3b1d0084-259d-427d-a13d-339aaee7840c', 'DOCUMENTS', 'documents_surinder', NULL, '/adm_my_files', 0, 1, 1, '2023-10-11 10:56:06');

-- --------------------------------------------------------

--
-- Table structure for table `adm_guestbook`
--

DROP TABLE IF EXISTS `adm_guestbook`;
CREATE TABLE IF NOT EXISTS `adm_guestbook` (
  `gbo_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `gbo_org_id` int(10) UNSIGNED NOT NULL,
  `gbo_uuid` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `gbo_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `gbo_text` text COLLATE utf8_unicode_ci NOT NULL,
  `gbo_email` varchar(254) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gbo_homepage` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gbo_ip_address` varchar(39) COLLATE utf8_unicode_ci NOT NULL,
  `gbo_locked` tinyint(1) NOT NULL DEFAULT '0',
  `gbo_usr_id_create` int(10) UNSIGNED DEFAULT NULL,
  `gbo_timestamp_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gbo_usr_id_change` int(10) UNSIGNED DEFAULT NULL,
  `gbo_timestamp_change` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`gbo_id`),
  UNIQUE KEY `adm_idx_gbo_uuid` (`gbo_uuid`),
  KEY `adm_fk_gbo_org` (`gbo_org_id`),
  KEY `adm_fk_gbo_usr_create` (`gbo_usr_id_create`),
  KEY `adm_fk_gbo_usr_change` (`gbo_usr_id_change`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `adm_guestbook_comments`
--

DROP TABLE IF EXISTS `adm_guestbook_comments`;
CREATE TABLE IF NOT EXISTS `adm_guestbook_comments` (
  `gbc_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `gbc_gbo_id` int(10) UNSIGNED NOT NULL,
  `gbc_uuid` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `gbc_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `gbc_text` text COLLATE utf8_unicode_ci NOT NULL,
  `gbc_email` varchar(254) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gbc_ip_address` varchar(39) COLLATE utf8_unicode_ci NOT NULL,
  `gbc_locked` tinyint(1) NOT NULL DEFAULT '0',
  `gbc_usr_id_create` int(10) UNSIGNED DEFAULT NULL,
  `gbc_timestamp_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gbc_usr_id_change` int(10) UNSIGNED DEFAULT NULL,
  `gbc_timestamp_change` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`gbc_id`),
  UNIQUE KEY `adm_idx_gbc_uuid` (`gbc_uuid`),
  KEY `adm_fk_gbc_gbo` (`gbc_gbo_id`),
  KEY `adm_fk_gbc_usr_create` (`gbc_usr_id_create`),
  KEY `adm_fk_gbc_usr_change` (`gbc_usr_id_change`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `adm_ids`
--

DROP TABLE IF EXISTS `adm_ids`;
CREATE TABLE IF NOT EXISTS `adm_ids` (
  `ids_usr_id` int(10) UNSIGNED NOT NULL,
  `ids_reference_id` int(10) UNSIGNED NOT NULL,
  KEY `adm_fk_ids_usr_id` (`ids_usr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `adm_links`
--

DROP TABLE IF EXISTS `adm_links`;
CREATE TABLE IF NOT EXISTS `adm_links` (
  `lnk_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `lnk_cat_id` int(10) UNSIGNED NOT NULL,
  `lnk_uuid` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `lnk_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lnk_description` text COLLATE utf8_unicode_ci,
  `lnk_url` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `lnk_counter` int(11) NOT NULL DEFAULT '0',
  `lnk_usr_id_create` int(10) UNSIGNED DEFAULT NULL,
  `lnk_timestamp_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lnk_usr_id_change` int(10) UNSIGNED DEFAULT NULL,
  `lnk_timestamp_change` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`lnk_id`),
  UNIQUE KEY `adm_idx_lnk_uuid` (`lnk_uuid`),
  KEY `adm_fk_lnk_cat` (`lnk_cat_id`),
  KEY `adm_fk_lnk_usr_create` (`lnk_usr_id_create`),
  KEY `adm_fk_lnk_usr_change` (`lnk_usr_id_change`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `adm_lists`
--

DROP TABLE IF EXISTS `adm_lists`;
CREATE TABLE IF NOT EXISTS `adm_lists` (
  `lst_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `lst_org_id` int(10) UNSIGNED NOT NULL,
  `lst_usr_id` int(10) UNSIGNED NOT NULL,
  `lst_uuid` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `lst_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lst_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lst_global` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`lst_id`),
  UNIQUE KEY `adm_idx_lst_uuid` (`lst_uuid`),
  KEY `adm_fk_lst_usr` (`lst_usr_id`),
  KEY `adm_fk_lst_org` (`lst_org_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `adm_lists`
--

INSERT INTO `adm_lists` (`lst_id`, `lst_org_id`, `lst_usr_id`, `lst_uuid`, `lst_name`, `lst_timestamp`, `lst_global`) VALUES
(1, 1, 1, '484bbeff-e7fb-4ef9-adb5-9ca325c095d5', 'Address list', '2023-10-11 10:56:06', 1),
(2, 1, 1, 'e2bf9586-36d9-4e0a-af08-907924aa2cce', 'Phone list', '2023-10-11 10:56:06', 1),
(3, 1, 1, '1ada7f80-7ed8-4333-bc9a-0c4673318c88', 'Contact information', '2023-10-11 10:56:06', 1),
(4, 1, 1, '01a0dd7b-f5b5-4021-b8a7-02d18efdd4f2', 'Membership', '2023-10-11 10:56:06', 1),
(5, 1, 1, 'be15820f-886d-4d2d-b9ea-90c259150c50', 'Members', '2023-10-11 10:56:06', 1),
(6, 1, 1, '078ac6ac-2c8f-4237-a34f-4167e613e410', 'Members', '2023-10-11 10:56:06', 1);

-- --------------------------------------------------------

--
-- Table structure for table `adm_list_columns`
--

DROP TABLE IF EXISTS `adm_list_columns`;
CREATE TABLE IF NOT EXISTS `adm_list_columns` (
  `lsc_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `lsc_lst_id` int(10) UNSIGNED NOT NULL,
  `lsc_number` smallint(6) NOT NULL,
  `lsc_usf_id` int(10) UNSIGNED DEFAULT NULL,
  `lsc_special_field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lsc_sort` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lsc_filter` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lsc_id`),
  KEY `adm_fk_lsc_lst` (`lsc_lst_id`),
  KEY `adm_fk_lsc_usf` (`lsc_usf_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `adm_list_columns`
--

INSERT INTO `adm_list_columns` (`lsc_id`, `lsc_lst_id`, `lsc_number`, `lsc_usf_id`, `lsc_special_field`, `lsc_sort`, `lsc_filter`) VALUES
(1, 1, 1, 1, NULL, 'ASC', NULL),
(2, 1, 2, 2, NULL, 'ASC', NULL),
(3, 1, 3, 9, NULL, NULL, NULL),
(4, 1, 4, 3, NULL, NULL, NULL),
(5, 1, 5, 4, NULL, NULL, NULL),
(6, 1, 6, 5, NULL, NULL, NULL),
(7, 2, 1, 1, NULL, 'ASC', NULL),
(8, 2, 2, 2, NULL, 'ASC', NULL),
(9, 2, 3, 7, NULL, NULL, NULL),
(10, 2, 4, 8, NULL, NULL, NULL),
(11, 2, 5, 11, NULL, NULL, NULL),
(12, 3, 1, 1, NULL, 'ASC', NULL),
(13, 3, 2, 2, NULL, 'ASC', NULL),
(14, 3, 3, 9, NULL, NULL, NULL),
(15, 3, 4, 3, NULL, NULL, NULL),
(16, 3, 5, 4, NULL, NULL, NULL),
(17, 3, 6, 5, NULL, NULL, NULL),
(18, 3, 7, 7, NULL, NULL, NULL),
(19, 3, 8, 8, NULL, NULL, NULL),
(20, 3, 9, 11, NULL, NULL, NULL),
(21, 4, 1, 1, NULL, 'ASC', NULL),
(22, 4, 2, 2, NULL, 'ASC', NULL),
(23, 4, 3, 9, NULL, NULL, NULL),
(24, 4, 4, NULL, 'mem_begin', NULL, NULL),
(25, 4, 5, NULL, 'mem_end', NULL, NULL),
(26, 5, 1, 1, NULL, 'ASC', NULL),
(27, 5, 2, 2, NULL, 'ASC', NULL),
(28, 5, 3, NULL, 'mem_approved', NULL, NULL),
(29, 5, 4, NULL, 'mem_comment', NULL, NULL),
(30, 5, 5, NULL, 'mem_count_guests', NULL, NULL),
(31, 6, 1, 1, NULL, 'ASC', NULL),
(32, 6, 2, 2, NULL, 'ASC', NULL),
(33, 6, 3, NULL, 'usr_login_name', NULL, NULL),
(34, 6, 4, 10, NULL, NULL, NULL),
(35, 6, 5, 9, NULL, NULL, NULL),
(36, 6, 6, 5, NULL, NULL, NULL),
(37, 6, 7, NULL, 'usr_timestamp_change', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `adm_members`
--

DROP TABLE IF EXISTS `adm_members`;
CREATE TABLE IF NOT EXISTS `adm_members` (
  `mem_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `mem_rol_id` int(10) UNSIGNED NOT NULL,
  `mem_usr_id` int(10) UNSIGNED NOT NULL,
  `mem_uuid` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `mem_begin` date NOT NULL,
  `mem_end` date NOT NULL DEFAULT '9999-12-31',
  `mem_leader` tinyint(1) NOT NULL DEFAULT '0',
  `mem_usr_id_create` int(10) UNSIGNED DEFAULT NULL,
  `mem_timestamp_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mem_usr_id_change` int(10) UNSIGNED DEFAULT NULL,
  `mem_timestamp_change` timestamp NULL DEFAULT NULL,
  `mem_approved` int(10) UNSIGNED DEFAULT NULL,
  `mem_comment` varchar(4000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mem_count_guests` int(10) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`mem_id`),
  UNIQUE KEY `adm_idx_mem_uuid` (`mem_uuid`),
  KEY `adm_idx_mem_rol_usr_id` (`mem_rol_id`,`mem_usr_id`),
  KEY `adm_fk_mem_usr` (`mem_usr_id`),
  KEY `adm_fk_mem_usr_create` (`mem_usr_id_create`),
  KEY `adm_fk_mem_usr_change` (`mem_usr_id_change`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `adm_members`
--

INSERT INTO `adm_members` (`mem_id`, `mem_rol_id`, `mem_usr_id`, `mem_uuid`, `mem_begin`, `mem_end`, `mem_leader`, `mem_usr_id_create`, `mem_timestamp_create`, `mem_usr_id_change`, `mem_timestamp_change`, `mem_approved`, `mem_comment`, `mem_count_guests`) VALUES
(1, 1, 2, '9f7a7ef7-fa85-4d12-94cc-c98c536e405f', '2023-10-11', '9999-12-31', 0, 1, '2023-10-11 10:56:06', NULL, NULL, NULL, NULL, 0),
(2, 2, 2, 'd2290b87-3f2d-4323-95c7-b54c8162a1ae', '2023-10-11', '9999-12-31', 0, 1, '2023-10-11 10:56:06', NULL, NULL, NULL, NULL, 0),
(3, 2, 3, 'e987cfc0-c2fe-406d-88e6-30e4f1b01fbf', '2023-10-11', '9999-12-31', 0, 2, '2023-10-11 11:18:10', NULL, NULL, NULL, NULL, 0),
(4, 2, 4, '0e310688-a32e-4143-8ae7-0f86e0386bb9', '2023-10-19', '9999-12-31', 0, 2, '2023-10-19 12:15:40', NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `adm_menu`
--

DROP TABLE IF EXISTS `adm_menu`;
CREATE TABLE IF NOT EXISTS `adm_menu` (
  `men_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `men_men_id_parent` int(10) UNSIGNED DEFAULT NULL,
  `men_com_id` int(10) UNSIGNED DEFAULT NULL,
  `men_uuid` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `men_name_intern` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `men_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `men_description` varchar(4000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `men_node` tinyint(1) NOT NULL DEFAULT '0',
  `men_order` int(10) UNSIGNED DEFAULT NULL,
  `men_standard` tinyint(1) NOT NULL DEFAULT '0',
  `men_url` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `men_icon` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`men_id`),
  UNIQUE KEY `adm_idx_men_uuid` (`men_uuid`),
  KEY `adm_idx_men_men_id_parent` (`men_men_id_parent`),
  KEY `adm_fk_men_com_id` (`men_com_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `adm_menu`
--

INSERT INTO `adm_menu` (`men_id`, `men_men_id_parent`, `men_com_id`, `men_uuid`, `men_name_intern`, `men_name`, `men_description`, `men_node`, `men_order`, `men_standard`, `men_url`, `men_icon`) VALUES
(1, NULL, NULL, '84745d3c-a60d-4b33-8cd5-f83c0794ec2b', 'modules', 'SYS_MODULES', '', 1, 1, 1, NULL, ''),
(2, NULL, NULL, '3ec8e63a-0e7c-4d4f-b227-0a46a9ea107e', 'administration', 'SYS_ADMINISTRATION', '', 1, 2, 1, NULL, ''),
(3, NULL, NULL, '078a5b6a-a8e8-4db8-853a-e3d41b7635f7', 'plugins', 'SYS_PLUGINS', '', 1, 3, 1, NULL, ''),
(4, 1, NULL, 'd10c9f63-4097-46b6-9260-8f4bfd5594be', 'overview', 'SYS_OVERVIEW', '', 0, 1, 1, '/adm_program/overview.php', 'fa-home'),
(5, 1, 7, 'b39cadca-65c5-4964-a977-9fc870a0be9b', 'documents-files', 'SYS_DOCUMENTS_FILES', 'SYS_DOCUMENTS_FILES_DESC', 0, 3, 1, '/adm_program/modules/documents-files/documents_files.php', 'fa-file-download'),
(6, 1, 10, '4f8b8510-b437-4e96-9825-e3bc282093e8', 'groups-roles', 'SYS_GROUPS_ROLES', 'SYS_GROUPS_ROLES_DESC', 0, 7, 1, '/adm_program/modules/groups-roles/groups_roles.php', 'fa-users'),
(7, 1, 2, '859b203a-8a78-4941-a74b-45127c3bb94c', 'announcements', 'SYS_ANNOUNCEMENTS', 'SYS_ANNOUNCEMENTS_DESC', 0, 2, 1, '/adm_program/modules/announcements/announcements.php', 'fa-newspaper'),
(8, 1, 14, '120e585f-6e56-4213-b710-67b738088ea2', 'photo', 'SYS_PHOTOS', 'PHO_PHOTOS_DESC', 0, 5, 1, '/adm_program/modules/photos/photos.php', 'fa-image'),
(9, 1, 8, 'c2db3294-5849-4ab6-925e-c19098486c70', 'guestbook', 'GBO_GUESTBOOK', 'GBO_GUESTBOOK_DESC', 0, 6, 1, '/adm_program/modules/guestbook/guestbook.php', 'fa-book'),
(10, 1, 6, 'b0aab265-77f4-4257-bb49-86c2a14b3b5e', 'dates', 'DAT_DATES', 'SYS_EVENTS_DESC', 0, 8, 1, '/adm_program/modules/dates/dates.php', 'fa-calendar-alt'),
(11, 1, 5, '4fdbbcc1-cbfd-4421-bc83-6875c7e2a5c9', 'category-report', 'SYS_CATEGORY_REPORT', 'SYS_CATEGORY_REPORT_DESC', 0, 9, 1, '/adm_program/modules/category-report/category_report.php', 'fa-list-ul'),
(12, 1, 9, '070fec52-0a47-47bd-b991-2e19290022d4', 'weblinks', 'SYS_WEBLINKS', 'SYS_WEBLINKS_DESC', 0, 9, 1, '/adm_program/modules/links/links.php', 'fa-link'),
(13, 2, 3, 'fb9da768-f882-42fe-b31c-d7aa69de80f1', 'dbback', 'SYS_DATABASE_BACKUP', 'SYS_DATABASE_BACKUP_DESC', 0, 4, 1, '/adm_program/modules/backup/backup.php', 'fa-database'),
(14, 2, 15, 'fa0f420c-0795-4b1e-89f4-bf208f859d67', 'orgprop', 'SYS_SETTINGS', 'ORG_ORGANIZATION_PROPERTIES_DESC', 0, 6, 1, '/adm_program/modules/preferences/preferences.php', 'fa-cog'),
(15, 1, 12, 'e5ecd3d9-7b5a-4389-8117-948d584034d7', 'mail', 'SYS_EMAIL', 'SYS_EMAIL_DESC', 0, 4, 1, '/adm_program/modules/messages/messages_write.php', 'fa-envelope'),
(16, 2, 17, '958f0986-11ea-4fcb-b47d-ebd637626873', 'newreg', 'SYS_NEW_REGISTRATIONS', 'SYS_MANAGE_NEW_REGISTRATIONS_DESC', 0, 1, 1, '/adm_program/modules/registration/registration.php', 'fa-address-card'),
(17, 2, 11, 'b8782372-ee40-437d-b663-5bb173a813c9', 'usrmgt', 'SYS_MEMBERS', 'SYS_MEMBERS_DESC', 0, 2, 1, '/adm_program/modules/members/members.php', 'fa-users-cog'),
(18, 2, 13, '9ffc0623-8477-4e70-9296-59122612c81e', 'menu', 'SYS_MENU', 'SYS_MENU_DESC', 0, 5, 1, '/adm_program/modules/menu/menu.php', 'fa-stream'),
(19, 1, NULL, '9a55ff6b-24fe-4c5c-87c7-9dd9462b25bb', 'MEMBERSHIP_FEES', 'Membership fees', NULL, 0, 11, 0, '/adm_plugins/membership_fee/membership_fee.php', 'currency.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `adm_messages`
--

DROP TABLE IF EXISTS `adm_messages`;
CREATE TABLE IF NOT EXISTS `adm_messages` (
  `msg_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `msg_uuid` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `msg_type` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `msg_subject` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `msg_usr_id_sender` int(10) UNSIGNED NOT NULL,
  `msg_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `msg_read` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`msg_id`),
  UNIQUE KEY `adm_idx_msg_uuid` (`msg_uuid`),
  KEY `adm_fk_msg_usr_sender` (`msg_usr_id_sender`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `adm_messages_attachments`
--

DROP TABLE IF EXISTS `adm_messages_attachments`;
CREATE TABLE IF NOT EXISTS `adm_messages_attachments` (
  `msa_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `msa_msg_id` int(10) UNSIGNED NOT NULL,
  `msa_file_name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `msa_original_file_name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`msa_id`),
  KEY `adm_fk_msa_msg_id` (`msa_msg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `adm_messages_content`
--

DROP TABLE IF EXISTS `adm_messages_content`;
CREATE TABLE IF NOT EXISTS `adm_messages_content` (
  `msc_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `msc_msg_id` int(10) UNSIGNED NOT NULL,
  `msc_usr_id` int(10) UNSIGNED DEFAULT NULL,
  `msc_message` text COLLATE utf8_unicode_ci NOT NULL,
  `msc_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`msc_id`),
  KEY `adm_fk_msc_msg_id` (`msc_msg_id`),
  KEY `adm_fk_msc_usr_id` (`msc_usr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `adm_messages_recipients`
--

DROP TABLE IF EXISTS `adm_messages_recipients`;
CREATE TABLE IF NOT EXISTS `adm_messages_recipients` (
  `msr_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `msr_msg_id` int(10) UNSIGNED NOT NULL,
  `msr_rol_id` int(10) UNSIGNED DEFAULT NULL,
  `msr_usr_id` int(10) UNSIGNED DEFAULT NULL,
  `msr_role_mode` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`msr_id`),
  KEY `adm_fk_msr_msg_id` (`msr_msg_id`),
  KEY `adm_fk_msr_rol_id` (`msr_rol_id`),
  KEY `adm_fk_msr_usr_id` (`msr_usr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `adm_organizations`
--

DROP TABLE IF EXISTS `adm_organizations`;
CREATE TABLE IF NOT EXISTS `adm_organizations` (
  `org_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `org_uuid` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `org_shortname` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `org_longname` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `org_org_id_parent` int(10) UNSIGNED DEFAULT NULL,
  `org_homepage` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`org_id`),
  UNIQUE KEY `adm_idx_org_shortname` (`org_shortname`),
  UNIQUE KEY `adm_idx_org_uuid` (`org_uuid`),
  KEY `adm_fk_org_org_parent` (`org_org_id_parent`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `adm_organizations`
--

INSERT INTO `adm_organizations` (`org_id`, `org_uuid`, `org_shortname`, `org_longname`, `org_org_id_parent`, `org_homepage`) VALUES
(1, 'f9e90c68-8804-438c-965b-7b36a1286792', 'surinder', 'Alumni Association', NULL, 'http://localhost/alumni');

-- --------------------------------------------------------

--
-- Table structure for table `adm_photos`
--

DROP TABLE IF EXISTS `adm_photos`;
CREATE TABLE IF NOT EXISTS `adm_photos` (
  `pho_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pho_org_id` int(10) UNSIGNED NOT NULL,
  `pho_pho_id_parent` int(10) UNSIGNED DEFAULT NULL,
  `pho_uuid` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `pho_quantity` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `pho_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `pho_begin` date NOT NULL,
  `pho_end` date NOT NULL,
  `pho_description` varchar(4000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pho_photographers` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pho_locked` tinyint(1) NOT NULL DEFAULT '0',
  `pho_usr_id_create` int(10) UNSIGNED DEFAULT NULL,
  `pho_timestamp_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pho_usr_id_change` int(10) UNSIGNED DEFAULT NULL,
  `pho_timestamp_change` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`pho_id`),
  UNIQUE KEY `adm_idx_pho_uuid` (`pho_uuid`),
  KEY `adm_fk_pho_pho_parent` (`pho_pho_id_parent`),
  KEY `adm_fk_pho_org` (`pho_org_id`),
  KEY `adm_fk_pho_usr_create` (`pho_usr_id_create`),
  KEY `adm_fk_pho_usr_change` (`pho_usr_id_change`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `adm_plugin_preferences`
--

DROP TABLE IF EXISTS `adm_plugin_preferences`;
CREATE TABLE IF NOT EXISTS `adm_plugin_preferences` (
  `plp_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `plp_org_id` int(10) UNSIGNED NOT NULL,
  `plp_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `plp_value` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`plp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `adm_plugin_preferences`
--

INSERT INTO `adm_plugin_preferences` (`plp_id`, `plp_org_id`, `plp_name`, `plp_value`) VALUES
(1, 1, 'PMB__Plugininformationen__version', '5.2.1'),
(2, 1, 'PMB__Plugininformationen__stand', '06.08.2023'),
(3, 1, 'PMB__Altersrollen__altersrollen_token', '((*))'),
(4, 1, 'PMB__Altersrollen__altersrollen_offset', '0'),
(5, 1, 'PMB__Familienrollen__familienrollen_beitrag', '((0))'),
(6, 1, 'PMB__Familienrollen__familienrollen_zeitraum', '((12))'),
(7, 1, 'PMB__Familienrollen__familienrollen_beschreibung', '((Familienbeitrag))'),
(8, 1, 'PMB__Familienrollen__familienrollen_prefix', '((Familie))'),
(9, 1, 'PMB__Familienrollen__familienrollen_pruefung', '(())'),
(10, 1, 'PMB__Beitrag__beitrag_prefix', 'Mitgliedsbeitrag 2019'),
(11, 1, 'PMB__Beitrag__beitrag_suffix', '(ant.)'),
(12, 1, 'PMB__Beitrag__beitrag_textmitnam', '1'),
(13, 1, 'PMB__Beitrag__beitrag_textmitfam', ''),
(14, 1, 'PMB__Beitrag__beitrag_text_token', '#'),
(15, 1, 'PMB__Beitrag__beitrag_anteilig', ''),
(16, 1, 'PMB__Beitrag__beitrag_abrunden', '1'),
(17, 1, 'PMB__Beitrag__beitrag_mindestbetrag', '0'),
(18, 1, 'PMB__Kontodaten__bank', 'Sparkasse Musterstadt'),
(19, 1, 'PMB__Kontodaten__inhaber', 'Musterverein e.V.'),
(20, 1, 'PMB__Kontodaten__iban', 'DE123456789'),
(21, 1, 'PMB__Kontodaten__bic', 'ABCDEFGH'),
(22, 1, 'PMB__Kontodaten__ci', 'DE98ZZZ09999999999'),
(23, 1, 'PMB__Kontodaten__origcreditor', ''),
(24, 1, 'PMB__Kontodaten__origci', ''),
(25, 1, 'PMB__Mandatsreferenz__prefix_fam', 'FAM'),
(26, 1, 'PMB__Mandatsreferenz__prefix_mem', 'MIT'),
(27, 1, 'PMB__Mandatsreferenz__prefix_pay', 'ZAL'),
(28, 1, 'PMB__Mandatsreferenz__min_length', '15'),
(29, 1, 'PMB__Mandatsreferenz__data_field', '-- User_ID --'),
(30, 1, 'PMB__Rollenpruefung__altersrollenfamilienrollen', '(( ))'),
(31, 1, 'PMB__Rollenpruefung__altersrollenpflicht', '(( ))'),
(32, 1, 'PMB__Rollenpruefung__familienrollenpflicht', ''),
(33, 1, 'PMB__Rollenpruefung__fixrollenpflicht', '(( ))'),
(34, 1, 'PMB__Rollenpruefung__bezugskategorie', '(( ))'),
(35, 1, 'PMB__Rollenpruefung__altersrollenaltersrollen', '(( ))'),
(36, 1, 'PMB__Rollenpruefung__familienrollenfix', '(( ))'),
(37, 1, 'PMB__Rollenpruefung__altersrollenfix', '(( ))'),
(38, 1, 'PMB__Rollenpruefung__fixrollenfixrollen', '(( ))'),
(39, 1, 'PMB__Rollenpruefung__age_staggered_roles_exclusion', '(( ))'),
(40, 1, 'PMB__tests_enable__age_staggered_roles', '1'),
(41, 1, 'PMB__tests_enable__role_membership_age_staggered_roles', '1'),
(42, 1, 'PMB__tests_enable__role_membership_duty_and_exclusion', '1'),
(43, 1, 'PMB__tests_enable__family_roles', '1'),
(44, 1, 'PMB__tests_enable__account_details', '1'),
(45, 1, 'PMB__tests_enable__mandate_management', '1'),
(46, 1, 'PMB__tests_enable__iban_check', '1'),
(47, 1, 'PMB__tests_enable__bic_check', '1'),
(48, 1, 'PMB__Rechnungs-Export__rechnung_dateiname', 'rechnung'),
(49, 1, 'PMB__Rechnungs-Export__rechnung_dateityp', 'xlsx'),
(50, 1, 'PMB__SEPA__dateiname', 'sepa'),
(51, 1, 'PMB__SEPA__kontroll_dateiname', 'sepa'),
(52, 1, 'PMB__SEPA__kontroll_dateityp', 'xlsx'),
(53, 1, 'PMB__SEPA__vorabinformation_dateiname', 'export'),
(54, 1, 'PMB__SEPA__vorabinformation_dateityp', 'xlsx'),
(55, 1, 'PMB__columnconfig__payments_fields', '((p21#_#p25#_#p24#_#p22#_#p1#_#p2#_#p9))'),
(56, 1, 'PMB__columnconfig__mandates_fields', '((p27#_#p26#_#p1#_#p2#_#p9))'),
(57, 1, 'PMB__columnconfig__bill_fields', '((p1#_#p2#_#p9))'),
(58, 1, 'PMB__columnconfig__duedates_fields', '((p25#_#p24#_#p22#_#p1#_#p2#_#p9))'),
(59, 1, 'PMB__membernumber__format', ''),
(60, 1, 'PMB__membernumber__fill_gaps', '1'),
(61, 1, 'PMB__access__preferences', '(())'),
(62, 1, 'PMB__individual_contributions__access_to_module', '0'),
(63, 1, 'PMB__individual_contributions__desc', '(( ))'),
(64, 1, 'PMB__individual_contributions__short_desc', '(( ))'),
(65, 1, 'PMB__individual_contributions__role', '(( ))'),
(66, 1, 'PMB__individual_contributions__amount', '(( ))'),
(67, 1, 'PMB__individual_contributions__profilefield', '(( ))'),
(68, 1, 'PMB__multiplier__roles', '(())');

-- --------------------------------------------------------

--
-- Table structure for table `adm_preferences`
--

DROP TABLE IF EXISTS `adm_preferences`;
CREATE TABLE IF NOT EXISTS `adm_preferences` (
  `prf_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `prf_org_id` int(10) UNSIGNED NOT NULL,
  `prf_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `prf_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`prf_id`),
  UNIQUE KEY `adm_idx_prf_org_id_name` (`prf_org_id`,`prf_name`)
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `adm_preferences`
--

INSERT INTO `adm_preferences` (`prf_id`, `prf_org_id`, `prf_name`, `prf_value`) VALUES
(1, 1, 'enable_rss', '1'),
(2, 1, 'enable_auto_login', '1'),
(3, 1, 'default_country', 'DEU'),
(4, 1, 'logout_minutes', '20'),
(5, 1, 'homepage_logout', 'adm_program/overview.php'),
(6, 1, 'homepage_login', 'adm_program/overview.php'),
(7, 1, 'theme', 'simple'),
(8, 1, 'enable_password_recovery', '1'),
(9, 1, 'system_browser_update_check', '1'),
(10, 1, 'system_cookie_note', '1'),
(11, 1, 'system_currency', '€'),
(12, 1, 'system_date', 'd.m.Y'),
(13, 1, 'system_hashing_cost', '11'),
(14, 1, 'system_js_editor_enabled', '1'),
(15, 1, 'system_js_editor_color', '#96c4cb'),
(16, 1, 'system_language', 'en'),
(17, 1, 'system_search_similar', '1'),
(18, 1, 'system_show_create_edit', '1'),
(19, 1, 'system_time', 'H:i'),
(20, 1, 'system_url_imprint', ''),
(21, 1, 'system_url_data_protection', ''),
(22, 1, 'password_min_strength', '1'),
(23, 1, 'email_administrator', 'surinderbhaker@gmail.com'),
(24, 1, 'system_organization_select', '0'),
(25, 1, 'registration_enable_module', '1'),
(26, 1, 'enable_registration_captcha', '0'),
(27, 1, 'enable_registration_admin_mail', '1'),
(28, 1, 'registration_adopt_all_data', '1'),
(29, 1, 'mail_send_method', 'SMTP'),
(30, 1, 'mail_sending_mode', '0'),
(31, 1, 'mail_recipients_with_roles', '2'),
(32, 1, 'mail_number_recipients', '50'),
(33, 1, 'mail_into_to', '1'),
(34, 1, 'mail_character_encoding', 'utf-8'),
(35, 1, 'mail_smtp_host', 'smtp.office365.com'),
(36, 1, 'mail_smtp_auth', '1'),
(37, 1, 'mail_smtp_port', '587'),
(38, 1, 'mail_smtp_secure', 'tls'),
(39, 1, 'mail_smtp_authentication_type', ''),
(40, 1, 'mail_smtp_user', 'surinderpal316@outlook.com'),
(41, 1, 'mail_smtp_password', 'Surinderpal.$$1'),
(42, 1, 'system_notifications_enabled', '1'),
(43, 1, 'system_notifications_role', '1d9dad0a-f535-429f-8d59-1cc60bc73c23'),
(44, 1, 'system_notifications_new_entries', '0'),
(45, 1, 'system_notifications_profile_changes', '0'),
(46, 1, 'captcha_type', 'calc'),
(47, 1, 'captcha_fonts', 'AHGBold.ttf'),
(48, 1, 'captcha_width', '215'),
(49, 1, 'captcha_lines_numbers', '5'),
(50, 1, 'captcha_perturbation', '0.75'),
(51, 1, 'captcha_background_image', ''),
(52, 1, 'captcha_background_color', '#B6D6DB'),
(53, 1, 'captcha_text_color', '#707070'),
(54, 1, 'captcha_line_color', '#707070'),
(55, 1, 'captcha_charset', '23456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghjkmnpqrstuvwxy'),
(56, 1, 'captcha_signature', ''),
(57, 1, 'enable_announcements_module', '1'),
(58, 1, 'announcements_per_page', '10'),
(59, 1, 'members_enable_user_relations', '1'),
(60, 1, 'members_days_field_history', '365'),
(61, 1, 'members_list_configuration', '6'),
(62, 1, 'members_show_all_users', '1'),
(63, 1, 'members_users_per_page', '25'),
(64, 1, 'documents_files_enable_module', '1'),
(65, 1, 'max_file_upload_size', '3'),
(66, 1, 'enable_photo_module', '1'),
(67, 1, 'photo_show_mode', '1'),
(68, 1, 'photo_albums_per_page', '24'),
(69, 1, 'photo_save_scale', '1000'),
(70, 1, 'photo_thumbs_page', '16'),
(71, 1, 'photo_thumbs_scale', '200'),
(72, 1, 'photo_show_width', '1000'),
(73, 1, 'photo_show_height', '750'),
(74, 1, 'photo_image_text', '© localhost'),
(75, 1, 'photo_image_text_size', '40'),
(76, 1, 'photo_keep_original', '0'),
(77, 1, 'photo_download_enabled', '0'),
(78, 1, 'enable_guestbook_module', '0'),
(79, 1, 'guestbook_entries_per_page', '10'),
(80, 1, 'enable_guestbook_captcha', '1'),
(81, 1, 'flooding_protection_time', '60'),
(82, 1, 'enable_gbook_comments4all', '0'),
(83, 1, 'enable_intial_comments_loading', '0'),
(84, 1, 'enable_guestbook_moderation', '0'),
(85, 1, 'groups_roles_default_configuration', '1'),
(86, 1, 'groups_roles_enable_module', '1'),
(87, 1, 'groups_roles_export', '1'),
(88, 1, 'groups_roles_edit_lists', '1'),
(89, 1, 'groups_roles_members_per_page', '25'),
(90, 1, 'groups_roles_show_former_members', '2'),
(91, 1, 'enable_mail_module', '1'),
(92, 1, 'enable_pm_module', '1'),
(93, 1, 'enable_mail_captcha', '1'),
(94, 1, 'mail_delivery_confirmation', '0'),
(95, 1, 'mail_html_registered_users', '1'),
(96, 1, 'mail_max_receiver', '10'),
(97, 1, 'mail_save_attachments', '1'),
(98, 1, 'mail_send_to_all_addresses', '1'),
(99, 1, 'mail_sendmail_address', 'surinderpal316@outlook.com'),
(100, 1, 'mail_sendmail_name', ''),
(101, 1, 'mail_show_former', '1'),
(102, 1, 'mail_template', 'default.html'),
(103, 1, 'max_email_attachment_size', '1'),
(104, 1, 'enable_ecard_module', '1'),
(105, 1, 'ecard_thumbs_scale', '250'),
(106, 1, 'ecard_card_picture_width', '400'),
(107, 1, 'ecard_card_picture_height', '250'),
(108, 1, 'ecard_template', 'postcard.tpl'),
(109, 1, 'profile_log_edit_fields', '1'),
(110, 1, 'profile_show_map_link', '0'),
(111, 1, 'profile_show_roles', '1'),
(112, 1, 'profile_show_former_roles', '1'),
(113, 1, 'profile_show_extern_roles', '1'),
(114, 1, 'profile_photo_storage', '0'),
(115, 1, 'enable_dates_module', '1'),
(116, 1, 'dates_per_page', '10'),
(117, 1, 'dates_view', 'detail'),
(118, 1, 'dates_show_map_link', '1'),
(119, 1, 'dates_show_rooms', '0'),
(120, 1, 'enable_dates_ical', '1'),
(121, 1, 'dates_ical_days_past', '30'),
(122, 1, 'dates_ical_days_future', '365'),
(123, 1, 'dates_default_list_configuration', '5'),
(124, 1, 'dates_save_all_confirmations', '1'),
(125, 1, 'dates_may_take_part', '0'),
(126, 1, 'category_report_enable_module', '1'),
(127, 1, 'category_report_default_configuration', '1'),
(128, 1, 'enable_weblinks_module', '1'),
(129, 1, 'weblinks_per_page', '0'),
(130, 1, 'weblinks_redirect_seconds', '10'),
(131, 1, 'weblinks_target', '_blank');

-- --------------------------------------------------------

--
-- Table structure for table `adm_registrations`
--

DROP TABLE IF EXISTS `adm_registrations`;
CREATE TABLE IF NOT EXISTS `adm_registrations` (
  `reg_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `reg_org_id` int(10) UNSIGNED NOT NULL,
  `reg_usr_id` int(10) UNSIGNED NOT NULL,
  `reg_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`reg_id`),
  KEY `adm_fk_reg_org` (`reg_org_id`),
  KEY `adm_fk_reg_usr` (`reg_usr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `adm_roles`
--

DROP TABLE IF EXISTS `adm_roles`;
CREATE TABLE IF NOT EXISTS `adm_roles` (
  `rol_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `rol_cat_id` int(10) UNSIGNED NOT NULL,
  `rol_lst_id` int(10) UNSIGNED DEFAULT NULL,
  `rol_uuid` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `rol_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `rol_description` varchar(4000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rol_assign_roles` tinyint(1) NOT NULL DEFAULT '0',
  `rol_approve_users` tinyint(1) NOT NULL DEFAULT '0',
  `rol_announcements` tinyint(1) NOT NULL DEFAULT '0',
  `rol_dates` tinyint(1) NOT NULL DEFAULT '0',
  `rol_documents_files` tinyint(1) NOT NULL DEFAULT '0',
  `rol_edit_user` tinyint(1) NOT NULL DEFAULT '0',
  `rol_guestbook` tinyint(1) NOT NULL DEFAULT '0',
  `rol_guestbook_comments` tinyint(1) NOT NULL DEFAULT '0',
  `rol_mail_to_all` tinyint(1) NOT NULL DEFAULT '0',
  `rol_mail_this_role` smallint(6) NOT NULL DEFAULT '0',
  `rol_photo` tinyint(1) NOT NULL DEFAULT '0',
  `rol_profile` tinyint(1) NOT NULL DEFAULT '0',
  `rol_weblinks` tinyint(1) NOT NULL DEFAULT '0',
  `rol_all_lists_view` tinyint(1) NOT NULL DEFAULT '0',
  `rol_default_registration` tinyint(1) NOT NULL DEFAULT '0',
  `rol_leader_rights` smallint(6) NOT NULL DEFAULT '0',
  `rol_view_memberships` smallint(6) NOT NULL DEFAULT '0',
  `rol_view_members_profiles` smallint(6) NOT NULL DEFAULT '0',
  `rol_start_date` date DEFAULT NULL,
  `rol_start_time` time DEFAULT NULL,
  `rol_end_date` date DEFAULT NULL,
  `rol_end_time` time DEFAULT NULL,
  `rol_weekday` smallint(6) DEFAULT NULL,
  `rol_location` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rol_max_members` int(11) DEFAULT NULL,
  `rol_cost` float DEFAULT NULL,
  `rol_cost_period` smallint(6) DEFAULT NULL,
  `rol_usr_id_create` int(10) UNSIGNED DEFAULT NULL,
  `rol_timestamp_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `rol_usr_id_change` int(10) UNSIGNED DEFAULT NULL,
  `rol_timestamp_change` timestamp NULL DEFAULT NULL,
  `rol_valid` tinyint(1) NOT NULL DEFAULT '1',
  `rol_system` tinyint(1) NOT NULL DEFAULT '0',
  `rol_administrator` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rol_id`),
  UNIQUE KEY `adm_idx_rol_uuid` (`rol_uuid`),
  KEY `adm_fk_rol_cat` (`rol_cat_id`),
  KEY `adm_fk_rol_lst_id` (`rol_lst_id`),
  KEY `adm_fk_rol_usr_create` (`rol_usr_id_create`),
  KEY `adm_fk_rol_usr_change` (`rol_usr_id_change`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `adm_roles`
--

INSERT INTO `adm_roles` (`rol_id`, `rol_cat_id`, `rol_lst_id`, `rol_uuid`, `rol_name`, `rol_description`, `rol_assign_roles`, `rol_approve_users`, `rol_announcements`, `rol_dates`, `rol_documents_files`, `rol_edit_user`, `rol_guestbook`, `rol_guestbook_comments`, `rol_mail_to_all`, `rol_mail_this_role`, `rol_photo`, `rol_profile`, `rol_weblinks`, `rol_all_lists_view`, `rol_default_registration`, `rol_leader_rights`, `rol_view_memberships`, `rol_view_members_profiles`, `rol_start_date`, `rol_start_time`, `rol_end_date`, `rol_end_time`, `rol_weekday`, `rol_location`, `rol_max_members`, `rol_cost`, `rol_cost_period`, `rol_usr_id_create`, `rol_timestamp_create`, `rol_usr_id_change`, `rol_timestamp_change`, `rol_valid`, `rol_system`, `rol_administrator`) VALUES
(1, 4, NULL, '1d9dad0a-f535-429f-8d59-1cc60bc73c23', 'Administrator', 'Group of system administrators', 1, 1, 1, 1, 1, 1, 1, 1, 1, 3, 1, 1, 1, 1, 0, 0, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-10-11 10:56:06', NULL, NULL, 1, 0, 1),
(2, 4, NULL, '4479f7f3-426f-450d-9c62-faf65daf8b9c', 'Member', 'All organization members', 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 1, 0, 0, 1, 0, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-10-11 10:56:06', NULL, NULL, 1, 0, 0),
(3, 4, NULL, 'f2255215-93d3-44ae-a56d-facc5dbe7ea5', 'Association&rsquo;s board', 'Administrative board of association', 0, 0, 1, 1, 0, 1, 0, 0, 1, 2, 0, 1, 1, 1, 0, 0, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-10-11 10:56:06', NULL, NULL, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `adm_roles_rights`
--

DROP TABLE IF EXISTS `adm_roles_rights`;
CREATE TABLE IF NOT EXISTS `adm_roles_rights` (
  `ror_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ror_name_intern` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ror_table` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ror_ror_id_parent` int(10) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`ror_id`),
  KEY `adm_fk_ror_ror_parent` (`ror_ror_id_parent`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `adm_roles_rights`
--

INSERT INTO `adm_roles_rights` (`ror_id`, `ror_name_intern`, `ror_table`, `ror_ror_id_parent`) VALUES
(1, 'folder_view', 'adm_folders', NULL),
(2, 'folder_upload', 'adm_folders', NULL),
(3, 'category_view', 'adm_categories', NULL),
(4, 'event_participation', 'adm_dates', NULL),
(5, 'menu_view', 'adm_menu', NULL),
(6, 'category_edit', 'adm_categories', 3);

-- --------------------------------------------------------

--
-- Table structure for table `adm_roles_rights_data`
--

DROP TABLE IF EXISTS `adm_roles_rights_data`;
CREATE TABLE IF NOT EXISTS `adm_roles_rights_data` (
  `rrd_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `rrd_ror_id` int(10) UNSIGNED NOT NULL,
  `rrd_rol_id` int(10) UNSIGNED NOT NULL,
  `rrd_object_id` int(10) UNSIGNED NOT NULL,
  `rrd_usr_id_create` int(10) UNSIGNED DEFAULT NULL,
  `rrd_timestamp_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`rrd_id`),
  UNIQUE KEY `adm_idx_rrd_ror_rol_object_id` (`rrd_ror_id`,`rrd_rol_id`,`rrd_object_id`),
  KEY `adm_fk_rrd_rol` (`rrd_rol_id`),
  KEY `adm_fk_rrd_usr_create` (`rrd_usr_id_create`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `adm_role_dependencies`
--

DROP TABLE IF EXISTS `adm_role_dependencies`;
CREATE TABLE IF NOT EXISTS `adm_role_dependencies` (
  `rld_rol_id_parent` int(10) UNSIGNED NOT NULL,
  `rld_rol_id_child` int(10) UNSIGNED NOT NULL,
  `rld_comment` text COLLATE utf8_unicode_ci,
  `rld_usr_id` int(10) UNSIGNED DEFAULT NULL,
  `rld_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`rld_rol_id_parent`,`rld_rol_id_child`),
  KEY `adm_fk_rld_rol_child` (`rld_rol_id_child`),
  KEY `adm_fk_rld_usr` (`rld_usr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `adm_rooms`
--

DROP TABLE IF EXISTS `adm_rooms`;
CREATE TABLE IF NOT EXISTS `adm_rooms` (
  `room_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `room_uuid` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `room_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `room_description` text COLLATE utf8_unicode_ci,
  `room_capacity` int(11) NOT NULL,
  `room_overhang` int(11) DEFAULT NULL,
  `room_usr_id_create` int(10) UNSIGNED DEFAULT NULL,
  `room_timestamp_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `room_usr_id_change` int(10) UNSIGNED DEFAULT NULL,
  `room_timestamp_change` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`room_id`),
  UNIQUE KEY `adm_idx_room_uuid` (`room_uuid`),
  KEY `adm_fk_room_usr_create` (`room_usr_id_create`),
  KEY `adm_fk_room_usr_change` (`room_usr_id_change`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `adm_rooms`
--

INSERT INTO `adm_rooms` (`room_id`, `room_uuid`, `room_name`, `room_description`, `room_capacity`, `room_overhang`, `room_usr_id_create`, `room_timestamp_create`, `room_usr_id_change`, `room_timestamp_change`) VALUES
(1, '30fe3e7b-0e31-455a-beb0-442cfdc20868', 'Conference room', 'Meetings can take place here. Room has to be reserved before. Beamer is free for use.', 15, NULL, 1, '2023-10-11 10:56:06', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `adm_sessions`
--

DROP TABLE IF EXISTS `adm_sessions`;
CREATE TABLE IF NOT EXISTS `adm_sessions` (
  `ses_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ses_usr_id` int(10) UNSIGNED DEFAULT NULL,
  `ses_org_id` int(10) UNSIGNED NOT NULL,
  `ses_session_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ses_begin` timestamp NULL DEFAULT NULL,
  `ses_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ses_ip_address` varchar(39) COLLATE utf8_unicode_ci NOT NULL,
  `ses_binary` blob,
  `ses_reload` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ses_id`),
  KEY `adm_idx_session_id` (`ses_session_id`),
  KEY `adm_fk_ses_org` (`ses_org_id`),
  KEY `adm_fk_ses_usr` (`ses_usr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `adm_sessions`
--

INSERT INTO `adm_sessions` (`ses_id`, `ses_usr_id`, `ses_org_id`, `ses_session_id`, `ses_begin`, `ses_timestamp`, `ses_ip_address`, `ses_binary`, `ses_reload`) VALUES
(19, 2, 1, '2jmml29sitq9f787vnaubj1n9c', '2023-10-30 06:56:30', '2023-10-30 08:04:49', ':XXXX:XXXX', NULL, 0),
(21, 2, 1, '1udo4g0br2l01j255ldid9tjqc', '2023-10-30 08:00:11', '2023-10-30 08:03:39', ':XXXX:XXXX', NULL, 0),
(22, 2, 1, '6eqmjblpe4lg8hgn12cuqf5sbg', '2023-10-30 08:05:49', '2023-10-30 08:16:37', ':XXXX:XXXX', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `adm_texts`
--

DROP TABLE IF EXISTS `adm_texts`;
CREATE TABLE IF NOT EXISTS `adm_texts` (
  `txt_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `txt_org_id` int(10) UNSIGNED NOT NULL,
  `txt_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `txt_text` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`txt_id`),
  KEY `adm_fk_txt_org` (`txt_org_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `adm_texts`
--

INSERT INTO `adm_texts` (`txt_id`, `txt_org_id`, `txt_name`, `txt_text`) VALUES
(1, 1, 'SYSMAIL_REGISTRATION_USER', '#subject# Registration at #organization_long_name# confirmed\r\n#content# Hello #user_first_name#,\r\n\r\nyour registration on #organization_homepage# has been confirmed.\r\n\r\nYou can now log in to the homepage with your username #user_login_name# and your password.\r\n\r\nIf you have any questions, write an email to #administrator_email#.\r\n\r\nCheers,\r\nThe administrators'),
(2, 1, 'SYSMAIL_REGISTRATION_WEBMASTER', '#subject# New registration at #organization_long_name# website\r\n#content# A new user has registered on #organization_homepage#.\r\n\r\nSurname: #user_last_name#\r\nFirst Name: #user_first_name#\r\nE-Mail: #user_email#\r\n\r\n\r\nThis message was generated automatically.'),
(3, 1, 'SYSMAIL_REFUSE_REGISTRATION', '#subject# in registration at #organization_long_name# rejected.\r\n#content#Hello #user_first_name#,\r\n\r\nyour registration at #organization_homepage# was rejected.\r\n\r\nRegistrations are accepted in general by our users. If you are a member and your registration was still rejected, it may be because you were not identified as member.\r\nTo clarify the reasons for the rejection please contact the administrator #administrator_email# from #organization_homepage#.\r\n\r\nRegards,\r\nThe administrators'),
(4, 1, 'SYSMAIL_NEW_PASSWORD', '#subject# Login data for #organization_long_name#\r\n#content# Hello #user_first_name#,\r\n\r\nYou receive your login data for the website #organization_homepage#.\r\nUsername: #user_login_name#\r\nPassword: #variable1#\r\n\r\nThe password was generated automatically,\r\nYou should change it after logging in to #organization_homepage# in your profile.\r\n\r\nCheers,\r\nThe administrators'),
(5, 1, 'SYSMAIL_PASSWORD_RESET', '#subject# Reset password for #organization_long_name#\r\n#content# Hello #user_first_name#,\r\n\r\nWe have received a request to reset your password on #organization_homepage#.\r\n\r\nIf the request came from you, you can use the following link to reset your password and set a new one: \r\n#variable1#\r\n\r\nBest regards\r\nThe administrators');

-- --------------------------------------------------------

--
-- Table structure for table `adm_users`
--

DROP TABLE IF EXISTS `adm_users`;
CREATE TABLE IF NOT EXISTS `adm_users` (
  `usr_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `usr_uuid` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `usr_login_name` varchar(254) COLLATE utf8_unicode_ci DEFAULT NULL,
  `usr_password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `usr_photo` blob,
  `usr_text` text COLLATE utf8_unicode_ci,
  `usr_pw_reset_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `usr_pw_reset_timestamp` timestamp NULL DEFAULT NULL,
  `usr_last_login` timestamp NULL DEFAULT NULL,
  `usr_actual_login` timestamp NULL DEFAULT NULL,
  `usr_number_login` int(11) NOT NULL DEFAULT '0',
  `usr_date_invalid` timestamp NULL DEFAULT NULL,
  `usr_number_invalid` smallint(6) NOT NULL DEFAULT '0',
  `usr_usr_id_create` int(10) UNSIGNED DEFAULT NULL,
  `usr_timestamp_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usr_usr_id_change` int(10) UNSIGNED DEFAULT NULL,
  `usr_timestamp_change` timestamp NULL DEFAULT NULL,
  `usr_valid` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`usr_id`),
  UNIQUE KEY `adm_idx_usr_uuid` (`usr_uuid`),
  UNIQUE KEY `adm_idx_usr_login_name` (`usr_login_name`),
  KEY `adm_fk_usr_usr_create` (`usr_usr_id_create`),
  KEY `adm_fk_usr_usr_change` (`usr_usr_id_change`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `adm_users`
--

INSERT INTO `adm_users` (`usr_id`, `usr_uuid`, `usr_login_name`, `usr_password`, `usr_photo`, `usr_text`, `usr_pw_reset_id`, `usr_pw_reset_timestamp`, `usr_last_login`, `usr_actual_login`, `usr_number_login`, `usr_date_invalid`, `usr_number_invalid`, `usr_usr_id_create`, `usr_timestamp_create`, `usr_usr_id_change`, `usr_timestamp_change`, `usr_valid`) VALUES
(1, '9e2dd638-84b9-48d7-a4ec-7c335e0f5de1', 'System', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, '2023-10-11 10:56:06', NULL, NULL, 0),
(2, '94efbc48-dea9-4504-943e-2dcb28405e7e', 'surinder', '$2y$11$JaDIpYCCvhBIU5Qe8I1ICOHAjm1Cer1fa1jIrkKufoixLM3ysqRcG', NULL, NULL, NULL, NULL, '2023-10-30 08:12:21', '2023-10-30 08:16:12', 125, NULL, 0, 1, '2023-10-11 10:56:06', NULL, NULL, 1),
(3, '0b902250-1343-4ed6-a5bb-61e88aea7221', 'varinder', '$2y$11$p1/FapqM7OeUcB864gxFBe2jou7iZvh60U4DRPcfOGLCTuq0X2WC6', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-10-30 08:16:02', 3, 2, '2023-10-11 11:18:10', 2, '2023-10-20 10:10:07', 1),
(4, 'e447bbf4-ee26-4750-a240-56dad4b11156', 'yash', '$2y$11$CD7ceh3ehdj5qj34OrE/x.CAX.VdwmvVH36dCF9lLpejyaOv5uR/e', NULL, NULL, NULL, NULL, NULL, '2023-10-19 12:17:20', 1, '2023-10-20 09:07:32', 1, 2, '2023-10-19 12:15:40', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `adm_user_data`
--

DROP TABLE IF EXISTS `adm_user_data`;
CREATE TABLE IF NOT EXISTS `adm_user_data` (
  `usd_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `usd_usr_id` int(10) UNSIGNED NOT NULL,
  `usd_usf_id` int(10) UNSIGNED NOT NULL,
  `usd_value` varchar(4000) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`usd_id`),
  UNIQUE KEY `adm_idx_usd_usr_usf_id` (`usd_usr_id`,`usd_usf_id`),
  KEY `adm_fk_usd_usf` (`usd_usf_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `adm_user_data`
--

INSERT INTO `adm_user_data` (`usd_id`, `usd_usr_id`, `usd_usf_id`, `usd_value`) VALUES
(1, 2, 1, 'singh'),
(2, 2, 2, 'surinderpal'),
(3, 2, 11, 'surinderbhaker@gmail.com'),
(4, 1, 1, 'System'),
(5, 3, 1, 'singh'),
(6, 3, 2, 'varinder'),
(7, 3, 6, 'DEU'),
(8, 3, 13, '1'),
(12, 3, 11, 'sunny09052000singh@gmail.com'),
(13, 4, 1, 'singh'),
(14, 4, 2, 'yash'),
(15, 4, 6, 'DEU');

-- --------------------------------------------------------

--
-- Table structure for table `adm_user_fields`
--

DROP TABLE IF EXISTS `adm_user_fields`;
CREATE TABLE IF NOT EXISTS `adm_user_fields` (
  `usf_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `usf_cat_id` int(10) UNSIGNED NOT NULL,
  `usf_uuid` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `usf_type` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `usf_name_intern` varchar(110) COLLATE utf8_unicode_ci NOT NULL,
  `usf_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `usf_description` text COLLATE utf8_unicode_ci,
  `usf_description_inline` tinyint(1) NOT NULL DEFAULT '0',
  `usf_value_list` text COLLATE utf8_unicode_ci,
  `usf_default_value` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `usf_regex` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `usf_icon` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `usf_url` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `usf_system` tinyint(1) NOT NULL DEFAULT '0',
  `usf_disabled` tinyint(1) NOT NULL DEFAULT '0',
  `usf_hidden` tinyint(1) NOT NULL DEFAULT '0',
  `usf_registration` tinyint(1) NOT NULL DEFAULT '0',
  `usf_required_input` smallint(6) NOT NULL DEFAULT '0',
  `usf_sequence` smallint(6) NOT NULL,
  `usf_usr_id_create` int(10) UNSIGNED DEFAULT NULL,
  `usf_timestamp_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usf_usr_id_change` int(10) UNSIGNED DEFAULT NULL,
  `usf_timestamp_change` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`usf_id`),
  UNIQUE KEY `adm_idx_usf_name_intern` (`usf_name_intern`),
  UNIQUE KEY `adm_idx_usf_uuid` (`usf_uuid`),
  KEY `adm_fk_usf_cat` (`usf_cat_id`),
  KEY `adm_fk_usf_usr_create` (`usf_usr_id_create`),
  KEY `adm_fk_usf_usr_change` (`usf_usr_id_change`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `adm_user_fields`
--

INSERT INTO `adm_user_fields` (`usf_id`, `usf_cat_id`, `usf_uuid`, `usf_type`, `usf_name_intern`, `usf_name`, `usf_description`, `usf_description_inline`, `usf_value_list`, `usf_default_value`, `usf_regex`, `usf_icon`, `usf_url`, `usf_system`, `usf_disabled`, `usf_hidden`, `usf_registration`, `usf_required_input`, `usf_sequence`, `usf_usr_id_create`, `usf_timestamp_create`, `usf_usr_id_change`, `usf_timestamp_change`) VALUES
(1, 1, '934545e8-7bc1-4aff-a97e-7912adcf95c6', 'TEXT', 'LAST_NAME', 'SYS_LASTNAME', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 1, 1, 1, 1, '2023-10-11 10:56:06', NULL, NULL),
(2, 1, '642469f9-1017-45c9-8e8e-1ead0c896ce7', 'TEXT', 'FIRST_NAME', 'SYS_FIRSTNAME', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 1, 1, 2, 1, '2023-10-11 10:56:06', NULL, NULL),
(3, 1, 'ae6e760e-4cd2-41a5-8a1b-4436e0eef31e', 'TEXT', 'STREET', 'SYS_STREET', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 3, 1, '2023-10-11 10:56:06', NULL, NULL),
(4, 1, '8281b1fd-f71f-423b-bb2d-e0951cddb3a7', 'TEXT', 'POSTCODE', 'SYS_POSTCODE', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 4, 1, '2023-10-11 10:56:06', NULL, NULL),
(5, 1, '015956e1-5145-4320-ac68-b133e4bd45d1', 'TEXT', 'CITY', 'SYS_CITY', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 5, 1, '2023-10-11 10:56:06', NULL, NULL),
(6, 1, '6084e4a8-520c-4287-b9db-62c0754b9689', 'TEXT', 'COUNTRY', 'SYS_COUNTRY', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 6, 1, '2023-10-11 10:56:06', NULL, NULL),
(7, 1, 'a58a2aa3-f73f-40a2-b16e-1a9007f14486', 'PHONE', 'PHONE', 'SYS_PHONE', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 7, 1, '2023-10-11 10:56:06', NULL, NULL),
(8, 1, '06f969c4-cbef-43ac-8b90-50c165b92575', 'PHONE', 'MOBILE', 'SYS_MOBILE', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 8, 1, '2023-10-11 10:56:06', NULL, NULL),
(9, 1, '9bc74c43-440d-424c-b561-3d309dc48b7a', 'DATE', 'BIRTHDAY', 'SYS_BIRTHDAY', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 10, 1, '2023-10-11 10:56:06', NULL, NULL),
(10, 1, '05e19b08-912c-499a-8e9a-7c61d4d0c010', 'RADIO_BUTTON', 'GENDER', 'SYS_GENDER', NULL, 0, 'fa-mars|SYS_MALE\nfa-venus|SYS_FEMALE\nfa-mars-stroke-v|SYS_DIVERSE', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 11, 1, '2023-10-11 10:56:06', NULL, NULL),
(11, 1, 'f0d61d14-a2c3-4310-95aa-cd5d5acef1d4', 'EMAIL', 'EMAIL', 'SYS_EMAIL', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 2, 12, 1, '2023-10-11 10:56:06', NULL, NULL),
(12, 1, '0b869a22-895f-41d9-8f0a-8d337ba200ce', 'URL', 'WEBSITE', 'SYS_WEBSITE', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 13, 1, '2023-10-11 10:56:06', NULL, NULL),
(13, 3, '286fcd90-7390-478a-abcf-2399db1fe412', 'CHECKBOX', 'DATA_PROTECTION_PERMISSION', 'SYS_DATA_PROTECTION_PERMISSION', 'I have read the information provided by the organization. As far as the personal data provided by me are not necessary data for the fulfillment of the contract, I declare my consent to the processing of these data. My data will be stored exclusively for the purposes of the organization and treated confidentially.', 1, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 2, 14, 1, '2023-10-11 10:56:06', NULL, NULL),
(14, 2, '152ff1df-9c8e-4cd0-ba4a-2d071c81f7b3', 'TEXT', 'FACEBOOK', 'INS_FACEBOOK', 'Would you like to set a link to your Facebook profile? Your Facebook login name is required. Log in to your Facebook account and display your profile. Copy URL in this field and save your profile here. Visitors of your profile are now able to open your Facebook profile directly.', 0, NULL, NULL, NULL, 'fab fa-facebook', 'https://www.facebook.com/#user_content#', 0, 0, 0, 0, 0, 1, 1, '2023-10-11 10:56:06', NULL, NULL),
(15, 2, '2c94b71f-c48c-4bac-a5f1-58556dc3300d', 'TEXT', 'ICQ', 'INS_ICQ', 'Enter your ICQ number here. If your status can be shown on the web (enabled in Skype), it will be displayed in your profile.', 0, NULL, NULL, NULL, 'icq.png', 'https://www.icq.com/people/#user_content#', 0, 0, 0, 0, 0, 2, 1, '2023-10-11 10:56:06', NULL, NULL),
(16, 2, '12ab4e2e-7b11-4ebd-885f-a9b151944038', 'TEXT', 'SKYPE', 'INS_SKYPE', 'Enter your exact Skype name here. If your status can be shown on the web (enabled in ICQ), it will be displayed in your profile.', 0, NULL, NULL, NULL, 'fab fa-skype', NULL, 0, 0, 0, 0, 0, 3, 1, '2023-10-11 10:56:06', NULL, NULL),
(17, 2, '9de6c1d1-09e2-4c79-b4c1-61cc390db9fe', 'TEXT', 'TWITTER', 'INS_TWITTER', 'Would you like to set a link to your Twitter profile? Your Twitter login name is required. Log in to your Twitter account and display your profile. Copy URL in this field and save your profile here. Visitors of your profile are now able to open your Twitter profile directly.', 0, NULL, NULL, NULL, 'fab fa-twitter', 'https://twitter.com/#user_content#', 0, 0, 0, 0, 0, 4, 1, '2023-10-11 10:56:06', NULL, NULL),
(18, 2, '1bc06659-a94b-470f-954a-750e11675696', 'TEXT', 'XING', 'INS_XING', 'Would you like to set a link to your Xing profile? Your Xing login name is required. Log in to your Xing account and display your profile. Copy URL in this field and save your profile here. Visitors of your profile are now able to open your Xing profile directly.', 0, NULL, NULL, NULL, 'fab fa-xing', 'https://www.xing.com/profile/#user_content#', 0, 0, 0, 0, 0, 5, 1, '2023-10-11 10:56:06', NULL, NULL),
(19, 16, 'd491be94-dc02-491c-92ae-dae70bac52fd', 'TEXT', 'MEMBERNUMBER1', 'PMB_MEMBERNUMBER', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 2, '2023-10-17 12:22:40', NULL, NULL),
(20, 16, '7426fac6-51e9-4fda-967a-91e1fd0aeb1d', 'DATE', 'ACCESSION1', 'PMB_ACCESSION', 'Das Beitrittsdatum zum Verein', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 0, 0, 2, 2, '2023-10-17 12:22:40', NULL, NULL),
(21, 17, 'd511ffc3-89f3-46ce-95b1-f114eb70d3d1', 'DATE', 'PAID1', 'PMB_PAID', 'Datumsangabe, ob und wann der Beitrag bezahlt wurde', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 2, '2023-10-17 12:22:40', NULL, NULL),
(22, 17, '34b72fb6-4263-468c-ac0a-9d8ff795d32d', 'DECIMAL', 'FEE1', 'PMB_FEE', 'Der errechnete Mitgliedsbeitrag', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 0, 0, 2, 2, '2023-10-17 12:22:40', NULL, NULL),
(23, 17, '6a12d485-cff2-4015-9f5e-9953cafe9ba0', 'TEXT', 'CONTRIBUTORY_TEXT1', 'PMB_CONTRIBUTORY_TEXT', 'Verwendungszweck', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 0, 0, 3, 2, '2023-10-17 12:22:40', NULL, NULL),
(24, 17, 'e72c3bc2-8729-4635-9ff0-a7ba42ac1c3a', 'TEXT', 'SEQUENCETYPE1', 'PMB_SEQUENCETYPE', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 0, 0, 4, 2, '2023-10-17 12:22:40', NULL, NULL),
(25, 17, '763e8928-31a6-4168-ab2d-2b990185febd', 'DATE', 'DUEDATE1', 'PMB_DUEDATE', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 0, 0, 5, 2, '2023-10-17 12:22:40', NULL, NULL),
(26, 18, '21f03aec-aac9-44c8-b9c8-44369d9760ef', 'TEXT', 'MANDATEID1', 'PMB_MANDATEID', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 2, '2023-10-17 12:22:40', NULL, NULL),
(27, 18, '4c877816-66ff-426e-be0d-83882d6405c1', 'DATE', 'MANDATEDATE1', 'PMB_MANDATEDATE', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 0, 0, 2, 2, '2023-10-17 12:22:40', NULL, NULL),
(28, 18, '49bab827-8791-4e21-8c86-ed3ac224207b', 'TEXT', 'ORIG_MANDATEID1', 'PMB_ORIG_MANDATEID', 'Wird durch das Modul Mandatsänderung automatisch befüllt.', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 0, 0, 3, 2, '2023-10-17 12:22:40', NULL, NULL),
(29, 19, 'b7e377fb-0eb2-4068-b27c-a6d9693f2d0b', 'TEXT', 'IBAN', 'PMB_IBAN', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 0, 0, 1, 2, '2023-10-17 12:22:40', NULL, NULL),
(30, 19, '548d3e5d-74d2-4fd0-9eae-ead4bbcf3f87', 'TEXT', 'BIC', 'PMB_BIC', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 0, 0, 2, 2, '2023-10-17 12:22:40', NULL, NULL),
(31, 19, '5c16caac-b018-4837-8e0a-5291145772b2', 'TEXT', 'BANK', 'PMB_BANK', 'Der Name der Bank für den Bankeinzug', 0, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 0, 0, 3, 2, '2023-10-17 12:22:40', NULL, NULL),
(32, 19, '1735b158-4198-411f-ba51-eac9d51212af', 'TEXT', 'DEBTOR', 'PMB_DEBTOR', '<p>Inhaber der angegebenen Bankverbindung.</p><p>Ein Eintrag ist nur erforderlich, wenn der Inhaber der Bankverbindung und das Mitglied nicht identisch sind. Wenn das Feld belegt ist, dann müssen KtoInh-Straße, KtoInh-PLZ und KtoInh-Ort ausgefüllt sein.</p>', 0, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 0, 0, 4, 2, '2023-10-17 12:22:40', NULL, NULL),
(33, 19, 'e405fe20-adae-40c4-a378-c2c0e726ebed', 'TEXT', 'DEBTOR_STREET', 'PMB_DEBTOR_STREET', 'Adresse des Kontoinhabers.Eine Angabe ist zwingend erforderlich, wenn der Inhaber der Bankverbindung und das Mitglied nicht identisch sind.', 0, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 0, 0, 5, 2, '2023-10-17 12:22:40', NULL, NULL),
(34, 19, 'd706f966-67a9-49f3-a061-fec8f6f90633', 'TEXT', 'DEBTOR_POSTCODE', 'PMB_DEBTOR_POSTCODE', 'PLZ des Kontoinhabers.Eine Angabe ist zwingend erforderlich, wenn der Inhaber der Bankverbindung und das Mitglied nicht identisch sind.', 0, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 0, 0, 6, 2, '2023-10-17 12:22:40', NULL, NULL),
(35, 19, 'abf1e3e5-6f9f-4e91-9105-666b5134a919', 'TEXT', 'DEBTOR_CITY', 'PMB_DEBTOR_CITY', 'Wohnort des Kontoinhabers.Eine Angabe ist zwingend erforderlich, wenn der Inhaber der Bankverbindung und das Mitglied nicht identisch sind.', 0, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 0, 0, 7, 2, '2023-10-17 12:22:40', NULL, NULL),
(36, 19, 'd94b3904-8c69-4035-afb9-22b040c61a9b', 'TEXT', 'DEBTOR_EMAIL', 'PMB_DEBTOR_EMAIL', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 0, 0, 8, 2, '2023-10-17 12:22:40', NULL, NULL),
(37, 19, 'a7f89486-d96c-49c3-977b-2e0b8ca93b76', 'TEXT', 'ORIG_DEBTOR_AGENT', 'PMB_ORIG_DEBTOR_AGENT', 'Wird durch das Modul Mandatsänderung automatisch befüllt.', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 0, 0, 9, 2, '2023-10-17 12:22:40', NULL, NULL),
(38, 19, 'fc2c5285-1f89-4d23-812a-cf3844d110db', 'TEXT', 'ORIG_IBAN', 'PMB_ORIG_IBAN', 'Wird durch das Modul Mandatsänderung automatisch befüllt.', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 0, 0, 10, 2, '2023-10-17 12:22:40', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `adm_user_log`
--

DROP TABLE IF EXISTS `adm_user_log`;
CREATE TABLE IF NOT EXISTS `adm_user_log` (
  `usl_id` int(11) NOT NULL AUTO_INCREMENT,
  `usl_usr_id` int(10) UNSIGNED NOT NULL,
  `usl_usf_id` int(10) UNSIGNED NOT NULL,
  `usl_value_old` varchar(4000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `usl_value_new` varchar(4000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `usl_usr_id_create` int(10) UNSIGNED DEFAULT NULL,
  `usl_timestamp_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usl_comment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`usl_id`),
  KEY `adm_fk_user_log_1` (`usl_usr_id`),
  KEY `adm_fk_user_log_2` (`usl_usr_id_create`),
  KEY `adm_fk_user_log_3` (`usl_usf_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `adm_user_log`
--

INSERT INTO `adm_user_log` (`usl_id`, `usl_usr_id`, `usl_usf_id`, `usl_value_old`, `usl_value_new`, `usl_usr_id_create`, `usl_timestamp_create`, `usl_comment`) VALUES
(1, 3, 1, NULL, 'singh', 2, '2023-10-11 11:18:10', NULL),
(2, 3, 2, NULL, 'varinder', 2, '2023-10-11 11:18:10', NULL),
(3, 3, 6, NULL, 'DEU', 2, '2023-10-11 11:18:10', NULL),
(4, 3, 13, NULL, '1', 2, '2023-10-11 11:18:10', NULL),
(5, 3, 11, NULL, 'sunny09052000singh@gmail.com', 2, '2023-10-17 11:11:21', NULL),
(6, 4, 1, NULL, 'singh', 2, '2023-10-19 12:15:40', NULL),
(7, 4, 2, NULL, 'yash', 2, '2023-10-19 12:15:40', NULL),
(8, 4, 6, NULL, 'DEU', 2, '2023-10-19 12:15:40', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `adm_user_relations`
--

DROP TABLE IF EXISTS `adm_user_relations`;
CREATE TABLE IF NOT EXISTS `adm_user_relations` (
  `ure_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ure_urt_id` int(10) UNSIGNED NOT NULL,
  `ure_usr_id1` int(10) UNSIGNED NOT NULL,
  `ure_usr_id2` int(10) UNSIGNED NOT NULL,
  `ure_usr_id_create` int(10) UNSIGNED DEFAULT NULL,
  `ure_timestamp_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ure_usr_id_change` int(10) UNSIGNED DEFAULT NULL,
  `ure_timestamp_change` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ure_id`),
  UNIQUE KEY `adm_idx_ure_urt_usr` (`ure_urt_id`,`ure_usr_id1`,`ure_usr_id2`),
  KEY `adm_fk_ure_usr1` (`ure_usr_id1`),
  KEY `adm_fk_ure_usr2` (`ure_usr_id2`),
  KEY `adm_fk_ure_usr_change` (`ure_usr_id_change`),
  KEY `adm_fk_ure_usr_create` (`ure_usr_id_create`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `adm_user_relation_types`
--

DROP TABLE IF EXISTS `adm_user_relation_types`;
CREATE TABLE IF NOT EXISTS `adm_user_relation_types` (
  `urt_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `urt_uuid` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `urt_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `urt_name_male` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `urt_name_female` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `urt_edit_user` tinyint(1) NOT NULL DEFAULT '0',
  `urt_id_inverse` int(10) UNSIGNED DEFAULT NULL,
  `urt_usr_id_create` int(10) UNSIGNED DEFAULT NULL,
  `urt_timestamp_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `urt_usr_id_change` int(10) UNSIGNED DEFAULT NULL,
  `urt_timestamp_change` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`urt_id`),
  UNIQUE KEY `adm_idx_ure_urt_name` (`urt_name`),
  UNIQUE KEY `adm_idx_urt_uuid` (`urt_uuid`),
  KEY `adm_fk_urt_id_inverse` (`urt_id_inverse`),
  KEY `adm_fk_urt_usr_change` (`urt_usr_id_change`),
  KEY `adm_fk_urt_usr_create` (`urt_usr_id_create`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `adm_user_relation_types`
--

INSERT INTO `adm_user_relation_types` (`urt_id`, `urt_uuid`, `urt_name`, `urt_name_male`, `urt_name_female`, `urt_edit_user`, `urt_id_inverse`, `urt_usr_id_create`, `urt_timestamp_create`, `urt_usr_id_change`, `urt_timestamp_change`) VALUES
(1, '3431423f-70ee-4740-893e-dfde5dd3600e', 'Parent', 'Father', 'Mother', 0, 2, 1, '2023-10-11 10:56:06', NULL, NULL),
(2, '3ae60601-5a9b-4208-80f2-1940bf752f20', 'Child', 'Son', 'Daughter', 0, 1, 1, '2023-10-11 10:56:06', NULL, NULL),
(3, 'eeaf54d3-b2be-493b-936c-a6e803fe42f5', 'Sibling', 'Brother', 'Sister', 0, 3, 1, '2023-10-11 10:56:06', NULL, NULL),
(4, 'd29b3c31-19a8-492d-b8a0-86be68154f4a', 'Spouse', 'Husband', 'Wife', 0, 4, 1, '2023-10-11 10:56:06', NULL, NULL),
(5, '14d703ab-7c9c-4efb-8583-b004b5ef42e2', 'Partner', 'Partner', 'Partner', 0, 5, 1, '2023-10-11 10:56:06', NULL, NULL),
(6, '0223ae69-649b-4e30-a407-570c1544c0bb', 'Friend', 'Friend', 'Girlfriend', 0, 6, 1, '2023-10-11 10:56:06', NULL, NULL),
(7, '49e5cd15-e4f0-4404-b729-b770969500d0', 'Boss', 'Boss', 'Female superior', 0, 8, 1, '2023-10-11 10:56:06', NULL, NULL),
(8, 'd5630b3e-528d-4d5c-a0b1-20ae1098e696', 'Subordinate', 'Male subordinate', 'Female subordinate', 0, 7, 1, '2023-10-11 10:56:06', NULL, NULL);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `adm_announcements`
--
ALTER TABLE `adm_announcements`
  ADD CONSTRAINT `adm_fk_ann_cat` FOREIGN KEY (`ann_cat_id`) REFERENCES `adm_categories` (`cat_id`),
  ADD CONSTRAINT `adm_fk_ann_usr_change` FOREIGN KEY (`ann_usr_id_change`) REFERENCES `adm_users` (`usr_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `adm_fk_ann_usr_create` FOREIGN KEY (`ann_usr_id_create`) REFERENCES `adm_users` (`usr_id`) ON DELETE SET NULL;

--
-- Constraints for table `adm_auto_login`
--
ALTER TABLE `adm_auto_login`
  ADD CONSTRAINT `adm_fk_atl_org` FOREIGN KEY (`atl_org_id`) REFERENCES `adm_organizations` (`org_id`),
  ADD CONSTRAINT `adm_fk_atl_usr` FOREIGN KEY (`atl_usr_id`) REFERENCES `adm_users` (`usr_id`);

--
-- Constraints for table `adm_categories`
--
ALTER TABLE `adm_categories`
  ADD CONSTRAINT `adm_fk_cat_org` FOREIGN KEY (`cat_org_id`) REFERENCES `adm_organizations` (`org_id`),
  ADD CONSTRAINT `adm_fk_cat_usr_change` FOREIGN KEY (`cat_usr_id_change`) REFERENCES `adm_users` (`usr_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `adm_fk_cat_usr_create` FOREIGN KEY (`cat_usr_id_create`) REFERENCES `adm_users` (`usr_id`) ON DELETE SET NULL;

--
-- Constraints for table `adm_category_report`
--
ALTER TABLE `adm_category_report`
  ADD CONSTRAINT `adm_fk_crt_org` FOREIGN KEY (`crt_org_id`) REFERENCES `adm_organizations` (`org_id`);

--
-- Constraints for table `adm_dates`
--
ALTER TABLE `adm_dates`
  ADD CONSTRAINT `adm_fk_dat_cat` FOREIGN KEY (`dat_cat_id`) REFERENCES `adm_categories` (`cat_id`),
  ADD CONSTRAINT `adm_fk_dat_rol` FOREIGN KEY (`dat_rol_id`) REFERENCES `adm_roles` (`rol_id`),
  ADD CONSTRAINT `adm_fk_dat_room` FOREIGN KEY (`dat_room_id`) REFERENCES `adm_rooms` (`room_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `adm_fk_dat_usr_change` FOREIGN KEY (`dat_usr_id_change`) REFERENCES `adm_users` (`usr_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `adm_fk_dat_usr_create` FOREIGN KEY (`dat_usr_id_create`) REFERENCES `adm_users` (`usr_id`) ON DELETE SET NULL;

--
-- Constraints for table `adm_files`
--
ALTER TABLE `adm_files`
  ADD CONSTRAINT `adm_fk_fil_fol` FOREIGN KEY (`fil_fol_id`) REFERENCES `adm_folders` (`fol_id`),
  ADD CONSTRAINT `adm_fk_fil_usr` FOREIGN KEY (`fil_usr_id`) REFERENCES `adm_users` (`usr_id`) ON DELETE SET NULL;

--
-- Constraints for table `adm_folders`
--
ALTER TABLE `adm_folders`
  ADD CONSTRAINT `adm_fk_fol_fol_parent` FOREIGN KEY (`fol_fol_id_parent`) REFERENCES `adm_folders` (`fol_id`),
  ADD CONSTRAINT `adm_fk_fol_org` FOREIGN KEY (`fol_org_id`) REFERENCES `adm_organizations` (`org_id`),
  ADD CONSTRAINT `adm_fk_fol_usr` FOREIGN KEY (`fol_usr_id`) REFERENCES `adm_users` (`usr_id`) ON DELETE SET NULL;

--
-- Constraints for table `adm_guestbook`
--
ALTER TABLE `adm_guestbook`
  ADD CONSTRAINT `adm_fk_gbo_org` FOREIGN KEY (`gbo_org_id`) REFERENCES `adm_organizations` (`org_id`),
  ADD CONSTRAINT `adm_fk_gbo_usr_change` FOREIGN KEY (`gbo_usr_id_change`) REFERENCES `adm_users` (`usr_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `adm_fk_gbo_usr_create` FOREIGN KEY (`gbo_usr_id_create`) REFERENCES `adm_users` (`usr_id`) ON DELETE SET NULL;

--
-- Constraints for table `adm_guestbook_comments`
--
ALTER TABLE `adm_guestbook_comments`
  ADD CONSTRAINT `adm_fk_gbc_gbo` FOREIGN KEY (`gbc_gbo_id`) REFERENCES `adm_guestbook` (`gbo_id`),
  ADD CONSTRAINT `adm_fk_gbc_usr_change` FOREIGN KEY (`gbc_usr_id_change`) REFERENCES `adm_users` (`usr_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `adm_fk_gbc_usr_create` FOREIGN KEY (`gbc_usr_id_create`) REFERENCES `adm_users` (`usr_id`);

--
-- Constraints for table `adm_ids`
--
ALTER TABLE `adm_ids`
  ADD CONSTRAINT `adm_fk_ids_usr_id` FOREIGN KEY (`ids_usr_id`) REFERENCES `adm_users` (`usr_id`);

--
-- Constraints for table `adm_links`
--
ALTER TABLE `adm_links`
  ADD CONSTRAINT `adm_fk_lnk_cat` FOREIGN KEY (`lnk_cat_id`) REFERENCES `adm_categories` (`cat_id`),
  ADD CONSTRAINT `adm_fk_lnk_usr_change` FOREIGN KEY (`lnk_usr_id_change`) REFERENCES `adm_users` (`usr_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `adm_fk_lnk_usr_create` FOREIGN KEY (`lnk_usr_id_create`) REFERENCES `adm_users` (`usr_id`) ON DELETE SET NULL;

--
-- Constraints for table `adm_lists`
--
ALTER TABLE `adm_lists`
  ADD CONSTRAINT `adm_fk_lst_org` FOREIGN KEY (`lst_org_id`) REFERENCES `adm_organizations` (`org_id`),
  ADD CONSTRAINT `adm_fk_lst_usr` FOREIGN KEY (`lst_usr_id`) REFERENCES `adm_users` (`usr_id`);

--
-- Constraints for table `adm_list_columns`
--
ALTER TABLE `adm_list_columns`
  ADD CONSTRAINT `adm_fk_lsc_lst` FOREIGN KEY (`lsc_lst_id`) REFERENCES `adm_lists` (`lst_id`),
  ADD CONSTRAINT `adm_fk_lsc_usf` FOREIGN KEY (`lsc_usf_id`) REFERENCES `adm_user_fields` (`usf_id`);

--
-- Constraints for table `adm_members`
--
ALTER TABLE `adm_members`
  ADD CONSTRAINT `adm_fk_mem_rol` FOREIGN KEY (`mem_rol_id`) REFERENCES `adm_roles` (`rol_id`),
  ADD CONSTRAINT `adm_fk_mem_usr` FOREIGN KEY (`mem_usr_id`) REFERENCES `adm_users` (`usr_id`),
  ADD CONSTRAINT `adm_fk_mem_usr_change` FOREIGN KEY (`mem_usr_id_change`) REFERENCES `adm_users` (`usr_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `adm_fk_mem_usr_create` FOREIGN KEY (`mem_usr_id_create`) REFERENCES `adm_users` (`usr_id`) ON DELETE SET NULL;

--
-- Constraints for table `adm_menu`
--
ALTER TABLE `adm_menu`
  ADD CONSTRAINT `adm_fk_men_com_id` FOREIGN KEY (`men_com_id`) REFERENCES `adm_components` (`com_id`),
  ADD CONSTRAINT `adm_fk_men_men_parent` FOREIGN KEY (`men_men_id_parent`) REFERENCES `adm_menu` (`men_id`) ON DELETE SET NULL;

--
-- Constraints for table `adm_messages`
--
ALTER TABLE `adm_messages`
  ADD CONSTRAINT `adm_fk_msg_usr_sender` FOREIGN KEY (`msg_usr_id_sender`) REFERENCES `adm_users` (`usr_id`);

--
-- Constraints for table `adm_messages_attachments`
--
ALTER TABLE `adm_messages_attachments`
  ADD CONSTRAINT `adm_fk_msa_msg_id` FOREIGN KEY (`msa_msg_id`) REFERENCES `adm_messages` (`msg_id`);

--
-- Constraints for table `adm_messages_content`
--
ALTER TABLE `adm_messages_content`
  ADD CONSTRAINT `adm_fk_msc_msg_id` FOREIGN KEY (`msc_msg_id`) REFERENCES `adm_messages` (`msg_id`),
  ADD CONSTRAINT `adm_fk_msc_usr_id` FOREIGN KEY (`msc_usr_id`) REFERENCES `adm_users` (`usr_id`) ON DELETE SET NULL;

--
-- Constraints for table `adm_messages_recipients`
--
ALTER TABLE `adm_messages_recipients`
  ADD CONSTRAINT `adm_fk_msr_msg_id` FOREIGN KEY (`msr_msg_id`) REFERENCES `adm_messages` (`msg_id`),
  ADD CONSTRAINT `adm_fk_msr_rol_id` FOREIGN KEY (`msr_rol_id`) REFERENCES `adm_roles` (`rol_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `adm_fk_msr_usr_id` FOREIGN KEY (`msr_usr_id`) REFERENCES `adm_users` (`usr_id`) ON DELETE SET NULL;

--
-- Constraints for table `adm_organizations`
--
ALTER TABLE `adm_organizations`
  ADD CONSTRAINT `adm_fk_org_org_parent` FOREIGN KEY (`org_org_id_parent`) REFERENCES `adm_organizations` (`org_id`) ON DELETE SET NULL;

--
-- Constraints for table `adm_photos`
--
ALTER TABLE `adm_photos`
  ADD CONSTRAINT `adm_fk_pho_org` FOREIGN KEY (`pho_org_id`) REFERENCES `adm_organizations` (`org_id`),
  ADD CONSTRAINT `adm_fk_pho_pho_parent` FOREIGN KEY (`pho_pho_id_parent`) REFERENCES `adm_photos` (`pho_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `adm_fk_pho_usr_change` FOREIGN KEY (`pho_usr_id_change`) REFERENCES `adm_users` (`usr_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `adm_fk_pho_usr_create` FOREIGN KEY (`pho_usr_id_create`) REFERENCES `adm_users` (`usr_id`) ON DELETE SET NULL;

--
-- Constraints for table `adm_preferences`
--
ALTER TABLE `adm_preferences`
  ADD CONSTRAINT `adm_fk_prf_org` FOREIGN KEY (`prf_org_id`) REFERENCES `adm_organizations` (`org_id`);

--
-- Constraints for table `adm_registrations`
--
ALTER TABLE `adm_registrations`
  ADD CONSTRAINT `adm_fk_reg_org` FOREIGN KEY (`reg_org_id`) REFERENCES `adm_organizations` (`org_id`),
  ADD CONSTRAINT `adm_fk_reg_usr` FOREIGN KEY (`reg_usr_id`) REFERENCES `adm_users` (`usr_id`);

--
-- Constraints for table `adm_roles`
--
ALTER TABLE `adm_roles`
  ADD CONSTRAINT `adm_fk_rol_cat` FOREIGN KEY (`rol_cat_id`) REFERENCES `adm_categories` (`cat_id`),
  ADD CONSTRAINT `adm_fk_rol_lst_id` FOREIGN KEY (`rol_lst_id`) REFERENCES `adm_lists` (`lst_id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `adm_fk_rol_usr_change` FOREIGN KEY (`rol_usr_id_change`) REFERENCES `adm_users` (`usr_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `adm_fk_rol_usr_create` FOREIGN KEY (`rol_usr_id_create`) REFERENCES `adm_users` (`usr_id`) ON DELETE SET NULL;

--
-- Constraints for table `adm_roles_rights`
--
ALTER TABLE `adm_roles_rights`
  ADD CONSTRAINT `adm_fk_ror_ror_parent` FOREIGN KEY (`ror_ror_id_parent`) REFERENCES `adm_roles_rights` (`ror_id`) ON DELETE SET NULL;

--
-- Constraints for table `adm_roles_rights_data`
--
ALTER TABLE `adm_roles_rights_data`
  ADD CONSTRAINT `adm_fk_rrd_rol` FOREIGN KEY (`rrd_rol_id`) REFERENCES `adm_roles` (`rol_id`),
  ADD CONSTRAINT `adm_fk_rrd_ror` FOREIGN KEY (`rrd_ror_id`) REFERENCES `adm_roles_rights` (`ror_id`),
  ADD CONSTRAINT `adm_fk_rrd_usr_create` FOREIGN KEY (`rrd_usr_id_create`) REFERENCES `adm_users` (`usr_id`) ON DELETE SET NULL;

--
-- Constraints for table `adm_role_dependencies`
--
ALTER TABLE `adm_role_dependencies`
  ADD CONSTRAINT `adm_fk_rld_rol_child` FOREIGN KEY (`rld_rol_id_child`) REFERENCES `adm_roles` (`rol_id`),
  ADD CONSTRAINT `adm_fk_rld_rol_parent` FOREIGN KEY (`rld_rol_id_parent`) REFERENCES `adm_roles` (`rol_id`),
  ADD CONSTRAINT `adm_fk_rld_usr` FOREIGN KEY (`rld_usr_id`) REFERENCES `adm_users` (`usr_id`) ON DELETE SET NULL;

--
-- Constraints for table `adm_rooms`
--
ALTER TABLE `adm_rooms`
  ADD CONSTRAINT `adm_fk_room_usr_change` FOREIGN KEY (`room_usr_id_change`) REFERENCES `adm_users` (`usr_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `adm_fk_room_usr_create` FOREIGN KEY (`room_usr_id_create`) REFERENCES `adm_users` (`usr_id`) ON DELETE SET NULL;

--
-- Constraints for table `adm_sessions`
--
ALTER TABLE `adm_sessions`
  ADD CONSTRAINT `adm_fk_ses_org` FOREIGN KEY (`ses_org_id`) REFERENCES `adm_organizations` (`org_id`),
  ADD CONSTRAINT `adm_fk_ses_usr` FOREIGN KEY (`ses_usr_id`) REFERENCES `adm_users` (`usr_id`);

--
-- Constraints for table `adm_texts`
--
ALTER TABLE `adm_texts`
  ADD CONSTRAINT `adm_fk_txt_org` FOREIGN KEY (`txt_org_id`) REFERENCES `adm_organizations` (`org_id`);

--
-- Constraints for table `adm_users`
--
ALTER TABLE `adm_users`
  ADD CONSTRAINT `adm_fk_usr_usr_change` FOREIGN KEY (`usr_usr_id_change`) REFERENCES `adm_users` (`usr_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `adm_fk_usr_usr_create` FOREIGN KEY (`usr_usr_id_create`) REFERENCES `adm_users` (`usr_id`) ON DELETE SET NULL;

--
-- Constraints for table `adm_user_data`
--
ALTER TABLE `adm_user_data`
  ADD CONSTRAINT `adm_fk_usd_usf` FOREIGN KEY (`usd_usf_id`) REFERENCES `adm_user_fields` (`usf_id`),
  ADD CONSTRAINT `adm_fk_usd_usr` FOREIGN KEY (`usd_usr_id`) REFERENCES `adm_users` (`usr_id`);

--
-- Constraints for table `adm_user_fields`
--
ALTER TABLE `adm_user_fields`
  ADD CONSTRAINT `adm_fk_usf_cat` FOREIGN KEY (`usf_cat_id`) REFERENCES `adm_categories` (`cat_id`),
  ADD CONSTRAINT `adm_fk_usf_usr_change` FOREIGN KEY (`usf_usr_id_change`) REFERENCES `adm_users` (`usr_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `adm_fk_usf_usr_create` FOREIGN KEY (`usf_usr_id_create`) REFERENCES `adm_users` (`usr_id`) ON DELETE SET NULL;

--
-- Constraints for table `adm_user_log`
--
ALTER TABLE `adm_user_log`
  ADD CONSTRAINT `adm_fk_user_log_1` FOREIGN KEY (`usl_usr_id`) REFERENCES `adm_users` (`usr_id`),
  ADD CONSTRAINT `adm_fk_user_log_2` FOREIGN KEY (`usl_usr_id_create`) REFERENCES `adm_users` (`usr_id`),
  ADD CONSTRAINT `adm_fk_user_log_3` FOREIGN KEY (`usl_usf_id`) REFERENCES `adm_user_fields` (`usf_id`);

--
-- Constraints for table `adm_user_relations`
--
ALTER TABLE `adm_user_relations`
  ADD CONSTRAINT `adm_fk_ure_urt` FOREIGN KEY (`ure_urt_id`) REFERENCES `adm_user_relation_types` (`urt_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `adm_fk_ure_usr1` FOREIGN KEY (`ure_usr_id1`) REFERENCES `adm_users` (`usr_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `adm_fk_ure_usr2` FOREIGN KEY (`ure_usr_id2`) REFERENCES `adm_users` (`usr_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `adm_fk_ure_usr_change` FOREIGN KEY (`ure_usr_id_change`) REFERENCES `adm_users` (`usr_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `adm_fk_ure_usr_create` FOREIGN KEY (`ure_usr_id_create`) REFERENCES `adm_users` (`usr_id`) ON DELETE SET NULL;

--
-- Constraints for table `adm_user_relation_types`
--
ALTER TABLE `adm_user_relation_types`
  ADD CONSTRAINT `adm_fk_urt_id_inverse` FOREIGN KEY (`urt_id_inverse`) REFERENCES `adm_user_relation_types` (`urt_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `adm_fk_urt_usr_change` FOREIGN KEY (`urt_usr_id_change`) REFERENCES `adm_users` (`usr_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `adm_fk_urt_usr_create` FOREIGN KEY (`urt_usr_id_create`) REFERENCES `adm_users` (`usr_id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
