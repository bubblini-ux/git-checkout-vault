#!/usr/bin/env bash
set -euo pipefail
git restore story.txt
git restore --staged passwords.txt
git commit --amend -m "Add chapter two"
git revert --no-edit "$(git log --format=%H --grep='^Add spoilers$')"
