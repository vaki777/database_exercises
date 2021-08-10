/* create database movie_industry
CREATE DATABASE movie_industry;

/* create table actor
CREATE TABLE actor(
  id BIGSERIAL NOT NULL PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  date_of_birth DATE NOT NULL,
  gender VARCHAR(7) NOT NULL,
  marital_status VARCHAR(12) DEFAULT 'Unknown',
  net_worth_in_milions FLOAT4
  );
  
  /* insert data into table actor
  INSERT INTO actor(first_name, last_name, date_of_birth, gender, marital_status, net_worth_in_milions)
  VALUES('Brad', 'Pit', DATE '1963-12-18', 'Male', 'single', 240.00);
  
  INSERT INTO actor(first_name, last_name, date_of_birth, gender, marital_status, net_worth_in_milions)
  VALUES('Jennifer', 'Aniston', DATE '1969-11-02', 'Female', 'single', 240.00);
  
  INSERT INTO actor(first_name, last_name, date_of_birth, gender, marital_status, net_worth_in_milions)
  VALUES('Angelina', 'Jolie', DATE '1975-06-04', 'Female', 'single', 100.00);
  
  INSERT INTO actor(first_name, last_name, date_of_birth, gender, marital_status, net_worth_in_milions)
  VALUES('Johnny', 'Depp', DATE '1963-06-09', 'Male', 'single', 200.00);
  
  INSERT INTO actor(first_name, last_name, date_of_birth, gender, marital_status, net_worth_in_milions)
  VALUES('Tom', 'Cruise', DATE '1962-07-03', 'Male', 'divorced', 570.00);
  
  INSERT INTO actor(first_name, last_name, date_of_birth, gender, marital_status, net_worth_in_milions)
  VALUES('Natalie', 'Portman', DATE '1981-06-09', 'Female', 'married', 60.00);
  
  INSERT INTO actor(first_name, last_name, date_of_birth, gender, marital_status, net_worth_in_milions)
  VALUES('John', 'Doe', DATE '2021-01-01', 'Male', 'single', 100.00);
  
