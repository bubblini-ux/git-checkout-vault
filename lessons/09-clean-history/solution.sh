#!/usr/bin/env bash
set -euo pipefail
# The non-interactive route. Interactively: git rebase -i main, keep the
# first line as "pick", mark the rest "fixup", then amend the message.
git reset --soft main
git commit -m "Add project intro"
