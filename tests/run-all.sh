#!/usr/bin/env bash
# Proves every lesson is sound: the check must fail on a fresh sandbox
# and pass after the reference solution has been applied.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
VAULT_SANDBOX="$(mktemp -d)"
export VAULT_SANDBOX
trap 'rm -rf "$VAULT_SANDBOX"' EXIT

fail=0
for d in "$ROOT"/lessons/*/; do
  id="$(basename "$d")"; n="${id%%-*}"
  "$ROOT/learn" start "$n" >/dev/null

  if "$ROOT/learn" check "$n" >/dev/null 2>&1; then
    echo "FAIL $id: check passes before any work is done"; fail=1; continue
  fi

  if ! ( cd "$VAULT_SANDBOX/$id" && GIT_CEILING_DIRECTORIES="$VAULT_SANDBOX" \
         bash "$d/solution.sh" ) >"$VAULT_SANDBOX/$id.log" 2>&1; then
    echo "FAIL $id: solution.sh errored"; cat "$VAULT_SANDBOX/$id.log"; fail=1; continue
  fi

  if "$ROOT/learn" check "$n" >"$VAULT_SANDBOX/$id.log" 2>&1; then
    echo "ok   $id"
  else
    echo "FAIL $id: check fails after the solution"; cat "$VAULT_SANDBOX/$id.log"; fail=1
  fi
done
exit "$fail"
