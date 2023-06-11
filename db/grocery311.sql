-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 07, 2023 at 05:24 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `grocery311`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Phone_Number` varchar(20) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `Name`, `Phone_Number`, `Email`, `username`, `password`) VALUES
(1, 'Ron', '1234567890', 'ronn@example.com', 'john', 'pass1'),
(2, 'Batash', '9876543210', 'bk@example.com', 'jane', 'pass2'),
(3, 'Akash', '5555555555', 'ak@example.com', 'robert', 'pass3');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `total_price` decimal(10,2) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `customer_phone_number` varchar(20) DEFAULT NULL,
  `customer_name` varchar(50) DEFAULT NULL,
  `customer_password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `customer_phone_number`, `customer_name`, `customer_password`) VALUES
(1, '1234567890', 'John ', 'pass123'),
(3, '9876543210', 'Jane ', 'pass'),
(4, '12', 'Jane ', 'pass');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `total_price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `uom_id` int(11) DEFAULT NULL,
  `price_unit` decimal(10,2) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `name`, `uom_id`, `price_unit`, `category`) VALUES
(4, 'Bread', 4, 3.49, 'Bakery'),
(5, 'Chicken', 5, 6.99, 'Meat'),
(6, 'Tomato', 6, 1.99, 'Produce'),
(7, 'Eggs', 3, 2.49, 'Dairy'),
(8, 'Sugar', 7, 2.29, 'Baking'),
(9, 'Butter', 3, 4.99, 'Dairy'),
(10, 'Salt', 7, 1.49, 'Spices'),
(11, 'Pasta', 8, 2.99, 'Pasta'),
(12, 'Coffee', 9, 5.99, 'Beverages'),
(13, 'Tea', 9, 3.99, 'Beverages'),
(14, 'Apples', 6, 1.49, 'Produce'),
(15, 'Orange Juice', 9, 3.49, 'Beverages'),
(16, 'Potatoes', 6, 2.99, 'Produce'),
(17, 'Cheese', 3, 7.99, 'Dairy'),
(18, 'Yogurt', 3, 1.99, 'Dairy'),
(19, 'Beef', 5, 9.99, 'Meat'),
(20, 'Onions', 6, 0.99, 'Produce'),
(21, 'Chocolate', 10, 4.99, 'Sweets'),
(22, 'Soda', 9, 1.99, 'Beverages'),
(23, 'Lettuce', 6, 1.49, 'Produce'),
(24, 'Chicken Breasts', 5, 7.99, 'Meat'),
(25, 'Cucumbers', 6, 1.29, 'Produce'),
(26, 'Fish', 11, 9.99, 'Seafood'),
(27, 'Ice Cream', 3, 3.99, 'Dairy'),
(28, 'Carrots', 6, 0.99, 'Produce'),
(29, 'Juice', 9, 2.49, 'Beverages'),
(30, 'Cereal', 12, 4.99, 'Breakfast'),
(40, 'Car Engine Oil', 2, 25.99, 'Automotive'),
(41, 'Car Battery', 3, 99.99, 'Automotive'),
(42, 'Tire Pressure Gauge', 6, 12.99, 'Automotive'),
(43, 'Car Wax', 1, 19.99, 'Automotive'),
(44, 'Windshield Wipers', 3, 15.99, 'Automotive'),
(45, 'Car Air Freshener', 3, 6.99, 'Automotive'),
(46, 'Car Wash Shampoo', 1, 9.99, 'Automotive'),
(47, 'Wheel Cleaner', 1, 14.99, 'Automotive'),
(48, 'Car Floor Mats', 3, 29.99, 'Automotive'),
(49, 'Car Polish', 1, 17.99, 'Automotive'),
(50, 'Car Tire', 3, 89.99, 'Automotive'),
(51, 'Car Brake Pads', 3, 49.99, 'Automotive'),
(52, 'Car Wash Sponge', 6, 7.99, 'Automotive'),
(53, 'Car Paint Sealant', 1, 34.99, 'Automotive'),
(54, 'Car Scratch Remover', 3, 11.99, 'Automotive'),
(55, 'Car Air Filter', 3, 19.99, 'Automotive'),
(56, 'Car Headlight Bulb', 3, 8.99, 'Automotive'),
(57, 'Car Seat Covers', 3, 49.99, 'Automotive'),
(58, 'Car GPS Navigator', 6, 129.99, 'Automotive'),
(59, 'Car Phone Holder', 6, 14.99, 'Automotive'),
(60, 'T-Shirt', 3, 15.99, 'Clothing'),
(61, 'Jeans', 3, 49.99, 'Clothing'),
(62, 'Dress', 3, 39.99, 'Clothing'),
(63, 'Sweater', 3, 29.99, 'Clothing'),
(64, 'Jacket', 3, 59.99, 'Clothing'),
(65, 'Skirt', 3, 24.99, 'Clothing'),
(66, 'Blouse', 3, 19.99, 'Clothing'),
(67, 'Shorts', 3, 34.99, 'Clothing'),
(68, 'Pants', 3, 44.99, 'Clothing'),
(69, 'Socks', 3, 5.99, 'Clothing'),
(70, 'Shirt', 3, 29.99, 'Clothing'),
(71, 'Dress Shirt', 3, 39.99, 'Clothing'),
(72, 'Sweatshirt', 3, 34.99, 'Clothing'),
(73, 'Joggers', 3, 39.99, 'Clothing'),
(74, 'Hoodie', 3, 49.99, 'Clothing'),
(75, 'Blazer', 3, 69.99, 'Clothing'),
(76, 'Coat', 3, 79.99, 'Clothing'),
(77, 'Polo Shirt', 3, 24.99, 'Clothing'),
(78, 'Tank Top', 3, 14.99, 'Clothing'),
(79, 'Sweatpants', 3, 34.99, 'Clothing'),
(80, 'Baby Diapers', 3, 15.99, 'Baby Products'),
(81, 'Baby Wipes', 4, 4.99, 'Baby Products'),
(82, 'Baby Formula', 2, 29.99, 'Baby Products'),
(83, 'Baby Shampoo', 6, 7.99, 'Baby Products'),
(84, 'Baby Lotion', 9, 6.49, 'Baby Products'),
(85, 'Baby Powder', 7, 3.99, 'Baby Products'),
(86, 'Baby Food', 12, 1.99, 'Baby Products'),
(87, 'Baby Onesies', 3, 9.99, 'Baby Products'),
(88, 'Baby Socks', 15, 2.99, 'Baby Products'),
(89, 'Baby Bibs', 3, 4.99, 'Baby Products'),
(90, 'Baby Blanket', 6, 12.99, 'Baby Products'),
(91, 'Baby Pacifier', 18, 3.49, 'Baby Products'),
(92, 'Baby Bottles', 16, 8.99, 'Baby Products'),
(93, 'Baby High Chair', 3, 39.99, 'Baby Products'),
(94, 'Baby Stroller', 12, 129.99, 'Baby Products'),
(95, 'Baby Car Seat', 3, 179.99, 'Baby Products'),
(96, 'Baby Monitor', 6, 49.99, 'Baby Products'),
(97, 'Baby Safety Gate', 3, 29.99, 'Baby Products'),
(98, 'Baby Teething Toys', 6, 5.99, 'Baby Products'),
(99, 'Baby Bath Tub', 3, 19.99, 'Baby Products'),
(100, 'Bread', 12, 2.99, 'Bakery'),
(101, 'Croissant', 12, 1.99, 'Bakery'),
(102, 'Bagel', 12, 0.99, 'Bakery'),
(103, 'Muffin', 12, 1.49, 'Bakery'),
(104, 'Donut', 12, 0.79, 'Bakery'),
(105, 'Pastry', 12, 1.79, 'Bakery'),
(106, 'Roll', 12, 0.89, 'Bakery'),
(107, 'Cake', 12, 10.99, 'Bakery'),
(108, 'Cookie', 12, 0.49, 'Bakery'),
(109, 'Pie', 12, 8.99, 'Bakery'),
(110, 'Cupcake', 12, 1.29, 'Bakery'),
(111, 'Scone', 12, 1.19, 'Bakery'),
(112, 'Pretzel', 12, 0.99, 'Bakery'),
(113, 'Cinnamon Roll', 12, 1.99, 'Bakery'),
(114, 'Danish', 12, 1.49, 'Bakery'),
(115, 'Biscuit', 12, 0.79, 'Bakery'),
(116, 'Baguette', 12, 1.99, 'Bakery'),
(117, 'Tart', 12, 2.49, 'Bakery'),
(118, 'Bun', 12, 0.99, 'Bakery'),
(119, 'Brioche', 12, 1.79, 'Bakery'),
(120, 'Flour', 7, 2.99, 'Baking'),
(121, 'Sugar', 5, 1.99, 'Baking'),
(122, 'Baking Powder', 6, 0.99, 'Baking'),
(123, 'Vanilla Extract', 10, 4.99, 'Baking'),
(124, 'Cocoa Powder', 7, 3.49, 'Baking'),
(125, 'Butter', 1, 2.49, 'Baking'),
(126, 'Eggs', 3, 1.99, 'Baking'),
(127, 'Yeast', 6, 1.49, 'Baking'),
(128, 'Chocolate Chips', 4, 2.99, 'Baking'),
(129, 'Baking Soda', 6, 0.99, 'Baking'),
(130, 'Whipped Cream', 2, 3.99, 'Baking'),
(131, 'Shortening', 1, 2.49, 'Baking'),
(132, 'Cornstarch', 7, 1.49, 'Baking'),
(133, 'Parchment Paper', 12, 1.99, 'Baking'),
(134, 'Almond Extract', 10, 4.99, 'Baking'),
(135, 'Cake Mix', 4, 2.49, 'Baking'),
(136, 'Food Coloring', 6, 1.99, 'Baking'),
(137, 'Pie Crust', 6, 2.99, 'Baking'),
(138, 'Sprinkles', 7, 1.49, 'Baking'),
(139, 'Baking Spray', 6, 2.99, 'Baking'),
(140, 'coke', 2, 2.99, 'Beverages'),
(141, 'Diet coke', 16, 1.99, 'Beverages'),
(142, 'Pepsi', 16, 3.49, 'Beverages'),
(143, '7 up', 2, 1.49, 'Beverages'),
(144, 'RC cola', 9, 0.99, 'Beverages'),
(145, 'Fanta', 16, 2.99, 'Beverages'),
(146, 'Miranda', 17, 0.79, 'Beverages'),
(147, 'Shakes', 9, 1.99, 'Beverages'),
(148, 'Red bull', 16, 4.99, 'Beverages'),
(149, 'Apple Juice', 2, 3.99, 'Beverages'),
(150, 'Orange Juice', 16, 2.49, 'Beverages'),
(151, 'Mango Juice', 17, 1.29, 'Beverages'),
(152, 'Watemelon Juice', 2, 0.99, 'Beverages'),
(153, 'Amul kool', 16, 3.99, 'Beverages'),
(154, 'Beverage 15', 17, 1.99, 'Beverages'),
(155, 'Beverage 16', 9, 2.49, 'Beverages'),
(156, 'Beverage 17', 16, 1.99, 'Beverages'),
(157, 'Beverage 18', 17, 0.99, 'Beverages'),
(158, 'Beverage 19', 9, 3.99, 'Beverages'),
(159, 'Beverage 20', 16, 2.99, 'Beverages'),
(160, 'Book 1', 3, 10.99, 'Books'),
(161, 'Book 2', 3, 12.99, 'Books'),
(162, 'Book 3', 3, 9.99, 'Books'),
(163, 'Book 4', 3, 14.99, 'Books'),
(164, 'Book 5', 3, 8.99, 'Books'),
(165, 'Book 6', 3, 11.99, 'Books'),
(166, 'Book 7', 3, 13.99, 'Books'),
(167, 'Book 8', 3, 10.49, 'Books'),
(168, 'Book 9', 3, 15.49, 'Books'),
(169, 'Book 10', 3, 12.99, 'Books'),
(170, 'Book 11', 3, 9.99, 'Books'),
(171, 'Book 12', 3, 11.99, 'Books'),
(172, 'Book 13', 3, 14.99, 'Books'),
(173, 'Book 14', 3, 10.99, 'Books'),
(174, 'Book 15', 3, 13.49, 'Books'),
(175, 'Book 16', 3, 9.99, 'Books'),
(176, 'Book 17', 3, 12.99, 'Books'),
(177, 'Book 18', 3, 11.99, 'Books'),
(178, 'Book 19', 3, 14.99, 'Books'),
(179, 'Book 20', 3, 10.99, 'Books'),
(180, 'Canned Beans', 17, 2.99, 'Canned Goods'),
(181, 'Canned Tuna', 17, 4.49, 'Canned Goods'),
(182, 'Canned Corn', 17, 1.99, 'Canned Goods'),
(183, 'Canned Tomatoes', 17, 1.79, 'Canned Goods'),
(184, 'Canned Peaches', 17, 2.49, 'Canned Goods'),
(185, 'Canned Pineapple', 17, 2.99, 'Canned Goods'),
(186, 'Canned Soup', 17, 1.29, 'Canned Goods'),
(187, 'Canned Salmon', 17, 5.99, 'Canned Goods'),
(188, 'Canned Green Beans', 17, 1.49, 'Canned Goods'),
(189, 'Canned Peas', 17, 1.79, 'Canned Goods'),
(190, 'Canned Carrots', 17, 1.59, 'Canned Goods'),
(191, 'Canned Sardines', 17, 3.49, 'Canned Goods'),
(192, 'Canned Chicken', 17, 4.99, 'Canned Goods'),
(193, 'Canned Fruit Cocktail', 17, 2.79, 'Canned Goods'),
(194, 'Canned Tomato Sauce', 17, 1.39, 'Canned Goods'),
(195, 'Canned Pumpkin', 17, 2.49, 'Canned Goods'),
(196, 'Canned Vienna Sausages', 17, 1.99, 'Canned Goods'),
(197, 'Canned Spam', 17, 3.99, 'Canned Goods'),
(198, 'Canned Olives', 17, 2.29, 'Canned Goods'),
(199, 'Canned Pickles', 17, 2.49, 'Canned Goods'),
(200, 'Cleaning Solution', 2, 9.99, 'Cleaning Supplies'),
(201, 'All-Purpose Cleaner', 4, 4.99, 'Cleaning Supplies'),
(202, 'Disinfecting Wipes', 3, 2.49, 'Cleaning Supplies'),
(203, 'Glass Cleaner', 2, 3.99, 'Cleaning Supplies'),
(204, 'Dustpan and Brush Set', 18, 7.99, 'Cleaning Supplies'),
(205, 'Sponge Scrubbers', 3, 1.99, 'Cleaning Supplies'),
(206, 'Broom', 12, 12.99, 'Cleaning Supplies'),
(207, 'Mop and Bucket Set', 12, 19.99, 'Cleaning Supplies'),
(208, 'Laundry Detergent', 4, 8.99, 'Cleaning Supplies'),
(209, 'Fabric Softener', 2, 6.49, 'Cleaning Supplies'),
(210, 'Toilet Bowl Cleaner', 16, 3.49, 'Cleaning Supplies'),
(211, 'Dish Soap', 3, 2.99, 'Cleaning Supplies'),
(212, 'Trash Bags', 5, 5.99, 'Cleaning Supplies'),
(213, 'Air Freshener Spray', 6, 3.99, 'Cleaning Supplies'),
(214, 'Hand Soap', 9, 1.99, 'Cleaning Supplies'),
(215, 'Stain Remover', 4, 4.99, 'Cleaning Supplies'),
(216, 'Scrub Brush', 3, 1.99, 'Cleaning Supplies'),
(217, 'Window Squeegee', 3, 6.99, 'Cleaning Supplies'),
(218, 'Dusting Spray', 6, 4.49, 'Cleaning Supplies'),
(219, 'Paper Towels', 4, 2.99, 'Cleaning Supplies'),
(220, 'Ketchup', 17, 2.99, 'Condiments'),
(221, 'Mayonnaise', 17, 3.49, 'Condiments'),
(222, 'Mustard', 17, 1.99, 'Condiments'),
(223, 'Soy Sauce', 16, 4.99, 'Condiments'),
(224, 'Vinegar', 16, 2.49, 'Condiments'),
(225, 'Hot Sauce', 17, 3.99, 'Condiments'),
(226, 'BBQ Sauce', 16, 3.79, 'Condiments'),
(227, 'Salad Dressing', 17, 2.99, 'Condiments'),
(228, 'Salsa', 17, 2.99, 'Condiments'),
(229, 'Pickles', 17, 2.49, 'Condiments'),
(230, 'Olives', 17, 3.99, 'Condiments'),
(231, 'Honey', 16, 4.99, 'Condiments'),
(232, 'Maple Syrup', 16, 5.99, 'Condiments'),
(233, 'Jam', 17, 3.49, 'Condiments'),
(234, 'Peanut Butter', 17, 3.99, 'Condiments'),
(235, 'Nutella', 16, 6.99, 'Condiments'),
(236, 'Sour Cream', 16, 2.99, 'Condiments'),
(237, 'Ranch Dressing', 17, 3.49, 'Condiments'),
(238, 'Tartar Sauce', 16, 2.99, 'Condiments'),
(239, 'Horseradish', 17, 1.99, 'Condiments'),
(240, 'Milk', 2, 2.99, 'Dairy'),
(241, 'Cheese', 1, 4.99, 'Dairy'),
(242, 'Yogurt', 6, 1.49, 'Dairy'),
(243, 'Butter', 4, 3.29, 'Dairy'),
(244, 'Cream', 2, 1.99, 'Dairy'),
(245, 'Cottage Cheese', 1, 2.49, 'Dairy'),
(246, 'Sour Cream', 4, 1.79, 'Dairy'),
(247, 'Whipped Cream', 2, 2.99, 'Dairy'),
(248, 'Milkshake', 6, 3.99, 'Dairy'),
(249, 'Ice Cream', 1, 5.99, 'Dairy'),
(250, 'Ghee', 4, 6.99, 'Dairy'),
(251, 'Mozzarella', 1, 3.99, 'Dairy'),
(252, 'Paneer', 1, 2.99, 'Dairy'),
(253, 'Greek Yogurt', 6, 2.49, 'Dairy'),
(254, 'Condensed Milk', 2, 1.99, 'Dairy'),
(255, 'Buttermilk', 6, 0.99, 'Dairy'),
(256, 'Eggs', 3, 2.49, 'Dairy'),
(257, 'Half-and-Half', 2, 1.99, 'Dairy'),
(258, 'Whipping Cream', 2, 2.99, 'Dairy'),
(259, 'Chocolate Milk', 2, 2.49, 'Dairy'),
(260, 'Frozen Pizza', 1, 10.99, 'Frozen Foods'),
(261, 'Ice Cream', 2, 4.99, 'Frozen Foods'),
(262, 'Frozen Vegetables', 1, 2.49, 'Frozen Foods'),
(263, 'Frozen Chicken Nuggets', 3, 6.99, 'Frozen Foods'),
(264, 'Frozen French Fries', 1, 3.99, 'Frozen Foods'),
(265, 'Frozen Fish Fillets', 5, 8.99, 'Frozen Foods'),
(266, 'Frozen Shrimp', 5, 12.99, 'Frozen Foods'),
(267, 'Frozen Berry Mix', 4, 6.49, 'Frozen Foods'),
(268, 'Frozen Breakfast Sandwich', 6, 3.79, 'Frozen Foods'),
(269, 'Frozen Waffles', 3, 2.99, 'Frozen Foods'),
(270, 'Frozen Chicken Wings', 5, 9.99, 'Frozen Foods'),
(271, 'Frozen Meatballs', 4, 5.99, 'Frozen Foods'),
(272, 'Frozen TV Dinner', 6, 4.49, 'Frozen Foods'),
(273, 'Frozen Pie Crust', 4, 2.99, 'Frozen Foods'),
(274, 'Frozen Fruit Bars', 3, 3.99, 'Frozen Foods'),
(275, 'Frozen Burritos', 4, 1.99, 'Frozen Foods'),
(276, 'Frozen Onion Rings', 1, 3.49, 'Frozen Foods'),
(277, 'Frozen Potatoes', 1, 2.99, 'Frozen Foods'),
(278, 'Frozen Spinach', 7, 1.99, 'Frozen Foods'),
(279, 'Frozen Taquitos', 4, 4.99, 'Frozen Foods'),
(280, 'Garden Gloves', 6, 9.99, 'Gardening and Outdoor'),
(281, 'Pruning Shears', 6, 19.99, 'Gardening and Outdoor'),
(282, 'Plant Pots', 3, 5.99, 'Gardening and Outdoor'),
(283, 'Garden Shovel', 6, 14.99, 'Gardening and Outdoor'),
(284, 'Hose Nozzle', 3, 7.99, 'Gardening and Outdoor'),
(285, 'Lawn Sprinkler', 3, 29.99, 'Gardening and Outdoor'),
(286, 'Weed Killer', 4, 12.99, 'Gardening and Outdoor'),
(287, 'Garden Fertilizer', 4, 8.99, 'Gardening and Outdoor'),
(288, 'Plant Seeds', 3, 3.99, 'Gardening and Outdoor'),
(289, 'Garden Hose', 3, 19.99, 'Gardening and Outdoor'),
(290, 'Garden Rake', 6, 11.99, 'Gardening and Outdoor'),
(291, 'Leaf Blower', 6, 79.99, 'Gardening and Outdoor'),
(292, 'Outdoor Umbrella', 6, 39.99, 'Gardening and Outdoor'),
(293, 'Garden Bench', 6, 89.99, 'Gardening and Outdoor'),
(294, 'Outdoor Grill', 6, 199.99, 'Gardening and Outdoor'),
(295, 'Garden Trowel', 6, 6.99, 'Gardening and Outdoor'),
(296, 'Garden Hose Reel', 6, 29.99, 'Gardening and Outdoor'),
(297, 'Lawn Mower', 6, 159.99, 'Gardening and Outdoor'),
(298, 'Garden Cart', 6, 49.99, 'Gardening and Outdoor'),
(299, 'Outdoor Solar Lights', 6, 24.99, 'Gardening and Outdoor'),
(300, 'Rice', 1, 3.99, 'Grains'),
(301, 'Wheat Flour', 1, 2.49, 'Grains'),
(302, 'Oats', 1, 1.99, 'Grains'),
(303, 'Barley', 1, 2.79, 'Grains'),
(304, 'Cornmeal', 1, 1.89, 'Grains'),
(305, 'Quinoa', 1, 4.99, 'Grains'),
(306, 'Buckwheat', 1, 3.49, 'Grains'),
(307, 'Couscous', 1, 2.29, 'Grains'),
(308, 'Millet', 1, 1.79, 'Grains'),
(309, 'Farro', 1, 3.99, 'Grains'),
(310, 'Polenta', 1, 2.49, 'Grains'),
(311, 'Spelt', 1, 4.49, 'Grains'),
(312, 'Bulgur', 1, 2.99, 'Grains'),
(313, 'Rye', 1, 3.29, 'Grains'),
(314, 'Amaranth', 1, 4.79, 'Grains'),
(315, 'Sorghum', 1, 3.99, 'Grains'),
(316, 'Teff', 1, 5.49, 'Grains'),
(317, 'Black Rice', 1, 6.99, 'Grains'),
(318, 'White Rice', 1, 3.99, 'Grains'),
(319, 'Brown Rice', 1, 4.49, 'Grains'),
(340, 'Decorative Wall Clock', 3, 29.99, 'Home Decor'),
(341, 'Throw Pillow Cover', 3, 12.99, 'Home Decor'),
(342, 'Framed Art Print', 3, 39.99, 'Home Decor'),
(343, 'Table Lamp', 3, 49.99, 'Home Decor'),
(344, 'Wall Mirror', 3, 59.99, 'Home Decor'),
(345, 'Decorative Vase', 3, 24.99, 'Home Decor'),
(346, 'Candle Holder Set', 3, 19.99, 'Home Decor'),
(347, 'Coat Rack Stand', 3, 34.99, 'Home Decor'),
(348, 'Indoor Plant Pot', 3, 14.99, 'Home Decor'),
(349, 'Accent Rug', 3, 39.99, 'Home Decor'),
(350, 'Decorative Throw Blanket', 3, 27.99, 'Home Decor'),
(351, 'Wall Shelf', 3, 32.99, 'Home Decor'),
(352, 'Picture Frame Set', 3, 19.99, 'Home Decor'),
(353, 'Bookshelf', 3, 79.99, 'Home Decor'),
(354, 'Floor Lamp', 3, 69.99, 'Home Decor'),
(355, 'Decorative Tray', 3, 16.99, 'Home Decor'),
(356, 'Curtain Panel Set', 3, 39.99, 'Home Decor'),
(357, 'Wall Art Tapestry', 3, 29.99, 'Home Decor'),
(358, 'Decorative Wall Shelves', 3, 42.99, 'Home Decor'),
(359, 'Area Rug', 3, 79.99, 'Home Decor'),
(360, 'Shampoo', 3, 10.99, 'Health and Beauty'),
(361, 'Conditioner', 3, 9.99, 'Health and Beauty'),
(362, 'Toothpaste', 6, 4.49, 'Health and Beauty'),
(363, 'Toothbrush', 3, 2.99, 'Health and Beauty'),
(364, 'Body Wash', 3, 8.99, 'Health and Beauty'),
(365, 'Facial Cleanser', 3, 12.99, 'Health and Beauty'),
(366, 'Lotion', 6, 6.99, 'Health and Beauty'),
(367, 'Deodorant', 6, 3.99, 'Health and Beauty'),
(368, 'Sunscreen', 6, 9.99, 'Health and Beauty'),
(369, 'Makeup Remover', 3, 7.99, 'Health and Beauty'),
(370, 'Hair Gel', 4, 5.49, 'Health and Beauty'),
(371, 'Hair Spray', 4, 6.49, 'Health and Beauty'),
(372, 'Face Mask', 3, 3.99, 'Health and Beauty'),
(373, 'Razor', 3, 4.99, 'Health and Beauty'),
(374, 'Shaving Cream', 4, 3.49, 'Health and Beauty'),
(375, 'Perfume', 6, 19.99, 'Health and Beauty'),
(376, 'Nail Polish', 3, 5.99, 'Health and Beauty'),
(377, 'Hair Brush', 3, 6.99, 'Health and Beauty'),
(378, 'Hand Sanitizer', 6, 2.99, 'Health and Beauty'),
(379, 'Mouthwash', 2, 7.99, 'Health and Beauty'),
(380, 'Toilet Paper', 3, 2.99, 'Household Supplies'),
(381, 'Laundry Detergent', 4, 9.99, 'Household Supplies'),
(382, 'Dish Soap', 6, 1.99, 'Household Supplies'),
(383, 'Trash Bags', 5, 5.99, 'Household Supplies'),
(384, 'Bath Towels', 9, 12.99, 'Household Supplies'),
(385, 'Cleaning Wipes', 4, 3.49, 'Household Supplies'),
(386, 'Air Freshener', 6, 2.49, 'Household Supplies'),
(387, 'Mop and Bucket Set', 18, 19.99, 'Household Supplies'),
(388, 'Sponges', 3, 0.99, 'Household Supplies'),
(389, 'Paper Towels', 9, 3.99, 'Household Supplies'),
(390, 'Broom', 3, 8.99, 'Household Supplies'),
(391, 'Vacuum Cleaner', 6, 89.99, 'Household Supplies'),
(392, 'Dustpan and Brush', 18, 4.99, 'Household Supplies'),
(393, 'Window Cleaner', 6, 3.99, 'Household Supplies'),
(394, 'Plastic Storage Containers', 9, 6.99, 'Household Supplies'),
(395, 'Dish Rack', 6, 12.99, 'Household Supplies'),
(396, 'Garbage Bin', 6, 14.99, 'Household Supplies'),
(397, 'Ironing Board', 18, 24.99, 'Household Supplies'),
(398, 'Shoe Rack', 3, 9.99, 'Household Supplies'),
(399, 'Drawer Organizer', 3, 5.99, 'Household Supplies'),
(400, 'Ground Beef', 11, 9.99, 'Meat'),
(401, 'Chicken Breast', 5, 7.99, 'Meat'),
(402, 'Beef Chops', 3, 6.49, 'Meat'),
(403, 'Sirloin Steak', 1, 14.99, 'Meat'),
(404, 'Lamb Leg', 1, 12.99, 'Meat'),
(405, 'Ground Turkey', 11, 8.99, 'Meat'),
(406, 'Bacon', 9, 5.99, 'Meat'),
(407, 'Salmon Fillet', 1, 10.99, 'Meat'),
(408, 'Shrimp', 7, 11.99, 'Meat'),
(409, 'Tilapia Fillet', 1, 9.99, 'Meat'),
(410, 'Pork Ribs', 3, 7.99, 'Meat'),
(411, 'Beef Roast', 1, 13.99, 'Meat'),
(412, 'Ground Lamb', 11, 10.99, 'Meat'),
(413, 'Chicken Wings', 3, 5.99, 'Meat'),
(414, 'Turkey Breast', 5, 9.99, 'Meat'),
(415, 'Beef Tenderloin', 1, 18.99, 'Meat'),
(416, 'Lamb Chops', 3, 11.99, 'Meat'),
(417, 'Beef Sausage', 4, 6.99, 'Meat'),
(418, 'Ground Bison', 11, 15.99, 'Meat'),
(419, 'Chicken Thighs', 3, 6.99, 'Meat'),
(420, 'Stapler', 3, 5.99, 'Office Supplies'),
(421, 'Printer Paper', 4, 8.99, 'Office Supplies'),
(422, 'Pen Set', 6, 9.99, 'Office Supplies'),
(423, 'Desk Organizer', 12, 15.99, 'Office Supplies'),
(424, 'File Folders', 3, 6.49, 'Office Supplies'),
(425, 'Notepad', 6, 3.99, 'Office Supplies'),
(426, 'Calculator', 3, 12.99, 'Office Supplies'),
(427, 'Whiteboard', 12, 24.99, 'Office Supplies'),
(428, 'Highlighter Set', 6, 4.99, 'Office Supplies'),
(429, 'Paper Clips', 3, 1.99, 'Office Supplies'),
(430, 'Scissors', 3, 2.99, 'Office Supplies'),
(431, 'Binder Clips', 3, 3.49, 'Office Supplies'),
(432, 'Correction Tape', 6, 2.49, 'Office Supplies'),
(433, 'USB Flash Drive', 12, 14.99, 'Office Supplies'),
(434, 'Desk Lamp', 6, 19.99, 'Office Supplies'),
(435, 'Envelopes', 3, 5.49, 'Office Supplies'),
(436, 'Dry Erase Markers', 3, 4.99, 'Office Supplies'),
(437, 'File Cabinet', 12, 89.99, 'Office Supplies'),
(438, 'Desk Chair', 12, 129.99, 'Office Supplies'),
(439, 'Mouse Pad', 6, 2.99, 'Office Supplies'),
(440, 'Spaghetti Pasta', 1, 2.99, 'Pasta'),
(441, 'Fettuccine Pasta', 1, 3.49, 'Pasta'),
(442, 'Penne Pasta', 1, 2.79, 'Pasta'),
(443, 'Macaroni Pasta', 1, 2.59, 'Pasta'),
(444, 'Ravioli Pasta', 1, 4.99, 'Pasta'),
(445, 'Lasagna Pasta', 1, 3.99, 'Pasta'),
(446, 'Farfalle Pasta', 1, 2.89, 'Pasta'),
(447, 'Rotini Pasta', 1, 2.49, 'Pasta'),
(448, 'Orzo Pasta', 1, 2.69, 'Pasta'),
(449, 'Cavatappi Pasta', 1, 2.99, 'Pasta'),
(450, 'Linguine Pasta', 1, 3.29, 'Pasta'),
(451, 'Angel Hair Pasta', 1, 2.79, 'Pasta'),
(452, 'Tortellini Pasta', 1, 4.49, 'Pasta'),
(453, 'Rigatoni Pasta', 1, 2.59, 'Pasta'),
(454, 'Manicotti Pasta', 1, 4.99, 'Pasta'),
(455, 'Cappelletti Pasta', 1, 3.99, 'Pasta'),
(456, 'Campanelle Pasta', 1, 2.89, 'Pasta'),
(457, 'Bucatini Pasta', 1, 2.49, 'Pasta'),
(458, 'Gemelli Pasta', 1, 2.69, 'Pasta'),
(459, 'Pappardelle Pasta', 1, 3.29, 'Pasta'),
(460, 'Spaghetti', 7, 2.99, 'Pasta'),
(461, 'Fettuccine', 7, 3.49, 'Pasta'),
(462, 'Rotini', 7, 2.79, 'Pasta'),
(463, 'Linguine', 7, 2.99, 'Pasta'),
(464, 'Penne', 7, 2.49, 'Pasta'),
(465, 'Farfalle', 7, 2.99, 'Pasta'),
(466, 'Rigatoni', 7, 2.79, 'Pasta'),
(467, 'Angel Hair', 7, 2.99, 'Pasta'),
(468, 'Macaroni', 7, 2.49, 'Pasta'),
(469, 'Orzo', 7, 2.99, 'Pasta'),
(470, 'Lasagna', 7, 3.99, 'Pasta'),
(471, 'Tortellini', 7, 4.99, 'Pasta'),
(472, 'Cavatappi', 7, 3.49, 'Pasta'),
(473, 'Ravioli', 7, 4.99, 'Pasta'),
(474, 'Shells', 7, 2.79, 'Pasta'),
(475, 'Pappardelle', 7, 3.99, 'Pasta'),
(476, 'Capellini', 7, 2.99, 'Pasta'),
(477, 'Fusilli', 7, 2.79, 'Pasta'),
(478, 'Manicotti', 7, 4.99, 'Pasta'),
(479, 'Tortelloni', 7, 4.99, 'Pasta'),
(480, 'Shampoo', 9, 8.99, 'Personal Care'),
(481, 'Toothpaste', 3, 2.49, 'Personal Care'),
(482, 'Body Wash', 6, 5.99, 'Personal Care'),
(483, 'Deodorant', 3, 3.99, 'Personal Care'),
(484, 'Face Cream', 2, 12.99, 'Personal Care'),
(485, 'Hair Gel', 9, 6.99, 'Personal Care'),
(486, 'Lotion', 2, 9.99, 'Personal Care'),
(487, 'Toilet Paper', 10, 7.99, 'Personal Care'),
(488, 'Razor', 3, 4.99, 'Personal Care'),
(489, 'Mouthwash', 4, 3.49, 'Personal Care'),
(490, 'Sunscreen', 9, 11.99, 'Personal Care'),
(491, 'Hand Sanitizer', 6, 2.99, 'Personal Care'),
(492, 'Feminine Hygiene', 3, 6.49, 'Personal Care'),
(493, 'Shaving Cream', 5, 4.49, 'Personal Care'),
(494, 'Hair Spray', 9, 7.99, 'Personal Care'),
(495, 'Facial Cleanser', 2, 10.99, 'Personal Care'),
(496, 'Toothbrush', 3, 1.99, 'Personal Care'),
(497, 'Hair Conditioner', 9, 9.99, 'Personal Care'),
(498, 'Wet Wipes', 4, 3.99, 'Personal Care'),
(499, 'Mouth Freshener', 3, 1.49, 'Personal Care'),
(500, 'Apple', 3, 1.99, 'Produce'),
(501, 'Banana', 3, 0.49, 'Produce'),
(502, 'Carrot', 1, 0.99, 'Produce'),
(503, 'Lettuce', 1, 1.49, 'Produce'),
(504, 'Tomato', 3, 0.79, 'Produce'),
(505, 'Broccoli', 1, 1.99, 'Produce'),
(506, 'Cucumber', 3, 0.99, 'Produce'),
(507, 'Grapes', 7, 2.99, 'Produce'),
(508, 'Watermelon', 2, 4.99, 'Produce'),
(509, 'Strawberries', 4, 3.49, 'Produce'),
(510, 'Potato', 1, 0.69, 'Produce'),
(511, 'Onion', 3, 0.79, 'Produce'),
(512, 'Spinach', 1, 1.99, 'Produce'),
(513, 'Mushroom', 5, 2.49, 'Produce'),
(514, 'Avocado', 3, 1.99, 'Produce'),
(515, 'Pineapple', 2, 3.99, 'Produce'),
(516, 'Bell Pepper', 3, 0.99, 'Produce'),
(517, 'Corn', 6, 0.79, 'Produce'),
(518, 'Zucchini', 1, 1.49, 'Produce'),
(519, 'Kiwi', 3, 0.99, 'Produce'),
(520, 'Fresh Salmon', 7, 12.99, 'Seafood'),
(521, 'Tuna Steak', 7, 8.99, 'Seafood'),
(522, 'Shrimp', 7, 16.99, 'Seafood'),
(523, 'Lobster Tail', 7, 24.99, 'Seafood'),
(524, 'Crab Legs', 7, 19.99, 'Seafood'),
(525, 'Scallops', 7, 14.99, 'Seafood'),
(526, 'Mussels', 7, 6.99, 'Seafood'),
(527, 'Clams', 7, 7.99, 'Seafood'),
(528, 'Squid', 7, 9.99, 'Seafood'),
(529, 'Octopus', 7, 11.99, 'Seafood'),
(530, 'Cod Fillet', 7, 10.99, 'Seafood'),
(531, 'Halibut', 7, 15.99, 'Seafood'),
(532, 'Mahi-Mahi', 7, 13.99, 'Seafood'),
(533, 'Crab Cakes', 7, 17.99, 'Seafood'),
(534, 'Salmon Fillet', 7, 11.99, 'Seafood'),
(535, 'Tilapia', 7, 9.99, 'Seafood'),
(536, 'Oysters', 7, 8.99, 'Seafood'),
(537, 'Sardines', 7, 6.99, 'Seafood'),
(538, 'Anchovies', 7, 7.99, 'Seafood'),
(539, 'Caviar', 7, 29.99, 'Seafood'),
(540, 'Potato Chips', 7, 2.99, 'Snacks'),
(541, 'Chocolate Bar', 10, 1.49, 'Snacks'),
(542, 'Popcorn', 4, 1.99, 'Snacks'),
(543, 'Pretzels', 6, 1.79, 'Snacks'),
(544, 'Trail Mix', 5, 3.49, 'Snacks'),
(545, 'Cheese Puffs', 7, 1.99, 'Snacks'),
(546, 'Granola Bars', 12, 2.49, 'Snacks'),
(547, 'Nuts', 11, 4.99, 'Snacks'),
(548, 'Rice Crackers', 4, 2.29, 'Snacks'),
(549, 'Dried Fruit', 7, 3.99, 'Snacks'),
(550, 'Cookies', 6, 1.99, 'Snacks'),
(551, 'Candy', 6, 0.99, 'Snacks'),
(552, 'Beef Jerky', 5, 4.99, 'Snacks'),
(553, 'Pop Chips', 7, 2.49, 'Snacks'),
(554, 'Crackers', 12, 1.79, 'Snacks'),
(555, 'Peanut Butter Cups', 10, 1.99, 'Snacks'),
(556, 'Doritos', 7, 2.99, 'Snacks'),
(557, 'Gummy Bears', 6, 1.49, 'Snacks'),
(558, 'Pita Chips', 4, 2.29, 'Snacks'),
(559, 'Chocolate-covered Pretzels', 10, 2.99, 'Snacks'),
(560, 'Cinnamon Powder', 7, 4.99, 'Spices'),
(561, 'Turmeric Powder', 7, 3.99, 'Spices'),
(562, 'Chili Powder', 7, 2.99, 'Spices'),
(563, 'Cumin Seeds', 7, 5.99, 'Spices'),
(564, 'Coriander Powder', 7, 4.49, 'Spices'),
(565, 'Garam Masala', 7, 3.99, 'Spices'),
(566, 'Black Pepper', 7, 6.99, 'Spices'),
(567, 'Cardamom Pods', 7, 8.99, 'Spices'),
(568, 'Mustard Seeds', 7, 2.49, 'Spices'),
(569, 'Fenugreek Seeds', 7, 3.49, 'Spices'),
(570, 'Curry Powder', 7, 4.99, 'Spices'),
(571, 'Paprika Powder', 7, 3.99, 'Spices'),
(572, 'Cloves', 7, 7.99, 'Spices'),
(573, 'Nutmeg Powder', 7, 6.49, 'Spices'),
(574, 'Fennel Seeds', 7, 2.99, 'Spices'),
(575, 'Dried Basil', 7, 4.49, 'Spices'),
(576, 'Dried Thyme', 7, 3.99, 'Spices'),
(577, 'Dill Weed', 7, 5.49, 'Spices'),
(578, 'Curry Leaves', 7, 2.99, 'Spices'),
(579, 'Saffron Threads', 7, 9.99, 'Spices'),
(580, 'Sports Shoes', 3, 49.99, 'Sports and Fitness'),
(581, 'Yoga Mat', 6, 19.99, 'Sports and Fitness'),
(582, 'Dumbbell Set', 18, 79.99, 'Sports and Fitness'),
(583, 'Jump Rope', 6, 9.99, 'Sports and Fitness'),
(584, 'Exercise Ball', 6, 24.99, 'Sports and Fitness'),
(585, 'Resistance Bands', 6, 14.99, 'Sports and Fitness'),
(586, 'Running Shorts', 3, 29.99, 'Sports and Fitness'),
(587, 'Weightlifting Gloves', 3, 14.99, 'Sports and Fitness'),
(588, 'Fitness Tracker', 6, 79.99, 'Sports and Fitness'),
(589, 'Water Bottle', 16, 9.99, 'Sports and Fitness'),
(590, 'Tennis Racket', 3, 89.99, 'Sports and Fitness'),
(591, 'Swimming Goggles', 3, 12.99, 'Sports and Fitness'),
(592, 'Yoga Block', 6, 8.99, 'Sports and Fitness'),
(593, 'Cycling Helmet', 3, 39.99, 'Sports and Fitness'),
(594, 'Gym Bag', 6, 29.99, 'Sports and Fitness'),
(595, 'Weight Plates', 18, 19.99, 'Sports and Fitness'),
(596, 'Fitness Apparel', 3, 34.99, 'Sports and Fitness'),
(597, 'Exercise Bike', 6, 249.99, 'Sports and Fitness'),
(598, 'Sports Watch', 6, 99.99, 'Sports and Fitness'),
(599, 'Fitness DVDs', 3, 19.99, 'Sports and Fitness'),
(600, 'Chocolate Bar', 10, 2.99, 'Sweets'),
(601, 'Gummy Bears', 3, 1.49, 'Sweets'),
(602, 'Cotton Candy', 4, 0.99, 'Sweets'),
(603, 'Caramel Popcorn', 12, 3.99, 'Sweets'),
(604, 'Jelly Beans', 3, 1.99, 'Sweets'),
(605, 'Marshmallow Treats', 6, 2.49, 'Sweets'),
(606, 'Assorted Chocolates', 10, 4.99, 'Sweets'),
(607, 'Licorice Twists', 4, 1.29, 'Sweets'),
(608, 'Fruit Gummies', 3, 1.99, 'Sweets'),
(609, 'Peanut Brittle', 7, 2.99, 'Sweets'),
(610, 'Sugar Cookies', 12, 2.49, 'Sweets'),
(611, 'Cupcakes', 12, 3.49, 'Sweets'),
(612, 'Chocolate Chip Cookies', 12, 2.99, 'Sweets'),
(613, 'Rock Candy', 4, 1.99, 'Sweets'),
(614, 'Caramel Apples', 6, 3.99, 'Sweets'),
(615, 'Fudge Brownies', 12, 2.99, 'Sweets'),
(616, 'Mint Chocolate Chip Ice Cream', 2, 5.99, 'Sweets'),
(617, 'Cherry Lollipops', 3, 0.99, 'Sweets'),
(618, 'Toffee', 7, 2.49, 'Sweets'),
(619, 'Chocolate Covered Strawberries', 6, 4.99, 'Sweets'),
(620, 'Hammer', 3, 15.99, 'Tools and Hardware'),
(621, 'Screwdriver Set', 18, 29.99, 'Tools and Hardware'),
(622, 'Drill Machine', 6, 89.99, 'Tools and Hardware'),
(623, 'Wrench Set', 3, 24.99, 'Tools and Hardware'),
(624, 'Pliers', 3, 12.99, 'Tools and Hardware'),
(625, 'Measuring Tape', 3, 9.99, 'Tools and Hardware'),
(626, 'Saw', 3, 19.99, 'Tools and Hardware'),
(627, 'Paint Brushes', 3, 8.99, 'Tools and Hardware'),
(628, 'Nails Assortment', 12, 7.99, 'Tools and Hardware'),
(629, 'Sanding Paper', 3, 5.99, 'Tools and Hardware'),
(630, 'Toolbox', 6, 34.99, 'Tools and Hardware'),
(631, 'Glue Gun', 6, 14.99, 'Tools and Hardware'),
(632, 'Hacksaw', 3, 11.99, 'Tools and Hardware'),
(633, 'Level', 3, 9.99, 'Tools and Hardware'),
(634, 'Cordless Drill', 6, 79.99, 'Tools and Hardware'),
(635, 'Screw Assortment', 12, 6.99, 'Tools and Hardware'),
(636, 'Carpenters Square', 3, 7.99, 'Tools and Hardware'),
(637, 'Caulking Gun', 6, 9.99, 'Tools and Hardware'),
(638, 'Sander', 6, 39.99, 'Tools and Hardware'),
(639, 'Screwdriver', 3, 4.99, 'Tools and Hardware');

-- --------------------------------------------------------

--
-- Table structure for table `uom`
--

CREATE TABLE `uom` (
  `uom_id` int(11) NOT NULL,
  `uom_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `uom`
--

INSERT INTO `uom` (`uom_id`, `uom_name`) VALUES
(1, 'KG'),
(2, 'Liter'),
(3, 'Piece'),
(4, 'Packet'),
(5, 'Pound'),
(6, 'Each'),
(7, 'Gram'),
(8, 'Ounce'),
(9, 'Milliliter'),
(10, 'Bar'),
(11, 'Grams'),
(12, 'Box'),
(13, 'Quart'),
(14, 'Gallon'),
(15, 'Pair'),
(16, 'Bottle'),
(17, 'Can'),
(18, 'Set');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `uom_id` (`uom_id`);

--
-- Indexes for table `uom`
--
ALTER TABLE `uom`
  ADD PRIMARY KEY (`uom_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`);

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`uom_id`) REFERENCES `uom` (`uom_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
