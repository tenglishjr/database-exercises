-- Create a new file named albums_migration.sql.
--
-- You'll notice that IntelliJ gives us a message that says something like "No data sources are configured to run this SQL script." We will configure IntelliJ to be more integrated with our database in a coming lesson, for now, you can ignore this message.
--
-- The first command your albums_migration.sql will need is:
USE codeup_test_db;
-- Write some SQL to drop a table named albums if it exists.
DROP TABLE IF EXISTS albums;
-- Create an albums table with the following columns:
CREATE TABLE albums (
-- id — auto incrementing unsigned integer primary key
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
-- artist — string for storing the recording artist name
  artist VARCHAR(255) NOT NULL,
-- name — string for storing a record name
  record_name VARCHAR(255) NOT NULL,
-- release_date — integer representing year record was released
  release_date INT(4) UNSIGNED NOT NULL,
-- sales — floating point value for number of records sold (in millions)
  sales_in_millions FLOAT UNSIGNED NOT NULL,
-- genre — string for storing the record's genre(s)
  genre VARCHAR(255),
  PRIMARY KEY(id)
);


-- Open a terminal, and run the script as codeup_test_user with the following command:
-- mysql -u codeup_test_user -p < albums_migration.sql


-- After running the script, connect to the MySQL server as you have done previously.


-- USE the codeup_test_db and use DESCRIBE and SHOW CREATE to verify that your albums table has been successfully created.