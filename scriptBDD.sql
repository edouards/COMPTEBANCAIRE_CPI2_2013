 //Création de la base
 CREATE DATABASE COMPTEBANCAIRE;
 
 USE COMPTEBANCAIRE;
 
 //Création des tables
 CREATE TABLE client(
 cli_id INT NOT NULL auto_increment PRIMARY KEY,
 cli_nom VARCHAR(25) NOT NULL,
 cli_prenom VARCHAR(25) NOT NULL
 );
 
CREATE TABLE compte(
com_numero INT NOT NULL PRIMARY KEY auto_increment,
com_solde FLOAT NOT NULL, 
com_dateCreation DATE NOT NULL
);

CREATE TABLE moyenPaiement(
moy_id INT NOT NULL PRIMARY KEY auto_increment,
moy_libelle VARCHAR(25) NOT NULL
);

CREATE TABLE possede2(
poss2_moyId INT NOT NULL,
poss2_numeroCompte INT NOT NULL
FOREIGN KEY ('poss2_moyId') REFERENCES 'moyenPaiement' ('moy_id'),
FOREIGN KEY ('poss2_numeroCompte') REFERENCES 'Compte' ('com_numero')
);
