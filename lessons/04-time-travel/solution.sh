#!/usr/bin/env bash
set -euo pipefail
git switch --detach v1.0
cat settings.txt
git switch -c hotfix

git switch main
git restore --source v1.0 settings.txt
git commit -am "Restore settings from v1.0"
