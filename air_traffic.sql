-- from the terminal run:
-- psql < air_traffic.sql
DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic 

CREATE TABLE countries (id SERIAL PRIMARY KEY, name TEXT NOT NULL);

CREATE TABLE airlines (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  abbreviation TEXT NOT NULL
);

CREATE TABLE cities (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  state TEXT,
  country_id INTEGER NOT NULL REFERENCES countries
);

CREATE TABLE airports (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  abbreviation TEXT NOT NULL,
  city_id INTEGER NOT NULL REFERENCES cities
);

CREATE TABLE flights (
  id SERIAL PRIMARY KEY,
  airline_id INTEGER NOT NULL REFERENCES airlines,
  departure_airport_id INTEGER NOT NULL REFERENCES cities,
  departure TIMESTAMP NOT NULL,
  arrival_airport_id INTEGER NOT NULL REFERENCES cities,
  arrival TIMESTAMP NOT NULL
);

CREATE TABLE passengers (
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  seat TEXT NOT NULL,
  flight_id INTEGER NOT NULL REFERENCES flights
);


INSERT INTO
  countries (name)
VALUES
  ('United States'),
  ('Japan'),
  ('Mexico');

INSERT INTO
  airlines (name, abbreviation)
VALUES
  ('United', 'UA'),
  ('American Airlines', 'AA'),
  ('Delta', 'DL'),
  ('Spirit', 'NK');

INSERT INTO
  cities (name, state, country_id)
VALUES
  ('Denver', 'Colorado', 1),
  ('Mexico City', 'Mexico', 3);
  
INSERT INTO
  cities (name, country_id)
VALUES
  ('Tokyo', 2);

INSERT INTO
  airports (name, abbreviation, city_id)
VALUES
  ('Denver International Airport', 'DEN', 1),
  ('Haneda Airport', 'HND', 3);

INSERT INTO
  flights (
    airline_id,
    departure_airport_id,
    departure,
    arrival_airport_id,
    arrival
  )
VALUES
  (
    1,
    1,
    '2018-12-22 09:42:00',
    3,
    '2018-12-22 23:42:00'
  ); 

INSERT INTO
  passengers(first_name, last_name, seat, flight_id)
VALUES
  ('Bobby', 'Smith', '14A', 1);