Create table cities(
	id serial primary key,
	city varchar(30) not null,
	state varchar(30) not null,
	population int 
);

-- Insert data into the table
INSERT INTO cities (city, state, population)
VALUES ('Alameda', 'California', 79177),
  ('Mesa', 'Arizona', 496401),
  ('Boerne', 'Texas', 16056),
  ('Boerne', 'Texas', 16056),
  ('Anaheim', 'Texas', 352497),
  ('Tucson', 'Arizona', 535677),
  ('Garland', 'Texas', 238002);
  
  
  Select * from cities;
  
  SELECT city, state
FROM cities
WHERE upper(state) = 'TEXAS';


SELECT *
FROM cities
WHERE population < 100000;


SELECT *
FROM cities
WHERE population < 100000
AND state = 'California';


UPDATE cities
SET state = 'California'
WHERE city = 'Anaheim';

DELETE FROM cities
WHERE id = 4;
