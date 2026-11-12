#!/usr/bin/env bash
set -euo pipefail
git reflog

# Find the lost branch tip in the reflog by its commit message.
tip="$(git reflog --format='%H %gs' | grep 'commit: Add refund flow' | head -n 1 | cut -d' ' -f1)"
git branch feature/payment "$tip"

# main was reset one move ago, so its previous position is main@{1}.
git reset --hard 'main@{1}'
