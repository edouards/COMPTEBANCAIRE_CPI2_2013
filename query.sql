##Creation d un compte et attibution du compte à Mr.MACHUT
INSERT INTO compte(com_numero, com_solde, com_dateCreation, com_idTypeCpt)
 VALUES('9679098764565',1000, current_date, (SELECT typeC_id FROM typeCompte WHERE typeC_libelle='COURANT'));
INSERT INTO posseder1(pos1_idcli,pos1_comNum)
 VALUES((SELECT cli_id FROM client WHERE cli_nom='MACHUT'),'9679098764565');
 
##Attribution du/des moyens de paiement sur ce compte
INSERT INTO posseder2(pos2_moyId,pos2_comNum)
 VALUES((SELECT moy_id FROM moyenPaiement WHERE moy_libelle='CB'),
 (SELECT com_numero FROM compte INNER JOIN posseder1 ON com_numero=pos1_comNum INNER JOIN client ON cli_id=pos1_idcli WHERE cli_nom='MACHUT'));
 
INSERT INTO posseder2(pos2_moyId,pos2_comNum)
 VALUES((SELECT moy_id FROM moyenPaiement WHERE moy_libelle='CHEQUE'),
 (SELECT com_numero FROM compte INNER JOIN posseder1 ON com_numero=pos1_comNum INNER JOIN client ON cli_id=pos1_idcli WHERE cli_nom='MACHUT'));
 
 
