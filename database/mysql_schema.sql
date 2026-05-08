CREATE DATABASE IF NOT EXISTS automotive_inventory
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;
USE automotive_inventory;

CREATE TABLE IF NOT EXISTS Cars (
  id VARCHAR(20) NOT NULL,
  model VARCHAR(100) NOT NULL,
  variant VARCHAR(100) NOT NULL,
  price DECIMAL(12,2) NOT NULL,
  mileage DECIMAL(12,2) NOT NULL,
  color VARCHAR(50) NOT NULL,
  type VARCHAR(50) NOT NULL,
  weight DECIMAL(12,2) NOT NULL,
  numberPlate VARCHAR(30) NOT NULL,
  chassisNumber VARCHAR(50) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY uk_cars_number_plate (numberPlate),
  UNIQUE KEY uk_cars_chassis_number (chassisNumber)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS Customers (
  id VARCHAR(20) NOT NULL,
  name VARCHAR(100) NOT NULL,
  phone VARCHAR(30) NOT NULL,
  email VARCHAR(150) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY uk_customers_email (email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS Employees (
  id VARCHAR(20) NOT NULL,
  name VARCHAR(100) NOT NULL,
  salary DECIMAL(12,2) NOT NULL,
  commissionRate DECIMAL(5,2) NOT NULL DEFAULT 0.10,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS Sales (
  id VARCHAR(20) NOT NULL,
  carId VARCHAR(20) NOT NULL,
  customerId VARCHAR(20) NOT NULL,
  employeeId VARCHAR(20) NOT NULL,
  amount DECIMAL(12,2) NOT NULL,
  date DATE NOT NULL,
  PRIMARY KEY (id),
  KEY idx_sales_car (carId),
  KEY idx_sales_customer (customerId),
  KEY idx_sales_employee (employeeId),
  CONSTRAINT fk_sales_car FOREIGN KEY (carId) REFERENCES Cars (id),
  CONSTRAINT fk_sales_customer FOREIGN KEY (customerId) REFERENCES Customers (id),
  CONSTRAINT fk_sales_employee FOREIGN KEY (employeeId) REFERENCES Employees (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS users (
  username VARCHAR(100) NOT NULL,
  password VARCHAR(255) NOT NULL,
  PRIMARY KEY (username)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
