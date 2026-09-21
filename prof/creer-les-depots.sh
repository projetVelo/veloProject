#!/usr/bin/env bash
# ============================================================================
# Crée un dépôt de jeu par groupe, invite les membres, crée les six issues.
#
# Prérequis : GitHub CLI installé et authentifié (gh auth login).
#
# Usage :
#   ./creer-les-depots.sh groupes.csv MON-ORGA-OU-MON-PSEUDO
#
# Format de groupes.csv, une ligne par groupe, sans en-tête :
#   nom-du-groupe,login1,login2,login3,login4
# Exemple :
#   groupe-a,alice-dev,bob-code,chloe-py,dan-js
#
# Le script part du dossier parent, qui doit être le dépôt template déjà
# poussé sur GitHub sous le nom velo-kombi. Adaptez TEMPLATE ci-dessous.
# ============================================================================

set -euo pipefail

CSV="${1:-}"
OWNER="${2:-}"
TEMPLATE="${TEMPLATE:-$OWNER/velo-kombi}"
VISIBILITE="${VISIBILITE:---private}"

if [[ -z "$CSV" || -z "$OWNER" ]]; then
  echo "Usage : $0 groupes.csv OWNER" >&2
  echo "OWNER est votre organisation GitHub ou votre pseudo." >&2
  exit 1
fi

if ! command -v gh >/dev/null 2>&1; then
  echo "GitHub CLI (gh) est introuvable. Installez-le puis lancez gh auth login." >&2
  exit 1
fi

ICI="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TACHES="$ICI/taches-officielles.md"

if [[ ! -f "$TACHES" ]]; then
  echo "Fichier introuvable : $TACHES" >&2
  exit 1
fi

# Titres des six issues, dans l'ordre des tâches du fichier taches-officielles.md
TITRES=(
  "Tâche 1 : ajouter un quatrième forfait sur la page Tarifs"
  "Tâche 2 : ajouter la prestation Réglage de position"
  "Tâche 3 : afficher les statistiques sur deux colonnes en mobile"
  "Tâche 4 : ajouter une foire aux questions sur la page Contact"
  "Tâche 5 : afficher un badge sur la prestation la plus demandée"
  "Tâche 6 : créer la page de mentions légales"
)

# Corps des six issues. Chaque bloc reprend objectif, fichiers, critère.
CORPS=(
"## Objectif
Ajouter un quatrième forfait « Remise à neuf » à 219 euros, avec quatre lignes de contenu et la mention « une semaine en atelier ».

## Fichiers concernés
\`tarifs.html\` uniquement.

## Critère d'acceptation
Quatre cartes de forfait alignées, mise en page correcte sous 680 pixels."

"## Objectif
Ajouter la prestation « Réglage de position », 39 euros, 45 minutes, avec une description d'une phrase.

## Fichiers concernés
\`data/services.json\` uniquement.

## Critère d'acceptation
Sept cartes de prestations à l'accueil, prix et durée corrects sur la nouvelle."

"## Objectif
Sous 680 pixels de large, la rangée de statistiques de l'accueil doit passer sur deux colonnes.

## Fichiers concernés
\`css/style.css\` uniquement.

## Critère d'acceptation
Sur un écran de 375 pixels, deux lignes de deux statistiques, aucun débordement horizontal."

"## Objectif
Ajouter une section « Questions fréquentes » avec trois questions et réponses sur la page Contact, en réutilisant les classes existantes.

## Fichiers concernés
\`contact.html\` uniquement.

## Critère d'acceptation
Section placée après le formulaire, typographie cohérente avec le reste du site."

"## Objectif
Les prestations dont \`populaire\` vaut \`true\` doivent afficher un badge « Le plus demandé » sur leur carte.

## Fichiers concernés
\`js/app.js\` et \`css/style.css\`.

## Critère d'acceptation
Une seule carte porte le badge, aucun texte n'est recouvert."

"## Objectif
Créer \`mentions.html\` avec l'en-tête et le pied de page du site, un titre et trois paragraphes de mentions fictives. Ajouter le lien dans le pied de page des autres pages.

## Fichiers concernés
\`mentions.html\`, \`index.html\`, \`tarifs.html\`, \`contact.html\`.

## Critère d'acceptation
Le lien fonctionne depuis les trois pages existantes, la nouvelle page a la même mise en page."
)

while IFS=, read -r groupe m1 m2 m3 m4; do
  [[ -z "${groupe// }" ]] && continue
  [[ "$groupe" == \#* ]] && continue

  depot="$OWNER/jeu-review-$groupe"
  echo "=== $depot ==="

  if gh repo view "$depot" >/dev/null 2>&1; then
    echo "  existe déjà, création ignorée"
  else
    gh repo create "$depot" --template "$TEMPLATE" $VISIBILITE \
      --description "Jeu de revue de code, groupe $groupe"
    echo "  dépôt créé"
    sleep 2
  fi

  for membre in "$m1" "$m2" "$m3" "$m4"; do
    membre="${membre// /}"
    [[ -z "$membre" ]] && continue
    gh api -X PUT "repos/$depot/collaborators/$membre" -f permission=push >/dev/null \
      && echo "  invitation envoyée à $membre" \
      || echo "  échec de l'invitation pour $membre"
  done

  for i in "${!TITRES[@]}"; do
    gh issue create --repo "$depot" --title "${TITRES[$i]}" --body "${CORPS[$i]}" >/dev/null \
      && echo "  issue créée : ${TITRES[$i]}" \
      || echo "  échec de la création de l'issue ${TITRES[$i]}"
  done

  echo "  rappel : chaque membre doit ACCEPTER son invitation"
  echo "  https://github.com/$depot/invitations"
done < "$CSV"

echo
echo "Terminé. Vérifiez la liste avec : gh repo list $OWNER --limit 50"
