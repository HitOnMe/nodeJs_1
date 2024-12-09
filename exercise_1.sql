-- EXERCISE 1
DROP DATABASE IF EXISTS exercise1;
CREATE DATABASE exercise1;
USE exercise1;
CREATE table `user`(
	user_id int primary key auto_increment,
	full_name varchar(255),
	email varchar(255),
	`password` varchar(255)
	);
CREATE table restaurant (
	res_id int primary key auto_increment,
	res_name varchar(255),
	image varchar(255),
	`desc` varchar(255)
	);
CREATE table food_type(
	type_id int primary key auto_increment,
	type_name varchar(255)
);
CREATE table food(
	type_id int ,
	food_id int primary key auto_increment,
	food_name varchar(255),
	image varchar(255),
	price float,
	`desc` varchar(255),
	CONSTRAINT fk_food foreign key(type_id) references food_type(type_id)
	);

CREATE table sub_food(
	food_id int,
	sub_id int primary key auto_increment,
	sub_name varchar(255),
	sub_price float,
	CONSTRAINT fk_sub foreign key(food_id) references food(food_id)
	);
CREATE table rate_res(
	user_id int,
	res_id int,
	amount int,
	date_rate datetime,
	CONSTRAINT fk_userRate foreign key(user_id) references `user`(user_id),
	CONSTRAINT fk_resRate foreign key(res_id) references restaurant(res_id)
	);
CREATE table `order`(
	user_id int,
	food_id int,
	amount int,
	code varchar(255),
	arr_sub_id varchar(255),
	CONSTRAINT fk_userOrder foreign key(user_id) references `user`(user_id),
	CONSTRAINT fk_foodOrder foreign key(food_id) references food(food_id)
);
CREATE table like_res(
	user_id int,
	res_id int,
	date_like datetime,
	CONSTRAINT fk_user foreign key(user_id) references user(user_id),
	CONSTRAINT fk_res foreign key(res_id) references restaurant(res_id)
);
-- Thêm dữ liệu vào bảng user
INSERT INTO `user`(full_name, email, `password`) VALUES 
('Nguyen Van A', 'a@gmail.com', '1234'),
('Nguyen Van B', 'b@gmail.com', '1234'),
('Nguyen Van C', 'c@gmail.com', '1234'),
('Nguyen Van D', 'd@gmail.com', '1234'),
('Nguyen Van E', 'e@gmail.com', '5678'),
('Nguyen Van F', 'f@gmail.com', '5678'),
('Nguyen Van G', 'g@gmail.com', '5678'),
('Nguyen Van H', 'h@gmail.com', '5678'),
('Nguyen Van I', 'i@gmail.com', '5678'),
('Nguyen Van J', 'j@gmail.com', '5678');
-- Thêm dữ liệu vào bảng food
INSERT INTO food(food_name, `desc`) VALUES
('su kien', 'bánh được làm từ kem'),
('gói gà', 'được làm từ gà'),
('gói vịt', 'được làm từ vịt'),
('gói cá', 'được làm từ cá'),
('gói heo', 'được làm từ heo')
;
-- Thêm dữ liệu vào bảng order
INSERT INTO `order`(user_id, food_id) VALUES 
(1, 2), (3, 1), (2, 5), (1, 3), (3,2);
-- Thêm dữ liệu vào bảng restaurant
INSERT INTO restaurant (res_name, image, `desc`) VALUES
('Pizza Paradise', 'pizza.jpg', 'Nhà hàng chuyên về pizza.'),
('Sushi World', 'sushi.jpg', 'Nhà hàng phục vụ sushi tươi ngon.'),
('Burger Haven', 'burger.jpg', 'Nơi có burger ngon nhất.'),
('Vegan Delight', 'vegan.jpg', 'Nhà hàng dành cho người ăn chay.'),
('BBQ Station', 'bbq.jpg', 'Nhà hàng chuyên BBQ.'),
('Hotpot Heaven', 'hotpot.jpg', 'Nhà hàng lẩu ngon nhất.'),
('Steak House', 'steak.jpg', 'Nhà hàng bít tết đẳng cấp.'),
('Seafood Delight', 'seafood.jpg', 'Nhà hàng hải sản tươi sống.'),
('Korean Cuisine', 'korean.jpg', 'Nhà hàng ẩm thực Hàn Quốc.');
-- Thêm dữ liệu vào bảng food_type

INSERT INTO food_type (type_name) VALUES
('Món chính'),
('Món phụ'),
('Đồ uống'),
('Tráng miệng'),
('Ăn sáng'),
('Ăn nhẹ'),
('Món chay'),
('Món nướng'),
('Món xào'),
('Salad');
-- Thêm dữ liệu vào bảng food;

INSERT INTO food (type_id, food_name, image, price, `desc`) VALUES
(1, 'Pizza Pepperoni', 'pepperoni.jpg', 150000, 'Pizza với topping pepperoni.'),
(2, 'Burger Classic', 'burger.jpg', 100000, 'Burger kiểu cổ điển.'),
(3, 'Coca Cola', 'coke.jpg', 20000, 'Nước giải khát Coca Cola.'),
(4, 'Cheesecake', 'cheesecake.jpg', 70000, 'Bánh cheesecake ngọt ngào.'),
(5, 'Phở bò', 'pho_bo.jpg', 40000, 'Phở bò ngon nhất Hà Nội.'),
(6, 'Gỏi cuốn', 'goi_cuon.jpg', 25000, 'Gỏi cuốn thanh mát.'),
(7, 'Thịt nướng xiên que', 'nuong.jpg', 50000, 'Thịt nướng đậm vị.'),
(8, 'Rau xào tỏi', 'rau_xao.jpg', 30000, 'Món xào đơn giản.'),
(9, 'Bánh mì chả lụa', 'banhmi.jpg', 20000, 'Bánh mì ăn sáng.');

-- Thêm dữ liệu vào bảng sub_food
truncate table sub_food;
INSERT INTO sub_food (food_id, sub_name, sub_price) VALUES
(1, 'Thêm phô mai', 20000),
(2, 'Thêm xúc xích', 25000),
(3, 'Khoai tây chiên', 15000),
(4, 'Sốt BBQ', 10000),
(5, 'Thêm rau sống', 5000),
(6, 'Thêm bún', 10000),
(7, 'Thêm đậu phụ', 15000),
(8, 'Thêm tỏi phi', 5000),
(9, 'Thêm nước chấm', 7000);

-- Thêm dữ liệu vào bảng rate_res
truncate table rate_res;
INSERT INTO rate_res (user_id, res_id, amount, date_rate) VALUES
(1, 1, 5, '2024-12-08 12:30:00'),
(2, 2, 4, '2024-12-07 14:45:00'),
(3, 3, 3, '2024-12-06 18:00:00'),
(4, 4, 7, '2024-12-05 20:15:00'),
(5, 5, 6, '2024-12-04 15:30:00'),
(6, 6, 5, '2024-12-03 17:00:00'),
(7, 7, 4, '2024-12-02 19:45:00'),
(8, 8, 3, '2024-12-01 14:15:00'),
(9, 9, 2, '2024-11-30 13:00:00'),
(4, 1, 4, '2024-11-30 13:00:00'),
(6, 3, 2, '2024-11-30 13:00:00'),
(5, 3, 5, '2024-11-30 13:00:00'),
(3, 8, 2, '2024-11-30 13:00:00'),
(1, 4, 5, '2024-11-30 13:00:00'),
(6, 4, 7, '2024-11-30 13:00:00');

-- Thêm dữ liệu vào bảng like_res;
truncate table like_res;
INSERT INTO like_res (user_id, res_id, date_like) VALUES
(1, 4, '2024-12-08 10:00:00'),
(2, 5, '2024-12-07 11:30:00'),
(3, 3, '2024-12-06 09:15:00'),
(4, 1, '2024-12-05 08:45:00'),
(5, 6, '2024-12-04 10:30:00'),
(6, 3, '2024-12-03 11:00:00'),
(7, 6, '2024-12-02 13:15:00'),
(8, 2, '2024-12-01 09:45:00'),
(4, 1, '2024-11-30 08:00:00'),
(3, 6, '2024-12-09 3:00:00'),
(7, 1, '2024-12-04 11:30:00'),
(8, 9, '2024-12-05 09:15:00'),
(3, 7, '2024-12-03 08:45:00'),
(8, 4, '2024-12-02 10:30:00'),
(5, 2, '2024-12-08 11:00:00'),
(4, 4, '2024-12-03 13:15:00'),
(6, 3, '2024-12-05 09:45:00'),
(3, 8, '2024-11-28 08:00:00');
-- Thêm dữ liệu vào bảng order
truncate table `order`;
INSERT INTO `order` (user_id, food_id, amount, code, arr_sub_id) VALUES
(1, 1, 2, 'ORD001', '1,2'),
(2, 3, 1, 'ORD002', '3'),
(3, 2, 3, 'ORD003', '4'),
(4, 4, 1, 'ORD004', NULL),
(5, 5, 2, 'ORD005', '5'),
(6, 6, 1, 'ORD006', '6'),
(7, 7, 3, 'ORD007', '7'),
(8, 8, 1, 'ORD008', '8'),
(9, 9, 2, 'ORD009', '9'),
(10, 10, 1, 'ORD010', '10');
-- 5 người like nhà hàng nhiều nhất
SELECT `user`.full_name AS 'TÊN KHÁCH HÀNG', COUNT(like_res.user_id) AS 'số lượng like' 
FROM like_res
INNER JOIN `user` on like_res.user_id = `user`.user_id
GROUP BY like_res.user_id
ORDER BY COUNT(like_res.user_id) DESC
LIMIT 5;
-- Tìm 2 nhà hàng có lượt like nhiều nhất
SELECT restaurant.res_name AS `TÊN NHÀ HÀNG`, COUNT(like_res.user_id) AS 'SỐ LƯỢNG LIKE'
FROM like_res 
INNER JOIN restaurant on like_res.res_id = restaurant.res_id
GROUP BY like_res.res_id
ORDER BY COUNT(like_res.user_id) DESC
LIMIT 2;
-- Tìm người đã đặt hàng nhiều nhất
SELECT `user`.full_name AS 'TÊN KHÁCH HÀNG', `order`.amount AS 'SỐ LƯỢNG ĐẶT HÀNG'
FROM `order`
INNER JOIN `user` on `order`.user_id = `user`.user_id
WHERE `order`.amount = (
	SELECT MAX(`order`.amount) FROM `order`
);
-- Tìm người dùng không hoạt động trong hệ thống
SELECT `user`.full_name AS 'DANH SÁCH KHÁCH HÀNG KHÔNG HOẠT ĐỘNG'
FROM `user`
LEFT JOIN rate_res ON `user`.user_id = rate_res.user_id
LEFT JOIN like_res ON `user`.user_id = like_res.user_id
LEFT JOIN `order` ON `user`.user_id = `order`.user_id
WHERE rate_res.user_id IS NULL
  AND like_res.user_id IS NULL
  AND `order`.user_id IS NULL
UNION
SELECT 'TẤT CẢ KHÁCH HÀNG ĐÃ HOẠT ĐỘNG'
WHERE NOT EXISTS (
SELECT 1
FROM `user`
LEFT JOIN rate_res ON `user`.user_id = rate_res.user_id
LEFT JOIN like_res ON `user`.user_id = like_res.user_id
LEFT JOIN `order` ON `user`.user_id = `order`.user_id
WHERE rate_res.user_id IS NULL
  AND like_res.user_id IS NULL
  AND `order`.user_id IS NULL
)
  

  




