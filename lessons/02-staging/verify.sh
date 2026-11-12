# True when some commit changed exactly the one given file.
commit_touching_only() {
  local c
  for c in $(git rev-list HEAD); do
    [ "$(git show --name-only --format= "$c")" = "$1" ] && return 0
  done
  return 1
}

check "a commit changes only notes.md"          'commit_touching_only notes.md'
check "a commit changes only todo.md"           'commit_touching_only todo.md'
check ".gitignore is committed"                 'git ls-files --error-unmatch .gitignore'
check "secret.env is ignored"                   'git check-ignore -q secret.env'
check "every .log file is ignored"              'git check-ignore -q debug.log && git check-ignore -q some/other.log'
check "secret.env and debug.log are still on disk" '[ -f secret.env ] && [ -f debug.log ]'
check "secret.env never entered history"        '[ -z "$(git log --format=%H -- secret.env debug.log)" ]'
check "nothing left to commit"                  'clean_tree'
