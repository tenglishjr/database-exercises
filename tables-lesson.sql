CREATE DATABASE IF NOT EXISTS tables_lesson_db;

-- MIGRATION: program that creates a database structure
--    = THIS FILE


USE tables_lesson_db;

DROP TABLE IF EXISTS flights;

CREATE TABLE flights(
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  desination CHAR(3) NOT NULL,     -- NOT NULL = can't be empty = required field
  departs_from CHAR(3) NOT NULL,   -- '3' indicates maximum length
  arrives_at DATETIME NOT NULL,
  departs_at DATETIME NOT NULL,
  price FLOAT DEFAULT 0.0,
  num_tickets_sold INT UNSIGNED NOT NULL,   -- UNSIGNED = no negative numbers
  gate_no VARCHAR(255) NOT NULL,   -- Useful for holding more characters than CHAR allows, but with a cap
  description TEXT,
  PRIMARY KEY(id)
);

-- SHOW TABLES;

-- DESCRIBE flights;

SHOW CREATE TABLE flights\G