# Note enseignant

Document réservé à l'enseignant. Ne pas laisser dans le dépôt distribué aux étudiants si vous voulez garder l'effet de surprise, ou au contraire le laisser si vous préférez que le jeu soit à information complète : les deux fonctionnent, le second est plus formateur.

## Mise en place, dix minutes avant la séance

1. Poussez ce dossier sur GitHub sous le nom `velo-kombi`, dans votre compte ou votre organisation.
2. Dans Settings du dépôt, cochez **Template repository**.
3. Préparez `groupes.csv` sur le modèle de `groupes.csv.exemple`, une ligne par groupe de quatre.
4. Lancez `./creer-les-depots.sh groupes.csv VOTRE-ORGA`. Le script crée un dépôt par groupe, invite les quatre membres avec le droit d'écriture, et crée les six issues.
5. **Faites accepter les invitations au début de la séance.** C'est la cause numéro un de blocage : sans acceptation, l'étudiant reçoit un refus de permission et VS Code lui propose un fork.

Sans GitHub CLI, chaque lead dev peut créer le dépôt de son groupe depuis le bouton **Use this template**, puis inviter ses trois camarades dans Settings, Collaborators.

## Réglage recommandé du dépôt

Pour forcer le passage par la Pull Request, protégez `main` dans Settings, Branches :

- Require a pull request before merging
- Require approvals : 1

Le lead dev devient ainsi le seul chemin vers `main`, ce qui est exactement le propos de l'exercice. À défaut, un développeur pressé poussera directement sur `main` et le jeu perd son sens.

## Le catalogue des ruses attendues

Les techniques ci-dessous sont celles que l'on retrouve dans de vraies attaques sur des chaînes de dépendances. Les faire pratiquer sur un site fictif est le moyen le plus rapide d'apprendre à les repérer. Le débriefing doit toujours associer une ruse à sa contre-mesure.

### Niveau 1, la ruse d'occasion

| Ruse | Contre-mesure à enseigner |
|---|---|
| Modifier une valeur voisine dans un fichier qu'on avait de toute façon à modifier, par exemple un prix dans `tarifs.html` alors que la tâche demandait un forfait | Lire chaque ligne du diff, et pour chacune se demander : cette ligne sert-elle la tâche annoncée ? |
| Glisser une ligne au milieu d'un long bloc HTML | Vérifier le nombre de lignes changées annoncé par GitHub, et le comparer à ce que la tâche justifie |

### Niveau 2, la ruse de volume

| Ruse | Contre-mesure |
|---|---|
| Réindenter tout le fichier puis y cacher un vrai changement. GitHub annonce alors deux cents lignes modifiées | Refuser par principe une PR qui reformate. Sur GitHub, menu du diff, **Hide whitespace changes** : le vrai changement ressort seul |
| Répartir sept commits dont un seul contient la ruse, en pariant sur une relecture commit par commit | Toujours relire l'onglet **Files changed**, qui agrège tout. La relecture par commit vient en complément, jamais à la place |
| Modifier `data/services.json` plutôt que du code, en pariant que les données paraissent inoffensives | Traiter un fichier de données exactement comme du code. Un prix est une donnée qui engage l'entreprise |
| Modifier `vendor/mini-utils.min.js`. GitHub replie les fichiers minifiés en les considérant comme générés. Changer `currency:"EUR"` en `"USD"` transforme l'affichage de tous les prix de l'accueil | Dérouler systématiquement les fichiers repliés. Le `CONTRIBUTING.md` interdit déjà de toucher à `vendor/`, donc la seule présence du fichier dans la liste est un motif de refus |
| Renommer un fichier et le modifier dans le même commit. GitHub affiche « renamed » et replie le contenu | Vérifier le pourcentage de similarité affiché à côté du renommage. Moins de 100 %, le contenu a changé |

### Niveau 3, la ruse de caractère

| Ruse | Contre-mesure |
|---|---|
| Remplacer une lettre par un homoglyphe, par exemple le `о` cyrillique dans « Vélo Kombi ». Le diff montre une ligne modifiée où l'on ne voit aucune différence | La règle à retenir : **une ligne marquée comme modifiée où vous ne voyez rien changer contient forcément quelque chose d'invisible.** Ne jamais approuver dans ce cas. En local, `git diff --word-diff-regex=.` isole le caractère |
| Insérer une espace insécable à la place d'une espace, ou une espace en fin de ligne | Même règle. `git diff --check` signale les espaces en fin de ligne |
| Changer une variable en haut de `css/style.css`, ce qui repeint tout le site depuis une seule ligne | Repérer que le diff touche la section Variables, et se demander ce que cette variable pilote ailleurs |

### Ce qui doit rester interdit, et pourquoi le dire aux étudiants

Le jeu porte sur la **dissimulation dans un diff**, pas sur le code hostile. L'interdiction n'est pas une formalité : c'est ce qui fait la différence entre un exercice de revue et un exercice d'attaque.

Sont exclus : toute requête réseau, toute redirection, tout accès au stockage du navigateur, tout script chargé depuis un domaine extérieur, toute clé ou donnée personnelle, tout contenu offensant ou visant une personne. Une PR contenant l'un de ces éléments est disqualifiée quel que soit son score.

## Départager les égalités

Trois critères, dans cet ordre : le score du lead dev, puis la qualité des messages de commit et des descriptions de PR, puis la précision du commentaire de review, à savoir un commentaire posé sur la bonne ligne et expliquant pourquoi la ligne est hors périmètre.

## Ce qui rate le plus souvent

- Les invitations non acceptées. Dix minutes de perdues si vous ne le traitez pas d'entrée.
- Les trois développeurs qui travaillent sur `main` au lieu d'une branche. La protection de branche règle le problème.
- Les conflits entre les trois PR d'une même manche : c'est pour cela que les tâches d'une même manche touchent des fichiers différents. Ne réattribuez pas les tâches au hasard.
- Le lead dev qui refuse tout par principe. Le malus de faux positif est là pour ça, annoncez-le avant la manche.
- La modification cachée invisible sur le site rendu : elle est hors règles, car alors personne ne peut arbitrer. Insistez sur ce point au lancement.

## Prolongements possibles

- Quatre manches sur deux séances, pour que chacun soit lead dev une fois.
- Interdire la fonction de recherche du navigateur pendant la review, pour forcer la lecture.
- Ajouter une action GitHub qui vérifie automatiquement les caractères non ASCII ajoutés, puis demander aux étudiants de ruser malgré la vérification. C'est la meilleure introduction possible à l'intégration continue.
