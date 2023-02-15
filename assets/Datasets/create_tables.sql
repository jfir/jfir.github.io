CREATE TABLE Customers (
  customer_id INT PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  email VARCHAR(100),
  phone VARCHAR(20)
);

INSERT INTO Customers (customer_id, first_name, last_name, email, phone) VALUES 
(1, 'Ahmed', 'Ali', 'ahmed.ali@example.com', '555-1234'),
(2, 'Fatima', 'Rahman', 'fatima.rahman@example.com', '555-5678'),
(3, 'Jacob', 'Levy', 'jacob.levy@example.com', '555-2468'),
(4, 'Malik', 'Jackson', 'malik.jackson@example.com', '555-3698'),
(5, 'Michaela', 'Gomez', 'michaela.gomez@example.com', '555-9876'),
(6, 'Omar', 'Rodriguez', 'omar.rodriguez@example.com', '555-2345'),
(7, 'Rachel', 'Cohen', 'rachel.cohen@example.com', '555-6789'),
(8, 'Sofia', 'Torres', 'sofia.torres@example.com', '555-1357'),
(9, 'Yusuf', 'Ali', 'yusuf.ali@example.com', '555-4801'),
(10, 'Zara', 'Patel', 'zara.patel@example.com', '555-9012');

CREATE TABLE booking (
  booking_id VARCHAR(10) PRIMARY KEY,
  origin VARCHAR(3) NOT NULL,
  destination VARCHAR(3) NOT NULL,
  flight_date DATE NOT NULL,
  flight_day VARCHAR(10) NOT NULL,
  num_passengers INT NOT NULL,
  trip_type VARCHAR(10) NOT NULL,
  length_days INT,
  sales_channel VARCHAR(20) NOT NULL
);

INSERT INTO booking (booking_id, origin, destination, flight_date, flight_day, num_passengers, trip_type, length_days, sales_channel) VALUES
('UA100006', 'LAX', 'ORD', '2023-03-20', 'Sunday', 1, 'One-way', 13, 'Internet'),
('DL100007', 'LAX', 'JFK', '2023-03-21', 'Monday', 2, 'Roundtrip', 10, 'Mobile'),
('AC100008', 'YYZ', 'JFK', '2023-03-22', 'Tuesday', 3, 'Roundtrip', 7, 'Travel Agent'),
('BA100009', 'JFK', 'LHR', '2023-03-23', 'Wednesday', 1, 'One-way', 14, 'Internet'),
('UA100010', 'LHR', 'SFO', '2023-03-24', 'Thursday', 4, 'Roundtrip', 16, 'Mobile'),
('DL100011', 'JFK', 'LAX', '2023-03-25', 'Friday', 2, 'One-way', 9, 'Internet'),
('AC100012', 'LAX', 'LHR', '2023-03-26', 'Saturday', 1, 'One-way', 12, 'Travel Agent'),
('BA100013', 'LHR', 'JFK', '2023-03-27', 'Sunday', 2, 'Roundtrip', 6, 'Internet'),
('UA100014', 'JFK', 'SFO', '2023-03-28', 'Monday', 3, 'Roundtrip', 8, 'Mobile'),
('AC100015', 'YYZ', 'JFK', '2023-03-29', 'Tuesday', 1, 'One-way', 13, 'Internet'),
('DL100016', 'LAX', 'JFK', '2023-03-30', 'Wednesday', 2, 'Roundtrip', 11, 'Mobile'),
('UA100017', 'LHR', 'ORD', '2023-03-31', 'Sunday', 3, 'Roundtrip', NULL, 'Internet'),
('UA100007', 'JFK', 'LAX', '2023-04-05', 'Tuesday', 2, 'Round-trip', 14, 'Mobile'),
('UA100008', 'ORD', 'DFW', '2023-05-02', 'Thursday', 1, 'One-way', 11, 'Internet'),
('UA100009', 'DEN', 'MIA', '2023-06-15', 'Wednesday', 2, 'Round-trip', 12, 'Mobile'),
('UA100010', 'LGA', 'ATL', '2023-07-01', 'Friday', 1, 'One-way', 10, 'Internet'),
('UA100011', 'SFO', 'SEA', '2023-08-19', 'Sunday', 1, 'One-way', 8, 'Mobile'),
('UA100012' , 'MSP' , 'LAX' ,'9/10/2023', 'Tuesday' ,2, 'Round-trip' ,15,'Internet'),
( 'UA100013' , 'DCA' , 'BOS' ,'10/7/2023', 'Friday' ,1, 'One-way' ,7, 'Mobile' ),
( U'A100014' , 'SFO' , 'JFK' ,'11/15/2023', 'Tuesday' ,2, 'Round-trip' ,16,'Internet'),
( 'UA100015' , 'LAX' , 'IAH' ,'12/1/2023', 'Thursday' ,1, 'One-way' ,9, 'Mobile'),
( 'UA100016' , 'MCO' , 'PHL' ,'1/20/2024', 'Sunday' ,1, 'One-way' ,8,'Internet');


CREATE TABLE orders (
  order_id INT NOT NULL AUTO_INCREMENT,
  booking_id VARCHAR(10) NOT NULL,
  customer_id INT NOT NULL,
  order_date DATE NOT NULL,
  total_amount DECIMAL(10,2) NOT NULL,
  payment_status VARCHAR(10) NOT NULL,
  PRIMARY KEY (order_id),
  FOREIGN KEY (booking_id) REFERENCES bookings(booking_id),
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO orders (booking_id, customer_id, order_date, total_amount, payment_status) VALUES
('UA100006', 2, '2023-03-05', 525, 'Paid'),
('DL100007', 4, '2023-02-19', 1050, 'Paid'),
('AC100008', 6, '2023-03-02', 1575, 'Paid'),
('BA100009', 3, '2023-03-08', 525, 'Paid'),
('UA100010', 8, '2023-03-09', 2100, 'Paid'),
('DL100011', 5, '2023-02-18', 1050, 'Paid'),
('AC100012', 1, '2023-02-14', 525, 'Paid'),
('BA100013', 10, '2023-01-16', 1050, 'Paid'),
('UA100014', 7, '2023-03-13', 1575, 'Paid'),
('AC100015', 9, '2022-12-29', 525, 'Paid'),
('DL100016', 4, '2022-12-30', 1050, 'Paid'),
('UA100017', 6, '2023-03-11', 1575, 'Paid'),
('UA100007', 1, '2023-03-11', 1050, 'Paid'),
('UA100008', 2, '2023-04-25', 525, 'Paid'),
('UA100009', 3, '2023-05-31', 1050, 'Paid'),
('UA100010', 10, '2023-06-16', 525, 'Paid'),
('UA100011', 10, '2023-08-04', 525, 'Paid'),
('UA100012', 2, '2023-08-26', 1050, 'Paid'),
('UA100013', 4, '2023-09-22', 525, 'Paid'),
('UA100014', 6, '2023-10-31', 1050, 'Paid'),
('UA100015', 2, '2023-11-16', 525, 'Paid'),
('UA100016', 7, '2024-01-05', 525, 'Paid');
