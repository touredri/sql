/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id int  primary key auto_increment not null ,
    name varchar(100),
    date_of_birth date,
    escape_attempts int(11),
    neutered boolean,
    weight_kg decimal
);

alter table animals add species varchar(100);

CREATE TABLE owners (
    id int primary key auto_incrment not null ,
    full_name varchar(30),
    age int
    );
    
CREATE TABLE species (
    id int primary key  auto_incrment not null,
    name varchar(30)
    );  
    
alter table animals drop column species;
ALTER TABLE animals ADD COLUMN species_id INT,
    ADD FOREIGN KEY (species_id) REFERENCES species(id);    
ALTER TABLE animals ADD COLUMN owners_id INT,
    ADD FOREIGN KEY (owners_id) REFERENCES owners(id);
    
    
create table visits(vets_id int, foreign key (vets_id) references vets(id), 
                    visits_date date, animals_id int, foreign key (animals_id)  
                    references animals(id));    
    
    
CREATE TABLE specializations (
    ->     species_id INT,
    ->     vets_id INT,
    ->     FOREIGN KEY (species_id) REFERENCES species (id),
    ->     FOREIGN KEY (vets_id) REFERENCES vets (id)
    -> );    
    
    
    
    
    
    
    
    
    
    
