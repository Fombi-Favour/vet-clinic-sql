INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (1, 'Agumon', '02-03-2020', 0, true, 10.23);
INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (2, 'Gabumon', '11-15-2018', 2, true, 8);
INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (3, 'Pikachu', '07-01-2021', 1, false, 15.04);
INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (4, 'Devimon', '12-05-2017', 5, true, 11);

-- adding "species" in animal table
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Charmander', '02-08-2020', 0, false, -11);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Plantmon', '11-15-2021', 2, true, -5.7);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Squirtle', '04-02-1993', 3, false, -12.13);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Angemon', '06-12-2005', 1, true, -45);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Boarmon', '06-07-2005', 7, true, 20.4);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Blossom', '10-13-1998', 3, true, 17);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Ditto', '05-14-2022', 4, true, 22);

-- inserting data in "owners" table
INSERT INTO owners (full_name, age) VALUES('Sam Smith', 34);
INSERT INTO owners (full_name, age) VALUES('Jennifer Orwell', 19);
INSERT INTO owners (full_name, age) VALUES('Bob', 45);
INSERT INTO owners (full_name, age) VALUES('Melody Pond', 77);
INSERT INTO owners (full_name, age) VALUES('Dean Winchester', 14);
INSERT INTO owners (full_name, age) VALUES('Jodie Whittaker', 38);

-- inserting data in "species" table
INSERT INTO species (name) VALUES('Pokemon');
INSERT INTO species (name) VALUES('Digimon');

-- updating data in "animals" table
UPDATE animals SET species_id=2 WHERE name LIKE '%mon';
UPDATE animals SET species_id=1 WHERE species_id IS NULL;

UPDATE animals SET owner_id=(SELECT id from owners WHERE full_name='Sam Smith') WHERE name='Agumon';
UPDATE animals SET owner_id=(SELECT id from owners WHERE full_name='Jennifer Orwell') WHERE name IN ('Gabumon', 'Pikachu');
UPDATE animals SET owner_id=(SELECT id from owners WHERE full_name='Bob') WHERE name IN ('Devimon', 'Plantmon');
UPDATE animals SET owner_id=(SELECT id from owners WHERE full_name='Melody Pond') WHERE name IN ('Charmander', 'Squirtle', 'Blossom');
UPDATE animals SET owner_id=(SELECT id from owners WHERE full_name='Dean Winchester') WHERE name IN ('Angemon', 'Boarmon');