DROP TABLE IF EXISTS Storefront CASCADE;
DROP TABLE IF EXISTS Product CASCADE;
DROP TABLE IF EXISTS User CASCADE;
DROP TABLE IF EXISTS Customer CASCADE;
DROP TABLE IF EXISTS Manager CASCADE;
DROP TABLE IF EXISTS Warehouse CASCADE;

--Entities
CREATE TABLE Storefront (StoreID INTEGER UNIQUE NOT NULL,Latitude DECIMAL(8,6) NOT NULL,Longitude DECIMAL(9,6) NOT NULL , DateEstablished DATE, PRIMARY KEY(StoreID));
CREATE TABLE Product (ProductName char(30) NOT NULL, NumberOfUnits INTEGER NOT NULL, PricePerUnit INTEGER NOT NULL, Description char(100), ImageURL char(100));
CREATE TABLE User (UserID INTEGER UNIQUE NOT NULL, Password char(11) NOT NULL, Name char(50) NOT NULL, Email char(50), PRIMARY KEY(UserID));
CREATE TABLE Customer (CreditScore INTEGER, Latitude decimal(8,6) NOT NULL, Longitude decimal(9,6) NOT NULL);
CREATE TABLE Manager (Degree char(20), Salary INTEGER NOT NULL);
CREATE TABLE Warehouse (WarehouseID INTEGER UNIQUE NOT NULL, Area INTEGER, Latitude decimal(8,6) NOT NULL, Longitude decimal(9,6) NOT NULL);
