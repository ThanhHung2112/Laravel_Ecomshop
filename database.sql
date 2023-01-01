-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 01, 2023 at 05:10 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel02`
--

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `price` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `size` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `product_id`, `user_id`, `quantity`, `price`, `created_at`, `updated_at`, `size`) VALUES
(43, 8, 2, 1, 840000, NULL, NULL, 'M');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subcategory_count` int(11) NOT NULL DEFAULT 0,
  `product_count` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `slug`, `subcategory_count`, `product_count`, `created_at`, `updated_at`) VALUES
(12, 'Men Fashion', 'men-fashion', 3, 14, NULL, '2023-01-01 08:49:11'),
(13, 'Lady Fashion', 'lady-fashion', 3, 9, NULL, '2023-01-01 08:58:28');

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
(5, '2022_12_10_103416_laratrust_setup_tables', 2),
(6, '2022_12_13_152342_create_categories_table', 3),
(7, '2022_12_13_153611_create_subcategories_table', 4),
(8, '2022_12_13_154426_create_products_table', 5),
(9, '2022_12_27_152813_create_carts_table', 6),
(10, '2022_12_30_103813_create_totals_table', 7),
(11, '2022_12_30_144711_create_orders_table', 8),
(12, '2022_12_31_105721_create_sizes_table', 9),
(13, '2023_01_01_070857_create_shipinginfs_table', 10);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cart_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `size` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `node` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `cart_id`, `product_id`, `user_id`, `quantity`, `price`, `created_at`, `updated_at`, `size`, `address`, `phone_number`, `node`, `city_name`) VALUES
(27, 41, 18, 2, 1, 4500000, NULL, NULL, 'M', '123 Dien bien Phu', '0791234567', 'Giao hàng vào giờ hành chính nhé', 'Hue'),
(28, 42, 19, 2, 2, 11800000, NULL, NULL, 'XL', '123 Dien bien Phu', '0791234567', 'Giao hàng vào giờ hành chính nhé', 'Hue');

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
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'users-create', 'Create Users', 'Create Users', '2022-12-10 03:42:49', '2022-12-10 03:42:49'),
(2, 'users-read', 'Read Users', 'Read Users', '2022-12-10 03:42:49', '2022-12-10 03:42:49'),
(3, 'users-update', 'Update Users', 'Update Users', '2022-12-10 03:42:49', '2022-12-10 03:42:49'),
(4, 'users-delete', 'Delete Users', 'Delete Users', '2022-12-10 03:42:49', '2022-12-10 03:42:49'),
(5, 'payments-create', 'Create Payments', 'Create Payments', '2022-12-10 03:42:49', '2022-12-10 03:42:49'),
(6, 'payments-read', 'Read Payments', 'Read Payments', '2022-12-10 03:42:49', '2022-12-10 03:42:49'),
(7, 'payments-update', 'Update Payments', 'Update Payments', '2022-12-10 03:42:49', '2022-12-10 03:42:49'),
(8, 'payments-delete', 'Delete Payments', 'Delete Payments', '2022-12-10 03:42:49', '2022-12-10 03:42:49'),
(9, 'profile-read', 'Read Profile', 'Read Profile', '2022-12-10 03:42:49', '2022-12-10 03:42:49'),
(10, 'profile-update', 'Update Profile', 'Update Profile', '2022-12-10 03:42:49', '2022-12-10 03:42:49');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 2),
(3, 1),
(3, 2),
(4, 1),
(4, 2),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(9, 2),
(10, 1),
(10, 2);

-- --------------------------------------------------------

--
-- Table structure for table `permission_user`
--

CREATE TABLE `permission_user` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `user_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
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
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_short_des` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_long_des` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `product_category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_subcategory_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_category_id` int(11) NOT NULL,
  `product_subcategory_id` int(11) NOT NULL,
  `product_img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_name`, `product_short_des`, `product_long_des`, `price`, `product_category_name`, `product_subcategory_name`, `product_category_id`, `product_subcategory_id`, `product_img`, `quantity`, `slug`, `created_at`, `updated_at`) VALUES
(8, 'Giày Boots nam da bò Storm Chunky Combat Boots', '✔ Da bò 100%\r\n\r\n✔ Bảo hành miễn phí 12 tháng\r\n\r\n✔ 1 đổi 1 miễn phí nếu lỗi từ nhà sản xuất', '– Khách hàng chọn size vui lòng giảm 1 size so với Sneaker\r\n\r\n👉Chất liêu: Da bò nguyên tấm (bao test lửa)\r\n\r\n👉Đế: Cao su tự nhiên, cao su đúc nguyên khối, cao 4.5 cm\r\n\r\nSản phẩm bảo hành 1 năm!', 840000, 'Men Fashion', 'Combat Boost', 12, 7, 'upload/1753826734882298.png', 100, 'giày-boots-nam-da-bò-storm-chunky-combat-boots', NULL, NULL),
(9, 'Giày da nam da bò Combat Boots Captain 01', '1 đổi 1 nếu có lỗi do nhà sản xuất.\r\nHàng giống y như hình, ảnh thật 100%, không giống tặng luôn giày.', 'Da Bò 100%\r\nBảo hành #miễn_phí 1 năm\r\n1 đổi 1 nếu đi cảm thấy ko vừa size\r\nGiao hàng toàn quốc, Chỉ thanh toán sau khi nhận được hàng', 680000, 'Men Fashion', 'Combat Boost', 12, 7, 'upload/1753826897026049.png', 1000, 'giày-da-nam-da-bò-combat-boots-captain-01', NULL, NULL),
(10, 'Giày Boots Moctoe Đen da sáp', '✔ Bảo hành #miễn_phí 1 năm\r\n\r\n✔ 1 đổi 1 nếu đi cảm thấy ko vừa size\r\n\r\n✔ Giao hàng toàn quốc, Chỉ thanh toán sau khi nhận được hàng\r\n\r\n✔ 100% ảnh chụp thật từ màu sắc, kích cỡ, chất liệu…', '✔ 100% ảnh chụp thật từ màu sắc, kích cỡ, chất liệu…\r\n\r\n✔ 100% Da Bò Sáp mộc\r\n\r\n✔ 1 đổi 1 nếu có lỗi do nhà sản xuất.\r\n\r\n✔ Hàng giống y như hình, ảnh thật 100%, không giống tặng luôn giày', 945000, 'Men Fashion', 'Combat Boost', 12, 7, 'upload/1753827174163247.png', 1200, 'giày-boots-moctoe-Đen-da-sáp', NULL, NULL),
(11, 'Giày Combat Boots Doc.058 Full Black', 'Da Bò Sáp100%\r\nBảo hành #miễn_phí 1 năm\r\n1 đổi 1 nếu đi cảm thấy ko vừa size\r\nGiao hàng toàn quốc, Chỉ thanh toán sau khi nhận được hàng', 'Da Bò Sáp100%\r\nBảo hành #miễn_phí 1 năm\r\n1 đổi 1 nếu đi cảm thấy ko vừa size\r\nGiao hàng toàn quốc, Chỉ thanh toán sau khi nhận được hàng\r\n100% ảnh chụp thật từ màu sắc, kích cỡ, chất liệu…\r\n100% #da_bò_nguyên_tấm, đế cao su nệm khí\r\n1 đổi 1 nếu có lỗi do nhà sản xuất.\r\nHàng giống y như hình, ảnh thật 100%, không giống tặng luôn giày.', 640000, 'Men Fashion', 'Combat Boost', 12, 7, 'upload/1753827552174294.png', 1000, 'giày-combat-boots-doc.058-full-black', NULL, NULL),
(12, 'Giày Boots Dr.1460 Đen Nhám (050)', 'Bảo hành #miễn_phí 1 năm 1 đổi 1 nếu đi cảm thấy ko vừa size\r\nGiao hàng toàn quốc, Chỉ thanh toán sau khi nhận được hàng\r\n100% ảnh chụp thật từ màu sắc, kích cỡ, chất liệu…', 'Bảo hành #miễn_phí 1 năm 1 đổi 1 nếu đi cảm thấy ko vừa size\r\nGiao hàng toàn quốc, Chỉ thanh toán sau khi nhận được hàng\r\n100% ảnh chụp thật từ màu sắc, kích cỡ, chất liệu…\r\n100% #da_bò_nguyên_tấm, đế cao su nệm khí 1 đổi 1 nếu có lỗi do nhà sản xuất.\r\nHàng giống y như hình, ảnh thật 100%, không giống tặng luôn giày.\r\nFullbox – Size: 35, 36,37, 38,39,40,41,42,43,44', 425000, 'Men Fashion', 'Combat Boost', 12, 7, 'upload/1753827805384157.png', 1300, 'giày-boots-dr.1460-Đen-nhám-(050)', NULL, NULL),
(13, 'Giày Boots Dr.058 Zip Da bò', 'Da Bò 100%\r\nBảo hành #miễn_phí 1 năm\r\n1 đổi 1 nếu đi cảm thấy ko vừa size\r\nGiao hàng toàn quốc, Chỉ thanh toán sau khi nhận được hàng', '100% ảnh chụp thật từ màu sắc, kích cỡ, chất liệu…\r\n100% #da_bò_nguyên_tấm, đế cao su nệm khí\r\n1 đổi 1 nếu có lỗi do nhà sản xuất.\r\nHàng giống y như hình, ảnh thật 100%, không giống tặng luôn giày.', 640000, 'Men Fashion', 'Combat Boost', 12, 7, 'upload/1753828233402320.png', 12012, 'giày-boots-dr.058-zip-da-bò', NULL, NULL),
(14, 'Giày da Chelsea Boots Zip Classic', 'Da Bò 100%\r\nBảo hành #miễn_phí 1 năm\r\n1 đổi 1 nếu đi cảm thấy ko vừa size\r\nGiao hàng toàn quốc, Chỉ thanh toán sau khi nhận được hàng', '100% ảnh chụp thật từ màu sắc, kích cỡ, chất liệu…\r\n100% #da_bò_nguyên_tấm, đế cao su nệm khí\r\n1 đổi 1 nếu có lỗi do nhà sản xuất.\r\nHàng giống y như hình, ảnh thật 100%, không giống tặng luôn giày.\r\nFullbox – Size: 38,39,40,41,42,43,44', 635000, 'Men Fashion', 'Chelsea Boots', 12, 8, 'upload/1753828388546834.png', 1232, 'giày-da-chelsea-boots-zip-classic', NULL, '2023-01-01 08:36:49'),
(15, 'Chelsea Boots Classic mũi tròn', 'Da Bò 100%\r\nBảo hành #miễn_phí 1 năm\r\n1 đổi 1 nếu đi cảm thấy ko vừa size', 'Giao hàng toàn quốc, Chỉ thanh toán sau khi nhận được hàng\r\n100% ảnh chụp thật từ màu sắc, kích cỡ, chất liệu…\r\n100% #da_bò_nguyên_tấm, đế cao su nệm khí\r\n1 đổi 1 nếu có lỗi do nhà sản xuất.\r\nHàng giống y như hình, ảnh thật 100%, không giống tặng luôn giày.', 595000, 'Men Fashion', 'Chelsea Boots', 12, 8, 'upload/1753828759825427.png', 1300, 'chelsea-boots-classic-mũi-tròn', NULL, NULL),
(16, 'Giày Chelsea Zip Boots Brown da bò', 'Da Bò 100%\r\nBảo hành #miễn_phí 1 năm\r\n1 đổi 1 nếu đi cảm thấy ko vừa size\r\nGiao hàng toàn quốc, Chỉ thanh toán sau khi nhận được hàng', '100% ảnh chụp thật từ màu sắc, kích cỡ, chất liệu…\r\n100% #da_bò_nguyên_tấm, đế cao su nệm khí\r\n1 đổi 1 nếu có lỗi do nhà sản xuất.\r\nHàng giống y như hình, ảnh thật 100%, không giống tặng luôn giày.', 635000, 'Men Fashion', 'Chelsea Boots', 12, 8, 'upload/1753829508597684.png', 1203, 'giày-chelsea-zip-boots-brown-da-bò', NULL, NULL),
(17, 'Giày Dr.2976 Crazy Horse', 'Bảo hành #miễn_phí 1 năm\r\n1 đổi 1 nếu đi cảm thấy ko vừa size\r\nGiao hàng toàn quốc, Chỉ thanh toán sau khi nhận được hàng', '100% ảnh chụp thật từ màu sắc, kích cỡ, chất liệu…\r\n100% Da Bò Sáp Ngựa Điên\r\n1 đổi 1 nếu có lỗi do nhà sản xuất.\r\nHàng giống y như hình, ảnh thật 100%, không giống tặng luôn giày.', 720000, 'Men Fashion', 'Chelsea Boots', 12, 8, 'upload/1753829891965932.png', 1320, 'giày-dr.2976-crazy-horse', NULL, NULL),
(18, 'Timberland Men\'s 6-Inch Premium Waterproof Boots', 'Đôi giày chống thấm nước cao cấp Timberland 6 inch là sản phẩm khởi động tinh túy của Timberland. Nó có phần trên bằng da cao cấp với kết cấu chống thấm nước với đường may được hàn kín  cho độ bền trong mọi thời tiết. Bốt cổ điển được gia cố bằng khoen kim loại chống rỉ, lớp cách nhiệt PrimaLoft® và đệm cổ lót để tạo sự thoải mái. Một đế ngoài vấu chắc chắn hoàn thiện thiết kế đặc biệt này', 'Đôi giày chống thấm nước cao cấp Timberland 6 inch là sản phẩm khởi động tinh túy của Timberland. Nó có phần trên bằng da cao cấp với kết cấu chống thấm nước với đường may được hàn kín  cho độ bền trong mọi thời tiết. Bốt cổ điển được gia cố bằng khoen kim loại chống rỉ, lớp cách nhiệt PrimaLoft® và đệm cổ lót để tạo sự thoải mái. Một đế ngoài vấu chắc chắn hoàn thiện thiết kế đặc biệt này', 4500000, 'Men Fashion', 'Timberland', 12, 6, 'upload/1753830053243350.png', 12343, 'timberland-men\'s-6-inch-premium-waterproof-boots', NULL, '2023-01-01 08:21:45'),
(19, 'Timberland Originals Boot Black', 'Mua Giày Timberland Originals EK+ Boot for Men in Black A2HC6015 chính hãng 100% có sẵn tại Authentic Shoes. Giao hàng miễn phí trong 1 ngày. Cam kết đền tiền X5 nếu phát hiện Fake. Đổi trả miễn phí size. FREE vệ sinh giày trọn đời. MUA NGAY!', 'Mua Giày Timberland Originals EK+ Boot for Men in Black A2HC6015 chính hãng 100% có sẵn tại Authentic Shoes. Giao hàng miễn phí trong 1 ngày. Cam kết đền tiền X5 nếu phát hiện Fake. Đổi trả miễn phí size. FREE vệ sinh giày trọn đời. MUA NGAY!', 5900000, 'Men Fashion', 'Timberland', 12, 6, 'upload/1753830167134884.png', 1243, 'timberland-originals-boot-black', NULL, '2023-01-01 08:37:36'),
(20, 'Timberland Waterproof Boots ‘Wheat Nubuck’', 'Timberland là một thương hiệu dẫn đầu toàn cầu về kỹ thuật, thiết kế với các sản phẩm giày dép, áo quần, các mặt hàng thời trang nói chung cho người tiêu dùng về khả năng chịu đựng ngoài trời và độ bền của sản phẩm.', 'Timberland là một thương hiệu dẫn đầu toàn cầu về kỹ thuật, thiết kế với các sản phẩm giày dép, áo quần, các mặt hàng thời trang nói chung cho người tiêu dùng về khả năng chịu đựng ngoài trời và độ bền của sản phẩm. Thị trường sản phẩm của Timberland bao gồm các thương hiệu:', 4390000, 'Men Fashion', 'Timberland', 12, 6, 'upload/1753834013731955.png', 1242, 'timberland-waterproof-boots-‘wheat-nubuck’', NULL, '2023-01-01 08:36:13'),
(21, 'Giày Boots Dr.68 White', 'Da Bò 100%\r\nBảo hành #miễn_phí 1 năm 1 đổi 1 nếu đi cảm thấy ko vừa size\r\nGiao hàng toàn quốc, Chỉ thanh toán sau khi nhận được hàng', 'Da Bò 100%\r\nBảo hành #miễn_phí 1 năm 1 đổi 1 nếu đi cảm thấy ko vừa size\r\nGiao hàng toàn quốc, Chỉ thanh toán sau khi nhận được hàng\r\n100% ảnh chụp thật từ màu sắc, kích cỡ, chất liệu…\r\n100% #da_bò_nguyên_tấm, đế cao su nệm khí 1 đổi 1 nếu có lỗi do nhà sản xuất.\r\nHàng giống y như hình, ảnh thật 100%, không giống tặng luôn giày.', 425000, 'Lady Fashion', 'White Combat', 13, 9, 'upload/1753834358928264.png', 12300, 'giày-boots-dr.68-white', NULL, NULL),
(22, 'Giày Dr.1460 White', 'Da Bò 100%\r\nBảo hành #miễn_phí 1 năm\r\n1 đổi 1 nếu đi cảm thấy ko vừa size\r\nGiao hàng toàn quốc, Chỉ thanh toán sau khi nhận được hàng\r\n100% ảnh chụp thật từ màu sắc, kích cỡ, chất liệu…\r\n100% #da_bò_nguyên_tấm, đế cao su nệm khí\r\n1 đổi 1 nếu có lỗi do nhà sản xuất.\r\nHàng giống y như hình, ảnh thật 100%, không giống tặng luôn giày.', 'Da Bò 100%\r\nBảo hành #miễn_phí 1 năm\r\n1 đổi 1 nếu đi cảm thấy ko vừa size\r\nGiao hàng toàn quốc, Chỉ thanh toán sau khi nhận được hàng\r\n100% ảnh chụp thật từ màu sắc, kích cỡ, chất liệu…\r\n100% #da_bò_nguyên_tấm, đế cao su nệm khí\r\n1 đổi 1 nếu có lỗi do nhà sản xuất.\r\nHàng giống y như hình, ảnh thật 100%, không giống tặng luôn giày.', 470000, 'Lady Fashion', 'White Combat', 13, 9, 'upload/1753834470789332.png', 12300, 'giày-dr.1460-white', NULL, NULL),
(23, 'Giày Dr.1460 Zip All White', 'Da Bò 100%\r\nBảo hành #miễn_phí 1 năm\r\n1 đổi 1 nếu đi cảm thấy ko vừa size\r\nGiao hàng toàn quốc, Chỉ thanh toán sau khi nhận được hàng\r\n100% ảnh chụp thật từ màu sắc, kích cỡ, chất liệu…\r\n100% #da_bò_nguyên_tấm, đế cao su nệm khí\r\n1 đổi 1 nếu có lỗi do nhà sản xuất.\r\nHàng giống y như hình, ảnh thật 100%, không giống tặng luôn giày.', 'Da Bò 100%\r\nBảo hành #miễn_phí 1 năm\r\n1 đổi 1 nếu đi cảm thấy ko vừa size\r\nGiao hàng toàn quốc, Chỉ thanh toán sau khi nhận được hàng\r\n100% ảnh chụp thật từ màu sắc, kích cỡ, chất liệu…\r\n100% #da_bò_nguyên_tấm, đế cao su nệm khí\r\n1 đổi 1 nếu có lỗi do nhà sản xuất.\r\nHàng giống y như hình, ảnh thật 100%, không giống tặng luôn giày.', 470000, 'Lady Fashion', 'White Combat', 13, 9, 'upload/1753834720887576.png', 12400, 'giày-dr.1460-zip-all-white', NULL, NULL),
(24, 'Giày Dr.1461 Brown', 'Bảo hành #miễn_phí 6 tháng\r\n1 đổi 1 nếu đi cảm thấy ko vừa size\r\nGiao hàng toàn quốc, Chỉ thanh toán sau khi nhận được hàng\r\n100% ảnh chụp thật từ màu sắc, kích cỡ, chất liệu\r\n1 đổi 1 nếu có lỗi do nhà sản xuất.\r\nHàng giống y như hình, ảnh thật 100%, không giống tặng luôn giày.', 'Bảo hành #miễn_phí 6 tháng\r\n1 đổi 1 nếu đi cảm thấy ko vừa size\r\nGiao hàng toàn quốc, Chỉ thanh toán sau khi nhận được hàng\r\n100% ảnh chụp thật từ màu sắc, kích cỡ, chất liệu\r\n1 đổi 1 nếu có lỗi do nhà sản xuất.\r\nHàng giống y như hình, ảnh thật 100%, không giống tặng luôn giày.', 210000, 'Lady Fashion', 'Low-cut shoes', 13, 10, 'upload/1753834889013185.png', 1200, 'giày-dr.1461-brown', NULL, NULL),
(25, 'Giày Dr.1461 Black trơn', 'Bảo hành #miễn_phí 6 tháng\r\n1 đổi 1 nếu đi cảm thấy ko vừa size\r\nGiao hàng toàn quốc, Chỉ thanh toán sau khi nhận được hàng\r\n100% ảnh chụp thật từ màu sắc, kích cỡ, chất liệu\r\n1 đổi 1 nếu có lỗi do nhà sản xuất.\r\nHàng giống y như hình, ảnh thật 100%, không giống tặng luôn giày.', 'Bảo hành #miễn_phí 6 tháng\r\n1 đổi 1 nếu đi cảm thấy ko vừa size\r\nGiao hàng toàn quốc, Chỉ thanh toán sau khi nhận được hàng\r\n100% ảnh chụp thật từ màu sắc, kích cỡ, chất liệu\r\n1 đổi 1 nếu có lỗi do nhà sản xuất.\r\nHàng giống y như hình, ảnh thật 100%, không giống tặng luôn giày.', 280000, 'Lady Fashion', 'Low-cut shoes', 13, 10, 'upload/1753835152702378.png', 1100, 'giày-dr.1461-black-trơn', NULL, NULL),
(26, 'Giày Dr.1461 All Black', 'Bảo hành #miễn_phí 6 tháng\r\n1 đổi 1 nếu đi cảm thấy ko vừa size\r\nGiao hàng toàn quốc, Chỉ thanh toán sau khi nhận được hàng\r\n100% ảnh chụp thật từ màu sắc, kích cỡ, chất liệu\r\n1 đổi 1 nếu có lỗi do nhà sản xuất.\r\nHàng giống y như hình, ảnh thật 100%, không giống tặng luôn giày.', 'Bảo hành #miễn_phí 6 tháng\r\n1 đổi 1 nếu đi cảm thấy ko vừa size\r\nGiao hàng toàn quốc, Chỉ thanh toán sau khi nhận được hàng\r\n100% ảnh chụp thật từ màu sắc, kích cỡ, chất liệu\r\n1 đổi 1 nếu có lỗi do nhà sản xuất.\r\nHàng giống y như hình, ảnh thật 100%, không giống tặng luôn giày.', 320000, 'Lady Fashion', 'Low-cut shoes', 13, 10, 'upload/1753835282230184.png', 1500, 'giày-dr.1461-all-black', NULL, NULL),
(27, 'Giày Doc. Vintage 26 Crazy Horse', 'Bảo hành #miễn_phí 1 năm\r\n1 đổi 1 nếu đi cảm thấy ko vừa size\r\nGiao hàng toàn quốc, Chỉ thanh toán sau khi nhận được hàng\r\n100% ảnh chụp thật từ màu sắc, kích cỡ, chất liệu…\r\n100% Da Bò Sáp Ngựa Điên\r\n1 đổi 1 nếu có lỗi do nhà sản xuất.\r\nHàng giống y như hình, ảnh thật 100%, không giống tặng luôn giày.', 'Bảo hành #miễn_phí 1 năm\r\n1 đổi 1 nếu đi cảm thấy ko vừa size\r\nGiao hàng toàn quốc, Chỉ thanh toán sau khi nhận được hàng\r\n100% ảnh chụp thật từ màu sắc, kích cỡ, chất liệu…\r\n100% Da Bò Sáp Ngựa Điên\r\n1 đổi 1 nếu có lỗi do nhà sản xuất.\r\nHàng giống y như hình, ảnh thật 100%, không giống tặng luôn giày.', 640000, 'Men Fashion', 'Combat Boost', 12, 7, 'upload/1753835793618447.png', 1300, 'giày-doc.-vintage-26-crazy-horse', NULL, NULL),
(28, 'GIÀY NỮ ELLY – EG15', 'Vẫn giữ nguyên vẻ sang trọng, hiện đại, tối giản với những tông màu dễ phối đồ, ELLY – EG155 sẽ luôn là sự lựa chọn lí tưởng cho tủ giày phái đẹp, để các quý cô diện đi làm, đi chơi một cách đầy tự tin và hứng khởi nhất. Nếu mùa Thu Đông năm nay bạn chưa bổ sung những đôi boot thời thượng vào tủ giày dép của mình thì có thể tham khảo ngay thiết kế này của ELLY nhé!', 'Vẫn giữ nguyên vẻ sang trọng, hiện đại, tối giản với những tông màu dễ phối đồ, ELLY – EG155 sẽ luôn là sự lựa chọn lí tưởng cho tủ giày phái đẹp, để các quý cô diện đi làm, đi chơi một cách đầy tự tin và hứng khởi nhất. Nếu mùa Thu Đông năm nay bạn chưa bổ sung những đôi boot thời thượng vào tủ giày dép của mình thì có thể tham khảo ngay thiết kế này của ELLY nhé!', 1444000, 'Lady Fashion', 'High-cut Boots Girl', 13, 11, 'upload/1753836087990696.png', 1230, 'giÀy-nỮ-elly-–-eg15', NULL, '2023-01-01 09:00:23'),
(29, 'GIÀY NỮ ELLY – EG189', 'ELLY – EG189, với phong cách đơn giản, cũng đủ tạo nên một thiết kế đầy tinh tế, mang lại cho cảm giác cực kì thoải mái nhưng cũng không kém phần thời thượng cho các quý cô! ELLY – EG189, được chế tác với phần mũi tròn mềm mại ôm gọn các đầu ngón chân cùng thiết kế đế trụ chắc chắn, tạo điểm nhấn với khoá kéo dọc thân boot sang trọng và thanh lịch. Với kết cấu đế siêu êm, chiều cao 5,5cm tôn dáng, ELLY – EG189 xứng đáng là “best-item” cần có trong tủ đồ của quý cô thời trang!', 'ELLY – EG189, với phong cách đơn giản, cũng đủ tạo nên một thiết kế đầy tinh tế, mang lại cho cảm giác cực kì thoải mái nhưng cũng không kém phần thời thượng cho các quý cô! ELLY – EG189, được chế tác với phần mũi tròn mềm mại ôm gọn các đầu ngón chân cùng thiết kế đế trụ chắc chắn, tạo điểm nhấn với khoá kéo dọc thân boot sang trọng và thanh lịch. Với kết cấu đế siêu êm, chiều cao 5,5cm tôn dáng, ELLY – EG189 xứng đáng là “best-item” cần có trong tủ đồ của quý cô thời trang!', 1529000, 'Lady Fashion', 'High-cut Boots Girl', 13, 11, 'upload/1753836246731079.png', 1200, 'giÀy-nỮ-elly-–-eg189', NULL, NULL),
(30, 'GIÀY NỮ  ELLY – EG154', 'Nếu bạn đang theo đuổi phong cách Minimalism thì không thể bỏ qua mẫu boot mới nhất ELLY – EG154 thiết kế tinh giản nhưng vẫn vô cùng cá tính và thời thượng Cùng chất liệu vải nhung hạng sang, gót giày cao 5,5 cm hack dáng sẽ mang đến cho trang phục của bạn thêm phần tinh tế và vô cùng phù hợp với mọi hoàn cảnh.', 'Nếu bạn đang theo đuổi phong cách Minimalism thì không thể bỏ qua mẫu boot mới nhất ELLY – EG154 thiết kế tinh giản nhưng vẫn vô cùng cá tính và thời thượng Cùng chất liệu vải nhung hạng sang, gót giày cao 5,5 cm hack dáng sẽ mang đến cho trang phục của bạn thêm phần tinh tế và vô cùng phù hợp với mọi hoàn cảnh.', 1444000, 'Lady Fashion', 'High-cut Boots Girl', 13, 11, 'upload/1753836377325236.png', 1299, 'giÀy-nỮ--elly-–-eg154', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Admin', 'Admin', '2022-12-10 03:42:49', '2022-12-10 03:42:49'),
(2, 'user', 'User', 'User', '2022-12-10 03:42:50', '2022-12-10 03:42:50');

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `user_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`role_id`, `user_id`, `user_type`) VALUES
(2, 1, 'App\\Models\\User'),
(1, 2, 'App\\Models\\User');

-- --------------------------------------------------------

--
-- Table structure for table `shipinginfs`
--

CREATE TABLE `shipinginfs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `city_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `node` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipinginfs`
--

INSERT INTO `shipinginfs` (`id`, `user_id`, `city_name`, `phone_number`, `address`, `node`, `created_at`, `updated_at`) VALUES
(8, 2, 'Hue', '0791234567', '123 Dien bien Phu', 'Giao hàng vào giờ hành chính nhé', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sizes`
--

CREATE TABLE `sizes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `size` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sizes`
--

INSERT INTO `sizes` (`id`, `size`, `created_at`, `updated_at`) VALUES
(1, 'S', NULL, NULL),
(2, 'M', NULL, NULL),
(3, 'L', NULL, NULL),
(4, 'XL', NULL, NULL),
(5, 'XXL', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subcategories`
--

CREATE TABLE `subcategories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subcategory_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint(20) NOT NULL,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_count` int(11) NOT NULL DEFAULT 0,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subcategories`
--

INSERT INTO `subcategories` (`id`, `subcategory_name`, `category_id`, `category_name`, `product_count`, `slug`, `created_at`, `updated_at`) VALUES
(6, 'Timberland', 12, 'Men Fashion', 3, 'timberland', NULL, '2023-01-01 08:20:54'),
(7, 'Combat Boost', 12, 'Men Fashion', 7, 'combat-boost', NULL, '2023-01-01 08:49:11'),
(8, 'Chelsea Boots', 12, 'Men Fashion', 4, 'chelsea-boots', NULL, '2023-01-01 07:15:23'),
(9, 'White Combat', 13, 'Lady Fashion', 3, 'white-combat', NULL, '2023-01-01 08:32:08'),
(10, 'Low-cut shoes', 13, 'Lady Fashion', 3, 'low-cut-shoes', NULL, '2023-01-01 08:41:04'),
(11, 'High-cut Boots Girl', 13, 'Lady Fashion', 3, 'high-cut-boots-girl', NULL, '2023-01-01 08:58:28');

-- --------------------------------------------------------

--
-- Table structure for table `totals`
--

CREATE TABLE `totals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cart_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `price` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `size` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `node` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `totals`
--

INSERT INTO `totals` (`id`, `cart_id`, `product_id`, `user_id`, `quantity`, `price`, `created_at`, `updated_at`, `size`, `city_name`, `address`, `phone_number`, `node`) VALUES
(9, 26, 8, 2, 1, 840000, NULL, NULL, 'M', 'Hue', '123 Dien bien Phu', '0791234567', 'Oke');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Thanh Hùng', 'binbinhung2112@gmail.com', NULL, '$2y$10$UBCt6cmDLM/ha9o6qnVoruIz.Vjhm3NYTBVZOJ7iO9UuDV3cTolTS', 'RHwPJ35gFAa37LeMe2gZAkg3rOc2buYKxGgG2QTLc1WHxaqcdWO4uW55i0Ou', '2022-12-10 03:50:52', '2022-12-10 03:50:52'),
(2, 'Subin', '20E1020063@hueuni.edu.vn', NULL, '$2y$10$JYOsFGgEBoKDDRCvh7G3leubZ8ppShe5vXl69FW3ySnPwaSqh6Ara', NULL, '2022-12-30 10:49:52', '2022-12-30 10:49:52');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
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
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

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
  ADD UNIQUE KEY `permissions_name_unique` (`name`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_role_id_foreign` (`role_id`);

--
-- Indexes for table `permission_user`
--
ALTER TABLE `permission_user`
  ADD PRIMARY KEY (`user_id`,`permission_id`,`user_type`),
  ADD KEY `permission_user_permission_id_foreign` (`permission_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

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
  ADD PRIMARY KEY (`user_id`,`role_id`,`user_type`),
  ADD KEY `role_user_role_id_foreign` (`role_id`);

--
-- Indexes for table `shipinginfs`
--
ALTER TABLE `shipinginfs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sizes`
--
ALTER TABLE `sizes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `totals`
--
ALTER TABLE `totals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `shipinginfs`
--
ALTER TABLE `shipinginfs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `sizes`
--
ALTER TABLE `sizes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `totals`
--
ALTER TABLE `totals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `permission_user`
--
ALTER TABLE `permission_user`
  ADD CONSTRAINT `permission_user_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
