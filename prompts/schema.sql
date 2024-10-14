-- MySQL dump 10.13  Distrib 8.0.39, for Linux (x86_64)
--
-- Host: localhost    Database: automationapi
-- ------------------------------------------------------
-- Server version	8.0.39-0ubuntu0.22.04.1

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
-- Table structure for table `account_emailaddress`
--

DROP TABLE IF EXISTS `account_emailaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_emailaddress` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `account_emailaddress_user_id_2c513194_fk_auth_user_id` (`user_id`),
  CONSTRAINT `account_emailaddress_user_id_2c513194_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `account_emailconfirmation`
--

DROP TABLE IF EXISTS `account_emailconfirmation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_emailconfirmation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `sent` datetime(6) DEFAULT NULL,
  `key` varchar(64) NOT NULL,
  `email_address_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  KEY `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` (`email_address_id`),
  CONSTRAINT `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` FOREIGN KEY (`email_address_id`) REFERENCES `account_emailaddress` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_site` (
  `id` int NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iac_category`
--

DROP TABLE IF EXISTS `iac_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iac_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` smallint NOT NULL,
  `date_created` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iac_config`
--

DROP TABLE IF EXISTS `iac_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iac_config` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `main_config_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `iac_config_main_config_id_3375c055_fk_iac_main_config_id` (`main_config_id`),
  CONSTRAINT `iac_config_main_config_id_3375c055_fk_iac_main_config_id` FOREIGN KEY (`main_config_id`) REFERENCES `iac_main_config` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iac_deploy`
--

DROP TABLE IF EXISTS `iac_deploy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iac_deploy` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_created` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `my_bkc_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `iac_deploy_user_id_df533074_fk_auth_user_id` (`user_id`),
  KEY `iac_deploy_my_bkc_id_a67695e4_fk_pae_bkc_id` (`my_bkc_id`),
  CONSTRAINT `iac_deploy_my_bkc_id_a67695e4_fk_pae_bkc_id` FOREIGN KEY (`my_bkc_id`) REFERENCES `pae_bkc` (`id`),
  CONSTRAINT `iac_deploy_user_id_df533074_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iac_deploy_host`
--

DROP TABLE IF EXISTS `iac_deploy_host`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iac_deploy_host` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status` smallint NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `deploy_id` int NOT NULL,
  `host_id` int NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `iac_deploy_host_deploy_id_6ff3ba00_fk_iac_deploy_id` (`deploy_id`),
  KEY `iac_deploy_host_host_id_567b787b_fk_iac_host_id` (`host_id`),
  CONSTRAINT `iac_deploy_host_deploy_id_6ff3ba00_fk_iac_deploy_id` FOREIGN KEY (`deploy_id`) REFERENCES `iac_deploy` (`id`),
  CONSTRAINT `iac_deploy_host_host_id_567b787b_fk_iac_host_id` FOREIGN KEY (`host_id`) REFERENCES `iac_host` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iac_deploy_task`
--

DROP TABLE IF EXISTS `iac_deploy_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iac_deploy_task` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_created` datetime(6) NOT NULL,
  `deploy_id` int NOT NULL,
  `naas_task_id` int NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `no_order` smallint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `iac_deploy_task_deploy_id_dd0720ff_fk_iac_deploy_id` (`deploy_id`),
  KEY `iac_deploy_task_naas_task_id_899ae07c_fk_iac_naas_task_id` (`naas_task_id`),
  CONSTRAINT `iac_deploy_task_deploy_id_dd0720ff_fk_iac_deploy_id` FOREIGN KEY (`deploy_id`) REFERENCES `iac_deploy` (`id`),
  CONSTRAINT `iac_deploy_task_naas_task_id_899ae07c_fk_iac_naas_task_id` FOREIGN KEY (`naas_task_id`) REFERENCES `iac_naas_task` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iac_group`
--

DROP TABLE IF EXISTS `iac_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iac_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `project_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `iac_group_project_id_7e3ab23b_fk_iac_project_id` (`project_id`),
  CONSTRAINT `iac_group_project_id_7e3ab23b_fk_iac_project_id` FOREIGN KEY (`project_id`) REFERENCES `iac_project` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iac_hardware`
--

DROP TABLE IF EXISTS `iac_hardware`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iac_hardware` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `category_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `iac_hardware_category_id_04051e79_fk_iac_category_id` (`category_id`),
  KEY `iac_hardware_user_id_9cb57469_fk_auth_user_id` (`user_id`),
  CONSTRAINT `iac_hardware_category_id_04051e79_fk_iac_category_id` FOREIGN KEY (`category_id`) REFERENCES `iac_category` (`id`),
  CONSTRAINT `iac_hardware_user_id_9cb57469_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iac_host`
--

DROP TABLE IF EXISTS `iac_host`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iac_host` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `ip` varchar(20) NOT NULL,
  `mac` varchar(20) DEFAULT NULL,
  `com` varchar(10) DEFAULT NULL,
  `is_reachable` tinyint(1) DEFAULT NULL,
  `date_created` datetime(6) NOT NULL,
  `group_id` int DEFAULT NULL,
  `project_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `iac_host_group_id_7ed1e62a_fk_iac_group_id` (`group_id`),
  KEY `iac_host_project_id_ca2ed269_fk_iac_project_id` (`project_id`),
  KEY `iac_host_user_id_09e6b12d_fk_auth_user_id` (`user_id`),
  CONSTRAINT `iac_host_group_id_7ed1e62a_fk_iac_group_id` FOREIGN KEY (`group_id`) REFERENCES `iac_group` (`id`),
  CONSTRAINT `iac_host_project_id_ca2ed269_fk_iac_project_id` FOREIGN KEY (`project_id`) REFERENCES `iac_project` (`id`),
  CONSTRAINT `iac_host_user_id_09e6b12d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iac_instrument`
--

DROP TABLE IF EXISTS `iac_instrument`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iac_instrument` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` smallint NOT NULL,
  `unique_name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `version` varchar(50) DEFAULT NULL,
  `date_created` datetime(6) NOT NULL,
  `category_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_name` (`unique_name`),
  KEY `iac_instrument_category_id_7ef1be19_fk_iac_category_id` (`category_id`),
  KEY `iac_instrument_user_id_14f514dc_fk_auth_user_id` (`user_id`),
  CONSTRAINT `iac_instrument_category_id_7ef1be19_fk_iac_category_id` FOREIGN KEY (`category_id`) REFERENCES `iac_category` (`id`),
  CONSTRAINT `iac_instrument_user_id_14f514dc_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iac_instrument_device`
--

DROP TABLE IF EXISTS `iac_instrument_device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iac_instrument_device` (
  `id` int NOT NULL AUTO_INCREMENT,
  `port` varchar(25) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  `cred` varchar(255) DEFAULT NULL,
  `entry` varchar(255) DEFAULT NULL,
  `use` tinyint(1) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `host_id` int DEFAULT NULL,
  `instrument_id` int DEFAULT NULL,
  `sut_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `iac_instrument_device_host_id_fcc56268_fk_iac_host_id` (`host_id`),
  KEY `iac_instrument_devic_instrument_id_5eab4bcf_fk_iac_instr` (`instrument_id`),
  KEY `iac_instrument_device_sut_id_90c0507f_fk_iac_sut_id` (`sut_id`),
  CONSTRAINT `iac_instrument_devic_instrument_id_5eab4bcf_fk_iac_instr` FOREIGN KEY (`instrument_id`) REFERENCES `iac_instrument` (`id`),
  CONSTRAINT `iac_instrument_device_host_id_fcc56268_fk_iac_host_id` FOREIGN KEY (`host_id`) REFERENCES `iac_host` (`id`),
  CONSTRAINT `iac_instrument_device_sut_id_90c0507f_fk_iac_sut_id` FOREIGN KEY (`sut_id`) REFERENCES `iac_sut` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iac_item_config`
--

DROP TABLE IF EXISTS `iac_item_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iac_item_config` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `config_id` int NOT NULL,
  `hardware_id` int DEFAULT NULL,
  `silicon_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `iac_item_config_config_id_d5227d1f_fk_iac_config_id` (`config_id`),
  KEY `iac_item_config_hardware_id_596b43ef_fk_iac_hardware_id` (`hardware_id`),
  KEY `iac_item_config_silicon_id_b8911506_fk_iac_silicon_metadata_id` (`silicon_id`),
  CONSTRAINT `iac_item_config_config_id_d5227d1f_fk_iac_config_id` FOREIGN KEY (`config_id`) REFERENCES `iac_config` (`id`),
  CONSTRAINT `iac_item_config_hardware_id_596b43ef_fk_iac_hardware_id` FOREIGN KEY (`hardware_id`) REFERENCES `iac_hardware` (`id`),
  CONSTRAINT `iac_item_config_silicon_id_b8911506_fk_iac_silicon_metadata_id` FOREIGN KEY (`silicon_id`) REFERENCES `iac_silicon_metadata` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iac_item_main_config`
--

DROP TABLE IF EXISTS `iac_item_main_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iac_item_main_config` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `is_required` tinyint(1) NOT NULL,
  `type` smallint NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `main_config_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `iac_item_main_config_main_config_id_4620cddf_fk_iac_main_` (`main_config_id`),
  CONSTRAINT `iac_item_main_config_main_config_id_4620cddf_fk_iac_main_` FOREIGN KEY (`main_config_id`) REFERENCES `iac_main_config` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iac_main_config`
--

DROP TABLE IF EXISTS `iac_main_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iac_main_config` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `project_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `iac_main_config_project_id_07c9ba24_fk_iac_project_id` (`project_id`),
  CONSTRAINT `iac_main_config_project_id_07c9ba24_fk_iac_project_id` FOREIGN KEY (`project_id`) REFERENCES `iac_project` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iac_naas_task`
--

DROP TABLE IF EXISTS `iac_naas_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iac_naas_task` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `project_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `iac_naas_task_project_id_feb45b94_fk_iac_project_id` (`project_id`),
  CONSTRAINT `iac_naas_task_project_id_feb45b94_fk_iac_project_id` FOREIGN KEY (`project_id`) REFERENCES `iac_project` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iac_project`
--

DROP TABLE IF EXISTS `iac_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iac_project` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `prefix` varchar(25) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `iac_project_user_id_a16e5fe9_fk_auth_user_id` (`user_id`),
  CONSTRAINT `iac_project_user_id_a16e5fe9_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iac_silicon_metadata`
--

DROP TABLE IF EXISTS `iac_silicon_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iac_silicon_metadata` (
  `id` int NOT NULL AUTO_INCREMENT,
  `socket` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `stepping` varchar(255) NOT NULL,
  `qdf` varchar(255) NOT NULL,
  `frequency` decimal(9,2) NOT NULL,
  `cache` int NOT NULL,
  `cores` int NOT NULL,
  `power_consumption` int NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `project_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `iac_silicon_metadata_project_id_7f1c36c1_fk_iac_project_id` (`project_id`),
  KEY `iac_silicon_metadata_user_id_4b023206_fk_auth_user_id` (`user_id`),
  CONSTRAINT `iac_silicon_metadata_project_id_7f1c36c1_fk_iac_project_id` FOREIGN KEY (`project_id`) REFERENCES `iac_project` (`id`),
  CONSTRAINT `iac_silicon_metadata_user_id_4b023206_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iac_sut`
--

DROP TABLE IF EXISTS `iac_sut`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iac_sut` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `ip` varchar(20) NOT NULL,
  `mac` varchar(20) DEFAULT NULL,
  `os` varchar(200) NOT NULL,
  `is_reachable` tinyint(1) DEFAULT NULL,
  `date_created` datetime(6) NOT NULL,
  `group_id` int DEFAULT NULL,
  `host_id` int DEFAULT NULL,
  `project_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `iac_sut_group_id_ec5531c1_fk_iac_group_id` (`group_id`),
  KEY `iac_sut_host_id_ec928d85_fk_iac_host_id` (`host_id`),
  KEY `iac_sut_project_id_e51f704f_fk_iac_project_id` (`project_id`),
  KEY `iac_sut_user_id_ff0aff9d_fk_auth_user_id` (`user_id`),
  CONSTRAINT `iac_sut_group_id_ec5531c1_fk_iac_group_id` FOREIGN KEY (`group_id`) REFERENCES `iac_group` (`id`),
  CONSTRAINT `iac_sut_host_id_ec928d85_fk_iac_host_id` FOREIGN KEY (`host_id`) REFERENCES `iac_host` (`id`),
  CONSTRAINT `iac_sut_project_id_e51f704f_fk_iac_project_id` FOREIGN KEY (`project_id`) REFERENCES `iac_project` (`id`),
  CONSTRAINT `iac_sut_user_id_ff0aff9d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iac_sut_config`
--

DROP TABLE IF EXISTS `iac_sut_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iac_sut_config` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_created` datetime(6) NOT NULL,
  `config_id` int NOT NULL,
  `sut_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `iac_sut_config_config_id_79f957d3_fk_iac_config_id` (`config_id`),
  KEY `iac_sut_config_sut_id_fb4de7c9_fk_iac_sut_id` (`sut_id`),
  CONSTRAINT `iac_sut_config_config_id_79f957d3_fk_iac_config_id` FOREIGN KEY (`config_id`) REFERENCES `iac_config` (`id`),
  CONSTRAINT `iac_sut_config_sut_id_fb4de7c9_fk_iac_sut_id` FOREIGN KEY (`sut_id`) REFERENCES `iac_sut` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iac_system_task`
--

DROP TABLE IF EXISTS `iac_system_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iac_system_task` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hostname` varchar(50) NOT NULL,
  `status` smallint NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `host_id` int NOT NULL,
  `task_id` int NOT NULL,
  `logs` longtext,
  `deploy_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `iac_system_task_host_id_d76a5ab7_fk_iac_host_id` (`host_id`),
  KEY `iac_system_task_task_id_31b0254d_fk_iac_naas_task_id` (`task_id`),
  KEY `iac_system_task_deploy_id_9a7c1cbf_fk_iac_deploy_id` (`deploy_id`),
  CONSTRAINT `iac_system_task_deploy_id_9a7c1cbf_fk_iac_deploy_id` FOREIGN KEY (`deploy_id`) REFERENCES `iac_deploy` (`id`),
  CONSTRAINT `iac_system_task_host_id_d76a5ab7_fk_iac_host_id` FOREIGN KEY (`host_id`) REFERENCES `iac_host` (`id`),
  CONSTRAINT `iac_system_task_task_id_31b0254d_fk_iac_naas_task_id` FOREIGN KEY (`task_id`) REFERENCES `iac_naas_task` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iac_variant_item_main`
--

DROP TABLE IF EXISTS `iac_variant_item_main`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iac_variant_item_main` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_created` datetime(6) NOT NULL,
  `hardware_id` int DEFAULT NULL,
  `item_mc_id` int NOT NULL,
  `silicon_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `iac_variant_item_main_hardware_id_0c68613a_fk_iac_hardware_id` (`hardware_id`),
  KEY `iac_variant_item_mai_item_mc_id_ecb802ad_fk_iac_item_` (`item_mc_id`),
  KEY `iac_variant_item_mai_silicon_id_8c1b5e59_fk_iac_silic` (`silicon_id`),
  CONSTRAINT `iac_variant_item_mai_item_mc_id_ecb802ad_fk_iac_item_` FOREIGN KEY (`item_mc_id`) REFERENCES `iac_item_main_config` (`id`),
  CONSTRAINT `iac_variant_item_mai_silicon_id_8c1b5e59_fk_iac_silic` FOREIGN KEY (`silicon_id`) REFERENCES `iac_silicon_metadata` (`id`),
  CONSTRAINT `iac_variant_item_main_hardware_id_0c68613a_fk_iac_hardware_id` FOREIGN KEY (`hardware_id`) REFERENCES `iac_hardware` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pae_bkc`
--

DROP TABLE IF EXISTS `pae_bkc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pae_bkc` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `ifwi_folder` varchar(250) DEFAULT NULL,
  `ifwi_default` varchar(250) DEFAULT NULL,
  `ifwi_version` varchar(250) DEFAULT NULL,
  `cpld_folder` varchar(250) DEFAULT NULL,
  `cpld_default` varchar(250) DEFAULT NULL,
  `cpld_version` varchar(250) DEFAULT NULL,
  `os_image_iso` varchar(250) DEFAULT NULL,
  `os_image_img` varchar(250) DEFAULT NULL,
  `os_image_name` varchar(250) DEFAULT NULL,
  `os_image_version` varchar(250) DEFAULT NULL,
  `date_created` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-05 10:19:49
