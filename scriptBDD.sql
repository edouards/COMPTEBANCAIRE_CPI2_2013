CREATE DATABASE if not exists COMPTEBANCAIRE;
 
USE COMPTEBANCAIRE;

CREATE TABLE client(
 cli_id INT NOT NULL auto_increment PRIMARY KEY,
 cli_nom VARCHAR(25) NOT NULL,
 cli_prenom VARCHAR(25) NOT NULL
 );
 
CREATE TABLE compte(
com_numero INT NOT NULL PRIMARY KEY auto_increment,
com_solde FLOAT NOT NULL, 
com_dateCreation DATE NOT NULL,
com_idTypeCpt INT,
FOREIGN KEY FK_CPT_TYPECPT(com_idTypeCpt) REFERENCES typeCompte(typeC_id)
);

CREATE TABLE moyenPaiement(
moy_id INT NOT NULL PRIMARY KEY auto_increment,
moy_libelle VARCHAR(25) NOT NULL
);

CREATE TABLE posseder1(
pos1_id INT NOT NULL PRIMARY KEY auto_increment,
pos1_idcli INT,
pos1_comNum INT,
FOREIGN KEY FK_POS1_CLI(pos1_idCli) REFERENCES client(cli_id),
FOREIGN KEY FK_POS1_com(pos1_comNum) REFERENCES compte(com_numero)
);

CREATE TABLE posseder2(
pos2_id INT NOT NULL PRIMARY KEY auto_increment,
pos2_moyId INT NOT NULL,
pos2_comNum INT NOT NULL,
FOREIGN KEY FK_POS2_MOY(pos2_moyId) REFERENCES moyenPaiement(moy_id),
FOREIGN KEY FK_POS2_com(pos2_comNum) REFERENCES compte(com_numero)
);

CREATE TABLE operation(
ope_id INT NOT NULL PRIMARY KEY auto_increment,
ope_date DATE NOT NULL,
ope_montant FLOAT NOT NULL,
ope_recu VARCHAR(5),
ope_idMoy INT,
ope_idCat INT,
ope_idType INT,
FOREIGN KEY FK_OP_MOY(ope_idMoy) REFERENCES moyenPaiement(moy_id),
FOREIGN KEY FK_OP_CAT(ope_idCat) REFERENCES categorieOperation(cat_id),
FOREIGN KEY FK_OP_TYPEOP(ope_idType) REFERENCES typeOperation(typeO_id)
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

CREATE TABLE typeRecurrence(
typeR_id INT NOT NULL PRIMARY KEY auto_increment,
typeR_libelle VARCHAR NOT NULL, 
typeR_dateRecurence DATE NOT NULL
);

test
