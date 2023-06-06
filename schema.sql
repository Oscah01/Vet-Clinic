/* Database schema to keep the structure of entire database. */

-- Drop the existing table if it exists
DROP TABLE IF EXISTS animals;

-- Create the modified animals table
CREATE TABLE animals (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    date_of_birth DATE NOT NULL,
    escape_attempts INTEGER DEFAULT 0,
    neutered BOOLEAN DEFAULT FALSE,
    weight_kg DECIMAL(5,2) NOT NULL,
    species_id INTEGER,
    owner_id INTEGER,
    FOREIGN KEY (species_id) REFERENCES species (id),
    FOREIGN KEY (owner_id) REFERENCES owners (id)
);

ALTER TABLE animals ADD COLUMN species VARCHAR(255);

CREATE TABLE owners (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  full_name VARCHAR(255),
  age INTEGER
);

CREATE TABLE species (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name VARCHAR(255)
);

