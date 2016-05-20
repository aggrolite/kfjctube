CREATE TABLE airtime (
    airtime_id serial PRIMARY KEY,
    airtime_start TIMESTAMP NOT NULL,
    airtime_end TIMESTAMP,
);

CREATE TABLE song (
    song_id  serial PRIMARY KEY,
    song     text NOT NULL,
    artist_id int REFERENCES artist (artist_id)
    album_id int REFERENCES album (album_id)
    dj_id int REFERENCES dj (dj_id)
);

CREATE TABLE artist (
    artist_id serial PRIMARY KEY,
    artist     text NOT NULL,
);

CREATE TABLE album (
    album_id serial PRIMARY KEY,
    album text NOT NULL,
    label_id int REFERENCES label (label_id)
);

CREATE TABLE label (
    label_id serial PRIMARY KEY,
    label text NOT NULL
);

CREATE TABLE dj (
    dj_id serial PRIMARY KEY,
    dj text NOT NULL
)

-- FIXME
CREATE TABLE song_airtime (
    song_id    int REFERENCES song (song_id) ON UPDATE CASCADE ON DELETE CASCADE,
    airtime_id int REFERENCES airtime (airtime_id) ON UPDATE CASCADE,
, CONSTRAINT song_airtime_pkey PRIMARY KEY (song_id, airtime_id)
);
