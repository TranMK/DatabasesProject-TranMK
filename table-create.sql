DROP TABLE IF EXISTS purchaseproducts;
DROP TABLE IF EXISTS purchase;
DROP TABLE IF EXISTS credit_cards;
DROP TABLE IF EXISTS product;
DROP TABLE IF EXISTS staff;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    shipaddress VARCHAR(255) NOT NULL,
    phonenum BIGINT NOT NULL,
    email VARCHAR(255) NOT NULL
);

CREATE TABLE credit_cards (
    cardnum BIGINT PRIMARY KEY,
    holderid INT NOT NULL,
    cardaddress VARCHAR(255) NOT NULL,
    expdate DATE NOT NULL,
    CONSTRAINT fk_credit_cards_customer
        FOREIGN KEY (holderid) REFERENCES customers(id)
);

CREATE TABLE product (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price INT NOT NULL,
    category VARCHAR(100) NOT NULL,
    invcount INT
);

CREATE TABLE staff (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    department VARCHAR(100),
    homeaddress VARCHAR(255) NOT NULL,
    shiftstart TIMESTAMP NULL,
    shiftend TIMESTAMP NULL,
    position VARCHAR(100)
);

CREATE TABLE purchase (
    purchasenum INT PRIMARY KEY,
    customerid INT NOT NULL,
    buytime TIMESTAMP NOT NULL,
    CONSTRAINT fk_purchase_customer
        FOREIGN KEY (customerid) REFERENCES customers(id)
);

CREATE TABLE purchaseproducts (
    purchasenum INT NOT NULL,
    productid INT NOT NULL,
    purchasecount INT NOT NULL,
    PRIMARY KEY (purchasenum, productid),
    CONSTRAINT fk_purchaseproducts_purchase
        FOREIGN KEY (purchasenum) REFERENCES purchase(purchasenum),
    CONSTRAINT fk_purchaseproducts_product
        FOREIGN KEY (productid) REFERENCES product(id)
);
