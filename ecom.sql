-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 22, 2024 at 05:58 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecom`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `password`) VALUES
(1, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `categories` varchar(30) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `categories`, `status`) VALUES
(9, 'FRUITE', 1),
(10, 'VEGETABLE', 1),
(11, 'CEREAL', 1),
(12, 'OTHER', 1);

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(75) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `comment` text NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `address` varchar(250) NOT NULL,
  `city` varchar(50) NOT NULL,
  `pincode` int(10) NOT NULL,
  `payment_type` varchar(20) NOT NULL,
  `total_price` float(10,3) NOT NULL,
  `payment_status` varchar(15) NOT NULL,
  `order_status` int(15) NOT NULL,
  `txnid` varchar(20) NOT NULL,
  `mihpayid` varchar(20) NOT NULL,
  `payu_status` varchar(10) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `user_id`, `address`, `city`, `pincode`, `payment_type`, `total_price`, `payment_status`, `order_status`, `txnid`, `mihpayid`, `payu_status`, `added_on`) VALUES
(49, 48, 'Valukad', 'Bhavnagar', 364060, 'COD', 120.000, 'pending', 1, 'e1fbdb04e3ce2698a0d6', '', '', '2024-04-22 05:34:10');

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`id`, `order_id`, `product_id`, `qty`, `price`) VALUES
(59, 49, 39, 1, 120);

-- --------------------------------------------------------

--
-- Table structure for table `order_status`
--

CREATE TABLE `order_status` (
  `id` int(11) NOT NULL,
  `name` varchar(15) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `order_status`
--

INSERT INTO `order_status` (`id`, `name`) VALUES
(1, 'Pending'),
(2, 'Processing'),
(3, 'Shipped'),
(4, 'Canceled'),
(5, 'Complete');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `categories_id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL,
  `mrp` float NOT NULL,
  `price` int(8) NOT NULL,
  `qty` int(11) NOT NULL,
  `image` varchar(50) NOT NULL,
  `short_desc` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `categories_id`, `name`, `mrp`, `price`, `qty`, `image`, `short_desc`, `description`, `status`) VALUES
(39, 9, 'Apple', 0, 120, 10, '760536714_baner-1.png', 'Crisp and sweet-tart, apples are versatile fruits rich in vitamins and perfect for snacking or cooking.', 'Apples are crisp, sweet-tart fruits that come in a variety of colors and flavors. Packed with vitamins and antioxidants, they are perfect for snacking, cooking, and juicing.', 1),
(40, 9, 'Banana', 0, 90, 8, '134752747_8nbau7mf.png', 'Creamy and sweet, bananas are nutrient-rich fruits perfect for on-the-go snacking.', 'Bananas are elongated, curved fruits with a creamy texture and sweet flavor. They are rich in potassium, fiber, and vitamins, making them a nutritious and convenient snack option.', 1),
(41, 9, 'Orange', 0, 80, 12, '317802153_pro2.png', 'Tangy and juicy, oranges are vitamin-rich citrus fruits bursting with flavor.\r\nStrawberry', 'Oranges are round citrus fruits with a bright orange rind and juicy, tangy flesh. They are packed with vitamin C and other antioxidants, making them a refreshing and healthy choice.', 1),
(42, 9, 'Strawberry', 0, 130, 5, '509199304_rwgkvohp.png', 'Sweet and juicy, strawberries are vibrant red berries packed with vitamin C and perfect for desserts or snacking.', 'Strawberries are small, red berries with a sweet flavor and juicy texture. They are high in vitamin C and antioxidants, making them a delicious and nutritious addition to desserts, salads, and smoothies', 1),
(43, 9, 'Grapes', 0, 70, 9, '151321648_1oonyb6l.png', 'Sweet and juicy, grapes are bite-sized fruits available in a variety of colors and perfect for snacking.', 'Grapes are small, round fruits with a sweet and slightly tart flavor. They come in various colors, including green, red, and purple, and are rich in vitamins, minerals, and antioxidants.', 1),
(44, 9, 'Pineapple', 0, 130, 6, '792992921_cj40n5qx.png', 'Sweet and tropical, pineapples are juicy fruits packed with vitamin C and perfect for adding a burst of flavor to dishes.', 'Pineapples are tropical fruits with a tough, spiky exterior and sweet, juicy flesh. They are rich in vitamin C, manganese, and bromelain, an enzyme with anti-inflammatory properties.', 1),
(45, 9, 'Mango', 0, 100, 50, '588688643_200e8ook.png', 'Sweet and juicy, mangoes are tropical fruits with a unique flavor and packed with vitamins and antioxidants.', 'Mangoes are tropical fruits with a sweet, juicy flesh and a unique flavor that is both sweet and tangy. They are rich in vitamins A and C, as well as antioxidants, making them a delicious and nutritious snack.', 1),
(46, 9, 'Kiwi', 0, 110, 4, '620037248_opby4don.png', 'Tangy and sweet, kiwis are small fruits with fuzzy brown skin and vibrant green flesh perfect for snacking or adding to fruit salads.', 'Kiwis are small, oval fruits with a brown, fuzzy skin and vibrant green flesh speckled with tiny black seeds. They have a tangy-sweet flavor and are rich in vitamin C, vitamin K, and fiber.', 1),
(47, 9, 'Watermelon', 0, 50, 25, '232420676_pro5.png', 'Watermelon is not only delicious but also packed with nutrients.', 'Watermelon, a juicy and refreshing fruit, is widely enjoyed in India. Known for its vibrant red flesh and sweet taste, watermelon is a popular choice during the hot summer months.', 1),
(48, 9, 'Coconut', 0, 35, 20, '458632141_5o0ck3ag.png', 'Coconut is grown along the coastal regions of India, particularly in the southern states.', 'Coconut is a large, round fruit with a thick, brown husk and a white, meaty interior. It is a versatile ingredient used in cooking, baking, and as a source of oil.', 1),
(49, 9, 'Papaya', 0, 60, 15, '667502477_cisxu0xt.png', 'Papayas are widely available in India and are a popular fruit to eat fresh or use in juices and smoothies.', 'Papayas are a large, oval-shaped fruit that is native to Central America. They are a good source of vitamin C, vitamin A, and fiber.', 1),
(50, 10, 'Carrot', 0, 35, 9, '482261218_85cu816n.png', 'Crunchy and sweet, carrots are vibrant root vegetables packed with nutrients and perfect for snacking or cooking.', 'Carrots are root vegetables with a crunchy texture and sweet, earthy flavor. They come in various colors, including orange, purple, yellow, and white, and are rich in beta-carotene, vitamins, and minerals.', 1),
(51, 10, 'Broccoli', 0, 25, 8, '678944558_pro4.png', 'Firm and green, broccoli is a nutrient-rich vegetable with a slightly bitter flavor and perfect for steaming or stir-frying.', 'Broccoli is a green, flowering vegetable with a firm stalk and tightly clustered florets. It has a slightly bitter flavor and is rich in vitamins C, K, and A, as well as fiber and antioxidants.', 1),
(52, 10, 'Tomato', 0, 30, 10, '591687585_dmy8xewr.png', 'Juicy and sweet-tart, tomatoes are versatile fruits used in a variety of dishes, from salads to sauces.', 'Tomatoes are red, round fruits often mistaken for vegetables due to their culinary uses. They have a juicy texture and sweet-tart flavor and are rich in vitamins C and K, as well as lycopene, an antioxidant.', 1),
(53, 10, 'Spinach', 0, 20, 6, '271871788_instagram-img-01.jpg', 'Tender and mild, spinach is a nutrient-rich leafy green perfect for salads, smoothies, and sautés.', 'Spinach is a leafy green vegetable with tender, dark green leaves and a mild, slightly earthy flavor. It is packed with vitamins A, C, and K, as well as iron, calcium, and antioxidants.', 1),
(54, 10, 'Cucumber', 0, 35, 10, '578127408_4hrd2nim.png', 'Refreshing and crunchy, cucumbers are hydrating vegetables perfect for snacking or adding to salads and sandwiches.', 'Cucumbers are long, cylindrical vegetables with a refreshing, crunchy texture and mild, watery flavor. They are high in water content and low in calories, making them a hydrating and nutritious snack.', 1),
(55, 10, 'Potato', 0, 50, 13, '785609935_pro7.png', 'Versatile and starchy, potatoes come in various colors and are perfect for mashing, roasting, frying, or baking.', 'Potatoes are starchy tuber vegetables with a versatile flavor and texture. They come in various colors, including white, yellow, red, and purple, and are rich in carbohydrates, vitamins, and minerals.', 1),
(56, 10, 'Zucchini', 0, 35, 7, '738139917_gallery-img-01.jpg', 'Tender and mild, zucchini is a versatile summer squash perfect for grilling, sautéing, or adding to salads and pasta dishes.', 'Zucchini is a summer squash with a tender texture and mild, slightly sweet flavor. It can be eaten raw or cooked and is low in calories and high in fiber, vitamins, and minerals.', 1),
(57, 10, 'Green Bean', 0, 35, 5, '784589977_2qhlpn9k.png', 'Crisp and mildly sweet, green beans are versatile vegetables perfect for steaming, sautéing, or stir-frying.', 'Green beans, also known as string beans or snap beans, are long, slender vegetables with a crisp texture and mild, slightly sweet flavor. They are rich in vitamins C, K, and A, as well as fiber and antioxidants.', 1),
(58, 10, 'Onion', 0, 25, 100, '277474853_pro3.png', 'Pungent and tangy, onions add flavor and aroma to savory dishes and come in various colors, including white, yellow, and red.', 'Onions are bulb vegetables with a pungent aroma and a sharp, tangy flavor. They come in various colors, including white, yellow, and red, and are used as a base ingredient in many savory dishes.', 1),
(59, 10, 'Bell Pepper', 0, 30, 15, '930665753_t6z2y2mf.png', 'Crisp and sweet, bell peppers come in vibrant colors and are perfect for adding flavor and crunch to salads, stir-fries, and sandwiches.', 'Bell peppers are large, bell-shaped vegetables with a crisp texture and sweet flavor. They come in various colors, including red, yellow, orange, and green, and are rich in vitamins A and C.', 1),
(60, 11, 'Wheat', 0, 50, 40, '214518233_npsudb6w.png', 'Wheat is a versatile cereal grain used to make flour for bread and other baked goods, available in various varieties.', 'Wheat is a cereal grain widely cultivated for its edible seeds, which are used to make flour for bread, pasta, and other baked goods. It is one of the most important staple crops worldwide and comes in various varieties, including hard red, hard white, soft red, and soft white.', 1),
(61, 11, 'Rice', 0, 35, 20, '886328612_s98hl83u.png', 'Rice is a versatile cereal grain available in various types and used as a staple food in many cuisines worldwide.', 'Rice is a staple cereal grain consumed by billions of people worldwide. It comes in various types, including long-grain, medium-grain, and short-grain, each with its own texture and flavor profile. Rice is used as a primary ingredient in dishes such as stir-fries, sushi, and risotto.', 1),
(62, 11, 'Corn (Maize)', 0, 40, 25, '819259919_pro1.png', 'Corn, or maize, is a cereal grain with large kernels used in various forms, including fresh and processed into products like cornmeal and popcorn.', 'Corn, also known as maize, is a cereal grain with large kernels arranged in rows on a cob. It is used in various forms, including fresh, dried, and processed into products such as cornmeal, corn flour, and corn syrup. Corn is a staple food in many cultures and is used in dishes such as tortillas, polenta, and popcorn.', 1),
(63, 11, 'Millet', 0, 100, 4, '468351319_16maiyrl.png', 'Millet is a small cereal grain with a mild, nutty flavor and fluffy texture when cooked, gluten-free and suitable for various dishes.', 'Millet is a small, round cereal grain with a mild, nutty flavor and a soft, fluffy texture when cooked. It is used as a staple food in many cultures and is gluten-free, making it suitable for people with gluten intolerance or celiac disease.', 1),
(64, 11, 'Sorghum', 0, 100, 30, '375161830_kv8ad2ju.png', 'Sorghum is a cereal grain with a chewy texture and sweet flavor used as a staple food and to make sorghum syrup.', 'Sorghum is a cereal grain with a chewy texture and mild, slightly sweet flavor. It is used as a staple food in many parts of the world and is also used to make sorghum syrup, a sweetener similar to molasses.\r\nShort Description: Sorghum is a cereal grain with a chewy texture and sweet flavor used as a staple food and to make sorghum syrup.\r\nQuinoa:\r\nDescription: Quinoa is a pseudo-cereal grain known for its nutritional benefits and versatility. It is gluten-free, high in protein, fiber, vitamins, and minerals, and is used in various dishes such as salads, soups, and pilafs.\r\nShort Description: Quinoa is a pseudo-cereal grain rich in protein and fiber, gluten-free and versatile, used in salads, soups, and pilafs.\r\nBuckwheat:\r\nDescription: Buckwheat is a pseudo-cereal grain with a nutty flavor and chewy texture. It is gluten-free and used to make buckwheat flour, which is used in pancakes, noodles, and baked goods.\r\nShort Description: Buckwheat is a pseudo-cereal grain with a nutty flavor used to make flour for pancakes, noodles, and baked goods, gluten-free and versatile.', 1),
(65, 12, 'Cotton', 0, 60, 40, '769588739_rrynru4f.png', 'Cotton is a soft, fluffy staple fiber that grows in a boll, or protective case, around the seeds of the cotton plants. It is one of the most widely used natural fibers in the world, prized for its breathability, comfort, and versatility.', 'Cotton is a natural fiber harvested from the cotton plant\'s seed pod, or boll. It\'s renowned for its softness, breathability, and versatility, making it a staple material in clothing, bedding, and various other textile products. Cotton fibers are composed mostly of cellulose, a complex carbohydrate, which gives them their characteristic strength and durability while still maintaining a soft hand feel.', 1),
(66, 12, 'Honey', 0, 300, 3, '594398264_19vjm42n.png', 'Honey is a natural sweetener produced by honeybees, available in various flavors and used in foods, beverages, and as a remedy for various ailments.', 'Honey is a natural sweetener produced by honeybees from the nectar of flowers. It comes in various colors and flavors depending on the source of the nectar. Honey is used as a sweetener in foods and beverages and has medicinal properties.', 1),
(67, 12, 'Milk', 0, 35, 5, '819780700_vgwmhwc3.png', 'Milk is a nutrient-rich liquid produced by mammals, consumed as a beverage or used to make dairy products like cheese and yogurt.', 'Milk is a nutrient-rich liquid produced by mammals to feed their young. It is rich in calcium, protein, vitamins, and minerals and is consumed by humans as a beverage or used to make dairy products such as cheese, yogurt, and butter.', 1),
(68, 12, 'Cheese', 0, 150, 4, '455637614_evtct1ko.png', 'Cheese is a dairy product made from curdled milk, available in various textures and flavors, used as a topping, ingredient, or snack.', 'Cheese is a dairy product made from curdled milk and fermented with bacteria or enzymes. It comes in various textures and flavors, ranging from soft and creamy to hard and sharp. Cheese is used as a topping, ingredient, or snack and is rich in protein, calcium, and fat.', 1),
(69, 12, 'Butter', 0, 100, 2, '843594844_cr6y05nk.png', 'Butter is a dairy product made by churning cream, used as a spread, cooking fat, or ingredient in baking.', 'Butter is a dairy product made by churning cream until it separates into butterfat and buttermilk. It has a rich, creamy texture and is used as a spread, cooking fat, or ingredient in baking. Butter is high in saturated fat and calories.', 1),
(70, 12, 'Tea', 0, 180, 6, '697296752_cx9gtn7k.png', 'Tea is a brewed beverage made from Camellia sinensis leaves, available in various types and consumed hot or cold.', 'Tea is a brewed beverage made from the leaves of the Camellia sinensis plant. It comes in various types, including black, green, white, oolong, and herbal, each with its own flavor profile and health benefits. Tea is consumed worldwide as a hot or cold beverage.', 1),
(71, 12, 'Coffee', 0, 200, 2, '648820100_m7wlm66s.png', 'Coffee is a brewed beverage made from roasted coffee beans, rich in flavor and caffeine, consumed as a morning pick-me-up or social beverage.', 'Coffee is a brewed beverage made from roasted coffee beans, the seeds of the Coffea plant. It has a rich, bold flavor and contains caffeine, a stimulant that provides an energy boost. Coffee is consumed worldwide as a morning pick-me-up or social beverage.', 1),
(72, 10, 'Pea', 0, 20, 5, '475455190_9fa1w4ph.png', 'The pea is a small, spherical seed or the edible pod of various leguminous plants. It is valued for its nutritional content, including protein, fiber, and vitamins, and is a versatile ingredient in cooking.', 'The pea is a member of the legume family, commonly known for its small, round seeds encased in pods. These pods typically contain several peas each, though there are also varieties of peas known as snap peas or snow peas, where the entire pod is edible. Peas are cultivated worldwide and come in various colors, including green, yellow, and purple.', 1),
(73, 11, 'Pearl Millet', 0, 60, 40, '906812424_nydbs2js.png', 'Pearl millet is a drought-tolerant cereal crop known for its resilience in arid and semi-arid regions. It is a staple food in many parts of Africa and Asia, valued for its nutritional content and ability to thrive in harsh growing conditions.', 'Pearl millet, scientifically known as Pennisetum glaucum, is an ancient cereal grain cultivated primarily in the semi-arid and arid regions of Africa and Asia. It belongs to the Poaceae family and is characterized by its tall stature, deep root system, and drought-resistant nature. Pearl millet is widely recognized for its ability to grow in harsh environmental conditions, including low rainfall, high temperatures, and poor soil fertility.', 1),
(74, 9, 'pomegranate', 0, 80, 6, '300637081_845olzce.png', 'The pomegranate is a fruit-bearing deciduous shrub or small tree known for its distinctive ruby-red seeds encased in a juicy, tart pulp. It is revered for its rich antioxidant content and sweet-tart flavor.', 'The pomegranate, scientifically known as Punica granatum, is a fruit-bearing deciduous shrub or small tree native to the Middle East and Mediterranean region. It belongs to the Lythraceae family and is cultivated for its nutrient-rich, jewel-like seeds and tart, juicy pulp.', 1);

-- --------------------------------------------------------

--
-- Table structure for table `subscribe`
--

CREATE TABLE `subscribe` (
  `id` int(11) NOT NULL,
  `email` varchar(75) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `password` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `password`, `email`, `mobile`, `added_on`) VALUES
(48, 'khodifad kuldip', 'project', 'khodifadkuldip87@gmail.com', '9313463107', '2024-04-22 05:33:26');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_status`
--
ALTER TABLE `order_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribe`
--
ALTER TABLE `subscribe`
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
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `order_status`
--
ALTER TABLE `order_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `subscribe`
--
ALTER TABLE `subscribe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
