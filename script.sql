--Test 1 COUNT DISTINCT
--Données
id_vente 	client	    ville	    produit
1	        Alice	    Paris	    Livre
2	        Bob	        Lyon	    Stylo
3	        Alice	    Paris	    Sac
4	        Charlie	    Marseille	Livre
5	        Bob	        Lyon	    Livre
6	        Alice	    Paris	    Stylo

SELECT COUNT(DISTINCT client) FROM ventes;
--Résultat : 3 (Seuls Alice, Bob et Charlie sont des clients uniques).

--Test 2 Temporal Tabelle
 SELECT a.id, b.columnname FROM
        (SELECT DISTINCT id  
            FROM table_a
            WHERE YEAR(dateColumn) = YEAR(GETDATE())
        ) AS a
    INNER JOIN table_b AS b ON a.id = b.id

--Test 3 calculer le cumul de ventes de chaque vendeur
--Données: 
ID	Vendeur	    Date	        Montant
1    Marc	    2023-10-01	    100
2   Marc	    2023-10-05	    200
3   Julie	    2023-10-02	    150
4   Julie	    2023-10-03	    50

SELECT 
    Vendeur, 
    Date, 
    Montant,
    SUM(Montant) OVER (
        PARTITION BY Vendeur 
        ORDER BY Date
    ) AS Cumul_Ventes
FROM Ventes;

--Résultat et Explication
Vendeur	Date	        Montant	    Cumul_Ventes	Explication
Julie	2023-10-02	    150	        150	            Première vente de Julie.
Julie	2023-10-03	    50	        200	            150 (précédent) + 50.
Marc	2023-10-01	    100	        100	            Nouveau groupe (Partition), on repart à 0.
Marc	2023-10-05	    200	        300	            100 (précédent) + 200.

--Test 4 sql faire la liste des meilleurs vendeurs en fonction du montant pour chaque mois
--Données
date_vente      vendeur	    montant
2024-01-05	    Bob	        200
2024-01-10	    Alice	    500
2024-01-15	    Bob	        800
2024-01-20	    Alice	    400
2024-02-05	    Alice	    300
2024-02-12	    Bob	        600
2024-02-20	    Alice	    150
2024-02-25	    Bob	        500

WITH CalculVentes AS (
    -- On calcule d'abord le cumul par vendeur et par mois
    SELECT 
        MONTH(date_vente) AS mois,
        vendeur,
        SUM(montant) AS total_mensuel
    FROM ventes
    GROUP BY MONTH(date_vente), vendeur
),
Classement AS (
    -- On attribue un rang (1 = le meilleur) pour chaque mois
    SELECT 
        mois,
        vendeur,
        total_mensuel,
        RANK() OVER (PARTITION BY mois ORDER BY total_mensuel DESC) AS rang
    FROM CalculVentes
)
-- On ne garde que les premiers de chaque mois
SELECT mois, vendeur, total_mensuel
FROM Classement
WHERE rang = 1;
--Résultat obtenu
--La requête va regrouper les montants, les comparer, et ne sortir que le gagnant par mois :
mois	vendeur	total_mensuel	Pourquoi ?
1 (Janvier)	Bob	1000	Bob (200+800) bat Alice (500+400=900)
2 (Février)	Bob	1100	Bob (600+500) bat Alice (300+150=450)

-- COUNT(distinct)
Befehl 	                  Was wird gezählt?	                   Berücksichtigt NULL?
COUNT(*)	                 Alle Zeilen der Tabelle	             Ja
COUNT(spalte)	            Alle Einträge in dieser Spalte	      Nein
COUNT(DISTINCT spalte)	Nur eindeutige, verschiedene Werte	     Nein


ID	Kunde	Stadt
1	Müller	Berlin
2	Schmidt	Hamburg
3	Müller	Berlin
4	Weber	München
5	Meier	NULL
6	Schmidt	Hamburg
 
SELECT COUNT(DISTINCT Stadt) FROM Bestellungen;


--  MS SQL

-- Top 10 pro Monat
-- Tabelle kunden(knr,kname) & rechnung(id,knr,rdatum,rbetrag)
SELECT * FROM(
              SELECT MONTH(rdatum) AS monat, DATENAME(m,rdatum), kname AS Kunde, ROUND(SUM(rBetrag)) AS umsatz,
                RANK() OVER(PARTITION BY MONTH(rdatum) ORDER BY SUM(rBetrag) DESC) as ranking
                FROM rechnung AS r
                LEFT JOIN kunden AS k ON k.knr = r.knr
                WHERE YEAR(rdatum) = YEAR(GETDATE())
                GROUP BY MONTH(rdatum), r.knr, DATENAME(m,rdatum)
                HAVING SUM(rbetrag) > 0) AS temp
  WHERE ranking BETWEEN 1 AND 10

 -- Umsatz Halbjahr
SELECT IIF(MONTH(rdatum) < 7,'H1','H2') as halbjahr, YEAR(rdatum) as jahr, RUND(SUM(rB´betrag),2) AS umsatz
 FROM rechnung
 WHERE YEAR(rdatum) = YEAR(GETDATE())
 GROUP BY IIF(MONTH(rdatum) < 7,'H1','H2') as halbjahr, YEAR(rdatum), YEAR(rdatum)

--Quartal: DATEPART(quarter,rdatum) | CONCAT('Q',DATEPART(quarter,rdatum))
