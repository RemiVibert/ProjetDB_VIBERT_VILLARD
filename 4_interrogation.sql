-- ============================================================
-- 4_interrogation.sql
-- Interrogation de la base de données - Serveur Minecraft
-- VIBERT Rémi & VILLARD Lucien
-- ============================================================
-- 
-- SCÉNARIO D'UTILISATION :
-- L'administrateur système et le responsable de la modération
-- préparent un bilan trimestriel de la plateforme. Ils extraient
-- des données sur l'activité des joueurs, les performances serveurs,
-- les revenus, la modération et la popularité des événements.
-- ============================================================


-- ================================================================
-- A) PROJECTIONS, SÉLECTIONS, TRI, DISTINCT, MASQUES, IN, BETWEEN
--    (au moins 5)
-- ================================================================

-- A1 : Liste des joueurs actifs, triés par date d'inscription (du plus ancien au plus récent)
SELECT Pseudonyme, email, Date_inscription
FROM Joueur
WHERE statut_compte = 'actif'
ORDER BY Date_inscription ASC;

-- A2 : Pseudonymes distincts des joueurs ayant un statut suspendu ou banni
SELECT DISTINCT Pseudonyme, statut_compte
FROM Joueur
WHERE statut_compte IN ('suspendu', 'banni');

-- A3 : Achats validés effectués entre février et juin 2024, triés par montant décroissant
SELECT id_achat, date_achat, montant_paiement, duree_validite_jours
FROM Achat
WHERE statut_paiement = 'valide'
  AND date_achat BETWEEN '2024-02-01 00:00:00' AND '2024-06-30 23:59:59'
ORDER BY montant_paiement DESC;

-- A4 : Serveurs dont le nom commence par un mot spécifique (masque LIKE)
SELECT id_serveur, Nom_serveur, Statut_serveur
FROM Serveur
WHERE Nom_serveur LIKE 'P%'
   OR Nom_serveur LIKE 'S%';

-- A5 : Sanctions de type bannissement (temporaire ou définitif), triées par date
SELECT id_sanction, type_sanction, date_debut, date_fin, motif
FROM Sanction
WHERE type_sanction IN ('bannissement temporaire', 'bannissement definitif')
ORDER BY date_debut DESC;

-- A6 : Événements pouvant accueillir entre 50 et 200 participants
SELECT Nom_evenement, date_debut, nb_max_participants
FROM Evenement
WHERE nb_max_participants BETWEEN 50 AND 200
ORDER BY nb_max_participants ASC;

-- A7 : Mondes de type survie ou hardcore, triés par nom
SELECT Nom_monde, Type_monde, Seed
FROM Monde
WHERE Type_monde IN ('survie', 'hardcore')
ORDER BY Nom_monde;


-- ================================================================
-- B) FONCTIONS D'AGRÉGATION, GROUP BY, HAVING
--    (au moins 5)
-- ================================================================

-- B1 : Nombre de joueurs par statut de compte
SELECT statut_compte, COUNT(*) AS nb_joueurs
FROM Joueur
GROUP BY statut_compte;

-- B2 : Revenu total et nombre d'achats par statut de paiement
SELECT statut_paiement, COUNT(*) AS nb_achats, SUM(montant_paiement) AS revenu_total
FROM Achat
GROUP BY statut_paiement;

-- B3 : Charge CPU moyenne par serveur, uniquement les serveurs ayant une moyenne > 50%
SELECT id_serveur, AVG(charge_cpu) AS cpu_moyen, MAX(charge_cpu) AS cpu_max
FROM stats_performance
GROUP BY id_serveur
HAVING AVG(charge_cpu) > 50;

-- B4 : Nombre de sanctions par type, uniquement les types ayant plus de 2 occurrences
SELECT type_sanction, COUNT(*) AS nb_sanctions
FROM Sanction
GROUP BY type_sanction
HAVING COUNT(*) > 2;

-- B5 : Nombre d'événements auxquels chaque joueur a participé, 
--       uniquement ceux ayant participé à plus de 5 événements
SELECT Identifiant_Joueur, COUNT(*) AS nb_participations
FROM participer
GROUP BY Identifiant_Joueur
HAVING COUNT(*) > 5;

-- B6 : Durée moyenne des sessions (en minutes) par serveur,
--       uniquement les serveurs avec une durée moyenne > 120 min
SELECT id_serveur, 
       COUNT(*) AS nb_sessions,
       ROUND(AVG(TIMESTAMPDIFF(MINUTE, date_debut, date_fin)), 0) AS duree_moyenne_min
FROM session
WHERE date_fin IS NOT NULL
GROUP BY id_serveur
HAVING AVG(TIMESTAMPDIFF(MINUTE, date_debut, date_fin)) > 120;

-- B7 : Nombre de mondes par serveur, uniquement les serveurs hébergeant plus de 2 mondes
SELECT id_serveur, COUNT(*) AS nb_mondes
FROM Monde
GROUP BY id_serveur
HAVING COUNT(*) > 2;


-- ================================================================
-- C) JOINTURES (internes, externes, simples, multiples)
--    (au moins 5)
-- ================================================================

-- C1 : Jointure interne simple - Pseudonyme de chaque joueur avec ses achats validés
SELECT j.Pseudonyme, a.date_achat, a.montant_paiement
FROM Joueur j
INNER JOIN Achat a ON j.Identifiant_Joueur = a.Identifiant_Joueur
WHERE a.statut_paiement = 'valide'
ORDER BY a.date_achat;

-- C2 : Jointure externe gauche - Tous les joueurs avec leur nombre d'achats (même sans achat)
SELECT j.Pseudonyme, j.statut_compte, COUNT(a.id_achat) AS nb_achats
FROM Joueur j
LEFT JOIN Achat a ON j.Identifiant_Joueur = a.Identifiant_Joueur
GROUP BY j.Identifiant_Joueur, j.Pseudonyme, j.statut_compte
ORDER BY nb_achats DESC;

-- C3 : Jointure multiple - Détails des sanctions avec le nom du joueur et du modérateur
SELECT j.Pseudonyme, s.type_sanction, s.motif, s.date_debut, m.nom AS moderateur
FROM Sanction s
INNER JOIN Joueur j ON s.Identifiant_Joueur = j.Identifiant_Joueur
INNER JOIN Moderateur m ON s.id_moderateur = m.id_moderateur
ORDER BY s.date_debut DESC;

-- C4 : Jointure multiple - Nom du serveur, machine associée, et nombre de mondes
SELECT sv.Nom_serveur, sv.Statut_serveur, ma.adresse_ip, ma.processeur,
       COUNT(mo.ID_Monde) AS nb_mondes
FROM Serveur sv
INNER JOIN machine ma ON sv.id_machine = ma.id_machine
LEFT JOIN Monde mo ON sv.id_serveur = mo.id_serveur
GROUP BY sv.id_serveur, sv.Nom_serveur, sv.Statut_serveur, ma.adresse_ip, ma.processeur;

-- C5 : Jointure externe droite - Tous les événements avec les mondes utilisés (même sans monde)
SELECT e.Nom_evenement, e.date_debut, m.Nom_monde, m.Type_monde
FROM utilise u
RIGHT JOIN Evenement e ON u.ID_evenement = e.ID_evenement
LEFT JOIN Monde m ON u.ID_Monde = m.ID_Monde
ORDER BY e.date_debut;

-- C6 : Jointure multiple avec agrégation - Dépenses totales par joueur avec son pseudonyme
SELECT j.Pseudonyme, SUM(a.montant_paiement) AS total_depense, COUNT(a.id_achat) AS nb_achats
FROM Joueur j
INNER JOIN Achat a ON j.Identifiant_Joueur = a.Identifiant_Joueur
WHERE a.statut_paiement = 'valide'
GROUP BY j.Identifiant_Joueur, j.Pseudonyme
ORDER BY total_depense DESC;

-- C7 : Jointure - Sessions de jeu avec nom du joueur et nom du serveur
SELECT j.Pseudonyme, sv.Nom_serveur, se.date_debut, se.date_fin,
       TIMESTAMPDIFF(MINUTE, se.date_debut, se.date_fin) AS duree_min
FROM session se
INNER JOIN Joueur j ON se.Identifiant_Joueur = j.Identifiant_Joueur
INNER JOIN Serveur sv ON se.id_serveur = sv.id_serveur
WHERE se.date_fin IS NOT NULL
ORDER BY duree_min DESC
LIMIT 10;


-- ================================================================
-- D) REQUÊTES IMBRIQUÉES (NOT IN, NOT EXISTS, EXISTS, ANY, ALL)
--    (au moins 5)
-- ================================================================

-- D1 : IN - Joueurs ayant participé au "Festival de Noël Minecraft"
SELECT Pseudonyme, email
FROM Joueur
WHERE Identifiant_Joueur IN (
    SELECT p.Identifiant_Joueur
    FROM participer p
    INNER JOIN Evenement e ON p.ID_evenement = e.ID_evenement
    WHERE e.Nom_evenement = 'Festival de Noël Minecraft'
);

-- D2 : NOT IN - Joueurs n'ayant jamais effectué d'achat
SELECT Pseudonyme, Date_inscription
FROM Joueur
WHERE Identifiant_Joueur NOT IN (
    SELECT DISTINCT Identifiant_Joueur
    FROM Achat
);

-- D3 : EXISTS - Serveurs ayant eu au moins un relevé avec une charge CPU > 90%
SELECT sv.Nom_serveur, sv.Statut_serveur
FROM Serveur sv
WHERE EXISTS (
    SELECT 1
    FROM stats_performance sp
    WHERE sp.id_serveur = sv.id_serveur
      AND sp.charge_cpu > 90
);

-- D4 : NOT EXISTS - Joueurs actifs n'ayant reçu aucune sanction
SELECT Pseudonyme, Date_inscription
FROM Joueur j
WHERE j.statut_compte = 'actif'
  AND NOT EXISTS (
    SELECT 1
    FROM Sanction s
    WHERE s.Identifiant_Joueur = j.Identifiant_Joueur
);

-- D5 : ALL - Joueurs dont tous les achats ont été validés
SELECT Pseudonyme
FROM Joueur j
WHERE j.Identifiant_Joueur IN (SELECT Identifiant_Joueur FROM Achat)
  AND 'valide' = ALL (
    SELECT a.statut_paiement
    FROM Achat a
    WHERE a.Identifiant_Joueur = j.Identifiant_Joueur
);

-- D6 : ANY - Serveurs dont la capacité max est supérieure à celle 
--       d'au moins un serveur en maintenance
SELECT Nom_serveur, Capacite_max
FROM Serveur
WHERE Capacite_max > ANY (
    SELECT Capacite_max
    FROM Serveur
    WHERE Statut_serveur = 'maintenance'
);

-- D7 : Sous-requête dans le FROM - Classement des joueurs les plus actifs 
--       (nombre de sessions) avec leur dépense totale
SELECT classement.Pseudonyme, classement.nb_sessions, 
       COALESCE(depenses.total, 0) AS total_depense
FROM (
    SELECT j.Identifiant_Joueur, j.Pseudonyme, COUNT(se.id_session) AS nb_sessions
    FROM Joueur j
    INNER JOIN session se ON j.Identifiant_Joueur = se.Identifiant_Joueur
    GROUP BY j.Identifiant_Joueur, j.Pseudonyme
) AS classement
LEFT JOIN (
    SELECT Identifiant_Joueur, SUM(montant_paiement) AS total
    FROM Achat
    WHERE statut_paiement = 'valide'
    GROUP BY Identifiant_Joueur
) AS depenses ON classement.Identifiant_Joueur = depenses.Identifiant_Joueur
ORDER BY classement.nb_sessions DESC;
