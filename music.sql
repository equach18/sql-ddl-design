-- from the terminal run:
-- psql < music.sql
DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music 
CREATE TABLE artists (id SERIAL PRIMARY KEY, name TEXT NOT NULL);

CREATE TABLE producers (id SERIAL PRIMARY KEY, name TEXT NOT NULL);

CREATE TABLE albums (
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  release_date DATE NOT NULL,
  artist_id INTEGER NOT NULL REFERENCES artists
);

CREATE TABLE songs (
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL,
  artist_id INTEGER NOT NULL REFERENCES artists,
  artist2_id INTEGER REFERENCES artists,
  artist3_id INTEGER REFERENCES artists,
  album_id INTEGER NOT NULL REFERENCES albums,
  producer_id INTEGER NOT NULL REFERENCES producers, 
  producer2_id INTEGER REFERENCES producers
);

INSERT INTO artists 
  (name)
VALUES
  ('Destiny''s Child'),
  ('Avril Lavigne');

INSERT INTO producers 
  (name)
VALUES
  ('The Matrix'),
  ('Darkchild');

INSERT INTO albums (title, release_date, artist_id)
VALUES
  ('Let Go','05-14-2002', 2),
  ('The Writing''s on the Wall', '11-07-1999', 1);

INSERT INTO songs (
    title,
    duration_in_seconds,
    release_date,
    artist_id,
    album_id,
    producer_id
  )
VALUES
  ('Complicated', 244, '05-14-2002', 2, 1, 2),
  ('Say My Name', 240, '11-07-1999', 1, 2, 1);