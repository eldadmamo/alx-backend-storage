-- SQL Script that creates a table named usersrequirements
-- 		columns: id, email, name and country
-- 		id is the primary key and auto increment
-- 		conuntry is enumeration of contries US, CO and TN 
-- 		if the table already exists
CREATE TABLE IF NOT EXISTS users (
	id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
	email VARCHAR(255) NOT NULL UNIQUE,
	name VARCHAR(255),
	country ENUM('US', 'CO', 'TN') DEFAULT 'US'
);
