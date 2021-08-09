/* count from actor
SELECT COUNT(*) FROM actor;

/* total SUM
SELECT SUM(net_worth_in_milions) FROM actor;

SELECT MIN(net_worth_in_milions) FROM actor;

SELECT MAX(net_worth_in_milions) FROM actor;

SELECT AVG(net_worth_in_milions) FROM actor;

/* grouped by gender
SELECT gender, COUNT(*) FROM actor GROUP BY gender;

/* grouped by gender and AVG (grouped with having
SELECT gender, AVG(net_worth_in_milions) FROM actor GROUP BY gender
HAVING AVG(net_worth_in_milions) >200;
