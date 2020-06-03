--PART 1
CREATE TABLE movie (
	movie_id SERIAL PRIMARY KEY,
  title TEXT,
  media_type_id INTEGER REFERENCES media_type(media_type_id)
);

INSERT INTO movie (title, media_type_id)
VALUES
('Gattaca', 3),
('Harry Potter', 3);

--PART 2
ALTER TABLE movie
ADD COLUMN genre_id INTEGER REFERENCES genre(genre_id);

UPDATE movie
SET genre_id = 20
WHERE movie_id = 1;

UPDATE movie
SET genre_id = 22
WHERE movie_id = 2;

--PART 3
SELECT *FROM movie
JOIN genre ON movie.genre_id = genre.genre_id;

SELECT title, name FROM movie
JOIN genre ON movie.genre_id = genre.genre_id;

--PART 4 
SELECT a.title, ar.name 
FROM album a 
JOIN artist ar ON a.artist_id = ar.artist_id;

--USING NESTED QUERIES/SUB-SELECTS -part 5
SELECT * FROM TRACK
WHERE genre_id IN (
	SELECT genre_id FROM genre
  WHERE name ='Jazz' OR name = 'Blues' 
);
--another way to write this, but not very efficient
-- SELECT * FROM track 
-- WHERE genre_id IN (2,6);

--SETTING VALUES TO NULL -part 6
UPDATE employee 
SET phone = NULL
WHERE employee_id = 1;

--QUERYING A NULL VALUE -part 7
SELECT * FROM customer
WHERE company IS NULL;

--GROUP BY -part 8
SELECT ar.artist_id, ar.name, COUNT(*) 
FROM artist ar
JOIN album a ON ar.artist_id = a.artist_id 
GROUP BY ar.artist_id;

--DISTINCT -part 9
SELECT DISTINCT country FROM customer;

--DELETE ROWS - part 10
SELECT * FROM customer 
WHERE fax IS NULL;
--this wont work since it has a foreign key
DELETE FROM customer 
WHERE fax IS NULL