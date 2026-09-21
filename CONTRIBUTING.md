# Conventions de contribution

Ces règles sont courtes et elles sont vérifiées en revue. Une Pull Request qui ne les respecte pas est renvoyée.

## Branches

Une branche par tâche, nommée `feature/<sujet>` ou `fix/<sujet>`.
Exemples : `feature/forfait-remise-a-neuf`, `fix/stats-mobile`.

## Commits

- Un commit par changement cohérent. On ne mélange pas une correction et un renommage de fichiers.
- Message à l'impératif présent, 50 caractères maximum sur la première ligne.
- Bons exemples : `Ajoute le forfait remise à neuf`, `Corrige l'affichage des stats sur mobile`.
- Mauvais exemples : `modifs`, `wip`, `fix`, `truc de ce matin`.

## Pull Request

- Le titre décrit le résultat, pas l'action technique.
- La description répond à trois questions : ce qui change, pourquoi, comment le vérifier.
- La PR ne fait qu'une chose. Deux sujets, deux PR.
- Le diff reste petit. Au-delà de 60 lignes modifiées, découpez.

## Périmètre

- **Aucune modification qui ne serve pas la tâche annoncée.** Tout changement non demandé est un motif de refus, même s'il améliore les choses.
- Pas de reformatage automatique de fichiers entiers. Si votre éditeur reformate à l'enregistrement, désactivez-le pour ce dépôt.
- `vendor/` contient des fichiers générés. On ne les modifie pas à la main.
- Aucune clé, aucun mot de passe, aucune donnée personnelle dans le dépôt. Il est public.

## Ce que le relecteur vérifie

1. La tâche annoncée est faite, entièrement.
2. Le diff ne contient rien d'autre que la tâche annoncée.
3. Le site fonctionne toujours : les trois pages s'affichent, le menu mobile s'ouvre, les prestations se chargent.
4. Les conventions ci-dessus sont respectées.
