#!/usr/bin/env bash
set -euo pipefail
git add notes.md
git commit -m "Add supplier call to notes"

git add todo.md
git commit -m "Add todo list"

printf 'secret.env\n*.log\n' > .gitignore
git add .gitignore
git commit -m "Ignore secrets and logs"
