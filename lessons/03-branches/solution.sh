#!/usr/bin/env bash
set -euo pipefail
git switch -c feature/login
echo "login form" > login.txt
git add login.txt
git commit -m "Add login form"

git switch main
git switch -c feature/signup
echo "signup form" > signup.txt
git add signup.txt
git commit -m "Add signup form"

git branch -m tmp experiment
git branch -d old-idea
git switch main
