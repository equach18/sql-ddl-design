-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE stars 
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE galaxies 
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE moons 
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  galaxy_id INTEGER REFERENCES galaxies(id),
  orbiting_star_id INTEGER REFERENCES stars(id)
);

CREATE TABLE planetary_systems 
(
  id SERIAL PRIMARY KEY,
  planet_id INTEGER REFERENCES planets(id),
  moon_id INTEGER REFERENCES moons(id)
);



INSERT INTO stars 
  (name)
VALUES 
  ('The Sun'),
  ('Proxima Centauri'),
  ('Gliese 876');
  

INSERT INTO galaxies 
  (name)
VALUES 
  ('Milky Way');

INSERT INTO moons 
  (name)
VALUES 
  ('The Moon'),
  ('Phobos'),
  ('Deimos'),
  ('Naiad'),
  ('Thalassa'),
  ('Despina'),
  ('Galatea'),
  ('Larissa');

INSERT INTO planets 
  (name, orbital_period_in_years, galaxy_id, orbiting_star_id)
VALUES 
  ('Earth', 1.00, 1, 1),
  ('Mars', 1.88, 1, 1),
  ('Proxima Centauri b', 0.03, 1, 2);

INSERT INTO planetary_systems 
  (planet_id, moon_id)
VALUES 
  (1, 1),
  (2, 2),
  (2, 3);
  

