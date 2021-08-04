/* return all data from actor table
SELECT * FROM actor;

/* return specific columns
SELECT first_name, last_name, date_of_birth FROM actor;

/* return sorted date
SELECT * FROM actor 
ORDER BY date_of_birth, net_worth_in_milions;

/* more complex queries
SELECT * FROM actor WHERE first_name > 'B' AND net_worth_in_milions > 200;

SELECT * FROM actor 
WHERE (first_name > 'B' AND first_name < 'J') OR last_name >= 'I';

SELECT * FROM actor 
WHERE net_worth_in_milions <> 200
ORDER BY last_name;

SELECT * FROM actor
WHERE id IN (2,3);

SELECT * FROM actor
OFFSET 1 LIMIT 2;

SELECT * FROM actor
WHERE first_name LIKE 'Jen%';

SELECT * FROM actor 
WHERE first_name LIKE '_enn%';

SELECT * FROM actor
WHERE date_of_birth >= DATE '1963-01-01' AND  date_of_birth <= DATE '1963-12-31';
