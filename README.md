# ProjetDB_VIBERT_VILLARD

Collaborators: 
- VIBERT Rémi
- VILLARD Lucien


## Utilisation de l'ia générative :

Prompt utilisé pour générer les règles de gestion et le dictionnaire de données :
```
Tu travailles dans le domaine de l'hébergement et de la gestion de serveurs de jeux vidéo, spécialisé dans Minecraft. Ton entreprise a comme activité de proposer des serveurs Minecraft multijoueurs, de gérer des mondes personnalisés, d'organiser des événements en jeu et de vendre des avantages VIP aux joueurs. C'est une entreprise comme Apex Hosting, OVHcloud (hébergement), ou encore Hypixel (serveur Minecraft populaire). Les données ont été collectées sur les joueurs, les comptes utilisateurs, les sessions de jeu, les serveurs, les mondes, les événements organisés, les achats en ligne, les sanctions (bannissements, avertissements), les équipes de modération et les statistiques de performance des serveurs. Inspire-toi du site web de Minecraft (minecraft.net), de la documentation officielle de Mojang Studios, ainsi que de la présentation du serveur Hypixel.

Ton entreprise veut appliquer MERISE pour concevoir un système d'information. Tu es chargé de la partie analyse, c'est-à-dire de collecter les besoins auprès de l'entreprise. Elle a fait appel à un étudiant en ingénierie informatique pour réaliser ce projet, tu dois lui fournir les informations nécessaires pour qu'il applique ensuite lui-même les étapes suivantes de conception et développement de la base de données. 

D'abord, établis les règles de gestion des données de ton entreprise, sous la forme d'une liste à puce. Elle doit correspondre aux informations que fournit quelqu'un qui connaît le fonctionnement de l'entreprise, mais pas comment se construit un système d'information.

Ensuite, à partir de ces règles, fournis un dictionnaire de données brutes avec les colonnes suivantes, regroupées dans un tableau : signification de la donnée, type, taille en nombre de caractères ou de chiffres. Il doit y avoir entre 25 et 35 données. Il sert à fournir des informations supplémentaires sur chaque donnée (taille et type) mais sans a priori sur comment les données vont être modélisées ensuite.

Fournis donc les règles de gestion et le dictionnaire de données.
```

Voici le résultat obtenu :

```
Chaque joueur doit posséder un compte utilisateur unique pour accéder aux serveurs.

Un compte utilisateur est identifié par un pseudonyme unique et une adresse email unique.

Un joueur peut se connecter à plusieurs serveurs différents.

Chaque serveur possède un identifiant unique, un nom, une capacité maximale de joueurs simultanés et un statut (en ligne, maintenance, hors ligne).

Un serveur héberge un ou plusieurs mondes Minecraft.

Chaque monde appartient à un seul serveur.

Un monde possède un type (survie, créatif, hardcore, mini-jeu, événementiel).

Les joueurs peuvent participer à des événements organisés sur un serveur spécifique.

Un événement est associé à un seul serveur et à un monde spécifique.

Un joueur peut participer à plusieurs événements.

Les événements ont une date de début, une date de fin et un nombre maximal de participants.

Les joueurs peuvent effectuer des achats d’avantages VIP ou de bonus en jeu.

Chaque achat est associé à un seul joueur.

Un achat concerne un seul produit (rang VIP, objet cosmétique, booster, etc.).

Un produit possède un prix fixe et une durée de validité éventuelle.

Les paiements sont enregistrés avec un statut (validé, en attente, refusé).

Un joueur peut recevoir des sanctions (avertissement, bannissement temporaire, bannissement définitif).

Chaque sanction est appliquée par un membre de l’équipe de modération.

Un modérateur possède un rôle (modérateur, administrateur, responsable).

Une sanction comporte une date de début et éventuellement une date de fin.

Les connexions des joueurs sont enregistrées sous forme de sessions.

Une session correspond à une connexion d’un joueur à un serveur à un instant donné.

Une session comporte une date et heure de début et une date et heure de fin.

Les performances des serveurs sont surveillées (charge CPU, mémoire utilisée, nombre de joueurs connectés).

Les statistiques de performance sont enregistrées périodiquement.

Un serveur est hébergé sur une machine physique identifiée.

Une machine physique possède une adresse IP et des caractéristiques matérielles.

Les membres du personnel possèdent un compte interne distinct des joueurs.

Un joueur peut avoir un seul rang actif par serveur à un instant donné.

2️⃣ Dictionnaire de données brutes
Signification de la donnée	Type	Taille
Identifiant du joueur	Entier	10 chiffres
Pseudonyme du joueur	Texte	16 caractères
Adresse email du joueur	Texte	100 caractères
Mot de passe (haché)	Texte	255 caractères
Date d’inscription	Date	10 caractères
Statut du compte	Texte	20 caractères
Identifiant du serveur	Entier	10 chiffres
Nom du serveur	Texte	50 caractères
Capacité maximale du serveur	Entier	4 chiffres
Statut du serveur	Texte	20 caractères
Identifiant du monde	Entier	10 chiffres
Nom du monde	Texte	50 caractères
Type de monde	Texte	20 caractères
Graine (seed) du monde	Texte	20 caractères
Identifiant de l’événement	Entier	10 chiffres
Nom de l’événement	Texte	60 caractères
Date de début événement	DateHeure	19 caractères
Date de fin événement	DateHeure	19 caractères
Nombre max de participants	Entier	5 chiffres
Identifiant de l’achat	Entier	10 chiffres
Date de l’achat	DateHeure	19 caractères
Montant du paiement	Décimal	8 chiffres dont 2 décimales
Statut du paiement	Texte	20 caractères
Identifiant du produit	Entier	10 chiffres
Nom du produit	Texte	50 caractères
Prix du produit	Décimal	8 chiffres dont 2 décimales
Durée de validité (jours)	Entier	4 chiffres
Identifiant de la sanction	Entier	10 chiffres
Type de sanction	Texte	30 caractères
Date de début sanction	DateHeure	19 caractères
Date de fin sanction	DateHeure	19 caractères
Identifiant du modérateur	Entier	10 chiffres
Rôle du modérateur	Texte	30 caractères
Identifiant de session	Entier	10 chiffres
DateHeure début session	DateHeure	19 caractères
DateHeure fin session	DateHeure	19 caractères
Charge CPU (%)	Décimal	5 chiffres dont 2 décimales
Mémoire utilisée (Mo)	Entier	6 chiffres
Nombre de joueurs connectés	Entier	5 chiffres
Adresse IP machine	Texte	45 caractères
Processeur machine	Texte	50 caractères
Mémoire RAM machine (Go)	Entier	3 chiffres
```

Nous avons retravaillé cette réponse pour s'adapter au modèle 3FN.