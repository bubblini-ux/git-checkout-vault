#!/usr/bin/env bash
set -euo pipefail
git clone origin.git work
cd work
git config user.name "Your Name"
git config user.email "you@example.com"

git switch -c feature/greeting
echo "Hello, team!" > greeting.txt
git add greeting.txt
git commit -m "Add greeting"
git push -u origin feature/greeting

../teammate.sh

git fetch
git log --oneline main..origin/main
git switch main
git pull --ff-only
