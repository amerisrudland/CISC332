CREATE TABLE Seller(
    SellerID         INTEGER(6)        NOT NULL,
    UserName         VARCHAR(15)    NOT NULL UNIQUE,
    Address         VARCHAR(40)    NOT NULL,
    Delivery_Method VARCHAR(20)    NOT NULL,
    Checking_Number INTEGER        NOT NULL,
    PRIMARY KEY (SellerID)
);

CREATE TABLE Purchaser(
    PurchaserID     INTEGER(6)        NOT NULL,
    UserName     VARCHAR(15)    NOT NULL UNIQUE,
    Address         VARCHAR(40)    NOT NULL,
    Credit_Card     INTEGER        NOT NULL,
    PRIMARY KEY (PurchaserID)
);

CREATE TABLE Products(
    ProdNo             INTEGER(8)        NOT NULL, 
    Name             VARCHAR(25)    NOT NULL,
    SellerID        INTEGER(6)        NOT NULL,
    Date_Listed     DATE            NOT NULL,
    Quantity         INTEGER,
    Unit            VARCHAR(4)    NOT NULL,
    Price_Per_Unit    DECIMAL(5,2)     NOT NULL,
	Days_To_Delivery 	INTEGER   	NOT NULL, 
    PRIMARY KEY (ProdNo), 
	FOREIGN KEY (SellerID) references Seller(SellerID) on delete cascade on update cascade
);

CREATE TABLE Fav_Products(
    ProdNo             INTEGER(8)        NOT NULL,
    PurchaserID      INTEGER(6)        NOT NULL, 
	PRIMARY KEY (ProdNo, PurchaserID), 
	FOREIGN KEY (PurchaserID) references Purchaser(PurchaserID) on delete cascade on update cascade,  
	FOREIGN KEY (ProdNo) references Products(ProdNo) on delete cascade on update cascade
);

CREATE TABLE FoodOrder(
    OrderNo         INTEGER(10)        NOT NULL,
    ProdNo         INTEGER(8)        NOT NULL,
    Quantity_Bought     INTEGER        NOT NULL,
    Date_Sold         DATE            NOT NULL,
    PurchaserID         INTEGER(6)        NOT NULL,
    SellerID         INTEGER(6)        NOT NULL,
    Delivery_Date     DATE            NOT NULL,
    PRIMARY KEY (OrderNo), 
	FOREIGN KEY (PurchaserID) references Purchaser(PurchaserID) on delete cascade on update cascade, 
	FOREIGN KEY (SellerID) references Seller(SellerID) on delete cascade on update cascade
);


