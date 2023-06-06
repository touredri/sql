/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id int primary key not null auto_increment,
    name varchar(100),
    date_of_birth date,
    escape_attempts int(11),
    neutered boolean,
    weight_kg decimal
);
