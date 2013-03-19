 //Création de la base
 CREATE DATABASE COMPTEBANCAIRE;
 
 USE COMPTEBANCAIRE;
 
 //Création des tables
 CREATE TABLE client(
 cli_id INT NOT NULL auto_increment PRIMARY KEY,
 cli_nom VARCHAR[25] NOT NULL,
 cli_prenom VARCHAR[25] NOT NULL
 );
 
CREATE TABLE compte(
com_numero INT NOT NULL PRIMARY KEY auto_increment,
com_solde FLOAT NOT NOT NULL, 
com_dateCreation DATE NOT NULL
);
