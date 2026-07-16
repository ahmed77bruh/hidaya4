#!/bin/bash
# Publishes all hidaya4 study pages to the live GitHub Pages site.
# index.html is a hand-written landing page linking to each page — update it
# manually in site/index.html when a new output/*.html page is added.
# Run this any time output/*.html or output/*.css changes: bash site/publish.sh
set -e
BASE="/Users/ahmedduberia/Desktop/hidaya4"
DIR="$BASE/site"
cp "$BASE/output/"*.html "$DIR/"
cp "$BASE/output/"*.css "$DIR/" 2>/dev/null || true
cd "$DIR"
git add *.html *.css 2>/dev/null
git commit -q -m "Update study site $(date '+%Y-%m-%d %H:%M')" || { echo "No changes to publish."; exit 0; }
git push -q origin main
echo "Published. Live in ~1 minute."
