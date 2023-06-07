/* Populate database with sample data. */

-- Insert Agumon
INSERT INTO animals (name, date_of_birth, escape_attempt, neutered, weight_kg) VALUES ('Agumon', '2020-02-03', 0, true, 10.23);

-- Insert Gabumon
INSERT INTO animals (name, date_of_birth, escape_attempt, neutered, weight_kg) VALUES ('Gabumon', '2018-11-15', 2, true, 8);

-- Insert Pikachu
INSERT INTO animals (name, date_of_birth, escape_attempt, neutered, weight_kg) VALUES ('Pikachu', '2021-01-07', 1, false, 15.04);

-- Insert Devimon
INSERT INTO animals (name, date_of_birth, escape_attempt, neutered, weight_kg) VALUES ('Devimon', '2017-05-12', 5, true, 11);

-- Insert Charmander
INSERT INTO animals (name, date_of_birth, escape_attempt, neutered, weight_kg, species) VALUES ('Charmander', '2020-02-08', 0, false, -11, 'Unknown');

-- Insert Plantmon
INSERT INTO animals (name, date_of_birth, escape_attempt, neutered, weight_kg, species) VALUES ('Plantmon', '2021-11-15', 2, true, -5.7, 'Unknown');

-- Insert Squirtle
INSERT INTO animals (name, date_of_birth, escape_attempt, neutered, weight_kg, species) VALUES ('Squirtle', '1993-04-02', 3, false, -12.13, 'Unknown');

-- Insert Angemon
INSERT INTO animals (name, date_of_birth, escape_attempt, neutered, weight_kg, species) VALUES ('Angemon', '2005-06-12', 1, true, -45, 'Unknown');

-- Insert Boarmon
INSERT INTO animals (name, date_of_birth, escape_attempt, neutered, weight_kg, species) VALUES ('Boarmon', '2005-06-07', 7, true, 20.4, 'Unknown');

-- Insert Blossom
INSERT INTO animals (name, date_of_birth, escape_attempt, neutered, weight_kg, species) VALUES ('Blossom', '1998-10-13', 3, true, 17, 'Unknown');

-- Insert Ditto
INSERT INTO animals (name, date_of_birth, escape_attempt, neutered, weight_kg, species) VALUES ('Ditto', '2022-05-14', 4, true, 22, 'Unknown');

INSERT INTO owners (full_name, age) VALUES ('Sam Smith', 34);
INSERT INTO owners (full_name, age) VALUES ('Jennifer Orwell', 19);
INSERT INTO owners (full_name, age) VALUES ('Bob', 45);
INSERT INTO owners (full_name, age) VALUES ('Melody Pond', 77);
INSERT INTO owners (full_name, age) VALUES ('Dean Winchester', 14);
INSERT INTO owners (full_name, age) VALUES ('Jodie Whittaker', 38);
INSERT INTO species (name) VALUES ('Pokemon');
INSERT INTO species (name) VALUES ('Digimon');

-- Inserting data into the animals table
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES
    ('Pikachu', '2022-01-01', 0, FALSE, 3.5),
    ('Agumon', '2021-03-15', 2, TRUE, 4.2),
    ('Charmander', '2023-05-10', 1, FALSE, 2.1),
    ('Gatomon', '2020-11-20', 0, TRUE, 2.8);

-- Updating the species_id based on the name
UPDATE animals
SET species_id = (
    CASE
        WHEN name LIKE '%mon' THEN (SELECT id FROM species WHERE name = 'Digimon')
        ELSE (SELECT id FROM species WHERE name = 'Pokemon')
    END
);

-- Inserting data into the animals table
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES
    ('Pikachu', '2022-01-01', 0, FALSE, 3.5),
    ('Agumon', '2021-03-15', 2, TRUE, 4.2),
    ('Charmander', '2023-05-10', 1, FALSE, 2.1),
    ('Gatomon', '2020-11-20', 0, TRUE, 2.8);

-- Updating the owner_id based on the owner names
UPDATE animals
SET owner_id = (
    CASE
        WHEN name = 'Agumon' THEN (SELECT id FROM owners WHERE name = 'Sam Smith')
        WHEN name IN ('Gabumon', 'Pikachu') THEN (SELECT id FROM owners WHERE name = 'Jennifer Orwell')
        WHEN name IN ('Devimon', 'Plantmon') THEN (SELECT id FROM owners WHERE name = 'Bob')
        WHEN name IN ('Charmander', 'Squirtle', 'Blossom') THEN (SELECT id FROM owners WHERE name = 'Melody Pond')
        WHEN name IN ('Angemon', 'Boarmon') THEN (SELECT id FROM owners WHERE name = 'Dean Winchester')
    END
);

-- Insert data for Vet William Tatcher
INSERT INTO vets (name, age, date_of_graduation)
VALUES ('William Tatcher', 45, '2000-04-23');

-- Insert data for Vet Maisy Smith
INSERT INTO vets (name, age, date_of_graduation)
VALUES ('Maisy Smith', 26, '2019-01-17');

-- Insert data for Vet Stephanie Mendez
INSERT INTO vets (name, age, date_of_graduation)
VALUES ('Stephanie Mendez', 64, '1981-05-04');

-- Insert data for Vet Jack Harkness
INSERT INTO vets (name, age, date_of_graduation)
VALUES ('Jack Harkness', 38, '2008-06-08');

-- Insert data for Vet William Tatcher
INSERT INTO specializations (vet_id, species_id)
SELECT v.id, s.id
FROM vets v
JOIN species s ON s.name = 'Pokemon'
WHERE v.name = 'William Tatcher';

-- Insert data for Vet Stephanie Mendez (Digimon)
INSERT INTO specializations (vet_id, species_id)
SELECT v.id, s.id
FROM vets v
JOIN species s ON s.name = 'Digimon'
WHERE v.name = 'Stephanie Mendez';

-- Insert data for Vet Stephanie Mendez (Pokemon)
INSERT INTO specializations (vet_id, species_id)
SELECT v.id, s.id
FROM vets v
JOIN species s ON s.name = 'Pokemon'
WHERE v.name = 'Stephanie Mendez';

-- Insert data for Vet Jack Harkness
INSERT INTO specializations (vet_id, species_id)
SELECT v.id, s.id
FROM vets v
JOIN species s ON s.name = 'Digimon'
WHERE v.name = 'Jack Harkness';

-- Plantmon visited Maisy Smith on Apr 7th, 2021
INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
    (SELECT id FROM animals WHERE name = 'Plantmon' LIMIT 1),
    (SELECT id FROM vets WHERE name = 'Maisy Smith' LIMIT 1),
    '2021-04-07'
);

-- Squirtle visited Stephanie Mendez on Sep 29th, 2019
INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
    (SELECT id FROM animals WHERE name = 'Squirtle' LIMIT 1),
    (SELECT id FROM vets WHERE name = 'Stephanie Mendez' LIMIT 1),
    '2019-09-29'
);

-- Angemon visited Jack Harkness on Oct 3rd, 2020
INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
    (SELECT id FROM animals WHERE name = 'Angemon' LIMIT 1),
    (SELECT id FROM vets WHERE name = 'Jack Harkness' LIMIT 1),
    '2020-10-03'
);

-- Angemon visited Jack Harkness on Nov 4th, 2020
INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
    (SELECT id FROM animals WHERE name = 'Angemon' LIMIT 1),
    (SELECT id FROM vets WHERE name = 'Jack Harkness' LIMIT 1),
    '2020-11-04'
);

-- Boarmon visited Maisy Smith on Jan 24th, 2019
INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
    (SELECT id FROM animals WHERE name = 'Boarmon' LIMIT 1),
    (SELECT id FROM vets WHERE name = 'Maisy Smith' LIMIT 1),
    '2019-01-24'
);

-- Boarmon visited Maisy Smith on May 15th, 2019
INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
    (SELECT id FROM animals WHERE name = 'Boarmon' LIMIT 1),
    (SELECT id FROM vets WHERE name = 'Maisy Smith' LIMIT 1),
    '2019-05-15'
);

-- Boarmon visited Maisy Smith on Feb 27th, 2020
INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
    (SELECT id FROM animals WHERE name = 'Boarmon' LIMIT 1),
    (SELECT id FROM vets WHERE name = 'Maisy Smith' LIMIT 1),
    '2020-02-27'
);

-- Boarmon visited Maisy Smith on Aug 3rd, 2020
INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
    (SELECT id FROM animals WHERE name = 'Boarmon' LIMIT 1),
    (SELECT id FROM vets WHERE name = 'Maisy Smith' LIMIT 1),
    '2020-08-03'
);

-- Blossom visited Stephanie Mendez on May 24th, 2020
INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
    (SELECT id FROM animals WHERE name = 'Blossom' LIMIT 1),
    (SELECT id FROM vets WHERE name = 'Stephanie Mendez' LIMIT 1),
    '2020-05-24'
);

-- Blossom visited William Tatcher on Jan 11th, 2021
INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
    (SELECT id FROM animals WHERE name = 'Blossom' LIMIT 1),
    (SELECT id FROM vets WHERE name = 'William Tatcher' LIMIT 1),
    '2021-01-11'
);

