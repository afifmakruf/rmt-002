/*
=================================================
Graded Challenge 1

Nama  : Afif Makruf
Batch : CODA-RMT-002

Program ini dibuat untuk melakukan automatisasi pengolahan (cleaning) data text yang berguna untuk pemodelan model analisa sentimen.
=================================================
*/

-- Membuat DataBase Aflix
CREATE DATABASE aflix;

-- Membuat tabel movies_lists
CREATE TABLE movies_lists (
    id						VARCHAR(15)	PRIMARY KEY	NOT NULL,
    title					VARCHAR(255)NULL,
    type					VARCHAR(50)	NOT NULL,
    description				TEXT		NULL,
    release_year			INTEGER		NOT NULL,
    age_certification		TEXT		NULL,
    runtime					INTEGER		NOT NULL,
    genre					TEXT[]		NOT NULL,
    production_countries	TEXT[]		NOT NULL
);

-- Membuat table staging dan memasukkan data dari movies.csv
COPY movies_lists(id, title, type, description, release_year, age_certification, runtime, genre, production_countries)
FROM '/tmp/movies.csv'
DELIMITER ','
CSV HEADER;

-- Melihat isi tabel movies_lists
SELECT * FROM movies_lists;

