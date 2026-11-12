#!/usr/bin/env bash
set -euo pipefail
git switch feature/profile
git rebase main

git switch main
git merge --ff-only feature/profile
