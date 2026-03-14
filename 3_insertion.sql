-- ============================================================
-- 3_insertion.sql
-- Insertion des données - Serveur Minecraft
-- VIBERT Rémi & VILLARD Lucien
-- ============================================================

-- =============================
-- Tables sans clés étrangères
-- =============================

-- ---------- Joueur ----------
INSERT INTO Joueur (Identifiant_Joueur, Pseudonyme, email, hash_pasword, Date_inscription, statut_compte) VALUES
(1,  'SkyMaster',     'sky.master@gmail.com',        '$2b$12$aK8Lz1qW9xR3vN5pT7yBcO', '2023-01-15', 'actif'),
(2,  'DragonSlayer',  'dragon.slayer@outlook.com',    '$2b$12$bM9Nz2rX0yS4wO6qU8zCdP', '2023-02-20', 'actif'),
(3,  'CraftQueen',    'craft.queen@yahoo.fr',         '$2b$12$cN0Oa3sY1zT5xP7rV9aDfQ', '2023-03-10', 'actif'),
(4,  'RedstoneKing',  'redstone.king@gmail.com',      '$2b$12$dO1Pb4tZ2aU6yQ8sW0bEgR', '2023-04-05', 'actif'),
(5,  'EnderWolf',     'ender.wolf@hotmail.com',       '$2b$12$eP2Qc5uA3bV7zR9tX1cFhS', '2023-05-18', 'suspendu'),
(6,  'PixelNinja',    'pixel.ninja@gmail.com',        '$2b$12$fQ3Rd6vB4cW8aS0uY2dGiT', '2023-06-22', 'actif'),
(7,  'MineHero',      'mine.hero@outlook.fr',         '$2b$12$gR4Se7wC5dX9bT1vZ3eHjU', '2023-07-14', 'actif'),
(8,  'BlockWizard',   'block.wizard@gmail.com',       '$2b$12$hS5Tf8xD6eY0cU2wA4fIkV', '2023-08-30', 'banni'),
(9,  'NetherQuest',   'nether.quest@yahoo.com',       '$2b$12$iT6Ug9yE7fZ1dV3xB5gJlW', '2023-09-12', 'actif'),
(10, 'DiamondRush',   'diamond.rush@gmail.com',       '$2b$12$jU7Vh0zF8gA2eW4yC6hKmX', '2023-10-01', 'actif'),
(11, 'CreeperHunt',   'creeper.hunt@outlook.com',     '$2b$12$kV8Wi1aG9hB3fX5zD7iLnY', '2023-10-25', 'actif'),
(12, 'GhastFire',     'ghast.fire@hotmail.fr',        '$2b$12$lW9Xj2bH0iC4gY6aE8jMoZ', '2023-11-08', 'suspendu'),
(13, 'ZombiePro',     'zombie.pro@gmail.com',         '$2b$12$mX0Yk3cI1jD5hZ7bF9kNpA', '2023-11-20', 'actif'),
(14, 'BlazeRunner',   'blaze.runner@yahoo.fr',        '$2b$12$nY1Zl4dJ2kE6iA8cG0lOqB', '2023-12-05', 'actif'),
(15, 'IronForge',     'iron.forge@gmail.com',         '$2b$12$oZ2Am5eK3lF7jB9dH1mPrC', '2024-01-10', 'actif'),
(16, 'WitchCraft',    'witch.craft@outlook.com',      '$2b$12$pA3Bn6fL4mG8kC0eI2nQsD', '2024-01-28', 'actif'),
(17, 'VillagerTrade', 'villager.trade@gmail.com',     '$2b$12$qB4Co7gM5nH9lD1fJ3oRtE', '2024-02-14', 'actif'),
(18, 'ShulkerBox',    'shulker.box@hotmail.com',      '$2b$12$rC5Dp8hN6oI0mE2gK4pSuF', '2024-03-01', 'banni'),
(19, 'PotionMaker',   'potion.maker@yahoo.com',       '$2b$12$sD6Eq9iO7pJ1nF3hL5qTvG', '2024-03-15', 'actif'),
(20, 'AxolotlFan',    'axolotl.fan@gmail.com',        '$2b$12$tE7Fr0jP8qK2oG4iM6rUwH', '2024-04-02', 'actif');

-- ---------- Evenement ----------
INSERT INTO Evenement (ID_evenement, Nom_evenement, date_debut, date_fin, nb_max_participants) VALUES
(1,  'Tournoi PvP Saison 1',           '2024-01-20 14:00:00', '2024-01-20 20:00:00', 64),
(2,  'Chasse au trésor géante',        '2024-02-14 10:00:00', '2024-02-14 18:00:00', 100),
(3,  'Build Battle Février',           '2024-02-28 15:00:00', '2024-02-28 19:00:00', 32),
(4,  'Raid de l Ender Dragon',         '2024-03-15 20:00:00', '2024-03-15 23:59:00', 50),
(5,  'Marathon Survie 24h',            '2024-04-01 00:00:00', '2024-04-02 00:00:00', 200),
(6,  'Tournoi PvP Saison 2',           '2024-05-10 14:00:00', '2024-05-10 20:00:00', 64),
(7,  'Course de bateaux',              '2024-06-01 16:00:00', '2024-06-01 18:00:00', 40),
(8,  'Concours de redstone',           '2024-07-20 09:00:00', '2024-07-20 17:00:00', 30),
(9,  'Invasion de zombies',            '2024-08-31 21:00:00', '2024-09-01 03:00:00', 150),
(10, 'Festival de Noël Minecraft',     '2024-12-20 10:00:00', '2024-12-25 22:00:00', 500);

-- ---------- Moderateur ----------
INSERT INTO Moderateur (id_moderateur, nom, email_pro, role) VALUES
(1, 'Dupont Alice',     'alice.dupont@mcserver.com',    'responsable'),
(2, 'Martin Lucas',     'lucas.martin@mcserver.com',    'administrateur'),
(3, 'Bernard Emma',     'emma.bernard@mcserver.com',    'moderateur'),
(4, 'Petit Hugo',       'hugo.petit@mcserver.com',      'moderateur'),
(5, 'Moreau Julie',     'julie.moreau@mcserver.com',    'administrateur'),
(6, 'Leroy Thomas',     'thomas.leroy@mcserver.com',    'moderateur');

-- ---------- machine ----------
INSERT INTO machine (id_machine, adresse_ip, processeur, ram) VALUES
(1, '192.168.1.10',   'Intel Xeon E-2288G',      64),
(2, '192.168.1.11',   'AMD EPYC 7302',           128),
(3, '192.168.1.12',   'Intel Xeon E-2388G',      64),
(4, '10.0.0.50',      'AMD Ryzen 9 7950X',       32),
(5, '10.0.0.51',      'Intel Core i9-13900K',    32);

-- =============================
-- Tables avec clés étrangères (niveau 1)
-- =============================

-- ---------- Serveur (FK -> machine) ----------
INSERT INTO Serveur (id_serveur, Nom_serveur, Capacite_max, Statut_serveur, id_machine) VALUES
(1, 'Survie Principal',     200,  'en ligne',     1),
(2, 'Créatif Libre',        100,  'en ligne',     1),
(3, 'Hardcore Elite',       50,   'en ligne',     2),
(4, 'Mini-Jeux Arena',      300,  'en ligne',     2),
(5, 'Événementiel',         500,  'maintenance',  3),
(6, 'PvP Faction',          150,  'en ligne',     3),
(7, 'Skyblock Paradis',     100,  'hors ligne',   4),
(8, 'Test Développement',   10,   'maintenance',  5);

-- ---------- Achat (FK -> Joueur) ----------
INSERT INTO Achat (id_achat, date_achat, montant_paiement, statut_paiement, duree_validite_jours, Identifiant_Joueur) VALUES
(1,  '2024-01-20 10:30:00',  9.99,   'valide',     30,   1),
(2,  '2024-01-25 14:15:00',  24.99,  'valide',     90,   2),
(3,  '2024-02-01 09:00:00',  4.99,   'valide',     NULL, 3),
(4,  '2024-02-10 18:45:00',  49.99,  'valide',     365,  4),
(5,  '2024-02-14 12:00:00',  9.99,   'refuse',     30,   5),
(6,  '2024-03-01 16:20:00',  14.99,  'valide',     60,   6),
(7,  '2024-03-15 08:30:00',  4.99,   'en attente', NULL, 7),
(8,  '2024-03-20 21:00:00',  9.99,   'valide',     30,   1),
(9,  '2024-04-05 11:10:00',  24.99,  'valide',     90,   10),
(10, '2024-04-12 15:45:00',  4.99,   'valide',     NULL, 11),
(11, '2024-05-01 09:30:00',  49.99,  'valide',     365,  2),
(12, '2024-05-20 17:00:00',  9.99,   'refuse',     30,   13),
(13, '2024-06-10 13:25:00',  14.99,  'valide',     60,   14),
(14, '2024-06-15 10:00:00',  4.99,   'en attente', NULL, 15),
(15, '2024-07-01 19:30:00',  9.99,   'valide',     30,   9),
(16, '2024-07-22 08:15:00',  24.99,  'valide',     90,   16),
(17, '2024-08-05 14:50:00',  49.99,  'valide',     365,  17),
(18, '2024-09-10 11:00:00',  9.99,   'valide',     30,   19),
(19, '2024-10-01 16:40:00',  14.99,  'refuse',     60,   20),
(20, '2024-11-15 20:00:00',  4.99,   'valide',     NULL, 6);

-- =============================
-- Tables avec clés étrangères (niveau 2)
-- =============================

-- ---------- Monde (FK -> Serveur) ----------
INSERT INTO Monde (ID_Monde, Nom_monde, Type_monde, Seed, id_serveur) VALUES
(1,  'Overworld Alpha',      'survie',        123456789012,  1),
(2,  'Nether Inferno',       'survie',        987654321098,  1),
(3,  'End Dimension',        'survie',        456789123456,  1),
(4,  'Creative Land',        'creatif',       111222333444,  2),
(5,  'Showcase World',       'creatif',       555666777888,  2),
(6,  'Hardcore Realm',       'hardcore',      999000111222,  3),
(7,  'Arena PvP',            'mini-jeu',      333444555666,  4),
(8,  'SkyWars Map',          'mini-jeu',      777888999000,  4),
(9,  'BedWars Zone',         'mini-jeu',      121314151617,  4),
(10, 'Event World 1',        'evenementiel',  181920212223,  5),
(11, 'Event World 2',        'evenementiel',  242526272829,  5),
(12, 'Faction Warzone',      'survie',        303132333435,  6),
(13, 'Skyblock Islands',     'survie',        363738394041,  7),
(14, 'Test World',           'creatif',       424344454647,  8);

-- ---------- Sanction (FK -> Moderateur, Joueur) ----------
INSERT INTO Sanction (id_sanction, type_sanction, date_debut, date_fin, motif, id_moderateur, Identifiant_Joueur) VALUES
(1,  'avertissement',              '2024-01-25 14:00:00', NULL,                    'Langage inapproprié en chat public',                 3, 5),
(2,  'avertissement',              '2024-02-10 09:30:00', NULL,                    'Spam répété dans le chat',                           4, 8),
(3,  'bannissement temporaire',    '2024-02-15 16:00:00', '2024-02-22 16:00:00',   'Grief sur constructions d autres joueurs',           3, 8),
(4,  'avertissement',              '2024-03-01 11:00:00', NULL,                    'Publicité pour un serveur externe',                  4, 12),
(5,  'bannissement temporaire',    '2024-03-10 20:00:00', '2024-03-17 20:00:00',   'Utilisation de hacks (fly)',                         2, 5),
(6,  'bannissement definitif',     '2024-03-25 08:00:00', NULL,                    'Utilisation récidivante de clients modifiés',        1, 8),
(7,  'avertissement',              '2024-04-05 13:00:00', NULL,                    'Insultes envers un modérateur',                      5, 12),
(8,  'bannissement temporaire',    '2024-04-20 17:30:00', '2024-04-27 17:30:00',   'Exploitation de duplication glitch',                 2, 18),
(9,  'bannissement definitif',     '2024-05-01 10:00:00', NULL,                    'Vente de comptes et items contre argent réel',       1, 18),
(10, 'avertissement',              '2024-06-15 15:00:00', NULL,                    'Construction inappropriée',                          6, 13),
(11, 'avertissement',              '2024-07-01 12:00:00', NULL,                    'AFK farming excessif',                               3, 9),
(12, 'bannissement temporaire',    '2024-08-10 22:00:00', '2024-08-13 22:00:00',   'Team killing volontaire en événement',               4, 14);

-- ---------- session (FK -> Serveur, Joueur) ----------
INSERT INTO session (id_session, date_debut, date_fin, id_serveur, Identifiant_Joueur) VALUES
(1,  '2024-01-15 08:00:00', '2024-01-15 12:30:00', 1, 1),
(2,  '2024-01-15 09:00:00', '2024-01-15 11:00:00', 1, 2),
(3,  '2024-01-15 14:00:00', '2024-01-15 18:00:00', 4, 3),
(4,  '2024-01-16 10:00:00', '2024-01-16 10:45:00', 2, 4),
(5,  '2024-01-16 20:00:00', '2024-01-16 23:30:00', 1, 5),
(6,  '2024-01-17 07:00:00', '2024-01-17 07:30:00', 3, 6),
(7,  '2024-01-17 15:00:00', '2024-01-17 19:00:00', 4, 7),
(8,  '2024-01-18 09:00:00', '2024-01-18 17:00:00', 1, 1),
(9,  '2024-01-18 10:00:00', '2024-01-18 12:00:00', 6, 8),
(10, '2024-01-19 18:00:00', '2024-01-19 22:00:00', 1, 9),
(11, '2024-01-20 14:00:00', '2024-01-20 20:00:00', 4, 10),
(12, '2024-01-20 14:00:00', '2024-01-20 20:00:00', 4, 11),
(13, '2024-01-21 08:00:00', '2024-01-21 09:30:00', 2, 12),
(14, '2024-01-21 16:00:00', '2024-01-21 21:00:00', 1, 13),
(15, '2024-01-22 11:00:00', '2024-01-22 13:00:00', 3, 14),
(16, '2024-01-22 19:00:00', '2024-01-22 23:59:00', 6, 15),
(17, '2024-02-01 08:00:00', '2024-02-01 12:00:00', 1, 1),
(18, '2024-02-01 09:00:00', '2024-02-01 14:00:00', 1, 2),
(19, '2024-02-14 10:00:00', '2024-02-14 18:00:00', 4, 3),
(20, '2024-02-14 10:00:00', '2024-02-14 18:00:00', 4, 6),
(21, '2024-03-01 20:00:00', '2024-03-02 02:00:00', 1, 16),
(22, '2024-03-15 20:00:00', '2024-03-15 23:59:00', 1, 17),
(23, '2024-04-01 00:00:00', '2024-04-02 00:00:00', 1, 19),
(24, '2024-04-01 00:00:00', '2024-04-01 18:00:00', 1, 20),
(25, '2024-05-10 14:00:00', '2024-05-10 20:00:00', 4, 1),
(26, '2024-05-10 14:00:00', '2024-05-10 20:00:00', 4, 2),
(27, '2024-06-01 16:00:00', '2024-06-01 18:00:00', 4, 7),
(28, '2024-06-01 16:00:00', '2024-06-01 18:00:00', 4, 9),
(29, '2024-07-20 09:00:00', '2024-07-20 17:00:00', 2, 4),
(30, '2024-07-20 09:00:00', '2024-07-20 17:00:00', 2, 16),
(31, '2024-08-31 21:00:00', '2024-09-01 03:00:00', 1, 10),
(32, '2024-08-31 21:00:00', '2024-09-01 03:00:00', 1, 11),
(33, '2024-12-20 10:00:00', '2024-12-20 22:00:00', 5, 1),
(34, '2024-12-21 10:00:00', '2024-12-21 18:00:00', 5, 3),
(35, '2024-12-22 14:00:00', NULL,                   1, 20);

-- ---------- stats_performance (FK -> Serveur) ----------
INSERT INTO stats_performance (id_stat, date_releve, charge_cpu, ram_utilise, nb_joueurs, id_serveur) VALUES
(1,  '2024-01-15 08:00:00', 25.50,  8192,   45,  1),
(2,  '2024-01-15 12:00:00', 45.30,  12288,  120, 1),
(3,  '2024-01-15 18:00:00', 78.20,  16384,  195, 1),
(4,  '2024-01-15 08:00:00', 15.00,  4096,   20,  2),
(5,  '2024-01-15 12:00:00', 30.75,  6144,   55,  2),
(6,  '2024-01-15 08:00:00', 10.20,  2048,   8,   3),
(7,  '2024-01-15 18:00:00', 40.00,  4096,   35,  3),
(8,  '2024-01-15 08:00:00', 55.80,  20480,  180, 4),
(9,  '2024-01-15 12:00:00', 72.10,  24576,  250, 4),
(10, '2024-01-15 18:00:00', 89.90,  28672,  295, 4),
(11, '2024-01-15 08:00:00', 5.00,   1024,   0,   5),
(12, '2024-01-15 12:00:00', 8.30,   2048,   0,   5),
(13, '2024-02-01 08:00:00', 35.40,  10240,  80,  1),
(14, '2024-02-01 12:00:00', 60.20,  14336,  155, 1),
(15, '2024-02-01 08:00:00', 42.10,  8192,   65,  6),
(16, '2024-02-01 12:00:00', 58.90,  10240,  110, 6),
(17, '2024-03-15 20:00:00', 92.50,  30720,  198, 1),
(18, '2024-04-01 12:00:00', 88.00,  28672,  190, 1),
(19, '2024-05-10 16:00:00', 95.30,  30720,  298, 4),
(20, '2024-08-31 22:00:00', 82.40,  26624,  185, 1),
(21, '2024-12-20 14:00:00', 70.60,  22528,  350, 5),
(22, '2024-12-20 14:00:00', 3.20,   512,    0,   7),
(23, '2024-12-20 14:00:00', 12.00,  1024,   2,   8),
(24, '2024-01-15 18:00:00', 35.00,  6144,   85,  6);

-- =============================
-- Tables d'association (N:M)
-- =============================

-- ---------- participer (FK -> Joueur, Evenement) ----------
INSERT INTO participer (Identifiant_Joueur, ID_evenement) VALUES
-- Tournoi PvP Saison 1 (evt 1)
(1, 1), (2, 1), (6, 1), (7, 1), (10, 1), (11, 1), (14, 1), (15, 1),
-- Chasse au trésor (evt 2)
(1, 2), (3, 2), (6, 2), (9, 2), (10, 2), (13, 2), (16, 2), (17, 2), (19, 2), (20, 2),
-- Build Battle (evt 3)
(3, 3), (4, 3), (7, 3), (16, 3),
-- Raid Ender Dragon (evt 4)
(1, 4), (2, 4), (4, 4), (6, 4), (9, 4), (10, 4), (15, 4), (17, 4),
-- Marathon Survie 24h (evt 5)
(1, 5), (2, 5), (3, 5), (6, 5), (9, 5), (10, 5), (11, 5), (13, 5), (14, 5), (15, 5), (16, 5), (17, 5), (19, 5), (20, 5),
-- Tournoi PvP Saison 2 (evt 6)
(1, 6), (2, 6), (6, 6), (7, 6), (10, 6), (11, 6), (14, 6), (19, 6),
-- Course de bateaux (evt 7)
(3, 7), (7, 7), (9, 7), (11, 7), (20, 7),
-- Concours de redstone (evt 8)
(4, 8), (16, 8), (17, 8),
-- Invasion de zombies (evt 9)
(1, 9), (2, 9), (6, 9), (9, 9), (10, 9), (11, 9), (13, 9), (14, 9), (15, 9), (19, 9), (20, 9),
-- Festival de Noël (evt 10)
(1, 10), (2, 10), (3, 10), (6, 10), (7, 10), (9, 10), (10, 10), (11, 10), (13, 10), (14, 10), (15, 10), (16, 10), (17, 10), (19, 10), (20, 10);

-- ---------- utilise (FK -> Monde, Evenement) ----------
INSERT INTO utilise (ID_Monde, ID_evenement) VALUES
(7, 1),    -- Tournoi PvP S1 -> Arena PvP
(1, 2),    -- Chasse au trésor -> Overworld Alpha
(4, 3),    -- Build Battle -> Creative Land
(3, 4),    -- Raid Ender Dragon -> End Dimension
(1, 5),    -- Marathon Survie -> Overworld Alpha
(2, 5),    -- Marathon Survie -> Nether Inferno (multi-monde)
(7, 6),    -- Tournoi PvP S2 -> Arena PvP
(8, 7),    -- Course de bateaux -> SkyWars Map
(5, 8),    -- Concours redstone -> Showcase World
(10, 9),   -- Invasion zombies -> Event World 1
(10, 10),  -- Festival Noël -> Event World 1
(11, 10);  -- Festival Noël -> Event World 2 (multi-monde)