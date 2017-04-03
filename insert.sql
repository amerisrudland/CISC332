INSERT INTO `user` (`ID`, `UserName`, `Password`,`Role`) VALUES (NULL,'SmithFarms','SmithFarms','Seller'),
(NULL,'BlairButchers','BlairButchers','Seller'),(NULL,'RudlandDairy','RudlandDairy','Seller'),(NULL,'MuchoPizzeria','MuchoPizzeria','Purchaser'),(NULL,'Scoops','Scoops','Purchaser'),(NULL,'PitaExperience','PitaExperience','Purchaser'),(NULL, 'Admin1','Admin1','Admin'); 

INSERT INTO `seller` (`ID`,`UserName`, `Address`, `Delivery_Method`, `Checking_Number`) 
VALUES ((SELECT ID FROM USER where UserName = 'SmithFarms'),'SmithFarms', '24 Apple Way', 'Truck', 42),((SELECT ID FROM USER where UserName = 'BlairButchers'),'BlairButchers', '5 Cow Street ', 'Pickup ', 34),((SELECT ID FROM USER where UserName = 'RudlandDairy'),'RudlandDairy', '223 Highway 5', 'Truck ', 90); 

INSERT INTO `purchaser` (`ID`,`UserName`, `Address`, `Credit_Card`) VALUES
((SELECT ID FROM USER where UserName = 'MuchoPizzeria'),'MuchoPizzeria', '43 Morris Ave', 900090009),
((SELECT ID FROM USER where UserName = 'Scoops'),'Scoops ', '34 Jones Street', 100010001),
((SELECT ID FROM USER where UserName = 'PitaExperience'),'PitaExperience', '10 Victoria Way', 345634563);

INSERT INTO `products` (`Name`, `SellerID`, `Date_Listed`, `Quantity`, `Unit`, `Price_Per_Unit`, `Days_To_Delivery`) VALUES
('Pork Loin ', 2, '2017-01-24', 3, '200g', '2.09', 3),
('Skim Milk', 3, '2017-02-26', 50, '1L ', '3.50', 3),
('Carrots ', 1, '2017-03-01', 40, '0.5kg ', '4.00', 3),
('Chicken Breast ', 2, '2017-01-25', 20, '300g ', '2.00', 3),
('Tomatoes ', 1, '2017-02-04', 200, '1kg ', '5.00', 3),
('Apples ', 1, '2017-02-03', 200, '1kg ', '7.00', 3),
('2% Milk ', 3, '2017-02-25', 50, '1L ', '3.50', 3),
('Sirloin Steak ', 2, '2017-01-24', 20, '300g ', '3.10', 3),
('Chocolate Milk ', 3, '2017-02-23', 50, '1L ', '3.50', 3);

INSERT INTO `foodorder` (`ProdNo`, `Quantity_Bought`, `Date_Sold`, `PurchaserID`, `SellerID`, `Delivery_Date`) VALUES
(5,10, '2017-02-28', 5, 1, '2017-03-03'),
(5, 10, '2017-02-28', 5, 1, '2017-03-03'),
(9, 15, '2017-02-28', 4, 3, '2017-03-03'),
(3, 2, '2017-03-02', 4, 1, '2017-03-05'),
(7, 20, '2017-03-01', 5, 3, '2017-03-04'),
(6, 15, '2017-02-28', 4, 1, '2017-03-03'),
(2, 20, '2017-03-01', 5, 3, '2017-03-04'),
(8, 20, '2017-02-27', 6, 2, '2017-03-02'),
(4, 25, '2017-02-27', 6, 2, '2017-03-02'),
(1, 8, '2017-03-01', 4, 2, '2017-03-04'),
(3, 2, '2017-03-02', 4, 1, '2017-03-05'),
(6, 15, '2017-02-28', 4, 1, '2017-03-03');

INSERT INTO `fav_products` (`ProdNo`, `PurchaserID`) VALUES
(3, 5),
(4, 6),
(6, 6),
(8, 4);

