-- SQL Script that creates a table named users with the following 
-- 		columns: id, email name
-- 		id is the primary key auto increment
-- 		if the table already exist
CREATE TABLE IF NOT EXISTS users (
	id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
	email VARCHAR(255) NOT NULL UNIQUE,
	name VARCHAR(255)
);
