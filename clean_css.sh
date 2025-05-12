#!/bin/bash

echo "Suppression des anciens fichiers CSS inutiles..."

TARGET_DIR="app/assets/stylesheets"

FILES=("application.css" "custom.css" "aos.css" "actiontext.css")

for FILE in "${FILES[@]}"; do
  if [ -f "$TARGET_DIR/$FILE" ]; then
    echo "Suppression de $TARGET_DIR/$FILE"
    rm "$TARGET_DIR/$FILE"
  else
    echo "$FILE déjà supprimé ou inexistant."
  fi
done

echo "Nettoyage des dossiers public/assets et tmp/cache..."
rm -rf public/assets tmp/cache

echo "Clobber des anciens assets..."
RAILS_ENV=production bundle exec rails assets:clobber

echo "Précompilation en cours..."
RAILS_ENV=production bundle exec rails assets:precompile

echo "Tout est propre. Tu peux maintenant déployer sans erreur SassC."

