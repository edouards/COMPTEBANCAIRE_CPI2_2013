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

CREATE TABLE posseder2(
pos2_id INT NOT NULL PRIMARY KEY auto_increment,
pos2_moyId INT NOT NULL,
pos2_cptNum INT NOT NULL,
FOREIGN KEY FK_POS2_MOY(pos2_moyId) REFERENCES moyenPaiement(moy_id),
FOREIGN KEY FK_POS2_CPT(pos2_cptNum) REFERENCES compte(com_numero)
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

CREATE TABLE effectue(
eff_id INT NOT NULL PRIMARY KEY auto_increment,
eff_comNum INT,
eff_opId INT,
FOREIGN KEY FK_EFF_COM(eff_comNum) REFERENCES compte(com_numero),
FOREIGN KEY FK_EFF_OP(eff_opId) REFERENCES operation(ope_id)
);

