INSERT INTO client(cli_nom,cli_prenom)
VALUES('SOUAN','EDOUARD'),
('MACHUT','NICOLAS'),
('LECUAONA', 'PATRICE'),
('DYLAN','BOB'),
('OUADOUDI','LOUBNA');
 
INSERT INTO compte(com_numero, com_solde, com_dateCreation, com_idTypeCpt)
VALUES('0685493486','150.00', '2012/03/23', 0),
('6457934526','23000.00', '1994/02/12', 3),
('2893746378', '-12.30', '2010/12/20', 0),
('2907364537', '845.10', '2010/05/12', 2),
('1029745364','220.00', '2005/10/10', 1),
('4637846573', '12000,00', '2000/07/28', 0),
('3849274839','33.10', '1985/12/12', 1),
('4839274637', '437.39', '1999/03/15', 1),
('6735467684','1245674.10','1992/04/23',0);

INSERT INTO posseder1(pos1_idCli, pos1_comNum)
VALUES('0', '0685493486'),
('0','6457934526'),
('1','2893746378'),
('1','2907364537'),
('2','1029745364'),
('2','4839274637'),
('3','4637846573'),
('3','3849274839'),
('4','6735467684')

INSERT INTO typeCompte(typeC_libelle)
VALUES('COURANT'),
('Livret Jeune'),
('Livret A'),
('P.E.L');

INSERT INTO moyenPaiement(moy_libelle)
VALUES('CB'),
('CHEQUE'),
('ESPECE'),
('CARAMBAR'),
('VIREMENT');

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

INSERT INTO operations(ope_date, ope_montant, ope_recu, ope_idMoy, ope_idCat, ope_idType)
VALUES('2012/09/11','120.00', '', '0', '0', '6'),
('2013/01/03' , '17.25', '', '1', '8', '3'),
('2005/04/02' , '550.00', '', '4', '3', '5'),
('2013/01/05', '600.00', '', '2', '5', '8'),
('2007/10/18', '25.10', '', '3', '0', '6');

INSERT INTO effectue()
VALUES();


