-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 11, 2024 at 06:36 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `food_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `password`) VALUES
(1, 'admin', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2'),
(3, 'Ayush', '45c001b4d509ee9926c584389fbe762cff0aaf14');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `pid` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(10) NOT NULL,
  `quantity` int(10) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `pid`, `name`, `price`, `quantity`, `image`) VALUES
(16, 7, 2, 'Pasta', 199, 2, 'pasta.jpeg'),
(18, 7, 49, 'Vada Sambhar (2pc)', 30, 1, 'Vadha sambhar.jpeg'),
(19, 7, 3, 'Hot Coffee', 49, 1, 'coffee.jpeg'),
(20, 7, 38, 'Brownie With Icecream', 79, 1, 'Brownie with Icecream.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `number` varchar(12) NOT NULL,
  `message` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `user_id`, `name`, `email`, `number`, `message`) VALUES
(2, 11, 'Dhruvi jain', 'Dhruvi22jain@gmail.com', '7415557442', 'Hi, Good evening your canteen food is very tasty and all food things are available in your canteen.');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(100) NOT NULL,
  `payment_id` varchar(100) NOT NULL,
  `token` varchar(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `number` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `method` varchar(50) NOT NULL,
  `address` varchar(500) NOT NULL,
  `total_products` varchar(1000) NOT NULL,
  `total_price` int(100) NOT NULL,
  `placed_on` date NOT NULL DEFAULT current_timestamp(),
  `payment_status` varchar(20) NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `payment_id`, `token`, `user_id`, `name`, `number`, `email`, `method`, `address`, `total_products`, `total_price`, `placed_on`, `payment_status`) VALUES
(25, '', '', 12, 'pay_NxAWSIhpvzY9mw', '6307312237', 'kuldeepsinghrajpoot40@gmail.com', 'Razorpay', 'CSE, CSE, CSe, CSE, CSE, CSE, 4987961289 - 471201', 'Pizzas  (200 x 1) - Pasta (199 x 1) - ', 399, '2024-04-11', 'pending'),
(26, 'pay_NxAcnWp9RS2x9k', '', 12, 'Kuldeep Singh Rajpoo', '6307312237', 'kuldeepsinghrajpoot40@gmail.com', 'Razorpay', 'CSE, CSE, CSe, CSE, CSE, CSE, 4987961289 - 471201', 'Pizzas  (200 x 1) - ', 200, '2024-04-11', 'pending'),
(27, 'pay_NxAi4i7fwDyJrF', '', 12, 'Kuldeep Singh Rajpoo', '6307312237', 'kuldeepsinghrajpoot40@gmail.com', 'Razorpay', 'CSE, CSE, CSe, CSE, CSE, CSE, 4987961289 - 471201', 'Pasta (199 x 1) - Hot Coffee (49 x 1) - ', 248, '2024-04-11', 'pending'),
(28, 'pay_NxArIvCp6bDYdF', '', 12, 'Kuldeep Singh Rajpoo', '6307312237', 'kuldeepsinghrajpoot40@gmail.com', 'Razorpay', 'CSE, CSE, CSe, CSE, CSE, CSE, 4987961289 - 471201', ' Special Thali (149 x 1) - Veg Pizza (109 x 1) - ', 258, '2024-04-11', 'pending'),
(29, 'cash on delivery', '', 12, 'Kuldeep Singh Rajpoo', '6307312237', 'kuldeepsinghrajpoot40@gmail.com', 'cash on delivery', 'CSE, CSE, CSe, CSE, CSE, CSE, 4987961289 - 471201', 'Onion Pizza (49 x 1) - ', 49, '2024-04-11', 'pending'),
(30, 'pay_NxB6eW8OL8KVmy', '', 12, 'Kuldeep Singh Rajpoo', '6307312237', 'kuldeepsinghrajpoot40@gmail.com', 'Razorpay', 'CSE, CSE, CSe, CSE, CSE, CSE, 4987961289 - 471201', 'Paneer n Onion Pizza (59 x 1) - ', 59, '2024-04-11', 'pending'),
(31, 'cash on delivery', '', 12, 'Kuldeep Singh Rajpoo', '6307312237', 'kuldeepsinghrajpoot40@gmail.com', 'cash on delivery', 'CSE, CSE, CSe, CSE, CSE, CSE, 4987961289 - 471201', 'Pasta (199 x 1) - ', 199, '2024-04-11', 'pending'),
(32, 'pay_NxBARmxoTPlJAj', '', 12, 'Kuldeep Singh Rajpoo', '6307312237', 'kuldeepsinghrajpoot40@gmail.com', 'Razorpay', 'CSE, CSE, CSe, CSE, CSE, CSE, 4987961289 - 471201', 'Hot Coffee (49 x 1) - ', 49, '2024-04-11', 'pending'),
(33, 'pay_NxBStvaP69w7IZ', '1867093805', 12, 'Kuldeep Singh Rajpoo', '6307312237', 'kuldeepsinghrajpoot40@gmail.com', 'Razorpay', 'CSE, CSE, CSe, CSE, CSE, CSE, 4987961289 - 471201', 'Hot Coffee (49 x 1) - ', 49, '2024-04-11', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `category` varchar(100) NOT NULL,
  `price` int(10) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `category`, `price`, `image`) VALUES
(1, 'Pizzas ', 'fast food', 200, 'pizza.jpg'),
(2, 'Pasta', 'fast food', 199, 'pasta.jpeg'),
(3, 'Hot Coffee', 'drinks', 49, 'coffee.jpeg'),
(4, ' Special Thali', 'main dish', 149, 'Combo Thali.jpeg'),
(5, 'Rasgulla', 'desserts', 30, 'Rasgula.jpg'),
(6, 'Ice Cream', 'desserts', 49, 'ice cream.jpg'),
(7, 'double cheese pizza', 'fast food', 239, 'Double cheese.jpg'),
(8, 'Veg Pizza', 'fast food', 109, 'veg pizza.jpeg'),
(9, 'Margherita Pizza ', 'fast food', 149, 'Margherita Pizza.jpeg'),
(10, 'Cheese n Corn Pizza', 'fast food', 169, 'Cheese n corn Pizza.jpeg'),
(11, 'Paneer Makhani Pizza', 'fast food', 209, 'Paneer Makhani Pizza.jpeg'),
(12, 'Farmhouse Pizza', 'fast food', 179, 'Farmhouse Pizza.jpeg'),
(13, 'Double Cheese Margherita Pizza', 'fast food', 239, 'Double cheese margherita pizza.jpeg'),
(14, 'Classic Veg Burger Pizza', 'fast food', 69, 'Classic veg burger pizza.jpeg'),
(15, 'Cheese n Corn Paratha Pizza', 'fast food', 119, 'Cheese n Corn Paratha Pizza.jpeg'),
(16, 'Paneer n Onion Pizza', 'fast food', 59, 'Paneer n onion pizza.jpeg'),
(17, 'Onion Pizza', 'fast food', 49, 'Onion Pizza.jpeg'),
(18, 'Veg  Aloo Tikki Burger', 'fast food', 70, 'Veg aloo tikki burger.jpeg'),
(19, 'Crunchy Veg Burger', 'fast food', 120, 'Crunchy Veg Burger.jpeg'),
(20, 'Cheese Burger', 'fast food', 79, 'Cheese burger.jpeg'),
(21, 'Veg Burger n French Fries Combo', 'fast food', 149, 'Veg burger n Fries combo.jpeg'),
(22, 'French Fries', 'fast food', 50, 'French Fries.jpeg'),
(23, 'Veg Cheese Grilled Sandwich', 'fast food', 59, 'Veg cheese grilled Sandwich.jpeg'),
(24, 'Cheese Sandwich', 'fast food', 39, 'Cheese Sandwich.jpeg'),
(25, 'Cheese Chutney Sandwich', 'fast food', 69, 'Chees Chutney Sandwich.jpeg'),
(26, 'Veg Fry Momos', 'fast food', 50, 'Veg Fry Momos.jpeg'),
(27, 'Veg Steam Momos', 'fast food', 40, 'Veg steam momos.jpeg'),
(28, 'Mazza (Mango Juice) 1L', 'drinks', 65, 'Mazza 1l.jpeg'),
(29, 'Mazza (Mango Juice)', 'drinks', 10, 'Mazza 10rs.jpeg'),
(30, 'Sprite - 120ml', 'drinks', 12, 'Sprite glass.jpeg'),
(31, 'Sprite - 1.2 litre', 'drinks', 45, 'Sprite 1l.jpeg'),
(32, 'Sting Cold drink', 'drinks', 20, 'Sting 20rs.jpeg'),
(33, 'Sting', 'drinks', 50, 'Sting can.jpeg'),
(34, 'Lichi Cold drink', 'drinks', 10, 'Lichi colddrink.jpeg'),
(35, 'Tea', 'drinks', 10, 'Tea.jpeg'),
(36, 'Cold Coffee', 'drinks', 79, 'Cold cofferee.jpeg'),
(37, 'Brownie', 'desserts', 49, 'Brownie.jpeg'),
(38, 'Brownie With Icecream', 'desserts', 79, 'Brownie with Icecream.jpeg'),
(39, 'Choclate Cone Icecream', 'desserts', 40, 'Chocolate cone icecream.jpeg'),
(40, 'Chocobar Icecream', 'desserts', 10, 'CHOCOBAR.jpeg'),
(41, 'Cassata Icecream', 'desserts', 80, 'Cassata.jpeg'),
(42, 'Rasmalai (1pc)', 'desserts', 30, 'Rasmalai.jpeg'),
(43, 'Matar Paneer', 'main dish', 120, 'Matar paneer.jpeg'),
(44, 'Shahi Paneer', 'main dish', 140, 'Shahi paneer.jpeg'),
(45, 'Chole Rice', 'main dish', 50, 'Chole chawal.jpeg'),
(46, 'Rice With Dal', 'main dish', 40, 'Dal chawal.jpeg'),
(47, 'Aloo Paratha (1pc)', 'main dish', 20, 'Aloo paratha.jpeg'),
(48, 'Special Combo Thali ', 'main dish', 150, 'Special Combo thali.jpeg'),
(49, 'Vada Sambhar (2pc)', 'main dish', 30, 'Vadha sambhar.jpeg'),
(50, 'Idli Sambhar (2pc)', 'main dish', 30, 'Idli sambhar.jpeg'),
(51, 'Chole Bhature (2pc)', 'main dish', 50, 'Chole bhatore.jpeg'),
(52, 'Dal Tadhka', 'main dish', 80, 'DAL TADHKA.jpeg'),
(53, 'Chapathi (1pc)', 'main dish', 5, 'Chhapati.jpeg'),
(54, 'Tandoori Chapathi (1pc)', 'main dish', 8, 'Tandoori chapathi.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `number` varchar(10) NOT NULL,
  `password` varchar(50) NOT NULL,
  `address` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `number`, `password`, `address`) VALUES
(1, 'Ayush gupta', 'ayushguptajan22@gmail.com', '7415557442', '7c222fb2927d828af22f592134e8932480637c0d', 'Btech, CSE, V, Medicaps, EN21CS3L1014, C, 7415557442 - 471111'),
(8, 'Devansh', 'devansh123@gmail.com', '9522173915', '7c222fb2927d828af22f592134e8932480637c0d', ''),
(9, 'Yash Jain', 'jainyash12@gmail.com', '7413337592', '7c222fb2927d828af22f592134e8932480637c0d', ''),
(10, 'Harshita Gupta', 'harshitag321@gmail.com', '8269547132', '7c222fb2927d828af22f592134e8932480637c0d', ''),
(11, 'Dhruvi Jain', 'Dhruvi22jain@gmail.com', '7412562788', '7c222fb2927d828af22f592134e8932480637c0d', ''),
(12, 'Kuldeep Singh Rajpoo', 'kuldeepsinghrajpoot40@gmail.com', '6307312237', 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'CSE, CSE, CSe, CSE, CSE, CSE, 4987961289 - 471201');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
