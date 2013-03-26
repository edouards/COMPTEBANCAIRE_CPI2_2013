 #Création de la base
 CREATE DATABASE COMPTEBANCAIRE;
 
 USE COMPTEBANCAIRE;
 
 #Création des tables
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
);

CREATE TABLE posseder1(
pos1_id INT NOT NULL PRIMARY KEY auto_increment,
pos1_idcli INT,
pos1_cptNum INT,
FOREIGN KEY FK_POS1_CLI(pos1_idCli) REFERENCES client(cli_id),
FOREIGN KEY FK_POS1_CPT(pos1_cptNum) REFERENCES compte(com_numero)
);
