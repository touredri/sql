/* Populate database with sample data. */
insert into animals values 
(1, 'Agumon', '2020-02-03', 0, true, 10.23),
(2, 'Gabumon', '2018-11-15', 2, true, 8.0),
(3, 'Pikachu', '2021-01-7', 1, false, 15.04),
(4, 'Devimon', '2017-05-12', 5, true, 11.0);
INSERT INTO animals VALUES
(5, 'Charmander', '2020-02-08', 0, false, -11, NULL),
(6, 'Plantmon', '2021-11-15', 2, true, -5.7, NULL),
(7, 'Squirtle', '1993-04-02', 3, false, -12.13, NULL),
(8, 'Angemon', '2005-06-12', 1, true, -45, NULL),
(9, 'Boarmon', '2005-06-07', 7, true, 20.4, NULL),
(10, 'Blossom', '1998-10-13', 3, true, 17, NULL),
(11, 'Ditto', '2022-05-14', 4, true, 22, NULL);

update animals set species_id = (select id from species where name = 'Digimon') where name like '%mon';
update animals set species_id = (select id from species where name = 'Pokemon') where name not like '%mon';

update animals set owners_id = (select id from owners where full_name = 'Sam Smith')  where name = 'Agumon';
update animals set owners_id = (select id from owners where full_name = 'Jennifer Orwell')  where name = 'Gabumon' or name = 'Pikachu';
update animals set owners_id = (select id from owners where full_name = 'Bob')  where name = 'Devimon' or name = 'Plantmon'; 
update animals set owners_id = (select id from owners where full_name = 'Melody Pond')  where name = 'Charmander' or name = 'Squirtle' or name= 'Blossom';
update animals set owners_id = (select id from owners where full_name = 'Dean Winchester')  where name = 'Angemon' or name = 'Boarmon';


insert into specializations values(
    -> (select id from vets where name = 'William Tatcher'),
    -> (select id from species where name = 'Pokemon'));

SERT INTO specializations (vets_id, species_id)
    -> VALUES (
    ->     (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
    ->     (SELECT id FROM species WHERE name = 'Digimon')
    -> );

INSERT INTO specializations (vets_id, species_id)
    -> VALUES (
    ->     (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
    ->     (SELECT id FROM species WHERE name = 'Pokemon')
    -> );

INSERT INTO specializations (vets_id, species_id)
    -> VALUES (
    ->     (SELECT id FROM vets WHERE name = 'Jack Harkness'),
    ->     (SELECT id FROM species WHERE name = 'Digimon')
    -> );

INSERT INTO visits (vets_id, visits_date, animals_id)
    -> VALUES (
    ->     (SELECT id FROM vets WHERE name = 'William Tatcher'),
    ->     '2020-05-24',
    ->     (SELECT id FROM animals WHERE name = 'Agumon')
    -> );

INSERT INTO visits (vets_id, visits_date, animals_id)
    -> VALUES (
    ->     (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
    ->     '2020-07-22',
    ->     (SELECT id FROM animals WHERE name = 'Agumon')
    -> );

INSERT INTO visits (vets_id, visits_date, animals_id)
    -> VALUES (
    ->     (SELECT id FROM vets WHERE name = 'Jack Harkness'),
    ->     '2021-02-02',
    ->     (SELECT id FROM animals WHERE name = 'Gabumon')
    -> );

INSERT INTO visits (vets_id, visits_date, animals_id)
    -> VALUES (
    ->     (SELECT id FROM vets WHERE name = 'Maisy Smith'),
    ->     '2020-01-05',
    ->     (SELECT id FROM animals WHERE name = 'Pikachu')
    -> );

INSERT INTO visits (vets_id, visits_date, animals_id)
    -> VALUES (
    ->     (SELECT id FROM vets WHERE name = 'Maisy Smith'),
    ->     '2020-03-08',
    ->     (SELECT id FROM animals WHERE name = 'Pikachu')
    -> );

INSERT INTO visits (vets_id, visits_date, animals_id)
    -> VALUES (
    ->     (SELECT id FROM vets WHERE name = 'Maisy Smith'),
    ->     '2020-05-14',
    ->     (SELECT id FROM animals WHERE name = 'Pikachu')
    -> );

INSERT INTO visits (vets_id, visits_date, animals_id)
    -> VALUES (
    ->     (SELECT id FROM vets WHERE name = 'Maisy Smith'),
    ->     '2020-05-14',
    ->     (SELECT id FROM animals WHERE name = 'Pikachu')
    -> );

INSERT INTO visits (vets_id, visits_date, animals_id)
    -> VALUES (
    ->     (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
    ->     '2021-05-04',
    ->     (SELECT id FROM animals WHERE name = 'Devimon')
    -> );

INSERT INTO visits (vets_id, visits_date, animals_id)
    -> VALUES (
    ->     (SELECT id FROM vets WHERE name = 'Jack Harkness'),
    ->     '2021-02-24',
    ->     (SELECT id FROM animals WHERE name = 'Charmander')
    -> );

INSERT INTO visits (vets_id, visits_date, animals_id)
    -> VALUES (
    ->     (SELECT id FROM vets WHERE name = 'Maisy Smith'),
    ->     '2019-12-21',
    ->     (SELECT id FROM animals WHERE name = 'Plantmon')
    -> );

INSERT INTO visits (vets_id, visits_date, animals_id)
    -> VALUES (
    ->     (SELECT id FROM vets WHERE name = 'William Tatcher'),
    ->     '2020-08-10',
    ->     (SELECT id FROM animals WHERE name = 'Plantmon')
    -> );

INSERT INTO visits (vets_id, visits_date, animals_id)
    -> VALUES (
    ->     (SELECT id FROM vets WHERE name = 'Maisy Smith'),
    ->     '2021-04-07',
    ->     (SELECT id FROM animals WHERE name = 'Plantmon')
    -> );

INSERT INTO visits (vets_id, visits_date, animals_id)
    -> VALUES (
    ->     (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
    ->     '2019-09-29',
    ->     (SELECT id FROM animals WHERE name = 'Squirtle')
    -> );

INSERT INTO visits (vets_id, visits_date, animals_id)
    -> VALUES (
    ->     (SELECT id FROM vets WHERE name = 'Jack Harkness'),
    ->     '2020-10-03',
    ->     (SELECT id FROM animals WHERE name = 'Angemon')
    -> );

INSERT INTO visits (vets_id, visits_date, animals_id)
    -> VALUES (
    ->     (SELECT id FROM vets WHERE name = 'Jack Harkness'),
    ->     '2020-11-04',
    ->     (SELECT id FROM animals WHERE name = 'Angemon')
    -> );

INSERT INTO visits (vets_id, visits_date, animals_id)
    -> VALUES (
    ->     (SELECT id FROM vets WHERE name = 'Maisy Smith'),
    ->     '2019-01-24',
    ->     (SELECT id FROM animals WHERE name = 'Boarmon')
    -> );

INSERT INTO visits (vets_id, visits_date, animals_id)
    -> VALUES (
    ->     (SELECT id FROM vets WHERE name = 'Maisy Smith'),
    ->     '2019-05-15',
    ->     (SELECT id FROM animals WHERE name = 'Boarmon')
    -> );

INSERT INTO visits (vets_id, visits_date, animals_id)
    -> VALUES (
    ->     (SELECT id FROM vets WHERE name = 'Maisy Smith'),
    ->     '2020-02-27',
    ->     (SELECT id FROM animals WHERE name = 'Boarmon')
    -> );
    
INSERT INTO visits (vets_id, visits_date, animals_id)
    -> VALUES (
    ->     (SELECT id FROM vets WHERE name = 'Maisy Smith'),
    ->     '2020-08-03',
    ->     (SELECT id FROM animals WHERE name = 'Boarmon')
    -> );

INSERT INTO visits (vets_id, visits_date, animals_id)
    -> VALUES (
    ->     (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
    ->     '2020-05-24',
    ->     (SELECT id FROM animals WHERE name = 'Blossom')
    -> );

MariaDB [vet_clinic]> INSERT INTO visits (vets_id, visits_date, animals_id)
    -> VALUES (
    ->     (SELECT id FROM vets WHERE name = 'William Tatcher'),
    ->     '2021-01-11',
    ->     (SELECT id FROM animals WHERE name = 'Blossom')
    -> );
















