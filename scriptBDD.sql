 //Cr�ation de la base
 CREATE DATABASE COMPTEBANCAIRE;
 
 USE COMPTEBANCAIRE;
 
 //Cr�ation des tables
 CREATE TABLE client(
 cli_id INT NOT NULL auto_increment PRIMARY KEY,
 cli_nom VARCHAR[25] NOT NULL,
 cli_prenom VARCHAR[25] NOT NULL
 );
 