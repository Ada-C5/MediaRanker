DROP TABLE IF EXISTS movies;
CREATE TABLE movies(
  id serial PRIMARY KEY,
  name text,
  director text,
  description text,
  votes integer
);

DROP TABLE IF EXISTS albums;
CREATE TABLE albums(
  id serial PRIMARY KEY,
  name text,
  artist text,
  description text,
  votes integer
);

DROP TABLE IF EXISTS books;
CREATE TABLE books(
  id serial PRIMARY KEY,
  name text,
  author text,
  description text,
  votes integer
);
