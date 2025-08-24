/* =========================================================
   Online Bookstore Management
   ========================================================= */
DROP DATABASE IF EXISTS program1;
CREATE DATABASE program1;
USE program1;

-- Schema
DROP TABLE IF EXISTS OrderDetails;
DROP TABLE IF EXISTS OrderTable;
DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS Book;

CREATE TABLE Book (
  book_id INT PRIMARY KEY,
  title VARCHAR(100),
  author VARCHAR(60),
  price DECIMAL(7,2)
);

CREATE TABLE Customer (
  customer_id INT PRIMARY KEY,
  name VARCHAR(50),
  city VARCHAR(50)
);

CREATE TABLE OrderTable (
  order_id INT PRIMARY KEY,
  customer_id INT,
  order_date DATE,
  total_amount DECIMAL(10,2),
  FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

CREATE TABLE OrderDetails (
  detail_id INT PRIMARY KEY,
  order_id INT,
  book_id INT,
  quantity INT,
  FOREIGN KEY (order_id) REFERENCES OrderTable(order_id),
  FOREIGN KEY (book_id) REFERENCES Book(book_id)
);

INSERT INTO Book (book_id, title, author, price) VALUES
  (1, 'The Silent Patient', 'Alex Michaelides', 360.00),
  (2, 'The White Tiger', 'Aravind Adiga', 420.00),
  (3, 'The Shadow Lines', 'Amitav Ghosh', 440.00),
  (4, 'Atomic Habits', 'James Clear', 380.00);

INSERT INTO Customer (customer_id, name, city) VALUES
  (1, 'Vedant', 'Surat'),
  (2, 'Bhaumik', 'Pune'),
  (3, 'Aarav', 'Ahmedabad'),
  (4, 'Yaksh', 'Jaipur'),
  (5, 'Divy', 'Nashik');

INSERT INTO OrderTable (order_id, customer_id, order_date, total_amount) VALUES
  (1, 3, '2025-08-01', NULL),
  (2, 1, '2025-08-05', NULL);

INSERT INTO OrderDetails (detail_id, order_id, book_id, quantity) VALUES
  (1, 1, 2, 1),
  (2, 2, 1, 1);

-- Sample queries
SELECT * FROM Customer WHERE city LIKE 'A%';
SELECT * FROM Book WHERE title LIKE '%The%';
SELECT * FROM Book WHERE price BETWEEN 400 AND 500;


/* =========================================================
   Fitness Center Membership
   ========================================================= */
DROP DATABASE IF EXISTS program2;
CREATE DATABASE program2;
USE program2;

-- Schema
DROP TABLE IF EXISTS Membership;
DROP TABLE IF EXISTS Class;
DROP TABLE IF EXISTS Trainer;
DROP TABLE IF EXISTS Member;

CREATE TABLE Member (
  member_id INT PRIMARY KEY,
  name VARCHAR(50),
  join_date DATE,
  city VARCHAR(50)
);

CREATE TABLE Trainer (
  trainer_id INT PRIMARY KEY,
  name VARCHAR(50),
  specialization VARCHAR(50)
);

CREATE TABLE Class (
  class_id INT PRIMARY KEY,
  class_name VARCHAR(60),
  trainer_id INT,
  monthly_fee DECIMAL(8,2),
  FOREIGN KEY (trainer_id) REFERENCES Trainer(trainer_id)
);

CREATE TABLE Membership (
  membership_id INT PRIMARY KEY,
  member_id INT,
  class_id INT,
  start_date DATE,
  end_date DATE,
  FOREIGN KEY (member_id) REFERENCES Member(member_id),
  FOREIGN KEY (class_id) REFERENCES Class(class_id)
);

INSERT INTO Member (member_id, name, join_date, city) VALUES
  (1, 'Divy',   '2023-03-15', 'Jaipur'),
  (2, 'Vedant', '2023-04-05', 'Pune'),
  (3, 'Bhaumik','2023-05-10', 'Surat'),
  (4, 'Aarav',  '2023-01-28', 'Ahmedabad'),
  (5, 'Yaksh',  '2023-02-18', 'Vadodara');

INSERT INTO Trainer (trainer_id, name, specialization) VALUES
  (1, 'Yaksh',  'Yoga'),
  (2, 'Aarav',  'Cardio'),
  (3, 'Divy',   'Strength');

INSERT INTO Class (class_id, class_name, trainer_id, monthly_fee) VALUES
  (1, 'Sunrise Yoga', 1, 2000.00),
  (2, 'HIIT Express', 2, 1800.00),
  (3, 'Power Basics', 3, 2200.00);

INSERT INTO Membership (membership_id, member_id, class_id, start_date, end_date) VALUES
  (1, 1, 1, '2023-07-01', '2023-12-31'),
  (2, 2, 3, '2023-08-01', '2024-01-31'),
  (3, 3, 1, '2023-09-01', '2024-03-31');

-- Sample queries
SELECT * FROM Class WHERE class_name LIKE '%Yoga%';
SELECT * FROM Member WHERE join_date > '2023-03-01';
SELECT * FROM Trainer WHERE LENGTH(specialization) = 4;


/* =========================================================
   Movie Rental
   ========================================================= */
DROP DATABASE IF EXISTS program3;
CREATE DATABASE program3;
USE program3;

-- Schema
DROP TABLE IF EXISTS RentalDetails;
DROP TABLE IF EXISTS Rental;
DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS Movie;

CREATE TABLE Movie (
  movie_id INT PRIMARY KEY,
  title VARCHAR(100) NOT NULL,
  genre VARCHAR(40),
  release_year INT
);

CREATE TABLE Customer (
  customer_id INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  phone VARCHAR(20)
);

CREATE TABLE Rental (
  rental_id INT PRIMARY KEY,
  rental_date DATE NOT NULL,
  customer_id INT,
  FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

CREATE TABLE RentalDetails (
  rental_detail_id INT PRIMARY KEY,
  rental_id INT,
  movie_id INT,
  return_date DATE,
  FOREIGN KEY (rental_id) REFERENCES Rental(rental_id),
  FOREIGN KEY (movie_id) REFERENCES Movie(movie_id)
);

INSERT INTO Movie (movie_id, title, genre, release_year) VALUES
  (1, 'Inception',    'Sci-Fi',   2010),
  (2, 'Interstellar', 'Sci-Fi',   2014),
  (3, 'Drishyam',     'Thriller', 2015),
  (4, 'Piku',         'Drama',    2015);

INSERT INTO Customer (customer_id, name, phone) VALUES
  (1, 'Vedant',  '+91-9000000001'),
  (2, 'Aarav',   '+91-9000000002'),
  (3, 'Bhaumik', '+91-9000000003');

INSERT INTO Rental (rental_id, rental_date, customer_id) VALUES
  (1, '2025-01-10', 1),
  (2, '2025-01-12', 2),
  (3, '2025-01-14', 3);

INSERT INTO RentalDetails (rental_detail_id, rental_id, movie_id, return_date) VALUES
  (1, 1, 1, '2025-01-11'),
  (2, 1, 3, '2025-01-12'),
  (3, 2, 2, '2025-01-13');

-- Sample queries
SELECT * FROM Customer WHERE name LIKE '%Shah%';
SELECT * FROM Movie WHERE release_year BETWEEN 2010 AND 2020;
SELECT * FROM Movie WHERE genre LIKE '%Sci-Fi%';
