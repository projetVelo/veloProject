# Publication du dépôt velo-kombi sur GitHub

Le dépôt est prêt à être publié. Suivez l'une des deux approches ci-dessous.

## Option 1 : Via GitHub CLI (recommandé si vous avez `gh` installé)

```bash
cd /home/claude/velo-kombi

# Créer le dépôt public sur GitHub
gh repo create velo-kombi --public \
  --description "Template: teaching game on code review with Git workflow, commits, PRs, and sneaky code modifications" \
  --source=. --remote=origin --push

# Activer le mode Template repository (pour que les groupes puissent l'utiliser)
gh repo edit velo-kombi --template
```

Une fois done, le dépôt sera visible sur `https://github.com/VOTRE-PSEUDO/velo-kombi`

## Option 2 : Via l'interface GitHub

### Étape 1 : Créer un dépôt vide sur GitHub
1. Allez sur https://github.com/new
2. Remplissez :
   - **Repository name** : `velo-kombi`
   - **Description** : `Template: teaching game on code review with Git workflow, commits, PRs, and sneaky code modifications`
   - **Public** : ✓ coché
   - **Initialize with** : décoché (vous poussez un repo existant)
3. Cliquez **Create repository**

### Étape 2 : Ajouter le remote et pousser
GitHub vous donne les commandes. Collez-les dans votre terminal :

```bash
cd /home/claude/velo-kombi
git remote add origin https://github.com/VOTRE-PSEUDO/velo-kombi.git
git branch -M main
git push -u origin main
```

### Étape 3 : Activer le mode Template
1. Sur GitHub, allez dans **Settings** du dépôt `velo-kombi`
2. Cochez **Template repository** (rubrique "General")
3. Sauvegardez

## Après la publication

Une fois que le dépôt est public et configuré comme template :

### Pour créer les dépôts de groupe automatiquement :
```bash
cd /home/claude/velo-kombi

# Préparez votre CSV avec les groupes (exemple : prof/groupes.csv)
./prof/creer-les-depots.sh prof/groupes.csv VOTRE-ORGA
```

### Pour que les étudiants commencent :
1. Chaque groupe reçoit l'URL de son dépôt spécifique (créé par le script)
2. Ils clonent et commencent le jeu
3. Vous (lead dev de chaque groupe) relisez les trois PR

## Vérification de branche protégée (recommandé)

Pour forcer le passage par Pull Request, protégez `main` :
1. **Settings** > **Branches**
2. **Add rule**
3. Branch pattern : `main`
4. ✓ Require a pull request before merging
5. ✓ Require approvals : `1`

Cela força les développeurs à passer par votre revue (en tant que lead dev), ce qui est le cœur du jeu.

---

**Besoin d'aide ?** Consultez `prof/NOTE-ENSEIGNANT.md` pour le guide complet de mise en place et les pièges à éviter.
