-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 21, 2017 at 09:54 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.0.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `actions`
--

CREATE TABLE `actions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `actionable_id` int(11) DEFAULT NULL,
  `actionable_type` varchar(255) DEFAULT NULL,
  `type_act` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `actions`
--

INSERT INTO `actions` (`id`, `user_id`, `actionable_id`, `actionable_type`, `type_act`) VALUES
(11, 11, 5, 'Comment', 1),
(12, 11, 4, 'Comment', 1),
(13, 11, 7, 'Comment', 1),
(24, 11, 7, 'Topic', 4),
(25, 11, 6, 'Topic', 4),
(43, 11, 10, 'Comment', 1),
(46, 11, 3, 'Answer', 1),
(82, 11, 15, 'Comment', 1),
(83, 11, 14, 'Comment', 1),
(85, 11, 9, 'Answer', 0),
(87, 11, 5, 'Answer', 0),
(92, 11, 7, 'Answer', 0),
(145, 11, 2, 'Answer', 0),
(174, 11, 1, 'Topic', 4),
(175, 11, 4, 'Topic', 4),
(210, 11, 24, 'Comment', 1),
(213, 11, 10, 'Answer', 0),
(219, 11, 1, 'User', 4),
(220, 11, 3, 'Topic', 4),
(221, 11, 8, 'Topic', 4);

-- --------------------------------------------------------

--
-- Table structure for table `activities`
--

CREATE TABLE `activities` (
  `id` int(11) NOT NULL,
  `trackable_type` varchar(255) DEFAULT NULL,
  `trackable_id` int(11) DEFAULT NULL,
  `owner_type` varchar(255) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `parameters` text,
  `recipient_type` varchar(255) DEFAULT NULL,
  `recipient_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `activities`
--

INSERT INTO `activities` (`id`, `trackable_type`, `trackable_id`, `owner_type`, `owner_id`, `key`, `parameters`, `recipient_type`, `recipient_id`, `created_at`, `updated_at`) VALUES
(1, 'Question', 5, 'User', 11, 'question.create', NULL, NULL, NULL, '2017-02-13 03:58:21', '2017-02-13 03:58:21'),
(2, 'Question', 1, 'User', 11, 'question.down_vote', NULL, NULL, NULL, '2017-02-13 04:04:31', '2017-02-13 04:04:31'),
(3, 'Question', 1, 'User', 11, 'question.up_vote', NULL, NULL, NULL, '2017-02-13 04:06:35', '2017-02-13 04:06:35'),
(4, 'Answer', 11, 'User', 11, 'answer.create', NULL, NULL, NULL, '2017-02-13 04:09:11', '2017-02-13 04:09:11'),
(5, 'Answer', 1, 'User', 11, 'answer.update', NULL, NULL, NULL, '2017-02-13 04:12:35', '2017-02-13 04:12:35'),
(6, 'Comment', 17, 'User', 11, 'comment.create', NULL, NULL, NULL, '2017-02-13 04:18:06', '2017-02-13 04:18:06'),
(7, 'Comment', 4, 'User', 11, 'comment.update', NULL, NULL, NULL, '2017-02-13 04:20:37', '2017-02-13 04:20:37'),
(8, 'Comment', 8, 'User', 11, 'comment.up_vote', NULL, NULL, NULL, '2017-02-13 07:51:56', '2017-02-13 07:51:56'),
(9, 'Comment', 8, 'User', 11, 'comment.up_vote', NULL, NULL, NULL, '2017-02-13 07:53:41', '2017-02-13 07:53:41'),
(10, 'Comment', 8, 'User', 11, 'comment.up_vote', NULL, NULL, NULL, '2017-02-13 07:54:45', '2017-02-13 07:54:45'),
(11, 'Comment', 8, 'User', 11, 'comment.up_vote', NULL, NULL, NULL, '2017-02-13 07:56:14', '2017-02-13 07:56:14'),
(12, 'Comment', 8, 'User', 11, 'comment.down_vote', NULL, NULL, NULL, '2017-02-13 07:56:17', '2017-02-13 07:56:17'),
(13, 'Comment', 8, 'User', 11, 'comment.up_vote', NULL, NULL, NULL, '2017-02-13 07:56:18', '2017-02-13 07:56:18'),
(14, 'Comment', 8, 'User', 11, 'comment.down_vote', NULL, NULL, NULL, '2017-02-13 07:56:18', '2017-02-13 07:56:18'),
(15, 'Answer', 1, 'User', 11, 'answer.up_vote', NULL, NULL, NULL, '2017-02-13 07:56:20', '2017-02-13 07:56:20'),
(16, 'Answer', 1, 'User', 11, 'answer.up_vote', NULL, NULL, NULL, '2017-02-13 07:57:13', '2017-02-13 07:57:13'),
(17, 'Answer', 1, 'User', 11, 'answer.down_vote', NULL, NULL, NULL, '2017-02-13 07:57:14', '2017-02-13 07:57:14'),
(18, 'Answer', 1, 'User', 11, 'answer.up_vote', NULL, NULL, NULL, '2017-02-13 07:57:15', '2017-02-13 07:57:15'),
(19, 'Answer', 1, 'User', 11, 'answer.down_vote', NULL, NULL, NULL, '2017-02-13 07:57:16', '2017-02-13 07:57:16'),
(20, 'Comment', 8, 'User', 11, 'comment.up_vote', NULL, NULL, NULL, '2017-02-13 07:57:18', '2017-02-13 07:57:18'),
(21, 'Comment', 8, 'User', 11, 'comment.down_vote', NULL, NULL, NULL, '2017-02-13 07:57:18', '2017-02-13 07:57:18'),
(22, 'Comment', 18, 'User', 11, 'comment.create', NULL, NULL, NULL, '2017-02-13 08:44:31', '2017-02-13 08:44:31'),
(23, 'Comment', 19, 'User', 11, 'comment.create', NULL, NULL, NULL, '2017-02-13 08:45:10', '2017-02-13 08:45:10'),
(24, 'Answer', 10, 'User', 11, 'answer.down_vote', NULL, NULL, NULL, '2017-02-13 08:52:23', '2017-02-13 08:52:23'),
(25, 'Answer', 10, 'User', 11, 'answer.up_vote', NULL, NULL, NULL, '2017-02-13 08:52:25', '2017-02-13 08:52:25'),
(26, 'Answer', 10, 'User', 11, 'answer.down_vote', NULL, NULL, NULL, '2017-02-13 08:52:27', '2017-02-13 08:52:27'),
(27, 'Answer', 10, 'User', 11, 'answer.up_vote', NULL, NULL, NULL, '2017-02-13 08:52:27', '2017-02-13 08:52:27'),
(28, 'Answer', 10, 'User', 11, 'answer.up_vote', NULL, NULL, NULL, '2017-02-13 08:53:13', '2017-02-13 08:53:13'),
(29, 'Answer', 10, 'User', 11, 'answer.down_vote', NULL, NULL, NULL, '2017-02-13 08:53:14', '2017-02-13 08:53:14'),
(30, 'Answer', 10, 'User', 11, 'answer.up_vote', NULL, NULL, NULL, '2017-02-13 08:53:15', '2017-02-13 08:53:15'),
(31, 'Comment', 20, 'User', 11, 'comment.create', NULL, NULL, NULL, '2017-02-13 08:54:13', '2017-02-13 08:54:13'),
(32, 'Question', 6, 'User', 11, 'question.create', NULL, NULL, NULL, '2017-02-13 09:23:01', '2017-02-13 09:23:01'),
(33, 'Question', 7, 'User', 11, 'question.create', NULL, NULL, NULL, '2017-02-13 09:23:20', '2017-02-13 09:23:20'),
(34, 'Comment', 21, 'User', 11, 'comment.create', NULL, NULL, NULL, '2017-02-14 07:51:21', '2017-02-14 07:51:21'),
(35, 'Comment', 22, 'User', 11, 'comment.create', NULL, NULL, NULL, '2017-02-14 07:52:27', '2017-02-14 07:52:27'),
(36, 'Answer', 10, 'User', 11, 'answer.create', NULL, NULL, NULL, '2017-02-15 06:22:19', '2017-02-15 06:22:19'),
(37, 'Question', 7, 'User', 11, 'question.update', NULL, NULL, NULL, '2017-02-15 06:22:33', '2017-02-15 06:22:33'),
(38, 'Comment', 23, 'User', 11, 'comment.create', NULL, NULL, NULL, '2017-02-15 06:22:39', '2017-02-15 06:22:39'),
(39, 'Answer', 10, 'User', 11, 'answer.up_vote', NULL, NULL, NULL, '2017-02-15 06:22:43', '2017-02-15 06:22:43'),
(40, 'Comment', 23, 'User', 11, 'comment.up_vote', NULL, NULL, NULL, '2017-02-15 06:22:44', '2017-02-15 06:22:44'),
(41, 'Comment', 24, 'User', 11, 'comment.create', NULL, NULL, NULL, '2017-02-15 06:22:51', '2017-02-15 06:22:51'),
(42, 'Comment', 24, 'User', 11, 'comment.up_vote', NULL, NULL, NULL, '2017-02-15 06:22:53', '2017-02-15 06:22:53'),
(43, 'Answer', 10, 'User', 11, 'answer.down_vote', NULL, NULL, NULL, '2017-02-15 06:23:00', '2017-02-15 06:23:00'),
(44, 'Answer', 10, 'User', 11, 'answer.up_vote', NULL, NULL, NULL, '2017-02-15 06:23:02', '2017-02-15 06:23:02'),
(45, 'Answer', 10, 'User', 11, 'answer.down_vote', NULL, NULL, NULL, '2017-02-15 06:23:02', '2017-02-15 06:23:02'),
(46, 'Comment', 23, 'User', 11, 'comment.down_vote', NULL, NULL, NULL, '2017-02-15 06:23:03', '2017-02-15 06:23:03'),
(47, 'User', 1, 'User', 11, 'user.unfollow', NULL, NULL, NULL, '2017-02-15 08:39:37', '2017-02-15 08:39:37'),
(48, 'User', 1, 'User', 11, 'user.follow', NULL, NULL, NULL, '2017-02-15 08:39:46', '2017-02-15 08:39:46'),
(49, 'User', 1, 'User', 11, 'user.unfollow', NULL, NULL, NULL, '2017-02-15 08:40:17', '2017-02-15 08:40:17'),
(50, 'User', 1, 'User', 11, 'user.follow', NULL, NULL, NULL, '2017-02-15 08:40:18', '2017-02-15 08:40:18'),
(51, 'Question', 6, 'User', 11, 'question.update', NULL, NULL, NULL, '2017-02-16 01:20:59', '2017-02-16 01:20:59'),
(52, 'Answer', 11, 'User', 11, 'answer.create', NULL, NULL, NULL, '2017-02-16 01:21:05', '2017-02-16 01:21:05'),
(53, 'Answer', 11, 'User', 11, 'answer.update', NULL, NULL, NULL, '2017-02-16 01:21:20', '2017-02-16 01:21:20'),
(54, 'Answer', 12, 'User', 11, 'answer.create', NULL, NULL, NULL, '2017-02-16 01:21:28', '2017-02-16 01:21:28'),
(55, 'Answer', 13, 'User', 11, 'answer.create', NULL, NULL, NULL, '2017-02-16 01:45:31', '2017-02-16 01:45:31'),
(56, 'Answer', 4, 'User', 11, 'answer.update', NULL, NULL, NULL, '2017-02-16 02:01:55', '2017-02-16 02:01:55'),
(57, 'Answer', 4, 'User', 11, 'answer.update', NULL, NULL, NULL, '2017-02-16 02:02:00', '2017-02-16 02:02:00'),
(58, 'Comment', 25, 'User', 11, 'comment.create', NULL, NULL, NULL, '2017-02-16 02:02:04', '2017-02-16 02:02:04'),
(59, 'Answer', 14, 'User', 11, 'answer.create', NULL, NULL, NULL, '2017-02-16 02:02:54', '2017-02-16 02:02:54'),
(60, 'Question', 8, 'User', 11, 'question.create', NULL, NULL, NULL, '2017-02-26 08:06:25', '2017-02-26 08:06:25');

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `id` int(11) NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `reply_to` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `up_vote` int(11) DEFAULT '0',
  `down_vote` int(11) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `answers`
--

INSERT INTO `answers` (`id`, `content`, `reply_to`, `user_id`, `up_vote`, `down_vote`, `created_at`, `updated_at`) VALUES
(1, '<p>asdasd</p>\r\n<p>wefregth</p>asdsdsdassdd', 1, 11, 31, 32, '2017-02-02 01:42:17', '2017-02-13 07:57:16'),
(2, '<p>asdgtrhr</p>', 1, 11, 5, 6, '2017-02-02 01:50:19', '2017-02-10 04:12:26'),
(3, '<p>dsefgerhrtjhyt</p>', 1, 11, 1, 1, '2017-02-02 06:37:23', '2017-02-08 09:35:58'),
(4, '<p>becaregrthtrhuse it very sdsfun</p>', 4, 11, 0, 0, '2017-02-03 03:50:47', '2017-02-16 02:02:00'),
(5, '<p>cau hoi rat thu vi nhung toi rat tiec</p>', 1, 11, 5, 6, '2017-02-04 09:31:13', '2017-02-09 02:51:28'),
(6, '<p>asdasd</p>\r\n<p>efregt</p>\r\n<p>regtrh</p>', 1, 11, 0, 0, '2017-02-09 02:11:54', '2017-02-09 02:51:32'),
(7, '<p>day la new answer 1</p>', 1, 11, 1, 2, '2017-02-09 02:12:27', '2017-02-09 02:51:36'),
(8, '<p>qwdwegtr</p>\r\n<p>asdasd</p>asdereeasd', 1, 11, 0, 0, '2017-02-09 02:42:42', '2017-02-09 02:42:55'),
(9, '<p>day la new 2</p>', 1, 11, 0, 0, '2017-02-09 02:46:22', '2017-02-09 02:46:22'),
(10, '<p>asdwefgrehg</p>', 7, 11, 3, 4, '2017-02-15 06:22:19', '2017-02-15 06:23:02'),
(11, '<p>fdgbtyjuiasdasdasd</p>', 6, 11, 0, 0, '2017-02-16 01:21:05', '2017-02-16 01:21:20'),
(14, '<p>wdewgfrehtyjyjk</p>', 4, 11, 0, 0, '2017-02-16 02:02:54', '2017-02-16 02:02:54');

-- --------------------------------------------------------

--
-- Table structure for table `ar_internal_metadata`
--

CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ar_internal_metadata`
--

INSERT INTO `ar_internal_metadata` (`key`, `value`, `created_at`, `updated_at`) VALUES
('environment', 'development', '2017-02-02 01:24:28', '2017-02-02 01:24:28');

-- --------------------------------------------------------

--
-- Table structure for table `ckeditor_assets`
--

CREATE TABLE `ckeditor_assets` (
  `id` int(11) NOT NULL,
  `data_file_name` varchar(255) NOT NULL,
  `data_content_type` varchar(255) DEFAULT NULL,
  `data_file_size` int(11) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `commentable_id` int(11) DEFAULT NULL,
  `commentable_type` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `up_vote` int(11) DEFAULT '0',
  `down_vote` int(11) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `content`, `commentable_id`, `commentable_type`, `user_id`, `up_vote`, `down_vote`, `created_at`, `updated_at`) VALUES
(1, 'sdasdasfrh', 2, 'Answer', 11, 0, 0, '2017-02-02 01:50:39', '2017-02-02 01:50:39'),
(2, 'sdfgtrhysdfsdfsd', 2, 'Answer', 11, 2, 0, '2017-02-02 01:50:40', '2017-02-02 08:50:40'),
(4, 'ewfwefasds', 2, 'Answer', 11, 1, 0, '2017-02-02 02:38:28', '2017-02-13 04:20:37'),
(5, 'sdfrgrg', 2, 'Answer', 11, 1, 0, '2017-02-02 06:37:07', '2017-02-02 06:37:11'),
(6, 'dsfrgtr', 1, 'Answer', 11, 0, 0, '2017-02-02 06:38:25', '2017-02-13 02:58:49'),
(7, 'asdasdasdfrdfgfdg', 1, 'Question', 11, 1, 0, '2017-02-02 08:06:24', '2017-02-04 09:29:22'),
(8, 'dsfrhrtj', 1, 'Question', 11, 0, 0, '2017-02-04 09:29:32', '2017-02-13 07:57:18'),
(9, 'hay ne ', 3, 'Answer', 11, 0, 0, '2017-02-08 02:20:44', '2017-02-08 02:20:44'),
(10, 'vui chua ahihi', 1, 'Answer', 11, 1, 0, '2017-02-08 07:06:28', '2017-02-08 09:34:34'),
(11, 'asd', 1, 'Question', 11, 0, 0, '2017-02-08 07:10:58', '2017-02-08 07:10:58'),
(12, 'asdfrehj', 1, 'Answer', 11, 0, 0, '2017-02-08 07:46:17', '2017-02-08 07:46:17'),
(13, 'sdshjgj', 2, 'Answer', 11, 0, 0, '2017-02-08 07:46:56', '2017-02-08 07:46:56'),
(14, 'asdewf', 5, 'Answer', 11, 1, 0, '2017-02-09 02:42:26', '2017-02-09 02:42:36'),
(15, 'asdsad', 5, 'Answer', 11, 1, 0, '2017-02-09 02:42:32', '2017-02-09 02:42:35'),
(16, 'ccrtrsadasd', 1, 'Answer', 11, 0, 0, '2017-02-13 01:27:23', '2017-02-13 01:27:23'),
(17, 'wefer\r\nehrth', 1, 'Answer', 11, 0, 0, '2017-02-13 04:18:06', '2017-02-13 04:18:06'),
(20, 'qwrwefer', 9, 'Answer', 11, 0, 0, '2017-02-13 08:54:13', '2017-02-13 08:54:13'),
(21, 'asdaswrgfreg', 4, 'Answer', 11, 0, 0, '2017-02-14 07:51:21', '2017-02-14 07:51:21'),
(22, 'asdfrrg', 4, 'Answer', 11, 0, 0, '2017-02-14 07:52:27', '2017-02-14 07:52:27'),
(23, 'fregehth', 10, 'Answer', 11, 0, 0, '2017-02-15 06:22:39', '2017-02-15 06:23:03'),
(24, 'asdasd', 10, 'Answer', 11, 1, 0, '2017-02-15 06:22:51', '2017-02-15 06:22:53');

-- --------------------------------------------------------

--
-- Table structure for table `delayed_jobs`
--

CREATE TABLE `delayed_jobs` (
  `id` int(11) NOT NULL,
  `priority` int(11) NOT NULL DEFAULT '0',
  `attempts` int(11) NOT NULL DEFAULT '0',
  `handler` text NOT NULL,
  `last_error` text,
  `run_at` datetime DEFAULT NULL,
  `locked_at` datetime DEFAULT NULL,
  `failed_at` datetime DEFAULT NULL,
  `locked_by` varchar(255) DEFAULT NULL,
  `queue` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `follows`
--

CREATE TABLE `follows` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `followable_id` int(11) DEFAULT NULL,
  `followable_type` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `friendly_id_slugs`
--

CREATE TABLE `friendly_id_slugs` (
  `id` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `sluggable_id` int(11) NOT NULL,
  `sluggable_type` varchar(50) DEFAULT NULL,
  `scope` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `up_vote` int(11) DEFAULT '0',
  `down_vote` int(11) DEFAULT '0',
  `views` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `slug` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `title`, `content`, `user_id`, `up_vote`, `down_vote`, `views`, `created_at`, `updated_at`, `slug`) VALUES
(1, 'day la question 1', 'asdewgrtjhtyj', 11, 0, 0, 0, '2017-02-13 03:58:21', '2017-02-13 03:58:21', 'day-la-question-1'),
(2, 'day la question thu 2', '<p>qwrwergrthrth</p>\r\n', 11, 0, 0, 0, '2017-02-02 09:33:21', '2017-02-02 09:33:21', 'day-la-question-thu-2'),
(3, 'day la question thu n', '<p>day la content thu n</p>\r\n', 11, 0, 0, 0, '2017-02-02 09:33:48', '2017-02-02 09:33:48', 'day-la-question-thu-n'),
(4, 'How does Quincy Larson make money?', '<p>Specifically I am interested to know, if Free Code Camp is free, and Quincy Larson works 100% on Free Code Camp, then how does he support himself and his family?</p>\r\n', 10, 0, 0, 0, '2017-02-03 03:49:18', '2017-02-03 03:49:18', 'how-does-quincy-larson-make-money'),
(5, 'asdwegrth', '<p>thryhytjhytj</p>\r\n', 11, 0, 0, 0, '2017-02-13 03:58:21', '2017-02-13 03:58:21', 'asdwegrth'),
(6, 'wefrehgrt', '<p>ryjtyujyukfgdfgg</p>\r\n\r\n<p>sdfsdfsdf</p>\r\n', 11, 0, 0, 0, '2017-02-13 09:23:01', '2017-02-16 01:20:59', 'wefrehgrt'),
(7, 'efergteh', '<p>juykiuluiolasdasdsadfdfdgfdg</p>\r\n', 11, 0, 0, 0, '2017-02-13 09:23:20', '2017-02-15 06:22:33', 'efergteh'),
(8, 'fergrthtyjty', '<p>esfregrthtyjyuj</p>\r\n', 11, 0, 0, NULL, '2017-02-26 08:06:25', '2017-02-26 08:06:25', 'fergrthtyjty');

-- --------------------------------------------------------

--
-- Table structure for table `question_topics`
--

CREATE TABLE `question_topics` (
  `id` int(11) NOT NULL,
  `question_id` int(11) DEFAULT NULL,
  `topic_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `question_topics`
--

INSERT INTO `question_topics` (`id`, `question_id`, `topic_id`, `created_at`, `updated_at`) VALUES
(1, 1, 2, '2017-02-02 01:32:59', '2017-02-02 01:32:59'),
(2, 1, 3, '2017-02-02 01:32:59', '2017-02-02 01:32:59'),
(3, 1, 1, '2017-02-02 07:52:30', '2017-02-02 07:52:30'),
(4, 2, 1, '2017-02-02 09:33:21', '2017-02-02 09:33:21'),
(5, 2, 3, '2017-02-02 09:33:21', '2017-02-02 09:33:21'),
(6, 3, 1, '2017-02-02 09:33:48', '2017-02-02 09:33:48'),
(7, 3, 2, '2017-02-02 09:33:48', '2017-02-02 09:33:48'),
(8, 4, 2, '2017-02-03 03:49:18', '2017-02-03 03:49:18'),
(9, 4, 4, '2017-02-03 03:49:18', '2017-02-03 03:49:18'),
(10, 5, 1, '2017-02-13 03:58:21', '2017-02-13 03:58:21'),
(11, 5, 3, '2017-02-13 03:58:21', '2017-02-13 03:58:21'),
(12, 7, 1, '2017-02-14 01:40:08', '2017-02-14 01:40:08'),
(13, 7, 3, '2017-02-14 02:00:31', '2017-02-14 02:00:31'),
(14, 6, 1, '2017-02-16 01:20:59', '2017-02-16 01:20:59'),
(15, 6, 3, '2017-02-16 01:20:59', '2017-02-16 01:20:59'),
(16, 8, 4, '2017-02-26 08:06:25', '2017-02-26 08:06:25');

-- --------------------------------------------------------

--
-- Table structure for table `question_users`
--

CREATE TABLE `question_users` (
  `id` int(11) NOT NULL,
  `question_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `schema_migrations`
--

CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `schema_migrations`
--

INSERT INTO `schema_migrations` (`version`) VALUES
('20170118091248'),
('20170118092010'),
('20170118092845'),
('20170118093551'),
('20170118093638'),
('20170118093655'),
('20170118093707'),
('20170118093811'),
('20170118093952'),
('20170119023346'),
('20170119030646'),
('20170123032152'),
('20170123062510'),
('20170125041026'),
('20170126021457'),
('20170126104945'),
('20170128030252'),
('20170128031556'),
('20170130014501'),
('20170213014747'),
('20170221091353');

-- --------------------------------------------------------

--
-- Table structure for table `topics`
--

CREATE TABLE `topics` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `topics`
--

INSERT INTO `topics` (`id`, `name`, `description`, `icon`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Scientic', 'Day la chuyen muc scientic', 'no-image-icon-13.png', 'scientic', '2017-02-02 01:25:39', '2017-02-02 01:25:39'),
(2, 'E commerce', 'Day la chuyen muc e commerce', 'no-image-icon-13.png', 'e-commerce', '2017-02-02 01:25:39', '2017-02-02 01:25:39'),
(3, 'Trending', 'Day la chuyen muc trending', 'no-image-icon-13.png', 'trending', '2017-02-02 01:25:39', '2017-02-02 01:25:39'),
(4, 'Architect', 'Day la chuyen muc architect ne', 'EJ4OyQnd.jpeg', 'architect', '2017-02-02 01:25:39', '2017-02-05 09:31:45'),
(6, 'WordPress', 'WordPress is an online, open source website creation tool written in PHP. But in non-geek speak, it’s probably the easiest and most powerful blogging and website content management system (or CMS) in existence today', 'wordpress-logo-notext-rgb.png', 'wordpress', '2017-02-04 03:37:03', '2017-02-04 03:37:03'),
(7, 'Websites', 'A collection of related web pages containing images, videos or other digital assets.', 'sign-question-icon.png', 'websites', '2017-02-04 08:44:02', '2017-02-04 08:44:02'),
(8, 'Wikipedia', 'Wikipedia is a free, web-based, collaborative, multilingual encyclopedia project supported by the non-profit Wikimedia Foundation (organization). Its 15 million articles (over 4.5 million in English) have been written coll... (more)', 'download.jfif', 'wikipedia', '2017-02-04 08:45:11', '2017-02-04 08:45:11'),
(9, 'MySQL', 'MySQL is an open source relational database system that powers top internet sites like Facebook (product), Yahoo! (company), Quora, FriendFeed (acquired company) etc.', 'download.png', 'mysql', '2017-02-04 08:49:34', '2017-02-04 08:49:34'),
(10, 'English as a Foreign Language', 'English Language learning for those who grew up knowing a language other than English as their main language.  The methodology of teaching English as a Second Language has a slightly different emphasis than the methodology... (more) sss', 'download__1_.png', 'english-as-a-foreign-language', '2017-02-04 08:51:26', '2017-02-13 06:12:30');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `email` varchar(255) NOT NULL DEFAULT '',
  `story` text,
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) DEFAULT NULL,
  `last_sign_in_ip` varchar(255) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `uid` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `role` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `avatar`, `created_at`, `updated_at`, `email`, `story`, `encrypted_password`, `reset_password_token`, `reset_password_sent_at`, `remember_created_at`, `sign_in_count`, `current_sign_in_at`, `last_sign_in_at`, `current_sign_in_ip`, `last_sign_in_ip`, `provider`, `uid`, `slug`, `role`) VALUES
(1, 'Jolie Stokes', NULL, '2017-02-02 01:25:38', '2017-02-10 07:59:23', 'trevor@stoltenberg.biz', 'fergrthyrh', '$2a$11$qIO3jAhFo6KLrvg7GIwq3OIla7hy/8bqAalTrSbp/sgt5rHo4dGhS', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'jolie-stokes', 1),
(2, 'Shannon Bergnaum', 'images__1_.jpg', '2017-02-02 01:25:38', '2017-02-16 01:29:26', 'emmett@toy.biz', 'fhgthtyjuy', '$2a$11$bwH0DP25Txao15ZiXW9/JOIrNXVLLrGIypnenXQ6tIggC3JUrqi5.', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'shannon-bergnaum', 1),
(3, 'Karolann Legros', NULL, '2017-02-02 01:25:38', '2017-02-16 01:29:48', 'marguerite_emmerich@prohaska.biz', 'Karolann Legros story', '$2a$11$1qrOlGsbt81dg2abP0Xh8OaCA5t9s94ZkOnsvPhxDSF7QUnHQPf9C', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'karolann-legros', 2),
(4, 'Mathias Hettinger V', NULL, '2017-02-02 01:25:38', '2017-02-16 03:46:24', 'loren@sauerwunsch.co', NULL, '$2a$11$3HSzME5bbSigipcMOQ9w.ukDD5swne.4Fjg.QEG9i.HOXJw.lF2By', NULL, NULL, NULL, 1, '2017-02-16 02:03:49', '2017-02-16 02:03:49', '127.0.0.1', '127.0.0.1', NULL, NULL, 'mathias-hettinger-v', 1),
(5, 'Natalia Farrell', NULL, '2017-02-02 01:25:38', '2017-02-02 01:25:38', 'giles.schamberger@johnstonfarrell.org', NULL, '$2a$11$mos55pU16.pXx2a6MIu6/.QJv02/3Fmx4gyvtWESvPpQf9JhP2jie', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'natalia-farrell', 1),
(6, '', NULL, '2017-02-02 01:25:39', '2017-02-08 06:25:45', 'daphnee.oreilly@medhurstoconner.org', '', '$2a$11$LASmy51dhZ8ZvhvI3/IKOu/6Yg4I6TMRScPG0Df5UExUn1ahi6pWW', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'carissa-reichert', 1),
(7, 'Athena Ruecker', 'large.jpg', '2017-02-02 01:25:39', '2017-02-05 07:44:58', 'shanny@ritchie.info', 'day la story cua ngay Athena Ruecker', '$2a$11$fTRqnB3lYGFwp128/kPrCu4/sFRQ/cno/6cKCjaxdVuqXdqj2yOCG', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'athena-ruecker', 1),
(8, 'Giovanna Kulas', NULL, '2017-02-02 01:25:39', '2017-02-08 06:35:05', 'manuela@thiel.name', 'asdas', '$2a$11$0Glf3V.feJz7G29bdHXi9OPeNj4alNrdStJYIE9Mc/Fn4OrOOV41S', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'giovanna-kulas', 1),
(9, 'Miss Gerson Barrows', NULL, '2017-02-02 01:25:39', '2017-02-02 01:25:39', 'bette_mcglynn@pollich.name', NULL, '$2a$11$94yt4QQvjfVve/YCrZ8ca.W3XyrqyezDXJ6fPD/Nk140CaeHlB/9q', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'miss-gerson-barrows', 1),
(10, 'Charlotte Rogahn', NULL, '2017-02-02 01:25:39', '2017-02-02 01:25:39', 'glenda.reinger@dach.biz', NULL, '$2a$11$g9VvXcHCHxTQulFm3bRIE.IGoXlK3WQewKAyVqSGyd7.yp.vyimPW', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'charlotte-rogahn', 1),
(11, 'Phan Ngoc', 'images.jpg', '2017-02-02 01:29:49', '2017-02-26 07:46:01', 'phann123@yahoo.com', 'day la story cua Ngoc', '$2a$11$MqOGQTF3ssTnf8KlJfaMN.L6a9RJBDQcy.htpyrpGhnwGNKLZybKO', NULL, NULL, '2017-02-16 03:46:40', 9, '2017-02-26 07:46:01', '2017-02-16 03:46:40', '::1', '127.0.0.1', NULL, NULL, 'phan-ngoc', 0),
(12, 'nhantay', NULL, '2017-02-03 02:49:12', '2017-02-03 02:49:12', 'tusss@gmail.com', NULL, '$2a$11$qfiHOalwaAWWyS0t1NfKuO65pqryTCTnaD6kv0uCs37pHi.DftFPm', NULL, NULL, NULL, 1, '2017-02-03 02:49:12', '2017-02-03 02:49:12', '127.0.0.1', '127.0.0.1', NULL, NULL, 'nhantay', 1),
(13, 'nhasdwe', 'spring-04.jpg', '2017-02-03 02:54:49', '2017-02-03 02:54:49', 'asdrg@dsf.asdf', NULL, '$2a$11$wmuq4S5Q5xJu674RqO7.Xe5DfFa6i4R0q295SX1XjOxs5XXpSGztq', NULL, NULL, NULL, 1, '2017-02-03 02:54:49', '2017-02-03 02:54:49', '127.0.0.1', '127.0.0.1', NULL, NULL, 'nhasdwe', 1),
(14, 'bombay', 'spring.jpg', '2017-02-03 03:03:11', '2017-02-05 07:41:30', 'leqsd@gmail.comsd', 'day la tieu su cua toi ne aeee ffrsdsssd dsdsd', '$2a$11$gHWhyOjpXvNJWzqKnwbdTesD87G0MSZV8UH0FRKeByvEz5xjIwSfC', NULL, NULL, NULL, 1, '2017-02-03 03:03:11', '2017-02-03 03:03:11', '127.0.0.1', '127.0.0.1', NULL, NULL, 'bombay', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_topics`
--

CREATE TABLE `user_topics` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `topic_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `version_answers`
--

CREATE TABLE `version_answers` (
  `id` int(11) NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `answer_target` int(11) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `version_questions`
--

CREATE TABLE `version_questions` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `question_target` int(11) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `version_questions`
--

INSERT INTO `version_questions` (`id`, `title`, `content`, `user_id`, `question_target`, `version`, `status`, `created_at`, `updated_at`) VALUES
(3, 'How does Quincy Larson make money?', '<p>Specifically I am interested to know, if Free Code Camp is free, and Quincy Larson works 100% on Free Code Camp, then how does he support himself and his family?s</p>\r\n', 11, 4, 0, 1, '2017-02-16 06:08:29', '2017-02-16 06:08:29'),
(4, 'How does Quincy Larson make money?', 'sadasdwdwetger', 11, 4, 1, 1, '2017-02-16 06:19:31', '2017-02-16 06:19:31'),
(5, 'How does Quincy Larson make money?', '<p>Specifically I am interested to know, if Free Code Camp is free, and Quincy Larson works 100% on Free Code Camp, then how does he support himself and his family?addedf</p>\r\n', 11, 4, 2, 2, '2017-02-16 06:20:13', '2017-02-16 08:43:27'),
(6, 'How does Quincy Larson make money?', '<p>Specifically I am interested to know, bon day</p>\r\n', 11, 4, 3, 1, '2017-02-16 08:58:01', '2017-02-16 09:29:59'),
(7, 'How does Quincy Larson ?', '<p>Specifically I am interested to know, if Free Code Camp is free, and Quincy Larson works 100% on Free Code Camp, then how does he support himself and his family?s</p>\r\n', 11, 4, 4, 1, '2017-02-16 09:04:20', '2017-02-16 09:46:05'),
(8, 'How does Quincy Larson ?', '**Specifically I am interested to know**, \r\n*if Free Code Camp is free*, and Quincy Larson works 100% on Free Code Camp, then how does he support himself and his family?s\r\n', 11, 4, 5, 0, '2017-02-17 07:22:11', '2017-02-17 07:22:11'),
(9, 'How does Quincy Larson ?', '* <p>Specifically I am interested to know\r\n* , if Free Code Camp is free, and Quincy Larson works 100% on \r\n* Free Code Camp, then how does he support himself and his family?\r\n', 11, 4, 6, 0, '2017-02-17 07:23:30', '2017-02-17 07:23:30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `actions`
--
ALTER TABLE `actions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_activities_on_trackable_id_and_trackable_type` (`trackable_id`,`trackable_type`),
  ADD KEY `index_activities_on_owner_id_and_owner_type` (`owner_id`,`owner_type`),
  ADD KEY `index_activities_on_recipient_id_and_recipient_type` (`recipient_id`,`recipient_type`);

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ar_internal_metadata`
--
ALTER TABLE `ar_internal_metadata`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `ckeditor_assets`
--
ALTER TABLE `ckeditor_assets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_ckeditor_assets_on_type` (`type`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delayed_jobs`
--
ALTER TABLE `delayed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `delayed_jobs_priority` (`priority`,`run_at`);

--
-- Indexes for table `follows`
--
ALTER TABLE `follows`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `friendly_id_slugs`
--
ALTER TABLE `friendly_id_slugs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope` (`slug`,`sluggable_type`,`scope`),
  ADD KEY `index_friendly_id_slugs_on_sluggable_id` (`sluggable_id`),
  ADD KEY `index_friendly_id_slugs_on_slug_and_sluggable_type` (`slug`,`sluggable_type`),
  ADD KEY `index_friendly_id_slugs_on_sluggable_type` (`sluggable_type`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `question_topics`
--
ALTER TABLE `question_topics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `question_users`
--
ALTER TABLE `question_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schema_migrations`
--
ALTER TABLE `schema_migrations`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `topics`
--
ALTER TABLE `topics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index_users_on_email` (`email`),
  ADD UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`);

--
-- Indexes for table `user_topics`
--
ALTER TABLE `user_topics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `version_answers`
--
ALTER TABLE `version_answers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `version_questions`
--
ALTER TABLE `version_questions`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `actions`
--
ALTER TABLE `actions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=222;
--
-- AUTO_INCREMENT for table `activities`
--
ALTER TABLE `activities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;
--
-- AUTO_INCREMENT for table `answers`
--
ALTER TABLE `answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `ckeditor_assets`
--
ALTER TABLE `ckeditor_assets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `delayed_jobs`
--
ALTER TABLE `delayed_jobs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `follows`
--
ALTER TABLE `follows`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `friendly_id_slugs`
--
ALTER TABLE `friendly_id_slugs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `question_topics`
--
ALTER TABLE `question_topics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `question_users`
--
ALTER TABLE `question_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `topics`
--
ALTER TABLE `topics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `user_topics`
--
ALTER TABLE `user_topics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `version_answers`
--
ALTER TABLE `version_answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `version_questions`
--
ALTER TABLE `version_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
