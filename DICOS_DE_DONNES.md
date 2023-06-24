# Dictionnaire de données

Pour ouvrir l'aperçu sur le côté `Ctrl+K puis V`

Pour ouvrir l'aperçu `Ctrl+Maj+V`

```Note : le nom des tables ainsi que leurs champs sont indiqués ici en français dans un soucis de compréhension et de cohérence avec le MLD, mais la bonne pratique consisterait à les rédiger en anglais puisque le dictionnaire de données servira à la création de la base de données (qui devra elle-même être en anglais).```

## Table Dossier (Folder)

| Champs | Type | Spécifités | Description |
|--|--|--|--|
| id | INT | PRIMARY KEY, UNSIGNED, NOT NULL, AUTO_INCREMENT | L’identifiant du dossier de consultation |
| reférence | VARCHAR(64) | NOT NULL | Référence saisie par l'utilisateur |
| label | VARCHAR(255) | NOT NULL | Courte description du dossier |
| description | TEXT | NOT NULL | Description du dossier |
| statut | INT | NOT NULL | Statut du dossier (0: en cours de création, 1: en cours d'évaluation, 2: clos (archivé)) |
| crée_le | TIMESTAMP | NOT NULL, DEFAULT CURRENT_TIMESTAMP | Date de création |
| mis_à_jour_le | TIMESTAMP | NOT NULL, DEFAULT CURRENT_TIMESTAMP | Date de modification |
| user_id | ENTITY | NOT NULL | Utilsateur qui a crée le dossier (user_id) |

## Table Section (Section)

| Champs | Type | Spécifités | Description |
|--|--|--|--|
| id | INT | PRIMARY KEY, UNSIGNED, NOT NULL, AUTO_INCREMENT | L’identifiant de la section |
| label | VARCHAR(255) | NOT NULL | Courte description de la section |
| ordre | INT | NOT NULL | Ordre de la section dans le dossier |
| crée_le | TIMESTAMP | NOT NULL, DEFAULT CURRENT_TIMESTAMP | Date de création |
| mis_à_jour_le | TIMESTAMP | NOT NULL, DEFAULT CURRENT_TIMESTAMP | Date de modification |
| user_id | ENTITY | NOT NULL | Utilsateur qui a crée la section (user_ida section) |

## Table Chapitre (Chapter)

| Champs | Type | Spécifités | Description |
|--|--|--|--|
| id | INT | PRIMARY KEY, UNSIGNED, NOT NULL, AUTO_INCREMENT | L’identifiant du chapitre |
| label | VARCHAR(255) | NOT NULL | Courte description du chapitre |
| ordre | INT | NOT NULL | Ordre du chapitre dans la section |
| crée_le | TIMESTAMP | NOT NULL, DEFAULT CURRENT_TIMESTAMP | Date de création |
| mis_à_jour_le | TIMESTAMP | NOT NULL, DEFAULT CURRENT_TIMESTAMP | Date de modification |
| user_id | ENTITY | NOT NULL | Utilsateur qui a crée le chapitre (user_id) |

## Table Question (Question)

| Champs | Type | Spécifités | Description |
|--|--|--|--|
| id | INT | PRIMARY KEY, UNSIGNED, NOT NULL, AUTO_INCREMENT | L’identifiant de la question |
| label | VARCHAR(500) | NOT NULL | Texte de la question |
| ordre | INT | NOT NULL | Ordre de la question dans le chapitre |
| crée_le | TIMESTAMP | NOT NULL, DEFAULT CURRENT_TIMESTAMP | Date de création |
| mis_à_jour_le | TIMESTAMP | NOT NULL, DEFAULT CURRENT_TIMESTAMP | Date de modification |
| user_id | ENTITY | NOT NULL | Utilsateur qui a crée la question (user_id) |

## Table Réponse (Response)

| Champs | Type | Spécifités | Description |
|--|--|--|--|
| id | INT | PRIMARY KEY, UNSIGNED, NOT NULL, AUTO_INCREMENT | L’identifiant de la question |
| pondération | INT | NOT NULL | Valeur de la pondération de la réponse |
| crée_le | TIMESTAMP | NOT NULL, DEFAULT CURRENT_TIMESTAMP | Date de création |
| mis_à_jour_le | TIMESTAMP | NOT NULL, DEFAULT CURRENT_TIMESTAMP | Date de modification |
| question_id | ENTITY | NOT NULL | Question à laquelle est liée la réponse |

## Table Utilisateur (User)

| Champs | Type | Spécifités | Description |
|--|--|--|--|
| id | INT | PRIMARY KEY, UNSIGNED, NOT NULL, AUTO_INCREMENT | L’identifiant de l'utilisateur |
| nom | VARCHAR(64) | NOT NULL | Nom de l'utilisateur |
| prénom | VARCHAR(64) | NOT NULL | Prénom de l'utilisateur |
| email | VARCHAR(255) | NOT NULL | Adresse email de l'utilisateur |

## Table Soumissionnaire (Bidder)

| Champs | Type | Spécifités | Description |
|--|--|--|--|
| id | INT | PRIMARY KEY, UNSIGNED, NOT NULL, AUTO_INCREMENT | L’identifiant du soumissionnaire |
| nom | VARCHAR(100) | NOT NULL | Nom du soumissionnaire |
| description | VARCHAR(255) | NOT NULL | Courte description du soumissionnaire |
| crée_le | TIMESTAMP | NOT NULL, DEFAULT CURRENT_TIMESTAMP | Date de création |
| mis_à_jour_le | TIMESTAMP | NOT NULL, DEFAULT CURRENT_TIMESTAMP | Date de modification |
| user_id | ENTITY | NOT NULL | Utilsateur qui a crée le soumissionnaire (user_id) |

## Table d’association APPARTENIR entre les tables Folder, Section

| Champs | Type | Spécifités | Description |
|--|--|--|--|
| dossier_id | ENTITY | PRIMARY KEY, NOT NULL | L’identifiant du dossier |
| section_id | ENTITY | PRIMARY KEY, NOT NULL | L’identifiant de la section |

## Table d’association APPARTENIR entre les tables Section et Chapitre

| Champs | Type | Spécifités | Description |
|--|--|--|--|
| section_id | ENTITY | PRIMARY KEY, NOT NULL | L’identifiant de la section |
| chapitre_id | ENTITY | PRIMARY KEY, NOT NULL | L’identifiant du chapitre |

## Table d’association APPARTENIR entre les tables Chapitre et Question

| Champs | Type | Spécifités | Description |
|--|--|--|--|
| chapitre_id | ENTITY | PRIMARY KEY, NOT NULL | L’identifiant du chapitre |
| question_id | ENTITY | PRIMARY KEY, NOT NULL | L’identifiant de la question |

## Table d’association LIER A entre les tables Folder et Bidder

| Champs | Type | Spécifités | Description |
|--|--|--|--|
| dossier_id | ENTITY | PRIMARY KEY, NOT NULL | L’identifiant du dossier |
| soumissionnaire_id | ENTITY | PRIMARY KEY, NOT NULL | L’identifiant du soumissionnaire |

## Table d’association RATTACHER A entre les tables Folder et User (Contributeur)

| Champs | Type | Spécifités | Description |
|--|--|--|--|
| dossier_id | ENTITY | PRIMARY KEY, NOT NULL | L’identifiant du dossier |
| user_id | ENTITY | PRIMARY KEY, NOT NULL | L’identifiant de l'utilisateur |

## Table d’association RATTACHER A entre les tables Section et User (Contributeur)

| Champs | Type | Spécifités | Description |
|--|--|--|--|
| section_id | ENTITY | PRIMARY KEY, NOT NULL | L’identifiant de la section |
| user_id | ENTITY | PRIMARY KEY, NOT NULL | L’identifiant de l'utilisateur |
