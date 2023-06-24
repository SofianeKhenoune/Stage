# Recueil de données

Pour ouvrir l'aperçu sur le côté `Ctrl+K puis V`

Pour ouvrir l'aperçu `Ctrl+Maj+V`

## Abréviations et nomenclature

- Consultation : Dossier de consultation ( grille d'évaluation + contributeur(s) + soumissionnaire(s)) son cycle de vie est dynamique (phase de création, phase d'évaluation, phase de validation (résultats et archivage))
- Ressource : ?

- Entité : Table dans la BDD

## Consultation

| Nom | Description | Type | Commentaire | Entité |
|--|--|--|--|--|
| Référence | Identifiant crée par l'utilisateur | texte court | Ne correspond pas à l'identifiant dans la BDD | Folder |
| Label | Courte description | texte court | - | Folder |
| Description | Description détaillée | texte moyen | - | Folder |
| Label | Courte description | texte court | - | Section |
| Description | Description détaillée | texte moyen | - | Section |
| Label | Courte description | texte court | - | Chapter |
| Description | Description détaillée | texte moyen | - | Chapter |
| Label | Texte de la question | texte moyen | - | Question |
| Pondération | Valeur max de la pondération | nombre | - | Question |
| Statut | Statut de la consultation | nombre | Cycles de vie d'un dossier | Folder |
| Nom | Nom de l'utilisateur | texte court | - | User |
| Prénom | Prénom de l'utilisateur | texte court | - | User |
| Email | Email de l'utilisateur | texte court | - | User |
| Rôle | Rôle de l'utilisateur | texte court | - | User |
| Nom | Nom du soumissionnaire | texte court | - | Bidder |
| Description | Nom du soumissionnaire | texte court | - | Bidder |
| Commentaire | commentaire de la réponse | texte moyen | - | Réponse |
| Pondération | pondération de la réponse | nombre | - | Réponse |
