-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 02, 2020 at 11:15 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel_ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Super Admin' COMMENT 'Admin|Super Admin',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `password`, `phone_no`, `avatar`, `type`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin Ahmed', 'afzalshuhag16@gmail.com', '$2y$10$6YJwAz4cl7MaUCtY.E3/He0MvQUndoibo7eJwHIyuDdGJ5q9WrRam', '01234567', NULL, 'Super Admin', 'FdcOOLT2CHGaiHz0whxiB5Wzrt3XFU1dJ8RECL0jj9GhI2qvnTWVKygcTsiK', '2020-09-18 15:12:35', '2020-09-25 10:37:06');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `description`, `image`, `created_at`, `updated_at`) VALUES
(2, 'Sony', 'Sony', '1598645310.png', '2020-08-28 14:06:28', '2020-08-28 14:08:30'),
(3, 'Walton', NULL, '1598645297.png', '2020-08-28 14:08:19', '2020-08-28 14:08:19'),
(4, 'Others', NULL, NULL, '2020-08-28 14:09:27', '2020-08-28 14:09:27');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_quantity` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `product_id`, `user_id`, `order_id`, `ip_address`, `product_quantity`, `created_at`, `updated_at`) VALUES
(15, 5, NULL, 1, '127.0.0.1', 1, '2020-09-19 13:56:20', '2020-09-19 13:56:41'),
(17, 5, NULL, 2, '127.0.0.1', 1, '2020-09-19 13:56:56', '2020-09-19 13:57:17'),
(20, 5, 5, 3, '127.0.0.1', 1, '2020-09-19 14:13:40', '2020-09-19 14:13:56'),
(26, 5, 5, 4, '127.0.0.1', 2, '2020-09-30 15:42:57', '2020-09-30 15:49:41'),
(29, 4, 7, NULL, '127.0.0.1', 1, '2020-09-30 15:50:30', '2020-09-30 15:50:30'),
(31, 5, NULL, 5, '::1', 2, '2020-10-01 13:48:03', '2020-10-02 14:43:22'),
(32, 4, NULL, 5, '::1', 1, '2020-10-01 13:48:05', '2020-10-01 14:57:02'),
(33, 1, NULL, 5, '::1', 1, '2020-10-01 13:48:09', '2020-10-01 14:57:02'),
(36, 24, NULL, NULL, '::1', 2, '2020-10-02 14:09:05', '2020-10-02 14:43:12'),
(37, 18, NULL, NULL, '::1', 1, '2020-10-02 14:43:05', '2020-10-02 14:43:05'),
(38, 16, 5, NULL, '::1', 2, '2020-10-02 14:55:59', '2020-10-02 14:56:06');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `image`, `parent_id`, `created_at`, `updated_at`) VALUES
(7, 'Fashion', 'Fashion Category', '1598628699.png', NULL, '2020-08-28 09:31:40', '2020-08-28 09:31:40'),
(8, 'Electronics', NULL, '1598628845.png', NULL, '2020-08-28 09:34:07', '2020-10-02 13:42:02'),
(9, 'Gadgett', NULL, '1598628936.png', NULL, '2020-08-28 09:35:36', '2020-10-01 14:23:04'),
(10, 'Fan', NULL, NULL, 8, '2020-10-02 13:42:51', '2020-10-02 13:43:09'),
(11, 'Pant', NULL, NULL, 7, '2020-10-02 13:43:58', '2020-10-02 13:43:58'),
(12, 'Shoe', NULL, NULL, 7, '2020-10-02 13:44:18', '2020-10-02 13:44:18');

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

CREATE TABLE `districts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `division_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `districts`
--

INSERT INTO `districts` (`id`, `name`, `division_id`, `created_at`, `updated_at`) VALUES
(1, 'Sylhet', 4, '2020-09-03 11:01:41', '2020-09-03 11:01:41'),
(4, 'Sylhet Sadar 2', 4, '2020-09-03 11:07:43', '2020-09-03 11:22:30'),
(6, 'Dhaka Sadar', 6, '2020-09-26 12:26:07', '2020-09-26 12:26:07'),
(7, 'Khulna sadar', 5, '2020-09-26 12:26:39', '2020-09-26 12:26:39');

-- --------------------------------------------------------

--
-- Table structure for table `divisions`
--

CREATE TABLE `divisions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `divisions`
--

INSERT INTO `divisions` (`id`, `name`, `priority`, `created_at`, `updated_at`) VALUES
(3, 'Rajshahi', 2, '2020-09-02 10:54:50', '2020-09-02 10:54:50'),
(4, 'Sylhet', 8, '2020-09-02 10:55:08', '2020-09-02 10:55:08'),
(5, 'Khulna', 3, '2020-09-02 10:55:34', '2020-09-02 10:55:34'),
(6, 'Dhaka', 1, '2020-09-26 12:25:45', '2020-09-26 12:25:45');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
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
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2020_08_13_200954_create_products_table', 2),
(6, '2020_08_22_202847_create_categories_table', 2),
(7, '2020_08_22_203029_create_brands_table', 2),
(10, '2020_08_23_165248_create_product_images_table', 3),
(12, '2014_10_12_000000_create_users_table', 4),
(13, '2020_09_02_153745_create_divisions_table', 5),
(14, '2020_09_02_153925_create_districts_table', 5),
(16, '2020_09_13_135536_create_carts_table', 6),
(17, '2020_09_15_184926_create_settings_table', 7),
(18, '2020_09_15_193519_create_payments_table', 8),
(20, '2020_08_22_203120_create_admins_table', 10),
(21, '2020_09_13_135218_create_orders_table', 11),
(22, '2020_09_26_190839_create_sliders_table', 12);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_paid` tinyint(1) NOT NULL DEFAULT 0,
  `is_completed` tinyint(1) NOT NULL DEFAULT 0,
  `is_seen_by_admin` tinyint(1) NOT NULL DEFAULT 0,
  `transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `payment_id` bigint(20) UNSIGNED NOT NULL,
  `shipping_charge` int(11) NOT NULL DEFAULT 60,
  `custom_discount` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `ip_address`, `name`, `phone_no`, `shipping_address`, `email`, `message`, `is_paid`, `is_completed`, `is_seen_by_admin`, `transaction_id`, `created_at`, `updated_at`, `payment_id`, `shipping_charge`, `custom_discount`) VALUES
(1, NULL, '127.0.0.1', 'Som', '444', 'qe', 'aronbotham@gmail.com', NULL, 0, 0, 0, NULL, '2020-09-19 13:56:41', '2020-09-19 13:56:41', 1, 60, 0),
(2, NULL, '127.0.0.1', 'jjj', '666', 'hu', 'afzalhussainshuhag@gmail.com', NULL, 0, 0, 1, NULL, '2020-09-19 13:57:17', '2020-09-25 14:25:11', 1, 60, 0),
(3, 5, '127.0.0.1', 'Afzal Shuhag', '017666666', 'new', 'afzalshuhag16@gmail.com', NULL, 0, 0, 1, '34343434', '2020-09-19 14:13:56', '2020-09-30 14:16:31', 2, 100, 20),
(4, 5, '127.0.0.1', 'Afzal Shuhag', '017666666', 'new', 'afzalshuhag16@gmail.com', NULL, 0, 0, 1, '34343434', '2020-09-30 15:49:41', '2020-10-01 13:45:42', 2, 60, 0),
(5, NULL, '::1', 'Household', '6666666', 'drfd', 'afzalhussainshuhag@gmail.com', '34r', 1, 1, 1, NULL, '2020-10-01 14:57:02', '2020-10-01 14:58:15', 1, 60, 20);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority` tinyint(4) NOT NULL DEFAULT 1,
  `short_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Payment No',
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Agent | Personal',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `name`, `image`, `priority`, `short_name`, `no`, `type`, `created_at`, `updated_at`) VALUES
(1, 'Cash On', 'cash_in.png', 1, 'cash_on', NULL, NULL, '2020-09-15 19:42:57', NULL),
(2, 'Bkash', 'bkash.png', 2, 'bkash', '018888888', 'Personal', '2020-09-15 19:44:19', NULL),
(3, 'Rocket', 'rocket.png', 3, 'rocket', '017777777', 'Personal', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `brand_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `price` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `offer_price` int(11) DEFAULT NULL,
  `admin_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `brand_id`, `title`, `description`, `slug`, `quantity`, `price`, `status`, `offer_price`, `admin_id`, `created_at`, `updated_at`) VALUES
(1, 9, 4, 'Samsung Galaxy', 'Samsung GalaxySamsung GalaxySamsung GalaxyvSamsung GalaxyvvSamsung GalaxySamsung GalaxySamsung GalaxySamsung GalaxySamsung GalaxySamsung GalaxySamsung GalaxySamsung GalaxySamsung GalaxySamsung GalaxySamsung GalaxySamsung Galaxy', 'Samsung-Galaxy', 1, 10000, 1, NULL, 1, '2020-08-13 16:36:27', '2020-10-02 13:51:39'),
(4, 9, 4, 'New Product 2', 'new product details..', 'new-product', 100, 99999, 0, NULL, 1, '2020-08-24 12:28:32', '2020-08-24 15:50:47'),
(5, 9, 4, 'Iphone X new', 'iphone x new', 'iphone-x-new', 0, 200000, 0, NULL, 1, '2020-08-25 04:37:01', '2020-10-02 13:45:57'),
(15, 11, 4, 'Boys Stylish Pant', 'Boys Pant Stylish', 'boys-stylish-pant', 20, 450, 0, NULL, 1, '2020-10-02 13:48:26', '2020-10-02 13:48:26'),
(16, 12, 4, 'Boys Show Casual', 'Shoe', 'boys-show-casual', 100, 760, 0, NULL, 1, '2020-10-02 13:49:25', '2020-10-02 13:49:25'),
(17, 11, 4, 'Boys Fashion Shirt Pant', 'Boys Fashion Shirt Pant. Boys Fashion Shirt Pant', 'boys-fashion-shirt-pant', 10, 1200, 0, NULL, 1, '2020-10-02 13:50:30', '2020-10-02 13:50:30'),
(18, 9, 2, 'Sony Camera', 'A product of Sony', 'sony-camera', 5, 12000, 0, NULL, 1, '2020-10-02 13:56:46', '2020-10-02 13:56:46'),
(19, 8, 4, 'AC-1', 'This is AC .', 'ac-1', 5, 100000, 0, NULL, 1, '2020-10-02 13:57:49', '2020-10-02 13:57:49'),
(20, 12, 4, 'Show Red', 'This is show', 'show-red', 4, 790, 0, NULL, 1, '2020-10-02 13:58:53', '2020-10-02 13:58:53'),
(21, 10, 4, 'Sipmle Fan', 'This is Sipmle Fan', 'sipmle-fan', 10, 3000, 0, NULL, 1, '2020-10-02 13:59:57', '2020-10-02 13:59:57'),
(22, 11, 4, 'Boy Jeans Pant', 'Boy Jeans Pant', 'boy-jeans-pant', 2, 500, 0, NULL, 1, '2020-10-02 14:00:50', '2020-10-02 14:00:50'),
(23, 8, 2, 'Fan', 'This fan is great', 'fan', 12, 2000, 0, NULL, 1, '2020-10-02 14:01:44', '2020-10-02 14:01:44'),
(24, 9, 4, 'Camera Nikon', 'This is great nikon camera', 'camera-nikon', 2, 60000, 0, NULL, 1, '2020-10-02 14:02:30', '2020-10-02 14:02:30'),
(25, 11, 4, 'Pant White', 'This is white jeans', 'pant-white', 4, 2200, 0, NULL, 1, '2020-10-02 14:03:35', '2020-10-02 14:03:35'),
(26, 9, 4, 'Iphone 6', 'grat phone', 'iphone-6', 3, 40000, 0, NULL, 1, '2020-10-02 14:04:26', '2020-10-02 14:04:26'),
(27, 11, 4, 'Tight Boys Pant', 'Great Comfort', 'tight-boys-pant', 3, 500, 0, NULL, 1, '2020-10-02 14:05:48', '2020-10-02 14:05:48'),
(28, 12, 4, 'Black Converse Shoe', 'Stylish for boys', 'black-converse-shoe', 44, 450, 0, NULL, 1, '2020-10-02 14:06:28', '2020-10-02 14:06:28');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `image`, `created_at`, `updated_at`) VALUES
(1, 5, '1.png', NULL, NULL),
(3, 1, '3.png', NULL, NULL),
(4, 4, '1598293712.png', '2020-08-24 12:28:32', '2020-08-24 12:28:32'),
(5, 4, '1598293712.png', '2020-08-24 12:28:32', '2020-08-24 12:28:32'),
(6, 4, '1598293712.png', '2020-08-24 12:28:33', '2020-08-24 12:28:33'),
(7, 5, '1598351821.png', '2020-08-25 04:37:02', '2020-08-25 04:37:02'),
(8, 6, '1598352006.png', '2020-08-25 04:40:06', '2020-08-25 04:40:06'),
(9, 7, '1598352038.png', '2020-08-25 04:40:38', '2020-08-25 04:40:38'),
(10, 8, '1598463243.png', '2020-08-26 11:34:03', '2020-08-26 11:34:03'),
(21, 15, '16016681060.png', '2020-10-02 13:48:26', '2020-10-02 13:48:26'),
(22, 16, '16016681650.png', '2020-10-02 13:49:25', '2020-10-02 13:49:25'),
(23, 17, '16016682300.png', '2020-10-02 13:50:30', '2020-10-02 13:50:30'),
(24, 18, '16016686060.png', '2020-10-02 13:56:46', '2020-10-02 13:56:46'),
(25, 19, '16016686690.png', '2020-10-02 13:57:49', '2020-10-02 13:57:49'),
(26, 20, '16016687330.png', '2020-10-02 13:58:53', '2020-10-02 13:58:53'),
(27, 21, '16016687970.jpg', '2020-10-02 13:59:57', '2020-10-02 13:59:57'),
(28, 22, '16016688500.jpg', '2020-10-02 14:00:50', '2020-10-02 14:00:50'),
(29, 23, '16016689040.jpg', '2020-10-02 14:01:44', '2020-10-02 14:01:44'),
(30, 24, '16016689500.jpg', '2020-10-02 14:02:30', '2020-10-02 14:02:30'),
(31, 25, '16016690150.jpg', '2020-10-02 14:03:35', '2020-10-02 14:03:35'),
(32, 26, '16016690660.png', '2020-10-02 14:04:26', '2020-10-02 14:04:26'),
(33, 27, '16016691480.png', '2020-10-02 14:05:48', '2020-10-02 14:05:48'),
(34, 28, '16016691880.png', '2020-10-02 14:06:28', '2020-10-02 14:06:28');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_cost` int(10) UNSIGNED NOT NULL DEFAULT 100,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `email`, `phone`, `address`, `shipping_cost`, `created_at`, `updated_at`) VALUES
(1, 'test@gmail.com', '01888888', 'Dhaka,100', 100, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `button_text` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `button_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority` tinyint(3) UNSIGNED NOT NULL DEFAULT 10,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `title`, `image`, `button_text`, `button_link`, `priority`, `created_at`, `updated_at`) VALUES
(5, 'Slider one', '1601502521.jpg', 'Button Text', 'https://www.facebook.com/', 1, '2020-09-30 07:11:26', '2020-09-30 15:48:41'),
(6, 'Slider Two', '1601502530.jpg', 'Button Text', 'https://www.facebook.com/', 2, '2020-09-30 07:11:48', '2020-09-30 15:48:50'),
(7, 'Slider Three', '1601502539.jpg', 'Button Text', 'https://www.facebook.com/', 3, '2020-09-30 07:12:24', '2020-09-30 15:49:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `street_address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `division_id` int(10) UNSIGNED NOT NULL,
  `district_id` int(10) UNSIGNED NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0=inactive|1=active|2=ban',
  `shipping_address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `username`, `phone_no`, `email`, `password`, `email_verified_at`, `street_address`, `division_id`, `district_id`, `status`, `shipping_address`, `avatar`, `ip_address`, `remember_token`, `created_at`, `updated_at`) VALUES
(5, 'Afzal', 'Shuhag', 'afzalshuhag', '017666666', 'afzalshuhag16@gmail.com', '$2y$10$jMzOT8Q/34xzy12yCnNgcO08/mfrBko8MMu6.qkJxVeiJD.KQkUnm', NULL, '102, major tila', 4, 4, 1, 'new', NULL, '127.0.0.1', NULL, '2020-09-05 13:03:07', '2020-09-08 10:00:02'),
(7, 'Afzal', 'Hussain', 'afzalhussain', '0178888', 'afzalhussainshuhag@gmail.com', '$2y$10$7QVyQK1ApI1MP1o9E3okNuEYHe9.c1JCjnawzWLx.52zpHzknqSeK', NULL, '102, mohini', 4, 1, 1, NULL, NULL, '127.0.0.1', NULL, '2020-09-06 11:28:41', '2020-09-06 11:29:06');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_user_id_foreign` (`user_id`),
  ADD KEY `carts_product_id_foreign` (`product_id`),
  ADD KEY `carts_order_id_foreign` (`order_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `districts`
--
ALTER TABLE `districts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `divisions`
--
ALTER TABLE `divisions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_payment_id_foreign` (`payment_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `payments_short_name_unique` (`short_name`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_phone_no_unique` (`phone_no`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `districts`
--
ALTER TABLE `districts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `divisions`
--
ALTER TABLE `divisions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_payment_id_foreign` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
