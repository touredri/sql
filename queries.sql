/*Queries that provide answers to the questions from all projects.*/

select * from animals where name like '%mon';
select name from animals where date_of_birth between '2016-01-01' and '2019-01-01';
select name from animals where neutered= true and escape_attempts < 3;
select date_of_birth from animals where name= 'Agumon' or name= 'Pikachu';
select name, escape_attemps from animals where weight_kg > 10.5;
select * from animals where neutered= true;
select * from animals where name != 'Gabumon';
select * from animals where weight_kg between 10.3 and 17.4;

begin;
update animals set species = 'unspecified';
rollback;
begin;
update animals set species='digimon' where name like '%mon';
update animals set species = 'pokemon' where species = 'NULL';
commit,
begin;
delete from animals;
rollback;
start transaction;
delete from animals where date_of_birth > '2022-01-01';
savepoint sp1;
update animals set  weight_kg =  weight_kg*(-1);
rollback to sp1;
update animals set  weight_kg =  weight_kg*(-1) where  weight_kg < 0;
commit;
select count(*) from animals;
select * from animals where escape_attempts = 0;
select avg(weight_kg) from animals;
select avg(escape_attempts) as average_escapes from animals where date_of_birth between '1990-01-01' and '2000-01-01';

select name from animals inner join owners on animals.owners_id = owners.id
    where owners.full_name = 'Melody Pond';
select animals.name from animals inner join species on animals.species_id = species.id
    where species.name = 'Pokemon';
select * from animals a inner join species s on a.species_id = s.id where s.name = 'Pokemon';
select a.name, o.full_name from animals a right join owners o on a.owners_id = o.id;
select a.name, o.full_name from animals a inner join owners o on a.owners_id = o.id 
    where a.species_id = (select id from species where name = 'Digimon') and o.full_name = 'Jennifer Orwell';
select species_id, count(*) as count from animals group by species_id;
select name from animals inner join species on animals.species_id = species.id where species_id = owners_id;
select name from animals inner join owners  on animals.owners_id = owners.id  where animals.escape_attempts = 0;

SELECT o.full_name, COUNT(*) AS count
FROM owners o
JOIN animals a ON o.id = a.owner_id
GROUP BY o.full_name
ORDER BY count DESC
LIMIT 1;

SELECT animals.* FROM animals 
LEFT JOIN owners ON animals.owner_id = owners.id 
LEFT JOIN species ON animals.species_id = species.id 
WHERE owners.full_name = 'Jennifer Orwell' AND species.name = 'Digimon';


