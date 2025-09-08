-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th9 05, 2025 lúc 09:09 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `ecommerceshop`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admins`
--
create database ecommerceshop;
use ecommerceshop;
CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `phone` varchar(30) NOT NULL,
  `address` text NOT NULL,
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `type` enum('Admin','Staff') NOT NULL DEFAULT 'Staff',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `status` enum('Active','Inactive') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `brands`
--

INSERT INTO `brands` (`id`, `name`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(38, 'Main', 'dunelm-group', 'Active', NULL, NULL),
(50, 'Sofa', 'sofa', 'Active', NULL, NULL),
(51, 'Bàn ăn', 'ban-an', 'Active', NULL, NULL),
(52, 'Giường', 'giuong', 'Active', NULL, NULL),
(53, 'Armchair', 'armchair', 'Active', NULL, NULL),
(55, 'Ghế ăn', 'ghe-an', 'Active', NULL, NULL),
(57, 'Nệm', 'nem', 'Active', '2025-03-25 01:49:43', NULL),
(58, 'Bàn làm việc', 'ban-lam-viec', 'Active', '2025-03-25 01:49:43', NULL),
(59, 'Tủ bếp', 'tu-bep', 'Active', '2025-03-18 13:49:43', NULL),
(60, 'Tủ sách', 'tu-sach', 'Active', '2025-03-21 01:49:43', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `status` enum('Active','Inactive') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(5, 'Sofa', 'sofa', 'Active', NULL, NULL),
(35, 'Bàn ăn', 'ban-an', 'Active', NULL, NULL),
(37, 'Giường', 'giuong', 'Active', NULL, NULL),
(40, 'Armchair', 'armchair', 'Active', NULL, NULL),
(44, 'Ghế ăn', 'ghe-an', 'Active', NULL, NULL),
(46, 'Nệm', 'nem', 'Active', NULL, NULL),
(47, 'Bàn làm việc', 'ban-lam-viec', 'Active', NULL, NULL),
(48, 'Tủ bếp', 'tu-bep', 'Active', NULL, NULL),
(49, 'Tủ sách', 'tu-sach', 'Active', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('Processing','Confirmed','Shipping','Delivered','Cancelled') NOT NULL DEFAULT 'Processing',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total_price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `payment_method` varchar(50) NOT NULL DEFAULT 'COD',
  `address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `price` double NOT NULL,
  `quantity` int(11) NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `summary` text NOT NULL,
  `stock` tinyint(3) UNSIGNED NOT NULL,
  `price` double NOT NULL,
  `discounted_price` decimal(10,2) DEFAULT NULL,
  `images` text NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `brand_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('Active','Inactive') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `views` int(11) DEFAULT 0,
  `material` varchar(255) DEFAULT NULL,
  `size` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `description`, `summary`, `stock`, `price`, `discounted_price`, `images`, `category_id`, `brand_id`, `status`, `created_at`, `updated_at`, `views`, `material`, `size`) VALUES
(66, 'Sofa 2 chỗ Hà Nội', 'sofa-2-cho', 'Sofa 2 chỗ Hà Nội là lựa chọn hoàn hảo cho phòng khách hiện đại. Với thiết kế nhỏ gọn nhưng sang trọng, sản phẩm được làm từ gỗ tự nhiên chắc chắn, bọc nệm cao cấp mang lại cảm giác êm ái và thoải mái. Lớp vải bọc có độ bền cao, dễ dàng vệ sinh, phù hợp với nhiều phong cách nội thất.', 'Sofa cao cấp', 17, 1200000, 1800000.00, 'sofa_1.jpg', 5, 51, 'Active', '2025-03-10 07:00:00', '0000-00-00 00:00:00', 97, 'Gỗ', 'Trung bình'),
(68, 'Bàn ăn Breeze', 'ban-an-Breeze', 'Bàn ăn Breeze mặt kính bronze/GM2 là sự kết hợp hoàn hảo giữa phong cách hiện đại và chất liệu cao cấp. Mặt bàn kính cường lực chắc chắn, khung gỗ tự nhiên bền bỉ, mang đến không gian ăn uống tinh tế và đẳng cấp. Thiết kế tối giản nhưng đầy tinh tế, phù hợp với mọi không gian bếp.', 'Bàn ăn cao cấp', 17, 20000000, NULL, 'dining_tables_2.jpg', 35, 52, 'Active', '2025-03-11 03:30:00', '0000-00-00 00:00:00', 30, 'Gỗ', 'Nhỏ'),
(84, 'Giường Miami', 'giuong-Miami', 'Giường Miami 1m6 Vải Hooland 162 là mẫu giường ngủ sang trọng với thiết kế hiện đại. Sản phẩm sử dụng khung gỗ tự nhiên chắc chắn, bọc vải cao cấp mềm mại, tạo cảm giác thoải mái tối đa khi nghỉ ngơi. Kích thước rộng rãi, phù hợp với các không gian phòng ngủ hiện đại.', 'Giường cao cấp', 12, 35000000, NULL, 'beds_1.jpg', 37, 38, 'Active', '2025-03-12 01:45:00', NULL, 20, 'Gỗ', 'Lớn'),
(85, 'Armchair Hùng King', 'armchair-hung-king', 'Armchair Hùng King + Gối VACT3231 mang phong cách hoàng gia với thiết kế tinh tế. Sản phẩm có khung gỗ chắc chắn, bọc vải nhung cao cấp, tạo cảm giác sang trọng và êm ái. Đi kèm gối tựa giúp nâng cao trải nghiệm thư giãn cho người dùng.', 'Armchair cao cấp', 122, 23000000, NULL, 'armchair_1.jpg', 40, 38, 'Active', '2025-03-12 08:20:00', NULL, 10, 'Gỗ', 'Nhỏ'),
(86, 'Ghế ăn Valente', 'ghế-ăn-valente', 'Ghế ăn có tay Valente là sự lựa chọn lý tưởng cho phòng ăn cao cấp. Với khung gỗ chắc chắn, mặt ngồi và lưng ghế bọc nệm mềm mại, thiết kế tay vịn tiện lợi giúp tăng thêm sự thoải mái khi sử dụng. Sản phẩm mang phong cách châu Âu sang trọng, dễ dàng kết hợp với các mẫu bàn ăn hiện đại.', 'Ghế ăn có tay Valente cao cấp', 10, 25000000, 2200000.00, 'dining_chairs_1.jpg', 44, 38, 'Active', '2025-03-14 08:03:43', '2025-03-14 08:03:43', 10, 'Gỗ', 'Nhỏ'),
(88, 'Tủ bếp Daily', 'tu-bep-Daily', 'Tủ bếp Daily là sự kết hợp hoàn hảo giữa thiết kế tối giản và tính năng tiện ích. Sản phẩm làm từ gỗ công nghiệp cao cấp, bề mặt phủ lớp chống trầy xước và chống thấm nước, giúp tăng tuổi thọ sử dụng. Hệ thống ngăn kéo rộng rãi giúp tối ưu hóa không gian lưu trữ trong gian bếp.', 'Tủ bếp cao cấp', 1, 19500000, NULL, 'kitchen_cabinet_1.jpg', 48, 55, 'Active', '2025-03-13 09:00:00', NULL, 28, 'Gỗ', 'Lớn'),
(90, 'Nệm TokyoBed', 'nem-lo-xo-Tokyobed', 'Nệm lò xo Tokyobed cao 290 mang lại giấc ngủ êm ái với hệ thống lò xo túi độc lập, giúp nâng đỡ cơ thể tối ưu. Lớp mousse cao cấp kết hợp với vải bọc thoáng khí tạo cảm giác dễ chịu khi sử dụng. Thiết kế sang trọng, phù hợp với mọi không gian phòng ngủ hiện đại.', 'Nệm lò xo cao cấp', 3, 32000000, 200000.00, 'mattress_1.jpg', 46, 55, 'Active', '2025-03-14 06:40:00', NULL, 25, 'Cao su', 'Trung bình'),
(91, 'Sofa 3 Chỗ Louis', 'giuong-3-cho-Louis', 'Sofa 3 Chỗ Louis là điểm nhấn hoàn hảo cho phòng khách sang trọng. Khung gỗ tự nhiên chắc chắn kết hợp với lớp đệm dày êm ái giúp mang lại sự thoải mái tối đa. Vải bọc cao cấp có khả năng chống bám bẩn, dễ dàng vệ sinh, đảm bảo độ bền lâu dài.', 'Sofa cao cấp 2', 12, 21000000, NULL, 'sofa_3.jpg', 5, 50, 'Active', '2025-03-14 10:55:00', NULL, 9, 'Gỗ', 'Lớn'),
(92, 'Giường Mercury ', 'giuong-Mercury', 'Giường Mercury 6JS6 Fabric White WHITE mang phong cách tối giản nhưng vẫn giữ được sự sang trọng. Khung giường làm từ gỗ tự nhiên chắc chắn, bọc vải trắng cao cấp giúp không gian phòng ngủ trở nên tinh tế và thanh lịch hơn. Thiết kế rộng rãi, phù hợp với nhiều phong cách nội thất hiện đại.', 'Giường cao cấp ', 20, 3400000, 200000.00, 'beds_3.jpg', 37, 52, 'Active', '2025-03-15 13:49:42', NULL, 7, 'Gỗ', 'Lớn'),
(93, 'Bàn làm việc Fence', 'ban-lam-viec-Fence', 'Bàn làm việc Fence là lựa chọn lý tưởng cho những ai tìm kiếm sự cân bằng giữa thiết kế và công năng. Với mặt bàn gỗ công nghiệp chống trầy xước, chân kim loại sơn tĩnh điện chắc chắn, sản phẩm mang đến không gian làm việc chuyên nghiệp và thoải mái.', 'Bàn làm việc cao cấp', 2, 2500000, NULL, 'desk_1.jpg', 47, 51, 'Active', '2025-03-19 02:33:48', NULL, 3, 'Gỗ', 'Lớn'),
(96, 'Kệ Sách Artigo', 'ke-sach-Artigo', 'Kệ Sách Artigo không chỉ là nơi lưu trữ sách mà còn là điểm nhấn trang trí cho không gian sống. Với thiết kế hiện đại, chất liệu gỗ cao cấp chống ẩm mốc, kệ sách này giúp bạn sắp xếp đồ đạc gọn gàng và tạo cảm giác ấm cúng cho ngôi nhà.', 'Kệ sách cao cấp', 2, 2500000, NULL, 'bookshelf_1.jpg', 49, 50, 'Active', '2025-03-19 02:42:16', NULL, 130, 'Gỗ', 'Lớn'),
(97, 'Sofa 2 chỗ Mây mới', 'sofa-2-cho-may-moi', 'Sofa 2 chỗ Mây mới là sự kết hợp hoàn hảo giữa chất liệu tự nhiên và thiết kế hiện đại. Sản phẩm có khung gỗ chắc chắn, đệm bọc vải êm ái giúp mang lại cảm giác thoải mái khi ngồi. Kiểu dáng nhỏ gọn, phù hợp với nhiều không gian khác nhau.', 'Sofa 2 chỗ cao cấp', 12, 1230000, 200000.00, 'sofa_2.jpg', 5, 50, 'Active', '2025-03-18 13:49:42', NULL, 42, 'Gỗ', 'Trung bình'),
(98, 'Sofa Miami 2 Chỗ', 'sofa-miami-2-chỗ', 'Sofa Miami 2 Chỗ – m2 Vải Light Grey là lựa chọn lý tưởng cho những ai yêu thích phong cách hiện đại. Với chất liệu vải cao cấp, khung gỗ tự nhiên bền chắc, sản phẩm mang đến sự thoải mái tối đa khi sử dụng. Màu xám trung tính giúp dễ dàng kết hợp với nhiều phong cách nội thất.', 'Sofa cao cấp 2 chỗ ', 33, 3550000, 12000.00, 'sofa_4.jpg', 5, 50, 'Active', '2025-03-18 13:49:43', NULL, 44, 'Gỗ', 'Trung bình'),
(99, 'Sofa Jadora 2.5 chỗ ', 'sofa-jadora-2.5-cho', 'Sofa Jadora 2.5 chỗ là sản phẩm cao cấp với chất liệu vải nhập khẩu mềm mại, tạo cảm giác thư giãn tối đa. Khung ghế chắc chắn, đệm mút dày giúp tăng độ bền và độ đàn hồi. Thiết kế sang trọng, phù hợp với không gian phòng khách đẳng cấp.', 'Sofa cao cấp 2.5 chỗ', 12, 34000000, NULL, 'sofa_5.jpg', 5, 50, 'Active', '2025-03-21 01:49:43', NULL, 26, 'Gỗ', 'Nhỏ'),
(100, 'Giường Nâng Portland', 'giuong-nang-PortLand', 'Giường Nâng Portland Vải 1swg mang phong cách hiện đại với thiết kế thông minh. Sản phẩm có khung gỗ chắc chắn, bọc vải mềm mại, tích hợp cơ chế nâng giúp tối ưu hóa không gian lưu trữ dưới giường. Lựa chọn hoàn hảo cho những căn hộ có diện tích nhỏ.', 'Giường cao cấp ', 2, 12600000, 600000.00, 'beds_2.png', 37, 52, 'Active', '2025-03-22 01:49:43', NULL, 62, 'Gỗ', 'Lớn'),
(101, 'Giường Sofly 1.8m ', 'giuong-Sofly-1.8m', 'Giường Sofly 1.8m Vải 1swg là biểu tượng của sự sang trọng và tiện nghi. Sản phẩm có kích thước rộng rãi, khung gỗ cao cấp đảm bảo độ bền lâu dài. Vải bọc mềm mại tạo cảm giác thoải mái tối đa khi nghỉ ngơi. Thiết kế hiện đại phù hợp với phòng ngủ cao cấp.', 'Giường cao cấp', 3, 40500000, NULL, 'beds_4.png', 37, 52, 'Active', '2025-03-21 01:49:43', NULL, 46, 'Gỗ', 'Trung bình'),
(103, 'Sofa Coastal 1 chỗ', 'sofa-Coastal-1-cho', 'Sofa Coastal 1 chỗ là sự lựa chọn hoàn hảo cho không gian nhỏ gọn. Sản phẩm có thiết kế hiện đại, vải bọc màu xanh sang trọng, khung gỗ chắc chắn mang lại sự thoải mái tối đa khi sử dụng.', 'Sofa cấp 1 chỗ', 23, 10400000, 600000.00, 'sofa_6.jpg', 5, 50, 'Active', '2025-03-25 01:49:43', NULL, 13, 'Gỗ', 'Nhỏ'),
(104, 'Sofa Cabo 3 chỗ \r\n', 'sofa-Cabo-3-cho', 'Sofa Cabo 3 chỗ mang đến vẻ đẹp sang trọng với chất liệu vải MB2041-17 PMA170078 cao cấp. Sản phẩm có thiết kế tinh tế, khung gỗ bền chắc, phù hợp với không gian phòng khách rộng rãi.', 'Sofa Cabo 3 chỗ cao cấp ', 11, 17000000, NULL, 'sofa_8.jpg', 5, 50, 'Active', '2025-03-25 01:49:43', NULL, 10, 'Gỗ', 'Lớn'),
(105, 'Sofa ONA HER 3 chỗ', 'sofa-ONA-HER-3-cho', 'Sofa ONA HER 3 chỗ là điểm nhấn hoàn hảo cho không gian nội thất cao cấp. Với lớp da nâu mềm mại, khung gỗ chắc chắn và kiểu dáng sang trọng, sản phẩm mang lại cảm giác thoải mái tối đa khi sử dụng.', 'Sofa 3 chỗ cao cấp', 23, 21500000, NULL, 'sofa_7.jpg', 5, 50, 'Active', '2025-03-25 01:49:43', NULL, 10, 'Gỗ', 'Lớn'),
(107, 'Bàn ăn Cult 6 chỗ', 'Ban-an-Cult-6-chỗ', 'Bàn ăn Cult 6 chỗ là sự kết hợp giữa kim loại và gỗ, mang đến sự bền bỉ và hiện đại. Thiết kế đơn giản nhưng tinh tế, phù hợp với nhiều không gian sống khác nhau.', 'Bàn ăn cao cấp', 13, 12000000, NULL, 'dining_tables_3.jpg', 35, 51, 'Active', '2025-03-25 01:49:43', NULL, 1, 'Kim loại', 'Nhỏ'),
(108, 'Bàn Ăn Seashell Ceramic P2c', 'ban-an-Seashell-Ceramic-P2c', 'Bàn Ăn Seashell Ceramic P2c là sản phẩm cao cấp với mặt bàn ceramic chống trầy xước, chịu nhiệt tốt. Thiết kế thanh lịch, phù hợp với những ai yêu thích phong cách hiện đại.', 'Bàn ăn cao cấp', 12, 19000000, NULL, 'dining_tables_4.jpg', 35, 51, 'Active', '2025-03-25 01:49:43', NULL, 0, 'Gỗ', 'Trung bình'),
(113, 'Bàn ăn Luxury', 'ban-an-luxury', 'Bàn ăn Luxury được chế tác từ gỗ óc chó cao cấp, mang đến sự sang trọng và đẳng cấp. Thiết kế tinh tế, đường nét mềm mại giúp không gian phòng ăn trở nên ấm cúng và thanh lịch hơn.', 'Bàn ăn cao cấp', 20, 25000000, NULL, 'dining_tables_5.jpg', 35, 51, 'Active', '2025-03-25 03:00:00', NULL, 0, 'Gỗ', 'Lớn'),
(114, 'Bàn ăn Minimalist', 'ban-an-minimalist', 'Bàn ăn Minimalist mang phong cách tối giản với thiết kế tinh gọn, hiện đại. Chất liệu gỗ cao cấp kết hợp với màu sắc trung tính giúp sản phẩm dễ dàng phù hợp với nhiều không gian nội thất khác nhau.', 'Bàn ăn hiện đại', 15, 15000000, 14000000.00, 'dining_tables_6.png', 35, 51, 'Active', '2025-03-25 03:05:00', NULL, 1, 'Gỗ', 'Trung bình'),
(115, 'Bàn ăn Scandinavian', 'ban-an-scandinavian', 'Bàn ăn Scandinavian mang phong cách Bắc Âu hiện đại với thiết kế tối giản, màu sắc trang nhã. Sản phẩm làm từ gỗ cao cấp, giúp không gian phòng ăn trở nên tinh tế và ấm cúng.', 'Bàn ăn Bắc Âu', 18, 18000000, NULL, 'dining_tables_7.jpg', 35, 51, 'Active', '2025-03-25 03:10:00', NULL, 0, 'Gỗ', 'Nhỏ'),
(116, 'Bàn ăn Vintage', 'ban-an-vintage', 'Bàn ăn Vintage mang đến vẻ đẹp cổ điển với những đường nét tinh xảo. Sản phẩm được làm từ gỗ tự nhiên cao cấp, phù hợp với không gian hoài cổ và sang trọng.', 'Bàn ăn cổ điển', 10, 20000000, NULL, 'dining_tables_8.jpg', 35, 51, 'Active', '2025-03-25 03:15:00', NULL, 0, 'Gỗ', 'Trung bình'),
(121, 'Giường ngủ Modern', 'giuong-modern', 'Giường ngủ Modern là lựa chọn lý tưởng cho những ai yêu thích phong cách hiện đại. Thiết kế tinh gọn, chất liệu gỗ cao cấp cùng màu sắc trung tính giúp không gian trở nên thanh lịch và tiện nghi.', 'Giường hiện đại', 12, 22000000, 20000000.00, 'beds_5.jpg', 37, 52, 'Active', '2025-03-25 04:00:00', NULL, 0, 'Gỗ', 'Lớn'),
(122, 'Giường ngủ Classic', 'giuong-classic', 'Giường ngủ Classic mang nét đẹp cổ điển với khung gỗ chạm trổ tinh xảo. Sản phẩm không chỉ sang trọng mà còn bền bỉ theo thời gian, tạo điểm nhấn cho phòng ngủ.', 'Giường cổ điển', 8, 28000000, NULL, 'beds_6.png', 37, 52, 'Active', '2025-03-25 04:05:00', NULL, 0, 'Gỗ', 'Trung bình'),
(123, 'Giường ngủ Minimalist', 'giuong-minimalist', 'Giường ngủ Minimalist có thiết kế tối giản, giúp tiết kiệm không gian mà vẫn đảm bảo sự thoải mái. Sản phẩm làm từ gỗ tự nhiên, màu sắc nhẹ nhàng phù hợp với phong cách hiện đại.', 'Giường tối giản', 15, 18000000, NULL, 'beds_7.jpg', 37, 52, 'Active', '2025-03-25 04:10:00', NULL, 0, 'Gỗ', 'Nhỏ'),
(124, 'Giường ngủ Luxury', 'giuong-luxury', 'Giường ngủ Luxury được chế tác từ gỗ óc chó cao cấp, mang đến sự sang trọng và đẳng cấp. Thiết kế hiện đại, đường nét mềm mại giúp không gian phòng ngủ trở nên tinh tế hơn.', 'Giường cao cấp', 10, 32000000, 29000000.00, 'beds_8.jpg', 37, 52, 'Active', '2025-03-25 04:15:00', NULL, 0, 'Gỗ', 'Lớn'),
(129, 'Armchair Relax', 'armchair-relax', 'Ghế Armchair Relax là lựa chọn hoàn hảo để thư giãn sau một ngày dài. Sản phẩm có thiết kế hiện đại, khung gỗ chắc chắn và lớp đệm êm ái mang đến sự thoải mái tối đa.', 'Ghế thư giãn', 20, 12000000, NULL, 'armchair_3.jpg', 40, 53, 'Active', '2025-03-25 05:00:00', NULL, 0, 'Gỗ', 'Trung bình'),
(130, 'Armchair Vintage', 'armchair_4', 'Ghế Armchair Vintage có phong cách cổ điển, sang trọng với phần lưng tựa cao và đường nét tinh tế. Chất liệu gỗ cao cấp cùng đệm bọc vải mềm mại tạo nên sự êm ái và bền bỉ theo thời gian.', 'Ghế cổ điển', 15, 15000000, 14000000.00, 'armchair_4.jpg', 40, 53, 'Active', '2025-03-25 05:05:00', NULL, 0, 'Gỗ', 'Nhỏ'),
(131, 'Armchair Scandinavian', 'armchair-scandinavian', 'Ghế Armchair Scandinavian mang phong cách Bắc Âu thanh lịch, với thiết kế tinh giản và chất liệu gỗ cao cấp. Sản phẩm phù hợp với nhiều không gian hiện đại, mang lại cảm giác thoải mái và sang trọng.', 'Ghế Bắc Âu', 18, 13000000, NULL, 'armchair_5.jpg', 40, 53, 'Active', '2025-03-25 05:10:00', NULL, 0, 'Gỗ', 'Trung bình'),
(132, 'Armchair Luxury', 'armchair-luxury', 'Ghế Armchair Luxury được chế tác từ gỗ óc chó cao cấp, kết hợp với đệm êm ái giúp tạo nên sự sang trọng và đẳng cấp. Sản phẩm thích hợp cho phòng khách hoặc phòng làm việc tinh tế.', 'Ghế cao cấp', 10, 20000000, 18000000.00, 'armchair_6.jpg', 40, 53, 'Active', '2025-03-25 05:15:00', NULL, 0, 'Gỗ', 'Lớn'),
(133, 'Armchair Minimalist', 'armchair-minimalist', 'Ghế Armchair Minimalist có thiết kế tối giản nhưng vẫn đảm bảo sự thoải mái. Sản phẩm phù hợp với những không gian hiện đại, giúp tiết kiệm diện tích mà vẫn đảm bảo sự tiện nghi.', 'Ghế tối giản', 12, 11000000, NULL, 'armchair_7.jpg', 40, 53, 'Active', '2025-03-25 05:20:00', NULL, 0, 'Gỗ', 'Nhỏ'),
(134, 'Armchair Cozy', 'armchair-cozy', 'Ghế Armchair Cozy mang đến sự êm ái tối đa với thiết kế nhỏ gọn, phù hợp với những không gian nhỏ hoặc góc thư giãn trong phòng ngủ. Sản phẩm có khung gỗ chắc chắn và đệm êm ái.', 'Ghế êm ái', 22, 12500000, NULL, 'armchair_8.jpg', 40, 53, 'Active', '2025-03-25 05:25:00', NULL, 0, 'Gỗ', 'Trung bình'),
(135, 'Armchair Classic', 'armchair-classic', 'Ghế Armchair Classic có kiểu dáng cổ điển, với phần tựa lưng cao và chất liệu gỗ tự nhiên bền bỉ. Sản phẩm mang phong cách lịch lãm, phù hợp với không gian sang trọng và truyền thống.', 'Ghế cổ điển', 9, 17000000, 16000000.00, 'armchair_2.jpg', 40, 53, 'Active', '2025-03-25 05:30:00', NULL, 0, 'Gỗ', 'Lớn'),
(136, 'Ghế ăn Modern', 'ghe-an-modern', 'Ghế ăn Modern mang phong cách hiện đại, đơn giản nhưng tinh tế. Sản phẩm có kết cấu vững chắc, mặt ngồi thoải mái và phù hợp với nhiều không gian nội thất hiện đại.', 'Ghế ăn hiện đại', 25, 5000000, NULL, 'dining_chairs_2.jpg', 44, 53, 'Active', '2025-03-25 06:00:00', NULL, 0, 'Gỗ', 'Trung bình'),
(137, 'Ghế ăn Luxury', 'ghe-an-luxury', 'Ghế ăn Luxury có thiết kế sang trọng với đường nét tinh xảo và chất liệu gỗ cao cấp. Sản phẩm tạo điểm nhấn nổi bật cho phòng ăn, giúp bữa ăn trở nên đẳng cấp hơn.', 'Ghế ăn cao cấp', 15, 7000000, 6500000.00, 'dining_chairs_3.png', 44, 53, 'Active', '2025-03-25 06:05:00', NULL, 0, 'Gỗ', 'Lớn'),
(138, 'Ghế ăn Scandinavian', 'ghe-an-scandinavian', 'Ghế ăn Scandinavian sở hữu phong cách Bắc Âu tinh tế với gam màu nhẹ nhàng và thiết kế tối giản. Sản phẩm phù hợp với không gian nội thất hiện đại, tạo cảm giác ấm cúng và trang nhã.', 'Ghế ăn Bắc Âu', 20, 6000000, NULL, 'dining_chairs_4.png', 44, 53, 'Active', '2025-03-25 06:10:00', NULL, 0, 'Gỗ', 'Nhỏ'),
(139, 'Ghế ăn Minimalist', 'ghe-an-minimalist', 'Ghế ăn Minimalist mang phong cách tối giản với thiết kế thanh lịch và chất liệu gỗ bền bỉ. Sản phẩm phù hợp với không gian hiện đại, giúp bàn ăn thêm tinh tế và trang nhã.', 'Ghế ăn tối giản', 18, 5500000, NULL, 'dining_chairs_5.jpg', 44, 53, 'Active', '2025-03-25 06:15:00', NULL, 0, 'Gỗ', 'Trung bình'),
(140, 'Ghế ăn Classic', 'ghe-an-classic', 'Ghế ăn Classic có kiểu dáng cổ điển với các chi tiết chạm khắc tinh xảo, mang đến vẻ đẹp hoài niệm và sang trọng. Sản phẩm phù hợp với những không gian nội thất truyền thống.', 'Ghế ăn cổ điển', 12, 7500000, 7000000.00, 'dining_chairs_6.png', 44, 53, 'Active', '2025-03-25 06:20:00', NULL, 0, 'Gỗ', 'Lớn'),
(141, 'Ghế ăn Vintage', 'ghe-an-vintage', 'Ghế ăn Vintage sở hữu phong cách cổ điển với tông màu ấm cúng, mang đến cảm giác gần gũi và thoải mái. Sản phẩm phù hợp cho những ai yêu thích nét đẹp xưa cũ.', 'Ghế ăn vintage', 22, 6500000, NULL, 'dining_chairs_7.jpg', 44, 53, 'Active', '2025-03-25 06:25:00', NULL, 0, 'Gỗ', 'Nhỏ'),
(142, 'Ghế ăn Cozy', 'ghe-an-cozy', 'Ghế ăn Cozy có thiết kế êm ái với đệm dày và lưng tựa thoải mái, giúp bữa ăn gia đình thêm trọn vẹn. Phù hợp với không gian ấm áp và thân thiện.', 'Ghế ăn êm ái', 17, 4800000, 4500000.00, 'dining_chairs_8.jpg', 44, 53, 'Active', '2025-03-25 06:30:00', NULL, 0, 'Gỗ', 'Trung bình'),
(143, 'Ghế ăn Elegant', 'ghe-an-elegant', 'Ghế ăn Elegant có thiết kế thanh lịch với đường nét tinh tế, phù hợp với không gian nội thất hiện đại. Sản phẩm mang lại sự sang trọng và thoải mái cho người dùng.', 'Ghế ăn thanh lịch', 20, 5200000, NULL, 'beds_2.png', 46, 57, 'Active', '2025-03-25 07:00:00', NULL, 0, 'Cao su', 'Trung bình'),
(144, 'Ghế ăn Premium', 'ghe-an-premium', 'Ghế ăn Premium được làm từ chất liệu gỗ sồi cao cấp, có độ bền cao và thiết kế tinh tế. Đây là lựa chọn hoàn hảo cho những không gian ăn uống đẳng cấp.', 'Ghế ăn cao cấp', 18, 7800000, NULL, 'beds_3.jpg', 46, 57, 'Active', '2025-03-25 07:05:00', NULL, 0, 'Cao su', 'Lớn'),
(145, 'Ghế ăn Vintage Style', 'ghe-an-vintage-style', 'Ghế ăn Vintage Style mang phong cách vintage, kết hợp giữa thiết kế tinh tế và chất liệu cao cấp. Sản phẩm phù hợp với những ai yêu thích sự sang trọng và cổ điển.', 'Ghế ăn vintage', 15, 6200000, NULL, 'beds_4.png', 46, 57, 'Active', '2025-03-25 07:10:00', NULL, 0, 'Cao su', 'Nhỏ'),
(146, 'Ghế ăn Wooden', 'ghe-an-wooden', 'Ghế ăn Wooden được làm từ gỗ tự nhiên, mang đến vẻ đẹp mộc mạc nhưng không kém phần tinh tế. Sản phẩm có độ bền cao và phù hợp với nhiều phong cách nội thất.', 'Ghế ăn gỗ', 22, 5900000, NULL, 'beds_5.jpg', 46, 57, 'Active', '2025-03-25 07:15:00', NULL, 0, 'Cao su', 'Trung bình'),
(147, 'Ghế ăn Cozy Style', 'ghe-an-cozy-style', 'Ghế ăn Cozy Style có thiết kế đơn giản nhưng vô cùng thoải mái, giúp tạo cảm giác thư giãn tối đa khi dùng bữa. Phù hợp với những ai yêu thích sự nhẹ nhàng và tiện nghi.', 'Ghế ăn êm ái', 19, 5000000, NULL, 'beds_6.png', 46, 57, 'Active', '2025-03-25 07:20:00', NULL, 0, 'Cao su', 'Nhỏ'),
(148, 'Ghế ăn Scandinavian Premium', 'ghe-an-scandinavian-premium', 'Ghế ăn Scandinavian Premium mang phong cách Bắc Âu, thiết kế tối giản nhưng vẫn tinh tế. Chất liệu gỗ cao cấp giúp sản phẩm có độ bền cao và phù hợp với không gian hiện đại.', 'Ghế ăn Bắc Âu', 17, 6800000, 6300000.00, 'beds_7.jpg', 46, 57, 'Active', '2025-03-25 07:25:00', NULL, 0, 'Cao su', 'Lớn'),
(149, 'Ghế ăn Luxury Wood', 'ghe-an-luxury-wood', 'Ghế ăn Luxury Wood được làm từ gỗ cao cấp, mang đến vẻ đẹp sang trọng và đẳng cấp. Thiết kế chắc chắn, phù hợp với những không gian nội thất cao cấp.', 'Ghế ăn luxury', 14, 8500000, NULL, 'beds_8.jpg', 46, 57, 'Active', '2025-03-25 07:30:00', NULL, 0, 'Cao su', 'Lớn'),
(150, 'Bàn làm việc Office Pro', 'ban-lam-viec-office-pro', 'Bàn làm việc Office Pro là lựa chọn lý tưởng cho không gian văn phòng chuyên nghiệp. Thiết kế hiện đại kết hợp chất liệu kim loại cao cấp giúp tăng độ bền và tính thẩm mỹ.', 'Bàn làm việc hiện đại', 20, 7500000, NULL, 'desk_2.jpg', 47, 58, 'Active', '2025-03-25 08:00:00', NULL, 0, 'Kim loại', 'Lớn'),
(151, 'Bàn làm việc Compact', 'ban-lam-viec-compact', 'Bàn làm việc Compact có thiết kế nhỏ gọn, tối ưu hóa không gian làm việc nhưng vẫn đảm bảo sự tiện nghi. Chất liệu gỗ cao cấp, phù hợp với không gian nhỏ hẹp.', 'Bàn làm việc nhỏ gọn', 18, 6800000, NULL, 'desk_3.jpg', 47, 58, 'Active', '2025-03-25 08:05:00', NULL, 0, 'Gỗ', 'Nhỏ'),
(152, 'Bàn làm việc Executive', 'ban-lam-viec-executive', 'Bàn làm việc Executive dành cho giám đốc với thiết kế sang trọng, chất liệu gỗ cao cấp và kiểu dáng bề thế. Sản phẩm giúp tôn lên đẳng cấp và sự chuyên nghiệp của không gian làm việc.', 'Bàn giám đốc', 12, 12500000, 11900000.00, 'desk_4.jpg', 47, 58, 'Active', '2025-03-25 08:10:00', NULL, 0, 'Gỗ', 'Lớn'),
(153, 'Bàn làm việc Minimal', 'ban-lam-viec-minimal', 'Bàn làm việc Minimal mang phong cách tối giản với thiết kế tinh gọn, giúp tối ưu không gian làm việc. Chất liệu kim loại cao cấp giúp sản phẩm có độ bền cao và dễ vệ sinh.', 'Bàn tối giản', 25, 7000000, NULL, 'desk_5.jpg', 47, 58, 'Active', '2025-03-25 08:15:00', NULL, 0, 'Kim loại', 'Trung bình'),
(154, 'Bàn làm việc Smart Desk', 'ban-lam-viec-smart-desk', 'Bàn làm việc Smart Desk là sản phẩm thông minh, tích hợp cổng sạc và các tiện ích hiện đại. Phù hợp với những người làm việc trong môi trường công nghệ hoặc cần không gian sáng tạo.', 'Bàn làm việc thông minh', 15, 9000000, 8500000.00, 'desk_6.jpg', 47, 58, 'Active', '2025-03-25 08:20:00', NULL, 2, 'Gỗ', 'Lớn'),
(155, 'Bàn làm việc Home Office', 'ban-lam-viec-home-office', 'Bàn làm việc Home Office được thiết kế tiện lợi dành riêng cho không gian làm việc tại nhà. Kiểu dáng hiện đại, chất liệu gỗ bền đẹp, giúp tạo môi trường làm việc thoải mái.', 'Bàn làm việc tại nhà', 22, 6500000, NULL, 'desk_7.jpg', 47, 58, 'Active', '2025-03-25 08:25:00', NULL, 1, 'Gỗ', 'Trung bình'),
(156, 'Bàn làm việc Ergonomic', 'ban-lam-viec-ergonomic', 'Bàn làm việc Ergonomic giúp bảo vệ sức khỏe với thiết kế công thái học, hỗ trợ tư thế ngồi đúng, giảm căng thẳng cho cột sống và cổ tay. Chất liệu kim loại chắc chắn, phù hợp với dân văn phòng.', 'Bàn công thái học', 10, 11000000, 10500000.00, 'desk_8.jpg', 47, 58, 'Active', '2025-03-25 08:30:00', NULL, 0, 'Kim loại', 'Lớn'),
(157, 'Tủ bếp Modern Kitchen', 'tu-bep-modern-kitchen', 'Tủ bếp Modern Kitchen có thiết kế hiện đại, giúp tối ưu không gian lưu trữ. Chất liệu gỗ bền đẹp, phù hợp với những căn hộ hiện đại và gia đình yêu thích phong cách tinh tế.', 'Tủ bếp hiện đại', 10, 15000000, NULL, 'kitchen_cabinet_2.jpg', 48, 59, 'Active', '2025-03-25 09:00:00', NULL, 0, 'Gỗ', 'Lớn'),
(158, 'Tủ bếp Compact', 'tu-bep-compact', 'Tủ bếp Compact với thiết kế nhỏ gọn, phù hợp với những căn hộ diện tích hạn chế. Cung cấp không gian lưu trữ tiện lợi và dễ dàng phối hợp với nội thất khác.', 'Tủ bếp nhỏ gọn', 15, 12000000, 11500000.00, 'kitchen_cabinet_3.jpg', 48, 59, 'Active', '2025-03-25 09:05:00', NULL, 0, 'Gỗ', 'Nhỏ'),
(159, 'Tủ bếp Luxury', 'tu-bep-luxury', 'Tủ bếp Luxury được làm từ chất liệu cao cấp, mang lại sự sang trọng và đẳng cấp cho căn bếp. Kiểu dáng tinh tế, phù hợp với những gia đình yêu thích phong cách xa hoa.', 'Tủ bếp sang trọng', 8, 25000000, NULL, 'kitchen_cabinet_4.jpg', 48, 59, 'Active', '2025-03-25 09:10:00', NULL, 0, 'Kim loại', 'Lớn'),
(160, 'Tủ bếp Classic', 'tu-bep-classic', 'Tủ bếp Classic mang phong cách cổ điển với đường nét tinh tế, tạo điểm nhấn sang trọng cho không gian bếp. Chất liệu gỗ bền bỉ, đảm bảo tuổi thọ dài lâu.', 'Tủ bếp cổ điển', 12, 18000000, 17500000.00, 'kitchen_cabinet_5.jpg', 48, 59, 'Active', '2025-03-25 09:15:00', NULL, 0, 'Gỗ', 'Trung bình'),
(161, 'Tủ bếp Smart', 'tu-bep-smart', 'Tủ bếp Smart là lựa chọn hoàn hảo cho gia đình hiện đại với thiết kế thông minh, tích hợp nhiều tiện ích giúp tối ưu hóa việc nấu nướng và lưu trữ thực phẩm.', 'Tủ bếp thông minh', 20, 20000000, 19000000.00, 'kitchen_cabinet_6.jpg', 48, 59, 'Active', '2025-03-25 09:20:00', NULL, 0, 'Kim loại', 'Lớn'),
(162, 'Tủ bếp Scandinavian', 'tu-bep-scandinavian', 'Tủ bếp Scandinavian mang phong cách Bắc Âu tối giản, sử dụng gam màu nhẹ nhàng và đường nét tinh tế. Chất liệu gỗ tự nhiên giúp không gian bếp trở nên ấm cúng hơn.', 'Tủ bếp Bắc Âu', 14, 16000000, NULL, 'kitchen_cabinet_7.jpg', 48, 59, 'Active', '2025-03-25 09:25:00', NULL, 1, 'Gỗ', 'Trung bình'),
(163, 'Tủ bếp Minimalist', 'tu-bep-minimalist', 'Tủ bếp Minimalist với thiết kế tối giản, giúp không gian bếp trở nên thoáng đãng và hiện đại. Chất liệu kim loại bền đẹp, dễ dàng vệ sinh và bảo trì.', 'Tủ bếp tối giản', 18, 14000000, 13500000.00, 'kitchen_cabinet_8.jpg', 48, 59, 'Active', '2025-03-25 09:30:00', NULL, 1, 'Kim loại', 'Nhỏ'),
(164, 'Tủ sách Wooden Classic', 'tu-sach-wooden-classic', 'Tủ sách Wooden Classic với chất liệu gỗ tự nhiên, thiết kế cổ điển, mang lại vẻ sang trọng và ấm áp cho không gian sống. Phù hợp với những ai yêu thích phong cách truyền thống.', 'Tủ sách gỗ cổ điển', 10, 8500000, NULL, 'bookshelf_2.jpg', 49, 60, 'Active', '2025-03-25 10:00:00', NULL, 13, 'Gỗ', 'Lớn'),
(165, 'Tủ sách Modern Metal', 'tu-sach-modern-metal', 'Tủ sách Modern Metal có thiết kế hiện đại, sử dụng chất liệu kim loại chắc chắn, phù hợp với không gian sống trẻ trung và hiện đại.', 'Tủ sách kim loại hiện đại', 15, 7500000, 7200000.00, 'bookshelf_3.jpg', 49, 60, 'Active', '2025-03-25 10:05:00', NULL, 2, 'Kim loại', 'Trung bình'),
(166, 'Tủ sách Scandinavian', 'tu-sach-scandinavian', 'Tủ sách Scandinavian với phong cách Bắc Âu tinh tế, tối giản nhưng vẫn đảm bảo công năng. Chất liệu gỗ tự nhiên giúp tạo nên không gian ấm cúng và thoải mái.', 'Tủ sách Bắc Âu', 12, 9000000, NULL, 'bookshelf_4.png', 49, 60, 'Active', '2025-03-25 10:10:00', NULL, 5, 'Gỗ', 'Lớn'),
(167, 'Tủ sách Metal Industrial', 'tu-sach-metal-industrial', 'Tủ sách Metal Industrial mang phong cách công nghiệp mạnh mẽ, thiết kế kim loại chắc chắn, phù hợp với những không gian loft hoặc hiện đại.', 'Tủ sách công nghiệp', 18, 7000000, NULL, 'bookshelf_5.jpg', 49, 60, 'Active', '2025-03-25 10:15:00', NULL, 0, 'Kim loại', 'Trung bình'),
(168, 'Tủ sách Minimalist', 'tu-sach-minimalist', 'Tủ sách Minimalist với thiết kế tối giản nhưng vẫn tinh tế, phù hợp với không gian hiện đại. Chất liệu gỗ tự nhiên mang lại vẻ đẹp tự nhiên và thân thiện với môi trường.', 'Tủ sách tối giản', 20, 8200000, 7900000.00, 'bookshelf_6.jpg', 49, 60, 'Active', '2025-03-25 10:20:00', NULL, 3, 'Gỗ', 'Trung bình'),
(169, 'Tủ sách Loft Style', 'tu-sach-loft-style', 'Tủ sách Loft Style kết hợp giữa gỗ và kim loại, tạo nên phong cách Loft độc đáo và cá tính. Phù hợp với những ai yêu thích sự sáng tạo và phá cách.', 'Tủ sách phong cách Loft', 14, 9500000, NULL, 'bookshelf_7.jpg', 49, 60, 'Active', '2025-03-25 10:25:00', NULL, 3, 'Gỗ & Kim loại', 'Lớn'),
(170, 'Tủ sách Compact', 'tu-sach-compact', 'Tủ sách Compact có thiết kế nhỏ gọn, giúp tiết kiệm diện tích nhưng vẫn đảm bảo đủ không gian lưu trữ. Chất liệu kim loại bền bỉ, dễ dàng vệ sinh.', 'Tủ sách nhỏ gọn', 16, 6500000, NULL, 'bookshelf_8.jpg', 49, 60, 'Active', '2025-03-25 10:30:00', NULL, 6, 'Kim loại', 'Nhỏ');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `rating` int(11) NOT NULL CHECK (`rating` between 1 and 5),
  `comment` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `image` varchar(255) DEFAULT NULL,
  `reviewed_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `phone` varchar(30) NOT NULL,
  `address` text NOT NULL,
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Chỉ mục cho bảng `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `brands_slug_unique` (`slug`);

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cart_user` (`user_id`),
  ADD KEY `fk_cart_product` (`product_id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_details_order_id_foreign` (`order_id`),
  ADD KEY `order_details_product_id_foreign` (`product_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_brand_id_foreign` (`brand_id`);

--
-- Chỉ mục cho bảng `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT cho bảng `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=181;

--
-- AUTO_INCREMENT cho bảng `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `fk_cart_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_cart_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_orders_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `fk_order_details_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_order_details_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_details_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`),
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Các ràng buộc cho bảng `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
