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
SELECT id, email FROM users

WHERE country = 'us'
AND id = 1
AND email LIKE 'h%'

ORDER BY id ASC


--@block
--faster read yet slower write 
-- at the cost of additional memory
CREATE INDEX email_index ON users(email);

--@block
CREATE TABLE Rooms(
    id INT AUTO_INCREMENT,
    street VARCHAR(255),
    owner_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (owner_id) REFERENCES users(id)
)


--@block
DROP TABLE rooms


--@block
INSERT INTO rooms(owner_id, street)
VALUES 
    (1, 'san diego sailboat'),
    (1, 'nantucket cottage'),
    (1, 'vail cabin'),
    (1, 'sf cardboard box');


--@block
SELECT 
    users.id AS user_id,
    rooms.id AS room_id,
    email,
    street
FROM users 
INNER JOIN rooms
ON rooms.owner_id = users.id;


--@block
CREATE TABLE Bookings(
    id INT AUTO_INCREMENT,
    guest_id INT NOT NULL,
    room_id INT NOT NULL,
    check_in DATETIME,
    PRIMARY KEY(id),
    FOREIGN KEY (guest_id) REFERENCES users(id),
    FOREIGN KEY (room_id) REFERENCES rooms(id)
);


--@block Rooms a user has Booked
SELECT 
    guest_id,
    street,
    check_in
FROM bookings
INNER JOIN rooms on rooms.owner_id = guest_id
WHERE guest_id = 1;


--@block
SELECT 
    email,
    guest_id,
    check_in,
    room_id
FROM bookings INNER JOIN users 
ON users.id = guest_id;