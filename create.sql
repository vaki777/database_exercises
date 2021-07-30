/* create database movie_industry
CREATE DATABASE movie_industry;

/* cretae table actor
CREATE TABLE actor(
  id BIGSERIAL NOT NULL PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  date_of_birth DATE NOT NULL,
  gender VARCHAR(7) NOT NULL,
  marital_status VARCHAR(12) DEFAULT 'Unknown',
  net_worth_in_milions FLOAT4
  );
  
