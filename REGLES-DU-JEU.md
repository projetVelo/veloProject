# La revue de code piégée

Jeu d'entraînement au commit, à la Pull Request et à la revue de code.
Groupes de quatre, une séance de 1 h 30, deux manches.

## Le principe

Dans chaque groupe, un **lead dev** et trois **développeurs**.

Chaque développeur reçoit une tâche officielle à réaliser sur le site `velo-kombi`. Il la livre par une Pull Request. Et il y glisse **une modification qui ne lui a pas été demandée**, en essayant qu'elle échappe au lead dev.

Le lead dev relit les trois Pull Requests. Pour chacune, il doit dire si la tâche est bien faite, et surtout désigner la modification clandestine, ligne par ligne, avant d'approuver ou de refuser.

À la fin de la manche, on révèle. Le développeur marque des points si sa ruse est passée, le lead dev en marque s'il l'a trouvée.

L'objectif n'est pas de ruser. C'est d'apprendre à relire un diff en sachant ce qu'on peut y cacher.

## Déroulé de la séance

| Créneau | Durée | Ce qui se passe |
|---|---|---|
| 0:00 | 10 min | Mise en place : accepter les invitations du dépôt, cloner, lancer le site en local, tirer les rôles et les tâches |
| 0:10 | 22 min | Manche 1, développement : les trois développeurs livrent leur PR |
| 0:32 | 15 min | Manche 1, revue : le lead dev relit les trois PR et rend ses verdicts |
| 0:47 | 6 min | Révélation, comptage, et la contre-mesure de chaque ruse |
| 0:53 | 15 min | Manche 2, développement, avec un nouveau lead dev |
| 1:08 | 13 min | Manche 2, revue |
| 1:21 | 6 min | Révélation et comptage |
| 1:27 | 3 min | Classement et règles à retenir |

Le lead dev de la manche 1 devient développeur en manche 2. Deux personnes du groupe auront donc tenu le rôle de lead dev.

## Avant de commencer

1. Le lead dev de la manche 1 vérifie que ses trois camarades sont bien collaborateurs du dépôt du groupe, **et qu'ils ont accepté l'invitation**. Sans cela, ils n'auront pas le droit de pousser leur branche.
2. Chacun clone le dépôt et lance le site : `python3 -m http.server 8000`, puis `http://localhost:8000`. Le site doit s'afficher avant de commencer, sinon vous ne pourrez pas vérifier vos modifications.
3. Chacun lit `CONTRIBUTING.md`. Les conventions y sont courtes et le lead dev s'en servira pour refuser.
4. Chaque développeur tire une tâche : les tâches sont dans les issues du dépôt.

## Le rôle du développeur

**Vous devez livrer deux choses dans une seule Pull Request :**

1. La tâche officielle, complète et fonctionnelle.
2. Exactement **une** modification clandestine.

**Votre modification clandestine doit respecter les quatre conditions suivantes.** Une seule condition manquante et la modification ne compte pas, avec une pénalité.

- **Elle est visible** en ouvrant le site dans un navigateur. Un texte, un prix, une couleur, un horaire, un lien, un élément qui disparaît. Si personne ne peut la constater à l'écran, il n'y a pas d'arbitrage possible.
- **Elle est inoffensive.** Elle change ce que le site affiche, jamais ce qu'il fait.
- **Elle est réversible** en supprimant les lignes que vous avez ajoutées ou modifiées.
- **Elle est déclarée à l'enseignant** avant la fin de la phase de développement, par message privé. C'est ce qui permet de compter les points.

**Vous devez aussi respecter les conventions** de `CONTRIBUTING.md` : une branche nommée correctement, des messages de commit à l'impératif, la description de PR remplie. Un lead dev a le droit de refuser une PR pour cette seule raison, et vous perdez alors la manche.

Petite subtilité qui fait tout l'intérêt du jeu : le formulaire de PR contient une case « ce diff ne contient que la tâche annoncée ». Vous allez la cocher alors qu'elle est fausse. C'est volontaire, et le débriefing y reviendra : **une case cochée n'est pas une preuve.**

## Le rôle du lead dev

Vous avez 15 minutes pour trois Pull Requests, soit 5 minutes chacune. C'est exactement la contrainte d'une vraie journée de travail.

Pour chaque PR, vous devez produire trois choses :

1. **Au moins un commentaire de revue** posé sur une ligne précise du diff.
2. **Un verdict** : *Approve*, ou *Request changes*.
3. **Votre accusation** : la ligne exacte que vous estimez être la modification clandestine. Une accusation sans ligne précise ne compte pas comme un repérage.

Vous avez le droit de refuser une PR. Mais refuser sans désigner de ligne ne rapporte rien, et accuser une ligne légitime coûte un point. Refuser tout par principe n'est donc pas une stratégie gagnante, pas plus qu'au travail.

## Les interdits

Ce jeu porte sur la dissimulation dans un diff, pas sur le code hostile. Les techniques que vous allez pratiquer sont celles qu'on retrouve dans de vraies attaques sur des dépendances logicielles : les connaître est ce qui permet de les repérer. Elles s'arrêtent donc net à la limite suivante.

**Est disqualifiant, quel que soit le score de la manche :**

- toute requête réseau, toute redirection, tout script chargé depuis un domaine extérieur ;
- tout accès au stockage du navigateur, cookies, `localStorage` ;
- toute clé, tout mot de passe, toute donnée personnelle réelle ;
- tout contenu offensant, discriminatoire, ou visant une personne du groupe ou de la classe ;
- la suppression de fichiers, la modification de `.github/`, de `.gitignore` ou du `README.md` pour brouiller la lecture ;
- un `push --force` après l'ouverture de la revue ;
- plus d'une modification clandestine par Pull Request.

## Le barème

### Points du développeur, pour chaque manche

| Situation | Points |
|---|---|
| Tâche officielle livrée et fonctionnelle | +2 |
| Conventions respectées : branche, messages de commit, description de PR | +1 |
| Modification clandestine non repérée et Pull Request approuvée | +4 |
| Bonus discrétion : la ruse se cache dans un fichier que la tâche justifiait de modifier | +1 |
| Modification clandestine repérée par le lead dev | 0 |
| Ruse invisible sur le site, ou ne respectant pas les quatre conditions | −3 |
| Interdit enfreint | manche à 0 |

Maximum par manche : 8 points.

### Points du lead dev, pour la manche où il relit

| Situation | Points |
|---|---|
| Ruse repérée, avec un commentaire sur la bonne ligne | +3 par Pull Request |
| Les trois ruses repérées dans la manche | +2 |
| Pull Request approuvée alors qu'elle contenait une ruse | −2 par Pull Request |
| Faux positif : une ligne légitime accusée d'être la ruse | −1 |
| Tâche officielle bâclée, laissée passer sans commentaire | −1 |

Maximum par manche : 11 points.

### Départage

À égalité, on compare dans cet ordre : la qualité des messages de commit, puis la précision des commentaires de revue, à savoir un commentaire posé sur la bonne ligne **et** expliquant pourquoi cette ligne sort du périmètre annoncé.

## Grille de score

À remplir par le lead dev de chaque manche, puis à remettre à l'enseignant.

**Groupe :** ............................................  **Manche :** ...........

| Développeur | Tâche livrée (+2) | Conventions (+1) | Ruse passée (+4) | Bonus discrétion (+1) | Pénalités | Total |
|---|---|---|---|---|---|---|
| | | | | | | |
| | | | | | | |
| | | | | | | |

| Lead dev | Ruses repérées (+3 chacune) | Les trois (+2) | Ruses ratées (−2 chacune) | Faux positifs (−1) | Total |
|---|---|---|---|---|---|
| | | | | | |

**Fichier et ligne de chaque ruse, après révélation :**

1. ........................................................................................
2. ........................................................................................
3. ........................................................................................

## La checklist du lead dev

Sept questions, dans cet ordre. Elles couvrent la quasi-totalité des ruses possibles sur ce dépôt.

1. **La liste des fichiers modifiés correspond-elle exactement au périmètre annoncé par l'issue ?** Un fichier de plus est déjà une anomalie, avant même de lire une ligne.
2. **Le nombre de lignes changées est-il proportionné à la tâche ?** Deux cents lignes pour un forfait de plus, c'est un signal.
3. **Un fichier est-il replié par GitHub ?** Minifié, généré, renommé, ou trop gros pour être affiché. Dépliez-le. C'est la meilleure cachette du dépôt.
4. **Chaque ligne du diff sert-elle la tâche annoncée ?** Pour chaque ligne, une seule question : pourquoi celle-ci ? Si vous ne savez pas répondre, commentez-la.
5. **Une ligne est-elle marquée comme modifiée alors que vous ne voyez aucune différence ?** Alors la différence est invisible : espace insécable, homoglyphe, caractère de contrôle. **N'approuvez jamais dans ce cas.**
6. **Le diff touche-t-il une variable, une constante ou un fichier de données ?** Une seule ligne en haut de `css/style.css` ou dans `data/services.json` peut changer tout le site. Demandez-vous ce que cette valeur pilote ailleurs.
7. **Le site fonctionne-t-il encore ?** Les trois pages s'affichent, le menu mobile s'ouvre, les prestations se chargent. Comparez-le à l'écran avec la version de `main`.

Deux outils qui font gagner du temps :

- Sur GitHub, onglet **Files changed**, menu à droite, **Hide whitespace changes** : le vrai changement ressort d'un diff noyé dans du reformatage.
- En local, `git diff --word-diff-regex=.` compare caractère par caractère, ce qui révèle les homoglyphes et les espaces insécables. Et `git diff --check` signale les espaces en fin de ligne.

## Ce qu'il faut retenir à la fin

Ces quatre phrases sont le vrai contenu pédagogique du jeu. Notez-les.

1. **On relit un diff, pas une intention.** La description de la PR et la case cochée disent ce que l'auteur affirme faire, jamais ce que le code fait.
2. **Un diff volumineux est un diff non relu.** Refuser une PR trop grosse ou qui reformate n'est pas de la mauvaise volonté, c'est la seule façon de la relire vraiment.
3. **Une ligne modifiée sans différence visible est un signal d'alarme**, jamais un détail.
4. **Les fichiers de données et les dépendances vendorisées sont du code.** Un prix, une devise, une constante de configuration engagent autant qu'une fonction.
