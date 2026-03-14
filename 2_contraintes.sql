-- ============================================================
-- 2_contraintes.sql
-- Contraintes de validation (CHECK) - Serveur Minecraft
-- VIBERT Rémi & VILLARD Lucien
-- ============================================================

-- ========================
-- TABLE Joueur
-- ========================

-- Le statut du compte doit faire partie des valeurs autorisées
ALTER TABLE Joueur
   ADD CONSTRAINT chk_statut_compte
   CHECK (statut_compte IN ('actif', 'suspendu', 'banni'));

-- L'email doit contenir un @
ALTER TABLE Joueur
   ADD CONSTRAINT chk_email_format
   CHECK (email LIKE '%_@_%.__%');

-- Le pseudonyme doit contenir au moins 3 caractères
ALTER TABLE Joueur
   ADD CONSTRAINT chk_pseudonyme_longueur
   CHECK (CHAR_LENGTH(Pseudonyme) >= 3);

-- ========================
-- TABLE Evenement
-- ========================

-- La date de fin doit être postérieure à la date de début
ALTER TABLE Evenement
   ADD CONSTRAINT chk_evt_dates
   CHECK (date_fin > date_debut);

-- Le nombre max de participants doit être positif
ALTER TABLE Evenement
   ADD CONSTRAINT chk_evt_nb_participants
   CHECK (nb_max_participants > 0);

-- ========================
-- TABLE Achat
-- ========================

-- Le montant du paiement doit être positif ou nul
ALTER TABLE Achat
   ADD CONSTRAINT chk_montant_positif
   CHECK (montant_paiement >= 0);

-- Le statut du paiement doit faire partie des valeurs autorisées
ALTER TABLE Achat
   ADD CONSTRAINT chk_statut_paiement
   CHECK (statut_paiement IN ('valide', 'en attente', 'refuse'));

-- La durée de validité, si renseignée, doit être positive
ALTER TABLE Achat
   ADD CONSTRAINT chk_duree_validite
   CHECK (duree_validite_jours IS NULL OR duree_validite_jours > 0);

-- ========================
-- TABLE Moderateur
-- ========================

-- Le rôle du modérateur doit faire partie des valeurs autorisées
ALTER TABLE Moderateur
   ADD CONSTRAINT chk_role_moderateur
   CHECK (role IN ('moderateur', 'administrateur', 'responsable'));

-- L'email professionnel doit contenir un @
ALTER TABLE Moderateur
   ADD CONSTRAINT chk_email_pro_format
   CHECK (email_pro LIKE '%_@_%.__%');

-- ========================
-- TABLE machine
-- ========================

-- La RAM doit être strictement positive (en Go)
ALTER TABLE machine
   ADD CONSTRAINT chk_machine_ram
   CHECK (ram > 0);

-- ========================
-- TABLE Serveur
-- ========================

-- La capacité maximale doit être strictement positive
ALTER TABLE Serveur
   ADD CONSTRAINT chk_capacite_max
   CHECK (Capacite_max > 0);

-- Le statut du serveur doit faire partie des valeurs autorisées
ALTER TABLE Serveur
   ADD CONSTRAINT chk_statut_serveur
   CHECK (Statut_serveur IN ('en ligne', 'maintenance', 'hors ligne'));

-- ========================
-- TABLE Monde
-- ========================

-- Le type de monde doit faire partie des valeurs autorisées
ALTER TABLE Monde
   ADD CONSTRAINT chk_type_monde
   CHECK (Type_monde IN ('survie', 'creatif', 'hardcore', 'mini-jeu', 'evenementiel'));

-- ========================
-- TABLE Sanction
-- ========================

-- Le type de sanction doit faire partie des valeurs autorisées
ALTER TABLE Sanction
   ADD CONSTRAINT chk_type_sanction
   CHECK (type_sanction IN ('avertissement', 'bannissement temporaire', 'bannissement definitif'));

-- La date de fin, si renseignée, doit être postérieure à la date de début
ALTER TABLE Sanction
   ADD CONSTRAINT chk_sanction_dates
   CHECK (date_fin IS NULL OR date_fin >= date_debut);

-- ========================
-- TABLE session
-- ========================

-- La date de fin, si renseignée, doit être postérieure à la date de début
ALTER TABLE session
   ADD CONSTRAINT chk_session_dates
   CHECK (date_fin IS NULL OR date_fin >= date_debut);

-- ========================
-- TABLE stats_performance
-- ========================

-- La charge CPU doit être entre 0 et 100 (pourcentage)
ALTER TABLE stats_performance
   ADD CONSTRAINT chk_charge_cpu
   CHECK (charge_cpu BETWEEN 0 AND 100);

-- La RAM utilisée doit être positive ou nulle (en Mo)
ALTER TABLE stats_performance
   ADD CONSTRAINT chk_ram_utilisee
   CHECK (ram_utilise >= 0);

-- Le nombre de joueurs connectés doit être positif ou nul
ALTER TABLE stats_performance
   ADD CONSTRAINT chk_nb_joueurs
   CHECK (nb_joueurs >= 0);
