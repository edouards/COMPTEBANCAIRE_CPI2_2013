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
SELECT * FROM operations
WHERE ope_id IN (SELECT eff_opId FROM effectue WHERE eff_comNum= 6457934526);
