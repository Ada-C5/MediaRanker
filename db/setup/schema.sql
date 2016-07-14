DROP TABLE IF EXISTS movies;
CREATE TABLE movies(
  id serial PRIMARY KEY,
  title text,
  overview text,
  director text,
  upvotes int
);

DROP TABLE IF EXISTS books;
CREATE TABLE books(
  id serial PRIMARY KEY,
  title text,
  overview text,
  author text,
  upvotes int
);

DROP TABLE IF EXISTS albums;
CREATE TABLE albums(
  id serial PRIMARY KEY,
  title text,
  artist text,
  overview text,
  upvotes int
);