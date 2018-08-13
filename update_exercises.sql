-- Create a file called update_exercises.sql.

-- Write SELECT statements to output each of the following with a caption:
-- a. All albums in your table.
-- b. All albums released before 1980
-- c. All albums by Michael Jackson

-- After each SELECT add an UPDATE statement to:
-- a. Make all the albums 10 times more popular (sales * 10)
-- b. Move all the albums before 1980 back to the 1800s.
-- c. Change 'Michael Jackson' to 'Peter Jackson'

-- Add SELECT statements after each UPDATE so you can see the results of your handiwork --

-- ******************************************

SELECT record_name AS 'All albums in the table';
-- a. Makes all the albums 10 times more popular (sales * 10)
UPDATE albums
SET sales_in_millions = sales_in_millions * 10;
-- Shows all albums in the table after increase in popularity
SELECT * FROM albums\G


SELECT 'Shows all albums released before 1980' AS '''All albums before 1980''';
-- b.  Moves all the albums before 1980 back to the 1800s.
UPDATE albums
SET release_date = release_date - 100
WHERE release_date < 1980;
-- Shows all albums released before 1980 that were sent back in time
SELECT * FROM albums
WHERE release_date < 1980\G


SELECT 'Shows all albums by Michael Jackson' AS '''All albums by Michael Jackson''';
SELECT * FROM albums
WHERE artist = 'Michael Jackson'\G
-- -- -- c. Changes 'Michael Jackson' to 'Peter Jackson'
UPDATE albums
SET artist = 'Peter Jackson'
WHERE artist = 'Michael Jackson';
-- Shows all albums by Peter Jackson
SELECT * FROM albums
WHERE artist = 'Peter Jackson'\G