-- ============================================================
-- 1_creation.sql
-- Création des tables du MPD - Serveur Minecraft
-- VIBERT Rémi & VILLARD Lucien
-- ============================================================

CREATE TABLE Joueur(
   Identifiant_Joueur INT,
   Pseudonyme VARCHAR(16) NOT NULL,
   email VARCHAR(100) NOT NULL,
   hash_pasword VARCHAR(255) NOT NULL,
   Date_inscription DATE NOT NULL,
   statut_compte VARCHAR(20) NOT NULL,
   PRIMARY KEY(Identifiant_Joueur),
   UNIQUE(Pseudonyme),
   UNIQUE(email)
);

CREATE TABLE Evenement(
   ID_evenement INT,
   Nom_evenement VARCHAR(60) NOT NULL,
   date_debut DATETIME NOT NULL,
   date_fin DATETIME NOT NULL,
   nb_max_participants SMALLINT NOT NULL,
   PRIMARY KEY(ID_evenement)
);

CREATE TABLE Moderateur(
   id_moderateur INT,
   nom VARCHAR(50) NOT NULL,
   email_pro VARCHAR(100) NOT NULL,
   role VARCHAR(30) NOT NULL,
   PRIMARY KEY(id_moderateur),
   UNIQUE(email_pro)
);

CREATE TABLE machine(
   id_machine INT,
   adresse_ip VARCHAR(45) NOT NULL,
   processeur VARCHAR(50) NOT NULL,
   ram SMALLINT NOT NULL,
   PRIMARY KEY(id_machine),
   UNIQUE(adresse_ip)
);

CREATE TABLE Achat(
   id_achat INT,
   date_achat DATETIME NOT NULL,
   montant_paiement DECIMAL(8,2) NOT NULL,
   statut_paiement VARCHAR(20) NOT NULL,
   duree_validite_jours SMALLINT,
   Identifiant_Joueur INT NOT NULL,
   PRIMARY KEY(id_achat),
   FOREIGN KEY(Identifiant_Joueur) REFERENCES Joueur(Identifiant_Joueur)
      ON DELETE CASCADE
      ON UPDATE CASCADE
);

CREATE TABLE Serveur(
   id_serveur INT,
   Nom_serveur VARCHAR(50) NOT NULL,
   Capacite_max SMALLINT NOT NULL,
   Statut_serveur VARCHAR(20) NOT NULL,
   id_machine INT NOT NULL,
   PRIMARY KEY(id_serveur),
   UNIQUE(Nom_serveur),
   FOREIGN KEY(id_machine) REFERENCES machine(id_machine)
      ON DELETE CASCADE
      ON UPDATE CASCADE
);

CREATE TABLE Monde(
   ID_Monde INT,
   Nom_monde VARCHAR(50) NOT NULL,
   Type_monde VARCHAR(20) NOT NULL,
   Seed BIGINT NOT NULL,
   id_serveur INT NOT NULL,
   PRIMARY KEY(ID_Monde),
   FOREIGN KEY(id_serveur) REFERENCES Serveur(id_serveur)
      ON DELETE CASCADE
      ON UPDATE CASCADE
);

CREATE TABLE Sanction(
   id_sanction INT,
   type_sanction VARCHAR(30) NOT NULL,
   date_debut DATETIME NOT NULL,
   date_fin DATETIME,
   motif VARCHAR(255) NOT NULL,
   id_moderateur INT,
   Identifiant_Joueur INT NOT NULL,
   PRIMARY KEY(id_sanction),
   FOREIGN KEY(id_moderateur) REFERENCES Moderateur(id_moderateur)
      ON DELETE SET NULL
      ON UPDATE CASCADE,
   FOREIGN KEY(Identifiant_Joueur) REFERENCES Joueur(Identifiant_Joueur)
      ON DELETE CASCADE
      ON UPDATE CASCADE
);

CREATE TABLE session(
   id_session INT,
   date_debut DATETIME NOT NULL,
   date_fin DATETIME,
   id_serveur INT NOT NULL,
   Identifiant_Joueur INT NOT NULL,
   PRIMARY KEY(id_session),
   FOREIGN KEY(id_serveur) REFERENCES Serveur(id_serveur)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
   FOREIGN KEY(Identifiant_Joueur) REFERENCES Joueur(Identifiant_Joueur)
      ON DELETE CASCADE
      ON UPDATE CASCADE
);

CREATE TABLE stats_performance(
   id_stat INT,
   date_releve DATETIME NOT NULL,
   charge_cpu DECIMAL(5,2) NOT NULL,
   ram_utilise INT NOT NULL,
   nb_joueurs SMALLINT NOT NULL,
   id_serveur INT NOT NULL,
   PRIMARY KEY(id_stat),
   FOREIGN KEY(id_serveur) REFERENCES Serveur(id_serveur)
      ON DELETE CASCADE
      ON UPDATE CASCADE
);

CREATE TABLE participer(
   Identifiant_Joueur INT,
   ID_evenement INT,
   PRIMARY KEY(Identifiant_Joueur, ID_evenement),
   FOREIGN KEY(Identifiant_Joueur) REFERENCES Joueur(Identifiant_Joueur)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
   FOREIGN KEY(ID_evenement) REFERENCES Evenement(ID_evenement)
      ON DELETE CASCADE
      ON UPDATE CASCADE
);

CREATE TABLE utilise(
   ID_Monde INT,
   ID_evenement INT,
   PRIMARY KEY(ID_Monde, ID_evenement),
   FOREIGN KEY(ID_Monde) REFERENCES Monde(ID_Monde)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
   FOREIGN KEY(ID_evenement) REFERENCES Evenement(ID_evenement)
      ON DELETE CASCADE
      ON UPDATE CASCADE
);
