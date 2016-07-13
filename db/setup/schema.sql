DROP TABLE IF EXISTS movies;
CREATE TABLE movies(
  id serial PRIMARY KEY,
  title text,
  overview text,
  director text,
  upvote integer,
  ranking integer
);

DROP TABLE IF EXISTS books;
CREATE TABLE books(
  id serial PRIMARY KEY,
  title text,
  overview text,
  author text,
  upvote int,
  ranking int
);

DROP TABLE IF EXISTS albums;
CREATE TABLE albums(
  id serial PRIMARY KEY,
  title text,
  artist text,
  overview text,
  upvote int,
  ranking int
);