-- Create Database
CREATE DATABASE SocialMediaPlatform

-- Table schema for users
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    username VARCHAR(50),
    email VARCHAR(100),
    date_joined DATE
);

-- Table schema for posts
CREATE TABLE posts (
    post_id INT PRIMARY KEY,
    user_id INT,
    content TEXT,
    post_date DATETIME,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Table schema for comments
CREATE TABLE comments (
    comment_id INT PRIMARY KEY,
    post_id INT,
    user_id INT,
    content TEXT,
    comment_date DATETIME,
    FOREIGN KEY (post_id) REFERENCES posts(post_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Sample data for users
INSERT INTO users (user_id, username, email, date_joined) VALUES
(1, 'alice', 'alice@example.com', '2024-04-01'),
(2, 'bob', 'bob@example.com', '2024-04-15');

-- Sample data for posts
INSERT INTO posts (post_id, user_id, content, post_date) VALUES
(1, 1, 'Hello world!', '2024-04-01 10:00:00'),
(2, 2, 'I love SQL!', '2024-04-15 12:00:00');

-- Sample data for comments
INSERT INTO comments (comment_id, post_id, user_id, content, comment_date) VALUES
(1, 1, 2, 'Nice post!', '2024-04-01 10:05:00'),
(2, 2, 1, 'Me too!', '2024-04-15 12:05:00');

-- Sample SQL queries
-- Select all posts with their comments
SELECT p.post_id, p.content AS post_content, u.username AS user_name, c.content AS comment_content
FROM posts p
JOIN users u ON p.user_id = u.user_id
LEFT JOIN comments c ON p.post_id = c.post_id;

-- Select all users and their post count
SELECT u.user_id, u.username, COUNT(p.post_id) AS post_count
FROM users u
LEFT JOIN posts p ON u.user_id = p.user_id
GROUP BY u.user_id, u.username;
