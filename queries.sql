SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '01-01-2016' AND '12-31-2019';
SELECT name FROM animals WHERE neutered=true AND escape_attempts<3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon','Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg>10.5;
SELECT * FROM animals WHERE neutered=true;
SELECT * FROM animals WHERE NOT name='Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

-- adding "species" in animal table
BEGIN;
UPDATE animals SET species='unspecified';
SELECT * FROM animals;
ROLLBACK;

BEGIN;
UPDATE animals SET species='digimon' WHERE name LIKE '%mon';
UPDATE animals SET species='pokemon' WHERE species IS NULL;
COMMIT;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals;
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals WHERE date_of_birth > '01-01-2022';
SAVEPOINT savepoint_1;
UPDATE animals set weight_kg=weight_kg * -1;
SELECT * FROM animals;
ROLLBACK TO savepoint_1;
UPDATE animals SET weight_kg=weight_kg * -1 WHERE weight_kg < 0;
COMMIT;
SELECT * FROM animals;

SELECT count(*) FROM animals;
SELECT count(*) FROM animals WHERE escape_attempts=0;
SELECT avg(weight_kg) AS average_weight FROM animals;
SELECT neutered, max(escape_attempts) FROM animals GROUP BY neutered;
SELECT species, MAX(weight_kg) AS weight_max, MIN(weight_kg) AS weight_min FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) AS average_escapes FROM animals WHERE date_of_birth BETWEEN '01-01-1990' AND '12-31-2000' GROUP BY species;