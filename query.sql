##Creation d un compte et attibution du compte � Mr.MACHUT
INSERT INTO compte(com_numero, com_solde, com_dateCreation, com_idTypeCpt)
 VALUES('9679098764565',1000, current_date, (SELECT typeC_id FROM typeCompte WHERE typeC_libelle='COURANT'));
INSERT INTO posseder1(pos1_idcli,pos1_comNum)
 VALUES((SELECT cli_id FROM client WHERE cli_nom='MACHUT'),'9679098764565');


 ##Creation de 2 comptes et attibution des comptes � Mr.SOUAN
 INSERT INTO compte(com_numero, com_solde, com_dateCreation, com_idTypeCpt)
 VALUES('0639498564261',50, current_date, (SELECT typeC_id FROM typeCompte WHERE typeC_libelle='COURANT'));
INSERT INTO posseder1(pos1_idcli,pos1_comNum)
 VALUES((SELECT cli_id FROM client WHERE cli_nom='SOUAN'),'0639498564261');

 INSERT INTO compte(com_numero, com_solde, com_dateCreation, com_idTypeCpt)
 VALUES('0145368534041',400, current_date, (SELECT typeC_id FROM typeCompte WHERE typeC_libelle='COURANT'));
INSERT INTO posseder1(pos1_idcli,pos1_comNum)
 VALUES((SELECT cli_id FROM client WHERE cli_nom='SOUAN'),'0145368534041');

 
##Attribution du/des moyens de paiement sur ce compte
INSERT INTO posseder2(pos2_moyId,pos2_comNum)
 VALUES((SELECT moy_id FROM moyenPaiement WHERE moy_libelle='CB'),
 (SELECT com_numero FROM compte INNER JOIN posseder1 ON com_numero=pos1_comNum INNER JOIN client ON cli_id=pos1_idcli WHERE cli_nom='MACHUT'));
 
INSERT INTO posseder2(pos2_moyId,pos2_comNum)
 VALUES((SELECT moy_id FROM moyenPaiement WHERE moy_libelle='CHEQUE'),
 (SELECT com_numero FROM compte INNER JOIN posseder1 ON com_numero=pos1_comNum INNER JOIN client ON cli_id=pos1_idcli WHERE cli_nom='MACHUT'));


##V�rifie si le client existe dans la base de donn�e
SELECT * FROM client WHERE cli_nom = "MACHUT" AND cli_prenom = "NICOLAS";


##Affiche le d�tail des comptes du client en fonction de son nom et pr�nom
SELECT * FROM compte WHERE com_numero IN (SELECT pos1_comNum FROM posseder1 WHERE pos1_idcli = (SELECT cli_id FROM client WHERE cli_nom = "MACHUT" AND cli_prenom = "NICOLAS"));


##Affiche les moyens de paiement d1 compte en fonction du numero de compte
SELECT moy_libelle 
FROM moyenPaiement 
INNER JOIN posseder2 ON pos2_moyId = moyenPaiement.moy_id 
INNER JOIN compte ON compte.com_numero=pos2_comNum
WHERE com_numero = 0145368534041;

##V�rification si d�couvert ou pas en fonction du numero de compte
SELECT com_solde FROM compte WHERE com_numero = 0145368534041;

##Affichage du decouvert autoris� en fonction du nemero de compte
SELECT com_decouvertAutorise FROM compte WHERE com_numero = 0145368534041;

##Affichage de l historique des op�rations en fonction du numero de compte


##Cr�ation d une op�ration




