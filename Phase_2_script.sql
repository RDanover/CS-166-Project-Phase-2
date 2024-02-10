DROP TABLE IF EXISTS User;
DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS Manager;
DROP TABLE IF EXISTS Store;
DROP TABLE IF EXISTS Product;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Updates;
DROP TABLE IF EXISTS Warehouse;
DROP TABLE IF EXISTS Supplies;
DROP TABLE IF EXISTS Requests;


CREATE TABLE IF EXISTS User (userID INT NOT NULL, password CHAR(11) NOT NULL, name CHAR(50) NOT NULL, email CHAR(50), UNIQUE(userID), PRIMARY KEY(userID));

CREATE TABLE IF EXISTS Customer (c_userID INT NOT NULL, longitude DECIMAL(9,6) NOT NULL, latitude DECIMAL(8,6) NOT NULL, PRIMARY KEY(c_userID), FOREIGN KEY(c_userID) REFERENCES User(userID), UNIQUE(c_userID));

CREATE TABLE IF EXISTS Manager(m_userID INT NOT NULL, degree CHAR(20), salary INT NOT NULL, PRIMARY KEY(m_userID), FOREIGN KEY(m_userID) REFERENCES User(userID), UNIQUE(m_userID));

CREATE TABLE IF EXISTS Store (storeID INT NOT NULL, latitude DECIMAL(8,6) NOT NULL, longitude DECIMAL(9,6) NOT NULL, date_established date, m_userID INT NOT NULL, PRIMARY KEY(storeID), FOREIGN KEY(m_userID) REFERENCES Manager(m_userID), UNIQUE(storeID, m_userID));

CREATE TABLE IF EXISTS Product (storeID INT NOT NULL, productname CHAR(30) NOT NULL, num_units INT NOT NULL, price_per_unit INT NOT NULL, description CHAR(100), imageurl CHAR(100) PRIMARY KEY(storeID), FOREIGN KEY(storeID) REFERENCES Store(storeID), UNIQUE(storeID));

CREATE TABLE IF EXISTS Orders (c_userID INT NOT NULL, prodstoreID INT NOT NULL, units_ordered INT NOT NULL, orderdate date, PRIMARY KEY(c_userID, prodstoreID), FOREIGN KEY (c_userID) REFERENCES Customer(c_userID), FOREIGN KEY (prodstoreID) REFERENCES Product(storeID), UNIQUE(c_userID, prodstoreID));

CREATE TABLE IF EXISTS Updates(m_userID INT NOT NULL, prodstoreID INT NOT NULL, PRIMARY KEY(m_userID, prodstoreID), FOREIGN KEY(m_userID) REFERENCES Manager(m_userID), FOREIGN KEY(prodstoreID) REFERENCES Product(storeID), UNIQUE(m_userID, prodstoreID));

CREATE TABLE IF EXISTS Warehouse (warehouseID INT NOT NULL, area INT, latitude DECIMAL(8,6) NOT NULL, longitude DECIMAL(9,6) NOT NULL, PRIMARY KEY(warehouseID), UNIQUE(warehouseID));

CREATE TABLE IF EXISTS Supplies(warehouseID INT NOT NULL, prodstoreID INT NOT NULL, PRIMARY KEY(warehouseID, prodstoreID), FOREIGN KEY (warehouseID) REFERENCES Warehouse(warehouseID), FOREIGN KEY(prodstoreID) REFERENCES Product(storeID), UNIQUE(warehouseID, prodstoreID));

CREATE TABLE IF EXISTS Requests(m_userID INT NOT NULL, warehouseID NOT NULL, prodstoreID INT NOT NULL, units_requested INT NOT NULL, PRIMARY KEY(m_userID, warehouseID, prodstoreID), FOREIGN KEY(m_userID) REFERENCES Manager(m_userID), FOREIGN KEY(warehouseID) REFERENCES Warehouse(warehouseID), FOREIGN KEY(prodstoreID) REFERENCES Product(storeID), UNIQUE(m_userID, warehouseID, prodstoreID));


