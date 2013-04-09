##Creation d un compte et attibution du compte à Mr.MACHUT
INSERT INTO compte(com_numero, com_solde, com_dateCreation, com_idTypeCpt)
 VALUES('9679098764565',1000, current_date, (SELECT typeC_id FROM typeCompte WHERE typeC_libelle='COURANT'));
INSERT INTO posseder1(pos1_idcli,pos1_comNum)
 VALUES((SELECT cli_id FROM client WHERE cli_nom='MACHUT'),'9679098764565');

 ##Creation de 2 comptes et attibution des comptes à Mr.SOUAN
 INSERT INTO compte(com_numero, com_solde, com_dateCreation, com_idTypeCpt)
 VALUES('0639498564261',50, current_date, (SELECT typeC_id FROM typeCompte WHERE typeC_libelle='COURANT'));
INSERT INTO posseder1(pos1_idcli,pos1_comNum)
 VALUES((SELECT cli_id FROM client WHERE cli_nom='SOUAN'),'0639498564261');

 INSERT INTO compte(com_numero, com_solde, com_dateCreation, com_idTypeCpt)
 VALUES('0145368534041',400, current_date, (SELECT typeC_id FROM typeCompte WHERE typeC_libelle='COURANT'));
INSERT INTO posseder1(pos1_idcli,pos1_comNum)
 VALUES((SELECT cli_id FROM client WHERE cli_nom='SOUAN'),'0145368534041');

<!--Vérifie si le client existe dans la base de donnée -->
SELECT * FROM client WHERE cli_nom = "MACHUT" AND cli_prenom = "NICOLAS";


##Affiche le détail des comptes du client en fonction de son nom et prénom
SELECT * FROM compte WHERE com_numero IN (SELECT pos1_comNum FROM posseder1 WHERE pos1_idcli = (SELECT cli_id FROM client WHERE cli_nom = "MACHUT" AND cli_prenom = "NICOLAS"));


##Affiche les moyens de paiement d1 compte en fonction du numero de compte
SELECT moy_libelle 
FROM moyenPaiement 
INNER JOIN posseder2 ON pos2_moyId = moyenPaiement.moy_id 
INNER JOIN compte ON compte.com_numero=pos2_comNum
WHERE com_numero = 0145368534041;

##Vérification si découvert ou pas en fonction du numero de compte
SELECT com_solde FROM compte WHERE com_numero = 0145368534041;

##Affichage du decouvert autorisé en fonction du nemero de compte
SELECT com_decouvertAutorise FROM compte WHERE com_numero = 0145368534041;

##Ajout d une operation
INSERT INTO operation(ope_date, ope_montant, ope_recu, ope_idMoy, ope_idCat, ope_idType)
VALUES('2012/09/11','120.00', '', '0', '0', '6');
INSERT INTO effectue(eff_comNum, eff_opId)
VALUES('6457934526', 2);


##Affichage de l historique des opérations en fonction du numero de compte


##Création d une opération, ope_recu ??????????
Le compte a créditer ou débiter ??????
INSERT INTO operations (ope_date, ope_montant, ope_idMoy, ope_idCat, ope_idType)
VALUES("2013/04/01", "150.00", 1, );




