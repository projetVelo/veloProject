# Les six tâches officielles

Trois tâches par manche, une par développeur. Elles touchent des fichiers différents pour éviter les conflits entre les trois PR d'une même manche.

Le script `creer-les-depots.sh` crée ces six tâches en issues dans chaque dépôt de groupe. Sinon, copiez-collez les blocs ci-dessous à la main.

---

## Manche 1

### Tâche 1 : un quatrième forfait

**Objectif.** Ajouter sur la page Tarifs un quatrième forfait, « Remise à neuf », à 219 euros, avec quatre lignes de contenu au choix et la mention de durée « une semaine en atelier ».

**Fichiers concernés.** `tarifs.html` uniquement.

**Critère d'acceptation.** La page Tarifs affiche quatre cartes de forfait alignées, la mise en page ne casse pas sous 680 pixels de large.

---

### Tâche 2 : une prestation de plus sur l'accueil

**Objectif.** Ajouter la prestation « Réglage de position » à 39 euros, durée « 45 minutes », avec une description d'une phrase. Elle doit apparaître dans la liste des prestations de la page d'accueil.

**Fichiers concernés.** `data/services.json` uniquement.

**Critère d'acceptation.** L'accueil affiche sept cartes de prestations, la nouvelle carte affiche bien son prix et sa durée.

---

### Tâche 3 : les statistiques sur mobile

**Objectif.** Sous 680 pixels de large, la rangée de statistiques de l'accueil doit passer sur deux colonnes plutôt que d'en empiler quatre.

**Fichiers concernés.** `css/style.css` uniquement.

**Critère d'acceptation.** Sur un écran de 375 pixels, les quatre statistiques s'affichent sur deux lignes de deux, sans débordement horizontal.

---

## Manche 2

### Tâche 4 : une foire aux questions

**Objectif.** Ajouter sur la page Contact une section « Questions fréquentes » avec trois questions et leurs réponses, en réutilisant les classes existantes du site.

**Fichiers concernés.** `contact.html` uniquement.

**Critère d'acceptation.** La section apparaît après le formulaire, la typographie est cohérente avec le reste du site.

---

### Tâche 5 : le badge « le plus demandé »

**Objectif.** Les prestations dont le champ `populaire` vaut `true` dans `data/services.json` doivent afficher un badge « Le plus demandé » sur leur carte, à l'accueil.

**Fichiers concernés.** `js/app.js` et `css/style.css`.

**Critère d'acceptation.** Une seule carte porte le badge, le badge est lisible et n'écrase aucun texte.

---

### Tâche 6 : une page de mentions légales

**Objectif.** Créer `mentions.html` avec le même en-tête et le même pied de page que les autres pages, un titre, et trois paragraphes de mentions fictives rappelant que l'entreprise est fictive. Ajouter un lien vers cette page dans le pied de page des quatre pages.

**Fichiers concernés.** `mentions.html`, `index.html`, `tarifs.html`, `contact.html`.

**Critère d'acceptation.** Le lien fonctionne depuis les trois pages existantes, la nouvelle page s'affiche avec la même mise en page.
