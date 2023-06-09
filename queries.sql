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


select a.name from animals a  
join visits v on a.id = v.animals_id 
join vets vt on v.vets_id = vt.id 
where vt.name = 'William Tatcher' 
order by v.visits_date desc limit 1;

SELECT COUNT(DISTINCT a.id) AS num_animals
    FROM animals a
    JOIN visits v ON a.id = v.animals_id
    JOIN vets vt ON v.vets_id = vt.id
    WHERE vt.name = 'Stephanie Mendez';

SELECT v.name, s.name
     FROM vets v
     LEFT JOIN specializations sp ON v.id = sp.vets_id
     LEFT JOIN species s ON sp.species_id = s.id;

SELECT a.name
    FROM animals a
    JOIN visits v ON a.id = v.animals_id
    JOIN vets vt ON v.vets_id = vt.id
    WHERE vt.name = 'Stephanie Mendez'
    AND v.visits_date BETWEEN '2020-04-01' AND '2020-08-30';


SELECT a.name
     FROM animals a
     JOIN visits v ON a.id = v.animals_id
     GROUP BY a.name
     ORDER BY COUNT(*) DESC
     LIMIT 1;

SELECT v.name
     FROM vets v
     JOIN visits vi ON v.id = vi.vets_id
     JOIN animals a ON vi.animals_id = a.id
     WHERE v.name = 'Maisy Smith'
     ORDER BY vi.visits_date ASC
     LIMIT 1;

SELECT a.name
     FROM vets v
     JOIN visits vi ON v.id = vi.vets_id
     JOIN animals a ON vi.animals_id = a.id
     WHERE v.name = 'Maisy Smith'
     ORDER BY vi.visits_date ASC
     LIMIT 1;

SELECT a.name AS animal_name, v.name AS vet_name, vi.visits_date
     FROM visits vi
     JOIN animals a ON vi.animals_id = a.id
     JOIN vets v ON vi.vets_id = v.id
     ORDER BY vi.visits_date DESC
     LIMIT 1;

SELECT COUNT(*) AS num_visits
     FROM visits v
     JOIN animals a ON v.animals_id = a.id
     JOIN vets vt ON v.vets_id = vt.id
     LEFT JOIN specializations sp ON vt.id = sp.vets_id AND a.species_id = sp.species_id
     WHERE sp.species_id IS NULL;

select a.name from animals a 
join visits v on a.id = v.animals_id 
join vets on vets.id = v.vets_id 
where vets.name = 'Maisy Smith' 
group by a.name order by count(*)  desc limit 1;




