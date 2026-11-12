#!/usr/bin/env bash
set -euo pipefail
git stash -u

git switch main
echo "1.0.0" > version.txt
git commit -am "Fix version typo"

git switch feature/search
git stash pop
git add search.txt ideas.txt
git commit -m "Add fuzzy matching and ideas"
