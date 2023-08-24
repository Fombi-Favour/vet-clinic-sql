SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '01-01-2016' AND '12-31-2019';
SELECT name FROM animals WHERE neutered=true AND escape_attempts<=3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon','Pikachu');