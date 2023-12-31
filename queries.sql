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

-- queries for multiple tables
SELECT a.name FROM animals a JOIN owners o ON a.owner_id = o.id WHERE o.full_name='Melody Pond';
SELECT a.name FROM animals a JOIN species s ON a.species_id = s.id where s.name='Pokemon';
SELECT o.full_name AS owner, a.name AS animal_name from owners o LEFT JOIN animals a ON o.id = a.owner_id;
SELECT s.name, count(a.id) AS animal_count FROM animals a JOIN species s on a.species_id = s.id GROUP BY s.name;
SELECT a.name from animals a JOIN species s ON a.species_id = s.id JOIN owners o ON a.owner_id = o.id WHERE s.name = 'Digimon' AND o.full_name = 'Jennifer Orwell';
SELECT a.name FROM animals a JOIN owners o ON a.owner_id = o.id WHERE o.full_name = 'Dean Winchester' AND a.escape_attempts = 0;
SELECT o.full_name AS owner_name, count(a.id) FROM owners o JOIN animals a ON o.id = a.owner_id GROUP BY o.full_name ORDER BY count(a.id) DESC;


-- queries for "vists"
SELECT a.name FROM animals a JOIN visits v ON v.animal_id = a.id JOIN vets ve ON ve.id = v.vet_id WHERE ve.name = 'William Tatcher' ORDER BY v.date_of_visit DESC;
SELECT count(v.animal_id) FROM visits v JOIN vets ve ON ve.id = v.vet_id WHERE ve.name = 'Stephanie Mendez';
SELECT ve.name, s.name from vets ve LEFT JOIN specializations spe ON spe.vets_id = ve.id LEFT JOIN species s ON s.id = spe.specie_id;
SELECT a.name, v.date_of_visit FROM animals a JOIN visits v ON v.animal_id = a.id JOIN vets ve ON ve.id = v.vet_id WHERE ve.name = 'Stephanie Mendez' AND v.date_of_visit BETWEEN '04-01-2020' AND '08-30-2020';
SELECT a.name, count(v.id) AS visit FROM animals a JOIN visits v ON v.animal_id = a.id GROUP BY a.name ORDER BY count(v.id) DESC;
SELECT a.name FROM animals a JOIN visits v ON v.animal_id = a.id JOIN vets ve ON ve.id = v.vet_id WHERE ve.name = 'Maisy Smith' ORDER BY v.date_of_visit ASC;
SELECT a.name, ve.name, v.date_of_visit FROM animals a JOIN visits v ON v.animal_id = a.id JOIN vets ve ON ve.id = v.vet_id ORDER BY v.date_of_visit DESC;

SELECT count(v.id) from visits v
JOIN animals a ON v.animal_id = a.id
JOIN vets ve ON v.vet_id = ve.id
LEFT JOIN specializations spe ON spe.vets_id = ve.id AND spe.specie_id = a.species_id
WHERE spe.id IS NULL;

SELECT s.name FROM animals a
JOIN species s ON a.species_id = s.id
JOIN visits v ON v.animal_id = a.id
JOIN vets ve ON ve.id = v.vet_id
where ve.name = 'Maisy Smith'
GROUP BY s.name
ORDER BY count(a.id) DESC;