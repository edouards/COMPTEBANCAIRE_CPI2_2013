CREATE DATABASE COMPTEBANCAIRE;
 
USE COMPTEBANCAIRE;

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

CREATE TABLE posseder1(
pos1_id INT NOT NULL PRIMARY KEY auto_increment,
pos1_idcli INT,
pos1_cptNum INT,
FOREIGN KEY FK_POS1_CLI(pos1_idCli) REFERENCES client(cli_id),
FOREIGN KEY FK_POS1_CPT(pos1_cptNum) REFERENCES compte(com_numero)
);

CREATE TABLE possede2(
poss2_moyId INT NOT NULL,
poss2_numeroCompte INT NOT NULL
);

CREATE TABLE operation(
ope_id INT NOT NULL PRIMARY KEY auto_increment,
ope_date DATE NOT NULL,
open_montant FLOAT NOT NULL
);

CREATE TABLE categorieOperation(
cat_id INT NOT NULL PRIMARY KEY auto_increment,
cat_libelle VARCHAR(25) NOT NULL
);

CREATE TABLE typeOperation(
typeO_id INT NOT NULL PRIMARY KEY auto_increment,
TypeO_libelle VARCHAR(25) NOT NULL
);

CREATE TABLE typeCompte(
typeC_id INT NOT NULL PRIMARY KEY auto_increment,
typeC_libelle VARCHAR(25) NOT NULL
);


