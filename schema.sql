CREATE TABLE animals (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL(10, 2)
);

-- adding "species" in animals table
ALTER TABLE animals ADD species VARCHAR(50);

-- creating owners table
CREATE TABLE owners (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(255),
    age INT
);

-- creating species table
CREATE TABLE species (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255)
);

-- editing the "animals" table
ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD species_id INT REFERENCES species(id);
ALTER TABLE animals ADD owner_id INT REFERENCES owners(id);

-- creating "vets" table
CREATE TABLE vets (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    date_of_graduation date
    age INT
);


-- creating join table: specializations
CREATE TABLE specializations (
    id SERIAL PRIMARY KEY,
    vets_id INT REFERENCES vets(id),
    specie_id INT REFERENCES species(id),
    UNIQUE(vets_id, specie_id)
);

-- creating join table: visits
CREATE TABLE visits (
    id SERIAL PRIMARY KEY,
    vet_id INT REFERENCES vets(id),
    animal_id INT REFERENCES animals(id),
    date_of_visit DATE,
    UNIQUE (vet_id, animal_id, date_of_visit)
);