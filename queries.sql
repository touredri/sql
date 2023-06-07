/*Queries that provide answers to the questions from all projects.*/

select * from animals where name like '%mon';
select name from animals where date_of_birth between '2016-01-01' and '2019-01-01';
select name from animals where neutered= true and escape_attempts < 3;
select date_of_birth from animals where name= 'Agumon' or name= 'Pikachu';
select name, escape_attemps from animals where weight_kg > 10.5;
select * from animals where neutered= true;
select * from animals where name != 'Gabumon';
select * from animals where weight_kg between 10.3 and 17.4;

start transaction;
update animals set species = 'unspecified';
rollback;
start transaction;
update animals set species='digimon' where name like '%mon';
update animals set species = 'pokemon' where species = 'NULL';
commit,
start transaction;
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
