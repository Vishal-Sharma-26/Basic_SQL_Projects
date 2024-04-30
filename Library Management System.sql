-- Create Database
CREATE DATABASE LibraryManagementSystem

-- Table schema for books
CREATE TABLE books (
    book_id INT PRIMARY KEY,
    title VARCHAR(255),
    author VARCHAR(255),
    isbn VARCHAR(20),
    genre VARCHAR(100)
);

-- Table schema for borrowers
CREATE TABLE borrowers (
    borrower_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100)
);

-- Table schema for loans
CREATE TABLE loans (
    loan_id INT PRIMARY KEY,
    book_id INT,
    borrower_id INT,
    loan_date DATE,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES books(book_id),
    FOREIGN KEY (borrower_id) REFERENCES borrowers(borrower_id)
);

-- Sample data for books
INSERT INTO books (book_id, title, author, isbn, genre) VALUES
(1, 'To Kill a Mockingbird', 'Harper Lee', '9780061120084', 'Fiction'),
(2, '1984', 'George Orwell', '9780451524935', 'Science Fiction');

-- Sample data for borrowers
INSERT INTO borrowers (borrower_id, name, email) VALUES
(1, 'Alice Johnson', 'alice@example.com'),
(2, 'Bob Smith', 'bob@example.com');

-- Sample data for loans
INSERT INTO loans (loan_id, book_id, borrower_id, loan_date, return_date) VALUES
(1, 1, 1, '2024-04-30', NULL),
(2, 2, 2, '2024-04-15', '2024-04-29');

-- Sample SQL queries
-- Select all books currently on loan
SELECT b.title, b.author, l.loan_date, l.return_date
FROM books b
JOIN loans l ON b.book_id = l.book_id
WHERE l.return_date IS NULL;

-- Select all overdue books
SELECT b.title, b.author, l.loan_date, l.return_date
FROM books b
JOIN loans l ON b.book_id = l.book_id
WHERE l.return_date IS NULL AND l.loan_date < CURDATE() - INTERVAL 14 DAY;
