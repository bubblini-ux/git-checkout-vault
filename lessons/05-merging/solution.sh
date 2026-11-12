#!/usr/bin/env bash
set -euo pipefail
git merge --no-edit feature/hours

# This merge stops with a conflict in prices.txt.
git merge feature/pricing || true

# Resolve by editing the file (here: written out in full).
printf 'coffee: 4\nbagel: 2\ntea: 3\n' > prices.txt
git add prices.txt
git commit --no-edit
