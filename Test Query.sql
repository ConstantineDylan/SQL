--@block 
CREATE TABLE Users(
    id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(255) NOT NULL UNIQUE,
    bio TEXT,
    country VARCHAR(2)
);


--@block
INSERT INTO users(email, bio, country)
VALUES 
    ('hello@world.com', 'i love hotdogs!', 'us'),


--@block
INSERT INTO users(email, bio, country)
VALUES 
    ('halo@dunia.com', 'saya suka hotdog!', 'id'),
    ('konichiwa@sekai.com', 'hottodogu wa suki!', 'jp');

--@block
-- SELECT * FROM users;
SELECT email, id FROM Users

WHERE country = 'us'
AND id > 1
AND email LIKE 'h%'

ORDER BY id ASC
LIMIT 2;


--@block


--@block


--@block



