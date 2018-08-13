-- Create a new file called select_exercises.sql.
-- Remember to USE the codeup_test_db.
USE codeup_test_db;

-- In select_exercises.sql write queries to find the following information. Before each item, output a caption explaining the results:


SELECT 'The name of all albums by Pink Floyd.' AS 'Pink Floyd Albums';
SELECT * FROM albums
WHERE artist = 'Pink Floyd'\G

SELECT 'The year Sgt. Pepper''s Lonely Hearts Club Band was released' AS 'Sgt. Pepper''s Release Date';
SELECT release_date FROM albums
WHERE record_name = 'Sgt. Pepper''s Lonely Hearts Club Band'\G

Select 'The genre for Nevermind' AS '''Nevermind'' Genre';
SELECT genre FROM albums
WHERE record_name = 'Nevermind'\G

SELECT 'Which albums were released in the 1990s' AS '90s Albums';
SELECT * FROM albums
WHERE release_date BETWEEN 1990 AND 1999\G

SELECT 'Which albums had less than 20 million certified sales' AS 'Less Popular Albums';
SELECT * FROM albums
WHERE sales_in_millions < 20\G

SELECT 'All the albums with a genre of "Rock".' AS 'Rock Albums';
SELECT * FROM albums
WHERE genre = 'Rock'\G

--   Why do these query results not include albums with a genre of "Hard rock" or "Progressive rock"?
-- ANSWER: values are case-sensitive