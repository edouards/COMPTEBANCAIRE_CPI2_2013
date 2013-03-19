## 2 -- 
INSERT INTO typechambre(typechambre.typc_id, typechambre.typc_libelle) 
VALUES ('C6', '12 à 16 lits');
UPDATE offre 
SET offre.off_nombrechambres = 3 
WHERE offre.off_idtypc = 'C4'
	AND offre.off_idetab = (SELECT etab_id FROM etablissement WHERE etab_nom = 'Collège de Moka');
	
INSERT INTO offre(offre.off_idetab, offre.off_idtypc, offre.off_nombrechambres)
VALUES ((SELECT etab_id FROM etablissement WHERE etab_nom = 'Collège de Moka'), 'C6', 2);

## 3 --
SELECT etablissement.etab_nom, offre.off_idtypc, offre.off_nombrechambres
FROM etablissement INNER JOIN offre ON etablissement.etab_id = offre.off_idetab
WHERE etablissement.etab_nom = 'Collège de Moka'
ORDER BY offre.off_idtypc ASC;

## 4 --
SELECT DISTINCT etab_nom
FROM etablissement
WHERE etab_id IN (SELECT offre.off_idetab
	FROM offre
	WHERE offre.off_idtypc = 'C3'
		AND offre.off_nombrechambres > 2)
	AND etab_id IN (
		SELECT offre.off_idetab
		FROM offre
		WHERE offre.off_idtypc = 'C4'
			AND offre.off_nombrechambres > 1);
			
## 5 --
SELECT typechambre.typc_id
FROM typechambre
WHERE typc_id NOT IN (
	SELECT offre.off_idtypc
	FROM offre
);

## 6 --
SELECT groupe.grp_nom
FROM groupe 
WHERE groupe.grp_id NOT IN (
	SELECT attribution.att_idgroupe
	FROM attribution
);

## 7 --
SELECT etab_nom, IFNULL(SUM(attribution.att_nombrechambres), 0)
FROM etablissement LEFT OUTER JOIN attribution ON etablissement.etab_id = attribution.att_idetab
GROUP BY etab_nom;

## 8 --
SELECT groupe.grp_nom, SUM(attribution.att_nombrechambres)
FROM groupe INNER JOIN attribution ON groupe.grp_id = attribution.att_idgroupe
GROUP BY grp_nom
HAVING SUM(attribution.att_nombrechambres) >= ALL (
	SELECT SUM(attribution.att_nombrechambres)
	FROM attribution 
	GROUP BY attribution.att_idgroupe);