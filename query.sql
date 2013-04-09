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

##Historique des mouvements sur un compte client
SELECT ope_date as DateOperation, ope_montant as Montant, moy_libelle as MoyenPaiement, cat_libelle as CategorieOperation, typeO_libelle as TypeOperation
FROM operations
INNER JOIN moyenPaiement ON moy_id=ope_idMoy
INNER JOIN categorieOperation ON cat_id=ope_idCat
INNER JOIN typeOperation ON typeO_id=ope_idType
WHERE ope_id IN (SELECT eff_opId FROM effectue WHERE eff_comNum= 6457934526)
AND YEAR(ope_date)=YEAR(current_date) AND MONTH(ope_date)=MONTH(current_date);

## Mise à jour du solde suivant le montant de l opération
UPDATE compte SET com_solde=com_solde+
(SELECT ope_montant FROM effectue INNER JOIN operations ON eff_opId=ope_id WHERE eff_comNum=6457934526 AND ope_id=8)
WHERE com_numero=6457934526; 
