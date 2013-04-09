INSERT INTO client(cli_nom,cli_prenom)
VALUES('SOUAN','EDOUARD'),
('MACHUT','NICOLAS'),
('LECUAONA', 'PATRICE'),
('DYLAN','BOB'),
('OUADOUDI','LOUBNA');

INSERT INTO typeCompte(typeC_libelle)
VALUES('COURANT'),
('Livret Jeune'),
('Livret A'),
('P.E.L');
 
INSERT INTO compte(com_numero, com_solde, com_dateCreation, com_idTypeCpt)
VALUES('9679098764565',1000, current_date, (SELECT typeC_id FROM typeCompte WHERE typeC_libelle='COURANT'));
 
INSERT INTO compte(com_numero, com_solde, com_dateCreation, com_idTypeCpt)
VALUES('0639498564261',50, current_date, (SELECT typeC_id FROM typeCompte WHERE typeC_libelle='COURANT'));

INSERT INTO compte(com_numero, com_solde, com_dateCreation, com_idTypeCpt)
VALUES('0145368534041',400, current_date, (SELECT typeC_id FROM typeCompte WHERE typeC_libelle='COURANT'));
 
INSERT INTO compte(com_numero, com_solde, com_dateCreation, com_idTypeCpt)
VALUES('0685493486',150.00, '2012/03/23', 1),
('6457934526',23000.00, '1994/02/12', 4),
('2893746378', -12.30, '2010/12/20', 1),
('2907364537', 845.10, '2010/05/12', 3),
('1029745364',220.00, '2005/10/10', 2),
('4637846573', 12000.00, '2000/07/28', 1),
('3849274839',33.10, '1985/12/12', 2),
('4839274637', 437.39, '1999/03/15', 2),
('6735467684',1245674.10,'1992/04/23',1);

INSERT INTO posseder1(pos1_idcli,pos1_comNum)
VALUES((SELECT cli_id FROM client WHERE cli_nom='MACHUT'),'9679098764565');
 
INSERT INTO posseder1(pos1_idcli,pos1_comNum)
VALUES((SELECT cli_id FROM client WHERE cli_nom='SOUAN'),'0639498564261');

INSERT INTO posseder1(pos1_idcli,pos1_comNum)
VALUES((SELECT cli_id FROM client WHERE cli_nom='SOUAN'),'0145368534041');
 
INSERT INTO posseder1(pos1_idCli, pos1_comNum)
VALUES(1, '0685493486'),
(1,'6457934526'),
(1,'2893746378'),
(1,'2907364537'),
(3,'1029745364'),
(3,'4839274637'),
(4,'4637846573'),
(4,'3849274839'),
(5,'6735467684');

INSERT INTO moyenPaiement(moy_libelle)
VALUES('CB'),
('CHEQUE'),
('ESPECE'),
('CARAMBAR'),
('VIREMENT');

INSERT INTO posseder2(pos2_moyId,pos2_comNum)
VALUES((SELECT moy_id FROM moyenPaiement WHERE moy_libelle='CB'),
(SELECT com_numero FROM compte INNER JOIN posseder1 ON com_numero=pos1_comNum INNER JOIN client 
ON cli_id=pos1_idcli WHERE cli_nom='MACHUT'));
 
INSERT INTO posseder2(pos2_moyId,pos2_comNum)
VALUES((SELECT moy_id FROM moyenPaiement WHERE moy_libelle='CHEQUE'),
(SELECT com_numero FROM compte INNER JOIN posseder1 ON com_numero=pos1_comNum INNER JOIN client 
ON cli_id=pos1_idcli WHERE cli_nom='MACHUT'));
 
INSERT INTO typeOperation(typeO_libelle)
VALUES('Debits'),
('Credits'),
('Cheque emis'),
('Remise de cheque'),
('Virement'),
('Prelevement'),
('Facture CB'),
('Retrait Espece'),
('Autre');

INSERT INTO categorieOperation(cat_libelle)
VALUES('Alimentaire'),
('Immobilier'),
('Automobile'),
('Loyer'),
('Telephonie'),
('Drogues'),
('High Tech'),
('Vacance'),
('Autre');

INSERT INTO operations(ope_date, ope_montant, ope_recu, ope_idMoy, ope_idCat, ope_idType)
VALUES('2012/09/11','120.00', '', 1, 1, 7);

INSERT INTO operations (ope_date, ope_montant, ope_idMoy, ope_idCat, ope_idType)
VALUES("2013/04/01", "150.00", 4,6,9 );


INSERT INTO operations(ope_date, ope_montant, ope_recu, ope_idMoy, ope_idCat, ope_idType)
VALUES('2012/09/11','120.00', '', 1, 1, 6),
('2013/01/03' , '17.25', '', 2, 9, 3),
('2005/04/02' , '550.00', '', 5, 4, 5),
('2013/01/05', '600.00', '', 3, 6, 8),
('2007/10/18', '25.10', '', 4, 1, 6),
('2013/04/12','234.00','', 2, 3, 4),
('2013/02/12','2340.00','', 2, 3, 4);

INSERT INTO effectue(eff_comNum, eff_opId)
VALUES('6457934526', 2),
('6457934526', 8),
('6457934526', 9);
