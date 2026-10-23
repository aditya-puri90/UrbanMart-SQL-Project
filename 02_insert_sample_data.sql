-- Synthetic sample data for the UrbanMart SQL project.
-- Run only after database/01_create_tables.sql.
-- Sample dates and names are fictional and intended for SQL practice.

-- INSERT VALUES IN TABLES

INSERT INTO customers VALUES
(1,'Rahul Sharma','rahul.sharma@gmail.com','1000000000','Pune','Maharashtra','2025-01-15','Regular'),
(2,'Priya Patil','priya.patil@gmail.com','20000000000','Mumbai','Maharashtra','2025-02-10','Premium'),
(3,'Amit Joshi','amit.joshi@gmail.com','30000000000','Bengaluru','Karnataka','2025-02-22','Regular'),
(4,'Sneha Kulkarni','sneha.kulkarni@gmail.com','4812345678','Pune','Maharashtra','2025-03-05','Premium'),
(5,'Rohan Deshmukh','rohan.deshmukh@gmail.com','2898765432','Nagpur','Maharashtra','2025-03-18','New'),
(6,'Neha Verma','neha.verma@gmail.com','1871234567','Delhi','Delhi','2025-04-02','Regular'),
(7,'Karan Mehta','karan.mehta@gmail.com','0811122233','Ahmedabad','Gujarat','2025-04-15','Regular'),
(8,'Pooja Shah','pooja.shah@gmail.com','3822334455','Mumbai','Maharashtra','2025-05-01','Premium'),
(9,'Vivek Nair','vivek.nair@gmail.com','1734567890','Kochi','Kerala','2025-05-20','New'),
(10,'Anjali Rao','anjali.rao@gmail.com','2867451230','Hyderabad','Telangana','2025-06-08','Regular');

INSERT INTO products VALUES
(101,'Wireless Mouse','Electronics','Logitech',799.00,120,'TechWorld Distributors'),
(102,'Mechanical Keyboard','Electronics','Redragon',2499.00,75,'TechWorld Distributors'),
(103,'USB-C Fast Charger','Electronics','Portronics',999.00,150,'ElectroMart'),
(104,'Laptop Backpack','Fashion','American Tourister',1899.00,80,'BagZone'),
(105,'Running Shoes','Sports','Campus',2299.00,60,'SportsHub'),
(106,'Cotton T-Shirt','Fashion','Roadster',699.00,200,'FashionKart'),
(107,'Face Wash','Beauty','Nivea',249.00,180,'BeautyCare Suppliers'),
(108,'Shampoo 650ml','Beauty','Dove',499.00,140,'BeautyCare Suppliers'),
(109,'Coffee Powder 500g','Grocery','Bru',320.00,250,'DailyNeeds Wholesale'),
(110,'Basmati Rice 5kg','Grocery','India Gate',649.00,100,'DailyNeeds Wholesale'),
(111,'Non-Stick Frying Pan','Home & Kitchen','Prestige',1299.00,65,'HomePlus'),
(112,'Water Bottle 1L','Home & Kitchen','Milton',599.00,110,'HomePlus'),
(113,'Data Science Book','Books','OReilly',1899.00,45,'BookWorld'),
(114,'Yoga Mat','Sports','Boldfit',899.00,90,'SportsHub'),
(115,'Bluetooth Earbuds','Electronics','Boat',1499.00,130,'ElectroMart');


INSERT INTO orders VALUES
(1001,1,'2025-06-10','Delivered',3298.00),
(1002,2,'2025-06-11','Delivered',2499.00),
(1003,3,'2025-06-12','Shipped',1499.00),
(1004,4,'2025-06-13','Delivered',2898.00),
(1005,5,'2025-06-14','Cancelled',999.00),
(1006,6,'2025-06-15','Delivered',1899.00),
(1007,7,'2025-06-16','Processing',2299.00),
(1008,8,'2025-06-17','Delivered',1448.00),
(1009,9,'2025-06-18','Shipped',1299.00),
(1010,10,'2025-06-19','Delivered',2498.00),
(1011,1,'2025-06-20','Delivered',799.00),
(1012,3,'2025-06-21','Delivered',1899.00),
(1013,4,'2025-06-22','Returned',699.00),
(1014,6,'2025-06-23','Delivered',1149.00),
(1015,8,'2025-06-24','Delivered',1499.00);
      
      
INSERT INTO order_items VALUES
(1,1001,101,1,799.00),
(2,1001,102,1,2499.00),
(3,1002,102,1,2499.00),
(4,1003,115,1,1499.00),
(5,1004,104,1,1899.00),
(6,1004,107,1,249.00),
(7,1004,108,1,499.00),
(8,1004,112,1,251.00),
(9,1005,103,1,999.00),
(10,1006,104,1,1899.00),
(11,1007,105,1,2299.00),
(12,1008,107,1,249.00),
(13,1008,108,1,499.00),
(14,1008,109,1,320.00),
(15,1008,112,1,380.00),
(16,1009,111,1,1299.00),
(17,1010,105,1,2299.00),
(18,1010,107,1,199.00),
(19,1011,101,1,799.00),
(20,1012,113,1,1899.00),
(21,1013,106,1,699.00),
(22,1014,109,1,320.00),
(23,1014,110,1,649.00),
(24,1014,107,1,180.00),
(25,1015,115,1,1499.00);


INSERT INTO payments VALUES
(5001,1001,'2025-06-10','UPI',3298.00,'Completed'),
(5002,1002,'2025-06-11','Credit Card',2499.00,'Completed'),
(5003,1003,'2025-06-12','UPI',1499.00,'Completed'),
(5004,1004,'2025-06-13','Debit Card',2898.00,'Completed'),
(5005,1005,'2025-06-14','UPI',999.00,'Failed'),
(5006,1006,'2025-06-15','Cash on Delivery',1899.00,'Completed'),
(5007,1007,'2025-06-16','Credit Card',2299.00,'Pending'),
(5008,1008,'2025-06-17','UPI',1448.00,'Completed'),
(5009,1009,'2025-06-18','Net Banking',1299.00,'Completed'),
(5010,1010,'2025-06-19','UPI',2498.00,'Completed'),
(5011,1011,'2025-06-20','UPI',799.00,'Completed'),
(5012,1012,'2025-06-21','Credit Card',1899.00,'Completed'),
(5013,1013,'2025-06-22','UPI',699.00,'Refunded'),
(5014,1014,'2025-06-23','Debit Card',1149.00,'Completed'),
(5015,1015,'2025-06-24','UPI',1499.00,'Completed');


INSERT INTO deliveries VALUES
(7001,1001,'Delhivery','2025-06-11','2025-06-14','2025-06-13','Delivered'),
(7002,1002,'Blue Dart','2025-06-12','2025-06-15','2025-06-15','Delivered'),
(7003,1003,'Ecom Express','2025-06-13','2025-06-16',NULL,'In Transit'),
(7004,1004,'Delhivery','2025-06-14','2025-06-17','2025-06-16','Delivered'),
(7005,1005,'Delhivery',NULL,NULL,NULL,'Cancelled'),
(7006,1006,'Blue Dart','2025-06-16','2025-06-19','2025-06-19','Delivered'),
(7007,1007,'Ecom Express',NULL,NULL,NULL,'Processing'),
(7008,1008,'Delhivery','2025-06-18','2025-06-21','2025-06-20','Delivered'),
(7009,1009,'Blue Dart','2025-06-19','2025-06-22',NULL,'In Transit'),
(7010,1010,'Delhivery','2025-06-20','2025-06-23','2025-06-22','Delivered'),
(7011,1011,'Ecom Express','2025-06-21','2025-06-24','2025-06-23','Delivered'),
(7012,1012,'Blue Dart','2025-06-22','2025-06-25','2025-06-24','Delivered'),
(7013,1013,'Delhivery','2025-06-23','2025-06-26','2025-06-25','Returned'),
(7014,1014,'Ecom Express','2025-06-24','2025-06-27','2025-06-26','Delivered'),
(7015,1015,'Blue Dart','2025-06-25','2025-06-28','2025-06-27','Delivered');


INSERT INTO reviews VALUES
(9001,1001,1,101,5,'Very good mouse and smooth performance.','2025-06-15'),
(9002,1001,1,102,4,'Keyboard quality is good.','2025-06-15'),
(9003,1002,2,102,5,'Excellent keyboard for the price.','2025-06-16'),
(9004,1003,3,115,4,'Sound quality is good for daily use.','2025-06-20'),
(9005,1004,4,104,5,'Spacious and comfortable backpack.','2025-06-18'),
(9006,1006,6,104,4,'Good quality but expected more pockets.','2025-06-21'),
(9007,1008,8,107,3,'Average product.','2025-06-22'),
(9008,1010,10,105,5,'Very comfortable shoes.','2025-06-25'),
(9009,1011,1,101,5,'Good product and fast delivery.','2025-06-25'),
(9010,1012,3,113,5,'Very useful book for beginners.','2025-06-26'),
(9011,1014,6,110,4,'Good quality rice.','2025-06-27'),
(9012,1015,8,115,4,'Battery backup is decent.','2025-06-29');
