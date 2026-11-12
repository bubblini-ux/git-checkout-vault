# Helpers available to every lessons/*/setup.sh (sourced, cwd = fresh sandbox).
set -euo pipefail

# new_repo [dir] - create a repo with a local identity so commits always work.
new_repo() {
  local dir="${1:-.}"
  git init -q -b main "$dir"
  git -C "$dir" config user.name "Vault Learner"
  git -C "$dir" config user.email "learner@example.com"
  git -C "$dir" config commit.gpgsign false
}

# commit "message" - stage everything and commit it.
commit() {
  git add -A
  git commit -q -m "$1"
}
