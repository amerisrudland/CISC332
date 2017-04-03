/*register a seller*/
INSERT INTO User('UserName','Password') VALUES ('$Name$','$Password$'); 
INSERT INTO `seller` (`ID`,`UserName`, `Address`, `Delivery_Method`, `Checking_Number`) 
VALUES ((SELECT ID FROM USER where UserName = '$Name$'),'$Name$', '$Address$', '$Delivery_Method$', '$CheckNum$'); 



/* add a product */ 
INSERT INTO Products (Name, SellerID, Date_Listed, Quantity, Unit, Price_Per_Unit, Days_To_Delivery)
SELECT ($NameTyped$,#UserLoggedIn#,CURDATE(),$QuantityTyped$,$UnitTyped$,$PriceTyped$,$DaysTyped$); 

/* view products */ 
SELECT Name, Unit, Price_Per_Unit, UserName, Quantity AS QuantityAvailable, Delivery_Method, Days_To_Delivery FROM Products JOIN Seller ON Products.SellerID = Seller.ID; 

/* edit a procuct */
SELECT * FROM PRODUCTS WHERE SellerID = #UserLoggedIn#; 

UPDATE `products` SET Name = $Name$ , SellerID = #UserLoggedIn#, Date_Listed = CURDATE() , Quantity = $Quantity$, Unit = $Unit$, Price_Per_Unit = $Price_Per_Unit$, Days_To_Delivery = $Days_To_Delivery$ WHERE ProdNo = #SelectedProductNo#; 

/*browse other sellers*/ 
SELECT UserName FROM Seller; 

/*browse purchasers*/ 
SELECT UserName FROM Purchaser; 

/*view selling history*/ 
SELECT Name, Quantity_Bought, Date_Sold, Delivery_Date, UserName FROM FoodOrder JOIN Products JOIN Purchaser ON (Products.ProdNo = foodorder.ProdNo AND Purchaser.ID = FoodOrder.PurchaserID) WHERE FoodOrder.SellerID = #UserLoggedIn#; 

/*register a purchaser*/ 
INSERT INTO User('UserName','Password') VALUES ('$Name$','$Password$'); 
INSERT INTO `purchaser` (`ID`,`UserName`, `Address`, `Credit_Card`) VALUES
((SELECT ID FROM USER where UserName = '$Name$'),'$Name$', '$Address$', '$Credit_Card$');

/*browse other sellers*/ 
SELECT UserName FROM Seller; 

/*browse purchasers*/ 
SELECT UserName FROM Purchaser; 

/*Make an order*/ 
/*Note there is no error if a user tries to order too much*/ 
UPDATE Products SET Quantity = Quantity - $AmountWanted$ WHERE ProdNo = #SelectedProductNo#; 
INSERT INTO `foodorder` (`ProdNo`, `Quantity_Bought`, `Date_Sold`, `PurchaserID`, `SellerID`, `Delivery_Date`) VALUES
(#SelectedProductNo#,$AmountWanted$, CURDATE(), #UserLoggedIn#, (SELECT SellerID FROM Products WHERE Products.ProdNo = #SelectedProductNo#), DATE_ADD(CURDATE(), INTERVAL (SELECT Days_To_Delivery FROM Products WHERE Products.ProdNo = #SelectedProductNo#) DAY));

/*View Purchasing History*/ 
SELECT Name, Quantity_Bought, Date_Sold, Delivery_Date, UserName FROM FoodOrder JOIN Products JOIN Seller ON (Products.ProdNo = foodorder.ProdNo AND Seller.ID = FoodOrder.SellerID) WHERE FoodOrder.PurchaserID = #UserLoggedIn#; 

/*See Upcoming Deliveries*/ 
SELECT Name, Quantity_Bought, Date_Sold, Delivery_Date, UserName FROM FoodOrder JOIN Products JOIN Seller ON (Products.ProdNo = foodorder.ProdNo AND Seller.ID = FoodOrder.SellerID) WHERE FoodOrder.PurchaserID = #UserLoggedIn# AND Delivery_Date >= CURDATE();

/*Generate a list of favourite products*/ 
SELECT Name, Quantity_Bought, Date_Sold, Delivery_Date, UserName FROM FoodOrder JOIN Products JOIN Seller ON (Products.ProdNo = foodorder.ProdNo AND Seller.ID = FoodOrder.SellerID) WHERE FoodOrder.PurchaserID = #UserLoggedIn#; 

/*To add product*/
INSERT INTO fav_products('ProdNo','PurchaserID') VALUES (#SelectedProductNo#,#UserLoggedIn#); 

/*To remove favourite product*/ 
DELETE FROM fav_products WHERE ProdNo = #SelectedProductNo# AND PurchaserID = #Userloggedin#;

/*View top sellers*/  

SELECT UserName, COUNT(SellerID) AS OrdersFilled FROM FoodOrder JOIN Seller ON foodorder.SellerID = Seller.ID GROUP BY SellerID ORDER BY OrdersFilled DESC; 

/*View top purchasers*/ 
SELECT UserName, COUNT(PurchaserID) AS OrdersMade FROM FoodOrder JOIN Purchaser ON foodorder.PurchaserID = Purchaser.ID GROUP BY PurchaserID ORDER BY OrdersMade DESC; 

/*Count users, sellers, purchasers*/ 
SELECT COUNT(*) AS ActiveUsers FROM User; 


SELECT COUNT(*) AS ActiveSellers FROM Seller; 


SELECT COUNT(*) AS ActivePurchasers FROM Purchaser; 

/*Delete a User*/ 
DELETE FROM User WHERE UserName = $SelectedUserName$; 
