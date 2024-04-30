--Create Database
CREATE DATABASE StudentInformationSystem

-- Table schema for students
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    email VARCHAR(100)
);

-- Table schema for courses
CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    credit_hours INT
);

-- Table schema for enrollments
CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- Sample data for students
INSERT INTO students (student_id, first_name, last_name, date_of_birth, email) VALUES
(1, 'Alice', 'Johnson', '2000-01-01', 'alice@example.com'),
(2, 'Bob', 'Smith', '2000-02-01', 'bob@example.com');

-- Sample data for courses
INSERT INTO courses (course_id, course_name, credit_hours) VALUES
(1, 'Introduction to SQL', 3),
(2, 'Database Management', 4);

-- Sample data for enrollments
INSERT INTO enrollments (enrollment_id, student_id, course_id, enrollment_date) VALUES
(1, 1, 1, '2024-04-01'),
(2, 2, 2, '2024-04-15');

-- Sample SQL queries
-- Select all students enrolled in a specific course
SELECT s.first_name, s.last_name, c.course_name
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id
WHERE c.course_name = 'Introduction to SQL';

-- Select total credit hours for a student
SELECT s.first_name, s.last_name, SUM(c.credit_hours) AS total_credit_hours
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id
WHERE s.student_id = 1;
