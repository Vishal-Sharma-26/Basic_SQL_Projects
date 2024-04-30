-- Create Database
CREATE DATABASE HotelReservationSystem

-- Table schema for rooms
CREATE TABLE rooms (
    room_id INT PRIMARY KEY,
    room_number VARCHAR(10),
    room_type VARCHAR(50),
    rate DECIMAL(10, 2),
    capacity INT,
    status VARCHAR(20)
);

-- Table schema for guests
CREATE TABLE guests (
    guest_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100)
);

-- Table schema for reservations
CREATE TABLE reservations (
    reservation_id INT PRIMARY KEY,
    guest_id INT,
    room_id INT,
    check_in_date DATE,
    check_out_date DATE,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (guest_id) REFERENCES guests(guest_id),
    FOREIGN KEY (room_id) REFERENCES rooms(room_id)
);

-- Sample data for rooms
INSERT INTO rooms (room_id, room_number, room_type, rate, capacity, status) VALUES
(1, '101', 'Standard', 100.00, 2, 'Available'),
(2, '102', 'Deluxe', 150.00, 2, 'Available');

-- Sample data for guests
INSERT INTO guests (guest_id, first_name, last_name, email) VALUES
(1, 'Alice', 'Johnson', 'alice@example.com'),
(2, 'Bob', 'Smith', 'bob@example.com');

-- Sample data for reservations
INSERT INTO reservations (reservation_id, guest_id, room_id, check_in_date, check_out_date, total_amount) VALUES
(1, 1, 1, '2024-05-01', '2024-05-05', 400.00),
(2, 2, 2, '2024-06-01', '2024-06-05', 600.00);

-- Sample SQL queries
-- Select all available rooms for a given date range
SELECT *
FROM rooms
WHERE status = 'Available';

-- Select total revenue for a given month
SELECT SUM(total_amount) AS total_revenue
FROM reservations
WHERE MONTH(check_in_date) = 5;
