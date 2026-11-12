# Helpers available to every lessons/*/verify.sh (sourced, cwd = sandbox).
FAILS=0

if [ -t 1 ]; then _OK=$'\033[32m✓\033[0m'; _NO=$'\033[31mx\033[0m'; else _OK='✓'; _NO='x'; fi

# check "description" 'shell expression' - passes when the expression succeeds.
check() {
  if ( eval "$2" ) >/dev/null 2>&1; then
    printf '  %s %s\n' "$_OK" "$1"
  else
    printf '  %s %s\n' "$_NO" "$1"
    FAILS=$((FAILS + 1))
  fi
}

# Shared predicates.
clean_tree() { [ -z "$(git status --porcelain)" ]; }
on_branch() { [ "$(git branch --show-current)" = "$1" ]; }
