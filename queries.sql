/*Queries that provide answers to the questions from all projects.*/

select * from animals where name like '%mon';
select name from animals where date_of_birth between '2016-01-01' and '2019-01-01';
select name from animals where neutered= true and escape_attempts < 3;
select date_of_birth from animals where name= 'Agumon' or name= 'Pikachu';
select name, escape_attemps from animals where weight_kg > 10.5;
select * from animals where neutered= true;
select * from animals where name != 'Gabumon';
select * from animals where weight_kg between 10.3 and 17.4;
