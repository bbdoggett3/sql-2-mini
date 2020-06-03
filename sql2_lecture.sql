-- NOTES LECTURE:
-- drop a column you don't need anymore
ALTER TABLE racers
DROP COLUMN team;

this is how to alter the data
ALTER TABLE racers
ALTER name 
TYPE VARCHAR(100);

renaming a column
ALTER TABLE racers
RENAME COLUMN country
TO "nation";

rename the alter table
ALTER TABLE racers
RENAME TO bike_racers;

FOREIGN KEYS
using a foreign key with the INTEGER REFERNECES
CREATE TABLE bikes (
	bike_id SERIAL PRIMARY KEY,
  racer_id INTEGER REFERENCES bike_racers(racer_id),
  type TEXT,
  color TEXT
);

INSERT INTO bikes (racer_id, type, color)
VALUES
(1, 'Meatball Machine', 'blue'),
(3, 'Chococycle', 'brown'),
(4, 'Regular', 'gray'),
(2, 'Fizzoli', 'red'),
(5, 'Fizzoli', 'green');

SELECT * FROM bike_racers
JOIN bikes ON bike_racers.racer_id = bikes.racer_id;

SELECT name, age, nation, type, color FROM bike_racers
JOIN bikes ON bike_racers.racer_id = bikes.racer_id
ORDER BY age;

Sub Query
SELECT * FROM bike_racers
WHERE racer_id IN (2, 5);
