#!/bin/bash
# Publishes the single hidaya4 study page to the live GitHub Pages site.
# There is ONE growing HTML file (output/kitab_al_rahn.html) — every kitab-page
# is a <section> inside it, not a separate file. Run this any time it changes:
#   bash site/publish.sh
set -e
BASE="/Users/ahmedduberia/Desktop/hidaya4"
DIR="$BASE/site"
cp "$BASE/output/kitab_al_rahn.html" "$DIR/index.html"
cd "$DIR"
git rm -q --ignore-unmatch kitab_al_rahn_page1.html kitab_al_rahn_page2.html hidaya4-theme.css hidaya4-theme-init.js hidaya4-theme.js 2>/dev/null
git add index.html
git commit -q -m "Update study site $(date '+%Y-%m-%d %H:%M')" || { echo "No changes to publish."; exit 0; }
git push -q origin main
echo "Published. Live in ~1 minute."
