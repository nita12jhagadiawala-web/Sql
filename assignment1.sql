PRAGMA foreign_keys = ON;

/* -------------------------
   PROGRAM 1: Online Bookstore
   ------------------------- */
DROP TABLE IF EXISTS program1_order_detail;
DROP TABLE IF EXISTS program1_order;
DROP TABLE IF EXISTS program1_customer;
DROP TABLE IF EXISTS program1_book;

CREATE TABLE program1_book (
  book_id INTEGER PRIMARY KEY,
  title TEXT,
  author TEXT,
  price NUMERIC
);

CREATE TABLE program1_customer (
  customer_id INTEGER PRIMARY KEY,
  name TEXT,
  city TEXT
);

CREATE TABLE program1_order (
  order_id INTEGER PRIMARY KEY,
  customer_id INTEGER,
  order_date TEXT,
  total_amount NUMERIC,
  FOREIGN KEY (customer_id) REFERENCES program1_customer(customer_id)
);

CREATE TABLE program1_order_detail (
  detail_id INTEGER PRIMARY KEY,
  order_id INTEGER,
  book_id INTEGER,
  quantity INTEGER,
  FOREIGN KEY (order_id) REFERENCES program1_order(order_id),
  FOREIGN KEY (book_id) REFERENCES program1_book(book_id)
);

INSERT INTO program1_book (book_id, title, author, price) VALUES
  (1, 'The Silent Patient', 'Alex Michaelides', 360.00),
  (2, 'The White Tiger', 'Aravind Adiga', 420.00),
  (3, 'The Shadow Lines', 'Amitav Ghosh', 440.00),
  (4, 'Atomic Habits', 'James Clear', 380.00);

INSERT INTO program1_customer (customer_id, name, city) VALUES
  (1, 'Vedant', 'Surat'),
  (2, 'Bhaumik', 'Pune'),
  (3, 'Aarav', 'Ahmedabad'),
  (4, 'Yaksh', 'Jaipur'),
  (5, 'Divy', 'Nashik');

INSERT INTO program1_order (order_id, customer_id, order_date, total_amount) VALUES
  (1, 3, '2025-08-01', NULL),
  (2, 1, '2025-08-05', NULL);

INSERT INTO program1_order_detail (detail_id, order_id, book_id, quantity) VALUES
  (1, 1, 2, 1),
  (2, 2, 1, 1);

/* sample queries */
SELECT * FROM program1_customer WHERE city LIKE 'A%';
SELECT * FROM program1_book WHERE title LIKE '%The%';
SELECT * FROM program1_book WHERE price BETWEEN 400 AND 500;

/* -------------------------------
   PROGRAM 2: Fitness Membership
   ------------------------------- */
DROP TABLE IF EXISTS program2_membership;
DROP TABLE IF EXISTS program2_class;
DROP TABLE IF EXISTS program2_trainer;
DROP TABLE IF EXISTS program2_member;

CREATE TABLE program2_member (
  member_id INTEGER PRIMARY KEY,
  name TEXT,
  join_date TEXT,
  city TEXT
);

CREATE TABLE program2_trainer (
  trainer_id INTEGER PRIMARY KEY,
  name TEXT,
  specialization TEXT
);

CREATE TABLE program2_class (
  class_id INTEGER PRIMARY KEY,
  class_name TEXT,
  trainer_id INTEGER,
  monthly_fee NUMERIC,
  FOREIGN KEY (trainer_id) REFERENCES program2_trainer(trainer_id)
);

CREATE TABLE program2_membership (
  membership_id INTEGER PRIMARY KEY,
  member_id INTEGER,
  class_id INTEGER,
  start_date TEXT,
  end_date TEXT,
  FOREIGN KEY (member_id) REFERENCES program2_member(member_id),
  FOREIGN KEY (class_id) REFERENCES program2_class(class_id)
);

INSERT INTO program2_member (member_id, name, join_date, city) VALUES
  (1, 'Divy',   '2023-03-15', 'Jaipur'),
  (2, 'Vedant', '2023-04-05', 'Pune'),
  (3, 'Bhaumik','2023-05-10', 'Surat'),
  (4, 'Aarav',  '2023-01-28', 'Ahmedabad'),
  (5, 'Yaksh',  '2023-02-18', 'Vadodara');

INSERT INTO program2_trainer (trainer_id, name, specialization) VALUES
  (1, 'Yaksh',  'Yoga'),
  (2, 'Aarav',  'Cardio'),
  (3, 'Divy',   'Strength');

INSERT INTO program2_class (class_id, class_name, trainer_id, monthly_fee) VALUES
  (1, 'Sunrise Yoga', 1, 2000.00),
  (2, 'HIIT Express', 2, 1800.00),
  (3, 'Power Basics', 3, 2200.00);

INSERT INTO program2_membership (membership_id, member_id, class_id, start_date, end_date) VALUES
  (1, 1, 1, '2023-07-01', '2023-12-31'),
  (2, 2, 3, '2023-08-01', '2024-01-31'),
  (3, 3, 1, '2023-09-01', '2024-03-31');

/* sample queries */
SELECT * FROM program2_class WHERE class_name LIKE '%Yoga%';
SELECT * FROM program2_member WHERE join_date > '2023-03-01';
SELECT * FROM program2_trainer WHERE LENGTH(specialization) = 4;

/* --------------------------
   PROGRAM 3: Movie Rental
   -------------------------- */
DROP TABLE IF EXISTS program3_rental_detail;
DROP TABLE IF EXISTS program3_rental;
DROP TABLE IF EXISTS program3_customer;
DROP TABLE IF EXISTS program3_movie;

CREATE TABLE program3_movie (
  movie_id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  genre TEXT,
  release_year INTEGER
);

CREATE TABLE program3_customer (
  customer_id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  phone TEXT
);

CREATE TABLE program3_rental (
  rental_id INTEGER PRIMARY KEY,
  rental_date TEXT NOT NULL,
  customer_id INTEGER,
  FOREIGN KEY (customer_id) REFERENCES program3_customer(customer_id)
);

CREATE TABLE program3_rental_detail (
  rental_detail_id INTEGER PRIMARY KEY,
  rental_id INTEGER,
  movie_id INTEGER,
  return_date TEXT,
  FOREIGN KEY (rental_id) REFERENCES program3_rental(rental_id),
  FOREIGN KEY (movie_id) REFERENCES program3_movie(movie_id)
);

INSERT INTO program3_movie (movie_id, title, genre, release_year) VALUES
  (1, 'Inception',    'Sci-Fi',   2010),
  (2, 'Interstellar', 'Sci-Fi',   2014),
  (3, 'Drishyam',     'Thriller', 2015),
  (4, 'Piku',         'Drama',    2015);

INSERT INTO program3_customer (customer_id, name, phone) VALUES
  (1, 'Vedant',  '+91-9000000001'),
  (2, 'Aarav',   '+91-9000000002'),
  (3, 'Bhaumik', '+91-9000000003');

INSERT INTO program3_rental (rental_id, rental_date, customer_id) VALUES
  (1, '2025-01-10', 1),
  (2, '2025-01-12', 2),
  (3, '2025-01-14', 3);

INSERT INTO program3_rental_detail (rental_detail_id, rental_id, movie_id, return_date) VALUES
  (1, 1, 1, '2025-01-11'),
  (2, 1, 3, '2025-01-12'),
  (3, 2, 2, '2025-01-13');

/* sample queries */
SELECT * FROM program3_customer WHERE name LIKE '%Shah%';
SELECT * FROM program3_movie WHERE release_year BETWEEN 2010 AND 2020;
SELECT * FROM program3_movie WHERE genre LIKE '%Sci-Fi%';
