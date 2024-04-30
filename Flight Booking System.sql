-- Create Database
CREATE DATABASE FlightBookingSystem

-- Table schema for flights
CREATE TABLE flights (
    flight_id INT PRIMARY KEY,
    flight_number VARCHAR(20),
    airline VARCHAR(100),
    departure_airport VARCHAR(50),
    arrival_airport VARCHAR(50),
    departure_date DATETIME,
    arrival_date DATETIME,
    price DECIMAL(10, 2)
)

-- Table schema for passengers
CREATE TABLE passengers (
    passenger_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100)
)

-- Table schema for bookings
CREATE TABLE bookings (
    booking_id INT PRIMARY KEY,
    flight_id INT,
    passenger_id INT,
    booking_date DATETIME,
    FOREIGN KEY (flight_id) REFERENCES flights(flight_id),
    FOREIGN KEY (passenger_id) REFERENCES passengers(passenger_id)
)

-- Sample data for flights
INSERT INTO flights (flight_id, flight_number, airline, departure_airport, arrival_airport, departure_date, arrival_date, price) VALUES
(1, 'AA123', 'American Airlines', 'JFK', 'LAX', '2024-05-01 08:00:00', '2024-05-01 12:00:00', 500.00),
(2, 'DL456', 'Delta Airlines', 'LAX', 'JFK', '2024-06-01 10:00:00', '2024-06-01 14:00:00', 600.00)

-- Sample data for passengers
INSERT INTO passengers (passenger_id, first_name, last_name, email) VALUES
(1, 'Alice', 'Johnson', 'alice@example.com'),
(2, 'Bob', 'Smith', 'bob@example.com')

-- Sample data for bookings
INSERT INTO bookings (booking_id, flight_id, passenger_id, booking_date) VALUES
(1, 1, 1, '2024-04-01 10:00:00'),
(2, 2, 2, '2024-04-15 12:00:00')

-- Sample SQL queries
-- Select all flights departing from a specific airport
SELECT *
FROM flights
WHERE departure_airport = 'JFK'

-- Select total revenue for a specific flight
SELECT flight_number, SUM(price) AS total_revenue
FROM flights f
JOIN bookings b ON f.flight_id = b.flight_id
WHERE f.flight_id = 1
