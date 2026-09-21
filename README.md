# Vélo Kombi

Site vitrine d'un atelier de réparation de vélos. **Entreprise fictive**, site utilisé comme support de travaux pratiques Git et GitHub.

## Lancer le site en local

Le site charge `data/services.json` avec `fetch`, ce qui ne fonctionne pas si vous ouvrez le fichier directement depuis le disque. Servez le dossier avec un serveur local :

```bash
python3 -m http.server 8000
```

Puis ouvrez `http://localhost:8000`. Avec VS Code, l'extension Live Server fait la même chose.

## Structure

```
index.html            Accueil, section héros, prestations, horaires
tarifs.html           Main-d'oeuvre, forfaits, interventions à l'unité
contact.html          Formulaire de démonstration et informations pratiques
css/style.css         Feuille de style unique, variables en haut de fichier
js/app.js             Menu mobile, rendu des prestations, formulaire
data/services.json    Source des prestations affichées sur l'accueil
vendor/               Utilitaires tiers, fichier généré, ne pas modifier à la main
assets/               Logo
```

## Contribuer

Lisez `CONTRIBUTING.md` avant d'ouvrir une Pull Request. Les conventions y sont courtes et elles sont appliquées en revue.

## Ce dépôt sert à un jeu

Ce dépôt est le terrain de jeu de l'exercice « La revue de code piégée ». Les règles complètes, les rôles et le barème sont dans la fiche distribuée en cours. Les consignes des tâches à réaliser sont dans les issues du dépôt.
