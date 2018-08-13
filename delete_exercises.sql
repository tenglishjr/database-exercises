USE codeup_test_db;
-- Write SELECT statements for:

-- a. Albums released after 1991
SELECT * FROM albums
WHERE release_date > 1991\G
-- Deletes albums released after 1991
DELETE FROM albums
WHERE release_date > 1991;


-- b. Albums with the genre 'disco'
SELECT * FROM albums
WHERE genre = 'disco'\G
-- Deletes albums with the genre 'disco'
DELETE FROM albums
WHERE genre = 'disco';


-- c. Albums by 'Whitney Houston' (...or maybe an artist of your choice)
SELECT * FROM albums
WHERE artist = 'Pink Floyd'\G
-- Deletes albums by 'Whitney Houston' (...or maybe an artist of your choice)
DELETE FROM albums
WHERE artist = 'Pink Floyd';


-- Make sure to put appropriate captions before each SELECT.

-- Convert the SELECT statements to DELETE.

-- Use the MySQL command line client to make sure your records really were removed.